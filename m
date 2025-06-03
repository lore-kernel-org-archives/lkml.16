Received: from NAM02-DM3-obe.outbound.protection.outlook.com (mail-dm3nam02on2066.outbound.protection.outlook.com [40.107.95.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6632117A30B
	for <linux-kernel@vger.kernel.org>; Tue,  3 Jun 2025 07:33:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.95.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748936016; cv=fail; b=grrpJz1q2oFWDgbQrDCTU6GM3EyR0wHi/av0jpCvHqRShiee/PPfP1+ADpQqHEwVjZOP0QeznYumacC9LjSLH1CHA1MyCsmgGAy5MIxiqkTBW14DQi/4yJ8oLbj2/E5NeE1FpWOYReF49wzwSVe6rWu/moTLXMVZ1UYGPq74DYA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748936016; c=relaxed/simple;
	bh=8oBII/Dkua9UPgvYpxVC4fjaLHZR4YV/Jkpw+SgCEoQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=ibh4bv91uoUMyhMqQi5YwNpTNBiPrmTJvfm8fOn9W5RoTH3uy7awu8qORV/ZJVYLkcmBL24M6YmFKjl9gW4AckOyYR8rauP5Z+6TpkNluYjm5HtnlN564/XPsory5p4LNctzH0YipRaExMltlt9twaQjCOx9Isg6ZzqmVKyTBDA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=OWIAlPB5; arc=fail smtp.client-ip=40.107.95.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="OWIAlPB5"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GqatYSGnAKe0n5IwWXM615cgxrjKJ1BHQILdvNVC/zW0v4L1oCfudKJQbrnKpjWr4V6YtW2Kw5sQxHIE3k88PmQgU+kidqWxI7oplJg3WbJ9GwivUGke3sMox2cXKQfFjEiEi+QFZH+0Si7rOKmC+BWtuGsX7hKScWXJiCaSjfTZb1T52Pk8y83cnk/El7FPKkGaNF5upVYMTtg2Dyf2HclsZIK8wHltievy5ZZ8k7UED47DNDPNuAQ1NOA/sdXS4p2EtA1lLFodd0hwElDnmF1RP0w2V6eqeGto5E7H19rwm77aGCB2SJp9PiG7BOogY7drAfWwpA/nl7PVgDrMOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8oBII/Dkua9UPgvYpxVC4fjaLHZR4YV/Jkpw+SgCEoQ=;
 b=Ftosd85oISSvO8zRaI3ZIINPkCULSyOpTEOR1Zrsj/XNW+t/u7L+xUKHmCtX8MmA97uMF0Ib8rxQXo6MlgONIusWff0Xca7zuKHNPR2z8EG2Jz0LkwLs1GAcXWjm/p7vniFt6cqs1E9hk/Kzts+8l9tgUDD71O5wcvO0vOTfPCGeumvBgF5Bbrh7Ytrf7uiTMidV+F21YNzbStnz9yibfmvAQ8Umso4/4kiyyTpn6TN7O6JZ9jqzPThUWum3YyRveNHUGt4ooe5oXGI7+395iaOaBQRxLZQHCBMt4Y5aZs98TDm9L+ZCjsKhWZpf7QQjyv3bIdPdY9jvjY1A3HKY8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8oBII/Dkua9UPgvYpxVC4fjaLHZR4YV/Jkpw+SgCEoQ=;
 b=OWIAlPB5myifTd0czDW6hQ0RH+TvcXeHYXs8pOo50mQ78HNCbKb2zBeNyuMJsYOM/rHzddm8KmXOU2UcKGcEubq5kzf2HTVG7gcwUDdpOpdRLacTLTL1MmhbrSS7uWpkALxAyks7nIuvMyJWMAD7xU7bsMfoM44vkGxQlgtNZXQ=
Received: from BL1PR12MB5333.namprd12.prod.outlook.com (2603:10b6:208:31f::11)
 by IA0PR12MB7627.namprd12.prod.outlook.com (2603:10b6:208:437::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.34; Tue, 3 Jun
 2025 07:33:31 +0000
Received: from BL1PR12MB5333.namprd12.prod.outlook.com
 ([fe80::d4a:9dd1:afd9:1c70]) by BL1PR12MB5333.namprd12.prod.outlook.com
 ([fe80::d4a:9dd1:afd9:1c70%7]) with mapi id 15.20.8792.034; Tue, 3 Jun 2025
 07:33:31 +0000
From: "Agarwal, Nikhil" <nikhil.agarwal@amd.com>
To: Greg KH <gregkh@linuxfoundation.org>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski@linaro.org>, "Gupta, Nipun"
	<Nipun.Gupta@amd.com>
Subject: RE: [PATCH v3 0/5] cdx: Minor cleanups
Thread-Topic: [PATCH v3 0/5] cdx: Minor cleanups
Thread-Index: AQHbuypbMy3CpimwhEKW+6Xfejvbv7PFdM/QgBmkJoCAEiL3IA==
Date: Tue, 3 Jun 2025 07:33:31 +0000
Message-ID:
 <BL1PR12MB53335655AF9C3B4216CF1B729D6DA@BL1PR12MB5333.namprd12.prod.outlook.com>
References: <20250502-cdx-clean-v3-0-6aaa5b369fc5@linaro.org>
 <BL1PR12MB53333E728D0A5837E453ED629D892@BL1PR12MB5333.namprd12.prod.outlook.com>
 <5c43b201-68ed-4d6f-8595-bd3df203e81f@linaro.org>
In-Reply-To: <5c43b201-68ed-4d6f-8595-bd3df203e81f@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_94523dde-f9d1-4aa7-80a9-c0900420d3c3_ActionId=7357dcaa-758c-4b4c-8d05-1f8fb1691f07;MSIP_Label_94523dde-f9d1-4aa7-80a9-c0900420d3c3_ContentBits=0;MSIP_Label_94523dde-f9d1-4aa7-80a9-c0900420d3c3_Enabled=true;MSIP_Label_94523dde-f9d1-4aa7-80a9-c0900420d3c3_Method=Privileged;MSIP_Label_94523dde-f9d1-4aa7-80a9-c0900420d3c3_Name=Non-Business_New;MSIP_Label_94523dde-f9d1-4aa7-80a9-c0900420d3c3_SetDate=2025-06-03T07:29:20Z;MSIP_Label_94523dde-f9d1-4aa7-80a9-c0900420d3c3_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;MSIP_Label_94523dde-f9d1-4aa7-80a9-c0900420d3c3_Tag=10,
 0, 1, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR12MB5333:EE_|IA0PR12MB7627:EE_
x-ms-office365-filtering-correlation-id: c72d34a6-1907-4f59-9d64-08dda270f08c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?bnF0Qlo1YVdtRk03M1I4L1FFZk55aWtWdiswN1dRazRFOGI1bjNIVXVlV3Z2?=
 =?utf-8?B?YVFseHRieUpHV2RueUJVdm0yeVNMZUtRdVBYV1BjYWl4L1AxQWd4eXc3ZzNN?=
 =?utf-8?B?YzlGMU96YXYvVndvT2YxYlZnTUJmdUxNRDNDdHU5d3lqSGV0MTZodktYaUlq?=
 =?utf-8?B?Y2tEb0hNZWhmakk4emhmYWZDaHZaYTZkVGJBaW9ZaDNtQnNSeDMxMXhVQ2Zr?=
 =?utf-8?B?SjdKcFFrWmNsRzR1RTYvNnh3MWYyOHc1dVc1dlV0dDdIak5rSFZNQ2xzakEr?=
 =?utf-8?B?NU1VTlpDTUNkUzZTSUVFZlNWMEM3blg3dEJzN3lNbWg4RFFaRXIvZzFqaVB4?=
 =?utf-8?B?K1YvWVlnOXllcjE0eWtyUFBIMWdFS3BDS2EzcU9QcDdtWFhCTm51L1pjRFJC?=
 =?utf-8?B?M29ETmtzdjNLODEzQjRUSHBvbVV3UUlLdUI1eHFrSnJYZGluR09YS2R6dFZL?=
 =?utf-8?B?cTdXS2wzS2VUTFlmUlhZUFJ0THRWaHRXbEd5eTBEVmpITFl0c0ZzellSKzR0?=
 =?utf-8?B?MDVVVHNZUTRwOHVBZkRxS1lUcG05TnJiQkkxZDR0S2JHNmc0WU1lT3pmTWlo?=
 =?utf-8?B?dVRHMHFMNlRmWk5mc21RMzFhQ0MreURzT2NQWG0rZGg3c1l6WnNKRVJuSmJQ?=
 =?utf-8?B?WXlnOHJTNXdMSUlJTy9EeWtkeFR0bkZpTzlzRnBuK084S2hWbXJ0blZLUnZC?=
 =?utf-8?B?N0FZVTh4anE3OEhwQVFUMzVyQk14R0ZPamduTEFkVi9KNmI2UWtKZHpYbnha?=
 =?utf-8?B?UG9XL1RqaUt1WHpIblBJZE1YTTBmTTdSN1dOV3Z2TGxadC91QWtNUlJIRDZm?=
 =?utf-8?B?WUZ5OHQ3cktMaHJHWld3VlJGNnNLNjJoS2VweWk3cVA2U2p6dGh1R1hxK3dw?=
 =?utf-8?B?NHRwbFlYUUNDWXZsZnBBL21iNFdUbWhWRGJGeGdjZ3Q4T2JlRFdCYjlpTlpy?=
 =?utf-8?B?eGhlc0V3aldPQXNabklKc0lGK0xUUWpST242ZmRYWnJUUm1LODdVNkpkNHJl?=
 =?utf-8?B?YTZYakI0TGs0Vkd1M04rQklaNWVtNEZ1OHN5ZkM3RjkvSjF2Qm9qclc3eGdX?=
 =?utf-8?B?OWgyUzZFZ1VhajBVeUhWQlpaZ2ZKU1ByWFpTU2NUT0d5M2huN1N4MEpPbVZH?=
 =?utf-8?B?MWxEaG9VT3FsU3RxZldjalNkU0dWNE96VWxvaVFVTmZRdWdtSmRPRU05OVRJ?=
 =?utf-8?B?UUxvaGdPRmlOaGtYb0pTRmtMSnU3R2pPME12VHc3UkVhNVArT1ZNTEhOWGNV?=
 =?utf-8?B?RS9zOWRncDNNUlRWcURLNXBMTGJOVjVBTXZHaGhHaWQ5a3QxNm13R3RkUEhj?=
 =?utf-8?B?RTF2RzFXQXB2TisxK1FPdDBNRFdWK1hKWkRCakZyMStOYVF2Yk0wbzhLbmU5?=
 =?utf-8?B?ZUVMK2hHM3c1M0dzeDNkR0Y4M2plYXoxU01KT0c0MWZnN0c3WHFqTEhKS21j?=
 =?utf-8?B?MUNpY0p3UVBmZFAxYmNBeVpqcllscFNzbVE5Z1RveE80VFNyTkNpVVRYSjF5?=
 =?utf-8?B?NXdNMUtvMFQwRldOUThZYjlxVElPWk5xbDhvZTQ2QnBRdzR2OXgzQmJUbEVk?=
 =?utf-8?B?NTFlTytwR0ZtdXFzcXoyWS9EdnhESDBpTzZ6THhIY3ZvN0EwYWdmNXlsQU1x?=
 =?utf-8?B?b0NWNytqWTBYRFd5UjJVcmMva24zaWZUOHROa1BjOVJYcFVDL3QzeFlpWWRW?=
 =?utf-8?B?dTNuREkrWXlLNlg5Z0hjRXdDMUs4bkV0Z1V4MjhSSk10Tm85RDU1Y1lnUUhC?=
 =?utf-8?B?RlpsRHIvSFJsN3FrZjdjSFdadVpyYlJoTk1QRk1xMllIMEJTczRTenpDbDB1?=
 =?utf-8?B?YXQ5RzhNZjlKRkdLcDNwVlNxeEY2SkZjWHBVc1V3N2l5UVI0T2FBNDkzemN0?=
 =?utf-8?B?SEVIMXdrQ21DTmptNml4bUVabUZ0a29FRVpXOTI3eFVGdVp0T0YzcS9WZWsz?=
 =?utf-8?B?aXhkYzV2NnlqRUlDWVZSUTl5c3pvTzA3bERTV3QvK0VNR0ZZNHMxYjhTekpR?=
 =?utf-8?Q?bVoJlmvVrib1MvXjekQd15FC7WQeg0=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5333.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?djFkZzdYSUJIZmZ3b2tCaTNXQ2RSYWZkcE1TaU1uWnpqYjNpZkVLdkZZRnRG?=
 =?utf-8?B?eXVMUjNIUmJRbXFIRzBIQ2xaUVVEQVhNbVZTbHBBc2tKbDlKVy8vWURDbzhF?=
 =?utf-8?B?RjVmT2pvcXYwRWxINjJlMzlpZ0doRzVHc09mRGJONHppS2Ixc3pkMWZSL0hl?=
 =?utf-8?B?cnQvTlRZV2o2SW1iRE0xUklwamZ6aU9GN1dEazBFc0F0cEMwWU5CVnY5ZGpp?=
 =?utf-8?B?UjU2VHRVV0R2cTYxb3E3bzhzb1BVdkRqTkdBRGw2cHd0dFprZkgrbE9ubTVr?=
 =?utf-8?B?MjJpY0wxRWZDbXpyTXpFVHVkRFdjRTZUVncySkh4OUhtRkU1bHJnd1kwaUNH?=
 =?utf-8?B?c0xlRkRvMVdYYjlCS3lZR3A2N2ZhU3k1WXZoYVd4S0V0YlNRVHpyb0c5UXdV?=
 =?utf-8?B?ZHYzNEVMWU5IVnN3MjdHallaREZjODJ1a0orUWw0QlMxd0NUdnJaMGxZdEJZ?=
 =?utf-8?B?RVJLNVluaHhQbXRKS2xSUzJSL3VLVk05SkpCajViSHhLUmRpQVlGSjF0TWJW?=
 =?utf-8?B?bTI4STg3Zy84dWRFQ25WMjFxYi9EQS9kZHlRbjE3dkdRTjFlU0lnbWRsaU82?=
 =?utf-8?B?T25LN3l1SWt2SFEyN291TnBQY0l5V0tQK2RtVm5Ja2RZMkdGYzZ3QWlLVS84?=
 =?utf-8?B?VlBpZ1NUeEl5d3ZWOHFzTEhkeE92cVg3bENmRE8wdmFBRTM2UlNKaDdpRFMy?=
 =?utf-8?B?cEIyTlZxZFloRVZKdGpqV1MrNnQ4LzhZbUdxcTFUbllpaGNST3hGZ05ZZW84?=
 =?utf-8?B?MlJFQUticVp0YW5LWjF0elg3Zkh3SjRuekNyak96VU5BQVZ2WVlxbzJJWGtn?=
 =?utf-8?B?NlJkU2prTUJwOVRFbkk2eGVGclg3OWpIc3pzNUREbUttdU03MWVFTlFHOG45?=
 =?utf-8?B?d2lyMk1pVHlRVTZhRTlzNTEwUHBHR0tMZFRtQUoyMWVKdVZtWkJhaXpha1hY?=
 =?utf-8?B?NkpoOGZock94TlN2enNvQ2lvdFJ6V0ZsTmpxUERWeWJkOVF6TG5neUIwa1ox?=
 =?utf-8?B?QXJuTlc5d043djRsaXg1bHRLdmVQU1VJeXYvaWROVk9IOG9zaTJkV0RjQXk2?=
 =?utf-8?B?TzFKSWxVZzNzR0NWampqRUc3MXF6dWNQV2R4OHVkdTdnVi9sK3BBMjU4cndn?=
 =?utf-8?B?U0h0eGZhRjhJTXdPVnNBUXJOYktnTmJZUFpzaU5EcDl0ZTdaRU54TlZ5aWkv?=
 =?utf-8?B?b3hmQlVlKzlSbkdzMFZyTVdmTSsyWERacVR3cm5jZnlrZWhKdDBpTUd2cUVK?=
 =?utf-8?B?TkJ2RnFQRENhd0tvQVNFcVE5MTFGUzFaTGE2OVVtdThCTmMxYjYzTDRNQXlY?=
 =?utf-8?B?cWVVM1JTSkZ3ZDltWU9zWENQY3IzaG5URDBlSXdaeWUyZ0haTEF6Z2I5aTZI?=
 =?utf-8?B?cU1hRmNPZ3h2UUlyaFY5emRXbXRRSGFBRjNnM1ZKOW4zOEhNTmFENm8xd3Nq?=
 =?utf-8?B?WmdKWVU4bDBZYkxrOEhXN25lRTNIV3pUckhya2JEUGFJdXNFS2IxMDdwZFpF?=
 =?utf-8?B?R3dwWm5Ta2NaY3VtNW5UUWJ5Zy9UeklPNTF0WDZGOGJFMVA0YWZqT1V2aE00?=
 =?utf-8?B?NmFDM2JzRlhoSFp4VittZTNadHczVEk4dTJPY2wwb01FaHZYaDVSblZWQVZR?=
 =?utf-8?B?OWc1TjJNWXlqZGpkeU9tWlpLOGQyeG9RMkNXbVZCbmNDTHptUkxLOXNrWDZ2?=
 =?utf-8?B?RE9nY1BPTUdjb3dFYkRlaTBRL0laU1ErTisrR0trRUJuNkNLK1ZzMDNZbGt1?=
 =?utf-8?B?cVNmUXpQcUtMclBVYjBWeUZ1OHY4KzdMU0ZGQWhBSW5ocGQ2bndzcHJSd1ds?=
 =?utf-8?B?MjVsRlhxRk5Jb0JLVzA2R28yQVQvRExnd1NGTyt6T280OTUxdkQ2NVR4QWxU?=
 =?utf-8?B?VGlxQjRyRVVTUUJFdXFCWU9wZmlSWHZQcTBJV2I5a2ZMS1VGa1hHZ2tvVlRD?=
 =?utf-8?B?MVl1cTE0MnAyVU4ydllEcVAxVzN1WmtvdnRIc3g1OTJYTHlySXhRM1R0eVRh?=
 =?utf-8?B?T2QrZ2wvak15bVJsWmxQdlMxSUhtTGloUmFoa0ZPWkhLcG1VdUQ1SEUzbTJT?=
 =?utf-8?B?QjFqZ3A4YUpkUnB1SHpOUElIVlJpVWxXMGovNFBtV3hITjIrM2lvMjVDMzJo?=
 =?utf-8?Q?cQDk=3D?=
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
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5333.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c72d34a6-1907-4f59-9d64-08dda270f08c
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jun 2025 07:33:31.1853
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: weA/kLk9GqRBlePbW1wTA8lPM7N2R3h8hM59uI4Cfvs0CsBL5bjRYqajPNbKhDxg
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7627

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBLcnp5c3p0b2YgS296bG93c2tp
IDxrcnp5c3p0b2Yua296bG93c2tpQGxpbmFyby5vcmc+DQo+IFNlbnQ6IEZyaWRheSwgTWF5IDIz
LCAyMDI1IDEyOjAxIEFNDQo+IFRvOiBBZ2Fyd2FsLCBOaWtoaWwgPG5pa2hpbC5hZ2Fyd2FsQGFt
ZC5jb20+OyBHdXB0YSwgTmlwdW4NCj4gPE5pcHVuLkd1cHRhQGFtZC5jb20+OyBHcmVnIEtIIDxn
cmVna2hAbGludXhmb3VuZGF0aW9uLm9yZz4NCj4gQ2M6IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5l
bC5vcmcNCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2MyAwLzVdIGNkeDogTWlub3IgY2xlYW51cHMN
Cj4gDQo+IE9uIDA2LzA1LzIwMjUgMTI6NTksIEFnYXJ3YWwsIE5pa2hpbCB3cm90ZToNCj4gPj4g
Q2hhbmdlcyBpbiB2MzoNCj4gPj4gLSBEcm9wIG1haW50YWluZXIncyB1cGRhdGUsIG9uIEdyZWcn
cyByZXF1ZXN0DQo+ID4+IC0gTGluayB0byB2MjogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvci8y
MDI1MDQzMC1jZHgtY2xlYW4tdjItMC0NCj4gPj4gN2RiZmRhOTM2NGE5QGxpbmFyby5vcmcNCj4g
Pj4NCj4gPj4gQ2hhbmdlcyBpbiB2MjoNCj4gPj4gLSBQYXRjaCAjMTogQWRkIEhBU19ETUEgZGVw
ZW5kZW5jeQ0KPiA+PiAtIFBhdGNoICM1OiBOZXcgcGF0Y2gsIHNwbGl0IGZyb20gcHJldmlvdXMN
Cj4gPj4gLSBMaW5rIHRvIHYxOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9yLzIwMjUwNDI1LWNk
eC1jbGVhbi12MS0wLQ0KPiA+PiBlYTIwMDJkZDQwMGRAbGluYXJvLm9yZw0KPiA+Pg0KPiA+PiBG
ZXcgc2ltcGxlIGNsZWFudXBzIGZvciBDRFggZHJpdmVycy4NCj4gPj4NCj4gPj4gQmVzdCByZWdh
cmRzLA0KPiA+PiBLcnp5c3p0b2YNCj4gPj4NCj4gPj4gLS0tDQo+ID4+IEtyenlzenRvZiBLb3ps
b3dza2kgKDUpOg0KPiA+PiAgICAgICBjZHg6IEVuYWJsZSBjb21waWxlIHRlc3RpbmcNCj4gPj4g
ICAgICAgY2R4OiBjb250cm9sbGVyOiBTaW1wbGlmeSB3aXRoIGRldl9lcnJfcHJvYmUoKQ0KPiA+
PiAgICAgICBjZHg6IGNvbnRyb2xsZXI6IERyb3AgdXNlbGVzcyBwcm9iZSBzdWNjZXNzIG1lc3Nh
Z2UNCj4gPj4gICAgICAgY2R4OiBjb250cm9sbGVyOiBEbyBub3Qgb3Blbi1jb2RlIG1vZHVsZV9w
bGF0Zm9ybV9kcml2ZXIoKQ0KPiA+PiAgICAgICBjZHg6IGNvbnRyb2xsZXI6IERyb3AgdW5uZWVk
ZWQgZHJpdmVyLnBtIE5VTEwgYXNzaWdubWVudA0KPiA+Pg0KPiA+DQo+ID4gRm9yIHNlcmllcw0K
PiA+IEFja2VkLWJ5OiBOaWtoaWwgQWdhcndhbCA8bmlraGlsLmFnYXJ3YWxAYW1kLmNvbT4NCj4g
DQo+IFRoaXMgd2FzIHNlbnQgMjAgZGF5cyBhZ28sIGdvdCBhY2tlZCBhbmQgc3RpbGwgZGlkIG5v
dCByZWFjaCBsaW51eC1uZXh0Lg0KPiBBcmUgdGhlcmUgYW55IG1vcmUgY29tbWVudHM/IFdoYXQg
aXMgaGFwcGVuaW5nIGhlcmUgd2l0aCBjZHggYW5kIHRoaXMgcGF0Y2hzZXQ/DQo+IA0KDQpHcmVn
LCBjb3VsZCB5b3UgcGxlYXNlIGFwcGx5IHRoaXMgc2VyaWVzIG9uIHlvdXIgbmV4dCB0cmVlPw0K
DQo=
