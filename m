Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5464B238155
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 11:37:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743593865; cv=fail; b=MQgv0iJhh6oqaJxALOZxuO6RqLYLiTHISE2BKPM/ENYQPy58pRO2p88IL85CI+WP6SZawLtf3eL4QrgATkjvePmPwShF9gu2DYEoAtGyIsW15o2sEAbwUGCyjsTCYrRqPEqHPLYqVnkkiY5zoCNYDYoTiv26OC1vrAxPMq93CjI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743593865; c=relaxed/simple;
	bh=DFQC4afsp+7kMUusHBnCzAQnb4yFiqou0Z28uhJBd8Q=;
	h=Date:From:To:Cc:Message-ID:Content-Type:Content-Disposition:
	 MIME-Version; b=CJlGdGQ7r9GfOJNjYdM51rDNpyZGJm+nnwtIInC74cyO3WC1rsRGaTN4TTwiV06qHm7m7rbnt+GiurFCjeWRRrGCqFMuHTnnMabhy9zw3daT1JSCE22GWvlj0nSuGhPXM71iSzhZwtQFyRq+5NoX1qARLL/bONhQOKMkcXbBDoE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=i3NrAP/c; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=EoNeR91b; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="i3NrAP/c";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="EoNeR91b"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5326g0qc012886;
	Wed, 2 Apr 2025 11:37:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:message-id:mime-version:to; s=
	corp-2023-11-20; bh=ePtyAe4WsX4MuoqFalW9RGPp80cR3hilcCuUWDk7D/I=; b=
	i3NrAP/cl5UezXCs6W3CgQG57b37+ZCe5qINagLNa6Z5+7xz/P9PLNGnpV3PwBow
	2luQjzuI5SdlrFfr3QDhJx1CHU2V1SZhbJovB0PXj3vrl5W0HiBf+Sm4SxNsED47
	DRc9eKOJsM5Qi1mA4gXKcqDZg3KP2FwK2CcFeRYIq4LlMpQrPMJ2Pvfsyn+c3i66
	8/+ipcu1jFOY/YOib6+wy/s1EJnrVjeXvpL8LbjZVmvk2XBIN00+ylW48nOv7eKo
	iVBtvAZ63jK690Ro7F8j14JMQbD9bzdKhCI8sGa95yr6Ap2WVxeadYASbdDBML7r
	dHfOBmpVFctgwISgp1Xrfw==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 45p9dtj5y9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 02 Apr 2025 11:37:30 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 532ARBHl032724;
	Wed, 2 Apr 2025 11:37:30 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2043.outbound.protection.outlook.com [104.47.55.43])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 45p7aar47k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 02 Apr 2025 11:37:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Obw2BCyBpXATd2Ohb0iO26OKIGDrFlVZK77DsqfogpuaW4WXF+mWFsVvz6ayDDI2KSh+zXZSEgBut7UPk3ws4gMRGcJiLHp0aF3LGOilSpvkgP14MkWHVJwecYr0/l+mTbQAO2ZKoic+IRjIzGzTd28utC5LLfLm0YVHwNw3f9oqhD2X7zzT7Bqa0yC2HiEFPgX1UlOCp7ettbyeyaBFyQy7mqamNgQmAbqyD/txYmFV383CUV51Tn3sHRFo/xfvPc6Thoxh++RXPO/xPP6+VG0rqkfIHLvkhfRzf8INC3tBokib4Lf4z8v6LlMzm0G/YydBMWYPm93xDlAucMolEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ePtyAe4WsX4MuoqFalW9RGPp80cR3hilcCuUWDk7D/I=;
 b=V9t+6xRJtwd3dqZFiy1B4Ai62ayeu8f3aFlHU6P+qRl/niLjCkwLw3pmuyiFNgO76nxYL2pJuwdQAVRLVOwX595O5uNzJVqfIfDSIhVHP+gV+VPKIVW5FKdoLTqBu+dg8O4pnRpOjJdCz8drcgRXL3EXnZ/CVic2ylTTNy+CyCtkClQhk2McM/ZVMGGMWFWTcypXkAkBLoCeQFLO9R9B+Wxq+X3VIgG7sL3N4nX+CtBGxcqvotWOzTj2U3WPt2PWXm+LGWiMUZulRo5ujC9BaWdcxE0GCVCfichYZsFZiGQqB06MzW9Wd0Z7QNtBVkGiWaCAskRSr7YWJpNoI3wHuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ePtyAe4WsX4MuoqFalW9RGPp80cR3hilcCuUWDk7D/I=;
 b=EoNeR91b7JrdnDthk33f4GUS1xkPNn2tJop96YY3nJRogjEm+sp0bJtjnPrws8ltgJ9M9ozH5iSAMy+8z9l0DpP9ne9AyaVPBfiHRcK4pi06y26wOZsEpWrbG42/ibOEUdGRLxIhL0H5xawuAft+SrcSHomLN+EHqOy7J0QnzLQ=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by MW4PR10MB6654.namprd10.prod.outlook.com (2603:10b6:303:22f::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8583.39; Wed, 2 Apr
 2025 11:37:27 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%7]) with mapi id 15.20.8583.041; Wed, 2 Apr 2025
 11:37:27 +0000
Date: Wed, 2 Apr 2025 12:37:24 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: David Hildenbrand <david@redhat.com>
Cc: kernel test robot <lkp@intel.com>, oe-kbuild@lists.linux.dev,
        Dan Carpenter <error27@gmail.com>, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org,
        "Liam R. Howlett" <Liam.Howlett@oracle.com>, x86@kernel.org
Message-ID: <g5vxcrmdjjsvrjeo5k6uzwypctv2mvbteoommwwpv6sfjpbcyd@lackqksyahfs>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-ClientProxiedBy: LO2P265CA0051.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:60::15) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|MW4PR10MB6654:EE_
X-MS-Office365-Filtering-Correlation-Id: d3a9693a-2437-42ef-67b3-08dd71dabe83
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|7053199007|27256017;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?BYVs1hICJnB8pkW6GKjDG2W9KdOExIVe5fmH4DGOy7UMIHbc3ZQU0YUW0a8h?=
 =?us-ascii?Q?/J/VgY1sXb4ATpprz+FD4wGNPXagR38V6w/0E7jwuv7suGMxHpctP68jLJ/O?=
 =?us-ascii?Q?DO65Q4E7kga0sUdOZbziDc78CiGOfDqsdYRFmWHDOTbSQKyWe9oriY3SIWso?=
 =?us-ascii?Q?SgZZy+e3bCFJb3E2ldkFgR5u5UreKZqaY6+qgV4EPk6oF52L9a+Mrc0srvVs?=
 =?us-ascii?Q?mbMr2R7WIu1A4ygmlQsqU/Yn4UnqbLSF8tkzEKxfFlbdUFPYzQDFaqSa9vtl?=
 =?us-ascii?Q?OjvQPgJPBrsIJEROrFlJszq+KO3CD+CfAWDE0g8sFJj6VPsLAfjWQBLpiLNG?=
 =?us-ascii?Q?/Qw+2fW56URbEQUbCVocHmAcmJQDq4/VmPCJsyGAKUWjW6ImYh06rpFNPLXO?=
 =?us-ascii?Q?6XHGLZoh9P8goaiEolcw0pSviP7ew+s6ykKPGu0KYi4dAniOO6uSmNGpSnlC?=
 =?us-ascii?Q?vg9qf+w9VnyYZ4juOkMcL2ALWLSE8jBsQuMWL9qvu+iprkNabBf85j4gqmls?=
 =?us-ascii?Q?FzW9Fzq3lSwrXHs/KBeA4HSf2Snf+MwbMl5x4gfaNyvVUtUKIBGpm6v8TKjm?=
 =?us-ascii?Q?8juaiOX5Ui5qwdhINaXeJ4OxGZmW62y6ppGrqyzGcfUp0TPikQHSmAtK9Dja?=
 =?us-ascii?Q?KFfsBHMRLTLoSGW3esaasb8fJ7umc9vsxLgULM/eDOsccj/PdeP8L3RB5yk6?=
 =?us-ascii?Q?OqcVWs/iCPwXLC+WTURXXQ1Gjg1wsnOmIO98teeaPSJ+VOJwSDfiMfzqih4E?=
 =?us-ascii?Q?M7BXro3fBpTzHMulW1QbmoMXevM52Q+eWQBZ158Abhh3ktJ3vPmKEUZOp6w6?=
 =?us-ascii?Q?YEfdpquvKOuyS8Yfpsro3ooYOSlN7Pm3L5D2yyuQl7NSC3F7zlxNzEm0W7r8?=
 =?us-ascii?Q?AvxGUavfdzytFTVSK+9KwDlEGLwmSxy9ZQTEwolP/eRjBB8RECLHjCTG4QSn?=
 =?us-ascii?Q?Qvm1M0nJLMKFRh0vCe2yn9ez0MRRwjtO4lWWgiHXf0uEMuXJ6uAj4IjEr/Sz?=
 =?us-ascii?Q?bMK6uWqs2W/Rh38wMlGkYS4Cb2xqWk0FDlEs5mICn+KWqObNfvzgTSXHbxHZ?=
 =?us-ascii?Q?3z2vS/cr5+t5ho1XmVtU+qD1of/YnnttTGlwSlKVXcj3bvHVWa0CSifq3WT5?=
 =?us-ascii?Q?DiH+FtejMXRd9leSUFvYHPza9tkLn8penBjjN/WnAnx7BLAU6eLXbIwSx9k6?=
 =?us-ascii?Q?Bowcqqx3iG4yRENABe25Rd98kmtR4aaF94iP/bkOLjgVvr3S9B5woNxBNtxg?=
 =?us-ascii?Q?fz17DsKfsSU+5thlBiFwCOtAXvSNcDhirIo+gvC2K0bzlqD1aUnhLUfqM60f?=
 =?us-ascii?Q?VjpijJjs8ghAbqFcMu0iOuOwP5Xjat6Bgc9GMlZDFb3+No6jSj/917Yy/kKz?=
 =?us-ascii?Q?/Xy0cPSphkCToTX8pvRIUmu6aEhe8NQs9azTkvdK4ZGA504hXQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7053199007)(27256017);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?0O6loaDQjhkFbKXDc/MerSuYm64g/VvsLnsWRTORlVUiGGZEpyAsa6PqYf9Q?=
 =?us-ascii?Q?/1Uz24P9sGWnRbNv7iggK8QRfQ5Iak6eonhID1mbVWvL1avRhUjTZOT6z5dp?=
 =?us-ascii?Q?AYgl2s1FMkz6AuEI3uUBCb8yjluV0xX/T5NrUKX0zx7ku0X5T2Sfi2HG6rae?=
 =?us-ascii?Q?W8li5r8GlhLLjaIrFpYJ5L3anZCI8Z3H2ilnMkkOSFvHteK6+zSO6A1fzJp6?=
 =?us-ascii?Q?rKeBfi1ArbGDDpJGhMIV74Ws1Or0jaKBOT1UmNDYfl121CH9iedIC59Q2Kk7?=
 =?us-ascii?Q?pvWyg6/uKjARDJJjACa95i7LTVv+PF9V/dZLsCGPw+3CrdRof/SlMLHX4Zhl?=
 =?us-ascii?Q?z76wEHW8wU4ATd1X2boIuW6dxZjWqscs8Ar0SGIS+yADmbjU9HfdK1dA4Z5e?=
 =?us-ascii?Q?pqYWvChalQmy/rUrLPE+ZUY+SRhP94O+hRxayquxMG+QqwYqSOgQSgx/nkX1?=
 =?us-ascii?Q?/KiKZAmRKxBx1zsFQfIcWmDy85mefaapH+XZL/glpwMz+b5ADkvBrymBV8BR?=
 =?us-ascii?Q?xBAAZxRTyBtPjWEiahdhFvcDRTOT9+/ZNuDnNj8U6NWm6AWkT0NPGMHnjt5C?=
 =?us-ascii?Q?84v/zjoRh3UU/u+Yk0FDVOHJspk7mQUxiofdN3Tp4w8FLt0BJBo+tvGRd8n5?=
 =?us-ascii?Q?Z3MVnOo/a10HO/3lEZy24Tdyne6tzzVjPAAdYt01lZJlbVLlD7kN03rd6boO?=
 =?us-ascii?Q?vgsH7fz6nKvif38jpvQ3cOzUK1YpmVHTxCgwd+jyQ4aYm/QcU5mdjAiF1zRc?=
 =?us-ascii?Q?3zwtnmRED7HI0iwbjBH5Cw/l7YGSGuzncEbXkYVn8AX7aUIzIz0+K1XzjurB?=
 =?us-ascii?Q?EEitSqZfZyNWPe23Pu0+ipT2bk34YEkGZjiSt8LYLcOTec0wSYYwk8SIUlBP?=
 =?us-ascii?Q?TuA2tZ+9OA3hI1gXQytuiZIc2q2QdtkELQnTpFSUmqtBQVU4rDIVmPjGoMFV?=
 =?us-ascii?Q?elSgK7i7Z4FosQOjheQZ/6Q37evFJhvRAha6ytgRl7DoflqlRFW98ZOyczI3?=
 =?us-ascii?Q?ZRPySicz8fZQV4z5iuBh9sVZ+30GguwiX4i2M0pTMa32unhgMLDp38c3dud9?=
 =?us-ascii?Q?pvy9CT88llDnz0mFRlt4MMD8RdS0D8/Fl7FW/4bDMoRixmMMSCxAuPG2m6zJ?=
 =?us-ascii?Q?gCKq0bw7KrPSaAGkwlvhqWA+aPBNnrlBr01bEtgc9pTMgvGYCoeixSgdc6pD?=
 =?us-ascii?Q?gtEeNVH9nanGTnOzJeSCS5lrMLEp25xhdUKnxdYZyZEhTcSDqaWVQDUCAIFg?=
 =?us-ascii?Q?N/drcHYM9oM7eXgsIBNiJvsvF7emllCpoPoUR5qpVY8oZgrJ6xIyo7N4UZBu?=
 =?us-ascii?Q?KQUUyX9iIjPxNkhi+WvRkdYwH9rSuOFkcKWGfz//tio85K8R3K2WlTgnyWJB?=
 =?us-ascii?Q?tUDsgD5Qywfbp0JlQS5AMwGrN9k1uV6JYfsLZ7Y9EEcWk3CxfV8JIbzudofJ?=
 =?us-ascii?Q?gjon/cN3ihlCcmW18MWzHFXkNapDgseWNYVF93WUIrF9skB4oxjv1Qv06vi0?=
 =?us-ascii?Q?b+H17o7que6ejUgG7jqLJ+Yxt7jZSbVmstih8kASDxYvWDDOl68f2FhCGCmn?=
 =?us-ascii?Q?V+ZEIS5vcyXwwNJ3maItQIIGwVyejYJUb4jTpMi8ZGfneCGeLHzFPT2hPVTV?=
 =?us-ascii?Q?DA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	lWKYpy6Y5DTGPQdvGKfHerEztjtBAaEihLUVjNMcN18m3UC0YAx7oIucJBfxEaLHfiPS+cwGE/yeHMxTy4N+9uVBtYSKLibp8UFBARlfV1DHTgwUcn+pmvx/QWDHd/0XIJkDO+Dyia19Me3KtVWWfmzaOHtPa5cBz4NqXatpmT/oYSSw3mnc6+FN7SlF38W2W4VIrm5/7aIU9Xxb0s/hxkKhJih05aVxNUi9TkwmfdjHo20v+aG27zIJYvC7GPlFeOwEClG9OodRq+KGo1+4VErA++IiL22rldjiLfNhrmXJayWKdtfFZ1Fqpa6RYTMOgg7u8V6C6doP173ngy/0gqTL6MZ/G8ZUJUlJ2XZsOYlkby0CWpOMzFOX/iaOh/zXk0xhq8DfQ74bsGVazlILpCSv0MaQPDkefohk/amVww7baYVHirq1/JIReObyPXHG8T3IsLOSPtGu1z55MZ3wrlDiBImji8O2j+wFzDmrQ1eahGD6tCYucmB1aOKgUDRaRfym9DgiYA2ajT0etnLtHbK/HjX0EjlwVs2drLUarLtKsAuvNunFEx0UoHA1fGT7nfChU9S0KucvKMFQLFPPM10RRjclNXz6gtcacGnP/CU=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d3a9693a-2437-42ef-67b3-08dd71dabe83
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2025 11:37:27.1324
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: x+2bNuVN6vw6ZCBntCoM5Ts1izB/3IwWHRZnMRgiZnUF/M1s6fa7P+mpa8PZ23hRAXkRfqXriqp55Dyu5Sw/fQ8RcwlcvWPCAvieGnb5VSw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR10MB6654
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-02_04,2025-04-01_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 phishscore=0
 suspectscore=0 mlxscore=0 malwarescore=0 spamscore=0 bulkscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2502280000 definitions=main-2504020073
X-Proofpoint-ORIG-GUID: pWuA0-4-RQ6T5Zry9dMQ25barfqOWueu
X-Proofpoint-GUID: pWuA0-4-RQ6T5Zry9dMQ25barfqOWueu

Bcc:
Subject: Re: [PATCH v3] x86/mm/pat: Fix VM_PAT handling when fork() fails in
 copy_page_range()
Message-ID: <0f94adaf-37a4-4d38-b952-01c2dc474a2c@lucifer.local>
Reply-To:
In-Reply-To: <b21bcd61-faf0-4ad8-b644-99794794594f@redhat.com>

Actually let me +cc a few more so this isn't lost further :P

On Wed, Apr 02, 2025 at 01:32:52PM +0200, David Hildenbrand wrote:
> On 02.04.25 13:19, Lorenzo Stoakes wrote:
> > On Thu, Mar 27, 2025 at 09:59:02AM +0800, kernel test robot wrote:
> > > BCC: lkp@intel.com
> > > CC: oe-kbuild-all@lists.linux.dev
> > > In-Reply-To: <20250325191951.471185-1-david@redhat.com>
> > > References: <20250325191951.471185-1-david@redhat.com>
> > > TO: David Hildenbrand <david@redhat.com>
> > >
> > > Hi David,
> > >
> > > kernel test robot noticed the following build warnings:
> > >
> > > [auto build test WARNING on 38fec10eb60d687e30c8c6b5420d86e8149f7557]
> > >
> > > url:    https://github.com/intel-lab-lkp/linux/commits/David-Hildenbrand/x86-mm-pat-Fix-VM_PAT-handling-when-fork-fails-in-copy_page_range/20250326-032200
> > > base:   38fec10eb60d687e30c8c6b5420d86e8149f7557
> > > patch link:    https://lore.kernel.org/r/20250325191951.471185-1-david%40redhat.com
> > > patch subject: [PATCH v3] x86/mm/pat: Fix VM_PAT handling when fork() fails in copy_page_range()
> > > :::::: branch date: 31 hours ago
> > > :::::: commit date: 31 hours ago
> > > config: hexagon-randconfig-r073-20250327 (https://download.01.org/0day-ci/archive/20250327/202503270941.IFILyNCX-lkp@intel.com/config)
> > > compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project c2692afc0a92cd5da140dfcdfff7818a5b8ce997)
> > >
> > > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > > the same patch/commit), kindly add following tags
> > > | Reported-by: kernel test robot <lkp@intel.com>
> > > | Reported-by: Dan Carpenter <error27@gmail.com>
> > > | Closes: https://lore.kernel.org/r/202503270941.IFILyNCX-lkp@intel.com/
> > >
> > > smatch warnings:
> > > mm/memory.c:1428 copy_page_range() error: uninitialized symbol 'pfn'.
>
> Huh,
>
> how did the original report not make it into my inbox ? :/

Yeah it's odd... maybe broken script?

>
> Thanks for replying Lorenzo!

NP!

>
> >
> > I have a feeling this is because if ndef __HAVE_PFNMAP_TRACKING you just
> > don't touch pfn at all, but also I see in the new track_pfn_copy() there
> > are code paths where pfn doesn't get set, but you still pass the
> > uninitialised pfn to untrack_pfn_copy()...
>
> If track_pfn_copy() returns 0 and VM_PAT applies, the pfn is set. Otherwise
> (returns an error), we immediately return from copy_page_range().
>
> So once we reach untrack_pfn_copy() ... the PFN was set.
>
> In case of !__HAVE_PFNMAP_TRACKING the pfn is not set and not used.
>
> >
> > I mean it could also be in the case of !(src_vma->vm_flags & VM_PAT) (but &
> > VM_PFNMAP), where we return 0 but still pass pfn to untrack_pfn_copy()...
>
> I assume that's what it is complaining about, and it doesn't figure out that
> the parameter is unused.
>
> So likely it's best to just initialize pfn to 0.
>
> >
> > This is all super icky, we probably want to actually have track_pfn_copy()
> > indicate whether we want to later untrack, not only if there's an error.
>
> Sounds overly-complicated. But having a pfn != 0 might work.
>
> > > Will comment accordingly on patch, but I mean I don't like the idea of
> us
> > just initialising the pfn here, because... what to?... :)
>

Sure, I mean for all of above let's have the debate on the main patch I guess so
it's in one place...

> Stared at that code for too long (and I reached a point where the PAT stuff
> absolutely annoys me).

But, also lol. Can. Relate.

>
> Thanks!
>
> --
> Cheers,
>
> David / dhildenb
>

Cheers, Lorenzo
