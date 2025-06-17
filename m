Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9464D2E06C8
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 12:48:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750164522; cv=fail; b=LDH5J+KXeOMZ8mb2fUB2S3g9YYgvssjtQd/wg4y684MgdPpbQ1hcLfwRktQRcnD/8eSA51V6jHBxbAK9BP5QEMRF1GZAYhjp65XM7JCw/fzfJ2UiPu+Ov0Ablh513yMOW07zaJ1qO1flJjICwgyKAtEQ9mtiy2olcf0Aask7aUI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750164522; c=relaxed/simple;
	bh=aBtT9P13rzGz272waLvtWCs6WN28MP8rrEcA2PHTPSA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=ggT0uVi+hCICB4m7qVMSAGbHIWmFlAlHovVQeteCj28zQCoQKOrj7IRaWfuzCJjGbb3SAlIATq3ByQxGnlYgMmtXWPZ+YeTX6e5zk/J09TEq1lNPWzrmLsZY0WrKgZ2ZGnkCLzRroo4YS8HI4xOs/YFLu6/w/6KARMtCH4qSpBs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=qu4fM+YP; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=SpIrsG90; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="qu4fM+YP";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="SpIrsG90"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55H8twxU023672;
	Tue, 17 Jun 2025 12:47:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=aBtT9P13rzGz272waL
	vtWCs6WN28MP8rrEcA2PHTPSA=; b=qu4fM+YPletA7OVNhenxzeo1PWjSFtNBAV
	EFp+o4rUxlbcwXn89fmxSUqmJyUpdq0PD+rmGh3Et1ouFwYqZPECgfW15Dbn4zg7
	1JeSsFxI4Qx2UnypsI28F7BOyubccQWr5d6LEit4dd8g76Mucqt/RMqZ1qfqJEdW
	2mzz5iDGdxkdbOqMP0HhahsoUJiVuFrA292Ijx4XnXGDdVTUQJxWgsQvoa9oqpNG
	Zxw1C7GKt2+5zoEyDjFsME4und1dr5XO7hCzuu1lu0iowScuYQdYifZO+A4AwIgC
	UlMglC1v9zb8T21ow4lXfXY322A5NqD3nad8IP7pwS0kPQJt8QbA==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 478yp4n8hh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 17 Jun 2025 12:47:47 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55HChVUw035100;
	Tue, 17 Jun 2025 12:47:46 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10on2043.outbound.protection.outlook.com [40.107.93.43])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 478yh8xnyj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 17 Jun 2025 12:47:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sead4wa3T2cH4ZXZx3EUH40QuP5dDSjVDA1saFdfCCca7Gv5v7OSeSM09KRFZfieWQWyFVSR3fGzMiCiaFA72+3JKvo5uvVn08N2xAVRtS7uobPvvAql+TVx1iERahd586UHfWZv1eTihkQp+xTypq6OXS2eKjZuS5V7H+jd0rx2gmVnule5PnAp4vzvRFpBRfMKuMEtMZb0H8+liAUqwINUkQkz0ULPzRVblORjDbvUMkTM7badA4JOXJw0zTfn4Gcq0vdmo5Y5sn2XtKdFrjF7gS6XZ/vMG8io89FcArj3kgWTmIflvmSmC09p72GTPUBGVfweB/mPXYYewaMhBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aBtT9P13rzGz272waLvtWCs6WN28MP8rrEcA2PHTPSA=;
 b=qVpG9HZ7SiKdMsatWgBrJMLxor0h9fj4Y8AwPXrlFwc4ulsclht50VZCGbrfyPp16Znjd1gfNHeW0ZXXLac5R2fyYYBOS0yDeIAgCUyNNX7ix8ujUQmeaS5uqUGz6aL58zo+MyZo2Oj1BeA9+m0RJsGu3ey48l4geiL1Kdy9jnG9dgzLGalp8OMw9FmYTlKwnufevQM1L0LAbj31h6HrTsrvSf6f6ibybdazsy2XiaHYJVaHTdIuBw9AsEM3pmJjB+OKwe7FBmfXtAzEqTT9Of4Mg0/ym/5HNzOfb3/bn9pjtlRQN6pXxTgabivoXhs7o3zWpd8Xvc7D3Bclz/SFmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aBtT9P13rzGz272waLvtWCs6WN28MP8rrEcA2PHTPSA=;
 b=SpIrsG90Aige1aH3H/lGeyVAAXw4aRfxS4qWg5l4FdDGgykK88mY2vLbNqrp25Ht4sHkdM2XfmehvDHF4NPF1iV9c7fmE1OCuyNfZ2UhEpPgRhBMbp1RJyb906CSduxktvyLRAjX5B7PJsgtwvAnk6Z4GkJfxuyDhaG8tESH5T4=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by DS7PR10MB5007.namprd10.prod.outlook.com (2603:10b6:5:3ab::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Tue, 17 Jun
 2025 12:47:41 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%6]) with mapi id 15.20.8835.026; Tue, 17 Jun 2025
 12:47:41 +0000
Date: Tue, 17 Jun 2025 13:47:39 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: David Hildenbrand <david@redhat.com>
Cc: Pedro Falcato <pfalcato@suse.de>,
        Andrew Morton <akpm@linux-foundation.org>,
        Vlastimil Babka <vbabka@suse.cz>, Jann Horn <jannh@google.com>,
        "Liam R . Howlett" <Liam.Howlett@oracle.com>,
        Suren Baghdasaryan <surenb@google.com>,
        Matthew Wilcox <willy@infradead.org>, Rik van Riel <riel@surriel.com>,
        Harry Yoo <harry.yoo@oracle.com>, Zi Yan <ziy@nvidia.com>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        Nico Pache <npache@redhat.com>, Ryan Roberts <ryan.roberts@arm.com>,
        Dev Jain <dev.jain@arm.com>, Jakub Matena <matenajakub@gmail.com>,
        Wei Yang <richard.weiyang@gmail.com>, Barry Song <baohua@kernel.org>,
        linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 00/11] mm/mremap: introduce more mergeable mremap via
 MREMAP_RELOCATE_ANON
Message-ID: <93528cdf-93d1-4931-b668-51c9fb29d73c@lucifer.local>
References: <cover.1749473726.git.lorenzo.stoakes@oracle.com>
 <7e51e1e2-7272-48d5-9457-40ab87ad7694@redhat.com>
 <b65dd020-5e02-4863-8994-def576e3d3dd@redhat.com>
 <76zi626uk53dtfzmezzt6cfz45ansam2gpcumddqxnipnw5jkh@qwfzoxgi255b>
 <68d8c7ad-aea0-4556-be63-9b67d70e4386@redhat.com>
 <58560256-58da-4fa6-a953-d2c4695ffba8@lucifer.local>
 <f86c4211-fa9c-43a4-b60a-4fc563fd4d61@redhat.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f86c4211-fa9c-43a4-b60a-4fc563fd4d61@redhat.com>
X-ClientProxiedBy: LO4P265CA0093.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2bc::18) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|DS7PR10MB5007:EE_
X-MS-Office365-Filtering-Correlation-Id: 1c09c398-9d7e-430c-551e-08ddad9d2627
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?3hDeUto9qzsIyoHagTCQyG0olW+Dd2HQRhTKQWvI5xRe6K3NxeKuFab7gmol?=
 =?us-ascii?Q?oBfmrW0wkVFCWjbn3WwnWUX4h9Y4vOL1yWRaTMKpuJC393fraPBtUD6K/bxM?=
 =?us-ascii?Q?IpXLZK8tSohnwrdTd4TIb43vGGU+I3wsq1zCO7e5HqR/9827ibNbuBKTHEms?=
 =?us-ascii?Q?o0FFTPueKPf7tb8r454uEH/Skwu11rVqYi1myirhRp1o2KGCUEvwotAqwlWQ?=
 =?us-ascii?Q?Y+TWqPkKJpdthqX/hmdQSYc1fK7VLUt2Eg2r9aVSnDodyTAGE2FsSbpc8cvz?=
 =?us-ascii?Q?epVkfeBra+xCGguseWsp8zAss70fPRI+nOLf/u0jPQWSmvITkEWJlflJJjyi?=
 =?us-ascii?Q?hqWYTQ1of99QgKzTQZaVsWkrh3ICuxbfBWMrM5EMym/TKITYb+PoYJUAmA3f?=
 =?us-ascii?Q?cflX6nlor8UxMQSPUsmFfieWzEPRADcM5ZBXca+/1c/mozN8HYf1+8mvTO7Y?=
 =?us-ascii?Q?zOOiPnRlf0bNzpGDaE7alF2rneOkdjo9DiAaTCH6n0lunGpuYjRybQj7GNZa?=
 =?us-ascii?Q?nIOWkaqcMP/c6IBuwJHVcU5nYGYKXbiusR/sbLoPKIPJQz8kXtbP7qtsF0dx?=
 =?us-ascii?Q?pwgye8YLqMuKYIz30KijShnUFahI83RqRRPnnOIO/ikM8MX93SaJxf46AjM0?=
 =?us-ascii?Q?uZ5lR7bg540zH4Bnl93AlrzDKT01BwIp+7uraUcSdhNk3yLA83kBLnryaq2R?=
 =?us-ascii?Q?Y2KEpYrMyp5eCy0cpE++0WgIh/cn2zjxm/Yu+BJttyILN3YRvfHGR4GetahV?=
 =?us-ascii?Q?2o9WxX93pzOiuMleXbmHuX5qSHonz5RTF8fcGBewowk4pT7gHt6ZJIf9xHDT?=
 =?us-ascii?Q?4ykPJaYYJXyp6ZQCzSDTbo7s/NsBsuWhet8HM0HP+8R3sVUV+Ty6bdTQD5gW?=
 =?us-ascii?Q?w0+96prdrCWCiDzaT+U3V2yppMusA9ZHlBnyGvHhuMVSmNdU/PdKR9k/CBLc?=
 =?us-ascii?Q?aCShANUsbQRwciLzbiHtOmYTm7joKs+iF5JLcxWHhpi7veMh7gRoiU+Dy3GY?=
 =?us-ascii?Q?YXDPylIrnpX4UXWqcibtSGhlc5iGGqaglGXmUTwMHBBgoJtVDRQwwF4eau4Z?=
 =?us-ascii?Q?/yyw03+Bwz5MP1CDOryTg7hdgs56Pv3jdHYw4033ihnKulXV8nSlGJw+Jwd0?=
 =?us-ascii?Q?cb8c/WcjDWG+oQM6wXRCxTjr4x+zJ4OMXYcEFnOEv0N9VspISvdIF1fQ/hZG?=
 =?us-ascii?Q?/eiIdubmKX7fp4sPmwVonRMh4vPqaYDTI2Em3FE3LA8LXYXQMq99u/M5MJfy?=
 =?us-ascii?Q?niL+4nnw5nN0CmcSgGDwKkKaFA6nw93TRtiTUqD6ZDrQgZ810oZWoq1upfKD?=
 =?us-ascii?Q?gySEExp1l/D++5AjC8qK0E8Jw/OvQBBWs4RtwiwSkMDmZl6nCbSXn0e9NcLk?=
 =?us-ascii?Q?Ahczz7yPh/+f5dPfWCkgbO1/EfUqCqlKJn0D67XMhOnP/0wcgA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?S75+zgrMaFYjIlxZ03TMRda7V6Ykz2iHwItSr4BFij4nsBlMwKP1R0YmPbS/?=
 =?us-ascii?Q?LkFPgDrZn0ZbNazpKzAVdTzQhN5Qr9BeB7kcu2I6wSZaD2+iRoSwUYZoIzp3?=
 =?us-ascii?Q?q9D0FhAgk64nFvua4LOIPGsyB82ts5J0piGC/LW98hqHgl0qyoRsBl34l8p8?=
 =?us-ascii?Q?ajehAmgOGmHbP6m8GkxHTjlAXEPCNRf62gSoQH2CNEBTAFlAPyAwr6E+gW4K?=
 =?us-ascii?Q?jNlVNrbp8VaVNcRXUnywBbkBkwliROieVLuxD8gFGkFkkftbd1B8+aSt/MnM?=
 =?us-ascii?Q?Cd9kIqlKlQS0ZWHrvEv/8rIOiQkzi6ebcKFhDKydn9HRnb65nWCOou8jkiSF?=
 =?us-ascii?Q?elMstOX4nlT7k8Qm3nFtmK40zTJRZ23mqRCjiq2pdEWNZHo4KKQYODsRsYUC?=
 =?us-ascii?Q?0nQ9D3fBCe7SjMEZQL8wiciZdd4oyNS0y5qBjHNCM8MpOY0nQV7CXbIjTfES?=
 =?us-ascii?Q?VZkw0DmEjbFj5ThKSuZZJ6kZb4OJdernCK6nAqNtGknoo8hZEzGOq4e475/e?=
 =?us-ascii?Q?6JzTathKPvnaWEsLALOTXj8t/7SyINKMUMF3Lkf92SR3xYyFAA5itcJVLAtI?=
 =?us-ascii?Q?z1AQCORLHYtdxb0L6tELXhLH4JnThmx6+08tWV36x1TIYVa8GrbcdV18hvZG?=
 =?us-ascii?Q?FuuIhdL82nvX7NqIcNcVthKd7wKVnlqxNQJIy01IHmAWNM7+mAYL7fGzCP/p?=
 =?us-ascii?Q?15dNk4JfoKvnNLT6dlohQJUsRVTtNlapTVEl8EPKQdC4NhtvQ5UT7tD+2wvk?=
 =?us-ascii?Q?fDl2AjZX1OIpdkRULK9PBQSrfRpDkBKtkaGmrCFjPBb5zOhwP9c8Woa46RpE?=
 =?us-ascii?Q?vkKyzETeqp5jXU5TEEDt5+lx+idAG0EIUl4kkas7cryaWreuLdJOIKPzcG+u?=
 =?us-ascii?Q?Yv1e9DgE2On7taoYlp+gEIV1fKM+QkBrFgutbQ+89yLwUrMGp6YXDCsGHbWS?=
 =?us-ascii?Q?h9Ww4zBmafkJ/f43fPyAxayA7Tq922xSqZhPEUb+4uPhzg5azBjLCjZYtWKp?=
 =?us-ascii?Q?oMF6GsEBig3WRajWiKnnHaamNDarH7Ey9hwrbmxDgNepwWX4WqkSN80SGKaz?=
 =?us-ascii?Q?MDYVxnmVRTqEa4ogYiFeObg4ta2rsU4w//Xx1VDK5RWv1hGlVntnq0rw9bkl?=
 =?us-ascii?Q?w09KC5b/McLE+J1vNusW/4e/+fuFhWhlssm7ptcQCfg/cA963NepI3ekL7hU?=
 =?us-ascii?Q?5yJGb2zvDdEB5rq5r53SOxx1kY40HRjOA8SOuObSP8g6i2mIRB+YFssu072V?=
 =?us-ascii?Q?3gERgLYJeLx1fB6egnZO5WNwEZM6AzCnX5E8pSe4gelp5KePpDkC+B1uGgyo?=
 =?us-ascii?Q?AVFctuuh+LUQthW8ig9++wnpgCGjT5feU/cpBStLmhnuZv+2+mJlZITFu984?=
 =?us-ascii?Q?dF++HL3haDSdDCn/4PNY2rVqK6dKzvFGkL0ckgEj3lxP5pFHlVreLSsR1R5F?=
 =?us-ascii?Q?8fobXQRUShKsoPSQBGh5gZhPVj366XsKyVJ+yhcYJr91cILAAJf1f+hCanWB?=
 =?us-ascii?Q?hXoO3lDBjRT/hIeVoOLP/GCl2BstdsdnzQ2enFU9wEi6frDxU5d679yiLCD/?=
 =?us-ascii?Q?WWZ4bKvsV9I9a0+7keLIehSpv6Yag2Fpo3cfrhVmrmR8EYIPQnwydGBHVSH8?=
 =?us-ascii?Q?lw=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	haAD5FuZQz8L74OcneIxFJUZFf4+IvgBVR6ZfNu+LVhrazhXyEPvgybu7NXiKUsGXxDwlB2eQsc/ON9GwWNVW4UyevjCmUcNRF0rz63SwFy9ifb7krCspq4cH7n+8BWCL1wMHWebR37WxkvjS6dSpIfBIlvM2RwS8WT38o0bVDRTKuCtRHMb87a6fmFpPM//wLyAzmG5cIcHEec2uchwhsx28lu0PJZ0nKb5fMEIf1/kcZpYQSK+CYzZcBnIrpGf7kVjC6VIo5eBXS9ukvnldAnAVYBAydapT2uXgWPEyFDjPq/12eONq0d7U2Aw+50zfvBWbIWQCytC1fMR+OekvafD6tYA6uQzdVlJJQ9Gr1sMijULrNhUfTCOHu4Qsgi1u8P5Vhc8Mf4/ztpNsc5Eoplf0tumJxGQsZHM3c5ChjyigijooOc8dHHLJPX4jvgGhs79BOZsMRXpM28iM6MS4k+e3XcWBLD0ASfVD8Z9j8suZDE/gA2Qs3UaLQtIUGced1riaadatmjwYfD17wZoOgWo8YMM0momuhuiOsfkcEhrJVoyd5AzkojwVCRjfGaTO+nOB+Dh/pEHBT8qw2TDwJR42Z18PqUYIg0jwz2BvI4=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c09c398-9d7e-430c-551e-08ddad9d2627
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2025 12:47:41.9003
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3RptridQuy+BvP+oFMJdT7d3PA50ETEo7rZx6fVsrH93QOGKMGnoriEjgD3FCdX7ld+/kf7/snXp0V5MZF54+Ea1OA947TZbvf07sZdW0m0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB5007
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-17_05,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 spamscore=0
 malwarescore=0 adultscore=0 phishscore=0 suspectscore=0 mlxscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2506170101
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE3MDEwMSBTYWx0ZWRfXzusLTquy1ejI 7jyuaqYkui7wIzc/VCoSxS0vWduGZnTY6NZJXAK4qFeE3LFegRBXq9ip7LQJeOEQBLfZvorkQKz Ts2mllNQnqkoPbhdMbLPlhMwpahvu/dgVaBJb15/U/NgCCjPj2Hm3NETVownIzJcYXfh/0k4Wmi
 pz2553vzG2OIGLFRxh1986gHp7LTgT7n4fOFs4zEdhod6Z6lV5Ui6uFqDje2t/inhclbw0yTUAB Vk7Td62ZckhS21meefYPpwQp3p7UjWGg4Z7SGUD1x5bPMvyu64Wyqm/bS3zY/PBC0Fg/I1XuzQ9 Z4sk6/nEmCLtx0u8+yh5tAWdZvuKN4h7eAIPbrS/EcvemeziUl2sA7shJ4YREUJqxi3I5olGmHd
 Wxf1YyIeHXXAYPyfwrmvsgNeARL6eLAWeBUqTqtEW3n5GAfOqH7bTPfZc93wcjuz9DgdnYLk
X-Authority-Analysis: v=2.4 cv=K5EiHzWI c=1 sm=1 tr=0 ts=685163f3 cx=c_pps a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=K1PO1kuyM94JsJ6F1mQA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-GUID: 8nZ3kGjtL295YFIL14ozd99Tq10xqI5b
X-Proofpoint-ORIG-GUID: 8nZ3kGjtL295YFIL14ozd99Tq10xqI5b

On Tue, Jun 17, 2025 at 01:58:59PM +0200, David Hildenbrand wrote:
> On 17.06.25 12:57, Lorenzo Stoakes wrote:
> > On Tue, Jun 17, 2025 at 10:45:53AM +0200, David Hildenbrand wrote:
> > > mremap() is already an expensive operation ... so I think we need a pretty
> > > convincing case to make this configurable by the user at all for each
> > > individual mremap() invocation.
> >
> > My measurements suggest, unless you hit a very unfortunate case of -huge
> > faulted in range all mapped PTE- that the work involved is not all that
> > much more substantial in terms of order of magnitude than a normal mremap()
> > operation.
>
> Which means we could at least try without such a flag.
>
> Regarding MREMAP_MUST_RELOCATE_ANON, I absolutely hate it.

Ack this isn't life or death we can drop it.

>
> I'll reply to your comment to my other mail once I get to it.

Thanks!

I know this is a gnarly series so appreciate you (and Harry of course!) looking.

>
> Users that really care (testing) could figure out if merging worked by
> looking at /proc/. Other users ... no idea what they are even supposed to do
> in that case. Not mremap()? But what is the use case ...
>
> If the "not merged" case would be relevant, a workaround would be ...
> mremapping it simply back?

True true.

>
> So if we can, let's just try without any of these flags first.

Ack.

>
> MREMAP_MUST_RELOCATE_ANON could always be added later on top, once the use
> case for it is clear. Removing it from this series would not make this
> series any less valuable I think.

Sure.

>
> (and of course, doing it without any flags will make this series much more
> valuable :P )

Yeah, I'd prefer this overall if possible...

>
> --
> Cheers,
>
> David / dhildenb
>
>

Thinking of undo, here's an idea:

1. increment refcount on folio
2. isolate from LRU
3. Add to linked list

Do this for all folios.

Then if we encounter a problem we can simply walk the list + fixup, drop
refcount, re-add to LRU.

It's ugly, but it guarantees we can undo what we set?
