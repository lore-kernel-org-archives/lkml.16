Received: from mx0a-00230701.pphosted.com (mx0a-00230701.pphosted.com [148.163.156.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C80B125A62E;
	Tue,  4 Feb 2025 00:23:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.156.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738628583; cv=fail; b=Gndnr6bAbk0HCtHcvrTFpBL6/yXyp7iSUB6ceFkGSjUpiVV/GGwwBLuFZ01D0/G6AuqeuCUk6n8CyKNUj2bo0do8MyU1+yggIM/t6CmIKuNNAf2LePq330KD5jgiqX2EvUbvR9AxAjeCeJiVFK9tja0m9FsGo+UmgcEDcC9yrKg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738628583; c=relaxed/simple;
	bh=F7xUOgorWEmVVEgAr+EsDIUvhXsVCxaSGneeR8vCCSk=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=KOWUXswZBTnaYlNiuRktIIIgajnfXjE9cHWtRW/nYDgw5aInssu6JPHa83MOmjtVfB2YaS5MUcCspfR/U9VC7gXLRbxGSpIUe/XgIBb87OL/oMO25vR8L4uw64mRGtGE6rV4jTNZG1MePVNdtL/A3ydsqKNw7h3WSfHWJ4kYkIc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=g+sNn9c6; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=ffm0LqAM; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=KhVwRjb2 reason="signature verification failed"; arc=fail smtp.client-ip=148.163.156.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="g+sNn9c6";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="ffm0LqAM";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="KhVwRjb2"
Received: from pps.filterd (m0098571.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 513N5W5a029815;
	Mon, 3 Feb 2025 16:22:50 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=F7xUOgorWEmVVEgAr+EsDIUvhXsVCxaSGneeR8vCCSk=; b=
	g+sNn9c6f0Dqp23uE1TKuynsPkju2ZnphHDTxCVhZ+ayav/78WuJ2cp3KrbJimQD
	+yNcuwmBW/ThlkDmiTKjkbjTeARa6rBtbQuh4vWIxRxi1Slo8Lz4v/LwzEkeOHab
	n/IpbmYHheEIy6pc/b8nCtuXkP0RN/0eagTF1Sy2ej/1SoyFrLyJXe3672TyxOkc
	08lOvBFgvJn4Aoja4LHia2HlyaVzUYqJD3bV8F9V2OXvgqvuFAUcL3wHJTeqbyEJ
	JWLw1SAKUT/Y3FLk4M7cQavfHoUihdVspV8wT+BNhoY7FjvBGlmCqGXmRoOgrras
	EF84jVsTAVa7xWQvGnddMQ==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 44k1aj9t52-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 03 Feb 2025 16:22:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1738628569; bh=F7xUOgorWEmVVEgAr+EsDIUvhXsVCxaSGneeR8vCCSk=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=ffm0LqAMkrT/TxtV/a08pa+PwOaCzqAlCeq03QJ2mC2drPDz3FzHJzSV/pwNkT6ot
	 DCULoDDBeZ0zEavS4xXpav6TJ8U5nDptUrJmCHh1IUVjIwQQY53o2SL9WE9pQuoOKI
	 TAtnbuPh0k9YlQS/+f0mtng441qQxhFvfKgBief9mWymXShuiOz9OOtGF898aut1uD
	 b36CpEhp7RdOwStgQSzoYU0XRRrcl2++GK/AOeusvxUPt7PYSEwxZBnlNCJtNcjmLR
	 ICH3y54t7uYpF+LRTq79jbi32Wq7lH/j8JZ5CYRDX0LBEchzt6dgK11w6Emd7Yfp5V
	 aULMP8M4gaVgA==
Received: from mailhost.synopsys.com (sv2-mailhost2.synopsys.com [10.205.2.134])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 21525400A2;
	Tue,  4 Feb 2025 00:22:49 +0000 (UTC)
Received: from o365relay-in.synopsys.com (us03-o365relay3.synopsys.com [10.4.161.139])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id 7C46FA007B;
	Tue,  4 Feb 2025 00:22:48 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=KhVwRjb2;
	dkim-atps=neutral
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (mail-bn8nam04lp2041.outbound.protection.outlook.com [104.47.74.41])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 6E66740693;
	Tue,  4 Feb 2025 00:22:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GkvhBy28dQhpAIAC3sYLF7yyUCznn29QDkHXW8j7iw5qk152OEIlmDDYUTcs44o7WcHHhEUvvRdDE3PztaBMNA5pKKSSPh3jnplblv+oLLJcMbFyB+MZJrm1Dy0p+CIpm1gdrUphsO/XhCbkF0cKFjvWSitemRlHrh8op0ZqAWy5tcm20sFOBIgG3ZAzXYqlFkaTAY+pzeMslXb91M7hpLjWTHQ7u0TZqOBxIHov8fbo/rXa2aBtHfuJFLruALQXcnj/Cn3pZg1lAjG3h6EyLbM/UE1pewv2Ym73GGi6sso2fdRwlDmGDmbVrsx6QvbtzbdMeoQ/hWoNxhmOZRiQJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F7xUOgorWEmVVEgAr+EsDIUvhXsVCxaSGneeR8vCCSk=;
 b=eFolqDz9NW/X4YG4+gFjwnIXw/JUKzGJQaOMhGdlTf3jfjHk2ueXqJ/Fg+1/zeGb91ZV8mWeNXinOLlGeaMDak151SfUjXSQ7UTIuud3Zm5FJ7J9HNqbISyy2A+yh4A4TW2GSaWI/1eBn4IU4HH6n9oS1SKJ8SKigdbk0l5CabOv5nQRPoJT46hFkDEONYQRLPbYB91pD3Al8bLdiclNA2DNa4n9rl0V92X1oAcZdlTgpO84sgdl+6ymxAYTNrV11HgK5yWMzFO+o9ER7J38oXjWrC/Bov1oWczRHsD+CCwlxfp5RjxTxfYVFwVi8IEYX7Hg7kSgTp4w4sygN2UUlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F7xUOgorWEmVVEgAr+EsDIUvhXsVCxaSGneeR8vCCSk=;
 b=KhVwRjb2bhCPoBOcPiXyfC8jDeJm3Vxu/eCvxs1U3L1exzQ8vzrUWLSmuFz8QxqEVUW2VthKdpVX5/UTqBWItlAhnEJqxk2YOeeoOVbvDLC4YBDDGYXgTQTBY75TygkPh4ZMTDpqEnMcf5ApZlOF1Q+59WnY6e/6qqWZ/Lc5MoA=
Received: from LV2PR12MB5990.namprd12.prod.outlook.com (2603:10b6:408:170::16)
 by SA1PR12MB7174.namprd12.prod.outlook.com (2603:10b6:806:2b1::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.24; Tue, 4 Feb
 2025 00:22:44 +0000
Received: from LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8]) by LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8%7]) with mapi id 15.20.8398.021; Tue, 4 Feb 2025
 00:22:43 +0000
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
Thread-Index:
 AQHbbjXlOsxglH89uEOeQnhFYdXNErMrgJ8AgAHzI4CAASAggIACKJSAgADiOgCAAdKtAIAC6AEA
Date: Tue, 4 Feb 2025 00:22:43 +0000
Message-ID: <20250204002238.prkgpq3w6c6ck6a4@synopsys.com>
References: <20250124075911.811594-1-badhri@google.com>
 <20250128024416.7i3i2vmw2ioy5huf@synopsys.com>
 <CAPTae5L6Worr3WsuuV-SUNJh6SOVf+RnLWt2d1LNLDYvY6uRuA@mail.gmail.com>
 <20250130014159.bv7gvtskyg73lxmc@synopsys.com>
 <CAPTae5JYuogc-mHUi-VdfLAJ4E1z6myGofCvqVCfYxt--VetKA@mail.gmail.com>
 <20250201000926.veukjr6wmhrgl6me@synopsys.com>
 <CAPTae5Lw8pB=SuGgkfTyk5BNPWwgCVvYssdLwT7vFKgMepsZig@mail.gmail.com>
In-Reply-To:
 <CAPTae5Lw8pB=SuGgkfTyk5BNPWwgCVvYssdLwT7vFKgMepsZig@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR12MB5990:EE_|SA1PR12MB7174:EE_
x-ms-office365-filtering-correlation-id: 2598fdd2-ad69-4f10-e59b-08dd44b20b2d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|7053199007|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?YitKM24yOXE3SUdzVEh2a2tkWXBSRUpzRHptSDIxdThDcnVQTVNBOTRVQlVn?=
 =?utf-8?B?WEZwdGlWVTRSajlrTUFkRTdwN3ZZUVFRS25VUmd2bXRlRmxsUy9JS1Exeldo?=
 =?utf-8?B?ZlNOazlPTmtJTVpsUjBNVFVnU0xVTTJLWkdzcjZzZUxjVWN0UGlWbEFBSkFu?=
 =?utf-8?B?ZjNXck0zNkF1em1TdmFyZkxzdFpVQmtQZTUxY1d4d2ZBRDEvUkZ6d2ZmVE05?=
 =?utf-8?B?RFQwaUtqNlpoS0tXTW9qZU5jYXFKMVB2Wm9LSnpBcjVVWUFzRWZhUCtRcFlp?=
 =?utf-8?B?ZnNhbERiNFgyREJ4M2wvV0RNNlVJZDlDd3F6bUljOTZsN3g5Y2s2T2FYNlZO?=
 =?utf-8?B?L0hQMk95SXJwQjBnZnEzbUs2L0YyN1d2ZFNNd01tYlpzUHEyTjVVMVIyMXFB?=
 =?utf-8?B?QkYyclBEdTA4RUhSWnVPUlZUOUxRTzZGVTZBUUszNkIranNndTVPNkJ2T3hR?=
 =?utf-8?B?clVyYmZrRVN1K1RDZUpTejBWWFNhYm5KM0owTFZqSmpTSGZVcjJNdFVqUTJD?=
 =?utf-8?B?WG9GbTZMNTBGcU1UVGdnR2xsRUI2emNKTUtxblpOK2pjeXFOSEJTVm0zVDQr?=
 =?utf-8?B?RTNJMVEzbkt1TjRFTjlzdFZEN2wzb2FCWWN4N1VVTFpaZWx4aktwYUcwMHFv?=
 =?utf-8?B?TWdySmRvdGt0Y3FXYmtheVpYUWVlcmJ6ZDVCbThXdUFwYUhWRnorbnFzVEFV?=
 =?utf-8?B?M0dlVTlJR0ZORnd4Qm54SGhhQkxwVXNBbElnS3U2ei9DcTh4aVRJcXlpSWdj?=
 =?utf-8?B?T2xXaXhhU0psaDV3UUhyR2h5VndtTG1Dc3J1L1Q0aFhZVXZUUDRtVC8xVVU3?=
 =?utf-8?B?QmdFZFU4MW0xcGxaamVEaVU2YnM1azdiUWplbHFGUS92M09SRFg2STB6RTI4?=
 =?utf-8?B?M3JzODJQa2VvRlcwREljQ2VuM1hpVUdVQWNYK1laaDFRd1lQQmpQeVFybWV2?=
 =?utf-8?B?QjZCM2RaV29yL3BGYUsvVnpHL29iYW4zSytTOG96czkxWlc2czFUUTNpRVgz?=
 =?utf-8?B?bkNJeHllY29uSmNjRXUwK3ErR0lPSEEyUXBOU29kZzRxY0dUSGhVZlFmMVhK?=
 =?utf-8?B?b2lCVjFtMWZKQiswQzJPYnZiNWtjV1hiN1ZGY0g5MGVjdUc3T05UdjZIZnR1?=
 =?utf-8?B?aklaSXQrT3BRRXhJcFZtWGhITlZkZ1NSN3E4NlEyeTkxU1pEdHlpWlhlNW5h?=
 =?utf-8?B?RDVGR2lmUzFqYk9nNGJzMWdwLy9CVWgzcmtJV0NiU2JxVG5vQXZxclcxRmVh?=
 =?utf-8?B?YlVscVpWeVlhMVR4VkZXUEsxZDFnMFAzcFl6a25hZ2dNWGVnTnhQd3V6bHdI?=
 =?utf-8?B?bElkdkJXUmNoNUJQYTZhZlFyT1poVUUxUVZwazNXMnJJTkw1YmIwSVc4aXh4?=
 =?utf-8?B?MzBVUDBnNjNHc3lHY3JvV0thaXBHbHdBcDJ5UEZqTnFvQ2RqOWQzTDhiazdL?=
 =?utf-8?B?dXhXSW9XZGdweVFqU3pvSTF1blRYcCtIblEyTDVZL1orQXhSTmxZMzNBVk9u?=
 =?utf-8?B?ZjBIaVFmdTVYTDNGYW0yQ1JHRmQrdE85SkpFL25OVUp6a21WTXVlc2hFYmg1?=
 =?utf-8?B?SkhPTS9kbHgyNHc4dkhpUDRoWFBSdFFZWHlORG9JL2RXYWprM0k5czN4S3J4?=
 =?utf-8?B?cHhlSkVsMG80VlIyUy9JUWVwMUtPTHVyak9vN2lXUkU4bWtCT1B1MFF4dmhH?=
 =?utf-8?B?OTNubXpBcDRPV3lyalhKbENXbXhHVVJDbUcyeTVrQTlTd0E4QitGV0I4N3Zo?=
 =?utf-8?B?SDlzc3hVcFRqOW52bUw3QkVDYkNsRytxeDUvUVM1eGhYaUw1aTBJZXQzUVAr?=
 =?utf-8?B?OTBQQWhxUmFmcFBXQ1JNNEdRSDNQVGw5c0FORVNobFBsdmRhbFBDQy9RQzVw?=
 =?utf-8?B?a0NBMnRnWjhoNHYyNVE2QnFqM0ZFR041RHNBOHRUKy83REkvc1N3Z1VxQWdJ?=
 =?utf-8?Q?nvWd+LKU6UO8w8GYZwumFyPPF5p9I7AO?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7053199007)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?a1lxa3lnZDlQSFhiby94OEVlVFdDbW40OXl3MWFnemw2R2pqSEswd2xZV0pN?=
 =?utf-8?B?S0dTYXBXTE9OTUVoVEpBNkI3K3lZa2Q3dnpWcmFnQzVneURoUUJxU1kzZHZl?=
 =?utf-8?B?M2h1NE9VcjNvOUN5Q0JUenBlMFhCRC9uWm9oUUMyb2JJU1NWUVFYOCsxQkI4?=
 =?utf-8?B?S1hQOGoxYkJRcEVtcmtwK2MzSmFOODIzR1AwclR0Z0dNek0weUNRS0xmOHFH?=
 =?utf-8?B?Uys2ZTdMdGlvaGtRL3MxZmx2Mjh4S1BmQTM2MklXQ1k0NFJ4ZTl2dnRaUEt2?=
 =?utf-8?B?TFYxZUtneWg5dTVIK2M4dUJDS0VuQW9ZSDdTaUE2T0Z0NlJReTZBS0l2RkhB?=
 =?utf-8?B?Wm9PNVNrWmdJQ0pjSUV1c0lhdVF2aUF3aWgra1p4UlFRNnAzME1kbkNVeFZ6?=
 =?utf-8?B?Z2NzUmJnRHRWbUdVQzZRMkt6Uk5kY042K0FkWkF3NE9tYnlWUUViTkZENDdO?=
 =?utf-8?B?L1pPZUxwMm1zUFcxdmlzRzBFMVhiT202UTR4aWZETUdmU0I4Z2pqRGY1UEZY?=
 =?utf-8?B?dDA2S2N6bEdsZnk3TnFPVVNNYUJYRVF4bjBibjBraTNKWGdLdnF6LzhPZ3Vx?=
 =?utf-8?B?eGtTVEdQa2NBcDg5UlhNVVJ6QnMxbXZReTdzU2xjUFVlay9FMXZJS2prVGEz?=
 =?utf-8?B?V1lpVldnWkk2d0JYbXd6cStxQkFIZm9jSDlrWVpVNS84UjVEZWJaZmwzbm9H?=
 =?utf-8?B?VVFJSEhQcGdNbFZKMEZ6WkR1d0ppT0dnVnA1WEo5aGJrRWFjUUcvdkpWaGNu?=
 =?utf-8?B?ZDVSYzZZcDBaWmdBUzVqWWxidElhc2QxS0xlNldrWGMveU1FbGtTd1J4RXhB?=
 =?utf-8?B?N1N5M1hxUnNJbTRhQnhQdUxYc1RNcHdGVVpEaHI3SzgzQ3IvdkVqaEpPakpB?=
 =?utf-8?B?eU9tYWpFUjVPeW9QbmlWbWxaam5xRjJWTmZWVTlKaTdqZ0M0aEMzYTVJbVJ4?=
 =?utf-8?B?Q3ZHUHJDamxLLzZ6M1BDLzNJaUdFSHFsblZHVTA2QkROTFJOWkNGMnFnWm96?=
 =?utf-8?B?YzdlU2p5RVQybzFMQnJ4WE9IdEladVlSeldUY0EzV3VxVDY5T1EzRG5CNFpF?=
 =?utf-8?B?TGh4SkN2RDRTdDYyNTJha0U4dm9FTWoyeThmdCtnTG1WOHdCeS9IN0NCTVZT?=
 =?utf-8?B?WVE5MkhsVWoyaXNoNHpoTDFKV2RMUTdjalU2M04rbG0vSEZjL21tTlpwclZE?=
 =?utf-8?B?azRMV3llVVVDN3I4cElVM09mZCttMG80OTAwTVNUNWZlYlFreGhZUUtoekg4?=
 =?utf-8?B?RlY0cHNtL3YxU0NHVVMxQTJMSy9jelpIM2xpci9HNkt2bWZmSFlOa1RVU01X?=
 =?utf-8?B?eDBuVmZFNVFicDRjcXZiMnhNSmNhOVY0YldlMEVSRk9GMVdnWVVhSlhkNDdp?=
 =?utf-8?B?YnJRdlFXR1NVV1pjQmR4bFByMHF1bTFOQ0taQkZUOXBPbWtmeGZNZHFyVlEv?=
 =?utf-8?B?QjRjUU5MZGtYMFhRb0pSREUyZzBSclNWRG5rOXRlcXppMVV2MUsvUExhZUZy?=
 =?utf-8?B?SklLbXBmbEhiV1lLclRCd0N4L2ZBbTVoREhaOGJIMDB6dDNWYnNjbHlIcHVF?=
 =?utf-8?B?dEtUcy9uSk5DT3doTGcrRG9VMFlZallrb3I0aGdiWm9WS0hJejVkSEZkT3NN?=
 =?utf-8?B?VGZPdkZQanQra1RET0s3TnFiQXJrMm9EaXoyekYxQ2w3aUQ4Y05TNXNQT242?=
 =?utf-8?B?dWFFdDgrSlh0ZTEvVDArRUQ4WE9uTXdaQlBOeXUxaThZeHlCODVvdXd5eG9P?=
 =?utf-8?B?Z1dEanprSDNxUldwekpSTzdYdnRvU1V3Y0VLMmwwZDZuUFc4VGdoTm5BTUVs?=
 =?utf-8?B?NUJnZEJ6aDRKd2kxeXhnKy9PZFZya1o1elovN3NKRDFjcS9VNnNTeXhLdWVO?=
 =?utf-8?B?aFRYaXQ0anFNeTVMTldkM3JmYktDRGk2U20yc05icisxWCs4cEVtUVFzYzFX?=
 =?utf-8?B?Q2RGK1NEMk1MK1JPbUJhZEtJV3kzVHN0cldPMkFBVjE0VENXSHNYNlpDVG92?=
 =?utf-8?B?L053QU1Gc0h0dHdTUkV5R0xTN251TjVlU2ZRQkJ0bDlpbGNLVnNqb0JVNkl0?=
 =?utf-8?B?YitkQktyNVcrdzc5VXJCblJSRzVRR1FFckVGaXR0OFRHUlRpZDZ5UUtVYVow?=
 =?utf-8?Q?d2MyYiuN+hlrIKwzs9hBU8Gj6?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D9A0700D76618742A0C0D9E659CA9F03@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	vcwRIwvbdCrmEtKPT2ElfuWrnw9aAgUHbabNhaQCHpAyjOc45m6JOb1FKrCgpwXlnYW75sy1QOvfvl9kSZOQSwBcmlBDuORUf3DaWzHlk5E9CtBROB/bCj6qIjXCtTx2TZTHmgvmQ9NIimaleKp6VCWRLUgTyts1TZAiZK7uN1IB2T0ihv/hEm2qfi19w1uME+ZmH1pTDJkXWDbvQwaohKt9tc2c5Vmxt8ENwu2PZjLrOUpuMnTu/ClG+U3gFtDU+4DxhUCdmmJUQTMkF3+uFmYaC7rbMRZnHpiagxETDMPoA+nEec/ArKrl0VE0guTHY85PdkkG8rjqokfNJogv9Yr4EdEKhZ1+X8CA/9wqHrH0pDG4iMFfh07iZpGlYvzmpG+vbsuCY/LqlETerqiS2Z7JdZt5ULO7p7x3efaU4Fph0dirhEtinse7HBhwIyT7AHTadvGJjYkbyrydF7m5pMD0WmG1hlzDdlw9C7lOicY4RPMGzt4zfsdZME5ROpweVdApoKn3GLCBaEfCAryNx08l1lSg3atg0X5ei0IO00Kpd0QHlqo4n7zh5MlMDltx7dB2QTu8PDtviAFtX8P4zYKJDmAIqMc6LjXGWsCT0C0SFlnrCQqJjq1vxrom4WYlzCGsCYPjgSZdXWjMgAMUQQ==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2598fdd2-ad69-4f10-e59b-08dd44b20b2d
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Feb 2025 00:22:43.8866
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: s7+iotW3zx3O6vMtRwHUbt7Fbp/mHM5HfrAFHyE1SMkRnq1rASthKea3wHryW7i4nPHFvQQLKf/zl31R5o20dA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7174
X-Proofpoint-ORIG-GUID: 2rHK9SC3WoXYX0rhOyzUc22tWWKJuS2B
X-Authority-Analysis: v=2.4 cv=SeENduRu c=1 sm=1 tr=0 ts=67a15dd9 cx=c_pps a=8EbXvwLXkpGsT4ql/pYRAw==:117 a=8EbXvwLXkpGsT4ql/pYRAw==:17 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=T2h4t0Lz3GQA:10 a=nEwiWwFL_bsA:10 a=qPHU084jO2kA:10 a=VwQbUJbxAAAA:8 a=1XWaLZrsAAAA:8 a=jIQo8A4GAAAA:8 a=c_6b34XhOc3zCDJFdagA:9 a=QEXdDO2ut3YA:10 a=Lf5xNeLK5dgiOs8hzIjU:22
X-Proofpoint-GUID: 2rHK9SC3WoXYX0rhOyzUc22tWWKJuS2B
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-03_10,2025-01-31_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 impostorscore=0 malwarescore=0 suspectscore=0 phishscore=0
 lowpriorityscore=0 clxscore=1015 bulkscore=0 mlxscore=0 adultscore=0
 mlxlogscore=587 spamscore=0 priorityscore=1501 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502040001

T24gU2F0LCBGZWIgMDEsIDIwMjUsIEJhZGhyaSBKYWdhbiBTcmlkaGFyYW4gd3JvdGU6DQo+IE9u
IEZyaSwgSmFuIDMxLCAyMDI1IGF0IDQ6MDnigK9QTSBUaGluaCBOZ3V5ZW4gPFRoaW5oLk5ndXll
bkBzeW5vcHN5cy5jb20+IHdyb3RlOg0KPiA+DQo+ID4gSG1tLi4uIENhbiB5b3UgdHJ5IHRoaXMg
aW5zdGVhZDoNCj4gDQo+IFRoYW5rcywgdGhpcyBzZWVtcyB0byBiZSB3b3JraW5nICENCj4gSSBh
bHNvIHNlbnQgb3V0IHRoZSBmb2xsb3dpbmcgYXMgdGhlcmUgaXNuJ3QgYSB3YXkgdG8gZW5hYmxl
IGludGVycnVwdA0KPiBtb2RlcmF0aW9uIHRocm91Z2ggdGhlIGRldmljZSB0cmVlIG5vZGU6DQo+
IGh0dHBzOi8vdXJsZGVmZW5zZS5jb20vdjMvX19odHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwv
MjAyNTAyMDIwMzUxMDAuMzEyMzUtMS1iYWRocmlAZ29vZ2xlLmNvbS9fXzshIUE0RjJSOUdfcGch
ZTZCQTVoN00xLUhaanJIMi1iTFZGMFlibXpTdHU5QVN2MWxrWnVkcm55WDJSRkRsRFVucmxGQ2dN
ZGJ3WGNiVHJNc1ZVUXZnbnBSbVl4bWNWLXckIA0KPiBodHRwczovL3VybGRlZmVuc2UuY29tL3Yz
L19faHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzIwMjUwMjAyMDM1MTAwLjMxMjM1LTItYmFk
aHJpQGdvb2dsZS5jb20vX187ISFBNEYyUjlHX3BnIWU2QkE1aDdNMS1IWmpySDItYkxWRjBZYm16
U3R1OUFTdjFsa1p1ZHJueVgyUkZEbERVbnJsRkNnTWRid1hjYlRyTXNWVVF2Z25wUm05aGRVdGpF
JCANCj4gDQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy91c2IvZHdjMy9nYWRnZXQuYyBi
L2RyaXZlcnMvdXNiL2R3YzMvZ2FkZ2V0LmMNCj4gPiBpbmRleCAwZmU5MmMwZmI1MjAuLmMxYjVh
Mzc0MmFiNCAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL3VzYi9kd2MzL2dhZGdldC5jDQo+ID4g
KysrIGIvZHJpdmVycy91c2IvZHdjMy9nYWRnZXQuYw0KPiA+IEBAIC01NzM3LDE0ICs1NzM3LDIw
IEBAIHN0YXRpYyBpcnFyZXR1cm5fdCBkd2MzX3Byb2Nlc3NfZXZlbnRfYnVmKHN0cnVjdCBkd2Mz
X2V2ZW50X2J1ZmZlciAqZXZ0KQ0KPiA+ICAgICAgICAgZHdjM193cml0ZWwoZHdjLT5yZWdzLCBE
V0MzX0dFVk5UU0laKDApLA0KPiA+ICAgICAgICAgICAgICAgICAgICAgRFdDM19HRVZOVFNJWl9T
SVpFKGV2dC0+bGVuZ3RoKSk7DQo+ID4NCj4gPiArICAgICAgIC8qDQo+ID4gKyAgICAgICAgKiBL
ZWVwIHRoZSBjbGVhcmluZyBvZiBEV0MzX0VWRU5UX1BFTkRJTkcgYWZ0ZXIgdGhlIGludGVycnVw
dCB1bm1hc2sNCj4gPiArICAgICAgICAqIGJ1dCBiZWZvcmUgdGhlIGNsZWFyaW5nIG9mIERXQzNf
R0VWTlRDT1VOVF9FSEIuDQo+ID4gKyAgICAgICAgKi8NCj4gPiArICAgICAgIGV2dC0+ZmxhZ3Mg
Jj0gfkRXQzNfRVZFTlRfUEVORElORzsNCj4gPiArDQo+ID4gKyAgICAgICAvKiBFbnN1cmUgdGhl
IGZsYWcgaXMgdXBkYXRlZCBiZWZvcmUgY2xlYXJpbmcgRFdDM19HRVZOVENPVU5UX0VIQiAqLw0K
PiA+ICsgICAgICAgd21iKCk7DQo+IA0KPiBJIHN0aWxsIGhhdmUgb25lIG1vcmUgcXVlc3Rpb24g
dGhvdWdoIDopDQo+IFdvbmRlcmluZyB3aHkgbm90IG1vdmUgdGhpcyBjb2RlIGFib3V0IHRoZSBE
V0MzX0dFVk5UU0laIHdyaXRlIHdoZXJlDQo+IHRoZSBpbnRlcnJ1cHQgaXMgYWN0dWFsbHkgdW5t
YXNrZWQgdGhhdCB3YXkgdGhpcyB3b3VsZCBhbHNvIHdvcmsgZm9yDQo+IHN5c3RlbXMgd2hpY2gg
ZG9udCBoYXZlIGludGVycnVwdCBtb2RlcmF0aW9uIGVuYWJsZWQgcmlnaHQgPw0KPiANCg0KSXQn
cyBtYWlubHkgZm9yIFBDSSBkZXZpY2VzLiBQQ0kgZGV2aWNlcyBzZW5kcyBhc3NlcnQvZGUtYXNz
ZXJ0IG1lc3NhZ2VzDQp0byByZXByZXNlbnQgdGhlIGxldmVsIGludGVycnVwdCBmb3IgUENJIGxl
Z2FjeSBpbnRlcnJ1cHQuIFRoZSBkZS1hc3NlcnQNCmludGVycnVwdCBtZXNzYWdlIG1heSBub3Qg
YmUgcmVjZWl2ZWQgcmlnaHQgYWZ0ZXIgbWFza2luZyB0aGUgaW50ZXJydXB0LA0Kc3VjaCBhcyBk
dWUgdG8gc3lzdGVtIGxhdGVuY3kuIFRoaXMgbWF5IHRyaWdnZXIgYSBzY2hlZHVsaW5nIG9mIHRo
ZQ0KVEggYWdhaW4uIElmIHRoZXJlJ3MgbmV3IGV2ZW50IHJlY2VpdmVkIGR1cmluZyB0aGUgVEgs
IHRoaXMgd2lsbCBjYXVzZSBhDQpyYWNlIGFuZCBkd2MzIGRyaXZlciBtYXkgb3ZlcndyaXRlIHRo
ZSBjYWNoZWQgZXZlbnRzIChhIHdpbmRvdyBiZXR3ZWVuDQpjbGVhcmluZyB0aGUgZmxhZyBhbmQg
dW5tYXNraW5nIG9mIGludGVycnVwdCkuDQoNCldlIG1heSBoYXZlIGEgcG90ZW50aWFsIGlzc3Vl
IGZvciBwbGF0Zm9ybSB3aXRoIGRldmljZXMgd2l0aCBzaGFyZWQNCmludGVycnVwdCB0b28gKHRo
b3VnaCBJIGhhdmVuJ3Qgc2VlbiByZXBvcnQgb2YgdGhpcyBpc3N1ZSBiZWZvcmUpLg0KDQpCUiwN
ClRoaW5o
