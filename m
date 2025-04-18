Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37A48219311
	for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 19:38:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745005105; cv=fail; b=AaPh9Vj4dfVIJ7XpnStSyiUYq5mK5Mh8/V8Cv36r7S7gIioTKksb0Lw9NfUJKIEmCNXIhqOLpXJnC2lCjOKbcXgUAgESmI4INi7RvF7NhgtUJLuRMIcH5Ey/1ToBtPRLyKMWa7ehlWb9nzzTeLimknguIHXYid8tdw4Z3fqZFJc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745005105; c=relaxed/simple;
	bh=YBS05Igo7idvNVGWE3SbUCj0rGrzXp7ISc9OQH0rk+U=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=eoRcktKFQDRPEQydfHB9DcEbnzp1a7h01I795jxynkuPAbQfuBar/q7EKo1Ob9BMyHW5KtjQnss0TzftV8fm1ZbIGceMaXaZYgRt7wOcIyfBym97dNhN0xIArQkBTUiJmjr/DcOarLitaiM0vT2BoFJU54L2kZvmaH06nbozO4Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=DZE4/id5; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=arcu5OME; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="DZE4/id5";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="arcu5OME"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53IJDSVT022143;
	Fri, 18 Apr 2025 19:38:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=YBS05Igo7idvNVGWE3SbUCj0rGrzXp7ISc9OQH0rk+U=; b=
	DZE4/id5AQvamN+EtUgXCwdOozDTqSoE7wGY3W8EjlNn/OXE5Wis9NCvmc9CBciE
	RMTKFRFrhSwxQt+8u4QiXZPTPGQ3vIQVTfRn6qrY3bs3DaHaar9emO24oy8K6weq
	RbZvUGXPbb8Hz9Uj5Vyr9CWp4xpUd5W5NcdgwXJQDUAuaV9IcT2hpACVlBNg8HG+
	bbxBn2tElwjAzfDBLlKCo5GEmHVHGSxMQPUAAqjtAdw9IlIrBZB3m+Y5qYHQOuzf
	2Clyhp9+vmKgUt1s12of/RwJeIzkGDXwdZ/2oy3VFnsk0UBQ1Bqq40SwO3Zqk50x
	LlP8JyeeEOOS0hFV2zxkNw==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 461944gh0p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 18 Apr 2025 19:38:06 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 53IIA6Ef038888;
	Fri, 18 Apr 2025 19:38:05 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2043.outbound.protection.outlook.com [104.47.55.43])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 460d4w8tfw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 18 Apr 2025 19:38:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ay1u5kjva3FprSX6puHTqt/S25D3BdoG/BIcSTCmh7iTIOefYd7rQh2zOkVsx0qbqlXzdHuuGIM4lF9ubebxXkSq9JRACSNzjX155x5MyC1m4XbUeTsXOwgwfhDYKq+klGw+75n9u6PP+KCMMxdnwImgcUkcp279OSnXfuFVjYwEvL0A531xvwqNWqWnFtD+jesoGVF/Gxsb0wLrSSdVEC4a/IPeLlp7JE8f4y8pCgXcRoC+JfYmZLPv/03UNJzvphIqym0th18ZE0BBXCPoF0BAc6S3eXQNRex6AtfJT46L8kwBZBdSXkC3cOvgcU4ipz2tnleqnar1d1I69w3Jrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YBS05Igo7idvNVGWE3SbUCj0rGrzXp7ISc9OQH0rk+U=;
 b=Dr8tiqWUEYk308jgm5llbcwpIbh1NEvbB10c3QfZcPo9babIKtqMecDfAvt0QXbeLVIuSWCfIQvspvCx1Wj94Nf2oslCTfamtmBd1qrCXmnfJrNP1ScjUDjIH1/Jzz/4zynLh+Dsbhd5x1tu/+b+B00qVvaDnF25SLrv6uj21e7EB7aE0TWNKo48xoSIkcu7DXcUTm/LKtVQJ7C5Nam4dl/JaKqcr7SiKMZijg4wu4EqScfsSQCkkuo5Q1z/fVutjT7Ub1CNw9j5fkoqc6adl+kPeHnyc4ogfNzdLIRVde9wM5XPo5yJY2aTHWc4oh4zg43mLpWjmbhsf1l4sJYLbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YBS05Igo7idvNVGWE3SbUCj0rGrzXp7ISc9OQH0rk+U=;
 b=arcu5OMEESuuuYPPbvOiqVmIveu6fwejpj3Bj6grWHIstmvAoc6T1JZFeI3iWYX0Ij+6XJu69XhepfDe2cEHaZP39E6QimfhmgtWQt7Il58EF6ViBgELl+QDdXunfDnspD7ypbw3bGhaXMGnvfgxIrph8KwYk2xbbd1Aqav9+L8=
Received: from IA1PR10MB7309.namprd10.prod.outlook.com (2603:10b6:208:3fe::13)
 by CH0PR10MB5019.namprd10.prod.outlook.com (2603:10b6:610:c8::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.22; Fri, 18 Apr
 2025 19:38:02 +0000
Received: from IA1PR10MB7309.namprd10.prod.outlook.com
 ([fe80::818c:4ed2:2a1a:757a]) by IA1PR10MB7309.namprd10.prod.outlook.com
 ([fe80::818c:4ed2:2a1a:757a%4]) with mapi id 15.20.8655.022; Fri, 18 Apr 2025
 19:38:02 +0000
From: Prakash Sangappa <prakash.sangappa@oracle.com>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
CC: Steven Rostedt <rostedt@goodmis.org>,
        "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>,
        "peterz@infradead.org"
	<peterz@infradead.org>,
        "mathieu.desnoyers@efficios.com"
	<mathieu.desnoyers@efficios.com>,
        "tglx@linutronix.de" <tglx@linutronix.de>
Subject: Re: [PATCH 0/2] Scheduler time extension
Thread-Topic: [PATCH 0/2] Scheduler time extension
Thread-Index:
 AQHbf0Q2OR3YDnbdnE2tu2zJcXVlQrNLvDkAgC2FogCABeX5AIAgIVqAgARwhYCAAOYqAIAFlFoA
Date: Fri, 18 Apr 2025 19:38:02 +0000
Message-ID: <A276BE8D-B05F-4635-BB5B-3481C7DA5C31@oracle.com>
References: <20250215005414.224409-1-prakash.sangappa@oracle.com>
 <20250217120000.5ae1201a@gandalf.local.home>
 <821926D8-ABED-4B66-9E2D-39594DB82FA1@oracle.com>
 <20250322061422.2b24f021@batman.local.home>
 <1142C71C-32B8-4C34-BA3F-4D061BA25620@oracle.com>
 <20250414124149.2543d6c0@gandalf.local.home>
 <20250415062536.7tvr17qv@linutronix.de>
In-Reply-To: <20250415062536.7tvr17qv@linutronix.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.500.181.1.5)
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR10MB7309:EE_|CH0PR10MB5019:EE_
x-ms-office365-filtering-correlation-id: 04da1108-a048-435c-3542-08dd7eb08838
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?dDhpN01MbHFHN29xY1JrNm9jbmVCY082WkpacmZwZTZ6MkZvaGdkbDdtVG5u?=
 =?utf-8?B?TzJ4WkgxN3k4MS9FbTkvQ3B3SmNUMWFBNDdHa3NRY3ZlbllENkxackwzbHho?=
 =?utf-8?B?NUhjVDRqcmJNY2Q1VEkwRlEwSnhYUUVjcFFicGZiMUJjM29QSTdONlVlQm5l?=
 =?utf-8?B?SXU0ZmI4dmNmOU53TXA2QlVHYjlXNHdxOUlGcXB1dVdDM1JZemdDWDNrUHIy?=
 =?utf-8?B?NUJuR2s2SGZJcStOL25OR0cxTTVmTTV4TWRuTnJyY0NoMUJmK28wQ2tFMk1Q?=
 =?utf-8?B?ZkIwdlM2eDJiMGcxS1J4cFZGYjcyd3ZCdzNETnZsYUFwaHRmMXNVVzZPc1JJ?=
 =?utf-8?B?bXBWNW9EZmI0QWNJZEZNNE5iNER1d1ZxelB2QXFYcWsrUG5oNVRrVVZoWVl4?=
 =?utf-8?B?Ny9FMDhJaFBsRE5BUWRwNGxsYVhmNHVFWWF0dVJYblJEQUVtU3I2V1k0K2c4?=
 =?utf-8?B?OXoyRjZ5NWM3eUVqcUJNVGdCVFJ1akFwTEZDaVpMcUZrQ1dDTmN3Ynl1WEJm?=
 =?utf-8?B?d1M2anF1TkFFaWdjckVWbVlXRjBCeXUxaWYydDdsb21wSTJaWUJxbWREVExt?=
 =?utf-8?B?bmlhbW9ieTVLVDhWMGdJcDg0Sk1jY2Z5RUFXc21GVEt1UFY2TXROODV4VzNM?=
 =?utf-8?B?d0VqN2JGQ3dkNWpTSkJFK2NGMy8xd2MvZU5WVzgwYXFvVWt2MWtqOTNhOGIy?=
 =?utf-8?B?SDB3YjRqOUVta2VZdlVDeFZTbVlOTUkzSEZZUCtCYzlRZVR3WmcxWTVXK0Jp?=
 =?utf-8?B?TTlyOVZMMS8rZnI2Y1gwVGw0RXFMS0hsTjMxNE5hcmJCZFpFS0VNNUtVc3JK?=
 =?utf-8?B?N05maUc5ZXh6STdJaFBSaERiNjRnLzJJSTZnZkJJZk00Wm9YODhVVDU2UjQw?=
 =?utf-8?B?ZlN3UTRUYm4xUTQxT2VZeW9DdmpiQjRleU5WcUdCblpNa3pwREVWOUF3dzVS?=
 =?utf-8?B?Z1FaenBGZzN0b05MYmV3NGVsMCtlaDFZV2Zod2NDZmRrYmYyVWkvdFoxMW9N?=
 =?utf-8?B?SWQvcEZGMGVuZENpRVMyYWxYWTgxRzMvcXRVSmVtN1FuT2ZQa0ZFOG9XaUNm?=
 =?utf-8?B?bWxUVC9neGo0RDdmSnZRQTJja1B3U1lzbkR5dWp5NUhmUXVZRHRZQ3ltMmF4?=
 =?utf-8?B?Y3lTeVVxS01WeXFlTGRrRWM1YnBnM2FRRkpMUHRxT1ZaOTdwUlRreHZGZGxv?=
 =?utf-8?B?cHE0UHFkNEN6MEtWYmd3Sk54RHBxMTIwcWt5M0dNUzc4cm9qaFZFQjdnMUZQ?=
 =?utf-8?B?UG9odXYyaDFTVFNCVXRiaG5mUzlkVk9ZMFVST1J2WktMMnAyTjl4WTJKS2Fm?=
 =?utf-8?B?NG0yMHRoMjB5RDRjSzh5RWZnWkZLd1dyRVVpTS9pWkpPVGFubXp2Zk81Q051?=
 =?utf-8?B?MERITkR5cU1YNmNPcDZjZU10WmhRMElPZDNpYjAxcGdtc1B1cUIrT2VCVmNV?=
 =?utf-8?B?cUdLU1hRNVRzRWZpK0NLZzZvUDZsT3RCTThuMWJOcFY5ZExmbFk1YUNnWjFX?=
 =?utf-8?B?TVZ6UFVBcVdOcFUrSnpQNm9VYURWQ2k1QkxCU3RWWmZPU1NqUGFjVnlJK2FJ?=
 =?utf-8?B?akJWSUZsaFNmbnk0NjlCM2VMamd4V0RFdUhRZE9DUCtrYVY4RGptZFZWaG1D?=
 =?utf-8?B?VjQxbFhuUUtRMFdubjhhRU0yZXBSdC9LdEh0U21LaERsZSswSHlXVmt4a0lK?=
 =?utf-8?B?Rm9jZTZBUTlpaElNc2VXYk5KNzllZ2NPVEFLd2tOVnZwNE9FSHVLVWFpTjBE?=
 =?utf-8?B?K0V4bXY2UkJFT0gyNVpiSGsyMnl4aDZCRllMcUlXRWpHMHM2SldSSzlRSSto?=
 =?utf-8?B?V0lETUVKREsyOHpNZmQ5UFBVL1lheVZsWmlxdkxtbGpRblNhZWdKSXdWYjlL?=
 =?utf-8?B?ZmcwT3BUL1ZYWnBYd0R3eGRFRUtING9mSnc2ODY1eDhsUDg3MVNDWEJUNDF5?=
 =?utf-8?B?QlJLbk15RDZiRXV2dUVoMnVJN0hXWVR2aHZLTXNXaDY1VmJNek54T3Znb1BF?=
 =?utf-8?Q?UimiclaQHew+T7ODSGC3mxd0uGrkwQ=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR10MB7309.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?RW45RXZTYmxzTVh6eGRQOWRJTTNzaW5MT3hsbnpmRG1ZTjNKK0krM3E0OGxi?=
 =?utf-8?B?bS93ZGtPQmgyK3NJMVUyM2pUMERzaDRmMkZ4azlWeXFOWTdMZGl6a3ZHR2VL?=
 =?utf-8?B?elZGSmovQ0V0TmpZWFBrSGFXbmVUUFZxSVR3V0FFdmhCbERBeTFScUhkVUhK?=
 =?utf-8?B?U1EzNUhUYm10VTNZVkdocDIwT0hZN2Vzcm9aL1FSVzdHVkk3Rk15NEJvdlY5?=
 =?utf-8?B?UU1YMnZ0NUY4LzVWSFk4QzhGMVhRYmg0eG5PSmpsNmJIT2dmbWpsMk96Mjl2?=
 =?utf-8?B?RHJjNGJLSXRiNm5qSnA5VndvSERlQVZKMUE5dnQxdWtDZXdMR2pBSURtc1ZB?=
 =?utf-8?B?eXdqZFRBU2c5cEhwMHdtakdwVExYejllZjRPWlRhcWtlanJ0OGUrR1JzYVZT?=
 =?utf-8?B?QzFMN0p3Nit2ZEVzRkx4akVnZWlpaFFxOEpJL3hMZ1FNbHJNYlRUUUoyckRT?=
 =?utf-8?B?VzZCRVZOKytzZEFBcVY5anU2Z0dDaGFtb0lyb0FEekgydTZjZFVMS1RpNDUx?=
 =?utf-8?B?eDM0bHBqN0pQN2wzdTVVcmR0STRyNVZISk5hYUJPLzFoOURMcTNrRTM2TzNl?=
 =?utf-8?B?bDRzNHVaV3hYOHl4S3k4MG9ybjdUZFliWnFkbnZoSnRTUUtNTG1uenhUbnpV?=
 =?utf-8?B?L0cyV0lEbWt3MFVMTEVvUDNMQzhZQ1Q4NXJSVk9CcG5HWklHUWlIYldQK2lR?=
 =?utf-8?B?MDVKSVFOT3VlMTFzZVlWSHZHU3ZqQWhsb1hSbXE0cElNNWxzV1paM1dqcjFM?=
 =?utf-8?B?R1EwZ2dEMEVMeit4Q05MMHlrZUZOck11NnhyVXNNVGtwOXBPbFhzWVFQOGNR?=
 =?utf-8?B?QUNPcm5NNlRXcUphVHBQL3dxajRycmRrc1JlSTNXYTRLbzJmb2w2Znl5aG00?=
 =?utf-8?B?TXIwRWlFcUdPUUhzVlJ0bTg3bnRCVjN6TmlNbFVPblBCNXdOK1piaGh2TWZ2?=
 =?utf-8?B?ckhtYjQ0TUJRSmV2R0NPSENjM09NSE1lVlpHcytoYm1qK3ptYi9kVnFSUTNP?=
 =?utf-8?B?UFpOcGZrdzd3aTljZ3VtWTY0b3hPbXE5V2VsaExMVVFNZzd2OHp5ZXhSVEU4?=
 =?utf-8?B?YTNZV3lXTUhVTUVuZkc3UGxNTUZrSUhPa3F3VzE4K09Pay9RTkFLQjdCamN0?=
 =?utf-8?B?enZvcE5oeEpiNm5sVlFvMFowUzVWR2xhU0NhY2ZNdG1sV2F4M3E4WXBMMEY1?=
 =?utf-8?B?K0NBRXd5ajRXd2k2SXlDeVQxUUhvUWsrOEpldGlKbXU3WnowbnREOW5waHV0?=
 =?utf-8?B?Wjc1NzB5a2M5TndwdjNaRCtQUGQzY1dTbG5TTkgweG94NS9Cc2oxUXpaeURR?=
 =?utf-8?B?dzZ0TUQwbWdRUGVWSXBTdWRwN3V0YmVJN0RxYW0rZVBBdks0WGtGRVlYSjAy?=
 =?utf-8?B?aVlQWWV2SW1hSzZtd0JkVjJkUVQvS3hXdW9Fb0I0WDk2cm5jek9Edk9kY3pH?=
 =?utf-8?B?VFQ4N0RiczJCY1ArY1cyQlVZR0pLbGp5a0pLWktkSjY2Vi9PV3FYR2xBYldQ?=
 =?utf-8?B?dXB4NmR4SnZ2NTBLU1dUL3NoQ2xnMGowS0o1Vm51QTVhN2dpZk9ndy9Wbko3?=
 =?utf-8?B?ZnppSEdJcFVpejQzVDhWU2EzSU16dm1qRk1Qb0MzSjRHN0lXOTg5bjBuZjdM?=
 =?utf-8?B?bWtLNHZpUVBZdk8wQ0xnWlFqWXpiUDBxbUtiTk16aGN4czVsOUx5Rlp1YjUr?=
 =?utf-8?B?NGkxMkZ2bkpycGRISitWcmRxOC9YMXBNRGRiajREL1MxWEVkSW55dUI0TTV5?=
 =?utf-8?B?UkNUVENSYndURXpUNTU2ZDdXVW50SVVLMTdxUkVkeEd4YjFKTGl5cS95QTV1?=
 =?utf-8?B?ZjFxNHpBc2Exbzc3NjNLb29CakZZQy9nb0N4SGdpL05Db1ltOWxBL0xhYkdH?=
 =?utf-8?B?QjhUS2RSY0RQVnhqMEF0UEN3VEFwVEttQmpmVUJqa1A5WVA3MG9wQ2pKUDZU?=
 =?utf-8?B?VjVRdldTcFNHZGk0WTJGbHlvOWNNTER1NnFJQVFQNXhHYVV3ellteWs3MmRx?=
 =?utf-8?B?cFI5SHZDQVovT213SVlhUDFGa0xEUWw0QlBnQWZuMTJraXNlK21jUE85ZWxm?=
 =?utf-8?B?eFJnaDZTOHVmcmxZa21STEk2cVVMTlllY3I0N1BhSzFUY2tZOUdFUWpsR2hY?=
 =?utf-8?B?L3A0VjVoOEMrWDhMZE1sWDIxVVpaUlphR0Q3N3pSelZJNDgrd1VOU0RLK1c2?=
 =?utf-8?Q?17bgTboPZvh+Qng7Nab3MuU=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <5FE9EED3296D154BB6D28065197ACC7C@namprd10.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	DWqVSHm3glv8DaV3IQqgC2iFo+Jw0hhcJZsfozaK36SskWp/vWAPdoIrjt/cnNdZjpFP+PupEjERf6JbzocTUheI7ub/D8hHKYfYUJj5d/Y/SMgH7FcGg8eHnQibXn7f9/3e/hnb7GYEMnWZVFZD613nIAyJupg+1kWwKp5o34aSx5IR+7VI2sbt+3dVb10YcKFodmSAD1le8mEmLT6liNL6JLz+q6qa/0aM0sVGO+EsaZBJvUrmHS+E8zqhoaqcptkAk4lJrrx3K+GDAFHzf1GqDZEwQ1tOdfMDKxA1nAh0sGwLdeh0TUcbVoB3dTyyo/zuCMkCu6Sf3Q9qlFekjawlJQCVYVEVGszUCPkqiLDmzEt2KB4YbZmohPs/xKkIkdmUxRDEVmGWjelX2QsIiUO23Trp8xc0qNEd/9DYgzNZTZgIWtwVREb8tVp2QVdpJ+ILjai3+nulOyPJPeITADcA59ecOL7M8lND4hzx1f+7hgXEhTGwRh556XqOaIMwdCGSQnIHf3A6tAJ14ebrvOW5WolvZh7Pm6i/Bz6DEte8H63S336raK0EgaC/GM7DcIO7QHZiP+7oaU9IaUFbFuXQVia1pFyK2/GIf9uf558=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR10MB7309.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 04da1108-a048-435c-3542-08dd7eb08838
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Apr 2025 19:38:02.0768
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3OiNtXFBckHuG3tgGMOKJDSfslakhx++Hk8SbsDBxEcG6XHGNjw8+AxNNroslu4SQr7AymodkmcYNvLu93l9R8jitRgJRln7XV3GyQmDR9A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR10MB5019
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-18_07,2025-04-17_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 suspectscore=0 spamscore=0
 bulkscore=0 mlxscore=0 phishscore=0 malwarescore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2502280000
 definitions=main-2504180148
X-Proofpoint-GUID: 7wc0XYuTvZortmj8I3BbUnZ4BAxjGhhG
X-Proofpoint-ORIG-GUID: 7wc0XYuTvZortmj8I3BbUnZ4BAxjGhhG

DQoNCj4gT24gQXByIDE0LCAyMDI1LCBhdCAxMToyNeKAr1BNLCBTZWJhc3RpYW4gQW5kcnplaiBT
aWV3aW9yIDxiaWdlYXN5QGxpbnV0cm9uaXguZGU+IHdyb3RlOg0KPiANCj4gT24gMjAyNS0wNC0x
NCAxMjo0MTo0OSBbLTA0MDBdLCBTdGV2ZW4gUm9zdGVkdCB3cm90ZToNCj4+IE9uIEZyaSwgMTEg
QXByIDIwMjUgMjA6NTQ6MTQgKzAwMDANCj4+IFByYWthc2ggU2FuZ2FwcGEgPHByYWthc2guc2Fu
Z2FwcGFAb3JhY2xlLmNvbT4gd3JvdGU6DQo+PiANCj4+Pj4gT24gTWFyIDIyLCAyMDI1LCBhdCAz
OjE04oCvQU0sIFN0ZXZlbiBSb3N0ZWR0IDxyb3N0ZWR0QGdvb2RtaXMub3JnPiB3cm90ZToNCj4+
Pj4gDQo+Pj4+IE9uIFR1ZSwgMTggTWFyIDIwMjUgMTY6MTA6MDkgKzAwMDANCj4+Pj4gUHJha2Fz
aCBTYW5nYXBwYSA8cHJha2FzaC5zYW5nYXBwYUBvcmFjbGUuY29tPiB3cm90ZToNCj4+Pj4gDQo+
Pj4+PiBIb3cgZG8gd2UgcHJvY2VlZCBvbiB0aGlzIGZlYXR1cmU/IA0KPj4+Pj4gQXJlIHdlIGxl
YW5pbmcgdG93YXJkcyBlbmFibGluZyB0aGlzIGZlYXR1cmUgZm9yIFNDSEVEX09USEVSIG9ubHkg
dW5kZXIgUFJFRU1QVF9MQVpZPyAgDQo+Pj4+IA0KPj4+PiBUaGUgbWVyZ2Ugd2luZG93IGlzIGFi
b3V0IHRvIG9wZW4gYW5kIEknbSB3YXkgYmVoaW5kIGluIHdoYXQgbmVlZHMgdG8gZ28gaW4uDQo+
Pj4+IA0KPj4+PiBMZXQncyBjb250aW51ZSB0aGlzIGRpc2N1c3Npb24gYWZ0ZXIgcmMxIGNvbWVz
IG91dC4gIA0KPj4+IA0KPj4+IENhbiB0aGUgQVBJIGJlIGZpbmFsaXplZD8gV2UgaGF2ZSBhbiB1
c2UgY2FzZSB3aGljaCB3aWxsIGJlbmVmaXQgZnJvbSBpdC4gU28gbGlrZSB0byBzZWUgdGhpcyBm
ZWF0dXJlDQo+Pj4gbWVyZ2VkLiANCj4+IA0KPj4gSSdtIHN0aWxsIG5vdCBmb3IgU0NIRURfT1RI
RVIgdGFza3MgYmVpbmcgYWxsb3dlZCB0byBkZWxheSBSVCBvciBkZWFkbGluZQ0KPj4gdGFza3Ms
IGV2ZW4gZm9yIDV1cy4gQnV0IGlmIHRoYXQncyB3aGF0IFBldGVyIHdhbnRzLCBJJ20gbm90IGdv
aW5nIHRvIG5hY2sNCj4+IGl0Lg0KPiANCj4gSSB0cmllZCB0byBleHBsYWluIGluDQo+IGh0dHBz
Oi8vbG9yZS5rZXJuZWwub3JnL2FsbC8yMDI1MDIwNjE1MDE1Mi4tNUZhdWh0bUBsaW51dHJvbml4
LmRlDQo+IA0KPiB0aGF0IEkgZG9uJ3Qgc2VlIGhvdyB0aGlzIGRlbGF5IGNvdWxkIHdvcmsgZm9y
IFBSRUVNUFRfUlQuDQo+IA0KPj4gSnVzdCBrZWVwIGl0IGNvbmZpZ3VyYWJsZSBzbyB0aGF0IGl0
IGNhbiBiZSBlYXNpbHkgZGlzYWJsZWQsIGFzIEkgaGF2ZSBubw0KPj4gaW50ZW50aW9ucyBvZiB1
c2luZyBpdC4NCj4gDQo+IHNhbWUgaGVyZS4NCg0KUG9zdGVkIGEgVjIgcGF0Y2guDQpodHRwczov
L2xvcmUua2VybmVsLm9yZy9hbGwvMjAyNTA0MTgxOTM0MTAuMjAxMDA1OC0xLXByYWthc2guc2Fu
Z2FwcGFAb3JhY2xlLmNvbS8NCg0KUHJha2FzaA0KDQo+IA0KPj4gLS0gU3RldmUNCj4gDQo+IFNl
YmFzdGlhbg0KDQoNCg==
