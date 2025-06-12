Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6D6923D290
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 13:07:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749733671; cv=fail; b=uqd53UdFiKRVq6qf5t11hjJbo3aT9jpH/pwcrIT3PcrOQPVA6m0YZo1HXO4COG5CGTrnkXjAAXk3ZMHk2E0NSC5fGlSyusVaKmvBWJaB+y3Zu27BgUeH8+rGFmJlQNptfVuyaTlELGERWpkL80lvn0BtViXfXSsXEGRNF+9+REw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749733671; c=relaxed/simple;
	bh=0VUKBuNdmjtO0uZB9OHAHeozBOgGHQUj962QqJEFjds=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=rC9kRmF7ZTiTZCYrhIJdEw/6G9p1InLtx3eMkyWKJh8BeJBm4GAPon0wCLp2VxUCmOOOiQPeTCCavlc51c2Cmi1Z61jAtiUssvjPEOK2edJtcF6OPfuqm/fDAos9Q3VvtEI6FUjmruFrJZ+VXf2u+pVBohY6mBMLJVGRiaI9faw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=A2ahLI96; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=VA1OgZit; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="A2ahLI96";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="VA1OgZit"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55C7fbFW019032;
	Thu, 12 Jun 2025 13:07:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=Lprk15GbFlCOzODP7/qzgM8YJHcpWF+lDqoBVAaqBvo=; b=
	A2ahLI96UbafVlX3f5FFImR03sITuje5xAaduUwhqQCYUL8vO75V92Fr2Fvbsmbd
	f5SI4ci9TeK+plauY6wFBlTEcq6N1pRxQlWg+2JrkFWQq3Wd4VzGfxEb2P22m0di
	USC6kDjoFUDz7K2/Ctd8wICHhKwTqJ7qtTtpXXlrmU4+HdWHhyYjgG1BDhTxDhUa
	b2+mPkdWGkEI3DawxsaMiFwBPMKl682wpy/Hxdzps+NZ8Er4AliW3O7cmBYQobZ+
	LEpP32/FUdfh0vLCyJ0GAZE9iDqwvdEFwzq17rk2bY/KZz+GZ3nke6+d1+bFl8Ax
	sEmMRLYU343eCtk7oJGnPg==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 474dyx1qss-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 12 Jun 2025 13:07:31 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55CCRecx037839;
	Thu, 12 Jun 2025 13:07:30 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10on2055.outbound.protection.outlook.com [40.107.93.55])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 474bvhsuya-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 12 Jun 2025 13:07:30 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N3dBpxjcwtFkRXHMi6Iuqxw68hQ5bSYL5xFMDYnfcA/lrFzcaa2Nf2CD7jtn6nFOjRvkmFCGI1Kayy5w2tmk4umS7ELwDeTHGxxXY9nC8cE+sGWu1X9Iluon1JWgVmfyp8EX7RN908W2JOCNknXZ1vY82jK51h4i7RjlhQug12gxA76HUOFq4YWZ+qHYMapEnhz5zDQRCBD25Yfzqs/yzOgDqmlsuaVKBFECYKT2K1ptiHkPKrv/T1MJ1KM064gfSF+UJIdg6rfMBeJr+klk9Pgg0cLvfsTW3Ut9Prg5CT2w6jpOxqOrENGa4MdEmLX/IGx6TgDaNRtfpFa85dRquQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Lprk15GbFlCOzODP7/qzgM8YJHcpWF+lDqoBVAaqBvo=;
 b=ynAyJ8Zz9QgrZKma5Q55o9CLNd2xBPsVb7Brp34sWwFUOfBTwuPd0r1UJgFQZN8HgvrhhcTpT4GuXOx1uMxN4+ynOGZlAVg0mQirefhvq6lDkM6XillL95oCIrUPkGih4d6bcRfZVrK8+aYsetD99mtR9tgzcv5fmyBHKpDJCvVTGrcae5KWHTzlDUJGYsmjNHnM2Mls2ZbdRq5u2kgQ3lH6rhWHnP30dEBC4M4adrZEfdM1C+ZOGFDiDs5953cYdyZ6TK0EY8scr4WeSEagJ0xNcQ5p+rNjG9wTl7bHMGPphxk//j7obwCMCIXmMVKUOPSWyrKswZNiIdffarTMJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Lprk15GbFlCOzODP7/qzgM8YJHcpWF+lDqoBVAaqBvo=;
 b=VA1OgZitEwKXVAyYurJgDjsOWFmFA39M4m2C08EzWwRgVBSdVEIsaD0N9iMjrnv8+2xcD4EKdZ4YQBb4IpqmfKyo2m9c9I3C1p4jFaPKcY76zmORs8qM2ciLRwj6vS8mliSs0g5k3Lc2gorGf3FJbjiuXHL2NCW39cTXEPY/b9k=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by CH3PR10MB7778.namprd10.prod.outlook.com (2603:10b6:610:1b8::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.30; Thu, 12 Jun
 2025 13:07:27 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%6]) with mapi id 15.20.8813.024; Thu, 12 Jun 2025
 13:07:27 +0000
Date: Thu, 12 Jun 2025 14:07:23 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: David Hildenbrand <david@redhat.com>
Cc: Baolin Wang <baolin.wang@linux.alibaba.com>, akpm@linux-foundation.org,
        hughd@google.com, Liam.Howlett@oracle.com, npache@redhat.com,
        ryan.roberts@arm.com, dev.jain@arm.com, ziy@nvidia.com,
        linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] mm: huge_memory: disallow hugepages if the
 system-wide THP sysfs settings are disabled
Message-ID: <3a3f6f69-f0f4-41a0-b960-e76423fb6dc9@lucifer.local>
References: <cover.1749109709.git.baolin.wang@linux.alibaba.com>
 <8eefb0809c598fadaa4a022634fba5689a4f3257.1749109709.git.baolin.wang@linux.alibaba.com>
 <1ec368c4-c4d8-41ea-b8a3-7d1fdb3ec358@redhat.com>
 <2ff65f37-efa9-4e96-9cdf-534d63ff154e@linux.alibaba.com>
 <953596b2-8749-493d-97eb-a5d8995d9ef8@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <953596b2-8749-493d-97eb-a5d8995d9ef8@redhat.com>
X-ClientProxiedBy: LO4P123CA0520.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:272::16) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|CH3PR10MB7778:EE_
X-MS-Office365-Filtering-Correlation-Id: 33031116-fe33-457e-fdca-08dda9b214a9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RHREMkVuWDErQUJla2liclVvaVYybVg5TW5wS0M5TkZkVnRGcFZCWGNrVDVO?=
 =?utf-8?B?OWtLVWlsRFpFazIzMm9GdzJSbHl4MFZMMjlrSXhGTFFjRnRhZWxaV1NnWVFF?=
 =?utf-8?B?Z3hIUldoK1hCTEpSa1NTSmc1QUdjYzcrbktSK1dsL2JkeWpkd05IaTVmV0Jo?=
 =?utf-8?B?RHFvOWw1TmlSSmJFMzZ3RTNvbXdUbFU0MkkyWWdVbWQzMExNdStFTklrQmxa?=
 =?utf-8?B?a25mQXdraUVuNTU0cmZFVzhtcG9nNDlSSWMvYXpxMm1WNkw4VmgyOU05Qk9Q?=
 =?utf-8?B?eGwzbnBTeW8rWmtLSy9qK3lIYUNGUXVxczg5QjRVNXVsVUphc3ZhQUZSZGJp?=
 =?utf-8?B?ejQxdWJlcWlCOWRqVEU0UW1UMytINnR6R2l6R3hqRGFmeVowdk56TC8wMnpE?=
 =?utf-8?B?R2JLUzdlMndEcmEyb3NCTFZlOEcwcHZVOGJpWVFTSkxTcUlpUlpPMjN4N1Bq?=
 =?utf-8?B?dEJyWjRpYUl3YmtISUNZOVB3VTVmcmR5V0g4VlR0ek1mdnlMT3MxRTMyZXhX?=
 =?utf-8?B?SEtXeDZEaGVLRTdCR0hzUEl4RWJNRWtqVS9aQkdleWxyd0IxajU2UGVKbkE4?=
 =?utf-8?B?TWdVcnpNdEh0RnREUE1ScGFML3NiRVdTUzkvT1lFb3N1djBjYkdxeHJadjBQ?=
 =?utf-8?B?Qk5pTmoxc0ZMY1RBMGFaZFZDZTlCd1ZBQ3Ztb1NVeTNEKyt6QTNUa0ZjdEVH?=
 =?utf-8?B?Rzl5TjJNcE52MVpudnJVWThkNTRHSFRML2VnTXYvNlNCT1QwQUdxa1pPT3BW?=
 =?utf-8?B?VTI5ZzNjWXlEY3ZhYzRHc1J2Y2dqK054MzBpTU1Nemh2Qi91N3M0RkZOa3dh?=
 =?utf-8?B?ZWV5TzZ1bGIzTTVKRVI1b0Q0Tm5idkUyOHBHejlZRFJwVGozNmhvM3IrOFlU?=
 =?utf-8?B?VTVFUkJTZklLMUZJM1QvblRSblRteTJ5azBUNm9ydTBkanpnOUovNUo1K0Z1?=
 =?utf-8?B?UndwS04walNNVW81US9pS1lHZWFoUkpIL0R2TUNMOXZ6aGVIekh5djlvbFF5?=
 =?utf-8?B?OEE0WDlPUCtJelJ0YjlUTXNyYUluN1VtWXdqN2dvOFpOYlIrMDJlOWdRVW1T?=
 =?utf-8?B?R1ZRNjBiclJZYjdxNWFmbWdnbkxNTnVSSVZDUElRQnNkQVZzUHV2VjM3OU1o?=
 =?utf-8?B?Z0dseGQ4eEZUempyTHJlRlRVQ1NNbHJ0WHdFZFNpRWRoM2I3UmM5MVplbnIw?=
 =?utf-8?B?WlcvcVJjTFFSbnV1V0JtUFZEOVJxTG1abzRJTEZQbTdYdTNVQUM3M3pPWDgv?=
 =?utf-8?B?NExtNkZmV1c4RktQZmVkL3FCd3h1TGFRdEl0cGkwckRPbFlFdFhHTTE2TnNT?=
 =?utf-8?B?dGJtTS95QVlGaHFVZjlPcVFyVTNCNXczZGhpaVdSMWJqWWlXRXdLR0dWQ3dE?=
 =?utf-8?B?VGVsWW5LcUZIZmwvUnJLNVhnZCsvRzZadjQ5OE00VzkyNTlGeklST2pwQnlr?=
 =?utf-8?B?cm9qdXhCK0RpS3pEYXR2Zzlua3FiQ0E3UU5KTWN0SXZTR2JwS0xzWi9pWHlv?=
 =?utf-8?B?VFhSM1ZjSE9aUTRFaWFaMjF1ZTZKTW5naGh3Y2hNa1plOXZtVmx1QU8yYWdo?=
 =?utf-8?B?T0JlZlBGYTUrQkJuQ0dTUWw0UGlMa01YVDJtczBuT2o0dVYyRmsyd1F0V2Yz?=
 =?utf-8?B?WFBXWjJxZm91WkxYZDhGZWNtbmw0bTJTTFFkR3BRZGRiMTBtYno5T3plaEZQ?=
 =?utf-8?B?eGw2Z1pHYVp6MXlhb056MnpMTGhFbkRlN1lMaWtrYXFOcEtnUklBSnlWUytX?=
 =?utf-8?B?aGhPQ2JaUzlZUkQzTTUzZlRDZW42eGltam00RUlEa2dlVHBMRkZBSzlsb1h4?=
 =?utf-8?B?UUZ4cFZQM0dQbjRzcnBwakZRS3VnY04vazNaWDNJRWdleGxGZWw1ajQvd1VW?=
 =?utf-8?B?NW1OU2Z4Zm1xTHptbE9VN2dmZyswTC9sdFVnc2htU1BSR3FhODdQbnBudWV4?=
 =?utf-8?Q?/JTn3mwrjq8=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MnNMU2FaUjFkM3E2YjR4MWZxeGVRNkErVElDc0ZMTXJCdmMrR2MwQ1Y5MzNa?=
 =?utf-8?B?M0pQelVDN2ZVZGdTWlQzN2FSTmtoMmpERVA5cW5FSTN0bWs3M2dxK2k5Zm9K?=
 =?utf-8?B?d3plMWNNaFZoYjVIcWt4ajQ3MjFlcFlNNHRhQUtVL3B5U01HMTJtVWR3dDVV?=
 =?utf-8?B?ck9Fazl5NHI0WkFDelBVNTZkeit1YXYvb0dYbGgvR2cyRzRFR2haOUNNRWE0?=
 =?utf-8?B?TExIR3ZCY1lORXpzTDM4OUNQTE1xdkN4UWhpL3pneWMwWTcwQUZvR1A3YUZ2?=
 =?utf-8?B?QzhQSUhRNjhRVkk0V3RMREhFazNJNEY4Si9Wanl1cFFUdHBkbVU0V01jSzI5?=
 =?utf-8?B?dmZyRUVxOGEwVU5nTlk1bXNJZmRIcXNCUng5d0VJMzdVd2Z5NmNzQ05MbGxB?=
 =?utf-8?B?b3YwQVUwT2dDYm02Yi9Bb0xHMTJxU2FueXlENmQyclMyVGNOVTQ0UkJNLzJk?=
 =?utf-8?B?K2czOGJqYzdpTFNFdXRNM3ZkQXVNMzdrL3lHNEp6Sk5wNWkvcFZyTktxTURj?=
 =?utf-8?B?TThzbklNS24yY3lldVNjQlBiY1hWdnZuWEJTbkNJRW5JSzh6SXRvOWQ2L3lC?=
 =?utf-8?B?S0dud01Ma1Rneko1b0JDd2N3c3dOSzRIc2VaL3lydTRCQWNBV2xFUzc1V3Ru?=
 =?utf-8?B?U3hTWnJmcXQ5dnl5L2FrdEtKRFNlbnBwU2hSMzBqVy9XTDR0K1F5M1BDS216?=
 =?utf-8?B?dGRmRVN2R2VZT3p3N1p5OVBBV3Jpa3FxWnRCZHdDMGVHalVLRkhVUFl1VUNw?=
 =?utf-8?B?VkFVQm5BZStHNmdQZEVidG9IaCs0N1hFdTJnSXgwZjJ3TkZoTXV3OXJQSmk2?=
 =?utf-8?B?dlFZQ3BhSnJvWXNBRDZaMHVTOC91bHJGdUNhU1RhUVY3TENsZFR4dlVET2NI?=
 =?utf-8?B?NGc0ajd1REJxd2RJVkhzeG8yZmxTYStvb2UrL3VhQUNTWDNISExwcDJOUm1w?=
 =?utf-8?B?OXl4TGNqZG5FMlAxL2ordGpNN1BCM2pwQkxZdEd4WVFPVHVpN0h3MkpGeVNk?=
 =?utf-8?B?TlVyY3FPVkxOczZDakZUdDVPYnNoS1RYQUdMdytJVkhsSEFzRnZtZFJyZ1dG?=
 =?utf-8?B?bWFVTm8rbzNFUjNlaVVYSHZSYmNKcG1oT3NnUlVjc3IveEFJZTExY001bENk?=
 =?utf-8?B?Y3VvOThWRjBlMElpVkZBa0JpNTlMSzlBaEUrVStIajBwbm1jNzdaQlk0ZExz?=
 =?utf-8?B?RVZhUDBkTDgzRlJhWDd6a2k1MFVTdUdQWVl6eGhsYjhLakRBVHczamNsWFN1?=
 =?utf-8?B?c1JYSm82bllKdkpEdGMzcUoxeHZZQWJLc2RYRy9CdVllME93YXFKUGZGcVNt?=
 =?utf-8?B?WnE0ZkVYRXNJZkhucFRyRUZDOHFlZjhOUWNKK1FVeFZtQ2tEbG5UV3djc1RT?=
 =?utf-8?B?dUlydXRsU3RwK01EZDNGMHJGR3FSSDJCT1l4YldOd014TDlIcU1COEdPKzZW?=
 =?utf-8?B?NWY4K09BYXo4VVhad0xxdGtaRWtMSCswa1dKcGN2WTk1VFUwRk5seDUzZXVK?=
 =?utf-8?B?Qk9Jczh1WDVBMkpLK1BoanhxSHZYMDFkL3NnVU0yVm9RVFlaRFdGcS81T2Rq?=
 =?utf-8?B?T00xWTl6U2xIU2VubDRKeW1qOXFlaTkzbnpvMXJrNXo2cTgzaWIvVHVWSGhT?=
 =?utf-8?B?SzdKY2l6bytjN2o4ZnRDV0dxcThhU0FNRjVpMjZXR2sxeVNHSlJ2clJnWmZj?=
 =?utf-8?B?MGRxYlkrSnl1MEk1TnRLNmVPZnJyYUJCalBHNmdSbFJuZkRQaStnU21CUElv?=
 =?utf-8?B?RTY0aThiREo2UGU3M2ZVNWJ1aUlTb3pZMU1vT1FRaDdPOUkwbEJEKzcwbm9a?=
 =?utf-8?B?cUkwQzBCR04xUWlpb2ZLWXFjemdGWW1Vd0xBa2xKOWhwMGRyNWo0dit5QTNB?=
 =?utf-8?B?SWdrVExTeGhRVDJtZHM1NG42N1Z1blY4VzlsbCtzVTIvUENWWEV1Tnkya2dC?=
 =?utf-8?B?STUvOTEzeHM2U2gyWXVQT3FobEZMT1k5U014ZUpGYXdsZFFuWi8rWDg3anFq?=
 =?utf-8?B?d1dEQkw5emtuaHhHRm5jdHFWQXRDUC9JQXR0MmFLTFdGNmFnWjlNQUVwZ05X?=
 =?utf-8?B?L1lDemVLMUFxZzMyNkFhamhocWtsb2NXMEh6YkFxT2tqa0o2OVBydzQ1Ujl1?=
 =?utf-8?B?eVZ0UjZxL2Q0WnRaZEd6c2pLTlEwT0RTWFpmTWRaTkN3SUFVNW5SUTZkRDJ1?=
 =?utf-8?B?WGc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	xYG47yTiVQmAG7Z3X0w45QAsINWDlAWys06uuDXxjzlm9IhSN1Irb8Mq3Uo2Dy3/4c2jI1aiWh9StNaUZknz67mpYyzyobuwleeHXCdaGxMQe88toYFfc6OvAT+9YA1nR5bdmhbbxHBXgkEkXkPt0AonISMkL6Pif7Xq+xYvGuw0m6wSK6B1uY5vZ66yUTkb6hsXbuumltS634dXcgX2gr2kFU2mwnGAs2XIBpNtIMEfBSusxJYR28EM3zrNiyny+ipkdPwv7CyGjMrS4T/Q1vwBg3SGS1BfMxax5y4u0rlgHwLXYRagI7spAS4YDefBJgQow1ZRuUvNR4UTW+z/dFgTNSNZ+zJgeEYf9qIzlOSdlFbgHe08W4MRCnWe5F6R5rfc3aRnlc7rtQw0WurmJjUCLVMqmiadH5QBbwovNAVFW+Ws9FXaysvnERIlLafWn3n/DH0vHcjGARB0fOgRzjyT/SjbtBY5VzZG3RlyxfeYFgnpRNh6hStiwa9uYxjMO0LXq7m64h35gtK8JasrCl9vZ3eGPpAm3mQCLm8lxBs1QPMd2z8R3cPLFjucZKvJx4PLukYdRsN8auwe/8HOVuX1ymgJUUuCeR5P3M4eYpc=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 33031116-fe33-457e-fdca-08dda9b214a9
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2025 13:07:27.4558
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: I664bWXz2TIGWJ4X9C1axMsYIP3uQkIwLSI1wgm1EwE6a9xH+aEC7v955rcYudYFvl8QrBlxh+5JPQ/jtzx7otGnDyV9bxqaiqbTRrnPmX0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR10MB7778
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-12_08,2025-06-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 mlxscore=0 mlxlogscore=999
 bulkscore=0 adultscore=0 suspectscore=0 malwarescore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2506120100
X-Authority-Analysis: v=2.4 cv=fdaty1QF c=1 sm=1 tr=0 ts=684ad113 b=1 cx=c_pps a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=Ikd4Dj_1AAAA:8 a=SRrdq9N9AAAA:8 a=QvAyZDfLKUG-_RvMdzEA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 cc=ntf awl=host:13207
X-Proofpoint-ORIG-GUID: as66monIotV8PyEST8T-iuOCvxnbVSNY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEyMDEwMCBTYWx0ZWRfX0fUHeE+sLIGt xfWPni0Z3JjRdRXHZaB8jIbkkIld08gLnaq5ZjuODCnQ9P4KOCiQMhAl9tVtqEV2Y1IwQOu7nzD Jby9pxJ2EtY5xiDn0zTaq3Kgfhhzeb9/+ZLyMpvoIF43OoSxlASmPoxOwFXbO8Rh+9CLRYIiSB4
 nyhNltztYwTAZ+onHad4tf20koTqIVzbd7ko/AlJqGBBFaoI9rcbcOFQGyhsVhetgYOOv6Ivj30 P4IY8swB8lMFqLPp5z+TucHm/dbP0li/dEfvpPPyU1e96vrG5khCx1yDWWjKhsZK06QZP+ZaU7D 8mKxpdIugRAHM1C3mX1lE7b3xZXv4HjTb2BAlZ5VSqo7c0FdXvNs+7jkp3bzybh/gUTMM2e4ItP
 JExrN8NPtu2Cg71uvUDUqQVcwjqt4SinxL5tNP3Y1r3xxCoB8gGTPS7xBZ0Zgl9L0Brzrftp
X-Proofpoint-GUID: as66monIotV8PyEST8T-iuOCvxnbVSNY

On Thu, Jun 12, 2025 at 10:51:17AM +0200, David Hildenbrand wrote:
> On 12.06.25 09:51, Baolin Wang wrote:
> >
> >
> > On 2025/6/11 20:34, David Hildenbrand wrote:
> > > On 05.06.25 10:00, Baolin Wang wrote:
> > > > The MADV_COLLAPSE will ignore the system-wide Anon THP sysfs settings,
> > > > which
> > > > means that even though we have disabled the Anon THP configuration,
> > > > MADV_COLLAPSE
> > > > will still attempt to collapse into a Anon THP. This violates the rule
> > > > we have
> > > > agreed upon: never means never.
> > > >
> > > > Another rule for madvise, referring to David's suggestion: “allowing
> > > > for collapsing
> > > > in a VM without VM_HUGEPAGE in the "madvise" mode would be fine".
> > > >
> > > > To address this issue, should check whether the Anon THP configuration
> > > > is disabled
> > > > in thp_vma_allowable_orders(), even when the TVA_ENFORCE_SYSFS flag is
> > > > set.
> > > >
> > > > In summary, the current strategy is:
> > > >
> > > > 1. If always & orders == 0, and madvise & orders == 0, and
> > > > hugepage_global_enabled() == false
> > > > (global THP settings are not enabled), it means mTHP of that orders
> > > > are prohibited
> > > > from being used, then madvise_collapse() is forbidden for that orders.
> > > >
> > > > 2. If always & orders == 0, and madvise & orders == 0, and
> > > > hugepage_global_enabled() == true
> > > > (global THP settings are enabled), and inherit & orders == 0, it means
> > > > mTHP of that
> > > > orders are still prohibited from being used, thus madvise_collapse()
> > > > is not allowed
> > > > for that orders.
> > > >
> > > > Reviewed-by: Zi Yan <ziy@nvidia.com>
> > > > Signed-off-by: Baolin Wang <baolin.wang@linux.alibaba.com>
> > > > ---
> > > >    include/linux/huge_mm.h | 23 +++++++++++++++++++----
> > > >    1 file changed, 19 insertions(+), 4 deletions(-)
> > > >
> > > > diff --git a/include/linux/huge_mm.h b/include/linux/huge_mm.h
> > > > index 2f190c90192d..199ddc9f04a1 100644
> > > > --- a/include/linux/huge_mm.h
> > > > +++ b/include/linux/huge_mm.h
> > > > @@ -287,20 +287,35 @@ unsigned long thp_vma_allowable_orders(struct
> > > > vm_area_struct *vma,
> > > >                           unsigned long orders)
> > > >    {
> > > >        /* Optimization to check if required orders are enabled early. */
> > > > -    if ((tva_flags & TVA_ENFORCE_SYSFS) && vma_is_anonymous(vma)) {
> > > > -        unsigned long mask = READ_ONCE(huge_anon_orders_always);
> > > > +    if (vma_is_anonymous(vma)) {
> > > > +        unsigned long always = READ_ONCE(huge_anon_orders_always);
> > > > +        unsigned long madvise = READ_ONCE(huge_anon_orders_madvise);
> > > > +        unsigned long inherit = READ_ONCE(huge_anon_orders_inherit);
> > > > +        unsigned long mask = always | madvise;
> > > > +
> > > > +        /*
> > > > +         * If the system-wide THP/mTHP sysfs settings are disabled,
> > > > +         * then we should never allow hugepages.
> > >   > +         */> +        if (!(mask & orders) &&
> > > !(hugepage_global_enabled() && (inherit & orders)))
> > > > +            return 0;
> > >
> > > I'm still trying to digest that. Isn't there a way for us to work with
> > > the orders,
> > > essentially masking off all orders that are forbidden globally. Similar
> > > to below, if !orders, then return 0?
> > > /* Orders disabled directly. */
> > > orders &= ~TODO;
> > > /* Orders disabled by inheriting from the global toggle. */
> > > if (!hugepage_global_enabled())
> > >       orders &= ~READ_ONCE(huge_anon_orders_inherit);
> > >
> > > TODO is probably a -1ULL and then clearing always/madvise/inherit. Could
> > > add a simple helper for that
> > >
> > > huge_anon_orders_never
> >
> > I followed Lorenzo's suggestion to simplify the logic. Does that look
> > more readable?
> >
> > diff --git a/include/linux/huge_mm.h b/include/linux/huge_mm.h
> > index 2f190c90192d..3087ac7631e0 100644
> > --- a/include/linux/huge_mm.h
> > +++ b/include/linux/huge_mm.h
> > @@ -265,6 +265,43 @@ unsigned long __thp_vma_allowable_orders(struct
> > vm_area_struct *vma,
> >                                            unsigned long tva_flags,
> >                                            unsigned long orders);
> >
> > +/* Strictly mask requested anonymous orders according to sysfs settings. */
> > +static inline unsigned long __thp_mask_anon_orders(unsigned long vm_flags,
> > +                               unsigned long tva_flags, unsigned long
> > orders)
> > +{
> > +       unsigned long always = READ_ONCE(huge_anon_orders_always);
> > +       unsigned long madvise = READ_ONCE(huge_anon_orders_madvise);
> > +       unsigned long inherit = READ_ONCE(huge_anon_orders_inherit);
> > +       bool inherit_enabled = hugepage_global_enabled();
> > +       bool has_madvise =  vm_flags & VM_HUGEPAGE;
> > +       unsigned long mask = always | madvise;
> > +
> > +       mask = always | madvise;
> > +       if (inherit_enabled)
> > +               mask |= inherit;
> > +
> > +       /* All set to/inherit NEVER - never means never globally, abort. */
> > +       if (!(mask & orders))
> > +               return 0;
>
> Still confusing. I am not sure if we would properly catch when someone
> specifies e.g., 2M and 1M, while we only have 2M disabled.

I did wonder if we should call 'orders' something like 'requested_orders'
or something.

This check is always against the input orders which we might conceivably
want.

For instance in madvise_collapse():

	if (!thp_vma_allowable_order(vma, vma->vm_flags, 0, PMD_ORDER))
		return -EINVAL;

I don't think, if it's only possible for PMD order collapse, and that is
disabled, but mTHP 64 KB let's say is enabled, it'd be fine for
MADV_COLLAPSE to succeed at the PMD order.


>
>
> I would rewrite the function to only ever substract from "orders".

Hm.

>
> ...
>
> /* Disallow orders that are set to NEVER directly ... */
> order &= (always | madvise | inherit);
       ^s

I think you mean (always | madvise) here.

>
> /* ... or through inheritance. */
> if (inherit_enabled)
> 	orders &= ~inherit;

order & (inherit & ~inherit) is going to always be zero :)

So this should be

orders &= inherit.

The problem is, when you come to the next stage where you are done checking
the 'are we in a NEVER situation regardless of TVA_ENFORCE_SYSFS' you've
now corrupted orders.

Because you've included inherit even if !(tva_flags & TVA_ENFORCE_SYSFS).

And there's no way to recover that information.

>
> /*
>  * Otherwise, we only enforce sysfs settings if asked. In addition,
>  * if the user sets a sysfs mode of madvise and if TVA_ENFORCE_SYSFS
>  * is not set, we don't bother checking whether the VMA has VM_HUGEPAGE
>  * set.
>  */
> if (!orders || !(tva_flags & TVA_ENFORCE_SYSFS))
> 	return orders;

I don't think this is much delta to what we have now.

I do wonder if we should return mask & orders here, actually, to account
for the fact that, in theory, orders could set > PMD for
!TVA_ENFORCE_SYSFS) (not currently the case).

>
> > +
> > +       /*
> > +        * Otherwise, we only enforce sysfs settings if asked. In addition,
> > +        * if the user sets a sysfs mode of madvise and if TVA_ENFORCE_SYSFS
> > +        * is not set, we don't bother checking whether the VMA has
> > VM_HUGEPAGE
> > +        * set.
> > +        */
> > +       if (!(tva_flags & TVA_ENFORCE_SYSFS))
> > +               return orders;
> > +
> > +       mask = always;
> > +       if (has_madvise)
> > +               mask |= madvise;
> > +       if (hugepage_global_always() || (has_madvise && inherit_enabled))
> > +               mask |= inherit;
>
> Similarly, this can maybe become (not 100% sure if I got it right, the
> condition above is confusing)
>
> if (!has_madvise) {
> 	/*
> 	 * Without VM_HUGEPAGE, only allow orders that are set to
> 	 * ALWAYS directly ...
> 	  */
> 	order &= (always | inherit);

Obviously orders is corrupted at this point so this won't work, but I'm not
sure this is right?

If no madvise, only then obey always/inherit? Hm?


> 	/* ... or through inheritance. */
> 	if (!hugepage_global_always())
> 		orders &= ~inherit;

I'm not sure about this ~inherit again, that means we ignore inherit no?

> }

And we need a branch for madvise too no?

I think all of this is a _clear_ example of what a mess all this is.

I think we need a deeper refactor, but I think my suggested changes make at
least what we have here less horrid to get through.

I think maybe a better refactoring that's in the spirit of this is:

if (has_madvise) {
	mask |= madvise;
	if (inherit_enabled)
		mask |= inherit;
} else if (hugepage_global_always()) {
	mask |= inherit;
}

What do you think?

>
> --
> Cheers,
>
> David / dhildenb
>
