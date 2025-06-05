Received: from mx0a-00230701.pphosted.com (mx0a-00230701.pphosted.com [148.163.156.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B1EE1FDA;
	Thu,  5 Jun 2025 00:32:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.156.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749083580; cv=fail; b=rWj2THRSiVY0qacpMbqrui4hpv3rArUHtVGKcCL+eO9X8ar2pFdfow6l1PNdR0PCXPW3XQ1gGYe+dIwkNDmNWvnYjNnn/fLkBlm3pnerDSaeJjnv9CEv4Bf+2a76OgxiiD24DXV6h6qZutlihdbVvk8KD9YrFyHhjmckmD6kk+k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749083580; c=relaxed/simple;
	bh=gaboMplUbmndToDvrckqVg9nIFlh9BdUkSIvgxJxVxk=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=pxfAl6JwHffcpZW/sBgdHZuqA2IJQVl57R9JuE/ioKyfB7lfdCw6KYfkM3jZImohY1h8F6YpzO7KcmZ0TDWkhjsWACkLGYR4HpE0H5Q0Hj32QZj+5GXqcaJmF5xrlfinlpQZGE8UqpsvJOaWWms0YgKFgoUGxogOP8OyVEDJZuc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=Wv1AtdEs; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=NEx/vZmG; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=aXoZYy1c reason="signature verification failed"; arc=fail smtp.client-ip=148.163.156.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="Wv1AtdEs";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="NEx/vZmG";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="aXoZYy1c"
Received: from pps.filterd (m0098571.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 554Gv3Jt029855;
	Wed, 4 Jun 2025 17:32:53 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=gaboMplUbmndToDvrckqVg9nIFlh9BdUkSIvgxJxVxk=; b=
	Wv1AtdEs2j11AfZbruJrOfMZ2n0RLoTpJumcP938J9Akaf7VhreVwaRby3drsemF
	kXSLexd2IWkKt7Wi7XN6WA5owJJWxCpBjQeF0fSjiJ9MJjt18/W9GxgkuEQ84A0D
	+v+kmY5hz3vH6bFzRqTnaK40AMA56IQHAkyGgd10lAQovAbPlr1gFpklpBII7K/9
	+vR0muOXSftFGe758ZlDgi43Qa6e9NpuJ+O3xeFDOLJRZKFkNm5O8tIEfo7zoibJ
	Xu03MWnfYYf96/mic9m0IXdpSr5eqxweKvmHVQ1hBZf82ioUp8LR9H3BvI8dAyVS
	P1vITNUsYXdLW0fwDHqVXw==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 471g94my91-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 04 Jun 2025 17:32:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1749083573; bh=gaboMplUbmndToDvrckqVg9nIFlh9BdUkSIvgxJxVxk=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=NEx/vZmGauMfDi0S/IS+wrGgP2hPd0oncVE3e5W0RAsXWh+5rQ3ecLAk7UCYGjBAf
	 3UFO0XBXPIMkuJyZaaM6Njsmiku4/jGfW67+S7rAK1PqFmWA1NupE1dlYMzvaq3N2c
	 ZePTtBLvW/fM6G94uefyZJeOpj+iSh/J66RahoQx14Pt5UJ3Nl7ZuKrkjG1bm+X3u6
	 MdZ41ux4XsDvvKuE5KwGqolDBH/10at+r3/tImx6aMEPimjR5hXZR+jxsEBN8Z29gB
	 P1ccPouPuutcnx2AFM7Otspjk4g/JAfBPaivtcAwFDroTpSy28eSjH+1aOvYzRhZZd
	 Pw/QlRV34kDYQ==
Received: from mailhost.synopsys.com (badc-mailhost1.synopsys.com [10.192.0.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 2326A40114;
	Thu,  5 Jun 2025 00:32:53 +0000 (UTC)
Received: from o365relay-in.synopsys.com (us03-o365relay3.synopsys.com [10.4.161.139])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id EA7B9A0104;
	Thu,  5 Jun 2025 00:32:51 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=aXoZYy1c;
	dkim-atps=neutral
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2168.outbound.protection.outlook.com [104.47.57.168])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 09554401CC;
	Thu,  5 Jun 2025 00:32:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SuB9pNKn7X9QzuizkU6C2lPzfr+uMckZb1U6RVgET2+47ibf0+dCQ7uiAMJ06MOFVuaGJDP/y+mPgt0ERRTiy7/VLOXZNqfa1Fj0bMDZcfFDRkoA8QgAUQ0io1/35qdd3RSyizR/mrrkeefYCIe8zJ6u0r0pjmxDAbkNwYbdRmMRI4IffJRYW6c1iEoJoOlYehhKViu1eA0Gbr+Yx2kiq2PZMQaxeko4waJ5AS16xJ0tz/DJ8dOYpsIoqtD58ZLU9Mw6oKIDiTmBLWg65IrxDcafhI5Fn7dYjntor7JzIDbuQ+lxHmKN5FEId4/ylT4uLO2rLNXBWcF3akfZUWC54Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gaboMplUbmndToDvrckqVg9nIFlh9BdUkSIvgxJxVxk=;
 b=Hkq0keIZZCDnFLUjdpX/kxnLLgTqCdvmLFQz0Gg+LsEIWVtdzESHur19rZ0uOiDxWEVa5zDsE5RwdHpaWsLvwO/Y0RK6eIp59Gq5H9LYb6DhPRT3of8UM4J6HF5muUPIoKLP8OHoEYBhaEyLNUh+0hH++5oSlO44U3qRIn55DFoNEW+15c/jCvmKQyLNi96sIbpqJqB9JQhKtOC8Q6I4eSCFKbyp+3Hj1ZsSJDouIQilOxAl16syOUBEnvebRWIj45aRIsgQhOYdHqj7x91tQIlXkKf+3yLhX8/wSQuhWc29z1t9lhizqhMSq06ojRePpHJIJ+Pc0wF4eKqvDZnqYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gaboMplUbmndToDvrckqVg9nIFlh9BdUkSIvgxJxVxk=;
 b=aXoZYy1cB+6f2JQ2n54ImgK69P5KxEgHkhUmyKHr+gs6yQSoH/9HFc0BJYycYhK08Z9gIOIEu91Bnoy1AKcrUh9jDBGk2A0on/Y8aqyYaFVS3WI1Wq8ppY2H4mwBUquADDfq3y2DzRr9+BpbqbnK85smBXMUn24pa9/fChHHU+I=
Received: from LV2PR12MB5990.namprd12.prod.outlook.com (2603:10b6:408:170::16)
 by SA1PR12MB7344.namprd12.prod.outlook.com (2603:10b6:806:2b7::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.30; Thu, 5 Jun
 2025 00:32:45 +0000
Received: from LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8]) by LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8%6]) with mapi id 15.20.8792.033; Thu, 5 Jun 2025
 00:32:44 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
CC: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "michal.simek@amd.com" <michal.simek@amd.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "git@amd.com" <git@amd.com>
Subject: Re: [PATCH] usb: dwc3: xilinx: set coherency mode for AMD versal
 adaptive platform
Thread-Topic: [PATCH] usb: dwc3: xilinx: set coherency mode for AMD versal
 adaptive platform
Thread-Index: AQHb1Ljd8a3zyu17sE6FRmCUVuhWPbPzuT4A
Date: Thu, 5 Jun 2025 00:32:44 +0000
Message-ID: <20250605003240.f66u3jf4r4ft2qtr@synopsys.com>
References: <1748976818-710088-1-git-send-email-radhey.shyam.pandey@amd.com>
In-Reply-To: <1748976818-710088-1-git-send-email-radhey.shyam.pandey@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR12MB5990:EE_|SA1PR12MB7344:EE_
x-ms-office365-filtering-correlation-id: d57ae962-be29-46b9-7f00-08dda3c87d27
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?T2twWmhCNU5zSDhPUjh6ZjBPa1VROXpreHRkOWJsV0REZWRCMGc1UVRGMzly?=
 =?utf-8?B?M2N6MzJtZmNqYnM2VXQzS0pqMGt2Vk1VT3RzL2piTVBwUWRzQkpaT3h5bUhP?=
 =?utf-8?B?R3kxYlJiRnF1Z3IveHNmaGNzWmNIQnNTY0twQnNwSEpJNWpBZHY0d1hBSDV1?=
 =?utf-8?B?NWI3azYxbFhTWkdIRG81TnhTeEhOVVBpQTNnQzNUV3JvRmVFZDg0RVNSVyty?=
 =?utf-8?B?QXpLOU9UclRkZGlKOHpKN1d2Z3JNQmNhOFBYeHhJa2RlTDhwQ25abGdiWkE3?=
 =?utf-8?B?YXdFN1FnYzYreFR1bk1DTExEK0YwSVVtNThUV2NwTlhWNFRJSTZOSWxSaURC?=
 =?utf-8?B?Wjc5OXJaVVQxcjBLakpJSlE1S3BGclhIendxd0tvZVlmS0s1NmFuc3hFdlBm?=
 =?utf-8?B?cGpxNUZtTmU1cVdDMTNPbEtmZzMrbWNyQllwUjZhbTd1eFZ4azJWcEZOc20w?=
 =?utf-8?B?UXJBNUcrMy9QOHZ4ZzhnQnpKTDNUQytFanpJWmZSclJIbExGWUJ0UENWQURD?=
 =?utf-8?B?VnRyajlPL3pKa3BXQ3lZVVBEMGE3S3hPa3lFUjRwaW0ra0FoODhaSzZGR3R1?=
 =?utf-8?B?THhCWXJBT0xQZjlLWG9GNkZvbWpxWlZqVjhBZ3J6b1krYzRTaFZjd2ozR3l6?=
 =?utf-8?B?YnlWaXkzYXdKWnFITmhEN0RRY0dnb1h1M1paQjdEK2dmdEZ1a0hLRTMrUEM1?=
 =?utf-8?B?Wm45eC9RcUlMWjJjalBxNmxwbXJaM2RIcjBnNFFqMzlkOFNia1FadVlZOUxn?=
 =?utf-8?B?NndiS0l4Q3M1dnQ3V1VBWHJOdGU3b3lvZ0I4bUdiRGNMWTkxaTJQZ1Biei9t?=
 =?utf-8?B?dmo4L2tMeUprMlpUK0RDbm9tbDRySW1VOXdPcFhmVFZwVlpEUTBlWTRpalRP?=
 =?utf-8?B?ZnJ6K052YU1vY3lURHhlUU41cFJtditrOXNGQ05ESzMvM1g5aTB6TG9VOGtZ?=
 =?utf-8?B?WlJEUVpreEVaNDZtUXpXQW9SaGk1VWFDcVhTQ0I4eHhpMlowSVloQ2swQzZK?=
 =?utf-8?B?eU1saElhRlRKdzFrRnpqaXA5OGZIODJlUEd6MW9LWFFUeTI5aW1qNlc2RTlP?=
 =?utf-8?B?RE1sVnB6V0JEWjVJQ2RFYXZSb0xtY0RtWFQrNTJnSDF3eGh2NnBsd0llVzkz?=
 =?utf-8?B?c3lSSzNoV3YzVStFdlRVenJTZHFtZFlvNWpzcHd3YmFsV3FjRlk1bDEyTURI?=
 =?utf-8?B?NkZIM3NEbE1YRGhjUzdrc2RpTEU1cmJGWVVOQmdGTnh2VGpmSEkrazZHQk5I?=
 =?utf-8?B?cWdkTE5acHpYRTRsNWxvUWlkemt3T3k1RUVBcUplZnZmV3pkMVd5bXlMSEFi?=
 =?utf-8?B?NlVOamxEU3ZHcHQrdHBnOUxXT1IvbXhDTW84V1RNMHhGdVZabTJ3UHVkODRs?=
 =?utf-8?B?M2RNU3V5NHBPQktUT242SXJOV1lLTkpaN29admtweXUzWjJoUjk2aWNIZ1dJ?=
 =?utf-8?B?eXRRNmRuUU9jNXdWM0FyTkNiclRpZjdjMi80VE80eW5oWWN3U3E3WS94OVk4?=
 =?utf-8?B?Z1FDS2RSUllkNXcxa1N1Yk13Sjc0d0JDV2dTdU9iZ3RjN2tQY0N2K2J3WGVK?=
 =?utf-8?B?ZlNZVnZ6WkpJVnRxNnY3aTFoZVh0dGJqUFJaOHZMWnhHRHVpN2RpYXZlSnkr?=
 =?utf-8?B?dHkyV1lmcmtoRW1TMFJENThac1NGemhtZG0ybk9Lblg2RGRqUUxwWU1uQllr?=
 =?utf-8?B?OXJ4aXlzQnRZTWYxdENxNzZlOHJYM2VtY3RXNkwrMHJ2M2o1bXdHZXUrRDdR?=
 =?utf-8?B?Zlc1SlpmRm1hcGZwcW9JSkV6QnRHVDh6N1RuOFNBMzJCTG81NjlseDlRWFl1?=
 =?utf-8?B?OXBMWXB6TFowY0lDUjcxa1lEMUxpNnJGQkFFZXEwaXNNQjJmU1ZsQzJic1E4?=
 =?utf-8?B?UFpMU3FjNTJ5MXoyZ1lobk1QVnhOakFUVlAya3B3TU5zUjBRWFdMenpjanV4?=
 =?utf-8?B?dDBScThSNmdxaUxneFVBVzAzSVMrYy9vVFR4UThuUjJqVU1ITlZnc0VNN1Nx?=
 =?utf-8?Q?GVmcS6C5bI3gVy22PbWNI/iuBM0WGE=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?OTVoVUVUU0dEamxOUVRlRFhQSStCVVBNTjBaSlgyTFJId0k3TGY5eEZRdGpV?=
 =?utf-8?B?RCtiMGhxY1ROb0l4RFc1SjFSTGV3b1ZhVEpmV1hJdUt6cDdwemlZZTFLUkRC?=
 =?utf-8?B?cTRrci9keC9yTlBkOElMYUVleXFnWERYdmcvVElmc1FraWp5amFwV3J6amRS?=
 =?utf-8?B?L0VjRzJPWjZ1SjNlTXBub3VjZWtYR3cwVnk3TDFVUlhEQWF4bENzTnBYNTVn?=
 =?utf-8?B?aWJUc0ZwVUZoQ1dhMmlxYzIzQmloWFNuTEdsVDNVMnVzSElrVkVPMHRIN0hu?=
 =?utf-8?B?NTFjUDNsNmk5aUgwMG9PNkpxV3RKcmdSNWJ3TWVuWlhpSTNSaXZCa3JtVFJu?=
 =?utf-8?B?ZTM0VFpVU0o2eFNON3lXcmE0S3FFd29GYnhFSFJreWxiWlBqbytNc1lZYWox?=
 =?utf-8?B?YjMvQm1mNXFiNHQ1OTNrNWVRSjBJZTdCTHdReFZvcmxIUHpvZ0w4a0pZWUVJ?=
 =?utf-8?B?K1RlL1d1elZRa013cHFtK3F3UlJSM21oYU1QaU02NVF0NXoxeHdXaCthQ0dI?=
 =?utf-8?B?eFRyWnpqcWFyMENOOENkOVhVSm1OZ2MvdEVPalVoSVJKWU1rSFd6Vmk1VDFO?=
 =?utf-8?B?U05nQTdGV0FpenhWc0lQQ0ZjL3pWN2xRQ0dlbjdrMnlSNGw1MTFmcFMwVUNW?=
 =?utf-8?B?K0NoVDdmZmV0R3RnbDhGN1ZDdi84Ulg1WGc1TjB5aE15TUtDWSszTmpKWHIv?=
 =?utf-8?B?Q2tqdlpxZkdkbU1Ubmh0WWx1ZjZOVTVjTDJrTWo2eGNuc0RSV3MxV21WSXNt?=
 =?utf-8?B?S0dpU21tWVZydzlZOUxQYnA3N2ZnSmQxZlBEa0xqK3ljMzU3WHMvYlZYSUds?=
 =?utf-8?B?UlBOVFpTdDRGNEYzQU9ldkMvMkF0SkVCamxsak42aWRONEYyY3JNazNRM3pa?=
 =?utf-8?B?T0JiWkxrUHhJTHBWSjY1eFYyUlF4cUpPQnB6U1FVTEdQYVE1aE1qc3RnVTFz?=
 =?utf-8?B?Z0JLZjVxaHd2L3VUekF2YzdQZWw3MnVlWis2RllXWXZwV1VPQ3BYVlF1OHQ2?=
 =?utf-8?B?ZDNPOU83SEcxMjhHUFZBMGJONURxUDVwWTB3WkFaei91U0YzcUlUSlVES2dK?=
 =?utf-8?B?ajZJRUZwcWNBaHl6ZkhYWXN3Vyt5NStLdXRiaHlQNUNHZGRGL1RGaWcrNG5m?=
 =?utf-8?B?VjhiMGZNYmc2NkxVUW5WOXlWZWl1NGhHaURuRGxoeldOV2g0MzBpcE1zMENq?=
 =?utf-8?B?d2laOWh0b2hMQTh4SGdOT2YwOHhnMVl0RlNpUkp6Rk5UQzNpUGtFVUx1RUtj?=
 =?utf-8?B?MkFFWUs3ZnIxSHVXbHZMaDJlazdndlQrMDBLSGVjTERWVnFtRzRvbVBPWXZU?=
 =?utf-8?B?MmxaTG11RnpJWEoxQWRGeG55MGRlbjlaZmRZOEg3RTZVT3BPUk1xZVU4MFo2?=
 =?utf-8?B?djZ6cHVRcU5nM2Y0TjRMNENyeDJLUUQ0ZS80bThrSldVWE5LS2RjckpOWlVB?=
 =?utf-8?B?dDB3QU1IUTJVcFBTcjc3TVkwNlZwN3FyS0tya2kremhORWEvUjVpbWNEYTlV?=
 =?utf-8?B?YVFoM3hxdFFtOTdlckE0ZGZWOW0rekVpWVJjV0xCV1BKVnFac051UnoxeUVn?=
 =?utf-8?B?YWlWYmZKUitFalMyZks2ZDFyRnJ0N3h4NWM3MXZJWkUyeFpsSVVPRCtLQTV4?=
 =?utf-8?B?OFFpeWgwMGlWNmUwRFBVZ2I2dUZoT01xN1oyNlJmN1MxQ00veXJLSFFkQ0Yv?=
 =?utf-8?B?RW9MNm1vTUFpWjF5VERXZWsxZUdwNVIraFErU2VHOTVLUW40ZC9ZQVBvSEJX?=
 =?utf-8?B?aTJwTkVjV2d3OTRLR1hnT3BQOTFUOWt1V1pvUEhxV0Q5Yko1WjkxaWJmOWdN?=
 =?utf-8?B?RkFpQ1R4QngyK0dtZ0RjcjEyaWl6allVUkwxOTBkTVJrdzFkUkduR2FlcExx?=
 =?utf-8?B?VXVyVk5rQ0FkUlNQQlBUUWg4ZWNQbzQ1RWg4MEh6YytKMi9mSzNBRlNwSU0z?=
 =?utf-8?B?QVB5WG5XNHU5RGNGWXFaUmFvanFlclJQUGlzdGhnRHNDL3ZHY2xzZE1KU2lm?=
 =?utf-8?B?SkZQcWJwbncvT3hZRFZ4YVRVMEJpd1NRakJkOTJJNThTdmVLOXBoV3pBZnhM?=
 =?utf-8?B?YlRtbE4rQSs2SVc1QmNQZStqWUZESW9oSm1BbitlM2ZRS3BScXY1Z2xQUlNh?=
 =?utf-8?Q?Jd3iqGqtlZiNIhmeHEgFi6B/j?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <496C7525A9F7E44CABD5E4B288BFD79F@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	Gb+hpfprLODHMQdUbupLjssx2uhKTIOXrLMFGvu7ejAy4V422MOxU+c/YRloOmqT+mIsecJvkBCMwmTx4PYQpenPiII0t383h1XsBt6TgB0CAUim33U6nPJM+CVCrF//bCJhrBnqyKw903SQ0BG7TxgQu2xRr7JT2oIP2OP2sSo4XNzjzUuVylZxfOhsjXwWZURVDgCPACDHMHPAoWZ3+yOWQZUYnVghtu2gPHluGYqpvNQi9oSmQRXpCEqgXcfOgPWFqH3RTsULfRHp2A806k+u9bL9RnWMjM0CaTs3DvtHjeRiftVGXMJUoHxIYvcX9lG9o/sZtEuoZBkGjA+Y/lkJ49rRm2njM3SoGA90WkmjMDuONKZNqhYf+yMK4gxP0TN0aPFO+JozsOIkRNHbnILTYTOuQgCGUz6U+1uC61swTQOiubILCaxDJfLAU2nNO1zey+0i/AzUaLlktTdHf3ncVMWPLwPhKl9IAS0Z0DbRZ3QLE81B1YQ3M2NjDjRAfw3g53kCtTmLwokQ2+4H0Kp3pl3eUTJL5hLiQHTz65ZNQ1kusXwRqVfZh8aq/uyrXYtdB7SsAREfxeG3dcbgpiZbnxfBkS1jgRQi4YqtLEAkA5FWn7/PFKE8b99i+5N61moW67HCzU47e/YWMKqHjg==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d57ae962-be29-46b9-7f00-08dda3c87d27
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Jun 2025 00:32:44.4500
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: f5eNSD9kJohbBSNeZAPe9Rbi0bTNWkngni5Mq5hE3nMYvk+m3Y0QhtbH7dXU+7n/o6ItWUyL65Ek6j5tOd4eBg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7344
X-Proofpoint-GUID: rIEfo8i9-v_3O8Uli_OMKPROAAEsYgH-
X-Proofpoint-ORIG-GUID: rIEfo8i9-v_3O8Uli_OMKPROAAEsYgH-
X-Authority-Analysis: v=2.4 cv=a4Yw9VSF c=1 sm=1 tr=0 ts=6840e5b5 cx=c_pps
 a=8EbXvwLXkpGsT4ql/pYRAw==:117 a=8EbXvwLXkpGsT4ql/pYRAw==:17
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6IFa9wvqVegA:10 a=qPHU084jO2kA:10 a=zd2uoN0lAAAA:8 a=jIQo8A4GAAAA:8
 a=I6jb1Ebjir4p6W1hDLsA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA1MDAwNCBTYWx0ZWRfX1N2PFArfVRRM
 LzFIxPC0DjtHlHZqoPmVBuNBHnLXYwI9AF2xMJMRVHNVilw5eL1ni4dPS9cXiXErjU9jQy06D7k
 9Q7QD3iRK4aTh5NBXZLtXq3ANOSGYCA4rJ1nSV7WEWBC8o9xQOYfDE4MQGyFZu9AceOGWoaS79L
 KD6lTOsfGPmKiZppFCyrSVkn0F8y3kj/DWsKfH5xHnqvwqzI2Y1U9m/eEXib/tLRFt7xnHdOC4R
 W9U8fKOkcxTxWB0cYWQdJ7puupVmKQFOt8e5dU4KLNUNevtd6/gkvVDOH44WLPLlRDpzeGPj/Vl
 ovGuMIwwFzIRtz6nErLoblxGOrJDQmymqw+JWD+0fu5fhUqFFWBRt9NMKmJnewdaBZ1N6GWCbMm
 pUgAf9sAu+c8B+UCDpru6ieqeowzxV+HobHYde3LiprgDOmHqUt23SV+qf6yQsqfX4Egtldz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-04_05,2025-06-03_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0 priorityscore=1501 phishscore=0
 impostorscore=0 clxscore=1015 lowpriorityscore=0 spamscore=0 adultscore=0
 malwarescore=0 mlxscore=0 suspectscore=0 mlxlogscore=996 bulkscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2505280000 definitions=main-2506050004

T24gV2VkLCBKdW4gMDQsIDIwMjUsIFJhZGhleSBTaHlhbSBQYW5kZXkgd3JvdGU6DQo+IElmIGRl
dmljZSBpcyBjb2hlcmVudCBvciBpZiBETUEgKGRpcmVjdCBtZW1vcnkgYWNjZXNzKSBpcyB0cmFu
c2xhdGVkIGJ5DQo+IGFuIElPTU1VIHRoZW4gcHJvZ3JhbSBVU0IyLjAgSVAgdG8gcm91dGUgdHJh
bnNhY3Rpb25zIHRocm91Z2ggdGhlIENDSSBmb3INCj4gY29oZXJlbmN5IGV2ZW4gaWYgdGhlIHRh
cmdldCBvZiB0cmFuc2FjdGlvbiBpcyBpbiBsb3cgcG93ZXIgZG9tYWluIChMUEQpLg0KPiANCj4g
U2lnbmVkLW9mZi1ieTogUmFkaGV5IFNoeWFtIFBhbmRleSA8cmFkaGV5LnNoeWFtLnBhbmRleUBh
bWQuY29tPg0KPiAtLS0NCj4gIGRyaXZlcnMvdXNiL2R3YzMvZHdjMy14aWxpbnguYyB8IDM0ICsr
KysrKysrKysrKysrKysrKysrKystLS0tLS0tLS0tLS0NCj4gIDEgZmlsZSBjaGFuZ2VkLCAyMiBp
bnNlcnRpb25zKCspLCAxMiBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L3VzYi9kd2MzL2R3YzMteGlsaW54LmMgYi9kcml2ZXJzL3VzYi9kd2MzL2R3YzMteGlsaW54LmMN
Cj4gaW5kZXggNGNhN2Y2MjQwZDA3Li4wMGU2MTNjNGQ4YzAgMTAwNjQ0DQo+IC0tLSBhL2RyaXZl
cnMvdXNiL2R3YzMvZHdjMy14aWxpbnguYw0KPiArKysgYi9kcml2ZXJzL3VzYi9kd2MzL2R3YzMt
eGlsaW54LmMNCj4gQEAgLTMyLDYgKzMyLDkgQEANCj4gICNkZWZpbmUgWExOWF9VU0JfVFJBRkZJ
Q19ST1VURV9DT05GSUcJCTB4MDA1Qw0KPiAgI2RlZmluZSBYTE5YX1VTQl9UUkFGRklDX1JPVVRF
X0ZQRAkJMHgxDQo+ICANCj4gKy8qIFVTQiAyLjAgSVAgUmVnaXN0ZXIgKi8NCj4gKyNkZWZpbmUg
WExOWF9VU0IyX1RSQUZGSUNfUk9VVEVfQ09ORklHCQkweDAwNDQNCj4gKw0KPiAgI2RlZmluZSBY
TE5YX1VTQl9GUERfUElQRV9DTEsJCQkweDdjDQo+ICAjZGVmaW5lIFBJUEVfQ0xLX0RFU0VMRUNU
CQkJMQ0KPiAgI2RlZmluZSBQSVBFX0NMS19TRUxFQ1QJCQkJMA0KPiBAQCAtNjYsNiArNjksMjMg
QEAgc3RhdGljIHZvaWQgZHdjM194bG54X21hc2tfcGh5X3JzdChzdHJ1Y3QgZHdjM194bG54ICpw
cml2X2RhdGEsIGJvb2wgbWFzaykNCj4gIAl3cml0ZWwocmVnLCBwcml2X2RhdGEtPnJlZ3MgKyBY
TE5YX1VTQl9QSFlfUlNUX0VOKTsNCj4gIH0NCj4gIA0KPiArc3RhdGljIHZvaWQgZHdjM194bG54
X3NldF9jb2hlcmVuY3koc3RydWN0IGR3YzNfeGxueCAqcHJpdl9kYXRhLCB1MzIgY29oZXJlbmN5
X29mZnNldCkNCj4gK3sNCj4gKwlzdHJ1Y3QgZGV2aWNlCQkqZGV2ID0gcHJpdl9kYXRhLT5kZXY7
DQo+ICsJdTMyCQkJcmVnOw0KPiArDQo+ICsJLyoNCj4gKwkgKiBUaGlzIHJvdXRlcyB0aGUgVVNC
IERNQSB0cmFmZmljIHRvIGdvIHRocm91Z2ggRlBEIHBhdGggaW5zdGVhZA0KPiArCSAqIG9mIHJl
YWNoaW5nIEREUiBkaXJlY3RseS4gVGhpcyB0cmFmZmljIHJvdXRpbmcgaXMgbmVlZGVkIHRvDQo+
ICsJICogbWFrZSBTTU1VIGFuZCBDQ0kgd29yayB3aXRoIFVTQiBETUEuDQo+ICsJICovDQo+ICsJ
aWYgKG9mX2RtYV9pc19jb2hlcmVudChkZXYtPm9mX25vZGUpIHx8IGRldmljZV9pb21tdV9tYXBw
ZWQoZGV2KSkgew0KPiArCQlyZWcgPSByZWFkbChwcml2X2RhdGEtPnJlZ3MgKyBjb2hlcmVuY3lf
b2Zmc2V0KTsNCj4gKwkJcmVnIHw9IFhMTlhfVVNCX1RSQUZGSUNfUk9VVEVfRlBEOw0KPiArCQl3
cml0ZWwocmVnLCBwcml2X2RhdGEtPnJlZ3MgKyBjb2hlcmVuY3lfb2Zmc2V0KTsNCj4gKwl9DQo+
ICt9DQo+ICsNCj4gIHN0YXRpYyBpbnQgZHdjM194bG54X2luaXRfdmVyc2FsKHN0cnVjdCBkd2Mz
X3hsbnggKnByaXZfZGF0YSkNCj4gIHsNCj4gIAlzdHJ1Y3QgZGV2aWNlCQkqZGV2ID0gcHJpdl9k
YXRhLT5kZXY7DQo+IEBAIC05Miw2ICsxMTIsNyBAQCBzdGF0aWMgaW50IGR3YzNfeGxueF9pbml0
X3ZlcnNhbChzdHJ1Y3QgZHdjM194bG54ICpwcml2X2RhdGEpDQo+ICAJfQ0KPiAgDQo+ICAJZHdj
M194bG54X21hc2tfcGh5X3JzdChwcml2X2RhdGEsIHRydWUpOw0KPiArCWR3YzNfeGxueF9zZXRf
Y29oZXJlbmN5KHByaXZfZGF0YSwgWExOWF9VU0IyX1RSQUZGSUNfUk9VVEVfQ09ORklHKTsNCj4g
IA0KPiAgCXJldHVybiAwOw0KPiAgfQ0KPiBAQCAtMTAyLDcgKzEyMyw2IEBAIHN0YXRpYyBpbnQg
ZHdjM194bG54X2luaXRfenlucW1wKHN0cnVjdCBkd2MzX3hsbnggKnByaXZfZGF0YSkNCj4gIAlz
dHJ1Y3QgcmVzZXRfY29udHJvbAkqY3JzdCwgKmhpYnJzdCwgKmFwYnJzdDsNCj4gIAlzdHJ1Y3Qg
Z3Bpb19kZXNjCSpyZXNldF9ncGlvOw0KPiAgCWludAkJCXJldCA9IDA7DQo+IC0JdTMyCQkJcmVn
Ow0KPiAgDQo+ICAJcHJpdl9kYXRhLT51c2IzX3BoeSA9IGRldm1fcGh5X29wdGlvbmFsX2dldChk
ZXYsICJ1c2IzLXBoeSIpOw0KPiAgCWlmIChJU19FUlIocHJpdl9kYXRhLT51c2IzX3BoeSkpIHsN
Cj4gQEAgLTIxOSwxNyArMjM5LDcgQEAgc3RhdGljIGludCBkd2MzX3hsbnhfaW5pdF96eW5xbXAo
c3RydWN0IGR3YzNfeGxueCAqcHJpdl9kYXRhKQ0KPiAgCQl1c2xlZXBfcmFuZ2UoNTAwMCwgMTAw
MDApOw0KPiAgCX0NCj4gIA0KPiAtCS8qDQo+IC0JICogVGhpcyByb3V0ZXMgdGhlIFVTQiBETUEg
dHJhZmZpYyB0byBnbyB0aHJvdWdoIEZQRCBwYXRoIGluc3RlYWQNCj4gLQkgKiBvZiByZWFjaGlu
ZyBERFIgZGlyZWN0bHkuIFRoaXMgdHJhZmZpYyByb3V0aW5nIGlzIG5lZWRlZCB0bw0KPiAtCSAq
IG1ha2UgU01NVSBhbmQgQ0NJIHdvcmsgd2l0aCBVU0IgRE1BLg0KPiAtCSAqLw0KPiAtCWlmIChv
Zl9kbWFfaXNfY29oZXJlbnQoZGV2LT5vZl9ub2RlKSB8fCBkZXZpY2VfaW9tbXVfbWFwcGVkKGRl
dikpIHsNCj4gLQkJcmVnID0gcmVhZGwocHJpdl9kYXRhLT5yZWdzICsgWExOWF9VU0JfVFJBRkZJ
Q19ST1VURV9DT05GSUcpOw0KPiAtCQlyZWcgfD0gWExOWF9VU0JfVFJBRkZJQ19ST1VURV9GUEQ7
DQo+IC0JCXdyaXRlbChyZWcsIHByaXZfZGF0YS0+cmVncyArIFhMTlhfVVNCX1RSQUZGSUNfUk9V
VEVfQ09ORklHKTsNCj4gLQl9DQo+IC0NCj4gKwlkd2MzX3hsbnhfc2V0X2NvaGVyZW5jeShwcml2
X2RhdGEsIFhMTlhfVVNCX1RSQUZGSUNfUk9VVEVfQ09ORklHKTsNCj4gIGVycjoNCj4gIAlyZXR1
cm4gcmV0Ow0KPiAgfQ0KPiANCj4gYmFzZS1jb21taXQ6IGEwYmVhOWUzOTAzNWVkYzU2YTk5NDYz
MGU2MDQ4YzhhMTkxYTk5ZDgNCj4gLS0gDQo+IDIuMzQuMQ0KPiANCg0KQWNrZWQtYnk6IFRoaW5o
IE5ndXllbiA8VGhpbmguTmd1eWVuQHN5bm9wc3lzLmNvbT4NCg0KQlIsDQpUaGluaA==
