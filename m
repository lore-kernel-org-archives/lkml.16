Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7433819ABC6
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 19:03:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745867033; cv=fail; b=n2sjERftH1SqGVe8bXhcgbOYxItbSZ5IoP1pSf21Z7QqWwYJMFRn1RHbPUIEfjUyGVuJxp9EYaDEUW//royXD0tJoU11ZIswguP9UJFMNhkqcd+hpL6lL9m1AjawXzPeTaVLeDD8TTGSlXL+o3Gmy2j5ETu0CcU53HS+qfo8SRc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745867033; c=relaxed/simple;
	bh=ZxbAkZS5a8ZLNJXhQXMNEApHRZy5aq8jj78Y9Ci+iqQ=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=WQELZrFkaedr3DHVoCr8qoRogLxXWt28LyohAy5/iM2JKgYOgzam4sKyA+aZyNr7lzzYtnZoRy4Bif/S++FeJEixoeaFrWyThlO+mNP8DomLRUOfLsjkKSa5txb1ZGkrUx9D9D3dzewKX3LLJ3Rx1RLXO5agvCB69gBTDlCVYu4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=U9y1T4jc; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=LfqstN1+; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="U9y1T4jc";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="LfqstN1+"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53SIq98a005827;
	Mon, 28 Apr 2025 19:02:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=corp-2023-11-20; bh=8EPM/esjilZIIhWw
	7nO271PHQt2vB0dE/6IbYC3wpRg=; b=U9y1T4jcX1FJVsCEbevaya7uiEJWs1vA
	A5IEPanfpqMbeMWXC2PLUVvHFpOFbrUO6dsAx4EblN18DgqWgUHDUk9y3nRlempY
	pSjlsZ0oh0D/xr3gypgWTqjM1MW6IX6bXIlscXhLxt3V93FQfAI2h6E2F+fs/dmu
	DSsOhp+CHx54GNyY2c0ASK1TWoMRcAiFQSjVONqG82H0+5jgsluqaZkpSaPbMV9X
	Z7WwK4xyyuqBk6AONIvRp0GrOcD1LBaZb/m2E+lxLt+4qMHV/afozxW07QXytdfn
	PSE2i6dS0rOr9lVWJZiQdyeKf1OHMorT/tF08/+hDYutFlKHyrp7qQ==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 46afaxr1dc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 28 Apr 2025 19:02:19 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 53SHwHZQ023804;
	Mon, 28 Apr 2025 18:52:32 GMT
Received: from bn8pr05cu002.outbound.protection.outlook.com (mail-eastus2azlp17011028.outbound.protection.outlook.com [40.93.12.28])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 468nxf2y22-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 28 Apr 2025 18:52:32 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UkvQdKzqbgHtWMKpoj6hxFWyvjqPZbPXYVhOqvHxw/WrD4jjvP87+fUH96U9P55UMakuUOKjKLqOpyJWtlipCT3rrZf3ojrcH6OhG43ylmzFsaHevV+Ls4FwA1f90+X4etabfWZ3O7CJGKYOwnOgjdNZLN1obXFJlhOqFvZdCz7MEmP4X5beK/1nMPiHT5JUALViO8u85GP0KY+Tj5seANWevSJimRUxDTSbNxmE0XdT7UZ+eM9TWu7iMdnZiPEY5MACyqkpOy2FQEei3CBLzNVhnt38/PQ/q/DGADcUeKVGBDpQ/Klt9Cg+biaaqWmpPkxOfb0zqgH3p3PBZ7UL3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8EPM/esjilZIIhWw7nO271PHQt2vB0dE/6IbYC3wpRg=;
 b=uXQIPAHTgR20S1hQwJh3iWKEeNWoCpn39xK03jIkgLa+toEmzV2qFthw0bQbO7FGt3Qjv1RluBKoY9ksPA6rAorkRXM8S92C9qc/aoA5zQAbt02I5A+yNsDCemkWM3G2h5ff0E10Xd4FQB2sFL65687wBKDR5HVIi7MyoVxrSezexQ3aktC6kHB0E8xmsSXgFTTalfkGlbQ6dEC6gmgWIHBUgN1qRpiwZ3cH6qlu2VRIsnO/OE4nzdUN33w8xAHcg0c6r6PE79MfSkAUAgm57+1SCcWPIjMmlUVHeIqOLHSP5kdpoT1o7/KWvqrAU6c7woBqqjLCsKNIodj1c9eZWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8EPM/esjilZIIhWw7nO271PHQt2vB0dE/6IbYC3wpRg=;
 b=LfqstN1+g+zf+grizfhV4KT8NAG0BnDkjjbqHwh9N/uHoSekDQ36IjSrKN+KTL6bs5ccEBR1xfnH1wT/Q844EDSZPsfR0Nn21EUjVgClJNlLNl49BnUBf3sQ209CpKZa9WxbqwcDdQaUIy4CKURN2+s70OJYIpMXwxc7WM/EnOk=
Received: from PH0PR10MB5777.namprd10.prod.outlook.com (2603:10b6:510:128::16)
 by MN2PR10MB4287.namprd10.prod.outlook.com (2603:10b6:208:1da::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.33; Mon, 28 Apr
 2025 18:52:29 +0000
Received: from PH0PR10MB5777.namprd10.prod.outlook.com
 ([fe80::75a8:21cc:f343:f68c]) by PH0PR10MB5777.namprd10.prod.outlook.com
 ([fe80::75a8:21cc:f343:f68c%4]) with mapi id 15.20.8678.025; Mon, 28 Apr 2025
 18:52:29 +0000
From: "Liam R. Howlett" <Liam.Howlett@oracle.com>
To: "Liam R . Howlett" <Liam.Howlett@oracle.com>
Cc: sidhartha.kumar@oracle.com, maple-tree@lists.infradead.org,
        linux-mm@kvack.org, linux-kernel@vger.kernel.org,
        Zhaoyang Huang <zhaoyang.huang@unisoc.com>,
        Hailong Liu <hailong.liu@oppo.com>,
        Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
        Suren Baghdasaryan <surenb@google.com>,
        "zhangpeng . 00 @ bytedance . com" <zhangpeng.00@bytedance.com>,
        Steve Kang <Steve.Kang@unisoc.com>,
        Matthew Wilcox <willy@infradead.org>
Subject: [RFC PATCH v6.6] maple_tree: Fix mas_prealloc() reset
Date: Mon, 28 Apr 2025 14:40:58 -0400
Message-ID: <20250428184058.1416274-1-Liam.Howlett@oracle.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: YQBPR01CA0161.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:7e::17) To PH0PR10MB5777.namprd10.prod.outlook.com
 (2603:10b6:510:128::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR10MB5777:EE_|MN2PR10MB4287:EE_
X-MS-Office365-Filtering-Correlation-Id: 11ea3009-a919-4d77-d3ac-08dd8685d39b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?EjBCYzFTtgd+xrWjJC8K2mhMiBpENGPxBhT77bh8n5hMRVmLhl7EQ4/nO/Qu?=
 =?us-ascii?Q?O+lUd8Zn0SD1J/ceJOXms+DFM+a2zg95diuT2t47aDKnjG0YzvZLiO7krDN/?=
 =?us-ascii?Q?7jnajuCILq3SaNXtFleJDm6M9eQbpU5Dm0eSNbWyfDoktejaD80tPn2DxEWa?=
 =?us-ascii?Q?w4lwiWHhHEiDWV4afjXYmtB8qwDYn5ABG3OATHSS5O+WzNL0UNMA3iuEbXRk?=
 =?us-ascii?Q?mGzDg5T8n+ipMrUk28HZtuMvCb1VO8+lfdg+Qr0hgvAy/C1eE4ImXXJUEmqt?=
 =?us-ascii?Q?GAdlWD6JsenulswXYEmiML0mA26f5WDHPdVd44N7W5otis3Fk22sLtrs9xPc?=
 =?us-ascii?Q?e+18kiY6BYgUm+yc5Bx6yT9WNLP9kgMGWyUS4gs9iOqLGZEwg3oa1bY6ltdG?=
 =?us-ascii?Q?P/tDGVsjM9/cFDBxCFw7n5KdJqgxWOBU7Ype6CaTbVg+V9NQSZR6I+tqupFT?=
 =?us-ascii?Q?RI4CNKLm/Iz8DL9JyWskPG743s1VXsbktqvDoNL+fyBG0g1fEW0VM7DXhfVp?=
 =?us-ascii?Q?GjeFRi6hE24C+x0z+RZ9T0+y+5CUwZXE/spBFSK8cwWjDeZ+fDJSD4u+kYey?=
 =?us-ascii?Q?ggwPkMMAQrHRgcCufQZpRHVYeWr9J26qwQDFODIsn2tygAd1JjFRv+UliyqV?=
 =?us-ascii?Q?I820qmWpXIJXvsp/VyhdVb1awNRgVdpXFHEc8NWOTBwqkKhbOZe94BFPgLkF?=
 =?us-ascii?Q?avhh+AOBIT7mDQP/hG3HnqkkUT3yvDtvpQ3ocaJYNh9MLXcThe3N4Qh73Oi+?=
 =?us-ascii?Q?84ZJbSdIk9GdLKRZeqENgEW5zeiC4Iv6VSPk9iaxMvf6uOh/NvT83OOPL7M/?=
 =?us-ascii?Q?IJ/b6gpxd3mmDe79cK5wqieKQ02LfPcrNM4n6H8lDmBFnQaE1XvNwYT9VX1A?=
 =?us-ascii?Q?Y2ue0tdvLa30tzUXiQWE7s6wUZwgK3XC8TPElPCDls3gtWJXvIPb/6lw4XTY?=
 =?us-ascii?Q?yeWE5cgDh24HQVWb9NOYLo38l0nUtRJXsZ44796wE3bNqPmrOEUxJaBcgvbp?=
 =?us-ascii?Q?2WolL/v9XsX8h4dZEpytktkNKBaxZsGMs8rXyEID8gHNO/v3e6L70QqsQrtC?=
 =?us-ascii?Q?o1sXyyAE5PNo5W1chj6HL/m3+w2adZrBoBTiMkXaPHt95SM+6Y0ZOZwDukjv?=
 =?us-ascii?Q?ySie9kHkKntGrTVbqHVfcu9/FlvQ9J+DDUX33O6DhcK2f+nXlRKK/NkrF5Au?=
 =?us-ascii?Q?IyN0q/AAgXp1xQH7h9tb70tAAS7inU/RJfrxn47sEEVWNUn9eEPafMGjgDW9?=
 =?us-ascii?Q?TLkzPiHa9XgkmZL9Qnev3CiLMqpdN3AoPzXZcPuq8pBlia0RrW3NhKCcA0Mb?=
 =?us-ascii?Q?cRY7AuYHDt0oSUtTwvzIWtGnvI1SVNHgAF1mQYsZ+MUtxFTwYbH/PmVcO4N4?=
 =?us-ascii?Q?IL6Mi8NzjkXkvlCG6Qe298kpW0xbdwFAQwNbdsY+ot5UsIzm7fmaMJHS2uMK?=
 =?us-ascii?Q?YftLjJPU6og=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR10MB5777.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?CNKTz2NEXhpZQC7sNVmLrNfhSnQ4XAH7MWy4w6nND+hpICJiC+y0p1pXtyDm?=
 =?us-ascii?Q?8dlJMnpU7r8g/y872BRlFbbHjxBdES83+YN8rSu4Vk5yqoX1NmWfNwb8MA5B?=
 =?us-ascii?Q?BVK1F/uJ3Hx7vNix6XOOALy0ROrbF16QmcEA9Klc7sw3StbcXcZ2mjn6iB/p?=
 =?us-ascii?Q?jpsm3f8Y0nPxSCh7Au1cyfSDbtoFed1fdJBW+anFjmFzB91JgP2SbuQgS06v?=
 =?us-ascii?Q?xLrQKPYAV410IJ4iuOkWbzQhI/K4E0TU82L8p+/u1tU5OBlOLQY2wMlOx6Wq?=
 =?us-ascii?Q?W2ivhX7iPO5hV2BjzyG+1LDVJUpRybQVaVQre4+IlLTMDyve+ynDjRNA0OIy?=
 =?us-ascii?Q?vYaP6qf4yEVI8ITtSgtHfSp2FTuSXoOvFFnLVQ/kJQw5zUXCgyTQ0Zl0YBsO?=
 =?us-ascii?Q?1/1RiyyOZqwnNQdOtLSHcBQOPy9ns62t3PXCmKTKJg8G99D3NWWF+BrDSDMF?=
 =?us-ascii?Q?RpcoGhmlD2BqyAAPaJIL6T0HPz69NTUcID1MLG6b6H5FveSNe3VVRvN6OUN7?=
 =?us-ascii?Q?cFjttpOduEWIt9wtT1qiM5Ie6EZNclikHZ3ViDDTLzZSV49uRV2uqe0y27SI?=
 =?us-ascii?Q?1hK7x39II45PuHFQewrJUPxG1OY9W9AQlUp/DGgsFDUmgaiDB6D8tvfTFOzQ?=
 =?us-ascii?Q?959X0XIJopzKszvbce6/HIF51gO2Ep4nn8i7TB1I9aNyiyM7W22sBJu0H/4i?=
 =?us-ascii?Q?rlsG4VGGVKqmeGGuGLzihnkyWiNLSkQ7qcOED9ztAphTUyGVGIuH1fcRN0Kn?=
 =?us-ascii?Q?JvjDvRsAp2b0F2rQ9H3UCCkHL7f01Ww5Eb5/dHVycP5+f6cMNsKMVQm+5f6n?=
 =?us-ascii?Q?8P8sq9zlw6wATCqNhevfdZ7a6xINKrFXO7DUuGbrbL/2fJ5XfE8juk8w3jXB?=
 =?us-ascii?Q?xjzU1DQdp6Su26jouQfHDHxO/dJvthoVRGiCbz8zswM7xBcHzhROhm5kaN17?=
 =?us-ascii?Q?AVGp0IjRNijNSHQMvh6Qq6qdsdpIy76n2OpFondA58cCZZUuz/bRDC13lMoK?=
 =?us-ascii?Q?NpfRCKeljV2EJ1oMrauGTEu+sNb88D4MwJdx2miuqjkGL9Rx8PtlexrmdZSm?=
 =?us-ascii?Q?T/1auMBdrIZQpY45ffRpfmgMz9GfptV4rG/9n3UwEBIzeDAdIz/N6v6zU5j7?=
 =?us-ascii?Q?yCS18lbPL36h+t8uT1YEKP9co8tM/z9CnpHbXc8p5lJAZnx31htz+QjyUGbT?=
 =?us-ascii?Q?Q1Wa5FHYZ0v1WWp8vr2oahmXOLLWab23yS3eWniztPpw3+tdISxrzcC3VxqP?=
 =?us-ascii?Q?xevMoUMbRxPhwY16UEM2FnPP+Xvinpa65Js+0MIP2dbxBTBQWz5v18VY+/KE?=
 =?us-ascii?Q?TgV/J4ifYXu+VJiwqRPyvHpKNsZuvcox9pnuVG2mAtV7z7t0lhoeyPyUhp9w?=
 =?us-ascii?Q?QsCE+YKJuCtCGRLpPj7cfrRUKqMuUAMx6agRwHJTphGebjYt3ZBllN/nuLnU?=
 =?us-ascii?Q?H679GhARN4u0TDUQeJz4OHaTDVAiBfQ/YL045V1JMLgNrvSiG8NCo2Wz0/JC?=
 =?us-ascii?Q?5A2a7WhwxP6v9yhYs/xIKyyHa7PFo4NcwT/k3yiGR/i4bXRCM4rJkoa0bgnC?=
 =?us-ascii?Q?2jQrLktZYoj1vOn1jQexBb8RdRgrCDNTfW/76v24?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	7yMbZLCG+s8ZSTbyNtsM46E/42rICIVj8du7Scqrww0tgCkZHLnRfZH7l0lw9v/SwKdwO3KnUCA/Bkk4Sm3Zl6hKMe7XYXdKvwgB8m0XFtQzbmZ2HJhF8rHXf8yImD2ohOngIVBy8/JSyUHXJE6m2p2iU/Yl0S91PLAxvit11krLklDfAWvTCGxXux8adktxS58tsYy55l2jT/UGHU5Rjbr5enQ4+N9GhjjOzIc5/1nM3j9TUBDc3QivivBeK79bC3OpjrIiKEZtQ0O4d1WyZ2DQ4NoqqjX8xJGq2aOM4LKcJq3SRPuGmaB5vq8KPX+5X9vxpoKQOuxmOw7bBaWeLBLIP1I0OeKn9x1jVHecyEnhgUArGjXDAHOeFEqI5A3BsnH+lcnaEAfKFyphb1rsXHP1rzCTuJhALwSLekoQ6Wcu/zpzqhMkff+XOI8sVFJTUuIx14TQxb0BRHNuR+IQnvVDnVdHSl3jf8H9Dip0MrHjf4p9YJt5gkn9ZCR9NCarhIYIQdqIOqiI+IoekIQOoluL2qX29tNEUjkXpz7s3+TZbahp9KnrBSvQuncKQMPh9237gzIEFmbINYR/V+4VJl+Ea28HXQzukGv8WT6lieQ=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 11ea3009-a919-4d77-d3ac-08dd8685d39b
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB5777.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2025 18:52:29.6945
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B0R/v/xI2/c4fTsVhL9s4cHlBVNGeilrm5tBbFjMA60PCvp0HFfRZIkhILJz/zlDjZxvWQBW0NAOOErfh4/riw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR10MB4287
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-28_07,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 phishscore=0
 suspectscore=0 spamscore=0 adultscore=0 mlxscore=0 malwarescore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2504070000 definitions=main-2504280151
X-Proofpoint-ORIG-GUID: YCQngePGUjqktc40zkBaFsbmeWdgmUxK
X-Proofpoint-GUID: YCQngePGUjqktc40zkBaFsbmeWdgmUxK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI4MDE1MyBTYWx0ZWRfX96fKVqLMudfk IDQ8LX6YxUOoPI/1xqwi7mnCXUzBIV9OmS3tEZsyCdIBpqKOeMo75ig/YTy7O2ekwRBgfk51LF2 BHW3U3/NNkgJcTB+HFdcsvRamT55CbtW55Ky0hoX8hxRQDmdKTDPjMS9QhNOhhBGaU31SBIXsxL
 PLL1D9z6x+8fdKHTfeRAYAy43bVLBWQWQb6t9JzjQJs/OsmjN2bjICTLwoc3g0GvBjZAeaMGDNZ Gd2HF81oxYjzsSjGhsELab2UrpNJcfvoua5Y1vSb42soU0ocCzP2l+2SwAEJlYaiOljzBZcVAB+ qxx0f8bTfOMd/aCqo/TLh3r/nrM/Yiyl7Deo894IkjTXEPikjT9hMYYj4aCCtantE6oFOtsU1LM I6TxmpbC

A previously used maple state may not be in the correct state for the
preallocation to correctly calculate the number of nodes necessary for the
configured store operation.

The user visible effect of which is warning that there are no nodes
allocated followed by a crash when there is a null pointer dereference
shortly after.

The NULL pointer dereference has been reported to happen when a vma
iterator is used to preallocate after walking to a leaf node but then
requesting to preallocate for a store across node boundaries (in v6.6.
of the kernel).  The altered range means that there may not been enough
nodes as the maple state has been incorrectly configured.  A critical
step is that the vma iterator then detects the misconfigured maple state
and resets, thus ensuring the tree is not corrupted - but ultimately
causes a failure when there are no nodes left.

Detect a misconfigured maple state in the mas_preallocate() code by
examining the current location and planned write to ensure a reset is
done if required.  The performance impacts are minimal and within the
noise in initial testing.

Reported-by: Zhaoyang Huang <zhaoyang.huang@unisoc.com>
Reported-by: Hailong Liu <hailong.liu@oppo.com>
Fixes: fec29364348fe ("maple_tree: reduce resets during store setup")
Link: https://lore.kernel.org/all/1652f7eb-a51b-4fee-8058-c73af63bacd1@oppo.com/
Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Suren Baghdasaryan <surenb@google.com>
Cc: Hailong Liu <hailong.liu@oppo.com>
Cc: zhangpeng.00@bytedance.com <zhangpeng.00@bytedance.com>
Cc: Steve Kang <Steve.Kang@unisoc.com>
Cc: Matthew Wilcox <willy@infradead.org>
Signed-off-by: Liam R. Howlett <Liam.Howlett@oracle.com>
---
 lib/maple_tree.c | 35 +++++++++++++++++++++++++++++++----
 1 file changed, 31 insertions(+), 4 deletions(-)

diff --git a/lib/maple_tree.c b/lib/maple_tree.c
index 4eda949063602..17af9073494f5 100644
--- a/lib/maple_tree.c
+++ b/lib/maple_tree.c
@@ -5350,6 +5350,8 @@ static inline void mte_destroy_walk(struct maple_enode *enode,
 
 static void mas_wr_store_setup(struct ma_wr_state *wr_mas)
 {
+	unsigned char node_size;
+
 	if (!mas_is_active(wr_mas->mas)) {
 		if (mas_is_start(wr_mas->mas))
 			return;
@@ -5372,17 +5374,42 @@ static void mas_wr_store_setup(struct ma_wr_state *wr_mas)
 	 * writes within this node.  This is to stop partial walks in
 	 * mas_prealloc() from being reset.
 	 */
+
+	/* Leaf root node is safe */
+	if (mte_is_root(wr_mas->mas->node))
+		return;
+
+	/* Cannot span beyond this node */
 	if (wr_mas->mas->last > wr_mas->mas->max)
 		goto reset;
 
-	if (wr_mas->entry)
+	/* Cannot span before this node */
+	if (wr_mas->mas->index < wr_mas->mas->min)
+		goto reset;
+
+	wr_mas->type = mte_node_type(wr_mas->mas->node);
+	/* unfinished walk is okay */
+	if (!ma_is_leaf(wr_mas->type))
 		return;
 
-	if (mte_is_leaf(wr_mas->mas->node) &&
-	    wr_mas->mas->last == wr_mas->mas->max)
+	/* Leaf node that ends in 0 means a spanning store */
+	if (!wr_mas->entry &&
+	    (wr_mas->mas->last == wr_mas->mas->max))
 		goto reset;
 
-	return;
+	mas_wr_node_walk(wr_mas);
+	if (wr_mas->r_min == wr_mas->mas->index &&
+	    wr_mas->r_max == wr_mas->mas->last)
+		return; /* exact fit, no allocations */
+
+	wr_mas->slots = ma_slots(wr_mas->node, wr_mas->type);
+	mas_wr_end_piv(wr_mas);
+	node_size = mas_wr_new_end(wr_mas);
+	if (node_size >= mt_slots[wr_mas->type])
+		goto reset; /* Not going to fit */
+
+	if (node_size - 1 > mt_min_slots[wr_mas->type])
+		return; /* sufficient and will fit */
 
 reset:
 	mas_reset(wr_mas->mas);
-- 
2.47.2

