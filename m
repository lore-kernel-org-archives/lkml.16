Received: from mx0a-00230701.pphosted.com (mx0a-00230701.pphosted.com [148.163.156.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E0CD244196;
	Tue, 22 Apr 2025 22:11:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.156.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745359912; cv=fail; b=ZdhzLYGfxZ66mpxODapFuAb/FX5/Mc5kaqKj2xPM5BLKmPC2Xi2JRWE5fbudufUAEK+cfn90gnZkBviEp7A6RCjhbtDe3s8MBouhX4mMM2suzJ8SF5fOt3inLEJa6yfT5tEt6F4SNTTeQ6VFNNlm7MeOQYLhmWqJ8c/YcMlM5zw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745359912; c=relaxed/simple;
	bh=vLaImqiDGlMZbD5rSB+xWy9A8pawDBn7FAoLiJ1dR/c=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=feziSS11BEB2j4coFh/mF/Xfl5qpPweXQxEB3eSns0SpFnn/0m0Px3OIOnQOD1EnFlKPVlM57jso4w4V1RWJYr3HDjAi5kgTO4rAww8gBQz0W3z5hQB6vMb5xk6IOFemanuHrtqqNGGKNJMEWZseogGUwmIYUyDc/c1A2S0UUQ8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=DQ7e56Uu; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=d+LK6ud9; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=THQF2b4z reason="signature verification failed"; arc=fail smtp.client-ip=148.163.156.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="DQ7e56Uu";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="d+LK6ud9";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="THQF2b4z"
Received: from pps.filterd (m0297266.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53MKqE61026886;
	Tue, 22 Apr 2025 15:11:09 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=vLaImqiDGlMZbD5rSB+xWy9A8pawDBn7FAoLiJ1dR/c=; b=
	DQ7e56Uuf7uRigtRxWdJSuqMQfxnbcT04WSK2vGW6v5EtqjgeXZ5/CEglgT+gdUF
	FOlF8KmXFpo7wc4itGo1NmD3+z6LPFRalR8ulZv4v4pEEb1a4Heu02BPDAcIm6PE
	NE5sE3UKXePZ1OVYvwaDk/CX1KbU+vHl5G0cYYyJpVmYKPlMUkXpG/F0jBe8jxnd
	gZMynrk8sKtiJxY/jNGhZ3bhiNIh7PaKh5YJp2BeOSqFQhL5SLOy8u99PZz+MErZ
	8/u6ikqTgkD66hIWdaleCPdvV/OacNA8nVJHxdLjhEhv8p+637bnT9ywCZUGg0qJ
	x2MS42xA7eNvabc57Kl3jA==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 466jh7r8wa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 22 Apr 2025 15:11:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1745359868; bh=vLaImqiDGlMZbD5rSB+xWy9A8pawDBn7FAoLiJ1dR/c=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=d+LK6ud91XheYREW+ZJlmS395L9dRACG2AIaz4rmTmw3Td/BDibJGktrLP1OBQtwC
	 XsWBDAvxsKamqK9XuazR5Bmv2N/3acHxsYeprw7nM+dDApjhWf9wUcuFuaQ/ScPs1T
	 suj+r+25YgGLtSjEP4C3NaG8NIvI0ECBtIDMWuVD9B8o+DK2Z+o0ELEXxtLjrSJ4yp
	 V1LrB1+LryKbd5TFFoVH5+ZEextHwp26HqpkiRUbCJBxFopGtu7pAJZGqv2/6COdcS
	 oICKkgFxMYlRCBHwie3y8FdkSKY90VyMD2C0yAh9HoRmX9VZXW6DPPnI3ouKBacBBS
	 or0tdQShowZ7Q==
Received: from mailhost.synopsys.com (us03-mailhost1.synopsys.com [10.4.17.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id A30AF401F9;
	Tue, 22 Apr 2025 22:11:07 +0000 (UTC)
Received: from o365relay-in.synopsys.com (us03-o365relay1.synopsys.com [10.4.161.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id 8C8CFA006F;
	Tue, 22 Apr 2025 22:11:06 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=THQF2b4z;
	dkim-atps=neutral
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (mail-mw2nam04lp2176.outbound.protection.outlook.com [104.47.73.176])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 4BDDF4021B;
	Tue, 22 Apr 2025 22:11:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=denD+bD0bgOV1SWcgAm8TxFXhpR3Q9zAnxUgtA0KcMT5m+Gcj7ruVJMp90qtOw0yUGNwRAmPmFYyPNW2dd9Yi9Myz3Z2wV3iV/BGPwYRjCnFbAG5Y39tmaxif+rb6sSs5tOTF591TmsWsxl8duJIG8M2v37Uv20k2AYYRDcG0DbY7BLF6ZxEHhMEXAYgdpKxEE4dNVe2Zk3/9cPz8PlClyHCUl4Gn1QgqqRuCpmVsTGXxgQQ5ThEq4WenlDMCBr4oSGuWwubuYCMotCGSOV9EY8DGe7ofRUGNG6xa9wiNXVDJcVEhUGUTH0mb6aUXT5YG94INjbTGMcelZbgwBuGOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vLaImqiDGlMZbD5rSB+xWy9A8pawDBn7FAoLiJ1dR/c=;
 b=kw862PCdI+ILNn1nXhc2w0gkTgABnB4lUmMa4bZGUczdhoBgGvS+x9yUBgF26jhUI+4BvbFXM3ifdqNRHuZe/vNRqm3rx6rq8UuHbos0gomKj5W9W3EM3AnHIUtog3EaFVEyOQHzuA3ysOQpXIQjiQ6CZFPGfzRqjdr7blayPCC9otH1Ij3WbJse8xo4j7fBT8ecoK9QvpIRpM8vMCRhyv16Gqo1rt7dEnAbo/LmuJ0V2Ah1rEW8RaqnixVnT83urqohR9y2rFQilLqVvBWI+rc1jnrjqzT68invhxA434+uUxXVu/4TtrxJuRvcXuMoHBnD0/dck2pkv4mG+Vi/Pg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vLaImqiDGlMZbD5rSB+xWy9A8pawDBn7FAoLiJ1dR/c=;
 b=THQF2b4zVBHlt5rC3QY4XX3UId6pGniuwn0LXHgofv5fbc1ZbQ8q5gBLabKWBv4S4Rd/eW31Qx0yh4Flr6CRc2ZGJCP056Xmoo1rNa3mK9wQEnPp7oQi/be2UfvUrEjR32cOtmJlBVelOCR6R53MXYH5fnnVcoGUvZjruDEhVpw=
Received: from LV2PR12MB5990.namprd12.prod.outlook.com (2603:10b6:408:170::16)
 by MN0PR12MB6104.namprd12.prod.outlook.com (2603:10b6:208:3c8::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.23; Tue, 22 Apr
 2025 22:11:02 +0000
Received: from LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8]) by LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8%5]) with mapi id 15.20.8655.033; Tue, 22 Apr 2025
 22:11:02 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Prashanth K <prashanth.k@oss.qualcomm.com>
CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Kees Bakker <kees@ijzerbout.nl>,
        William McVicker <willmcvicker@google.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "stable@kernel.org" <stable@kernel.org>
Subject: Re: [PATCH v2 3/3] usb: dwc3: gadget: Make gadget_wakeup asynchronous
Thread-Topic: [PATCH v2 3/3] usb: dwc3: gadget: Make gadget_wakeup
 asynchronous
Thread-Index: AQHbs3HoJqlbdX5KZ0mmRAfj0atH+7OwP++A
Date: Tue, 22 Apr 2025 22:11:02 +0000
Message-ID: <20250422221053.wutkqx6silpiz3qh@synopsys.com>
References: <20250422103231.1954387-1-prashanth.k@oss.qualcomm.com>
 <20250422103231.1954387-4-prashanth.k@oss.qualcomm.com>
In-Reply-To: <20250422103231.1954387-4-prashanth.k@oss.qualcomm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR12MB5990:EE_|MN0PR12MB6104:EE_
x-ms-office365-filtering-correlation-id: d2be2030-44e7-4eee-3b27-08dd81ea91bf
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?cHcrcHlYQ3gxUVhUcWRhTXV1SDFvSTR2VVh6bnlVNThkck4zQ1JMOE1OaCtI?=
 =?utf-8?B?cDROaFVYaFNRbFl6TG5DUnN0WDV6d01Rb0wyTU9LOGFybFdVMXkrTFkxUW1F?=
 =?utf-8?B?TjlydVVXdlBMVzN2QVV4WGRkVU0wZXFEb0J3VzZOVnI3Rk4yU3d0RTBXMUlU?=
 =?utf-8?B?NUF2Rm1nQmgrMko0aGNFaC9leWVidjgxaDd4dFB0Q3JxbVZwdFdGS3JkRThh?=
 =?utf-8?B?cFI3NmRWaDJ1R2xqOFpkVkxXajQ3RlJYdlFCTzhHT0pUemVUdE5RQTFDMGVL?=
 =?utf-8?B?L0J5ZWZJeDl2dHp5ZUxwSHhRdDZDQTN1UVIzTG92Sm5YdDdCbTJWd1JHY1JY?=
 =?utf-8?B?QzR6YnQzMit6RzdXVS9ZLy8vU1ptNkI4cjBIS1hzZGxqTm42RjlIdVNtY2hu?=
 =?utf-8?B?RkxUeWRRYnJyUWpNRDI5TXhqaUdaT3VGemJ5STdmRyszcmZiNVgyMXQvYnBV?=
 =?utf-8?B?cjBOQTZoSnFSU1Ayd0hEangvOWlySkFJK0JjVGJJOEdsWHlqTHlEd3dJOURt?=
 =?utf-8?B?V1ZBUk13UlNjU1BtRXNLcGxMcW96OElpR1ZsNjlRV2piWWNCZ2JSQ3lZMVRo?=
 =?utf-8?B?ZUFTRmc0UlVOQzZQcTVqQytTSThmbzB6QVZiMG1iTjRtbUpHWWpLazBIMlk5?=
 =?utf-8?B?QjNzUDl3a2d3dnh0ekZJZDREb3FFSlZIWU1vamVGek5MYk00M3RpMjF0dGYy?=
 =?utf-8?B?ZmRQVzg5MnNVNmo5ZVlyaFlSSkY3S09RT1MxYjBhVXRMRmNBbnFFd3hiMHFs?=
 =?utf-8?B?UjBHWUJPWlAyNXR6NUFuekhPdHRFcFNySlJabmhTVis5SjE4dGt4VUFrWTlN?=
 =?utf-8?B?UE5BV0JoMUZMd3ZjdE0vMzNrQjNxZ2hkajB3QkxOcGgwQnpHN1pZb3k5V3JC?=
 =?utf-8?B?cWxDTkRoSUhEWW9ZdzJTbjQzQXpXcUhsb2Rwcm1uVE01d0YrVUNDTG0rY2pB?=
 =?utf-8?B?dkN2Z3FMYXVDc2tld2NSbHVMNVFvRWJ4aHdhb0tOSENDaUdvZHZOSjhVTjlr?=
 =?utf-8?B?d045REFNVHptOWFRSEsvYXBLc0U1cU1HdmhHSFV2Vm5uS0xveG9DVnJPeHY4?=
 =?utf-8?B?eUVHQUo3OFJRK2RkMG5iUm5sMjgrcnRkSDhDQjJkakFPcFhGVFpQWDlyYWpN?=
 =?utf-8?B?Wm9WdkZGUHhxd0c1UXRKZWI0Z1V2ci94ZUJLNjlnaFU4SThVbGFVdW1mZ1RP?=
 =?utf-8?B?N0RPY1plbE5XOHNER0k5T0FFYm5TQU1aYngwMytoZFFwZko3SVIyOEpsVDVW?=
 =?utf-8?B?RisweUNZZkRqdFJQZElEajRGTDhjWHp2RGhJWkdSNk5GbDlpRTh5UWxTd3Ey?=
 =?utf-8?B?bzJnM0wzVWV2UlVTSXpFWjVZNC96bUdINVNqdXpUQ1NQTS9nc0lwNXlaQnFH?=
 =?utf-8?B?THk4bXdMcEtBWXRnWjJNK1Nnb2xsMlhSRlRFN0tJRTJQeHlVMmJINzJSZFhn?=
 =?utf-8?B?b0hiVEw1dm81RUh5OG9BRzk4T3EvVUxwU1VKRVl5Q2tJTlRIRUpMM0JKSUpW?=
 =?utf-8?B?YUtDS205Q3VLTGtVZTE3d0Q0ODdLSnNMaXVQRzRud09uaWJvL0hoSExpR3Q5?=
 =?utf-8?B?Z3I0Y0lzamJTRVROSjNNUXRncUx1UDJMS1lCQkExSlhYWDl6Q3V3NnozTWUz?=
 =?utf-8?B?cThISVE1WVhQSkRSRUtiR3VLc1M3TWhmbFZvNnIvNThvTzlKS21EUUFDY2VD?=
 =?utf-8?B?Q0k0MW5NNFROTkNIeXk5WjlyNzNJdkt1eTNuaEMweUpFbWVWNmJUbkVFQTRm?=
 =?utf-8?B?bW8rclgzdFNRaVNRcXlEdi93Szdvc1VvbFhNMDcvdFVWejhOUENmaU5EQ3VH?=
 =?utf-8?B?R2Z0YnFLWXhDMldrWHpTZTJrbTVHeFpQbU5GZ3VETUt1QmxYMjNrL1gwZXE0?=
 =?utf-8?B?WXUweitzbkxmeDZiWGhiazlBbEtITFRFUWlRZ1planJHQ25HL3JNV3Z4VmI1?=
 =?utf-8?B?RU9qOVlsK0pyTFRxR2hjejdISysyZ2o5WnZPak43cDhDME1iK2NHb01iL3JP?=
 =?utf-8?Q?Y85nBeMDNlHYEUaqDzhD3mpGYxmKJY=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?NkE3OUFPNFJFSjJaa3hENjNoVWlQVHQ0SU5hdUl3WEkrQ2hwald5S3R5NjdS?=
 =?utf-8?B?TWJWWDNYWDJ1MTdsRW44YTdadGtHOGp1RGdvdE1qOXNvbXZFcDlNZDlYTmdj?=
 =?utf-8?B?T09rUWx2UGt4WUUvbllDN1N0ZjdUczlVMFZpblhuYkl4bUtKV2tFV0xhT0JT?=
 =?utf-8?B?Q3pGcUhmSVVhZnBSbTJLblZXbGdYUk5SbnNnRjI1dnI5MVhuNUJBMzFvcS9Y?=
 =?utf-8?B?RS9OaFkvZTZYQ1prelJDZU9tb1NQMEtPWkJoMUo5QUlnSTcrUjBycjRUbGJu?=
 =?utf-8?B?cDZPaC9HQnhERi9oQnFzWVBoS0EvNXpza0I5M1NyZVlPN0V3QnRMWUsxV25O?=
 =?utf-8?B?Q0NYd1VKWXovTzRGdVlnQzFINHR0MEM2b3g5MHlyOEpmQ1AvdmlwcFpWczJx?=
 =?utf-8?B?R1NKSVlPN3NBdDdDL051M3l5RHBSeUI3M1V3ZzdvSWh4SHlZbm45emhwRDE5?=
 =?utf-8?B?ajEyZ3o4ZFgrWlk1b2RFZlNmYjk3VW1LZ1FHNVdFakpPdlk1QlEybThyeXVU?=
 =?utf-8?B?OGJYTVAvcnJlMnVGVEhzK2YwVEhEd0tiZHFVQnpJVzF6TzdIZkdBR0lZZzRM?=
 =?utf-8?B?K0ZKSXFCcmhFUlIySDV0ZTllcFZsK2tHckFPM0JucHZCOVlKbjVNUWFyOXpU?=
 =?utf-8?B?RitPK20zZFR1ZDNkQ1pPUmhGSzhjRHdhalZFcTJ6UXZWYzdyT3RoZFI4QkR6?=
 =?utf-8?B?SGVhQ3U0Z1pHWldUZldkVTJDL3VwNFp2RjZqK0k3OUVUM2lFdXRVTkRBa2Yr?=
 =?utf-8?B?dTZKODJaR0FDR1ZFRFBReTJQdnBrdWlXd3V1Q0xVQXFlVU5zS3hRQjM4ZDVH?=
 =?utf-8?B?TmZoMVM3ZThzU09lSjRMM3FseVczS2ZOenE5cWZ6aUtNQXN6dytSK2VYTHNx?=
 =?utf-8?B?MTl1aDFOZzh4U3k0L0ZHVlBzSHJMcEltSVprUnNKWG1BQkdHUUNnMXIyZWhT?=
 =?utf-8?B?ZU5CRy9wQlpMTmVTZVUyajU4aFJKbHlxWnN4dVUrL1JPSzRhaUhRa3Z2Tm9u?=
 =?utf-8?B?VmJ4TkQyeU04eVhIMjNyUk5HZC9HUFVSMmF0S0hlaVF3eWlIcFV5UTdqNmoz?=
 =?utf-8?B?T2tnVmJoRzB3SmI2QVhIYWcrbU9Ua2QwOGphdDA2VCtxVFQ1M0NlL3BncHRa?=
 =?utf-8?B?TkdoWThCNmxaSk13QU5wRkxGV0ZVb3BxTCtZLzVNeFpFVUJUdXY3TTNFYmxV?=
 =?utf-8?B?WmZMRTBVc012V1BaRTlMNHZlY1J3bE5BK2NEakRGcS9PZk5WU0FxZ0YzOXov?=
 =?utf-8?B?bzJjN0dIaU1hVXNIZWMxcEVKR2tVYkdTYzFNMDdCVzhiMFhzTWEvWjE3cUxa?=
 =?utf-8?B?WjFrRXQ1RndRSU52c0liSFpyNS9PUDFyS08xQ0dYY1Y3VFp6Wkt4M3cvd0RJ?=
 =?utf-8?B?TVovYlZSbjMwMGZsU3R0d0k1RnZXb1pRQ2hFVlhBdlFmUVNFSzRDZU5QMEpx?=
 =?utf-8?B?WnJzOVp0b3RuZHlGQ3FQbGRKVCtzck9RdjM3WUU3WnBrdmtkTlltS1FybkdF?=
 =?utf-8?B?eVNYOExWbTk2K0VoMjlSLzNmTnd1N2hWMzY2MkdVaUhLdDg5WTJNZkZKdlJ4?=
 =?utf-8?B?Sy9teldDaHE2NUhwdW5GRC95WFU0SHdpUHFLSGZQQWJPbFJ5VHAySUdua0dC?=
 =?utf-8?B?bzBtcDFYa3JoV3NFOVJ5NzNWS1VtdUdwbDJYWTN3R2x1MDVWWmYvZUNDYWtP?=
 =?utf-8?B?ZDZDY2xvb1ZrZkhNTzdJV1l2TS9HbWhTQWdmOGpVNnhGUkJBQzF4c0lueG9L?=
 =?utf-8?B?SXB0VG5XdXpnYzgxWVRKbERFb1NQNjhYR1kwanpiQlR0ZVhpL0RmdU5EaitH?=
 =?utf-8?B?akpSOU9ERzJIS0wzekxGd1F6THlwWHpqc3hUU0dVbHVKeUZnb1dsUjBibWRP?=
 =?utf-8?B?ZEM0MXZTR25JVjZiN1FhM244NHJ6elFwQ1VxZVJwUWJ6RG5UTHJzWDBaOTd5?=
 =?utf-8?B?OWZBbHJ1U0ZINnE4SDN4cFpjQzhsOGY0OE9JY1ZVNEV2NitwaUtIZlA0MmI0?=
 =?utf-8?B?NFQ3ZmJoYUYvVlQ4bmJjQVRsUHJLQXh0UzNZTWw0U3ZxT0RJWDZDaml5SWI2?=
 =?utf-8?B?ZmlZeW5rd2ZzUTRiT3hFU29JdS9KQ1d3ZTNra0hOUGtQK1JhWDBBK0MxZHhW?=
 =?utf-8?Q?IbZUxOWgKZQL/KXdM7CdegLx7?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <58CC47B7603C644FA3255DD236BAE2F3@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	SSXzKxiLsLI/TqURz+P6iNVCWn9LVw9txdJkO+vKyaEqZM1Xo4LtajSpqWoNFTzkyoeSnN8LyFyjKfnH4gUMgFhH6oA5qj7LevmD4bJI/uD9uGDaURqHXJLjNb0Sxr2KP97Hxj+FjAuPK2F8/oG17k3GA/LoGQm6N5eHLPVlkm3mWQScdf+AOVm0VxokB+JrvtwD4X5eRalGerHYwYAd/zI8kgyGPID9zmZp55KKXQermf99dqqsyLIw8uul674i4K38yILKeUJMCMUFlM+lvL6T3V35SBATR1dvveSlj92iVgyqLRdXIi+mMUrXwJPyFMqB4zjslMUANygsJqIbh4VrJ0D099rTSJDYOhkfw0BkMWff/++EbA9UQEROGE8XUCqr6YmAVH9UKZzV8Ryq8WPAlUOj/bF1dFsHyvT+SsMBPkejkP2I6hN7Onj6Pr6IPFsEWLBBYoKbuAGXC8G22gzjT2S/tKeJoiEG1igs2seEjTKKA0LrbbQWGB+GFT20tmPdF/Nr6vRQMceSZH+J8Ktf5ljjJ5xPSrILVHGtJWnkep7j/89CmbSzCxznR5Qgx1aYLM+R7miKQ7jlguuHH8We7J3+brHkF+QgMzNMhgtOwAL4wwhIbS5npTqk7rJpAX9+xUFC2W+d5C827PUD4g==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d2be2030-44e7-4eee-3b27-08dd81ea91bf
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Apr 2025 22:11:02.3477
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: oCveyOrdzW7ntay4Br80dD8W9orgF4KdrS7pL/e7HQlDKIMyMMoLbeN0q1WuGYTqW+yyBvyw7EA1X3QuPLoHoQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6104
X-Authority-Analysis: v=2.4 cv=Ov5Pyz/t c=1 sm=1 tr=0 ts=680813fd cx=c_pps a=t4gDRyhI9k+KZ5gXRQysFQ==:117 a=t4gDRyhI9k+KZ5gXRQysFQ==:17 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10
 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=qPHU084jO2kA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=jIQo8A4GAAAA:8 a=GezzySmmNLRbnF6d3BMA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: O4r6azA4UDSdYAK-A3mxKdV74p6iON_p
X-Proofpoint-ORIG-GUID: O4r6azA4UDSdYAK-A3mxKdV74p6iON_p
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDIyMDE2NyBTYWx0ZWRfX4BlB8yFWev9M um3rVj4pPiedOTZysBKORtF1g9bmVfPDbnOZAv6d/XPmUgBapc4J0BSyx+LhryMRmo9FnFs7wvn bpL1bMT67pbLNWFwdjZhS5NQNyaqIAUvUoTCJZsssEReC7S2VtkX4GOZT38Bo4DxfzoysrHgveB
 sYxfaI/gYEV2uscdT+GOTqwqUOdWSHjdw7B7qkj6pbU93gEXiWJ0214jp+AfFUS6Kxk3dnGYszY P7IMbPGaCGb07nz6JW9k8GFPWNwkXgfnrjt1ZgmuB0bdTuNjSzNvmXt2vpqApLUOd7FeU02OVeE z1flvJI4tTLiE5149yX7M0g1KqrgwU+4kqh3RmpCFkhZ1A11Li1zHPcP/laX3g8wz1gglblU+3U
 uP07X02HQTUtiM5+gy3h2tJ6H4Puo4C6VyagpIKndgjfYOSqAJjoMmasyIFfZ8cfyVZX5RJ5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-22_10,2025-04-22_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 mlxscore=0 bulkscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 mlxlogscore=806 adultscore=0
 spamscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504220167

T24gVHVlLCBBcHIgMjIsIDIwMjUsIFByYXNoYW50aCBLIHdyb3RlOg0KPiBDdXJyZW50bHkgZ2Fk
Z2V0X3dha2V1cCgpIHdhaXRzIGZvciBVMCBzeW5jaHJvbm91c2x5IGlmIGl0IHdhcw0KPiBjYWxs
ZWQgZnJvbSBmdW5jX3dha2V1cCgpLCB0aGlzIGlzIGJlY2F1c2Ugd2UgbmVlZCB0byBzZW5kIHRo
ZQ0KPiBmdW5jdGlvbiB3YWtldXAgY29tbWFuZCBzb29uIGFmdGVyIHRoZSBsaW5rIGlzIGFjdGl2
ZS4gQW5kIHRoZQ0KPiBjYWxsIGlzIG1hZGUgc3luY2hyb25vdXMgYnkgcG9sbGluZyBEU1RTIGNv
bnRpbnVvc2x5IGZvciAyMDAwMA0KPiB0aW1lcyBpbiBfX2R3YzNfZ2FkZ2V0X3dha2V1cCgpLiBC
dXQgaXQgb2JzZXJ2ZWQgdGhhdCBzb21ldGltZXMNCj4gdGhlIGxpbmsgaXMgbm90IGFjdGl2ZSBl
dmVuIGFmdGVyIHBvbGxpbmcgMjBLIHRpbWVzLCBsZWFkaW5nIHRvDQo+IHJlbW90ZSB3YWtldXAg
ZmFpbHVyZXMuIEFkZGluZyBhIHNtYWxsIGRlbGF5IGJldHdlZW4gZWFjaCBwb2xsDQo+IGhlbHBz
LCBidXQgdGhhdCB3b24ndCBndWFyYW50ZWUgcmVzb2x1dGlvbiBpbiBmdXR1cmUuIEhlbmNlIG1h
a2UNCj4gdGhlIGdhZGdldF93YWtldXAgY29tcGxldGVseSBhc3luY2hyb25vdXMuDQo+IA0KPiBT
aW5jZSBtdWx0aXBsZSBpbnRlcmZhY2VzIGNhbiBpc3N1ZSBhIGZ1bmN0aW9uIHdha2V1cCBhdCBv
bmNlLA0KPiBhZGQgYSBuZXcgdmFyaWFibGUgd2FrZXVwX3BlbmRpbmdfZnVuY3Mgd2hpY2ggd2ls
bCBpbmRpY2F0ZSB0aGUNCj4gZnVuY3Rpb25zIHRoYXQgaGFzIGlzc3VlZCBmdW5jX3dha3VwLCB0
aGlzIGlzIHJlcHJlc2VudGVkIGluIGENCj4gYml0bWFwIGZvcm1hdC4gSWYgdGhlIGxpbmsgaXMg
aW4gVTMsIGR3YzNfZ2FkZ2V0X2Z1bmNfd2FrZXVwKCkNCj4gd2lsbCBzZXQgdGhlIGJpdCBjb3Jy
ZXNwb25kaW5nIHRvIGludGVyZmFjZV9pZCBhbmQgYmFpbCBvdXQuDQo+IE9uY2UgbGluayBjb21l
cyBiYWNrIHRvIFUwLCBsaW5rc3RzX2NoYW5nZSBpcnEgaXMgdHJpZ2dlcmVkLA0KPiB3aGVyZSB0
aGUgZnVuY3Rpb24gd2FrZXVwIGNvbW1hbmQgaXMgc2VudCBiYXNlZCBvbiBiaXRtYXAuDQo+IA0K
PiBDYzogc3RhYmxlQGtlcm5lbC5vcmcNCj4gRml4ZXM6IDkyYzA4YTg0YjUzZSAoInVzYjogZHdj
MzogQWRkIGZ1bmN0aW9uIHN1c3BlbmQgYW5kIGZ1bmN0aW9uIHdha2V1cCBzdXBwb3J0IikNCj4g
U2lnbmVkLW9mZi1ieTogUHJhc2hhbnRoIEsgPHByYXNoYW50aC5rQG9zcy5xdWFsY29tbS5jb20+
DQo+IC0tLQ0KPiAgZHJpdmVycy91c2IvZHdjMy9jb3JlLmggICB8ICA0ICsrKw0KPiAgZHJpdmVy
cy91c2IvZHdjMy9nYWRnZXQuYyB8IDYwICsrKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLQ0KPiAgMiBmaWxlcyBjaGFuZ2VkLCAyNyBpbnNlcnRpb25zKCspLCAzNyBkZWxldGlv
bnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3VzYi9kd2MzL2NvcmUuaCBiL2RyaXZl
cnMvdXNiL2R3YzMvY29yZS5oDQo+IGluZGV4IGFhYTM5ZTY2M2Y2MC4uMjdlYWU0Y2YyMjNkIDEw
MDY0NA0KPiAtLS0gYS9kcml2ZXJzL3VzYi9kd2MzL2NvcmUuaA0KPiArKysgYi9kcml2ZXJzL3Vz
Yi9kd2MzL2NvcmUuaA0KPiBAQCAtMTE2NCw2ICsxMTY0LDkgQEAgc3RydWN0IGR3YzNfc2NyYXRj
aHBhZF9hcnJheSB7DQo+ICAgKiBAZ3NidXNjZmcwX3JlcWluZm86IHN0b3JlIEdTQlVTQ0ZHMC5E
QVRSRFJFUUlORk8sIERFU1JEUkVRSU5GTywNCj4gICAqCQkgICAgICAgREFUV1JSRVFJTkZPLCBh
bmQgREVTV1JSRVFJTkZPIHZhbHVlIHBhc3NlZCBmcm9tDQo+ICAgKgkJICAgICAgIGdsdWUgZHJp
dmVyLg0KPiArICogQHdha2V1cF9wZW5kaW5nX2Z1bmNzOiBJbmRpY2F0ZXMgd2hldGhlciBhbnkg
aW50ZXJmYWNlIGhhcyByZXF1ZXN0ZWQgZm9yDQo+ICsgKgkJCSBmdW5jdGlvbiB3YWtldXAgaW4g
Yml0bWFwIGZvcm1hdCB3aGVyZSBiaXQgcG9zaXRpb24NCj4gKyAqCQkJIHJlcHJlc2VudHMgaW50
ZXJmYWNlX2lkLg0KPiAgICovDQo+ICBzdHJ1Y3QgZHdjMyB7DQo+ICAJc3RydWN0IHdvcmtfc3Ry
dWN0CWRyZF93b3JrOw0KPiBAQCAtMTM5NCw2ICsxMzk3LDcgQEAgc3RydWN0IGR3YzMgew0KPiAg
CWludAkJCW51bV9lcF9yZXNpemVkOw0KPiAgCXN0cnVjdCBkZW50cnkJCSpkZWJ1Z19yb290Ow0K
PiAgCXUzMgkJCWdzYnVzY2ZnMF9yZXFpbmZvOw0KPiArCXUzMgkJCXdha2V1cF9wZW5kaW5nX2Z1
bmNzOw0KPiAgfTsNCj4gIA0KPiAgI2RlZmluZSBJTkNSWF9CVVJTVF9NT0RFIDANCj4gZGlmZiAt
LWdpdCBhL2RyaXZlcnMvdXNiL2R3YzMvZ2FkZ2V0LmMgYi9kcml2ZXJzL3VzYi9kd2MzL2dhZGdl
dC5jDQo+IGluZGV4IDQ3ZTczYzRlZDYyZC4uNjllYzljZjU3NjYzIDEwMDY0NA0KPiAtLS0gYS9k
cml2ZXJzL3VzYi9kd2MzL2dhZGdldC5jDQo+ICsrKyBiL2RyaXZlcnMvdXNiL2R3YzMvZ2FkZ2V0
LmMNCj4gQEAgLTI3Niw4ICsyNzYsNiBAQCBpbnQgZHdjM19zZW5kX2dhZGdldF9nZW5lcmljX2Nv
bW1hbmQoc3RydWN0IGR3YzMgKmR3YywgdW5zaWduZWQgaW50IGNtZCwNCj4gIAlyZXR1cm4gcmV0
Ow0KPiAgfQ0KPiAgDQo+IC1zdGF0aWMgaW50IF9fZHdjM19nYWRnZXRfd2FrZXVwKHN0cnVjdCBk
d2MzICpkd2MsIGJvb2wgYXN5bmMpOw0KPiAtDQo+ICAvKioNCj4gICAqIGR3YzNfc2VuZF9nYWRn
ZXRfZXBfY21kIC0gaXNzdWUgYW4gZW5kcG9pbnQgY29tbWFuZA0KPiAgICogQGRlcDogdGhlIGVu
ZHBvaW50IHRvIHdoaWNoIHRoZSBjb21tYW5kIGlzIGdvaW5nIHRvIGJlIGlzc3VlZA0KPiBAQCAt
MjM1OSwxMCArMjM1Nyw4IEBAIHN0YXRpYyBpbnQgZHdjM19nYWRnZXRfZ2V0X2ZyYW1lKHN0cnVj
dCB1c2JfZ2FkZ2V0ICpnKQ0KPiAgCXJldHVybiBfX2R3YzNfZ2FkZ2V0X2dldF9mcmFtZShkd2Mp
Ow0KPiAgfQ0KPiAgDQo+IC1zdGF0aWMgaW50IF9fZHdjM19nYWRnZXRfd2FrZXVwKHN0cnVjdCBk
d2MzICpkd2MsIGJvb2wgYXN5bmMpDQo+ICtzdGF0aWMgaW50IF9fZHdjM19nYWRnZXRfd2FrZXVw
KHN0cnVjdCBkd2MzICpkd2MpDQo+ICB7DQo+IC0JaW50CQkJcmV0cmllczsNCj4gLQ0KPiAgCWlu
dAkJCXJldDsNCj4gIAl1MzIJCQlyZWc7DQo+ICANCj4gQEAgLTIzOTAsOCArMjM4Niw3IEBAIHN0
YXRpYyBpbnQgX19kd2MzX2dhZGdldF93YWtldXAoc3RydWN0IGR3YzMgKmR3YywgYm9vbCBhc3lu
YykNCj4gIAkJcmV0dXJuIC1FSU5WQUw7DQo+ICAJfQ0KPiAgDQo+IC0JaWYgKGFzeW5jKQ0KPiAt
CQlkd2MzX2dhZGdldF9lbmFibGVfbGlua3N0c19ldnRzKGR3YywgdHJ1ZSk7DQo+ICsJZHdjM19n
YWRnZXRfZW5hYmxlX2xpbmtzdHNfZXZ0cyhkd2MsIHRydWUpOw0KPiAgDQo+ICAJcmV0ID0gZHdj
M19nYWRnZXRfc2V0X2xpbmtfc3RhdGUoZHdjLCBEV0MzX0xJTktfU1RBVEVfUkVDT1YpOw0KPiAg
CWlmIChyZXQgPCAwKSB7DQo+IEBAIC0yNDEwLDI3ICsyNDA1LDggQEAgc3RhdGljIGludCBfX2R3
YzNfZ2FkZ2V0X3dha2V1cChzdHJ1Y3QgZHdjMyAqZHdjLCBib29sIGFzeW5jKQ0KPiAgDQo+ICAJ
LyoNCj4gIAkgKiBTaW5jZSBsaW5rIHN0YXR1cyBjaGFuZ2UgZXZlbnRzIGFyZSBlbmFibGVkIHdl
IHdpbGwgcmVjZWl2ZQ0KPiAtCSAqIGFuIFUwIGV2ZW50IHdoZW4gd2FrZXVwIGlzIHN1Y2Nlc3Nm
dWwuIFNvIGJhaWwgb3V0Lg0KPiArCSAqIGFuIFUwIGV2ZW50IHdoZW4gd2FrZXVwIGlzIHN1Y2Nl
c3NmdWwuDQo+ICAJICovDQo+IC0JaWYgKGFzeW5jKQ0KPiAtCQlyZXR1cm4gMDsNCj4gLQ0KPiAt
CS8qIHBvbGwgdW50aWwgTGluayBTdGF0ZSBjaGFuZ2VzIHRvIE9OICovDQo+IC0JcmV0cmllcyA9
IDIwMDAwOw0KPiAtDQo+IC0Jd2hpbGUgKHJldHJpZXMtLSkgew0KPiAtCQlyZWcgPSBkd2MzX3Jl
YWRsKGR3Yy0+cmVncywgRFdDM19EU1RTKTsNCj4gLQ0KPiAtCQkvKiBpbiBIUywgbWVhbnMgT04g
Ki8NCj4gLQkJaWYgKERXQzNfRFNUU19VU0JMTktTVChyZWcpID09IERXQzNfTElOS19TVEFURV9V
MCkNCj4gLQkJCWJyZWFrOw0KPiAtCX0NCj4gLQ0KPiAtCWlmIChEV0MzX0RTVFNfVVNCTE5LU1Qo
cmVnKSAhPSBEV0MzX0xJTktfU1RBVEVfVTApIHsNCj4gLQkJZGV2X2Vycihkd2MtPmRldiwgImZh
aWxlZCB0byBzZW5kIHJlbW90ZSB3YWtldXBcbiIpOw0KPiAtCQlyZXR1cm4gLUVJTlZBTDsNCj4g
LQl9DQo+IC0NCj4gIAlyZXR1cm4gMDsNCj4gIH0NCj4gIA0KPiBAQCAtMjQ1MSw3ICsyNDI3LDcg
QEAgc3RhdGljIGludCBkd2MzX2dhZGdldF93YWtldXAoc3RydWN0IHVzYl9nYWRnZXQgKmcpDQo+
ICAJCXNwaW5fdW5sb2NrX2lycXJlc3RvcmUoJmR3Yy0+bG9jaywgZmxhZ3MpOw0KPiAgCQlyZXR1
cm4gLUVJTlZBTDsNCj4gIAl9DQo+IC0JcmV0ID0gX19kd2MzX2dhZGdldF93YWtldXAoZHdjLCB0
cnVlKTsNCj4gKwlyZXQgPSBfX2R3YzNfZ2FkZ2V0X3dha2V1cChkd2MpOw0KPiAgDQo+ICAJc3Bp
bl91bmxvY2tfaXJxcmVzdG9yZSgmZHdjLT5sb2NrLCBmbGFncyk7DQo+ICANCj4gQEAgLTI0Nzks
MTQgKzI0NTUsMTAgQEAgc3RhdGljIGludCBkd2MzX2dhZGdldF9mdW5jX3dha2V1cChzdHJ1Y3Qg
dXNiX2dhZGdldCAqZywgaW50IGludGZfaWQpDQo+ICAJICovDQo+ICAJbGlua19zdGF0ZSA9IGR3
YzNfZ2FkZ2V0X2dldF9saW5rX3N0YXRlKGR3Yyk7DQo+ICAJaWYgKGxpbmtfc3RhdGUgPT0gRFdD
M19MSU5LX1NUQVRFX1UzKSB7DQo+IC0JCXJldCA9IF9fZHdjM19nYWRnZXRfd2FrZXVwKGR3Yywg
ZmFsc2UpOw0KPiAtCQlpZiAocmV0KSB7DQo+IC0JCQlzcGluX3VubG9ja19pcnFyZXN0b3JlKCZk
d2MtPmxvY2ssIGZsYWdzKTsNCj4gLQkJCXJldHVybiAtRUlOVkFMOw0KPiAtCQl9DQo+IC0JCWR3
YzNfcmVzdW1lX2dhZGdldChkd2MpOw0KPiAtCQlkd2MtPnN1c3BlbmRlZCA9IGZhbHNlOw0KPiAt
CQlkd2MtPmxpbmtfc3RhdGUgPSBEV0MzX0xJTktfU1RBVEVfVTA7DQo+ICsJCWR3Yy0+d2FrZXVw
X3BlbmRpbmdfZnVuY3MgfD0gQklUKGludGZfaWQpOw0KPiArCQlyZXQgPSBfX2R3YzNfZ2FkZ2V0
X3dha2V1cChkd2MpOw0KPiArCQlzcGluX3VubG9ja19pcnFyZXN0b3JlKCZkd2MtPmxvY2ssIGZs
YWdzKTsNCj4gKwkJcmV0dXJuIHJldDsNCj4gIAl9DQo+ICANCj4gIAlyZXQgPSBkd2MzX3NlbmRf
Z2FkZ2V0X2dlbmVyaWNfY29tbWFuZChkd2MsIERXQzNfREdDTURfREVWX05PVElGSUNBVElPTiwN
Cj4gQEAgLTQzNTMsNiArNDMyNSw4IEBAIHN0YXRpYyB2b2lkIGR3YzNfZ2FkZ2V0X2xpbmtzdHNf
Y2hhbmdlX2ludGVycnVwdChzdHJ1Y3QgZHdjMyAqZHdjLA0KPiAgew0KPiAgCWVudW0gZHdjM19s
aW5rX3N0YXRlCW5leHQgPSBldnRpbmZvICYgRFdDM19MSU5LX1NUQVRFX01BU0s7DQo+ICAJdW5z
aWduZWQgaW50CQlwd3JvcHQ7DQo+ICsJaW50CQkJcmV0Ow0KPiArCWludAkJCWludGZfaWQ7DQo+
ICANCj4gIAkvKg0KPiAgCSAqIFdPUktBUk9VTkQ6IERXQzMgPCAyLjUwYSBoYXZlIGFuIGlzc3Vl
IHdoZW4gY29uZmlndXJlZCB3aXRob3V0DQo+IEBAIC00NDI4LDcgKzQ0MDIsNyBAQCBzdGF0aWMg
dm9pZCBkd2MzX2dhZGdldF9saW5rc3RzX2NoYW5nZV9pbnRlcnJ1cHQoc3RydWN0IGR3YzMgKmR3
YywNCj4gIA0KPiAgCXN3aXRjaCAobmV4dCkgew0KPiAgCWNhc2UgRFdDM19MSU5LX1NUQVRFX1Uw
Og0KPiAtCQlpZiAoZHdjLT5nYWRnZXQtPndha2V1cF9hcm1lZCkgew0KPiArCQlpZiAoZHdjLT5n
YWRnZXQtPndha2V1cF9hcm1lZCB8fCBkd2MtPndha2V1cF9wZW5kaW5nX2Z1bmNzKSB7DQo+ICAJ
CQlkd2MzX2dhZGdldF9lbmFibGVfbGlua3N0c19ldnRzKGR3YywgZmFsc2UpOw0KPiAgCQkJZHdj
M19yZXN1bWVfZ2FkZ2V0KGR3Yyk7DQo+ICAJCQlkd2MtPnN1c3BlbmRlZCA9IGZhbHNlOw0KPiBA
QCAtNDQ1MSw2ICs0NDI1LDE4IEBAIHN0YXRpYyB2b2lkIGR3YzNfZ2FkZ2V0X2xpbmtzdHNfY2hh
bmdlX2ludGVycnVwdChzdHJ1Y3QgZHdjMyAqZHdjLA0KPiAgCX0NCj4gIA0KPiAgCWR3Yy0+bGlu
a19zdGF0ZSA9IG5leHQ7DQo+ICsNCj4gKwkvKiBQcm9jZWVkIHdpdGggZnVuYyB3YWtldXAgaWYg
YW55IGludGVyZmFjZXMgdGhhdCBoYXMgcmVxdWVzdGVkICovDQo+ICsJd2hpbGUgKGR3Yy0+d2Fr
ZXVwX3BlbmRpbmdfZnVuY3MgJiYgKG5leHQgPT0gRFdDM19MSU5LX1NUQVRFX1UwKSkgew0KPiAr
CQlpbnRmX2lkID0gZmZzKGR3Yy0+d2FrZXVwX3BlbmRpbmdfZnVuY3MpIC0gMTsNCj4gKwkJcmV0
ID0gZHdjM19zZW5kX2dhZGdldF9nZW5lcmljX2NvbW1hbmQoZHdjLCBEV0MzX0RHQ01EX0RFVl9O
T1RJRklDQVRJT04sDQo+ICsJCQkJCQkgICAgICAgRFdDM19ER0NNRFBBUl9ETl9GVU5DX1dBS0Ug
fA0KPiArCQkJCQkJICAgICAgIERXQzNfREdDTURQQVJfSU5URl9TRUwoaW50Zl9pZCkpOw0KPiAr
CQlpZiAocmV0KQ0KPiArCQkJZGV2X2Vycihkd2MtPmRldiwgIkZhaWxlZCB0byBzZW5kIEROIHdh
a2UgZm9yIGludGYgJWRcbiIsIGludGZfaWQpOw0KPiArDQo+ICsJCWR3Yy0+d2FrZXVwX3BlbmRp
bmdfZnVuY3MgJj0gfkJJVChpbnRmX2lkKTsNCj4gKwl9DQo+ICB9DQo+ICANCj4gIHN0YXRpYyB2
b2lkIGR3YzNfZ2FkZ2V0X3N1c3BlbmRfaW50ZXJydXB0KHN0cnVjdCBkd2MzICpkd2MsDQo+IC0t
IA0KPiAyLjI1LjENCj4gDQoNCkFja2VkLWJ5OiBUaGluaCBOZ3V5ZW4gPFRoaW5oLk5ndXllbkBz
eW5vcHN5cy5jb20+DQoNClRoYW5rcywNClRoaW5o
