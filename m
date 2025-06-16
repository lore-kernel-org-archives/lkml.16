Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8A1228983A
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 18:46:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750099585; cv=fail; b=mhrzdI3j7HzJP14pWX1zscp6SzIS5RJevjd3Fp4JuOoKxIr+mNrFVvj201N+uWlr1Bvx1lItKEUgwDE55DPMhyvRjSM3MafN/lBUlADsyU9T1dGGs0TgCbhRWqAVoA5L2IiAW8+QRK2jGPTB+CouKO7lTkJvp/D+6UJLk2+SiME=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750099585; c=relaxed/simple;
	bh=YqUgWY4Q3P3zgwKP9Cop6QnLUCpWgReEh9Gf8C72Rto=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=HBg5IHS1Fq6SFvz31v7/WtE45dagLOMDI22TVYPGGFPzGGlk5YpKO2gGTw5XDNEj/a29XEZ48qOL7IW6+QTauPEzQjM8ShGyqUSrH9w83ve7VNkbFu3JBYaQ6mQSOwOp+xERoOouxtqaOqz9H1MTthFFwfbnpkobMssbpYtZ92s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Bc7cnLYD; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=Fc7rc+Bp; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Bc7cnLYD";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="Fc7rc+Bp"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55GHuTfv017630;
	Mon, 16 Jun 2025 18:45:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=7//9005qb/JQ09AYxIAUYAf0ViWCooK1kSi1j3dUzdA=; b=
	Bc7cnLYDkFtjekFQhcSHUteaU3hJtXqQ8Dcfmrcg2iOrY1ybQsHTVrPV8aEiJcyb
	HHaiV/TEYVHA8nnBeDVa9CBhI7mT3lOibdfCTk517JF54ZYPU+naCwLtT8MoPRdS
	vibHGj0KfcOPNLgIXcEVFWUBs85bn6Gn7TVlRXvIm3mh0CrVc7lismWAz5GzRKCc
	YRGTxSIZZgRDG+ngcC+IDxeJN2qpmbaM/CZMi1Y4kyp5ptpF7uFAdPwxdhip6sVy
	JvNbu7TtUECVbo1RLsdys+lbyzmzOU+wd+xRLZDj5aZ56nU5veUEkse3EFlM92aF
	nouXbBHaZlyksfBwOUbSMw==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 478yp4kjkt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 16 Jun 2025 18:45:58 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55GHONiB025892;
	Mon, 16 Jun 2025 18:45:57 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12on2053.outbound.protection.outlook.com [40.107.244.53])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 478yhej5d0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 16 Jun 2025 18:45:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=THrkJU/gnEJ5stjX53uijfcvbqJxih0F+u2Le8L6K8rxbQYvHWT/84Ft9tbyi9p1thhnpoyAVV1mSaZN5cQq/2nwbaS9zRSmF47cYM72xwEY752rJx4vipxXOD65RB9BwYSz2T2MiWk7d4I66sNwNlg6ckkNd/n75b+0OtsD4klDWSKYTEMuYO3GJlg7/KSL5oreOa+2l1iFGwm2tT5R9zWFEE9/EymGk3JSh9jpXBRh+AF5GIAwUXbJmL2ax3GrP8hVykbYSvJuDXTPjgwDNVFAPSW76X1XWst9awDJozYXVfBl7V8/Z6LvHLdje8ATFb07O7tZ0RUWM9+QpjvdCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7//9005qb/JQ09AYxIAUYAf0ViWCooK1kSi1j3dUzdA=;
 b=rajeLKsMpqIX42CorOe0A8FcjgOJD2V8AyrgDM8XEPgtIF40B5LVcp4X9LUhFgpAnDv1SKAD0sYLLFMqM88Z79BEqDfZid1mVKpnEeBI00oTrfRjc8o1SaU9usEBCjayBqNBxp/h9Q/RvRLTpnko4UGn0rTusDA859lW2SZ4KMUMiAnuxdyyQ/3NPxuQRdWGTghCKY+nyNFrVOyfdekdyJppEPDhub226rbZD6LWxzwXuRUOlMC8damf7nR4PCz8/UgUGgEbxvB24av2harrvdMw67Y9LJAJO4d3L8p1S20f6n6pjtMFOayKsyhiljVX5P3LVTi+/7Fxq5Wsz0n6bg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7//9005qb/JQ09AYxIAUYAf0ViWCooK1kSi1j3dUzdA=;
 b=Fc7rc+Bp8zK3IXGZuuv5pfskjSIvsfQ2rmKZJFJB9VF/muF4v0ujZ7mzdhTckWBYBKTGnIdbt4BPotSTlBWP9ZUBggCwPV6ej6qjwAfZ20wMEefRgfvD3hqYvTvg5ACjeKINmHGgyE1Myuvviw9+tFCviPb3q6/w0F+Rd15Yxxw=
Received: from PH0PR10MB5777.namprd10.prod.outlook.com (2603:10b6:510:128::16)
 by DM4PR10MB6063.namprd10.prod.outlook.com (2603:10b6:8:b9::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.25; Mon, 16 Jun
 2025 18:45:54 +0000
Received: from PH0PR10MB5777.namprd10.prod.outlook.com
 ([fe80::75a8:21cc:f343:f68c]) by PH0PR10MB5777.namprd10.prod.outlook.com
 ([fe80::75a8:21cc:f343:f68c%6]) with mapi id 15.20.8835.027; Mon, 16 Jun 2025
 18:45:54 +0000
From: "Liam R. Howlett" <Liam.Howlett@oracle.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: maple-tree@lists.infradead.org, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org, stable@kernel.org,
        Suren Baghdasaryan <surenb@google.com>,
        Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
        Hailong Liu <hailong.liu@oppo.com>, zhangpeng.00@bytedance.com,
        Steve Kang <Steve.Kang@unisoc.com>,
        Matthew Wilcox <willy@infradead.org>,
        Sidhartha Kumar <sidhartha.kumar@oracle.com>,
        "Liam R. Howlett" <Liam.Howlett@oracle.com>
Subject: [PATCH 3/3] tools/testing/radix-tree: Test maple tree chaining mas_preallocate() calls
Date: Mon, 16 Jun 2025 14:45:21 -0400
Message-ID: <20250616184521.3382795-4-Liam.Howlett@oracle.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250616184521.3382795-1-Liam.Howlett@oracle.com>
References: <20250616184521.3382795-1-Liam.Howlett@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: YT4PR01CA0475.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:d6::12) To PH0PR10MB5777.namprd10.prod.outlook.com
 (2603:10b6:510:128::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR10MB5777:EE_|DM4PR10MB6063:EE_
X-MS-Office365-Filtering-Correlation-Id: 780a3097-c92c-4c3f-ca0b-08ddad06063c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Ml2POzkbW9GCL5jgPPSPWZcdvkk2z8a6j96VeHMW0U/wky/+mUs1KaJMHMLz?=
 =?us-ascii?Q?fxM5D1H5hHPX0efzkOhd6DqpRnGSiVtc7MXHK5WEnGoUTqcy3cVNf6QumgXi?=
 =?us-ascii?Q?WMl2vLWOBOjbKsRpKWfbSaU12Vr8wXA5b377Q8vXDrUZr3fxagl94nPAbW3h?=
 =?us-ascii?Q?/gGfE4jhm3VJt5cvCNEa3t1lc4uN19a2uK9qchTQ8kK1ZiDQBmW75iLPY/Nt?=
 =?us-ascii?Q?QlyxwcRNSjLXf8TMqs66sXF1PG/uFXxLMPyuInKmHV+6H+sLg7o8lTg3DFZL?=
 =?us-ascii?Q?TbK9LV9s6KbEfNWTC/VxtthirGQuZIXH/Sf52X0qccBMIU1WjRyKTDHGVApu?=
 =?us-ascii?Q?x2U9vLFXWGx0EHlsOoOuYP1NA8/vTOX4UkwM6b1SkBifV8/ZF4cqtOREJCAI?=
 =?us-ascii?Q?qwy3fkojlQiWNtQvquYOE/ShoM6b1wg/eMd731394oHAuz9V5N/931LDdFnw?=
 =?us-ascii?Q?QRpjym0eMC9LPb0qNdhSiVi6uT8moEHnfnCR/zuY4YsDRfWnxv60KftAEdfS?=
 =?us-ascii?Q?lnQi9KSCPIgYq/CyaM6WNd81BZMwF+CQH4mMTy5BohZmWSJvPkhe4wusB0eu?=
 =?us-ascii?Q?uBisB/Ukrhl4e2hCtIY/nR8YDYQh2LQafngNxGRJ0wb4BFOHhvJCHu7g2VBa?=
 =?us-ascii?Q?6hbOlHtotQraB6fWWFGcOh7WNM7NXz6F+nfa0zCsjM1X8gyNERnsRNb/Nda9?=
 =?us-ascii?Q?phQWcNULAYNv6WEhSBr1P9h5Jloucbw25z/4LavdZmK+9sI9vxULCSj1Soud?=
 =?us-ascii?Q?nWZibOAZHxReUdBoUDS1gP5R3nnijQTUokmzeBnMYR1Jz7r7v/KusmmOhyC5?=
 =?us-ascii?Q?h3jNHjhROIP103MNXVW0I3Zn+1D19ctjp5xdhGaY7a7uepKq+0lekQgODwkr?=
 =?us-ascii?Q?yZFFxK3/knqbYxV9A4R6qmCqPSuM66Vkb0y0zSVwQdJFv4Ab8+o85g3XNGSX?=
 =?us-ascii?Q?1sBjEzGw9119ZJY1fqr3M804y5fFD1OhyYisWfDBFWA3sKAxbvss47+OtcXT?=
 =?us-ascii?Q?HYVr3bcbaaYEs27rJbnRZDPPMLEdmj/bTGqC/tugIxoq1uwmos1KDu5+gJ1o?=
 =?us-ascii?Q?zU/o9iFow3Q6MLvAoV7qQhQittTgav/idwFn8ZmwkUp3zvD8vWVDR53Iztc6?=
 =?us-ascii?Q?uZA9KIZFsNTQ+H5XRSOtzs0waTh0ikxroSte0RRb5T58FaR4I8r37r8qt2I9?=
 =?us-ascii?Q?djD+fX+ezVuMKTSGSoT6nVpw/oCwpykR5nUSoxpzw5VD2lwbi7FIqPebm2ja?=
 =?us-ascii?Q?pFUG+Jkd/sQcIbusWdotAD2BVnxtR4T+GGOvRpbX0TRgbbMpHQ3FAZ5HRtUb?=
 =?us-ascii?Q?6h5gSkGRZTnSWzLj/cagEhjoouFprub2chVLs7vFJNzVzAvHjaGRjwAsPKod?=
 =?us-ascii?Q?ra0tpj5nrU9ZZY0mclXQFnea8sIVXWl6J33a25Ex/LOHv27tkwU910ggE9Fc?=
 =?us-ascii?Q?E45LePwxnAY=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR10MB5777.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?mtXyEnatckEN7tkNFogh9GatB0/Yb3ZQ4DQZfmjJLxQPrdtsV6NAHqPtrUSP?=
 =?us-ascii?Q?0G/hZMiciHBonUviu4IOZ8ijegVbb4Vn3T1QFbMM4vy256FV+j7mQcsDCJsv?=
 =?us-ascii?Q?B7957fSnbfdGDRmLgAHrzCCxAMbYQQqO5dQrU8vjELjeAtGBLaJ4wiklH40U?=
 =?us-ascii?Q?TGk4sLa7xh0mwIRdhjj9/2JGlCEPylSLXAomfVjho+rUK3hu5a0s44uVAHEn?=
 =?us-ascii?Q?HBGbLbjTzcq9qyyBbukfV5kMr01GNXlCDOqvyU+I6APlWyghwfAFs96V3m/9?=
 =?us-ascii?Q?oiV0Ha/u89UOK41IF/S3p6yTVJcZrA47YdbZjdDLmi+tIAOnrSblVyv87WAo?=
 =?us-ascii?Q?zm41UBxZDEVP2b0Ymgxic4qXjcyX+3InlUou4LPjdHzETFjhdygah5HPoJgG?=
 =?us-ascii?Q?t3zCnBG/j+ETyDnvSoPYpFFItQ/CLpWV5BTg4AXd7V59xuM4W8PMoI1hYXYi?=
 =?us-ascii?Q?F4Vp3f/33UcaSZ5G5mMCL+XwU/FYel+84jMFMXUpLVhW3Q7vU4p5LSts5IFN?=
 =?us-ascii?Q?fgng90R7rBxFvAblgLZfgkyqV9WNJraWcFvcKJsGZnIdyB1IAx2F0yK7K7y2?=
 =?us-ascii?Q?9y0fy1NkqJqLZQPMrpCDvRE6TgPb2dGPiN5S8uXECSHEQPRPZWu6IRHNI1IE?=
 =?us-ascii?Q?NXl/So1ovQ8miPDUJ9Df17UFpYpkEOQ87AB0wRyk1GYzPdNtMLe10gMlqraG?=
 =?us-ascii?Q?U1TmL+6jjRasAEk79kVeazIXdA13NiXxAkkzCnVHeth9DbUdrgz3Mb4REGi1?=
 =?us-ascii?Q?4Y/CfqXL0LN8xLMqoc/uWq8mY3DnspNamsH035wMc2958zm0dc6ODTW5/2OG?=
 =?us-ascii?Q?ZDKgoR6fgZOd/06Ud3nahrksHorCABIx796kX+br2WlbiXCESk0hGQWIn3bS?=
 =?us-ascii?Q?iikR7tBBEavKQdrrDrjb5rjapwevK7f2yywS4r+s+JOCwI69Fiv/sxMPD1e0?=
 =?us-ascii?Q?NEQBe3deVNi92ePhW2SQANaYhW7SGh+LRCjYt1wse1gogg4iTaR35nU/TcyA?=
 =?us-ascii?Q?TmujgzkivRWXEu0N8Nl77Hg1YFKqRilh5eFFANZqIT5tlz/NlgfhWMvpcfA5?=
 =?us-ascii?Q?ou/ZR+LcPGN6IvSyaCKSqnFafJYUPyed0iMdAqWDc5ILdjNdYfbi47hoJ81Y?=
 =?us-ascii?Q?ABTjl4uFal3jTskoNvEcNUi2r+cy+RJL1MRfnjb3JZwj9JkvzCjbyUE9tb2d?=
 =?us-ascii?Q?pPUzfvvg18tAIhpvxsO7mRF4dpXVPPH+0GVSTwIkLxFG4bsEh89TkvtrXBTm?=
 =?us-ascii?Q?glwHAKPCBAWEUI8ukINHW08+k1V7XA/Gxz+Psg5nSFpVEm3M+pAxcaH5XjE1?=
 =?us-ascii?Q?pcH5efMrQJi9SpVM8FhB10ATlgSnfF89ByZ8S0JLsWUd5pmkYfKEIMJRZSlD?=
 =?us-ascii?Q?1l11jOlXYgUmAKNfPmTG/bEO6cJNt+Vv3W3i2lKvKu/Wzn/23ymwMTxCSHyE?=
 =?us-ascii?Q?1PNhYWbEZnj7aC+6GfiVKBmXfTY5yQKG1MtWloh+yaynIduCvHLiE1gCGyiP?=
 =?us-ascii?Q?tEmZG29yNdFC59P6lbLGwsMR06D4cIrFqazZ5Lo2AivrW+gImqKngck+Popp?=
 =?us-ascii?Q?heji2j8OpeaUcEZg8P27+p440aEdExfSxrxqVm4Y?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	pPN32pZXcszlElWIF5CN/dIvK4BB277awEa32cHuaPCvxs/Q2aYqtb3aqAPiMT4E3OKekVrjPx3D2JBokBLWWHkGW6PQQj6ud28Hyt8HYK0yeOjK3kh9Da+1qWPkBU5JI/SXySjmN2GmFH8LJJD04pr62tC9+AsNb/YMWXXx2l1Se3QCPFp+DITN8m2M0zQCPdGKxr/5rNiOekv0TLeauyvo5S+gnSx/fjjgZcrfjncMgTv58J4J6D8N2S+DxkzrseOrzLhZ+1VhNvWebRcnOaW9pwkFGOyrPiwybGzVOLS2jnhhdJJ1DjqkoSZwQVJ8YHKrvRCMpNzwXiSdc0ptG9hr34RMIit0LCd8t5Nu7BpwKT1miaC5BqOzVjpUxSnV58GyvgYmIPD50atfm4g8gxtLDgRN1LFVGwiA0m+s43D4oQv+0dyd4u1yEMZdCHAk4bw/lzDDSxXRneHRMUG3R6Dhf6pXvg6kFZmpjKsZKYgcsjn2KmCh9VeQ4AlhkTaFs1svUgmH0q1gxNKKcZQ67vVg0awp9q+NxzvT7BqIPeJl8M7a09rtfppcYbacXlWnEHzFsA50cN5JdNqzOKF2Oq+rs2O/1a3vtlGM1lMVFmc=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 780a3097-c92c-4c3f-ca0b-08ddad06063c
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB5777.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2025 18:45:54.4699
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: trQ4e0VyTaa7j+8VGG+XlhRo8kETMPV5PQBxTTgHGIIHBO1MFPiUeiwyqg6Gu/gj7pEuz/uKpxM0XG3BP2QIwg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR10MB6063
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-16_09,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 spamscore=0 phishscore=0
 adultscore=0 suspectscore=0 mlxscore=0 mlxlogscore=999 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2506160126
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE2MDEyNyBTYWx0ZWRfX/rKeUetrN+CE r1itNJ2GEqtZeXm6tyjEdJghYMVu5aYtaTalxsMWcR4GhIeAYKz0T8vhi26XZBX2D8BA0QtfhVb uPrWAUblOXqK7oEtY+LZDRtovKA2HQ6YVwK8D4N7ooFpOVWMKA6/HpBv+WGC40dlLwGkJtk5Y0H
 TJW86uRuFp5phElCm3TrWgbfdfUF5nfKjSqsscmbnERThgrWAfVY+tRCekTpioGaGiwUagDgW61 k44P4sIwyyCu98OMaqswHnBC/Vl4LqUZjC/fYYwg/0/UHkrYqhRjWyyPB2DuUuAzcJlFfuJ+YgY ZjgyfaqxmKCxcw0t7HPtE7uHfHvi0G5+dUMgmCn7VLxtceM/5MQElgnkYnB5fk6Oi5672wxIXmL
 dlmFar4YvK7HwOQewr6fP10ieo0CKeroDOYmWXb6f0it0iiurHiVB4rJbSwqT1Cb4xoGxOuV
X-Authority-Analysis: v=2.4 cv=K5EiHzWI c=1 sm=1 tr=0 ts=68506666 b=1 cx=c_pps a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=rl1MypRa-eejh0FCuiAA:9 cc=ntf awl=host:13207
X-Proofpoint-GUID: NXBLvza_aZSZn9LNTpiwObnvYz-3MMJT
X-Proofpoint-ORIG-GUID: NXBLvza_aZSZn9LNTpiwObnvYz-3MMJT

Testing calling multiple mas_preallocate() calls in a row after
adjusting the maple state.  Ensures new calls to mas_preallocate() will
change the number of allocated nodes.

Signed-off-by: Liam R. Howlett <Liam.Howlett@oracle.com>
---
 tools/testing/radix-tree/maple.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/tools/testing/radix-tree/maple.c b/tools/testing/radix-tree/maple.c
index 6a5b0342941c4..49e89dfad950c 100644
--- a/tools/testing/radix-tree/maple.c
+++ b/tools/testing/radix-tree/maple.c
@@ -35693,6 +35693,18 @@ static noinline void __init check_prealloc(struct maple_tree *mt)
 	allocated = mas_allocated(&mas);
 	height = mas_mt_height(&mas);
 	MT_BUG_ON(mt, allocated != 0);
+
+	/* Chaining multiple preallocations */
+	mt_set_in_rcu(mt);
+	mas_set_range(&mas, 800, 805); /* Slot store, should be 0 allocations */
+	MT_BUG_ON(mt, mas_preallocate(&mas, ptr, GFP_KERNEL) != 0);
+	allocated = mas_allocated(&mas);
+	MT_BUG_ON(mt, allocated != 0);
+	mas.last = 809; /* Node store */
+	MT_BUG_ON(mt, mas_preallocate(&mas, ptr, GFP_KERNEL) != 0);
+	allocated = mas_allocated(&mas);
+	MT_BUG_ON(mt, allocated != 1);
+	mas_store_prealloc(&mas, ptr);
 }
 /* End of preallocation testing */
 
-- 
2.47.2

