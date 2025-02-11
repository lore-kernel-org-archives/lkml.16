Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B39A3524F;
	Tue, 11 Feb 2025 00:55:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.158.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739235339; cv=fail; b=t4pFCZv7QDv1qKywWndYiPWiBxo8YymUQFxHeBCBzNLCIy+uBmrSJmYNTYE2lw385tjKAibhBvdsPndkEPu2TOMEe5v0ooBajV4RoLHg+XSnWB9JGfz6BOo9IxFP/cFzwy3OHVqh0CP+gur/eiT7HVIsXvxuvZh8SBYNb0RWFEQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739235339; c=relaxed/simple;
	bh=Y4OwDLhmIjuewzbW49RIa0yb0/2dfpda17YVoSsUbPc=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=mxv9nKj1k/yFv3Djq76Xyw7ciRkH1gXN3dOYYYr3vFDZ7BWfDIHB9w0AEufuZTrRHXTL1d8Rwd99W6Qpcly0ZQ8z337x9YfqFi0BqbocBjaVrqzyOa6F2jdKBgXTlxdQHe269NhqguMsNgiN9ega5HYFOYDuyii7tM94/b3orPk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=AmMSIsvR; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=DaLgGWL9; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=WvBHMRFL reason="signature verification failed"; arc=fail smtp.client-ip=148.163.158.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="AmMSIsvR";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="DaLgGWL9";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="WvBHMRFL"
Received: from pps.filterd (m0297265.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51ANkFgZ015706;
	Mon, 10 Feb 2025 16:55:29 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=Y4OwDLhmIjuewzbW49RIa0yb0/2dfpda17YVoSsUbPc=; b=
	AmMSIsvR4dpwC/fn73o4H+NhrVNcoehpD3DzUntcOAJivlQd6DPS9OxUzaM8qhDc
	CMEmsxBjSKCJTPyY1QB/HrMioMrDBFh6cnSP5LS6N6tBIvKeMjMpyhKOzzlTtwaG
	nkxdVpmZgPE6oi1jyrse9RPACUs9CQXPgRXj94fkLAbGIvWagZj72U1sHpTrTaR1
	DsHyBmcRS/e0xqUuzvuA4o99BzDdZhKuBS3Hwg96ue5s39FT15bfpjZjXZe6vBpg
	jEXrPN9AshH+rtRi7trPGHDYg5n/6F+zNn13ZaSvQXRDq+87h+m16OdkmYMtlaXX
	CNE128S/Z6XAPhGetxbDQQ==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 44p72yturu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Feb 2025 16:55:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1739235318; bh=Y4OwDLhmIjuewzbW49RIa0yb0/2dfpda17YVoSsUbPc=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=DaLgGWL9+2puiuafNSZ1lchxeG2+sPWZnPyUUtbToq0RSDZq3C8bg3CUqqOK679a7
	 YkP43zbXCGIDCViEJWtzFFWxZWZ2vWdxpvMNHdE97a3DF4QbP9FjbL3VMkK9Psb9Bg
	 ayUsYH4aO7vwJJ0V50TKES2c4+6NcnK0WY40h1HbRZeSzVYXFmPFb32JH2p17KmrOc
	 2+jK1lJJZsayeLkgJf7XdDLlurfKRHnPXd6XE1MaxAro72f6dfKSj0ESHjp54SYTly
	 odDMDo15VFVgFrHQ0wK/D98OudEI/z8H3JagyiArsBFvF1BDgFFQXxYpaefNj88DZK
	 E/HlQnf3P+5OQ==
Received: from mailhost.synopsys.com (badc-mailhost3.synopsys.com [10.192.0.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 2C71F400A2;
	Tue, 11 Feb 2025 00:55:18 +0000 (UTC)
Received: from o365relay-in.synopsys.com (sv2-o365relay3.synopsys.com [10.202.1.139])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id F31FEA0091;
	Tue, 11 Feb 2025 00:55:17 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=WvBHMRFL;
	dkim-atps=neutral
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2173.outbound.protection.outlook.com [104.47.57.173])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 9794B40355;
	Tue, 11 Feb 2025 00:55:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j90VrxFh94zN2QlvZal2c32IpU2CJAXZO/eX5MlNpqYF77juNXE8dYsR38fS0nseGzyI2YetZyqrlOsEY4oeb0JPBidzAJR4/Aggo9eqvxKFOITwAIlwka6AiKZG/hSbjup+aILUil7MYEuGSTuZDV9Stp3VMY+FPjwsJ4wIVzX1jzrjX7MvTIrGL+q6QHFRU363fpvkFpqHdUlLYibGIHzW9D5TbWYh5MrscoDjOB0JoIYy6V+JNkE/tWFzYwZFKoL0di/EcootL5B9+ExfJxXy6jzG5LPKNiwp/XVksAaGfLCIoiYGXBZfAs3lHGXsg3UG1POWTwCYLeL7J/pDqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y4OwDLhmIjuewzbW49RIa0yb0/2dfpda17YVoSsUbPc=;
 b=fcvGCw3GqN9cEtxJN2yJt+QsvtQeYCrhahCzaluR74YbFxZAJ5SK2P5aY8Mv9/C7aE81q7lfLjEKBtjeOePtg0p14ltt2VcxYA+1SnfyFSJAAoUwtwm9FiUAFVKFTDdiDI+qxmS/2rm0P4agbbhxAIVUxZ6OpHRlUVix8x/TJAIOfZSrbnUPeXkCs/U7jAv5zyl85DqZzP2JVZa9iIm7E29zTjwvN175lH/3EJy3jEYHcJax7KUOzEIX/2bKPHtxhBj1k9yr+QTsYVd3MiHJTfy9JNNaVInQkBL+UQ3e36OM1PIsUi8A5EkqL+0CWwjD4YSi6mSab1uKd9+RveHsyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y4OwDLhmIjuewzbW49RIa0yb0/2dfpda17YVoSsUbPc=;
 b=WvBHMRFLbcdNJY902+JRPVzeVrx0w02Pp4qP/qVAXzhQ3mW6HlVs/fvJ7d8E62lN/+EioXh24HgDiJEkhBryWR9skbFf5OVo71PrwA+2VaPpV3CAMMVhqXg7gJc+miczzP/D6loyW2NtL8FKl/VkLfpjQM6VLoZ3K1cNIovly2M=
Received: from LV2PR12MB5990.namprd12.prod.outlook.com (2603:10b6:408:170::16)
 by PH7PR12MB5950.namprd12.prod.outlook.com (2603:10b6:510:1d9::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.18; Tue, 11 Feb
 2025 00:55:11 +0000
Received: from LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8]) by LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8%3]) with mapi id 15.20.8422.015; Tue, 11 Feb 2025
 00:55:11 +0000
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
Subject: Re: [PATCH v2] usb: dwc3: gadget: Prevent irq storm when TH
 re-executes
Thread-Topic: [PATCH v2] usb: dwc3: gadget: Prevent irq storm when TH
 re-executes
Thread-Index: AQHbedn1961r6ZprVUadJsXbsNP087NBQjWAgAAFTQCAAAP6AA==
Date: Tue, 11 Feb 2025 00:55:11 +0000
Message-ID: <20250211005508.qeselc6eakgnys74@synopsys.com>
References: <20250208033129.3524423-1-badhri@google.com>
 <20250211002155.62lyfqjlygod7cdp@synopsys.com>
 <CAPTae5LisYMjx63Jz_xmZ9zA5PtaxRA49gh2FA-fONsJ12sXeg@mail.gmail.com>
In-Reply-To:
 <CAPTae5LisYMjx63Jz_xmZ9zA5PtaxRA49gh2FA-fONsJ12sXeg@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR12MB5990:EE_|PH7PR12MB5950:EE_
x-ms-office365-filtering-correlation-id: 3560f036-8196-4689-bafe-08dd4a36bcf5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?ZCs3YktuU1VEdFBVcm5NSHF0OHE1Y2lsUlpMcXV3NWZ4L0JWbnF0aktXWXJ0?=
 =?utf-8?B?WFVXb3VGYnhHTDR2SzR2YVlvOWZLWmlFV0xlRFMxNGlnY3pOd2NXWW9ieWlR?=
 =?utf-8?B?eXlXZ0VBZmp3blZmdmZHNDJ2L09NRjUwMmx1YWwvSEllWHE2eEZGSGQ5WFBh?=
 =?utf-8?B?SjFGSGRjSFZvMk1SaHM1cDRkaXFjQ2lrSStydkozR2VXSzdZbHQ4M0NWL2Jq?=
 =?utf-8?B?MDN1ak5iRURlRGRZczVURmlvWWRMdlJOUklXa3lzdzd3bmppek4zZFViUVRR?=
 =?utf-8?B?SXk5bzlPMnpCUmxjVW5RcGpmN0tEZVpmanpFNlQrcDRkSnVTWHdqL29RSnFI?=
 =?utf-8?B?S0hjYjBkUFkwemtmK0VVbUpKZnRHRTFvQnZLRzVTVStyYjZibDUvME4rVVp6?=
 =?utf-8?B?bTV0WFRKZWFMQi9BaEJFVlhRaWpHWnhaa0xZQWw5d3VySzZrdlo1b2M2ZG9n?=
 =?utf-8?B?K01wNlI4dDZtSGpDNEpLUGNZMExSTGRrcmErVjIrWGY5NmZqOEh2RzlGU3JR?=
 =?utf-8?B?MUh4T2pLeTB2SlRENWxtTzlsZnNJR0x3TnZybXd1L1k1V0VXbnBVYy9hZHhw?=
 =?utf-8?B?SEgxcDd1eEhQV2EwTEZVWWJjMkZrUDVkOHFVM0tRbzU2MERlUnlsNlRRK1Fh?=
 =?utf-8?B?WGd6L21sUFdCL0Exa2NOTUMrOVU4dm84V1I1dHhQNG03Qng5dEVqRHBMcUJI?=
 =?utf-8?B?VkRwTFBGMkpTYng1VlU5VXo5d213bjg2S1lUejFBclJoTU90eEFRYUFCdm4z?=
 =?utf-8?B?MGl2K1N1elA0c3F2ZjJ0bWVSTnpmVUpQbGRXQjJXTjUvMEVXQXFFOFBoaXNs?=
 =?utf-8?B?RXRPTURPMlh3eUZ0bU50alRxNHR2OEJBMjh0b2Z4RXNlTUFOU3l3TTRuaGty?=
 =?utf-8?B?VmdCR0UrLzViU2ZsRHZJcGcxM2J6anROd1JmOHhSOGZib2ZMTTg1UExPeEF0?=
 =?utf-8?B?Nm96R2d6SllxU3JUQVhQTitydlpadVpEdzduUjJEbFVOUis3Mmt1S2UvQlFk?=
 =?utf-8?B?NFN5NXpwV0dUVUV2N3hUWDFZVHhYdk9Bdkc5ZFJOdUdMeGwxV0lPc2J2Y04x?=
 =?utf-8?B?dlNaT3lxMkxDUDVSamNjY1dHZzNOZFBGOGlkZFpSWTEyckhabm1iQms3Q0xI?=
 =?utf-8?B?S3YvMzJKMWhabW01bkllUkxlWTJoaENhWEwweFlpeEx2eGtPNXhvdXQyR0pu?=
 =?utf-8?B?R0Y3Rmo2QkZJNTZqdFNaVDM4N21rNkZ6aGM0TEdKWHE5NXZvYUErQjNrT0xS?=
 =?utf-8?B?Z2E1Z2QyTXFLbzlyd3dHc3lJem1tNTZKbHVRSDhjMHJ1UDBlaHYwN2RHSi9n?=
 =?utf-8?B?cGlTZjR3aGVxdnJSNFBFcCtpTmdLZGM4cmRFWTBsTlRvQVNpMi82c0xrNVFj?=
 =?utf-8?B?SXZxWnlIaHN5ZGVwZE5WWDdhSzJuNmpBVWNFcE9NK1hOSjFhZnZtbGlid0xs?=
 =?utf-8?B?QXB4clUyVTlZYjQybXNqSEpVa3h3R3J6NzBha3ZETW1aUDlSRitMYmsySlpQ?=
 =?utf-8?B?ZW1oSnJrdEUxcDk3YmpZWExvU0xESFpVSCtFajU0QllHODN1dkJ0c0FleGVM?=
 =?utf-8?B?emdjVzlYODlCMGgvbUxKQlVleEZEdThwUEZaelYxOUFEam4zblRvdWRDdjhR?=
 =?utf-8?B?MUk0dFJaTTlPaDdqbjZPemw0SlFNaG5lbWVBN0hiTSt1WVRkTUJCS1poMnU0?=
 =?utf-8?B?SHNOUS9UV3NiWkdxdjVkcThVN1VOVTRySkZ3UEo0bHEydEY3aGpLRUQ0bEJN?=
 =?utf-8?B?L3c1Tm5TbU5xWFp3Y3dzMWN6R3Y1UHpOd0dxVnpWMUhuVGVESFhmYkFnSHhv?=
 =?utf-8?B?U042b1EvdURMVWp4MEgxWXJQTWxzeHM1WUtDY0djV2NVNzYrdmNvM2JVb1Z3?=
 =?utf-8?Q?LydrdU+JqFSSD?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?R1dsVzBrMXJjL2FwVVlTTzlWUGhoVjBKVURMcURod3dMeWNXY1NvZVY0dGpr?=
 =?utf-8?B?VUVXQ002YlFVL0VrYUZLbllIaUR2S2JCcVRzTkVqRnlNMlh4OXJUcHJFMnVw?=
 =?utf-8?B?azZVNkl3djBtUEVvZ0t1OGtVYU11RlRTN0JWMy9OZXdKdDB1TWE5eEo1RlZs?=
 =?utf-8?B?cTBhTlFpM0xoSElZa2c3TWlQaTVHeXNvcjJaM0htbnErYXpMWTJxVlQvdEc4?=
 =?utf-8?B?akRnWUFKMkZxdlB5SW9rVStaUnNRaGcwc0pDaER3eEk5cUFPVlFzSm1LNkhX?=
 =?utf-8?B?ZlQ2V2JoRllGRWRPK0VrdWRyT3dtY3Q4S0hGc2M0NVhpNkVwL1JkWTBFYzNV?=
 =?utf-8?B?WUk5dTNUMnk4SGxOTDNVR2x5WXZ6UGt5Nm9qL0ROS2JGS1VOdjhiTEwzQXNT?=
 =?utf-8?B?R1h3emU0SXl2bmtHYjR0SFdYc0lxQU15c0FaRkNhQTJxeUhKQmVYQ3k0ZFQ3?=
 =?utf-8?B?VXJScnJOZUFBTXB2MjhKYmNGS1lycHBTVEwxL2ZrQXZQSVdvMDBWZkFrY0kr?=
 =?utf-8?B?SlpBdGVwbGhhRVMyWkhYKy84dmJGK3RTOGRTdTVNcXV1UEdSNGs0RmJzRWRB?=
 =?utf-8?B?Vmt6emlVdWhDYmZLWjVIWUJabDhINlNJUlYzeTVWVFJzREtwYnZsYWtyaTNx?=
 =?utf-8?B?R0ZzSjE0Q1pTU2ljbXFSckZKZ3dDRkw2OTI2aEs3MWtGWDRFZ3lFdlJncEh2?=
 =?utf-8?B?VTB3TTVlREFsVEM4L1FVN3NueFJGRzQwcERBN1dRY1cwVHRqOUlJSHd6Vjgw?=
 =?utf-8?B?YWhHdGM1VkwwVno3bGpwMFlUKzFUenI2YlFUZWQ1L2hlRURLMjZPaXZBZjcz?=
 =?utf-8?B?dDc4VVhrbGwrdFlmMkpGR2VxWHF0cDBEQWFUUWs4NjZKZHRETE4yaW41RWd2?=
 =?utf-8?B?bkc2Z05rN0l0eHRWVDdIVGVMWWdFVmIrMFhRUDhWaHRTbDNpaXR0VEJQaDFr?=
 =?utf-8?B?czNSNlAveExlT2p1N3dXNzdEazdkTmxPOTlsR1Uzc1BVVnhhUUp2bld6bS9x?=
 =?utf-8?B?di82eUxiR0JnUnNjRU5WaUs2ekxjN0hyWEYrVW1mb3RrOU5hTG1WaU5hZHVR?=
 =?utf-8?B?RVQxQkg2QitzQTMvRWZjaEQ2ZmZEZVBlR0luS3JsMmpra2pmVXU4R09hT002?=
 =?utf-8?B?WHplRU4rZkRVK1plQ2NsM096d0F3c2NEczRWaEFTNmNhOGlhd2pyY091Vlo0?=
 =?utf-8?B?czRsL0hHQm1zVlV4b2k2L21jaVRjZ056aW1oSnN1ZmtCbEJNZTVuWE0xcHFx?=
 =?utf-8?B?YWVaMGlGek5kMlhtL3dsVExvYmlTZFl4NmpzZ2VBenUyOW11UmlVRXZtblYy?=
 =?utf-8?B?WllHeVB2dUZ2YmVKTm5nR1YrTW9kU0VjcytGMGpIS0ZISDY0cFB6MEJwZlNl?=
 =?utf-8?B?dHdPUzVhN3RPQVNOY1hBbmVnR2pmUUdiMXlZTVJTRitvb25ZQWhvL01LRGMy?=
 =?utf-8?B?azV6OWpuQ2w3M3RGTkwwS1BXT1F5Snd4eFhQanQ1M29kYUJ0RENoaGp1Ylpn?=
 =?utf-8?B?ODBsRDBMSWdzczBZL0hzdEpCNEhiZXNHdDhvZ1lOQ0VYRHdUZ3ZrS3k2OWdo?=
 =?utf-8?B?RXpzbkFrRjUvQUJMNVBkdUpWRVdqM25pOXhPNytQWDYrTWpoMU9LNXBTSWpY?=
 =?utf-8?B?SktmSDRWaTN2UkxzYnMwV2p6N0lBdzJVVjljbnFONFFXbUptc2JGajNXcXo4?=
 =?utf-8?B?bEVueHFKdlBZYTdiWE1wSjArK2xsbk8rb2hMbnRRWG5PaUQxNDl2S3kyYUdt?=
 =?utf-8?B?ZVZWTGp5VU13TGdITW4raGxTRFpVVmVRZE9DVjBkM2VLbDdvcWJvUTN4WWo2?=
 =?utf-8?B?S3pWZ2ZsWFl1eHpNaGdObXBzTDk3ZkRwT21yakJLUlh1dDFTLzRQa3hrRkYv?=
 =?utf-8?B?T3NiTUVHZUJrWHBTYVJLWkpUVGJFKzk2VHhnMEV6MGp5QURONTdXaU9FMlJM?=
 =?utf-8?B?WlhJRmY2NHZOcFg5RWpIU3p2R2dZZU5paEczKzJBbGM3RjRyUmZ5akhOTXBO?=
 =?utf-8?B?OC9OM1I2TStpRjdUVE1TcFhhbWFOeTNLcVptUnFmOG1Qd0FjbFBGQ0duVndH?=
 =?utf-8?B?eFdpL2plS2RlREZOSHRreHlHL21EWmtaZW1aVElJS2pIczByZGUxbmZ1UWZs?=
 =?utf-8?Q?/RtThTVfVjCx+9vjq9l5LviGx?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <CD10A93882C61C4CB17EDFA3E693D83A@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	IcUfKiyNl2CHQI8w9CZjzdEth+pfORIv9UNXfCXBwFv7cnLLxr58oJKp6OPNbKIjtkTDjfj4fSvfN8fSJrKRn9S1bLIDLM/dZy72ju9JrJQ4/CBd0LiEsCygJ3ngf7fEgzi2aVgU+rF9moue+qh1sj8tDoJKitG0ikLiQeOQp0wWJfHQp8irjg1i7zExA2Yy5lRzaFma3XQjqrF3oqBcNic0Uen0s7Nrzxnv7qxkgV0Hmr5Z4dQyPxwBXORlYoFMJ860Vlsb8BlBedj4nQxTzxVtDiHnu5QfRmOgm+nBojPESCAT7C6PQ4fXbMMlB6MYOTCKMyEXsblDaTw8qNiH42/2mX8JhkgpTVmdHOAAq+AYwIy5rCaHMMc8sw11dWU/1HF8JjvhQF1r4WJSiUjGQeIjm5+SRnBijl3e0KbPvxpbmNA8yl5HzHiF6IFfzQlXh8FhOAdlB8pOuYoCEi1wucp5c47bbPSveaEIXka2/BAVSZLP0fQsMEqS4XM6fKaPr+NH034by9u5N05svmsWuzVob9aSM91Y/FezbUAtuGVwuy5Fe1UF0uUY5EybwrkeGjNH5kONAdu4Ja+NV86n+HOWL3LecGV+2PgJ4f3Rp5JxZ51i2NE4yOPrePMLXCWPCfVx+iyHDMHsp8rmc3vICg==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3560f036-8196-4689-bafe-08dd4a36bcf5
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Feb 2025 00:55:11.5048
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eteAnInBzMOlVdlIe0ei/I3HUV82gRmbTZAOJffAfs1IGav1Bjfbs47u0s2vCSGxJhfeqzsNuyXvnMu3RUQNAw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5950
X-Proofpoint-GUID: nG-Bo9Zhc_C5-37hBEfWBS9WXqAqSvaX
X-Authority-Analysis: v=2.4 cv=c8dRQQ9l c=1 sm=1 tr=0 ts=67aa9fff cx=c_pps a=8EbXvwLXkpGsT4ql/pYRAw==:117 a=8EbXvwLXkpGsT4ql/pYRAw==:17 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=T2h4t0Lz3GQA:10 a=nEwiWwFL_bsA:10 a=qPHU084jO2kA:10 a=P-IC7800AAAA:8 a=jIQo8A4GAAAA:8 a=VwQbUJbxAAAA:8 a=1XWaLZrsAAAA:8 a=fCspBuEt_zEYoGm6sJ8A:9 a=QEXdDO2ut3YA:10 a=d3PnA9EDa4IxuAV0gXij:22 a=Lf5xNeLK5dgiOs8hzIjU:22
X-Proofpoint-ORIG-GUID: nG-Bo9Zhc_C5-37hBEfWBS9WXqAqSvaX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-10_12,2025-02-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 bulkscore=0 priorityscore=1501 clxscore=1015 impostorscore=0 adultscore=0
 lowpriorityscore=0 mlxlogscore=999 mlxscore=0 spamscore=0 phishscore=0
 suspectscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502100180

T24gTW9uLCBGZWIgMTAsIDIwMjUsIEJhZGhyaSBKYWdhbiBTcmlkaGFyYW4gd3JvdGU6DQo+IC4N
Cj4gDQo+IE9uIE1vbiwgRmViIDEwLCAyMDI1IGF0IDQ6MjLigK9QTSBUaGluaCBOZ3V5ZW4gPFRo
aW5oLk5ndXllbkBzeW5vcHN5cy5jb20+IHdyb3RlOg0KPiA+DQo+ID4gT24gU2F0LCBGZWIgMDgs
IDIwMjUsIEJhZGhyaSBKYWdhbiBTcmlkaGFyYW4gd3JvdGU6DQo+ID4gPiBXaGlsZSBjb21taXQg
ZDMyNWExZGU0OWQ2ICgidXNiOiBkd2MzOiBnYWRnZXQ6IFByZXZlbnQgbG9zaW5nIGV2ZW50cyBp
bg0KPiA+ID4gZXZlbnQgY2FjaGUiKSBtYWtlcyBzdXJlIHRoYXQgdG9wIGhhbGYoVEgpIGRvZXMg
bm90IGVuZCB1cCBvdmVyd3JpdGluZyB0aGUNCj4gPiA+IGNhY2hlZCBldmVudHMgYmVmb3JlIHBy
b2Nlc3NpbmcgdGhlbSB3aGVuIHRoZSBUSCBnZXRzIGludm9rZWQgbW9yZSB0aGFuIG9uZQ0KPiA+
ID4gdGltZSwgcmV0dXJuaW5nIElSUV9IQU5ETEVEIHJlc3VsdHMgaW4gb2NjYXNpb25hbCBpcnEg
c3Rvcm0gd2hlcmUgdGhlIFRIDQo+ID4gPiBob2dzIHRoZSBDUFUuIFRoZSBpcnEgc3Rvcm0gY2Fu
IGJlIHByZXZlbnRlZCBieSBjbGVhcmluZyB0aGUgZmxhZyBiZWZvcmUNCj4gPiA+IGV2ZW50IGhh
bmRsZXIgYnVzeSBpcyBjbGVhcmVkLiBEZWZhdWx0IGVuYWJsZSBpbnRlcnJ1cHQgbW9kZXJhdGlv
biBpbiBhbGwNCj4gPiA+IHZlcnNpb25zIHdoaWNoIHN1cHBvcnQgdGhlbS4NCj4gPiA+DQo+ID4g
PiBmdHJhY2UgZXZlbnQgc3R1YiBkdXJpbmcgZHdjMyBpcnEgc3Rvcm06DQo+ID4gPiAgICAgaXJx
LzUwNF9kd2MzLTExMTEgICggMTExMSkgWzAwMF0gLi4uLiA3MC4wMDA4NjY6IGlycV9oYW5kbGVy
X2V4aXQ6IGlycT0xNCByZXQ9aGFuZGxlZA0KPiA+ID4gICAgIGlycS81MDRfZHdjMy0xMTExICAo
IDExMTEpIFswMDBdIC4uLi4gNzAuMDAwODcyOiBpcnFfaGFuZGxlcl9lbnRyeTogaXJxPTUwNCBu
YW1lPWR3YzMNCj4gPiA+ICAgICBpcnEvNTA0X2R3YzMtMTExMSAgKCAxMTExKSBbMDAwXSAuLi4u
IDcwLjAwMDg3NDogaXJxX2hhbmRsZXJfZXhpdDogaXJxPTUwNCByZXQ9aGFuZGxlZA0KPiA+ID4g
ICAgIGlycS81MDRfZHdjMy0xMTExICAoIDExMTEpIFswMDBdIC4uLi4gNzAuMDAwODgxOiBpcnFf
aGFuZGxlcl9lbnRyeTogaXJxPTUwNCBuYW1lPWR3YzMNCj4gPiA+ICAgICBpcnEvNTA0X2R3YzMt
MTExMSAgKCAxMTExKSBbMDAwXSAuLi4uIDcwLjAwMDg4MzogaXJxX2hhbmRsZXJfZXhpdDogaXJx
PTUwNCByZXQ9aGFuZGxlZA0KPiA+ID4gICAgIGlycS81MDRfZHdjMy0xMTExICAoIDExMTEpIFsw
MDBdIC4uLi4gNzAuMDAwODg5OiBpcnFfaGFuZGxlcl9lbnRyeTogaXJxPTUwNCBuYW1lPWR3YzMN
Cj4gPiA+ICAgICBpcnEvNTA0X2R3YzMtMTExMSAgKCAxMTExKSBbMDAwXSAuLi4uIDcwLjAwMDg5
MjogaXJxX2hhbmRsZXJfZXhpdDogaXJxPTUwNCByZXQ9aGFuZGxlZA0KPiA+ID4gICAgIGlycS81
MDRfZHdjMy0xMTExICAoIDExMTEpIFswMDBdIC4uLi4gNzAuMDAwODk4OiBpcnFfaGFuZGxlcl9l
bnRyeTogaXJxPTUwNCBuYW1lPWR3YzMNCj4gPiA+ICAgICBpcnEvNTA0X2R3YzMtMTExMSAgKCAx
MTExKSBbMDAwXSAuLi4uIDcwLjAwMDkwMTogaXJxX2hhbmRsZXJfZXhpdDogaXJxPTUwNCByZXQ9
aGFuZGxlZA0KPiA+ID4gICAgIGlycS81MDRfZHdjMy0xMTExICAoIDExMTEpIFswMDBdIC4uLi4g
NzAuMDAwOTA3OiBpcnFfaGFuZGxlcl9lbnRyeTogaXJxPTUwNCBuYW1lPWR3YzMNCj4gPiA+ICAg
ICBpcnEvNTA0X2R3YzMtMTExMSAgKCAxMTExKSBbMDAwXSAuLi4uIDcwLjAwMDkwOTogaXJxX2hh
bmRsZXJfZXhpdDogaXJxPTUwNCByZXQ9aGFuZGxlZA0KPiA+ID4gICAgIGlycS81MDRfZHdjMy0x
MTExICAoIDExMTEpIFswMDBdIC4uLi4gNzAuMDAwOTE1OiBpcnFfaGFuZGxlcl9lbnRyeTogaXJx
PTUwNCBuYW1lPWR3YzMNCj4gPiA+ICAgICBpcnEvNTA0X2R3YzMtMTExMSAgKCAxMTExKSBbMDAw
XSAuLi4uIDcwLjAwMDkxODogaXJxX2hhbmRsZXJfZXhpdDogaXJxPTUwNCByZXQ9aGFuZGxlZA0K
PiA+ID4gICAgIGlycS81MDRfZHdjMy0xMTExICAoIDExMTEpIFswMDBdIC4uLi4gNzAuMDAwOTI0
OiBpcnFfaGFuZGxlcl9lbnRyeTogaXJxPTUwNCBuYW1lPWR3YzMNCj4gPiA+ICAgICBpcnEvNTA0
X2R3YzMtMTExMSAgKCAxMTExKSBbMDAwXSAuLi4uIDcwLjAwMDkyNzogaXJxX2hhbmRsZXJfZXhp
dDogaXJxPTUwNCByZXQ9aGFuZGxlZA0KPiA+ID4gICAgIGlycS81MDRfZHdjMy0xMTExICAoIDEx
MTEpIFswMDBdIC4uLi4gNzAuMDAwOTMzOiBpcnFfaGFuZGxlcl9lbnRyeTogaXJxPTUwNCBuYW1l
PWR3YzMNCj4gPiA+ICAgICBpcnEvNTA0X2R3YzMtMTExMSAgKCAxMTExKSBbMDAwXSAuLi4uIDcw
LjAwMDkzNTogaXJxX2hhbmRsZXJfZXhpdDogaXJxPTUwNCByZXQ9aGFuZGxlZA0KPiA+ID4gICAg
IC4uLi4NCj4gPiA+DQo+ID4gPiBDYzogc3RhYmxlQGtlcm5lbC5vcmcNCj4gPiA+IFN1Z2dlc3Rl
ZC1ieTogVGhpbmggTmd1eWVuIDxUaGluaC5OZ3V5ZW5Ac3lub3BzeXMuY29tPg0KPiA+ID4gRml4
ZXM6IGQzMjVhMWRlNDlkNiAoInVzYjogZHdjMzogZ2FkZ2V0OiBQcmV2ZW50IGxvc2luZyBldmVu
dHMgaW4gZXZlbnQgY2FjaGUiKQ0KPiA+ID4gU2lnbmVkLW9mZi1ieTogQmFkaHJpIEphZ2FuIFNy
aWRoYXJhbiA8YmFkaHJpQGdvb2dsZS5jb20+DQo+ID4gPiAtLS0NCj4gPiA+ICBkcml2ZXJzL3Vz
Yi9kd2MzL2NvcmUuYyAgIHwgIDIgKy0NCj4gPiA+ICBkcml2ZXJzL3VzYi9kd2MzL2dhZGdldC5j
IHwgMTAgKysrKysrKy0tLQ0KPiA+ID4gIDIgZmlsZXMgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCsp
LCA0IGRlbGV0aW9ucygtKQ0KPiA+ID4NCj4gPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3VzYi9k
d2MzL2NvcmUuYyBiL2RyaXZlcnMvdXNiL2R3YzMvY29yZS5jDQo+ID4gPiBpbmRleCBkZmExYjVm
ZTQ4ZGMuLjZkZjk3MWVmNzI4NSAxMDA2NDQNCj4gPiA+IC0tLSBhL2RyaXZlcnMvdXNiL2R3YzMv
Y29yZS5jDQo+ID4gPiArKysgYi9kcml2ZXJzL3VzYi9kd2MzL2NvcmUuYw0KPiA+ID4gQEAgLTE4
MzUsNyArMTgzNSw3IEBAIHN0YXRpYyB2b2lkIGR3YzNfZ2V0X3Byb3BlcnRpZXMoc3RydWN0IGR3
YzMgKmR3YykNCj4gPiA+ICAgICAgIGR3Yy0+dHhfdGhyX251bV9wa3RfcHJkID0gdHhfdGhyX251
bV9wa3RfcHJkOw0KPiA+ID4gICAgICAgZHdjLT50eF9tYXhfYnVyc3RfcHJkID0gdHhfbWF4X2J1
cnN0X3ByZDsNCj4gPiA+DQo+ID4gPiAtICAgICBkd2MtPmltb2RfaW50ZXJ2YWwgPSAwOw0KPiA+
ID4gKyAgICAgZHdjLT5pbW9kX2ludGVydmFsID0gMTsNCj4gPg0KPiA+IFVzZSBkd2MzX2hhc19p
bW9kKCkgdG8gZGV0ZXJtaW5lIHdoZXRoZXIgdG8gc2V0IHRoaXMuIE90aGVyd2lzZSB3ZSBnZXQN
Cj4gPiBhIHdhcm5pbmcgb24gc2V0dXBzIHRoYXQgZG9uJ3Qgc3VwcG9ydCBpbW9kLg0KPiANCj4g
SGkgVGhpbmgsDQo+IA0KPiBkd2MzX2NoZWNrX3BhcmFtcygpIHdoaWNoIGdldHMgaW52b2tlZCBh
ZnRlciBkd2MzX2dldF9wcm9wZXJ0aWVzKCkgYXQNCj4gaHR0cHM6Ly91cmxkZWZlbnNlLmNvbS92
My9fX2h0dHBzOi8vZWxpeGlyLmJvb3RsaW4uY29tL2xpbnV4L3Y2LjE0LXJjMS9zb3VyY2UvZHJp
dmVycy91c2IvZHdjMy9jb3JlLmMqTDE4NTFfXztJdyEhQTRGMlI5R19wZyFaYXI4M1dVZTRzTS1F
RjRjMndSMi12V0JKSGdZT0NXRWMxaWpoT3NXUUhpWHR6Q0YwZF90Mmdja1MwWUpVdjRsQVpnR1ps
MkMtb1NwMVFNSXgyOCQgDQo+IHNlZW1zIHRvIGFscmVhZHkgY2FsbCBkd2MzX2hhc19pbW9kKCku
IERvIHlvdSBwcmVmZXIgbWUgdG8gYWRkIGFuDQo+IGV4cGxpY2l0IGNoZWNrIGhlcmUgYXMgd2Vs
bCA/DQo+IA0KDQpZZXMuIEkgZG9uJ3Qgd2FudCB0byBzZWUgZGV2X3dhcm4gcHJpbnQgd2hlbiB0
aGVyZSBzaG91bGRuJ3QgYmUgYW55IGZvcg0Kc2V0dXAgdGhhdCBkb24ndCBzdXBwb3J0IGltb2Qu
DQoNCkJSLA0KVGhpbmg=
