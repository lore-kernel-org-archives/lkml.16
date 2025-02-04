Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EE4925A642;
	Tue,  4 Feb 2025 00:55:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.158.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738630531; cv=fail; b=Am9Giga91zFwkdSqCpSohiVFet4+sKkvYer7h9mhGZ3btDgL+u3zXV1npAGI/la4svZpto1amt6bewYSPIGdDQDS8YlzUsAiEO2AgpvhfohLYJlXOpV3E6xCvEATxrlKBKRnKzf/rlrjdbxtTGZyBIxTCS40DZlcn7CVbuU644A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738630531; c=relaxed/simple;
	bh=MkPrSMbm09Y+UqmlILT/cDTAxt23mUU9C3VCs8h9pmU=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=LavPv2zCoXXrleJStf8g0zPjaJ+xuxW0b4L41YoWTez6mUXx4vVdajzAQteCvOfb+TGg+nikv6Os7MeRevHMnIBbWj7wi79HqyKbnMOsrCnQwde7FyxvGW80v45JnwHcUQ0161R/Q0iOCUz2+S/tZUOZ2sgkbJgUd2hWuLRV20A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=CFLkNMwd; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=W4MQU1OY; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=K5bXP1Au reason="signature verification failed"; arc=fail smtp.client-ip=148.163.158.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="CFLkNMwd";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="W4MQU1OY";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="K5bXP1Au"
Received: from pps.filterd (m0098572.ppops.net [127.0.0.1])
	by mx0b-00230701.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 513N5We9020256;
	Mon, 3 Feb 2025 16:54:58 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=MkPrSMbm09Y+UqmlILT/cDTAxt23mUU9C3VCs8h9pmU=; b=
	CFLkNMwd0kXV1f7+fdV3kzXMMyB/SAXzgAgpk2/LpfXATJtcKtM6B8MSELGZo3l2
	4B92ZnaYU7qjTnn3J3errOUJq/m1OCRcZq1jWmTgSG+m+5LEm3xNb801Bi0IUmSv
	eTwZQArKU2clOLMQXfyHGEa3HXrXZDiPztvST5G2WHpXOnEUfNIYF/vXxh7i/LpW
	A2GugGGvSsrV+KL5w7lx9SWZ3tRE24KQEJ1kGQeab7kkTOUEPQOnQfFiD8BLSi5R
	344b2f67/FD2+Uw/PcQVrJRz8CFU2f6i6D9idQ4lsvnMr9ixXn3AmEeYg7HkNcEi
	SAHyrhBUlIjUZV+hKS8ovQ==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
	by mx0b-00230701.pphosted.com (PPS) with ESMTPS id 44k2qpsey4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 03 Feb 2025 16:54:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1738630497; bh=MkPrSMbm09Y+UqmlILT/cDTAxt23mUU9C3VCs8h9pmU=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=W4MQU1OYfNEJ+4Zg7tFm5MiSDjygQ/qbVJLKwHz6AE+2l8I5koPeIqLaH6eDTvMk0
	 gK70ZmBvCL4PcQVyRMFKb6Q5LYYoNP+iFLs+5h6PDgwO2NcUvnLJny7u+0KEbQ1LLU
	 y4EypDaUFD35J5ThpSasQ9xb0sAK9ixyC7zieGjbW4siqv6LbVA8N41aR/o6CYhMkx
	 f8RaqNQvJieR2KWneg7r2xpPyXkRwNSrB+GhBX9f2rPwtBM1lOJgzNt+JmbVx9yjVm
	 0stbLxL5ZVuEWflraqIwG2CXkBz82iIp7kRGm1O+L6sppKu6kbWT+uXDEBjLACE6TI
	 RS8ntYVyCKZ2w==
Received: from mailhost.synopsys.com (badc-mailhost4.synopsys.com [10.192.0.82])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id C92924012B;
	Tue,  4 Feb 2025 00:54:56 +0000 (UTC)
Received: from o365relay-in.synopsys.com (us03-o365relay3.synopsys.com [10.4.161.139])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id 2AB84A005F;
	Tue,  4 Feb 2025 00:54:56 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=K5bXP1Au;
	dkim-atps=neutral
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2176.outbound.protection.outlook.com [104.47.55.176])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 0903C40693;
	Tue,  4 Feb 2025 00:54:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eqbeLPh8pRwjmURB3CQm5t/PcP7xPLkVpKEK1ecM4XDp+Y+E2GK4qwvB46XhXpY1lNmBi3Mw4PFVzZcXI/HB+5SV3hIEb/XoNlXquJcLPPr/W7W+qzAQEDAhgcSWDMpVbzJxD3ryv7x3TE5lrn5Qz12t90ZeJ/zgCIRwpuGZWY3OcU7SwMq4IZHoAlXgpi3Lq+8LnkYw9YAXBBbt9fK9so7n+VFTU0jwKYLFmR9ClIh7qD6WXofYfDuu9yq361cRVFGF6BEzk8c6KBoUvAVri1bERoSNnttsWll4O6+cyoYGX+vqkcZ3WDeksTZ0ePF8DcndRYdF8rEFhCLx1FAkdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MkPrSMbm09Y+UqmlILT/cDTAxt23mUU9C3VCs8h9pmU=;
 b=juUijLT+gl52P7394/OhV4CSjswbKa9ETRMkLkVYALkgH/7V40reVq/fad9RcUa8gA3gDG8PJMs6QPZDel6Aj1MukDcmDvzhZ2prNtgrOzG7+btAnt2OFanxrT/lDTbEf/+j4JhpaEUsArBcpTE0aAVqSEPqrW28xnSAcvmxiEKuA+vGO5Am7/E6SfxJF/e3T8tEE6Oq13nraeVPIOxpSVB1nZZV/7tAUFp2OexvAJTD3E8rXw5nxW112HPyeXozGhykXgpmbFt6kRjyfGDM8zYu6a026UWiVpyUT1wNo3EtfCr8L6Sme+tDClmSr2dEw83wpilefyR4jPuF/3DQ4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MkPrSMbm09Y+UqmlILT/cDTAxt23mUU9C3VCs8h9pmU=;
 b=K5bXP1AuIFE+SsO7v/V6sfKYE0Ke/OgOmNaGGKbZF+Qm3T10GnXPZssD1GjEc97QTxzRh1HuTm+gW1cxRezv+rtRoOoITyHW9LgDwyed0SSSjeVSv/aspKxwws9JYg+NvZMChNP7CjWV0EkJrKtVl4XZryhzDk5HZO5yhcaOebE=
Received: from LV2PR12MB5990.namprd12.prod.outlook.com (2603:10b6:408:170::16)
 by IA0PR12MB8225.namprd12.prod.outlook.com (2603:10b6:208:408::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.24; Tue, 4 Feb
 2025 00:54:51 +0000
Received: from LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8]) by LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8%7]) with mapi id 15.20.8398.021; Tue, 4 Feb 2025
 00:54:51 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Roy Luo <royluo@google.com>
CC: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "andre.draszik@linaro.org" <andre.draszik@linaro.org>,
        "elder@kernel.org" <elder@kernel.org>,
        "stern@rowland.harvard.edu" <stern@rowland.harvard.edu>,
        "crwulff@gmail.com" <crwulff@gmail.com>,
        "paul@crapouillou.net" <paul@crapouillou.net>,
        "jkeeping@inmusicbrands.com" <jkeeping@inmusicbrands.com>,
        "yuanlinyu@hihonor.com" <yuanlinyu@hihonor.com>
Subject: Re: [PATCH v1] usb: gadget: core: flush gadget workqueue after device
 removal
Thread-Topic: [PATCH v1] usb: gadget: core: flush gadget workqueue after
 device removal
Thread-Index: AQHbdpfmRxsIOq3YukuXZnAVNE6q2LM2UZwA
Date: Tue, 4 Feb 2025 00:54:51 +0000
Message-ID: <20250204005452.fchcwx6ukv2xukiv@synopsys.com>
References: <20250204000102.3989779-1-royluo@google.com>
In-Reply-To: <20250204000102.3989779-1-royluo@google.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR12MB5990:EE_|IA0PR12MB8225:EE_
x-ms-office365-filtering-correlation-id: 48a71df5-a721-4907-e8ec-08dd44b68808
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|7416014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?cDJBYUZCU2xwVEtWaWNndWxxU2hvZWxUa2t3K0lld1JlYWcrSW9LZWh2eFE4?=
 =?utf-8?B?SW05MlVBVUk0V3lFV2duOVhQb1N6bVNIbHNIRk5PcmIyZEo5amxReVBxYk1P?=
 =?utf-8?B?YUZwMjdRRkFxeG14RXRGdHNsRVZQUFRWVGo5MTNKVGE5cy8zVnVmMktJZGIv?=
 =?utf-8?B?engya3lrTkZuZUZUcDNDSEdKUFVMYzZQS0xnVmhoNnlaK25IVWZOQ2F4ZWJJ?=
 =?utf-8?B?MjJuUmlpSVBTckkzNlFoUmsvU0pZeXpMWlgxaTB4blNkcW5McXZMTlFqSlI2?=
 =?utf-8?B?dXZ0OGdodVNWbDk1SkEvZjdQWlV6ZlFCU3JBMmN5b0Y2eWFXSnp3OTZ4b0xu?=
 =?utf-8?B?enFiSkErdW1EVno2MFY4QTNWWW15Z1dtMjVYM1NPMGtNYUlvRmpabFRPY3hS?=
 =?utf-8?B?Y0MvZ2w5eGo1dk14VVRJUEhtTlRLeG5lU3VoRGpDcEdWNTBnQ0s2Ym9Id0VP?=
 =?utf-8?B?bEZlbmt6Z09TTk5ITU9RY1JyMWpJZkNLV2dUVXhack4zak0zNngrbVU3eE1I?=
 =?utf-8?B?TzZMZTE2SUNVWE9nSmdvL3pMeEd6TWVKZjBSQW4wdW52K1pUb1ovcWlHVHFN?=
 =?utf-8?B?SUNReDlhYUJHYnByaTY5U1BHSnZ4VVlDbHZHeDBLUGFsN1hxM3VtSm9nYnln?=
 =?utf-8?B?ZndhZE42bWRKSzNGNkNtb3BPQWliL0VwTHF5ZGQ4Uld6Q1pIRUFrRkpvRzgx?=
 =?utf-8?B?YjdlakIvYStlRGpmUUpNMk5SQjZINHNzS3BGNGhXRW9WeDc2OXpOUW1YNEtI?=
 =?utf-8?B?VHY2cnJmNXlaZCtWWklJS3RXN2k4bFVFS0laOENBM0ZZZERGVzMwd1NxTkcy?=
 =?utf-8?B?aUVXYThRbTZ3TTNDcnIvKzlPU0U1eTdFY29tcFRFZTVVVldIQXVFWXJYaDVL?=
 =?utf-8?B?bjFXQUlNYVV6T2NqbEw2TWUxblJObHJHdFltVDFaVERuTzlndHg4amNQb29l?=
 =?utf-8?B?N2dqbjgrV0tSNHhDbldpSUxCOGl0amZ6UmdCMHcwWnRiUW9kcFlVaER4ek1O?=
 =?utf-8?B?dEpjb1A2RTZmUzkyenZXdVNDRFlyS2QxaHdjM0QyQ2VTcDlDVkRGZzI1YmZs?=
 =?utf-8?B?M3UvU2dYMktRM01VYU9TRGZ3bG9vQVBBY0ZEa2xZOE8yeFhSdEJrWWx0SnNO?=
 =?utf-8?B?clBsMzduRnkzbGd6RndJQjMydGFSYjlZWmlWN2Erc0M0S3h6Sk4xMUFlTm5h?=
 =?utf-8?B?Snl5NDA0dzhqQ3A3WHhTRDJFT1ZEcWFsMUtSLzVybHBGcXdlK1NiMEcvZUtz?=
 =?utf-8?B?anpNNERDblEwVVIzZEVWVzVBaGZnVEpRbCthVFZGelZYN2pIOEEzZ1lhUktT?=
 =?utf-8?B?QnNkRU5ZcnFaM3FxR3VoYWdaQWp3WmMwOXYyQ0x3L2ozVTd6RU5iYUVEQ3NW?=
 =?utf-8?B?emNFQzA2U3VaMFRNbk5PTkNpQy9hUXdvZkZIQ1FtanBJWUczdERQeUhvaGV0?=
 =?utf-8?B?Ukk3bXhNVlMrakZhWTAyUEZ5bW9EV05nbWFVQVptVzhiUEt1dXlHUHBlTEhI?=
 =?utf-8?B?Q3FQR04yZEl5SGtBazA4T3ZBTENyb1VZRzRDNm9qcGNrTVNnNEUzUU9mUkJa?=
 =?utf-8?B?Z3dDOWlSWTd1U3ZlK1JhWmdNQTFZNGNYMUNvMGNwbFlaN2pkQ3hFYnVjK2ZQ?=
 =?utf-8?B?VmU3MzZmQjZDNWZ1aytpZ3NseTY2RmFBNTY1TkVtRjNIYkgzRnUrS0hoUXd1?=
 =?utf-8?B?Z0V2WmUwVVVzdUREZGJVWWxnYXlHVlZLdjh0WGNvUmIweDNMcXRQeFMxMjBV?=
 =?utf-8?B?S1o4Qys0RGc0ODFCbVM3WExFNEkrMG12UkY5VVFCR3R3NXdyQi9rYTZycisv?=
 =?utf-8?B?QTVhNWI0d0ttKzNJZ1ZJaUE0R2FIK3B6VDN3eFlvR0RpQitlTjZrTDd4NVZI?=
 =?utf-8?B?YVRNQ1c1T0RIOHhGaGM0U2kwNFlDNEhPRGY3Q25zelhJdXVaK0ZONEFRb0p3?=
 =?utf-8?Q?3wc8qN909XbA6Fk7EQY1eq/5nAgfRB6h?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?S2VzK0xOVVdDTDhPUmRXNG9mTEVoa3IrUkozWVlpK3cvVVZjQi9IUmZQMld1?=
 =?utf-8?B?blJBZEp2eW13aWh2a3pyYU43VC94QlBsdXlETmdmZ1FNMzBUamc0R3VZTXky?=
 =?utf-8?B?b085c2pxNTlOeXNIbDF4UmhST0s1R2RHTUJrTGlKYjhmUUh5eFE3QkNFWS96?=
 =?utf-8?B?dmZLMHR3cEdhZEVieVNjRjY3azVyNVpWQitqSzA1YkQ2SEFuYmpjN3QvdGpl?=
 =?utf-8?B?d3kvMEhGeWFIanVwZUNidmpxNXI1V0dxbFYrUUpSTmRVZ2dkc2pkUEJkei9Q?=
 =?utf-8?B?c1JrMHBNUDd4UzYwaGt0QUpCQU5WcGt1TGkreHBKd3lkb3puRUVPMEx2MmM4?=
 =?utf-8?B?K3FhamxEWndpY0o2Q0VqVjM0Z1BHRkhXRjlmWVpjT29Ec0MxcXlYdmNVV2Vk?=
 =?utf-8?B?ZlhOKzFwa1kvZVVTYW9icHk4SVNTZllTbXl3V2U5aVZ0VkNsRzl2U25jaTlE?=
 =?utf-8?B?TmZDUDFpOFljTXN4bGVldDFMbVduNml3WjloRDBIRkRtcUpiMjNadXVHVlA3?=
 =?utf-8?B?aDRGcnZGRnNWWkNZL1VlbWNFWlJiN3RXK0RHRmlSazBsL1E2elVFVzloY3Vj?=
 =?utf-8?B?M25hbm5JTnJ1SUgzd01LNFJyZmRpcVhOWWUwSnJsS1VrczAzdWJKQjRGMmxC?=
 =?utf-8?B?c1hlR1N4NjVkdXpSN1NwU05hNkZBaCtYeGpiL2lkSUdGMHlQVy9PV0dWMkxI?=
 =?utf-8?B?Q2lLUXZpK2pUUktNZ1prTldkMmVmaGM5OFlSYXlQUFFsZXpWRmJQQkdjMDVj?=
 =?utf-8?B?eXh3WHREMWpncEpsa2FLTFdSczBlTS9SYi9saTBXMm10VVVNUlovQStCRlph?=
 =?utf-8?B?eHoxS21Xc0Q1Z3RMYW1INDM5WlVOMG1ITXpCTXhMWlZ3aG1uMjQ0dkVGakYz?=
 =?utf-8?B?ZzRVNFREeVVvbmVFbm1zSzE4U2hBTktlcW5VKzNyV2tlOTc4aXZBd1NKaHpE?=
 =?utf-8?B?cEYrNVVReDh5SkF3MlpKdFhYbnNQNFFjKyt0bnlMclRjQnZoUTdzaEVRY0Va?=
 =?utf-8?B?ek5DRDgrTkl6amhtSGFPZWt3NzQ3SllxbXZaOGRPYytqZENtNnF2TjFjenF6?=
 =?utf-8?B?UWxPdGtaNUl0QzNFL0NjVThVMlpRRjdlOWgxck9SYk1OSEczV0YyZ05DSDVj?=
 =?utf-8?B?MmJzK2c1Y2tDN3Q1ZktoUEd5c1J0SE5iNG8zY2Z6YW5yOCswUmErQkIyeWNn?=
 =?utf-8?B?S0FSOTZLQk5DdFpTM1Y2QU9vVkpvSGk1QVJTU0FLL3B3eDZ0clJVdVJFUVgw?=
 =?utf-8?B?RHdDM3RUazNNMDJvNVVUQXhnNVNSelNLM3I4WE1YTFM1MWJMVnRPZndWblNO?=
 =?utf-8?B?S0hwb1VmQ3lMaVl6STN2cnFtTkV3bFJDV3pZekJxelRjRlFEZlJBQVIxRkx0?=
 =?utf-8?B?Y25uazlvS1hMTitGZVhObzc1TFh6QnExcW9yM0N2TVE5QTJQeHAyclN1VGR2?=
 =?utf-8?B?bmRuNmFqNXQwTXR4eTZVUHdSMUFuUytvY3krdmE3aW5kOEQyMmpKUTdISGxq?=
 =?utf-8?B?V1d2SGNPYlZZbUtVVFgzOWdSZnpMd1ZvNXVPb3ZnTDhuRzN3Y1FGMFlEOW9Q?=
 =?utf-8?B?RW84NWRGdE9ORFRIQ0RPdEpzSGxhRjM1NmdoSXJ1WlA3ZG9DSTd4R1BHYnRC?=
 =?utf-8?B?ZDJiMFFhY045b3Rpei80VkxJOGN3NGVRMEhvdm94K01xWnZlWHo3Tmo3WmxO?=
 =?utf-8?B?WFgyNVRmNzBlWWhCRk1jSUFOUmE4T292OFZxdlp6UEJpcXdWMXhGaGgySEto?=
 =?utf-8?B?d2x2WDkrNjFrMU1tWVhhcC9DczkrRXpidDBNVFVNU0NRQTU0WjRtSkxCamIw?=
 =?utf-8?B?SWxHNUNYcDBLOXFZNm8vTlllYkd3Z3NJRTk0MlhEcW5NK3RRT3BycVdnZXBK?=
 =?utf-8?B?TGtXZzJRellZOE9iK3FzNXdJN1B6amk0WVpOZzgrQlRoa3hDQjZLclQ5NEZR?=
 =?utf-8?B?QVJWM1BPWjFaNDdCUDljbEpMbFQ4S0dhcXB6aWJVOVJVYkJIK085WEZ4K3pa?=
 =?utf-8?B?QlNyUW0yWThBT2xSWkdZOEZMcjZSbDRzcGp1dzhGYzYzeWRRTFJLSlFza1Z6?=
 =?utf-8?B?cFhsOWhWTmJYS281VHdUQ2xNbUlkUjluY2VnTHN1WlBpaCtEODBOSlRqYit6?=
 =?utf-8?Q?PRKXEVEJEg4rH52d/I3M+hWzB?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E1E2AEB1FDD8754EAB2C12E3F6D2B0DB@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	amu1IB+5/Gm+RQkZMly6mfTgis/eLzgX2RDr2E4ZhvW5uPL0SvjP/T2e6kc74SDKb01VMLcwfzzaaRIIqcHC2JCb8fQlKcd1UCXZyn3Jt9ml+u7AWPlPgjt7usveShh75GPqzJ+tzWeeZ0eT01JUIpCTcSXaE8NYIqomivSp4cz3Ol5qVEqMoFpYfIrKkoIfoKn3FcPfjmnBylwWNSrf3NoWlMBlqWlurd7dU9mKJEuEX/eEcKX1E+OnyMu8QL/ptwWvkDcOIYb/lOyBAMtHuSctMMrELO+yG8Pfl5htCM8bqOrKXu/Q/jmVGduP6/GWesH1L5lOhlfwCcPlauhXgLSWQPs8IKQGOliJVw4gnz9B2CWwsUID7iNG6xQ6aP+xVDjKYPT/c1bp2I9NZz13RhDscNtyymZ/MBJXerhwtbYXqeGQ/VT1Wm90LEAl7x0gvv9xDYcFuf/uRjIjaCvnMcZBbF7JYXxdrZIJKM7MItNYIIeRUQUBzROJqxvnMxizGuYz56LHYp5cjf4FVKgEhv3P51wGeN7/QWMXML1FaPl7zOiGlcHHF9DZu4MfogH4elmhi/4Wyrmp+dlm8gQoywQ+gAnikKrUTlWrc/ShvSJGrCdkPeVouxAKAD3GTTCWVH1+FOEHI8n6HXfu0UwENA==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 48a71df5-a721-4907-e8ec-08dd44b68808
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Feb 2025 00:54:51.3350
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: J9PUWnNS5sw1Xv8+KQDUoOiNRQSEzX7Bf2pQki30XtOrAmlDoDvd1KTPmQ8dKXQW0WI5JhbD2HxLiJyYNSWclQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8225
X-Authority-Analysis: v=2.4 cv=LP2cQIW9 c=1 sm=1 tr=0 ts=67a16562 cx=c_pps a=t4gDRyhI9k+KZ5gXRQysFQ==:117 a=t4gDRyhI9k+KZ5gXRQysFQ==:17 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=T2h4t0Lz3GQA:10 a=nEwiWwFL_bsA:10 a=qPHU084jO2kA:10 a=1XWaLZrsAAAA:8 a=93SBC3gtEQ70mhMr2ggA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: h55W2wZsOftUrUDQYJiA_VjS9lQCkRkd
X-Proofpoint-GUID: h55W2wZsOftUrUDQYJiA_VjS9lQCkRkd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-03_10,2025-01-31_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 malwarescore=0 adultscore=0 priorityscore=1501 mlxlogscore=999 spamscore=0
 mlxscore=0 suspectscore=0 clxscore=1011 bulkscore=0 impostorscore=0
 lowpriorityscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502040005

T24gVHVlLCBGZWIgMDQsIDIwMjUsIFJveSBMdW8gd3JvdGU6DQo+IHVzYl9kZWxfZ2FkZ2V0KCkg
Y2FuIGxlYWQgdG8gbmV3IHdvcmsgYmVpbmcgc2NoZWR1bGVkIGluIGdhZGdldC0+d29yaw0KPiB3
b3JrcXVldWUuIFRoaXMgaXMgb2JzZXJ2ZWQsIGZvciBleGFtcGxlLCB3aXRoIHRoZSBkd2MzIGRy
aXZlciB3aXRoIHRoZQ0KPiBmb2xsb3dpbmcgY2FsbCBzdGFjazoNCj4gICBkZXZpY2VfZGVsKCkN
Cj4gICAgIGdhZGdldF91bmJpbmRfZHJpdmVyKCkNCj4gICAgICAgdXNiX2dhZGdldF9kaXNjb25u
ZWN0X2xvY2tlZCgpDQo+ICAgICAgICAgZHdjM19nYWRnZXRfcHVsbHVwKCkNCj4gCSAgZHdjM19n
YWRnZXRfc29mdF9kaXNjb25uZWN0KCkNCj4gCSAgICB1c2JfZ2FkZ2V0X3NldF9zdGF0ZSgpDQo+
IAkgICAgICBzY2hlZHVsZV93b3JrKCZnYWRnZXQtPndvcmspDQo+IA0KPiBNb3ZlIGZsdXNoX3dv
cmsoKSBhZnRlciBkZXZpY2VfZGVsKCkgdG8gZW5zdXJlIHRoZSB3b3JrcXVldWUgaXMgY2xlYW5l
ZA0KPiB1cC4NCj4gDQo+IEZpeGVzOiAxZmYyNGQ0MGIzYzMgKCJ1c2I6IGR3YzM6IGdhZGdldDog
Rml4IGluY29ycmVjdCBVREMgc3RhdGUgYWZ0ZXIgbWFudWFsIGRlY29uZmlndXJhdGlvbiIpDQoN
ClRoZSByZWZlcmVuY2Ugc2hvdWxkIGJlIHRhcmdldGluZyB0aGUgdWRjIGNvcmUuIFByb2JhYmx5
IHdhbnQgdG8gQ2MNCnN0YWJsZSBhbHNvLg0KDQpCUiwNClRoaW5oDQoNCj4gU2lnbmVkLW9mZi1i
eTogUm95IEx1byA8cm95bHVvQGdvb2dsZS5jb20+DQo+IC0tLQ0KPiAgZHJpdmVycy91c2IvZ2Fk
Z2V0L3VkYy9jb3JlLmMgfCAyICstDQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyks
IDEgZGVsZXRpb24oLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3VzYi9nYWRnZXQvdWRj
L2NvcmUuYyBiL2RyaXZlcnMvdXNiL2dhZGdldC91ZGMvY29yZS5jDQo+IGluZGV4IGE2ZjQ2MzY0
YmU2NS4uNGIzZDUwNzU2MjFhIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL3VzYi9nYWRnZXQvdWRj
L2NvcmUuYw0KPiArKysgYi9kcml2ZXJzL3VzYi9nYWRnZXQvdWRjL2NvcmUuYw0KPiBAQCAtMTU0
Myw4ICsxNTQzLDggQEAgdm9pZCB1c2JfZGVsX2dhZGdldChzdHJ1Y3QgdXNiX2dhZGdldCAqZ2Fk
Z2V0KQ0KPiAgDQo+ICAJa29iamVjdF91ZXZlbnQoJnVkYy0+ZGV2LmtvYmosIEtPQkpfUkVNT1ZF
KTsNCj4gIAlzeXNmc19yZW1vdmVfbGluaygmdWRjLT5kZXYua29iaiwgImdhZGdldCIpOw0KPiAt
CWZsdXNoX3dvcmsoJmdhZGdldC0+d29yayk7DQo+ICAJZGV2aWNlX2RlbCgmZ2FkZ2V0LT5kZXYp
Ow0KPiArCWZsdXNoX3dvcmsoJmdhZGdldC0+d29yayk7DQo+ICAJaWRhX2ZyZWUoJmdhZGdldF9p
ZF9udW1iZXJzLCBnYWRnZXQtPmlkX251bWJlcik7DQo+ICAJY2FuY2VsX3dvcmtfc3luYygmdWRj
LT52YnVzX3dvcmspOw0KPiAgCWRldmljZV91bnJlZ2lzdGVyKCZ1ZGMtPmRldik7DQo+IA0KPiBi
YXNlLWNvbW1pdDogZjI4Njc1N2I2NDRjMjI2YjZiMzE3NzlkYTk1YTRmYTdhYjI0NWVmNQ0KPiAt
LSANCj4gMi40OC4xLjM2Mi5nMDc5MDM2ZDE1NC1nb29nDQo+IA==
