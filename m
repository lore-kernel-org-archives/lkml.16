Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62EE7195;
	Fri, 11 Apr 2025 01:01:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.158.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744333275; cv=fail; b=J1PdqAVJEvbmZxWG/OjxUJ3qGgNUcsct6S50GZQcgyPI+FrY8pH6+n7Aj4e5GlwYSLCooVN1DHq9OGAvJyDRVxLs5z5BqdGwCHvt02MqPtYUDZwODwPc4+CTgExWUNsiiz9JxDC6zj97BDzc9A7pFHzyxiZwBH2Pp6duSol5HWo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744333275; c=relaxed/simple;
	bh=l10N1KVlf9/AbuQtAmL3zvqHxAe0X6c/8hS1ldZLEBQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=QXXHE+jFMXDovyEXhqoDSntF9PKZVUw2Um7Ky8bLA4ToJ+cIfVgCoYA0f6Y3O/pyk+b9Of745OfyuYWmfD4UG0ym52AC3FEwN0JIoAaKJh3DOZ9I+eRRIYFrZtZIooD1MnvH+OxyaTBg4oubcqF950bggtvEs2NJrBlPWeQ9H9o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=HDYOxZQj; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=Ul3VxBwY; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=fD4Fx6/i reason="signature verification failed"; arc=fail smtp.client-ip=148.163.158.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="HDYOxZQj";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="Ul3VxBwY";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="fD4Fx6/i"
Received: from pps.filterd (m0297265.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53ANhDAq016065;
	Thu, 10 Apr 2025 18:00:31 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=l10N1KVlf9/AbuQtAmL3zvqHxAe0X6c/8hS1ldZLEBQ=; b=
	HDYOxZQjOAsg46MzH0A1ZI0GBuRQCGs6K/GWbBYKC70+nZKNuGzNua1LtCPWd0aO
	i56Pih18eRecua1IABHax+usemk1BIKiLHnziyPq0oftzHAsCB1J4hXK65dwCH1T
	YjkadxEOHdlQud00mSQ74IO5xFxYe8ABfOFXG11RKzMQ+qmYdAyjj5gzov1VvmPY
	H6C8ITGXgupKs/wDSItXJ1KqOR892+8/RGJvwGVesqn0eYvc8vwxhntws4EGTSOb
	JpXEFREs5ZCy8SKMsaXaxWbtZoAj8XhF8AXz2mmgHihWodi0AicTBKWJkLvsN5lf
	EsmjOBMEOIfCrncfUdQHyQ==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 45u3evq76m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 10 Apr 2025 18:00:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1744333230; bh=l10N1KVlf9/AbuQtAmL3zvqHxAe0X6c/8hS1ldZLEBQ=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=Ul3VxBwY9mi87KLWEbK802cVQ7jggYl59g3Ds3CzGvqAiyARkhouDnF9ME5sfZuIX
	 t+GcrdzLOCibMh51anmdXo82d7mCLrUtBqJN9p4WKd7qwoSWkZoQTG1evivR0vv8wb
	 VYJ5UHzpNMngvD92KlVrREXdlpylptaEt3h1a/se1+uZer3QqVbuNeaHi/Q4xlW8aR
	 Md3oJ6adQGtCluHWHDABZNNxgXV423VV796SSr47luvAvpVaL80wqQ1KFVnWtklVUT
	 y7FXJGgBbfuCUF56WBVnO1409HXRl2AIOKy6Wm4DWDcF+gaTliwPLb0Y0Rx7WVzYle
	 uIDEbJ8VUlwaA==
Received: from mailhost.synopsys.com (sv1-mailhost2.synopsys.com [10.205.2.132])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id F3D4C40B0A;
	Fri, 11 Apr 2025 01:00:28 +0000 (UTC)
Received: from o365relay-in.synopsys.com (us03-o365relay3.synopsys.com [10.4.161.139])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id BDE1BA006F;
	Fri, 11 Apr 2025 01:00:28 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=fD4Fx6/i;
	dkim-atps=neutral
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2169.outbound.protection.outlook.com [104.47.59.169])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 8708940174;
	Fri, 11 Apr 2025 01:00:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dZcZYsuscrow9s4ova3srP8HyD8kFKJhQFcLK7nUcR/vSyki9PO71MLkovu4rOGm5y1gyeCmfMu5Z+08530rIS1Lh6vobPnhT0JPa7XqFDn5+3u+h7tJ0dKRmPDXRbmq3KMHriy85j8U9phVO0tmusfRw/hhOVo0s9ySewxpn0Nd45u2h87iCBt7824+UynkrL7W22CpcQg36vT7ol6GomkikFcIeI6DYd9ZcdTq3Imw/9D/9WmdIFPIWB7+iIw5l0ndtNJP14uCq1w7oNeMHPty9wSQ5Y3wMMvHHIhbUNO7QkeuW5M0M1zdghbOHmENKAYKDA54+UqpTVsAutHwmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l10N1KVlf9/AbuQtAmL3zvqHxAe0X6c/8hS1ldZLEBQ=;
 b=mAeoxy8GjFicoCEBFsby4zCagmPsdL4l5Uc76Wy7O3rfrNrHbOkgj/OPE/Zfipd4gTRsiV0V/TuUmS9UW1/4Y7WglYVX6PUdj/1lWvGkBS++5T8ePW9eaXGX6wNkk8ffFvs3OtSR30G45UAJKtTDV2lVGPVm8o43/WUu1L4MfGdIGsBnFMYNTZLZx7Ls1LFN5/nKz+gLDTAE0cc6yQCVBeuqzkmPElCPTNITpl7jM6mKog3YyU4TVdPXgBqpm6NWC/alDFm/bWdmxvygfGOwcdjwR6FCmVSjuu4747n1u5LQBiEMhbVXs3rfl6bz248Sfkh2alCsG44v+yJUJ6PgLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l10N1KVlf9/AbuQtAmL3zvqHxAe0X6c/8hS1ldZLEBQ=;
 b=fD4Fx6/iYqnDxCJQLmBJY3DMl2bcaWeDyuAfDhcHUKXJRAulSCCmLGb+uoi9gPH2LIRJ8olvH6+henME+0EKU0CeHymzb/BNSpkvkDMKg/P6aLS4DeGfYdXiwnFxue66m9g8CFcZ7GeJ/T0igd53F50duwhs3zF3yr2A0Gx+Fos=
Received: from LV2PR12MB5990.namprd12.prod.outlook.com (2603:10b6:408:170::16)
 by DS5PPF1ADAD2878.namprd12.prod.outlook.com (2603:10b6:f:fc00::646) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.21; Fri, 11 Apr
 2025 01:00:25 +0000
Received: from LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8]) by LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8%5]) with mapi id 15.20.8632.021; Fri, 11 Apr 2025
 01:00:24 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Prashanth K <prashanth.k@oss.qualcomm.com>
CC: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kees Bakker <kees@ijzerbout.nl>,
        William McVicker <willmcvicker@google.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "stable@kernel.org" <stable@kernel.org>
Subject: Re: [PATCH v1 2/3] usb: gadget: Use get_status callback to set remote
 wakeup capability
Thread-Topic: [PATCH v1 2/3] usb: gadget: Use get_status callback to set
 remote wakeup capability
Thread-Index:
 AQHbpIi63HPVwLvMQEOG1YCtYDqZc7OY/w4AgAA//ACAAUwLAIAAOb2AgAEpCACAAAHmAIAAhQSAgAE8VwA=
Date: Fri, 11 Apr 2025 01:00:24 +0000
Message-ID: <20250411010016.dhy45itnjzly5xpg@synopsys.com>
References: <20250403110805.865311-1-prashanth.k@oss.qualcomm.com>
 <20250403110805.865311-3-prashanth.k@oss.qualcomm.com>
 <20250408011758.qfdflgrrmahwmfqi@synopsys.com>
 <4d68cb04-377f-4ebf-99c7-c63b68aebf60@oss.qualcomm.com>
 <20250409005524.fbehw2gonv3p7j2v@synopsys.com>
 <a4cc6d1b-4925-4b57-ae23-fc1e23c5efde@oss.qualcomm.com>
 <20250409220510.eynefm7fesydagpz@synopsys.com>
 <20250409221158.n5duanv2gmctrr64@synopsys.com>
 <2cc61d5d-656b-49d6-9d09-98c4368b1fc8@oss.qualcomm.com>
In-Reply-To: <2cc61d5d-656b-49d6-9d09-98c4368b1fc8@oss.qualcomm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR12MB5990:EE_|DS5PPF1ADAD2878:EE_
x-ms-office365-filtering-correlation-id: 7b428b08-1b77-4f43-c19e-08dd78943e1e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?OFlNWjRzZkxMYXdHWEF5VXEvTUFJYUZROFh1a2lreDBZd2w1OWk3bllkcHRW?=
 =?utf-8?B?dFdCb1ZFV0lPZ1FJYUNTYWdYUmc3aGQyRmhSNFd1RWkzOVdwR1lvOUhZMm9M?=
 =?utf-8?B?bHdrSUg0MXVGNFN3bVhJeUdpdGdjcVYxMW01dEYvVGJpTXc0Zm14cFZObjJW?=
 =?utf-8?B?MUI3cFdDS0Vrb25ZTkJMVG53TkxIQ3pYaDNYbmZWSXJNYTRTRXZUNzdsWDhF?=
 =?utf-8?B?ekxiSXFoTmtiOC9UMVJ2MXYwbUU4RnQ5MURjZFBuRFNnaEdsZE04Vk0yL3pO?=
 =?utf-8?B?ZVluemdQRGRXZ2FMQTZwSExEYmEveDk1NDJOMko3STBidGZzaTRQZERMT2N1?=
 =?utf-8?B?MSt1aWZvLzdINWlEZjlzU1FUREw4T3JsTEdkNVhCWnlkcXlYY3dnY2ZqQmxY?=
 =?utf-8?B?eERUK3BEQkQrRDMvNUswTllEaXQvb2ZiaTd3Z3gvTDRWOENtL3N4ME5nQVh3?=
 =?utf-8?B?dWtrZDFQV2l5T3RrQlRYWksxbHB2UzBHT2ZHYzlZYlNoRXRoVHl2NERPWTlm?=
 =?utf-8?B?aDhDMHU5SHNzVkFNenpzbDVLRFJ4cWpGT2RLcDFoWHNMVzdCT21ZNU12c0FD?=
 =?utf-8?B?SEZMa3I0bU9PRWNmbDVuc0c5WTNxSFg0NndGVGFkcy9jZ21vRUJTSG1OWU5J?=
 =?utf-8?B?TlBNdDN2a3loOG8vc0NhVXErQ2syVU9xUGx4cmZQTnoxR29GcUJnNEdzczVI?=
 =?utf-8?B?anJKZEZRUWZBcmVMRVpOaWRmSFFIRFpmczdrTnIydUdIWENhN1NwaVBvem1l?=
 =?utf-8?B?UVY2YTdCc2ZmZDB0NGlQc3BxWkszWDUxcHlWdmgwMFF0VDVNb2dSUnB5WEVw?=
 =?utf-8?B?UFRqVE1PeStEOWVDQndXZG90M2lUWjJONEZoTi8xaEF1MndmWmZxV3UwUDFK?=
 =?utf-8?B?eGR2d1I3MkZRVXFDVnFCWmNmMC95Q0Nra1hhbXdCOTF3eGpoclZtMXNMYVVK?=
 =?utf-8?B?MFpyUFk4S0Z3bTVNQTlGUEJWQVNvaFhPY1JrOU9kNi9sYnMveEZtcnVudDZG?=
 =?utf-8?B?d1pjcWN4OFBUbUFMcEtEZXJ1emNwZGJWWldKdE10WE52dW9ZR3pxNW50WFB3?=
 =?utf-8?B?a1ZUaEhYZTUrb0pIWDdCOUhIUmxOSkEwcVRsYnRaZzhhSXMrOUVYZzJVZFVv?=
 =?utf-8?B?SFU0RkZ4dGZSZEJrYkEwdGtKMERUSktWSVl1NjJHYXJUS3Y1SUF4TVJibG5V?=
 =?utf-8?B?WC9pZzNIV3RNQWFaVlFKQjBiNXQzUk5WckFHRGJiWTZieVplcFpnNmFkQVUw?=
 =?utf-8?B?dUdnY2pYQldLNGN5NnY3OHhueEw3Tnk0cnhqQ3VuN0k5WjdGSW5VV0FvT3Fm?=
 =?utf-8?B?TUtEK1Z5eWhCRnBuWXl1QnRjUnZjSVgwelUwQWp3T0RZV1pBeElBcWd0cVFx?=
 =?utf-8?B?Q3BrcGVaaWpLNC9uL0FiaGl4Z0RUY3B0eWdhWjd4amVnUFNWeC9pbWtIb2xp?=
 =?utf-8?B?Qm0zRHpacjFZOG1IMzhGTmpLRzZxZnRpWnMzZVZuTHN5T1BQK0VhNzQ1WFZp?=
 =?utf-8?B?eDRoYmlQN25aWm16NjJ2TmFDN3d5b2VkcVhvODJIRXlEWWljN2Zvd1N2Zjlo?=
 =?utf-8?B?WlRwU2ZRTnlURlFPNWhsTnpkdFJycW5yRzdFN0NaOFpuNVp0SWF2bC85VVdP?=
 =?utf-8?B?OUZ6UFgxSlRpNm83S2F6Mm9mWERMZlIwN3VLaGJkVGlzekxxMElnQjR6cWpl?=
 =?utf-8?B?VkwxNmw0aDFjQkZsdFBqOWJkdXBHSmFUaFNBaGthKzZ1TTNFTm5GQ0o3QVB6?=
 =?utf-8?B?RVloU25mcnN1WW93Q05sMVRQMmxkeUoyZ3htNnNHOVhNdzYwd1B5UGlqOUx0?=
 =?utf-8?B?L01lcXFienFESG9QQytOQlRob09qaFRrSzJ2OUN5N2tmU3d0Y01NNXd0aUEy?=
 =?utf-8?B?SHBVQ3UvVUNRd2VLWDd1dmtPSG9qK3lWc09pUGdhY2VlNFBtTTZZQlh1M1FW?=
 =?utf-8?B?d25SVWhTUmRoRnJHS214U0NtY1VoSEY5ZkRXQkNuelpGdGxGbThxQmZ2amkv?=
 =?utf-8?Q?TQ+E3jRYdON0oaG3aFiCVgT/Kdx0eA=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?RUxScm1PRVl5TnhPT1V4aFBYdUlYdHJ1bzhOanl3ci96NnhjNVdKVGlURytu?=
 =?utf-8?B?eFhHS0ZFY1ZHemxiWlo3Rk01c3dKb0ZXdk8ydE9FaVM4RzVRYVkyeklmd1Fp?=
 =?utf-8?B?aUpGMXowbW5JVllXWE9BMHdHTy9HbENEZFR5ZkJkSDlHMWxZcm5WTEVPWnhX?=
 =?utf-8?B?Sk1YbVBRWXdrZWwzUFBqbUFNTVNYWERPazYwdmorVG9NWHYybC92dzdjcDRs?=
 =?utf-8?B?dk15b0ZtL3pUMk1DRThlZEFHc2hLNm1LcXd1N0ZDbk9jT2hpSnhoQmQvelJj?=
 =?utf-8?B?b3h1WmJ2cFNBWGkrT29zK2srUUwrU0pOVmtXdXk4ejlGdkJwQnM1VmRyQjFn?=
 =?utf-8?B?QlorcjBxbUNoemFSTThEYkpQaGtqSGk4RjNMdEZrZ1BoYVZtT3FIY1A5WjFF?=
 =?utf-8?B?Y2NHRzhwZk1PeGppNjlpSVYrdVZlSXIwWFN4NGsreThGcjRRT2NLMEhmdHpS?=
 =?utf-8?B?akhHM3lWbXNEb0dhRmRORDkzdVlsU3FmaUdqT2V1OERqc2xLdko3aStLSWdT?=
 =?utf-8?B?eENZRGU2M1JNZENIQmxhTXZ2bVhTakU0S2F0ejRPZHRDZm9FdDQ1d1BEQlBL?=
 =?utf-8?B?R1dRT3J0QWRZMXprT2xqYmgwQVZ1OWJmN095R0J6SFlEbEpSSWQ0d21vaUhn?=
 =?utf-8?B?QTVrZTdsZVE2aTNsaXN0M3ExUm9FdVp4VjJLZGhLaEVqYTNTZG1heGVVL3FQ?=
 =?utf-8?B?cGNlanRmWTZPNE12NHBVTFBaZ082a1JodHZWNUMxMmp2QnZrTElOVHM3bEUy?=
 =?utf-8?B?WndlWkg2R09lOG5ublFmUzUvN1ZwZld5WUxSK3hTNzZFb2RJS3hnNUs0RmVy?=
 =?utf-8?B?ek0wa1dNdXY4aVhOaGlVV0hQMXBYM1c0bktsSUJUazdCRmM2WWpRckY4SnFM?=
 =?utf-8?B?VkROVnFqMDREQVE4RHdrTGpnSjcwLzkxR0tySTVpQjNNUU1HUDArRzlpV2R6?=
 =?utf-8?B?c24vdVpnNTc0K0lsNlgwR0lpM3BPOVNxQ3RUdkVIWHB6QzFKcmRoMTlpZ0hI?=
 =?utf-8?B?UlRZblduOTBBRTEza3ovbjVIZXBpTWlLT2VjbXVUMXNsVzl0ZGIydXR3Vm9q?=
 =?utf-8?B?c1h6Qm9PVlNoNTN4NXZNV0hvRHE1ZStldm8wVUYwOFRDZjhNVURhSTlhcE9Z?=
 =?utf-8?B?QzVlME1DNTJhV284SDZiTWZNZXZlSENBUnVCRkZuUDNKV0pyUXNuOHJWZGZy?=
 =?utf-8?B?TlEweEcybUxYOXRIK1hyR3lzVW9UVkhpb2ZwaGlXenZKVlBTY1RuQ3NyWElP?=
 =?utf-8?B?WnFHNDcxdHpGUzJYeGxrM1dlYlVXVDJmc0tzVzZDMDhoK1RONUgyOWZhcjdW?=
 =?utf-8?B?b29BTjhzTlR3TXBVMWR5MmI3TWFIK3Zkd0lYMjZzNXZIK0tuT25rSHVJQVRF?=
 =?utf-8?B?NmdVTlhVRmJYQlR4Y3RKZXk3OHVSdnpxaEowY3lvWlp5SW93bTNuWDQrMVZu?=
 =?utf-8?B?OWlUTkpLdU54RnhGVDRFNk9abXdFL1pWYXZuRURaOHF5cWlQTkNwWk9kVzNL?=
 =?utf-8?B?WFBCRStNTFc0Qk9udFVtUG8reGJXazFRcTZSS21TR1d0SkZDeUhvdVF5NEFQ?=
 =?utf-8?B?c01sUG5Db25mMysxVEM4b1YyNmNUa2p0UTRPZUVXdGdzM1N4Uk9jelpQZE9G?=
 =?utf-8?B?UkJ5Y3lGN09nN2d0eGVwbVJGT01rclF0NktZOUtjdWx0ZWNadmRQUHFBRHlr?=
 =?utf-8?B?NEl0STNuQklFSFBXbHB3S3JQNlNGSjJ0cTZFQVdmZC96Y1dIcmt6d0w0cnNY?=
 =?utf-8?B?dmMySVhWYnU3Z0FpVVJwbDkxVUUzQytMY1hOQ1ZpcXBQdHE1Qlc5czFDaVk3?=
 =?utf-8?B?a0M1TmVJNlFBWVd0VUVsNmNIUm55NHNRVGdYa3ZzU3BaT0xqU1VsbklsOWJK?=
 =?utf-8?B?a2NLL2NEL3dmQlZHVURFZnpVa1BvUVFkL3R6dzhNU2UyRExucys2eVhEOHAy?=
 =?utf-8?B?OE9iSjU4ZkxIbStERk9OSXR6V2VVbldXYkRPdmpZYWJWeHVVaWZaSnRURVMw?=
 =?utf-8?B?RmpqdW9rSUNqUG1oTXpyMEVxay91bmFXaE0xQUc1bXZMeFVUdWZmTWlJVkFi?=
 =?utf-8?B?WEtoWkptV1R0THNTRWg2VmhjQU5GejdzY3lCWVlyUVYvV3pudEZPa0JWeDBq?=
 =?utf-8?Q?zTejYujRoq29izxGLjxBC71on?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <FD61944A1E232A4884D34EEE4CA83750@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	Zuv9kCeIfd78F8UYoDe6qVWxi/SfSGWSNy+xGOUqAyuJ9qEjphqL2T51wouHy8YD3i9DfEwVO1vxqPIW0ZaXbS1kkaN5nR0s6HZLtoeWWSsufpZc+Oaw27r+jXrDp6Y/mEW7auphqzLpz+/IS+c7SWMtPVI2+G2jICfDPF2Fqy6FwPwPmAmaUjXdbdKIQknaYxKH0wI4mX4lbyOQnjTQS6OKPMMj8FfZ2dhxt6Z0+oAiTFAVD7ka3utnOlDPeDae2J2fNyQ1/lUx9APEoTlf9+FEZ0gqfx41tufarSLoJn/Fjo4KAQKOanuEzib2ppASE9II+8wtiT84bkXb4WouRdZkOL96qXZEYV43uurUURWhPRpdZ7FaubDrP9X+8nopR5RJBbXR9o2wv4apYPaPtXMMZtemdv47ULR9CtKk2+4AvC6WxnBbw5+2iK4q4s00zGTXxWT1mhb7U58dFAx5Rndk6XMhLNyWSja97aem7l3OcpvqO0BtPh5eIyFg1IW3EjXYSm1sgQvYnB9rC1s25+kxXxslfDP4peE/zYOB7dnMkT05Ex57Oey6I9rX0Cw7bE3NAcjj5fU15Nsf8REpMm4jWST395TmZc61tNjfsR43FeoW9SgKFwGGn8bAVRNKcnWcStFQ8fkSePwFDb9kLA==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b428b08-1b77-4f43-c19e-08dd78943e1e
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Apr 2025 01:00:24.8611
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2JLdamRQMgQ43CrW751hIZVOBXzyl/xJhCjGHkriAW4B5ZvPpnlCzYrPTkbhxEJz7s1ziXRWguV2xqsw43Lp1Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS5PPF1ADAD2878
X-Authority-Analysis: v=2.4 cv=L9cdQ/T8 c=1 sm=1 tr=0 ts=67f869af cx=c_pps a=8EbXvwLXkpGsT4ql/pYRAw==:117 a=8EbXvwLXkpGsT4ql/pYRAw==:17 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10
 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=qPHU084jO2kA:10 a=d3R2pIqYsZwyag_xp-4A:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: KShnn_RR0nZVnr7cfBjhDrpM8lq0zIbm
X-Proofpoint-GUID: KShnn_RR0nZVnr7cfBjhDrpM8lq0zIbm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-10_07,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 impostorscore=0 mlxscore=0 adultscore=0 clxscore=1015 lowpriorityscore=0
 malwarescore=0 phishscore=0 priorityscore=1501 bulkscore=0 mlxlogscore=704
 suspectscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504110006

T24gVGh1LCBBcHIgMTAsIDIwMjUsIFByYXNoYW50aCBLIHdyb3RlOg0KPiANCj4gDQo+IE9uIDEw
LTA0LTI1IDAzOjQyIGFtLCBUaGluaCBOZ3V5ZW4gd3JvdGU6DQo+ID4gT24gV2VkLCBBcHIgMDks
IDIwMjUsIFRoaW5oIE5ndXllbiB3cm90ZToNCj4gPj4gT24gV2VkLCBBcHIgMDksIDIwMjUsIFBy
YXNoYW50aCBLIHdyb3RlOg0KPiA+Pj4NCj4gPj4+DQo+ID4+PiBPbiAwOS0wNC0yNSAwNjoyNSBh
bSwgVGhpbmggTmd1eWVuIHdyb3RlOg0KPiA+Pj4+DQo+ID4+Pj4gTm90IGF0IHRoZSBnYWRnZXQg
bGV2ZWwsIEkgbWVhbiB0byBjcmVhdGUgYSBjb25maWdmcyBhdHRyaWJ1dGUgY29tbW9uDQo+ID4+
Pj4gYWNyb3NzIGRpZmZlcmVudCBmdW5jdGlvbnMgdG8gYWxsb3cgdGhlIHVzZXIgdG8gZW5hYmxl
L2Rpc2FibGUgdGhlDQo+ID4+Pj4gZnVuY3Rpb24gd2FrZXVwIGNhcGFiaWxpdHkgdmlhIHRoZSBj
b25maWdmcyB3aGVuIHlvdSBzZXR1cCB0aGUgZnVuY3Rpb24uDQo+ID4+Pj4NCj4gPj4+PiBXaGF0
IGRvIHlvdSB0aGluaz8NCj4gPj4+Pg0KPiA+Pj4+IFRoYW5rcywNCj4gPj4+PiBUaGluaA0KPiA+
Pj4NCj4gPj4+IFRoYXRzIGEgZ29vZCBpZGVhLCBpbiBmYWN0IEkgaGFkIHRoZSBzYW1lIHRob3Vn
aHQuIEJ1dCB0aG91Z2h0IG9mIGRvaW5nDQo+ID4+PiBpdCBsYXRlciBzaW5jZSBpdHMgYmV5b25k
IHRoZSBzY29wZSBvZiB0aGlzIHBhdGNoL3Nlcmllcy4NCj4gPj4NCj4gPj4gVGhlIHdheSB5b3Ug
aGF2ZSBpdCBkb25lIG5vdyBmb3JjZXMgYSB1c2IzeCBmdW5jdGlvbiBkcml2ZXIgdG8gaW1wbGVt
ZW50DQo+ID4+IGYtPmdldF9zdGF0dXMgdG8gYmUgYWJsZSB0byByZXNwb25kIHdpdGggZnVuY3Rp
b24gd2FrZXVwIGNhcGFibGUuDQo+ID4+IFByZXZpb3VzbHksIHdlIGF1dG9tYXRpY2FsbHkgZW5h
YmxlIGZ1bmN0aW9uIHdha2V1cCBjYXBhYmlsaXR5IGZvciBhbGwNCj4gPj4gZnVuY3Rpb25zIGlm
IHRoZSBVU0JfQ09ORklHX0FUVF9XQUtFVVAgaXMgc2V0Lg0KPiANCj4gQ3VycmVudGx5IGZ1bmN0
aW9uIHdha2V1cCBpcyBpbXBsZW1lbnRlZCBvbmx5IG9uIGZfZWNtIGFuZCBvdGhlcnMgZG9uJ3QN
Cj4gaGF2ZSB0aGUgY2FwYWJpbGl0eSwgc28gdGhlIGV4cGVjdGF0aW9uIGlzIGZ1bmN0aW9ucyBz
aG91bGQgYWRkIGFkZCB0aGUNCj4gZ2V0X3N0YXR1cyBjYWxsYmFja3Mgd2hpbGUgaW1wbGVtZW50
aW5nIHJlbW90ZS9mdW5jIHdha2V1cCBhbmQgbWFyaw0KPiBpdHNlbGYgYW5kIFJXL0ZXIGNhcGFi
bGUuIEFuZCBpZiBnZXRfc3RhdHVzIGNhbGxiYWNrIGlzIG5vdCB0aGVyZSwgdGhlbg0KPiBmdW5j
IGlzIG5vdCBGVyBjYXBhYmxlLg0KPiANCj4gQ3VycmVudCBpbXBsZW1lbnRhdGlvbiBzZXRzIFJX
L0ZXIGNhcGFiaWxpdHkgdG8gYWxsIGludGVyZmFjZXMgaWYNCj4gVVNCX0NPTkZJR19BVFRfV0FL
RVVQIGlzIHNldCAod2hpY2ggaXMgbm90IHJpZ2h0KS4gSSBoYXZlIHByb3ZpZGVkIGFuDQo+IGV4
YW1wbGUgaW4gdGhlIGNvbW1pdCB0ZXh0IHdoZXJlIHdlIGluY29ycmVjdGx5IHNldCBGVyBjYXBh
YmlsaXR5Lg0KPiA+Pg0KPiA+PiBBcmd1YWJseSwgdGhpcyBjYW4gY2F1c2UgYSByZWdyZXNzaW9u
IGZvciByZW1vdGUgY2FwYWJsZSBkZXZpY2VzIHRvDQo+ID4+IG9wZXJhdGUgaW4gdXNiMyBzcGVl
ZHMuDQo+ID4gDQo+ID4gU29ycnkgdHlwb3M6IEkgbWVhbiBhcmd1YWJseSwgdGhpcyBjYW4gY2F1
c2UgYSByZWdyZXNzaW9uIGZvciByZW1vdGUNCj4gPiB3YWtlIGNhcGFibGUgZGV2aWNlcyB0byBw
ZXJmb3JtIHJlbW90ZSB3YWtldXAgaW4gdXNiMyBzcGVlZC4NCj4gPiANCj4gPiBCUiwNCj4gPiBU
aGluaA0KPiA+IA0KPiA+Pg0KPiA+Pj4NCj4gPj4+IFdlIGNhbiBhZGQgYSBjb25maWdmcyBhdHRy
aWJ1dGUgdG8gZW5hYmxlL2Rpc2FibGUgRlVOQ19SV19DQVAsIGFuZA0KPiA+Pj4gZnVuY3Rpb25z
IGNhbiByZXR1cm4gZ2V0X3N0YXR1cygpIGJhc2VkIG9uIHRoZSBhdHRyaWJ1dGUuDQo+ID4+Pg0K
PiA+Pg0KPiA+PiBUaGF0IHdvdWxkIGJlIGdyZWF0ISBUaGlzIHdvdWxkIGZpdCB0aGlzIHNlcmll
cyBwZXJmZWN0bHkuIExldCBtZSBrbm93DQo+ID4+IGlmIHRoZXJlJ3MgYW4gaXNzdWUuDQo+ID4+
DQo+IEkgc2VyaW91c2x5IHRoaW5rIHdlIGNhbiB0YWtlIGl0IG91dCBvZiB0aGlzIHNlcmllcyBh
bmQgZG8gdGhhdA0KPiBzZXBhcmF0ZWx5LiBUaGUgaW50ZW50aW9uIG9mIHRoaXMgc2VyaWVzIHdh
cyB0byBmaXggdGhlIHdha2V1cA0KPiBvcGVyYXRpb25zLiBBbmQgZW5hYmxlL2Rpc2FibGUgZnVu
Y193YWtldXAgZnJvbSBmdW5jdGlvbiBkcml2ZXIgd291bGQgYmUNCj4gYSBuZXcgaW1wbGVtZW50
YXRpb24uIElsbCB0YWtlIGl0IHVwIGFmdGVyIHRoaXMuDQo+IA0KDQpGYWlyIGVub3VnaC4gVGhh
bmtzIGZvciB0aGUgd29yayENCg0KQlIsDQpUaGluaA==
