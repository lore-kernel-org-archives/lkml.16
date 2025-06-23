Received: from mx0a-00230701.pphosted.com (mx0a-00230701.pphosted.com [148.163.156.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8562D226D1B;
	Mon, 23 Jun 2025 22:41:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.156.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750718511; cv=fail; b=N30CUueD0s2KBHlllAK8GTj58k6tLij1SnEFPzCPL77Gj9cQWPbn2r2jAtvUYL8DSrzj2rr6vPZ8xX0R+9AHhyD/DxXNXoopMZRy06XzpFPPi5wiiml6NY03BNfAUfNQSg5IfIfyzqCzOsyZ/KSB/wYefpikLaQ/b1C+vbC3USA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750718511; c=relaxed/simple;
	bh=Qy7oRKVjO0+a1MQYfizhW8HtgEc3+ik8uMEMAY5cc6E=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=qhWAuIN7is55ARQ4QbKklCXCOWmuPs37IsXJiTavwX5hESgNFWueowihogxjqrTuRF52hA4PTHY4M/3vEY5mBuOQ5S4lIjO5LiHCPySbBvJ5IZ9fvBrIQ01fOmthFNjSy7Jmt3JfAx2iUTqCayEiklB6KPTW7648QPQGcRAA0us=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=f/8wv3rM; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=fJMA402v; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=VxA6Ercx reason="signature verification failed"; arc=fail smtp.client-ip=148.163.156.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="f/8wv3rM";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="fJMA402v";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="VxA6Ercx"
Received: from pps.filterd (m0098571.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55NGWDZh012620;
	Mon, 23 Jun 2025 15:41:35 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=Qy7oRKVjO0+a1MQYfizhW8HtgEc3+ik8uMEMAY5cc6E=; b=
	f/8wv3rMXabLbO25GIYbQuE4oG31hAbjnKcs1+eK5+USmEnWxcRD4HRQA7jIWtga
	T49q8giVbNgopwRHjCeJFe5zrMx5V64iSbiHRD6Xr4HwcLn5hFkrQ55L5coyfEim
	jonfuCb7nPtDWlYuUZIwWeEWSMEJeAIWhy77Hhbnwg7fvdT5zbqZGg/4draUZL8y
	sFtvU8IGfJ8fhnKpT+7BkTJcaqkq8w2CvgDHEPnpnuIRyL9x5PF8hI2ulTurijBi
	9OskbvQfjrE7R3m+UCALK+Iwd9fj1K8bI+B849bqbVgMc4QJVBnxpt93pckzHw8n
	FiCfLBg5zb+ZEHHAj5236A==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 47durr7tuf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 23 Jun 2025 15:41:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1750718494; bh=Qy7oRKVjO0+a1MQYfizhW8HtgEc3+ik8uMEMAY5cc6E=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=fJMA402vaIXDOa41HIZYu6/jrLUW6ilKPXCwypTpCBiIc6CGWgg3OoZBwNBxUKLkn
	 wVWI5BWdcTCGcHdh2cVQrCslm7yrJk3badcfd5N3xj4xHzwuqNCd6+ko4RH2KIlU5r
	 O6LetiZJlwsq/QCTey7M9EoZUsH/nugzjTMODtpwO1IO9YWQgv5yf+dLmYYfSK0WMh
	 UPK2y3Ao9ifctM519/F8x8EJJRXVY8l5dQSlsB43h6si9wQkWFGaePQ4JZvr0mn4CA
	 pm1tipKXITdhGYpMYyf+FK8w0t1/q8hHPkFoJi73WaJukatsv1RLEggfWUMBLpyuTP
	 WbxVjHkt0MFKA==
Received: from mailhost.synopsys.com (badc-mailhost3.synopsys.com [10.192.0.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 91A9A40343;
	Mon, 23 Jun 2025 22:41:34 +0000 (UTC)
Received: from o365relay-in.synopsys.com (us03-o365relay1.synopsys.com [10.4.161.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id 0BF76A007A;
	Mon, 23 Jun 2025 22:41:34 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=VxA6Ercx;
	dkim-atps=neutral
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2171.outbound.protection.outlook.com [104.47.55.171])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id DAC9940B20;
	Mon, 23 Jun 2025 22:41:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e2ubaAHvVjuspklZlWro0EWRbuFz+WLZ6EW2nZcvzVwvIj5ZQOe4dGJmRqD0S6R6tPg/w2xgv+Nf/QGk/DrV3GYX0ozHFN25Xe9evrqdFMzrzGuOCiZKeXd319+UxqBJ3g7+QaTfd+DsoREcQkwo0WYvP8BDyQxXmyKbzbjUxzqOMCZw1W4BtbHTpVjCAiGRHz67AS/w5g9q79j6nMezuImR/E3HOW+idC82CQ/nAedkTcHfdDVDhnGe8LbqDOH11czd00MQ7OhW3GHg+d/oz6hfp5zW9/dqH9JXp7JyluOS7ZgXXQXQo8CTDRnN9QF67fiUKs0l/5JD9qpmtobHHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Qy7oRKVjO0+a1MQYfizhW8HtgEc3+ik8uMEMAY5cc6E=;
 b=L4Qtyo7PVJvCUA4cWQq2Ji53vrCW8baicWQYAr8rP7Gm/b+haQm8bfp/7LW3tubkcpSXd0Z72JqQxFsVGRhkf84wZZ/4jm2wRpsB1/htIn9XDVRardxnPXaeZvEVlYhqhewkof9QTu1mXUGz3uFQ1PUBtMfRlVSCBrSadhogcUKCKrMNk9NYmT48Tl03ION2JTXdTUapnT3J5e2e6F6jqbXGVaWZrpdtvMEmglpdrB6ouzxjYUz1ajbIem2n5U12ZDhtEcAh9eo75HtOQVm+Pe3p4xuiLvP5ywtm58dopfgxfGs+5wdKdnEmw8Oo976hfXv8EURRKx9eNYbZnFidQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qy7oRKVjO0+a1MQYfizhW8HtgEc3+ik8uMEMAY5cc6E=;
 b=VxA6ErcxjiRSiGEeoALNMFwR3iZmzBmZ8e6AX5GthAy+SRi+iSDW5mWxWBvCmyv+fvk4GvEVtzM7d1gbMbbqHh2EmkzfwAaaZZBEY/2jPzdFnpJ47Rf8EI0Sj91FXUZt2VyYAyDZxWl0jL9DFHmezdzK02TkJHy8J05vDqn1ERQ=
Received: from LV2PR12MB5990.namprd12.prod.outlook.com (2603:10b6:408:170::16)
 by PH7PR12MB5595.namprd12.prod.outlook.com (2603:10b6:510:135::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.19; Mon, 23 Jun
 2025 22:41:27 +0000
Received: from LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8]) by LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8%6]) with mapi id 15.20.8857.026; Mon, 23 Jun 2025
 22:41:27 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Johannes Schneider <johannes.schneider@leica-geosystems.com>
CC: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "bsp-development.geo@leica-geosystems.com" <bsp-development.geo@leica-geosystems.com>
Subject: Re: [PATCH 1/3] usb: dwc3: gadget: Fix TRB reclaim logic for short
 transfers and ZLPs
Thread-Topic: [PATCH 1/3] usb: dwc3: gadget: Fix TRB reclaim logic for short
 transfers and ZLPs
Thread-Index: AQHb4t++sxfJFREzt0y/Mqx2OU6ctbQRWiMA
Date: Mon, 23 Jun 2025 22:41:27 +0000
Message-ID: <20250623224122.46m2hslqgllncjsi@synopsys.com>
References:
 <20250621-dwc3-fix-gadget-mtp-v1-0-a45e6def71bb@leica-geosystems.com>
 <20250621-dwc3-fix-gadget-mtp-v1-1-a45e6def71bb@leica-geosystems.com>
In-Reply-To:
 <20250621-dwc3-fix-gadget-mtp-v1-1-a45e6def71bb@leica-geosystems.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR12MB5990:EE_|PH7PR12MB5595:EE_
x-ms-office365-filtering-correlation-id: 7e2f80be-b3b0-44e8-7cc0-08ddb2a71751
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?TlNVZDh0WVllckhuRzVTOGFCOTRnVklUNEY5R3lJbTVNK0NvU2JBQnBPWnB2?=
 =?utf-8?B?dXdyUWdsOXdNandtM0p1RHkwVTd5LytRM0owZ0ZTWThaTVp1Mkl1ZlUraEs4?=
 =?utf-8?B?TUI2UnFPbFNZazR1clQyRzZtQzA4RGZGeUNwbXZjWW5iMGtzZ0phNlZEd3dF?=
 =?utf-8?B?NjBaeEtRejhrQ1VNcW1wRkJId25LckNPbWc4b0gwenQwZGNQanM3MHBiQ1dT?=
 =?utf-8?B?WEE1Yy9RcmRQZndBME8xU0ZacUJ0V1Y3ZGNrMThxUTZnaVVTV3JiNzg2ZjBi?=
 =?utf-8?B?REdKMVVtOFB5NVRPdFVXbmsxR2djZjQveTdNTmx3RWtUMFV4UTA0QVRuWkJK?=
 =?utf-8?B?K0xUbi83N2xPNEtKbE81UDd6SmQzVy91NG1OTGV2RGdMQmJ1azZscnRiNWw0?=
 =?utf-8?B?bUw0Qllqc3ZsQmFPR2pjOUJmbXo4VWZKNWNyMkh3bkE0djBZVTBxK09qcjdr?=
 =?utf-8?B?K0Z0UmtBaUhtdldyQnNFVC9hbjZSL2sveFRDY1FWWEJCQ01XeVV3UVU2Mlk3?=
 =?utf-8?B?MFozVnZhNGU4WndKc2VGRU5LY095ZUN3MllmeU4yQUJ1bkM2UEhOdjRucXg0?=
 =?utf-8?B?b2doVXVnZ2lGQnJzRmJSNjBzSFNiMzZKeEpwWFZmWUV4ZVI5Z3k2NmtxQzZ3?=
 =?utf-8?B?M3dFRnBqZ0pud1pwWWRoTmpGaXM3aGlnV2JBeDNDcnZWditubEQ2ejVjN2w0?=
 =?utf-8?B?am1CQ1cveEJjRW9rZkd5cnlEMVRBSU5kb1o0Q2NubnF2TXBla3dCeGdwem9P?=
 =?utf-8?B?UUtVZmVCQ1Y4N3VWekFNYWFkU0xRWCt3c1JMQ2YyeVptMk9INzlHNmlaVHpC?=
 =?utf-8?B?cU05UENuVmFLbmxNbnJ4Ui9FSGpUQVhDUWxGbTBJOC9heWRDNlo4Z0pHNWFF?=
 =?utf-8?B?N3NCT2tQd3hETVAydE5kLzR4ZE1RMGVkdEpXQTZjOHhUUFBodWZzVklVd2ty?=
 =?utf-8?B?aG9rWENzZWJ0SGpFVWdMWVJrNzRnQ3pXWnBqMEJKVHVJN3hFMSttdHY1ZHZi?=
 =?utf-8?B?eXZwV2RJTzNpZVhlYnZNdVNyUXZQeUNhRXhWK013V2JLWlBVMmhiQXlFUm9K?=
 =?utf-8?B?M3RHQVRBOHFpaXhodnlaUVE4Q25Oam9rOWhzRUFFejJEU2Nad3VkN21WMWZl?=
 =?utf-8?B?eVRMb0RmL2dndWI4dHRjSHNLY3k5L3pKRkJYUW9PckxQNUNlWUl4UlJTQ2h5?=
 =?utf-8?B?SlNCSWg3d2ttRG0rdzh5NGxwVjRGK3Z2OXArTjlydmc1cHJKRERJUmNZUnJx?=
 =?utf-8?B?VWRFSy8vNTgyeVBnRFRJVExhNzBOMTFZbmZtOXkyQ05DNDN5S2tDVlpsUk80?=
 =?utf-8?B?dXJDTkw1OWJkMnp1a2diRHF4dndlT21NUmZJaHhvNmVGbnNwc3Y5bHd0N0J3?=
 =?utf-8?B?TEg1UVo1Y2l6ems1MW1nb0pUM2FMTnoyb1pmc1dJWkFHU0IvMlN0UkJISXpN?=
 =?utf-8?B?ZUlkUjJIUUpaa1p1RzFGcityUWtzci9DY3N1UWY1VG0zWiswbEhLcEhvLytX?=
 =?utf-8?B?V2d1d1BWWVRKeVROVXBsajVuWTROdVFOb1pwMFNEc0V6bVV2ZFgxWUI1ZHpU?=
 =?utf-8?B?QjJxMWZOZ1BLbmtmMEsybXpkL2dlSjFWTjZCWTFXVjBvSktzWThPeEc5SXY0?=
 =?utf-8?B?M21LaitJUHg2QmUyQkkvQUZKVFA2bUJXSlBHc0F1SlBmQVV5Ylk5SjdaNDVj?=
 =?utf-8?B?MUtHOEUxV0ptWDlzL2ZucXpPSDYwdkJGVEd4UTNIOEpWZWZXM3NkeHZCTGJM?=
 =?utf-8?B?VU0zUVkrNWJEZ3RUK09maWErZ01aOFJpVlRFK3kxMWIzTGllT251K0VSRnMx?=
 =?utf-8?B?cTllakJuRVpaMG9Ma1Z4Nlg3VWlxYkNoOWlFbE9MUkVyWmFsRHpabWFYR2k3?=
 =?utf-8?B?TU9rS2d5K0pjTlBhL1hTUVpyUXpqczlIWmhXYlF5bFBFSTVka0d2TzZYelpw?=
 =?utf-8?B?MHgvejk1UDVlVEhqYUcwd3BVTzErempaL1NyR2dtbTVjUXZ4bFZrcUp2WVBw?=
 =?utf-8?Q?AociNmItJZ05TYZ+ADed2dVQ1kL6xI=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?bVZmRG9wZDVFTjI4S1V3dFJqeDdkUnNyRkdmUXIyNGNZcTBvdkdkSDc1WTJX?=
 =?utf-8?B?YitlalZ3alNoOVpQY3ozU3J2ZEJ2SjFWUlo4VXZlSlBia3RoeDFKVG5VT0or?=
 =?utf-8?B?d2FqaEV2aERkYURqalM2aEUvdHVzb3d4blJaMjVlVkNsVDFQNWNWZm9RRXFH?=
 =?utf-8?B?SHpQWkZPMmZEbEgycFdOL09RcE9UdGRzbzBwYWlDYUdpVk1jNkhtM3hsTmtl?=
 =?utf-8?B?SFBEWFRtMGg3V3VpYWVpR0hIcjR0dk1icWFFWGtVYndBcGNaVlM0WlYzenhB?=
 =?utf-8?B?elJMbjk1eXdnZ0w3OUhlT0hmSDliU2x1LzY5MDRweTljKzgrb2xGUzVJZnZW?=
 =?utf-8?B?a0tsZ2tyRlR5NHdQMFFzajBOSVF4RFhLZVpVRDBQQ01Vb29mS1NCSmhZUnA4?=
 =?utf-8?B?NkgwWXR5enJwUGFMU2ZzSnMyQ0traHBwV0hrN1l1U3hldFAyVWZCTkpvelAx?=
 =?utf-8?B?VitrYlNOT3hxRGZlL3d4Qm5JM0VlaWVtTk1XRDFDL0szTEorN2R6NDVGN1hP?=
 =?utf-8?B?bjQxallyZXk4K2VzbUlPckxHbmxnVXdHd1FWOXJiU3VUaGMvVGxQU2ZpZmtq?=
 =?utf-8?B?QWtTcVh6ZHhYQStzZ1liWDBaL2lmbWJ3K2xyZkhUdU9wajdVMDl1bFYvdlJ4?=
 =?utf-8?B?VCsxU0czVXV1MXM3d3BGVXVWdzc5QkIzb0V6MTZibE5xTUxBRjJHaHkzZ2lm?=
 =?utf-8?B?RDV0ZGttNzRDblE5T3ZUZG1sYXNxZXYrRGQybHhncjdsc3VYSnNkWitXdVM5?=
 =?utf-8?B?eVVHakk5aUUvY3RoNlBsbWVQcWJZR2xCdXpyejRmbDhmMjU2OXhNTmlYZi9M?=
 =?utf-8?B?bnBJb3pRZzh0Q2dPR1dsWGxqMS9pdzE3T0FNQjBad3Y3ekRRTnJsRENDOGtp?=
 =?utf-8?B?VFdjMlB6Z0duaFJHQ2JMekhZNHFWcnlrZVdwQXR5WTNYYzBnMWZsUU9mSXFL?=
 =?utf-8?B?eEdBby9Eb3R5bG03YXhrWXdzK1hVZko1b2xuOTJOVFlaMkgyYjNuRVRLZC9h?=
 =?utf-8?B?U3NwM2FHL1BLS29yM2EyVFdhV0hYSmc3TjdlclAwR1JIUnJaOGNwZFA4MFEy?=
 =?utf-8?B?Z0QydkdRTEMrckRiSVJiZ3Y0NHFqM1VVK2ZkSlYrbUY0bFNucW00aUVLdFRG?=
 =?utf-8?B?TEEzbDB5VHg3aXRHSEFWaTRXTW9kM1JGdkJncDRFMWZ0SW9qSENrNVErMlpq?=
 =?utf-8?B?dkdYcmZObE9rUDZsZjFqeFlINy84MmVzRG5NeXR3VFBYZDlIald3bnF2WGZv?=
 =?utf-8?B?aDl4bmlHOUxoYVZKTmxreVBmWlVMOWU3c2FqZFVPM0srdzQ3QnRoRlc4K0R1?=
 =?utf-8?B?cHVQWVg0THJWaDh2bHA2QWh2WkhyaHUzSk1TdWJlTzY1azZTME1ONnZyenlC?=
 =?utf-8?B?b3NKN0NRMDNtKzRyR0FtVEpISDFCbXRSQXFXUE94OFI5SXhWby9FYlN3Wmty?=
 =?utf-8?B?R2pBeDhzMFhVNi9JRVJ5M0Z0RGdZbUgxcElXNEhLMExUN2h2Z1p2ZUFqdC9M?=
 =?utf-8?B?QmdFbER6MGFZMVFDQzJld21JVkZJS2lJS2hEVlFNMDVwVjNSdUd3Y0xMVmxR?=
 =?utf-8?B?SU5Wb2dWbEhPZWRKWFdibTVkOEgvUTZDN283ZytrZ2ZNSWVrNTMrMlduM1Ix?=
 =?utf-8?B?UFQ1a0Q5UDAraFkzdE12Nlgxek8zYjdpK0s1anZJUTk0cXBuODZGeVA0VHFj?=
 =?utf-8?B?cTg0aVZCaGUrZUowMTVUbHIxdlh5YnhYeDI2azJva0JSQXpkUnAxb1ZXYnV4?=
 =?utf-8?B?WjFicHRkdDhjNWoyTDBrZHQxNDNreWNScTJkemJIU0RZTG80NUx4ZHUvTkVn?=
 =?utf-8?B?MndmODk1QmZ3ejk4ZWpRczVQVHB2d0xqaEZUcjhaZCtLZU1mWXh3ekJTRkJS?=
 =?utf-8?B?aGRBV1pMaFhRQXRVclJuSXlZNG9UY0JnK2ozSmhIMVVwcUVnYzJzeHBYWGJu?=
 =?utf-8?B?aGdkT0hFSFpaNWplVDhwL3hHbjVqbWhZekgrMG16UnVBTVVCd01LTnRKbFBJ?=
 =?utf-8?B?dXRQd2lPaE1rV2E1SExObGV1dG9EcGgzbm9jaEljcU9UaGR5TmZvUW1pemFn?=
 =?utf-8?B?MkdNU1B0RUJ0NzZRTllWTDRhVzBsdElUQ052bVlmQytmcm5JTjdDV01uRlcv?=
 =?utf-8?Q?r9eMXumKwCEt1+XTATwEkxvS0?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <ACD36C61A1144B4DB88ACAB32A70A9B9@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	v5Y1Jht+Tpda1VBwGOa7iNfuxPmzzXHYHPS/NBveKqaTsrUe3x1QmFJ0x3GoTZ5tS1ZQI4NpDW4jQ2weEeDzkAPpGlyBXRrl+IR6A+GYCq9u3GF6ObyFZXvos9LCUjmQmCbTT9az4pZhnjR5YTaWakmngMn8GCzUe4D8C7jol8fxZ9xTekVOXIBF+ZOe/th1ElG8C+69pdEZpfMN29x2puqgs62ay21c4L15S8JIbYSGMKfcOJmll1wQIaddgvWavcqiIlc/4cRb0XVumkcb7WFEvqY2Xu9UGLEbARwM1hZUyMgx2vyzB0Oymr86QZjgVl08RSkgNoEJwJ8Wj4W3ZbA0faZ8Jhy7C4Rt2texJ5xBalVIF1EosO3WLWxQTMGSPCbmjPcLCfv2HRHymCsTnLOCU5W9CA1rQswB7LEczmf4XEUArpM/rxA2hwfGMX21bhK3KwAtwC/+PFna+mmiFkaMtwX1Gpt9rGlXKbD/Xanv4t0/rvIrfLVELqh/1JRJbBgNZNwDLpypt03IjmRTbxGPJHyjDZQtS5vohWhZiq9RDpYz6zqXoVBF0lYtWfJCWtJNFFEeMgNXFPwqwd14gvq5TDnBleAFeua5Ai8HrJ4zmhOOLRCXqj3/+nMEGnOalYgIE9JhRw+cNqRkemS8DA==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e2f80be-b3b0-44e8-7cc0-08ddb2a71751
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jun 2025 22:41:27.6775
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MOpjZyYfpobUG0kbo3XULxGBHVxS2bJnqWw1CGhhtJmBd1Ajjg6wLqTREY2CCEb6oR+hgQGnw4eaK8Y2tvDVQA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5595
X-Proofpoint-GUID: cf4kpCw8-yPvD47zvlRc5Y20momN1F6X
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIzMDE1NSBTYWx0ZWRfXx0VNxJB/VydN
 MELcLnGAWc+7ioPEovlCLHbT6j1NMpRoTygXywWmf7cKSNN7Xdfeb5icsm90DJCmn6TnikF1Bmh
 UD4fptE4uy50SKIlPmiOZSvdEy8EvmbVoW0lEURFDRk6Eqov493bd690CA29ceDR1BJm8/l7vhf
 eVfrBpa7kp/Fn2lgoyAzc4KLAroF0oByn9coCFhzqWs8XI497qzdzB7+XB0ZCQ1BLktb+qem2w6
 E1Ayv4pTORblt7UbIgfe1/bHN2bY1DnPU3SuCA9sLEAwrdOgn5jgr8bQn2yPJRznngcKYw2OWnD
 7LgrZ3FO0Qgg77SmX3KdLXrA8zvZgygKgrJxBFAHCX66IhhqW4kKmJ/PTo2rhFHwTHAFKZgPhmF
 c2tPo8nMhdjsQTl2OWgHrJwMP9aIcJYZ+VmI+9s/Q741J/MNIKqnqntBy7Zj01KACzHVRciG
X-Proofpoint-ORIG-GUID: cf4kpCw8-yPvD47zvlRc5Y20momN1F6X
X-Authority-Analysis: v=2.4 cv=OdiYDgTY c=1 sm=1 tr=0 ts=6859d81f cx=c_pps
 a=t4gDRyhI9k+KZ5gXRQysFQ==:117 a=t4gDRyhI9k+KZ5gXRQysFQ==:17
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6IFa9wvqVegA:10 a=qPHU084jO2kA:10 a=N3aGF_hyAAAA:8 a=jIQo8A4GAAAA:8
 a=Jz0lYQZKqvIlySnW870A:9 a=QEXdDO2ut3YA:10 a=or5rwjIMHQalKGFFZql7:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-23_07,2025-06-23_07,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0 bulkscore=0 adultscore=0
 lowpriorityscore=0 spamscore=0 mlxscore=0 impostorscore=0 malwarescore=0
 clxscore=1015 suspectscore=0 priorityscore=1501 phishscore=0 mlxlogscore=999
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2505280000 definitions=main-2506230155

T24gU2F0LCBKdW4gMjEsIDIwMjUsIEpvaGFubmVzIFNjaG5laWRlciB3cm90ZToNCj4gQ29tbWl0
IDYxNDQwNjI4YTRmZiAoInVzYjogZHdjMzogZ2FkZ2V0OiBDbGVhbnVwIFNHIGhhbmRsaW5nIikg
dXBkYXRlZA0KPiB0aGUgVFJCIHJlY2xhaW0gcGF0aCB0byB1c2UgdGhlIFRSQiBDSE4gKENoYWlu
KSBiaXQgdG8gZGV0ZXJtaW5lIHdoZXRoZXINCj4gYSBUUkIgd2FzIHBhcnQgb2YgYSBjaGFpbi4g
SG93ZXZlciwgdGhpcyBpbmFkdmVydGVudGx5IGNoYW5nZWQgdGhlDQo+IGJlaGF2aW9yIG9mIHJl
Y2xhaW1pbmcgdGhlIGZpbmFsIFRSQiBpbiBzb21lIHNjYXR0ZXItZ2F0aGVyIG9yIHNob3J0DQo+
IHRyYW5zZmVyIGNhc2VzLg0KPiANCj4gSW4gcGFydGljdWxhciwgaWYgdGhlIGZpbmFsIFRSQiBk
aWQgbm90IGhhdmUgdGhlIENITiBiaXQgc2V0LCB0aGUNCj4gY2xlYW51cCBwYXRoIGNvdWxkIGlu
Y29ycmVjdGx5IHNraXAgY2xlYXJpbmcgdGhlIEhXTyAoSGFyZHdhcmUgT3duKQ0KPiBiaXQsIGxl
YXZpbmcgc3RhbGUgVFJCcyBpbiB0aGUgcmluZy4gVGhpcyByZXN1bHRlZCBpbiBicm9rZW4gZGF0
YQ0KPiB0cmFuc2ZlciBjb21wbGV0aW9ucyBpbiB1c2Vyc3BhY2UsIG5vdGFibHkgZm9yIE1UUCBv
dmVyIEZ1bmN0aW9uRlMuDQo+IA0KPiBGaXggdGhpcyBieSB1bmNvbmRpdGlvbmFsbHkgY2xlYXJp
bmcgdGhlIEhXTyBiaXQgZHVyaW5nIFRSQiByZWNsYWltLA0KPiByZWdhcmRsZXNzIG9mIHRoZSBD
SE4gYml0IHN0YXRlLiBUaGlzIHJlc3RvcmVzIGNvcnJlY3QgYmVoYXZpb3INCj4gZXNwZWNpYWxs
eSBmb3IgdHJhbnNmZXJzIHRoYXQgcmVxdWlyZSBaTFBzIG9yIGVuZCBvbiBub24tQ0hOIFRSQnMu
DQo+IA0KPiBGaXhlczogNjE0NDA2MjhhNGZmICgidXNiOiBkd2MzOiBnYWRnZXQ6IENsZWFudXAg
U0cgaGFuZGxpbmciKQ0KPiBTaWduZWQtb2ZmLWJ5OiBKb2hhbm5lcyBTY2huZWlkZXIgPGpvaGFu
bmVzLnNjaG5laWRlckBsZWljYS1nZW9zeXN0ZW1zLmNvbT4NCj4gLS0tDQo+ICBkcml2ZXJzL3Vz
Yi9kd2MzL2dhZGdldC5jIHwgMiArLQ0KPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCsp
LCAxIGRlbGV0aW9uKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy91c2IvZHdjMy9nYWRn
ZXQuYyBiL2RyaXZlcnMvdXNiL2R3YzMvZ2FkZ2V0LmMNCj4gaW5kZXggMzIxMzYxMjg4OTM1ZGI0
Yjc3M2NkMDYyMzVhMTY2NzBhNmFkZGExYS4uOTlmYmQyOWQ4ZjQ2ZDMwZGY1NThjZWIyM2QyYWZl
NzE4N2I0MjQ0YyAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy91c2IvZHdjMy9nYWRnZXQuYw0KPiAr
KysgYi9kcml2ZXJzL3VzYi9kd2MzL2dhZGdldC5jDQo+IEBAIC0zNTE2LDcgKzM1MTYsNyBAQCBz
dGF0aWMgaW50IGR3YzNfZ2FkZ2V0X2VwX3JlY2xhaW1fY29tcGxldGVkX3RyYihzdHJ1Y3QgZHdj
M19lcCAqZGVwLA0KPiAgCSAqIFdlJ3JlIGdvaW5nIHRvIGRvIHRoYXQgaGVyZSB0byBhdm9pZCBw
cm9ibGVtcyBvZiBIVyB0cnlpbmcNCj4gIAkgKiB0byB1c2UgYm9ndXMgVFJCcyBmb3IgdHJhbnNm
ZXJzLg0KPiAgCSAqLw0KPiAtCWlmIChjaGFpbiAmJiAodHJiLT5jdHJsICYgRFdDM19UUkJfQ1RS
TF9IV08pKQ0KPiArCWlmICh0cmItPmN0cmwgJiBEV0MzX1RSQl9DVFJMX0hXTykNCj4gIAkJdHJi
LT5jdHJsICY9IH5EV0MzX1RSQl9DVFJMX0hXTzsNCj4gIA0KPiAgCS8qDQo+IA0KPiAtLSANCj4g
Mi4zNC4xDQo+IA0KDQpUaGFua3MgZm9yIHRoZSBjYXRjaC4gUGxlYXNlIGFsc28gQ2Mgc3RhYmxl
Lg0KDQpBY2tlZC1ieTogVGhpbmggTmd1eWVuIDxUaGluaC5OZ3V5ZW5Ac3lub3BzeXMuY29tPg0K
DQpCUiwsDQpUaGluaA==
