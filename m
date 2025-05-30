Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 910B1230D1E;
	Fri, 30 May 2025 22:02:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748642555; cv=fail; b=hLf3+TdAHErRHQBgyeIvwhxehjjCjCxZsC9dVwSvtcDRY/6ZL/U61494/7WeoN/Yx7eRt+xWh3tj8qIwFGXhfRY83ZT7VHMXPbOF5S6bf/8C29OpfYF9WMiJytgGDGItqyec4HOvpYtKuG6pfB0k/bG+ku3onwlLBWxkrSibBt4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748642555; c=relaxed/simple;
	bh=gaSLNiCBdb4xP7KblAarPHls6AWDhckjQQgTbjfhU5s=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 Content-Type:MIME-Version; b=YxcM7HPteIPtOEetvScRAB+i4mgdoFDZwMFD5YxAKAXtZTjWNJC0TGoKm1oRyp7KG6dpd8VrfnAHddlj7IC3iNPar6vlJ7LCGAtlUhKYa4nbYp7Ncmsb8k9jUL3D0v6Hzyuywphu85iZZqMbKVFdWtoDLbeN/X0L8k2PfUYdj/A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=KO2L/Gwg; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=Zv/VS0ok; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="KO2L/Gwg";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="Zv/VS0ok"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54UJN6JS016942;
	Fri, 30 May 2025 22:02:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=EBkiSIo/8uGefAhTGy
	O3S8V0x/5fRlvdrewl4VHJTM4=; b=KO2L/Gwg6DY0cXRDNLGVgK2ePyac+IduK8
	Jm9b9+ERcwLnfOgnlrGNUPctdN6cyinb1lzGe8zYCaRnSjLmD1+UBlbkSEBotC3r
	kCK1N4Wo8ju00uUwCP0ecnz0xTMnrnH1IqdCv8qMNtyqflXl3Umv1aQOoHgFJy/A
	Dmsmz2xnUT5DL2OCDsXTbM68ZGSAHsYwLAt/6tdIZx7AvlFjMQpngVmbdYfAdg4m
	L5Yuanw9qH4VOzQS83iohYSW9Ye5npUw/jRBnZ7DXbKubsLHsjZY9vH6/R4GyM/c
	mWTpOerM/fCUqSbgqnpPnP1ynnZRE5TXMMfXX5RZPXabK0R9bNYw==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 46v3pdawb8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 30 May 2025 22:02:02 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 54UKJjDK020427;
	Fri, 30 May 2025 22:02:02 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10on2060.outbound.protection.outlook.com [40.107.94.60])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 46u4jdjrk9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 30 May 2025 22:02:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KdpTYy1Xvzo11pg3lEor9/7o3Gq+mS6W5S48vQiR19ZIQHEASuvsoSNmQQn3yUUkDNRjOGm7+CZnsiuZcQRis3E/COpCNf9eesq7bcNOY3K1NTixou62FaSJ9uATj7WTh/+n3ZAqmyokeXAtt9wRD472CSlF6hrz0v6th/wQDQPO2MGDQGxVe+OMu/wnIbyUn95+IH3oubQybazO67iR2kEcWNB55hTTBugZqAZb4LEsttI/fIvAL3sRmN/EWgeTI2VtzfW54FFShCwnv5X1Mpl/MOw6RnkNF8z//kRzt55MggNcas/Dh9FGU99NPf+2Lq4MqsDWksTwW2oo80NHLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EBkiSIo/8uGefAhTGyO3S8V0x/5fRlvdrewl4VHJTM4=;
 b=tk1I9CBwDk/esoF5iKr798UcR6BDMkKv3dwmBCB4++aBXSCofjZ1ZmsPH3LYjtazOttX2lc+CYYwcwhDndYClqXPiRhfQg6WV3eXsxhQUjWitC3kWJj2TFO+AZq9yJk3Pt4MgKfj6zP+4eZrb4l0/LoBAU2qA+95/TBldC+0ejNgD3H9rdLIlBhIS8QBB03P1NEo2PrQDSdZESiBG9LkLt1dO4wYOO3yrpOdu+klAm+Q9ZXsnB4rI3GUGadB3XicEpGfdiL56EK0AOXQdJEFPQ5zeF/1h3XuJtjtetA9cR21LSiessJtvVgoKF5vno+MXbJkulPuiHLk8OxVluslmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EBkiSIo/8uGefAhTGyO3S8V0x/5fRlvdrewl4VHJTM4=;
 b=Zv/VS0okKbfjssEvt5Xl1FJoAggOBRk60E5auuT9Wi7aguGH4L6LuCE3f0O9C8yhOMgXdZCoy5IsSsS/+/UqkZ/WAMQK0jZ501k/xuP2++mVpDI2AN3/97nIbmbWqxU30DdAU08ZUElc7yGMEwzDtNw9J+oo3cBjWbqi54LYpS0=
Received: from PH8PR10MB6597.namprd10.prod.outlook.com (2603:10b6:510:226::20)
 by IA3PR10MB8420.namprd10.prod.outlook.com (2603:10b6:208:579::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.40; Fri, 30 May
 2025 22:01:58 +0000
Received: from PH8PR10MB6597.namprd10.prod.outlook.com
 ([fe80::6874:4af6:bf0a:6ca]) by PH8PR10MB6597.namprd10.prod.outlook.com
 ([fe80::6874:4af6:bf0a:6ca%4]) with mapi id 15.20.8746.035; Fri, 30 May 2025
 22:01:58 +0000
From: Stephen Brennan <stephen.s.brennan@oracle.com>
To: Ye Liu <ye.liu@linux.dev>, akpm@linux-foundation.org
Cc: linux-debuggers@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org, linux-toolchains@vger.kernel.org,
        osandov@osandov.com, paulmck@kernel.org, sweettea-kernel@dorminy.me,
        liuye@kylinos.cn, ye.liu@linux.dev, fweimer@redhat.com, sj@kernel.org
Subject: Re: [PATCH v5] tools/mm: Add script to display page state for a
 given PID and VADDR
In-Reply-To: <20250530055855.687067-1-ye.liu@linux.dev>
References: <20250530055855.687067-1-ye.liu@linux.dev>
Date: Fri, 30 May 2025 15:01:55 -0700
Message-ID: <878qmdahbg.fsf@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: MN2PR01CA0048.prod.exchangelabs.com (2603:10b6:208:23f::17)
 To PH8PR10MB6597.namprd10.prod.outlook.com (2603:10b6:510:226::20)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR10MB6597:EE_|IA3PR10MB8420:EE_
X-MS-Office365-Filtering-Correlation-Id: 5d764f9f-d895-4d27-1c7c-08dd9fc598fe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?xF3lbCUE5X8IGS2GRb3u/D40IAPXRRQo4Er/IQlxm7s6nPw2a+yBWmifGjkV?=
 =?us-ascii?Q?2QlzG+okt5XzctBdItlVrg6zQ5XSSvmIv3Dq/B7TvZQr8Rz0c3lBNGar507C?=
 =?us-ascii?Q?AU7jpF6+v5WWFw+ffy4eVMlgxteXr9U+ds4dgGCWLDnG/PI1SsNIlHM3so56?=
 =?us-ascii?Q?anc8y12ILPHe+ni7qE43/BrsABpHOKTTUQyUqULz/YES5U62bgnyfmqY0uPN?=
 =?us-ascii?Q?9jeh0RT4QXqAUPq8PG/D+KMjTLH6CRgQcIJ5RQEB3/XlIrvHGwiGoRQclZHo?=
 =?us-ascii?Q?GztOc3j+kLhHANUEvVLUCEahWaJuKJVxkXdEYsWNbpLywB3XAyo+KX0yJ4oS?=
 =?us-ascii?Q?Es3vMcdBbXOC//3OxjnMjmtKi5SMWlIEz/g85i3D2bYHouVJxU5Iivu3PXdv?=
 =?us-ascii?Q?WtE/IC6HIemEg0LHLWxYfGZnLboDBJhm1OTNhEAF7K2+ehVxyWb4dMiBSZff?=
 =?us-ascii?Q?07oulbQ9n9iKrbwpztf2gl+lEogPXgZjrP47X4cy/6+F9VxntahlSyfsEf37?=
 =?us-ascii?Q?ZTqsZG3sBXiJcyszhECu+00Nk3/RaMY1itEO84SpPBnXURMuL4NQUeKlub6M?=
 =?us-ascii?Q?VC0Swimp7ZPhGmuwaBO6puDgXaFwMWwWMOzGH3cZE4DN0JXVliqbEmQDnfqv?=
 =?us-ascii?Q?xlfZLo1TPEpJU+AONrV5pPotrnJnL6WQ9kfoDQuNT05B9jiYIA/5X3n4fccU?=
 =?us-ascii?Q?rqYjaez5smARLEeFl0tJtDDRKQom9B+cIVW1LCRD5R8vAzylse2ZNBVrp7G9?=
 =?us-ascii?Q?VD1Q9RkmMkZmh89l3OgGuPk1TzVJ0/huV+8EpZKu1Ghzysw694gpctc++kz8?=
 =?us-ascii?Q?ICWNBdlKfiUQprnxcPozRwqGWfgzVuy2RAkLXdNkP4UlV/7IfM3Mpbz4JjaC?=
 =?us-ascii?Q?czVB6RuWX8y9P9YMExgxLJALQMl/D92f3oyzWPzlGsQZDQIqU8UiQWWtvztz?=
 =?us-ascii?Q?OWFWefm/TWwglF3HbMBJlR08eKuAffRlmlTK/iv2aDEskTJmV0LDINZ9Uie+?=
 =?us-ascii?Q?JqvikuZJc7/rI+1Jlltet80LAdtTB9c64+bP7+KAS8VS6Gu1eh0/+05ZzC4m?=
 =?us-ascii?Q?SssJZyMprOBbb9i7WrvK4ycgZ9Cx04WHEyKzb5kGpGmuH/M8EJToMsowp1Bv?=
 =?us-ascii?Q?gYzWJlQNHXZT0T2SCvnH/X1qvrvLutuX97IpLf7rgFoxNKuXxxJKvyezxdVI?=
 =?us-ascii?Q?ZI6hW1v+SW8iM0DTP8Lbez4XhKQjaARvCVvC765GuVeQiqgBijscKdzYcb27?=
 =?us-ascii?Q?XOQMOeI4h3v2ieyt538pGFsP/KsS3MlyTXObyApjsnOX9cdmOt3CnVOFX+Ms?=
 =?us-ascii?Q?ApwLMw/zdxCkPjrKed85PQG2wUkPfo4Mu+F26Lej7dWP6P2i95mYqpIuKIav?=
 =?us-ascii?Q?+Kpsg+Y7OpCZBjxj34i0XA7i/aKSZdCphDKusu82WLxR/WqwJH0ZnWMa7tTk?=
 =?us-ascii?Q?ivUXgf59UAuQfAw89pbfjjQBQA6qmRtI?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR10MB6597.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?9yAxEk0BcEAI3/1TX9FjmF4p+2gHV8mCb19yWpqYCACJkrvGye9O/JfZPKQL?=
 =?us-ascii?Q?wJYBDEQUU3AJIVnUAmaIdzf0SBnF94KL/lui/s860X/Nux5t5+Ula9qrck1v?=
 =?us-ascii?Q?sADOu7asvZulmFkYRIrg5JAiahQDnQ/KWvVzwmrknTvPJ9VgtVJwONn6Q9aO?=
 =?us-ascii?Q?1dSO+krG8sFkxnLp8CoWu54i+4g0aPBvQBF7vqvNjQgoRedeeoEWmHEC2q4G?=
 =?us-ascii?Q?GsD9hP6xGtqpCB6HYBszJLTiqPootanwEVtsrjFown+wX/PHRkGN5xk/fijs?=
 =?us-ascii?Q?sllQKxtoHnWP7SvKWx/HpO++YC3E5tvzLclG8qOfW7zV80BoDpRpGCH5+B0R?=
 =?us-ascii?Q?HVxys0NF4PGNh/zTBSoAlUXyvBczazyYTZPBbYhxgyIvO9WQwtvWJJiHnwQL?=
 =?us-ascii?Q?wfPkgyvURANA2UNK34d6jMbcoM+jiJFEw786HduxFyB7VvGgKFXOcA0U3jHy?=
 =?us-ascii?Q?z6sXSjZc5GYfGX6x1G/1ljK0hcWjiuAsYmetxaEfNQQcGz6JtwDt+ZUFQXe1?=
 =?us-ascii?Q?gj4k/3gbPpduZ44nEbwGUEhAmwNjZAcsCaaEguG+iQTj8rlOwkBpHt1mVRgy?=
 =?us-ascii?Q?iq/wguT26enuGu9L+sVYDUhu3TTLGWyAt4MYGuDISmggWP5G+vi7qByaoemD?=
 =?us-ascii?Q?k2xQJ2SYiz07ybYqluDDd2u9guhI7Djy+LEeRk+7VBsbyK99vsUjdR12i0wL?=
 =?us-ascii?Q?kEkTbEBGGhfQRlXVmNWqG6/apjbGm4vx0QoVnFZ5xN5UNfN00pSMyu8ZFw7O?=
 =?us-ascii?Q?t97ZpB2QGvDMu3YJgX45ZNnGWuZxQQ1aAqyyu2GcsMFPVDm0DvWQFTFDH+Yq?=
 =?us-ascii?Q?LbKJ7QcueD7enkNpJigoXjlZTDRI3G4bWu+RT5a/buIbjVf2DZGFsDJjiYPw?=
 =?us-ascii?Q?oH8loCxILbgBGMlIBDbw64r7yOtY3f/OTyogNhB8xD4A2ckIPDGQREiD5o+f?=
 =?us-ascii?Q?lktYzlYD7/n70tqJwMZnETmAyjHUKly4kAwP9laeADN1U/LphyVZzbXMxNbF?=
 =?us-ascii?Q?IDn7o2kshB/K/ESUftXmdJzN2olvp/kwadY2osAEvlUcv5ecaSUMrPv+LDny?=
 =?us-ascii?Q?wQiN+CgUxSOqmoWytX70YUwdHcxogqLG8ip1OWKU0k/GkykeY37hXcA35rM1?=
 =?us-ascii?Q?19KQvwQyiGn8ZsaBnxcSYiyLE1c4qneWVlck+pE0x840Ae3XpOt1jcdKb4XX?=
 =?us-ascii?Q?H9dLnGJRF/isq9wWrQT8CMsNYmkowm4OGgdew5HsnWroQzu/CV6xK4Gr/V2r?=
 =?us-ascii?Q?3BAwwi0b4ucvY+Si/Q5N9Orb0kwW3y2n9MSNKEAkF8qLGw1iBhi+qkFaBq51?=
 =?us-ascii?Q?ckcaFYaVw6oncMB6PwNgivHgUIcBHKPAvUSu5P/4B2Tuk6HaICncdivfpJ+r?=
 =?us-ascii?Q?MU/FdzkeT4/8BmSM2JOwzKRTAMLmsWXdXeeTgnsXLbiaG+A63oxfGXosBDcD?=
 =?us-ascii?Q?Jvwu/TI047uuTw+xY6HLgFp/XrN2UMfn4H4LXRmI06XZywlZH7twvIsWYe86?=
 =?us-ascii?Q?KeuMdWFFA1qnjeEA9ty/mr+osROU5B/iQaabfV33WhLsO4gf0gRo5XM5NPyB?=
 =?us-ascii?Q?6DroMwzWuj7zfYJlnbSfNesPhZmDZB7aB+9Z28IHx39ZfOd8FnZBhzELzRQH?=
 =?us-ascii?Q?Iw=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	bdjJv5s8OcLH6xkLutIpGQ5GUNrQHh/NMqqC46fnASLsqe7xQCZwgLf5SmQdzNzZk7aHsmHx7GOBjFY+MakBz5a95pwlsk1BxE43JlrEM3oKLNw/6s9paAa3GFH+slLfiIhRaBz3HgXKwQOd8j8k/05vkjYG8UEwylTWl8j7nlG3M7IxRZZhoQIvnquzMEbRjSOy8WWmm3LaBhxK8gsKgU968mTtMSL1RdHneGcsdO1TuH1ySI3nwlyK3dxlMkHGRNsiBJWN3mPSCvMEK+qsHNF0kAqHtf+ORIW4hyAHYPPo2PUjDPcEixN3M8eG8nOqix9ve0wkSm49yIEcjDUiYqraHdklsjEaRd8L9CoEDDRPlpZgo0sUA1uQs3vlt98UsWDsC4ONEAOudhc2hU/HetJP7PP7gSqoFg1BYULYuJTCW7Zgl2Sek3IIKkt4BuQe/Wo7YXORVIp9S3QN/UpdXxxLIxFlR7iDWYcf885sLTWnKp4A1atfPGkVpY3h51yrWPapmS/Ix8WSd7DO5L+ZCHkEcvFHkBmrz7wPLFa/W4dQ3yPdxUMIe/EngiYf6dNyFK0sZIZgIQTZ9f+RmZMVXr4m9PrAAYTPzQRQVGABNk0=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d764f9f-d895-4d27-1c7c-08dd9fc598fe
X-MS-Exchange-CrossTenant-AuthSource: PH8PR10MB6597.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2025 22:01:58.2513
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ta0mz8eKgWY0+a0FOWwDi88NK0RedIDzRzhjCIbiC6Ict9KHS7/lCPk9BnQPNVv2ErzmQhrzWRHElwI9SfP7KLJ1cGoAzvQX4fbqPOVdADI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR10MB8420
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-30_10,2025-05-30_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 phishscore=0 suspectscore=0
 adultscore=0 malwarescore=0 bulkscore=0 mlxscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2505300196
X-Proofpoint-ORIG-GUID: -ydF5x3LdvDW-I7XX8cosHI7SsfHNYWS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTMwMDE5NiBTYWx0ZWRfXwsEadLbkgnuQ mI1V4N7oiPu+xw3Qxfq9Y0UX++NP5mgO/HG4LWxJlhrGOzlzQW2YqbbOJj/0/iNixt3JHitNkcd EW0pJROaKjR6eAECLYHaCTaGt89uhEL1757tzLKDvz/67XMHc6IUBrmZ+lbdq8ujTBzbin1omrR
 3Ioayy0OVon3e+8XRqg8W2H/FPYrZGGdV9oyKxTFZMPAaWUBtOM5ekXIQOzlzugiZJ+wEBijANU UAz1EKuI27kYO+D/ZF0mbw7uvl/09WDSTghZUe5WKPfVvlx4mX56rsdFCEyulamXO0/vOBfEjo9 MVcDGRzCq3p6d5TkqPchcnZghW2M6mlNIAHRo0YeNyq76dxgQFgCJE1cXaabOGvuIkrph54vKRm
 Zx92QxMSGBG3r3SdP8Q+I7+bogxpQJaPgU9dc59EVSHqihBpFPai0wGzHWyLkA7VTvX6ZrXW
X-Authority-Analysis: v=2.4 cv=UZNRSLSN c=1 sm=1 tr=0 ts=683a2adb cx=c_pps a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=dt9VzEwgFbYA:10 a=GoEa3M9JfhUA:10 a=VwQbUJbxAAAA:8 a=NEAV23lmAAAA:8 a=yPCof4ZbAAAA:8 a=pGLkceISAAAA:8 a=4hTr1PfHmZpeetH0JKQA:9
X-Proofpoint-GUID: -ydF5x3LdvDW-I7XX8cosHI7SsfHNYWS

Ye Liu <ye.liu@linux.dev> writes:
> Introduces a new drgn script, `show_page_info.py`, which allows users
> to analyze the state of a page given a process ID (PID) and a virtual
> address (VADDR). This can help kernel developers or debuggers easily
> inspect page-related information in a live kernel or vmcore.
>
> The script extracts information such as the page flags, mapping, and
> other metadata relevant to diagnosing memory issues.
>
> Output example:
> sudo ./show_page_info.py 1 0x7fc988181000
> PID: 1 Comm: systemd mm: 0xffff8d22c4089700
> RAW: 0017ffffc000416c fffff939062ff708 fffff939062ffe08 ffff8d23062a12a8
> RAW: 0000000000000000 ffff8d2323438f60 0000002500000007 ffff8d23203ff500
> Page Address:    0xfffff93905664e00
> Page Flags:      PG_referenced|PG_uptodate|PG_lru|PG_head|PG_active|
>                  PG_private|PG_reported|PG_has_hwpoisoned
> Page Size:       4096
> Page PFN:        0x159938
> Page Physical:   0x159938000
> Page Virtual:    0xffff8d2319938000
> Page Refcount:   37
> Page Mapcount:   7
> Page Index:      0x0
> Page Memcg Data: 0xffff8d23203ff500
> Memcg Name:      init.scope
> Memcg Path:      /sys/fs/cgroup/memory/init.scope
> Page Mapping:    0xffff8d23062a12a8
> Page Anon/File:  File
> Page VMA:        0xffff8d22e06e0e40
> VMA Start:       0x7fc988181000
> VMA End:         0x7fc988185000
> This page is part of a compound page.
> This page is the head page of a compound page.
> Head Page:       0xfffff93905664e00
> Compound Order:  2
> Number of Pages: 4
>
> Signed-off-by: Ye Liu <liuye@kylinos.cn>

Reviewed-by: Stephen Brennan <stephen.s.brennan@oracle.com>

>
> Changes in v5:
> - Use platform-aware word-size reads instead of raw byte access.
> - Replace Object() with drgn.cast() for type safety.
> - Better handle memcg flags and error cases.
> - Exit on fatal errors with sys.exit().
> - Remove 'User Virtual Address'.
> - Link to v4:https://lore.kernel.org/all/20250528091543.355386-1-ye.liu@linux.dev/
>
> Changes in v4:
> - Add error and exception handling.
> - Adjust the way to obtain PAGE_SIZE.
> - Fix the acquisition of memcg.
> - Link to v3:https://lore.kernel.org/all/20250423014850.344501-1-ye.liu@linux.dev/
>
> Changes in v3:
> - Adjust display style.
> - Link to v2:https://lore.kernel.org/all/20250421080748.114750-1-ye.liu@linux.dev/
>
> Changes in v2:
> - Move the show_page_info.py file to tools/mm.
> - Link to v1: https://lore.kernel.org/all/20250415075024.248232-1-ye.liu@linux.dev/
> ---
>  MAINTAINERS                |   5 ++
>  tools/mm/show_page_info.py | 169 +++++++++++++++++++++++++++++++++++++
>  2 files changed, 174 insertions(+)
>  create mode 100644 tools/mm/show_page_info.py
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 0cb9e55021cb..3cbd46bf1eab 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -18726,6 +18726,11 @@ F:	Documentation/mm/page_table_check.rst
>  F:	include/linux/page_table_check.h
>  F:	mm/page_table_check.c
>  
> +PAGE STATE DEBUG SCRIPT
> +M:	Ye Liu <liuye@kylinos.cn>
> +S:	Maintained
> +F:	tools/mm/show_page_info.py
> +
>  PANASONIC LAPTOP ACPI EXTRAS DRIVER
>  M:	Kenneth Chan <kenneth.t.chan@gmail.com>
>  L:	platform-driver-x86@vger.kernel.org
> diff --git a/tools/mm/show_page_info.py b/tools/mm/show_page_info.py
> new file mode 100644
> index 000000000000..c46d8ea283d7
> --- /dev/null
> +++ b/tools/mm/show_page_info.py
> @@ -0,0 +1,169 @@
> +#!/usr/bin/env drgn
> +# SPDX-License-Identifier: GPL-2.0-only
> +# Copyright (C) 2025 Ye Liu <liuye@kylinos.cn>
> +
> +import argparse
> +import sys
> +from drgn import Object, FaultError, PlatformFlags, cast
> +from drgn.helpers.linux import find_task, follow_page, page_size
> +from drgn.helpers.linux.mm import (
> +    decode_page_flags, page_to_pfn, page_to_phys, page_to_virt, vma_find,
> +    PageSlab, PageCompound, PageHead, PageTail, compound_head, compound_order, compound_nr
> +)
> +from drgn.helpers.linux.cgroup import cgroup_name, cgroup_path
> +
> +DESC = """
> +This is a drgn script to show the page state.
> +For more info on drgn, visit https://github.com/osandov/drgn.
> +"""
> +
> +def format_page_data(page):
> +    """
> +    Format raw page data into a readable hex dump with "RAW:" prefix.
> +
> +    :param page: drgn.Object instance representing the page.
> +    :return: Formatted string of memory contents.
> +    """
> +    try:
> +        address = page.value_()
> +        size = prog.type("struct page").size
> +
> +        if prog.platform.flags & PlatformFlags.IS_64_BIT:
> +            word_size = 8
> +        else:
> +            word_size = 4
> +        num_words = size // word_size
> +
> +        values = []
> +        for i in range(num_words):
> +            word_address = address + i * word_size
> +            word = prog.read_word(word_address)
> +            values.append(f"{word:0{word_size * 2}x}")
> +
> +        lines = [f"RAW: {' '.join(values[i:i + 4])}" for i in range(0, len(values), 4)]
> +
> +        return "\n".join(lines)
> +
> +    except FaultError as e:
> +        return f"Error reading memory: {e}"
> +    except Exception as e:
> +        return f"Unexpected error: {e}"
> +
> +def get_memcg_info(page):
> +    """Retrieve memory cgroup information for a page."""
> +    try:
> +        MEMCG_DATA_OBJEXTS = prog.constant("MEMCG_DATA_OBJEXTS").value_()
> +        MEMCG_DATA_KMEM = prog.constant("MEMCG_DATA_KMEM").value_()
> +        mask = prog.constant('__NR_MEMCG_DATA_FLAGS').value_() - 1
> +        memcg_data = page.memcg_data.read_()
> +        if memcg_data & MEMCG_DATA_OBJEXTS:
> +            slabobj_ext = cast("struct slabobj_ext *", memcg_data & ~mask)
> +            memcg = slabobj_ext.objcg.memcg.value_()
> +        elif memcg_data & MEMCG_DATA_KMEM:
> +            objcg = cast("struct obj_cgroup *", memcg_data & ~mask)
> +            memcg = objcg.memcg.value_()
> +        else:
> +            memcg = cast("struct mem_cgroup *", memcg_data & ~mask)
> +
> +        if memcg.value_() == 0:
> +            return "none", "/sys/fs/cgroup/memory/"
> +        cgrp = memcg.css.cgroup
> +        return cgroup_name(cgrp).decode(), f"/sys/fs/cgroup/memory{cgroup_path(cgrp).decode()}"
> +    except FaultError as e:
> +        return "unknown", f"Error retrieving memcg info: {e}"
> +    except Exception as e:
> +        return "unknown", f"Unexpected error: {e}"
> +
> +def show_page_state(page, addr, mm, pid, task):
> +    """Display detailed information about a page."""
> +    try:
> +        print(f'PID: {pid} Comm: {task.comm.string_().decode()} mm: {hex(mm)}')
> +        try:
> +            print(format_page_data(page))
> +        except FaultError as e:
> +            print(f"Error reading page data: {e}")
> +        fields = {
> +            "Page Address": hex(page.value_()),
> +            "Page Flags": decode_page_flags(page),
> +            "Page Size": prog["PAGE_SIZE"].value_(),
> +            "Page PFN": hex(page_to_pfn(page).value_()),
> +            "Page Physical": hex(page_to_phys(page).value_()),
> +            "Page Virtual": hex(page_to_virt(page).value_()),
> +            "Page Refcount": page._refcount.counter.value_(),
> +            "Page Mapcount": page._mapcount.counter.value_(),
> +            "Page Index": hex(page.__folio_index.value_()),
> +            "Page Memcg Data": hex(page.memcg_data.value_()),
> +        }
> +
> +        memcg_name, memcg_path = get_memcg_info(page)
> +        fields["Memcg Name"] = memcg_name
> +        fields["Memcg Path"] = memcg_path
> +        fields["Page Mapping"] = hex(page.mapping.value_())
> +        fields["Page Anon/File"] = "Anon" if page.mapping.value_() & 0x1 else "File"
> +
> +        try:
> +            vma = vma_find(mm, addr)
> +            fields["Page VMA"] = hex(vma.value_())
> +            fields["VMA Start"] = hex(vma.vm_start.value_())
> +            fields["VMA End"] = hex(vma.vm_end.value_())
> +        except FaultError as e:
> +            fields["Page VMA"] = "Unavailable"
> +            fields["VMA Start"] = "Unavailable"
> +            fields["VMA End"] = "Unavailable"
> +            print(f"Error retrieving VMA information: {e}")
> +
> +        # Calculate the maximum field name length for alignment
> +        max_field_len = max(len(field) for field in fields)
> +
> +        # Print aligned fields
> +        for field, value in fields.items():
> +            print(f"{field}:".ljust(max_field_len + 2) + f"{value}")
> +
> +        # Additional information about the page
> +        if PageSlab(page):
> +            print("This page belongs to the slab allocator.")
> +
> +        if PageCompound(page):
> +            print("This page is part of a compound page.")
> +            if PageHead(page):
> +                print("This page is the head page of a compound page.")
> +            if PageTail(page):
> +                print("This page is the tail page of a compound page.")
> +            print(f"{'Head Page:'.ljust(max_field_len + 2)}{hex(compound_head(page).value_())}")
> +            print(f"{'Compound Order:'.ljust(max_field_len + 2)}{compound_order(page).value_()}")
> +            print(f"{'Number of Pages:'.ljust(max_field_len + 2)}{compound_nr(page).value_()}")
> +        else:
> +            print("This page is not part of a compound page.")
> +    except FaultError as e:
> +        print(f"Error accessing page state: {e}")
> +    except Exception as e:
> +        print(f"Unexpected error: {e}")
> +
> +def main():
> +    """Main function to parse arguments and display page state."""
> +    parser = argparse.ArgumentParser(description=DESC, formatter_class=argparse.RawTextHelpFormatter)
> +    parser.add_argument('pid', metavar='PID', type=int, help='Target process ID (PID)')
> +    parser.add_argument('vaddr', metavar='VADDR', type=str, help='Target virtual address in hexadecimal format (e.g., 0x7fff1234abcd)')
> +    args = parser.parse_args()
> +
> +    try:
> +        vaddr = int(args.vaddr, 16)
> +    except ValueError:
> +        sys.exit(f"Error: Invalid virtual address format: {args.vaddr}")
> +
> +    try:
> +        task = find_task(args.pid)
> +        mm = task.mm
> +        page = follow_page(mm, vaddr)
> +
> +        if page:
> +            show_page_state(page, vaddr, mm, args.pid, task)
> +        else:
> +            sys.exit(f"Address {hex(vaddr)} is not mapped.")
> +    except FaultError as e:
> +        sys.exit(f"Error accessing task or memory: {e}")
> +    except Exception as e:
> +        sys.exit(f"Unexpected error: {e}")
> +
> +if __name__ == "__main__":
> +    main()
> -- 
> 2.25.1
