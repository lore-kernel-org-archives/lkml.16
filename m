Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E203D18A6DB
	for <linux-kernel@vger.kernel.org>; Fri,  2 May 2025 12:46:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746190009; cv=fail; b=IoRDZOWVOwcB6hbtHohaJ2Fk5WCdZzU1OCV2446i6DUqHCvzlD7MgIjm15gTlZnWSvzvFj+7LrCUMpCwVOAhWT1NzUWLfvJUZISMNACs5TKZ4gonsWX19R4vr8zinaYBM1My/3bxartNPPl3Xi4GOG7CeELyPaDk7PdVhv1H0Vc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746190009; c=relaxed/simple;
	bh=PPw2tAB7wGK599VPRuP7h0evZIUcnZWd97/j+/bfO8g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=AIsg9hmCqs61i15DaiUUrRM/VLXC6xBvQNZ8/z8/DOxCwzpbErhhir9c4Kwy9B5THGyEpjjIwzYhdiChZq5UoU4qYZ4tCHw+J53xnTYJh3MDynjtvGq8I4uc8xL2v6ZKuln6QjHo98EGwIiYiqcqCPBn68//b3X8d6OxAnm6wYw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=HqRX5blt; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=RHxrhOq9; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="HqRX5blt";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="RHxrhOq9"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5425W8r5032283;
	Fri, 2 May 2025 12:46:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=6Qqluw5EDgB2cT+aX5
	ihQj0QU5vboRxWaprPyt4FH+s=; b=HqRX5blt3oe9ZVJyJIVgVizjc1q0wwc/G7
	qIbaoVN54OEBSQkZ1udqkEhY4YZ5SFzDK8gJ05HnVnkM20LkHweIQUKur2o897XF
	m/xaTRZKi9fMd5nFaMjf0YMiO7CCOymsjPVwat11h8S0TMyu0pPp5uVvHG4RpbZs
	xSXdBwbWH0rKXwS0kDtsa4QsrI179kjU5GP1cMKbsMMxgPak2kOcQ/RP+MGH3FqE
	+Ij83765aZzEmsdAMui/ceGdW5NiLyUCXCaTeQcAeWTMpee8fejkzQyiuAxp5aDi
	8LUtbUVUslykkuck3/CYAlrulyqT2FVjpZEMWS98r+QpkqURNjwg==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 46b6ucn9dn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 02 May 2025 12:46:35 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 542AVE5i035257;
	Fri, 2 May 2025 12:46:34 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2044.outbound.protection.outlook.com [104.47.58.44])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 468nxdgvau-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 02 May 2025 12:46:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K8jZTL4Bt9jO/UdVZLLVkeT8j93vn3bUSJ6k9XLXislwthx2mwl8lX9XPV2j3AM/h0hWX+ryNbf9hTip5f/4VC+T5ThYWUnKQJRU9iiWDuvSlu/Z33+K1WkGOEUI8lF2AV03isfp99VCpnnd9OT0aJ0N+M1u6TEcZUvMz0dzjW/VaYG/Qi2sVBtqw0eMeJnyvkBph49TXepE5j/gqqwmrZ7cXN0GlWAwSDX/Nu94/g+oiYUEO+AeORiHy0ePkMHxIh5uOucH2PqXWw6TgW3hzuT+wDU8CHAmcupEVoWYkY+NhBGSEFUN7Nztbz2/2LAMpW/ClV/gs9F9gdzzefTnSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6Qqluw5EDgB2cT+aX5ihQj0QU5vboRxWaprPyt4FH+s=;
 b=tWSkqiSWJ9g/SgTX0pxXgrjPDZhpinQMJK3xi3kaFtL2DpV+R48PCKHSQswDpvPa7IsZRY42sFUn1/OskdJ+1No8sUdZFIhJBAQhFzYvqYadU6JTpAGECA/WcH56tTbSHswBjQAaYJSVqId3kT2BiyMa7XDKm4GNanxfkG52y5fw/Lnr9dfqHn7oMVGQwXm15cNq3FY9uBvi92+JR+GG/g/3mR48ZtwQoietyssTbRXkvLvxh9A2FBpPTKyVvuO2x2IqNPYxsPeFC4ToxxctbMqSp8K9sZWkJVqt9YLscnClPEF1ebF3X1ODxuuq22rgXwswP6w8WIuSIFE/3ABAyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6Qqluw5EDgB2cT+aX5ihQj0QU5vboRxWaprPyt4FH+s=;
 b=RHxrhOq9KjRrJAjucAu2Domru4eO0sxwk9hfu0TEyqF961HJhuc94oHPfIuvuPAh99YzAE+HPKIwMo88TTVgR9CdvF/uCKOmlCbV1oeNo52xCCiUtExHOsTPmuyoHF7Q3z8EXqgBuUoQjgtjQ+sUH5riU+u48YD3IS92p4aD6I8=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by SJ0PR10MB5584.namprd10.prod.outlook.com (2603:10b6:a03:3d3::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.24; Fri, 2 May
 2025 12:46:31 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%5]) with mapi id 15.20.8699.022; Fri, 2 May 2025
 12:46:31 +0000
Date: Fri, 2 May 2025 13:46:26 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Ignacio.MorenoGonzalez@kuka.com
Cc: Liam.Howlett@oracle.com, linux-mm@kvack.org, linux-kernel@vger.kernel.org,
        Yang Shi <yang@os.amperecomputing.com>,
        Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH] mm: mmap: map MAP_STACK to VM_NOHUGEPAGE only if THP is
 enabled
Message-ID: <ad1aa0fa-f1ab-4318-b423-35f59ebf0599@lucifer.local>
References: <20250502-map-map_stack-to-vm_nohugepage-only-if-thp-is-enabled-v1-1-113cc634cd51@kuka.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250502-map-map_stack-to-vm_nohugepage-only-if-thp-is-enabled-v1-1-113cc634cd51@kuka.com>
X-ClientProxiedBy: LO4P123CA0624.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:294::8) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|SJ0PR10MB5584:EE_
X-MS-Office365-Filtering-Correlation-Id: 79e17e5f-d3f7-4b7d-c4ab-08dd89775d54
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?403tbkk8EKO3t+FCz4YxPREblcAICBtQ/JwYKAqxCtmbCnp/Pp+IB7/PzkOG?=
 =?us-ascii?Q?Am1zB5RHeGS46glRJJ8V7kLVHlBFvubJ52IEDPPz7zhUXf6yrhs0ifleafWu?=
 =?us-ascii?Q?LK0G1x2XRO6HcTPssjLFla4QbUEBX/nHoJ4Q/2MpDHHcRUN/BwhsjDDR2QvJ?=
 =?us-ascii?Q?PczdUiViwktzwjpFC4m2HvqOyNOJ0v1lQhtXAO+/AVWfZiBNbI9cIgt710rL?=
 =?us-ascii?Q?LKM1khW8zRRPjwxK/2IR8OSOh1OI+IZIV9+06dAjxuloREil29xr3DZjfUiK?=
 =?us-ascii?Q?p76Ng1NYn41pjWzDvIDaVqkhWYKg2rdo6tWM1ZOeD337i1zub4/W5px/XPHR?=
 =?us-ascii?Q?NrEjHMe17Zt9xXn/Bsq5KeY9ori1aTuDS5wm5WghqUzWbMMHSfRIbHKwqX3z?=
 =?us-ascii?Q?guR5t0NEFGFSJzF1LRlR0Yurvc59+DY88nyMcBMhiwJhmJwFCqs31enPksTl?=
 =?us-ascii?Q?SJrv0CJIn6w5zOh75s9R84E+Z3aiI9zJJtN4NHThhKqf6k/jdXje6AnSJizz?=
 =?us-ascii?Q?2FFR/AgOnl+VETNsihn9nnSj/CyYrRvhJ9KhQCXQbFlXj93nxl+QGrPGBw6x?=
 =?us-ascii?Q?KluxiNE3++4jxR1GGJlSEx3MUW4OosSb9PfH4qRTGkwgUKyqCmgaB46hkqyS?=
 =?us-ascii?Q?FJn45fGuZPlAVgKtjLO+Te9YQL2eXFsR4bEA4zhkjnoOZw7XPf9OO0fMM6lZ?=
 =?us-ascii?Q?pBBxizv6Y+9O+ZaKWIukKznkCLHzpg/EoOOmZkuUNrNU10JUboVabczlBd+G?=
 =?us-ascii?Q?Dhmbh18k869fFDOq5oMn2VhbiHjLwTjlH8K7fPM4GrBkus9cbm8+UFiH8TdT?=
 =?us-ascii?Q?XIhsEemCiZakOguIISsM6QHiqPayIRcpkOo7APpD0E9ffc9EjEs26uVgjZD9?=
 =?us-ascii?Q?kjCUh7qiSeGaIeYKUpk3oLK3uiZaBQeFcfa2/dtCneUgF5B2GpcMgwaBig0s?=
 =?us-ascii?Q?Grf7CF5RBEtG8fRHtXzTSUo/6AvgccnKFO2c89rKR/vZ1LR9IYwbPlNDLb0u?=
 =?us-ascii?Q?GUp+Gz1muwUjukqEROAtmMLd1ECHvuIYPXsL5Qm93jyhJ0pDnIh0IpWzCr8q?=
 =?us-ascii?Q?KY7Xi3dobdCziDWxwILAIIwwatK6iT2PKDhIeY4Hs8+oYILG0C39dXiOBfXN?=
 =?us-ascii?Q?VDhGcWQYc6L3E+20uQ50yuhpQbddFDggR/UM6ZwgADLueArVsr57+AR4bXLA?=
 =?us-ascii?Q?puORfM3zTqRDAbO34Za6EJgJJo62psfSFn/NR2cOSHwd3AolcnTavK4/hFGz?=
 =?us-ascii?Q?87pSRuuKbNAhp6NHIDDA4LHGe+nnQrDDYWK1ImwMnVvv+SAiFmcWDbc7HxRL?=
 =?us-ascii?Q?vNZIoKYl2YuzLhPBwWIZyT0prdOc9zJsMaHLNoJaghYLg+fCBvBwY6sAGGZn?=
 =?us-ascii?Q?Pcfp1CPQqEdZXyor7I8IxGk+38wSfpnX0v5Ydgo5dkCAZgKRY3csHEcZKxil?=
 =?us-ascii?Q?u4x8t4Q0wEk=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?rYuv/P/+bvupV3tSIO7sPYmZfqq/BlMrWhJUkLTkTqR2Ex+dgbvD8Sl7WV78?=
 =?us-ascii?Q?YKYsk4Y1R+2uNBXDCtbejFVK3set+n7Av78BbEFMKFlDTmEtYuRaJOeTopoz?=
 =?us-ascii?Q?pQ5cc9IzH9uokhwHrBnjBUwlsnKVWVxUqnePbliRrqRUZeyd1veoFL1rt8hq?=
 =?us-ascii?Q?zR2E4wCyZA41UPT+cQDNLax5j6i8iGCYtwDxQ9aQQSwuCtW30OgOxzkv8A/S?=
 =?us-ascii?Q?OEdtpfZiGom9lVDY/KI4QYti4eTvesyE5f8vU83OpNwztAwNm4yDnA7cuHkJ?=
 =?us-ascii?Q?EDOINl3XF92lhU/BpjIYW31rl4tveeeYMCzkVuaU+n0Vxu7+xk0aOa7yqHgK?=
 =?us-ascii?Q?AmbPxBWZ/y6PrYXqMM8uyFeUrfeKAmhJebmCHTL91dZx1hvjA42wZkqp5f0x?=
 =?us-ascii?Q?J2NiLoT4KgPMCYdDwCCAEbFxSs/pMX5BqeAxw18XlovWNNvLAbYZzcCvZ5nm?=
 =?us-ascii?Q?dxOMHtSuToDvC5Qj2BFgCz4SaXvMpCLI2KGgp246LhKiSoPCjnAh5iI8d0z+?=
 =?us-ascii?Q?9lGTDCAB+QwMU2NpZKJI8Et18h4/8eR9ZvthdN1INoNcyNtU4HpHgEXu8dvy?=
 =?us-ascii?Q?g7n9pHy9ujb6uGZDN7HQ1b9uevSkpkiKc3OQGcb0xDhgye0CLUqGtzAYOPh7?=
 =?us-ascii?Q?nTR/dVP5qeYdLyxij3jzeIABriXCRrnjA8ODGgqdtLc/5bFj3SW5mW8viLdc?=
 =?us-ascii?Q?r6+qjrtv/AkrWljY+zUpsxjia8bTY90Z+785BA9NmMpf+UtITzrh+QRC6q2Z?=
 =?us-ascii?Q?CHxoCHQ9NEvdnsI8wycpZ/OnWfVG2OCQjTPga1Fm539FkjCHkmWz1C14CoRh?=
 =?us-ascii?Q?Jr2ohWAd8zSWE9NKgVSsJvgD7CawIhMwQPGXlXnWEumLdezR3EaluPqPkMIz?=
 =?us-ascii?Q?8FAC18f4ImdLwa8fQdUpmUeW7Y5JyM2jbDZT+GKb/R+AHsUXeCgWrOywQzsS?=
 =?us-ascii?Q?iIrfCflmFQwx6pcz/gI0aLu/9bzu4r9S4oC04bZIC0l3VzeYw1QiE2uSqzPF?=
 =?us-ascii?Q?RcaMhHTLZRFfUfw0uKlHwD9/VhlvYaeKxwvllHGFl8haVR3zEe6nH/0d9u/h?=
 =?us-ascii?Q?yHYdcoei823cYTGICB5HnLj3g8s7xfiHuSV4QH+FgFu3/293FLGSy4e/Luxw?=
 =?us-ascii?Q?vfumCiC6Brx+pleiQaUbWhVoBju5IsD9aRH9bjSAFC+JvUglN9zHgucooPLp?=
 =?us-ascii?Q?JNhv/lTNcaNk8rldxu5yp0lE+KmYEIkPK0iPXZyX3WOiRb8v1uHirJBWfJTF?=
 =?us-ascii?Q?FxdvClbCysxhTTBtlkfwSqoTwN4PMSaNHD9EhtOUhvEGcN/tbO/HtJoGTVS4?=
 =?us-ascii?Q?NXjshDzvswVUinCQpZKRH4kJga6x5vvNTQcJ+kTxPn0wAJbbA2lWora56DdX?=
 =?us-ascii?Q?vd3l/qOrXPf9QrJfL+WsEBSlz2nUSDqT7UMlmy6ymm7CcS75rrEN9v90EmcW?=
 =?us-ascii?Q?fmUDiNnOlbjfFAgHif1+1o3VYgfWdtdizrjwh3Ld5dMMrN2QpiuWcrNcFX+R?=
 =?us-ascii?Q?L4pPLHHqkcySJwF8mmj+EXu9j8HbntaOt6QgX0q0aYJv8UJnplK4diJPF9+z?=
 =?us-ascii?Q?TPMVWwf8d4crBH3pREy4++Zf7xsOFItjzVrjNtGUajA+4IAifQRDC0+G7KG1?=
 =?us-ascii?Q?uw=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	eezm8zmvEIJZHpT4maAYnie0tVfb5J30UlDBMxBBWB5KdfWKahn3wJPHi33btqWeg1itLUUrdRyarupAnio5wlmc7rBmJXWvVV0MGDqR1uqKSPxOYpcTnYASBG7wOGlnxPoR7McgQYyNmc8qf7fB23B7kxshCLRUdQUiMiGuTCwPLTh4bL0n2TiJXj7C0j4Y19jiw1o27W6jlgB6F94fiatXamhxwDChRPBHs0VBwPjaXyXVZV7QLt8HK3HN0LO7hGKoSfg9f/p9E9an8OSJHjSS6Q6pTlolxscBJ0o6JJJwGICl1haQnTsc11/a/tNaQE7mNiSCDiVIsl4vWyEw46nyRSf1iEp/dBpZh8xlXkV+cJDOp+EnJIMfX6wOmb64ht9ttd12dR9XxJbX5Akms0ha0l3uv5PLNS09VxJOoLQ92bb4DHPtUNy+Jr8jvlr5PcFsJ0cAUVwBqo1rn5dhngB2KAzWN3yuBvN5kLfNcsfvKw5M57i+8d762N/56NPxbMB9F9wvPbjzdbxeNxi62RpxWpkS3SxmAZo7bqTLcsLva2fwsaXhEeKuMWQBb+9OU1rvBCIzCRsZdwvOEGmwGQrjknp70vHSYMKyo4NPOJM=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 79e17e5f-d3f7-4b7d-c4ab-08dd89775d54
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 May 2025 12:46:31.7190
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4IwCQRkChUQ5ZbfNQ+jJWIhS/YuwuwkHweY7SQOfjNr4FOx9k0sBb98GpSLUONR9rLXM3ny32EJz/tKDrVoE4F1qUCF2Iok//vseSLhAASU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB5584
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-02_01,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 phishscore=0
 suspectscore=0 mlxscore=0 malwarescore=0 adultscore=0 spamscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2504070000 definitions=main-2505020101
X-Authority-Analysis: v=2.4 cv=ZsHtK87G c=1 sm=1 tr=0 ts=6814beab b=1 cx=c_pps a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=dt9VzEwgFbYA:10 a=GoEa3M9JfhUA:10 a=TAZUD9gdAAAA:8 a=yPCof4ZbAAAA:8 a=VwQbUJbxAAAA:8 a=T-TrzDLiglJnOVjFs0cA:9 a=CjuIK1q_8ugA:10 a=f1lSKsbWiCfrRWj5-Iac:22 cc=ntf awl=host:14638
X-Proofpoint-ORIG-GUID: Gcy9klm2XWAxGN22fPSjJkNDr8l81Wly
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTAyMDEwMSBTYWx0ZWRfX+ljQT7hBV1Gw x8lIewVIZde/8h97Y3mvZ++JvG6Pm8IdyUqjiaIVTeANuiz0ZQ7k1z3bG/hsTJnW3xCPIrURuJN rf83M039TNUGf501/Q3xgV94cTmB8YWQPaemnT55Wwk2t+EGFfxhE+Fl3P4cW8R9CecGYt30As7
 LdBaRfzZrAE1EtvYl5CZ21t9aHIqUCUgpjZUaUad8uhNM3vZ/mHduZIF+j/nwYlQCCfNVKSyHlG yYXRqGeIN4zYOlLZeMsJfSRkIe/XUPlGxRL+njxQO29ImDnhk2A3hRu2wgXa/yhN9ULB70XRR4d Bf2IRajuOH1T1bSj5CEZ6Gqms7eX1w5F3vU7LSBZdFV4gwg1EqeT+HnFwbT1VrfLbkYsR4yrqhT
 hYg1nxhv1aSXcTQvNNTN2qPlZ7bdVa7SwLHDDZz+KXNGQt46CICOU8O9nOv1fZdr294fRdcj
X-Proofpoint-GUID: Gcy9klm2XWAxGN22fPSjJkNDr8l81Wly

+cc Andrew.

Ignacio, you should always include Andrew in patch submissions to mm :)

+cc Yang Shi who added this in the first place in commit c4608d1bf7c6 ("mm:
mmap: map MAP_STACK to VM_NOHUGEPAGE").

On Fri, May 02, 2025 at 11:31:41AM +0200, Ignacio Moreno Gonzalez via B4 Relay wrote:
> From: Ignacio Moreno Gonzalez <Ignacio.MorenoGonzalez@kuka.com>
>
> commit c4608d1bf7c6 ("mm: mmap: map MAP_STACK to VM_NOHUGEPAGE") maps
> the mmap option MAP_STACK to VM_NOHUGEPAGE. This is also done if
> CONFIG_TRANSPARENT_HUGETABLES is not defined. But in that case, the
> VM_NOHUGEPAGE does not make sense. For instance, when calling madvise()
> with MADV_NOHUGEPAGE, an error is always returned.
>
> Signed-off-by: Ignacio Moreno Gonzalez <Ignacio.MorenoGonzalez@kuka.com>

I don't see how can this cause a problem, and it fixes one in practice, so
LGTM. Though see note below about CRIU :)

I also added a nit below, if you address this you can re-use my tag.

Reviewed-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>

Thanks!

Do we want to back port this to stable kernels? If so we should have a:

Fixes: c4608d1bf7c6 ("mm: mmap: map MAP_STACK to VM_NOHUGEPAGE")
cc: stable@vger.kernel.org

Appended here, and Greg's scripts should automagically backport, assuming
no conflicts or such (I don't _think_ there would be...)

> ---
> I discovered this issue when trying to use the tool CRIU to checkpoint
> and restore a container. Our running kernel is compiled without
> CONFIG_TRANSPARENT_HUGETABLES. CRIU parses the output of
> /proc/<pid>/smaps and saves the "nh" flag. When trying to restore the
> container, CRIU fails to restore the "nh" mappings, since madvise()
> MADV_NOHUGEPAGE always returns an error because
> CONFIG_TRANSPARENT_HUGETABLES is not defined.

Yeah this is really not a stable or valid use of the /proc/$pid/[s]maps
interface :P CRIU is sort of a blurry line of relying on internal
implementation details so we're kinda not obligated to prevent breakages.

CRIU is kinda relying on internal implementation details so debatable as to
whether we should be bending over backwards to support.

BUT, we also don't want to cause unwanted issues if there's a simple fix
and this seems reasonable to me.

> ---
>  include/linux/mman.h | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/include/linux/mman.h b/include/linux/mman.h
> index bce214fece16b9af3791a2baaecd6063d0481938..1e83bc0e3db670b04743f5208826e87455a05325 100644
> --- a/include/linux/mman.h
> +++ b/include/linux/mman.h
> @@ -155,7 +155,9 @@ calc_vm_flag_bits(struct file *file, unsigned long flags)
>  	return _calc_vm_trans(flags, MAP_GROWSDOWN,  VM_GROWSDOWN ) |
>  	       _calc_vm_trans(flags, MAP_LOCKED,     VM_LOCKED    ) |
>  	       _calc_vm_trans(flags, MAP_SYNC,	     VM_SYNC      ) |
> +#if defined(CONFIG_TRANSPARENT_HUGEPAGE)

NIT, but can we use ifdef here for consistency? Thanks.

>  	       _calc_vm_trans(flags, MAP_STACK,	     VM_NOHUGEPAGE) |
> +#endif
>  	       arch_calc_vm_flag_bits(file, flags);
>  }
>
>
> ---
> base-commit: fc96b232f8e7c0a6c282f47726b2ff6a5fb341d2
> change-id: 20250428-map-map_stack-to-vm_nohugepage-only-if-thp-is-enabled-ce40a1de095d
>
> Best regards,
> --
> Ignacio Moreno Gonzalez <Ignacio.MorenoGonzalez@kuka.com>
>
>
