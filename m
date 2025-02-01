Received: from mx0a-00230701.pphosted.com (mx0a-00230701.pphosted.com [148.163.156.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C854C629;
	Sat,  1 Feb 2025 00:09:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.156.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738368598; cv=fail; b=Js/azAl2cCLi42wBl9jOYVqHlaiBmkrqYJHpAdMvWKwj1pA8QwB6wuGhgAoIe4k75rKfbjFC5MNa1ZsPXDDfM9x9kM0KEGmtk9JTNg6mpMnd7dS5tWmK3npOykbfx9KZEzOMZT9a9DdA0EgqcqYuQl/fLdVNTujsWJ4hmHzXfIU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738368598; c=relaxed/simple;
	bh=wQ2/ZJx2oB0K+LGa97ooltccAPTIpa0VMGZ6e4Yr6YI=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=i7woBkA+PfloNBn/pf60WnWioCHydHTx+zTtisD4kd4/uN86b+lN1br+04CYzkd7yLwQue2JQ1hVYoC72Wp6wSGGpVhBO4CylvAHdHyf77J9DFO9bk9K4U7463IvObBqsLS25y2DUuyEC7wvip0LiKGG2N7ra1XDskaf/JNfqIg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=ZfoiMAf9; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=asGrvT1z; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=qF29nDXB reason="signature verification failed"; arc=fail smtp.client-ip=148.163.156.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="ZfoiMAf9";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="asGrvT1z";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="qF29nDXB"
Received: from pps.filterd (m0098571.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50VKIF9J022627;
	Fri, 31 Jan 2025 16:09:42 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=wQ2/ZJx2oB0K+LGa97ooltccAPTIpa0VMGZ6e4Yr6YI=; b=
	ZfoiMAf9WzgHvui5KfwGpQ+Gk4gWSr12DX/9dn4Weit0xwPmCroi/wHqxZVQuiEt
	+8vD90Xzwd9CofT270V3hLYAlyg1olwEgQEQIjb+Eoxx+B/bOXHprx8dNZorluUq
	NDfgbGQeDsypTgoJLsBlBJFscmhvg1qcd9A2IASuuS43lOxpml+P6xnX3OByhB6W
	JqHzmRdmTNXfpWlN5UPe/DWY3ySdjNd5Mpg9ahYUKgFxRc53k6IQx0Xak1s5cp+p
	QRidj9YlcYjP0wUFNPafMv6S7CHV71vB6H8ch0vObOJv8kT+eF0t+cNAjLxA90Jk
	B49QhyZXn2iyY+1zpE7eZQ==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 44h5ea0tfu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 31 Jan 2025 16:09:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1738368581; bh=wQ2/ZJx2oB0K+LGa97ooltccAPTIpa0VMGZ6e4Yr6YI=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=asGrvT1zhAwNgnFK/MiHd8ba2R8DcupIKRHJdtw9AemYLEbRtmp97UJiOiPi5SBz1
	 6cYBAEERuHqVu0ruSvx46uPi+FKFHWATzcQm2V+t2xfjI9pr8toHAarQBIbKCXH4jt
	 zXVihJTbaBk4dzf4pQCmxvhmZL4QeP6CY7EVPSmkZpz5pwRlMz0Xi05KoQB3KfqeVz
	 M7jqyQf848WYSIzpgzbtCKNUX21TrKe81rE8vEDV4FNPbPBduMO1ZtVvEO+fXpv3o4
	 LZd0xaxtIBAVQ9JrRVYsfArUrETkuLZWaqL1lvHAM4TrlSv0JvN2wnVyWoX75UYYHP
	 ILu+tnX8qSQ5w==
Received: from mailhost.synopsys.com (sv1-mailhost1.synopsys.com [10.205.2.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 80ABF40110;
	Sat,  1 Feb 2025 00:09:41 +0000 (UTC)
Received: from o365relay-in.synopsys.com (us03-o365relay1.synopsys.com [10.4.161.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id DFF86A0067;
	Sat,  1 Feb 2025 00:09:40 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=qF29nDXB;
	dkim-atps=neutral
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (mail-bn1nam02lp2045.outbound.protection.outlook.com [104.47.51.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 1EF30404D5;
	Sat,  1 Feb 2025 00:09:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MUVUMgglvIu2KEZk1mnhjx+RoXtIz84hduJsRsmCXx5dozrXKXYRzThj8zNvEO/Q2svQdDj+tZIzqtGLFwN/gzzjq6eAtvNv9a5eCmFgOr4+8S1vZ7gfxNgUwItTyc9O91AS1POT9qN//Aq+8Co2Xtc4cAUcjT2A0zCUod1QDQp7aLWzdZ/vRO4JoKmfEB5NFio4wirvNKH34viINEYT7KW8NMsD5TbBjRXvIHRqKf0/YDTyxwdPwHywoPK5P5xP0D6YUGDgBKnjP/7I6kmyZnx2Ba41/NhgIgBp9QA0nBpxaAj7Ix7qBnJsx9clFC8Y9ePOrS0oNA3krVX0YlO91w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wQ2/ZJx2oB0K+LGa97ooltccAPTIpa0VMGZ6e4Yr6YI=;
 b=k7JZLsKSbt/x1mZNVu1CTcxLmZh//+Npq76y6yat8AqFm2dNq/BpsXP4EfPnyQ1yIEtvAHWBgx0p1soSbovQx1Wb5FCwbxYkssdhW7MJ/vepaiNnaNJTcbjuorKHdFwoP8WNWt3DrIRHNUR6khrH3M4q1qNded8gsq/swUYaodZ/cAa3gH+3JZtgrIM+9trJoAqh3Twec8gInZLvrdlmXwNrYe4PfqZEgvblOb0k3j5nZ0WisM7R7vME30UGU/efUardWqISui5mKj7pZvm748phncHfuuBtp4GIZyK24bM/gEn1oHEFhRrsxJ9GMLkWHTU2oJuf4Y9WA80Dprb7Lw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wQ2/ZJx2oB0K+LGa97ooltccAPTIpa0VMGZ6e4Yr6YI=;
 b=qF29nDXBNVT5fcwepYnTOKOUVfWeoP6tiHziH1nlx5jldvaKdV0Ws3dABouKKkpkaQkYYF9KXAzbnuGAvkVJFPQMmjd8OxsgbqEn72NACV+4u8GvdVecktkidSuSaf8GlrzYuCrNkO0e8mCl3DE/s2Cs+IWibuH7In+26d4acc4=
Received: from LV2PR12MB5990.namprd12.prod.outlook.com (2603:10b6:408:170::16)
 by DM4PR12MB6543.namprd12.prod.outlook.com (2603:10b6:8:8c::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8398.22; Sat, 1 Feb 2025 00:09:36 +0000
Received: from LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8]) by LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8%7]) with mapi id 15.20.8398.018; Sat, 1 Feb 2025
 00:09:36 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Badhri Jagan Sridharan <badhri@google.com>
CC: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "felipe.balbi@linux.intel.com" <felipe.balbi@linux.intel.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "jameswei@google.com" <jameswei@google.com>,
        "stable@kernel.org" <stable@kernel.org>
Subject: Re: [PATCH v1] usb: dwc3: gadget: Prevent irq storm when TH
 re-executes
Thread-Topic: [PATCH v1] usb: dwc3: gadget: Prevent irq storm when TH
 re-executes
Thread-Index: AQHbbjXlOsxglH89uEOeQnhFYdXNErMrgJ8AgAHzI4CAASAggIACKJSAgADiOgA=
Date: Sat, 1 Feb 2025 00:09:36 +0000
Message-ID: <20250201000926.veukjr6wmhrgl6me@synopsys.com>
References: <20250124075911.811594-1-badhri@google.com>
 <20250128024416.7i3i2vmw2ioy5huf@synopsys.com>
 <CAPTae5L6Worr3WsuuV-SUNJh6SOVf+RnLWt2d1LNLDYvY6uRuA@mail.gmail.com>
 <20250130014159.bv7gvtskyg73lxmc@synopsys.com>
 <CAPTae5JYuogc-mHUi-VdfLAJ4E1z6myGofCvqVCfYxt--VetKA@mail.gmail.com>
In-Reply-To:
 <CAPTae5JYuogc-mHUi-VdfLAJ4E1z6myGofCvqVCfYxt--VetKA@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR12MB5990:EE_|DM4PR12MB6543:EE_
x-ms-office365-filtering-correlation-id: 6c210281-05ec-490a-c867-08dd4254b6c3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?VER0OHBHNEc0eTlHY0NzZ0ZiOVVTNy9tZks0dkdOYnczcUJscHB0SGhOa3RU?=
 =?utf-8?B?MkUzZVdaWnpCb0orMnpxR0FjYTU1c1hVQzZEaXdJSDMrVkZ3cE5GWGxDSXY3?=
 =?utf-8?B?dW1uQmlnQUVKOEludkNVT1FqTWxmUlF4bFBqbmg5UEVlT2JBVnBqWmdSRFFo?=
 =?utf-8?B?ZkNpWFJsalZxa0loaFlJeUZ1MVkwWmdwZHpNNUhJV24zUEFXcndWbDhIdnFs?=
 =?utf-8?B?M1UwTXBSRUp5V1NnSG9Vd2lzeE1OLzY3ZUZNd3dVSS9yb2s4YnF4d0kxN3ds?=
 =?utf-8?B?WGdOQ3RGTTVRdFA0UGVsME83UzhESkthRUxxRUhsN2lSOVNkRHJQMG5JOXdB?=
 =?utf-8?B?SU8wQUJRVzNDbUllMzBWRHgxZmN6amZkQXU3MVlmRGgzeWU1aXpXWnhVOHE0?=
 =?utf-8?B?T0c4aVF1ZVpnK0VEZ3VNNmdNcExLODQ0UFVlY0RBMUlBOGJoclZmYlpPbXJh?=
 =?utf-8?B?VTg4dUw2KzhLS2s3bWhidmNmZWtLR1ZPbW4rN25LZ1lIMWV6aTRrTmhwYyti?=
 =?utf-8?B?WXBkR0xpcXR1cVB1dXpnRThqU3FJNlNoTmZ4ZHZhOWFHNVQ5WTJMQTNtWFlt?=
 =?utf-8?B?ME5iWW1UMTBXZGxzTEVaUUxQM3RFTkJ5NnlNeXJWdTY5a3FxWC9zUXFIYjM3?=
 =?utf-8?B?dmRZcGtyTHlGbzZRZFRPcUhZSXpTUkk4alFXSUhxRXh1M3J3TFJrZ0pOUnpa?=
 =?utf-8?B?L1JMSnVXQWFzbHJENlB4UTc5T2IxZXZDeXBLM3l1RW1UdTIvczZhME43TERu?=
 =?utf-8?B?QnVreEo2WFFnenU1QjYzRk9WWW5PSDhSR0FxNUlaazJVbndyZEpwcHMxSVdU?=
 =?utf-8?B?NUQwTXZPM1ZRQWlGV1BOUFJKbm5zK2VIMUV4eStFWkZyVlJiNTFVQ25OSTZE?=
 =?utf-8?B?UFhrQnU1dWV1NTFYNXg1S08zVnlTeWYxNHBEWHk1a3VnQnF6dE9VUnp3NFor?=
 =?utf-8?B?RmlSOVl1MzlSVGVPcEh6Wlk4RU5ZSGJUS0hqOEZ3c3lOTDZwWjJpZkZOVnpp?=
 =?utf-8?B?eko3djJKdmdxK0N4U2pCUlZJTnBuSmN0Z2JsQTNhaTJPc2k3UEtKcFR4V2dU?=
 =?utf-8?B?VHZrSU93WFp4R0pKRll5MHJabVNOYldNQkQ5SjFzYS9jNEVxTWw0bW9sbEFp?=
 =?utf-8?B?YUY1am1IaENHTXlHaUZGT0FCZ0Y3UGx3dnU1WXFqd0MveWYrSU1sS1VFZGVu?=
 =?utf-8?B?NjRTTGZidkRieXJBOGtFa1hLSnViR0lzTTRRem4rZndMRDBCc2oyK3dkQU85?=
 =?utf-8?B?VHMraWJCNWNnUWpPOWZmek1DODNacytBMzJ5VkdvUlN0L0F0dlBlQnRlYmt5?=
 =?utf-8?B?Q2gwTzJyY2dQL0VLWW5OK1VVYjRLbE10bXRySU9yR3lJWTVUaXVPQ0pHckpy?=
 =?utf-8?B?MG5OWWZvQjYvdlFNd2NMNjJUcDBlS1VXOWtueXhsT2FYaTdCcHBzVUtTZ2hL?=
 =?utf-8?B?Z1lPSFN2aVRWcU9vYUV4OVY4dWxtY0liTDVKS0l1REVQWTI2cDMvRCttT1ov?=
 =?utf-8?B?NVRqKzRtS0FsTUFaRGJ1cUt2RHlSL3lkMGNwVEVpVmJybDV0VnRsdFlsQ2hL?=
 =?utf-8?B?bTNXUFNLQ0xKUDZvdnRXcTA4K2t5M0NUejZ4TC9ZUFpzaDBtdENEbk5mdE5U?=
 =?utf-8?B?Um1Selh1YUVJVkRFV3NNdW96T1lyUjdCZ2sxaU1LdG1qc1Foa0Z4YnIzYUpz?=
 =?utf-8?B?eTh5Nyt0RlRZYlFFeXh5VUdicUNFZ3J6cm5kTDF5eFA5QTNIUHJnTHQyYUNH?=
 =?utf-8?B?cXNaQklVOTAvQTEzeDh5SFJXOStyd1pNSTZCSnRSY3ZBQ3RTVTdTY1EzeXRl?=
 =?utf-8?B?YlNTU3FodDE3U1oxQUdwUkNuVkF1UytZd1dEelVZNURIN0x3bllDajU4bXUy?=
 =?utf-8?B?NStaWHVHU1N4VFRxdWlJaUJwV2JnaDhINk5QQ255KzlRMCtYczFZVEttOE5Q?=
 =?utf-8?Q?nGNgY3zdMjtHOR8cIciqQ96547f6TXqq?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?VmV3VXRBc0J6SnFvSi9zK1BuU2RjMWhwejZRdERNV3l0L2RsSStkd3hBR2dP?=
 =?utf-8?B?YnVoMURyQjJ5RCs0NW5TRVQ2MkVTYkt4aFFlclQ2OGpweDIzZHFLVlc3T1Ar?=
 =?utf-8?B?VEovV3FBT3RaZzNGZE1jcjZ0RVN6Q3hqanNLT3ladUo3dHEwekR2aEpPUndS?=
 =?utf-8?B?eHVodlI1WUlwdExYMENobm94MW44ZjFDaTYyWG1TOXp5UW10ZWltREcxZ1JH?=
 =?utf-8?B?clNqbzJrM2VjOFc1VnJHTDVZa2N5d3RUSHpvWno5b2hvLzlmWm1sZ25Ta2dT?=
 =?utf-8?B?TUN6N3NCS1dnSnpPLzVpLzQvSm5TRXc0b3pPeVZMdjZ6SGZQajZ3M2RtdDJr?=
 =?utf-8?B?eVFTY0N0c3lmVHg1RE5ROUVFbGY0NTYreE5sN1UvbDduUnlwOEN1SWFjODF0?=
 =?utf-8?B?WndGVUZlQ0hUbVBvVStZUzA2MDlweUJ2NjNQRFczNVc5Y05HclBhemV3TU9C?=
 =?utf-8?B?SHJSeVpWZVVqVVZ0amhuZEZ5ZnFDNzdDNlp4R1JNR3JKejFJNWJLcU42Wkho?=
 =?utf-8?B?KzFmWndhSk9sd2x0Z0QyWExrdFRJZ2k1Nm1oeDJrS1ZXNjM2cUtEd0c5VVdU?=
 =?utf-8?B?cWV0OExFM1E2Rmk2dkJadnhOVlNqVEFGME1DQS9RV0YrMEJ6K3RPbWxFWDFq?=
 =?utf-8?B?RzAxcXQ2bElCVjh0N0IxcU5Wa28rN3lQUUlEYy9jUHdZUzh0b0RiUXhLNHlI?=
 =?utf-8?B?bjVqbVVwYnhpWldGaWp1cWxsVFkwb2JWb2J4UEZRVG1xUWtGdGhqMDB3d3Jq?=
 =?utf-8?B?TUFkTHJkOTBRSHhmTVRLTG1iYmlNZFVpVkpCTnFmTmpFajRmZ21yTytxQXhL?=
 =?utf-8?B?VVVQWTlXNFd3am9vNURCNWd4UEtMNWZyNXdnYkFwVURoY0hGaUZBWDA3QUhF?=
 =?utf-8?B?Vm1Ec2lkWTljOUtSR3l0bEV4cDN3MGhEZ0luaGM3UG9sdTdwaG1ucjBkd3h4?=
 =?utf-8?B?ZnVGdG8yUVFpY2FmUVpxa3dFWHFoaFJmT2t0SXZUcjdPWjhHdnFwUnU2WGJK?=
 =?utf-8?B?aDlJRWN6VWRxK3orVlY2eDU1anltem5qRy9KY01TWFY4QlpKdFFHeHFYSFZn?=
 =?utf-8?B?d1VLam11MDJXZGdmTzdYWVptTGdRNlkxUEVEa004QnVRYXFIVzc4TmtVdVVo?=
 =?utf-8?B?ak9PRjJkTDNVbFhzd1N5S3ZLQzkwUFJReDBkcDZ6NE1RRnJEK2Z0b2wxK0JO?=
 =?utf-8?B?TjE2eXQ1aVBBOEd6NzlRbmt5dE8vT0NEbHExZ09xL3Npc2E2VHNBNUdaS3hQ?=
 =?utf-8?B?dEhyMVhpaE1JSkt6VG5SdUdqUmxNLytOVWsyV1RRTlhaSzk1VUl4Yzd1VktO?=
 =?utf-8?B?N3BQejN0b2hCWnJoUW9udjlKVnBaRThZQXBjVndiYVRaUml1eE5Kc2Exc3pk?=
 =?utf-8?B?MzRhUGkzYnZOQ3FLeHZ1ZnBLdG5meWlGQXh6YmhwRTNDYmhXeTI3SVU1VS9V?=
 =?utf-8?B?Y0tlWXV4c2hDbTMySytZZUg0U3JwUnNheTlEZlZoWlJ6WC9rVG80aVJyMXNt?=
 =?utf-8?B?RXhvOGcyQXZ1VUhTVWVyQzlyU2x2MXl2WFV6bDhITENqMFl6a1NGSU04dDQ2?=
 =?utf-8?B?TXFsdndhbk5wQStFUWk0aGpxZ2ZMZlg5bDU1d3FSQ1NoeGhpS3lHdUoxaUIr?=
 =?utf-8?B?akp3QnlENlJNQnBPK0Jxc3dwNlRjOGxJd203U2Ntd2R2WDdtbSt5N0xIRFJR?=
 =?utf-8?B?bjd1dSszV1Q4WTIwdzVXTXBPOGlRRmNxL2d0bWY0Q0x6S2R1aDRVZE1FMnUw?=
 =?utf-8?B?N3pORGxWakJwQXZpb2FBVnI4bWlJRnVFYmF4NGNxNnJtMGxjMFpyb0hVS0tI?=
 =?utf-8?B?MExaZ3N2bm1jYndWbDEzdmpZYzkvT2tlMGhuUDZqVUhYTlZEQUxqbURmUmZl?=
 =?utf-8?B?T202SER1STFSQ2VSZkZJWHlKYWVnUURoVUpWVnlHZGdwSWNsQ0FEWktLUGJq?=
 =?utf-8?B?YTUvR3AxcURGeXJreXlOSVFSV2owTHJZKy9GUHNyaWd2alBJWFhLTE1EQmI0?=
 =?utf-8?B?RCtQWnQ1d0l0OGwzMjQ2UzlSMmNRaG4vTkQvNGlNWDR5b2FaR3pjcmdEOEkr?=
 =?utf-8?B?dmswdTBlMEdhOTl4N2FCVVkxMTk0T0JYeG1KeGJTVHNhT3hsOCtpeTBJL3FV?=
 =?utf-8?Q?HM27rcRST8Dy/BouVmCh3AobA?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <034C54139A1EC248A3371A4FBA575DC5@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	pMO9pJ3mULR2YNKjYgeKZ9spkcw2wekQq6Z96coY6ba48koC7vQDailWROPIFB2IEX3DAfVUKs74C4HxjZPpJO1mUPU2qojdKPH35B7NtO2est/QhJHyctrGwFFlyLtdclGA1L/kLuxM2SwiTF7ngnhIVtowE70E9oAQXgf+acp3r1X6tB/PLNErl/4QX+cNykFM6S5MFoTJtQ+WLsOOLN1gJaxyAQssbWlDhboHfXYfgTMmL3Mqd0zPM6NsgQBIdsduNuo2SIVPMMIAQO+K7lKO3KRHx/2usdqroYeDiGPxyaelunBwwCHIG1IDHojxDhA8ublr+a1JuenktM23QjXuo0JBT49GKBnhDThBKsDCdL3iZFNbpXz1wsP3QYmbpqOG1Mx1dcHAE/u42vyeVI7WBizSyDwAVYCjak3W3kXJql6J6Cs0aMO9pb3VCTj7Y5SNXuvMOJDbOm4F0HyfUCqXQ49/qUYYB2AWOZty6jFq6FVe4TGfEutP9qHBwxpDJvbKgfyraj+kprYQ/5EYUtit87mP1hnlrtzBi2AHCwLtDX6fSXaKz+lqkZ4vT+nacu2W1I/x1jM2mDjmTFFkmaaXlLC1VKgtLuA+xGyhLcqW2rDKyPoVe2R7fxcDDqauj2aRLFSdMiWaLeIQIsAP9A==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c210281-05ec-490a-c867-08dd4254b6c3
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Feb 2025 00:09:36.6829
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OBxWSti9A37qjQnazLfL8W0OQcaZVUAs0PQ4u/itgxIS7WXfTFA5jEtj0lthME2snGdFZ7NvQ6GkUClJa0uTcA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6543
X-Proofpoint-GUID: lNNqNME9Ni7i4I4833pDyICvFOzT4pla
X-Authority-Analysis: v=2.4 cv=TfpstQQh c=1 sm=1 tr=0 ts=679d6646 cx=c_pps a=8EbXvwLXkpGsT4ql/pYRAw==:117 a=8EbXvwLXkpGsT4ql/pYRAw==:17 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdSt8ZQiCzkA:10 a=nEwiWwFL_bsA:10 a=qPHU084jO2kA:10 a=jIQo8A4GAAAA:8 a=VwQbUJbxAAAA:8 a=1XWaLZrsAAAA:8 a=fR0XxQBUqakfG9Wi18kA:9 a=QEXdDO2ut3YA:10 a=Lf5xNeLK5dgiOs8hzIjU:22
X-Proofpoint-ORIG-GUID: lNNqNME9Ni7i4I4833pDyICvFOzT4pla
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-31_09,2025-01-31_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 malwarescore=0 spamscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 mlxscore=0 adultscore=0 impostorscore=0 mlxlogscore=999 phishscore=0
 lowpriorityscore=0 priorityscore=1501 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2501310185

T24gRnJpLCBKYW4gMzEsIDIwMjUsIEJhZGhyaSBKYWdhbiBTcmlkaGFyYW4gd3JvdGU6DQo+IE9u
IFdlZCwgSmFuIDI5LCAyMDI1IGF0IDU6NDLigK9QTSBUaGluaCBOZ3V5ZW4gPFRoaW5oLk5ndXll
bkBzeW5vcHN5cy5jb20+IHdyb3RlOg0KPiA+DQo+ID4gT24gV2VkLCBKYW4gMjksIDIwMjUsIEJh
ZGhyaSBKYWdhbiBTcmlkaGFyYW4gd3JvdGU6DQo+ID4gPiBPbiBNb24sIEphbiAyNywgMjAyNSBh
dCA2OjQ04oCvUE0gVGhpbmggTmd1eWVuIDxUaGluaC5OZ3V5ZW5Ac3lub3BzeXMuY29tPiB3cm90
ZToNCj4gPiA+ID4NCj4gPiA+ID4gT24gRnJpLCBKYW4gMjQsIDIwMjUsIEJhZGhyaSBKYWdhbiBT
cmlkaGFyYW4gd3JvdGU6DQo+ID4gPiA+ID4gV2hpbGUgY29tbWl0IGQzMjVhMWRlNDlkNiAoInVz
YjogZHdjMzogZ2FkZ2V0OiBQcmV2ZW50IGxvc2luZyBldmVudHMNCj4gPiA+ID4gPiBpbiBldmVu
dCBjYWNoZSIpIG1ha2VzIHN1cmUgdGhhdCB0b3AgaGFsZihUSCkgZG9lcyBub3QgZW5kIHVwIG92
ZXJ3cml0aW5nDQo+ID4gPiA+ID4gdGhlIGNhY2hlZCBldmVudHMgYmVmb3JlIHByb2Nlc3Npbmcg
dGhlbSB3aGVuIHRoZSBUSCBnZXRzIGludm9rZWQgbW9yZQ0KPiA+ID4gPiA+IHRoYW4gb25lIHRp
bWUsIHJldHVybmluZyBJUlFfSEFORExFRCByZXN1bHRzIGluIG9jY2FzaW9uYWwgaXJxIHN0b3Jt
DQo+ID4gPiA+ID4gd2hlcmUgdGhlIFRIIGhvZ3MgdGhlIENQVS4gVGhlIGlycSBzdG9ybSBjYW4g
YmUgcHJldmVudGVkIGlmDQo+ID4gPiA+ID4gSVJRX1dBS0VfVEhSRUFEIGlzIHJldHVybmVkLg0K
PiA+ID4gPiA+DQo+ID4gPiA+ID4gZnRyYWNlIGV2ZW50IHN0dWIgZHVyaW5nIGR3YzMgaXJxIHN0
b3JtOg0KPiA+ID4gPiA+ICAgICBpcnEvNTA0X2R3YzMtMTExMSAgKCAxMTExKSBbMDAwXSAuLi4u
IDcwLjAwMDg2NjogaXJxX2hhbmRsZXJfZXhpdDogaXJxPTE0IHJldD1oYW5kbGVkDQo+ID4gPiA+
ID4gICAgIGlycS81MDRfZHdjMy0xMTExICAoIDExMTEpIFswMDBdIC4uLi4gNzAuMDAwODcyOiBp
cnFfaGFuZGxlcl9lbnRyeTogaXJxPTUwNCBuYW1lPWR3YzMNCj4gPiA+ID4gPiAgICAgaXJxLzUw
NF9kd2MzLTExMTEgICggMTExMSkgWzAwMF0gLi4uLiA3MC4wMDA4NzQ6IGlycV9oYW5kbGVyX2V4
aXQ6IGlycT01MDQgcmV0PWhhbmRsZWQNCj4gPiA+ID4gPiAgICAgaXJxLzUwNF9kd2MzLTExMTEg
ICggMTExMSkgWzAwMF0gLi4uLiA3MC4wMDA4ODE6IGlycV9oYW5kbGVyX2VudHJ5OiBpcnE9NTA0
IG5hbWU9ZHdjMw0KPiA+ID4gPiA+ICAgICBpcnEvNTA0X2R3YzMtMTExMSAgKCAxMTExKSBbMDAw
XSAuLi4uIDcwLjAwMDg4MzogaXJxX2hhbmRsZXJfZXhpdDogaXJxPTUwNCByZXQ9aGFuZGxlZA0K
PiA+ID4gPiA+ICAgICBpcnEvNTA0X2R3YzMtMTExMSAgKCAxMTExKSBbMDAwXSAuLi4uIDcwLjAw
MDg4OTogaXJxX2hhbmRsZXJfZW50cnk6IGlycT01MDQgbmFtZT1kd2MzDQo+ID4gPiA+ID4gICAg
IGlycS81MDRfZHdjMy0xMTExICAoIDExMTEpIFswMDBdIC4uLi4gNzAuMDAwODkyOiBpcnFfaGFu
ZGxlcl9leGl0OiBpcnE9NTA0IHJldD1oYW5kbGVkDQo+ID4gPiA+ID4gICAgIGlycS81MDRfZHdj
My0xMTExICAoIDExMTEpIFswMDBdIC4uLi4gNzAuMDAwODk4OiBpcnFfaGFuZGxlcl9lbnRyeTog
aXJxPTUwNCBuYW1lPWR3YzMNCj4gPiA+ID4gPiAgICAgaXJxLzUwNF9kd2MzLTExMTEgICggMTEx
MSkgWzAwMF0gLi4uLiA3MC4wMDA5MDE6IGlycV9oYW5kbGVyX2V4aXQ6IGlycT01MDQgcmV0PWhh
bmRsZWQNCj4gPiA+ID4gPiAgICAgaXJxLzUwNF9kd2MzLTExMTEgICggMTExMSkgWzAwMF0gLi4u
LiA3MC4wMDA5MDc6IGlycV9oYW5kbGVyX2VudHJ5OiBpcnE9NTA0IG5hbWU9ZHdjMw0KPiA+ID4g
PiA+ICAgICBpcnEvNTA0X2R3YzMtMTExMSAgKCAxMTExKSBbMDAwXSAuLi4uIDcwLjAwMDkwOTog
aXJxX2hhbmRsZXJfZXhpdDogaXJxPTUwNCByZXQ9aGFuZGxlZA0KPiA+ID4gPiA+ICAgICBpcnEv
NTA0X2R3YzMtMTExMSAgKCAxMTExKSBbMDAwXSAuLi4uIDcwLjAwMDkxNTogaXJxX2hhbmRsZXJf
ZW50cnk6IGlycT01MDQgbmFtZT1kd2MzDQo+ID4gPiA+ID4gICAgIGlycS81MDRfZHdjMy0xMTEx
ICAoIDExMTEpIFswMDBdIC4uLi4gNzAuMDAwOTE4OiBpcnFfaGFuZGxlcl9leGl0OiBpcnE9NTA0
IHJldD1oYW5kbGVkDQo+ID4gPiA+ID4gICAgIGlycS81MDRfZHdjMy0xMTExICAoIDExMTEpIFsw
MDBdIC4uLi4gNzAuMDAwOTI0OiBpcnFfaGFuZGxlcl9lbnRyeTogaXJxPTUwNCBuYW1lPWR3YzMN
Cj4gPiA+ID4gPiAgICAgaXJxLzUwNF9kd2MzLTExMTEgICggMTExMSkgWzAwMF0gLi4uLiA3MC4w
MDA5Mjc6IGlycV9oYW5kbGVyX2V4aXQ6IGlycT01MDQgcmV0PWhhbmRsZWQNCj4gPiA+ID4gPiAg
ICAgaXJxLzUwNF9kd2MzLTExMTEgICggMTExMSkgWzAwMF0gLi4uLiA3MC4wMDA5MzM6IGlycV9o
YW5kbGVyX2VudHJ5OiBpcnE9NTA0IG5hbWU9ZHdjMw0KPiA+ID4gPiA+ICAgICBpcnEvNTA0X2R3
YzMtMTExMSAgKCAxMTExKSBbMDAwXSAuLi4uIDcwLjAwMDkzNTogaXJxX2hhbmRsZXJfZXhpdDog
aXJxPTUwNCByZXQ9aGFuZGxlZA0KPiA+ID4gPiA+ICAgICAuLi4uDQo+ID4gPiA+ID4NCj4gPiA+
ID4gPiBDYzogc3RhYmxlQGtlcm5lbC5vcmcNCj4gPiA+ID4gPiBGaXhlczogZDMyNWExZGU0OWQ2
ICgidXNiOiBkd2MzOiBnYWRnZXQ6IFByZXZlbnQgbG9zaW5nIGV2ZW50cyBpbiBldmVudCBjYWNo
ZSIpDQo+ID4gPiA+DQo+ID4gPiA+IEkgZG9uJ3QgdGhpbmsgdGhpcyBzaG91bGQgYmUgQ2MgdG8g
c3RhYmxlLCBhdCBsZWFzdCBub3QgdGhlIHdheSBpdCBpcw0KPiA+ID4gPiByaWdodCBub3cuDQo+
ID4gPiA+DQo+ID4gPiA+ID4gU2lnbmVkLW9mZi1ieTogQmFkaHJpIEphZ2FuIFNyaWRoYXJhbiA8
YmFkaHJpQGdvb2dsZS5jb20+DQo+ID4gPiA+ID4gLS0tDQo+ID4gPiA+ID4gIGRyaXZlcnMvdXNi
L2R3YzMvZ2FkZ2V0LmMgfCAyICstDQo+ID4gPiA+ID4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2Vy
dGlvbigrKSwgMSBkZWxldGlvbigtKQ0KPiA+ID4gPiA+DQo+ID4gPiA+ID4gZGlmZiAtLWdpdCBh
L2RyaXZlcnMvdXNiL2R3YzMvZ2FkZ2V0LmMgYi9kcml2ZXJzL3VzYi9kd2MzL2dhZGdldC5jDQo+
ID4gPiA+ID4gaW5kZXggZDI3YWY2NWViMDhhLi4zNzZhYjc1YWRjNGUgMTAwNjQ0DQo+ID4gPiA+
ID4gLS0tIGEvZHJpdmVycy91c2IvZHdjMy9nYWRnZXQuYw0KPiA+ID4gPiA+ICsrKyBiL2RyaXZl
cnMvdXNiL2R3YzMvZ2FkZ2V0LmMNCj4gPiA+ID4gPiBAQCAtNDUxOSw3ICs0NTE5LDcgQEAgc3Rh
dGljIGlycXJldHVybl90IGR3YzNfY2hlY2tfZXZlbnRfYnVmKHN0cnVjdCBkd2MzX2V2ZW50X2J1
ZmZlciAqZXZ0KQ0KPiA+ID4gPiA+ICAgICAgICAqIGxvc2luZyBldmVudHMuDQo+ID4gPiA+ID4g
ICAgICAgICovDQo+ID4gPiA+ID4gICAgICAgaWYgKGV2dC0+ZmxhZ3MgJiBEV0MzX0VWRU5UX1BF
TkRJTkcpDQo+ID4gPiA+ID4gLSAgICAgICAgICAgICByZXR1cm4gSVJRX0hBTkRMRUQ7DQo+ID4g
PiA+ID4gKyAgICAgICAgICAgICByZXR1cm4gSVJRX1dBS0VfVEhSRUFEOw0KPiA+ID4gPg0KPiA+
ID4gPiBUaGlzIGxvb2tzIGxpa2UgYSB3b3JrYXJvdW5kIHRvIHRoZSBpc3N1ZSB3ZSBoYXZlLiBI
YXZlIHlvdSB0cmllZCB0bw0KPiA+ID4gPiBlbmFibGUgaW1vZCBpbnN0ZWFkPyBJdCdzIHRoZSBm
ZWF0dXJlIHRvIGhlbHAgYXZvaWQgdGhlc2Uga2luZCBvZiBpc3N1ZS4NCj4gPiA+DQo+ID4gPiBI
aSBUaGluaCwNCj4gPiA+DQo+ID4gPiBUaGFua3MgZm9yIHRoZSBmZWVkYmFjayAhIFllcywgd2Ug
aGF2ZSBiZWVuIGV4cGVyaW1lbnRpbmcgd2l0aCB0aGUNCj4gPiA+IGludGVycnVwdCBtb2RlcmF0
aW9uIGludGVydmFsIGFzIHdlbGwuDQo+ID4gPiBIYXZlIGZvbGxvdyB1cCBxdWVzdGlvbnMgdGhv
dWdoLCBwbGVhc2UgYmVhciB3aXRoIG1lICENCj4gPiA+DQo+ID4gPiAxLiBHaXZlbiB0aGF0IHdo
ZW4gRFdDM19FVkVOVF9QRU5ESU5HICBpcyBzdGlsbCBzZXQsDQo+ID4gPiBkd2MzX2NoZWNrX2V2
ZW50X2J1ZigpIGlzIHN0aWxsIHdhaXRpbmcgZm9yIHRoZSBwcmV2aW91cyBjYWNoZWQgZXZlbnRz
DQo+ID4gPiB0byBiZSBwcm9jZXNzZWQgYnkgdGhlIGR3YzNfdGhyZWFkX2ludGVycnVwdCgpLCB3
aGF0J3MgdGhlIHJlYXNvbmluZw0KPiA+ID4gYmVoaW5kIHJldHVybmluZyBJUlFfSEFORExFRCBo
ZXJlID8gU2hvdWxkbid0IHdlIGJlIHJldHVybmluZw0KPiA+ID4gSVJRX1dBS0VfVEhSRUFEIGFu
eXdheXMgPw0KPiA+DQo+ID4gQ3VycmVudGx5IGR3YzMgaXMgaW1wbGVtZW50ZWQgc3VjaCB0aGF0
IGl0IHdpbGwgbm90IHByb2Nlc3MgbmV3IGV2ZW50cw0KPiA+IHVudGlsIHRoZSBCSCBpcyBkb25l
IHdpdGggaXRzIHdvcmsuIFRoZSBEV0MzX0VWRU5UX1BFTkRJTkcgZmxhZw0KPiA+IGluZGljYXRl
cyB3aGVuIHRoZSBldmVudHMgYXJlIHByb2Nlc3NlZC4gV2l0aCB0aGlzIGV4cGVjdGF0aW9uLCB3
ZQ0KPiA+IHNob3VsZCBub3Qgc2NoZWR1bGUgdGhlIEJIIGFzIHRoZSBldmVudHMgYXJlIHN0aWxs
IGJlaW5nIGhhbmRsZWQuDQo+IA0KPiANCj4gSGkgVGhpbmgsDQo+IA0KPiBUaGFua3MgZm9yIHNo
YXJpbmcgeW91ciB0aG91Z2h0cyAhDQo+IEdpdmVuIHRoYXQgdGhlIGludGVudGlvbiBvZiB0aGUg
ZGVzaWduIGlzIHRvIGtlZXAgdG9wIGhhbGYNCj4gKGR3YzNfY2hlY2tfZXZlbnRfYnVmKCkpIGFu
ZCBib3R0b20gaGFsZiAoZHdjM19wcm9jZXNzX2V2ZW50X2J1ZigpKQ0KPiBtdXR1YWxseSBleGNs
dXNpdmUsIElzIHRoZXJlIGEgcmVhc29uIHdoeSB0aGUgdGhyZWFkZWQgaW50ZXJydXB0DQo+IHNo
b3VsZCBub3QgYmUgbWFya2VkIHdpdGggSVJRRl9PTkVTSE9UID8gTWFya2luZyBpdCBJUlFGX09O
RVNIT1QgbWFrZXMNCj4gdGhlIHRocmVhZGVkIGlycSBmcmFtZXdvcmsgdG8gZW5zdXJlIG11dHVh
bCBleGNsdXNpdml0eSBmb3IgdXMuIEkNCj4gd2FzIHZhbGlkYXRpbmcgdGhpcyBhbmQgdGhpcyBz
ZWVtcyB0byBiZSBwcmV0dHkgZWZmZWN0aXZlLiBDdXJpb3VzIHRvDQo+IGtub3cgeW91ciB0aG91
Z2h0cyAhDQoNCg0KV2Ugc2hvdWxkbid0IGRvIHRoYXQuIFRoZXJlIGFyZSBkZXNpZ25zIHdpdGgg
cGh5IGRyaXZlciBvciBjb25uZWN0b3INCmRyaXZlciBvciBvdGhlciBkZXZpY2VzIHRoYXQgc2hh
cmUgdGhlIHNhbWUgaW50ZXJydXB0IGxpbmUuDQoNCj4gDQo+ID4NCj4gPg0KPiA+IEluIHlvdXIg
Y2FzZSwgdGhlcmUncyBhIHNtYWxsIHdpbmRvdyB3aGVyZSB0aGUgVEggbWF5IGJlIHNjaGVkdWxl
ZCBidXQNCj4gPiB0aGUgRFdDM19FVkVOVF9QRU5ESU5HIGZsYWcgaXMgbm90IGNsZWFyZWQgeWV0
LiBSZXR1cm5pbmcNCj4gPiBJUlFfV0FLRV9USFJFQUQgbWF5IHdvcmthcm91bmQgeW91ciBpc3N1
ZSBiZWNhdXNlIHRoZSBCSCBtYXkgYWxyZWFkeSBiZQ0KPiA+IHJ1bm5pbmcgd2hlbiBEV0MzX0VW
RU5UX1BFTkRJTkcgaXMgc2V0LiBJJ20gbm90IHN1cmUgd2hhdCBvdGhlciBzaWRlDQo+ID4gZWZm
ZWN0IHRoaXMgbWF5IGhhdmUgc2luY2Ugd2UncmUgYnJlYWtpbmcgdGhpcyBleHBlY3RhdGlvbi4N
Cj4gPg0KPiA+IFdlIG1heSBlbmhhbmNlIHRoZSBkd2MzIGhhbmRsaW5nIG9mIGV2ZW50IGZsb3cg
aW4gdGhlIGZ1dHVyZSB0byBpbXByb3ZlDQo+ID4gdGhpcy4gQnV0IGF0IHRoZSBtb21lbnQsIHdl
IHNob3VsZCBub3QgcmV0dXJuIElSUV9XQUtFX1RIUkVBRCBoZXJlLg0KPiA+DQo+ID4gPg0KPiA+
ID4gMi4gV2hlbiBpbnRlcnJ1cHQgbW9kZXJhdGlvbiBpcyBlbmFibGVkLCBkb2VzIERFVklDRV9J
TU9EQyBzdGFydCB0bw0KPiA+ID4gZGVjcmVtZW50IGFzIHNvb24gYXMgdGhlIGludGVycnVwdCBp
cyBtYXNrZWQgKHdoZXJlIEkgZXhwZWN0IHRoYXQgdGhlDQo+ID4gPiBpbnRlcnJ1cHQgbGluZSBn
ZXRzIGRlLWFzc2VydGVkIGJ5IHRoZSBjb250cm9sbGVyKSBpbg0KPiA+ID4gZHdjM19jaGVja19l
dmVudF9idWYoKSAgPw0KPiA+ID4NCj4gPiA+IC8qIE1hc2sgaW50ZXJydXB0ICovDQo+ID4gPiBk
d2MzX3dyaXRlbChkd2MtPnJlZ3MsIERXQzNfR0VWTlRTSVooMCksDQo+ID4gPiAgICBEV0MzX0dF
Vk5UU0laX0lOVE1BU0sgfCBEV0MzX0dFVk5UU0laX1NJWkUoZXZ0LT5sZW5ndGgpKTsNCj4gPiA+
DQo+ID4NCj4gPiBUaGUgREVWSUNFX0lNT0RDIGlzIGxvYWRlZCB3aXRoIERFVklDRV9JTU9ESSBh
bmQgc3RhcnRzIHRvIGRlY3JlbWVudCBhcw0KPiA+IHNvb24gYXMgdGhlIGludGVycnVwdCBpcyBk
ZS1hc3NlcnRlZCBmcm9tIHRoZSBhc3NlcnRlZCBzdGF0ZSwgd2hpY2gNCj4gPiBpbmNsdWRlcyB3
aGVuIHRoZSBpbnRlcnJ1cHQgaXMgbWFza2VkLiBZb3UgYnJvdWdodCB1cCBhIGdvb2QgcXVlc3Rp
b24NCj4gPiBoZXJlLiBUaGUgSU1PRCBjb3VudCBtYXkgYWxyZWFkeSBiZSAwIHdoZW4gd2UgZXhp
dCB0aGUgQkguIENhbiB5b3UgdHJ5DQo+ID4gdGhpcyBleHBlcmltZW50IHRvIHVwZGF0ZSB0aGUg
Y291bnQgYW5kIGxldCBtZSBrbm93IGlmIGl0IGhlbHBzOg0KPiANCj4gDQo+IEdhdmUgdGhpcyBh
IHRyeSwgdW5mb3J0dW5hdGVseSB0aGlzIGRvZXMgbm90IHNlZW0gdG8gaGVscCAhIEkgc2VlIHdo
YXQNCj4geW91IGFyZSB0cnlpbmcgdG8gZG8gdGhvdWdoLiBZb3UgYXJlIHRyeWluZyB0byBleHBs
aWNpdGx5IHJlLWFybSB0aGUNCj4gdGltZXIuIEkgd2FzIGNoZWNraW5nIHRoZSByZWdpc3RlciBk
ZXNjcmlwdGlvbiBhcyB3ZWxsIGFuZCBpdCBkb2VzIG5vdCBzZWVtIHRvDQo+IGd1YXJhbnRlZSB0
aGF0IGRpcmVjdGx5IHdyaXRpbmcgdG8gREVWSUNFX0lNT0RDIHJlc3RhcnRzIHRoZSBjb3VudGVy
DQo+IGFnYWluLg0KPiANCg0KSG1tLi4uIENhbiB5b3UgdHJ5IHRoaXMgaW5zdGVhZDoNCg0KZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvdXNiL2R3YzMvZ2FkZ2V0LmMgYi9kcml2ZXJzL3VzYi9kd2MzL2dh
ZGdldC5jDQppbmRleCAwZmU5MmMwZmI1MjAuLmMxYjVhMzc0MmFiNCAxMDA2NDQNCi0tLSBhL2Ry
aXZlcnMvdXNiL2R3YzMvZ2FkZ2V0LmMNCisrKyBiL2RyaXZlcnMvdXNiL2R3YzMvZ2FkZ2V0LmMN
CkBAIC01NzM3LDE0ICs1NzM3LDIwIEBAIHN0YXRpYyBpcnFyZXR1cm5fdCBkd2MzX3Byb2Nlc3Nf
ZXZlbnRfYnVmKHN0cnVjdCBkd2MzX2V2ZW50X2J1ZmZlciAqZXZ0KQ0KICAgICAgICBkd2MzX3dy
aXRlbChkd2MtPnJlZ3MsIERXQzNfR0VWTlRTSVooMCksDQogICAgICAgICAgICAgICAgICAgIERX
QzNfR0VWTlRTSVpfU0laRShldnQtPmxlbmd0aCkpOw0KIA0KKyAgICAgICAvKg0KKyAgICAgICAg
KiBLZWVwIHRoZSBjbGVhcmluZyBvZiBEV0MzX0VWRU5UX1BFTkRJTkcgYWZ0ZXIgdGhlIGludGVy
cnVwdCB1bm1hc2sNCisgICAgICAgICogYnV0IGJlZm9yZSB0aGUgY2xlYXJpbmcgb2YgRFdDM19H
RVZOVENPVU5UX0VIQi4NCisgICAgICAgICovDQorICAgICAgIGV2dC0+ZmxhZ3MgJj0gfkRXQzNf
RVZFTlRfUEVORElORzsNCisNCisgICAgICAgLyogRW5zdXJlIHRoZSBmbGFnIGlzIHVwZGF0ZWQg
YmVmb3JlIGNsZWFyaW5nIERXQzNfR0VWTlRDT1VOVF9FSEIgKi8NCisgICAgICAgd21iKCk7DQor
DQogICAgICAgIGlmIChkd2MtPmltb2RfaW50ZXJ2YWwpIHsNCiAgICAgICAgICAgICAgICBkd2Mz
X3dyaXRlbChkd2MtPnJlZ3MsIERXQzNfR0VWTlRDT1VOVCgwKSwgRFdDM19HRVZOVENPVU5UX0VI
Qik7DQogICAgICAgICAgICAgICAgZHdjM193cml0ZWwoZHdjLT5yZWdzLCBEV0MzX0RFVl9JTU9E
KDApLCBkd2MtPmltb2RfaW50ZXJ2YWwpOw0KICAgICAgICB9DQogDQotICAgICAgIC8qIEtlZXAg
dGhlIGNsZWFyaW5nIG9mIERXQzNfRVZFTlRfUEVORElORyBhdCB0aGUgZW5kICovDQotICAgICAg
IGV2dC0+ZmxhZ3MgJj0gfkRXQzNfRVZFTlRfUEVORElORzsNCi0NCiAgICAgICAgcmV0dXJuIHJl
dDsNCiB9DQoNCg0KVGhpcyBzaG91bGQgc29sdmUgdGhlIGlzc3VlIGZvciBjb250cm9sbGVycyB3
aXRoIElNT0QgZW5hYmxlZC4NCg0KVGhhbmtzLA0KVGhpbmg=
