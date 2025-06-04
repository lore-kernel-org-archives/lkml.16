Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA84D223DEF
	for <linux-kernel@vger.kernel.org>; Wed,  4 Jun 2025 10:36:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749033393; cv=fail; b=tjJEKnqY4/JMd6khH7PHZtos5m4uEU3ul4r/uSJJK3SiAqSKXKYaRpj2PcLT7ZfxdVLicpVF7YaUDJ8ISAPyITIUtMr36vrVahQONPKVtS6tvPDijQ0/CmESDEvuI121Qn+L7zf/SjLhC7P4DSGHOHWCdJwEWhV0GjgAdVqg3F4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749033393; c=relaxed/simple;
	bh=LMYdMRo6S++QLAt0EgmSItpPvzNtjAh8Q9xVFwyPpV8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=td3NbyrdCE/E5y0qS4nC0tRAJZ6sObTYmwzla7+aYxZDkAZD1mSdusKNh0eOLpoHQJ6sz9dR42DdBBC2M0UzsWpNEc+QkkgqFp8xZ0YjLMbfqi1+SuZfA+lCvjdNt1lmPnP9o3n1Hwy771uQ4YvNI7PhzjC01gIPbGxTlAIzgaE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=MQ/J19+d; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=Bc6oGhnB; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="MQ/J19+d";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="Bc6oGhnB"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5549MeVL024854;
	Wed, 4 Jun 2025 10:36:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=LMYdMRo6S++QLAt0Eg
	mSItpPvzNtjAh8Q9xVFwyPpV8=; b=MQ/J19+drSbeUtF7LovuCql+Wd3ZkTAPR/
	9uYG35WLxxBzyZNYetuAKX36mOBHF8Ck+H1ovCkkq7t8N4mhkSMYdkgLxRx6KnGE
	CtAIES8kSzpSeYZsexQ+LRLj/6BnfZDbpJtST/uGsFAjPQT+QApQSWeGJZjga/8m
	P9oYwk7rEsoIXWlAK4ndCBHiGGS9vy4eWcn4DwHApOXGbmYD0Wzv0GR9KlDVzkse
	ZAhfn6Pltp4Yxf8OXV/TWaKuBwRtdHlmCETbq608uIn8HMCIaDizPgtE5E1zvY3I
	BnMRbfrLarjttfwn0LoD2V1YhlevGaKjQwSBv8QT2cOT/5h0jBnA==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 471g8gbpb7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 04 Jun 2025 10:36:28 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 5548X0KW030888;
	Wed, 4 Jun 2025 10:36:28 GMT
Received: from nam04-mw2-obe.outbound.protection.outlook.com (mail-mw2nam04on2049.outbound.protection.outlook.com [40.107.101.49])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 46yr7akfds-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 04 Jun 2025 10:36:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=batJCvDlC0Q/ByDMEL+tQ0YJmonPi0BIxwb07G8JtbLdLeXoCM0bhFKVIVwm+oZGEQNX8FuVVQy9laTLSMBY3wkdpYpHBTGNH/Ali4/HN9IZqgOuP4fDB0rFFgLYrkEWlVP3TFPhWDEM1/VKl6kIwAY5zlg821/CIb2wHuKN1nye6xZi7LLZKsXH5wFyGP9Q0a1BJ7O3SkE2VpMomv2M6nzWWCS0wkVgTBnDkW4ECIJX4pTOLjcCnxjR+u2eBwB7XlAV7AkSP9d8xHWDEG/d3+tljGzmAjCHyNM0YtvE/8cu9JqQoRDHbnwplMxRr96GSehwKjCs6iKZs2GQwzP3vA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LMYdMRo6S++QLAt0EgmSItpPvzNtjAh8Q9xVFwyPpV8=;
 b=vYy0o3ir+MVF2qSvv5h+MFJ7YePLCVkr0tKTSH8gjL3qL4YFi94FpqVggE73Gsi4qgxlYEm9QgcIhIRZ6b+FsPeS0a6TR7s1yPS2Vbi4RpFC1W9BXgtZ9V0p628wNtBIUdl2VhYwuzl0DJUjWImYGhUC6c8wXKfG9ZfV62g1IOkFE0pCa4Hd3yKmXpO2VjQBYIMIOBebu0v3tlIkmafPXZ8rmHvq/n3IbCrxCoEAhw+Hb/3wTABn9zw98YgXRK56AeX8lv/gz95JBisi6rmiB8Bo+ESKW5ZDkI15c6yyZHi1ut9glpjJy+OiCmdzCdaQ40+9MMtFxUcBN2MIjWHM8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LMYdMRo6S++QLAt0EgmSItpPvzNtjAh8Q9xVFwyPpV8=;
 b=Bc6oGhnBfM6iry3DoQH+AOoh0qT/Zot5P6da/7E6ETvTMAfXdHuvehNvqXzREukQ5CsRsPQs8dBlmPSWNf7wBdJALhdMsXP91XebcQiRIhIIaOZG4VTmoiUugBWSlLutVlBMXAhxdx+zPssBMsJ80c+QdH4k5V4XeS6mWPPEz94=
Received: from BN0PR10MB5015.namprd10.prod.outlook.com (2603:10b6:408:126::11)
 by DM4PR10MB7473.namprd10.prod.outlook.com (2603:10b6:8:18a::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.40; Wed, 4 Jun
 2025 10:36:25 +0000
Received: from BN0PR10MB5015.namprd10.prod.outlook.com
 ([fe80::f2f4:6196:e18:1b1]) by BN0PR10MB5015.namprd10.prod.outlook.com
 ([fe80::f2f4:6196:e18:1b1%5]) with mapi id 15.20.8813.018; Wed, 4 Jun 2025
 10:36:25 +0000
From: Siddh Raman Pant <siddh.raman.pant@oracle.com>
To: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: CVE-2025-21991: x86/microcode/AMD: Fix out-of-bounds on systems
 with CPU-less NUMA nodes
Thread-Topic: CVE-2025-21991: x86/microcode/AMD: Fix out-of-bounds on systems
 with CPU-less NUMA nodes
Thread-Index: AQHb1TyFwMURLZJFqEWiyUCD8lNXIw==
Date: Wed, 4 Jun 2025 10:36:25 +0000
Message-ID: <916e1b593d7dfc8d6286206a6ecc60bdff45a091.camel@oracle.com>
References: <2025040257-CVE-2025-21991-6aae@gregkh>
	 <793ae4a30ab15d0993ce9152ce91b6b98a05b1a5.camel@oracle.com>
	 <2025060430-rimless-splinter-4131@gregkh>
	 <064d66133dc11a95f7c5aa647784cf9bb3ede1df.camel@oracle.com>
	 <2025060459-diaphragm-display-ba2d@gregkh>
In-Reply-To: <2025060459-diaphragm-display-ba2d@gregkh>
Accept-Language: en-US, en-IN
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN0PR10MB5015:EE_|DM4PR10MB7473:EE_
x-ms-office365-filtering-correlation-id: 7c1cae24-1617-420c-6bc8-08dda353a7fe
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|366016|7053199007|4013099003|4053099003|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?V0lYS3pVcEZ1QlFOQW9TMU4zRlZpS0JWV3hJdUFFT1NvWU10L2V5UFJ5RzBQ?=
 =?utf-8?B?ekVkdE9LZXNxT2MrS1JTdSt0dUR0OXJGY2NvYzNZRitxeEdOYlRndUJkVVVU?=
 =?utf-8?B?anVibkhaR0p1cmRzTzdBREt2TlhVWndZTDFqV2hMU1J6OEZBRW1xV1lPbHFh?=
 =?utf-8?B?aWVITkRRVUV2Sm5vTzZSSkNHSmFHR0xJOGpSa3FyTC83ZHgyU2w1SEhQYnJL?=
 =?utf-8?B?UmFHSjZnR3hRT1ozWTJBdFBnQnRGUE1kbWpqVGRtcURpS0xCbkFpMkFnVktE?=
 =?utf-8?B?VmpZdnpSVFB5UFFoYVRmUnJEa0UvM0cxaGR6QlZPR1g3V3hla1Q0WU9DTDBp?=
 =?utf-8?B?TGc3MXlyTm9ML3Q5OXkrMjBGczJ1bVMrbHJNTXA1K0I3bTFEN2FXZmNoWDJE?=
 =?utf-8?B?VHU0YmtYeFErQlF2U2UrZG9UY2ZoNUtCelc0MjE2UTNHNXBCQTJ3b2RMUytH?=
 =?utf-8?B?c0c4d1k3SGpuTnNDYVNkVTJvY1R3NGc1ck50blMwajZBVlRxV2xPSnZ2NWtN?=
 =?utf-8?B?ZDUvcHd5ZEUxR1hoNGg5U2ZuZWpkeTkrNkxPUmUvQmlXQjM1NWJoZDIzZVpS?=
 =?utf-8?B?N0szTkRkTmNWQ2trelkvWDNOSWt0SDBkZXY4OGpXdHFrWncyL3NQVEF4bXpq?=
 =?utf-8?B?ZjB1MUFVbDlVc3dycnpPcDIvbTNxQUJuUXQwSzc1bUJiR0FWSXhzUHJmbWM3?=
 =?utf-8?B?NjgzakU5c1dtcy9OdG56cUhxTXQ5cTJ5YkkzcC9RWmMzaWFmekI0OXF0M2FB?=
 =?utf-8?B?UGMvTTYwV3hGQUtXcVBSVUJuRUpxNlVCS29RUHF3UDFYNi9zazlMWU9oSmdn?=
 =?utf-8?B?NUJkQW5wY3NIMmZMUGhiVHBlU0gzUURQTGVxTjRtUUFkc2R4M3V4LzhwcGZY?=
 =?utf-8?B?OC95dXJWN01VRm9CMGVQZ2pZVTJTMEVxSkpKMHBjY0dMV05tZFBjeVJxYW16?=
 =?utf-8?B?K2NCNHZXSEUyY2IrR0lwWSsrZDRaVHl5dkllZFBsTDl6QUp5eTU0T2hubVZ1?=
 =?utf-8?B?Wlprd2o4b0xKWGRrTW9IUkpDeTFLN2VOWW1NNHhnUE0zVE1kWHgyUXBHa3gw?=
 =?utf-8?B?V3VQdlNSdkZiRmx0cEtnaURBWWVPdkw1Ymp4N3d6UGUxS1BFNzdUc3pjelBo?=
 =?utf-8?B?L3FSVUl2MlRWQjJBblBXWmtBTkIrRE1JaWVvbnAzT1B5UUhuSTZxcVBvSFhD?=
 =?utf-8?B?NFJERWFwWlNJUm05M1RvcTJldEpKUzFwV0QraFVNY3FsNFpUMmtsU0ZtUEZk?=
 =?utf-8?B?aUpIcWZoakg2b2laYXliUDhRbHFyU1IzVndSZXBvRTl2NnFpdTY4bXlnNVJl?=
 =?utf-8?B?M01SKzUwMVRqSmI3ZlR4ditkc3RIS0kvMlJCdDl1bXBacjRYRXpndmFSbjYx?=
 =?utf-8?B?bWtVQW5HQUhVZzlQOU5WaE5ndkh3WXJXSEgzOXJ2T0NBMUZodFo1RGdyUXM5?=
 =?utf-8?B?dzc1UGd0MkRITFBjU3EzTDh0UzUzN21NazlRblAxVjFMVzArcmwyUnpjOXBD?=
 =?utf-8?B?eERDTVIxT1c4bkp3Z1NLY0xGU0k4UmU4UFJoNzVNQVJvc25BZnpoc3luQzlp?=
 =?utf-8?B?UjB4ZW53KzRUanlFejliRUhyOEs4Wm1LTVlqekI4UnRLVkFxMWMwQ1ZBVFF0?=
 =?utf-8?B?dEhRaldrV2drYmxsNkV6U0NlWk9lTGVhQmRaSWR3UXZDQ0ZyL3g3VEI5TUVs?=
 =?utf-8?B?T2thcHBqWDdsMUhqSDJwdGtuQ1dOWUxmYmVURUtPZWszb1EvSTAyQ0N1Vm5h?=
 =?utf-8?B?NEV0dVlwU1grNkk2WVM0MmJFVWFNbzA4enZkYnZKSkVjM1pDRjZDZDFpdEtw?=
 =?utf-8?B?U3pvVTl2RjJLY2M1anRUSmxZTGZ0Q2xwbGVRN3EvVGtKUDdFVmh5SlNpakVL?=
 =?utf-8?B?Wk9NY28wWmw2eER2eHNUUWRlYkZocnRnR0VDbWh4UmZ1ekxzUTJrR2JySThT?=
 =?utf-8?B?cWxWZHltUlNwN0plbTRuYklGbk9ZaS9SSWJLMUhqUzQzZGJ2K1crWFRvakcw?=
 =?utf-8?Q?jFqLXe5rvrzMabAs2DkdZjNJkoST9U=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN0PR10MB5015.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7053199007)(4013099003)(4053099003)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?eUN4QUtLRVF1NTVIUi8zZ1V4cUNraHB4VGplWk80M2VkVjVNUlpuakJtbTY0?=
 =?utf-8?B?THVZaE0ycXU4YTMyNkNvMjMzc29RY1IzNTBaSC9RZEM1bWU1a05PeE9hYnM3?=
 =?utf-8?B?UlhMeUo4cEhnTWYxeUcxb0MyY25GcGhJcU1kSDRYYUhGdUlVUi9Cc3ZGZEJC?=
 =?utf-8?B?eVpOVjFtNEtQcnh6S0Q5N2tZNjZPZjBlV2xRMVNldFF0cEtsbUo5dzhKUHBy?=
 =?utf-8?B?SldCVEhmN1dOejZEZmx0L3VDZU9sOUNFOW4xRndkRDBwVGJEZXV1a0Q0RWgx?=
 =?utf-8?B?ZE0zejduK201QXZpNTZoRHc4TS94VmJrcmRmVU5OMTltM2hzKzRWdWQvWTlP?=
 =?utf-8?B?Q1Azai9FTGhTcnlwUWJoTlVCOWhjTW1UTWRVT2xESFhRdXpoU3pFVE96RS83?=
 =?utf-8?B?elM3MmJmNHBmWU91eE05YWh1MWU1SmpnZ3c5Y0dJZEtzMWNRcTM4c0E4c2NU?=
 =?utf-8?B?VUpTTVlSWmFpQm95b01ZOSt5bFpleFB1VUJocXA0VEFpTGpyTGRTeFUxSEto?=
 =?utf-8?B?SmEwa2h0K0hrNXVjTDVXUkM0M04reHJUdGxKS2tzTWFIc0x5MG8yOWIyQmRN?=
 =?utf-8?B?WjBLaVg1QUQzcko0STBobmFYUUFOd1cyRkErUVpqTGNBMXUwM09EcVQxL0RR?=
 =?utf-8?B?VWNLdUgwU3U5NFE3VmZ2eHlaWlVlQ05UYmpISS8wZFl2d3NlS29OWHBMek9a?=
 =?utf-8?B?REdTMnp4dlQzMXNwcXhBamErQmptNDl1TEVUY1FjRFRmVHVaeW5DMCtIZmRz?=
 =?utf-8?B?azdKRUEzMlQwOTY1WnpTK0ZyY2tneTUwZllLL3g1ckNUaUhnK0swbmxaTWQz?=
 =?utf-8?B?NVl5SEtGTnB3L0paTlhuR1JOYnRnNURLK2NBVzd0VFUxTW5jVnJwVnJBd3BW?=
 =?utf-8?B?akN0SHRGbk1HR29VeEZWR0cyVjdQZ1NLQnF0YkFLU1ZkeG0xVmZrVUs2dE5k?=
 =?utf-8?B?bm5kcERrSzlMNFArcHdrL2p6MXA5VDVlWGpKL212THRzUTRqR1JIbU9rUFEx?=
 =?utf-8?B?K0lCZHZIQjZjaHVWZHJINzRoMjdvb0xuRVhtR3VZZ0ZvMlJEQWpGdTRoMXlS?=
 =?utf-8?B?VE9xakdYLzBuaVJjTGwyYW03TzBySkJIeXNYbEZoZTBiRHE1YzFadlo0R25t?=
 =?utf-8?B?QjRnQkVVcjhWZmlpWU5KZ2xHdnZ6aHdVUkRwNWlmZlByQUlYTDdoSW1sNmo4?=
 =?utf-8?B?Q2F4NklpMFVmOEpoQk1pY3FRQ3h0L3o5ejgzRjJlSW5mc2hva2JQUTZmZzky?=
 =?utf-8?B?aE16bnFEbktFNC90SDJpeHE5SkxiRzQ2eEcxdk13bUpIQVdvekkxb1JmVlRa?=
 =?utf-8?B?WFE2c3kzWUExRWFtanBvaVIxdlFNb2dCYjZtVmI0Q3hUVWRpelJKSWhnYjV1?=
 =?utf-8?B?bG5BaFFrNjhOWjJ0bUdnVDMzcFo0YTRCRHNkV3Z5dmZ5NUYvZHpvQm45bjhz?=
 =?utf-8?B?ZEFSQmZVTnR1V0ErdmVhRUYrVGZ2aWVGNXVaRFJuczIrbVFhTnNBVDFRc0RO?=
 =?utf-8?B?REVnRjd0WmdJY1J1LzY4aFE1c1BLeTBSdGI0UGVSdXBCL1MyZXVxNy85aEZK?=
 =?utf-8?B?RXY3OWtmekhzaDlMSmxpbzlKSVE3SWtUUjZwTmVYU0JNdFByL3dVc1RKUmZ0?=
 =?utf-8?B?MER1dWN4S3k1RU1XWVk4YjRmV2YxU1lFWXBvdTMvb0pHT1Qra0k2c1VIOW9K?=
 =?utf-8?B?a1RFUFdBa0JCVGYvcEtSUk9ETGQwOVJCS01LeUhleVlKZGxBSWFHMlA3MGdE?=
 =?utf-8?B?d254dmJuVVJGNnpXQUU1RHRrSzIxandINHdaSTZCbXJMYnVDQ09LVFlCUFhi?=
 =?utf-8?B?L1VvaXpNVExSQ2JKdExLS1J3THFwa0gvS2lxbEgrMkVpN1RxTnVxZDFIaGtX?=
 =?utf-8?B?QStYNVljZzliNHVtQWNyTGlGckFhOXVzTWwydmpnSXN5ZXFyY1llT1VDMEJC?=
 =?utf-8?B?bU1zZHpIc1lyM0NHVXhpMmo5bVZXdk9SREkxUnNiZXVibVQ5QkdhdlZZdGlH?=
 =?utf-8?B?STZRVC8zZWFjbjZybXV3cVhkaHMzRWpNRURZZkxXMGdOTkp2cFJ5SW5FTkdW?=
 =?utf-8?B?VGJvSW9nU09SVVcrTDgvRGNFa0lIVFRBT1JRRG1SUUU4dUsvbys4eWphV3F2?=
 =?utf-8?B?bGFFdzRJTk9mZW5jSmxNaEt6RSt6MHJyUkZKdlpqcS9HeEcrVGtJVFRIMzFm?=
 =?utf-8?B?TVE9PQ==?=
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="=-s2uX+4JWYnpGe2HP3vMo"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	FbOpXzYN71C4laR9GrU5UIcEdXE6k2iY3S43uiKY2ZKkvMMVkOGYlx92/zTSrEQTz2uEOHsYhwOkQ4DYWWzGWdIsflcli1GO03el7TjAJZ1FOWZRmBuOP5GCahkhIc9XQJAFbx5LTSMNlgRF0HvewM0ChyRfDqWmUUFCYhEgr135DdWbGHt4ecYuR1oaSHcXC0JEWVoh3FGeZBS8z/J2DPMgV7zfPYHimQJtuTBAEOl4GgikGjW1aigDj1rRh/sj7nMmD3W5v/PoTd4BwHNLihmR1lm8SkEiboBUrwKMIKujtf4CW1RrBliviUE+HmFoIgK4OdeO7Vno7rqLB04/oH1GEAw80rL+C9b2G7RSl9np9zaw0MmleSUOnW/WKr/F1p4ookE5pIX+7nJEDjjH2rf6tV1635zXSVnbmCeT/P3urnKNXPgtWwEsuyMCJmhu2q6gKmCJ1OnFTml230TGnr5b4dJOWNYm8zExjapcrLTrjA8R2gvzXlNthSKWxSzbh1MtfQpxcRlDlcES4b2zcYVB9OxXVb8npA2KGYBh0wr0AxhTd5jtsVfkFRItbUJyKP2m3jpDIY/LaLn2O4WhiYWcKeGSKt/awP9DTggsUtY=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN0PR10MB5015.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c1cae24-1617-420c-6bc8-08dda353a7fe
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jun 2025 10:36:25.2100
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ry6nGZUhYNY3eBgI7vMAQYHlj//RluZfkon67US9Bhuk/lwSvHB8eok4ot4hxD0nryCx4W5XTkgVYGcTp0L9olaHq3dtRLdrotVcbuvh7Wo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR10MB7473
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-04_03,2025-06-03_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 malwarescore=0
 suspectscore=0 phishscore=0 adultscore=0 spamscore=0 mlxlogscore=999
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2506040080
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA0MDA4MCBTYWx0ZWRfX8GEA/DobvEwx l6DtpwkyHqTK+U1aC9gumh4MxckqAQAImApTF8Qo9uLtYrIDGvR5tLS0sBCH1WG8ojokiLdGiqq o7LKNyTgMNYgruPmkAw/qcF4tZ7/6O/9U3oi9h2usPRmiucGRSeNcFxf4Ul8OKlF7C+ppEKvEe2
 98UkjTHniyc7LeOrI/JNATeDdV9rVTRJu5itIgKQqzgCvEulNnnnRnjmHk5RvIHkPAqQ3Yle/4z WNI9FCXN3gcRbhplr+MoGcuEzw79za2R9uQv/aFVPMNT+it3nwSFsU++DfXTMmQ8XaTE/1KyAos oVayS2HwIk2Hpye3yaKVfO3OuQmToS+oUVF7bGPqzfL1ZXt1j2bM7uSaKNrkVj6xeR7/n3obaIl
 4eyTA6qUHo5n2m4eMDV9N59rtHu/Uao3gERK2gZoxta65IKhzSvvqgC2ifAO09+26OChcSl6
X-Proofpoint-GUID: LT88QZCI3J-M-KkijrJKPFTmQWG7LXDm
X-Proofpoint-ORIG-GUID: LT88QZCI3J-M-KkijrJKPFTmQWG7LXDm
X-Authority-Analysis: v=2.4 cv=H5Tbw/Yi c=1 sm=1 tr=0 ts=684021ad b=1 cx=c_pps a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=ag1SF4gXAAAA:8 a=8r2qhXULAAAA:8 a=yyagJoPZJimeaCQgX2EA:9 a=QEXdDO2ut3YA:10 a=_fyKtwIuHVOqWXlmuoQA:9 a=FfaGCDsud1wA:10 a=Yupwre4RP9_Eg_Bd0iYG:22 a=8gvLZcY7Nlvl4CGD_6nf:22 cc=ntf awl=host:14714

--=-s2uX+4JWYnpGe2HP3vMo
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 04 2025 at 15:30:54 +0530, gregkh@linuxfoundation.org
wrote:
> On Wed, Jun 04, 2025 at 09:54:55AM +0000, Siddh Raman Pant wrote:
> > On Wed, Jun 04 2025 at 14:58:03 +0530, gregkh@linuxfoundation.org
> > wrote:
> > > Doesn't "causing corrupted memory when flashing a microcode update" f=
it
> > > the cve.org definition of a "vulnerabilty"?
> >=20
> > This only happens on CPU bring-up so I don't see it getting triggered
> > without already being exploited.
>=20
> If you can get the maintainers/developers involved with this change to
> agree, we will be glad to reject this.

Oops, went through it in more detail, you are right.

I should have done my homework better.

Very sorry for the noise,
Siddh

--=-s2uX+4JWYnpGe2HP3vMo
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEQ4+7hHLv3y1dvdaRBwq/MEwk8ioFAmhAIZoACgkQBwq/MEwk
8iodWhAAjJS9KPnFIu1cROyHID4JjRKLeg+V85N9yj+NrmePsWyxJjD7WnkW2zDc
8b11FHrPTqz44As0S61S/ucdWg8t2woLqExOgtrb97zXMVxzpoc/TrwgrW7r5Jfk
TsP3fLdX3MjQhYAEF6pb+iTsHUr8ZUdicElG0SVKJpzhBzA57eRZqcWzm/Se7u2i
Tk0FuEiRwCANhrEQiiu86bmgeOgUBmoBPgejrTv+mopUnKk14rFkWCBsbopJTd/z
mvK8wv0sQrN5qxNNV7bBzYTckpVwYJuOc8xAHNiS0kNWrQATsCf6cqapXRWBHCRy
dcoeEe/BRvskMP8EdDWkOX/AquDulZvrbrM0S+pMluAsGnDxBw0mGQ3MoaL3d9Vn
oegNgKhTUDupJ4t8rORn+9zu1I1PcP4SjrqVWzzSWO9XHhDldfhMEisjmgBOsd9u
C6Ctyov9fRGmscPBkyMyXQo3wG04lCJKKQtftXLH8o2tke5C6sjg9mU1615VumHp
AihfsHIvM1FjWn3onopYHr31Duz0cjUuSmQy0xqCF6HGH+oDm5UgQwEcsKHUUXER
Ztl5dWP1vnCZmmzCrc1pc6/nwBVMPumsJCHLGWndmpyunWRIkFiVGFya9rLEKcuu
K0g3jinzSZqHzSON+V7095g673v4NDDt7FQauH7isXvsCyHDOpo=
=9V/o
-----END PGP SIGNATURE-----

--=-s2uX+4JWYnpGe2HP3vMo--
