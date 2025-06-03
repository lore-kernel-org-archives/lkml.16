Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C8A42C3246;
	Tue,  3 Jun 2025 18:52:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748976775; cv=fail; b=CIEQ4sBmQlUNrx+7JGaFwd/rarXZQK/9ug7HqfY9wo2Y6SNn3+1AMkJyMqkHQIBBI+dGfSiVdxgw0urrCkM0sBtJjzY/F78YpzZJcNd82WOwgiuqPhUJnJHUzqgFbm2WktpJ0G85Nr4yn1chBt4PMRz5IQ99asVcCWPyQ3nkFCs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748976775; c=relaxed/simple;
	bh=C3/Wu0Qi6b41GlrCscNIXXPE8fjyUnLWizket2H9ms4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=tCfjru3VE2xw6l5/CH3wPQb4mlX1khtFiC/ItbOiHKJILj0k7tKGaexB3xcAtcWztaiX658Nwx5CNrqnA//35QP01v7WcdH0pXSCx2eKv6Z9T5hTamsHcwNKzdQxG4kxKeBRo8GsmSKCUpKcyi+Ja0krW6MzF7smO58uqIWXIEc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Az86Lzz8; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=fwK1uzk3; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Az86Lzz8";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="fwK1uzk3"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 553HXwVd021956;
	Tue, 3 Jun 2025 18:52:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=C3/Wu0Qi6b41GlrCscNIXXPE8fjyUnLWizket2H9ms4=; b=
	Az86Lzz8y0nEACDA+/MCY8ll2/2YYJaUJM//ZQyXUqND9kMaLAQWV73p4BckxjOn
	HZV739VkZEWntbnnwmZ5mryGsHjzSbD7oKML+UGGxzkFJGLO+x/fzloX3Z3Z2+iR
	I6/7mGUd4e8hIYbVsynBeOsC8P5sf0RcpnUB0GJ+glmjZdkUYhUobSOJvnh8WbC3
	VmUHQIVdvrVclJ9r6Bvp5XjUYGJbnrElYGHKcZI82nE08OiXkhe4KLrLxtP6dd9a
	HWCH5SmjsC3FZRoIySeR+eisL9NiwFo4Nam14HkYFE8ONutRwktLCOySRc3/4aPl
	8Km7BsUenEgNUy+TQQibIw==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 471gahakcg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 03 Jun 2025 18:52:34 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 553IS3Kf030611;
	Tue, 3 Jun 2025 18:52:33 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11on2077.outbound.protection.outlook.com [40.107.220.77])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 46yr79t58u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 03 Jun 2025 18:52:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NQt83qpWShdt8mVPawgFRQfVsftbGhSyHlSH+/Tpq9BDsLUAPhdUhNkl2PkkBVC8vYfCBwyeDpQ16xFyvBfsUqwtt/jddz5U4XIA1mnrLu8BDEWN+FIHHU2ifzSRWjpY4SV3rNZrV4nqK7x+Lwc8fp1Tg5e9xhddB5K9JPHKCfMFm7od5ADIq6AtiTL7Osz2mPxMjb9ANDPyrbLlNc+e/05kMBZlr6klnFI6/PrhuKdaBMX07n3PFOCP6rg/6zrf3p+78IIKb83lktXx7fv2I+yYZU8hz9CKy44j/1aLulXtn9jry85g50FEzF/9F+GWBLNQ0aal6PYOnwL1uqt+Ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C3/Wu0Qi6b41GlrCscNIXXPE8fjyUnLWizket2H9ms4=;
 b=Ldu6b5nkniHSf7tZz4WEhgQmWOsPNN8F239t4UwBACutT/XBet4zRSEq6MnkppdCRt72vuTpuP5amPgOfPWmwrR09hDsqs7LzUx3Dd05zr041T1UZ0vw2zWuSrF/LeSnxXtjgTUYHIZMNbVaxe9FqbWuehpL37l7hWEuwYSdcFe1anSKViq4znnL9Ex/kOBSNqBWu0PuKdR3KovTb+JjzK4rrGiqO2fqekecAr3XwNo4WP4MZRi7p1Z8ZiM29HaJsTZCp8SwwlcIlrVQrLwqLeVDNttb7f9mY+JSb52w7j35VYnTV6vnBzrSFYtAzuVHtd2444rn7zOarknGmhVb/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C3/Wu0Qi6b41GlrCscNIXXPE8fjyUnLWizket2H9ms4=;
 b=fwK1uzk3mxGgvMamJ//gFS5WHVU+BABzDXbOGA7c6WjQjGdHXmmnxt7VnfilL6EdIcdTcwcgOoWgvQ1/UplnJBRmbzXeuTD5kDhqkXeSPUZZGPKpTTp5Q1C+CvaO92GpR/iV1e6lV/9LEa2aufp9fKkXWtv9/AhYpkZYaV8k1fU=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by SJ2PR10MB7597.namprd10.prod.outlook.com (2603:10b6:a03:53d::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.40; Tue, 3 Jun
 2025 18:52:29 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%6]) with mapi id 15.20.8746.041; Tue, 3 Jun 2025
 18:52:29 +0000
Date: Tue, 3 Jun 2025 19:52:27 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Jann Horn <jannh@google.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
        Suren Baghdasaryan <surenb@google.com>,
        "Liam R . Howlett" <Liam.Howlett@oracle.com>,
        Vlastimil Babka <vbabka@suse.cz>,
        Shakeel Butt <shakeel.butt@linux.dev>,
        Jonathan Corbet <corbet@lwn.net>,
        Qi Zheng <zhengqi.arch@bytedance.com>, linux-mm@kvack.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] docs/mm: expand vma doc to highlight pte freeing,
 non-vma traversal
Message-ID: <685b78df-2dde-4e83-aa2a-3b105aa1c0ad@lucifer.local>
References: <20250602210710.106159-1-lorenzo.stoakes@oracle.com>
 <CAG48ez3DCwDdA1UfzonFzradrYq5VmhwLGgqMXNq6k68tr+w6Q@mail.gmail.com>
 <f08104bc-8ef2-4f6d-8d23-e5a087595a40@lucifer.local>
 <CAG48ez22QsH5NcE8+-_ofA185j1AiBFZNsaik338pjNr8kC-gw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAG48ez22QsH5NcE8+-_ofA185j1AiBFZNsaik338pjNr8kC-gw@mail.gmail.com>
X-ClientProxiedBy: LO4P302CA0044.GBRP302.PROD.OUTLOOK.COM
 (2603:10a6:600:317::10) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|SJ2PR10MB7597:EE_
X-MS-Office365-Filtering-Correlation-Id: 879731e3-eda6-4545-4f06-08dda2cfca8c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UGRqWUh4S05HV3FNS1NxUnNjOUtIeFN5M2tyZU1CZ0RBb24zdjQ4Ly9kbDll?=
 =?utf-8?B?NTdJdWFnNzM4cFJZdi9pakxPVmsvT0NKQ2ZPdE9jSExsT0VKUDBCUzB3NkpG?=
 =?utf-8?B?YnRyVkRyZ2VuV1BzRDdDWUNmRjVxNjA3bkZSNW5TSkFkNURUczhGbXNrV2Q2?=
 =?utf-8?B?eE1JS0dLVFg3Z2x1MjJSSzJjQm1zMGJZazB1dStlOTBrVUxuSU8xbDJFMEYr?=
 =?utf-8?B?VHo0UVN0UTJHYjdmdkdHTWJtbTFTY2Q2ZmVLN1RIZFI5ZFdlU2QvVzdDMzNG?=
 =?utf-8?B?WHl3TGM1MklyYkhKVkxGRWVDV1hKL3c4eHVZRmNYWGFqV29TUlA2blo4UXc5?=
 =?utf-8?B?YWhjbmVlNUduMVJXMnZiaEptV0psU3BxbnZtV2FsKzg4N2QwTm9UcnVvMWti?=
 =?utf-8?B?S0ZwVC8yMDdRRUUwb05CT0ZzZk5kb0xGQWRxa0tCbkVyVTBFWWVkV1o0cUVj?=
 =?utf-8?B?S1FIdFhPMnpMb3l5N0h2NEgvd3lpbFNrUVNwa3VVNldEOVRRc3BUYW90NHMy?=
 =?utf-8?B?M3J1S1pxaHFNclpmRUE3QWtwZFJyRHNqVEhRcGJ5OXlCMTkxczFJWjFqYU90?=
 =?utf-8?B?NFN2MVN4b3JtTlJrcTRXWmYrUnZWVmJaWVdNcG8zbWFWdlJVQ1l3a2RuQXF0?=
 =?utf-8?B?QUdJV080UU5NUGdoVWJaa3R5SXgxRFBWRFRzNmkra3lkak9tTWhkSUE0SHhO?=
 =?utf-8?B?ZTZTNitUUy9Ja3dHRjRaNHdsbWNVZEVUQTRGdmErMDBKVk1YOE1HVEkrbStX?=
 =?utf-8?B?R0NXMFhEa2tucXQrVFpxdFlUeUhscFZWMEJEeTJVQ1FGRmd0cXd5QTZ4TXdB?=
 =?utf-8?B?MEZsaU5CcENmUE1PY3paZ1RBRUQ5MWFIalNaUTQxemdJWHFaZU9SVWFFYkNE?=
 =?utf-8?B?L0ptTEZRMm1GeWhvWlRUQkNCZXpSVHRkdk4xUVJOQ1JHWWF6NEVZUWErN2Rj?=
 =?utf-8?B?ODBJcnN3VzlMd1BhU0U3RWZiM1hSMlMwWEpTWmNCQUhnS0JiWjdseEJiejRs?=
 =?utf-8?B?ZkErWjREVkxZejhId0Mzb0U2UnFPSHE0dzJ3Z3JWZS8wRHVzM0hGU2xFLzhR?=
 =?utf-8?B?ZGlsZHBORUd3cGRId21iNDgzWmozeDJyaUJHNE4yNHh6bTdWZmNtM1JGZlow?=
 =?utf-8?B?a0k5azJjbWpqYWs5c0ZGVVh0L0hNMGdpZ3BTV0V0WGxZM0M5MllpWWZPZnBz?=
 =?utf-8?B?MUFLMWIzT2F0WTZNcy9TSFQzb25hY0cwZWhjUHd3RzhhYXVkdVRlUUZrNnph?=
 =?utf-8?B?RWs3Tm5CM0hFNnhMN0NBeGVHOFJvMHRRQVVFOWI3YWlpZllHQzl1Uk1McXFC?=
 =?utf-8?B?Y2xUbURpb3JpbFVkZ1R3Um5DaDFGQlhKb3YwQ2kxR2tRMVk0SVJ3cWVMOGFj?=
 =?utf-8?B?bTZ3WVM1Wk15bld2bHo2anJsby9DZ05jZ0hsTUc4a2FjL21WQ00weU5NRjE2?=
 =?utf-8?B?b3NCMGxMZjZhazlQdEJUdGs2andwVDBvbzdPU0hMSnJ4blVTWUZSWjVwd21k?=
 =?utf-8?B?QlZJbm84YWdHak9pMzhOcTIvS3NPNVdraWVKamVBM2pxNHhkaWxDOElBZWN5?=
 =?utf-8?B?QTlBWFNDSTFFWFBJRzBvRTZPTk5uc1c2NGpJV2JyM3V4UGtOMjlqWXE5V0Rt?=
 =?utf-8?B?WlU0ampUL3lPTmNXV0tOL1o1Z0IzSHdnRmVwbUZqd0lEd1ArQnViOUhILy8v?=
 =?utf-8?B?NzFUSktJMWt1UnBzUVRTZ3NzMXRuQmVsR05KSmRTSmJ2OGRQTzYybDB5OFBj?=
 =?utf-8?B?R3Nhd3ZtWlQzNi9lRXpXRnJaV2F0bmljRk5BUTZ5TzNRK2RyN2Y0UG82VFRs?=
 =?utf-8?B?RUxvNXliczFVRWhqWmRlUzM1UmQ5ZStLdnhTazlrTkxTTG84RUZwRDI4bDFJ?=
 =?utf-8?B?UE1DYjlvRDN6WlRrTmJHRjU0cGNKcU40VnBrQjdyWnpidFE9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Y1UxOElSd0IweFIwWUVtSGxhYjJ4ZmdRQ3E4UDRiUnk4MnBZRW1NY1dlNFAw?=
 =?utf-8?B?U2tMT3l5WFlDTUNVSkxVTm9vYU53WERweWoxSllKb2dyaVR6NFlDS292YUVT?=
 =?utf-8?B?SkM0cDg5dUlFVFA4R0J0akY2L3IvNWIyZjMwYzdxU1hmSVBpNkFHWFlRekgx?=
 =?utf-8?B?dzJtZU83MDg2RFBKbUFFdHFOZFdndjU3c1lMR0s1eDJMWWVRWVpHbjR6VmJV?=
 =?utf-8?B?SlVrQ29DbTR5SGdMdk1FSGd4d25IRlB4UjZ0cWh3UGZwcHdTQlF1dnY1WXJq?=
 =?utf-8?B?US94TitFUkZ3K2ExOFhjam9XVzZzU2JsUWdqdjJ1cTF1ZWYxdFNJbkYyVnVM?=
 =?utf-8?B?cy9Bb1hueHMyUjF3Y0h2VEtid0Y4eHFnemhYTGIrRDBRNTRWS2Z3TVhkMWlN?=
 =?utf-8?B?T25yUmtBeWMwRlBrb3FaQU5BVWRFWUNpT2pEbGVCUUlpUkhsWm9DQUI0Q09S?=
 =?utf-8?B?NUZXQ0FBZTdsQmFSUHBJQWxaTGNSZHVwaXdpYTFsV3RqdjJXNk1ERGFSRE50?=
 =?utf-8?B?Vm80UHBjcDZ4TytsU3A3YkZBTVBTdG5nZ3hlZVV1dVgrSXBFK3ZBM0tRZGJM?=
 =?utf-8?B?UWxpNHlESGVWY2xYM29HUWV2a3ZHZXZod3VEN09VeG40eUZQcXpIRHk1QVY1?=
 =?utf-8?B?VEJYMC9NWG5rczZDdmJ4dnZ5UlVsVEZ2WFpUekY2V2M4eFU1b2JvbGdtMVRR?=
 =?utf-8?B?V3lLRDN1Nm10c29OKzBmV3JCQ2NGQjFzNXV5L3d6bzI1Q2xNdDBsK3V3dWZs?=
 =?utf-8?B?Z3pQc3FDdXp3VURCeFF2RTdJdlB4TWF6ZlFzcGVIOC91OVdWZUYwbkdFdndN?=
 =?utf-8?B?NFk0cTUyRmViOTRJM1VVMXpucTRjQ25DNEh6NldVVHhlbUxhUnZwVGYyRlZv?=
 =?utf-8?B?bHRkbjh6a1BCUFdqWFdzR1VTTitmZm9Rcnlia0s2NU9hM0dLWElLcjI4TmJO?=
 =?utf-8?B?Y1YwNHlYdm1GdUtlSXB1OWd4NTIzVnlHNmVMT2RoakMzTk5ndG16YVZwblRY?=
 =?utf-8?B?NVdqQzVwemdpWS9vVG5zUi93QUUraFU2Z3BYUENuVXBUS01jVWlJeUUyMWlG?=
 =?utf-8?B?TnpQSUxCWVpydm8zRit5dFFoVFFnMWVMZHJ4THlKb2tKeFRFL1V1QXdGY29O?=
 =?utf-8?B?UGl1dE1YU05xQzlvUGZUakN3bHRTWmcwL2RrV2RvdVlYQWo0ZHRsc205cDl4?=
 =?utf-8?B?OTVPWGdNU0RKVTJpWUtETnJuMkkvV0ptWW4rZCtqZHFyVjY5OGN3TWpIRy9E?=
 =?utf-8?B?SEhxblN5all0NURreXZxcVJHaitsTTAxSEw1OHVIclNpZGRiM2JGbkx1ZTZi?=
 =?utf-8?B?bUZhcTdVK1NhZ1JsdHgwa3NmVFFvUEtwTC85QXZyOWlBb0h0M25yZVNkdmVS?=
 =?utf-8?B?NWtqaGo0Z25xWUR4Qml4YitNR1FOeTB0VkJYano3V3JTS1FmQzVWeS9FaTFN?=
 =?utf-8?B?TEFhM2lGOFJ4bmRyUmEwWG9wTTNyWnlONExkemFrVUJXT0E3Yi8zSTRlSnhC?=
 =?utf-8?B?VHVpM1hrS3h5bU9DdGZzL2FtSy9jK1REQ3dMdEhGalVwclhpdHVTRnQ4dXhi?=
 =?utf-8?B?WWxCMDErdVI1RjkwTXBESU5qSGxyTkFlbFFBakZLRko2eGk1cHkyMlhwQWY2?=
 =?utf-8?B?V0llNm1leFR0bEZUYzFXM1k5aTV1Q1lYa05ncHllRlhRMy83L2VMeUQ1dk9v?=
 =?utf-8?B?YjF4QnBRQlQxNndJZnVadlFuaU9RUjY5SEdKaGtkcEs3QTFhcTN0ZXp4MjMw?=
 =?utf-8?B?MUxMSjdrNkhaR3JYUDFGSFJLaElVT01wZS8xYmFSVDMvLzBGZTgzclRHbmFI?=
 =?utf-8?B?bjBRS0VEUGpicVMzeEVidStlS3UxbXd3RHQyNnJFN3hWNmN0SWltb1lHK3VR?=
 =?utf-8?B?alBPOC82T3dGMnBWcDdHam1aUmR0L3g5N0x5YXJ4bjIvbWNlSXdnVVZTTVlS?=
 =?utf-8?B?VzdiaDNGRDkzcDZBNjV4M0RYVDZ3TXFtSWlpMkVqdEVCSGRDWWFZbmptc0Vq?=
 =?utf-8?B?cTFMaW9nOGRBaUZkOGJIcFlJZmc3T3lmRE8vWlloVlo1S05JNEZtMzNFV0hV?=
 =?utf-8?B?Qkp2YXhrWFFBR3ZiajFJcFFmL1p5OWFzSFhPb1R1SXI4eHVXTmNBc3VQTnpk?=
 =?utf-8?B?SUVobTRuR2RQTWY4RVlEcXhibTcyWDVFTzBmK3k1UUpvV3dNejl0ZnM5ak9G?=
 =?utf-8?B?WVE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	8cLyd42242mbnW0hhfVZNbjan3A73HNkkZI+xUKn4UIFBas6bE5+MrnpE/ZXzJumQ+QOJYM7J7IWkAxQ134YyoHQ2GGR7IQmJvNmkRBZibiDBrrohOyjToqCtkuLz5DwKN4waeH7kihaUtS9ANMIGmI1k7N5Is24DAF9/s49DBvQsJUjDjKDStkoJyc85O4jH6sc7LWs/9+sZQyqyX+Wlf6xICK8PjlyHhHCTBe6oGP7fW8fS5BdSRYjZm8LO5tB6Pss/NCtPTJKz8xSoE9C04e7t61bAlDWjMydkBVoqnKx3wDIgH+PonO6JmOxJdTDzYm1ERfKZf+veBQdJJr6tStYEwyX/0dKRoIAJFYJwKaE4dcBUfnuSn5sjxN7N86xuDZ04bc6o+7D9FbpYHWkJiLO7EQvGcxIPuKXzJC0fQSYYSUj+V0gK+HthQWj9SsL/PfNUxPGW4TZg7fd2kxgfTJLiP7g6QsX14evSQU34WoUH2+8MBfdSBpiQzf8h0MCBkzoDB6lYtb1dYnqIYR3lMKW0E4sKJxtkXEXYtCPdattBAvxonBF4XLBpGMwdNIW4siZUBX80FXxQV9li0qWVPDc8+IAiXu9NLbkmK4DF3Y=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 879731e3-eda6-4545-4f06-08dda2cfca8c
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2025 18:52:29.7460
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WOKo8RkEmL7pUaEPVAQKrNURVZ0Q2g76NImuW2mzl0A06Bc19FmhO4f67hbPhGhoa39/a8pAQTkg51Fuf+g5DRssoIr24kraHGOz0hEKA0Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR10MB7597
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-03_02,2025-06-02_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 malwarescore=0
 suspectscore=0 phishscore=0 adultscore=0 spamscore=0 mlxlogscore=961
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2506030164
X-Authority-Analysis: v=2.4 cv=aqqyCTZV c=1 sm=1 tr=0 ts=683f4472 b=1 cx=c_pps a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=YS3VaFTSsFvrcfj8KjsA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 cc=ntf awl=host:14714
X-Proofpoint-GUID: qYaLThmh23-EyprWAniLXFo35kld20bO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjAzMDE2NCBTYWx0ZWRfX0X4LWCp03g0d +1XtKAFGyfa3IwYqnTQRqdcXvl2ehA3Jeak1kdmXhkMZEBU4LaKmpaBsD7E6+1faaqm1xUY/yiz eyOitA/ADGelOgqtGpVQDpb0s1e5vYgeJv12d5bVCxRh/z8SFFi3Lfjm5JbCT/GaEJ2Q37mDEPM
 FFoPqgjcwpSHuTJPkG8GCFknZ9E4Zs6uwhx1twlCg1b2o6RU98JY3i4Mddsr6c6PR3vX9is53yn uo1y/uN2bYcQQGke7gABEWDVOXGXaV8C1fHciA/wDAH24IY2JMqsrrhd06r5ne44qG9vXVL3gxZ PRtLyHgSIFYA897vpXNfPmFRsMuAyR2AjOKgMK1Zs4MARA9BYxC5WNBIfk4SOcG5Hg/JLGBYe4Y
 XESV2ZSmcZrg5DV0wR1OWJIz90KC0uNjE/hDMIb2nTODesDTnk/ZkV5EXcyK6crAoSi6eES0
X-Proofpoint-ORIG-GUID: qYaLThmh23-EyprWAniLXFo35kld20bO

On Tue, Jun 03, 2025 at 08:36:13PM +0200, Jann Horn wrote:
> On Tue, Jun 3, 2025 at 12:45 PM Lorenzo Stoakes
> <lorenzo.stoakes@oracle.com> wrote:
> > On Tue, Jun 03, 2025 at 12:25:36AM +0200, Jann Horn wrote:
> > > The one way in which I think this is currently kinda yolo/broken is
> > > that vmap_try_huge_pud() can end up freeing page tables via
> > > pud_free_pmd_page(), while holding no MM locks AFAICS, so that could
> > > race with the ptdump debug logic such that ptdump walks into freed
> > > page tables?
> >
> > But those mappings would be kernel mappings? How could ptdump walk into
> > those?
>
> /sys/kernel/debug/page_tables/kernel dumps kernel page tables. And I
> think /sys/kernel/debug/page_tables/current_kernel dumps page tables
> for the entire address space including both userspace and kernel.

Ugh god, so it's checking kernel stuff while passing an mm_struct for the
process?? Or does it pass init_mm in that case? I mean that breaks my proposed
patch right away if so...

And... yes it does. Brilliant.

ptdump_walk_pgd_level_core(NULL, &init_mm, pgd, true, false);

God almighty.

>
> > > (I think we should take all the vma locks in that ptdump code and get
> > > rid of this weird exception instead of documenting it.)
> >
> > We really need to be sure that there aren't some weird architectures doing
> > weird things or circumstances where this is meaningful.
> >
> > I mean people went to great lengths to make this possible, I find it hard
> > to believe there aren't some _weird_ real world use cases.
>
> FWIW, looking through the git logs for the x86 version of it, it seems
> to mainly be used by developers of arch-specific code trying to
> debug/validate kernel behavior.

So yeah they just want something that can traverse both I guess? But the
comments in the code seem to strongly suggest that we must lock carefully...

Maybe this whole thing was literally to make life easier to have the same
function check both kernel and non-kernel mappings. I mean...

OK let me reply to my own series to say 'nope'.
