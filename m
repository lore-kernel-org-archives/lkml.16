Received: from mx0a-00230701.pphosted.com (mx0a-00230701.pphosted.com [148.163.156.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7202326ACB;
	Wed,  9 Apr 2025 22:35:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.156.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744238157; cv=fail; b=kjPR9YF7oYhj9sNMEYGIZARy35e6x54eEl9ohdYxDg7PNYCadDJsRgx1VDJ8dQ3dYLZ5pHtnlL8tPwls7jH1yLUxn75SqmLWbH53FMQElSAR51zj4V/fsPzeIf/4/1xuopPUxRCiL7DNAWuzdd3RB0MUm4ervRGCWk4A1MCx4iA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744238157; c=relaxed/simple;
	bh=Va1pfy12XnOpGbmfJhgMW05Up8sEaj9iPTebUIWQNz0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=kGGeQwVyU8NPr4qKXSripmvR41DoPJQ3ptz6C8hsMcuuUJbUt6Ajpvk7HWVopQnw+I2lf98xeL9ljMBHVf7o6AQl5l6absc4fpueLV8vGcm8LhC8ugiUI4V6aQ8aC86sIsbQO4SCQV0PO9IHt8CY0uVC1dCLRDDequygmgbFN9o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=Uf3vyXSM; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=LLae/EJ7; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=dehoSTsZ reason="signature verification failed"; arc=fail smtp.client-ip=148.163.156.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="Uf3vyXSM";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="LLae/EJ7";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="dehoSTsZ"
Received: from pps.filterd (m0098571.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 539KD71E013400;
	Wed, 9 Apr 2025 15:35:13 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=Va1pfy12XnOpGbmfJhgMW05Up8sEaj9iPTebUIWQNz0=; b=
	Uf3vyXSMDOfkhKNKS4HLaRQ/TTy8MpqRRx6tEbstM3U02xgdup7wzBlb7EC2QwwV
	KFySqthtbkhTwehxYdr3Qmcx+iWD9m/jYFrk7TgOqIgBzYE/9iDYMT9zXt8QiGNx
	PA77KRW9eR9j7kEe4cc7tACuvwTovlYbbMk20AnJOc/KYZIhQF5fs1HHOZT8PC01
	aED1WOcgn3rKJwl+jGoBsH5TyU1i6FbXSoeK5R3FfgYJXIKs3dhUX56MDVGdSkyP
	5nukEkQ3ruxUIV15HaApbNLXUfqXAOdDtrILJVjxPcJPoSUv/BfETSn03ezfvoZU
	aMlchZ/1fpX7P51UBZJvxQ==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 45u3hprh3t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 09 Apr 2025 15:35:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1744238112; bh=Va1pfy12XnOpGbmfJhgMW05Up8sEaj9iPTebUIWQNz0=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=LLae/EJ7qrRPzt1swkgs0RrSzEoSiZSsrgwrzAbIHi51VuSZrZSB6ReHxFFjWPNjh
	 PDLN8tfU3yHfVIKcMpidAB9xY1VsuicQWGBQRwYgepSHrVmBAHk1Bz5LtX6T2S7PF0
	 ZqpGSYAtKSy+99oN+UnJIPPOBFtKmOeSIIk6aV4vfeRWn8SGRcAwo5Cr0UJ/pFEUFs
	 R1lH/f+EyZyT6I6BBqMr1Gho+U0qFVpSmz+4029ekch7o7IaZQ/v79DFTlJDo9IihC
	 A7tnhDjKHY9ojtnlo4s7Y1jsK/Durd4Bld83rCT/Mp9XJt0KfTmugx7TvBT3861/n8
	 meZzV04vyEPNA==
Received: from mailhost.synopsys.com (sv1-mailhost2.synopsys.com [10.205.2.132])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 6B2124052E;
	Wed,  9 Apr 2025 22:35:09 +0000 (UTC)
Received: from o365relay-in.synopsys.com (sv2-o365relay1.synopsys.com [10.202.1.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id 9B0E1A006D;
	Wed,  9 Apr 2025 22:35:06 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=dehoSTsZ;
	dkim-atps=neutral
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (mail-mw2nam04lp2171.outbound.protection.outlook.com [104.47.73.171])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id A44194048E;
	Wed,  9 Apr 2025 22:34:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LHdh+a2NqS2S3++LzWyzkOCMNZvKNIM2CCF4F13iPebfZDDt574x9PUO7OmVF2eZsy2GexgRx8HzPCW9yjrs8g9gd8/0Hav4aWwQ6arFGRxIgWVvtj6OS5v81ACf4fZkVsXyuBBlowRWaAxqBVBgH0oNVhNhW466mwGCPVrCl3yJkIt2m0ZZm5bTna9mGYUWZSAAKwcfuTQwVimVdAgOBI+ayc7KRzK+BBFd76X+u4eFSDI1QKS2XsrGCtdFT6RWJOtNROSHQtFUYJ2okQlTcEv6w1uVqxk4pCX9URxaiUy5r9eRwEqkJK86uxYYcaNsn/KJM+qDwsUxYyuUTj9/7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Va1pfy12XnOpGbmfJhgMW05Up8sEaj9iPTebUIWQNz0=;
 b=n2U9tE5UD5hWaLu1vZ9hu22CDQk90QN8WWz64cpohnIewwS71v8BQh64yuQjliGViEERLpgRiNOimUi/tmuKesBlvEYKXH5ejWCWJFyQ5InrJ7v4V+gzyFX32UrMUv5YnhEgEgQypLHxL67E3s8EP333Hjb79zj7ccL9ZderwCHmu6deI9XHVwsXTGM2YlllTgcf3S0mQ7mD8QUWO0CmnGZV/JoFSxX/cLPILdN3gyo0rPP9LN1M8ifA3s4g87y++Y7ru976RnAfeototU5iluKk4J7c33qWjQmvTV2jDcymawPiI1dv1Z21B1HlZruMsDpvPGwC/hsEHtS7QuaTlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Va1pfy12XnOpGbmfJhgMW05Up8sEaj9iPTebUIWQNz0=;
 b=dehoSTsZ9NnA5GHEMnSt+J+ZhXbD55MEsNHgY2Q03nn8u0Mc3TOJjjwv3ozNweaYSC7oo8mXJZEc10WMkC2PuVRMlN0M3s64oG9v7eBstkZeAWJ/uV1b1HdgrSprr4LzX/m9dkT8l1hK5TnsXHzV2xQPOzOZqbTlh9H55R1+frY=
Received: from LV2PR12MB5990.namprd12.prod.outlook.com (2603:10b6:408:170::16)
 by CH3PR12MB7642.namprd12.prod.outlook.com (2603:10b6:610:14a::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.22; Wed, 9 Apr
 2025 22:34:55 +0000
Received: from LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8]) by LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8%5]) with mapi id 15.20.8632.021; Wed, 9 Apr 2025
 22:34:55 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Ze Huang <huangze@whut.edu.cn>
CC: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
        Alexandre Ghiti <alex@ghiti.fr>,
        "linux-phy@lists.infradead.org" <linux-phy@lists.infradead.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
        "spacemit@lists.linux.dev" <spacemit@lists.linux.dev>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: [PATCH 6/7] usb: dwc3: add spacemit dwc3 glue layer driver
Thread-Topic: [PATCH 6/7] usb: dwc3: add spacemit dwc3 glue layer driver
Thread-Index: AQHbp7o+/NmdAfu2KEabLwwgtR4VZbOb78MA
Date: Wed, 9 Apr 2025 22:34:55 +0000
Message-ID: <20250409223452.svwckotac4dbze6v@synopsys.com>
References: <20250407-b4-k1-usb3-v3-2-v1-0-bf0bcc41c9ba@whut.edu.cn>
 <20250407-b4-k1-usb3-v3-2-v1-6-bf0bcc41c9ba@whut.edu.cn>
In-Reply-To: <20250407-b4-k1-usb3-v3-2-v1-6-bf0bcc41c9ba@whut.edu.cn>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR12MB5990:EE_|CH3PR12MB7642:EE_
x-ms-office365-filtering-correlation-id: 9d5c432f-fa54-4d01-aa2c-08dd77b6c0a7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|7416014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?cmdUaXB5OGhGWlJPcnBBZ1RUN3NRL0xjYWdvSTlWZ2RKUUpENnhoeFBJUktl?=
 =?utf-8?B?cFQ0ak5ieDFzMk9oRGEwVytqV054MGJPaUl6STNzZ1JyMFNRQ1NzREFPR1lV?=
 =?utf-8?B?bzRIQXFpVWwrT0pQaWo5NUU2Qm0vRXVjb25jdTFsVzF2cXJJOU9FeU5ndldV?=
 =?utf-8?B?OHRlazMySlJENkVTMEQ2K1JaUmgybnhCMjQ5bG9kN2xlV1V2Y1NxU2dVWmpx?=
 =?utf-8?B?cGhjaHNsRTZrc2dNcmcveTZNK0pNS1ZrOVgwS01icHBLWjRQWSsyQXExL0R0?=
 =?utf-8?B?SjlwOGhyVHVqODBieWpGemRJalgxMk5hZE9KL3ZkdHdIRmhOVEFIZVF5d0Mz?=
 =?utf-8?B?YXBSV0RZbFhDblY4SWtBbFhSYXAxVWk5eTNDYWxxK3NlRzVYL2UwbTI3NjBi?=
 =?utf-8?B?a1pHcUVaZTMrVk9EQVozeDRTZGhzc2d5UFdnSUZwMmQrc3FESFhxOFNLT1dy?=
 =?utf-8?B?NGNGT1h3dGdQZndnZ3llZFVZWTNab0pUdk4rY0JCdkg2U3l5dDVIeUFWMmxD?=
 =?utf-8?B?WVpseUViL2hMRVVHNkNwOXR4UnJVTkRPZ2Q3Q1J6eWFSQVdLU3ZvZEZ0WllS?=
 =?utf-8?B?YzdIMXJkRlBSNEVsaWgxM0t1aE1lQUxncFFOaHZON0VqbjVtWk1HNUZyQVl5?=
 =?utf-8?B?S2JiNDVRa1FYWG8zUUdOZ2ppS2dYNmVyZS9VT2Nqell4aXdnVGZQb2hSMW1n?=
 =?utf-8?B?V2ZNNk4zTWwvWlZUVXdtdUMzaWdqblhaYUtsTWpjWXlkMDdhRmhubFA5NFJD?=
 =?utf-8?B?RDB3bnk5RFhvTFprOEgxU1N3blRUTUZLN3U5TDVnc1B4TEozaHY3c0Z6aVZa?=
 =?utf-8?B?VFdoQ2Fkbm1VYjJPdk9NTXBUaEhrcVRIM0NkTHhrY2pYT3RUeFRKSlVpMzYz?=
 =?utf-8?B?Sk9lNTQyZ0hLamRPeVlUSzRJUWNyLzJPanpscDNjVytzZ24zdXczc2tPSjM5?=
 =?utf-8?B?SXpXbXo0WlNacXQ4cktFWHJqalNPOEhBR1ZsNEtjVWhUVk1PM0FjRkIraXRs?=
 =?utf-8?B?TmhibzV0ekhrTmFLaDNnVEZOemdtSEcrYWVOYTk4Q241cndpczdoZnlQS3Ar?=
 =?utf-8?B?TDFieVIxSW5qNjVpTHlLVHlOWEVTZyttc3NJRXJVbHRUYWovUnYvd2wwcUI2?=
 =?utf-8?B?Z3pBQ0FRcWI3N0R4Zk9YSitjUVhsV0NRZ2lrWmhVWGxwL294OXltWVJiZk5r?=
 =?utf-8?B?RmgvR3VNUzJUUXl4TzlaRGg5bXJ1dGdSNjNrRjNOODN1Y0Y4RDM1dCtCTUJC?=
 =?utf-8?B?SmhvMFJ1VmF1clNMa25LWERWRXhwazlxaStnOHNwOVNuR1I4a1R0am8vRXow?=
 =?utf-8?B?RU1BK2crQWI0QlhqRXREKzNlTWtlY0dYYkM0WWJtbzRkaEJxQ0ZFN2dQOWkw?=
 =?utf-8?B?UmpxaGVGMXpISzVKMVFaMjBLa0pRaWY3VDJqdHNibEtDbmRZMTNVcktRRjdE?=
 =?utf-8?B?OHRXYWM5YkZzbzdkeUQ5Vm1OYnNYNzhhaTNlb05QWFlScUFjK0NCeGNnVVFS?=
 =?utf-8?B?cVBEQUZFT1d1cVhrR2RlQzZXQzRHNjdWQ1FYcWgzWHpER1pnKzRtZlJvZVdH?=
 =?utf-8?B?eHY2MTh1ZlVuR0VwYW5qSjB6SHFJajJJd29HbjJMV0NSUmFXQU5hYzlVNnVP?=
 =?utf-8?B?TjJnVU1uZ0VXLy9VMUM4dkdud1JHUmJEUlpvSnVZRXJoMXBmWDBjNXJ3aE9H?=
 =?utf-8?B?RGRJVU4xMXptQWhYdXhxSmNGTWpYb3BUZlRjbEhYOTJqZFY5Yk5PT1Fadisv?=
 =?utf-8?B?R2dCNjBMaXFqd2pLa1F3T08wRWFBc2pEQURBZWZYTWdDSVB1VllxVDhjRVFP?=
 =?utf-8?B?WlhWUS9tME1KNXBLbjl6WFJLQllycitybE9zS1dwem5TdVd1VWg4bzZlOFdt?=
 =?utf-8?B?bDcza1c3cmVaa1RQcDBtTGY4QjE0SkpZMHBvdnhYeE5NaWFDTjJZaWlFVnJB?=
 =?utf-8?B?ZFp5MjNnYjE2YVFrc25GK2laU2RTeVozTjlXWWExQlY2UjU2YlRTSEFYSmlH?=
 =?utf-8?B?amYzREowVlBnPT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?a0NmTTNSTmJVNGlhYUIwM3ltR21zaldmV1BMTU85OC9RbHFmNm5zekUvWVRt?=
 =?utf-8?B?UzIzU2VmZnlOOVFibU9aWDVqbHZnTTUwQkdaUEw3WWgvMWdYWEZ0d29zWnJT?=
 =?utf-8?B?SWFYWVh0aW9vUTBweHdPRWxjcDV5VlRBYlo1KzBPT2FYWDRxSDdSZVJ4RjFV?=
 =?utf-8?B?bFU5b201SGdId2NSSGJMVGkzOWtkTDRha3VLZHl1b0JsWFM2RWFPN1BhTTMw?=
 =?utf-8?B?UWk1ckJQZ2ZXWUNucThsNUxPVzg0NUUvRGtoRVlQUGFQZkpJckw3Z0xja3BH?=
 =?utf-8?B?NDhiektMQURobFlEQkRweWtUK3M0b1NhSkhQWFR0QlVNemV4V1pjR3BUSUcy?=
 =?utf-8?B?a0ZNZWJxc1REYWhSNXZzUlo5eVNYMGlWaHFFMnV3UnJ0dFc3RUdhUmNsUlpz?=
 =?utf-8?B?RU4raVJKc2Z3Y01Od0NSbkpZMkpLZGxQT2hBSEpvV3dFRFJXWklqM0ZMT24v?=
 =?utf-8?B?SW9RWkFxaWFpWnYxNFY5SHU1bUpaVUFydFgyUGd2NHNyWUFLVkMrYlBUYm5y?=
 =?utf-8?B?dm92NG00ODFwWTBqYVJkN1hIZWlwTWdNaUZLN2h6RnZ0R3J5bVBGcTltVkh1?=
 =?utf-8?B?SlNOdUdYNDRmazlxcUNNUkRJVHdXczNmNWtxbjZjZFZ5a2UvUUQySVZXSW9P?=
 =?utf-8?B?cE1manBhVTI2QUhmVTRZYWFuRlhzd0tWUkVZRXNqd3NTYlVZR0RvWW1pYjFu?=
 =?utf-8?B?T1J1Rk5lMVlRakZMZVhCL3VBRmJmclQ3MVY2SnpKczIyYlI1MFdVcGZrYkhU?=
 =?utf-8?B?Y1hldVNSR0RjQzlSSE5sQ0M2Q1VmajYrNWhCSGVCRTdId0VoTCtxUS9qa3Bv?=
 =?utf-8?B?cWc4WWxFSGFWMlFoVTdqK2dxVTRaVlhBd09maDhIS0t5QnQ2Z1ZOOWJOTGVv?=
 =?utf-8?B?QTFwVVdJMzNhSDNDRGUvTE90SDJrS2dLcU55dHJtcUQ5US83OWtLRVRPS3Z4?=
 =?utf-8?B?WDRvT3ptZmdkNUVlMWVLNC9BaEhYamJyM05IbWpZS2tyeGNzWXZQZ0VLaFVF?=
 =?utf-8?B?OTlaRW5FZnVwaG5ELzFnRTF5WW9JNzRxK0dLSHhnSjV2TmFrZnhsQVNqM0pm?=
 =?utf-8?B?UzVSdzhCWTdDaVhseHFqdWhwRitBVFJqdlo0OXRRQWZ2ZC8rU2RPZFhxWThQ?=
 =?utf-8?B?Tnh1U0k0R2xwSUtoTTVXdy9ScTd5NVdqbzFETzdzcWJhWndvVk1NRDdRS1c1?=
 =?utf-8?B?TzE0VWYxak5HTEUvM1RQMEkyUCtjZ2Z4cDJRZSs1T1hGbUptdzVLd2F3dEZX?=
 =?utf-8?B?akpIdEdQUDA5V2dQNTNSZmZPcklMMXFmczBYZHdRcFNYZkhYOXBuWVVzY1pE?=
 =?utf-8?B?WEVJM0NiSVVaWGEzYkdMY3MxYW5Ia0ZMRkRrWWd2cUhKbmlRMTFkTTZQOXJZ?=
 =?utf-8?B?R1dBcno0Mk1CQkNIbDgvZWdWR0E5cFB3eFdJaDRjRDF1RjlDc09IekRhU1Ev?=
 =?utf-8?B?c2hzZXZScHVjK2RaK2lnQmdibGY0ejdDbmROWnpjTEhUNUJPTmIwandsdzc5?=
 =?utf-8?B?N0d3RC9OKzViWlZaS0IrWGxCeWRUU0R6d1FmZ0p1Y21UR2EvZHBOL0Qza1hm?=
 =?utf-8?B?LzBEUHpLdmE5T2daNmtvU0lINkhVbFBMZ0RGallWeW9tUnRrcXVnQWtyQlBN?=
 =?utf-8?B?QkdIYy84NWVZSHJrR3BLZ0hDQTZJNE9pZC9vRDFqbmU5NE5QZlZQbGVVSGVN?=
 =?utf-8?B?OUdTZ0Q1OHpuRDVoMHA4VTNvV2FSM3hTVi81RlhJdmtSWDVEaW9lUW9YU2kw?=
 =?utf-8?B?WUt0ZWxGYm9jZEQ5cllPekw3WUZrMGNzZXlTTzNhRklBS1N3TlNRNkFwckZR?=
 =?utf-8?B?bTAvTE9SMmhuU2diaUg3cUFadXJ1R1doTGpHSWxla2lEWWI1UFUyUEtPaEJS?=
 =?utf-8?B?alVqWGVOZE5sSHNaNUd2QjhxbFlUajkwWDBFQ0l2dWdybXRNUDdhOWhxUEhO?=
 =?utf-8?B?MmN6dWVjTHZVZUdkTFZoN0Y3UVdaNWN2dlk1UlpoWXQyWXNJaXFFcTh6ejZY?=
 =?utf-8?B?WDg5YW0ydU9OQUdQRzhCR2ZBNEpEMWYvUDZDQ2pjN21NcnJoVG9VK2MvSHJa?=
 =?utf-8?B?dmxGcnZQY0YvMnNYTURTNEwyS1ZWSE9EeG1wZjZGZTFXWDhFL2dLYS91bVpF?=
 =?utf-8?B?L0tKcDZmclEvVUtnWmRJMm9JOTJjWDRsQUxiNlVSOGdrWUU0ZVQ1TWpWNm5E?=
 =?utf-8?B?MEE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <220F956D2D0AF641A3C8116F2124834E@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	JAdl1sBBZf7k0oNZdVtEC59bH+9/cYsduSqdGD9Ug3x6AFzX3PWOtiHqmgPyw4vg47/NtkwFH5+LvabVh0zhWmPCBSE2BKGMJSyIPvrP1IvfFK6tiNxS5YyhG4UpkM4bICYyP9E21wlcp1E7iJ8Xy2TtVZCzD+gzDP2Tbj13MAXm+NZs157x3aSZR9Q1BCaudaBwtzPFXTRSibLJanScpZnb1OQUKawbSkz672tWU9N/jLmQ09oYV9RIh9VwxZZQfjcDssBeUWkhcYh1NPcTyMlDgonYzFbe7J7e8UXj6NvlA9Jh8k3EYEp4ALLkcIMtRk+ydXOzGH6LjgQ6sPRX5amWwhU3pMnooTumDiDqWLi4aTw4wqyUvwazqw2sovb5q1/DaxbTomL7+0ylsFhSuc5AkP2pcvlhJr44T1b1PprFmYGSJY4vzn0dpZ+kS81xGMH6r/7b3ZmApBn5pGvnoO1IDDik4K6w6xlmb4+8mCBAUb8xCMyLXOz9dxHt56dqx461wYoJ8HoxXcHb8Ep1xYyBoy9eFsxYKdfzClsft3Wtw/rXuXtXNcjekzU/lJOIj9kJA+QAI37Wbb4wTKT4W2CksTCJZMZptbmVe9fHTFtwi9f2CqLf+bJ+CGrdXtrB+K3hTPHK+4ZwNQkud3Tfcg==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d5c432f-fa54-4d01-aa2c-08dd77b6c0a7
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Apr 2025 22:34:55.6390
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: u69WUhgwJTVEpiVTxJ+rZ84IcAxuVhRl7stHL2l4rvsOGS6Oseb35T9rqE3UiHQBHQEQfXdrpOw6U3molRuaUQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7642
X-Proofpoint-ORIG-GUID: gzXs1MLrEHaIXjFA8MuJWq8kYELEMNVL
X-Authority-Analysis: v=2.4 cv=XIAwSRhE c=1 sm=1 tr=0 ts=67f6f620 cx=c_pps a=8EbXvwLXkpGsT4ql/pYRAw==:117 a=8EbXvwLXkpGsT4ql/pYRAw==:17 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10
 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=qPHU084jO2kA:10 a=lv0vYI88AAAA:8 a=FJzgsiReXIDKSwhZvwUA:9 a=QEXdDO2ut3YA:10 a=9qqun4PRrEabIEPCFt1_:22
X-Proofpoint-GUID: gzXs1MLrEHaIXjFA8MuJWq8kYELEMNVL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-09_06,2025-04-08_04,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 phishscore=0 clxscore=1011 mlxlogscore=964 lowpriorityscore=0 bulkscore=0
 spamscore=0 mlxscore=0 malwarescore=0 adultscore=0 suspectscore=0
 impostorscore=0 priorityscore=1501 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2504090155

T24gTW9uLCBBcHIgMDcsIDIwMjUsIFplIEh1YW5nIHdyb3RlOg0KPiBBZGQgU3BhY2VtaVQgZ2x1
ZSBsb2dpYyB0byBzdXBwb3J0IGR3YzMgSEMgb24gSzEgU29DLiBUaGUgZHJpdmVyIG1hbmFnZXMN
Cj4gY2xvY2ssIHJlc2V0IGFuZCBpbnRlcnJ1cHQgcmVzb3VyY2UuDQo+IA0KPiBTaWduZWQtb2Zm
LWJ5OiBaZSBIdWFuZyA8aHVhbmd6ZUB3aHV0LmVkdS5jbj4NCj4gLS0tDQo+ICBkcml2ZXJzL3Vz
Yi9kd2MzL0tjb25maWcgICAgICAgICB8ICAgNyArKysNCj4gIGRyaXZlcnMvdXNiL2R3YzMvTWFr
ZWZpbGUgICAgICAgIHwgICAxICsNCj4gIGRyaXZlcnMvdXNiL2R3YzMvZHdjMy1zcGFjZW1pdC5j
IHwgMTI3ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKw0KPiAgMyBmaWxl
cyBjaGFuZ2VkLCAxMzUgaW5zZXJ0aW9ucygrKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMv
dXNiL2R3YzMvS2NvbmZpZyBiL2RyaXZlcnMvdXNiL2R3YzMvS2NvbmZpZw0KPiBpbmRleCAzMTBk
MTgyZTEwYjUwYjI1M2Q3ZTVhNTE2NzQ4MDZlNmVjNDQyYTJhLi4zYzMwNjgwZmE0ZjgzNTY1ZmMw
M2M2ODAwZTg2N2M2Y2VkMGZlMTAxIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL3VzYi9kd2MzL0tj
b25maWcNCj4gKysrIGIvZHJpdmVycy91c2IvZHdjMy9LY29uZmlnDQo+IEBAIC0xODksNCArMTg5
LDExIEBAIGNvbmZpZyBVU0JfRFdDM19SVEsNCj4gIAkgIG9yIGR1YWwtcm9sZSBtb2RlLg0KPiAg
CSAgU2F5ICdZJyBvciAnTScgaWYgeW91IGhhdmUgc3VjaCBkZXZpY2UuDQo+ICANCj4gK2NvbmZp
ZyBVU0JfRFdDM19TUEFDRU1JVA0KPiArCXRyaXN0YXRlICJTcGFjZW1pdCBQbGF0Zm9ybXMiDQoN
CkRvZXMgdGhpcyBkZXBlbmQgb24gb3RoZXIgY29uZmlncyBsaWtlIE9GIGFuZCBDT01NT05fQ0xL
Pw0KDQo+ICsJZGVmYXVsdCBVU0JfRFdDMw0KPiArCWhlbHANCj4gKwkgIFN1cHBvcnQgU1BBQ0VN
SVQgcGxhdGZvcm1zIHdpdGggRGVzaWduV2FyZSBDb3JlIFVTQjMgSVAuDQo+ICsJICBTYXkgJ1kn
IG9yICdNJyBoZXJlIGlmIHlvdSBoYXZlIG9uZSBzdWNoIGRldmljZQ0KPiArDQo+ICBlbmRpZg0K
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy91c2IvZHdjMy9NYWtlZmlsZSBiL2RyaXZlcnMvdXNiL2R3
YzMvTWFrZWZpbGUNCj4gaW5kZXggMTI0ZWRhMjUyMmQ5YzFmNGNhYWIyMjJlYzk3NzBkMGRlYWY2
NTVmYy4uNjFhODc3NjVjMGM1OTFlMGE1M2MzM2I1YTY1NDRkYjA1NjE2NmY5NiAxMDA2NDQNCj4g
LS0tIGEvZHJpdmVycy91c2IvZHdjMy9NYWtlZmlsZQ0KPiArKysgYi9kcml2ZXJzL3VzYi9kd2Mz
L01ha2VmaWxlDQo+IEBAIC01NiwzICs1Niw0IEBAIG9iai0kKENPTkZJR19VU0JfRFdDM19JTVg4
TVApCQkrPSBkd2MzLWlteDhtcC5vDQo+ICBvYmotJChDT05GSUdfVVNCX0RXQzNfWElMSU5YKQkJ
Kz0gZHdjMy14aWxpbngubw0KPiAgb2JqLSQoQ09ORklHX1VTQl9EV0MzX09DVEVPTikJCSs9IGR3
YzMtb2N0ZW9uLm8NCj4gIG9iai0kKENPTkZJR19VU0JfRFdDM19SVEspCQkrPSBkd2MzLXJ0ay5v
DQo+ICtvYmotJChDT05GSUdfVVNCX0RXQzNfU1BBQ0VNSVQpCQkrPSBkd2MzLXNwYWNlbWl0Lm8N
Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdXNiL2R3YzMvZHdjMy1zcGFjZW1pdC5jIGIvZHJpdmVy
cy91c2IvZHdjMy9kd2MzLXNwYWNlbWl0LmMNCj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQNCj4gaW5k
ZXggMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMC4uNDU3NGFkM2IzNGEy
MDBmZmU5OTljN2RhNjFiNzRjMmVmMzNjMDQ4Mw0KPiAtLS0gL2Rldi9udWxsDQo+ICsrKyBiL2Ry
aXZlcnMvdXNiL2R3YzMvZHdjMy1zcGFjZW1pdC5jDQo+IEBAIC0wLDAgKzEsMTI3IEBADQo+ICsv
LyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMC1vbmx5DQo+ICsvKg0KPiArICogZHdj
My1zcGFjZW1pdC5jIC0gU3BhY2VtaXQgRFdDMyBTcGVjaWZpYyBHbHVlIGxheWVyDQo+ICsgKg0K
PiArICogQ29weXJpZ2h0IChDKSAyMDI1IFNwYWNlbWlUIChIYW5nemhvdSkgVGVjaG5vbG9neSBD
by4gTHRkDQo+ICsgKg0KPiArICogQXV0aG9yOiBXaWxzb24gPGxvbmcud2FuQHNwYWNlbWl0LmNv
bT4NCj4gKyAqIENvbnRyaWJ1dG9yOiBaZSBIdWFuZyA8aHVhbmd6ZUB3aHV0LmVkdS5jbj4NCj4g
KyAqLw0KPiArDQo+ICsjaW5jbHVkZSA8bGludXgvY2xrLmg+DQo+ICsjaW5jbHVkZSA8bGludXgv
ZGVsYXkuaD4NCj4gKyNpbmNsdWRlIDxsaW51eC9vZl9wbGF0Zm9ybS5oPg0KPiArI2luY2x1ZGUg
PGxpbnV4L29mX2FkZHJlc3MuaD4NCj4gKyNpbmNsdWRlIDxsaW51eC9wbGF0Zm9ybV9kZXZpY2Uu
aD4NCj4gKyNpbmNsdWRlIDxsaW51eC9yZXNldC5oPg0KPiArDQo+ICtzdHJ1Y3QgZHdjM19zcGFj
ZW1pdCB7DQo+ICsJc3RydWN0IGRldmljZQkJKmRldjsNCj4gKwlzdHJ1Y3QgY2xrCQkqY2xrOw0K
PiArCXN0cnVjdCByZXNldF9jb250cm9sCSpyZXNldDsNCj4gK307DQo+ICsNCj4gK3N0YXRpYyBp
bnQgZHdjM19zcGFjZW1pdF9pbml0KHN0cnVjdCBkd2MzX3NwYWNlbWl0ICpkYXRhKQ0KPiArew0K
PiArCXN0cnVjdCBkZXZpY2UgKmRldiA9IGRhdGEtPmRldjsNCj4gKwlpbnQgcmV0ID0gMDsNCj4g
Kw0KPiArCWRhdGEtPnJlc2V0ID0gZGV2bV9yZXNldF9jb250cm9sX2dldChkZXYsIE5VTEwpOw0K
PiArCWlmIChJU19FUlIoZGF0YS0+cmVzZXQpKQ0KPiArCQlyZXR1cm4gZGV2X2Vycl9wcm9iZShk
ZXYsIFBUUl9FUlIoZGF0YS0+cmVzZXQpLCAiZmFpbGVkIHRvIGdldCByZXNldFxuIik7DQo+ICsN
Cj4gKwlyZXQgPSByZXNldF9jb250cm9sX2Fzc2VydChkYXRhLT5yZXNldCk7DQo+ICsJaWYgKHJl
dCkNCj4gKwkJcmV0dXJuIGRldl9lcnJfcHJvYmUoZGV2LCByZXQsICJmYWlsZWQgdG8gYXNzZXJ0
IHJlc2V0XG4iKTsNCj4gKw0KPiArCXVzbGVlcF9yYW5nZSgxMCwgMjApOw0KPiArDQo+ICsJcmV0
ID0gcmVzZXRfY29udHJvbF9kZWFzc2VydChkYXRhLT5yZXNldCk7DQo+ICsJaWYgKHJldCkNCj4g
KwkJcmV0dXJuIGRldl9lcnJfcHJvYmUoZGV2LCByZXQsICJmYWlsZWQgdG8gZGVhc3NlcnQgcmVz
ZXRcbiIpOw0KPiArDQo+ICsJcmV0dXJuIDA7DQo+ICt9DQo+ICsNCj4gK3N0YXRpYyBpbnQgZHdj
M19zcGFjZW1pdF9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQ0KPiArew0KPiAr
CXN0cnVjdCBkZXZpY2UgKmRldiA9ICZwZGV2LT5kZXY7DQo+ICsJc3RydWN0IGRldmljZV9ub2Rl
ICpub2RlID0gZGV2LT5vZl9ub2RlOw0KPiArCXN0cnVjdCBkd2MzX3NwYWNlbWl0ICpzcGFjZW1p
dDsNCj4gKwlpbnQgcmV0Ow0KPiArDQo+ICsJc3BhY2VtaXQgPSBkZXZtX2t6YWxsb2MoZGV2LCBz
aXplb2YoKnNwYWNlbWl0KSwgR0ZQX0tFUk5FTCk7DQo+ICsJaWYgKCFzcGFjZW1pdCkNCj4gKwkJ
cmV0dXJuIC1FTk9NRU07DQo+ICsNCj4gKwlzcGFjZW1pdC0+ZGV2ID0gZGV2Ow0KPiArDQo+ICsJ
cGxhdGZvcm1fc2V0X2RydmRhdGEocGRldiwgc3BhY2VtaXQpOw0KPiArDQo+ICsJc3BhY2VtaXQt
PmNsayA9IGRldm1fY2xrX2dldF9lbmFibGVkKGRldiwgTlVMTCk7DQo+ICsJaWYgKElTX0VSUihz
cGFjZW1pdC0+Y2xrKSkNCj4gKwkJcmV0dXJuIGRldl9lcnJfcHJvYmUoZGV2LCBQVFJfRVJSKHNw
YWNlbWl0LT5jbGspLCAiRmFpbGVkIHRvIGdldCBjbG9ja1xuIik7DQo+ICsNCj4gKwlyZXQgPSBk
d2MzX3NwYWNlbWl0X2luaXQoc3BhY2VtaXQpOw0KPiArCWlmIChyZXQpDQo+ICsJCXJldHVybiBk
ZXZfZXJyX3Byb2JlKGRldiwgcmV0LCAiZmFpbGVkIHRvIGluaXQgU3BhY2VtaVQgVVNCMyBnbHVl
XG4iKTsNCj4gKw0KPiArCXJldCA9IG9mX3BsYXRmb3JtX3BvcHVsYXRlKG5vZGUsIE5VTEwsIE5V
TEwsIGRldik7DQo+ICsJaWYgKHJldCkNCj4gKwkJZGV2X2Vycl9wcm9iZShkZXYsIHJldCwgImZh
aWxlZCB0byBhZGQgZHdjMyBjb3JlXG4iKTsNCj4gKw0KPiArCXJldHVybiAwOw0KPiArfQ0KPiAr
DQo+ICtzdGF0aWMgdm9pZCBkd2MzX3NwYWNlbWl0X3JlbW92ZShzdHJ1Y3QgcGxhdGZvcm1fZGV2
aWNlICpwZGV2KQ0KPiArew0KPiArCW9mX3BsYXRmb3JtX2RlcG9wdWxhdGUoJnBkZXYtPmRldik7
DQo+ICt9DQo+ICsNCj4gK3N0YXRpYyBjb25zdCBzdHJ1Y3Qgb2ZfZGV2aWNlX2lkIHNwYWNlbWl0
X2R3YzNfbWF0Y2hbXSA9IHsNCj4gKwl7IC5jb21wYXRpYmxlID0gInNwYWNlbWl0LGsxLWR3YzMi
LCB9LA0KPiArCXsgLyogc2VudGluZWwgKi8gfQ0KPiArfTsNCj4gK01PRFVMRV9ERVZJQ0VfVEFC
TEUob2YsIHNwYWNlbWl0X2R3YzNfbWF0Y2gpOw0KPiArDQo+ICsjaWZkZWYgQ09ORklHX1BNX1NM
RUVQDQo+ICtzdGF0aWMgaW50IGR3YzNfc3BhY2VtaXRfc3VzcGVuZChzdHJ1Y3QgZGV2aWNlICpk
ZXYpDQo+ICt7DQo+ICsJc3RydWN0IGR3YzNfc3BhY2VtaXQgKnNwYWNlbWl0ID0gZGV2X2dldF9k
cnZkYXRhKGRldik7DQo+ICsNCj4gKwljbGtfZGlzYWJsZV91bnByZXBhcmUoc3BhY2VtaXQtPmNs
ayk7DQo+ICsNCj4gKwlyZXR1cm4gMDsNCj4gK30NCj4gKw0KPiArc3RhdGljIGludCBkd2MzX3Nw
YWNlbWl0X3Jlc3VtZShzdHJ1Y3QgZGV2aWNlICpkZXYpDQo+ICt7DQo+ICsJc3RydWN0IGR3YzNf
c3BhY2VtaXQgKnNwYWNlbWl0ID0gZGV2X2dldF9kcnZkYXRhKGRldik7DQo+ICsJaW50IHJldDsN
Cj4gKw0KPiArCXJldCA9IGNsa19wcmVwYXJlX2VuYWJsZShzcGFjZW1pdC0+Y2xrKTsNCj4gKw0K
PiArCXJldHVybiByZXQ7DQo+ICt9DQo+ICsNCj4gK3N0YXRpYyBjb25zdCBzdHJ1Y3QgZGV2X3Bt
X29wcyBkd2MzX3NwYWNlbWl0X2Rldl9wbV9vcHMgPSB7DQo+ICsJU0VUX1NZU1RFTV9TTEVFUF9Q
TV9PUFMoZHdjM19zcGFjZW1pdF9zdXNwZW5kLCBkd2MzX3NwYWNlbWl0X3Jlc3VtZSkNCj4gK307
DQo+ICsjZW5kaWYgLyogQ09ORklHX1BNX1NMRUVQICovDQo+ICsNCg0KVXNlIERFRklORV9TSU1Q
TEVfREVWX1BNX09QUyB0byByZW1vdmUgdGhlIENPTkZJR19QTV9TTEVFUCBndWFyZHMuIA0KDQo+
ICtzdGF0aWMgc3RydWN0IHBsYXRmb3JtX2RyaXZlciBkd2MzX3NwYWNlbWl0X2RyaXZlciA9IHsN
Cj4gKwkucHJvYmUJCT0gZHdjM19zcGFjZW1pdF9wcm9iZSwNCj4gKwkucmVtb3ZlCQk9IGR3YzNf
c3BhY2VtaXRfcmVtb3ZlLA0KPiArCS5kcml2ZXIJCT0gew0KPiArCQkubmFtZQk9ICJzcGFjZW1p
dC1kd2MzIiwNCj4gKwkJLm9mX21hdGNoX3RhYmxlID0gc3BhY2VtaXRfZHdjM19tYXRjaCwNCj4g
KyNpZmRlZiBDT05GSUdfUE1fU0xFRVANCj4gKwkJLnBtCT0gJmR3YzNfc3BhY2VtaXRfZGV2X3Bt
X29wcywNCj4gKyNlbmRpZiAvKiBDT05GSUdfUE1fU0xFRVAgKi8NCj4gKwl9LA0KPiArfTsNCj4g
K21vZHVsZV9wbGF0Zm9ybV9kcml2ZXIoZHdjM19zcGFjZW1pdF9kcml2ZXIpOw0KPiArDQo+ICtN
T0RVTEVfQVVUSE9SKCJXaWxzb24gPGxvbmcud2FuQHNwYWNlbWl0LmNvbT4iKTsNCg0KVGhlIGF1
dGhvciBpcyBkaWZmZXJlbnQgdGhhbiB0aGUgY29tbWl0ZXI/IEFsc28sIGlzIHRoZXJlIGEgbGFz
dCBuYW1lPw0KDQo+ICtNT0RVTEVfTElDRU5TRSgiR1BMIik7DQo+ICtNT0RVTEVfREVTQ1JJUFRJ
T04oIkRlc2lnbldhcmUgVVNCMyBTcGFjZW1pdCBHbHVlIExheWVyIik7DQo+IA0KPiAtLSANCj4g
Mi40OS4wDQo+IA0KDQpUaGUgbG9naWMgaW4gdGhpcyBnbHVlIGRyaXZlciBsb29rcyBxdWl0ZSBz
aW1wbGUuIENhbiB0aGlzIHBsYXRmb3JtIHdvcmsNCmFzIGR3YzMtb2Ytc2ltcGxlPw0KDQpUaGFu
a3MsDQpUaGluaA==
