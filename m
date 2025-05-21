Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2043.outbound.protection.outlook.com [40.107.93.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2963E12E5B;
	Wed, 21 May 2025 06:13:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747808021; cv=fail; b=ZVH/+4h7/M8rdARPrnSeXDQ0c2xOK6L6ru3vlWZjoicQxcYPLaDG2taylto+YCoqlcIp0dAUPg+mgzgj9BUXihwh42BkoOltLZesNkFQZLYWJZ2OdStQ+fyZXfDLNhx4MzxOwUy7wxvKkgUiDF9rCHpG1ysVwEHXs20Elc/lvFA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747808021; c=relaxed/simple;
	bh=nRSL6vI/AZeOGsdMzIjHPnEggcoE8bp5+Y1uj7ijKew=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=bJHukKan8N3d5m3fpGh7ZsHy4yvKkNgW6gQ3yMlMPkXxkhGikySsJIG/zPpgp9lll5bcnBefMmjSOk5MhaLPqhFYN+cqut2ZUZk5QtIFbleo0WxQz0zT4dXc/SkT2q/wFOP1shHwUEHDjUHy+0oEhiatZPSuFC4XHs7pckNo3Pg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=Q7nvHADc; arc=fail smtp.client-ip=40.107.93.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="Q7nvHADc"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZavOU3/M7qVWdkwRZBuEQvvi+tinIhgYpAK5YgoJUgAi4Rzm4Kj5f4NAyEPse+uDch8/2/2denHq6tHigDQCSAggfrqzFhG7+Xjr5PAQqJTfFdB1L4Xw3dg2JwC/kGEtEhbTp2wGx2Um4DOA1PENqAn77cZz5jYuQWgZpqUddZCjKoqsKDd6klCAVloLX+xzab1hfpoAfzCmBc/w5257RulKK0EcRzgCrlS2S7pKPO0K6SiFxcVRuPomFTOnhW/krQHrVWVgX79N2Tb0QzmM+miBpaMUm8XUi4A3uPTSVoDC+I8QW5RtwgpjajJStC5PJVeHy2D9UEZU7/RiOxeimg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nRSL6vI/AZeOGsdMzIjHPnEggcoE8bp5+Y1uj7ijKew=;
 b=JjYnehmcIpt+xlvG2AkAzaeZCpOfMpsyqxLY16W9bhVvwe6XguK3P780I6KOaZdCpU/P2vb34l1nEWkhdVu0j8OiSEtAfQmly0DmOeGMl1KQvlJqZKn+VTaFxVxg9t+Mb7OmWAidgVzex7jq3GIs5QYOJFhCueqkD+YnBf8H6FyyUhSTRt/JykBmaDt9g7KIiUyhMFgMdq3UNNJnhTn2/Zz4y0Q6jgSQlXBj8oKOndF/ak+KajuwIlCyt5LtxOk1PT31v4JL59Otx0bdf4q3rLSeH8yCbzvmTKveLBbF4K/wWtqLF04H/jskPoL/+vbssBfpCgPqoxOlUB3+DSoB1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nRSL6vI/AZeOGsdMzIjHPnEggcoE8bp5+Y1uj7ijKew=;
 b=Q7nvHADc2o+Qwklj7M2cVzi6RPG0rfvdU6UFmckCchDS2kvnWh1e2Lxx2Ibtw5Xoj/OpxJ75PKbeuVSquS7r2B00Tx1zug2wwqSKaLSAqkf1o+dHmudryEdU3feGXk79sCmRMiDC9BrTsyZv+4OwQCMjyhX2OFcC4KhLPmrgJts=
Received: from IA0PR12MB7699.namprd12.prod.outlook.com (2603:10b6:208:431::7)
 by PH0PR12MB7815.namprd12.prod.outlook.com (2603:10b6:510:28a::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.30; Wed, 21 May
 2025 06:13:33 +0000
Received: from IA0PR12MB7699.namprd12.prod.outlook.com
 ([fe80::7ed1:80d:75c:f1aa]) by IA0PR12MB7699.namprd12.prod.outlook.com
 ([fe80::7ed1:80d:75c:f1aa%6]) with mapi id 15.20.8746.030; Wed, 21 May 2025
 06:13:33 +0000
From: "Mahapatra, Amit Kumar" <amit.kumar-mahapatra@amd.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
CC: "richard@nod.at" <richard@nod.at>, "vigneshr@ti.com" <vigneshr@ti.com>,
	"robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "git
 (AMD-Xilinx)" <git@amd.com>, "amitrkcian2002@gmail.com"
	<amitrkcian2002@gmail.com>, Bernhard Frauendienst <kernel@nospam.obeliks.de>
Subject: RE: [PATCH v12 3/3] mtd: Add driver for concatenating devices
Thread-Topic: [PATCH v12 3/3] mtd: Add driver for concatenating devices
Thread-Index:
 AQHbd9MxLQsfHKHRn06jkLCPeMCORrN5TCNcgENn4yCAEqYgooABy4BAgATCa2yAB0dpsA==
Date: Wed, 21 May 2025 06:13:32 +0000
Message-ID:
 <IA0PR12MB7699044F76475546F31AAC26DC9EA@IA0PR12MB7699.namprd12.prod.outlook.com>
References: <20250205133730.273985-1-amit.kumar-mahapatra@amd.com>
	<20250205133730.273985-4-amit.kumar-mahapatra@amd.com>
	<8734fa8hed.fsf@bootlin.com>
	<IA0PR12MB76994BA493127004B569F2AEDC832@IA0PR12MB7699.namprd12.prod.outlook.com>
	<87o6vyjgfl.fsf@bootlin.com>
	<IA0PR12MB7699B60558C5211F8F80C471DC96A@IA0PR12MB7699.namprd12.prod.outlook.com>
 <87o6vsejke.fsf@bootlin.com>
In-Reply-To: <87o6vsejke.fsf@bootlin.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ActionId=5978418f-1324-4064-870f-2df73f28a83c;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ContentBits=0;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Enabled=true;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Method=Standard;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Name=AMD
 Internal Distribution
 Only;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SetDate=2025-05-21T05:16:53Z;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR12MB7699:EE_|PH0PR12MB7815:EE_
x-ms-office365-filtering-correlation-id: c7649e2c-6047-47d4-fa71-08dd982e9d4e
x-ld-processed: 3dd8961f-e488-4e60-8e11-a82d994e183d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|7416014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?WDlOVnpjM1hseElPUDZCcnZVcFpCY2d2cWcrMnBEckdWZHFOSEtOSnZ0RlVH?=
 =?utf-8?B?NFNGdnZWTDdsMVNKTjZsNHBPSW5MSnJZK0VVbGt5L0FrditmZVhNRDMzWHJB?=
 =?utf-8?B?YVBMR3BsSW1iQ3F6Wi83VWtLMTRGeXNlM3Fqa1Z6bk5KQkFvWmphbDdFZTNj?=
 =?utf-8?B?ekZ6VElIaTFoTVdSdFMxT3gzRHhJWGlQTVZmS3NIQzF3dXg0NlovTXpJR0Q5?=
 =?utf-8?B?Q2d6L0dzNEdEOHIvTkcxdmlwdTg4cG51a0h3S2FFaTE4bTJKekVTc3c4d1li?=
 =?utf-8?B?WlJyRTRBY3V6Nzc0dlJNcm10U1dJMlRkMkJvYi9vdFhRaXVUOTI5L1dxbUhG?=
 =?utf-8?B?MHZKTFFidGUrQXVGdUN6T21RaWpoUlhXcEs4UGJ0bU56NWY5R3VZOUNUKzAr?=
 =?utf-8?B?R2EyaTVEbXRFbzVpZnROQzNPSDNsTXhxYmNqZUsyYU9VWTN3VnlhWlNvbGtT?=
 =?utf-8?B?YmNObHVlVHRZUVhHa0tqalJNN2tUSnpIR3Q3YytwdE1Cc1BtNnNqdkI4VGhW?=
 =?utf-8?B?c2llZUNla3p0UTk0ekltdzVDU0VudFJYb0d4N0ZCY1pHaHpud05xa0k2K0N5?=
 =?utf-8?B?cGo3RVh1Q0hGNFQyM3NBTVc0QVYxWXpMeWRBeE5rdWhYWlZMclhVckFlbWx4?=
 =?utf-8?B?cVYxS0xNOVpnZ1BrRXhmVjdTSXlsTGhoL1haTW55ekdCV3NDRFFoU2xxUE9P?=
 =?utf-8?B?Q3dsdC8vcWlOb3paTU02THJMdVN1VFE2RXlDZmgrK3V0MEJhd1EwY3hUeGJF?=
 =?utf-8?B?dGFpWDN2a3psRkFoZFFGWGFiYnpycnduVEwxRmdNV0NaWVJIN0s1R21ya2dM?=
 =?utf-8?B?SjJjRzlvN0R1b1ZXUU0zU0M5V1ZhcThLKytlanNQZ3R0eHFVc1QzOUFCWDgz?=
 =?utf-8?B?dmF0MkRBMnlKL0tHYmo2d0V2cEd2bkt4Rm9hK1lPUnFCZTZYZm1vajEwUnlY?=
 =?utf-8?B?Qy9uWWNlV2xSSUJKTDFNNkpUeWxuMVMzdHpxaCtnYk5DRkdiZkhlR3h6NFJZ?=
 =?utf-8?B?L1lMSnhsaHRuem5QSlF3OFFseC9SMEx6Nm9ubHlFN2owVnJQcFlqbEJjZldW?=
 =?utf-8?B?ZHRMVlpUckpDYWxiSVh4clgvdlR0b0hYekRhc0VMVGhIRm5xdk1BUWJIdkI1?=
 =?utf-8?B?STRoUGF0d2NHVk52cHcrSWorTkdBbW9BbkZQOU8wY3g3ZnB6REtJUWxKNFBp?=
 =?utf-8?B?WXF1M3hNSm0zaE1Yb0JvaDFnZzZoTEpQOGZiMmE4WG5aSGxyek9WNUNhL3Zu?=
 =?utf-8?B?WFUwWDdXVTJrWHFaUUYvVGQ5ZjJOaUtjcEVxa1AzY2V2K055RFlUV1VUcTVi?=
 =?utf-8?B?VkYvWkVHbUViRGdtdjgya1ZnVldkQlJ0Q3JYclIwWDhKYi93L3ZPQWNyZXVr?=
 =?utf-8?B?WXlXZEF3aldhMUcwRGkvOXNpTlRoY1hrWUxCcjBTTll3b3o5ZXVteTZ2Umt4?=
 =?utf-8?B?bVhsTVN6MXMybFZCekhhaDlCbm5wb1pJVHZpUjRTSk04bnd5R2NsOERXUFFz?=
 =?utf-8?B?NkJ2UmRybUtZanpNLzRKdVZOUkZkVlRnNms3bnNQZjJXbHpDbWc0dG9GVjQ5?=
 =?utf-8?B?UVU2WDBzUHpCOTNwM3FzTENFSnVkYStPVEt5SGoxRE1LemVlSXRrWlkyK09B?=
 =?utf-8?B?MjRmK25PMVh6UStDRUJ5YnFtUk5HRFRiWnBHWTJuMWJLU2UwVC8vZmMydVNQ?=
 =?utf-8?B?dmdSUjZnU1BGNDF1ekR6SzdwK3FvSmpQakcxK3ZsRzlmRTNRajRESUlkTVR5?=
 =?utf-8?B?OUkzOHBwK3B4UkRMNVkrVStEMmNlV3BDUWxBbFlqSTFNYzZ2VWd5Vll0d0VR?=
 =?utf-8?B?T0U3V2FHSXNNdGMrc2drKzVnM3RGV1c3YUxaSVF6bVppOXViOWQ0S2N0Tm9M?=
 =?utf-8?B?bnM4Nmt5QURZUUdXSWoxb1Z6eUJRSitoK3hQOVBDOFpmNkNJTmhEUDgyMHkr?=
 =?utf-8?B?K210dkNhKytaTVZ5alh2NXJOUTZtbTJEWHVBV0NoQjF3anlSRjlHOWplSjdR?=
 =?utf-8?B?amJXdmExU0VnPT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR12MB7699.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?Z0tLWWRqbWMwSitOcDlBOEJLdTlzUmRjYnlzdEhORlZrMU94VlZDUk9rVTNp?=
 =?utf-8?B?NVEzZ0g0c0I0RFpJbHJpK0Vwb2ZsYjk2dnJYVXRQaVVKc2JBVWJOYUN3b3VW?=
 =?utf-8?B?VmpYQWVzemw3MFRta2ZWTGdvaEphNnBtd1FIWXFUT2tNN3Zlb0N6SnFNdU5J?=
 =?utf-8?B?MEtWQmlCWVcvTUx4Y2UvYS9MOFdHdThuUEJPNzRGMVdnei81YVVoNEtpS2dx?=
 =?utf-8?B?WmJCWU5nLzgrZ05vTStKODhZM0Z2YzBQblJRWlRlYmhxemZoS3JybllWTTFi?=
 =?utf-8?B?VFdzWTBPcSt3aUk5NjBDMVBBZGZnRWRSS1RUL1dnMnYxUStBcTVIYUJSNVlV?=
 =?utf-8?B?bjlHMVZzdWJYWkc2bFptRlVlREdncFZENHpUbVR0ckNveUNzY3FYRE9mcWw4?=
 =?utf-8?B?aERXa2xRYjFZRm9VVS9QVlIrbXRUYTBXUDQ4M1FNN1ZteU1kZk5MWHdYa1lW?=
 =?utf-8?B?VVAwV2d5VlUwNHlnZ3NWU21kZEJIY1V5SDRIcHVEVlZFMWliUHc1Zll5RWdC?=
 =?utf-8?B?RWtmcEh6UzlZTnQvT1RTWnRlSS8raVRPWFZxS2k1ZHZobGxhVFd3NWVwZHM5?=
 =?utf-8?B?TVZSMG8zL2ZNRWY3M0RqUkF3aGZmTGZyeXNhNVBnS1A5VytHSmRNTHVEVy9t?=
 =?utf-8?B?dHk5enc3ZEJYa2hQajU3MXY2NzhzZDdIN1F3RThiZVVJbjcwOGpFeDNDNlNM?=
 =?utf-8?B?cW81aVF3ZUtBSkFkbGhqMW05RUpOM1J1Q0dteUc5anVvbUJ4WUVoZUVjeXRF?=
 =?utf-8?B?bXB5ZlI2UUVjZmd6MWU0U2ZjYjRCZFV3azZXMG1IcGdXTno3eERuYXd0OE4r?=
 =?utf-8?B?YlV4OU9nMUFZUUU4bVByY2hOa1lMMGFaWW1Cdk13TFNFbVBhV2M3ODRJRjRH?=
 =?utf-8?B?NTlxcWlTb2xKSkhKSXZNWkU5V3Q1ZDFuQmoyLzBZRTRJZmp0cmRQQVlISGND?=
 =?utf-8?B?QzJOUlZhY0VjemxzY3dsbFF5c2FrandBbUlsZmFVMG1QY2dzdE9abmV3bHdt?=
 =?utf-8?B?TnpXTEd5cm85QmFNYUNQSTAyMlhuSUpnZXo4SnlCb2ZFSzhQUEZhdkFZaGo3?=
 =?utf-8?B?aG9xR0piVExwWDI3ZllxTnFhb2kzTTU2eDJQTEE5L0RqRUFTUFlUZjdEMmky?=
 =?utf-8?B?bHRNT1BNdVF1ZWRDS3k1VWo1QkpkZWpEN3FxWjFRbTlqVXFNSjZacHVVMWRZ?=
 =?utf-8?B?ZUpkU29yK2o3ZEl1Sm9KRzZLdzdsb3RZMklWa2RPeUpYczB1dytwU3Bkc0Rx?=
 =?utf-8?B?TmJ5WERqaytFS0JtRUcvaHF4anJxTi85RTdEaW8yY2NFOExMR1JlakZFcmMz?=
 =?utf-8?B?Q0s4VFJ5YkU1SzFheGU5UFhFKzJqaUZjMklPaXJKai9Xd2NzRWJ5K05EclBW?=
 =?utf-8?B?UVZGc3RRUWtWTlE5d3dWMG56SXN0dkY1SXp5enJ6ZUtWSHNQb1hhMWVVMWNW?=
 =?utf-8?B?QjJPWU9BMFc5OU1RWVdldDVxZStkQmN4QzVBTkpDL3RYZ3ZtclVmdEgwV1FT?=
 =?utf-8?B?ZmFhbkVrb0VIV01sSGMxOG9mZG1mVHViRDRSZlJ6MlpPb1VDNEl0QVhXa3N6?=
 =?utf-8?B?TGpKbDFwY0ZabnUvN0FZbW8wbkEvYk5VdmRPTFB6TUJpTW90N2VELzUvNlh4?=
 =?utf-8?B?aG13ZUExdU4xMkUxSS80NkhiREZsUXJ4d0h1Z3JoNElTM2lrNXZDVnJXR1NO?=
 =?utf-8?B?M3VwaERRTlExc3dFczR0ZUJLUVdSTzExOVFFcFNIbEIzVVlFRXhLVHI5Ni82?=
 =?utf-8?B?ejl3MWhweGdjOFB0OWcwL2x0dHdlcUx1Vk80Skh2UEVIRFZxY3FGdnJUMTdu?=
 =?utf-8?B?c09WV2phQ0gwOHV2YXR4dWthR3hkeldzQWdDZzFrdWlaand6Z1lSL210ekpI?=
 =?utf-8?B?WnVKK2FHWUMzSTdwWlA3RkpuMWVpYWdtVXhOTVQrUkhoWEFuS1J5Kys4SXlT?=
 =?utf-8?B?NnF6a3dSUU5hT1JKN3hteUVpN3o5R3dhL3RkaUd4d2ZRSEZKZXJWYVQ0MXdz?=
 =?utf-8?B?eUZta0lUV0VERFdranlvY2plQ1Nua2dsODZkQnFxc3Y0NVppNlZiUUZ3RXVP?=
 =?utf-8?B?MUxLazJ6d21PTzdtdGhLZzZQMmJTSFZFdHY5Z3NLNEhPcFhPaWdlS2lYMW5D?=
 =?utf-8?Q?IP0E=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR12MB7699.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c7649e2c-6047-47d4-fa71-08dd982e9d4e
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 May 2025 06:13:33.1327
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9Y1J4b3fooRzQEOZQzTWMo6xd++rNJwqqixxT+99ffETROZ4sAjoyXrx4fNgHJueZhsWZFZaPWR0wHLpTdr+nQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7815

W0FNRCBPZmZpY2lhbCBVc2UgT25seSAtIEFNRCBJbnRlcm5hbCBEaXN0cmlidXRpb24gT25seV0N
Cg0KPiBPbiAxMy8wNS8yMDI1IGF0IDE0OjQ1OjM5IEdNVCwgIk1haGFwYXRyYSwgQW1pdCBLdW1h
ciIgPGFtaXQua3VtYXItDQo+IG1haGFwYXRyYUBhbWQuY29tPiB3cm90ZToNCj4NCj4gPiBbQU1E
IE9mZmljaWFsIFVzZSBPbmx5IC0gQU1EIEludGVybmFsIERpc3RyaWJ1dGlvbiBPbmx5XQ0KPiA+
DQo+ID4gSGVsbG8gTWlxdWVsLA0KPiA+DQo+ID4+ID4+ID4gKyAgICAgICAgICAgbXRkLT5kZXYu
cGFyZW50ID0gY29uY2F0LT5zdWJkZXZbMF0tPmRldi5wYXJlbnQ7DQo+ID4+ID4+ID4gKyAgICAg
ICAgICAgbXRkLT5kZXYgPSBjb25jYXQtPnN1YmRldlswXS0+ZGV2Ow0KPiA+PiA+PiA+ICsNCj4g
Pj4gPj4gPiArICAgICAgICAgICAvKiBSZWdpc3RlciB0aGUgcGxhdGZvcm0gZGV2aWNlICovDQo+
ID4+ID4+ID4gKyAgICAgICAgICAgcmV0ID0gbXRkX2RldmljZV9yZWdpc3RlcihtdGQsIE5VTEws
IDApOw0KPiA+PiA+PiA+ICsgICAgICAgICAgIGlmIChyZXQpDQo+ID4+ID4+ID4gKyAgICAgICAg
ICAgICAgICAgICBnb3RvIGRlc3Ryb3lfY29uY2F0Ow0KPiA+PiA+PiA+ICsgICB9DQo+ID4+ID4+
ID4gKw0KPiA+PiA+PiA+ICsgICByZXR1cm4gMDsNCj4gPj4gPj4gPiArDQo+ID4+ID4+ID4gK2Rl
c3Ryb3lfY29uY2F0Og0KPiA+PiA+PiA+ICsgICBtdGRfY29uY2F0X2Rlc3Ryb3kobXRkKTsNCj4g
Pj4gPj4gPiArDQo+ID4+ID4+ID4gKyAgIHJldHVybiByZXQ7DQo+ID4+ID4+ID4gK30NCj4gPj4g
Pj4gPiArDQo+ID4+ID4+ID4gK2xhdGVfaW5pdGNhbGwobXRkX3ZpcnRfY29uY2F0X2NyZWF0ZV9q
b2luKTsNCj4gPj4gPj4NCj4gPj4gPj4gVGhlIGN1cnJlbnQgaW1wbGVtZW50YXRpb24gZG9lcyBu
b3Qgc3VwcG9ydCBwcm9iZSBkZWZlcnJhbHMsIEkNCj4gPj4gPj4gYmVsaWV2ZSBpdCBzaG91bGQg
YmUgaGFuZGxlZC4NCj4gPj4gPg0KPiA+PiA+IEkgc2VlIHRoYXQgdGhlIHBhcnNlX210ZF9wYXJ0
aXRpb25zKCkgQVBJIGNhbiByZXR1cm4gLUVQUk9CRV9ERUZFUg0KPiA+PiA+IGR1cmluZyBNVEQg
ZGV2aWNlIHJlZ2lzdHJhdGlvbiwgYnV0IHRoaXMgYmVoYXZpb3IgaXMgc3BlY2lmaWMgdG8NCj4g
Pj4gPiB0aGUgcGFyc2VfcWNvbXNtZW1fcGFydCBwYXJzZXIuIE5vbmUgb2YgdGhlIG90aGVyIHBh
cnNlcnMgYXBwZWFyIHRvDQo+ID4+ID4gc3VwcG9ydCBwcm9iZSBkZWZlcnJhbC4gQXMgZGlzY3Vz
c2VkIGluIFJGQyBbMV0sIHRoZSB2aXJ0dWFsIGNvbmNhdA0KPiA+PiA+IGZlYXR1cmUgaXMgcHVy
ZWx5IGEgZml4ZWQtcGFydGl0aW9uIGNhcGFiaWxpdHksIGFuZCBiYXNlZCBvbiBteQ0KPiA+PiA+
IHVuZGVyc3RhbmRpbmcsIHRoZSBmaXhlZC1wYXJ0aXRpb24gcGFyc2VyIGRvZXMgbm90IHN1cHBv
cnQgcHJvYmUgZGVmZXJyYWwuDQo+ID4+ID4gUGxlYXNlIGxldCBtZSBrbm93IGlmIHlvdSBjYW4g
dGhpbmsgb2YgYW55IG90aGVyIHByb2JlIGRlZmVycmFsDQo+ID4+ID4gc2NlbmFyaW9zIHRoYXQg
bWlnaHQgaW1wYWN0IHRoZSB2aXJ0dWFsIGNvbmNhdCBkcml2ZXIuDQo+ID4+DQo+ID4+IFRoYXQn
cyB0cnVlLCBidXQgSSBraW5kIG9mIGRpc2xpa2UgdGhlIGxhdGVfaW5pdGNhbGwsIEkgZmVhciBp
dCBtaWdodCBicmVhayBpbiBjcmVhdGl2ZQ0KPiB3YXlzLg0KPiA+DQo+ID4gSSB1bmRlcnN0YW5k
LCBidXQgc2luY2Ugd2UgcmVxdWlyZSB0aGUgcGFydGl0aW9uIGluZm9ybWF0aW9uIHRvIGJlDQo+
ID4gYXZhaWxhYmxlLCBsYXRlX2luaXRjYWxsIHNlZW1zIHRvIGJlIHRoZSBtb3N0IHN1aXRhYmxl
IGNob2ljZSBhbW9uZw0KPiA+IHRoZSBpbml0Y2FsbCBsZXZlbHPigJRpZiB3ZSBkZWNpZGUgdG8g
cHJvY2VlZCB3aXRoIHVzaW5nIGFuIGluaXRjYWxsLg0KPiA+IFJlZ2FyZGluZyBwb3RlbnRpYWwg
ZmFpbHVyZXMsIGFzIGZhciBhcyBJIGNhbiB0ZWxsLCB0aGUgb3BlcmF0aW9uDQo+ID4gd291bGQg
ZmFpbCBpZiwgYXQgdGhlIHRpbWUgb2YgY29uY2F0ZW5hdGlvbiwgb25lIG9yIG1vcmUgb2YgdGhl
IE1URA0KPiA+IGRldmljZXMgaW52b2x2ZWQgaW4gdGhlIGNvbmNhdCBhcmUgbm90IHlldCBhdmFp
bGFibGUuIEluIHN1Y2ggYQ0KPiA+IHNjZW5hcmlvLCB3ZSBjYW4gaXNzdWUgYSBrZXJuZWwgd2Fy
bmluZyBhbmQgZXhpdCBncmFjZWZ1bGx5LiBCdXQsDQo+ID4gSG93ZXZlciwgaWYgeW91IHByZWZl
ciB0byBtb3ZlIGF3YXkgZnJvbSB1c2luZyBpbml0Y2FsbHMgYW5kIGhhdmUgYW4NCj4gPiBhbHRl
cm5hdGl2ZSBpbXBsZW1lbnRhdGlvbiBhcHByb2FjaCBpbiBtaW5kLCBwbGVhc2UgbGV0IHVzIGtu
b3cuDQo+DQo+IEkgYW0gc29ycnkgYnV0IHRoaXMgZG9lcyBub3Qgd29yayB3aXRoIG1vZHVsZXMs
IGFuZCB3ZSBjYW5ub3QgaWdub3JlIHRoaXMgY2FzZSBJDQo+IGJlbGlldmUuIE1vcmUgc3BlY2lm
aWNhbGx5LCBpZiBhIGNvbnRyb2xsZXIgcHJvYmUgaXMgZGVmZXJyZWQgKHdpdGggRVBST0JFX0RF
RkVSDQo+IG9yIGp1c3QgcHJldmVudGVkIGJlY2F1c2Ugc29tZSBkZXBlbmRlbmNpZXMgYXJlIG5v
dCB5ZXQgc2F0aXNmaWVkKSwgeW91J2xsIGdldA0KPiBpbmNvcnJlY3RseSBkZWZpbmVkIG10ZCBk
ZXZpY2VzLg0KDQpPaywgYW4gYWx0ZXJuYXRpdmUgc29sdXRpb24gY291bGQgYmUgdG8gcmVtb3Zl
IHRoZSBpbml0Y2FsbCByZWdpc3RyYXRpb24NCmFuZCBpbnN0ZWFkIGludm9rZSBtdGRfdmlydF9j
b25jYXRfY3JlYXRlX2pvaW4oKeKAlHdoaWNoIHdhcyBwcmV2aW91c2x5DQpyZWdpc3RlcmVkIGFz
IGEgbGF0ZV9pbml0Y2FsbOKAlGRpcmVjdGx5IGZyb20gbXRkX2RldmljZV9wYXJzZV9yZWdpc3Rl
cigpLg0KSSBiZWxpZXZlIHRoaXMgYXBwcm9hY2ggd291bGQgYWRkcmVzcyBib3RoIG9mIHlvdXIg
Y29uY2VybnMgcmVnYXJkaW5nDQptb2R1bGUgc3VwcG9ydCBhbmQgcHJvYmUgZGVmZXJyYWwuIEFk
ZGl0aW9uYWxseSwgd2UgY291bGQgY29uc2lkZXINCm1vdmluZyB0aGUgZW50aXJlIGNvZGUgZnJv
bSBtdGRfdmlydF9jb25jYXQuYyBpbnRvIG10ZGNvbmNhdC5jLg0KUGxlYXNlIGxldCB1cyBrbm93
IHlvdXIgdGFrZSBvbiB0aGlzLg0KDQpSZWdhcmRzLA0KQW1pdA0KPg0KPiBUaGFua3MsDQo+IE1p
cXXDqGwNCg==
