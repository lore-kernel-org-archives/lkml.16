Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34FE38BFF;
	Thu, 30 Jan 2025 01:46:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.158.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738201613; cv=fail; b=TMFLH2uZnMzbONcDPPaF5omze/AoqWw9J4fo3oqOzGdXNkqWdpWwDZdIJHtXXOSk8NQ6eWfEdfwfJTWPmpEAPmgmfwcUO0zvOXNsmVVODY5B8p4sM8REC++z8MeCA7XBOjk3l7cdjBLQjC0cVukVFh5W1PK+sniQwqxTsm+BkK0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738201613; c=relaxed/simple;
	bh=qe7uMxWYfbWQ4nGAeOLZEvcVO9UY7fGcCCtthPBndd0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=TVww98kFgDvFHuo17l+b0kJIPhYdVkXvogu/dhSVkPcN5C3qFapzC80OZpB8ArfObFbCUy1179TK1tZPvm4/I9abSfDzciGxvASNHZvUM7LEwAR6WJb9U5FSoO6Ch9VZp2wdZpcjZhMfrjo1/BR/hi3RqH4q+3b1N0+e5qfDHLw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=Ur3yhf9M; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=gEBZX2PJ; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=haWlV8qD reason="signature verification failed"; arc=fail smtp.client-ip=148.163.158.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="Ur3yhf9M";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="gEBZX2PJ";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="haWlV8qD"
Received: from pps.filterd (m0098572.ppops.net [127.0.0.1])
	by mx0b-00230701.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50TLQvQZ026450;
	Wed, 29 Jan 2025 17:46:45 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=qe7uMxWYfbWQ4nGAeOLZEvcVO9UY7fGcCCtthPBndd0=; b=
	Ur3yhf9MAyPs8FEYN0frp/rIX7pDU9lBkUrhyNH62iGo9nedB6JrrF6DybHwzHAG
	YCsMXjsrmg3smfl+Ic5muC9jY7/8/E1sdlGvy0wTIkO81qjMDIv/F9t2xKheN/qT
	yQBQXRgMLtr23yC9bj+W/wc3jzsYVMnIUrw/ZHq4k5sk2YYC1twTgHU/iO2lr+Ty
	Ds/Rq95pmwKiD72U0O1QD7gvUkoYAXvP+mdspOdOZLAsEl7jXFt0yoThqW++4x4P
	atkTU54w1wFeErRp52b3UmTwxgTmbl21Vb8qDiFQWXBT4rzCyyGunCQwfdVsn/Qe
	nAiTM8m+k+irW/NQHUQdPQ==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
	by mx0b-00230701.pphosted.com (PPS) with ESMTPS id 44fv8m0ye4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 29 Jan 2025 17:46:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1738201604; bh=qe7uMxWYfbWQ4nGAeOLZEvcVO9UY7fGcCCtthPBndd0=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=gEBZX2PJjmDi2ZgTyqpHk9+wZYM95XZ3EaCa2ZnqMeHo6xEZa8/k3wjm20wHiWWvQ
	 NKHBVLLcYjL35gk5Rczis2Uc1aw+WGL6lJZQ2ai9HwUSuJZgW2NmjzeC4MjS6+sHJs
	 /T3feLPaRx6/fwJxi9Qsn2BNI8ezT8tCtUi4FynfH7+D3TBe1IIv/eJXiTFPqV3P4l
	 LlB+VfgoADql3BolXS+gSUW4X9Jz2+ASq1FPC44k3KiCNOyI1HpK1CSbzgjhPeG6dX
	 gRj155h4MGmqJ6NvR2n46cWUYm2duw71aMpJY75OWfH1nvyGzQ2wsfeS4TPytWEy3G
	 fwO/+OSrNEPAQ==
Received: from mailhost.synopsys.com (badc-mailhost1.synopsys.com [10.192.0.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id ADDB440519;
	Thu, 30 Jan 2025 01:46:43 +0000 (UTC)
Received: from o365relay-in.synopsys.com (sv2-o365relay3.synopsys.com [10.202.1.139])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id 238F9A00CA;
	Thu, 30 Jan 2025 01:46:43 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=haWlV8qD;
	dkim-atps=neutral
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2174.outbound.protection.outlook.com [104.47.59.174])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 7728540112;
	Thu, 30 Jan 2025 01:46:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kmPUikzz2CsrRHKzlUV0hVitgwIk2kcRKTsi3iH/9II/vXkH/W0mVAQjLIGDowCLOSSTUSh4JIP6GFAxQe6R6oBPq5IxmbWfF13sERipuD8lkc3j02OV6Hts8q+PCCEAkVzqdJR9tMu/s5FBQohZ4luBlJNZBcLzI/mIJFVZvzwW9i6ZNEjX1jnVo8CPZOWzdslqgd4ecC12xj23uTe+oS7sbZq3Ucb3DUFbd5/s46Cs5pcNeDCf4lA4v6QFUewXJrjNg/RAc3l0MTgAykLBfv/PQDxxj+yV1ANpYdmw0cb5YxoFdi4f97aZPI5CaOFtPetDWxuVZwuEE7gWQrEvUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qe7uMxWYfbWQ4nGAeOLZEvcVO9UY7fGcCCtthPBndd0=;
 b=H6oO1Tdm+p6tdtz+EUW47Fbdasa0oD+IPoZgxjgBiw+noke6ZWX2bWIjngW7PtG4xelb1Wsb/flehMW+xHomzlsquMXsA75m6tMdlceIyVlH+jxACNNBJccu2IulbTnF7Ax1uk2JRx7Dky2GGPwGkKxf13aSGPXmHpNJ3kYm/YpNk2fHx0/3O9yEkTg3I1UrZVZpZZ+JQkMoAgc44Iaif6FsT75WBbq5ZJTxNYlYOJHih0UVeJglO5GQxpVRT+ER8+LmB3jO4Q974aklaFgYXlf0K+Do5R1z4kfmdkY/0ejDgwa+GcuC38MZap4Cl5oe4KxdsiITTvM/Jx+hfmRxsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qe7uMxWYfbWQ4nGAeOLZEvcVO9UY7fGcCCtthPBndd0=;
 b=haWlV8qDyvu5e+vPFFRqjgadq6AoeIkdxLRcYk5hoTBlhoU2DGthq7PNUtVYaOXwAibAaruPClJ5hvLrB9WIp2JRT0L1odzKIMnYa6zWvnF4e35uJG4wwmf5pSdSDhY7y7Ap1WGSZW5SD4Ckmcd01PNwvH9V1ef3mjCJi6Fatag=
Received: from LV2PR12MB5990.namprd12.prod.outlook.com (2603:10b6:408:170::16)
 by DS7PR12MB9503.namprd12.prod.outlook.com (2603:10b6:8:251::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.18; Thu, 30 Jan
 2025 01:44:41 +0000
Received: from LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8]) by LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8%7]) with mapi id 15.20.8398.014; Thu, 30 Jan 2025
 01:44:41 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
CC: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Felipe Balbi <balbi@kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Ferry Toth <fntoth@gmail.com>
Subject: Re: [PATCH v1 3/3] usb: dwc3: gadget: Skip endpoints ep[18]{in,out}
 on Intel Merrifield
Thread-Topic: [PATCH v1 3/3] usb: dwc3: gadget: Skip endpoints ep[18]{in,out}
 on Intel Merrifield
Thread-Index:
 AQHbaC0e4vvQDZrPEUCV4IbmsnNVa7MaD3SAgADpBICABvSAAIABFsCAgAiCoQCAAPLjAIACJ3UA
Date: Thu, 30 Jan 2025 01:44:41 +0000
Message-ID: <20250130014438.xeyvl2zahrpuiyyo@synopsys.com>
References: <20250116154117.148915-1-andriy.shevchenko@linux.intel.com>
 <20250116154117.148915-4-andriy.shevchenko@linux.intel.com>
 <20250116233937.s7mv5mu4tfuaexy2@synopsys.com>
 <Z4pcMUDsFZ8-deW_@smile.fi.intel.com>
 <20250121234616.eomj7r73o6ce3u2r@synopsys.com>
 <Z5EbnXy-BRmgFpVh@smile.fi.intel.com>
 <20250128022134.3xuw263bet5akoa4@synopsys.com>
 <Z5kK7mkrcrPE43sw@smile.fi.intel.com>
In-Reply-To: <Z5kK7mkrcrPE43sw@smile.fi.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR12MB5990:EE_|DS7PR12MB9503:EE_
x-ms-office365-filtering-correlation-id: b47c75c3-e635-4ee7-8db6-08dd40cfaa22
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|7416014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?L2N3L3BzeGtqc3I3emh3OWFEZm5BWThQaFdLSkd2SFZvRU1BdFAwMmJuOVYz?=
 =?utf-8?B?SWkvd1J3NUMzOXg0NmpWMERIZVA5dzdyeTdZSWRDdTFOdjVKS0JrMHpmUkNq?=
 =?utf-8?B?RlJObmhuUnkxL280MFJaUElyWDkwSWU5YkIwZG9kUHNSaHkwWmVwSVFCcE4r?=
 =?utf-8?B?TzVDTjB3RDRZT1p6d2J2ZHcvMGRUQ3JxQmxjY2N2Zmxoc0E2VFQxYnhXRW9t?=
 =?utf-8?B?d1VqVFIxQlhEYU9TdFA3eGFuRHBXa1N5aHRjRVB5MStYaFl1dWQvdmoxTW1G?=
 =?utf-8?B?bEZ1YzR1aDFDUkZTL1VmUmVKWU9zRWNLVy95ME51bUQxVUdBUk5xRnFFTnZ2?=
 =?utf-8?B?ZTZVMlFlSklyRE9tOUV1OEhSZHozaVhPOExEYXR4RnZUKzRlNTJMZWQ3a2tk?=
 =?utf-8?B?OGtvSTIzbnFPaWZIdzYxTGEyeHAxVkdTSVVwbVpRZzdrdWp4S2RnWXRYOFho?=
 =?utf-8?B?bzI5WnAwYWxsc0k3bkhaVlF2cVJnaEplQmpJcyt4UUc5MjdxYUdoT1l4TGs4?=
 =?utf-8?B?KzVRRUZxOWFaSWtRNllsZ0UzdjlGaWVCTWF6WEloajZSdmc3WUprc0RMSFpB?=
 =?utf-8?B?eUlEL3RUNVlhdld6dldGeU55QjlQb2xFLzJpQXM3RHJMTlYreDJJZzJJMG13?=
 =?utf-8?B?ZDhIYVZTNXlnTTBJa01iMGxvSzlEVG96NVBkaktSWUhESmd5V0xzQ2E0RWcw?=
 =?utf-8?B?RllBV0JyMjVXU0RCTE9NU1RsY1RsR1pUODZPa2tjVCtpMytDUkEzcGZMYVZK?=
 =?utf-8?B?YXdaM0ZkTmJVSlRxNXkweit1dzVERDNUazZMMXZ0cnVOQjJkZmhZL2FuSU9Q?=
 =?utf-8?B?eXdobXR6MHI3RmNIZVpWcVZaOGtVaWFvbUx0Z0ZZM21mVkZ3Z0tGQ0JsbVpt?=
 =?utf-8?B?SUw1cytPS0RuSmY3cGtrQmUxQllCMGZ1MXp1dlExUlBJZVdNV3BVQyt2ZWJD?=
 =?utf-8?B?S3R6RFVpYVM1UC9JVW9pSzIvZCtDanc0d3ZGdk9MUnlDSkJBVGc5d2tsVlc1?=
 =?utf-8?B?VjRZQStXZFdKWnUvdEswQ2pCckVQdkt5bFVTcml0NnVwbTBUL0NOUjMraU1E?=
 =?utf-8?B?MytDQXdXUlpKdlJjT1hEYmozUmliaTVhVDFnVkMwVEYzRkZ3Rk5rbGo5eWVk?=
 =?utf-8?B?TG00SkFDOUR4QzYxaTFOVU9qWXZNQXBjV1gxMmpHNisraGwzZU9kL2RXbE0w?=
 =?utf-8?B?WHgvNEhVYUZiUG5jdnNtSXJyOWdmcWFEaE1WWXRzQnB6N216cHNyazNiZUxK?=
 =?utf-8?B?VCswcVRmM2lTanl4NXRVY1ZHU1A2T2wySExnbU5rYzI1L2ZVbFpBSGhKYXhi?=
 =?utf-8?B?b1BhcnlZK1doYjVPeXh4MnltVXFnZlQ3QkhlMGtQcXdRT0ZzdFc4d0k0eU04?=
 =?utf-8?B?aUxiUlNxeGJRREpGamFuYW9uOCtEMG14OXB2Sm81NVJUdmYwT0M1VEtXK1J5?=
 =?utf-8?B?OXdjaXZHTERFVlpURk5lcVQ5QklWZXRnQlh0ZHhuTHU3cTBhMjRMWERVOW12?=
 =?utf-8?B?OGl0S1EwRUVNc3h5dGttNXF4VW5sY245VlpIRWE4VEx1SWVoMXZyVmpnUXBa?=
 =?utf-8?B?dzhGMWxIbjR4cks3aU95N1lOcWF0YU0rLzdFSzB4cDYrTHFmc2xQWHdHYUUr?=
 =?utf-8?B?MnI2UGJpNnR4RnNRMzNPdnUzZ2FTZklRSE15dHU0VmJRMzl1ckJveGJvQ2hQ?=
 =?utf-8?B?REZoR0ZnaS9tOWRYQ1I3KzRDVzBEU3dqUE8xRTZiWEM3SW9YYjZ5M3h4L3hK?=
 =?utf-8?B?MjlxZU1tTVkxMHE1bWRtRXp0ZVBtVkhReGN0ekIvMVJyZ0JETlhXS2JmWXho?=
 =?utf-8?B?K3BGL3lhQWY3dWlQaEJYN2x2NllUMlZFbFFkUjlObkVNSEYzTjBTc1NnNTB2?=
 =?utf-8?B?b08xWFFOMTBMdGYycDZOSnZ4UHZuWDRwSTBZZGcyalBpMjJDYlA0MXhCWExk?=
 =?utf-8?Q?sgsETjNqCgUHwP6mgql+j7mkd97qTj3P?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?QlhzZDFlRmdDQVlZSjBpSU41VkhPVkNEN29DRktiaUo5ZDROcmlTSXJFVHJo?=
 =?utf-8?B?YTVKZHQ1d2RYWlJYWExodmxaOGlJTlY2eS9qc3YwZTFKdDMyUDl0RjlNZDJ2?=
 =?utf-8?B?WUJZSDV4RW1JMGRNWnpZSEtsZ1RuaXcxZFU2a3ZibnBjM3MxR2xBUkNyTWVu?=
 =?utf-8?B?Zm4venJHZzVmaTRhSUFsa2tKY0VCV1R6U1FjTkR0ZjAwbk9OYkpQN0pQYmNH?=
 =?utf-8?B?UTMxcnc3U3ZIUFMyZEdqNjhScUhCOFpTaWlRbks5d1JsUmxON3ZvbHJabXhV?=
 =?utf-8?B?R0hMMER4NXlSa3NuWUIyenYrY0FFNjhuaEoyY0FqOEdZVHZhSzdFVjQ2VWJE?=
 =?utf-8?B?QmtWcjR5Yyt6aG1XckM3MWRJajhCRnRDRWlxRUx0WThoeHNmVVZ5SFM5RGZW?=
 =?utf-8?B?SnZSb0M4ZTdXZ3FFTWE0dnE0RzkrMWFOc1p5cXNXSWZMZDVmRGlQakZJWDBE?=
 =?utf-8?B?eGh0YUtuTmxnM0lTa3kyWVltTjBOL2FDU21ZdWZ2bG1RMXl2NUVZeE9MVmxt?=
 =?utf-8?B?V05WQ3N4cWFKbFFzNWZFeFlNYmIxeXFaSkx6amlBSkJyN0xNOUEzb1lKWGNy?=
 =?utf-8?B?aUZGODRoMWFxZzV5V2RNc2RLMGxWdE94dXZVZTNXV05HZms4ZHBIeGtBQjNt?=
 =?utf-8?B?S1pnNG0xRHlvMHhoR0ZLbkpEekRWQXdKdTFCMUF5enp3MU9IclZ4RTZyTXZs?=
 =?utf-8?B?cFpXMVJmQWMyZEEwRnF6YXdqdVFINE5qS1FabkFpS0NxK05yRUVFdGZiTmNN?=
 =?utf-8?B?a3dEVkljUVArcEQ2ak5XWGdlZkxPOUgrYU1xcHB2K2FYZG1IZkp0WkNkM2Jz?=
 =?utf-8?B?N21nYkcxNWpoNHlBclBpa0ZqMHQzM2diT3gwajBhNjhsT1dGaldMVUR3NmhE?=
 =?utf-8?B?eW9XNDNPbW9QTmwySmtCd0pFaDI4L3pzVVJES2Q5dUR4ei90Wk8ySzMvTVBH?=
 =?utf-8?B?cFArMVI0ak1ZWG1aUFNvRklOcER6elNZSlQ3MHA2ejNwaVpRTDRkSUZkZGpG?=
 =?utf-8?B?SXQrZXBjdDljaEF0dmxMVUNpN0RCTjdTTFJvc1hSOXN4WDVzQlQ1NW1hdnhw?=
 =?utf-8?B?ZXpjSy82VS85Y1ZaY251Tnk4UXNCN0JIME1Nc25qczB3TGk3K2kyOGhMOGlp?=
 =?utf-8?B?QVFoVi9hNFdNU1dKRFZUTjdwZnd1ZkpiSDU1SEl6eHBSYVB0cm9MM2lqQnRC?=
 =?utf-8?B?VzVNRk16QzIzS3UvTm5VWDFYRzBjYVh6YUVoRmI3NVRNM0ZCc0lFL3ZBSlQ2?=
 =?utf-8?B?Z1ZtOWRnZlUrNEJjMFpwc2ZqWlFMVFZpSGgzRGo2Z3o5MWdYbW0zMENsazNS?=
 =?utf-8?B?WjRUOER3RzNGQSs5Nnl5NzdTQzllbXA4R2RIZWhiRzFNTU5XTkc3OE01WllY?=
 =?utf-8?B?SlNWdUpla3FadEtUSTJ2elNqR2twcWRJRHg2VjZQVmJHeThldmhnUUk4a2V0?=
 =?utf-8?B?Q3FwcWFlK3JWQ1RDOC9OcllZeFUvOGxUUm0zZ2lCYURMV2wzcUlzU3Z4YUpW?=
 =?utf-8?B?dE8zd0pxcHhmUmxJbWd2c3hpdjJuRU5ZVnRjUjhLczdsOEIycUF2RnlOcGd6?=
 =?utf-8?B?ZXhoOE8za3laMzg4SUwwQWZlM1BFMGFFKzlSWGI3Q3VVelRTd0ZIUEFOS0wx?=
 =?utf-8?B?YmhsMXY5eXEvL0Z4RUxReUlQcXZTUHNrNzUyaWFkOXNqczhkOGtNYm5PRUZT?=
 =?utf-8?B?Y04rRGxGb2RkbkJ0TE4xQmRPUUpzNG1xMWVlbnBHd2ZzaHY0cGhobnpESDdP?=
 =?utf-8?B?ZXdXMU5FNDdDOFVPblRPS21wdTNxWExGVDlmc1p4MlJuZFdUaXNtVzZXNUxT?=
 =?utf-8?B?ZmFyN200ODdCU0loZkpLbHF0dmV2OG44UGRoRUpzMDJtby9ZSVdBckFaUnJX?=
 =?utf-8?B?N1l0ZTBkY0hVcFpqNHYvUGdKS2ZKRzdsSTd6ZE83ZFAvTXRQTnBOUWtJVXFU?=
 =?utf-8?B?VkVRRUE0YUtLQ0dyVjFiNmtFNnVDNTlxOGd4WlRCaGdNZTBGSHJuOW1RMUZ6?=
 =?utf-8?B?M0laUXhyZzhzYWtNYklvT3V1Z0xTWG82eDZhekw1amNDUG4rWTRhNUdNMGdB?=
 =?utf-8?B?d29jUFY2aGZEZnF4RHE4Vlo4eWpMbnNxQzRwY0ZGMTA3UTZvdnJScVB4ek0r?=
 =?utf-8?Q?0IX4j/qGwfhv8gwkKg+LSKe/4?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <A9CD86E10A31DF40A70C494959C2551A@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	PhXCNC7q0Tam4+1yy7P+bJLB4dTNJabDp1s8sRABlbVl+EYPrM2w2tX1zeefeVOuujYpn6hhzVXMpZ3DCRyvUVN2ltkvTMKvpBOLT8GIN62TuqzBuuyYh0+u8PjddQeVTfnvWPCQWxMKic+CYlo8+wt5ftgpxmq5ETDbaRLMSw9nrJxDiRZVBGqAWfaeAp06ZNYj2CUB4PSe+fVxR3w5P5sxWXi38b/QZ8F6kywnjc+qFHdolQNu6OjJMHRvoGBHS9w3eA0aE2DA53rIaUYNay7pakJ2TBoNn6pTvKxbCx563nJWBh3Umc12opQ9/RamxFORXI/t3VS2Tl4Jc7QEMnZ669xifQLol/BMuKApncqXdheA/ADgg0list0eqpzpMaG9D3Thly7Y4t6wVeUUXoWGBcuNVGK3VRl55NLMop0/SI/3XvdSmvmcI4xbEO9f2pjLPLOcYQNx/yo0omifA5/jlS5og52kMhviWnxDSsZg24LWiA6qhCVCvfdMQPO90k7FMMzyutfX63WHfshMllWJUgWd9TATn55F/5KShlPz41TL31IiXPwuDCVA9JkJC4VT5v4or2blmxCFiZPAbu7vQfju5D/QtM+bGrBfkXJP3cPQ/SqUoc0hiDmRd9Fu/U3caxZdW5FPQV2O5BI4uA==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b47c75c3-e635-4ee7-8db6-08dd40cfaa22
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jan 2025 01:44:41.3236
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: P77pGdNcGU39UPbGrlzn8FVmFmGf7DpI4aQGHEglqLRLOhUrHlo5ypSaVDCUDZaIz2rdqw7nc95PWC94WOGCQw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB9503
X-Authority-Analysis: v=2.4 cv=Ros/LDmK c=1 sm=1 tr=0 ts=679ada05 cx=c_pps a=t4gDRyhI9k+KZ5gXRQysFQ==:117 a=t4gDRyhI9k+KZ5gXRQysFQ==:17 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdSt8ZQiCzkA:10 a=nEwiWwFL_bsA:10 a=qPHU084jO2kA:10 a=MAtc3tMeGz7eesMHI6oA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: z33oQCjJEXzmDzMpnMVzuIqLjd6zndS0
X-Proofpoint-ORIG-GUID: z33oQCjJEXzmDzMpnMVzuIqLjd6zndS0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-30_01,2025-01-29_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 suspectscore=0 priorityscore=1501 bulkscore=0 clxscore=1015 adultscore=0
 lowpriorityscore=0 mlxscore=0 phishscore=0 spamscore=0 malwarescore=0
 mlxlogscore=790 impostorscore=0 classifier=spam authscore=0 adjust=0
 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2501300012

T24gVHVlLCBKYW4gMjgsIDIwMjUsIEFuZHkgU2hldmNoZW5rbyB3cm90ZToNCj4gT24gVHVlLCBK
YW4gMjgsIDIwMjUgYXQgMDI6MjE6NDBBTSArMDAwMCwgVGhpbmggTmd1eWVuIHdyb3RlOg0KPiA+
IA0KPiA+IElmIHlvdSBwcmVmZXIgdG8ga2VlcCB0aGUgc25pcHBldCBvZiB5b3VyIHZlbmRvciBz
cGVjaWZpY2F0aW9uIGludGFjdCwNCj4gPiB3ZSBjYW4gaW5zdGVhZCBkb2N1bWVudCB0aGlzIGZ1
bGx5IGluIHRoZSBjb21taXQgbWVzc2FnZSBhbmQgbm90ZSB0aGUNCj4gPiBFQkMgZmVhdHVyZS4g
UmVtb3ZlIHRoZXNlIGNvbW1lbnRzIGhlcmUuDQo+IA0KPiBJIHByZWZlciB0byBoYXZlIGEgY29t
bWVudCB0byBleHBsYWluIG1hZ2ljIG51bWJlcnMuIEkganVzdCB3YW50IGl0IHRvIGJlDQo+IGFz
IGNsb3NlciBhcyBwb3NzaWJsZSB0byB0aGUgc3BlY2lmaWNhdGlvbiB3b3JkaW5nLg0KPiANCg0K
T2suIFRoYXQncyBmaW5lLg0KDQpCUiwNClRoaW5o
