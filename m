Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5F961FF7B3;
	Mon, 19 May 2025 23:38:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.158.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747697927; cv=fail; b=ivqTYV/xomIwtRwgw6PoVgnfavhvmwU4LvnKnJf4/4zrRx4oGdWs6z00Vzwg7qUHsR2FPfr4YKQWVAVj1q6meXwlR5IAmAY3x/CSSopm1hWGjCmc4UdYLWs/lkylyLMwUYXoaOd4dO4dXI0qpkmeXw+jNErWp833C7bv3RN3E6U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747697927; c=relaxed/simple;
	bh=rZ/iZEwnnKfEZwPMqtY63RJbQR4FCeUkvb7g/BzHn5g=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=SugTpX1fsK7Ir0g0stCXp0LXBiX2QuUN1a6RuIuTr1y0eaSe2LoQ/FSsH8X7v1TRSj04Swno/YGsUn7K786Kh0ric2GivzEstxjj0kv9fkNvY6+8epK3YglAsKTakyqFrsjk8TguLPWVONzr+X2RHUdEiu6eSt60MpD64I7vJRM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=li86WzU1; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=kx+SoL0/; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=kYeIKukm reason="signature verification failed"; arc=fail smtp.client-ip=148.163.158.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="li86WzU1";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="kx+SoL0/";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="kYeIKukm"
Received: from pps.filterd (m0297265.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54JNVbpg009698;
	Mon, 19 May 2025 16:38:03 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=rZ/iZEwnnKfEZwPMqtY63RJbQR4FCeUkvb7g/BzHn5g=; b=
	li86WzU1QGVFoQIwoPeOmVTISMAIu8kmG7XHTNgYvquI/9peay7Uq+gZjZh2FrC0
	FqcWjnd58hiboE78aO0OvHQbecZGZMYcpbNy13qwCD5JEiFTBGXDXn8mVLQQg1Lx
	9610ciDSNYKy/Gu7qwu703cH/a0q38iTUL4cgzto1jqNfSyr9Hx/yOeLyvH2pvYH
	bwXhFqQH7SBseUtzmAo9o+lV7+61UPM0gqxRKR+3eddKeGpsVjQwtZXbLu+jsXHM
	bvOSW/kJhyk36VJsWQqXVyQsgum/JPUs6X75tp/HgnkkH9//ikXxui5og28AhYaj
	nbPF7OMhqK9DWCSNsX2Rxw==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 46pscu0g4b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 19 May 2025 16:38:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1747697882; bh=rZ/iZEwnnKfEZwPMqtY63RJbQR4FCeUkvb7g/BzHn5g=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=kx+SoL0/JZXe4DuOdKtTdgvKG7RoTjGnMS3UbnkcaqPRBGAJIJp9SGpOKH5SwcicA
	 QyDF73zb9dmuaNZQ6Y0nuwLBeU1et9I294WCzaJ2xWuw4NBKsZM+ICwCLO5PzOlOAq
	 oqFx/+Y/SSuZzBMeew1WU0I8BKXrXRd4ADfOvpzo0VH/ewTHJjjipJYpNPKl2WEIOD
	 Y1ONhDkC9Z4sYOoyj3BUH4GG/YBN2Db5tqQsP1EzHNBMbh4EVt0YS0ND59br5JSiQn
	 7o04k0DvVOsmbC0TikCOszpPWEbnNkct+8TRVNqaVoP7DPCpadZVJ31Owp+R0yBr3b
	 2f/Fgjk6jGCew==
Received: from mailhost.synopsys.com (sv2-mailhost2.synopsys.com [10.205.2.134])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 260A24013E;
	Mon, 19 May 2025 23:37:50 +0000 (UTC)
Received: from o365relay-in.synopsys.com (sv2-o365relay3.synopsys.com [10.202.1.139])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id 07974A00A0;
	Mon, 19 May 2025 23:37:48 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=kYeIKukm;
	dkim-atps=neutral
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2175.outbound.protection.outlook.com [104.47.58.175])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 63BC74013C;
	Mon, 19 May 2025 23:37:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aE3sul+enBJq8duVhHdW5iuNUCOhiEeKsWFG7f6odHSJwz84xKX3DBQsuwxuHsBrTsbLWdDtBPYiGkHz6VbIeAUQrGnHz1Lz3Or92ncXPjOKY6mNXCDa8BRdfamxx0PskjC8GG9OlNqcfBWJFuwWBPInmkJRDPabQczd+cld9St2Bhwp0yQmWd/+Q7t83RXFJcJ+7tFaLUos0rBJC/9ZdGBgwrjKQDugAu4jZMGeXdfWS9WFyo4S8DyzMxFSGJgFZnN159hIJiSbRR4VLqzRSbtu+2kiVI3dq+g/D51FItVIKqY+Noga4vrGqcsnJz3chYkWjcs4Y/RC9bUxxgh2lQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rZ/iZEwnnKfEZwPMqtY63RJbQR4FCeUkvb7g/BzHn5g=;
 b=mYgagjckCai6l6OslxP8jAp9kLZWY7RieRU6wWNkuk9jpkwKpIwdopX7EH2eexsKlydcijWaqnmCgog+ES7uA4l96pmAnDIBlmqsJm7llxwvxyFi0QDMKfSb0InY6WP5vynlxTRe3TFPo90sIXWUh+tMUNIIJmORYem51uBVs9nhp+R5f+f1/XIeQzse3yOPgv0p3GNEBEj2YjOd44SJkY+1N3SCYPE4xtmh8DuRZqHhb2+NzmJhS8GFKOBDqkelu0dw27f1xcuU8SRA5OKPkGBdOTVLvdgROIPJV2B5LIiDAjY2K0k68iFLN91yQkWX31UApODlnyGxhz/B+Lydxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rZ/iZEwnnKfEZwPMqtY63RJbQR4FCeUkvb7g/BzHn5g=;
 b=kYeIKukmR0GHYSGGmSU4tmY4u0/pc+Eo5To1CzfwabLzjmxuLR+6EBulA6YwjS9xlvGm8zjDRV8o1USCn+034mCsxzqbHOgLYwDmWatSwGJR39IVUMkHe118LRyDFmPwP+w6Co7Eu2Mu93T8OH2u2/3fd3eNm4XpHgQmA/3ngB8=
Received: from LV2PR12MB5990.namprd12.prod.outlook.com (2603:10b6:408:170::16)
 by CH3PR12MB7737.namprd12.prod.outlook.com (2603:10b6:610:14d::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.30; Mon, 19 May
 2025 23:37:36 +0000
Received: from LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8]) by LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8%6]) with mapi id 15.20.8746.030; Mon, 19 May 2025
 23:37:35 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Ze Huang <huangze@whut.edu.cn>
CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
        Alexandre Ghiti <alex@ghiti.fr>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
        "spacemit@lists.linux.dev" <spacemit@lists.linux.dev>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 2/3] usb: dwc3: add common driver to support flattened
 DT
Thread-Topic: [PATCH v3 2/3] usb: dwc3: add common driver to support flattened
 DT
Thread-Index: AQHbx2C7z9nJwwzpmUy6whApTroGG7Pany+A
Date: Mon, 19 May 2025 23:37:35 +0000
Message-ID: <20250519233723.zky3t6ynchg2a32z@synopsys.com>
References: <20250518-b4-k1-dwc3-v3-v3-0-7609c8baa2a6@whut.edu.cn>
 <20250518-b4-k1-dwc3-v3-v3-2-7609c8baa2a6@whut.edu.cn>
In-Reply-To: <20250518-b4-k1-dwc3-v3-v3-2-7609c8baa2a6@whut.edu.cn>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR12MB5990:EE_|CH3PR12MB7737:EE_
x-ms-office365-filtering-correlation-id: af68754a-0a49-469a-de95-08dd972e2267
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|7416014|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?cWFRTGs3cnVlUmRGUlJ3TjA1SmtiVEtOK2tvTlJqdS8zSUI4QWk0QSt1ZU40?=
 =?utf-8?B?ZFhKOHpNcjBqQUoySStvakVIbFNUMHdCTnFybFgwNnY3dWVVUzdhNkQ2WFQ0?=
 =?utf-8?B?bytJL0tkK0NIdC9GR0xqdVRtKzdmczdEOHdWQm5pMFEzb21VUkphK2JkaEho?=
 =?utf-8?B?ZU9wdXhMblM5bHBKZ2RwYTk3SnpzS3Jnc1FmVmoxRVJFeWUvaStYMXJXbHhq?=
 =?utf-8?B?TDgxUlVxUjVodzdTYXhWOFIvZTdTdkdMYVRUUmFLNkVyMUNUMkYxZm91dXpX?=
 =?utf-8?B?cjJQTFJjdzNNVlhVcGoxbHBVUXU1NEExRDBhQWpkM1dDNFU4QTlyVzFkR1ZY?=
 =?utf-8?B?OGoyQURqZy8rM21qVUZRU1NKZ2RUQUtNTWVWWFlJblV4Ti9DODRCMnlTY0Vz?=
 =?utf-8?B?V1FtaVJlZlNjQXdzQ3JnVERweWZjUmZvcitwcnN3QlhmdVF3S01raHgvcGZU?=
 =?utf-8?B?Y0svalJ2RytxcUpJamQzRkp3eFZoMDhzOFc4SHFnNUlpUmRidDlKQzlMY1VK?=
 =?utf-8?B?WUlwL0FKY3lhQVJob0VyU05yN1B4R2ZJUkRPdVN4b2lNaFNUbHVnblFUT2Vr?=
 =?utf-8?B?WGVlckxWWE5acVVoelV2WmNWZXlnSU0yZE8zTWNLMjZFUWZMOTJkRTdMMTNX?=
 =?utf-8?B?MFoxOWRKYm5mdVFNN1psaENyRjdKa1R2TlBMTW5nT1JFNW1GeUtBSC9VWFlM?=
 =?utf-8?B?dnIzb2dneWdNNk9MRUJXcWlheStrbHFXMDJTWFlMUU5ROTkvUzFPaG9nYzBo?=
 =?utf-8?B?TVdRU2o2REcvRmZabHlPdXRhOEFFYS9sT3BoeHNiczdycS9YRUlnQ2hXb05E?=
 =?utf-8?B?d0JIZmM4WTdJZ1BNeVVCUHVwVHI4eGIyV0hQWnpVMTV5TjlDY0JvdVBoTHVW?=
 =?utf-8?B?ZGpIVE91SFVEcFhRdUlNMnFRUHEvczBOM0hPaUxzVE5XNmtwRkZMZUtMQ2px?=
 =?utf-8?B?M2ZpM0oxdUdZM2g3TytKQ2RGTmVrRkg3SGhtaDFVQzVjcVZTOTlhZyt3ek44?=
 =?utf-8?B?dG9ZS1FEcDVjMEg1MEJ5c2NnbGNUbkRVajJpVmhNQjd2RHdneURPdnljQllh?=
 =?utf-8?B?L2FXMklXdlpaOFp6WGFTU2FaZlBUNG53WHZWMzY4WWlhMlNYaDlHOU11ZkNy?=
 =?utf-8?B?RlVlUFdwQzlBZ21WVG15aHhNcW5HeXJvUWNXL0xVc3VTNVRMZTVGTWkzeUw4?=
 =?utf-8?B?RjhLcVo2SW9pZFdreHZLNnpzV1BwSU1qZThrT0lIemlUZFRVSVlGd0Y1Z3hx?=
 =?utf-8?B?MlpRbHF6R2s5LzJKZWE1S3JjWUIyVDYrMlVQck94VXY0eGhyUEczL1FwSXBr?=
 =?utf-8?B?aTlkZHFNZjZzdFdFNzZBUENVRFVlVDdaL1J4WW1sNGhMTVZBRFcvaHRNc0xZ?=
 =?utf-8?B?Z2ltczhnTzUzVUZtU0ZtZW1rbEJUSFdNQlp4M2t5bHpLcEtYWWIzRUNNbTNx?=
 =?utf-8?B?TEVqaFBkSFZ5SG9HTWt6S0VEN2IweW0wdDF4V0VNWGNzSi8xQjhqWk1GV3Ju?=
 =?utf-8?B?eEZrd3J0Y3hlVTFubk5QNjU2bGQ1RW9OV2tKang4R2xPWWNtajBXUTVPaFhZ?=
 =?utf-8?B?VjErL3ZCbjFDT1puMjlISkw1Y0pCUzhxTlRjbnlMN01GVG5LaXRlall4UlBG?=
 =?utf-8?B?aCs2NktIZGJBWTg0aU5aeDUzYzVIR1V5WDBNdDdjSyt0NitlRFFRbXN4OVpE?=
 =?utf-8?B?Tm5jcTdsUnoxWWE5aDVWMkxkYWFieTR3OStOUXg2Z3dhOTlTU0IrVWd3V0po?=
 =?utf-8?B?Vy9UUm9XdG14dGlCUE1ZZlNvVGdrVEYvQ2w0VnMwL0o2Uk1DVGs1bDR0dnpJ?=
 =?utf-8?B?TFVOMUFHNThyRVJGc3lrL1pFNzBIcitPUjlxRG5ZbDFqeGlUdDRhQWhES2dH?=
 =?utf-8?B?UitkYW5ncDhjM2VPaEc4bW5aaktKM2RZSXorbkU3ZEpzeHV5MjAxbzk2QmRt?=
 =?utf-8?B?VHhtVUxxa3Fvd2xJMk43UHJHbW1rVWdEWWRURk1aeVlRekhSSXFOZGIyU0sw?=
 =?utf-8?Q?DEPi/biB89ME0NJcA9aPS1uv3TkCp4=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?TkUyMmdRTEVQTXlTTzRrMlRscFBPZXFWVmM5SHFTUk5zV090b0FGYjVUZlI5?=
 =?utf-8?B?ekF5QzhZSnc3K0FaZUZMTXRSMFA5enJ5YkVtS0ZuTGxhaXExVXlZVGJ5VDhL?=
 =?utf-8?B?ODhNMERvT1pPc2VQNExNcjdxYlZzNm9URGxJRy8weHlYeDBrVkROS1ptZEFq?=
 =?utf-8?B?ZmZCckJ4eTFSSlVKMDM5ZG5MTkxVUGtwOXR4ck1RMjBpM3dqTDZ5ZjNvMTVK?=
 =?utf-8?B?YWpSd3VhdlI3YkJIbHJ4SUkvR09LYUpEWEpCLytvUmJhakp0ZGVjMWw0bFE2?=
 =?utf-8?B?czRMUTRUZWtXbTBEVnpnY3o5bm0zYmxqYXNZaHd4NVRaaWxUT25NcWltWTlP?=
 =?utf-8?B?Q0E1dCtaeTJ3clBTTVhlV2xkbmppdGQzWGFyYUhlSTE3bEZ1Ulh3b0E5aXhZ?=
 =?utf-8?B?WjFLQzZDNlJyUFBLSklNWCtLTkEvTzRHbjg5QnVENmVBK0s3bkRGV1dpOS81?=
 =?utf-8?B?NnRZMUcvRkRXSVBOaGFQaE1Nb0o4RWUxa0tEaStKWEprRE9PRjVaWjFrbjFx?=
 =?utf-8?B?UWNiaUtHd3NQbFByeUpVbUhycjByZjd1eHZVdlpLQkF3TEZ1ZUowVHM1YklJ?=
 =?utf-8?B?UTdDd0phb3JOTk52eE9kQWNaanYrTWh5Rk1nV0tYRDljY0hJMzBvQmoyTFFi?=
 =?utf-8?B?R0JCcW5aMEFUSTZaRm5JZWxkM1YyUEpDMU9ZSTEyOE40alVPL2FRZ1EyWHRP?=
 =?utf-8?B?LzB4dHpEbTljOHRZVkUyRE5JaTFCU1hySlh3VTJSQWNaMTV4cXErLzVQWkhL?=
 =?utf-8?B?SWFXVnpNVXg5OWk0N3NpSXRPbDhrb0tQR2h1R2puRTFXSzhYcXhyNEZCRkZN?=
 =?utf-8?B?bjRLa2l3WWpwWExYRldJbWNpdS9neHk3ZzVzaHV0NnFXUGhodHRsZmFKMVE2?=
 =?utf-8?B?NUFvdHRFOGNpVjNSdUR5eFI1SVQ5TnBKeERmZ2x3WW9FU1YyWThiMFF5Y3lN?=
 =?utf-8?B?SGRSbUVFMUVvMnhFV0xUNHdCSlJGQUw4RExSTU9ncnB5ZExCT3hmemFtT00v?=
 =?utf-8?B?VGIydU1UaHQ5RURlMUpQaE9hYURDcGp0eE9RSDc2azZQK3NIZWNzU0lMZXNW?=
 =?utf-8?B?elF5cXg4TDRTSCtVU1ZTeHlNejVaaEFubjdJTjRPYnYxc1BmYXhVdmFabVRD?=
 =?utf-8?B?OUdJUFBFdWRydWFKTEpmTVZoM2lMOUtURHB5emZVU0ZDWjFOOHNuZlpSTVRI?=
 =?utf-8?B?eVM0UEtXLzBidnB3UXp3OW1GakhhTDlhVTNmSHl5eTJjZFlVN2tqNEtkM2tB?=
 =?utf-8?B?TTU0SnBUSktvRXFaK1JZRXNUcmM4bXUxOGZEcDNUaVdCeGFzdFl6cHpsa2t0?=
 =?utf-8?B?VVFTRHdmMjhacjhNQUZKbStFcGZzYTlxaWlGZXBkZHdGM0JhQk5pUlJVZ3Zt?=
 =?utf-8?B?VVNyZ01FNjdnMURTUEVNVUR2UmxKREFtVFN4aUVmWW1zVEMxc01FQTArMWNJ?=
 =?utf-8?B?cHV2QWZ0WUhWWDBxR3FCYmQyVENQS3RZUWV1Ym1MelliWldzRytQTHdvazNX?=
 =?utf-8?B?c283cS9oT1JmWUh1OHBYemZqYkt5Z1pBc1NBVGtmYkNwalluSS9VYTNha3BS?=
 =?utf-8?B?SmdZUFNSUk9CMVI5TVE5MWwrWUI1MmNhb2JWSFhDajdGMmFjWU5QOU9iOTNU?=
 =?utf-8?B?czBxWmhZaE5BNGYwL2gyYVhYemxNUDgyc0l4NW9KMStTM0U5My94VW5YTnhu?=
 =?utf-8?B?d21ReUpiWGZKZVJxWDhhVmI3c2pjQUhoaXdFeHlqcFI2M0FuRWVZTGxPTnJ1?=
 =?utf-8?B?bEZwRytlVTJTSjkzMkJOdU0xVm1KeXl5VjRYaFdOKzViRUJnYTFSd0YrL1ZD?=
 =?utf-8?B?aERpSlVqM2kvblIzajMvTXR0cnpRQWw3VGhKaURsa0V4STZZTmROcTRhVGtp?=
 =?utf-8?B?a0w0NDBJQ28rVWNIWkJZYjliZkJhZzBOSEIyOEVIZE9wc2JrMzFBZVljNkQ4?=
 =?utf-8?B?dm0rNFhXT3p2dVFDUU9PNlkyZzh0MTJtZFA3MVRmQ2JSUkhaVGNsdCtyalBZ?=
 =?utf-8?B?MURxL3NWMkRTSFFMU1pyR2RtYmEzUzZ6YXVKK1VuVzNkYUMvWkZsTkZvdFgx?=
 =?utf-8?B?eVQxZkhOTlpONWlNN0ZsOWdqWE1qdlVnT1EzTFFWV0srVGZIeW8yRjBod1lU?=
 =?utf-8?Q?JBjGwABO2FrITPUFFTz4Hgwmf?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <2326DFFDBB449F4FA157E986B17939EB@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	bex3DeLvIxRsnbRrMYt1OkmnSJbVydd7qXqRyCwleoUEJVal2K/QOgEO5fyiKCrnpEgCt+KkLSRkaDu0EBcWbG4NDQPNWIfO5HrqzV1e6p9UUiZG5JM985lcjKXdywIb4pNgWqwDtmhue478QKJN+pvcxxRO7FohcajnrAkrW9Uc8/wC/wlwczyYs+FdmtCs0CryfHwocmdSJH4faHKXKuKZJAv2nuKhajjbp99t4ybkT0fV18L7TUfRd1wpeZlvefYR5/onh2j8Y0fZywUW115kWy82PCSydJVzoSz3jDEu72rCEvZ0Evm954g+yL4fzC5V5+APRN4HGR1Nhd62n7nzNADBO4TwtVTeLhAAW8dyaZlNV2twaw7gZc16tJOxDCPanH+91DKLbR7lCBsa19fUuaO3GESodIjxlEtpj3In3q/TIs/665wM1WAlr5sKgH0OttAKLMXwSKuC6v2o/VqS9JbyEx8b/VQekXJSeEHWZq+upgU0+baUHuIjI9lR2eqsDiUfQ4QrXxalFFzswMvkGxjfSAAkIuGEhXKT5+7wyFhYaFANk2Rht810Q3VJ8Wqstai1eXNHCitN8FaKUv5WpqBoif91KfBUBUJEzGwPGO9HtJ1ahk59Bz7TvFtLY1LmQ6N/ScbCJ1gkg9MEgw==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: af68754a-0a49-469a-de95-08dd972e2267
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 May 2025 23:37:35.7384
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DEkvDaeLkP4O6GFMEaKVrnJbCp4SQt5071fY5TjPAJvqbSok7yTOvC1faOu46fdwd7ovJvEWt5bxqw5L27KMQA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7737
X-Proofpoint-ORIG-GUID: 6SW-hSpu1vEALs3jsQlQT0mAwxgNTyAi
X-Proofpoint-GUID: 6SW-hSpu1vEALs3jsQlQT0mAwxgNTyAi
X-Authority-Analysis: v=2.4 cv=EqvSrTcA c=1 sm=1 tr=0 ts=682bc0da cx=c_pps
 a=8EbXvwLXkpGsT4ql/pYRAw==:117 a=8EbXvwLXkpGsT4ql/pYRAw==:17
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=qPHU084jO2kA:10 a=_vetTfaIHP0e6m5HPtYA:9
 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE5MDIyMCBTYWx0ZWRfX86sfo1xXxBTe
 cx1b1x9nH8VCN+McGssQqXWqihx+eQdqlFIafFzGvMnm+oG2k1Ud8huQxxxdiClAVcjWLbeRdLt
 lfNYIbnK6NG4Mk376hByNzf66/WNa8AvPQM0/wxfxoImarLasneKWXvHT68riG0SQTKQ6SEvQ2L
 BO2nPoaETVt/yE0DkeNlWHdTEYznagCnIT+MkMX+p202ga6jiFOY/1Xxxev/VWe/mC7sNpP/vZk
 GWlsXZMqt1HTCJOm0QRTzdmZ7Va5AWOp+JdmQubu3mUJJZWJMsuTwsYChMwkkar3MaGVjK4fNSU
 HkeY23VOvW53lZgIeR19OKy4DE9Oons8WdYRPyOOi6U8RN5TGyUA6lOZq9lRj1mfQ+8OvQDsUXb
 ZqvwyA+RkPwxllBPFnGX5SZMp0+wYwHAB99llfHUrCwnga2GNPFWP15hZSQEtTns8GeoYFbX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-19_09,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0 adultscore=0 malwarescore=0 spamscore=0
 clxscore=1015 suspectscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999
 priorityscore=1501 lowpriorityscore=0 phishscore=0 bulkscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2505070000 definitions=main-2505190220

T24gU3VuLCBNYXkgMTgsIDIwMjUsIFplIEh1YW5nIHdyb3RlOg0KPiBUbyBzdXBwb3J0IGZsYXR0
ZW5lZCBkd2MzIGR0IG1vZGVsIGFuZCBkcm9wIHRoZSBnbHVlIGxheWVyLCBpbnRyb2R1Y2UgdGhl
DQo+IGBkd2MzLWNvbW1vbmAgZHJpdmVyLiBUaGlzIGVuYWJsZXMgZGlyZWN0IGJpbmRpbmcgb2Yg
dGhlIERXQzMgY29yZSBkcml2ZXINCj4gYW5kIG9mZmVycyBhbiBhbHRlcm5hdGl2ZSB0byB0aGUg
ZXhpc3RpbmcgZ2x1ZSBkcml2ZXIgYGR3YzMtb2Ytc2ltcGxlYC4NCj4gDQo+IFNpZ25lZC1vZmYt
Ynk6IFplIEh1YW5nIDxodWFuZ3plQHdodXQuZWR1LmNuPg0KPiAtLS0NCj4gIGRyaXZlcnMvdXNi
L2R3YzMvS2NvbmZpZyAgICAgICB8ICAgOSArKw0KPiAgZHJpdmVycy91c2IvZHdjMy9NYWtlZmls
ZSAgICAgIHwgICAxICsNCj4gIGRyaXZlcnMvdXNiL2R3YzMvZHdjMy1jb21tb24uYyB8IDE5MSAr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKw0KDQpMZXQncyByZW5hbWUg
dGhlIGR3YzMtY29tbW9uIHRvIGR3YzMtZ2VuZXJpYy1wbGF0LiBJJ2QgYXNzb2NpYXRlDQoiY29t
bW9uIiB0byBjb21tb24gY29kZSB0aGF0IGV4aXN0cyBpbiBhbGwgZHJpdmVyczsgd2hlcmUgYXMg
dGhpcyBpcw0KbWFpbmx5IGZvciBnZW5lcmljIHBsYXRmb3JtIGRyaXZlci4NCg0KPiAgMyBmaWxl
cyBjaGFuZ2VkLCAyMDEgaW5zZXJ0aW9ucygrKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMv
dXNiL2R3YzMvS2NvbmZpZyBiL2RyaXZlcnMvdXNiL2R3YzMvS2NvbmZpZw0KPiBpbmRleCAzMTBk
MTgyZTEwYjUwYjI1M2Q3ZTVhNTE2NzQ4MDZlNmVjNDQyYTJhLi44NTJmOTRmOTA2ZTRmMzM5ZGNi
YjU2MmUxY2U3MDg0MDliYTc3Yjc2IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL3VzYi9kd2MzL0tj
b25maWcNCj4gKysrIGIvZHJpdmVycy91c2IvZHdjMy9LY29uZmlnDQo+IEBAIC0xMTgsNiArMTE4
LDE1IEBAIGNvbmZpZyBVU0JfRFdDM19PRl9TSU1QTEUNCj4gIAkgIEN1cnJlbnRseSBzdXBwb3J0
cyBYaWxpbnggYW5kIFF1YWxjb21tIERXQyBVU0IzIElQLg0KPiAgCSAgU2F5ICdZJyBvciAnTScg
aWYgeW91IGhhdmUgb25lIHN1Y2ggZGV2aWNlLg0KPiAgDQo+ICtjb25maWcgVVNCX0RXQzNfQ09N
TU9ODQoNCkxldCdzIHJlbmFtZSB0byBVU0JfRFdDM19HRU5FUklDX1BMQVQuIEkgd291bGQgZXhw
ZWN0IHRvIGFsc28gaGF2ZQ0KVVNCX0RXQzNfR0VORVJJQ19QQ0kgYXQgc29tZSBwb2ludCBpbiB0
aGUgZnV0dXJlLg0KDQpTaWRlIG5vdGU6IGZsYXR0ZW5lZCBkcml2ZXIgZm9yIFBDSSBkcml2ZXIg
d2lsbCBhbGxvdyB0aGUgZHdjMw0KaG9zdCBjb250cm9sbGVycyB0byB0YWtlIGFkdmFudGFnZSBv
ZiBNU0lYIGludGVycnVwdHMgZ29pbmcgdGhyb3VnaCB0aGUNCmR3YzMgY29kZSBwYXRoLg0KDQo+
ICsgICAgICAgdHJpc3RhdGUgIkRXQzMgUGxhdGZvcm0gY29tbW9uIERyaXZlciINCj4gKyAgICAg
ICBkZXBlbmRzIG9uIE9GICYmIENPTU1PTl9DTEsNCj4gKyAgICAgICBkZWZhdWx0IFVTQl9EV0Mz
DQo+ICsgICAgICAgaGVscA0KPiArICAgICAgICAgU3VwcG9ydCBVU0IzIGZ1bmN0aW9uYWxpdHkg
aW4gc2ltcGxlIFNvQyBpbnRlZ3JhdGlvbnMuDQo+ICsgICAgICAgICBDdXJyZW50bHkgc3VwcG9y
dHMgU3BhY2VtaVQgRFdDIFVTQjMgSVAuDQo+ICsgICAgICAgICBTYXkgJ1knIG9yICdNJyBpZiB5
b3UgaGF2ZSBvbmUgc3VjaCBkZXZpY2UuDQo+ICsNCj4gIGNvbmZpZyBVU0JfRFdDM19TVA0KPiAg
CXRyaXN0YXRlICJTVE1pY3JvZWxlY3Ryb25pY3MgUGxhdGZvcm1zIg0KPiAgCWRlcGVuZHMgb24g
KEFSQ0hfU1RJIHx8IENPTVBJTEVfVEVTVCkgJiYgT0YNCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMv
dXNiL2R3YzMvTWFrZWZpbGUgYi9kcml2ZXJzL3VzYi9kd2MzL01ha2VmaWxlDQo+IGluZGV4IDgz
MGU2YzllNWZlMDczYzFmNjYyY2UzNGI2YTRhMmRhMzRjNDA3YTIuLmFkMWIwNzA1YzRkNDY0ZjE5
ZTc5ZWQwYzNjNjNkOTQyNDQ2ZTQ3NDIgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvdXNiL2R3YzMv
TWFrZWZpbGUNCj4gKysrIGIvZHJpdmVycy91c2IvZHdjMy9NYWtlZmlsZQ0KPiBAQCAtNTcsMyAr
NTcsNCBAQCBvYmotJChDT05GSUdfVVNCX0RXQzNfSU1YOE1QKQkJKz0gZHdjMy1pbXg4bXAubw0K
PiAgb2JqLSQoQ09ORklHX1VTQl9EV0MzX1hJTElOWCkJCSs9IGR3YzMteGlsaW54Lm8NCj4gIG9i
ai0kKENPTkZJR19VU0JfRFdDM19PQ1RFT04pCQkrPSBkd2MzLW9jdGVvbi5vDQo+ICBvYmotJChD
T05GSUdfVVNCX0RXQzNfUlRLKQkJKz0gZHdjMy1ydGsubw0KPiArb2JqLSQoQ09ORklHX1VTQl9E
V0MzX0NPTU1PTikJCSs9IGR3YzMtY29tbW9uLm8NCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdXNi
L2R3YzMvZHdjMy1jb21tb24uYyBiL2RyaXZlcnMvdXNiL2R3YzMvZHdjMy1jb21tb24uYw0KPiBu
ZXcgZmlsZSBtb2RlIDEwMDY0NA0KPiBpbmRleCAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAw
MDAwMDAwMDAwMDAwLi5hZmQ5YTdiZWMxNGI2OGRmZDRmMjM1M2Q3MTQwNDE4ODI2NjBhMWE0DQo+
IC0tLSAvZGV2L251bGwNCj4gKysrIGIvZHJpdmVycy91c2IvZHdjMy9kd2MzLWNvbW1vbi5jDQo+
IEBAIC0wLDAgKzEsMTkxIEBADQo+ICsvLyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIu
MC1vbmx5DQo+ICsvKg0KPiArICogZHdjMy1jb21tb24uYyAtIERlc2lnbldhcmUgVVNCMyBjb21t
b24gZHJpdmVyDQo+ICsgKg0KPiArICogQ29weXJpZ2h0IChDKSAyMDI1IFplIEh1YW5nIDxodWFu
Z3plQHdodXQuZWR1LmNuPg0KPiArICoNCj4gKyAqIEluc3BpcmVkIGJ5IGR3YzMtcWNvbS5jIGFu
ZCBkd2MzLW9mLXNpbXBsZS5jDQo+ICsgKi8NCj4gKw0KPiArI2luY2x1ZGUgPGxpbnV4L2Nsay5o
Pg0KPiArI2luY2x1ZGUgPGxpbnV4L2RlbGF5Lmg+DQo+ICsjaW5jbHVkZSA8bGludXgvb2ZfcGxh
dGZvcm0uaD4NCj4gKyNpbmNsdWRlIDxsaW51eC9vZl9hZGRyZXNzLmg+DQo+ICsjaW5jbHVkZSA8
bGludXgvcGxhdGZvcm1fZGV2aWNlLmg+DQo+ICsjaW5jbHVkZSA8bGludXgvcmVzZXQuaD4NCj4g
KyNpbmNsdWRlICJnbHVlLmgiDQo+ICsNCj4gK3N0cnVjdCBkd2MzX2NvbW1vbiB7DQo+ICsJc3Ry
dWN0IGRldmljZQkJKmRldjsNCj4gKwlzdHJ1Y3QgZHdjMwkJZHdjOw0KPiArCXN0cnVjdCBjbGtf
YnVsa19kYXRhCSpjbGtzOw0KPiArCWludAkJCW51bV9jbG9ja3M7DQo+ICsJc3RydWN0IHJlc2V0
X2NvbnRyb2wJKnJlc2V0czsNCj4gK307DQo+ICsNCj4gK3N0YXRpYyBpbnQgZHdjM19jb21tb25f
cHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikNCj4gK3sNCj4gKwlzdHJ1Y3QgZHdj
M19wcm9iZV9kYXRhIHByb2JlX2RhdGEgPSB7fTsNCj4gKwlzdHJ1Y3QgZGV2aWNlICpkZXYgPSAm
cGRldi0+ZGV2Ow0KPiArCXN0cnVjdCBkd2MzX2NvbW1vbiAqZHdjM2M7DQo+ICsJc3RydWN0IHJl
c291cmNlICpyZXM7DQo+ICsJaW50IHJldDsNCj4gKw0KPiArCWR3YzNjID0gZGV2bV9remFsbG9j
KGRldiwgc2l6ZW9mKCpkd2MzYyksIEdGUF9LRVJORUwpOw0KPiArCWlmICghZHdjM2MpDQo+ICsJ
CXJldHVybiAtRU5PTUVNOw0KPiArDQo+ICsJZHdjM2MtPmRldiA9IGRldjsNCj4gKw0KPiArCXBs
YXRmb3JtX3NldF9kcnZkYXRhKHBkZXYsIGR3YzNjKTsNCj4gKw0KPiArCXJlcyA9IHBsYXRmb3Jt
X2dldF9yZXNvdXJjZShwZGV2LCBJT1JFU09VUkNFX01FTSwgMCk7DQo+ICsJaWYgKCFyZXMpIHsN
Cj4gKwkJZGV2X2VycigmcGRldi0+ZGV2LCAibWlzc2luZyBtZW1vcnkgcmVzb3VyY2VcbiIpOw0K
PiArCQlyZXR1cm4gLUVOT0RFVjsNCj4gKwl9DQo+ICsNCj4gKwlkd2MzYy0+cmVzZXRzID0gb2Zf
cmVzZXRfY29udHJvbF9hcnJheV9nZXRfb3B0aW9uYWxfZXhjbHVzaXZlKGRldi0+b2Zfbm9kZSk7
DQo+ICsJaWYgKElTX0VSUihkd2MzYy0+cmVzZXRzKSkNCj4gKwkJcmV0dXJuIGRldl9lcnJfcHJv
YmUoZGV2LCBQVFJfRVJSKGR3YzNjLT5yZXNldHMpLCAiZmFpbGVkIHRvIGdldCByZXNldFxuIik7
DQo+ICsNCj4gKwlyZXQgPSByZXNldF9jb250cm9sX2Fzc2VydChkd2MzYy0+cmVzZXRzKTsNCj4g
KwlpZiAocmV0KQ0KPiArCQlyZXR1cm4gZGV2X2Vycl9wcm9iZShkZXYsIHJldCwgImZhaWxlZCB0
byBhc3NlcnQgcmVzZXRcbiIpOw0KPiArDQo+ICsJdXNsZWVwX3JhbmdlKDEwLCAxMDAwKTsNCj4g
Kw0KPiArCXJldCA9IHJlc2V0X2NvbnRyb2xfZGVhc3NlcnQoZHdjM2MtPnJlc2V0cyk7DQo+ICsJ
aWYgKHJldCkgew0KPiArCQlkZXZfZXJyKGRldiwgImZhaWxlZCB0byBkZWFzc2VydCByZXNldFxu
Iik7DQo+ICsJCWdvdG8gcmVzZXRfYXNzZXJ0Ow0KPiArCX0NCj4gKw0KPiArCXJldCA9IGNsa19i
dWxrX2dldF9hbGwoZHdjM2MtPmRldiwgJmR3YzNjLT5jbGtzKTsNCj4gKwlpZiAocmV0IDwgMCkg
ew0KPiArCQlkZXZfZXJyKGRldiwgImZhaWxlZCB0byBnZXQgY2xvY2tzXG4iKTsNCj4gKwkJZ290
byByZXNldF9hc3NlcnQ7DQo+ICsJfQ0KPiArDQo+ICsJZHdjM2MtPm51bV9jbG9ja3MgPSByZXQ7
DQo+ICsNCj4gKwlyZXQgPSBjbGtfYnVsa19wcmVwYXJlX2VuYWJsZShkd2MzYy0+bnVtX2Nsb2Nr
cywgZHdjM2MtPmNsa3MpOw0KPiArCWlmIChyZXQpIHsNCj4gKwkJZGV2X2VycihkZXYsICJmYWls
ZWQgdG8gZW5hYmxlIGNsb2Nrc1xuIik7DQo+ICsJCWdvdG8gcmVzZXRfYXNzZXJ0Ow0KPiArCX0N
Cj4gKw0KPiArCWR3YzNjLT5kd2MuZGV2ID0gZGV2Ow0KPiArCXByb2JlX2RhdGEuZHdjID0gJmR3
YzNjLT5kd2M7DQo+ICsJcHJvYmVfZGF0YS5yZXMgPSByZXM7DQo+ICsJcHJvYmVfZGF0YS5pZ25v
cmVfY2xvY2tzX2FuZF9yZXNldHMgPSB0cnVlOw0KPiArCXJldCA9IGR3YzNfY29yZV9wcm9iZSgm
cHJvYmVfZGF0YSk7DQo+ICsJaWYgKHJldCkgIHsNCj4gKwkJZGV2X2VycihkZXYsICJmYWlsZWQg
dG8gcmVnaXN0ZXIgRFdDMyBDb3JlXG4iKTsNCj4gKwkJZ290byBjbGtfZGlzYWJsZTsNCj4gKwl9
DQo+ICsNCj4gKwlyZXR1cm4gMDsNCj4gKw0KPiArY2xrX2Rpc2FibGU6DQo+ICsJY2xrX2J1bGtf
ZGlzYWJsZV91bnByZXBhcmUoZHdjM2MtPm51bV9jbG9ja3MsIGR3YzNjLT5jbGtzKTsNCj4gKwlj
bGtfYnVsa19wdXRfYWxsKGR3YzNjLT5udW1fY2xvY2tzLCBkd2MzYy0+Y2xrcyk7DQo+ICsNCj4g
K3Jlc2V0X2Fzc2VydDoNCj4gKwlyZXNldF9jb250cm9sX2Fzc2VydChkd2MzYy0+cmVzZXRzKTsN
Cj4gKw0KPiArCXJldHVybiByZXQ7DQo+ICt9DQo+ICsNCj4gK3N0YXRpYyB2b2lkIGR3YzNfY29t
bW9uX3JlbW92ZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQ0KPiArew0KPiArCXN0cnVj
dCBkd2MzX2NvbW1vbiAqZHdjM2MgPSBwbGF0Zm9ybV9nZXRfZHJ2ZGF0YShwZGV2KTsNCj4gKw0K
PiArCWR3YzNfY29yZV9yZW1vdmUoJmR3YzNjLT5kd2MpOw0KPiArDQo+ICsJY2xrX2J1bGtfZGlz
YWJsZV91bnByZXBhcmUoZHdjM2MtPm51bV9jbG9ja3MsIGR3YzNjLT5jbGtzKTsNCj4gKwljbGtf
YnVsa19wdXRfYWxsKGR3YzNjLT5udW1fY2xvY2tzLCBkd2MzYy0+Y2xrcyk7DQo+ICsNCj4gKwly
ZXNldF9jb250cm9sX2Fzc2VydChkd2MzYy0+cmVzZXRzKTsNCj4gK30NCj4gKw0KPiArI2lmZGVm
IENPTkZJR19QTV9TTEVFUA0KDQpVc2UgdGhlIG5ldyBTWVNURU1fU0xFRVBfUE1fT1BTIG1hY3Jv
cyBhbmQgd2UgY2FuIGRvIGF3YXkgd2l0aCB0aGVzZSBQTQ0KZ3VhcmRzLg0KDQo+ICtzdGF0aWMg
aW50IGR3YzNfY29tbW9uX3N1c3BlbmQoc3RydWN0IGRldmljZSAqZGV2KQ0KPiArew0KPiArCXN0
cnVjdCBkd2MzX2NvbW1vbiAqZHdjM2MgPSBkZXZfZ2V0X2RydmRhdGEoZGV2KTsNCj4gKwlpbnQg
cmV0Ow0KPiArDQo+ICsJcmV0ID0gZHdjM19wbV9zdXNwZW5kKCZkd2MzYy0+ZHdjKTsNCj4gKwlp
ZiAocmV0KQ0KPiArCQlyZXR1cm4gcmV0Ow0KPiArDQo+ICsJY2xrX2J1bGtfZGlzYWJsZV91bnBy
ZXBhcmUoZHdjM2MtPm51bV9jbG9ja3MsIGR3YzNjLT5jbGtzKTsNCj4gKw0KPiArCXJldHVybiAw
Ow0KPiArfQ0KPiArDQo+ICtzdGF0aWMgaW50IGR3YzNfY29tbW9uX3Jlc3VtZShzdHJ1Y3QgZGV2
aWNlICpkZXYpDQo+ICt7DQo+ICsJc3RydWN0IGR3YzNfY29tbW9uICpkd2MzYyA9IGRldl9nZXRf
ZHJ2ZGF0YShkZXYpOw0KPiArCWludCByZXQ7DQo+ICsNCj4gKwlyZXQgPSBjbGtfYnVsa19wcmVw
YXJlX2VuYWJsZShkd2MzYy0+bnVtX2Nsb2NrcywgZHdjM2MtPmNsa3MpOw0KPiArCWlmIChyZXQp
DQo+ICsJCXJldHVybiByZXQ7DQo+ICsNCj4gKwlyZXQgPSBkd2MzX3BtX3Jlc3VtZSgmZHdjM2Mt
PmR3Yyk7DQo+ICsJaWYgKHJldCkNCj4gKwkJcmV0dXJuIHJldDsNCj4gKw0KPiArCXJldHVybiAw
Ow0KPiArfQ0KPiArDQo+ICtzdGF0aWMgaW50IGR3YzNfY29tbW9uX3J1bnRpbWVfc3VzcGVuZChz
dHJ1Y3QgZGV2aWNlICpkZXYpDQo+ICt7DQo+ICsJc3RydWN0IGR3YzNfY29tbW9uICpkd2MzYyA9
IGRldl9nZXRfZHJ2ZGF0YShkZXYpOw0KPiArDQo+ICsJcmV0dXJuIGR3YzNfcnVudGltZV9zdXNw
ZW5kKCZkd2MzYy0+ZHdjKTsNCj4gK30NCj4gKw0KPiArc3RhdGljIGludCBkd2MzX2NvbW1vbl9y
dW50aW1lX3Jlc3VtZShzdHJ1Y3QgZGV2aWNlICpkZXYpDQo+ICt7DQo+ICsJc3RydWN0IGR3YzNf
Y29tbW9uICpkd2MzYyA9IGRldl9nZXRfZHJ2ZGF0YShkZXYpOw0KPiArDQo+ICsJcmV0dXJuIGR3
YzNfcnVudGltZV9yZXN1bWUoJmR3YzNjLT5kd2MpOw0KPiArfQ0KPiArDQo+ICtzdGF0aWMgaW50
IGR3YzNfY29tbW9uX3J1bnRpbWVfaWRsZShzdHJ1Y3QgZGV2aWNlICpkZXYpDQo+ICt7DQo+ICsJ
c3RydWN0IGR3YzNfY29tbW9uICpkd2MzYyA9IGRldl9nZXRfZHJ2ZGF0YShkZXYpOw0KPiArDQo+
ICsJcmV0dXJuIGR3YzNfcnVudGltZV9pZGxlKCZkd2MzYy0+ZHdjKTsNCj4gK30NCj4gKw0KPiAr
c3RhdGljIGNvbnN0IHN0cnVjdCBkZXZfcG1fb3BzIGR3YzNfY29tbW9uX2Rldl9wbV9vcHMgPSB7
DQo+ICsJU0VUX1NZU1RFTV9TTEVFUF9QTV9PUFMoZHdjM19jb21tb25fc3VzcGVuZCwgZHdjM19j
b21tb25fcmVzdW1lKQ0KPiArCVJVTlRJTUVfUE1fT1BTKGR3YzNfY29tbW9uX3J1bnRpbWVfc3Vz
cGVuZCwgZHdjM19jb21tb25fcnVudGltZV9yZXN1bWUsDQo+ICsJCSAgICAgICBkd2MzX2NvbW1v
bl9ydW50aW1lX2lkbGUpDQo+ICt9Ow0KPiArI2VuZGlmIC8qIENPTkZJR19QTV9TTEVFUCAqLw0K
PiArDQo+ICtzdGF0aWMgY29uc3Qgc3RydWN0IG9mX2RldmljZV9pZCBkd2MzX2NvbW1vbl9vZl9t
YXRjaFtdID0gew0KPiArCXsgLmNvbXBhdGlibGUgPSAic3BhY2VtaXQsazEtZHdjMyIsIH0sDQo+
ICsJeyAvKiBzZW50aW5lbCAqLyB9DQo+ICt9Ow0KPiArTU9EVUxFX0RFVklDRV9UQUJMRShvZiwg
ZHdjM19jb21tb25fb2ZfbWF0Y2gpOw0KPiArDQo+ICtzdGF0aWMgc3RydWN0IHBsYXRmb3JtX2Ry
aXZlciBkd2MzX2NvbW1vbl9kcml2ZXIgPSB7DQo+ICsJLnByb2JlCQk9IGR3YzNfY29tbW9uX3By
b2JlLA0KPiArCS5yZW1vdmUJCT0gZHdjM19jb21tb25fcmVtb3ZlLA0KPiArCS5kcml2ZXIJCT0g
ew0KPiArCQkubmFtZQk9ICJkd2MzLWNvbW1vbiIsDQo+ICsJCS5vZl9tYXRjaF90YWJsZSA9IGR3
YzNfY29tbW9uX29mX21hdGNoLA0KPiArI2lmZGVmIENPTkZJR19QTV9TTEVFUA0KPiArCQkucG0J
PSAmZHdjM19jb21tb25fZGV2X3BtX29wcywNCj4gKyNlbmRpZiAvKiBDT05GSUdfUE1fU0xFRVAg
Ki8NCj4gKwl9LA0KPiArfTsNCj4gK21vZHVsZV9wbGF0Zm9ybV9kcml2ZXIoZHdjM19jb21tb25f
ZHJpdmVyKTsNCj4gKw0KPiArTU9EVUxFX0xJQ0VOU0UoIkdQTCIpOw0KPiArTU9EVUxFX0RFU0NS
SVBUSU9OKCJEZXNpZ25XYXJlIFVTQjMgY29tbW9uIGRyaXZlciIpOw0KPiANCj4gLS0gDQo+IDIu
NDkuMA0KPiANCg0KVGhhbmtzIGZvciB0aGUgd29yay4gR29pbmcgZm9yd2FyZCwgSSBob3BlIG1v
cmUgcGxhdGZvcm1zIHdpbGwgbW92ZSB0bw0KdGhpcyBhbmQgdGFrZSBhZHZhbnRhZ2Ugb2YgdGhp
cyBuZXcgZmxhdHRlbmVkIG1vZGVsLg0KDQpUaGFua3MsDQpUaGluaA==
