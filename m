Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 935E317588
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 00:05:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748304327; cv=fail; b=qY0V5PL1F9rjOrwM7Clgb5BKLQ4jKYgCP9/a/svRWl27+U2WEUVQ7DGJGdLEkyJ4U5ntDgg2E0JOq6jzixFng6etHQF5rVSdAQDNmIx4MUWyBKDre3YPC6loZJN8xWvPIS6RBRrV1bCRNN0oz267VRa74lDtvd6IJuIHeec9GmY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748304327; c=relaxed/simple;
	bh=5UQUmPawfDHvNq8Kquya2j+zGcCkadklg0BjG+7pPPc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=qT2Uo2gUadKFYd+kENISWrcHPC3LP1ydkZwVJ3u0oC3D7dqkTQeHVY0eP4KxZ8u7nflstw1UHUaa5htRq3UAQi2kIXqXbPGZjNwpXmupEWAZ/Bdia4ccoBw4WZjv8qAdJ1nJYSmBqNij/fRSB1IOfiOeunK8Z5yShh4fNb5pivQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Q14VCb30; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=lnA1C2or; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Q14VCb30";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="lnA1C2or"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54QNDGLR021016;
	Tue, 27 May 2025 00:05:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=7/gG7Ww9W8SidKBkog
	50hB1S1HSpVcKIxqHtwEQ4hPA=; b=Q14VCb30tq2cZo0TVqyqA5kU/I1aY8cOTz
	89E0UqtnitF0R0WPtV1oSWSkgWOzBf2fNLFUx6YciM2a4twpMkO0qPLXzgAt7sTd
	q6tgnspuAIqHNo/wcgvssv5sEd7OoovNvmYVbN6tmuw9I6EC3VzPsPj50lMspAUw
	nFp7zxfUw07q27ViJ5MuWtfIIvtEzRLU3M3ihNhllG+gllILz80GzXA96v7Vd5Ro
	nUAaz5jrlzC3mIc+MmQgRkjqXd47NurG8l8Yh+mmsP4/R6eRZsYDDUwyr8BHDwqL
	ZnasMalQNJaLmWjIaylBNPYLTn0J5o60X/Z4PG9yIjWacK4xaSgA==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 46v46tt0a2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 27 May 2025 00:05:12 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 54QK1nUo027817;
	Tue, 27 May 2025 00:05:12 GMT
Received: from sj2pr03cu002.outbound.protection.outlook.com (mail-westusazon11013019.outbound.protection.outlook.com [52.101.44.19])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 46u4j87vfw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 27 May 2025 00:05:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z0MV6n1IdOONG8nRopXGomk0zZiAiASFEgT4VqdrXf9v/oArgTKAhg1tcLpHA0ytgk/dmRf7MuDnCwrLQhAjbg6OqTLzwG+kuQC5qRUQm9NG5qYgt1fO5d58pYh+fQY4vAugI6C1pWtRDHB6Tf2/IwT+Q+wHkW83azfwj5IhL+oLonM0FnTSosHnNvfqYGw1I17khh93PMEsIN9HO135QzTc9h2OnyoPeLZM7AGtUyDeeHWBPxc8bBP3mudIGMZJOUoflQWjnJBMJfynsuRA+bRWHG2QVhGcTNmINJyeAZSlgdFXdaLy9aVgOh2DQcOMRBSD4VNdBUbS2/qMHj3Bzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7/gG7Ww9W8SidKBkog50hB1S1HSpVcKIxqHtwEQ4hPA=;
 b=LT08JVfc5tuDoL6Zu6vTV9chYJoqtKGBGzAArPmt7Bd9DamXlMwsqtWAM+WBU/sYMEv7Gn7yej6pAkMC6ijf5UzriPr0roAhbU8pU4LvNRrbSLsKlNztkIVs5MvdYMfYiTWev1lhMd01O6BIOBYARWAYYhJLf2oP+exfl0OxSpIEc/UMQU6s6PCQZXHf7HGtLCYw6766Yc1wNj/Y+FUrHjdN/SmXeN2vEdCfePNuqV1tCcdtx1tIAXwHdIhU/0ae/XIcFdFX5nbPLdVzXgSnPgT5mIN3Flfpbf5umEVMHKZLW+FDQpAPNUOLwlSunPkQVFae9PBbKjl5YW6FPbJeDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7/gG7Ww9W8SidKBkog50hB1S1HSpVcKIxqHtwEQ4hPA=;
 b=lnA1C2orQRdst7LnPii0G28+aRse3qCbAXcE1e+GBy7bG+8SHQJnqnKU7cWY/MTszXsQq+lHRi+FIPACoVRGYcmi/QkQVJXUj9wRjyUGJEYNu/pYI46q89uXZnhHOEa/stN9QxLJRn5gSB6uMlUejXPVqE0PyfQNNP0bdhaw0MQ=
Received: from CH3PR10MB7329.namprd10.prod.outlook.com (2603:10b6:610:12c::16)
 by CH2PR10MB4247.namprd10.prod.outlook.com (2603:10b6:610:7a::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.40; Tue, 27 May
 2025 00:05:10 +0000
Received: from CH3PR10MB7329.namprd10.prod.outlook.com
 ([fe80::f238:6143:104c:da23]) by CH3PR10MB7329.namprd10.prod.outlook.com
 ([fe80::f238:6143:104c:da23%4]) with mapi id 15.20.8746.031; Tue, 27 May 2025
 00:05:09 +0000
Date: Tue, 27 May 2025 09:04:58 +0900
From: Harry Yoo <harry.yoo@oracle.com>
To: Xianying Wang <wangxianying546@gmail.com>
Cc: akpm@linux-foundation.org, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org
Subject: Re: [BUG] BUG: scheduling while atomic in throttle_direct_reclaim
Message-ID: <aDUBqusF_ROpiuNv@hyeyoo>
References: <CAOU40uDrsJH2562F4FdxEatGmxRyX0anmFiXN97+gOKDqAHmbA@mail.gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAOU40uDrsJH2562F4FdxEatGmxRyX0anmFiXN97+gOKDqAHmbA@mail.gmail.com>
X-ClientProxiedBy: SL2P216CA0134.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:1::13) To CH3PR10MB7329.namprd10.prod.outlook.com
 (2603:10b6:610:12c::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR10MB7329:EE_|CH2PR10MB4247:EE_
X-MS-Office365-Filtering-Correlation-Id: fe580eb9-e053-4901-9184-08dd9cb2249f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?GsgGNzmjs8pzWuZ8mUhMrCNjHudNRBHbVC59zocX/Gxd6CM5uB28yOsIlX6s?=
 =?us-ascii?Q?XPlSZqY6Dsa/SdN0/Q29pcRIiGy7Xztk8o2spyqioGLE335FZy3WC93YE0cv?=
 =?us-ascii?Q?TwENO9o/Ug/aY3FTlfVB8d6QDGBEPGG/xFPNUbjw0W0lpiyQwnAbMZfWTCV5?=
 =?us-ascii?Q?KoDulXNQ78NkyMs8AzZZGAvjFM9URUOcc5dq9zkgXjPzwbAtOPFHNoRixPzn?=
 =?us-ascii?Q?BFsz9890E+a0ClL79prGSHVzeKTJbKclefZYiQT6zxZ5fOtd7u7EpzqoAF8D?=
 =?us-ascii?Q?MytCjxrBI7sW6NUbw/QBT7P+IwZ5kk+YJnnMGGeJBwYvyCuxnHSUs3caLdMx?=
 =?us-ascii?Q?fZq+lvKgcZSknsuXw5Cx0qq4NAF+l17OaTrI6aDkcUec3WGNwPRuDFJkpl3+?=
 =?us-ascii?Q?LvKSyBJoxxzPmM8pEfadJmV2IUt8pdHvx0aTXOmbmbDZF7TGrlRpN98hOdjP?=
 =?us-ascii?Q?aWRgWSktK1Bd6zNmnaJS5aNu1g3s+iPl8GgzAydaZut/EJumQvOT/hSi59BE?=
 =?us-ascii?Q?GV3yv7w+g8tgOg3mjI2jPP+vHqkWJ6hQJeWP1PuM87bEnauvnQAdKkAxAuCq?=
 =?us-ascii?Q?V+yH+PGmREUL/YBpDPHp3AKSK9g3p6ovni/1GW6PEHQF54z2wMpnvzgMtl5Z?=
 =?us-ascii?Q?SwjeTGQlOfAiKmq/WH+hgIxMrm5ThP62lcQjKvRzKgSKBhP8S76IEITK7fqe?=
 =?us-ascii?Q?NqQJrf2ebSkPUESSA4MACdk/axQXAh+RiK7nFqBPOzJfb3A8BXJgXw11X/xB?=
 =?us-ascii?Q?qIDpZsOhODjxzumszVRyc4kBYaFrvmk/1mt/AqI6yiExE4V2rweX2RIJk5Cm?=
 =?us-ascii?Q?nS3hWyPo7xP5MbytxKxXqncji5JupUT3diRvHY8DBy0+3/FeV12nRC1vus7a?=
 =?us-ascii?Q?vvi3Lj3q2ypeF92IzzhqlIoOGatxtPDChU0tRA5jG9JDpgi+DSR5HIgB+eh7?=
 =?us-ascii?Q?DRQ8lbnCNCsD+cRw6Lquhoo0tO8l70C3UgZzTujrjymi1eFeoeFIsrN73jjz?=
 =?us-ascii?Q?G/2DE5h0HB+3pAuYS/2hcsuaRkp/q+zfBnvsBw1QKc/6kFgVO7SnQibEF2+o?=
 =?us-ascii?Q?HmwAE9q8f90tBOaHoZArAkB8VRTCEBFVOBfvEo1RLvBu2dviQGltXuDTsUQ/?=
 =?us-ascii?Q?ilDSfzEhjwkQ/Jm7x779/UL+lYAKEW3ueG6T6rER+/X3BLuIYQXM0PEvnbhw?=
 =?us-ascii?Q?/FMYLJCerTPXadSIuzBLo3Nn5hLWItHEAxy0jJtSmGkAOBcpK72bgS3BL3I4?=
 =?us-ascii?Q?cxvLusvpaTNOHkWiBP5VkZFQrOw/cIpzO1rdoMRghwuQcQl+9Nb+E2MUpQfz?=
 =?us-ascii?Q?ym2H+oh9+IkeNT0T/Y1YKwzq+OIAiAhs/Vd+wXiU/T5tBJ3IM6tgrlIMtB7M?=
 =?us-ascii?Q?uzI7s9g=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR10MB7329.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?C8j6iohE2ycQ3tvTJT8z07ujZQz81Nnsk197ci5B8hq5hKdDHhs92hJlKgHO?=
 =?us-ascii?Q?dTulE88JTngsTZp4JnIh5kFk/hfMcqP7mXYFTwAWXhvszhnQWMQDkODkPVGD?=
 =?us-ascii?Q?dWYbT811MJMQ9u672fiMUM72J36t9P6mKORCj60k8ya5dx3xfiY2nocOJnZI?=
 =?us-ascii?Q?nYYBQfyxfC0mJ84lGzlJ9rHSA+lcnzwOq1n7bXrSX2XGE/yuysH0cGsYeAIZ?=
 =?us-ascii?Q?0XZxWmgQybFvKh7TOiZUZv6dij1eYon/Vvoeh2A2vQttPq65nhSy6583eWZF?=
 =?us-ascii?Q?7GLp9T8SOn7sBw5E7DpQh054N1gahlIpBy10O1QryM4mGEpAL9+DRmft5rA9?=
 =?us-ascii?Q?FEBXdsBctyGPCXfY5Qxg/PVbLs5CLdZbRWFTn8ApjaN3raexBH/LDPHhr0dg?=
 =?us-ascii?Q?7JZXnF7Bj+tcZyLd7IVmhSNXsMVzzdPvbJgwu8xdmg3dHnwjobA9JSohxQUt?=
 =?us-ascii?Q?sITtaPMSYpDi/meeBWB4F+QLlrOtGBY6Wix/mTE9Guaf6qMqq60WQZaRZaZQ?=
 =?us-ascii?Q?6ernQwUa4JiiiOFZigt5m542yo6tcKz5moycC+8mtCLhitpCz6LlBwbivAbL?=
 =?us-ascii?Q?xQu5SeBXTiq4C0/45Xsxy61qIzsaSPhxj8wnaaQGaW1OhvJZ8XUChAG/5aWk?=
 =?us-ascii?Q?xTmfmKW1YqPqB3F2BdA+6DYY0ItiOt8lxu3mMWTq05yhjM3h6uvibU8JjSwV?=
 =?us-ascii?Q?+xon2rea8av2xFKhTEiDOeO6tODGf9bBHpXHnh2ndYAWhbovpcxiJAWCRlMi?=
 =?us-ascii?Q?ZORoTwLOwksEW+FrUocrwfl8ylKCmMcW9mab5JEHwcTTGMItVAatizwfETrx?=
 =?us-ascii?Q?jF+Ug7w0ruzqxfOFgDDYrLoWnk/F1rX0fPL/nPcCuF1yIHIfF5/aYIop3KX6?=
 =?us-ascii?Q?dAMLwid16lxI786nnLBtuts+CROUjOo9dAvLbiXtT0eFG9pkxN8lnyFW2J4d?=
 =?us-ascii?Q?i2oWSK07gC6dHLAmX0HRxfAizXcUf3xtxWtr2a081KiS0/rljJThhnMDtVXI?=
 =?us-ascii?Q?dAJbglDQ3kKMNmicRi7A84Wp7DKMAOn1l184CE5xtAQWS/UOrRB4r28/qNu5?=
 =?us-ascii?Q?RZSCmSEEq7SKa1Y4bcf60jESamdtWL2lyMnSmIi+pZMGxJCq81pSxehGJKaR?=
 =?us-ascii?Q?4zbQkS7NTpwq0IvMdblSTh6KeooXOl8BGXQ3n/njn4uT/YfiSwqMTweKr/Fu?=
 =?us-ascii?Q?0B1F4RlkjuxuBGq9wD36iuARWTfePg2HLNHG0U9/55IuJ9LQhu5YKKmIRhtq?=
 =?us-ascii?Q?x1MpIHWoaYq7nJQvKsJr3EP6zeZ7+x93LFRSKF5mNVPwVkZPJqafux3uzS7L?=
 =?us-ascii?Q?yKSdkbnE73qGeRBDwJehRj5+vYUmHM5ZYlUIMaviFVdtMVfaCEPOBgnmJ0N+?=
 =?us-ascii?Q?T9eCtj+xCxt5A9otF4XoHiLIy4CxsagRUEDiN9PrNE+2aQPDiyM+Fa7PCHBo?=
 =?us-ascii?Q?8vszW+CVRLR4tyHxuoNUoj/sgIgB5kPHKxmikU1jMbYYeIEo9dWIRyRLuPWj?=
 =?us-ascii?Q?2X4UVzSlXkNF3Yt149tNWTGeC5c4gZCF10fVF9WUR+9+MLr0lKdHOQcKGTfk?=
 =?us-ascii?Q?NZI1Kgl9h4mRU3kqG/bRMkbHJYM5x9L2NdBBhDOV?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	QF5knKJbFty5T2/13YpCz9XdcwDfWj22pK+ilWiObb73JVq8j5LeL8HQA/2oxPmvb64M0aTMBvKYa/mhHjP7UaMLhFnt1sNohsafw0Hz170KQQXlgXwnPyTBL/DiHVfwHq3ueLHedqWdKFw3rD/g5KWg7Wq8kROYsJOGlrwcnCWqVJp8pV566RUyvR4OWXC5d5AZ0ebtZ+6CG7OaoYhwAEV2jSJLoKf6YtAYkfz0fklICNLSYp6bdz2a1iNEmMWcFcI2nsXqOmpDyvTQNOwTyF+pfsbcxHE3abPXrdVJGg6GeLlzV+PPxnRfB1l9yt4guDS3B3+BbnykXn3S+UpdJaV85U/4zZ+azztVTbhkrO0SVukjckgAcVwrM+wTcsrNF/Ark5EfC5gWRy6sToa727UCpLIv+pXgWI6CzYZaQSGi7Rupdj1uBTlTixhbo3HH2Tmoa7My92Z6RNSUTN7Juxc/qS/zvLpnGSgB7NKLNff62ugxK6PIQO3dyvJ3Trrzu+cgEqcvybL7/82WbNmc5dA6QX7ZFgf3Sy2hVwTXq1dBjDFt7LJ7fb9b8q/5EYFQAZhD7LEKKiFinO3E2hYFv3lpxHs6B5wrxruICBsbW8w=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fe580eb9-e053-4901-9184-08dd9cb2249f
X-MS-Exchange-CrossTenant-AuthSource: CH3PR10MB7329.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2025 00:05:09.2977
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zHh8sqwh977xEKkwx8lM9HKQ09D3l67P33jwcOlr15sSeSN25v3vNugtENEvKRsnZGOrR+YpYEZZU/jIUo3ULQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR10MB4247
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-26_11,2025-05-26_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 phishscore=0 suspectscore=0
 adultscore=0 malwarescore=0 bulkscore=0 mlxscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2505260207
X-Proofpoint-GUID: vWW6vG0nExsqG771gZ4t-f8x58OEsIhg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI2MDIwNyBTYWx0ZWRfX9fOcAQD+oiAx yFKXrC3LQBUMIo+j4DmgQkyLcIcMWAcYlehu6qlUk8p/HPijKCSZhJDxtGlHFmXHqj5KQ5j7zQM AZkphyaOVEl+XXtmBCKwDo+uasJgFzk98A9JVCG28xSELqW+x/uizM/oHtWJeFegRVLMAI9z8a1
 OeYt2wCZKvsw7YxJBEgsnbCGXmH1uhlbbCdX8edA8/B+iYv0e6LWtyfSrUZLrrBTN0i6FyMT1Sb bRNGcOIz7rMjMzkFJq9ECiKhcdJe3hEQKT7dmokHQPTH5F8kNI5fPDSzIa4ZMcB2Zq5mqQqkrJT /xNm5hqk4INffAh8ELY4/7y+Yh9fStooDt5xMOVu0nxH5033cM3NPEIqVtfHw/tAt1E6dFbUUwX
 JRcWz5CK6aiKSvmPUikU2rtTrfIfSHem0+t6AUyMOMQy+GjzFJGSEQTB/UlWjrVQ23pVbf2S
X-Authority-Analysis: v=2.4 cv=VskjA/2n c=1 sm=1 tr=0 ts=683501b8 cx=c_pps a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=dt9VzEwgFbYA:10 a=GoEa3M9JfhUA:10 a=VwQbUJbxAAAA:8 a=fGO4tVQLAAAA:8 a=VqJ_wkywoS-UJa71nLwA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-ORIG-GUID: vWW6vG0nExsqG771gZ4t-f8x58OEsIhg

On Mon, May 26, 2025 at 11:49:30PM +0800, Xianying Wang wrote:
> Hi,
> 
> I discovered a kernel crash described as "BUG: scheduling while atomic
> in throttle_direct_reclaim." This issue occurs in the memory reclaim
> path, specifically in the throttle_direct_reclaim function
> (mm/vmscan.c), where the kernel attempts to perform a potentially
> blocking operation (schedule_timeout) while still in an atomic or
> non-preemptible context, leading to an invalid scheduling state and
> triggering __schedule_bug().
> 
> The crash trace shows that this condition can occur when the kernel
> mounts a specially crafted ISO9660 image via syz_mount_image$iso9660.
> During image parsing, the VFS initiates page readahead through
> read_pages, which issues block I/O backed by a loop device. This leads
> to a SCSI read path where scsi_alloc_sgtables
> (drivers/scsi/scsi_lib.c) attempts to allocate memory for a
> scatterlist using mempool_alloc. If memory pressure is present,
> mempool_alloc triggers try_to_free_pages, and subsequently
> throttle_direct_reclaim.
> 
> At this point, the kernel is likely in an atomic context due to
> earlier direct reclaim or preemption disabling within the block layer
> or SCSI stack. As a result, schedule_timeout is not allowed and
> triggers a BUG.
> 
> I recommend reviewing the reclaim context propagation in:
> 
> scsi_alloc_sgtables and sg_alloc_table_chained
> mempool_alloc in SCSI I/O paths
> throttle_direct_reclaim to ensure blocking calls are not made from
> atomic contexts
>
> This can be reproduced on:
> 
> HEAD commit:
> 
> commit e8f897f4afef0031fe618a8e94127a0934896aba

Well, that's Linux v6.8, which is already end of life.
Please DO NOT REPORT bugs from kernels that are past their EOL.

I spent an hour only to realize this had already been fixed.

https://lore.kernel.org/all/20240614143238.60323-1-andrey.konovalov@linux.dev/T/#u

This is KASAN passing incorrect gfp flag to stackdepot, triggering
memory reclamation while mempool is holding a spinlock.

> report: https://pastebin.com/raw/bxuLHCgu
> 
> console output : https://pastebin.com/raw/mCZ4Ap8Q
> 
> kernel config : https://pastebin.com/raw/aJ9rUnhG
> 
> C reproducer : https://pastebin.com/raw/1dku01DG
> 
> Best regards,
> 
> Xianying

-- 
Cheers,
Harry / Hyeonggon
