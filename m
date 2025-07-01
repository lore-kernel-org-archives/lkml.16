Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7192B15E96
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 17:47:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751392063; cv=fail; b=sKc9pGLQmnPU7f0Z6MSAVBoNZyLotA6bUXih/j99cOaeGOOaD8c4eTBCEh/HRAiki3ONZqTKGnlOyRKiaaViT6DpZLpLBIzHUE3FMipgHcOcwDeNWvxqV2LNhPVsmJ+56A8IORnJ374i+elaY9QzxjqKgz+CIbiQFXKS214qcWw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751392063; c=relaxed/simple;
	bh=h+gCF9huWgKowOaN2P2QQr4gVs4qjQIDoDZTrJK2sg4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=FgjWcw/IsNEG0hxYXgfEkB6kWrJZCfzyGprKHTWFw0lmMPrzO/ZzRyjTq4avcJ9jTvIkNe2ONQUXXustsXJCcLWQk9MreRnunpGAhqCfoeOTpx/QoVspmTqPme6mO2V/rw8dn51KkR/oxspmGZj/NiUO0boX9R8v9iMl1o8/UVI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=sbeaNHqi; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=x0zrBNbs; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="sbeaNHqi";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="x0zrBNbs"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 561Gflo7027430;
	Tue, 1 Jul 2025 17:47:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=h+gCF9huWgKowOaN2P2QQr4gVs4qjQIDoDZTrJK2sg4=; b=
	sbeaNHqid8p+6Ux1xW6Z4KEHzbmoQl7L9NPft44XMuwDWfDlccRikRGde8vmBM2K
	YII1khuYAm7W3jgFAXUmUTU8aSEgJUvXkk+8WGKH0GvSUoEkzT9TXFegLLtXQe0Y
	OiHjwlJRohwDdeMfJVeaP2KJUWZGPtOGphSPa1ePpC/bK7htXX8q9tVMfK1NxA9D
	vZo0RIckdnCvkDEgxL/oHLNcEMRm7sWoZTVVCwCp7wpIKgoM9lxwxGcAWwq0QSM5
	x5alCMvnxHOrnq4QI/XsA4gH4lNydoPQrawozmvjCovBXGtXAYu4ztxQvT2viHvM
	Tb6oLshkG6NrrVsytUZCDQ==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47j6tfd9k0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 01 Jul 2025 17:47:29 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 561GRVfX024989;
	Tue, 1 Jul 2025 17:47:28 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12on2076.outbound.protection.outlook.com [40.107.237.76])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 47j6uhccn5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 01 Jul 2025 17:47:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r+wASByAmO2otFGng0KawRXuMS9ZaRUYKhRIBtKBwDsG0UgM+2DH8fY2JZMBTZdwclA2SIanXs3cMpiLA+/KG4LchnL0KQP+N6gOfpMq3GosLCWjS5e9Ccd4at88sZYtFylYjD+rSmCO+DNPgp79Jqa6MmlZ7E5mj+A/U4QR4yL99htSEjOnYNRHwRGpUWQYN4ENKuTvmK89WioWdP3ypHXIlKlKgj/msObxpYGplqkxu6xmiH031p9ZQEZrcHGLU8SY1hZH9Oqkqh4sVmIwdV59doiLse7glkV++JoPKRzueHG7fzNsV6cf7xmmMFR0RII7KdCS0ZQh7JqL8w5Thw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h+gCF9huWgKowOaN2P2QQr4gVs4qjQIDoDZTrJK2sg4=;
 b=Hql620Ai6X0FapxInywQttSYf8o3FyAV+OPKz5CutcBCeX9Hv3LhyEiJ+NiEsP+0MErmLvZuKwUI1tUxTBSmCV3czDU78afJ2RpzwfxyLx2P2NDS+H8WGCqyQiXU45n1b0kEi7x+vwlj1vMrodrIdFV8cQDMTYNr5S6+hd2ds9mZ4p5MrDf+pUa65eS98hIpQLWhoRQjmF5O9AaLvr4ZwYrXfmnVdlWJmiZs/B3aF1RKQh/iGZPPi79eYDAf1hBkyDhvlKDrrGUAvqZeWokXHpNAf6mHJoQ5FtIjNCa7okm4ZMdWXtsNPOo+0QeHoFkvsOS240MWbTlcbkpAHpDoBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h+gCF9huWgKowOaN2P2QQr4gVs4qjQIDoDZTrJK2sg4=;
 b=x0zrBNbsjQpU3L2LhpQol6vVpTAjbddI4CcY+cyOljLFFip/KHTzLN6vtceKAyEdS/1uu1FMRPWe+bMkdTfqQuG+3ZH8zPFRE8VATDDSczPd7CF5zDsnoEJMIl1pWWMR/Gi8SVfdOS/dODuYww39duaVpeKqHB1kFlBFZgKNJY0=
Received: from IA1PR10MB7309.namprd10.prod.outlook.com (2603:10b6:208:3fe::13)
 by LV8PR10MB7990.namprd10.prod.outlook.com (2603:10b6:408:207::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.27; Tue, 1 Jul
 2025 17:47:26 +0000
Received: from IA1PR10MB7309.namprd10.prod.outlook.com
 ([fe80::818c:4ed2:2a1a:757a]) by IA1PR10MB7309.namprd10.prod.outlook.com
 ([fe80::818c:4ed2:2a1a:757a%2]) with mapi id 15.20.8901.018; Tue, 1 Jul 2025
 17:47:26 +0000
From: Prakash Sangappa <prakash.sangappa@oracle.com>
To: K Prateek Nayak <kprateek.nayak@amd.com>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "peterz@infradead.org" <peterz@infradead.org>,
        "rostedt@goodmis.org"
	<rostedt@goodmis.org>,
        "mathieu.desnoyers@efficios.com"
	<mathieu.desnoyers@efficios.com>,
        "tglx@linutronix.de" <tglx@linutronix.de>,
        "bigeasy@linutronix.de" <bigeasy@linutronix.de>,
        "vineethr@linux.ibm.com"
	<vineethr@linux.ibm.com>
Subject: Re: [PATCH V6 7/7] Introduce a config option for scheduler time slice
 extension feature
Thread-Topic: [PATCH V6 7/7] Introduce a config option for scheduler time
 slice extension feature
Thread-Index: AQHb6jYaQPtmxCBqpkmPPh/M/KDfcLQdi/CA
Date: Tue, 1 Jul 2025 17:47:26 +0000
Message-ID: <E7A1DA29-9819-4A45-BCA5-8CBC5DC423C7@oracle.com>
References: <20250701003749.50525-1-prakash.sangappa@oracle.com>
 <20250701003749.50525-8-prakash.sangappa@oracle.com>
 <953c7749-5c91-40d9-ab1a-bdf82987d256@amd.com>
In-Reply-To: <953c7749-5c91-40d9-ab1a-bdf82987d256@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.600.51.1.1)
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR10MB7309:EE_|LV8PR10MB7990:EE_
x-ms-office365-filtering-correlation-id: 54635942-dc9e-415e-e233-08ddb8c75798
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?QTZyTCt0dEdVMmhWbTdzUTdoZmVGK0ZKeUwxT3BFVmwzdEwvYUw2N3NqSmdF?=
 =?utf-8?B?VWNGendZUWttVWxMb3FFVjQvcGRIMmhqK0loR1NESnl6THgvdHUrQ3hvQ3Yw?=
 =?utf-8?B?d1Q3alk4NHVhaGMveW1tbWcwZlJ5ZHMwK2VEbTVlU1lpSmM0dGl4WXl1elFX?=
 =?utf-8?B?TlpUVmdrQXppZDlmVUZUbEp2VXVwUjE4aUE1Vk41QmRkcDIvSERYVGprMEUz?=
 =?utf-8?B?N1hvakNKQ01nRitaWE92TUFiU2JCRy9iOUdtdlNoYnRJR1RnNTNPd1JtclU2?=
 =?utf-8?B?TzBPaTkzMkZXVlhYcHhkQlBQdTZ4Kzk2NTRkcjlpMWF3NGRGWWI0d1laUHF0?=
 =?utf-8?B?dE10RGNXVHc1aEE0alJYaWYvMG1PSVdyRGh1cHFpNjRrS0FIZU95YXdKb1Jm?=
 =?utf-8?B?TlFlWUZsUVhwZ1NoRVdEL3U3Q2hwcE9hMURqLzY4aUhQK3R6U0dIbkNzSmli?=
 =?utf-8?B?L1pWQXdQM0pTeFJ2d2F2TGpoczlFa2g1cG5rTjJxaCs0a1libTMyeTBrY0ZW?=
 =?utf-8?B?NllvY0dtS2REVzFUTlBxVzdzRVEwT3VuOWZJUDRkUEg5TDVRUHFuSUUvSFJz?=
 =?utf-8?B?UFQ3UGd5QlNTd2hCMkhNTmtTcVBid0cvMU5OaEttQ1BCWS9acDBraTdlOUxj?=
 =?utf-8?B?V3B5QTlXdGJTZE1jRCtJclJSMjVSL2g4L3EvTlBtVndXVGhnSytZWlJpcGpY?=
 =?utf-8?B?cklxSTYzM3BBTEh1NTNFaGRjQ1Y0S0FqLzVuSFZYS0FjK0pGNlhUTUtQR0Z6?=
 =?utf-8?B?UUx0ZnhwTkR1MXlHdTVTdFJIVGc3ZVE1WGlIWU83aFhnb1RmeEhIV2liZFR0?=
 =?utf-8?B?ZDB4ZXQzS3l1bHVjV2JpSDdFZWZUTitmdEhGNEpuelRNb0VvemlwdjdUR1dW?=
 =?utf-8?B?ZU1CZFdHVGlncmxjUUhxK3E3VkthVUh0Y01EUEdKdnNhdm5QZ1FXd3ZHZHQ5?=
 =?utf-8?B?R09sMHZJL0ZNS0ZJa2FFY2h1ajZ6QkJnT0EvaHdocHNUbnpzWDhJeVJ2NHBq?=
 =?utf-8?B?d3J2MG5KcStQUkRiTFhRQmYzRmNCVzFvYzhCQXBQTkpscWxGSFQ0MWczUnFv?=
 =?utf-8?B?VVdPL2pRcDFFWi9MdFNMbmNuMXhUQUpZcGNTMWtEbXJKeGhTM3hOUjJra1BC?=
 =?utf-8?B?b0RzU0FaZDhEVlVQLzVtSUt0RTd4a2hrNXZpbUNUVUdHUzdId2ZVaTNHc1ZZ?=
 =?utf-8?B?QTNTbmZPak51RUM0eGgvc2hBaituMkNVTE4xZzBlWVdqUnVkL1RMaFd4Q3F4?=
 =?utf-8?B?SVNHVmdDeXJyUi8rNnJ6VHEyWXhIZmwySyt4ZGZZTFk3QW5WVlNuanM3ZEpz?=
 =?utf-8?B?UTlXQW1GMEF6ODc5M2NBZTIvNGM5WnNTajB1aVY1UkFEYWVHb0ZoT29tSU5l?=
 =?utf-8?B?c20vOXJpSFRCWmV1ckVtR2pXcktEb3M3YkJRdVc0eC9Fc2tlSnl0eHVxTVpN?=
 =?utf-8?B?MldrV1NWNHVTbnlBMEZjeEMwRU8yL3N5bGNRcC9tWFQrL05CYVhtaDNDdEpI?=
 =?utf-8?B?SW9CZ2dTRGkvODdQUVJ6YThQSTNKTXUxMks2NlBQcUxUM0h0QnkzNG0yZUoz?=
 =?utf-8?B?Z0N2ditYNlBNcVQ4dVgyNFBRZzBYUTlPQ2VlTFRJNm9XcHhRc1c1RVUrdit3?=
 =?utf-8?B?dWduNDZkNTJNMlNHanoydi9tRTdmeFV5N2kvWlZDMGtmQnB6bTIwbkJJcFJZ?=
 =?utf-8?B?TjFKang0d3NNc0pUbXRYd3ZhdWpCRE4yNVRpMXBSdWp3NG9tRFk3RjRQYVlV?=
 =?utf-8?B?UFNmUStWMmNXS09DeEROa0pISFVoYXhwWnRHWWdDY0NFY3BDWXJxQVBzT2xO?=
 =?utf-8?B?NUhYQUNJNlY1d1hRcHUxZjJyZ2xqZDI1S0JyV0JLMGRZTmFuNlBCVGYyZTFC?=
 =?utf-8?B?bnR5aWNrYVZZdTE4Yk5sV2xwTnFaQTlKT0U4cEFTVEZZS01JN3ZsR3VFQWhu?=
 =?utf-8?B?ZENEeFdCdUNXUHhOcWZJK0FXYjF3Z2Q5amhNcDRGa1FsTFdGYTJ1WWZoSEdi?=
 =?utf-8?Q?xDjdYmx2LhGxKUsm0qmmO774IAcgH0=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR10MB7309.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?SjdsMm1BamRCTjJEc2d5bVNlNjIwdmlUS0N0enFXbmhKUEFJNFRaVytSS3Vo?=
 =?utf-8?B?SGVKQU9Pd1RPV1VIRmVJS3V6NDBhY2U5NjRZNHFkUFRxaFRTUnhsV2VUY3Bz?=
 =?utf-8?B?MkZJTkg4ZGNVVldUNDllM0ZOWEY0R3lwWDYybEpWNmZFTmFNZkpWempLa2RD?=
 =?utf-8?B?L1dwN1BJN1oxK2Jzd0l5V3k5UGVYbEVDME1uVW1Dd3VnNXNzcFZUdFVGTGtE?=
 =?utf-8?B?UzJxbW51b1FCdDBlbklmWmwySzBlQUdWdU84Q3g1RTJyemVCQWpTM3R2aUFK?=
 =?utf-8?B?c1h1NHRKU1Y2RVZxZWxDeVlqbVRBcDhsak1yMlBkeUVIS3Y3WmVuSGFxMjd5?=
 =?utf-8?B?UjZBNHEwajdnbklVSEw3QWlnSlRhd3diRDI5MmpXakpYVHhLYVAzeWd4MDlu?=
 =?utf-8?B?WHF3US9LMk8vakpRbnp5UWFjNnJaY1E0eUhmcTNVa3VUb05CM2pUTFRxQ2sv?=
 =?utf-8?B?TXplQllZYmVVODZzeXhCQzBwcWJjNHQ5VUtGVUIwOElRMTVFOVdEN3cveUtL?=
 =?utf-8?B?K0hYdTJIQXFvREFoTnNMaU9yT0NkMCtDd0FNWGFWQWhKMm9xT1FnTGhJQ3Zk?=
 =?utf-8?B?VVJRMmxoOHFxRklBQ1pESWlhK1M3V2ZLb2xqQVJBeW5CMDdsd0hycmJjL0Jx?=
 =?utf-8?B?MHFBeS8vRGpvc0FVZWpGLzNvTUZob0hUczdiNUp1R0xvQTV1RTRXMmJ0MnV3?=
 =?utf-8?B?cFU1clBadHRzR2dyNVoybDJJc1ZpUlF6dmtaUlNCeVp0MUpNSUNvakFQUWxR?=
 =?utf-8?B?ajloSEQyYStWM3VtSTVCNEpYQVgrOEpNY0VDeURYWFFKSG1aOGF3MHZFZ1RW?=
 =?utf-8?B?bXVjK1MraysyUHYzbm9YcGI0bWY4Y29VK3owU0ZoSG8yMUwvUUhObVRkVmhD?=
 =?utf-8?B?ZmpYeVBVa0FXT2RXMGJLYjA2S05JUUlpNldOdDhxL05BWjVwd0NwL0dZMTFm?=
 =?utf-8?B?dFlvVU1TQmVSb2xKcm1hZDhlTnY2aWY4ekd4K2l1THZIcEpQRWVObU9zU3VE?=
 =?utf-8?B?WnAzSTlKTy9aSUJCYitXcVdsNm5lbzEzdEpXakVkR0JQMzVXamptTHNuNmZa?=
 =?utf-8?B?M3dBOVNhai8wOXZibmNETDlnSEpKdHhRb2U5NnZBd0MxSlJKUmFnQnRycVdO?=
 =?utf-8?B?ODI3TVMyK2MvZDIyamxVNVQrZFlLOE1SWG9KME1DcnpLQWk1WWlZclBqa29u?=
 =?utf-8?B?QkZOUForRUZ3cmhVWXFxelFLK2lrWnR5bG1DRlZ3a0EyVGhDSDF3ZHFjZVYv?=
 =?utf-8?B?c3FTSGxHVVlDS1dUSE4zTndmMm9vVkZEc3ZnbExkN0NvM0hIUjZZTmxWbEZt?=
 =?utf-8?B?dVhkeUdacHpEWGVDM09hWFd1THp6aXBaTEVYNzRpL0o0TmRxekN6WGlVNGxO?=
 =?utf-8?B?c3JLaGF4RVAvYlBCQ1RnQm0zaE1VZENMRGU5SGNZVnIyMG9oMWtxRElLWnJs?=
 =?utf-8?B?SWV5cHJLQXRhd252bjFkV2ZTRHZ6MHl2Nyt4NkpOMjc5YjZ0eUNvcG9DY0wz?=
 =?utf-8?B?WUUvSTZpVHMwYUxGc2daV3gwL1Z0MkhLRE1qM2JtLzMyRlNIcVFOZW5kcWxR?=
 =?utf-8?B?TitXOTNyeWVzL0pEdE5RNGxqa1BkY1B5NkdJUFR1dWJYRHlWc0JndXJtTnhK?=
 =?utf-8?B?L2Y2N1Q4QWlnSDdxdktOTGgxeTBHQ2dEQysxR1ptckdKQ1BlN0dYUi85Qk1E?=
 =?utf-8?B?QVlHWEJGYUJNandodUMwckYvNWsvZUQxOEdZVmtib0Q1K3JTUW51WE5kMWha?=
 =?utf-8?B?YVZoZzNrRWk1a3R4VU9FZWYxU0xNUXd5TytIeEt2WmdqbnFJRVRSSlFSa3Uz?=
 =?utf-8?B?b3FBWS9QZENTUmt2VlZXWGRXS2RMcWN1ZHNwcjdxQnBHUDlUeUZKb25OSjQy?=
 =?utf-8?B?MHpYak92clNjSFFzcXhHVDB1MFl4d2pvWkk3ZXRreHZzOUZMcHAzS2xzOWMy?=
 =?utf-8?B?R0U4VklhbnE0cVZpMUdDL1FKeDBoYnJRUnlFeXoraEN2eFF2cjE0TmR1c2x0?=
 =?utf-8?B?bklLeFk2VEp6VFlYY1IzUkk0a3RRZHJlb0JOdUtaTjVHcldxdGtzYWJMdTZL?=
 =?utf-8?B?amJQVklNYVdEUVZmeC96ZnZxVW5CVWhGLzdpTjIzMEc5cCtVRkNZZHBNT0Vu?=
 =?utf-8?B?SlJnemp6cDU1WmMzNmJNazcvQ28zZnJSRjFlTjM2STBhUUtoYXdZR3lySURB?=
 =?utf-8?B?TFE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <FE5D05208C963049A8B7F552FD284F8F@namprd10.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	YYs5p9WW0gT8MO+P0nPQHYqdB/Nj+FgOxO6UbrqVlojQLXmaocgsNuKChCBdTuMNVq8hkMdeIVH1mDlSMjTyqQdcQWMl0n5jQC+wN++JBYcjVOFvSQoHCSYQF2B1bROaxHDogvsMVrNx3GovPPCCBR+j2t+4zR7Da61USPD6zNvYxU9pe32PkOp5oRE0ZRrtr7dSSv6VpVHyuEBIbGqtiEEU67P000WuwA/ou9BuqojqPZO3HHH0sewCxOxeKyBfDBXJHyp2O5AGbZXeh7FN9ygepDUqPfoX2pKTAaAV5XFKe0Aji60ejXRwVSPFKzPXT1GR9P7qowz1SRzh3GjckUrQyC3WwU0fgegx50wTOWW0oLTvFf1MjLpiAzxp9e33qHNWUwMLFTI/1JbWvkfp1SDNwVSJ39quuV+6rvnS0a7SdpeIOd1yFZKoXh/QzI7/HtcizoNyAjl1uXERgZA/3r+dHFabE+p7c1J449hBvpzSsTES+ehFdHqJgF2ZGYGdJP0a/ujycQS4fQptNcYow7KodwoiyBZpLjodVNjKiwlZj/p0OFfb4OsB3vG3XidNoIoV1bZ2DDk2UZLhpPS2hco1ncGYkuPYDQcgNfl3c8c=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR10MB7309.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 54635942-dc9e-415e-e233-08ddb8c75798
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Jul 2025 17:47:26.3997
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4CHHQ6llYUPdMKDhqSOLiBlq2QnB6BAsiHCT4P5mEZOSC416X/O6M6ADY2ULSGwk19+vkbZ2VcW4YCwMzlXFSQVq8bOiYgDUbYljbHzLMxg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR10MB7990
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-01_02,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 adultscore=0
 bulkscore=0 malwarescore=0 spamscore=0 phishscore=0 suspectscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2507010122
X-Authority-Analysis: v=2.4 cv=CMMqXQrD c=1 sm=1 tr=0 ts=68641f31 b=1 cx=c_pps a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=GoEa3M9JfhUA:10 a=zd2uoN0lAAAA:8 a=yPCof4ZbAAAA:8 a=ewKOVwf22wTUnD5j8WQA:9 a=QEXdDO2ut3YA:10 cc=ntf awl=host:13215
X-Proofpoint-GUID: OOuwpbrZX0JicZ1lafLC970bXgm_kGB4
X-Proofpoint-ORIG-GUID: OOuwpbrZX0JicZ1lafLC970bXgm_kGB4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAxMDEyMiBTYWx0ZWRfX4vmZxejwAi3C sEo/222Mi6Ctemc929Dg3KDR8Y2NNRnBJuIiJW+GjyD8opO1SlmE2Gd3ob4J3J2JDma4Gt3v4aE NQc5mmEKooW6PkBC3n5OGbTpNeoNkOfJ0kx2utXBid33Xz9yJovwyXPvYCGvA7FE3yoMVheDuzD
 8bskUFlKwoCUwVbqpRhEEgUR6YMN9XL+rT5QbZV5AfZ2n7k9NHh66bCS+RoYz65QrMYx/6d13mp vYYhEn24Zlcz1VyRlZbcHPlr6misUZxkB0nDIC/Sd6lKlNAkaBPn7nTAuW/3C6KicgJ5/Ri9j03 V3PuVTWenRJ35+xNUSoVywF60m9P/JrAZ6vpLebFcI+Jw7dMQiS/X92hWUKimZQN8c7LQow5WeW
 VfiLcr+ikSuIfsCpWxXpwwY79QF/aN8bgw4iXMjZD3/u2zBfcMXrFEG8EV0Z48ZJ19YVC7sM

DQoNCj4gT24gSnVuIDMwLCAyMDI1LCBhdCA4OjEy4oCvUE0sIEsgUHJhdGVlayBOYXlhayA8a3By
YXRlZWsubmF5YWtAYW1kLmNvbT4gd3JvdGU6DQo+IA0KPiBIZWxsbyBQcmFrYXNoLA0KPiANCj4g
Q291cGxlIG9mIG5pdHMuIGlubGluZWQgYmVsb3cuDQo+IA0KPiBPbiA3LzEvMjAyNSA2OjA3IEFN
LCBQcmFrYXNoIFNhbmdhcHBhIHdyb3RlOg0KPj4gQWRkIGEgY29uZmlnIG9wdGlvbiB0byBlbmFi
bGUgc2NoZWR1bGUgdGltZSBzbGljZSBleHRlbnNpb24uDQo+PiBTaWduZWQtb2ZmLWJ5OiBQcmFr
YXNoIFNhbmdhcHBhIDxwcmFrYXNoLnNhbmdhcHBhQG9yYWNsZS5jb20+DQo+PiAtLS0NCj4+ICBp
bmNsdWRlL2xpbnV4L2VudHJ5LWNvbW1vbi5oIHwgIDIgKy0NCj4+ICBpbmNsdWRlL2xpbnV4L3Nj
aGVkLmggICAgICAgIHwgIDggKysrKy0tLS0NCj4+ICBpbml0L0tjb25maWcgICAgICAgICAgICAg
ICAgIHwgIDcgKysrKysrKw0KPj4gIGtlcm5lbC9yc2VxLmMgICAgICAgICAgICAgICAgfCAgNSAr
KysrLQ0KPj4gIGtlcm5lbC9zY2hlZC9jb3JlLmMgICAgICAgICAgfCAxMiArKysrKystLS0tLS0N
Cj4+ICBrZXJuZWwvc2NoZWQvZGVidWcuYyAgICAgICAgIHwgIDIgKy0NCj4+ICBrZXJuZWwvc2No
ZWQvc3lzY2FsbHMuYyAgICAgIHwgIDMgKystDQo+PiAgNyBmaWxlcyBjaGFuZ2VkLCAyNSBpbnNl
cnRpb25zKCspLCAxNCBkZWxldGlvbnMoLSkNCj4+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2xpbnV4
L2VudHJ5LWNvbW1vbi5oIGIvaW5jbHVkZS9saW51eC9lbnRyeS1jb21tb24uaA0KPj4gaW5kZXgg
ZDRmYTk1MmUzOTRlLi4zNTFjOWRjMTU5YmMgMTAwNjQ0DQo+PiAtLS0gYS9pbmNsdWRlL2xpbnV4
L2VudHJ5LWNvbW1vbi5oDQo+PiArKysgYi9pbmNsdWRlL2xpbnV4L2VudHJ5LWNvbW1vbi5oDQo+
PiBAQCAtNDAyLDcgKzQwMiw3IEBAIHN0YXRpYyBfX2Fsd2F5c19pbmxpbmUgdm9pZCBzeXNjYWxs
X2V4aXRfdG9fdXNlcl9tb2RlX3dvcmsoc3RydWN0IHB0X3JlZ3MgKnJlZ3MpDQo+PiAgIENUX1dB
Uk5fT04oY3Rfc3RhdGUoKSAhPSBDVF9TVEFURV9LRVJORUwpOw0KPj4gICAgIC8qIHJlc2NoZWR1
bGUgaWYgc2NoZWQgZGVsYXkgd2FzIGdyYW50ZWQgKi8NCj4+IC0gaWYgKElTX0VOQUJMRUQoQ09O
RklHX1JTRVEpICYmIGN1cnJlbnQtPnNjaGVkX3RpbWVfZGVsYXkpDQo+PiArIGlmIChJU19FTkFC
TEVEKENPTkZJR19TQ0hFRF9QUkVFTVBUX0RFTEFZKSAmJiBjdXJyZW50LT5zY2hlZF90aW1lX2Rl
bGF5KQ0KPiANCj4gQSB3cmFwcGVyIGFyb3VuZCB0aGlzIHdvdWxkIGJlIG5pY2UuIFNvbWV0aGlu
ZyBsaWtlDQo+IHNjaGVkX2RlbGF5X3Jlc2NoZWQoKT8gSXQgY2FuIGFsc28gYmUgcmV1c2VkIGlu
IGRvX3NjaGVkX3lpZWxkKCkgdGhlbi4NCj4gVGhvdWdodHM/DQo+IA0KDQpPaywgd2lsbCBkbyB0
aGF0Lg0KDQo+PiAgIHNldF90c2tfbmVlZF9yZXNjaGVkKGN1cnJlbnQpOw0KPj4gICAgIGlmIChJ
U19FTkFCTEVEKENPTkZJR19QUk9WRV9MT0NLSU5HKSkgew0KPiANCj4gWy4uc25pcC4uXQ0KPiAN
Cj4+IGRpZmYgLS1naXQgYS9pbml0L0tjb25maWcgYi9pbml0L0tjb25maWcNCj4+IGluZGV4IGNl
NzZlOTEzYWEyYi4uMmY1ZjYwM2QxNzVhIDEwMDY0NA0KPj4gLS0tIGEvaW5pdC9LY29uZmlnDQo+
PiArKysgYi9pbml0L0tjb25maWcNCj4+IEBAIC0xMTMwLDYgKzExMzAsMTMgQEAgY29uZmlnIFND
SEVEX01NX0NJRA0KPj4gICBkZWZfYm9vbCB5DQo+PiAgIGRlcGVuZHMgb24gU01QICYmIFJTRVEN
Cj4+ICArY29uZmlnIFNDSEVEX1BSRUVNUFRfREVMQVkNCj4+ICsgZGVmX2Jvb2wgeQ0KPj4gKyBk
ZXBlbmRzIG9uIFNNUCAmJiBSU0VRDQo+IA0KPiAgICAgICAgJiYgU0NIRURfSFJUSUNLDQo+IA0K
PiBhbmQgdGhlbiB5b3UgY2FuIGF2b2lkIHRoZSB1Z2x5ICIhSVNfRU5BQkxFRChDT05GSUdfU0NI
RURfSFJUSUNLKSINCj4gY2hlY2tzIGFuZCBrZWVwIGFsbCB0aGUgU0NIRURfUFJFRU1QVF9ERUxB
WSBiaXRzIGluIG9uZSBwbGFjZQ0KPiB3aXRob3V0IHRoZSBuZWVkIHRvIHB1dCB0aGVtIGluIHRo
ZSAiI2lmZGVmICBDT05GSUdfU0NIRURfSFJUSUNLIg0KPiBibG9jay4NCg0KU3VyZSwgSSBzaG91
bGQgaGF2ZSBpbmNsdWRlZCBTQ0hFRF9IUlRJQ0suIA0KV2lsbCBtYWtlIHRoYXQgY2hhbmdlLg0K
DQo+IA0KPiBBbHNvLCBhcmUgd2Ugc2V0dGxpbmcgZm9yIDMwdXMgZGVsYXkgZm9yIFBSRUVNUFRf
UlQgdG9vIG9yIHNob3VsZA0KPiB0aGlzIGFsc28gaW5jbHVkZSAiJiYgIVBSRUVNUFRfUlQiPw0K
DQpZZXMsIDMwdXMgaXMgdGhlIGRlZmF1bHQuIFRoaXMgbmVlZHMgdG8gYmUgZGVjaWRlZC4gDQpJ
ZiB3ZSBkZWNpZGUgdGhhdCBzY2hlZHVsZXIgdGltZSBzbGljZSBleHRlbnNpb24gc2hvdWxkIGJl
IGRpc2FibGVkIGZvciBQUkVFTVBUX1JUDQp0aGVuIEkgd2lsbCBpbmNsdWRlICFQUkVFTVBUX1JU
Lg0KDQo+IA0KPj4gKyBoZWxwDQo+PiArICBUaGlzIGZlYXR1cmUgZW5hYmxlcyBhIHRocmVhZCB0
byByZXF1ZXN0IGV4dGVuZGluZyBpdHMgdGltZSBzbGljZSBvbg0KPj4gKyAgdGhlIGNwdSBieSBk
ZWxheWluZyBwcmVlbXB0aW9uLg0KPj4gKw0KPj4gIGNvbmZpZyBVQ0xBTVBfVEFTS19HUk9VUA0K
Pj4gICBib29sICJVdGlsaXphdGlvbiBjbGFtcGluZyBwZXIgZ3JvdXAgb2YgdGFza3MiDQo+PiAg
IGRlcGVuZHMgb24gQ0dST1VQX1NDSEVEDQo+IA0KPiDigJQNCg0KVGhhbmtzIGZvciBsb29raW5n
IGludG8gaXQuDQotUHJha2FzaA0KDQo+IFRoYW5rcyBhbmQgUmVnYXJkcywNCj4gUHJhdGVlaw0K
PiANCg0K
