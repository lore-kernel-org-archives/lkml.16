Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D9DF1FBCB5
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 20:09:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750104547; cv=fail; b=ujoDykEZAS/zTPGRAFn0Zyd1UwjegHP8mo2uG8yxyQUbupJZjvucFMUlxjnSQKny3ndhjG1OMSp/w7OORfRCTR8kg3UvCgd4yFhFK9pmVF+iljfaIKvTyf5bCshepenRbYes2uK4rX8i6eUWp46W3jXLc1++/H2YuBWxLPxRxoc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750104547; c=relaxed/simple;
	bh=GwLp+3iUZOECqzZVLsd+pcTzXL4l5GtGRUQTVyMlKro=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=KP4tRroswkO32IIMkxBIxzIw0YTWTQvHZUtZkwxbp7B2+5JNYnZOvIMaqA+cWrAY3mL1uBOX/fdVTSfNcF4ELVAM5dHu56rJwEf7QI6jOfRnt6jbHUZpquYUvMNXR320Ur/HKlHJ6u2Tl09SljYUKzMLEMVgokzpPPbRfQ/EbTQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=SaQZbxuo; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=tLipWt0n; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="SaQZbxuo";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="tLipWt0n"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55GHuVKL025005;
	Mon, 16 Jun 2025 20:08:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=corp-2025-04-25; bh=Rd/2FSze07ciKoFt
	HqI/JyVhgDJVXYHDukrVZShvHVI=; b=SaQZbxuoXBDtGyLgQ9yS79REaEybezEV
	zUfUjeLlCSqnK9nKIVIKHMpYCJhT2opW7JPKkTJDP99arXXsRtJonRBCVyF+/U9j
	VQ/SHCC5Q5imhvRlCloIAdZ0tH05bHEn606B/s6WOT97yW1mAN2UwNAtDoxFJN+c
	X2ib48yxd4mAMHOG9e+Xk3SKozdyblkFUzoAdfOKUQ0bswoKz14MG/eMLFZ5HvuW
	jREnD6DLCeqaswsFt4hAwy6wpHlBcn8E4DzjdavJR3gc0fS3YX1bkT9ThY4XV2KN
	5/YRyKbKi8he51LgXqjN6g/ZnM8raG+0gE2d30VcUjE4I0YzOuHO3A==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4790yd3rhs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 16 Jun 2025 20:08:55 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55GJSJ0L000831;
	Mon, 16 Jun 2025 20:08:53 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11on2041.outbound.protection.outlook.com [40.107.223.41])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 478yh8ctf7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 16 Jun 2025 20:08:53 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j4DYugLu9lvHyXbtOD9DNqKETdfCfAbgABXajdV4548cfvuubmhTsi0kZ7n9H6eSU66hBMfqHeyeYT8ijKBHUKGt3nz2djH3nDlfEVcGihvYa/B4RdFFf6Y1/xbg+nuxoR6LlWzJGg2v75A2ox404lGVcD6bEphHGHogF58C4NszuMXAbfrGJfYzWJPqxdiiJCjMzmNH62mwhqjwQyWVDf4TcXhfT9ymXw4UQHXSVPnZdAEHXw4ctW8j/ndMc9T/XjOVXOVWbBVwvBYGm5qWNKO1K17PdcmgBoas4JmmcQoDwsDtRSPwdKb4LIGabP2fFuEB+Cv0k56n5Pebhtdubg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Rd/2FSze07ciKoFtHqI/JyVhgDJVXYHDukrVZShvHVI=;
 b=QnRQOijYI4lXOEwPxBBoMqUyecKK1WzQx3U5uptKd6e5nGISivwtqYeYl0m5qlhNBynXTQG4jtv7fYOf6uXiBwDGhx2W7s66+Wy8zWfLZoCzyloAd7uscfLCYbsoOqiE6Ole5032a//2/d4o17nqZBo1u1mAoaaVg86X32ijx7nAymWLUG+Zm81fX6Wt8POf8VPlOQ1ewLNY0QRbY9b2R+3wf8ejX8bXiO/h12aTRZjFdSa/otshz7MOlD/D/guAe0FlpefYNLurp+exFTJ8J76/BbJDsvTjYow4jUH48ZnUVlIr/RxSIXJk8az0KHhPX6rucup2ojTW9dDbR9rCWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Rd/2FSze07ciKoFtHqI/JyVhgDJVXYHDukrVZShvHVI=;
 b=tLipWt0nUl23rHvC7CBOwkfN9T4fjOINv1C0ZvTPWwL9A5GtT107VyvbdIeytSbqc08WsGuc/mRhP+SEV2fbRbd1RQIyCXcdIheEJ7Sm/RXM3BnmX3sXURA1kJpDHFOLHypH5ByNvcZIdkc0I+NT6arlitpz/1KgdG0fpFkBvsc=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by PH7PR10MB6333.namprd10.prod.outlook.com (2603:10b6:510:1b0::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.30; Mon, 16 Jun
 2025 20:08:51 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%6]) with mapi id 15.20.8835.026; Mon, 16 Jun 2025
 20:08:50 +0000
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: David Hildenbrand <david@redhat.com>, Jason Gunthorpe <jgg@nvidia.com>,
        John Hubbard <jhubbard@nvidia.com>, Peter Xu <peterx@redhat.com>,
        linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: [PATCH] MAINTAINERS: add missing test files to mm gup section
Date: Mon, 16 Jun 2025 21:08:44 +0100
Message-ID: <20250616200844.560225-1-lorenzo.stoakes@oracle.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO2P123CA0080.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:138::13) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|PH7PR10MB6333:EE_
X-MS-Office365-Filtering-Correlation-Id: 8812571e-2b21-46a7-9d15-08ddad119c89
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ypnI8SmwGAwR467dEL7Zq8yRFv4Kjdy40gCjjrBB8e4c37QXAWDRL1zBsYPK?=
 =?us-ascii?Q?BajtbphwhVqDSR4kZICaDZ5ramfsjrm2GOXLl85rvcwvenCBpm3gW1aL5u1S?=
 =?us-ascii?Q?840Y9QIFqnw5xtFqbsjaIrqQBGUfwqFAK7wBZGBrKDyI66vg8I/hMDLhx/Xd?=
 =?us-ascii?Q?GFKkmh0Mk5pKGRyOO1++1jWpdKucITwjMNT9DcrKozpdl0Y5LOKthKzgoH91?=
 =?us-ascii?Q?GcDBDMVSG+2D9E4CJokbBBxagVek6waIejSWJQYYG0nRv2k9kUON5fDMSEH1?=
 =?us-ascii?Q?54B0JQI/kFrNdCMOMr/TXsShjm21c+55xhuJfozLWWnzorzKo81SSVdZUtjM?=
 =?us-ascii?Q?9ldyZjAjZTHS97VfxFTHPohShsgdKGJWM/JRpUuBlG/e9OqT6YWyp8brxylO?=
 =?us-ascii?Q?YlTlyq11ZzXoMAYZ9SWen9l63mUOMxu3HTyUS3wTxF27f/6RGAipWnJ1qfCc?=
 =?us-ascii?Q?7dwGc32go/dacoImEYOjinkpN+IuabBAvqVm2z4PAJjG2u7iq1GoyKQnbvYx?=
 =?us-ascii?Q?xtv8GrnM0MIaWCNBr9wEz8yYUy2n2b3XBqnrRQOFrcc+nqujLDv8pd+SHI8I?=
 =?us-ascii?Q?Hye80+tDGrXmmEcrFf71R8h6G8w6UNPZiYQyz/Amn2tGxtvuZnB+Kr+rq0wp?=
 =?us-ascii?Q?fchs12eCxkmzJxzlKes9VVvRmFB9eaTFmxvVw6aat8QoqMsLfK0A9BltkmwQ?=
 =?us-ascii?Q?oFg+yJxCu+ewyQcTEkI9mnOJ15IT2Kxzumdc/bG5QgZIPXSWTExhlX9vY9MF?=
 =?us-ascii?Q?IB5d2lIir7V/UkzbN1LjdwL2Kxycyqr8IDea7BOIRAYKXRiZVgdRWa2nDed4?=
 =?us-ascii?Q?CC1fslDapqnFd2JXjQsMWnRN8nV2ZwwS8yFTOR/6UwSVQaiXLnBmGJ5b0H/B?=
 =?us-ascii?Q?fBy3ULkwNWCJXGLsAJxiwPtcZWmJ/dRGc91qXPMzDVjViuhK8EQIrkdtSKEr?=
 =?us-ascii?Q?98bSKc16lVOQ6kYhh0dIFQytdy9NQaJd4QoWtvnerigiKkK7Hx3tmQyYKOJ/?=
 =?us-ascii?Q?pFFnQXcSTrh2Gm96rh/CVE+8NHHgCN+xkjsYfTDC3gQXBqAN28WArohZLf1j?=
 =?us-ascii?Q?MGdKhda/5r1d350+IEFjU5bcM2NNBrMXhRSc9K5p0jd7p2gfLdwv2QQNZZbx?=
 =?us-ascii?Q?vY89vo0GQtbyvAp1P1CJbWVP4XoEEPGwCciPRKaqi48muplXSsXortR7llPc?=
 =?us-ascii?Q?Wc92qWpmqSbZpTJew8RADTc/iBIqL0xkr1YS+md2F1FyitX28ahljlvR9kTd?=
 =?us-ascii?Q?EeQ/8wq+rccPD/C0LZAYK8S+TuAwLkvYXc68Txr1JonANRx5OcUW4q2WRCDj?=
 =?us-ascii?Q?1Y2P6UoHow5Ens+I8ZrVGrRpu87vM5XhK46iiWdhU4IjmEGxAsJsyLzZ17if?=
 =?us-ascii?Q?lDJb+eY=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?SHZdksQ6pz+UWsLW44egtJuXDzmppUTgJmh4T+IkOD7aGr6KyEs/3+VB4NAI?=
 =?us-ascii?Q?pFZjAzuvCviPZ/C+pvbihWCBx4fGtXlzmY9c9U48dgQkIyR5zcHLA6GjHW/4?=
 =?us-ascii?Q?m3YDabeGM48weZDSdMI22O9lDEHp93iDWNecYaDb7zJUB8AtdhxJpetOhxYQ?=
 =?us-ascii?Q?nszBq0X/3fx7GzwN5XWUxv4SS3W2z3Di1SXpwRSxwwQ3rE11PgHNFMBnwM1U?=
 =?us-ascii?Q?qea5hbvw8jErAnTw6isxnrRE4ZJaAPNYaSzOMf2H3HtXaGzD7fJRC4ByTGhz?=
 =?us-ascii?Q?yNCPqoyjYYT3LsvKAxpNE1UwrSd6vU3YKinZj74N1ewWc0+PLz2OLtpEodhZ?=
 =?us-ascii?Q?yf/ztLsVewdPSgIIhQJjarL2Ef5jHvNutNbhnORvTomOjdMs8i8W9a7y0zi1?=
 =?us-ascii?Q?p7iGUJQEDoA1NfPQ9TK2EO8mRFC/GiX5Ag4nVkFpUL2bCExiYYgK04cGmIBa?=
 =?us-ascii?Q?qvz2WnUQQnKJxOSFoXHjyHm7p8xzQDPXxvl+rITyCsfqru8g3AJKoOXNWXM3?=
 =?us-ascii?Q?5Xtn/YyA+gf9meaU6EkcBQj0rr5SSaV3IE/gQK/2aUTdVmLCaHl8ViCbdqFn?=
 =?us-ascii?Q?cntdCyKQQmXUP1+tBA1ndbjZBJuEAYUehw4dsHOWdkZPnE2tqop2DzRbRz8d?=
 =?us-ascii?Q?HuCPXmPj8bRXp7y3maCeRsgimS/9Jek6BFqMI203DD3keRtxjIpbErGGGndf?=
 =?us-ascii?Q?1KXlSGeaGY8dbAXpIlOUxVZMQgzeqJtLEWK1uX1vu6SAhDWMbdyyBn2MWVGi?=
 =?us-ascii?Q?xt5Vc1X52wKb45rQOAfkj+NRjqkX82WjQLR9yjw4/O8GWo09RIeR98pY+hon?=
 =?us-ascii?Q?WCBWO7UPnG0zF/f3fswKOsYXqvNdxjSe5NnSeqttAXJBP6Qav8qR5aZymUo0?=
 =?us-ascii?Q?vk/nXbUVrbbpeZKnaZzik6IjSIx8Rvey5iV/DE8iJURKF5gS874vic0mgrXo?=
 =?us-ascii?Q?BT28K/QuSKyESVab/i6mHZvdFhXQgBk4ncQemcvmJ0KvR9ffGYPJT3BX16Om?=
 =?us-ascii?Q?fM8d5Y/PJCzzCkzbvVn7CsoxgYI2jNEqi1EbNpSNIGR1h40BCvk26n1u34uF?=
 =?us-ascii?Q?m80hT7/xZ6dMI546IWdK2KqBKTHnmCV7WDPbisvmlfXwpaTDf5VJVBrqo7H7?=
 =?us-ascii?Q?38C5Nku7Hu767/poxLX7fkew3jfTxC7GRoKFNw4DlNfyC2usZtbGTvigXvk8?=
 =?us-ascii?Q?DfWBWfCu6QuvleiY2ZWE0esACrKl5CI9AYIOGF3qnErEqL4DsCQr35e6vnII?=
 =?us-ascii?Q?N0tHcrTk1XCl9KfrQ6z5eNELLLOjFn0yEIvSUfYsE+T00eDGdbiRdonx8cJp?=
 =?us-ascii?Q?LPhGhL1JqOosKMP+bwug5/mexRSsTV+J2VMXYLGV3MpeUrXCsHR5ucK//1Jo?=
 =?us-ascii?Q?yYA1JhfcXWHaxt/SqCbN5IklKaMb7kCJYWpa/aNDL4jfm68DYqjEdF0ryTxV?=
 =?us-ascii?Q?mIZXydsKef4pqwjEh+34JNhHMODod80NhJEoemCbxVsdH/ZsNBOrcwxJX2W0?=
 =?us-ascii?Q?X2gL3UVBgWaHb1ur0SmVVXMeXMhBKfDdv/ruWxun7cptqaSAZy6jqKsv77aQ?=
 =?us-ascii?Q?q4hSnwmkPjdlpYvilGsyMaZFVH38/1U7UreIGEQVN6/GIq7UK5+ozK0o0nbM?=
 =?us-ascii?Q?LA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	gNv6NIrpG+Lv4FPD2xpRrHwGOtpmXO+0Gxps1X4UuKdeFHnp/0tTej0SC7dYP0xxp5WVCjJZQRCzlZDNl98qgY9B5qYHN42YBuEldm++n3yt9YAWvaB1cX5pdlFVZmuqbRYlhTVQGciyCW35Q8fKkGKmPlKLTBxyP+XUnUtAMHWGlYi0nRAncxfX7DSuCO5lMPDQq6wkl6Vm71ZC/WF/UpOB/Ijm1/9xQ/9rycp4o1Pc8bO0XWS8fy3Z6AaibXA+UjnWJFSoDXf8t7CIp6EiPhiFKfsRD5VgjtO0BgMlp2SfqGizCL/lILnlKulvSYXPno76NSPil4Ms7fqXBhjKuY2lDpA1mWKUbCBlBKP1iRIv7lJmbsVJvnq7QKhUWAjLkA8iEw/K31I7TuvE8X/vfIXZY0jjhRoXooLadx3LxrexMl5mRFlelaXGg/OvOJRRFaPqHfLk497TFlF1hMTOlEI+V/ZGkWEAluZU8/aEAwlFOvfKDUjRwP8EwjplvvP3SlnpPrPgfMqm7xuOHNVvaEgZkWOlhwc1sY3rAKEe7LuSFsjIMlE2yJFL5yIZFtvl1cWa/Xy3ZsnMuAQz6Icb1auYoxA7sgr7VeNu1JHqxaU=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8812571e-2b21-46a7-9d15-08ddad119c89
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2025 20:08:50.9548
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mRcUWIOicoDTukZapHKinVT5qEBvNwfr8bdFehvkmYWpbZf0983biguqNNuXmXoMQCqHQJXnKK25ypCuMLoqM/yrLQEX/TgE8ugY4BIe9L0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB6333
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-16_09,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 malwarescore=0
 mlxlogscore=999 mlxscore=0 bulkscore=0 spamscore=0 adultscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2506160138
X-Proofpoint-GUID: L-CmyS59vFdXyYrGwN20DoR-AjPAmC1w
X-Proofpoint-ORIG-GUID: L-CmyS59vFdXyYrGwN20DoR-AjPAmC1w
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE2MDEzOSBTYWx0ZWRfXytYIUM2PwZvc p7X1Z3KlBbBrn4cIX+IsJ3uC1L+LtjcGN14/GrnfMn3tTOh/22ViQlARD3JTucYXT9lMnF6KKVs EaygWQJaNqiFEEgx6JM8lcCOmo6GIo6vKRWeWsBwk5Jv9znslwEmtpUuT7ssPqprOi0wBGaZTKj
 emxXD9kNmydK9UwjTeKM1btxYaF3ejuejdwJ6DASrv59iD0SkxYvPo6TsIC4M+DGlvtEzltZ+g9 x1oRNvkcfpArbq7NpDL3HzazOynC/ZA4lEvVIMe4LEeOFt/uKRhSF1/upSxVFt750qCxT8QvHBy toAWmNqdnyJr/EyslwirzmnNbhDpxkw6AhuGAPuwg2hr0yseYH7XJHRKjD9PX7beqXByalBZMxl
 Y5E8wCg0IGMWbGFxLfyxHHbaSd9KiIeP8ID4p5BnR5+lkQQ6vPYJygfJ4jVwFahE+edjNgAd
X-Authority-Analysis: v=2.4 cv=XZGJzJ55 c=1 sm=1 tr=0 ts=685079d7 b=1 cx=c_pps a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=1-S1nHsFAAAA:8 a=yPCof4ZbAAAA:8 a=VwQbUJbxAAAA:8 a=Z4Rwk6OoAAAA:8 a=YwwRrpfM_w9Tl55wO3IA:9 a=gK44uIRsrOYWoX5St5dO:22 a=HkZW87K1Qel5hWWM3VKY:22 cc=ntf awl=host:13206

We previously overlooked GUP test files that sensibly should belong to the
GUP section, include them now.

Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
---
 MAINTAINERS | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 4523a6409186..96407b87d1aa 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -15795,6 +15795,10 @@ S:	Maintained
 W:	http://www.linux-mm.org
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm
 F:	mm/gup.c
+F:	mm/gup_test.c
+F:	mm/gup_test.h
+F:	tools/testing/selftests/mm/gup_longterm.c
+F:	tools/testing/selftests/mm/gup_test.c
 
 MEMORY MANAGEMENT - KSM (Kernel Samepage Merging)
 M:	Andrew Morton <akpm@linux-foundation.org>
-- 
2.49.0

