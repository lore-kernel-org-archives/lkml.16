Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB05D224247
	for <linux-kernel@vger.kernel.org>; Mon,  2 Jun 2025 14:19:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748874001; cv=fail; b=V/5Nn9dF2v9aRKy5sj2QJBTK0rOzXERchQlHXBYcJqgJ9EpjGMFRsFPe3gYa8cD7Yzm3VSwgxCpTeiKhZMmdXDxWRtiBiUiBP1YYsXOwQHGoGtiWZvaU366zT1EQrdRubbaW2ELAvD5VOidJ6zOFCFd4U9BpT31NQSJVfVNqj7Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748874001; c=relaxed/simple;
	bh=lm27+4HB+6B+pv66LpbpnpyUxHktC7JyEuZbo3Ataps=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=SiQm2dxC+8L4P3BKQ8jnKee/3Cr6WuvxtyPZmm7574BLWJtvg0beZy18KIFeCfESyDNfbvzJze3dARSADeeU5yv90B+xTIP2fCSmNO5tABLYtskgjtc6pls5dnmJynimmGpStmRvyLCi4oYRJhv/4zJHNjuyocE9kvc/u3UCfTk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=VK7K+fcJ; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=l60rk2wO; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="VK7K+fcJ";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="l60rk2wO"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 552C4X8b031289;
	Mon, 2 Jun 2025 14:19:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=lm27+4HB+6B+pv66LpbpnpyUxHktC7JyEuZbo3Ataps=; b=
	VK7K+fcJgwfDx98EaopL/UiUz7zDMS2tEf9SaoY4oaX0nm328Ea0gLOODLYjpCmI
	WBNmnSlJAzNd5MNxGlO4yD7QL1AnTQLSHnjYKD2uxKvxAQI61FDH8AOYxTkCgG2o
	a8rZg+mNWrYw3jTUq1mWWubCXQajSg22rdyZZOK1UvKi8lKIWA0yGqZsV0Dp6m4b
	50hYrs178OIVUE3G87fS9l7GwBxN2wQ1ISxS/df7R8gkatKR3lQAYNgB/K/nKKeH
	sTAlARWpCKUVeRDOBZHMSa/qvlJnSXdQqUgtBbiPs+M58sD35ncij4Z9K/D/VAhw
	Vjw5GdDY1rjajEgQV5CzEA==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 46yrpe2qkw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 02 Jun 2025 14:19:45 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 552E4EMp034843;
	Mon, 2 Jun 2025 14:19:44 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10on2078.outbound.protection.outlook.com [40.107.92.78])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 46yr789j33-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 02 Jun 2025 14:19:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d4ex1FPGLlKai+mmdfmbmBd4/tomi0E58KLzxLbZ3wBzNQXGKOvJiCYhHQqbwwSgnbFlAMSa3S0q5j8BsdeGSV8sUFJSvQBEzKILSLKlm3nWTZQoL+bhf7o3BZoA1ojaZdVW6vuOJKSEo204CjSOi1Z2b/Vxby7io8fP2fqq/ZTmV8Wll3KI/1dOAGIa1l0KysWcvJ9vkYvxRDzRvp3Ac98FLIcVnHROwaptYxAUFkweLCX8/Dvk8My7RjHTNV3OqEFfT6CEW0yR4aZ2dTNWhYnEWXPCogGsZev9JK2lRmK7GY1KhjQeC7Il7954UwKVDrBorAoi8g+RhtauGGrrng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lm27+4HB+6B+pv66LpbpnpyUxHktC7JyEuZbo3Ataps=;
 b=M1sWxQ/wr3M/Qq4WfpsXC49iVpYpBre64CqoqY1HIGXoIPKy/+PgGkYihE8CwF8EmYKPxsHPAxzp8u5I2YSbvQ/oH4coHqTBtqWNI8r/1IthgPnoeXRy8PSkHM8j4Wmz2N+aRcpZUkfsNKqKQbkZY+ECzDSOR2BbcMRnjBLMxNOgrgftTf8K+oqAWZl7IomlmOSLkuI4WfZJ/aMO+5RJyZkQdiX9+TVGclgu+AIVmmAFgr89U+Ybz656GJK3H44m+teykR8w/GZbUclmJ0dtraO6Z+Wa4XPn9QiF4/yjUh4T6rEqb5URMz9XERTNzPN1eAgOyZvD6wW3vlHDbKU0PQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lm27+4HB+6B+pv66LpbpnpyUxHktC7JyEuZbo3Ataps=;
 b=l60rk2wOUirNKZVszhP/SCNU91PVOH8jlYAkenltZIwiJnKQWUputm7AqEoYYl50+0RC4lRHQGxoZOc+FmdiFEzGy6rP8r2ye68joV0OprQpcuZT4T4iYy+CAUwaxawAz0qu5hxI7mhXAJomKbMXBmxxTdLhYB0LpjMar4DmC+w=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by SJ0PR10MB5672.namprd10.prod.outlook.com (2603:10b6:a03:3ef::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.41; Mon, 2 Jun
 2025 14:19:42 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%6]) with mapi id 15.20.8746.041; Mon, 2 Jun 2025
 14:19:42 +0000
Date: Mon, 2 Jun 2025 15:19:40 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Suren Baghdasaryan <surenb@google.com>
Cc: syzbot <syzbot+23de6daeb71241d36a18@syzkaller.appspotmail.com>,
        Liam.Howlett@oracle.com, akpm@linux-foundation.org, jannh@google.com,
        linux-kernel@vger.kernel.org, linux-mm@kvack.org, pfalcato@suse.de,
        syzkaller-bugs@googlegroups.com, vbabka@suse.cz
Subject: Re: [syzbot] [mm?] possible deadlock in __vma_start_write
Message-ID: <59aed5fa-1d19-442b-9b7b-a99aee9b7689@lucifer.local>
References: <68387feb.a70a0220.29d4a0.0830.GAE@google.com>
 <04c893fe-0498-4847-a525-9efb6d9306da@lucifer.local>
 <CAJuCfpGRaP2H8S6ZEr4PmxktL1tVdGM-18QyQ_N54S=RwE5tvA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJuCfpGRaP2H8S6ZEr4PmxktL1tVdGM-18QyQ_N54S=RwE5tvA@mail.gmail.com>
X-ClientProxiedBy: LO2P265CA0236.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:b::32) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|SJ0PR10MB5672:EE_
X-MS-Office365-Filtering-Correlation-Id: a6f9e09d-eb58-48e3-35f0-08dda1e08438
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Ylo0Q3BlZmFueS9xNFRWL2RrUWZGU0xscWg5NjVFRE5HSFBGVzRiVm9UQjQv?=
 =?utf-8?B?VnRYNjY1SXdhUFdwdmtESFpHMkIrOUQ1RVNwNjZ4SmFEZ1AyN0ltTVhLQkFw?=
 =?utf-8?B?VXpHOWhhUXNZMkhXZmZSSlNpd1FlV2cvb0VvYnBqZ2hmekNyL0ZQQ3N4clFF?=
 =?utf-8?B?SXJrd3RTSkR6YmZhQzJadGM2VkJmcWJVWm5QWEIxRmV3eGZuVUdhL3YyQVdK?=
 =?utf-8?B?QnFtYnFFUXVKYVFJeTBXdlpiMVh6UmFaUlBVVHk3WkNCM2YwM1MxRFdFUHFM?=
 =?utf-8?B?bFhHUnplb0VmMlgxaml0MW91YXFpNGxPZDg3UU93c2QzSUlpdm5FUzloVUZ5?=
 =?utf-8?B?dFlHWCtVQ0EwSU9qbWFiVmgxUk4vL2owZ2g0ZW5QTVdBbldjYmpFRzlWMTRY?=
 =?utf-8?B?RUdGeFQ2bmx2N2JVUXRtTG1salg4bGg2M2J3N1ZKZFkvNWFkSnkxUzdhQ29w?=
 =?utf-8?B?QlZUNHlTUnBoWkFqeXV1RmJPc2NJdDg3TEZOb3Q3WXZNQkNMMDlrWW5iQndz?=
 =?utf-8?B?ZUswd0U2cW56ODNhd1pyRGUzaHp4TC9tQ2FQaFd3ZU1hTk9PUnRlSGJNUmR0?=
 =?utf-8?B?aTg0QVdXcm4yZjZ3Q09VRVRNNjVLbXBydkJJcktOYTE5ei8rZ0preU9oOTRS?=
 =?utf-8?B?dCt2VlBvRFZGM0JvaHF5b3hQVjJUVjhpVzhGRXJUQnBiRzZWQ1hHRzdHMi9X?=
 =?utf-8?B?cEFJWHhQUnEwdzBEN1E4ejl6LzFaQmlLOXlkWWxvdHJwSGhxcC82Rm9Uc2Zx?=
 =?utf-8?B?K3NmK1dJSnJhbWhubHRsd2Y2VFFXTzFLSFF5NXBLZDRwamEwYXYxZncxa3Bk?=
 =?utf-8?B?Zis1bk1pbTF0ckxjd2Q3RG9IM2RaUjQwWGttMWJNL2dzRXZGMkJGY1M0V0Nh?=
 =?utf-8?B?bDJMNk91cit2VHBoL3k0cFNTSUNkZ3hJcXE1S2kvWitlMTQrTENZUUNZT1lI?=
 =?utf-8?B?b05KczJQVndyM2V1WjhDYTFGQ2M3dlRmbks4M1hyNlVWbCtvdEc0STVUUkUr?=
 =?utf-8?B?eWszU3hJc2dXSXVGSzBTaTcwSmlCNm1aOFBTZDZzODV0bUswMXd2UjdielMy?=
 =?utf-8?B?MnhlMFpxM3QxT2RSTTNWUXF2WVArbHYrL3NtT0JBUjdhdUJyVmF1RVU3M1RP?=
 =?utf-8?B?b1NwMDhZOXhwbUwrRUdNbmJsSHlCM3EyV1hBSlRjNWR6YjhJeW5JQzR0NTg3?=
 =?utf-8?B?WW1yTTBUMUpjQlk4UUlCa1Y3UHJIQXR0ZTNPVzBXUm0rRGRDQU1JTUVSL1lB?=
 =?utf-8?B?VVA5UFYvdFpaN3pKNDFSNU9sSEt5NUI4cWZGQmN4OG9pTDJXQ2lzeloxTDBx?=
 =?utf-8?B?OWN6TkZmbGNybWNNdWo3QWdKSkhMeENIT3BWVlQwenRpZTZIeTJORzdSVm9k?=
 =?utf-8?B?d2IyS0NYTWpuUXRKeHdkZXR4c2NZK2FKZTBOSnhrdVhsSlV4endoNEpIK2dv?=
 =?utf-8?B?NTFrNWJPZlo5Y0VweklTcXRNT3ZzeE1lU05ZWlZBZzJlVSt3TEJEb1FOWkZi?=
 =?utf-8?B?Q2oyQTVSMzRGSUJiZS9ZMVhpZTNoaWV5Q0ZHWm5KRnEvWXFZc3BreDE1R28x?=
 =?utf-8?B?MmxOVnNqR3RFbm5OcUxpQ3c1b1BjdWRWOHYyL3dGd0NwRmNlRm1qdEtGUTFw?=
 =?utf-8?B?TDF3WXNaWGZReUFOVWg5ZDRiSEtOcHNYaWFuU1BsbVhuQW9tQTZaVGsxM2Mx?=
 =?utf-8?B?eHpONUxEYlNKVEdCR3ZwUDlFQTBMYTd3dXgySm4rQmN2Z1VGYkVXTjJiSzdx?=
 =?utf-8?B?THdIVmxwTk93MmM0Y3RpSFhEUWNKL0gvaGtSVG5ZM1BpMUdHSEx0SExWOHNT?=
 =?utf-8?B?MjZHOVY1Z3BTK2FaeUFmVHJCcitkZkMwZURSZnFTSDJYZFJ0UmorL2NQUVBM?=
 =?utf-8?B?alB0Yk9aUmh2aTgwNk9QQSt5R0l2emxWWW1yM0x5RytLN0lncnRjTGR1VkFJ?=
 =?utf-8?Q?bZFwLWwrokw=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NjJmbVlrM3o3QTN1b3R3WGNlZ3JMMkh0ZUZnVmxUeVI3NFdSc0xaaHVEYWR0?=
 =?utf-8?B?R2l4UnoxTllwMUZoRC94NWlBYWJOTnJ3SVpxVE1zQUpQU3k1T01KTVlNMUgv?=
 =?utf-8?B?c2JJYlBUVnZ4YUh4QUl3c25LT2ZuT1RFdWVWRTJmcUpLd0pNcCtHMFpQVmNP?=
 =?utf-8?B?QWk3WDdJSExOTVFPTzlkSFBHRWZMcFNvTGYxRDBtdnRPSlZ6N2pJU0lxVERU?=
 =?utf-8?B?L0FrNzJVSlQ2WXM0Zk11L0FRRXVxTlR4K2FraHFhYzdQWmlseW9XQVQwcGpV?=
 =?utf-8?B?dS80KzhTcFRnRlJ4aXlrMGdETGw1TU9RYlQzOHVMOGNpQmZiQ3VZL1poa0lZ?=
 =?utf-8?B?ZjJpc3hDMFFTT1V0dmp2S05tVmc5RXBiLzZaWkdOQ25NM3grRmszYzh5YW5n?=
 =?utf-8?B?MTJhdjJjemZ4VERCWUR2WWRyQjVuTkdoZ25HSFJEWkhzV3BEY2picHNjTElq?=
 =?utf-8?B?SW1ZVnMwcy94WmhPcWJsOU1WbVh2V3hETDdvUXZ3OHF2NHlqWkJwcWV6THI4?=
 =?utf-8?B?UzcvTHJyOXpxcjErMGM0WDNqOElJZ2E1cG4zVno2RnYyM2V4WFB2RGlRUHZO?=
 =?utf-8?B?QnhrNlBhbnpxK2ltWXpucFVaN21ibXQ0TXpjTmdteFNnWFRtcC9MYjI1UGJK?=
 =?utf-8?B?T0Rxbm1aT01IeUQxY3JUS1Z6WmkyakJuNXZ6UjlRY3NPMjZhMHh6Q1JoV0Zu?=
 =?utf-8?B?Vkt1OFNSZFkxb1VwMkk2TU1qVGVicmFMNCtFWi9ZbzE0bG1kZFh3NTB0YllY?=
 =?utf-8?B?dWE3aFgwalNoOXUvcG00RVFwaXQwT1V0L1BpQmszS2EwQ1FaMXNjdDR3MThq?=
 =?utf-8?B?dnMxUVZrK0F6dFF4MzBJVUQ0WlRUVWxMd002em8veWVDWXNYUWRveU1ybnRz?=
 =?utf-8?B?T2RxUFlITGs0RHZZVzNCWUk1STdiREpDQVRqakJvRTdvbCtLdXVRRWFOV0Zk?=
 =?utf-8?B?ZC9GMjZGc28xSXR2MStQVGdiMHJMdWZZZHR0NXpkd2N1eGpZdEhoUVpoWHVa?=
 =?utf-8?B?clRzeWl4SzVVMkx4RExDaEc1dDYxcHBPUWdVemxVRE1rck0rcFZmcGJnSVlr?=
 =?utf-8?B?UlNRbTB6NVdkR0p2cUhKL1hXc1E3RG9HVERaSnphNmp0Rit5Vk02dlF6YlAw?=
 =?utf-8?B?eGdEUGdLNll4Q0huTmJXVEYwaU5YSmlJOFRZVE5YK0hmS1dYU2Z4WkpUR1Vu?=
 =?utf-8?B?Mit4U3M4Vlc0bC8wdk1TNTROWjVNTHdGcFZyVTdBU0FKZ3d3b1hmUmVzSmJZ?=
 =?utf-8?B?QmNwQ3VSdjMweWJnOW9GM0hudTIxMHFMSGdObWtkdzYxUkVVbnc3Nkg5MVBS?=
 =?utf-8?B?bng3ZnIwU09FS091VWtRQ25MakZxMkZiS3luZkFFYmw2dHl1RmN2b0lIazhV?=
 =?utf-8?B?MUZJdGF5cW9lY2pwTGZpYkRqL3RnNVkwa1hsaHo2ZmMxVDU5L3dFTFI2R0k1?=
 =?utf-8?B?RmtnUnpUL0xXc0s2bFptVXFXaHZML0ErVW1GUTg5emtGVk1kMnBaKzhXVlFw?=
 =?utf-8?B?RnhCdWtBT2ZZTTYyczZZMDFlYjh3Y1dnYXNJNzIxYWlZR3IvUkdZbEJJQktT?=
 =?utf-8?B?cktPeVM4YWY3RiswRUxZTW5WRWJxWTFZY3g4TVAxcHY5eWxZd2haOXhLYVBq?=
 =?utf-8?B?MG1EWUQ1SXNSbWVnVWpEbDJHRWJFd3JFNk1NRnIweFczeVBxM2ZOZ0EyYm96?=
 =?utf-8?B?dmplbFZzdUVpUVladFAwOUR4M29TU01PRVJERVh4MUZ0VlZqc0gyRFJidUxv?=
 =?utf-8?B?bVZzc21oMFMxSEhaUTRhUGJTUVQrZFl4OTV1dFZDVmh5UWpBZ2U4cWwxWndm?=
 =?utf-8?B?djhxL3NEUDA0RC9VVi9mb2ZlNkZnOUxHUWltMEFiS1lUMFlWQUN3cGtOV1dY?=
 =?utf-8?B?enFQQ1FlSlR0TE9nOVJxSGZTZExneU5XWmpQWUdIYWg0a0pGUjBrMWpuMDh6?=
 =?utf-8?B?dkpBSTNLWWlPTndmNFFtV1VZNGdZcEhOOUx4WmpOdEptMnRueEI0aVIxdnlD?=
 =?utf-8?B?WVVPWFZpSEc4SWR0SklmcjE5VEo4Y0s1aVZsRG42cFFMMnZXTFV1QVBCRVN2?=
 =?utf-8?B?Wk5XUW9QM0NCRm5HSDZML09tVXRlMW4rZkdSMlh3eFg0eG9XQWZvK1ZUUExu?=
 =?utf-8?B?SVdnNWZNVTRYc2M2T1hlLzhpSmxxakNySTdTSDZ6UVkvVWdubzJoaHJqSkVh?=
 =?utf-8?B?UFE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	pX0ufbKN9dRoPpstrnyLqOaN8c/nxSh7guHXgf5kfWbBWENH9YrYAriYC4tAGcloSsX8guXYWuTmgJhOv+Mvq2QI75YdZ8cvDCxU4yHb4e3mDR75RCJakLI+nltaelHoBibH91YVTaxLnVA7Th8OaghNNRhV3XgqtkkvnE5k2JLgKStzaqUXMtbq9mVoU7QaxL9zZKCz60b0ZvLMAhzoPJdiSQq7YCHVhX4UxJCaEE6zoZDohED9CoG/h47X9DhP3uGEZE1hLnQu85BoerJ6zpyeQXazWCfPcHMjQqIrWjPSrwoDkL9xQPia0JTBhMj+NH5U95zFcm6nJmdeqQc1XtXogbrggnCj0XrU9UwnJkgJTwf303YJWtmLEJHfwU3y+BuhaG/XzZTG/vDr2OsLUC64BMnRuJwyS9XK4zyI5EgXtc69Ehskb1un1PNg6emOBwlIyYr/IOKpM4HSuDUWQTi2up9HEsIy8CgJqIO3mdHC+yY54A5C1Ny3VHHKLxbxOW6V6V7dHUSQa8ikdRzW1C3hEcLORhndmnWqtYQbVrO80VoLIgPQvn1PQL8izmJO4qBqkkaB8XupMhnE2+N7ZBPtN2UWopIdB0GlfiaQSMw=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a6f9e09d-eb58-48e3-35f0-08dda1e08438
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2025 14:19:42.0542
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0UhF2sbzZsSTW54uncWb9Ddo74GJ5iPzdKRWZoaPKCnbakcNtApYF4c0juKRXe2e8Io26zaql3Cwuu+DDpeWgmd/8xSAnoNmhP0GrOZ/pIw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB5672
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-02_06,2025-06-02_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 mlxlogscore=887
 bulkscore=0 spamscore=0 suspectscore=0 malwarescore=0 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2506020116
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjAyMDExNiBTYWx0ZWRfX0AU2d0pBolWg rJA+Hjvmi/XnW1iIz6E2rorQA1ShH96KrgrUKvwyr4npKixn60DFznJLSCgrj0GdOkG4B6VpxFc ubh3wgmrY9byRbDJQ8rrS10dv2/QK1N8yEzYyq1kKypMeyG1GKy1mDTZKfy/lREBjpfpM50mBR1
 OLF4zxU3VKH5whvLIaNDHwU1N/z13nAjJpAUykGqHX2xE+PIT+QgyE89cS/RpFMhr+5PCGhDeig HyRbAHB98tzcScEgPh9NkekLKXk6gg0hm/M1owG2EfpIXnyjmdXs/CNdYH5LLQAlVL/Xtpuk3Jp Dg/1Rrbc7cSxcDvIg/q1+gcsMCNNEeT4R0+4sIG6fWG7QOa47tmRlCVghJTGu3YHJ4r//6BlJBt
 W230+JHd1atlwA0+ZU9J9bNy+rrVtSwXuZ6LpiIu43KgKdoe+o9CrBTxKvGHq5xmXLTeAyoN
X-Authority-Analysis: v=2.4 cv=NN7V+16g c=1 sm=1 tr=0 ts=683db301 b=1 cx=c_pps a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=Y0_x0fEWnUio0lmcWgUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: -0rd7AmrGGrxfJ4K-Dbln4Tgcvri7D7A
X-Proofpoint-ORIG-GUID: -0rd7AmrGGrxfJ4K-Dbln4Tgcvri7D7A

On Mon, Jun 02, 2025 at 07:16:40AM -0700, Suren Baghdasaryan wrote:
> On Mon, Jun 2, 2025 at 6:04 AM Lorenzo Stoakes
> <lorenzo.stoakes@oracle.com> wrote:
> >
> > +cc Suren
> >
> > Suren - could you take a look at this please?
>
> Sure. I'll take a look today or tomorrow once I sort out my email
> backlog. I was away for 10 days and have 2K emails to go through.
>

Oh man and I thought my inbox was bad :) Sorry to add to it!

No pressure, just a weird locking case, I'm wondering if there's something
here or we just need to teach lockdep that this situation is ok.

Hope you had some nice time away anyway :)

Cheers, Lorenzo
