Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CCD62836A6
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 17:36:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746553019; cv=fail; b=O7X1I8QjgaqEKJceBcyDovuDCK1vPUU0ekbOs8Pp4POgeMSk2AqNWGQBD0iSyuFUawInU/xJDCGw7YuwGGyvqbNTB9DRygAGZkA7lYg/9gn46sUkZSeFRdeHxFmswHmpI6N8Owl6J9HrAXZ/2b10wInaAa1mTFWfA/X93h26iVo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746553019; c=relaxed/simple;
	bh=0uENUZjZPmtGZAL0626p1TcWcuWhzDD5Smz00binTKQ=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=i8vkghvJY/zNXbP7zspC5Z4jsb9oa5yTajWE0t9x23xMa8KcwqT9zonuUweTeVHEdQ5L2NExMGGYpPxNLiIah1XJJx4I5I0aUbcZPmXwWHRsxR9aqwFbkUU0koMGemxbBg15rtDb1UO4Os2wUEhFd949hwuAw473Jn2OOCNpyEY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Ir5Q9cpr; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=q4XaQCaX; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Ir5Q9cpr";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="q4XaQCaX"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 546HU21D029042;
	Tue, 6 May 2025 17:36:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=corp-2025-04-25; bh=kYdSR57K4Hebwx7l
	nOPX9FZKJY5pURC9f4AnfgGCymE=; b=Ir5Q9cpr6Gb8UKKjhHQTkHQLrdCM+9U2
	3Q5ZMq/YX2hcWv2PAjsYiOybsu9fW+lzt+x3fQtdcmKpUxBfFoMnQX42mDmdqi8b
	KgMD3TnasKvV59/K1LBZ+lQ+Jg+2Nft2dX/IB8tMnZgJSUTNfw1fC/J1W9UOlF7O
	9/aItjPn9r/ndG3DGyiwnesZNPNYrTG6DZD4LaILcfn12bULtSGWVAkOtBfuaW+u
	edIpGJciQiroW1T2TsfsmKgycPJfMhnUB6o+qh47H6zbK4/IxuMmcMr4iPadQTj/
	D1TplixWofeQavwM/Efwg0vBQ2Ys0CmzTKh1lNDqyYzOglGgo6a6FQ==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 46fpvkg0nw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 06 May 2025 17:36:44 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 546GGXCm024449;
	Tue, 6 May 2025 17:36:42 GMT
Received: from ch1pr05cu001.outbound.protection.outlook.com (mail-northcentralusazlp17010000.outbound.protection.outlook.com [40.93.20.0])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 46d9kfkpx4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 06 May 2025 17:36:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mkJp5Tkn3aBe76wRwpI/d3biT4wDPcqQZ2uJlPaPDYkErLE/HXJFjBMEwD+XQGs3AA5rIHIvCYj3EAi5pWXfxdJfGpiTajLnh7sB6Skz1ouGgbOWRfF2+B1s5CW25DK8MyGGvWuW0aVZzR0RSOz5nc4vO8iN+VbIEXgDu23zIHbHENkG8BJH29nSn2u0febFTp486jQIfLMOXTmCxj5e27U3oKpSgeddIlrG3mvbcI0iC7elVbGZqLz37xPGm28kooBYnO3g5PiiWBMctWmKI0cZTr3L4OlROeiRWxSeXEYEEd7ApgGAuv7iywtXwTFdBMJr7HC7rrcJhEzS1gdJWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kYdSR57K4Hebwx7lnOPX9FZKJY5pURC9f4AnfgGCymE=;
 b=xavU1wDYZDbfNsR1NMlesFex6MXmFaMvMZEmwIFxIAcQY2AJehCM2TDog93pNNhh1F4lF8LdqEs+iKvlSoxUHZg1Gr/Ip1h4h6mI7xpBg63M4LCnt9+KlIN0RyAXoXnTBG+BRIgmQ0Mda/rztUJuVLTbc9fsxS/Bmk7tE6zqT7AmxIaluVc4yyrVA5WW+D9wOHuCUGluJB0A8fnRa4ntsC9IuRtX1EHEWbNXjrfTiAQGcc24ZWxbbANwHuwDjxbe4jIZYjfroxPbt7JbEBRxVhcMz9WyCsP1B9CU2GxssFRCtXnTaGcjPWsOe6n6xUeDFZvBLrIv+6TKfN88MW2oHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kYdSR57K4Hebwx7lnOPX9FZKJY5pURC9f4AnfgGCymE=;
 b=q4XaQCaXSTPE1dLvTTgjl/XGrhrTLpBuwHNymKyYfg3AMRqAUwU7WN5D0EA058o8OLwB1nc4ykh8qJtRcadA49dxnrjfxCp1HJNYgvW99imKtMSs/FLKG2ta9Ds4uA4WahxCxE2PzSn3xPBZnbAgk85XL9XX11rHGhKscXPfDbk=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by DS7PR10MB7178.namprd10.prod.outlook.com (2603:10b6:8:e1::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.23; Tue, 6 May
 2025 17:36:36 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%5]) with mapi id 15.20.8699.022; Tue, 6 May 2025
 17:36:36 +0000
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: David Hildenbrand <david@redhat.com>, Jason Gunthorpe <jgg@nvidia.com>,
        John Hubbard <jhubbard@nvidia.com>, Peter Xu <peterx@redhat.com>,
        linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: [PATCH] MAINTAINERS: add mm GUP section
Date: Tue,  6 May 2025 18:36:01 +0100
Message-ID: <20250506173601.97562-1-lorenzo.stoakes@oracle.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0660.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:316::13) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|DS7PR10MB7178:EE_
X-MS-Office365-Filtering-Correlation-Id: 554a351e-19a4-47e5-5eb4-08dd8cc48ce3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?boMJZlkaC38uFRUW0bKakGMWzGKPEnBhjjMMNjH8n9jwzsn2a64k80ShpKDf?=
 =?us-ascii?Q?E2APXhbNPxdQ74fv6OZLARm4FvNq1jgtH36+vUAaSK1BCmpYvxK2HlcIX9o+?=
 =?us-ascii?Q?rJ1/Ivxw5Co5+32gWhNECIDuWA9NeDcone3/IbXNYgVEnHqDF4vGYSOw+RxO?=
 =?us-ascii?Q?GSYqvbOXTSXJga5WTHXELz7qscBTJRLqlkwYsYXCvFoslp+sLk9qVaDDWS+8?=
 =?us-ascii?Q?yumNWzJ2wlWqCfacVGfDJxuNGhd/49JxwAWVUr6glcevadfUnXAgMSPMfiow?=
 =?us-ascii?Q?+88twdxEFmc0n4J7jgJSxl4h5f8Ymv+7KCdSXHZ9p7yxWx5Ht9M5b1sgWfuz?=
 =?us-ascii?Q?U7/91S+NDz5h9FH7T6thtYDJYSBRGOFtJpGma97HmWiV/iVy4mv3p5a4RG7V?=
 =?us-ascii?Q?rGMy8Tf9E/2qAg5dg8v5jJDzl43BdrryVrQ3HLMhsoJ1Eeqpo27vYuRqiQ7r?=
 =?us-ascii?Q?5ZUPEbZZfJi4+3H7tmdCVkwTVUeDQhsLhDPEiiDey67MHcPrCadMR7EID6Rc?=
 =?us-ascii?Q?vKpjytsKz9n7W79RXPTTyaTvrGcEd9Y1dRBS5KoD7g38MgJZV25TQ69E5lRh?=
 =?us-ascii?Q?5U4UZKUlPfz+wc27PDIinwsoHeyLxnrbncAjrvha2KAxNh9pBRkG0rR6arhE?=
 =?us-ascii?Q?KDuDABDTHImjI/2IbmSJ0pEIazxf8MonkBG3ErFEdJsjzDrZdEF54oLQzD15?=
 =?us-ascii?Q?WX+Eyhp4HjL2gKHzt7AjasbIdCEUjZvRDKt/s2sSFcNp/EcUPZ4hvDDAp+2W?=
 =?us-ascii?Q?oAfNj5U+aCIbjbbM8bpuDTJ6tfHdRDpL3TnT9igfIVkcg3LFSycBtv1vkVxK?=
 =?us-ascii?Q?bBZy+5zQlp87faySqZIBhoPYydiWoxlJCKApiQo/qhIYB9QOneDdk3bWoDYN?=
 =?us-ascii?Q?FAECrHXMLJnsMJwsU7R679zkSNKdvXB6bP6jDLEUTWYIpsXpmQjJWp8vfYLQ?=
 =?us-ascii?Q?k1dCB9+Kl1wVeDc6vhrfLR8DldtAQtOWHxZEz3l6zSjDWSn9Rx9GZP24qvwn?=
 =?us-ascii?Q?PS7VV3eJ4CuOM1nfiyNWCFTBl3JrDiFKz4xLqjAkmrELdhcXX3X6/I+KwXwp?=
 =?us-ascii?Q?yUyDDLRFhS14VPXPeZBrR6Uf0v2sOamXhVksGP4LEZ95+WUdnx9iVze/mEFe?=
 =?us-ascii?Q?qtN+g0hBItReliSWGc9AWi697NURfyg+u9RBHNgJ/ulD/DXd30y/a0/2fXuk?=
 =?us-ascii?Q?KNC5ViCFwBCwCLJiYiP23s9AuzC08bijxpPl5SrtmMuyuyk/0xzWNA3xBS2y?=
 =?us-ascii?Q?Zy6lkqCokHvMjKgL7Vgny0FCHOu2dl9FOXAy7AhcEYPsctIZS/KA+UyYUiU8?=
 =?us-ascii?Q?eB3apmsywhwVnac+dBF8R/XYpWPMijS04ZRovRF3nT3BQgNUw5zFZZrdVFvH?=
 =?us-ascii?Q?T0rbOcY=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?bTyeXehZ0UQ6/ir/NbL8SjQTH8tzJBBgjVBAJPkwYZuAEyPGk+ABpgyJTUEi?=
 =?us-ascii?Q?7Y9lW80Ww2520PCqDhrsaFBTmzeMyIID8017gFz1N1CexYWZ6QDs2qar2ren?=
 =?us-ascii?Q?WE+xNi7qXXPL4MSPt180/IKi2UHxHPBeG9zd4+wXJ5oDimXFtlIJUybJu05w?=
 =?us-ascii?Q?Lpa+VheldckwrWwKkM4BnDX7Vz9TI+fkeEwlOaOvKFwlzfX78vwcHS1h2CaP?=
 =?us-ascii?Q?DPFVzyDnfb9A2hpA1+rOW1PFhEhJPgP54Gcya+2lnkQll5YTuXw0d6294c9p?=
 =?us-ascii?Q?E/PFsodduuDV60Y0aYBeEuUKGCRFMcBO89e4zE8K8fyHm8sBUYZmW/5OsRA0?=
 =?us-ascii?Q?BsgERbHYxsWxUs6Wr9F/pUynS6JANFPfc0b1+nYNtU+P9i90vMB3U6GL+Gyg?=
 =?us-ascii?Q?G7AzkE6Y1GCWOgVwJwnZmrDLadyKXdcgKniGjokg1iDVruL7bzENXI6D2zsX?=
 =?us-ascii?Q?ZV5LygRzuTMl0AgUwv6sNYavMC9bWYsLpTgQCyvJe+lm+KLGR/kC0YpAvtMl?=
 =?us-ascii?Q?lBQP3J4S4s6nKGHDSuOud2KPsvD0RJc65lElZIIA55/Tz9aNuuQxJvOHs6CX?=
 =?us-ascii?Q?9ecwNI5CwI4F0eeqBee7r3j3osYsB7UgwC2RWKUcbzV/UZ7LMf8iASTQ3C4Y?=
 =?us-ascii?Q?8v1L8817SiTQB/QSyEQzk6oE771P/Sa9GiIBDcNE9QFYxdYEqYDu+K0gDolG?=
 =?us-ascii?Q?uNC3BBlxghMgoXVKFy6yDIj/TgrTBYrye1JEOqifWsw2cllgY2cf11KceKE3?=
 =?us-ascii?Q?iV5d9ZFHYqvAIrG2ICTHnUJthMR+8c3USOinxcgbuF+NHkgzl6KlnpARo98n?=
 =?us-ascii?Q?NFFtx+1hLI0qG8/EnSEKE2exD81CrmUeOtR/KkNGCxBuha5rQXM7KMV8wIhJ?=
 =?us-ascii?Q?vqNWMclswBldbTKIF8dSQzcsDA7TtP0ecIjSIHb8grVayk7py7J1+l50ln4F?=
 =?us-ascii?Q?kkToOKXcZygL1L9SojSPMNmhsg+ZdpfS4ig6D9EhrLdtu7sMBqBZlzmX1mvD?=
 =?us-ascii?Q?XdZ3NatdISQL7jI8zcURPffEV/Vr4vbR/I35d+LtMy2jln7voEGOHv0IpSF5?=
 =?us-ascii?Q?9hMU6Fk17zYVsElhTCycVPu7hdQLGj5fZeK/ToxT7Nku6kZumIohq6MuoRCF?=
 =?us-ascii?Q?vyAI3U94t3nXI2r/iYJNXj2oA6dT9kKIYgjitmlYrplJZYC/Prdx2Nwnyj69?=
 =?us-ascii?Q?jMhz4WLXH7Dvk5Ew7BcjqlMWHuO+kBPJ1lbYNHp+YPUQv0Y57/mQFtxtJLY0?=
 =?us-ascii?Q?/4QhdS5e+BLju3YKoZik84uoHAusN7Wm9jswKjHVlMhTbOpdF7OpUWYTc3a+?=
 =?us-ascii?Q?HIhPzGLaiDmQMKJVJ8+1XCwwFE4YcWNnFP8IAwrBLgWLCvj4DWIKep7yNtp4?=
 =?us-ascii?Q?fP3GLkmXnLUbmw4SRbveYYyGOlVk8v4YEdR3erVPAqJAOaVDISP/h6YdCHCj?=
 =?us-ascii?Q?rtBvZheZ8HXtmePHWwbCgEHkRxAlZG4fqWmLUQutCb7gmOTrVT18XXcIEURE?=
 =?us-ascii?Q?sXXYj0SCl8u+RuXv5zFSBOKJWQr0NcAHNLKYGv8owK9/jJmoat9aeBsEOYTt?=
 =?us-ascii?Q?coE4aSmGeHQ92LsAhOZnTawCnwuaUd6Bj5QEd8rz6ywcXDtJYp69Jl3it/wE?=
 =?us-ascii?Q?/A=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	xQUJoKbOqwLXWi/OkA38ng6UznSzvn4Upy1mnWxOUxu8qjk/H/CTQBJtBcBt3mBYnYhUACv0vOJjwdcJoRak4oL0cBu+M3ae+byAMkCYkzx4dPE92heqiUMhxF+NTyv7sLW8zMhI6CuzLJhTz/snR9fb1LpfXjQR9OL5sBXDb5NDk4wWNmpu/iUNVGVQ4tGi6ZnnZkeCUm4hxkF3lhLpbM1H+lWzYzaR0fjiReKZ9IMzvg5gg8WZaDPads4fmhxwXEeTvSKuPIwK05dwB3kE3SQ7qIDRkaV9Y8/UG6acNvUYJXy0bgiFf8Fuj8V2PY4u2qYPKyora9cyONGghhfIIgowSM8Us9OFGUp029om4BPvDlVIuklXMLVxN/0E1AYDG8j13EKug7InfjI52pbEI4QhdNk8NtK26ihu1el/n1iUFF7FVST0t+gughFXFujyzEmladq1ebWMnbdHpdyMSVdx5eoUGgpxNBLacOVJ+oWjJaG1bRf82k74rEyl5xFmCHEUPo6eiATfZpJ2nyj0tW7xsKnBp/H7P7ZuxevWKN0cgLl4sVyGLQmwHMpEjdSsHGrJaPPw4MeVi7pX+gDCdPTkARFaVhykdbbA8sSzgdM=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 554a351e-19a4-47e5-5eb4-08dd8cc48ce3
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2025 17:36:36.2685
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rMLQVL67CvKzxxZwjDbtp9efQRRSDPvxyCupqPMLYd0mybs6CbPqUKFYsgFxd+PdwuZXNsuHaw2oQ8LeGwuv19SRhmUHGag7VdiqD7a/BwA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB7178
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-06_07,2025-05-05_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 suspectscore=0 phishscore=0
 malwarescore=0 mlxlogscore=999 mlxscore=0 spamscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2504070000
 definitions=main-2505060166
X-Authority-Analysis: v=2.4 cv=Ha4UTjE8 c=1 sm=1 tr=0 ts=681a48ac b=1 cx=c_pps a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=dt9VzEwgFbYA:10 a=GoEa3M9JfhUA:10 a=1-S1nHsFAAAA:8 a=yPCof4ZbAAAA:8 a=Z4Rwk6OoAAAA:8 a=20KFwNOVAAAA:8 a=Ikd4Dj_1AAAA:8 a=37rDS-QxAAAA:8 a=VwQbUJbxAAAA:8 a=yEHFsg65M2jBh6DbBQgA:9 a=gK44uIRsrOYWoX5St5dO:22 a=HkZW87K1Qel5hWWM3VKY:22
 a=k1Nq6YrhK2t884LQW06G:22 cc=ntf awl=host:13129
X-Proofpoint-GUID: iICjY-MvTATDHHPiDP6HDPqpj4CngSPs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA2MDE2NiBTYWx0ZWRfX+7JxN2S7WmYd LIODrmD2CQ5nKM9u89ya4mhweQf1x4AYJA7saPRHaoVAXkBSJCRZ8ciWrLvt4xqIm3WKLe9QEKU UuWEGfYd+3pcJxUslDdtWNJcbT1CGw09wgSyQssN1S6GcFJFLqNTyGdLN2alfej1UHTwAQoZ3Vt
 iduJP4JYQx1noWXT2ymjoH99A5DnEJnHb5PtVYqsuKEgR1wvyMwf/GJx4yVKOyiH65w2MIx82h0 0uoq5zYGjamobzXf3ghUWEWmHsjoo4mV++tjxj8jygYa+yFetW7PYAxdRWF/DjxUIZP8udx7kgy tfxF5783BrjuiNbdepOHgSiuiPlxY20+mt3Icz2O6ALAB8CsJoVcgihPfETuKbYhTUEtATaC0/2
 9ibmBAdz0L37utnueMyROcEvvs2hIB8kyF/Dtgxci/m8hgnBr70YigPWxrF55lXUG/JlmGN5
X-Proofpoint-ORIG-GUID: iICjY-MvTATDHHPiDP6HDPqpj4CngSPs

As part of the ongoing efforts to sub-divide memory management
maintainership and reviewership, establish a section for GUP (Get User
Pages) support and add appropriate maintainers and reviewers.

Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
---
 MAINTAINERS | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index d274e6802ba5..9c769f7d135b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -15540,6 +15540,18 @@ S:	Maintained
 F:	include/linux/execmem.h
 F:	mm/execmem.c
 
+MEMORY MANAGEMENT - GUP (GET USER PAGES)
+M:	Andrew Morton <akpm@linux-foundation.org>
+M:	David Hildenbrand <david@redhat.com>
+R:	Jason Gunthorpe <jgg@nvidia.com>
+R:	John Hubbard <jhubbard@nvidia.com>
+R:	Peter Xu <peterx@redhat.com>
+L:	linux-mm@kvack.org
+S:	Maintained
+W:	http://www.linux-mm.org
+T:	git git://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm
+F:	mm/gup.c
+
 MEMORY MANAGEMENT - NUMA MEMBLOCKS AND NUMA EMULATION
 M:	Andrew Morton <akpm@linux-foundation.org>
 M:	Mike Rapoport <rppt@kernel.org>
-- 
2.49.0

