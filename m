Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5489A2EF295
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 16:14:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750176867; cv=fail; b=YfhOmBBIJIwbbMSFx4Yr55vG1jornRUF3fBtRedWODLro+5gBSv3b13GfQ+UZxyv1Ml41CY+w6z5Epx0JdxyxSG0oeoDNu/sjVeC3sKnYpwGgbOvSmYG1S+fc9+YYThQsqVhjpsjBbWDu/CU/IoDRSNmwg7jUXTsZB/VA/oZUpU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750176867; c=relaxed/simple;
	bh=pr5/UnUvWTxZfW2Ao52vH73CNH+VLRyS+rfQwe+kAWk=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=kYYNx4G6UBp921G+50ji2FHZS4qAPItRCea+F/cKVAhvU9Vm1vxdKL+UsALWAwMDUQDapszHVnELUBBAjiOMktlZJ5Cqax/qkDoRjqclk6PYvaoHeKWky51L+xZpmko3U1ku7NiNebeRKynTMBiDVbC6NOUzQNoak97dKrjd4A0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=MQlw/wUS; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=LT/YcHvo; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="MQlw/wUS";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="LT/YcHvo"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55HEWw5d004239;
	Tue, 17 Jun 2025 16:14:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=corp-2025-04-25; bh=jJxIHrgsm/4zdqAE
	qs2dDuNBXe6IDEREDGG+dGhjgso=; b=MQlw/wUS6KZFSrRxiTpv0FJ2UEKSkHPy
	4z8PYVpDZxk5qJznXpU4kuC5H4A3GqN5FvORQVBGSGoECyqyVgxzp77t7ekM8GbX
	UroKxs0kClE+hqeSw4x7IibbHgqZ0+wxB2SbM0NUr4whMnJ7oBB1Th82ejgBMBMh
	nrGTnLGd3NEjRNWHu7xLNCICnjjD7mp/9T/m653h/Ug2PQQ+v6RvYbdWkvZ1MBm9
	tbb9IeXvCho2a1I9FdCHEg7be7yoGf41+NItU9du+P9Nn8/gnHEcRiv/NgPCFfc2
	3MXpb3Nr9+jVp1MCREpsqtS4RcFPVKDOb0DmX8UJxONGgRoRieB+Zg==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 479q8r4rb1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 17 Jun 2025 16:14:14 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55HF8paf032042;
	Tue, 17 Jun 2025 16:14:13 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11on2077.outbound.protection.outlook.com [40.107.236.77])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 478yh9eqt6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 17 Jun 2025 16:14:13 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GkfK+6USxOQXRKwPkPk9hm61/lCUcsWfU3AutXQUe0TvBnWnszkdS6PvUQNfqPxSa36DkUIQV70jVoNbReoa3gdBrlFXs0Tkwty4x1muf4dHkIe8wIgjNj2n4IpBJNg+Wjmp3Z2r/bfaTzicHf58Oi5sJtp2qvrwsYg1aUCf4dsBM5ORfHNtfPvPMEwjwBVyszMA7QLFihgAbNdbVk73gaQDAnumiz4IgeVt9Oq26VeC1NW6K9HRQI+eeOEIZLRowkWohbhIQYBob8asiZJrVdk2samtJo4Dazq3mOrUmiYZmFr3APS8FkQ11GuapFGuMk8izRhJMALsPEmoSnGB+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jJxIHrgsm/4zdqAEqs2dDuNBXe6IDEREDGG+dGhjgso=;
 b=AVSR0KFZrlPmOFb3rD3Jp4anhknf4NTEHG1ooYm7L4PDqUDpjYK7tiyiG3KSNEHUmnM6JZECvEot010Bdm3calObPZQqSv9EdKVE7kXNlmKfl8K3SUnecAtfceLfsGN5L994oEydDUc7hHFYRsXCKMDTtbLfoD6VGcq3+yP/iVxwzQtdtoL/GaYn627sJhm3W9aU30dFuYgWs5ixw5ge1j7Aa7jL1rkG71cWCvF33wgnb/Y3PWm2F/0X9/gOn2IiJaVsQyb7I/hCvv7O1j20An1y2dWYDVahYiMjdMph9a91gUmFRIw3jhxCSve6wQSCwscx4CdrgJff+8fuWRh0Ow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jJxIHrgsm/4zdqAEqs2dDuNBXe6IDEREDGG+dGhjgso=;
 b=LT/YcHvoGVzq7L40eI3PtYhNzdo0gy2LtHRTnh3oyt1Ib5HSoPkMX8c/jalguqQ02MlXLIpAJVXIg7r+N8sfaHKZBj7Onn86yEGY72SlpEa7G85PvgOBrMjFepZsjAaHP70+ND35/u9UjSV1hdTcH/+8VGt051OeU/hw9JbuieU=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by SJ0PR10MB5836.namprd10.prod.outlook.com (2603:10b6:a03:3ed::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Tue, 17 Jun
 2025 16:14:10 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%6]) with mapi id 15.20.8835.026; Tue, 17 Jun 2025
 16:14:10 +0000
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
        Hugh Dickins <hughd@google.com>,
        Baolin Wang <baolin.wang@linux.alibaba.com>
Subject: [PATCH] MAINTAINERS: add memfd, shmem quota files to shmem section
Date: Tue, 17 Jun 2025 17:13:59 +0100
Message-ID: <20250617161359.166955-1-lorenzo.stoakes@oracle.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LNXP265CA0028.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:5c::16) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|SJ0PR10MB5836:EE_
X-MS-Office365-Filtering-Correlation-Id: b88a1acb-8f27-407f-42cb-08ddadb9fe7a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?QgbzlabEWnr9BFBsUDmiRbypxNn1Vw+nWKY3rpoA3CdOv8qAquIVrfTJUKJp?=
 =?us-ascii?Q?0x4jhmKoSjN4jeePsQSI2czAkRSqqyWguyOgVrtG9TdtTcO6uhFa26SkA+Q8?=
 =?us-ascii?Q?chg/gB1gZ8emivKAvOjvlP35FrMgj7jh7eJNNbRNKmqZ8M+cApGfK+Zer8Yv?=
 =?us-ascii?Q?mZHTlZhJpLpgiXMctdH0J7en0lTqnzXsrP5RXptbFgnYPJPMp+FXD2eoMsSh?=
 =?us-ascii?Q?89eSPfTJAgJSLB4arSOmxk8eEQDGZGIfOpNXQLQhu2iclDxYg2BzwFwWIgIs?=
 =?us-ascii?Q?+M39iWcOv0BncACczZPc/WopvSvs0T3f585G8LhuWcZvGVJPgVlsuqt8kck7?=
 =?us-ascii?Q?na2/uxdRkgNHFIoslzJZZEB66wjgC145VtTTAUkS8c3uyKCtukT2rC8VndRS?=
 =?us-ascii?Q?u90ot5rgorokCKDKLyc8IHBu6sQ41vaZj4KKmXHGI7JKHVRmcIy8ee/sFn24?=
 =?us-ascii?Q?8+CS13G/jAJVR+18A+/uvS7E2QIPpFHJGv3x3GDl3AleZrHtUhaPIOAInLQ6?=
 =?us-ascii?Q?XYuJac2IYzSd+YSfbeFWWtApFt985AnXcQPpDW4q0iSspXZm3UmFpbQ4r02I?=
 =?us-ascii?Q?8BXHlqY/GwNOU/TdpXUSOILe/8WSCDvUlwWCVSkBiEE3JLzFoe3wBZYmML2G?=
 =?us-ascii?Q?4lmU7bMVQCQYavnhbeARL0StmO4FD1LW4tNdHUptdyIpGEPlWlTecA0uiAG1?=
 =?us-ascii?Q?XoEc7NzehAPwfV/zLg1c3vph5xy6QDollf0hNQeja7vdChGne7DVUcOfcvax?=
 =?us-ascii?Q?aW2Uydfjny9q2LCl8Os8tLCj/CMIkkksI9wBZRO8GxZH8KL6ZHC4Akw/8Oed?=
 =?us-ascii?Q?mEGqKlQLrpCdxizS/qsADeZuxy+Pf6/h7QXsHDk9Hndp4Yiilzah6Cbf5/mf?=
 =?us-ascii?Q?uLvrInr7FIoU6lmYJ0m9NEKyUZ7Q3uJgWtzU9XXECoEiSIOymCzUdDXkXO9V?=
 =?us-ascii?Q?41LbQcGtTNUh3tsWct8xB6NmFZbr4KdvdWV1WlX7L0Pv5kfk0fQM7zVasfuD?=
 =?us-ascii?Q?zZHqw7um6dktQevVsHx/7Oi9gFzj6yw+uzDxceoNx+9/ACFdQOOV7QuIkm7j?=
 =?us-ascii?Q?KYYFvIzrlK/UggE/nOYBSGpuBAy3febv7hK05ih1+Uf7ZxJ28P3B+8tsONqr?=
 =?us-ascii?Q?wgJdgfb6EjQBgMewFZrveUvHLUIMBgNd2R4eMP8PyDkFAnuwocYlk4KlYrNb?=
 =?us-ascii?Q?sXQ81PnWrwkf1z0aawtWa3Hys6HSuNiYOsWgWfP4IFmPgP+6X17HM7hQ231Z?=
 =?us-ascii?Q?idUiAcNUDbEYDD+AHZYDJlX8fAd1UzxmlpCRMZscoDr5/cLg8c0DCKz7AQ7Q?=
 =?us-ascii?Q?Oqh1VPLOmkSzikLLoJfJqMFEeZyq0jxHzCy8YMlcrodcy0soVwxvw+mcIDDo?=
 =?us-ascii?Q?QSYO5WSQMeA9wKUv0EP1O9pQW2OWww75dvlugGJ0lHn6Orx/I+VertTN/AZ1?=
 =?us-ascii?Q?7ecUd3npEqk=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?pmd+t8Tep4qhaDLJAaq21YJ4aCoB+ccfUFeIlNyIUye+Kh4cjYQy11zdlX5r?=
 =?us-ascii?Q?xyicbwWcraFiYiuNtREHUhkpBrnuocvIHixeQT/oibzwYbAVwRPHW827e674?=
 =?us-ascii?Q?+qlD/FAJ+9xz9pjmQS8+vvz4bruGxRZkE5jSS05Q/vYnUeAb9aZ/SiwJxfRd?=
 =?us-ascii?Q?yh3N90QV8jknAwJyeh/CX1K/EI29rX3UJtLzsfJOgsDIKDKoCV+ZTn0UdAFp?=
 =?us-ascii?Q?y6Ysp/H1STBdmIttXeEa1tp8/Lba1lwkkH+Fmj7aaWYv21RgFC+etMhS98JS?=
 =?us-ascii?Q?YmBQbv1uLHSii8kKOoFlTN8QTWPqzrFpsIhSHSyqTm+pSdmnURYm4cRnNpCs?=
 =?us-ascii?Q?RN45gdngGvqHf62ecfWWG9dpMn5PTaDuq0xb+5Npf6AC0PPw5Y5cAMHEFNmA?=
 =?us-ascii?Q?PxdLJWC389NSq8l4frTBnwTX1KUbQXFSS7pNMb30ZiIBuxzzNisVu1Lh2UmB?=
 =?us-ascii?Q?ziVPO6QqR2nq3q+RKRvZBIB1QnTYvbuuHg/UZmeVKejvAw+hfZPa8iwe6L0N?=
 =?us-ascii?Q?+GnQHHIzCIIXRE+hrl5y6Pg5412GFrkfZ7CSbHB8G9opYuGmRhdpmrRdEHlv?=
 =?us-ascii?Q?0KW/VU/KbxHfM0wzQ+AGXCphdAA12eEcu44H4fXXXjz2gOlCLXudtDP2L2K+?=
 =?us-ascii?Q?RZmbvCzmXDggI4ob0WeWtwgP3Zm+kTsuG3UC6nUlpNo1pMoV3knjanTJN4Gf?=
 =?us-ascii?Q?s2GY1iPnYLtdzT4B47T8TZgzFpvXnnSj/xgF5ZAp/9r6q72kGRptif3KAqaq?=
 =?us-ascii?Q?NmOIVWx22YjdVCXgXfFYFJIIdf2w9PKWuemvlU4zhI7cKHXd/8TYxltpik1d?=
 =?us-ascii?Q?F4AsCd4WAM0QtcimsEATO6h3hHEmhIfuhc9JkQ2r3EQZtEw//AJkKxgZWZQF?=
 =?us-ascii?Q?8GRVXOGmDgAsMTqdbDKUvVaOjlNe3a/lFOKqg0s38KMDIyEw0UWe73ubnK7+?=
 =?us-ascii?Q?TtnqBXwhiWIFhqzhx8Pgir7Seq4AUcJqRCLFxjZ+7uft0xRKKcSGH33zMNzu?=
 =?us-ascii?Q?tcJru1vEvvez+vD9y5UhUZlIsE56P+D1U2IXn5ZIf3n50T3V8tZDBxwQ/BH/?=
 =?us-ascii?Q?fMo2x09CQWq20bKx+LdyOZ4FKBXOvXiPDRa1OajgvGw8K63OxFIpVmtAApnc?=
 =?us-ascii?Q?bkfekQyyWByW7S7nb4UqSglk6dcFFvzETYoFCr87AVLXwl6wmzE06eyNXGbE?=
 =?us-ascii?Q?EeSpubNOokob0M1sxhocOhT8eU+fC2YjNj4v7nyTaZ1xFX4fxSBbuCfP7ewc?=
 =?us-ascii?Q?U2nwEwSf/CuqXwKmO0ECvIrRDSSzYWZHBQnf8ejb7ngDIeX58fAg95dDkuHH?=
 =?us-ascii?Q?bicewx7TS9p0EaS5n1r5d6/S0JgFj0+BmQEogWbG9w3DT+LcW1Ti2Quto/Wb?=
 =?us-ascii?Q?wcunx2ITOzdx5h73Ww0HWrmuKN7UqFLGul/elIbpXaN99jQ/C9Ads06txx+m?=
 =?us-ascii?Q?JzEmwRdAw5FLD+RLSRZZ+3cUK077p7s69r04idW8I3zjGVSHQd6MP9kOuiJv?=
 =?us-ascii?Q?Dhxu9GJ6IZ/iUurbUPz52hI7rDFc+gURoWnMNgcj5NXSX9f8lPpDvKb4t+Nu?=
 =?us-ascii?Q?aTPh3P5yGvo2fCvXvHLDTHS2Akca4DIiLHNsSSadE9VZYcGo8/JjzrBshDAK?=
 =?us-ascii?Q?5A=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	nKPR2uqnBw9Z/am3bh9ZB84/gj6VjIbfgEk+WYDX9tOMvgbYzHom7s1cNHDPnahMqBXec+oc1Ociw/tDgIdaKQp1ksLnWCxOeBslUoLummyZ7CWHH71Cz87PtvDnlA5mB41yYPGE7NRnKSmOqcSTW6ynGwhDvQLt6JDZWEb830jypCn49t8PeGjPQPyEXFHqokt42Dt0iV0bYNvrLJnj697YR1F4W+Jw+26RCbu7OgOQDntds0QvVV4Lt9/z7XfMW0Qd6ITUVc8sCkYiQmxM7w24/UzN1SQBCyn3gg6HakFVRy1QdT7Oyih8Rrbd0XqYq7SzKrWTBLWJY/lX6wejsyQKbqWQNo7xTt4+E3gL9KWum2dL8WO37xUHrBikRc4cEfYez/btzzSvjZffsYtaKJxlff8zv59NsAYFWb+Z7ntQVCaB10dL7zSlZ5+eHJfqFW8KshnSADZPVhAL4H8WikPdFS3tnj7a+alCfsieKHdQliSPdpKgnOv0yP5RCbOi5NaGYXYbbEsBTdhypEKDN1Z/xJrLFvEGIZpyNbB4eMZuS6X0BzqvULxbuPYuepmca+r19haLkXbv5lkO9fIRcFpEbhgUkhv0gZ0sN5mM8ak=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b88a1acb-8f27-407f-42cb-08ddadb9fe7a
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2025 16:14:10.7499
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: isF8jRo9vmASAbWBWBfSH8RC1eAwjdt6Y71dP/qJE1ALSkFHvyey3Es8tXse4w8gTmo+343J5fmMU43uCQlXUS4o7/fSwKExwdiCLK365v8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB5836
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-17_07,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 mlxlogscore=999 mlxscore=0
 spamscore=0 malwarescore=0 adultscore=0 phishscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2506170128
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE3MDEyOCBTYWx0ZWRfX6kCXKFnokM7g qbax7I8AAT8TMoDYDwPDssAaAhO+aeHSSnBVDJ8OuvwnJYRvLFWql0fPblLIMTntGiHs9DpTYg9 5IhzvJaDDIswO7hp83sLy6U11zc84l5/CMWSTXQuKqgFCrjtxM/L3/9kebGbyXYreWbjbtP6qPk
 Au0Fpb2EgagvfptaCFQ8XvQb0vXyD7xOjP2aABY+nwyf0bXV67I4R6L+ZxrGdPcgMIw4P/IB+W0 cXjaiFN3ksz87KxmhvpJGObWluEJaOBAkfN8WTfUcZ7FxwJsjDxLRYw3KGWogJDXFk7+xPbkgtU spGEdJRY/Bd5BeotsGHzIXo4uvdClNnAXDGi0NWGVvoWJXbGFwda83WEzJFuKqhPSkpZ+TYIVBu
 q+xzxXIPApGyQjXqKDWoDJzDaNxBfZn/JCtQAzmvIoYnSkFWHi8s71RYto6XbWuQvZFCfEJr
X-Proofpoint-GUID: UpMfQtCCoMk4KtyGJW2TFLmqH8O96jlU
X-Proofpoint-ORIG-GUID: UpMfQtCCoMk4KtyGJW2TFLmqH8O96jlU
X-Authority-Analysis: v=2.4 cv=dvLbC0g4 c=1 sm=1 tr=0 ts=68519456 b=1 cx=c_pps a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=1XWaLZrsAAAA:8 a=SRrdq9N9AAAA:8 a=37rDS-QxAAAA:8 a=T2RO4df3Cf9O6CGTc-EA:9 a=ZXulRonScM0A:10 a=k1Nq6YrhK2t884LQW06G:22

These files seem best suited to shmem.

Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
---
 MAINTAINERS | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 08045f9efadd..eda30a41e5ad 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -15735,7 +15735,6 @@ F:	Documentation/admin-guide/mm/
 F:	Documentation/mm/
 F:	include/linux/gfp.h
 F:	include/linux/gfp_types.h
-F:	include/linux/memfd.h
 F:	include/linux/memory_hotplug.h
 F:	include/linux/memory-tiers.h
 F:	include/linux/mempolicy.h
@@ -25041,8 +25040,11 @@ M:	Hugh Dickins <hughd@google.com>
 R:	Baolin Wang <baolin.wang@linux.alibaba.com>
 L:	linux-mm@kvack.org
 S:	Maintained
+F:	include/linux/memfd.h
 F:	include/linux/shmem_fs.h
+F:	mm/memfd.c
 F:	mm/shmem.c
+F:	mm/shmem_quota.c
 
 TOMOYO SECURITY MODULE
 M:	Kentaro Takeda <takedakn@nttdata.co.jp>
-- 
2.49.0

