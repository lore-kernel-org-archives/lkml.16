Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 619821EB5C9
	for <linux-kernel@vger.kernel.org>; Wed,  4 Jun 2025 17:30:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749058217; cv=fail; b=IxD7Vwa8m0fjYGT+yz4Tw/bCMEygGYcWftNNSAaaOhQNKkKI0hwRrqcokrdXHGLSQNfAEQrjvxV+LTyG/QumJcD+kQlX57+JBYQs6BjKsXE3b9J19FE78mP9QF5KshoWxEhUC0qHCz2dsdllLh4QumPJjpkgncuCGd5mDDtBbfQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749058217; c=relaxed/simple;
	bh=kS214nJsjlG9WVpuxVfg5NMTAaeEIZH3jb41MeRUEfI=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=gbhdSanbG4HHFyuPMdQf1xN+UxFIChs6IE3XkzTEGv4Jb45Pa6p7kdQyXvfmRj8HuY0SMyecDmWxXBqKj7hsSw4aisdEfKjO+iirQ4/hQRIVxACZUeU9w1D2Mlj9VCWimXNduV29a5TxacqdOhExvznmdD8wk0ZuemwFV33M6ro=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=A+MXPt35; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=c9QQLnFR; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="A+MXPt35";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="c9QQLnFR"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 554FdxZW029648;
	Wed, 4 Jun 2025 17:29:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=kS214nJsjlG9WVpuxVfg5NMTAaeEIZH3jb41MeRUEfI=; b=
	A+MXPt35m+0s6SYiOT78hISoRDiKb+L3TaS/eR8rWSKdT2kA/Zn21mxUYbUXYGLi
	o8zU5/iDtUj7BijicV9fUk4n8JxLjKkcN3J2KPj+UxsvRvo3B6JE3pCZf+yooLv1
	qNGknjIsEtT25uSb8Q4pLEyjUrhxxxuEudHi3Ft+L+5sZgm2vabEfVSAlrZ/0YoX
	Tchv1PGkpDeDK6yRIu+Z5ywbJhyCR3TY98BZIACF38jSI9LH6KuMPY7JLJ3Bc8Pk
	LaKSv79xpwTlOWI9iWM5dfe0z0qtFsQDE61sPBWabxH+ofSxECbcQkuCPtDzkizu
	BeYFP4G7HppXsNFRtacCww==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 471gwhcbx4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 04 Jun 2025 17:29:50 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 554G82Iw033812;
	Wed, 4 Jun 2025 17:29:48 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12on2052.outbound.protection.outlook.com [40.107.244.52])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 46yr7b25mv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 04 Jun 2025 17:29:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gbLT1iui9dBwlB1FrdJvPldNOe25526/ko+A0Q6pZZSfjfVzAEXOXQxeUCnrA6peAx27v6EhQBEh2gFgvQ2hNMYq1gz867O2Ky4cSzAREy4c2vVzk5YJCVKU/jWP8iaVsVDxksyh9cE/tV0pc8GQxMunoAoEVtMBDRnzbowq32egVCwIDKrbFdM9tGJYqgLzkRiSZKI3C8PzjuFba7OL1Be2g3XJlOsDfxyq03I5ZaGu4Y/NZwUuYoDigozqjBP3gGET4o7P9iPgUBVLORF1xP3zmQb8uqZxEHlGHTej+ulRasyjE5jVZRAYEK+2ezBYD4OZGkIor6cFupI905NBpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kS214nJsjlG9WVpuxVfg5NMTAaeEIZH3jb41MeRUEfI=;
 b=rJVWKCpag5ZSrrARTisVUStdxcF+iwVNyy7fGaUxYywU9cmQNMuoqWRKaJ6AxZ9a51xNcIaqgQeVdKWQldmM0bUghAIE/kcJ4rEt0biI8JH2U7FR58h+QwpjBMX4/gQsQ52VQoMADtoamR95si+BBpJZxwJ4L+oLy1QUyGJkuVlb+JIbVJf36vW+eArnlA8nKdG1UsdNC0DS680NMiEKWOmZ7vbNPv2vFoa7oqfIX23ftpMdegBkIduUv9l9gBADKLNNC8k1iqs0KaquZPn4IyvUr21Hh6ITch6cIoWFqZfCa2nvno5Rb+Z7EbTzpdgX0xB55px2MvAAKLkXCvm2GQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kS214nJsjlG9WVpuxVfg5NMTAaeEIZH3jb41MeRUEfI=;
 b=c9QQLnFRZgXOSCdnLciYIo8oCI2oU2Ofyy7psV4hASvAWMqgSXGjZeayHgx8yUTtmQxs2f9c5pD0QN1OXzTfvsZDXcutPzEEakUW3b5sK2FDncvK84K8fZ6MjL0l7IndhWn3nixVGZS1+Cz2eNz/4OBWI/TUMx1OAsII8TBxqxA=
Received: from IA1PR10MB7309.namprd10.prod.outlook.com (2603:10b6:208:3fe::13)
 by DM3PPFE9EDA11A0.namprd10.prod.outlook.com (2603:10b6:f:fc00::c52) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.34; Wed, 4 Jun
 2025 17:29:45 +0000
Received: from IA1PR10MB7309.namprd10.prod.outlook.com
 ([fe80::818c:4ed2:2a1a:757a]) by IA1PR10MB7309.namprd10.prod.outlook.com
 ([fe80::818c:4ed2:2a1a:757a%4]) with mapi id 15.20.8746.041; Wed, 4 Jun 2025
 17:29:44 +0000
From: Prakash Sangappa <prakash.sangappa@oracle.com>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
CC: Steven Rostedt <rostedt@goodmis.org>,
        "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>,
        "peterz@infradead.org"
	<peterz@infradead.org>,
        "mathieu.desnoyers@efficios.com"
	<mathieu.desnoyers@efficios.com>,
        "tglx@linutronix.de" <tglx@linutronix.de>,
        "kprateek.nayak@amd.com" <kprateek.nayak@amd.com>,
        "vineethr@linux.ibm.com"
	<vineethr@linux.ibm.com>
Subject: Re: [PATCH V5 1/6] Sched: Scheduler time slice extension
Thread-Topic: [PATCH V5 1/6] Sched: Scheduler time slice extension
Thread-Index: AQHb1V0mtwlUIwQHSki21OTBoge6R7PzFm+AgAArT4A=
Date: Wed, 4 Jun 2025 17:29:44 +0000
Message-ID: <80120491-7F90-4171-9FB8-9FE89B09F728@oracle.com>
References: <20250603233654.1838967-1-prakash.sangappa@oracle.com>
 <20250603233654.1838967-2-prakash.sangappa@oracle.com>
 <20250604103106.1465f847@gandalf.local.home>
 <20250604145433.KCPMF8zm@linutronix.de>
In-Reply-To: <20250604145433.KCPMF8zm@linutronix.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.600.51.1.1)
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR10MB7309:EE_|DM3PPFE9EDA11A0:EE_
x-ms-office365-filtering-correlation-id: 0573d611-c29c-473e-19a1-08dda38d65ad
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?TlRZcXEyYXFEUlhFN1h3SUlUY2pvL3FRTHJzbSsvZ1BSZDhpZUxrOHAzU0xX?=
 =?utf-8?B?dEV6OEZUTkFkNi9FeC9USDlxdEFOaVBQMitYbU9ZUjJxUDlKV0ZqZjFUZ215?=
 =?utf-8?B?T0tZQ2FrWVVqaHR3Sm5XdlFiL3JLYlhUV240Ry9TbFFEK0VINGFrdkdsMzRv?=
 =?utf-8?B?eTRNdnlCTE10dEt3dU52emFqanlXQ0cyWk52NWtVd3kyNkZFLzNmTkJQOVBQ?=
 =?utf-8?B?Mzhnai9BYkZ4bWlyRHJXM2F4L3h3M0Vtd2JTTEptdmJoUGhaOENyWHVoamhW?=
 =?utf-8?B?UGJqQnZ4YVcyS1V0WlNWNUlwdUlLMFRaTXp4N3I1K01PL3huQURCRVRwc3Ji?=
 =?utf-8?B?TGN2bUE4R00xS3ZwUXpoTFhvaTBpT3NKN2d0LzVtTElpYkpJSXpQLzJHL3dF?=
 =?utf-8?B?Rk45Kzl0bWpLRTYwRWcxenB2VjBPK1N2Z3RaS1ZvTCtNWUNqRUJjOXFrazlT?=
 =?utf-8?B?MkR4S3BLZnp5a2k4RUNhamQyMm80Tm9lNnRGcVY5YUlJRm9ORSt3Q1RMdEZS?=
 =?utf-8?B?Qi9nSVhXU0ZZTTVMWnhkUUhhK2g3eGJ5empvTVl0WEpDQmFVVzZoREMyZDhy?=
 =?utf-8?B?eGdocDZYRGtqMzdIYWFJRk9HK0JsVE5uN1NEbisrKzNuOGxVUWpYeXl5Mmwy?=
 =?utf-8?B?VkdnTVRyMStPMWlXbDRXaitYN1IwZm9qdkNRc2ZZMXRmUWtqWnVZR3F5Vzhq?=
 =?utf-8?B?R1l6TkZJcFZ6VGlGZkdSalhLSEZ5MHhBamwzamU1NEhWRGVBdmJma2RGOHlI?=
 =?utf-8?B?WFdxSmhnN2ZQUjRxNTVGN0NrNkRtNVJrbFNVUGNlOVZTL0ZYR21PbHhOeUpw?=
 =?utf-8?B?UUpvSms0MzJtcmp6bkNydUVwYWU5TnVCZzYvZGJjK3ZFU0JrWjh2eFpyeS9P?=
 =?utf-8?B?Nkp2MzlVd3Q1a3AwV0I3eVJkdUVKUnZCTkdiZ1NOa3J4REdVdEd3a21BLzZ5?=
 =?utf-8?B?Mlo2Z0I5THVINzNCcFk5V3BrcHVxNFltMGh2OFg5S0lKTlhKMWVwa0JFNXRw?=
 =?utf-8?B?QnI2NDNraHJUOUxPK0EvZHVaUUw1NmxsdzNGSUxOODZ6SGgyamxOUGpmaFBQ?=
 =?utf-8?B?UFkxTURKSFJYYWFDTzVTWlNNeFhUSW1ROHBIMlFuVFI2SlZwSVZtQ1hPaEZF?=
 =?utf-8?B?YnN6dElLckVMRGppQ0ZKMVAzQlFGZlNCVVJwYUFtemVYUGlwYXRKcVdTVGtN?=
 =?utf-8?B?Q0dEbzN6OFZLekl1NDdQWnBEUTJhRm9Xa2Zud3h3elF0OGdDMnAxeFY3eUpY?=
 =?utf-8?B?OUtteGRvejBPellMOHBhWERLN3pPU1JJYk5aOUV1SlNSSDUwWUFkWmZyWWda?=
 =?utf-8?B?ekFaM2w0NjR6KzREeTBJMGQ3RXdPMVVaTHZ2K0xRd1VDOUNMY2c2UnRlbVNI?=
 =?utf-8?B?bDlDdjczRGdTQlZuM3J3WXo1OHR0SGU4MGgyaDNKY09WSVRRMmh6VjJuSGtD?=
 =?utf-8?B?SWt2OCtteE03UG5pTndrVzlEUFB3ZHdaSlJTSmNlMjJtbUVvamNneHl1aHUy?=
 =?utf-8?B?TC9FMXluMGtVWUJ5TTd2SHZrRmwvTmVxdEgvaGtFZTFqZGt4S3MraDZCKzRU?=
 =?utf-8?B?YnlnVEVBTEYwT2Q1QkhaV29CQWZCakJaSDJldUpkL2ZCY0RieVYzTmFlaVYw?=
 =?utf-8?B?akVqNlZTWEpXZGdFMFdtS0hHZTNSY25xL2d0NHZOUW90YkVaTDZNK0wwWDZ3?=
 =?utf-8?B?M1N5N2xBWjU0UmxuckFpS1V2SklOUTIwdUhpQ0VTY0hUODRSdzY0bk5ZeUpB?=
 =?utf-8?B?c1RCMWgxVzFneGpXdkMydm9ObTlQbW5nNUljREhsSE8zN2R4MndYQmZsZ0c2?=
 =?utf-8?B?WWZtL2ZLOWJFd3Y2S1VyWmlkS2dMUDFIZlRlbWlCTGc1SjlWL2lLaTB6U3U1?=
 =?utf-8?B?UHZBNVdvWS9qbU1RNHZ1MjNXcCtleFdFdmRqd0luNjNJUGhTd093S29XR3BQ?=
 =?utf-8?B?dS8vY2JsVHhwS2FGQ2xoTjVOYmV5YlZNbUtRZDNhNlBsSTIyVVJ1ek1zOGNE?=
 =?utf-8?Q?t9Ld6t7JbbcqBsLJDIzC35AzQc//Dk=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR10MB7309.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?UXhUcnBFQktlaWhjOG1DMC9MTkpNZ01Tb0dsKzBBWGZhZkp6cmxFUlpDQkdZ?=
 =?utf-8?B?VkE3cDlWV21HV1lBYjc2QlNYUnNxTTRFbDRyckRRV1FFUUNpY2txS2xTajNY?=
 =?utf-8?B?L1k1K0pvV2lPU1Q5bVR4RnpYdW9pNnZxdHVCN25YRm41NWFaL1FwZ0lVKzlU?=
 =?utf-8?B?NzA4YTR1aFRnRlgwWmZkRmtvSzlpbXp4R3dNMDJRWnFmZEptbUZtZWg3YU5o?=
 =?utf-8?B?akRsMko3K1FTMTJFVDdGZHNuRm5QSnpWeEdYMkYxR3ZUWGtNVFdzWi9DS3h0?=
 =?utf-8?B?cjFia2xyaXhjRUVCOEE0ZW1ISTFlVHluS0NzREY3VkhIOVhmVmFvVlVGRks4?=
 =?utf-8?B?N01SbDFibk9RTGNXMjU4d0w2STkrZ01xUjdVdndBc0dKSk0vMGhPcW9GbXcy?=
 =?utf-8?B?TityMDRoSTRMZW80K1RKUVlMU0p6ZE1sWHE4T01rdkNrZXVBNDNROXFMV0Zo?=
 =?utf-8?B?VXdpWDFmNXZQbHdYLzVrUzI0WWlJRzRSOFFSakNmQnZnUUhrTkFURmZrQUlV?=
 =?utf-8?B?a3hYejZrN0hlMFNDeUM0ZzJRdzFVZ3NoVWJtOTdmSGpkNjRQV3NvR0JBNjE4?=
 =?utf-8?B?bkNodHdueThxVTl0c2V1RkgycysyMjFQUVROdGJBVngzNllEOUdsYnArZ0Z2?=
 =?utf-8?B?ZUdmd3VLZDJ6MXhlY1lVeDQxRE1SaEsvd2hoQmNuRmJZRnRIWDUzeVhyU0Fh?=
 =?utf-8?B?Qyt1b0pqWXFoQ09jdTVIS1BzSDZPVUY3MkdVQ04yWGhENkxFK1dEcTRLTWdZ?=
 =?utf-8?B?THBhbjJlOVlRczZTL1hRM2dpS2g5ZTdIakRacFRISGpxNXkyOHVFeW1LSmJs?=
 =?utf-8?B?Q2VZL2dCMlZUZXdDMFRtSFJYdmNRVEpiNnV4Z3E3ZFgxYmswYm5uQVp5NlAy?=
 =?utf-8?B?K3UrRVF1L1BnQjlvRHpkMS8zR3FLVGl3YnNGNzdHclpSRUpiWGhKRlB4cU9Y?=
 =?utf-8?B?ZmZ5S3ljRDI2eXcxeG9BZnM3YjV3R3RzRGR6bkpUZXlTOW9TQy9KbTF4dW9Q?=
 =?utf-8?B?VkFlNGFlS3RKTEJSa25zZGpHcVJpMUJtSkZzQ3JKc3RlRTVvNm9RTkM2MVRz?=
 =?utf-8?B?cGVPVm5wYmFQNXdsdjRPUTVoZEFoWU5oVWxQZk9ySVlZMlZUS2Vvb3VPWHow?=
 =?utf-8?B?M2VXQ1VmK2NXbitibzJwa3BGaGsxZHlwbXBuSzczUUxUbTNyVkovcldSdXZL?=
 =?utf-8?B?enVGeWNlS1B0bVhaZEV4bVpZOWRLNERRcnVEekJwN1V4MTJYREdSMUVDTVR0?=
 =?utf-8?B?TXMrK04rNjF2OEwyOW5pMkxLaXhyb2pscndxSWhZN3RsaEdQQWRCTVpRRDg0?=
 =?utf-8?B?WDdLWlpKQVhMNUoxMTB5U3JwY3lqejJYVWYzSUg2TEljQk5tOURsdVVwL014?=
 =?utf-8?B?cEdLczBQZXNFa3FwUTkvWWszS21pVlJFaVdZdHRJbFBvRWtOMDdiWXdhKzhR?=
 =?utf-8?B?V3VZY2RGZ2VKcWVuQ2hBQWpMSTl1c2V5RFE1MXBZcmRzWUlTYkw0T3NOU29k?=
 =?utf-8?B?MGlNWjQ2YitZL0RhWlVxb0Vla1JQM1VYL2thU01LSVovSlY0aUlWdnlqWURZ?=
 =?utf-8?B?bmp3aDRLeWEvMGpOMXdiVXBpTWJjd0JQQWVLQi9haUs5T3Z4UTRudVY5MDcr?=
 =?utf-8?B?Mm5mUE42V1lwa21oblRMTnpZNmduWjVrQUFlMGRQb1NNRmFSSUh2TXpzWVZL?=
 =?utf-8?B?UFlJT1lwU3hJSi9nbEVCSFl4Y2pVM0o0VzdDZnh3VGtlUTNvUjBKVXRjVkV0?=
 =?utf-8?B?aEx1Q2lDQWpCSEJMYTNRa1FhSlFrRDc4eldYenRWd01vTlJNTFNMWmhxSUZ0?=
 =?utf-8?B?WEpTWG1tN0wxUXZpR3B2YkI4YzliamhQSUxHWGp3a0o2eXhzZWdHVzdFd1py?=
 =?utf-8?B?b20yWFc5LytOSmF3ZGNHTTVGekg2VWwyZUVZcXBBbE9IcUs2cy84SThWdjdL?=
 =?utf-8?B?NkxVY015OFJ2S3gwNU0vcDVydmI5VDF3d20vbHcrYjJZMmpHZUxvMHVZL2wz?=
 =?utf-8?B?NUlKaUtBa2FJTm9BOTYyYk8xVVgzZDlwZGlLVXF2anQyUlRUUTJHcDVWT0Ev?=
 =?utf-8?B?TkRaaWU2UExTazVkQjd4cUxVTXlQeml3NEJQN2tUNVdOcjJNNGpNdkFtZ3Vs?=
 =?utf-8?B?SXZNWHFxN2FJak9iS2tvZEZwMnRUdnl3N3E3OXI0OSt3UVErQnJVRHFJMldH?=
 =?utf-8?Q?huzfQdvXFPRrQPZJq9TZGFQ=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <B1C90E61C56B914C8EE6BF39FB2A6BF2@namprd10.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	rvP/1vqkAOUVPxn5KDhfW/6HZlgDl6d7yq0ikk0a4ZEQFjIgBIeaH09HvCfkGwhxK9//vqip6N7doXHzn15DhNe6ELqZcZySpgNkPdXy8aECthvPX/XxkPNEj1AJBjoPsPdbUtE2J0KYR2zPKo8xvAZJB82FGPLCED1rPzgNfY1Lvm5sFXLGMZXB/bc661/poaFQ1vxzqpvM7B/ycqoZLx8AcFb9LBbOCfj4DzVu7EbK7f/CUD6oG56E/5u+YO9wjU+J5GFQDqiZFkdNuBaWiBhfW21idnVLyFsScNSaNLbQyJlOvjVTjUTK6td8RAAE6zszly9aw9Q+uzk0bTh8whmmfovpt0Z4s254fHh7UBcf8WrzPdpsVZ164Chn4ZCg1b2fH16ex/WTWjo4vr+vc4Eg4heYlhJ5+oR2OlIFx7if0bMW+l1vCxIi2nma+o7Gij08A6pQLW3dPrE7Wlr/31qhPJBSdHEDMpylLmRHLC72P/s6Xqlw9ioTmELEIHhZpnSii9Ntis1E1Lnd4YAcIpHNGf3kAElAA9V9BdHAym+b8ziIMtOpx+5ANKGmSYuNwSKEthN/Oms2BbEvo7vV0EQyodysMtBayTIkjidWB8s=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR10MB7309.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0573d611-c29c-473e-19a1-08dda38d65ad
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jun 2025 17:29:44.7643
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: co/JICH9Yo3Qyhkdwm8YgvVhBVO1w77jZIY2HPioZYerJ2PKOCdDo/NBfg2QpA5f/xsD4pB/Imp8BXkk0aO1QCOTdS6VwpkeIK7fnu0rVcQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPFE9EDA11A0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-04_03,2025-06-03_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 spamscore=0 bulkscore=0
 mlxscore=0 phishscore=0 suspectscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2506040134
X-Authority-Analysis: v=2.4 cv=Wu0rMcfv c=1 sm=1 tr=0 ts=6840828e b=1 cx=c_pps a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=VwQbUJbxAAAA:8 a=yPCof4ZbAAAA:8 a=tbRyp2FXCT5bcgow8VUA:9 a=QEXdDO2ut3YA:10 cc=ntf awl=host:13207
X-Proofpoint-GUID: 7D0QFfSQViFUEwn_P4xu1aZvrKpDVQw8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA0MDEzNSBTYWx0ZWRfX1sXM+/+ZM1Tr rEL27u61hB5rhVEvOU1oJy8YfUpCfb24yQ+WF2WLRQPP0YeBK/l1GSjATinfPqVJpLI0K7czNUf mqz8WvN8Jxb3hGj4QV8HCatTVcFD5+LB53ZTvaM95oMdULpaKM7SBNrkJFalPskNVfFVcs91O2E
 5io0dJZjXj8q1+4P1zQ2BBek50x/2v45zISeoCX39FXlmz62AGWgIdgT1CpWl3/nJY9kkiLRnIy rcvNgAEv1PtvOeJK2tTfSpfkVOW7grO4pO/94+B6l3zQ12fYn34c0JqfaUaF1f4l6Qf5z8Nv10A kXH0um0qkKbCApC30NDj9QdDJ2rmnFa57BDXC/gvUtKTVp7WiJqbrGtG7LA4aRPxH3mvyFCqkeG
 jZiPpkD6PCOwpxCObMdkM5jl+4IYb5BxL55K3WYZg8tATkUoLkSWVFp4fDg2/hGd3oFkjI6i
X-Proofpoint-ORIG-GUID: 7D0QFfSQViFUEwn_P4xu1aZvrKpDVQw8

DQoNCj4gT24gSnVuIDQsIDIwMjUsIGF0IDc6NTTigK9BTSwgU2ViYXN0aWFuIEFuZHJ6ZWogU2ll
d2lvciA8YmlnZWFzeUBsaW51dHJvbml4LmRlPiB3cm90ZToNCj4gDQo+IE9uIDIwMjUtMDYtMDQg
MTA6MzE6MDYgWy0wNDAwXSwgU3RldmVuIFJvc3RlZHQgd3JvdGU6DQo+PiBPbiBUdWUsICAzIEp1
biAyMDI1IDIzOjM2OjQ5ICswMDAwDQo+PiBQcmFrYXNoIFNhbmdhcHBhIDxwcmFrYXNoLnNhbmdh
cHBhQG9yYWNsZS5jb20+IHdyb3RlOg0KPj4gDQo+Pj4gQEAgLTIyNDksNiArMjI1MSwyMCBAQCBz
dGF0aWMgaW5saW5lIGJvb2wgb3duZXJfb25fY3B1KHN0cnVjdCB0YXNrX3N0cnVjdCAqb3duZXIp
DQo+Pj4gdW5zaWduZWQgbG9uZyBzY2hlZF9jcHVfdXRpbChpbnQgY3B1KTsNCj4+PiAjZW5kaWYg
LyogQ09ORklHX1NNUCAqLw0KPj4+IA0KPj4+ICsjaWZkZWYgQ09ORklHX1JTRVENCj4+PiArDQo+
Pj4gK2V4dGVybiBib29sIHJzZXFfZGVsYXlfcmVzY2hlZCh2b2lkKTsNCj4+PiArZXh0ZXJuIHZv
aWQgcnNlcV9kZWxheV9yZXNjaGVkX2Zpbmkodm9pZCk7DQo+Pj4gK2V4dGVybiB2b2lkIHJzZXFf
ZGVsYXlfcmVzY2hlZF90aWNrKHZvaWQpOw0KPj4+ICsNCj4+PiArI2Vsc2UNCj4+PiArDQo+Pj4g
K3N0YXRpYyBpbmxpbmUgYm9vbCByc2VxX2RlbGF5X3Jlc2NoZWQodm9pZCkgeyByZXR1cm4gZmFs
c2U7IH0NCj4+PiArc3RhdGljIGlubGluZSB2b2lkIHJzZXFfZGVsYXlfcmVzY2hlZF9maW5pKHZv
aWQpIHsgfQ0KPj4+ICtzdGF0aWMgaW5saW5lIHZvaWQgcnNlcV9kZWxheV9yZXNjaGVkX3RpY2so
dm9pZCkgeyB9DQo+Pj4gKw0KPj4+ICsjZW5kaWYNCj4+PiArDQo+PiANCj4+IENhbiB3ZSBhZGQg
YSBjb25maWcgdG8gbWFrZSB0aGlzIG9wdGlvbmFsLiBJIGRvbid0IHdhbnQgdG8gYWxsb3cgYW55
IHRhc2sNCj4+IHRvIGhhdmUgYW4gZXh0ZW5kZWQgdGltZXNsaWNlIG92ZXIgUlQgdGFza3MgcmVn
YXJkbGVzcyBvZiBob3cgc21hbGwgdGhlDQo+PiBkZWxheSBpcy4NCj4gDQo+IEkgYXNrZWQgdG8g
Z2V0IFJUIHRhc2tzIGV4Y2x1ZGVkIGZyb20gdGhpcyBleHRlbnNpb25zIGFuZCBpdCBpcyBpZ25v
cmVkLg0KPiBNYXliZSB0aGV5IHdlcmUgYmVuZWZpdHMgbWVudGlvbmVkIHNvbWV3aGVyZeKApg0K
DQpEb27igJl0IGtub3cgaWYgdGhlcmUgd2VyZSBiZW5lZml0cyBtZW50aW9uZWQgd2hlbiBSVCB0
YXNrcyBhcmUgaW52b2x2ZWQuDQoNCkkgaGFkIHNoYXJlZCBzb21lIGJlbmNobWFyayByZXN1bHRz
IGluIHRoaXMgdGhyZWFkIHNob3dpbmcgYmVuZWZpdCBvZiB1c2luZyBzY2hlZHVsZXIgdGltZSBl
eHRlbnNpb24uDQpodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvMjAyNDExMTMwMDAxMjYuOTY3
NzEzLTEtcHJha2FzaC5zYW5nYXBwYUBvcmFjbGUuY29tLw0KVGhlIHdvcmtsb2FkIGRpZCBub3Qg
aW5jbHVkZSBSVCB0YXNrcy4NCg0KLVByYWthc2gNCg0KDQo+IA0KPj4gLS0gU3RldmUNCj4gDQo+
IFNlYmFzdGlhbg0KDQo=
