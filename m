Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C08D86338
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 15:30:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751038240; cv=fail; b=Ag2ai1qMORkaQvQ0/3fM1N1TiFw4WF2rxV+aiSCHpmbbzAoL+bhk52s52AjG3MhM7zRHYD3e7TkPaeh55lPM3NXinwnbNOZEikQjC/TkW1l3BU6l2tnpL1UjFIzvAnSez6kSYQWpPYQPivf+tUITP4WXXY9RacxK0Y5I15Dc4VU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751038240; c=relaxed/simple;
	bh=DMLlZMbg23jGAcQZNzp8i0tuG/bDbv/sB3IPmZz1yo0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=qozGs0NK06Gqc1t1e5U7wW+Y+k+UnUfNBtZTY1kuoz2osVU2zrLuMj7tLSRplqmvSZFXxS+eMI6AQzhUlNnQ4741XKciGG+6WczTwpaWuniE/QlcVbzzZWO6cElIAnvgZlPVa4GC89TMTOYggObghYvfW/1bvJ8Wrbjoj6f+zDY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=O7fYzQUe; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=cCvVzTeh; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="O7fYzQUe";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="cCvVzTeh"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55RFQb7R026026;
	Fri, 27 Jun 2025 15:30:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=VFcKog4eIxnZ4e0QmT
	/uTawXrMeLWw6iOtlAEvBCiRM=; b=O7fYzQUeDrumTnSUdXSf+BpenU3r/DASlY
	nGcnseI23sb+64gXbA0ZN+3t1yiGq0QeJ74B71iUpQrUaxJcWnxJf5fRFVZZd+UX
	N117NyjSehEYDZjcuAnUllzTXZWkKUGK4SHfnnZld8/Gi4lxOUgAnuKX+xNRXjYn
	EhtpdLPFCKDdCCfjtmFzx5LfGGls1tsjFzzRnFO8mOSowpi+YJkoN4DUoGBTFL3q
	7dnElH/4SYBif/EBjpFeF0WdJ46DCA1zlmz100qmnTNrUpKe0OSBtTb4GsIrcnv6
	R3TQuCdRP+dx0VsvLs6ohysGFLjucKF59ZCeuzAJhdbnStr9ryzQ==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47egt1jwka-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 27 Jun 2025 15:30:24 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55RED2i4017883;
	Fri, 27 Jun 2025 15:30:23 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10on2051.outbound.protection.outlook.com [40.107.94.51])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 47ehw1gf3q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 27 Jun 2025 15:30:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HsSQPOHd6tkmMHrOzYN89KI60MCUEnngPnU2dCUzLN4MPQ10la7LDTBgTHFN1AjTiJW2uVwwCg9bCbdgnNhqMn+mLyMw/j2/BJAg4SoGPW4bR4/GL2rduUd0ipWp/STyiwN5/AhJZ+dfahRFSoql1f7tgiLKPVU1+W56lT/fUPm3JSI1OxUzYRNBi8mlo7wxfrVh0qDxN6kXX+xY/ii5LqqiA9/Zfq/pRUi7aWNdqvfh/p/QeECKCVRYroaMtPlAZkY44ZK/iI4IpD3/RZ63wJUqO5a/G+4kuH3XtR7j8/kHd5uoNMnY0xxYdhCz6TPyN/enzVS3a2KF9uLH7aXvbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VFcKog4eIxnZ4e0QmT/uTawXrMeLWw6iOtlAEvBCiRM=;
 b=Xbs5oZHySHCp70GMJi11LMZRQBeMvDncKzdUW7qo2Vezjgg9sOIt5iUfQoZRkVPNIMh6nowoxCh+1+1m9M2wj/zp5Rc+Pr7HF+Ts+pAV5xcIWh/4duyywOpR6jWkrqY/EuTPY7zSRwolbmeSCbAVs6FG3bUyzKZnf3SJ1R4GiEqh36doG0tirCJhaAOgGEpmzfbYaR6DiREPyZ15UBSQlp1obrHj+c2voJ7E5r2Eh4gMqXBuDwCiYK/27mpjsJt4YJTPOt2hPUWILILOb7g4NfoASiqh0229B9T6bRTmqKRH/hEv3FJ2qriutMMS903DfW4JUrmoc3prKUCy2gBelA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VFcKog4eIxnZ4e0QmT/uTawXrMeLWw6iOtlAEvBCiRM=;
 b=cCvVzTehETBiEXrYlrMB0agX7QDyWWN+jRV4PUUPS3jLOwc06mACcB5gB7Lvy/tVQEva0nzBsF7Te6D9huDxigXOwsx/dKNEYNl+8HYoqHV+rIShtLnhopXAE2aIQH1YndT/4KMx1RuvEupcF5BUq7mH746QOKETGQ1OTgfukGU=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by CH3PR10MB7161.namprd10.prod.outlook.com (2603:10b6:610:12b::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.21; Fri, 27 Jun
 2025 15:30:15 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%6]) with mapi id 15.20.8857.026; Fri, 27 Jun 2025
 15:30:15 +0000
Date: Fri, 27 Jun 2025 16:30:12 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: siddhartha@kenip.in
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, mgorman@suse.de,
        Vlastimil Babka <vbabka@suse.cz>
Subject: Re: [PATCH] mm: limit THP alignment =?utf-8?Q?=E2=80=93_performan?=
 =?utf-8?Q?ce?= gain observed in AI inference workloads
Message-ID: <4990838b-660d-46a2-b21c-67adcba61ff9@lucifer.local>
References: <28338f055b3c9afa8b69ff6f05ea20ed@kenip.in>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <28338f055b3c9afa8b69ff6f05ea20ed@kenip.in>
X-ClientProxiedBy: LO4P123CA0237.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a7::8) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|CH3PR10MB7161:EE_
X-MS-Office365-Filtering-Correlation-Id: 95d78a3b-14f0-4d73-53fb-08ddb58f8387
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?awMYNupGJPduIkuW8CYGjI4fuHrFoEgtX3VE/oaOUkpQ3U3g5MZALe2mRekv?=
 =?us-ascii?Q?4qbl8XsZDlz3jUoVnTaj8so0OuZmG3gkZlujf5Mg+bxofGZAAPa6hFzoZhiJ?=
 =?us-ascii?Q?4LacyxxDRxS/0HCBnbO0ti2sQhv/VwFo+21iOVuB3jYsw/K3V4xgZn4+fJzT?=
 =?us-ascii?Q?o7uj49UoUO0O1FHyePA5B8y4frMvawH6a3lEnhgyajwzzHogn3mLdZPZXwYE?=
 =?us-ascii?Q?m5FVEM2xn520FEH7SUNfQIBVUvaJ80H+8Ae2TXINWd6F5zo3LY6xJeZ1SMn1?=
 =?us-ascii?Q?HeaQ0csi+nQ8/bcxo4Kr7P1iDQDE9H87Bq+YmOnq0dCk5ZD0TlByt6zarmfI?=
 =?us-ascii?Q?IrUw6BKm6giV8OHA+iG9iD6thupyAaRWMm7KMXIVk49N8VZHokKGedoY+kVQ?=
 =?us-ascii?Q?Xdclwrve3xqS0cfchKEW49DysmkKfRZq9/dItHKdF+k2HG2ENMUIJNW1V6uG?=
 =?us-ascii?Q?TtJz7lWJ6pre8YmISJzGjSDq1p6tiZucuEyVGB1e/AvNq/S4VHWnQIhqFE+L?=
 =?us-ascii?Q?L9WqwBZja2FBN1xwL8oX0neMQzk92IznykUcZCm/PmxBPNGhZwNcfgjknqEa?=
 =?us-ascii?Q?LD5l2LKenjXQnjehNPfHH74dK93ePhMl388hjXFEiCQkww1d9gy++z7SJiZZ?=
 =?us-ascii?Q?fygVqy9oNUnl63qyHOcLBidRmyB1nrRVeS5x/NDzVOScLa9WflM0qCwbAuT7?=
 =?us-ascii?Q?iX45mHfNVjSp0/ftEM5mu8r/hpxa1OULULbp3fZxJF3BCUAwDCewvgO6gNgc?=
 =?us-ascii?Q?CyV52TUE5S/k4SQk27xFdVTd3soIuUWYbQw4c6ikwR6DC4BGXv4OLxB907fx?=
 =?us-ascii?Q?DVFjUDQxoaiLOpTX+YlNTW1VSe7L+pki4cv9XoO6QDZjDOsCCQJuorz6Ss0U?=
 =?us-ascii?Q?J64/ErMqZ+U5AoOk4dhrtBcqAEeVIYDQTvkHy38rQZmaROnmgYpa3ludjvg4?=
 =?us-ascii?Q?L5Y7VyPmNdlLjNA2AzhqlzbddwRKNIEhufeQotU8Yhn/rqZQxadRziCjef1f?=
 =?us-ascii?Q?/Guvy/3MjVcnz8MWNkYDihSTfUsQN+bO0tXtGXEcHvUc2myCIAT4M557cVvT?=
 =?us-ascii?Q?9GPF+PM/oMTpvLxeseNSOkG0bKDUadXYi8YksxvoSSE27ciPQDtLr1JJCBl6?=
 =?us-ascii?Q?7Sf3XTd6djqNKDlsSs1LA1cgTiDy/j+wSvc5/0UWmXqMTsyPemknBqj6x3HT?=
 =?us-ascii?Q?AnqE0dA5Nr4K7p5O8WGS9HeCjVqou7tv12nNZaDqXQd0htvkfQE+ZA3Sz17O?=
 =?us-ascii?Q?WWPAHyfbr0iNPXIyJPtlpNdD/u/8zTmuWkwRzPqbQjZ832+ZbLvlB2JQ745u?=
 =?us-ascii?Q?O8osEXMLJcFWvXdyDv3mf+slQe2ztwGfGEtoxgZm+ESO1OeXMWXZ/sijYgLo?=
 =?us-ascii?Q?4mLxcwmUKtiExJsTNzuGsUdlw4UswXDqYy2J0zg4UAdCL7fHKelAAzhRlJGw?=
 =?us-ascii?Q?b9qTWCivxTA=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?S2XxaLpqwlsCnzMK4XZoEr28C0rJ2EGgtHWlyHGF0KVlE7zYA0z9627bw5sZ?=
 =?us-ascii?Q?y/G97gzqr99tWHf0vyg17CrbQaWelzNfD6J6WOWyj+BTYdw+lbHFq0DX9nXa?=
 =?us-ascii?Q?ilLCarYH9OyaIEjDPyzdoySYER3goi1g1IBACqc5KaBu6SZsWZ1Z50vZNQ/H?=
 =?us-ascii?Q?5XNuZKG1AHJdavRnithMk9MwKVa7NSdqk0hONTSU6ne30YQPGeJW2K+VBRal?=
 =?us-ascii?Q?uOKsEK5Ld9TVdCGUYaqL8L+03nAjO9m1hJsXyUDzlQcZdyyYztA9sPaEurSp?=
 =?us-ascii?Q?SzHh7FwMchq2Q9KzL3lSaerFa1BT69TACvDXuKmNPTrrFolZNNOc2L0PlQg1?=
 =?us-ascii?Q?HUgbNTxrTQayITESI5pkGJ8O7TxKpsBArrrpOvj/ThUYCyWNoOBnJr8I+gIZ?=
 =?us-ascii?Q?94xgUR/WO8MlM+ttBAFdb+HdWcvMMV1HmlipYyowNHIIfXudVxVGC98S0DT1?=
 =?us-ascii?Q?AxhOlG4JM9g/WW5Oo8RwuKFIO6x56Dlithg1f7lKysqR8Ecvt2goqOstGuEj?=
 =?us-ascii?Q?PenkpiJoJ+FBES18tyHfVRCNYZYu6R6vHc+/VEe5ysaE1Q12wXn/6U80u/2i?=
 =?us-ascii?Q?1aGFn3IKgGpbs8d6bPw/MDEA2WHB50xWTbXnv4lfh7P+DHvG1htsrkWg3pa9?=
 =?us-ascii?Q?SYhvqI07Mw9HLrjWz9RFCxNND9RXvwOBAc9IjViE6MXeyEPGHCkihXEzFuYp?=
 =?us-ascii?Q?EhM0NvAoSBLkXlv69pMWZzGJIqnLchaXCZoEsLke9GPrNSdrrGl/FGEAmR2m?=
 =?us-ascii?Q?lanHjKtMug0bK13y2D5x4xzpYAPah9aAX596uN+Ew5fv5QtRTi3l55ccm321?=
 =?us-ascii?Q?zfRE5oHe7DUPpmRTfA2hNa9ByaLUVO4KPtCHkcSroy1dM/x9JbcnNi18Q6WX?=
 =?us-ascii?Q?yHKwiTRfVAsVCJExv3V1IEfPUxAJqCFVjjcKUlr/g0Q/W+CZkHBgNHm90F/6?=
 =?us-ascii?Q?DnH9jAQ7p553MHoNueQeMx5IKv9LodxxYiP/jQc/qRaCXj2gAe1NIDmlpq6R?=
 =?us-ascii?Q?/tyvH3kRcWm0wGVXwk/PPgF0HMofJMNnm3dC0YX2dY6vxwn8BwK9YkTNH6GR?=
 =?us-ascii?Q?7loCxslvTZd5S5ki+rbgbbLLmNYkK6kENc4mGe/qKW0EaSQGhP3QpdaZ+J4L?=
 =?us-ascii?Q?BxctFTTc+xz3T4vSqqsojqgkjnmY0/uFGBt4rturX9ravw6Okjc3pKSMc4LS?=
 =?us-ascii?Q?A02t0N17Sr2wxvvib+t36pZPn7M70BMRqiBnYzS/j1OFGDHwob77I344iX9D?=
 =?us-ascii?Q?HVAWhl0wJgX4cSS/iZsksVmYPBtqU0aUZMdemHZuAbtDmOoyoaEVkYRR1GKM?=
 =?us-ascii?Q?V8t9pPF+wtW1X8heicGaOaUsD4wml9EM9//NmriOJ/j/BjMthGoeR/Sk9pAY?=
 =?us-ascii?Q?mxCRfB2t40aeJfrCiIcvGepCAdfSsxQRg95/OPJrhtNwd8/yBPBIWfIKBFHM?=
 =?us-ascii?Q?7JBA76PnQON/YugqwXKtC8g1HblEP7a88N11D5Ew710bYyC3h8xDwLwm2Vod?=
 =?us-ascii?Q?s7RP26Lt7uMjNyT7WZFRPRE0j/LgLEfS7WuDUfsQeyvUNbxseqZv/6Qx7iRB?=
 =?us-ascii?Q?UWnI9JQx8Dd6xaR3pw3PkeiPbU8ZyQR6qePUsIYdpzT/Axzj244gjU+BTXj/?=
 =?us-ascii?Q?CA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	vDa1IIi/oVO9k+bEO6kIZHZ5qWDSZeEWCtenq0tiT2gRE728+PH8farn/gT7pymXZpydA3lHkF3gZzxdyB9zIQJL+8nTLEF1HPlCsxDEg0XMgvE41nftqaV+sLwTkAvwyTJU4RUD9NASbAZGu13tZmqfchwOsoGw/dF1osbymHT3yHgClV+kzd6DUBB7i8SB/tbOsROXYdnqm8Kv1b2nI2UkN68GOpPSishdxKI/S2JhJ8DEkFOHURYM2NZ++M2c/wGlGzlvP3C7bSoJEDUV+nz7zJpn51dTAZCj9sAVYWmXkTioeJxqiFr5PNmnTVUOCRdpkBTV9ohiu35D0aTy/mLt/ih04HNMNWWiqZccKShf+rB0V8SdlhAEf0+cYEJIjocHJrpejzmSX61atF8Afs6AyO9sXM6qlji8XoksJ84clZI0Ia9j98rzEGf4nQ5uMZLemXEXVzfjx5qHgPiqkbBUa0XohougshatBaOBzxWcz+gacfarQpMt2O+U2kT0XtYcD8Dl7GAGuSkLCF+UKuxiJsy5YXutDbOJQeIWkmLhHOrgggPcNKiTED4yeMCjCgT+ebIOS2JGP6pYHHq0oqFjawExkZT34/XjCETy8m4=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 95d78a3b-14f0-4d73-53fb-08ddb58f8387
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jun 2025 15:30:14.9631
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7Wbnm4BpcBeiQJ05aK0vpYIKX4KS4fvn2kBkZ4OKY0ovCk5disGa/EMjxr3QijGi4kHyXoRXv7hFR249f037+Pf8A/HubZvtja364eAgYVg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR10MB7161
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_04,2025-06-26_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 bulkscore=0 spamscore=0
 phishscore=0 adultscore=0 malwarescore=0 suspectscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2506270126
X-Proofpoint-GUID: Q1VbcPMVrmkPFNlG_F0eLZBBEioFwTgH
X-Proofpoint-ORIG-GUID: Q1VbcPMVrmkPFNlG_F0eLZBBEioFwTgH
X-Authority-Analysis: v=2.4 cv=cpebk04i c=1 sm=1 tr=0 ts=685eb910 b=1 cx=c_pps a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=6IFa9wvqVegA:10 a=5KLPUuaC_9wA:10 a=GoEa3M9JfhUA:10 a=QyXUC8HyAAAA:8 a=8suTRfrAFwa9obAF6TUA:9 a=CjuIK1q_8ugA:10 a=LIGZGoaQJTYA:10 a=4EqGVQd47fwA:10 cc=ntf awl=host:14723
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI3MDEyNiBTYWx0ZWRfX+TDdUKRJfRfg 6n1DoWKTWKnsB4G68oJATF3bodlXEBK+OslUbTR516nGfOSqJjKru/h0iKdJQsKWCISjhORXFIG Ge8Q31lACeNg6+WniHV9c3X2ZTPljAebCEFatNe41sJ2O9LLtkzlGyQ+K6oXHeBSukVm+3+zLXk
 qkU+lxLek/8kFLWOa6FUYnALMoS8AUYK++65l/l25Tr/rJRFfMDTKgc1mEewcI/PCmMIm2/5QBx I/WochLW7AsFc4htC0uM1IiFnTShZLoLqHIdy9vPIZoeqSdemq+ABHLK9OZTLxJG3vWMQESnBk0 YlCbPsq4kTA9yJSsgMbHbLSVvVY+kOAR6h5OxwMHiZooJhwCFrTFxNXIE0vg7AMEcqiI0CjUOG2
 +dAKjBvubWu0VMM636vgUjD7ariKSjSKxPJbhR4MKPcrG0ru3TobkAJH4NhF7AAAfbEm3ULg

+cc Vlata

On Fri, Jun 27, 2025 at 04:09:16PM +0530, siddhartha@kenip.in wrote:
> Hi all,
>
> I wanted to share validation data from a Hugging Face-based AI inferencing
> workload,
> which was significantly impacted by the THP alignment logic introduced in
> commit efa7df3e3bb5.
>
> Using transformer models with dynamic input lengths on Intel Xeon (Cooper
> Lake),
> we observed up to a 3200% throughput improvement after applying the patch
> from Oct 2024:
>
>   mm: limit THP alignment of anonymous mappings to PMD-aligned sizes

All congratulations are owed to Vlastimil Babka for doing this, cc'd :)

I gather he enjoys novelty beer mugs as tokens of thanks ;)

>
> Metrics:
> - Model: BERT-base
> - Inference engine: Transformers + ONNX Runtime
> - Kernel: 6.6 vs patched 6.6.8
> - Batch size: 8-32, input length: 64-512 tokens
> - Metric: inference throughput (samples/sec)
>
> Thanks for the fix -- this change had real impact on a production-relevant
> workload.
>
> Best Regards,
> Siddhartha Sharma
> ISV @ Kenip
> Solution Link: https://www.intel.com/content/www/us/en/partner/showcase/offering/a5bHo00000045YUIAY/deadlock-clearance.html
>
