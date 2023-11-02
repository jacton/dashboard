import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NewsInfoCard extends StatelessWidget {
  const NewsInfoCard({
    Key? key,
    required this.title,
    required this.subTitle,
    required this.svgSrc,
    required this.author,
    required this.time,
  }) : super(key: key);

  final String title, svgSrc, subTitle, author, time;

  _TimeInfo() {
    return Row(children: [
      Icon(
        Icons.access_time,
        color: Colors.white70,
      ),
      Text(
        time,
        style: TextStyle(
          fontSize: 12,
          color: Colors.white70,
        ),
      ),
    ]);
  }

  _AuthorInfo() {
    return Row(
      children: [
        Icon(
          Icons.account_circle,
          color: Colors.white70,
        ),
        Text(
          author,
          style: TextStyle(
            fontSize: 12,
            color: Colors.white70,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4.0),
      height: 100,
      child: Row(
        children: [
          SizedBox(
            height: 80,
            width: 80,
            child: SvgPicture.asset(
              'assets/icons/folder.svg',
            ),
          ),
          SizedBox(
            width: 20,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              Expanded(
                child: Text(
                  subTitle,
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .copyWith(color: Colors.white70),
                ),
              ),
              Row(
                children: [
                  _TimeInfo(),
                  SizedBox(width: 100),
                  _AuthorInfo(),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
