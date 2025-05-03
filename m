Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BB161EF388
	for <linux-kernel@vger.kernel.org>; Sat,  3 May 2025 21:14:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746306860; cv=fail; b=YLOil3TXRV9cB3uaAKWYy+4qpNmXoSbE6j7uf/q3LCjOPKz6HMOLglF2qDmt8AdUOd6RylCrKXVe2K57BlixQA3im5nfKyxTyzPEWnniAx+Ebt9AokK2b1PtlVCDSBwL1xWCaNuvdBq9fAL6UxCtVBs71gwuT3yXU54pcLSqSF0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746306860; c=relaxed/simple;
	bh=1nVwT8Qz7gY2+6E7+ExaOHrkI5Z8hkHbWSV+0IQ6v10=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=F6guHVwepLE1j8m0mSlrdJksVLqtvU+2nMYweEwHzb9UzYnXCr17YUFchHEo9rWbW7bm+tVk8X4kJX8r6EErT12rHgMw5b4/OTo2VkYzV4CxyU+QF67iNIPsotgxa9WRAfnmGjpJrfpMhEeeegr4c9hT1n4n4hu7DAAdYEYh6hw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=G7gi2wIz; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=FBdSTO38; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="G7gi2wIz";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="FBdSTO38"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 543L71kq019538;
	Sat, 3 May 2025 21:12:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=KKypNneju+ZCFRWSRZLiyimU0q1NOEC2ITaqC8aPPdE=; b=
	G7gi2wIzEbCU3GaNpLworidWIxUp8D+3b6Sw+uuNsW0smqMBoLBsooWAImLILn16
	UUX1Hp1YDvNeddtQSaHyeffErKl1v3Q8OLOw2AD70FujLBYHn6AiL6bSHcyuLGPg
	7dIILGOXQFGJpociZBVkfMHMgfDJ+n20VUVOjEUBnNXXC2zrp+yYN/unU9rYJkbb
	KA1Uc343ydZDxGIwijRo/i7+nYfcTtrTt/IUli/Ilg2xVm/gHf9uvOxL8TkQ0+yt
	TciSpH9GSR5Yn/5nSU8A+HC53N0TToOueo70w6GwowvYAgY84Qrrd7MZDjdRoVkU
	eB/47HA8fBVty5w4CRTtVw==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 46dsp300xt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 03 May 2025 21:12:56 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 543Hp2va036150;
	Sat, 3 May 2025 21:12:55 GMT
Received: from dm1pr04cu001.outbound.protection.outlook.com (mail-centralusazlp17010007.outbound.protection.outlook.com [40.93.13.7])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 46d9k6f616-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 03 May 2025 21:12:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sjW2A3AKCsz6LFavOQq4/JZcuTd3x9aoGQ1Eg9HfMz6EFjZMmLRKFT8GbyolY/H8ELmmmaS7F6n5Ke4ZRQoUWstocET4Mb/xS0KuSlTGKEmMVGndeMLQMFjti/oSJGdtTHRneZSfQWJrgJLClMNUD5AW9UpMNVhm7EmNFXrp45mD7DRqNFzGD5vEziEux09SlzOJ6yHYYPjm8HT6YX2UOWwGt5C6Ah5AFPySMF/IYAydIjyZHsVejgk5HiUQLqX9hw75hbpZTvk83tnwmWxVe6OvDbcYPZ2IIXx1EHCmd4HWBgaryglJaC/rjZ/IMh8bH/bsl9K0cod8/ODsbCH4eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KKypNneju+ZCFRWSRZLiyimU0q1NOEC2ITaqC8aPPdE=;
 b=LDy77FoOdLN0qMNLXEG01IXZAburZTDxFk2n8c/O5mLIh4Jb9717h+/I20vB/JU1nJ06xXTMncdwfooASRftjSOparhSFMQA/i/rxtOgkSBIsKKDAnuJe2IwOEXAQsL8liGF6Hb3xDDaIr96yhWlXuzReDgYDDFm5JebTAH1dwPW9o7ccg909/swwvApWiFpM2r4YDIbNaogGHjVkxqI3KHVvKYOgQvOmh4Y96/MhGwlSl/lOM+NUVbItisxMh8jMbABHDqJePtu7Glt5yyRdLxUyFWrXdqGCh+MpsY7JguEVvVfe+dLC7nn8XgPFum4H7RRaDKvk2V7V5PAc2P1Yw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KKypNneju+ZCFRWSRZLiyimU0q1NOEC2ITaqC8aPPdE=;
 b=FBdSTO38HvYSCRp5ruuHG3JBEGxC858LN0zzDuz9Yk1zOJkDhr2UqbV7pmbW9DoTev8rMJEL5nn/1Jio9RxAg2mXVCKtThzdgAjOlOk2N61ZiPNCmDLXohWaAfRGveZzGcWsMkzCzQspSgHMG8Tpyv/7nTQ77SsjNEuQ5UaEk50=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by CH2PR10MB4373.namprd10.prod.outlook.com (2603:10b6:610:a9::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.24; Sat, 3 May
 2025 21:12:53 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%5]) with mapi id 15.20.8699.022; Sat, 3 May 2025
 21:12:53 +0000
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Vlastimil Babka <vbabka@suse.cz>, Jann Horn <jannh@google.com>,
        "Liam R . Howlett" <Liam.Howlett@oracle.com>,
        Suren Baghdasaryan <surenb@google.com>,
        Matthew Wilcox <willy@infradead.org>,
        David Hildenbrand <david@redhat.com>, Pedro Falcato <pfalcato@suse.de>,
        Rik van Riel <riel@surriel.com>, Harry Yoo <harry.yoo@oracle.com>,
        Zi Yan <ziy@nvidia.com>, Baolin Wang <baolin.wang@linux.alibaba.com>,
        Nico Pache <npache@redhat.com>, Ryan Roberts <ryan.roberts@arm.com>,
        Dev Jain <dev.jain@arm.com>, Jakub Matena <matenajakub@gmail.com>,
        Wei Yang <richard.weiyang@gmail.com>, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org
Subject: [RFC PATCH v3 03/11] mm/mremap: add MREMAP[_MUST]_RELOCATE_ANON support for large folios
Date: Sat,  3 May 2025 22:12:25 +0100
Message-ID: <8ca7c8219a2a0e67e1c5c277d0c0d070052de401.1746305604.git.lorenzo.stoakes@oracle.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1746305604.git.lorenzo.stoakes@oracle.com>
References: <cover.1746305604.git.lorenzo.stoakes@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO2P265CA0325.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a4::25) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|CH2PR10MB4373:EE_
X-MS-Office365-Filtering-Correlation-Id: 1084e05c-f038-428b-40b5-08dd8a874473
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?b7l5WsZq7f9dO+5c4avuO2PQAgSZ6iVYozcdM+8Ab7xqAK2nuHMsvceMegkZ?=
 =?us-ascii?Q?mqHAhp96RpFYmo7fGp8h9s71ru4We77ptvfSF0GcRnZFenokrHUTsBSoke5u?=
 =?us-ascii?Q?WA9PkR0M4JmA3Nqo7f7+Pnbhh5TUGMaSwAl/WgDDZjUqyQiLnfioWE86Htp6?=
 =?us-ascii?Q?vhwkZANEOvY3HGe51Ejo/z7C8y/hnE62MC/xG8gQr8ld2gMRK8Ts+bg0Nv6S?=
 =?us-ascii?Q?DiH8qzwktPy1YPY566+d8EL86YjNgEUqyhdmoJ4Q1yrNo+E0nCzPp3SoT4Tg?=
 =?us-ascii?Q?0+xCH5alZu4vl+oYl8/DboDnOiIz5qrXxIh9JJIY3iCD6e88pj7hGtX76NhS?=
 =?us-ascii?Q?CMJ6PrgCJchGEC1GwttMhJy6cWqEr4RJd4cOmnxFDJm3EDu3JcXxg0UM/vwU?=
 =?us-ascii?Q?IPn+TQWWgK6qJtfPYluf1Ipv4Xut/ADdVz0BgKgM67RIvXeQL++HxmT/OvIe?=
 =?us-ascii?Q?lsc2v0CsAF1LH3Qho20WnivCnMcaYjFF28NuMBclTydfAm78GC3zNLPs6yyq?=
 =?us-ascii?Q?11YGHwAC7SZi7PxcqUHIcXlp2ataCKTQJwP65EB3lyQqdAsJg7JI4UJmb7MM?=
 =?us-ascii?Q?ml0vCyETm6OBGd/AMK/VmaV5oqY88pzlBIMmT3xBpI4aNHgU5qzE3BDgbTb+?=
 =?us-ascii?Q?NI21qRw0WM5ayF5NXBqFQbxRnWsx8fwGYrJvU5CDRvsBsXqVUEiXcC78HOjc?=
 =?us-ascii?Q?vXw8AvN1pVQ4azcBs8IFSe/e02rr7tg+m2MWZnTuk+b9CBBwkVV2odiIPoeR?=
 =?us-ascii?Q?8Fi6DNY4e+g5PoJHUITD0cr9/xPIPk2UTNxt+/+Vib+U9wZ3KVadPJZVyfcj?=
 =?us-ascii?Q?M62J6d7uhV8Y8K/s5an9hfRoCM/7+CExuOKCcMoQ+zMChl4YcdCgfBN+eYnX?=
 =?us-ascii?Q?XsT3Yu5q/Qv5NmcTmbNEJHpr4opKh1W5bqeECLiXz8TDXZNFrsHjCDgpdesw?=
 =?us-ascii?Q?L46dr/hBCJGpQHPHa4XQXQAFWex3iRO2POAVpNUEmKq8eWlb6ORwzxR0oPEI?=
 =?us-ascii?Q?QXxRnx6g0B2XO92y1fTLXa9epxrmZqAOdEOlurhtRI3pFszyq57B3Hu6k40s?=
 =?us-ascii?Q?KJLT4f4FTapyNpvY2iI1lpfCFOcpQQHA5+z/CH7Jn9GQRrzEgLaEEW+4FE23?=
 =?us-ascii?Q?/ep99K7qaNLtOVNdf+qDwcJM0tVopcKLR8elTiQnHrs3KO+u2FSQubdm3bi7?=
 =?us-ascii?Q?mdK/F1taYOrSxhFH8+Scf8G5suhVMn8qN/g+dFyMK7x4SYZjUUpeAIXicAVf?=
 =?us-ascii?Q?MIW9Nx4T4+8CYXzvqtL7OjM3uTY50Xt04jLplXl8CW92mVrnc9BhDd3D8MNk?=
 =?us-ascii?Q?FhCxDiY1U64WeXu7u1RcSQ7iRCXNkCfhUb6C93K0kr5usHyI4RHey/64XoyT?=
 =?us-ascii?Q?54IsEqDu20eXvfdKVR4m+e9tmdUdRdyb7ISq8ZAlwJo2dvkQ9235x5BBCXMq?=
 =?us-ascii?Q?3LhGwT+nwzo=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?de7A9NrxgMwefZBzqrpHOK6g9NfFeUGS7TrZa+BHxHTo9PixZZjv8I2bnDCm?=
 =?us-ascii?Q?Sf1ZNBbzjFKcf5piIMkfgL25Xhm+CfYsyf48gYN//feXSc20pbyNR/kQ6iTC?=
 =?us-ascii?Q?WNW4hSj6RnNkMA6Wcwarq6UGmqO2gHN1Zj8ZxVIPN/D26FF2sm0i1XO4bODj?=
 =?us-ascii?Q?B4tz3OY8KGM3uvMbs0pxG9dbtEKBlDVzKzCwR7oFltpDNMa9GLZ1BdAJ1gQZ?=
 =?us-ascii?Q?wvlre6knqfIEf4IDtWPWJfPBKQJFsEUwCjxxG2kMtKFwKrCMgknWsRtKWpiu?=
 =?us-ascii?Q?TwxF4F6yCYsel79wOMTwRFhrr/DeWBiBcvic91UlgdzC5C91bGXmKIuImvjJ?=
 =?us-ascii?Q?W35E+e2W5MsCjvra1il1uncaEvlY40slkYoQNtKrHFZIodYC0SYHjKT+5zMm?=
 =?us-ascii?Q?meLbgjU9s0Mr2RfiT5BGSjZATkpJzhGK1odYVQ1Eyx8l3ZJatHpHn9qutt97?=
 =?us-ascii?Q?INooctzQXesaHKsQA22n/ZPISDGUmURCafxJjwhpAYADjP6EvEriu3EzbbRs?=
 =?us-ascii?Q?w5VDGtlnxgaN/qN51i2yRPv2L6QtDWwgqrFhupy8DFM0JOasiCNtlDgaebWJ?=
 =?us-ascii?Q?HKnvxSVkjieS3EYMKdDNuxwIL1WqglTR+sP399ZWTnXW+7VfNJRgveUULsrM?=
 =?us-ascii?Q?5k7xIiotN/QIn/E6NVh/APxc5LYyWVi3RyHlcWws/gk7ez+vmqSV9xmUbJBi?=
 =?us-ascii?Q?WSCMHpv3QpFB0x2jWhpp3zHAak0vomO+P52+Igb5OBMZlR1Q578IMsxiS1tU?=
 =?us-ascii?Q?TcCiJl8iXemqpATy/DOufTdkc0y7JLV6lHswDbaI9XLjS4UG41rl4efqAs0P?=
 =?us-ascii?Q?4eR2Yvjr0cOWs6O9/m4NCsyJiYB3cNQSA3TUHGL5Y/eDO1NlijfVZN1rrOyN?=
 =?us-ascii?Q?Q+P8wzbsLMPL6O7HwkLprcQKgxssxlroP2prhApiSmxZk9M8himhum8f8Eot?=
 =?us-ascii?Q?Y3PNFQlohBtipsf+wksOcm1ql6WHoTgX98qrvMbiX2J3aix+N8vMMn1gjs+t?=
 =?us-ascii?Q?AfvTD5uCFsEwrcEqW9I4KMOlatkqizduyd5e2JHUVRkyjz13DeaiXr/t2gSb?=
 =?us-ascii?Q?iKGTX0fkGnkx2R7DGgMnr0vQvXKJoKqvYorvsMu5l9dxToe7ecTF/BlZkjEL?=
 =?us-ascii?Q?wofoYHtJJk8Oj22KY3ATWzlo34fJP9AptaAZODKlUVl1qcIw5Ip0HVQbJxXx?=
 =?us-ascii?Q?NLibPuENge+RGBYHx/rctiXo/Qxd0cM5qLXEhxaRPFdYzEjwzHkfLEL5kBsi?=
 =?us-ascii?Q?LHO/eSM0IC60TydwAobpnwCwXC/40FrkdQ6Se7SX0mgeLtm/YvoVjox3xWqq?=
 =?us-ascii?Q?uCVQMaKRSyT/3aA6JoN3ejDA6Rq0tp5ksPIyVAaw/MXUVlFB+7jH8MtDJb7w?=
 =?us-ascii?Q?Pa6lknsS6Yz4Yi7zx/I1Bxh6OIbFmjiL42cRrCbAc7DA8iNpjcFYK8gySEvC?=
 =?us-ascii?Q?wjtk4lPerAGQ4+C5/bsoEKAgosIqouIl/b2k/SSDLANEzWOVB8cI7m3rWrGx?=
 =?us-ascii?Q?dPB313S9IewzDSWnY4nyZLpdJUl04V2nuw8L6lMyVx34zyijUFU3KeA0xqjI?=
 =?us-ascii?Q?0G/piRYO+gpuD4+y3nxQYgB92tkvD/wKyrM4O8fHDUXq67EcJCGXkarsTrrd?=
 =?us-ascii?Q?Xg=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	2B44SN8hyIEsBftIYzMsO6ciAPJnK2lPQU00YbndjxPun0CPIYxaFXnq8Z6Sr0WifGscmV5yz/QqxrbFQvkIcAaMoK6CWcAkoMBPpKOlHNoY1iMiTiuzpTAXp3xged9cXRMaNgU+NYhgYpte7sNSRapT5ipiDaFw+Clt6S4S3wpbBaZKLYAVPJPUPOdwLnmzZwwQhT1ZfpWtR1hRZ1H/LOLipLoGAzp4P1vlJRleLMGKVCuXXzkhSR9XtB7dFKws7sGvUkRwlRHU21AuYJL7kepe5N/3VJJPBLvB5hskCOptjCFm3m7AplOWykujpjGw/oCj9+z6AOTnVSo+j6iRLvgkAQds/btWKKowGl/sTVmbFFR3jmkJrtzO6lsVFBdkODLzJSnnhHYp5O0RoI1oRvNazuaYDnn9O/ktpbt6ZIhckGJJxvGbSNqZvCfu6g9lbFH3kaJNIpkh1dbXeKLxNOYBceDkhTv9iiLnqgg8rHdcV0roNKfhygqvNakRWpsf24Ao35qcz8ROdC3rn4SfqEHyFpFrHOiRWxgD6cFK6HDiV+hlUPDQl9misVGijdHYSkIBmpEqJLSbqxBK+x3EOSJSzSGJMqX/Z/Lt5RcFj14=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1084e05c-f038-428b-40b5-08dd8a874473
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 May 2025 21:12:53.2316
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9JGHMc8wWJtGpVk4e147DpSA7JNHz6A0uJA8LxgfmXsWZy2s73IHxHgEn5cjDOLHa/9wxI4cjQZp6rhioY0LA4tnrLtOGvHrhd4iV1f36JA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR10MB4373
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-03_09,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 phishscore=0
 malwarescore=0 spamscore=0 mlxlogscore=999 bulkscore=0 mlxscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2504070000 definitions=main-2505030196
X-Proofpoint-GUID: _sV1tnk3uPDkG0Vu5ZYdquPIGRTtLQjq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTAzMDE5NSBTYWx0ZWRfXzBzIoaqrvpO3 oSEQAc/ahLvrlnyn4wuoC8TGM9j4V4rWNIy+S+RX2iuEJViT+KDvUYc/HbkkZlkmNXhJCH3yyv6 +WBiA+NhNg7unRPsgL7O32ih7CLUpV7ayiF2kBB1f/Gy/VO3R/CLDt8FMfklmFDfIiWfM7IN3Fe
 bkYSxR5PAHAg80uS7hpeI7Ut0etvhsioM4lDxg88A3jCQZ6AK4BJn0n7PBdKmhc73ByO8NNLtBP QteFokNhSyvfLAx1K79qaKvIYm6ZvvW5L/cmKMuSqRkxKD4/funpC5ZIPtNH1bboTSCJsZos/ll xBjLuZWvp2y+RSyz2yJR456SnqmvPO23EQRnXIOxadKmLXnogn3ad6UdKFRm2Ms/5K8DYatHlJE
 xGAsYukDrh4lyj3LN2CX0GZsUkivaX2easYGLSbE96ZdWYIdx67p3NBuTaiVXBmptz+b8ECv
X-Authority-Analysis: v=2.4 cv=NN/V+16g c=1 sm=1 tr=0 ts=681686d8 b=1 cx=c_pps a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=dt9VzEwgFbYA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=OzY_kpnUWJltT3yWpIcA:9
X-Proofpoint-ORIG-GUID: _sV1tnk3uPDkG0Vu5ZYdquPIGRTtLQjq

Larger folios are a challenge, as they might be mapped across multiple
VMAs, and can be mapped at a higher page table level (PUD, PMD) or also at
PTE level.

Handle them correctly by checking whether they are fully spanned by the VMA
we are examining. If so, then we can simply relocate the folio as we would
any other.

If not, then we must split the folio. If there is a higher level page table
level mapping the large folio directly then we must also split this.

This will be the minority of cases, and if the operation is performed on a
large, mapping will only be those folios at the start and end of the
mapping which the mapping is not aligned to.

The net result is that we are able to handle large folios mapped in any
form which might be encountered correctly.

Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
---
 mm/mremap.c | 327 +++++++++++++++++++++++++++++++++++++++++++++++-----
 1 file changed, 297 insertions(+), 30 deletions(-)

diff --git a/mm/mremap.c b/mm/mremap.c
index efa0d3c2ca20..ce70139ae784 100644
--- a/mm/mremap.c
+++ b/mm/mremap.c
@@ -77,6 +77,7 @@ struct pte_state {
 	unsigned long new_addr;
 	unsigned long old_end;
 	pte_t *ptep;
+	pmd_t *pmdp;
 	spinlock_t *ptl;
 };
 
@@ -532,40 +533,67 @@ enum pgt_entry {
 	HPAGE_PUD,
 };
 
-/*
- * Returns an extent of the corresponding size for the pgt_entry specified if
- * valid. Else returns a smaller extent bounded by the end of the source and
- * destination pgt_entry.
- */
-static __always_inline unsigned long get_extent(enum pgt_entry entry,
-						struct pagetable_move_control *pmc)
+static void __get_mask_size(enum pgt_entry entry,
+		unsigned long *mask, unsigned long *size)
 {
-	unsigned long next, extent, mask, size;
-	unsigned long old_addr = pmc->old_addr;
-	unsigned long old_end = pmc->old_end;
-	unsigned long new_addr = pmc->new_addr;
-
 	switch (entry) {
 	case HPAGE_PMD:
 	case NORMAL_PMD:
-		mask = PMD_MASK;
-		size = PMD_SIZE;
+		*mask = PMD_MASK;
+		*size = PMD_SIZE;
 		break;
 	case HPAGE_PUD:
 	case NORMAL_PUD:
-		mask = PUD_MASK;
-		size = PUD_SIZE;
+		*mask = PUD_MASK;
+		*size = PUD_SIZE;
 		break;
 	default:
 		BUILD_BUG();
 		break;
 	}
+}
+
+/* Same as get extent, only ignores new address.  */
+static unsigned long __get_old_extent(struct pagetable_move_control *pmc,
+		unsigned long mask, unsigned long size)
+{
+	unsigned long next, extent;
+	unsigned long old_addr = pmc->old_addr;
+	unsigned long old_end = pmc->old_end;
 
 	next = (old_addr + size) & mask;
 	/* even if next overflowed, extent below will be ok */
 	extent = next - old_addr;
 	if (extent > old_end - old_addr)
 		extent = old_end - old_addr;
+
+	return extent;
+}
+
+static unsigned long get_old_extent(enum pgt_entry entry,
+		struct pagetable_move_control *pmc)
+{
+	unsigned long mask, size;
+
+	__get_mask_size(entry, &mask, &size);
+	return __get_old_extent(pmc, mask, size);
+}
+
+/*
+ * Returns an extent of the corresponding size for the pgt_entry specified if
+ * valid. Else returns a smaller extent bounded by the end of the source and
+ * destination pgt_entry.
+ */
+static __always_inline unsigned long get_extent(enum pgt_entry entry,
+						struct pagetable_move_control *pmc)
+{
+	unsigned long next, extent, mask, size;
+	unsigned long new_addr = pmc->new_addr;
+
+	__get_mask_size(entry, &mask, &size);
+
+	extent = __get_old_extent(pmc, mask, size);
+
 	next = (new_addr + size) & mask;
 	if (extent > next - new_addr)
 		extent = next - new_addr;
@@ -795,6 +823,165 @@ static unsigned long pmc_progress(struct pagetable_move_control *pmc)
 	return old_addr < orig_old_addr ? 0 : old_addr - orig_old_addr;
 }
 
+/* Assumes folio lock is held. */
+static bool __relocate_large_folio(struct pagetable_move_control *pmc,
+		unsigned long old_addr, unsigned long new_addr,
+		struct folio *folio, bool undo)
+{
+	pgoff_t new_index;
+	struct vm_area_struct *old = pmc->old;
+	struct vm_area_struct *new = pmc->new;
+
+	VM_WARN_ON_ONCE(!folio_test_locked(folio));
+
+	/* no-op. */
+	if (!folio_test_anon(folio))
+		return true;
+
+	if (!undo)
+		new_index = linear_page_index(new, new_addr);
+	else
+		new_index = linear_page_index(old, old_addr);
+
+	/* See comment in relocate_anon_pte(). */
+	folio_move_anon_rmap(folio, undo ? old : new);
+	WRITE_ONCE(folio->index, new_index);
+	return true;
+}
+
+static bool relocate_large_folio(struct pagetable_move_control *pmc,
+		unsigned long old_addr, unsigned long new_addr,
+		struct folio *folio, bool undo)
+{
+	bool ret;
+
+	folio_lock(folio);
+
+	if (!folio_test_large(folio) || folio_test_ksm(folio)) {
+		ret = false;
+		goto out;
+	}
+
+	/* See relocate_anon_pte() for description. */
+	if (WARN_ON_ONCE(folio_maybe_mapped_shared(folio))) {
+		ret = false;
+		goto out;
+	}
+	if (folio_maybe_dma_pinned(folio)) {
+		ret = false;
+		goto out;
+	}
+
+	ret = __relocate_large_folio(pmc, old_addr, new_addr, folio, undo);
+
+out:
+	folio_unlock(folio);
+	return ret;
+}
+
+static bool relocate_anon_pud(struct pagetable_move_control *pmc,
+		pud_t *pudp, bool undo)
+{
+	spinlock_t *ptl;
+	pud_t pud;
+	struct folio *folio;
+	struct page *page;
+	bool ret;
+	unsigned long old_addr = pmc->old_addr;
+	unsigned long new_addr = pmc->new_addr;
+
+	VM_WARN_ON(old_addr & ~HPAGE_PUD_MASK);
+	VM_WARN_ON(new_addr & ~HPAGE_PUD_MASK);
+
+	ptl = pud_trans_huge_lock(pudp, pmc->old);
+	if (!ptl)
+		return false;
+
+	pud = pudp_get(pudp);
+	if (!pud_present(pud)) {
+		ret = true;
+		goto out;
+	}
+	if (!pud_leaf(pud)) {
+		ret = false;
+		goto out;
+	}
+
+	page = pud_page(pud);
+	if (!page) {
+		ret = true;
+		goto out;
+	}
+
+	folio = page_folio(page);
+	ret = relocate_large_folio(pmc, old_addr, new_addr, folio, undo);
+
+out:
+	spin_unlock(ptl);
+	return ret;
+}
+
+static bool relocate_anon_pmd(struct pagetable_move_control *pmc,
+		pmd_t *pmdp, bool undo)
+{
+	spinlock_t *ptl;
+	pmd_t pmd;
+	struct folio *folio;
+	bool ret;
+	unsigned long old_addr = pmc->old_addr;
+	unsigned long new_addr = pmc->new_addr;
+
+	VM_WARN_ON(old_addr & ~HPAGE_PMD_MASK);
+	VM_WARN_ON(new_addr & ~HPAGE_PMD_MASK);
+
+	ptl = pmd_trans_huge_lock(pmdp, pmc->old);
+	if (!ptl)
+		return false;
+
+	pmd = pmdp_get(pmdp);
+	if (!pmd_present(pmd)) {
+		ret = true;
+		goto out;
+	}
+	if (is_huge_zero_pmd(pmd)) {
+		ret = true;
+		goto out;
+	}
+	if (!pmd_leaf(pmd)) {
+		ret = false;
+		goto out;
+	}
+
+	folio = pmd_folio(pmd);
+	if (!folio) {
+		ret = true;
+		goto out;
+	}
+
+	ret = relocate_large_folio(pmc, old_addr, new_addr, folio, undo);
+out:
+	spin_unlock(ptl);
+	return ret;
+}
+
+/*
+ * Is the THP discovered at old_addr fully spanned at both the old and new VMAs?
+ */
+static bool is_thp_fully_spanned(struct pagetable_move_control *pmc,
+				 unsigned long old_addr,
+				 size_t thp_size)
+{
+	unsigned long old_end = pmc->old_end;
+	unsigned long orig_old_addr = old_end - pmc->len_in;
+	unsigned long aligned_start = old_addr & ~(thp_size - 1);
+	unsigned long aligned_end = aligned_start + thp_size;
+
+	if (aligned_start < orig_old_addr || aligned_end > old_end)
+		return false;
+
+	return true;
+}
+
 /*
  * If the folio mapped at the specified pte entry can have its index and mapping
  * relocated, then do so.
@@ -811,10 +998,12 @@ static unsigned long relocate_anon_pte(struct pagetable_move_control *pmc,
 	unsigned long ret = 1;
 	unsigned long old_addr = state->old_addr;
 	unsigned long new_addr = state->new_addr;
+	struct mm_struct *mm = current->mm;
 
 	old = pmc->old;
 	new = pmc->new;
 
+retry:
 	pte = ptep_get(state->ptep);
 
 	/* Ensure we have truly got an anon folio. */
@@ -851,13 +1040,55 @@ static unsigned long relocate_anon_pte(struct pagetable_move_control *pmc,
 	if (folio_maybe_dma_pinned(folio))
 		goto out;
 
-	/*
-	 * This should not happen as we explicitly disallow this, but check
-	 * anyway.
-	 */
+	/* If a split huge PMD, try to relocate all at once. */
 	if (folio_test_large(folio)) {
-		ret = 0;
-		goto out;
+		size_t size = folio_size(folio);
+
+		if (is_thp_fully_spanned(pmc, old_addr, size) &&
+		    __relocate_large_folio(pmc, old_addr, new_addr, folio, undo)) {
+			VM_WARN_ON_ONCE(old_addr & (size - 1));
+			ret = folio_nr_pages(folio);
+			goto out;
+		} else {
+			int err;
+			struct anon_vma *anon_vma = folio_anon_vma(folio);
+
+			/*
+			 * If the folio has the anon_vma whose lock we hold, we
+			 * have a problem, as split_folio() will attempt to lock
+			 * the already-locked anon_vma causing a deadlock. In
+			 * this case, bail out.
+			 */
+			if (anon_vma->root == pmc->relocate_locked->anon_vma->root) {
+				ret = 0;
+				goto out;
+			}
+
+			/* split_folio() expects elevated refcount. */
+			folio_get(folio);
+
+			/*
+			 * We must relinquish/reacquire the PTE lock over this
+			 * operation. We hold the folio lock and an increased
+			 * reference count, so there's no danger of the folio
+			 * disappearing beneath us.
+			 */
+			pte_unmap_unlock(state->ptep, state->ptl);
+			err = split_folio(folio);
+			state->ptep = pte_offset_map_lock(mm, state->pmdp,
+							  old_addr, &state->ptl);
+			folio_unlock(folio);
+			folio_put(folio);
+
+			if (err || !state->ptep)
+				return 0;
+
+			/*
+			 * If we split, we need to look up the folio again, so
+			 * simply retry the operation.
+			 */
+			goto retry;
+		}
 	}
 
 	if (!undo)
@@ -904,6 +1135,7 @@ static bool relocate_anon_ptes(struct pagetable_move_control *pmc,
 		.old_addr = pmc->old_addr,
 		.new_addr = pmc->new_addr,
 		.old_end = pmc->old_addr + extent,
+		.pmdp = pmdp,
 	};
 	pte_t *ptep_start;
 	bool ret;
@@ -953,29 +1185,64 @@ static bool __relocate_anon_folios(struct pagetable_move_control *pmc, bool undo
 		pmd_t pmd;
 		pud_t pud;
 
-		extent = get_extent(NORMAL_PUD, pmc);
+		extent = get_old_extent(NORMAL_PUD, pmc);
 
 		pudp = get_old_pud(mm, pmc->old_addr);
 		if (!pudp)
 			continue;
 		pud = pudp_get(pudp);
+		if (pud_trans_huge(pud)) {
+			unsigned long old_addr = pmc->old_addr;
+
+			if (extent != HPAGE_PUD_SIZE)
+				return false;
 
-		if (pud_trans_huge(pud) || pud_devmap(pud))
+			VM_WARN_ON_ONCE(old_addr & ~HPAGE_PUD_MASK);
+
+			/* We may relocate iff the new address is aligned. */
+			if (!(pmc->new_addr & ~HPAGE_PUD_MASK) &&
+			    is_thp_fully_spanned(pmc, old_addr, HPAGE_PUD_SIZE)) {
+				if (!relocate_anon_pud(pmc, pudp, undo))
+					return false;
+				continue;
+			}
+
+			/* Otherwise, we split so we can do this with PMDs/PTEs. */
+			split_huge_pud(pmc->old, pudp, old_addr);
+		} else if (pud_devmap(pud)) {
 			return false;
+		}
 
-		extent = get_extent(NORMAL_PMD, pmc);
+		extent = get_old_extent(NORMAL_PMD, pmc);
 		pmdp = get_old_pmd(mm, pmc->old_addr);
 		if (!pmdp)
 			continue;
 		pmd = pmdp_get(pmdp);
-
-		if (is_swap_pmd(pmd) || pmd_trans_huge(pmd) ||
-		    pmd_devmap(pmd))
-			return false;
-
 		if (pmd_none(pmd))
 			continue;
 
+		if (pmd_trans_huge(pmd)) {
+			unsigned long old_addr = pmc->old_addr;
+
+			if (extent != HPAGE_PMD_SIZE)
+				return false;
+
+			VM_WARN_ON_ONCE(old_addr & ~HPAGE_PMD_MASK);
+
+			/* We may relocate iff the new address is aligned. */
+			if (!(pmc->new_addr & ~HPAGE_PMD_MASK) &&
+			    is_thp_fully_spanned(pmc, old_addr, HPAGE_PMD_SIZE)) {
+				if (!relocate_anon_pmd(pmc, pmdp, undo))
+					return false;
+				continue;
+			}
+
+			/* Otherwise, we split so we can do this with PTEs. */
+			split_huge_pmd(pmc->old, pmdp, old_addr);
+		} else if (is_swap_pmd(pmd) || pmd_devmap(pmd)) {
+			return false;
+		}
+
 		if (!relocate_anon_ptes(pmc, extent, pmdp, undo))
 			return false;
 	}
-- 
2.49.0

