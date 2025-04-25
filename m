Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A4C918C02E
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 16:12:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745597536; cv=fail; b=PVB/Pk7L+xlXA5EVDx1jd292YGXYDAjuVbTDAuMn/vzkgKYQWGbgl0V+2ZcnHJWtDgAo8RA0iyhR9t9Oki76YXQlUgt9LOkytUMcZrB+G6cpD9vNHdio/CAkxWxuAp+XlT1DFc/ZyMx2khrfA/hQ7I8wQ+3h2p3FU5xopBVi4o4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745597536; c=relaxed/simple;
	bh=HF4uhlM/uSs16zhRc8zwY7UzryCON+v2P9no9qntyQM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=qosE9G5hl+Zf9xo8a+e8wkQJdzBC7IQHwJVksTELyL1sBHEX9or6LtcKchLWHbvpTnZYvvxQmUyVv3lHdn5h9/CHUg2kKUAaH+POGhLtyE1BAHpcQXECOQhH4OXy3TET0H4Kv61sqcdJapH85MBcT7us+VDR6kjqqvYygEmW608=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=B9d4Lfk0; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=NiSsZ9Me; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="B9d4Lfk0";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="NiSsZ9Me"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53PF6WwI030086;
	Fri, 25 Apr 2025 16:11:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=U28xZLCxk1DKstQVo7
	/WIDH44OVOK3zp73MXt5um/PY=; b=B9d4Lfk0QCRPqdkNB+aBYs7N7UkWWyc2BF
	0wFRDBW4UA8GWViDPOJb8GsIUpJhgPtc0+WT553i9BExXTSQpNgE6e9kLTd3JUlV
	dH32Rmc4Ivn7RWMMF9Q3HYOk7i3EF3666qvBOxz8LoZAW2gY3v4AhkM/Yk8eCFPc
	FMhYmkCtrSeVNypvY3ZbgmGvOVwT2JDL0j44ciUmgcFN1bufrRgHlrwOb0IZUviE
	gSA9VcW3AIm2IbbSDBzwP3SnnpB37VnPpDewNBKGCSL8xr19kmhA88+vrsQ4yjWH
	zloGDTkH4U5le5+MUa4Af/9Gg+2QPBXSrnOMky+EH7sYc4wbTjgg==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 468cr609ry-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 25 Apr 2025 16:11:40 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 53PEWNmu013789;
	Fri, 25 Apr 2025 16:11:16 GMT
Received: from co1pr03cu002.outbound.protection.outlook.com (mail-westus2azlp17010007.outbound.protection.outlook.com [40.93.10.7])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 466jxru63p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 25 Apr 2025 16:11:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q4dD6kvG41lmOqgFunHvlH8ZKwhC4xl0KptYtf0P0OF+5nvZC4Ot6uQSFLZlBp1Wi5I+6HThxneSoSwYqJCN9uXnfCoMDTDQfuIdQ7W6P7tbSZlcoYXSF0uBN4G3NuwWYQ017nejfYdytilbWyqOan0kFRRntg+L2Phlg9Y+leoLnJzpgJgK1l5CkjuFI+jkr4ZbIL/L4OSg356WbbVe/o6+ctCCmOzvnoWGmmcpIUN4wMDZToviFe0kdxnfaCRSfwFjRi0ypaXXYBHDrp5S1ad3o9K1m6o0d0Sj1UzKolTffTpkSyAoAszKzngz3XoQilulyvAy6IFoy58VB1WVKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U28xZLCxk1DKstQVo7/WIDH44OVOK3zp73MXt5um/PY=;
 b=pNa9FrxIlSwDyFKtfYg+yqfgEjOhdr5XHlyBURkm7Lvuc2HkQVNXu+NjnbAerOXWVVO/gtRfhV0FFI1/5AvDhtUlG+ugRiyoR4fSOde/Cf0zUjPj1JeQPH7bpbQrwi7gjbSk3AOeEtWi/sl1DSw67Cpgv79w9JrpL+DFuEp2bLb5iQMpS/Q11PpgXIKSqIVkG72+RVni2pKunoTpF0CpMuVtPGMjLWy3N7EKUbfhRn+CX34SF3ZtWa5toMdEUwFhjJx30DxoB0qA/0Vu9blAlNhQo3bErKZm8uOQJNkhGiwAU4r7v+rUVzDdap4W+mv6lnmYXZ5uYiTGn0/5isfBkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U28xZLCxk1DKstQVo7/WIDH44OVOK3zp73MXt5um/PY=;
 b=NiSsZ9Mewji6JgBfY4Etr3SqgiH4M5KbaNjbiBQHb3OLEtm7u2USvUX85DCIbNh6xrOlx1mCXp/2sgj3w+mvKdV5h2EBMin1dfAnt0fSWLOFQi51YmzAMOkW8AOZkQt6a6xzCD+rhtUHv73SPYMBlv0SacmeBUuoGHghtVQM8f8=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by PH7PR10MB5723.namprd10.prod.outlook.com (2603:10b6:510:127::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.35; Fri, 25 Apr
 2025 16:11:13 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%5]) with mapi id 15.20.8678.025; Fri, 25 Apr 2025
 16:11:13 +0000
Date: Fri, 25 Apr 2025 17:11:10 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: David Woodhouse <dwmw2@infradead.org>
Cc: Mike Rapoport <rppt@kernel.org>, Andrew Morton <akpm@linux-foundation.org>,
        "Sauerwein, David" <dssauerw@amazon.de>,
        Anshuman Khandual <anshuman.khandual@arm.com>,
        Ard Biesheuvel <ardb@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        David Hildenbrand <david@redhat.com>, Marc Zyngier <maz@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Mike Rapoport <rppt@linux.ibm.com>, Will Deacon <will@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org, Ruihan Li <lrh2000@pku.edu.cn>
Subject: Re: [PATCH v4 7/7] mm/mm_init: Use for_each_valid_pfn() in
 init_unavailable_range()
Message-ID: <e772cf66-c661-422d-911a-bc13ba4d59fb@lucifer.local>
References: <20250423133821.789413-1-dwmw2@infradead.org>
 <20250423133821.789413-8-dwmw2@infradead.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250423133821.789413-8-dwmw2@infradead.org>
X-ClientProxiedBy: LO4P265CA0307.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:391::15) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|PH7PR10MB5723:EE_
X-MS-Office365-Filtering-Correlation-Id: 8d2cc5d8-54d0-48b4-e7df-08dd8413cc89
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?M0vaLyJSwwRzm/4j1rEgwE52qVIA1xjvYVae2jngh5XkOH3vqZ0w+HtFkZEC?=
 =?us-ascii?Q?oVj0+jSMDxiXkRuGRdgqMlzZ6R3J/4dWUTumfIxRmzf0vKOEW+RjJSo7tzJ2?=
 =?us-ascii?Q?tBoYulqGux2YPWLlUzYqjb2kBAeimNQH09fYdRWHFVvElOMb3iCt12kovhpp?=
 =?us-ascii?Q?53NuOZ0WgWeObO/1P3sTquvQjHR1rtBOsFhlQg7jes8B51apRxV3GBH0BaXn?=
 =?us-ascii?Q?9PPNxD/cxkjNF7USezGaW9RXxB+vp/h55pEXqS3xskBBYQWd0P9Qan5uQjs8?=
 =?us-ascii?Q?9/BODldWc3K68JwhU6pf1IkLGj2HdYjcbYd5pTGHtPXuzExj1Ure6mWAlKA7?=
 =?us-ascii?Q?N2wxyJaAwm7FNptYMPq8W2F9vkXae2C6G0v2/25sWLFaIdA+GSHQ5MooFVng?=
 =?us-ascii?Q?dPob6JezcWhfhv53KaSq+x3LbDE2VisAYVrW/IAJLb5czDvZKBI9a4UEZubl?=
 =?us-ascii?Q?yiQOpTrzMedqLLNDh2vTKXsNjq5BNV4HiD+ckaFkWyt+ujAxSCZOuR0YuSt1?=
 =?us-ascii?Q?rj5VXh4Hw66i2SB1BMqQsjGLePw62qQbfqbWOnCZ7Y8oOHMBj+EA8Ngt41jO?=
 =?us-ascii?Q?SXqdU59AkUZwHhc2A0wblIKHD3jU8pk+TMoMFltGoicl7g98Jnqn3bueIL/z?=
 =?us-ascii?Q?cruANR3gf/Y11ZeHmrfLnCQ+JErB0C8ej/ReZEMfjfA2I/KqkWO2Q1ofaV5D?=
 =?us-ascii?Q?lT8ZASJEX0uuUBki6WdiyZtS79t5dhoHy7F0B4dSG6J6Gj2GpKxPAco8X2w4?=
 =?us-ascii?Q?UXb2Vk3KlBH0jgHcDH20HX4C2Y6xlCRGRW2u7ElKKhVL0rhogpO3q4rmsRFy?=
 =?us-ascii?Q?NlNei1q8ehL5T6OvA/tcjhsCjRf6XGUrhmRNgoW5ZhsODfLh0Io+9BOWCLya?=
 =?us-ascii?Q?06Vwx4a2VMRhuOTO7NtmSWyYhNE+wMR2pUotd2oBzL8N1KMbzeNEYQD5E9TQ?=
 =?us-ascii?Q?eYSm0GCytEzixyKbF53KiK5R1zeUsjm/TvlRsCtMg7KChLL2LGIBg009xcPk?=
 =?us-ascii?Q?lSekL00bT+jTkqNB+7d3NhF8zfBvS0W3pPArwDqcuC62yX+KLh3tF8tu44Ug?=
 =?us-ascii?Q?rokvMBXAEjPhgDKzG8I5nFOT+wVF+Z0n3sx+/bYjLWko9WRUmkgOuAVzungR?=
 =?us-ascii?Q?vmWpl1CAL0CyYUeBLniO2FaC/VHxJAGlhHKzIrSSJL0BpoVYZ3JmUKaOAceT?=
 =?us-ascii?Q?qPDNC+wHPpuNbN+NjHgQTb0o2kGdjDigL1c7lgs33CmR9Cdjos1Kcaq+vBOm?=
 =?us-ascii?Q?P9iO9v7P2wqaEa7KY/ptyNPBEKexIBo749VuvWYVOwZSfHKyA20KdUUvi3Jc?=
 =?us-ascii?Q?MscetThqb5ZuV1d0tU1tGXdIpZK+f95VPI6iXKHq9t5LwAE6PvAn3fLj+m45?=
 =?us-ascii?Q?Fi3zNVDuE472p64po2DHirBcSuanMU3CW+t0qYOvptNhNw2C6ymWHPSYwwgo?=
 =?us-ascii?Q?azcZEV8z2vY=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?gUJAci61CVm1V39A7oPLA2r9X8tSLpHANgr1CXnI52Fo6Hb9XsxFRJKnTihw?=
 =?us-ascii?Q?VhqjOVgwMtAxVZu6X6Fr0kvhAXAMi8aD3fhARILl3uKBq3F5Akk79hQrznWS?=
 =?us-ascii?Q?V9pF/RgxTTf150g3cflaXFx7EWI+Je3c0KuCzoJyb5V8a6ZYBiBI7reylCEG?=
 =?us-ascii?Q?TcYYgRvLqKREKvVbTtEwGloRPmxwfRqaquoKwW4QhTFVVWyB0PSGwQQsfPZt?=
 =?us-ascii?Q?mWgnNSsvEqZUxrAvNW1ICbM+TPNrUwLavGAP+ij44QfJkSEwNz9XZ28S5gva?=
 =?us-ascii?Q?0jfBGnu6dntOAm5q0jSY/gVqIuYhsvgSR1qIUhhK0Ku2lb8QOVJtlbA02Qp4?=
 =?us-ascii?Q?B35/UucYwWgteC+7ySdFQovh8WSe3xZ+wda2a8b2SALo4J4tfXY6vRpztVkA?=
 =?us-ascii?Q?5QlUf6YJwWWcQhvVdsv5ZiZhZbstTC3PJ9m41X2oex72t7LcSBn4la0QB/KV?=
 =?us-ascii?Q?UvPwuwx1lQ0WK1ISwgsaJp4+O6f/YuMSO0TObGEvQe0TEb5rz5Gw3YKBTPFA?=
 =?us-ascii?Q?mSlR+Zr5bSg2fHl6S4dcZjydU2B4CaF1zsSy+GQUXYrj7maeS1JRwPFvyyyk?=
 =?us-ascii?Q?VGB6MKOYjAGvdqaXT94jl2o9Lcpt4By7vLsNPX/kV9RkeagxjuoyOFYrkThZ?=
 =?us-ascii?Q?NllnSKwVMBgv/1CIO285hMpfBNpMfVw303N76Z9AaU6knPyCgSAUQLe8muDT?=
 =?us-ascii?Q?kQ6jfJjEHH6OdO2b/FQZysSNh7ByeG8sjaY+mVq7sxAhDjHxYh8C2g/Vy/PH?=
 =?us-ascii?Q?nRS/j+n4E8onxBkLDaE/L2k8cKiwnQjMYejiSMuYqXa6htVd+JSUEbxcfw1Y?=
 =?us-ascii?Q?f2mw1nAyfl5d9rjCYubZ4THGqGoeGDFO2w4GCaYBeGQi9FJxkBCPIv8pB41m?=
 =?us-ascii?Q?OvQHAh0D5lqZs/daynarlMm5W9+TeZLT7pQwFgATTBTt0djX9TMz53SK75In?=
 =?us-ascii?Q?ViKodcdaGHeukJhgxDt7+MuZZkhgf9Va39s6WMV4o+7JnO1N3kS8gQWQrsK4?=
 =?us-ascii?Q?inGF+oAPoH9/LQHdDfIWgN8RdBxB6yFrDd1BSqUNMIXExLdC/pcquNki+ZIc?=
 =?us-ascii?Q?QrEaZjj9/pqO5cJdRqQY9jQa+OlzscPxnV12c8ydeIeAX4p2czF2Xm78tuFK?=
 =?us-ascii?Q?v2gsRTG+zm9N6wrMWplx4CKLOArS/7CFjxLF1tbDDnbXsCoocCKDdsS0sD60?=
 =?us-ascii?Q?Ke+o1/5chhTH+4Dg4a/NoeeUOuKg0xndpSPpKcLnCkMLowDx354dd7JDy5G9?=
 =?us-ascii?Q?ngAROfmUBcwnTvPe8N8yX2vWXzI/hpI/VObYWCchiVw3lL7kNZLwuASJ99So?=
 =?us-ascii?Q?r4MFspS5heg49kR65sHinEecHiDd8wSsJdPluTUaoP/0ES3+k9Qw4ks9D6gF?=
 =?us-ascii?Q?ADvP8rAXpM5fdLmBgRtRDutjGpyFpdn5TjYS2TzjDuPYwUCsg/jkP/A6yp8r?=
 =?us-ascii?Q?renNOrOHjwnalnTfvnTIY+5VXOrslLAQwbtBaJ5c4UJYbSjffZqqGIGJpmEw?=
 =?us-ascii?Q?wTLMLtJ2LQcOruox7PgHkyF7j10EgLpSdTcU+FxC+Ip7ckUGnvKmShUdkhXM?=
 =?us-ascii?Q?8yLYk3bynHFSbuvRk2/VxH6smLvaiDOQNDab+jQwO3OAD0wWuyQoJ7p+yxNg?=
 =?us-ascii?Q?iA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	O5R07juBG6Dyj16R+AvO1vWU9q8sx+ydGXlpCc+iFCLctSchLpxpwVCHPbJkQ6WnxeQ4bcpL+KfFOnBOcd1p1pU863+cVeh/Y3vG0cFpRLjCUuLyLuybghRBEhiQ1ROqjejusN24KEWRL1W69DqCjZR/lTYJ40F59zxUjfRsKFM3qNpkkRUlRmofsWF9ZzyVIQWPJ2iu8yAPID8pRpq4bNqFjNtVkFfDG4Vvr/Ht9iY5d56UYGTKYcyG5hu5X/nzbXGmPTE8Ca/gs9A4k73uNjBxRnm/nktgXVL+gISKYf/tr1HqvoBKwqWIgu1AlF4sWqFx+j31UuE12nTiLfQfr6zCU3wRQ7Y9KbD1kQ1inl/NHV2wcf9end662EYp9tLY4rX2K8ULEk+3U10tL8qxBOIcnljA5lv2JGEJEmH+ajRjvS2DMG8tPKJwa4JYnuwrbMLhklatKCvESHxEDYgK1vJDUfokvRA3UColx9Fmx4JKKYZgHPQQzdUqGLkX5Z5Q1yoWsIXUOmQg0yme09VboikmTajc3WUuFZG+y+jVCRII/cHLQsx8Yjm0+1YV25PNAvD+l1WwFxwe2NidafhYbtBzI565PSBhCIReUDGoXzY=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d2cc5d8-54d0-48b4-e7df-08dd8413cc89
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Apr 2025 16:11:12.9099
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dMPjIG2Ke2gWFu+lUeqIYHZ4h2dNArHqTYpYb9A8uSEIQ7yn/kTpDEiyxDdlHKGtCszd1GOjrM93jeByjihy0fpxYOt5qRQpStsi/C8xtYg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB5723
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-25_04,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 mlxscore=0 adultscore=0
 phishscore=0 mlxlogscore=905 bulkscore=0 malwarescore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2504070000
 definitions=main-2504250114
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI1MDExNSBTYWx0ZWRfXxgOrK5dvyF4Q PyPIxAUQEFVjbVsnog7O3fsTY68BcNHSZ2ZZL9mT2LsLWiFifIXUC7ZolvdOU2XdmOK2VOQkWHE XTCKKwRDYy8mxTG5vhEg4PqKYKt1wPL1XCJZTOgHAxs7+Uc1sCtuGcstrHMuYzUhxS+531Di1Iz
 CSfqivUIkbh7S9yeg0szmgQskW+cNI1pWZbH6+IjLknAo8IlIuzp+plzFStZG2vN89jSN7Z7OAN bAZFZ38uwYh0LcLiX9bb9OhFrHqhVDiJrSnR3LG12VfzN5UstEmmYXRQL9MLK4ricZSWVp/1IU8 xmaMW0OSdAnO3KkHJ4e/Db6Rc2w0p7en3FU+VyJdy34UQEdxafUVj5/gIPIvLyLcVPXO99CNim8 czlJsykW
X-Proofpoint-GUID: u-AFTZX2q26eJ9Q-ErFAfRo6DQFnhTsH
X-Proofpoint-ORIG-GUID: u-AFTZX2q26eJ9Q-ErFAfRo6DQFnhTsH

Andrew - can we drop this from mm-new? It's breaking it.

David, this seems to break on qemu boot for me in Andrew's mm-new branch,
bisected to this commit.

Splat on a basic x86 defconfig variant:

[    0.029481] BUG: unable to handle page fault for address: ffffea0003000034
[    0.029840] #PF: supervisor write access in kernel mode
[    0.030089] #PF: error_code(0x0002) - not-present page
[    0.030327] PGD 26ccc3067 P4D 26ccc3067 PUD 26ccc2067 PMD 0
[    0.030599] Oops: Oops: 0002 [#1] SMP NOPTI
[    0.030794] CPU: 0 UID: 0 PID: 0 Comm: swapper Not tainted 6.15.0-rc2+ #9 PREEMPT(undef)
[    0.031177] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS Arch Linux 1.16.3-1-1 04/01/2014
[    0.031610] RIP: 0010:__init_single_page+0xa/0x50

__init_single_page+0xa/0x50:
arch_atomic_set at arch/x86/include/asm/atomic.h:28
(inlined by) raw_atomic_set at include/linux/atomic/atomic-arch-fallback.h:503
(inlined by) atomic_set at include/linux/atomic/atomic-instrumented.h:68
(inlined by) set_page_count at include/linux/page_ref.h:99
(inlined by) init_page_count at include/linux/page_ref.h:115
(inlined by) __init_single_page at mm/mm_init.c:586

^-- faddr2line decode

[    0.031832] Code: ff e9 0a 06 e4 fe 66 2e 0f 1f 84 00 00 00 00 00 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 f3 0f 1e fa 317
[    0.032710] RSP: 0000:ffffffff82a03da8 EFLAGS: 00010016
[    0.032954] RAX: 0000000000000000 RBX: 00000000000c0000 RCX: 0000000000000000
[    0.033287] RDX: 0200000000000000 RSI: 00000000000c0000 RDI: ffffea0003000000
[    0.033614] RBP: 0000000000100000 R08: 0000000000000000 R09: ffffea0009b30000
[    0.034186] R10: 0000000000000000 R11: 0000000000100000 R12: 0000000000000002
[    0.034519] R13: 0000000000000000 R14: 0000000000000023 R15: 0000000003000000
[    0.034856] FS:  0000000000000000(0000) GS:0000000000000000(0000) knlGS:0000000000000000
[    0.035240] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[    0.035509] CR2: ffffea0003000034 CR3: 0000000002a32000 CR4: 00000000000000b0
[    0.035846] Call Trace:
[    0.035961]  <TASK>
[    0.036070]  ? init_unavailable_range+0x42/0xb0

	for_each_valid_pfn(pfn, spfn, epfn) {
  		__init_single_page(pfn_to_page(pfn), pfn, zone, node); <--- this is here.

[    0.036284]  ? free_area_init+0xd70/0xe30
[    0.036473]  ? zone_sizes_init+0x44/0x50
[    0.036657]  ? setup_arch+0x9a8/0xa80
[    0.036831]  ? start_kernel+0x58/0x6c0
[    0.037010]  ? x86_64_start_reservations+0x24/0x30
[    0.037236]  ? x86_64_start_kernel+0x8c/0x90
[    0.037439]  ? common_startup_64+0x13e/0x148
[    0.037642]  </TASK>

Cheers, Lorenzo

On Wed, Apr 23, 2025 at 02:33:43PM +0100, David Woodhouse wrote:
> From: David Woodhouse <dwmw@amazon.co.uk>
>
> Currently, memmap_init initializes pfn_hole with 0 instead of
> ARCH_PFN_OFFSET. Then init_unavailable_range will start iterating each
> page from the page at address zero to the first available page, but it
> won't do anything for pages below ARCH_PFN_OFFSET because pfn_valid
> won't pass.
>
> If ARCH_PFN_OFFSET is very large (e.g., something like 2^64-2GiB if the
> kernel is used as a library and loaded at a very high address), the
> pointless iteration for pages below ARCH_PFN_OFFSET will take a very
> long time, and the kernel will look stuck at boot time.
>
> Use for_each_valid_pfn() to skip the pointless iterations.
>
> Reported-by: Ruihan Li <lrh2000@pku.edu.cn>
> Suggested-by: Mike Rapoport <rppt@kernel.org>
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> Reviewed-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> Tested-by: Ruihan Li <lrh2000@pku.edu.cn>
> ---
>  mm/mm_init.c | 6 +-----
>  1 file changed, 1 insertion(+), 5 deletions(-)
>
> diff --git a/mm/mm_init.c b/mm/mm_init.c
> index 41884f2155c4..0d1a4546825c 100644
> --- a/mm/mm_init.c
> +++ b/mm/mm_init.c
> @@ -845,11 +845,7 @@ static void __init init_unavailable_range(unsigned long spfn,
>  	unsigned long pfn;
>  	u64 pgcnt = 0;
>
> -	for (pfn = spfn; pfn < epfn; pfn++) {
> -		if (!pfn_valid(pageblock_start_pfn(pfn))) {
> -			pfn = pageblock_end_pfn(pfn) - 1;
> -			continue;
> -		}
> +	for_each_valid_pfn(pfn, spfn, epfn) {
>  		__init_single_page(pfn_to_page(pfn), pfn, zone, node);
>  		__SetPageReserved(pfn_to_page(pfn));
>  		pgcnt++;
> --
> 2.49.0
>
>
