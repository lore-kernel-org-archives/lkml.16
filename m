Received: from mx0a-00230701.pphosted.com (mx0a-00230701.pphosted.com [148.163.156.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 025332628D;
	Tue,  3 Jun 2025 01:21:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.156.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748913711; cv=fail; b=VMyzMG+j7xh0Dh6feQK+ZJrtFbSBPCkLup9Bscbk26CWiuBfHmkoZ6ZCDQBojsxIDEU1G4i6Rn/VoPFppc4Jm1FHiMeECvjW7+qD0yIiXMQ5X0ZnE7E0j8t+e7r+QZZct4RozYPyaBki/I5h3e9dnqV3kZYKBmGOU9lZuj0n/bU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748913711; c=relaxed/simple;
	bh=8U9LskwIREdfEDY+FbZUrgweBOapZep537/Iwtjr1X8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=bEyecfFNMg0JYgJrdO7C0pOQFkUEDpx+j8FPqGeK+hgkvEK0Ygp5eQZrFuIan8Xp/ONBc2cDpUk5uiBuWKp/PmmF/5mk3djKKIJPa3nbdZ6cSa8rJxnzYIMO72JZtmfhY/vgdKcXU54FACCUVCcBmj9BdIGcIa7DDXBI42xL/yQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=MFLSlHVF; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=EVkQ+y0w; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=YN2WC1jI reason="signature verification failed"; arc=fail smtp.client-ip=148.163.156.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="MFLSlHVF";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="EVkQ+y0w";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="YN2WC1jI"
Received: from pps.filterd (m0297266.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5531BrSP016380;
	Mon, 2 Jun 2025 18:20:55 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=8U9LskwIREdfEDY+FbZUrgweBOapZep537/Iwtjr1X8=; b=
	MFLSlHVF8JkJFR2qge+UXTrbnXM7qJ4Do3oS5joq52O0sshp1K/lld+AApMkEcZs
	fB1ohVE871ZU1XKOX+rKSRAKOH0JFeMCglvPeUHhR5ubq3FbKN6WJDSC7ucIYMJt
	2V2nbMikkXTUoMgj3pj62ssqhR/XvL2RI/VlptnR57FWm6o1lZ5Eko7pJFdJUzFb
	sfLD/2bG/HIDlSN57nfp2adoiDyJKzuqpTIy+H/U/7WwBjBo4hR+8BIb4SjSUS/v
	JGX+UPoaG7QuegxYh4l6GBpi6ZW4v89X89ZnaztxFEiPo4RFovjLaaOgXrPJ+Sx0
	J1VyRJ+IIHTl+WDayWD/Gg==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 471g969kqa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 02 Jun 2025 18:20:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1748913654; bh=8U9LskwIREdfEDY+FbZUrgweBOapZep537/Iwtjr1X8=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=EVkQ+y0w36aCav+9z6B1gRSCS0u1SlRzGee6GpDFdY7DYQBvoK9+YquJoMUP9BhoT
	 Y8TzxVcE/nOQ02Jui7+WoyWXwnLGmpirVWEiAV2OL6IZmlSkzg+zX+r4UwXKBIpBza
	 K4BWE1elnrpo/7fKeQPbQmqXGbMZxqSLTkFK+qp+PAaqQgSA/2nEMg7YLcwzIPPw+M
	 cHNB/2ZQjSFVC84GnaldeBhXQULRKPBKUZfYmVn8QkQAiAHcvYI37kFIIXDvZD7ywz
	 ov8KBVKmz8/BlSydnR8tQkKgn1WLpX9XY4WggYeJVdorX25nxh6dASKJIHNIk4KBnH
	 +WCAqY/izpIhQ==
Received: from mailhost.synopsys.com (badc-mailhost4.synopsys.com [10.192.0.82])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 9B1CE40132;
	Tue,  3 Jun 2025 01:20:46 +0000 (UTC)
Received: from o365relay-in.synopsys.com (us03-o365relay1.synopsys.com [10.4.161.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id 47CF4A00A4;
	Tue,  3 Jun 2025 01:20:43 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=YN2WC1jI;
	dkim-atps=neutral
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2041.outbound.protection.outlook.com [104.47.55.41])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 90FDD40347;
	Tue,  3 Jun 2025 01:20:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=plbPhZsEF70rgP1sciPPZ3nrQPTsof2jN1Fr9JVUwFbeL+vLb04wc0wooZMyf8Lc8DaoYpkHQ9JhIR1Xvpf4VFkwDCWYY+6n9MVtawlT1S1Y2W2+v7tL4mS5fH8ocSnuOYVcA8lgfM6z3Apdn3uHzmlWtjYI8K5fv2TlTDLFbPAUFwYMcSIfJv1jLCPMc7jl/BiBxgb0KDtbu8tOZaWFIPaNBstcnogAdmeXveTojmAAMIthQwBqVU8Z/DNO9gmXCDdtcw47/kBNYHilXQU2gpkZmovEM5sxQgW95a44bUrEs7Qjk9iqYJZolz5bTt811ZDOPevaiFd1dT09dPI+Ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8U9LskwIREdfEDY+FbZUrgweBOapZep537/Iwtjr1X8=;
 b=AuGBx2nEACFEnVlntWh5ygLQTf+qu0gW2beqc70p90CQXjQc/V4w9nNRyFdoQ4XFxFCCCs09elHxzP+Vqpa+01+UHJXTwFBgxIf0TnJ17hazMNCAwJZv2+nkzrZFOvR1v/0Lq3hX8lSVfGhhWwdKXVcGkMoza/qnoyzFBwAtstVoSE/yEgVsxkfu968qh8q90ndS6l9S2WSu0nakF1IiniTPsyubI9+ZAYdTR/o1Wc1F8HmH1+kZavUbUyON8I1bKjpwo8S6IThaFSGqwoKl+vGrySxRZHripsSPPtuILSLxxhPtrHdLHrzOL7HBQky3P6suzZS7zTx6TvYzu8Sx/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8U9LskwIREdfEDY+FbZUrgweBOapZep537/Iwtjr1X8=;
 b=YN2WC1jI4GsQDUX4lZdhe5aM+n1VoK3zFFdI1MQmYHDwoIUIaJDpggRA6y8shbvEe7jzP5WK1MBwhNcSFkT3cSSNDWsZig3U1pn6jEM5YroOKlj+uG1oTNdddglA9vwf1LJiN9zQhTmAvbdgKNIgsBD/BKD2CzrCqxMbXDZFXw8=
Received: from LV2PR12MB5990.namprd12.prod.outlook.com (2603:10b6:408:170::16)
 by SA1PR12MB6893.namprd12.prod.outlook.com (2603:10b6:806:24c::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.37; Tue, 3 Jun
 2025 01:20:36 +0000
Received: from LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8]) by LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8%6]) with mapi id 15.20.8792.033; Tue, 3 Jun 2025
 01:20:35 +0000
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
Subject: Re: [PATCH v4 3/4] usb: dwc3: add generic driver to support flattened
 DT
Thread-Topic: [PATCH v4 3/4] usb: dwc3: add generic driver to support
 flattened DT
Thread-Index: AQHbzkwx6ls1Oqerk0i4clhdvzYiubPwrsqA
Date: Tue, 3 Jun 2025 01:20:35 +0000
Message-ID: <20250603012029.4agja77rdoneeyrl@synopsys.com>
References: <20250526-b4-k1-dwc3-v3-v4-0-63e4e525e5cb@whut.edu.cn>
 <20250526-b4-k1-dwc3-v3-v4-3-63e4e525e5cb@whut.edu.cn>
In-Reply-To: <20250526-b4-k1-dwc3-v3-v4-3-63e4e525e5cb@whut.edu.cn>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR12MB5990:EE_|SA1PR12MB6893:EE_
x-ms-office365-filtering-correlation-id: a3ed4db7-fbdb-4816-f49d-08dda23cd7c2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|7416014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?VVQrK3JQM3RqOEEzS1lhcGREVkxCdzVXSXFpd0V4ZjhwWmU1WVpXU1Jidlpz?=
 =?utf-8?B?SjR6aU1BaEQwY3d1NEY2OUtobHF1MHZETG9DZHRvK0h1cmxEVVJIcUduRWFQ?=
 =?utf-8?B?dUJDSXBSWXI2Uy9iYzVoWXNtd0hJRWV3NFRaNEI1NllIVnVpaXVENFUwaEdW?=
 =?utf-8?B?SjI4ZG82S2FTR2R2MDJJR3FwU0IvZ1VMQmVIN2pEaE9DRi9KY0dSYi9JOVNB?=
 =?utf-8?B?TU81dHNaZXhSbWNrU3hiNkZ0VkFNdC9BSGs1WmNnVkt1VnJ1bjl6ekhJZXNI?=
 =?utf-8?B?d2lOTWFhK2R6SGFCN0ZNTDg5azRPT0tEYUhJb1JlQmprY21QbkQ3U1ZlUlFa?=
 =?utf-8?B?cHpoZ2ZneUY1Mi8wSzl3VVVyempWcExnTFFjcnVuL0Z4VkNJaytrQ1ZnTGRQ?=
 =?utf-8?B?bzFjWERvNk1hWWtUMnhkcTRjYno4TDRpZ1hiQTZkcWszQ3dJdkdtOXJmajJP?=
 =?utf-8?B?bGltcUJneFZTUVQ3N255QS81WGtlb3JFY1VpdkQ0Wkd3VzQwUExCemhyYlhC?=
 =?utf-8?B?SHNrUmlPeDJaZ2k4L0ZuMkZpVGNzbFc1WGpHRExUZ0tmK1NyQWx3Y3lpN3BE?=
 =?utf-8?B?QnhDYnhZUlRDcHY0eC9mbWJZWVVZdXBDeGMyWjlWdkx4anN0ZzlQMEtYdWxn?=
 =?utf-8?B?VG14VnBubEQrRUIvai9jWGNia3FVbjlUcXpIbWd1dGlDWFhVZnIxTVJzSjJP?=
 =?utf-8?B?OTBUVHhvcUhqMDVZZDBPUXBUc3psNHZBbXZtOE9zbHI3VVJISVdodFRIVzZl?=
 =?utf-8?B?Rng3am9TdnBlTWFQVU0veUpWeXVodGN0dndWdkNpeFdmbEV3TlRjNjNNeDNH?=
 =?utf-8?B?OWFFM3JyUXhjRXdLOS9ZRzJwN1BKMXJJQm5ETkdzZ09DNW1sdVBaQS9aWUhI?=
 =?utf-8?B?dG50MkFaaHI5MWZ5YWE1STI2dyt0QTh1TVIrUnkvOTVvWStUc2RZL0xMSEpO?=
 =?utf-8?B?MllDeWVFRmtGTHhiK3dXbzNjQUl1M1dIRGVzMUJmanUxZTZJRGZQbzFXRGxz?=
 =?utf-8?B?dEFwRFpYbVlSYXZqRnNqdnBVQTVmSkRpYXV1RU1CQVVrS0FJdDgwS3Y4bm1J?=
 =?utf-8?B?VXZOWTJ6Z28xdHpuTWZ0MUdvZTIvV2I1Z3BzTnVOaWFZMVhlNWx0dXNOc2pI?=
 =?utf-8?B?cTY5UnJJS1VqeDBUVmp6WEdUQ0k5Y2srOWFicjdpUHhNUmQrK1g3TU1Kcmt4?=
 =?utf-8?B?MXBBL1NIL3dQeUxqUmxPWTlKYW9sNHlmNkdVVmhlVUdjVGorSENZSlY1VWxL?=
 =?utf-8?B?TUpQZktBNTNvMHV4ZTVLWTFOSWpseW0zN3hLS3MzT2JKNEJwNW91SkVOZkVq?=
 =?utf-8?B?OU9udjVseU96VjhNcHdVU1l0Q2NRaGpFd0E2QTdrQnJRbDdXNDFmKzNpNW1H?=
 =?utf-8?B?blhIM1RjT3E2aDRKRThwMFNuN3huNnVPU2VBTThQNS9sZlFmOEYyL3dpMWRT?=
 =?utf-8?B?YXpFb29TenV4YmkyaWREYUlCYU5wVmlmTk9Sc1FDczVjTytHcGszVUl2czIv?=
 =?utf-8?B?b1BQck9uOEZhZDNueGZVdzVzRnBJS2FnQVU5MGtISTExRS9XaFBoeU4wa0lN?=
 =?utf-8?B?RVZ4QnJ4RndzYXpXb0FyV2h1bk9KV0lQRXlDQUFiREJKTUpVclNoVjBoWWts?=
 =?utf-8?B?MUtSMzNKNk5WVTQzRUEwdjBObzZDV3hnT0JPbThqcHhVNlVKVGtLYlpGYXcr?=
 =?utf-8?B?RXp4WWo4RU5HeEN0Y2w2cHNtRXJvVkh3cWhvLzJXdy9HTDRTMEJ6dnBma0p4?=
 =?utf-8?B?Y2R4RFZtbEpZaURKUml1RmEyQkpFbXNlWXZzYmt0N2JGR0l5R2tPNWxGWWgr?=
 =?utf-8?B?U0FkNmNJWlNNdDRFOXo2Z3BtWCtWb21OUy9rK045L216cVJmMXdCdWVoWUg3?=
 =?utf-8?B?QUlkenFydTJyMm9tRFNGWkFndWpoZkN6SzVUcU9FaU84UDlaZDc3enM3U0w1?=
 =?utf-8?B?WXN6Rk9QQ0FNM3dQcVhzOWlOMDBJY0Z5MW9UU2U0OStSQWVMb0RUdmJqREtE?=
 =?utf-8?Q?M8wx30idTBigvG+jMYIMhZGcrU0mZA=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?ZVNMcWlScjF4d3NPYnpER2l6WVRab0hjOWhEaWVFM2xNVU55Q09JRHZhUUlp?=
 =?utf-8?B?NXNrVTRSR3NscDhGUzF6Q1dzc2VNclRNWTFwSzdWamdjN0RXSW5sVWVsTHds?=
 =?utf-8?B?eEtLMHpwaUNoRWV6Znl5K3V5R0FiZDRNT0pickNRNE1UUzNIdlJudTBWSkJK?=
 =?utf-8?B?TzNwNGI0L0VMQm1jSmdVSjBtZmkrZ1hOTVhucExiY1d4Z1FteHlCbkJrMUND?=
 =?utf-8?B?cExaZmMvem4ydlpUb3ZIbzBIdEpUcUhaOVUwSmZObGw3cXhWdmx1ZllNM0lu?=
 =?utf-8?B?V2l4RERieVBkYzZVQ0FkVnZYUHRVV3RkSWZLTllFZ0FHVElzVElnZXIrR3JV?=
 =?utf-8?B?ZVdLbmwvTW91UElLSnFVczZNeEdSVFo0cE13dzZ0dXAyYkpWWTRHVkRmUnI2?=
 =?utf-8?B?c3Z2MVcyc3VxY0llRFV5RE5RZENmb3FiV1Y4ZENUVFBJN0xGVnN5RjFhMWRo?=
 =?utf-8?B?b0tCVVRoSTZyc204RktNSlg4aytrdGVHV3VJNmJBdVk1NGlTdW4rejB5K3FI?=
 =?utf-8?B?c3NOeGVVY0pWcHpQNjAydjJ2K05DOVFDYThwQ3pReUw4QUo5N21SQldRQ21t?=
 =?utf-8?B?MVRrb1ppbmVTSE5NbXlycys3Q3RsMTRxb2h1Vk90OVpCWnZWNDhSY2FOQjhD?=
 =?utf-8?B?ZWUxYTluRGQ1UnZtZTZYTHZaNmpRNTVwajVCQVJMODlzU1NWRFdKcmNYVTZi?=
 =?utf-8?B?WWVkV1ZZaGVKQmNpYW5ZL1lkUUZNaTZZMnFSOHFRa3ZXUEVEVlU4MmN0YktR?=
 =?utf-8?B?MVVGNWJRU0V1Z3VYeXFRY2Y5UDRSTVQrVENwQ1AyWVNOVm12b3BNaEVzbmVq?=
 =?utf-8?B?NThRRVZqTmhONktZOVpHcUI3NDBBNEQ5WmJJczIwaHEzdnBYeDVJU1lPbi9k?=
 =?utf-8?B?eEFsZ0JxSDBSejBPcUVnbnVMTXc3MDBNcEwrYThncXFmcXNpTGQ3M24wd1Nz?=
 =?utf-8?B?SFVCSURrMEwrMjZtY3FCOG9oNVV3TC9tVkxNbHZXVlNNclBSbDF2S2taTXFu?=
 =?utf-8?B?T2dwdU41U3c3cVEwa3BNVXZ0ZEpnVUc3N0xBSU5JUnVBVndsZm5vdFpkenVH?=
 =?utf-8?B?MWdJY05sT012TDVvK1YyeU56dEpGQnk0dHVRbUQwaDBrVWtUbjlxUHI2NDZG?=
 =?utf-8?B?N2p1NERpMHpTelcwOXprQ2NXRWpxcUVQR0hPckEyTFZ1MlExT3JPeEFNd2RQ?=
 =?utf-8?B?elI1U1UxUzJDVDA1YVNSNGR6RVVwRXRnL1pCVE9pVm4rOVYxWmNCaVgyc2x6?=
 =?utf-8?B?NWZEZVJ2Y2RWWnNxNjQ0UENDNGwxU2RsZ21RUmd3bHg4N3FnNlo4MGx5ZUFX?=
 =?utf-8?B?YlJWK2t4VTRhQ28zQ2pZdlRnMW9uNHhiUExWdFQvVENucnZCdUhsenRQdGU4?=
 =?utf-8?B?MmZzS051NzhGTWFpam56SzFQWHpucEJLT05nRGdXTUw3d3RMWEQvbUc5QytY?=
 =?utf-8?B?cFdXWVpicGIxMVkzSHB5b2lyMDZJQUdrenQyalRKMXVoeWdlMmJOVFVnb2Ji?=
 =?utf-8?B?SUZaZTA0MDAySytNR0lpM3FBN0xGOUw5aC9QZFRHaWFaZDV0Qi8rQjV1YlVm?=
 =?utf-8?B?ZWpyd0l6NFMvTlcrYzI4NWJSS1p5M3J0cFpPWW1XNzJ6RWg2RUh6aHVmZDlH?=
 =?utf-8?B?NUNwNUt6a2JlaXpPUUcyeUEvTFc1RzhjVHYvVWIxTk1GWGtjV283SWVqOFpR?=
 =?utf-8?B?bkcxUkJUWWt1eFlwOHl2WE5ySThORkR5MVJOa3FPMEJsUVVSMHI4UjBiQnNw?=
 =?utf-8?B?WEVWQmdUYUsyUm9MSVBVdGc0SFlaRXE4U0VwUzVndEFad2ZOTjJveEg3eG1Y?=
 =?utf-8?B?SkVDOGVES1hNOEgrZE9MR1pRS21aRU0rbW5Hc1VLSlZQT3hDLzBVOUxhOHNi?=
 =?utf-8?B?YWEwZFYxTFkxUlV6UTVDSmVIVXVQTE5icDFBUmQ1Y1J3VzZlWDhhL0h1b0RS?=
 =?utf-8?B?RytESHl5V2UzWXNGQmlwRnNwQU5hc1dpay92UjZrSzZsYnErdHVUdHRkV24y?=
 =?utf-8?B?NkNvaEpqaW12QzBvdmpiTGhtUVBNd2dQVFl0SWdobENkWVNmWmdveTJ5bGFF?=
 =?utf-8?B?M2VBVzA3bU1XcmNWWi8rcmpZZEhUcTMxVVhtaUR3YTVrMjl4dGJGSk9USnA2?=
 =?utf-8?Q?5lybUyN6MGf76ZVOUezA5aS57?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <EB9728719F33DD4497BF494F604285D9@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	PFaQTP0KV5WoAVNN2KpDfCeJAM3/N+N0qDh9QrrSgUEBohJy7ot22gtAIFpEkqeqXPD6NGcqH2U8/Y2bHTvMYFkemm4N2pXIe/0UNwLlndo5VD+SblxPfz95tiwOJbqZoT6BdwBHDPyCSvbKCVdo8eQbbJ8s9y/Xc5efhmP/oHHOkxc6oPQOXRhAMPwWHmqzT5VP5FLZaXHIZ40bsh+h80iAdCLJSBpOpHCIITOB7Iz3+OoGsksBHAQRsqj9GP9flnAAr0ioXap65AALWUNTow2irynbsoOfZ1fDjkq64WDB9WByGzG1cFnPP108xDdhnsrcn6FnZ8ZdVI/G69dHon0INDqHHjXTxT/89di8xtgXx83uQtaSudfwlT99elnpYlomp/LbVAPm40ocLKz0ACiHjhUREIKw1AfBFG7ig9OxboMdrBbE5yATCR9SX0QEBiJhQMOp49bVzQsuRjEWq+zwEeIR0zWURoSZIY/yh51wA3fLWOr8Ei/n1iQ4lzVpTwHqYzXvtCVkm03SlsrFeU5jL482iLzcanoCv1DdZVdnV2QPHZoHAaYXciFdUmngeMMEFdWeaaJyj6q91skuB+D3K6jUKmZ+0WN3ECTrhRYrfMUpxD3+z6fdVZJwLWbsN3H/1Umd+FGy/QfTGBd7gA==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a3ed4db7-fbdb-4816-f49d-08dda23cd7c2
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jun 2025 01:20:35.7751
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BJdYbfutOqtz8lRrAUfSKE5L/euu6AVICL0RiuOTlPKrbrQFDmbnLiGVFHHm8PtSeDdvym3DrlVvgWSICdz9Sg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6893
X-Proofpoint-GUID: 6XqASLdw8-UgcAGUDiduI5iSIdwQFSez
X-Proofpoint-ORIG-GUID: 6XqASLdw8-UgcAGUDiduI5iSIdwQFSez
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjAzMDAwOSBTYWx0ZWRfXxyt/4WA/MkuE
 I90onLiZfUIyz6CaMlmnh2kuWk+kjGqsoXSNVGT0t2GoCTwa7+4oLSS0mjrId9HEaDKvuQf95FJ
 LxvP+1bPSa/WDZVGX+iOGlilz5HKrhjrEh2X7YACQW9IPqWaWptrdwp97+yGX/CTaqJeDj3x4ey
 /HXf0/tTdv6VV0Hi8X0HIkCHCuIycbtAMo5zjS1V7AjQDPU1NcQBC/hacqNOlC4o9y5iegCdZxA
 08hONiiFsR/bP8mLDam+z4fE6Npc0EYYCkLDxkNrgN3fAZd3/aczqiFDB2LV3Ilrry1Oo7ZeDLF
 nNcOO9QQQlFgbWrjvMQFTf34ok7CouT6fOVOaeTwwNKL/gQh7rRU5QMTcAZToSbBC9u2nUkDvXq
 FsWVFLZIrygW5PqRxoi4JXPL1C/mJztokCkNpD+alcpd2Rl85oACC9p4Z+TMqq6zqMvzDBO9
X-Authority-Analysis: v=2.4 cv=VIrdn8PX c=1 sm=1 tr=0 ts=683e4df6 cx=c_pps
 a=t4gDRyhI9k+KZ5gXRQysFQ==:117 a=t4gDRyhI9k+KZ5gXRQysFQ==:17
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6IFa9wvqVegA:10 a=qPHU084jO2kA:10 a=pGLkceISAAAA:8 a=_vetTfaIHP0e6m5HPtYA:9
 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-02_08,2025-06-02_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0 mlxlogscore=999 phishscore=0
 clxscore=1015 mlxscore=0 suspectscore=0 priorityscore=1501 lowpriorityscore=0
 spamscore=0 malwarescore=0 adultscore=0 impostorscore=0 bulkscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2505280000 definitions=main-2506030009

T24gTW9uLCBNYXkgMjYsIDIwMjUsIFplIEh1YW5nIHdyb3RlOg0KPiBUbyBzdXBwb3J0IGZsYXR0
ZW5lZCBkd2MzIGR0IG1vZGVsIGFuZCBkcm9wIHRoZSBnbHVlIGxheWVyLCBpbnRyb2R1Y2UgdGhl
DQo+IGBkd2MzLWdlbmVyaWNgIGRyaXZlci4gVGhpcyBlbmFibGVzIGRpcmVjdCBiaW5kaW5nIG9m
IHRoZSBEV0MzIGNvcmUgZHJpdmVyDQo+IGFuZCBvZmZlcnMgYW4gYWx0ZXJuYXRpdmUgdG8gdGhl
IGV4aXN0aW5nIGdsdWUgZHJpdmVyIGBkd2MzLW9mLXNpbXBsZWAuDQo+IA0KPiBTaWduZWQtb2Zm
LWJ5OiBaZSBIdWFuZyA8aHVhbmd6ZUB3aHV0LmVkdS5jbj4NCj4gLS0tDQo+ICBkcml2ZXJzL3Vz
Yi9kd2MzL0tjb25maWcgICAgICAgICAgICAgfCAgIDkgKysNCj4gIGRyaXZlcnMvdXNiL2R3YzMv
TWFrZWZpbGUgICAgICAgICAgICB8ICAgMSArDQo+ICBkcml2ZXJzL3VzYi9kd2MzL2R3YzMtZ2Vu
ZXJpYy1wbGF0LmMgfCAxODkgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysNCj4g
IDMgZmlsZXMgY2hhbmdlZCwgMTk5IGluc2VydGlvbnMoKykNCj4gDQo+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL3VzYi9kd2MzL0tjb25maWcgYi9kcml2ZXJzL3VzYi9kd2MzL0tjb25maWcNCj4gaW5k
ZXggMzEwZDE4MmUxMGI1MGIyNTNkN2U1YTUxNjc0ODA2ZTZlYzQ0MmEyYS4uMDgyNjI3ZjM5Yzk3
MjZlZTRlMGM1Zjk2NmM1YmM0NTRmNTU0MWM5YSAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy91c2Iv
ZHdjMy9LY29uZmlnDQo+ICsrKyBiL2RyaXZlcnMvdXNiL2R3YzMvS2NvbmZpZw0KPiBAQCAtMTE4
LDYgKzExOCwxNSBAQCBjb25maWcgVVNCX0RXQzNfT0ZfU0lNUExFDQo+ICAJICBDdXJyZW50bHkg
c3VwcG9ydHMgWGlsaW54IGFuZCBRdWFsY29tbSBEV0MgVVNCMyBJUC4NCj4gIAkgIFNheSAnWScg
b3IgJ00nIGlmIHlvdSBoYXZlIG9uZSBzdWNoIGRldmljZS4NCj4gIA0KPiArY29uZmlnIFVTQl9E
V0MzX0dFTkVSSUNfUExBVA0KPiArICAgICAgIHRyaXN0YXRlICJEV0MzIEdlbmVyaWMgUGxhdGZv
cm0gRHJpdmVyIg0KPiArICAgICAgIGRlcGVuZHMgb24gT0YgJiYgQ09NTU9OX0NMSw0KPiArICAg
ICAgIGRlZmF1bHQgVVNCX0RXQzMNCj4gKyAgICAgICBoZWxwDQo+ICsgICAgICAgICBTdXBwb3J0
IFVTQjMgZnVuY3Rpb25hbGl0eSBpbiBzaW1wbGUgU29DIGludGVncmF0aW9ucy4NCj4gKyAgICAg
ICAgIEN1cnJlbnRseSBzdXBwb3J0cyBTcGFjZW1pVCBEV0MgVVNCMyBJUC4NCj4gKyAgICAgICAg
IFNheSAnWScgb3IgJ00nIGlmIHlvdSBoYXZlIG9uZSBzdWNoIGRldmljZS4NCj4gKw0KPiAgY29u
ZmlnIFVTQl9EV0MzX1NUDQo+ICAJdHJpc3RhdGUgIlNUTWljcm9lbGVjdHJvbmljcyBQbGF0Zm9y
bXMiDQo+ICAJZGVwZW5kcyBvbiAoQVJDSF9TVEkgfHwgQ09NUElMRV9URVNUKSAmJiBPRg0KPiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy91c2IvZHdjMy9NYWtlZmlsZSBiL2RyaXZlcnMvdXNiL2R3YzMv
TWFrZWZpbGUNCj4gaW5kZXggODMwZTZjOWU1ZmUwNzNjMWY2NjJjZTM0YjZhNGEyZGEzNGM0MDdh
Mi4uOTY0NjllNDhmZjlkMTg5Y2M4ZDBiNjVlNjU0MjRlYWUyMTU4YmNmZSAxMDA2NDQNCj4gLS0t
IGEvZHJpdmVycy91c2IvZHdjMy9NYWtlZmlsZQ0KPiArKysgYi9kcml2ZXJzL3VzYi9kd2MzL01h
a2VmaWxlDQo+IEBAIC01NywzICs1Nyw0IEBAIG9iai0kKENPTkZJR19VU0JfRFdDM19JTVg4TVAp
CQkrPSBkd2MzLWlteDhtcC5vDQo+ICBvYmotJChDT05GSUdfVVNCX0RXQzNfWElMSU5YKQkJKz0g
ZHdjMy14aWxpbngubw0KPiAgb2JqLSQoQ09ORklHX1VTQl9EV0MzX09DVEVPTikJCSs9IGR3YzMt
b2N0ZW9uLm8NCj4gIG9iai0kKENPTkZJR19VU0JfRFdDM19SVEspCQkrPSBkd2MzLXJ0ay5vDQo+
ICtvYmotJChDT05GSUdfVVNCX0RXQzNfR0VORVJJQ19QTEFUKQkrPSBkd2MzLWdlbmVyaWMtcGxh
dC5vDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3VzYi9kd2MzL2R3YzMtZ2VuZXJpYy1wbGF0LmMg
Yi9kcml2ZXJzL3VzYi9kd2MzL2R3YzMtZ2VuZXJpYy1wbGF0LmMNCj4gbmV3IGZpbGUgbW9kZSAx
MDA2NDQNCj4gaW5kZXggMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMC4u
OGZmNDYyNmQzMjRjNDBlY2I1MmUxMTU4MzJjODAzZmVkN2QzODM1NA0KPiAtLS0gL2Rldi9udWxs
DQo+ICsrKyBiL2RyaXZlcnMvdXNiL2R3YzMvZHdjMy1nZW5lcmljLXBsYXQuYw0KPiBAQCAtMCww
ICsxLDE4OSBAQA0KPiArLy8gU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAtb25seQ0K
PiArLyoNCj4gKyAqIGR3YzMtZ2VuZXJpYy1wbGF0LmMgLSBEZXNpZ25XYXJlIFVTQjMgZ2VuZXJp
YyBwbGF0Zm9ybSBkcml2ZXINCj4gKyAqDQo+ICsgKiBDb3B5cmlnaHQgKEMpIDIwMjUgWmUgSHVh
bmcgPGh1YW5nemU5MDE1QGdtYWlsLmNvbT4NCj4gKyAqDQo+ICsgKiBJbnNwaXJlZCBieSBkd2Mz
LXFjb20uYyBhbmQgZHdjMy1vZi1zaW1wbGUuYw0KPiArICovDQo+ICsNCj4gKyNpbmNsdWRlIDxs
aW51eC9jbGsuaD4NCj4gKyNpbmNsdWRlIDxsaW51eC9kZWxheS5oPg0KPiArI2luY2x1ZGUgPGxp
bnV4L29mX3BsYXRmb3JtLmg+DQo+ICsjaW5jbHVkZSA8bGludXgvb2ZfYWRkcmVzcy5oPg0KPiAr
I2luY2x1ZGUgPGxpbnV4L3BsYXRmb3JtX2RldmljZS5oPg0KPiArI2luY2x1ZGUgPGxpbnV4L3Jl
c2V0Lmg+DQo+ICsjaW5jbHVkZSAiZ2x1ZS5oIg0KPiArDQo+ICtzdHJ1Y3QgZHdjM19nZW5lcmlj
IHsNCj4gKwlzdHJ1Y3QgZGV2aWNlCQkqZGV2Ow0KPiArCXN0cnVjdCBkd2MzCQlkd2M7DQo+ICsJ
c3RydWN0IGNsa19idWxrX2RhdGEJKmNsa3M7DQo+ICsJaW50CQkJbnVtX2Nsb2NrczsNCj4gKwlz
dHJ1Y3QgcmVzZXRfY29udHJvbAkqcmVzZXRzOw0KPiArfTsNCj4gKw0KPiArc3RhdGljIGludCBk
d2MzX2dlbmVyaWNfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikNCj4gK3sNCj4g
KwlzdHJ1Y3QgZHdjM19wcm9iZV9kYXRhIHByb2JlX2RhdGEgPSB7fTsNCj4gKwlzdHJ1Y3QgZGV2
aWNlICpkZXYgPSAmcGRldi0+ZGV2Ow0KPiArCXN0cnVjdCBkd2MzX2dlbmVyaWMgKmR3YzM7DQo+
ICsJc3RydWN0IHJlc291cmNlICpyZXM7DQo+ICsJaW50IHJldDsNCj4gKw0KPiArCWR3YzMgPSBk
ZXZtX2t6YWxsb2MoZGV2LCBzaXplb2YoKmR3YzMpLCBHRlBfS0VSTkVMKTsNCj4gKwlpZiAoIWR3
YzMpDQo+ICsJCXJldHVybiAtRU5PTUVNOw0KPiArDQo+ICsJZHdjMy0+ZGV2ID0gZGV2Ow0KPiAr
DQo+ICsJcGxhdGZvcm1fc2V0X2RydmRhdGEocGRldiwgZHdjMyk7DQo+ICsNCj4gKwlyZXMgPSBw
bGF0Zm9ybV9nZXRfcmVzb3VyY2UocGRldiwgSU9SRVNPVVJDRV9NRU0sIDApOw0KPiArCWlmICgh
cmVzKSB7DQo+ICsJCWRldl9lcnIoJnBkZXYtPmRldiwgIm1pc3NpbmcgbWVtb3J5IHJlc291cmNl
XG4iKTsNCj4gKwkJcmV0dXJuIC1FTk9ERVY7DQo+ICsJfQ0KPiArDQo+ICsJZHdjMy0+cmVzZXRz
ID0gb2ZfcmVzZXRfY29udHJvbF9hcnJheV9nZXRfb3B0aW9uYWxfZXhjbHVzaXZlKGRldi0+b2Zf
bm9kZSk7DQo+ICsJaWYgKElTX0VSUihkd2MzLT5yZXNldHMpKQ0KPiArCQlyZXR1cm4gZGV2X2Vy
cl9wcm9iZShkZXYsIFBUUl9FUlIoZHdjMy0+cmVzZXRzKSwgImZhaWxlZCB0byBnZXQgcmVzZXRc
biIpOw0KPiArDQo+ICsJcmV0ID0gcmVzZXRfY29udHJvbF9hc3NlcnQoZHdjMy0+cmVzZXRzKTsN
Cj4gKwlpZiAocmV0KQ0KPiArCQlyZXR1cm4gZGV2X2Vycl9wcm9iZShkZXYsIHJldCwgImZhaWxl
ZCB0byBhc3NlcnQgcmVzZXRcbiIpOw0KPiArDQo+ICsJdXNsZWVwX3JhbmdlKDEwLCAxMDAwKTsN
Cj4gKw0KPiArCXJldCA9IHJlc2V0X2NvbnRyb2xfZGVhc3NlcnQoZHdjMy0+cmVzZXRzKTsNCj4g
KwlpZiAocmV0KSB7DQo+ICsJCWRldl9lcnIoZGV2LCAiZmFpbGVkIHRvIGRlYXNzZXJ0IHJlc2V0
XG4iKTsNCj4gKwkJZ290byByZXNldF9hc3NlcnQ7DQo+ICsJfQ0KPiArDQo+ICsJcmV0ID0gY2xr
X2J1bGtfZ2V0X2FsbChkd2MzLT5kZXYsICZkd2MzLT5jbGtzKTsNCj4gKwlpZiAocmV0IDwgMCkg
ew0KPiArCQlkZXZfZXJyKGRldiwgImZhaWxlZCB0byBnZXQgY2xvY2tzXG4iKTsNCj4gKwkJZ290
byByZXNldF9hc3NlcnQ7DQo+ICsJfQ0KPiArDQo+ICsJZHdjMy0+bnVtX2Nsb2NrcyA9IHJldDsN
Cj4gKw0KPiArCXJldCA9IGNsa19idWxrX3ByZXBhcmVfZW5hYmxlKGR3YzMtPm51bV9jbG9ja3Ms
IGR3YzMtPmNsa3MpOw0KPiArCWlmIChyZXQpIHsNCj4gKwkJZGV2X2VycihkZXYsICJmYWlsZWQg
dG8gZW5hYmxlIGNsb2Nrc1xuIik7DQo+ICsJCWdvdG8gcmVzZXRfYXNzZXJ0Ow0KPiArCX0NCj4g
Kw0KPiArCWR3YzMtPmR3Yy5kZXYgPSBkZXY7DQo+ICsJcHJvYmVfZGF0YS5kd2MgPSAmZHdjMy0+
ZHdjOw0KPiArCXByb2JlX2RhdGEucmVzID0gcmVzOw0KPiArCXByb2JlX2RhdGEuaWdub3JlX2Ns
b2Nrc19hbmRfcmVzZXRzID0gdHJ1ZTsNCj4gKwlyZXQgPSBkd2MzX2NvcmVfcHJvYmUoJnByb2Jl
X2RhdGEpOw0KPiArCWlmIChyZXQpICB7DQo+ICsJCWRldl9lcnIoZGV2LCAiZmFpbGVkIHRvIHJl
Z2lzdGVyIERXQzMgQ29yZVxuIik7DQo+ICsJCWdvdG8gY2xrX2Rpc2FibGU7DQo+ICsJfQ0KPiAr
DQo+ICsJcmV0dXJuIDA7DQo+ICsNCj4gK2Nsa19kaXNhYmxlOg0KPiArCWNsa19idWxrX2Rpc2Fi
bGVfdW5wcmVwYXJlKGR3YzMtPm51bV9jbG9ja3MsIGR3YzMtPmNsa3MpOw0KPiArCWNsa19idWxr
X3B1dF9hbGwoZHdjMy0+bnVtX2Nsb2NrcywgZHdjMy0+Y2xrcyk7DQo+ICsNCj4gK3Jlc2V0X2Fz
c2VydDoNCj4gKwlyZXNldF9jb250cm9sX2Fzc2VydChkd2MzLT5yZXNldHMpOw0KPiArDQo+ICsJ
cmV0dXJuIHJldDsNCj4gK30NCj4gKw0KPiArc3RhdGljIHZvaWQgZHdjM19nZW5lcmljX3JlbW92
ZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQ0KPiArew0KPiArCXN0cnVjdCBkd2MzX2dl
bmVyaWMgKmR3YzMgPSBwbGF0Zm9ybV9nZXRfZHJ2ZGF0YShwZGV2KTsNCj4gKw0KPiArCWR3YzNf
Y29yZV9yZW1vdmUoJmR3YzMtPmR3Yyk7DQo+ICsNCj4gKwljbGtfYnVsa19kaXNhYmxlX3VucHJl
cGFyZShkd2MzLT5udW1fY2xvY2tzLCBkd2MzLT5jbGtzKTsNCj4gKwljbGtfYnVsa19wdXRfYWxs
KGR3YzMtPm51bV9jbG9ja3MsIGR3YzMtPmNsa3MpOw0KPiArDQo+ICsJcmVzZXRfY29udHJvbF9h
c3NlcnQoZHdjMy0+cmVzZXRzKTsNCj4gK30NCj4gKw0KPiArc3RhdGljIGludCBfX21heWJlX3Vu
dXNlZCBkd2MzX2dlbmVyaWNfc3VzcGVuZChzdHJ1Y3QgZGV2aWNlICpkZXYpDQoNCldlIHNob3Vs
ZG4ndCBuZWVkIF9fbWF5YmVfdW51c2VkIGF0dHIgd2l0aCB0aGUgbmV3IFBNIG1hY3Jvcy4NCg0K
PiArew0KPiArCXN0cnVjdCBkd2MzX2dlbmVyaWMgKmR3YzMgPSBkZXZfZ2V0X2RydmRhdGEoZGV2
KTsNCj4gKwlpbnQgcmV0Ow0KPiArDQo+ICsJcmV0ID0gZHdjM19wbV9zdXNwZW5kKCZkd2MzLT5k
d2MpOw0KPiArCWlmIChyZXQpDQo+ICsJCXJldHVybiByZXQ7DQo+ICsNCj4gKwljbGtfYnVsa19k
aXNhYmxlX3VucHJlcGFyZShkd2MzLT5udW1fY2xvY2tzLCBkd2MzLT5jbGtzKTsNCj4gKw0KPiAr
CXJldHVybiAwOw0KPiArfQ0KPiArDQo+ICtzdGF0aWMgaW50IF9fbWF5YmVfdW51c2VkIGR3YzNf
Z2VuZXJpY19yZXN1bWUoc3RydWN0IGRldmljZSAqZGV2KQ0KPiArew0KPiArCXN0cnVjdCBkd2Mz
X2dlbmVyaWMgKmR3YzMgPSBkZXZfZ2V0X2RydmRhdGEoZGV2KTsNCj4gKwlpbnQgcmV0Ow0KPiAr
DQo+ICsJcmV0ID0gY2xrX2J1bGtfcHJlcGFyZV9lbmFibGUoZHdjMy0+bnVtX2Nsb2NrcywgZHdj
My0+Y2xrcyk7DQo+ICsJaWYgKHJldCkNCj4gKwkJcmV0dXJuIHJldDsNCj4gKw0KPiArCXJldCA9
IGR3YzNfcG1fcmVzdW1lKCZkd2MzLT5kd2MpOw0KPiArCWlmIChyZXQpDQo+ICsJCXJldHVybiBy
ZXQ7DQo+ICsNCj4gKwlyZXR1cm4gMDsNCj4gK30NCj4gKw0KPiArc3RhdGljIGludCBfX21heWJl
X3VudXNlZCBkd2MzX2dlbmVyaWNfcnVudGltZV9zdXNwZW5kKHN0cnVjdCBkZXZpY2UgKmRldikN
Cj4gK3sNCj4gKwlzdHJ1Y3QgZHdjM19nZW5lcmljICpkd2MzID0gZGV2X2dldF9kcnZkYXRhKGRl
dik7DQo+ICsNCj4gKwlyZXR1cm4gZHdjM19ydW50aW1lX3N1c3BlbmQoJmR3YzMtPmR3Yyk7DQo+
ICt9DQo+ICsNCj4gK3N0YXRpYyBpbnQgX19tYXliZV91bnVzZWQgZHdjM19nZW5lcmljX3J1bnRp
bWVfcmVzdW1lKHN0cnVjdCBkZXZpY2UgKmRldikNCj4gK3sNCj4gKwlzdHJ1Y3QgZHdjM19nZW5l
cmljICpkd2MzID0gZGV2X2dldF9kcnZkYXRhKGRldik7DQo+ICsNCj4gKwlyZXR1cm4gZHdjM19y
dW50aW1lX3Jlc3VtZSgmZHdjMy0+ZHdjKTsNCj4gK30NCj4gKw0KPiArc3RhdGljIGludCBfX21h
eWJlX3VudXNlZCBkd2MzX2dlbmVyaWNfcnVudGltZV9pZGxlKHN0cnVjdCBkZXZpY2UgKmRldikN
Cj4gK3sNCj4gKwlzdHJ1Y3QgZHdjM19nZW5lcmljICpkd2MzID0gZGV2X2dldF9kcnZkYXRhKGRl
dik7DQo+ICsNCj4gKwlyZXR1cm4gZHdjM19ydW50aW1lX2lkbGUoJmR3YzMtPmR3Yyk7DQo+ICt9
DQo+ICsNCj4gK3N0YXRpYyBjb25zdCBzdHJ1Y3QgZGV2X3BtX29wcyBkd2MzX2dlbmVyaWNfZGV2
X3BtX29wcyA9IHsNCj4gKwlTRVRfU1lTVEVNX1NMRUVQX1BNX09QUyhkd2MzX2dlbmVyaWNfc3Vz
cGVuZCwgZHdjM19nZW5lcmljX3Jlc3VtZSkNCj4gKwlTRVRfUlVOVElNRV9QTV9PUFMoZHdjM19n
ZW5lcmljX3J1bnRpbWVfc3VzcGVuZCwgZHdjM19nZW5lcmljX3J1bnRpbWVfcmVzdW1lLA0KPiAr
CQkJICAgZHdjM19nZW5lcmljX3J1bnRpbWVfaWRsZSkNCj4gK307DQo+ICsNCj4gK3N0YXRpYyBj
b25zdCBzdHJ1Y3Qgb2ZfZGV2aWNlX2lkIGR3YzNfZ2VuZXJpY19vZl9tYXRjaFtdID0gew0KPiAr
CXsgLmNvbXBhdGlibGUgPSAic3BhY2VtaXQsazEtZHdjMyIsIH0sDQo+ICsJeyAvKiBzZW50aW5l
bCAqLyB9DQo+ICt9Ow0KPiArTU9EVUxFX0RFVklDRV9UQUJMRShvZiwgZHdjM19nZW5lcmljX29m
X21hdGNoKTsNCj4gKw0KPiArc3RhdGljIHN0cnVjdCBwbGF0Zm9ybV9kcml2ZXIgZHdjM19nZW5l
cmljX2RyaXZlciA9IHsNCj4gKwkucHJvYmUJCT0gZHdjM19nZW5lcmljX3Byb2JlLA0KPiArCS5y
ZW1vdmUJCT0gZHdjM19nZW5lcmljX3JlbW92ZSwNCj4gKwkuZHJpdmVyCQk9IHsNCj4gKwkJLm5h
bWUJPSAiZHdjMy1nZW5lcmljLXBsYXQiLA0KPiArCQkub2ZfbWF0Y2hfdGFibGUgPSBkd2MzX2dl
bmVyaWNfb2ZfbWF0Y2gsDQo+ICsjaWZkZWYgQ09ORklHX1BNX1NMRUVQDQoNClVzZSB0aGUgbmV3
IHBtX3B0ci9wbV9zbGVlcF9wdHIuDQoNClRoYW5rcywNClRoaW5oDQoNCj4gKwkJLnBtCT0gJmR3
YzNfZ2VuZXJpY19kZXZfcG1fb3BzLA0KPiArI2VuZGlmIC8qIENPTkZJR19QTV9TTEVFUCAqLw0K
PiArCX0sDQo+ICt9Ow0KPiArbW9kdWxlX3BsYXRmb3JtX2RyaXZlcihkd2MzX2dlbmVyaWNfZHJp
dmVyKTsNCj4gKw0KPiArTU9EVUxFX0xJQ0VOU0UoIkdQTCIpOw0KPiArTU9EVUxFX0RFU0NSSVBU
SU9OKCJEZXNpZ25XYXJlIFVTQjMgZ2VuZXJpYyBwbGF0Zm9ybSBkcml2ZXIiKTsNCj4gDQo+IC0t
IA0KPiAyLjQ5LjANCj4g
