Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB5B5819;
	Thu, 30 Jan 2025 01:42:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.158.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738201360; cv=fail; b=MV4Ikx5vnJbAJ6I3oe3B4kLUtnG82GiKEH9VTzSgoW29EGpCPlqz5lzK+8uuS185wtRZrAZr1woi/QJFocPShBEUnhj/+6TJ24vHpjCMtvqWv5CmSw1FT7dIxQR1D11s430U2Wd1kkNVkxPfNxotU0l3vN7a9ksXwrW93OYI6Jw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738201360; c=relaxed/simple;
	bh=06VZ0KawjLkXt9uR9mZXQPVsxziRbn5xLMyryYrut5s=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=hlo0G27t0k2ZzVhxOLz4QGOomAdadn47mIZhXzkRESpTgiVjWcwmyvG+ceQdhweeiAM6vwRQ1Z87DMnsmFlNhrJ5WUDu/yfM46AAGBbxaH3vFxMRBKNP8h3y4vi7VynfsFReipK9WXoLaMU+fU1fFdhBcFV+Cx2W1LgCe42bCso=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=Z1KDg24I; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=WQAO610g; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=m6v7Jc0G reason="signature verification failed"; arc=fail smtp.client-ip=148.163.158.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="Z1KDg24I";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="WQAO610g";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="m6v7Jc0G"
Received: from pps.filterd (m0098572.ppops.net [127.0.0.1])
	by mx0b-00230701.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50TLQiiH026073;
	Wed, 29 Jan 2025 17:42:17 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=06VZ0KawjLkXt9uR9mZXQPVsxziRbn5xLMyryYrut5s=; b=
	Z1KDg24IS7qtdsMvqCefN56TatmWfEecExUo4ZRjZaf+zuKfFu/QDXu1K3CnqJdX
	+LoPA9n3TRjboCDTVtgGKq1mUVPG3A6rwSlyp/ofcupQkDdo4kFSi3Oq3oWRE6ej
	FE1K02TChbnxKKDd8y9bswNABfO2jcZxXbMdA7UUIm/HpZX8z4zNvpwjDY0m/T3D
	plR2RrUP/Wp4zG+cFUEM5qiJFWb/O2h7Jvp38jS3ZSvsOOoTUBYqYMscwq3PHrrX
	VSNpTZ3p1FA4srKUZRhWNO0rSTHgUXeiKu5Qx72n8fRFBkpYovgFaKH2ztDZXCa2
	2714nYtn+v9hW2yn9KBzfA==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
	by mx0b-00230701.pphosted.com (PPS) with ESMTPS id 44fv8m0xyy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 29 Jan 2025 17:42:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1738201336; bh=06VZ0KawjLkXt9uR9mZXQPVsxziRbn5xLMyryYrut5s=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=WQAO610gJNNV2eMkt/XeqdqDMkBwjgXMQcxP8UFJ30x0GVeMRrJ/FyJxWKqXLRkZ8
	 1YT3FRZlLpmRLYwhn54ijwyArgR5K2+LFib5CtwI6SVAaYcZiIuLwbhkjp2yGbV34n
	 vRNhy4FrTQx/PZ3+0fo75q4VJsAwTAXY+qSuMiz2602SRXg6kPnVH8x9Ty+TFospZZ
	 D33Xq6FLr33k7kNpN0YhPrWBbcCNvT5EqBGzfW4AY51nYrFsFP8sbtufvmDePCRtsc
	 5tSpwmKBZ3WmTzyG/yjBZBsl7CYwfDrmLXDMuTdqnq2BRBUiM8nkwpKOd3N+KctAw6
	 Yeyu5KQKjfe5w==
Received: from mailhost.synopsys.com (sv1-mailhost2.synopsys.com [10.205.2.132])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 4D0CF40515;
	Thu, 30 Jan 2025 01:42:15 +0000 (UTC)
Received: from o365relay-in.synopsys.com (us03-o365relay1.synopsys.com [10.4.161.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id 14070A0072;
	Thu, 30 Jan 2025 01:42:14 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=m6v7Jc0G;
	dkim-atps=neutral
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11lp2168.outbound.protection.outlook.com [104.47.56.168])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 2788040120;
	Thu, 30 Jan 2025 01:42:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GpQ+sTOlqtEviHkvi4XFNtSM6iw283uuQiK9+eUDHFrE+wQAkX4jYz0NkSA2vV1MWmy+IcjMsCVhhZjR+7rKkiIWdu0PQjx4MB6jXorB0//ssPMOs0q+R4rxkfVbCS6sDed7a5faMPaf1/qLLTXxkvtIZiKo/OVHy/bOcyG2KaACGzvf+6f8nJ0gbDtihna0k2D6OAhLeAdzDgjTbvS2QM1pNINDoBdMUlBgV3Xv8CoUxfBwUDD/2TxDR9Uu7O6hy74edwcSM/wPMALmIPn5W0KV2KIvxQU+Wktybe846OOnHRw9QWmZ3qz0dZgk4/pMTicDyxA4Imq7boPEQPfkZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=06VZ0KawjLkXt9uR9mZXQPVsxziRbn5xLMyryYrut5s=;
 b=lIP1CcSPxA4mYt8+1gqjnWSEygSEu5SMB5CuUD7Fb5AYhkfWM38DqJca6M4vZXLqF5L5a3beJDfBmkTaCwXXuArc4e/vzb6zNEZMR87jHU7QuIfg8IBniFhuLftia0yWgUDlZ0ItqI+OA38kzL/iyzwtNeyGOELaSlZ5Lzp3Z9U+uW+8Wrb/VB0mv+6uoh5SVrV9+eSU2eObrccitkzqPp5acSHzSUrZG+ixyLX4CYEwXo3ZNczDCIWntIQ8bUB3dLO5oKp3oLbXnJaI0THp9Bna1a0XEYGlqBHmloxP3+fsPjLGeUuXot5Y14Z2lEuqIgBR/+Dlvt8PzVkLMmGJ9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=06VZ0KawjLkXt9uR9mZXQPVsxziRbn5xLMyryYrut5s=;
 b=m6v7Jc0GMRX86PHL8Uq+rZjrUtZOZ7aoPVbObZTxI2yrVWftk1H1S2nGha/6RcNhR2JDiF/X5MCXXcy0BEf9IV3SorHp7+NWfTNBbiQy98h4+dS1CM0BMebq9g64CmK3MojR0VuRljh2/GkHm6UT6ij8ROwK5OS5RlxG4H8zIiM=
Received: from LV2PR12MB5990.namprd12.prod.outlook.com (2603:10b6:408:170::16)
 by DS7PR12MB9503.namprd12.prod.outlook.com (2603:10b6:8:251::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.18; Thu, 30 Jan
 2025 01:42:09 +0000
Received: from LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8]) by LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8%7]) with mapi id 15.20.8398.014; Thu, 30 Jan 2025
 01:42:08 +0000
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
Thread-Index: AQHbbjXlOsxglH89uEOeQnhFYdXNErMrgJ8AgAHzI4CAASAggA==
Date: Thu, 30 Jan 2025 01:42:08 +0000
Message-ID: <20250130014159.bv7gvtskyg73lxmc@synopsys.com>
References: <20250124075911.811594-1-badhri@google.com>
 <20250128024416.7i3i2vmw2ioy5huf@synopsys.com>
 <CAPTae5L6Worr3WsuuV-SUNJh6SOVf+RnLWt2d1LNLDYvY6uRuA@mail.gmail.com>
In-Reply-To:
 <CAPTae5L6Worr3WsuuV-SUNJh6SOVf+RnLWt2d1LNLDYvY6uRuA@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR12MB5990:EE_|DS7PR12MB9503:EE_
x-ms-office365-filtering-correlation-id: 7354c9aa-4894-4a9b-d12f-08dd40cf4ef9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?R2NKd1FTNXV5ZDhOQ0piaTBnbGptYWF5NjA2UDkzRHdpSXdGSXFZV3FxVkhN?=
 =?utf-8?B?UmFXMDYrRHh5REsxeHR3LzA4ejZJWFB2ODJkTllGVDN0ZFF6cXdwTXNwb1lh?=
 =?utf-8?B?T1RrQ2wralpaM093Q25KR2tMV2hJanJ0aWpUM3FqaGFscjM4M05aQkFRWnpr?=
 =?utf-8?B?YzBLZUd0d2dNWFRUbks0VUVjVng0cUNTeGRsK0RxUVplQnd0WUh6VTAzU2VV?=
 =?utf-8?B?VEpIN21ZRFp3cTcrYTZLbi96cnA0K3Y2eWtjTnFRamxRZ0RVWUJLVi83eHRh?=
 =?utf-8?B?Yytwc2oxZzhKY0ltWHlCSkhKdWxsZ2RJY2ZkZG9SeXp5bnZKVVhUbjhDTW53?=
 =?utf-8?B?VnlYVHozYkRrdVlSL2ppYzFjZU1nU2pLZjhHQjZrbUdPRGNWUUhzZ2tKdnJN?=
 =?utf-8?B?ZXV5K05sb01iQlVmWnB1bnFsMi9waEtFemx1ZnRnTFgzZFdsaWJOZHVZZ0xR?=
 =?utf-8?B?NjVxbHlPSjZTKzhTSUVPeS9xMlFFbUZHclBQT0JSdkh1M3htc3RGcStRbzNM?=
 =?utf-8?B?cEpXK1Jscy9iOFh5bWNON1hPUEVsNE96RXh5WHIzL0V0eDBVSUo5VjlRTWoz?=
 =?utf-8?B?OUlMMVBiN243TS9SS2d5RCtZRFFlQ1JTK3JsbTFKakovNjhjRHY1V1R4MEVK?=
 =?utf-8?B?cS94UmtvVTFzSXBMK05sWThoK3BpcDlrd3N1cm1ySUh1eFhXcG1wK200NjYv?=
 =?utf-8?B?OW5vbjZPVnBDUUJFbGhmUmdmTU16a0s4WDA4NXdubFpPcUpVZVliMTM5VHRX?=
 =?utf-8?B?RzJNT1lpamw1TnFVMnhDU3dycmpady9iMHE0azE0TjZ3SUs5NUdtRytUYm1w?=
 =?utf-8?B?Z0NJeVFxQm00SVREZmR3bWVlQTVVUTZoUkttaENXdWhLK0NyZ0xSU0N3djE0?=
 =?utf-8?B?SkE3ZDFsdUx3enp4YjhROHFWNHhIeUVNWVJyb3d4bm5rcE1iSzRGa2JmUmhv?=
 =?utf-8?B?L0lqanZlKzBFQ1RCUlppelYyckVGa09GRFpMWVRtdlZuNkdCLzg4TzJhQ2tU?=
 =?utf-8?B?a3NmbzJSNnozSURMc0pjZnUyN080Y2hSei9NMWlMZ0pSSldraFlYRnpHaFNp?=
 =?utf-8?B?SU00WG9TSmU5cVR3RktOQVJBOUU1Q0dzbzVkY0lwL1VWMVQxQVBVWDZKQVRs?=
 =?utf-8?B?YlFaNGpkYysxTmFPcDk1TkNjWGdySU43RXRiSW5HNzJDV0lnSGY1SDZXVlZW?=
 =?utf-8?B?Rjk3ZjFWd1ZMc2ZtWGt6MEZObXcxRzBrbDlIVW9jc1Y5d0p2ayszMCtqd1M4?=
 =?utf-8?B?WVNVN0NEQkVXZGNLY1duN1hkSXNyUkNCUDJySm9QcTJIai9YVURlemRVZmxq?=
 =?utf-8?B?MlZLY0hsUjcvV250RmxOdHhmOUw2V2phMkx1SlZna2pEUjJtLy90bURWZEZI?=
 =?utf-8?B?WjBob2w2ZVlGdTBtVkp4ZXh2eDFRTTBZNFJOQUN0dkl2NDVwaGF3NUppb1lI?=
 =?utf-8?B?eWtKMVd2VnNUYjNrSjZ3WjhkNmVIVFhnMVFOV1dZSjdINTdDRXJNRnlxcm5U?=
 =?utf-8?B?L0huZkRkMEdOL2syQkdaNlp2RVBuN3hseHd0azcwYVBGWlJPRkM5RTBDNlhx?=
 =?utf-8?B?eEovZWdtbmlDZVJvK241cGFrbTJJK1BTOHZyVllaNk1LOGxsTnk5VkNEVFB3?=
 =?utf-8?B?cktRa00rVGM1enp2WFo3RWxtYjhWRG5hVnZ0ekJ3L2g0dkNPMk5MM1B4OVN2?=
 =?utf-8?B?WlQvZnpna1hRQmxsL0VSMy8zZmpEeXA2dGRtY1VoWVAxaXZGYVZoajhYcWli?=
 =?utf-8?B?OHFtdFJLNi8vdmNWMk0vSnp3em8yWDRvYTZJNThRQ0pMTXNQNHVWVHZQKzdx?=
 =?utf-8?B?Y1pJVFFDWDBhUThwZGU1eWh5NnNCclltUFJ6QkhFMTZteW4xQkg3c1RrMWdY?=
 =?utf-8?B?U0ptUUlyWC9KdzRKbHJvMDZyQXd1YWpYZ2RFcnJjWDVwdE9BVVNGVXhvV2xY?=
 =?utf-8?Q?DQzYEbPyw71JcVn7E6McSF3skyzAmpKs?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?MFN5dXB4T2l4QUpGOW1NTzBpRlhSVmZ4ZGZSMm04cS9lT0hlUjlKK01YREpN?=
 =?utf-8?B?VkZrQXlIYjRuTlVWT21JUkoxT3A2RTJpb2lYUG5DeUFQOGhvdXFuSXVMYVRj?=
 =?utf-8?B?aE43aG5Gb1RzSXNMUXBIRStucTVFalJ1eUxXRDFXWWNQUzc4MkN3VklIWEhI?=
 =?utf-8?B?MnpFZDFGQjg5bmZIMzZGYkJLSmxNeEJRV05saE9rRFgzUkgwZEtwZVB2SCsx?=
 =?utf-8?B?a1Q1d0lEU3Ewc1llejBkNjE4Z3h6dm96clppd3JJK004RGZkS2drL3ZzLy9x?=
 =?utf-8?B?cVgvbEJHRnRWZGpLYXFPOHV2Mk1UeGlhWjBNWEdmMkZ6VWRyK2pmNmM5a2lR?=
 =?utf-8?B?WWExQlh3V24wK1JBL2YzRFJ0S3laY2pOeW1qTFNDQWNNcnlmMHdMbG94SWVB?=
 =?utf-8?B?OTdLazZQSUNaYnRaSWRNZGxjMUhpVVE4SjZLZ0MrREU0UEhXdEJUdHUxK0Q2?=
 =?utf-8?B?bENxcmN0Vkc4cUpCeXVyZEV2SEd6aWtCWHlYbHRCRTFjWlRQWGF1YlNEaFlE?=
 =?utf-8?B?a1VFTms3bVpZTUI0OWRZbEdHN2xxWWR3UFlFMmpqWUVFR2tGNWZ1dEtQcDJn?=
 =?utf-8?B?OCtrNjh3dlJhWDdReFdnSjVmTUNtb1A4REl5YlZUNWE2eGNFeFRIMzdmYTdh?=
 =?utf-8?B?NFZwWTNvQkRtTFZMTjhXTXlDRDhvQ0FkR3pYQ3V3OUM4b1h0STQ5d2pPSTdT?=
 =?utf-8?B?Ym1xSDNlV2ppLzk0SXFETkZvSWdVWWxRanpRdW9qRUc4Z0pjK2s0ZXlhdWRZ?=
 =?utf-8?B?NTJOSS9sdnhiWjc1L2JMS3lOZHoxR3BHVGh3ZjNqbVM0a294SmhnNk5kcUcr?=
 =?utf-8?B?QWtNaGY4T2lTRjVsdkpvOGIwMWJLemRRQjBZTnVZM0Vlc0V6WHFpTVJJblJD?=
 =?utf-8?B?dkZpbTUxYk53QWZrVk9UQSt2QkJjMWFhN0kyVUdBV3pSS1B3cENtc2EwaFF2?=
 =?utf-8?B?YS9kRHRnTi9MT0szMWxrcmU3OSsyU0xUNC8weDdaUTdOYmVsUEZlY3B1K1A2?=
 =?utf-8?B?dG5nREk3bkl3T3lGUk9FTjV1aHh1c0tjZnd3WFp4aHhEOVM0MnVNcUZuZWRj?=
 =?utf-8?B?azBCU1ZXam9Nckh1Sm1UdFQzNWpiK29OWjNUZC9MOXdwNmlYenFlYVl0UFN6?=
 =?utf-8?B?b2NiS2VGS29pK1VOcGhSY1QrQ2E0K3R4YWtaR012Zi9RL1h0dVZ1bGVKOGxT?=
 =?utf-8?B?MWUwcHlZYlFjNVkvVjlING9PUXl1UWhDckUxOFlCSjhTZTUrVVJDOURSVDV3?=
 =?utf-8?B?MFRubmZKQlRGZ2Y2VTVLeDlEa2lhaGkrczRMMlNsSUV4MXc2SDdHbW9uT2Ns?=
 =?utf-8?B?UzRvb0laTy93bk5zS0ozVE1iTGF1Vk56YlpmUFcrZmpVVVBPTGNGQ2lFVFln?=
 =?utf-8?B?bGlmSkRIQmZzT3dyeHRoWU1QZDBRUlhjYlRsTFVWTnZtdjRJb1JXVE85b3Z6?=
 =?utf-8?B?aHNrbVBXbXo1dkhYcnpaOWVOMUVRZ24ycXVqbHV6R2Mwc3h2T3R4WE1CbzJN?=
 =?utf-8?B?aHhXZ1RMNWZsWi92OFBnNnFCTTF2WTRTbDBqMFFaRE5FU2pPaVdHaEdUQmcr?=
 =?utf-8?B?SVhpQm5iclZJdnZSTEQ2Mnl0V0hPWEh4Zk5CbjZJdHFqREJZNGhQeFc0YkVq?=
 =?utf-8?B?WWpMY2JEcDlBb2ZxRm9BYStMK0hFQU52aWVlbmt5bUh6UmxXYjhVR2FvMkdr?=
 =?utf-8?B?a1NCbjdoSmpJbkk0RUxIbkdFUzNBcTEyRWlRaHkzcTI2LzVuVXNLZE5XNktl?=
 =?utf-8?B?ODRtN1d6RDd5Um03LzgyMW91ZHU1N2FRUEVUYUhuNk5sRFdOUVBvODJOU0dP?=
 =?utf-8?B?cFQ4MzU5OXhsMWpldzdRT2xyNmVjcUtrSTFVckd4ZDFZYW0rNDJCUFo4QUYx?=
 =?utf-8?B?MDl0Rm01RFZROGRVMlhsRzBqRmhrRTZmNHZVZktjQ3MwU3RCSjUyN0xWcHI5?=
 =?utf-8?B?Q09UaEc2T0NxNE1TR2FEalRBOU1CTEk0TGdvazJFd0xTSm1CTUtjNW12NWFD?=
 =?utf-8?B?T2dwOTBPeFlLczRSSmJleldWZTlhKy9kb0NMbDllY3l5ejB5TGVVYmRrenF0?=
 =?utf-8?B?Qm1VWFd0ak9YZEozazNFRktmYldmaG1tYlBlSUtuOTlvNUx6REoweExadTZT?=
 =?utf-8?Q?ri0rFxt8vw5wtfeaf2hXf5YDA?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <3F556E23A398F64DBCB96EBB85E14C4D@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	iaOVnBrie1V5WAm6jg6pcf7QRBJozaMhriDJ/rqTowwcdSKF3AbrN4JDikBL6Li05XA3aEXENJ4zgGT6+nKMRRyZtvy+mjmVUbwuzpcxEEU7YbqKkC3c471JGK0rH+8s0ctGEdJQPG8DGNK5c1mQofektXc8ycjEmvPAnWrjudioTucxEH3T0PS4b4OX0yxqPEd5r3GCi5llpVnCOpc/Hm/edi1OOXy2+3QmvHLmzX29S8DR2fabM9cWCcPQLfqDFlWtF2S3rFBiSX+K305EPV2lL0xpvD+eZDJc4s7s5dJcLVrQ+hHnTgCqZ7LYQYjgCmvpR0aHJUaEgDhX0ATy3NxFJfSnCEU2I2g3K2w6lK0qSZv36AEFtRuNPhu41XfCU1+u9/7vOprST8N8I+BOZZiueTkjzYC0um9Wew+wBdu3wcV0nXJw/rRGJmqCkc+AKJgAobsl5ykLuTnSzvJCtM+Rmif5lwEigwyt69mIuaMNyp/BK52I+pdCV/HsE3XAGGoeMDvhCFWdifcae+nn/bbGwG1y3QX6eggw6/MgJJS1erx36oG998J+3GZwPOvQcWiypdOfg+S+i6cdnp1QI2tcAcwfMg4bMoOysJIJMw6QdqmcEYm90TTABucRUm/Ud02eU/JL8lMMq1E6RA9ibg==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7354c9aa-4894-4a9b-d12f-08dd40cf4ef9
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jan 2025 01:42:08.3551
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lIAE5zSm9zpepylxWIYzqX8wVP9Pa3hWOEqAt+MuNtjwtRfIkXLQyPnfAq5deU+Gq2C+T17NhhKEFD2JMfLTnA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB9503
X-Authority-Analysis: v=2.4 cv=Ros/LDmK c=1 sm=1 tr=0 ts=679ad8f9 cx=c_pps a=8EbXvwLXkpGsT4ql/pYRAw==:117 a=8EbXvwLXkpGsT4ql/pYRAw==:17 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdSt8ZQiCzkA:10 a=nEwiWwFL_bsA:10 a=qPHU084jO2kA:10 a=jIQo8A4GAAAA:8 a=VwQbUJbxAAAA:8 a=1XWaLZrsAAAA:8 a=KDMrWD0NOYdq95frwpQA:9 a=QEXdDO2ut3YA:10 a=Lf5xNeLK5dgiOs8hzIjU:22
X-Proofpoint-GUID: DA8lSiTqc-omqxfGYN5FxNSTBBn-utrB
X-Proofpoint-ORIG-GUID: DA8lSiTqc-omqxfGYN5FxNSTBBn-utrB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-30_01,2025-01-29_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 suspectscore=0 priorityscore=1501 bulkscore=0 clxscore=1015 adultscore=0
 lowpriorityscore=0 mlxscore=0 phishscore=0 spamscore=0 malwarescore=0
 mlxlogscore=959 impostorscore=0 classifier=spam authscore=0 adjust=0
 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2501300011

T24gV2VkLCBKYW4gMjksIDIwMjUsIEJhZGhyaSBKYWdhbiBTcmlkaGFyYW4gd3JvdGU6DQo+IE9u
IE1vbiwgSmFuIDI3LCAyMDI1IGF0IDY6NDTigK9QTSBUaGluaCBOZ3V5ZW4gPFRoaW5oLk5ndXll
bkBzeW5vcHN5cy5jb20+IHdyb3RlOg0KPiA+DQo+ID4gT24gRnJpLCBKYW4gMjQsIDIwMjUsIEJh
ZGhyaSBKYWdhbiBTcmlkaGFyYW4gd3JvdGU6DQo+ID4gPiBXaGlsZSBjb21taXQgZDMyNWExZGU0
OWQ2ICgidXNiOiBkd2MzOiBnYWRnZXQ6IFByZXZlbnQgbG9zaW5nIGV2ZW50cw0KPiA+ID4gaW4g
ZXZlbnQgY2FjaGUiKSBtYWtlcyBzdXJlIHRoYXQgdG9wIGhhbGYoVEgpIGRvZXMgbm90IGVuZCB1
cCBvdmVyd3JpdGluZw0KPiA+ID4gdGhlIGNhY2hlZCBldmVudHMgYmVmb3JlIHByb2Nlc3Npbmcg
dGhlbSB3aGVuIHRoZSBUSCBnZXRzIGludm9rZWQgbW9yZQ0KPiA+ID4gdGhhbiBvbmUgdGltZSwg
cmV0dXJuaW5nIElSUV9IQU5ETEVEIHJlc3VsdHMgaW4gb2NjYXNpb25hbCBpcnEgc3Rvcm0NCj4g
PiA+IHdoZXJlIHRoZSBUSCBob2dzIHRoZSBDUFUuIFRoZSBpcnEgc3Rvcm0gY2FuIGJlIHByZXZl
bnRlZCBpZg0KPiA+ID4gSVJRX1dBS0VfVEhSRUFEIGlzIHJldHVybmVkLg0KPiA+ID4NCj4gPiA+
IGZ0cmFjZSBldmVudCBzdHViIGR1cmluZyBkd2MzIGlycSBzdG9ybToNCj4gPiA+ICAgICBpcnEv
NTA0X2R3YzMtMTExMSAgKCAxMTExKSBbMDAwXSAuLi4uIDcwLjAwMDg2NjogaXJxX2hhbmRsZXJf
ZXhpdDogaXJxPTE0IHJldD1oYW5kbGVkDQo+ID4gPiAgICAgaXJxLzUwNF9kd2MzLTExMTEgICgg
MTExMSkgWzAwMF0gLi4uLiA3MC4wMDA4NzI6IGlycV9oYW5kbGVyX2VudHJ5OiBpcnE9NTA0IG5h
bWU9ZHdjMw0KPiA+ID4gICAgIGlycS81MDRfZHdjMy0xMTExICAoIDExMTEpIFswMDBdIC4uLi4g
NzAuMDAwODc0OiBpcnFfaGFuZGxlcl9leGl0OiBpcnE9NTA0IHJldD1oYW5kbGVkDQo+ID4gPiAg
ICAgaXJxLzUwNF9kd2MzLTExMTEgICggMTExMSkgWzAwMF0gLi4uLiA3MC4wMDA4ODE6IGlycV9o
YW5kbGVyX2VudHJ5OiBpcnE9NTA0IG5hbWU9ZHdjMw0KPiA+ID4gICAgIGlycS81MDRfZHdjMy0x
MTExICAoIDExMTEpIFswMDBdIC4uLi4gNzAuMDAwODgzOiBpcnFfaGFuZGxlcl9leGl0OiBpcnE9
NTA0IHJldD1oYW5kbGVkDQo+ID4gPiAgICAgaXJxLzUwNF9kd2MzLTExMTEgICggMTExMSkgWzAw
MF0gLi4uLiA3MC4wMDA4ODk6IGlycV9oYW5kbGVyX2VudHJ5OiBpcnE9NTA0IG5hbWU9ZHdjMw0K
PiA+ID4gICAgIGlycS81MDRfZHdjMy0xMTExICAoIDExMTEpIFswMDBdIC4uLi4gNzAuMDAwODky
OiBpcnFfaGFuZGxlcl9leGl0OiBpcnE9NTA0IHJldD1oYW5kbGVkDQo+ID4gPiAgICAgaXJxLzUw
NF9kd2MzLTExMTEgICggMTExMSkgWzAwMF0gLi4uLiA3MC4wMDA4OTg6IGlycV9oYW5kbGVyX2Vu
dHJ5OiBpcnE9NTA0IG5hbWU9ZHdjMw0KPiA+ID4gICAgIGlycS81MDRfZHdjMy0xMTExICAoIDEx
MTEpIFswMDBdIC4uLi4gNzAuMDAwOTAxOiBpcnFfaGFuZGxlcl9leGl0OiBpcnE9NTA0IHJldD1o
YW5kbGVkDQo+ID4gPiAgICAgaXJxLzUwNF9kd2MzLTExMTEgICggMTExMSkgWzAwMF0gLi4uLiA3
MC4wMDA5MDc6IGlycV9oYW5kbGVyX2VudHJ5OiBpcnE9NTA0IG5hbWU9ZHdjMw0KPiA+ID4gICAg
IGlycS81MDRfZHdjMy0xMTExICAoIDExMTEpIFswMDBdIC4uLi4gNzAuMDAwOTA5OiBpcnFfaGFu
ZGxlcl9leGl0OiBpcnE9NTA0IHJldD1oYW5kbGVkDQo+ID4gPiAgICAgaXJxLzUwNF9kd2MzLTEx
MTEgICggMTExMSkgWzAwMF0gLi4uLiA3MC4wMDA5MTU6IGlycV9oYW5kbGVyX2VudHJ5OiBpcnE9
NTA0IG5hbWU9ZHdjMw0KPiA+ID4gICAgIGlycS81MDRfZHdjMy0xMTExICAoIDExMTEpIFswMDBd
IC4uLi4gNzAuMDAwOTE4OiBpcnFfaGFuZGxlcl9leGl0OiBpcnE9NTA0IHJldD1oYW5kbGVkDQo+
ID4gPiAgICAgaXJxLzUwNF9kd2MzLTExMTEgICggMTExMSkgWzAwMF0gLi4uLiA3MC4wMDA5MjQ6
IGlycV9oYW5kbGVyX2VudHJ5OiBpcnE9NTA0IG5hbWU9ZHdjMw0KPiA+ID4gICAgIGlycS81MDRf
ZHdjMy0xMTExICAoIDExMTEpIFswMDBdIC4uLi4gNzAuMDAwOTI3OiBpcnFfaGFuZGxlcl9leGl0
OiBpcnE9NTA0IHJldD1oYW5kbGVkDQo+ID4gPiAgICAgaXJxLzUwNF9kd2MzLTExMTEgICggMTEx
MSkgWzAwMF0gLi4uLiA3MC4wMDA5MzM6IGlycV9oYW5kbGVyX2VudHJ5OiBpcnE9NTA0IG5hbWU9
ZHdjMw0KPiA+ID4gICAgIGlycS81MDRfZHdjMy0xMTExICAoIDExMTEpIFswMDBdIC4uLi4gNzAu
MDAwOTM1OiBpcnFfaGFuZGxlcl9leGl0OiBpcnE9NTA0IHJldD1oYW5kbGVkDQo+ID4gPiAgICAg
Li4uLg0KPiA+ID4NCj4gPiA+IENjOiBzdGFibGVAa2VybmVsLm9yZw0KPiA+ID4gRml4ZXM6IGQz
MjVhMWRlNDlkNiAoInVzYjogZHdjMzogZ2FkZ2V0OiBQcmV2ZW50IGxvc2luZyBldmVudHMgaW4g
ZXZlbnQgY2FjaGUiKQ0KPiA+DQo+ID4gSSBkb24ndCB0aGluayB0aGlzIHNob3VsZCBiZSBDYyB0
byBzdGFibGUsIGF0IGxlYXN0IG5vdCB0aGUgd2F5IGl0IGlzDQo+ID4gcmlnaHQgbm93Lg0KPiA+
DQo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBCYWRocmkgSmFnYW4gU3JpZGhhcmFuIDxiYWRocmlAZ29v
Z2xlLmNvbT4NCj4gPiA+IC0tLQ0KPiA+ID4gIGRyaXZlcnMvdXNiL2R3YzMvZ2FkZ2V0LmMgfCAy
ICstDQo+ID4gPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0p
DQo+ID4gPg0KPiA+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdXNiL2R3YzMvZ2FkZ2V0LmMgYi9k
cml2ZXJzL3VzYi9kd2MzL2dhZGdldC5jDQo+ID4gPiBpbmRleCBkMjdhZjY1ZWIwOGEuLjM3NmFi
NzVhZGM0ZSAxMDA2NDQNCj4gPiA+IC0tLSBhL2RyaXZlcnMvdXNiL2R3YzMvZ2FkZ2V0LmMNCj4g
PiA+ICsrKyBiL2RyaXZlcnMvdXNiL2R3YzMvZ2FkZ2V0LmMNCj4gPiA+IEBAIC00NTE5LDcgKzQ1
MTksNyBAQCBzdGF0aWMgaXJxcmV0dXJuX3QgZHdjM19jaGVja19ldmVudF9idWYoc3RydWN0IGR3
YzNfZXZlbnRfYnVmZmVyICpldnQpDQo+ID4gPiAgICAgICAgKiBsb3NpbmcgZXZlbnRzLg0KPiA+
ID4gICAgICAgICovDQo+ID4gPiAgICAgICBpZiAoZXZ0LT5mbGFncyAmIERXQzNfRVZFTlRfUEVO
RElORykNCj4gPiA+IC0gICAgICAgICAgICAgcmV0dXJuIElSUV9IQU5ETEVEOw0KPiA+ID4gKyAg
ICAgICAgICAgICByZXR1cm4gSVJRX1dBS0VfVEhSRUFEOw0KPiA+DQo+ID4gVGhpcyBsb29rcyBs
aWtlIGEgd29ya2Fyb3VuZCB0byB0aGUgaXNzdWUgd2UgaGF2ZS4gSGF2ZSB5b3UgdHJpZWQgdG8N
Cj4gPiBlbmFibGUgaW1vZCBpbnN0ZWFkPyBJdCdzIHRoZSBmZWF0dXJlIHRvIGhlbHAgYXZvaWQg
dGhlc2Uga2luZCBvZiBpc3N1ZS4NCj4gDQo+IEhpIFRoaW5oLA0KPiANCj4gVGhhbmtzIGZvciB0
aGUgZmVlZGJhY2sgISBZZXMsIHdlIGhhdmUgYmVlbiBleHBlcmltZW50aW5nIHdpdGggdGhlDQo+
IGludGVycnVwdCBtb2RlcmF0aW9uIGludGVydmFsIGFzIHdlbGwuDQo+IEhhdmUgZm9sbG93IHVw
IHF1ZXN0aW9ucyB0aG91Z2gsIHBsZWFzZSBiZWFyIHdpdGggbWUgIQ0KPiANCj4gMS4gR2l2ZW4g
dGhhdCB3aGVuIERXQzNfRVZFTlRfUEVORElORyAgaXMgc3RpbGwgc2V0LA0KPiBkd2MzX2NoZWNr
X2V2ZW50X2J1ZigpIGlzIHN0aWxsIHdhaXRpbmcgZm9yIHRoZSBwcmV2aW91cyBjYWNoZWQgZXZl
bnRzDQo+IHRvIGJlIHByb2Nlc3NlZCBieSB0aGUgZHdjM190aHJlYWRfaW50ZXJydXB0KCksIHdo
YXQncyB0aGUgcmVhc29uaW5nDQo+IGJlaGluZCByZXR1cm5pbmcgSVJRX0hBTkRMRUQgaGVyZSA/
IFNob3VsZG4ndCB3ZSBiZSByZXR1cm5pbmcNCj4gSVJRX1dBS0VfVEhSRUFEIGFueXdheXMgPw0K
DQpDdXJyZW50bHkgZHdjMyBpcyBpbXBsZW1lbnRlZCBzdWNoIHRoYXQgaXQgd2lsbCBub3QgcHJv
Y2VzcyBuZXcgZXZlbnRzDQp1bnRpbCB0aGUgQkggaXMgZG9uZSB3aXRoIGl0cyB3b3JrLiBUaGUg
RFdDM19FVkVOVF9QRU5ESU5HIGZsYWcNCmluZGljYXRlcyB3aGVuIHRoZSBldmVudHMgYXJlIHBy
b2Nlc3NlZC4gV2l0aCB0aGlzIGV4cGVjdGF0aW9uLCB3ZQ0Kc2hvdWxkIG5vdCBzY2hlZHVsZSB0
aGUgQkggYXMgdGhlIGV2ZW50cyBhcmUgc3RpbGwgYmVpbmcgaGFuZGxlZC4NCg0KSW4geW91ciBj
YXNlLCB0aGVyZSdzIGEgc21hbGwgd2luZG93IHdoZXJlIHRoZSBUSCBtYXkgYmUgc2NoZWR1bGVk
IGJ1dA0KdGhlIERXQzNfRVZFTlRfUEVORElORyBmbGFnIGlzIG5vdCBjbGVhcmVkIHlldC4gUmV0
dXJuaW5nDQpJUlFfV0FLRV9USFJFQUQgbWF5IHdvcmthcm91bmQgeW91ciBpc3N1ZSBiZWNhdXNl
IHRoZSBCSCBtYXkgYWxyZWFkeSBiZQ0KcnVubmluZyB3aGVuIERXQzNfRVZFTlRfUEVORElORyBp
cyBzZXQuIEknbSBub3Qgc3VyZSB3aGF0IG90aGVyIHNpZGUNCmVmZmVjdCB0aGlzIG1heSBoYXZl
IHNpbmNlIHdlJ3JlIGJyZWFraW5nIHRoaXMgZXhwZWN0YXRpb24uDQoNCldlIG1heSBlbmhhbmNl
IHRoZSBkd2MzIGhhbmRsaW5nIG9mIGV2ZW50IGZsb3cgaW4gdGhlIGZ1dHVyZSB0byBpbXByb3Zl
DQp0aGlzLiBCdXQgYXQgdGhlIG1vbWVudCwgd2Ugc2hvdWxkIG5vdCByZXR1cm4gSVJRX1dBS0Vf
VEhSRUFEIGhlcmUuDQoNCj4gDQo+IDIuIFdoZW4gaW50ZXJydXB0IG1vZGVyYXRpb24gaXMgZW5h
YmxlZCwgZG9lcyBERVZJQ0VfSU1PREMgc3RhcnQgdG8NCj4gZGVjcmVtZW50IGFzIHNvb24gYXMg
dGhlIGludGVycnVwdCBpcyBtYXNrZWQgKHdoZXJlIEkgZXhwZWN0IHRoYXQgdGhlDQo+IGludGVy
cnVwdCBsaW5lIGdldHMgZGUtYXNzZXJ0ZWQgYnkgdGhlIGNvbnRyb2xsZXIpIGluDQo+IGR3YzNf
Y2hlY2tfZXZlbnRfYnVmKCkgID8NCj4gDQo+IC8qIE1hc2sgaW50ZXJydXB0ICovDQo+IGR3YzNf
d3JpdGVsKGR3Yy0+cmVncywgRFdDM19HRVZOVFNJWigwKSwNCj4gICAgRFdDM19HRVZOVFNJWl9J
TlRNQVNLIHwgRFdDM19HRVZOVFNJWl9TSVpFKGV2dC0+bGVuZ3RoKSk7DQo+IA0KDQpUaGUgREVW
SUNFX0lNT0RDIGlzIGxvYWRlZCB3aXRoIERFVklDRV9JTU9ESSBhbmQgc3RhcnRzIHRvIGRlY3Jl
bWVudCBhcw0Kc29vbiBhcyB0aGUgaW50ZXJydXB0IGlzIGRlLWFzc2VydGVkIGZyb20gdGhlIGFz
c2VydGVkIHN0YXRlLCB3aGljaA0KaW5jbHVkZXMgd2hlbiB0aGUgaW50ZXJydXB0IGlzIG1hc2tl
ZC4gWW91IGJyb3VnaHQgdXAgYSBnb29kIHF1ZXN0aW9uDQpoZXJlLiBUaGUgSU1PRCBjb3VudCBt
YXkgYWxyZWFkeSBiZSAwIHdoZW4gd2UgZXhpdCB0aGUgQkguIENhbiB5b3UgdHJ5DQp0aGlzIGV4
cGVyaW1lbnQgdG8gdXBkYXRlIHRoZSBjb3VudCBhbmQgbGV0IG1lIGtub3cgaWYgaXQgaGVscHM6
DQoNCk5vdGU6IG5vdCB0ZXN0ZWQuDQoNCmRpZmYgLS1naXQgYS9kcml2ZXJzL3VzYi9kd2MzL2dh
ZGdldC5jIGIvZHJpdmVycy91c2IvZHdjMy9nYWRnZXQuYw0KaW5kZXggMGZlOTJjMGZiNTIwLi42
MmFhYWMzMWNhNjggMTAwNjQ0DQotLS0gYS9kcml2ZXJzL3VzYi9kd2MzL2dhZGdldC5jDQorKysg
Yi9kcml2ZXJzL3VzYi9kd2MzL2dhZGdldC5jDQpAQCAtNTczOSw3ICs1NzM5LDggQEAgc3RhdGlj
IGlycXJldHVybl90IGR3YzNfcHJvY2Vzc19ldmVudF9idWYoc3RydWN0IGR3YzNfZXZlbnRfYnVm
ZmVyICpldnQpDQogDQogICAgICAgIGlmIChkd2MtPmltb2RfaW50ZXJ2YWwpIHsNCiAgICAgICAg
ICAgICAgICBkd2MzX3dyaXRlbChkd2MtPnJlZ3MsIERXQzNfR0VWTlRDT1VOVCgwKSwgRFdDM19H
RVZOVENPVU5UX0VIQik7DQotICAgICAgICAgICAgICAgZHdjM193cml0ZWwoZHdjLT5yZWdzLCBE
V0MzX0RFVl9JTU9EKDApLCBkd2MtPmltb2RfaW50ZXJ2YWwpOw0KKyAgICAgICAgICAgICAgIGR3
YzNfd3JpdGVsKGR3Yy0+cmVncywgRFdDM19ERVZfSU1PRCgwKSwNCisgICAgICAgICAgICAgICAg
ICAgICAgICAgICAoZHdjLT5pbW9kX2ludGVydmFsIDw8IDE2KSB8IGR3Yy0+aW1vZF9pbnRlcnZh
bCk7DQogICAgICAgIH0NCiANCiAgICAgICAgLyogS2VlcCB0aGUgY2xlYXJpbmcgb2YgRFdDM19F
VkVOVF9QRU5ESU5HIGF0IHRoZSBlbmQgKi8NCg0KDQpUaGFua3MsDQpUaGluaA0K
