Received: from mx0a-00230701.pphosted.com (mx0a-00230701.pphosted.com [148.163.156.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D835920E6;
	Thu, 30 Jan 2025 01:48:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.156.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738201713; cv=fail; b=mYPISiRx1C6DOeoQGz0fpbyo+tCS6uw5T4vVW0QlKxTWFh75t2A5eRRrhrmyjhgc2pPJ7PDvN3o/pEt92UnF2bmBvdSinXu2Pm8WINmovjgHg/WRoaQtO4jqrg5sUQqY7wVPD8dzvYkLONMYu92ghLhLhCKweLM/Ly9uPdNW+qM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738201713; c=relaxed/simple;
	bh=jlAkNN33q0FhGVPbSYn4TDZ0SruV5uy36x06L+8eBYw=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=qzLi00LHjeq7u68KxwC8587ElROgkjKZFsET6G2dt7K0O4rgzIPsygb4OR5XPceet7I/IHehxxnoOkV5fm3OTMdIXDPKBeG3nKHmRKaWVe3XxGzD6zB5gEDRM6YYXU1ulTfBWPfdBA7ZZtblKB1UcbLXKjg6WuDV5KdgRsDXjos=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=GPHZSEfW; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=ac1iVV8X; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=u5f110Nc reason="signature verification failed"; arc=fail smtp.client-ip=148.163.156.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="GPHZSEfW";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="ac1iVV8X";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="u5f110Nc"
Received: from pps.filterd (m0098571.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50TIMgZ6012061;
	Wed, 29 Jan 2025 17:48:15 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=jlAkNN33q0FhGVPbSYn4TDZ0SruV5uy36x06L+8eBYw=; b=
	GPHZSEfW9eb35siK/xmURowrw8mq3QbAki3Qvc/4//QqSMhvJsHBrmaGVCxitNlo
	gV/f4ifexj6W37WFjjDed0HN9oVj+yFVBZdQkGY+/OmjSi0VBMHIQYIRaIHyz9bn
	LoRAkv15PHPNIiVddhcKTwB2Z9EB5ftBwo4wV3m/KmeUzZR93x+39V70u7drUN+R
	tmYXaCq6wiffpz8epVdQmHMmWlO74fzPrFn5AN+y0HyPzpohe47bMjyhI4bfl2Y8
	7lUAEO5MHUNrakLjyGtMOM0WMGS9bHEf7iIR0HIjtuXkB45qTPxUYE2q78E1LW9b
	MpvkYE0dfBhYLBKLOZQGwA==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 44fs4ra2e1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 29 Jan 2025 17:48:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1738201694; bh=jlAkNN33q0FhGVPbSYn4TDZ0SruV5uy36x06L+8eBYw=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=ac1iVV8X/U28aEAoDYUppvJGzGp93yl22kjDMUK5sKTWCYPvh087LpnhMYsVj02jr
	 RSA4eN0Po/zhpC7n3Y7glK188yPDIwuFSvfGatZUZ7rgSrHfBK1szsXfFpF2XaZegO
	 1HvvlXLatId3ewt51m9W428R4Pov4/2ybDZt3YXGhPBizPH+rCvjkfRnkTmzc0ZIeD
	 GJDP1LgaQnFh175ZqJSB9IQlZLu26TP1BT4HDxNaL2GijbmVoIG+Pq8/gSQT/0vf/F
	 hkbarxXTBb5FeyGczRAg5m1u/TBSHBFlteyRvpEN/Wi7lN5qcy//SQZVjG6k+W/K5P
	 QmgRTcFIVZmKg==
Received: from mailhost.synopsys.com (badc-mailhost3.synopsys.com [10.192.0.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 338344034A;
	Thu, 30 Jan 2025 01:48:14 +0000 (UTC)
Received: from o365relay-in.synopsys.com (us03-o365relay3.synopsys.com [10.4.161.139])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id 86831A00B0;
	Thu, 30 Jan 2025 01:48:13 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=u5f110Nc;
	dkim-atps=neutral
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2046.outbound.protection.outlook.com [104.47.58.46])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id B884A40519;
	Thu, 30 Jan 2025 01:48:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UYANxUf1tGKfxYvWksmAqbg/FblbAgpBW19C9CQw0yj4rR0MHF45W+UOmyuo92+S6v1B4noUAKzjE/w5apWdqbaKaTw9qNFfyxYh4K6Gn4DXi09eoOkz4r7JhCnzh+TR9NScTL6A0MQkFY0s5u49RLZjSZLvraE00PiKY73dxpSA9DoDBEjbquHNiiWx7UupF7rqSk5/biKl8yVYpq/zXveZBFVe9+9PiFnIV7sgWAsxwtl8MG1qbVn1jKQW+MxnVVifsgJcOioEBgUOgwn7COH5mbt23ZMb+znpdrGi+xGkvGdTKa+B3BN+9Pd36O5lnMmW3AwHfkpVio07G2C+ZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jlAkNN33q0FhGVPbSYn4TDZ0SruV5uy36x06L+8eBYw=;
 b=zELCuzHe4QGPRznO0AAZEkwt83y+WkFkeEg0/qcYY/KQEE8yFdfPt9losYRw1T63jcIHOw5M+y7CTVXZowJj45SvGBFDhVBwdAbl4LWkb+YLBhbo0fc/+KSDiLjsMx3wS2NVGg/a49nV/+geTee4y3qMeGSBUZ0N4ubLyYrrj75oRacSZhmlqCWFTgF7NNOe+U8XCQFG1fQ7TpluxhEcsxajpwolbeAaQE3bIJBjdOTjlLrg2vrXGoYuYhJ5NH9APasQUtImymaij0FLVrA37T/Hz7Cm2kfotVjJ+NlUyRmRk3YvAaaeNAOmUWGjOvaaGwE06rW1NSPKRI3XFtOc+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jlAkNN33q0FhGVPbSYn4TDZ0SruV5uy36x06L+8eBYw=;
 b=u5f110NcmvJrMwY6dTyxBOQMtaawiUb+yCqdHbgZFbGpzPN3EK0VuTJI3bSGtFCwv2HYMeMAOFENJXioYNP7p+8HZDnw1jBfI2OJZJ/wrHbTgv+5pcKM0UES7ZI2ZshaUekCI8TVHaWY+jq3TUrrAHl5AwewTHolrlcf3lqnlwM=
Received: from LV2PR12MB5990.namprd12.prod.outlook.com (2603:10b6:408:170::16)
 by DS7PR12MB9503.namprd12.prod.outlook.com (2603:10b6:8:251::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.18; Thu, 30 Jan
 2025 01:48:10 +0000
Received: from LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8]) by LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8%7]) with mapi id 15.20.8398.014; Thu, 30 Jan 2025
 01:48:09 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
CC: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Felipe Balbi <balbi@kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Ferry Toth <fntoth@gmail.com>
Subject: Re: [PATCH v1 2/3] usb: dwc3: gadget: Add support for
 snps,reserved-endpoints property
Thread-Topic: [PATCH v1 2/3] usb: dwc3: gadget: Add support for
 snps,reserved-endpoints property
Thread-Index:
 AQHbaC0cpC84VeNkokazhZuYFimpJ7MaDjKAgADp6wCABxWwgIABA12AgAh6QYCAAO8XgIACJyWA
Date: Thu, 30 Jan 2025 01:48:09 +0000
Message-ID: <20250130014805.rycrh7ty6wmi566u@synopsys.com>
References: <20250116154117.148915-1-andriy.shevchenko@linux.intel.com>
 <20250116154117.148915-3-andriy.shevchenko@linux.intel.com>
 <20250116233507.sifqs5u3rixoz4lw@synopsys.com>
 <Z4pb5CTS5n5wtJ7d@smile.fi.intel.com>
 <20250122014347.fc3ntfkl7cismjxd@synopsys.com>
 <Z5Em5bvAwu8QgRo8@smile.fi.intel.com>
 <20250128023943.spxp7sv354iusrkt@synopsys.com>
 <Z5kL_w0yqUHMRDzQ@smile.fi.intel.com>
In-Reply-To: <Z5kL_w0yqUHMRDzQ@smile.fi.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR12MB5990:EE_|DS7PR12MB9503:EE_
x-ms-office365-filtering-correlation-id: 10f43d26-e6ec-4f0a-3857-08dd40d02673
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|7416014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?ajBDbjN1djhhS0RnWTZXb3UrOEl2ek1qZkp6VkJZQ0c1bVd2aTV5eTJnVWpL?=
 =?utf-8?B?RC9ZN1FpbWhXeG5jS2N3ZDFUdlJRVEcvcC96UHRjd0syTU13OVB6VTFkeHpD?=
 =?utf-8?B?RE5UWkRPOU00KzBkZWRvRFp5VHFham1rMUtDWE9BZ0FYeUpFRUJiY2MrTldv?=
 =?utf-8?B?UXgxVk5rcFRxRGcwTTYwb2ZNNm9ja0E0NlFmNU1WL01zcEpkT0lBOFF3Q2ZD?=
 =?utf-8?B?cE5nMmY1VklnVDVJZG1ISmIrSmFvaDlpQU04M3NUWlJHbmJsOEZrQWRwcGlD?=
 =?utf-8?B?QVZ0bitmWVdRWStGN0RBbmFkeHJOa0NPMUpNYU5lbjRkWDV6WW1CMWhXS1Bj?=
 =?utf-8?B?RGpTQjZucUVNWVB1MUR3V2ZkT2pFSWZ1citOZ1plSU41bWN6dnVWK2t1R2Na?=
 =?utf-8?B?ay9rTGhuQmdLY2tzdS81ZFpjUGIwL25uWnBtdnV0dlduM3RMUTZld1ZuVjZB?=
 =?utf-8?B?UEdqNXcyZVZVMWRsNkRRM05SRlJFVXVlRityajZ4RUZLalBMSU96cGRGT1FB?=
 =?utf-8?B?U0VtZ1R6d1RLYjVSNVhuZWdtQjlpeGpxUExlaXF0Ly8rY0JkWUExYWtHNHA2?=
 =?utf-8?B?bW5IaXJlRGNEb0VRL3puWU9kQnQvL2NxaTRTT0JHdEt0eTNIOHZjekF5TzFw?=
 =?utf-8?B?TFdyU01RL3dXRm5sazZNOG1MYXRJU2RqRVhHTC90Vm1BbG5YQXM5amYxajhR?=
 =?utf-8?B?TFNKTm9HYXphMTZRT1cwOVBqMGFsSjZHNmRYeWhxRFRyRzRNZ2tQTVNNR0Jt?=
 =?utf-8?B?c204dllIYysraFYyQ0tYRzZOVTQvOUxnV2dOWVJ2M2Z0TFNYUVdQYVl1bUtu?=
 =?utf-8?B?bkp6bmEwYUEvMml5RVRTUTJ3a0wxWkZ5Q1lxMERoQllDaWZvQi9VMXBIeDBL?=
 =?utf-8?B?TDFtU200dlFhKy9rY2JWUlZLcC9aVzZNc01wWGZlaVp4WUM1MFZSNnB1RWxi?=
 =?utf-8?B?eUhMd2pRWlZXUmk5aVBnekRxMmJTRHpKclU5MkdNMVBQU0NnSWEvdk1VV3ZN?=
 =?utf-8?B?WjJlT0wrT0FVMXU3Zmt1UnFoTGVuRzhJWTUvOFpvRWFDT0xsTE9KV1FPTUpI?=
 =?utf-8?B?V0hhbXZlZnptb1NBalBmVGhJaG9sNVZtbFY0UjluWkVhbndkUUprdTJ0MEhV?=
 =?utf-8?B?MytLbHBtNy9YTENHdjRuMThvQzN1b3VQMVlFMlNSeld3blFVOFhHK0NQK0lU?=
 =?utf-8?B?TTFHc2tXMjZXNjNONHg1Rk5SRnQ5QVdRRFYzQW52VWNUTlFMUXNmYWZlUGVZ?=
 =?utf-8?B?SVhWdzdwbkgrSVM2WE5NcTBKQVQ3UHEvcnRlMEJVRlJxRlBFNldhZTZzTjhU?=
 =?utf-8?B?S3BNTmRMNytJdzBqWGMxa3hkZ1ZUb2w4dkU0L0F3QytuQTdYOGUwdVlTT0lo?=
 =?utf-8?B?aTBaRjhMSlFiQ29iYnEvSzR0cWhUb2ZYU0tCdkhKd0JGaVJNWEw0RHZiejRu?=
 =?utf-8?B?bkg5OEt2VEZ4dmlkVWxHUk5DdDRRaVRRVzF4dlZ6Mlp6RmdkVkpEWkhBQ3JG?=
 =?utf-8?B?aXdtNVREQmZBM1k2VHplYXJLbG5IaWdUcDBRak9mc3NzajhoNEZ6dm1FMHZp?=
 =?utf-8?B?Q3crTWdRU1RlNDMxMm53UE41RDlGQ0hScTZmQlFicDdXQk84eWJvc0hZcmNm?=
 =?utf-8?B?eWJIYlhPZjhBbXZIRmJXelU5SnRUMWh4aXJuV3l2amE1MDlwZXExa3Q0ZXMy?=
 =?utf-8?B?K3k5QVNFMXhQSkZqanNjUTIwekxEdG42UHVrNmRidlFicS9Qb3Q5STF2R3A0?=
 =?utf-8?B?T21UQWpBeXM0d3U4NUdUQitPQWlPY0JzY2FiSDdFNHdZZjFEQWEwVHZvR25k?=
 =?utf-8?B?a2xtQ2RjL2dkY0pjNjVWdkgrcXBVVTA3OGlvU01lWVJRUk40bVlRSDFLZjIz?=
 =?utf-8?B?cVJadW1nOGMwUGRKS1pqeEYxRkF3bzVBZW55TytyVUZWbEl4RGdhamhFYXNi?=
 =?utf-8?Q?7AHJVRc+fiMZ5nmn/d1s2IqtqCDCUcxM?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?djVkVGwvSSsyMTRSNlNGVVhIQzkxRDA5N3V1UDJmOGpCQWZPcjZ5YURNM2V1?=
 =?utf-8?B?enNmRXV1VjlObXNZbDVzQ0JtRWlvN2U3Ui9XdzZyRGw4bmt2L25uNENvREVa?=
 =?utf-8?B?R2VnRGIwaldFdTF6RzMxOFV6T2lpZWduZkVXd1hmMDg1L0lGQ1NuY05CUHY4?=
 =?utf-8?B?ZEJ1S3BLVTdqZ1NwdDBWd0t3TkRZL2J1bXJkY0RDWFZ4VUdBRVZhaDVKeVk0?=
 =?utf-8?B?ejFVcW9sWTVFQjlwZnBOOGZDbm51bTFYQXQyOWlGdVc2Qy9IUjFOMEt2Qk40?=
 =?utf-8?B?NFEvaEhRZkFvbW9UYzZUQ0F1NE12TUZiWHNybXdVbjFhWU0ydlVIMTRoeUth?=
 =?utf-8?B?WXpVL1o3a3VHY2xtNnlpeS9sNkdqYmJnQXV6SzJjcEM1SlJ2NTdPQ1l5R3ZI?=
 =?utf-8?B?ZUIxQjdxcnp2N2JNQ0R3VFN1Z3p1WHVXSWZXOXFhNEZ4bzB5dHpYSDNWOHVn?=
 =?utf-8?B?VXZ0ZU85UDg2Qk1lM0VpWThSa3FwU0pkVDBwS3B2Y2I3N04zL2xIZTh3YWNY?=
 =?utf-8?B?ekV0T0pCUFVNcXN6WHFiTnl5MEthSmE3T1hyTm5QTWRQRWFyTGZ2ZWlDRTVn?=
 =?utf-8?B?cjV6VTVKc2lWVUIwaTNYeit5WHJGb3Q1QzVGU0FZemk4OFVPZHZPVTJ2bE1O?=
 =?utf-8?B?OEh3NjNsMmJONFZLV0dOV3p6Nit1Q3ZSOGRUelpPbVBiZHJCUlUrWDdSUThB?=
 =?utf-8?B?RmVXT2g2dTJLRGJJdVdzUVk5c1g5MlZYREpHRlNXSDQ5MHFQTHhlZkZYMm1F?=
 =?utf-8?B?SFVaMGlzS0pYcER3YngzVU9INWcxYmJxdGYzckxrbXd0UGhuRnE2WmRwWXor?=
 =?utf-8?B?OEtPSTNhak1XZVh1TjdHRCtKRlVKUmwxRlNoZ2ZFK0E0T1J0TzNvTlNzb2d0?=
 =?utf-8?B?V21oUTZORnlmcXpubWN5d01vUlYzRk5YNTBranhURXpKaXVqMmpYQ2phYXhw?=
 =?utf-8?B?ZVJSQlZrcG5zaWl6SUc2L2Y0V29ZSFhMaWp2WXNLZU5XVS9GcXIvRWFITWRD?=
 =?utf-8?B?dVVuOC8zKzRweHJONjM5dmJZbzZVVGtUaTViVTllMGdtU3ExdFBiVjJvMkV6?=
 =?utf-8?B?d0hyRnFsS25qQjNrVktXbmp1S3dvVHlvc0xSN0RuWkJXbTBWeHRnWWxVT3Uv?=
 =?utf-8?B?aVA4V0dJcUEwaDc5NDN1ZTVhaU0vVzNnK1ovUm5XTVRodzE4QVdqeHpWZUl6?=
 =?utf-8?B?eFRZK3kyNjFDVW9Gb1N6RmR6Zzg0ZWUwbm5rWU1FeUQ0b09nQW9jZUx6dnpi?=
 =?utf-8?B?VUpKK3FUN1pITWNCZW51aFhMMmo0RkdNSlVHUTI3TE8xbFVucVJFYzhDb1NK?=
 =?utf-8?B?RjBIZ0owZFYrRjdmYW9QUlExRWtGZlZLNEs1VS9sbGJsSUhKR2NSZlkyaFFv?=
 =?utf-8?B?SjJTd2pldS84TDMyNS9laVQzR2VWM0RMOUFhSXM5VzBUdGk5aTUxZHVFZjY2?=
 =?utf-8?B?blhZV01qVnNqOFVNNVpDU1dTMVpadlNacjdNcW5IclNXMXF0eUZtWVdkU0Jz?=
 =?utf-8?B?SitDZ3JkNjdkcm5INnJ6a1FHM0tiOE9zYmFXRnhmRWhlM1RjMGZ6aEhEa2U2?=
 =?utf-8?B?N0ZGYlkrYzV4NC9LZzdhTWt6aWYrOVJBRXM5bkZJVkxVMHdQcHlxQ2NRSU9J?=
 =?utf-8?B?VVRsdUlQNFJoOStVNTA0ZTJ1K2k1V3c3UUt6c3FHWHRZODVSbUVJQmJRbllB?=
 =?utf-8?B?VUI1SXR0ZVY3MFNnRzRuRE9OS3Y3M0Fyb1BQaURtL2pqUlpRV1RCb2svbk1y?=
 =?utf-8?B?S21tWUtlUjhSWWFlQytQVk83elNYMWtXOXUzL1pSaThLdEZoK1BjMUhLYm5L?=
 =?utf-8?B?SW0ydmR6L0dJb0VCSlJYeVVBc2ZaeWxnNktkVXE5bldZMkY5STR5Ry8vVm5J?=
 =?utf-8?B?UThzMkhKL3lOMHRDL3BMS1ZkQVpjM2YrRGFMZWNxc2UvZ253M3k2SEdzVlkw?=
 =?utf-8?B?REt4Y0M3SS9lWWwvaDNUYUNPSlhVSk9rb3FtQjVqSDA4OXo1ZnNXcjBLSjY2?=
 =?utf-8?B?VmRZSHZuVGk2L3U3akxTQys3T1ViMzZMWVRwM05qTEVCWlRRSzF6NHpyQjF1?=
 =?utf-8?B?TS9xRUJ3M3RSNGpOemhGSEZYbFRTcFhHWFJjaUZpWUwvYjl2WEZZZUExOHhh?=
 =?utf-8?Q?nkLHTuZObw2FI5ICU2Jr6ZluD?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <B648FBB1A6152349BD5057379723646E@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	wzreIXqpCVzMAe2kOAVjpEVIGrxrxQMRzpgP0xKA4QnAZQZ+R0HY6t6bCs+IAlSHRpncJIXb2KrnOpHEZpUo4g6MiE5neUlM1HgG8qHsdgeS1HkZhSB5FSm6vGMd0P9j5nSaMn4UKNU5UDWmhezz/a9peAbF5K2PA/P+MexaXQrIC22P1nQaV2qgHNDw/pd4a/4lJ91B/uUNVjmD18BFG+GJNZX+INzKrONhfmaQtUSoiPRoNsWBalw9q9ef8IQNRyI+DtNcwUV8mmyea8UKl5DLIThpsVSkKIW1ncrG25dh2G4JyyDo0bnOiqvkMAwwoWcRHZzKEgzFn2gvqTuFqNA7A44jGceDeNKjJCf6uc3FnZq4lKbsTnjO1AKimF3zj9lMO7H/N/Bo2/a9GCv8RJDiLEyOvDTAW0ul8ePQA8NGsgSUe6VOC6rc2sd42bmpDGZVZLANEtr2DWrH2Hv5Zq5OoE5QyaM1vqmu/14PW7yFXaWvreVoEjcTkgvoFN+oUf3fspgojsxPMTY+klzyPizuoZXzH2MXc02Xz1+oMeO6Toir3JO7G7j9S/HXtfAGf2sixjuEpFkuFXf/qWJyLJpJIn/S2YEHU655xBencDy64i31kC4DMF26QWBYuioBBDXsAaqO9wefVVq1zNyVrw==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 10f43d26-e6ec-4f0a-3857-08dd40d02673
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jan 2025 01:48:09.8835
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8m2BydzGLj7/6LOhB5ieR2LLzrWuHaL59sPrZZEg0OPuKe/MXhqcHGImp1MK7CfGo9vkmQR5QsfS7MW+PN/KXw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB9503
X-Proofpoint-ORIG-GUID: IZiKxBmCNfoALteGRaMGXBp4tRCAYKvd
X-Authority-Analysis: v=2.4 cv=GPbyEvNK c=1 sm=1 tr=0 ts=679ada5e cx=c_pps a=t4gDRyhI9k+KZ5gXRQysFQ==:117 a=t4gDRyhI9k+KZ5gXRQysFQ==:17 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdSt8ZQiCzkA:10 a=nEwiWwFL_bsA:10 a=qPHU084jO2kA:10 a=rO4gCv9M-MiK1aM3-8AA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: IZiKxBmCNfoALteGRaMGXBp4tRCAYKvd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-30_01,2025-01-29_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 phishscore=0 spamscore=0 impostorscore=0 adultscore=0 clxscore=1015
 mlxscore=0 lowpriorityscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 mlxlogscore=507 bulkscore=0 classifier=spam authscore=0
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2501300012

T24gVHVlLCBKYW4gMjgsIDIwMjUsIEFuZHkgU2hldmNoZW5rbyB3cm90ZToNCj4gT24gVHVlLCBK
YW4gMjgsIDIwMjUgYXQgMDI6Mzk6NTBBTSArMDAwMCwgVGhpbmggTmd1eWVuIHdyb3RlOg0KPiA+
IE9uIFdlZCwgSmFuIDIyLCAyMDI1LCBBbmR5IFNoZXZjaGVua28gd3JvdGU6DQo+ID4gPiBPbiBX
ZWQsIEphbiAyMiwgMjAyNSBhdCAwMTo0NDowMkFNICswMDAwLCBUaGluaCBOZ3V5ZW4gd3JvdGU6
DQo+ID4gDQo+ID4gTm8uIFdlIHRyYWNrIHRoZSB0b3RhbCBudW1fZXBzIGluIGR3Yy0+bnVtX2Vw
cy4gVGhlbiB3ZSBkbyBmb3ItbG9vcCB0bw0KPiA+IGR3Yy0+ZXBzW2ldIGFuZCBhY2Nlc3MgdGhl
IGVuZHBvaW50LiBPZnRlbiB3ZSBjaGVjayBpZiB0aGUgZW5kcG9pbnQgaXMNCj4gPiBOVUxMIGJl
Zm9yZSBhY2Nlc3NpbmcgZHdjLT5lcHNbaV0uIEhvd2V2ZXIsIHdlIGRvbid0IGRvIGl0IGV2ZXJ5
d2hlcmUuDQo+ID4gU28gSSBhc2sgZm9yIHlvdSB0byByZXZpZXcgdG8gbWFrZSBzdXJlIHRoYXQg
dGhpcyBjaGFuZ2UgZG9lc24ndCBicmVhaw0KPiA+IGVsc2V3aGVyZSB3aGVyZSB3ZSBtYXkgdHJ5
IHRvIGFjY2VzcyBkd2MtPmVwc1tpXSB0byBhbiB1bmluaXQgZW5kcG9pbnQNCj4gPiAoTm90ZSBJ
IHNlZSBhdCBsZWFzdCAxIHBsYWNlIGUuZy4gZHdjM19nYWRnZXRfY2xlYXJfdHhfZmlmb3MgdGhh
dCBtYXkNCj4gPiBicmVhaykNCj4gDQo+IEkgc2VlLCBzbyBoYXZpbmcgbXkgY29kZSBhcyBpcyBh
bHNvIHJlcXVpcmluZyB0byBjaGVjayBhbGwgdXNlcnMgb2YNCj4gdGhlIGVwcyBhcnJheSBpbiB0
aGUgX2dhZGdldCBwYXJ0XyBvZiB0aGUgZHJpdmVyIHRvIHNlZSBpZiB0aGV5IHdvbid0DQo+IGNy
YXNoIGR1ZSB0byBOVUxMIHBvaW50ZXIgZGVyZWZlcmVuY2UuIElzIGl0IHdoYXQgeW91IHdhbnQ/
DQo+IElmIHNvLCBkZWZpbml0ZWx5IEkgd2lsbCByZXZpc2l0IHRoYXQuDQo+IA0KDQpZZXMsIGhl
bHAgZG91YmxlIGNoZWNrIHRoYXQuDQoNClRoYW5rcywNClRoaW5o
