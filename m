Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27726244695;
	Tue, 22 Apr 2025 22:13:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.158.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745360047; cv=fail; b=KMzjEzG4616P6iC0fl77E2+D4rZculoqo48yuonQ8CvklDENVHB+JKn/YqXus24+sAzszwcTffIIePZV9pRjqOPaOP22UOtDo8Ropr/EnFm7/5WuYIyec2J4HtzmW2Ofpkrj45YZy0BOiMQUFlJpiuC0pkILu22gBGrZVkjNH1A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745360047; c=relaxed/simple;
	bh=Kz1bRxozBoNbAP14ZSUgciNQLwv03btkQdx57jsDzWs=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=CqanUCfOvCLSDQ+vsnWnlYCf2cIwUwW9AOG0XZh3l1Np0X3U90yPTE0e41a28oMwLpkCS8Mg69GMe7+ToL1UticWVyeqF8sQYPGT1eatyeU7dERCXQwONry8v6UvrULX7xWhbFdSxAQ97bCVRJKiJth6X0pghn1+ssxkFOC1YtM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=kioryuhF; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=kTS4C/SG; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=l+kPqCeI reason="signature verification failed"; arc=fail smtp.client-ip=148.163.158.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="kioryuhF";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="kTS4C/SG";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="l+kPqCeI"
Received: from pps.filterd (m0098572.ppops.net [127.0.0.1])
	by mx0b-00230701.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53MKq0h5024510;
	Tue, 22 Apr 2025 15:13:26 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=Kz1bRxozBoNbAP14ZSUgciNQLwv03btkQdx57jsDzWs=; b=
	kioryuhFSwKv5Co7QWnqqWXXVo3dtDZ8yc29obH2F4kqqYZTDyTZTgmpHKwXQbGY
	TLCgXs3hG5gOylOqQ6yWrHmndLYKWggKr3hcyM6Yr1P3bGUL2A7O5svhzZxNEcgc
	bOSAmdp5zuQOVGn3zj4vJM+j5Y1Bbm+NvzdJkAfwSXTtxSsD3TFlk7513vxTYv3b
	n5aQzzNFH2jgbBudTUzwK6i/WtX7ikIUpnJKOXXoie9Pooh+gjCKwX+P9IaMxu7w
	N53NOqdbYZMn5ndA3ghS3IrN48TOjUOpPGtSkfbzFah6iyVhdaeG0L9z9UHQNTx1
	8s2Cp6ilpGwVM/Zn5gT3tQ==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
	by mx0b-00230701.pphosted.com (PPS) with ESMTPS id 466jha8912-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 22 Apr 2025 15:13:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1745360004; bh=Kz1bRxozBoNbAP14ZSUgciNQLwv03btkQdx57jsDzWs=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=kTS4C/SGILF54SiW7R2BIHu22mzlrZr6TZZxDLrgG9QpGeSRYwoum9V2yw56n4HjA
	 sXHziu+yhQcUP6HlUBw99wsLxj2Ws5OQa6i6iiLxP8K7hzCdBssNhJ6PVY3Ez/Fr9X
	 d1f2Kl8H96D2RPCW3PjvBAIqew3R+ilW+J2VYf+gfx2vwuQcEVo7RAYfX1t7H5RraE
	 pc0LNkUFEcWiVNlX4H5UE/tFwqGVmn+6YHXEeYd1gCLLKbUzXvdpWVTE3nd/gCRIG/
	 wEfTF8Vm27AuY6Y1oP7IyNVzkMtUy6N6Qsf0y9ID9yH5KNaU6IuKXIWyhGj1PlRw/+
	 gPT9QNIa4sqIA==
Received: from mailhost.synopsys.com (sv1-mailhost2.synopsys.com [10.205.2.132])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id CC6D2401F9;
	Tue, 22 Apr 2025 22:13:24 +0000 (UTC)
Received: from o365relay-in.synopsys.com (sv2-o365relay1.synopsys.com [10.202.1.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id DD9DAA006D;
	Tue, 22 Apr 2025 22:13:23 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=l+kPqCeI;
	dkim-atps=neutral
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2170.outbound.protection.outlook.com [104.47.57.170])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 7C17E40359;
	Tue, 22 Apr 2025 22:13:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F0exTDpLm/2czA9XpILd0yAhlT86/4czqH94/zZtjeeTZfMUxTo+gtWO3olqqvwO6u1gaCf0ITFKgbv/G9xzj/DhaBZSoHLbxk7Qxcg64WiPyzvUEQwLgOjK2Y8Kv1wG4ClgrabPvfxoCidZcElnbSL72YU+ZQRNmErF+agc88hL+ckYSmBBB7QGqEjkUHnp1rhbuJRTAbkNwSnIXKQ/VgbeJYz2sU1Xru2mtxJ573Q3adpW0yagzdCQirb1AdnQF3OK9O/JRjd9zL8svVk0e04v//1YHOavzPojZa6E4Xo2PBxK2RFBletztfxeVY0vNOHvjcy+a7aqd3YP5bIX9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Kz1bRxozBoNbAP14ZSUgciNQLwv03btkQdx57jsDzWs=;
 b=HadP3+bdaaeWR6Zs3CR5b7uMG/4/lrVSXMX3aXdOtHnfy2LTpCYt1fNMgJ+CKBM3sgITQmjrck6n7TwXM+09HaQsVaZsN3LOzOoOEjIRa431WiNClI0sFw+JMudouJqSVfVYT+BT5dRLXuTbcxQaCWrK6Ixerd6F0dvdsxS8lM2gt0b6/AYV0B6+74+H3iT/j+aqQYFT9V5/E+mM92WPOQnS6jBO4wOPQLuwehVwsUqO9sAlb5JJypmbRYWIEWyCMKiEZUGdkaK091T+ha5ffZdmZNol97lZXv5h6t3Id9wfffEOTVkDxTqBzbbI1a2v8eDbFHI5a+QjCYlzjqSsjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Kz1bRxozBoNbAP14ZSUgciNQLwv03btkQdx57jsDzWs=;
 b=l+kPqCeIqy8tCW9MNpxPd+DxfDnDkjZ21iLLguh2a7mKv/MLAlhvI9j0vyT+LkGmy8sTToxdzSuIstBJf7PctBn/arZwOiGFwepuPzfHqbB/5FaIpDWL9s9X03visjUhhvBoCSknRVxP0YyZwSpvf4HNiOYyNzUXhE2TY5Uz6Cg=
Received: from LV2PR12MB5990.namprd12.prod.outlook.com (2603:10b6:408:170::16)
 by PH0PR12MB7932.namprd12.prod.outlook.com (2603:10b6:510:280::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.33; Tue, 22 Apr
 2025 22:13:19 +0000
Received: from LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8]) by LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8%5]) with mapi id 15.20.8655.033; Tue, 22 Apr 2025
 22:13:19 +0000
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
Subject: Re: [PATCH v2 1/3] usb: gadget: f_ecm: Add get_status callback
Thread-Topic: [PATCH v2 1/3] usb: gadget: f_ecm: Add get_status callback
Thread-Index: AQHbs3HkkBcQOgE3iUeauo/MWl3WTLOwQJIA
Date: Tue, 22 Apr 2025 22:13:19 +0000
Message-ID: <20250422221310.6azlombifaf4d6ho@synopsys.com>
References: <20250422103231.1954387-1-prashanth.k@oss.qualcomm.com>
 <20250422103231.1954387-2-prashanth.k@oss.qualcomm.com>
In-Reply-To: <20250422103231.1954387-2-prashanth.k@oss.qualcomm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR12MB5990:EE_|PH0PR12MB7932:EE_
x-ms-office365-filtering-correlation-id: a8dd84df-c750-4fde-465d-08dd81eae376
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?YUJ4UTRTNGJ6RnBOMmRMNmlKZ1I1WDBESGx3dnp0RDZDUDl4TGt1SG5DaUx5?=
 =?utf-8?B?bmdZQWNpV1hlL3hIdkIrOTdWdXZ0V09FSnAxeFVhUjhFaWw4QVZ2MU9Zazdj?=
 =?utf-8?B?STQ5dnZYZy83U2RlNVNDMlJLRmw4NFlmUlo0Yzl4TUQ2OGFoU0drMllhSmNE?=
 =?utf-8?B?eHlTeEdTcWMvTWpTdzRydFV4WlhlQmRQa3owU1ZXejZiS2JEN0NKZXVOS0FI?=
 =?utf-8?B?cUVxT1RMdTJ0TjBJNkFhaEpBN3lkK0tXT0hkY1VIRXh1ckd6UHRKRTBRS1Nz?=
 =?utf-8?B?a1FsWjVMWkJ3NVhsRzU0UFRHSWNDM1l4UDNLR2tPM1d6WlhRUnN6WUxiTnFB?=
 =?utf-8?B?WEFGV3VmYlI3ZHhQSTBPU1Rza0lKeE84eTVyeVdHN3pHMWdFNCtRaXpneVV4?=
 =?utf-8?B?OTU3TXkvNDVvZEpxRXVQT1JFT2JEVjYzUTU5T1k0ZkFiRk93TzB5NVk3Vno3?=
 =?utf-8?B?cHE3V0NFV1RyVDlocWRJMWRlNklhaFdyNzZaTkpvL3VVZDVpbnBBOW9BQXVU?=
 =?utf-8?B?YVNrcGtxM292aW5Rclp0UjBEOG5JMnpxZVVKWHdCejMzMkNIQXFyYzd3WUor?=
 =?utf-8?B?dUs1clpHdEpiaDAram1QQ2tkTzl2UGJ3Tlh0K0p5NHljZGpXMUJVY2dLTGh0?=
 =?utf-8?B?bEErMERuWTY0NUgvZ3pwTTRueTdhR2NBWjBMYnV3dHVMSlRNMXBzdjNla0E2?=
 =?utf-8?B?MCs1bG44MXBjVmlLSnhIeGFiMHRUcWtyajBYT0Z0UmR6YWJzYmxqRXF4WUFQ?=
 =?utf-8?B?OUxBZVZEWlRUa0NvUklVNDZHbUFsWXhsdnpEeWNDQnMrb1pZb0Jyd1lqQ3dV?=
 =?utf-8?B?TWVxMFo3S3dkWTFzYTRIaHFhc21MT0pEdGVRVnFZZEE1MS9QYW9scjlxNndU?=
 =?utf-8?B?S3ByYStkSStuakY0amhrcTdhM1VKMXcyRDI4R0p4Y1NtUUhGMCt3ZUQ5bSt4?=
 =?utf-8?B?VDh6SDE3WFFXUFVRampTSVc3QlZDWXJvbkdyRFBXQWFlYytvQlNGUXFOV0Ez?=
 =?utf-8?B?djh3NURVWE9CdzVCTXM2UmRzNmk2eFhOME9OSk03YW01WWplSnBzSFZpT3Ft?=
 =?utf-8?B?ZTJlQTRzMVlyeVpNM3ZXcXZrbzRWVXU0RitHTWhwK1lraDhyait2bFlTZ1lw?=
 =?utf-8?B?aGdpaW9sM3hsREFKUFpyZysveSszc1NHZjAzdVpYNzYyWVZqUzF1ZWxNRUFX?=
 =?utf-8?B?bVVpZUQyTnJ6S1I3bU9jQlJmS3hMTytaOW1YQmdGbzFrdDIvMi8vMzNKVjBI?=
 =?utf-8?B?S2YvYW5KNlhIZWtkYnhXTWJCb0p5UFpYelFxdU01TFpSdEVMbVRETGxoTFpN?=
 =?utf-8?B?MHRnNWEwUVR0b01RLzRjTEFFc3p3VHdQaFJ4L3dtKzhqU3hNbUdPNk4xVmpC?=
 =?utf-8?B?VHNjcEw4YUhMRENJT0xpOGxFM1ZvZlV4Nk9kaHpoQ0ZaaXFKdUdhYkI5OVV5?=
 =?utf-8?B?S1U2NStyTUhkbnkvRGRBbjhSQ3pXQXdDT3RxMXBTYm1Td1RXQ3E4SDZuQ3I5?=
 =?utf-8?B?WW9QdS9idWR4b3BVcnRsaDc3VWdDVjE1WFZ4cUJtSzJXMUkwelZNclRsMHJL?=
 =?utf-8?B?ZEpJVGdnVkl3eFdHdkhGNFUrSTZ0YTdISno0dDVqZlFzNXBRUXlCclMzOU5i?=
 =?utf-8?B?Lzd4UU1FK1I4eDFrZ0lpdnhhcWNkUG5qa1dtdWUvMWNpL3BjaHRuSERCaFlX?=
 =?utf-8?B?R3Y0bzdqYkdUeVNwdldPeW41c25YSmtmUm83cXRPWndONHNYUSs4YkpHSFB0?=
 =?utf-8?B?K2dMcnZ4dWdEOHhETGRLRk9Sdzl1eU4zYmVtNCtjZlpuMXJTTk5KMjU4ZDhR?=
 =?utf-8?B?OGdoRkNKb09YU3FnemFnNTk5OUwzQjdBZUxPWGsxd2ZCWEk5bEtTQlRGYkZ0?=
 =?utf-8?B?eWNOTDQ4T2ROL2MvamNpeEtFbEI5MHBWZDdneFBVUGlaeWNsSE8ydTNzYjhI?=
 =?utf-8?B?U0RzV1dneHZ4ZE5WbVhFUEhPOHJOQTIvWS95U211NkJUOFBRYTFwNXRDditz?=
 =?utf-8?B?Z1VBZVk3WnRBPT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?YU5TNUJuMGVZU1VBSlAwU2R0OFBpZzMzNitWb1o0WDJ2ZjZ0NTFnNXk4Um5K?=
 =?utf-8?B?OGs1aXF5ZWJmSG0yWkc1RlM2V1QyaC9qSDhtUndRdVJ4d3JPMXJBOFFSb256?=
 =?utf-8?B?ekFLM2hGVS9vSzRuTDhzWmIrTGkvUFVQbVRXOU5PRGx4UnpTWUNsaXpsVE5R?=
 =?utf-8?B?aEZuSVlIVmR4TUQwa2lrbVhWeDdUdkdlMDRscXRPQWJUOC9nNzBWTWtQREhi?=
 =?utf-8?B?RXhxNzRneEk1THJNV1VQU2k5MXNJbXlaSmI2aGFDQ1dPVDlXV1lMaWhScnRx?=
 =?utf-8?B?YlJtcDY3elBselVRaTdtR3NxQ1lpekpNUlVrSGdWSnJMcnpheFA0dnFjWWM4?=
 =?utf-8?B?SGtqOFBLTEN2dkNxa3gveU03ZGZPV0xMWnR6bUlzdUtmZ3Qxc1dkRTRPdUZv?=
 =?utf-8?B?Y0pEYllXVFlaeDNIYnhQK3pBOGs1TzNxamtlcUN2WTVDanFUN3g0L3dZaDh4?=
 =?utf-8?B?ZFJ3V3dmTVVVcmNPUjcvNU53dU9vYkFUL0xlSHBEYjhyQjhLYlZ1amdZOGFS?=
 =?utf-8?B?TElHejRxdXoxM3pZSlk4QUdLeW9kNG1raWtIQ0M4OTZNRVd3a3BrQm9HQXUx?=
 =?utf-8?B?ckwvVE9sVG9haEoxUittZDdkZmorcm0xZXhVTXFMallxT2w2RVFIc3VSdnRJ?=
 =?utf-8?B?WHpyOVJDQTdHWHlBV1FZZHd0OEp6RXhvM20wNmh2OUZQTHdPSmdBRVVzTksw?=
 =?utf-8?B?Mkl4a2toSHFPVndOUUx3clM1MVVUR2F0bEthUHh1ZHAzWXhINXFpaExXYUxZ?=
 =?utf-8?B?R1VkamtRaE0vVnc2TjkzM1pJczRvL1F4SWo2cndhTmZSV3NZNElaYWYyWDdp?=
 =?utf-8?B?MFlCOVd6L0tyODFLemRXeGFBeXBXSDhBNDJ2SUR3UHNGbkwxSlNTYWJhUTlW?=
 =?utf-8?B?SmplUWRjVUhZQnp3UmlOT3VTN1R4aDFtaHNYWHM0QUJxT3R0d2VyVDkrbVor?=
 =?utf-8?B?dTN6SmhuRWVlZ1BiRkV2Y0U0ZERIUUkvWUZ6YmphbDFhWjdsT2xkZkk3MXo4?=
 =?utf-8?B?aTZzdnFaMXpqaG0zUmFqeHNmMUhuV3h6Sng4YjRuMTB6Wm9KSWZBTkpjQzMr?=
 =?utf-8?B?YXhpdVFrcXl2Zm5zcnpPN2dRR0tnblU4anFhb3hnRE5zRDhrZzdxQy9TdkJY?=
 =?utf-8?B?RThIT2Z4SXBOcmZsbU0reGdVUVRTNm4zZmt6ZjM3NDdTdndBaFo2Zm1meEFQ?=
 =?utf-8?B?MTFoUjY3V3BxMGZ2b00xQlQyR0JIbjEvdC91NEJTL1gxSGpkcnR1SGJ2U214?=
 =?utf-8?B?M2ZhUElPNFgrdXhDa2ZZeHNrTVFMV2tIdVJmcUJhaFM5cmZ3MEp5QzBBUUhk?=
 =?utf-8?B?UEtab0lDUEdMYUhzbVZHeTFhTmEvMVJiNTc2YUFpUTR0Nzhvc1NjOVR4VlRa?=
 =?utf-8?B?OWxabFB2NlJxMHY5aythK3J4NFJ4UHcwMWNJOWg0VzB4dERNeE1Xc1dUcFRu?=
 =?utf-8?B?WUJsZTNwVkxmL1Fhb0U5dGJoQWxOblp3cUYyTVZaY1pMYThvdzVnWHlXK0tI?=
 =?utf-8?B?djJvS0xyVzVuc1MrSTNrbGR3OGR0bDAxaGRjUktNajgyZ01jeTZIaTNCVWtk?=
 =?utf-8?B?Q2tGanBNcmkzc2RhZ2I2WkdGL2ppWjh6Z1c4RktuVXFXL250T3Y3N04zZ0ZQ?=
 =?utf-8?B?OHBwRHBWc09ZYTJYSUVVZFhXOWcwTjVZWW42alMrWUx3a0RCblIzSVZyMDRK?=
 =?utf-8?B?cVpiVmRNd1hrekg4OHQ5cmdzNkkxUFF6Q2NjdWM3eHgrQWhpN2FSZjljMWZZ?=
 =?utf-8?B?V2tmS2FsdUlZMFJuWFo0MEswR0E4QUxwSGJhRENJRXRYM3dwa3p2QnpLa3NV?=
 =?utf-8?B?TTJPRWFoNjR6VTdzU1A5US9TMEtGWlFEZHk4WTJDR1M5bXBhaW12QTFnQzdU?=
 =?utf-8?B?a0pZdVFYakFGa21FejVIUm0zK0pFMHdvOGxTcktJMG93UXBDVFpkUldYM2JH?=
 =?utf-8?B?YUIzMVVlK0xQaFhOT01LbGNZdGMyUXFWcWhXTzZwanJBNlJSblN0emVkNWo5?=
 =?utf-8?B?eXBzaE9JNUtoU3RFcGZ5WTlrUWRuY29uVEpYN3I3SFk5TTZWMUZDUW5MbVpt?=
 =?utf-8?B?d1ZYUGhQRzlIV3lUTWtON2RTdlhUam9VU243ZDNXL251aWFxYTNoczk5Ry9h?=
 =?utf-8?Q?LBswArylFVKh+FdLM/+kbNq2o?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <B81383C16478DA46861E233A242C04DA@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	PBJh61qXE1v+4PNxMhsquytXz3bMF4lE2XoD5ZWMx9cl7yVN7ccoAyoUxCmKHtekymEw9+Lyuhs9/jFOTmSWu0uH5KZJFzlp5kEdztLJscgRO3RlX2WgKVVQ63c9Dj92p7IIE9GgqV4D4fntnNH6tcUxxYr0YzDAxqyHboKCByIJbBRDtj65mTIbwkiboYnbztQZ5fZrxM42rFPQwN/Dx5cpbg7rYiJAM4NAI+Yx/kKLds6Cg/i09+obsRUObsrXVGQaOQpEN3iFbxr+2ZBEznYIN1/C0MupMh44D4Te03QN1WqtXGXHSSrMca6GBxAwqZjZBs4krQgKxX+4SWAdZt+fSQfDb5pVweEHqPRfULGA9tcdWwNHSlwu8x9Thd/ZMxir0E0gyiMrpOk8ej4bmOlUfmEC+Yctt4bXb7d5zyEEQeaezhKOTk80PPFUhMytyZhipYY3xgtpw6SW9OmHATnPn4u9ULZUqjq+jIewnUYapisys9Pmo93UxGDVj8YHekyiyi4VJBSa7d3nCJWbSgdVkuIhAXOzihYL/YByK7QCyyFMZc6Nz2Tx4SbF4oOlIzNpSlk+NyTJfASy1j8o8FOXVQDLVtmFDeVaBdOWqKiGdSOXSQEnnoyotuRWfOx+XOdv13U7CwWc4Emu4wZYZA==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a8dd84df-c750-4fde-465d-08dd81eae376
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Apr 2025 22:13:19.4908
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OERM4Rc9xxmVWufiDjw37p3QTCHHNj2H/Ea/uqL1hDPEtowbWtWDjCUGI6lE/ryxO6w91X+SGTW75ZuElRaVHQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7932
X-Authority-Analysis: v=2.4 cv=SsSQ6OO0 c=1 sm=1 tr=0 ts=68081485 cx=c_pps a=t4gDRyhI9k+KZ5gXRQysFQ==:117 a=t4gDRyhI9k+KZ5gXRQysFQ==:17 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10
 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=qPHU084jO2kA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=jIQo8A4GAAAA:8 a=bsfne1i3uOOM5u9VnPgA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDIyMDE2NyBTYWx0ZWRfX8vkCJ9MJRu4y QfjJ824xGSsC7fkFt7mzZ4Owd4gKwVC3JXAq+8+YflZ+2RWNxSEZuUdWxUJsyRer270Nfffiyxk oqbRzljy4rHdJ5hZZDtiGtzpR2n4nDPrps1TtZ6MBnc6AIze570dg3c3OJxWyKACdrngATR9sZO
 HxEVOVx/yIR2qhq9KS03fs54vLTQgMlaleGuklrT8M4RJ+kBz5SYqa38DzQCxOsycyBgENJ4W0i zJyAN3Xdq8rirw1tAZ8cnXSWXAQTOKUw9Uyscrsu/UVQOjZMh1q0l8IUJrxE7CrqxHEGVchKR1b DRRNNIwSoGXw0owWZsGQY5g8vFFENd1Iu6wY1D2tuOP8ukM8NoepiROpyA+gFMauEnoiXJYQAxU
 QdyOboBsy7mQoZ2ZwEnifXP3Pr+4aGM8TUkrRx45MfTjlVoieWrxpvEGg19sGtZ6/5Gg6KB6
X-Proofpoint-GUID: J-A9lwPPswRneX_T-zCHbetLlqFviVTj
X-Proofpoint-ORIG-GUID: J-A9lwPPswRneX_T-zCHbetLlqFviVTj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-22_10,2025-04-22_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 malwarescore=0 bulkscore=0 impostorscore=0 clxscore=1015
 priorityscore=1501 adultscore=0 spamscore=0 suspectscore=0 mlxscore=0
 lowpriorityscore=0 mlxlogscore=905 phishscore=0 classifier=spam
 authscore=0 authtc=n/a authcc= route=outbound adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2504070000 definitions=main-2504220167

T24gVHVlLCBBcHIgMjIsIDIwMjUsIFByYXNoYW50aCBLIHdyb3RlOg0KPiBXaGVuIGhvc3Qgc2Vu
ZHMgR0VUX1NUQVRVUyB0byBFQ00gaW50ZXJmYWNlLCBoYW5kbGUgdGhlIHJlcXVlc3QNCj4gZnJv
bSB0aGUgZnVuY3Rpb24gZHJpdmVyLiBTaW5jZSB0aGUgaW50ZXJmYWNlIGlzIHdha2V1cCBjYXBh
YmxlLA0KPiBzZXQgdGhlIGNvcnJlc3BvbmRpbmcgYml0LCBhbmQgc2V0IFJXIGJpdCBpZiB0aGUg
ZnVuY3Rpb24gaXMNCj4gYWxyZWFkeSBhcm1lZCBmb3Igd2FrZXVwIGJ5IHRoZSBob3N0Lg0KPiAN
Cj4gQ2M6IHN0YWJsZUBrZXJuZWwub3JnDQo+IEZpeGVzOiA0ODFjMjI1YzQ4MDIgKCJ1c2I6IGdh
ZGdldDogSGFuZGxlIGZ1bmN0aW9uIHN1c3BlbmQgZmVhdHVyZSBzZWxlY3RvciIpDQo+IFNpZ25l
ZC1vZmYtYnk6IFByYXNoYW50aCBLIDxwcmFzaGFudGgua0Bvc3MucXVhbGNvbW0uY29tPg0KPiAt
LS0NCj4gIGRyaXZlcnMvdXNiL2dhZGdldC9mdW5jdGlvbi9mX2VjbS5jIHwgNyArKysrKysrDQo+
ICAxIGZpbGUgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJp
dmVycy91c2IvZ2FkZ2V0L2Z1bmN0aW9uL2ZfZWNtLmMgYi9kcml2ZXJzL3VzYi9nYWRnZXQvZnVu
Y3Rpb24vZl9lY20uYw0KPiBpbmRleCA4MDg0MWRlODQ1YjAuLjAyNzIyNjMyNTAzOSAxMDA2NDQN
Cj4gLS0tIGEvZHJpdmVycy91c2IvZ2FkZ2V0L2Z1bmN0aW9uL2ZfZWNtLmMNCj4gKysrIGIvZHJp
dmVycy91c2IvZ2FkZ2V0L2Z1bmN0aW9uL2ZfZWNtLmMNCj4gQEAgLTg5Miw2ICs4OTIsMTIgQEAg
c3RhdGljIHZvaWQgZWNtX3Jlc3VtZShzdHJ1Y3QgdXNiX2Z1bmN0aW9uICpmKQ0KPiAgCWdldGhl
cl9yZXN1bWUoJmVjbS0+cG9ydCk7DQo+ICB9DQo+ICANCj4gK3N0YXRpYyBpbnQgZWNtX2dldF9z
dGF0dXMoc3RydWN0IHVzYl9mdW5jdGlvbiAqZikNCj4gK3sNCj4gKwlyZXR1cm4gKGYtPmZ1bmNf
d2FrZXVwX2FybWVkID8gVVNCX0lOVFJGX1NUQVRfRlVOQ19SVyA6IDApIHwNCj4gKwkJVVNCX0lO
VFJGX1NUQVRfRlVOQ19SV19DQVA7DQo+ICt9DQo+ICsNCj4gIHN0YXRpYyB2b2lkIGVjbV9mcmVl
KHN0cnVjdCB1c2JfZnVuY3Rpb24gKmYpDQo+ICB7DQo+ICAJc3RydWN0IGZfZWNtICplY207DQo+
IEBAIC05NjAsNiArOTY2LDcgQEAgc3RhdGljIHN0cnVjdCB1c2JfZnVuY3Rpb24gKmVjbV9hbGxv
YyhzdHJ1Y3QgdXNiX2Z1bmN0aW9uX2luc3RhbmNlICpmaSkNCj4gIAllY20tPnBvcnQuZnVuYy5k
aXNhYmxlID0gZWNtX2Rpc2FibGU7DQo+ICAJZWNtLT5wb3J0LmZ1bmMuZnJlZV9mdW5jID0gZWNt
X2ZyZWU7DQo+ICAJZWNtLT5wb3J0LmZ1bmMuc3VzcGVuZCA9IGVjbV9zdXNwZW5kOw0KPiArCWVj
bS0+cG9ydC5mdW5jLmdldF9zdGF0dXMgPSBlY21fZ2V0X3N0YXR1czsNCj4gIAllY20tPnBvcnQu
ZnVuYy5yZXN1bWUgPSBlY21fcmVzdW1lOw0KPiAgDQo+ICAJcmV0dXJuICZlY20tPnBvcnQuZnVu
YzsNCj4gLS0gDQo+IDIuMjUuMQ0KPiANCg0KUmV2aWV3ZWQtYnk6IFRoaW5oIE5ndXllbiA8VGhp
bmguTmd1eWVuQHN5bm9wc3lzLmNvbT4NCg0KVGhhbmtzLA0KVGhpbmg=
