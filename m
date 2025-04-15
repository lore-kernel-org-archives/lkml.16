Received: from NAM02-SN1-obe.outbound.protection.outlook.com (mail-sn1nam02on2069.outbound.protection.outlook.com [40.107.96.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A33042BEC51
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 14:59:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.96.69
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744729177; cv=fail; b=TM42WLDppUcw78fMSV5aO9vxDE6yZjDpPz/tycyMB0EXnsgJiuKUc+Ff8zOD9wrV6M4AZAMSacS3v8LsiD7X7hk0LjjMzr7eiwUPhxganDxHADg1dDCZn6w3ExmJfoPk8Yd0Jc7wiPuaxxpcReOieSQlAQmNOZRkhoi+7eQ51bo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744729177; c=relaxed/simple;
	bh=px+a4F4sTu86qz+SU95Jw5DIhUfNpmwslC5K1PFMRrA=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=I+pwVrwbJQdxRI+Dx0WSk4+MnUhBW69wgEevmsyS3UVpfUGptYHG5/WcKM4BTU/KddazjtQbNYc+7XKw0vy7MoLrHkYIVrKcn8nc8B5bdelfvWkXi/KVHGAvL0kuI3DH5ZrbYFjLiluOFQb9oPGs9DDMQzkSnna4MWHl5x0HzP0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=P6ZXQvJ0; arc=fail smtp.client-ip=40.107.96.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="P6ZXQvJ0"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mbSo9il2IL2dwKL8DXes9h6MZJ+9IEa6OmwY9n5CJGGiLTAh8uqmXqOA0UcP3H16yIdDSIyU16Lil7V7xPSig+RFsaxUXzK+9BZKAsqPODyfl1uBvw95jmozskH73pO0Mnv9EO2/6TICaTmcpdVBdY0XVXi/4Qqg/C1eaXVrSFnp4fZ6MkaiiMiLN/4WgR4oS75P/aqNHP+515UdnF1SeL/RocCElDQPW4p6IIiJcE4XpKNuft27KioYQihU3ZjA/0D4qCSvTUBnDy/EDpgSn2mCY0TAzCD3JNivNXWnsK4ra6Sqy9tOukHsXiyKKkwTM8NugBufIiVT84INm1IaYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=px+a4F4sTu86qz+SU95Jw5DIhUfNpmwslC5K1PFMRrA=;
 b=KAnPDP6Ilxio8qAroEdn6h6PXZ6759z5b997hQ/bNCHJo9xzGCZHsutXM2vPG+scPr/8uJFQHwII7UfzzJpcFRfRmSoogOe1LDTZrRU6i9y2qtYjPo/I0Z+mK4vFBHEfFOozj/moQnEzbQ6aQkC7F2Eaf97AouzeULgU/mpT3BDryjfzq54Z1rdpH2Mm3/4kyHiaI4eLUns4XOg7WE6UaYJ1SC0Ml04n0+nH8tORcGupM78KYGxvzp9CLRw0xg4zz1lI8YjNpTCsOpURSwKD/WxObhw7sblMrkFaVKy/vc5OiVnY26nHz+l6/i4L6TQSX1hh7JIwzzbC37xKu3iPdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=px+a4F4sTu86qz+SU95Jw5DIhUfNpmwslC5K1PFMRrA=;
 b=P6ZXQvJ0FzsaEaguMDqbITBFIzk6Soz1CXLPtB6hjucJWDZMjQXcW2/jcDWF/vTd1PYDmUNn6es/b19g/7B2rkO57kTW1JL6ePvuGoqd+sOP/L2KwbDPOiwlxvR4NEnG5W6zBplYapjyPpvpFoooTfdr6hzvzrNWk1yYsZmj2aE=
Received: from LV3PR12MB9265.namprd12.prod.outlook.com (2603:10b6:408:215::14)
 by IA1PR12MB6162.namprd12.prod.outlook.com (2603:10b6:208:3ea::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.34; Tue, 15 Apr
 2025 14:59:32 +0000
Received: from LV3PR12MB9265.namprd12.prod.outlook.com
 ([fe80::cf78:fbc:4475:b427]) by LV3PR12MB9265.namprd12.prod.outlook.com
 ([fe80::cf78:fbc:4475:b427%6]) with mapi id 15.20.8655.022; Tue, 15 Apr 2025
 14:59:32 +0000
From: "Kaplan, David" <David.Kaplan@amd.com>
To: Josh Poimboeuf <jpoimboe@kernel.org>
CC: Thomas Gleixner <tglx@linutronix.de>, Borislav Petkov <bp@alien8.de>,
	Peter Zijlstra <peterz@infradead.org>, Pawan Gupta
	<pawan.kumar.gupta@linux.intel.com>, Ingo Molnar <mingo@redhat.com>, Dave
 Hansen <dave.hansen@linux.intel.com>, "x86@kernel.org" <x86@kernel.org>, "H .
 Peter Anvin" <hpa@zytor.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, Brendan Jackman <jackmanb@google.com>, Derek
 Manwaring <derekmn@amazon.com>
Subject: RE: [PATCH v4 17/36] Documentation/x86: Document the new attack
 vector controls
Thread-Topic: [PATCH v4 17/36] Documentation/x86: Document the new attack
 vector controls
Thread-Index: AQHbqkRxQb0hpP7F0ESPe2022Gd5BLOjr73ggAAr7ICAAP0KAA==
Date: Tue, 15 Apr 2025 14:59:32 +0000
Message-ID:
 <LV3PR12MB9265B84234C24D42E7CB42EC94B22@LV3PR12MB9265.namprd12.prod.outlook.com>
References: <20250310164023.779191-1-david.kaplan@amd.com>
 <20250310164023.779191-18-david.kaplan@amd.com>
 <fkl2b3ymatulazt2xjegubqcejx5bgaraktztpkitodrbbsozw@xrskej3fg3jf>
 <LV3PR12MB92654563086027BB944A117594B32@LV3PR12MB9265.namprd12.prod.outlook.com>
 <mybnv24fbz5nsxmz2yihzctnbv7ab7sznyotupp6mbpzfdvy2e@r2oantiw4wmo>
In-Reply-To: <mybnv24fbz5nsxmz2yihzctnbv7ab7sznyotupp6mbpzfdvy2e@r2oantiw4wmo>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ActionId=ad2abca6-ef36-4d3e-b961-9ec687175656;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ContentBits=0;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Enabled=true;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Method=Standard;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Name=AMD
 Internal Distribution
 Only;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SetDate=2025-04-15T14:56:50Z;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV3PR12MB9265:EE_|IA1PR12MB6162:EE_
x-ms-office365-filtering-correlation-id: 23b3dbd1-b5fd-436f-6172-08dd7c2e214e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|7416014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?VXJYanBURmg0V2VQd0pjMkNxcDkxL3dRNU03N3dYdGNGQmpjejhSMTBkMFRF?=
 =?utf-8?B?Rk5OdTExVDdtMEZsQmx0UjBxa2hVaXFSQjNyT1ZraXpkNkUwQmVJbVFJZGFT?=
 =?utf-8?B?aDM2aktIa2llSis2QWcyc3pXKzlBTkJHanRsQTdtWlVXQUFsbVc1VmpaNzhm?=
 =?utf-8?B?bDVQMUhicUxyZnh2RVNmNzZ4TkdBRVBTeVBMU3NpeWovSHZLcXJjUk14WkNR?=
 =?utf-8?B?R2pmeHNuVGhIRjNaaXp0T0hTd3pSb0U2WmNhR2tMbzNwc3NqTTJ5ZzM0eUI3?=
 =?utf-8?B?NXFqcWZwWm1IUnlJRkdmWGptd3pmOXpMditERytBVjFkWkJsL1pRTkFXcWx2?=
 =?utf-8?B?dHc2czVHTWNGVzRIM2l1RlBjc2VjbUdoQ3dkVEc3S0s0bndrUmI2T2hxNnZq?=
 =?utf-8?B?NHh3RlVxSnByRldtaDRFbTdmZU5penBXL1EzamFtQ080eDFBUlM2WElaNlM4?=
 =?utf-8?B?Q1AvU0dhcHA2clZFRi9Mci9FSFM2RkhqKzRmSDdsL1p4QTR0NTNRMCswNlVG?=
 =?utf-8?B?a0kxRXV3YnR6VE95cHR3QnJzcVpiOHZpazd0Y3lobWI4SmlFc2pmaFFOVUxY?=
 =?utf-8?B?OVkyaXFHUmFsMXNnSkpFWkVEUW03M1ZoL1BLMHZCS1ljY2tYN0lTQXZLVTVj?=
 =?utf-8?B?RWpQL25tT0pFUFJRYlk3eUZwSUNYMklod3FzSTFPY1NESW1QS1Byd0xuV0p5?=
 =?utf-8?B?eWkxUUs4dGxZNUlSY0NFSXNmbU9PTEhaZWtDV0lSYy96Yi9TRHo3d3ZCVXVT?=
 =?utf-8?B?Y3ZSejdzMW9qRmhsY3hNbE4yNi9jTnZTU0lzclE3N0VUb3NWQ0FlNWhkMEVn?=
 =?utf-8?B?eE41KzY5bjUzVnJEUGVBUW9EOHFYRWxiWHdJWHV4UWR0d25UdXhvRURIdEJx?=
 =?utf-8?B?Z08rbmNQVUZVUnJ0U0hpY1h3UDVqNVR5aHNCaWhPK0NCN0FESEViWC8yaWZn?=
 =?utf-8?B?eU9DdUYreTJhU3YzSWgrV3l0WVVrUVMvVWthZC9QbFBvRklpRU95OHp1c1dw?=
 =?utf-8?B?aVFDa0xLWFEwcTlMWS9Qdi9EMkl0WUxVQndxY21Oc2RRUExEUkRUQ1VtSy80?=
 =?utf-8?B?RmhVSWVjTzFISHgzR1F5OGtJWWcxL1RvS0wwdUVra2VHT0NGNTlHSW4xTm1k?=
 =?utf-8?B?c0VRaHpjTWp3bzhPKzNSekd0d2phWEJJV3BRL2hHWjVVTkNjS1JCc3A3SGdt?=
 =?utf-8?B?MGl0WS9QT0QySWgzMmF0eDBBRTAxUHpTeHNWZWRWL2VlbG83RnUxVU13SWwz?=
 =?utf-8?B?aUdFN0pyRTFPTnpXOHg4OGJ0aTFjVFAvYzFEdTB0Q2VPWk1xMGJTdXQ0ZGRO?=
 =?utf-8?B?cjhVZVluL3NvQS9YQlkvUDJwOURmRVk3OXUvQjFJRnVqbFNCQ0VvT0E2aTJY?=
 =?utf-8?B?a3loaVJ5SzBwcGw5L2JhNFovRXoxTmxuQWw4TXJOSkw2TDZacTQvSHhMZmNI?=
 =?utf-8?B?d2VKYTM1QnJiUkRkMUZsUjYwZ2RIUkdXVWk0TE1UcDlPOGM4MTQ0VXZqM2Jh?=
 =?utf-8?B?VVZOOGtvdStNQ1B0bGZ2NlJDOUFONytnczVzMklCTDRScis0UXhlQ09qOWQ0?=
 =?utf-8?B?cXViWWhLYkVoV1UwbXBTOXVoaGdLUjZrc0lZV1cxcnNXajRnZEFJc3U1a2Nh?=
 =?utf-8?B?K1BOMGZ5TUpUVFJCUGpjMlNQdlRUa3d2eWFZOE5OR1czU04wdzByMmlGRFQz?=
 =?utf-8?B?MTZuSnAydGc5STNBRjZwS25Vdlo5bk1nQzhDZXp0VWNLVHFsd3VncVNDNDk4?=
 =?utf-8?B?b2l1Wko1WVVkOGJxdmFDbnNMTVJvK3RVb05ORWlUelZSYVAwK3BlR1RpTy9s?=
 =?utf-8?B?K25QVGJDNVdQSG9sNm9UYnAxREE4UDFqTGdhdHpzT0FDcS9PTzVLc21mTld6?=
 =?utf-8?B?cEl6Um51c0VBWFVWMDNxYnZWaUhBQ1NjV2VRd2VqOWFIT0haVjhEZ3lBbnlZ?=
 =?utf-8?B?RGkwdHJObUNBNlV6aEIzcEwvUFo3eW5OWXY0bzBPZFpUVjdleXFUK1hhK0ND?=
 =?utf-8?Q?RuNFiL1V2f01utfAKCKO85qsHuNfac=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR12MB9265.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?aWdFTm9wM0J0cU5XSlF3U3dJS1hlNUQwRDY2S2JsVDVobEw4WmxMY3NvUW9N?=
 =?utf-8?B?ZVB1eEI5RlN0YjhDOGhpL3JKUzJzKzFuMytUTE9LZFdEQWtqckFTVWlmMW9Q?=
 =?utf-8?B?QjdRUWFBQkw4NEQ4Y3l3SlB5ZElZbFppa3A2MFA2TzNUM2tQSmtXWnVEQVdX?=
 =?utf-8?B?WGJwWWtSZDViUVVMMTZYWHJVZEJZSkpMN1NObGJWZW9XaEU1ajBKbHV6QnJx?=
 =?utf-8?B?SFEwUzZ4ZWVZaUQwelpwR3B0MXlJQWpCR211eUxFS2N2RFBHZjZYcndpUjg4?=
 =?utf-8?B?ZGhaS2RhS2tVRlZuaHhRR1hTbGpmNXR6U2d2Tkg0ZkpIRTlwVlJBTVdwUVFP?=
 =?utf-8?B?Z1p0czlLcEVKeEk3SW1kT2JzdzN1NHBlU3pNSnhsV1BzMk5Pb3B1NnVVZHhS?=
 =?utf-8?B?b01qYjYzODVKdWR3N3MwRWswQ3F5NUt4RDU4QzFBTHJPNSt2TmxMMmppd3p0?=
 =?utf-8?B?VEdaSDV1dldORnJzQ2xkL0E3R0h0UVozempuOEF6cW5CMGNGRWNXU2h5UXhJ?=
 =?utf-8?B?bFhRQnZyN1FWQWVzSksxTjRvQ2tjeEJFMWk3R3ZCT2NGZllJYzRXN1p1d2NI?=
 =?utf-8?B?aTcvSDh2WjN0Z05oRXFRaWFnU1VCd0dNR1FuY0YzWkovRWhNSkp0YkpNbTF4?=
 =?utf-8?B?Y3dqa3c2UmVjQTRhNkk3cGxuT1hyaFFqYUVTNW1iT2s4WTRCV3RoamJzWCth?=
 =?utf-8?B?RVVWUFBTeEVHNXg5RXlRRGNpN1c3a0tWRlc3QStGSVpWZTRnWVlENkpUcEx1?=
 =?utf-8?B?VjdldFQ3NUVYZUFQdGhvQ0hVZEVMMnl1TTVwOWd6MVYxbmg5NnBDdW9lSk8w?=
 =?utf-8?B?bFdtVkNMTUtBVWlwWmMxV3NQektFN2RKL1BVYkthcjNRblFJSXlHSkdkWnc5?=
 =?utf-8?B?LzE2dWt4UnVIVjYxTHNUcGs2QWo3SHdKL29yN2FxUXF3MytOT044VjIzZmtu?=
 =?utf-8?B?cmZRUVN1bXpKY1IyeXVFRzVWRGUyMVlXOTFhdFV6cU83UUtqTXorUnJRRHRu?=
 =?utf-8?B?aHpWbDJPTml0azFTS0JKdGtwdUF6b25uVGhDTjc2U1oveEZGeXZTM0pTaXJX?=
 =?utf-8?B?Zk5PNWRVdlo0SGxNNzNvK0pTQldiRXhKOG9HVUx0K2dvN1VPQ0FUdWE1Vzl0?=
 =?utf-8?B?YWhqUko5eXdwUlZ6czYxaUJIbEdiTkdWRkhOTVlqTzliVHhPZWwyNE8rUUhB?=
 =?utf-8?B?Q3ZXVDJZUURCZWZGaFlSME5JempmK1ZLVUdlYlRnMW5lc2syeW8xZUpJMkpR?=
 =?utf-8?B?UEJBbTJGeCsxdjZzbUFmTXpTdytUZ1cyd3A3STYrRGdHNTJBNVhkb1lyRTRP?=
 =?utf-8?B?M1pKSFk3ellkSVd4WVd6eGx1UEJiQm9EZmp1Z3h4L01pWHR1NVFrZVVzTWVp?=
 =?utf-8?B?ZWhweXpjTytaYnUzWE5aR2NncjlJKzl1eHh3bmhxWkFTL3IwLzZFNXVEdjZh?=
 =?utf-8?B?a3NBMXNEd2JGSVVIdys1SXY1UkhKRTl3TFl3L1RkYkRnbjdpY2I3N0NPUGxk?=
 =?utf-8?B?Vldla2IySXY1QVJiQzg0Y2luRTRYSk9BWk90S2hmbkdoam92RWljeEFwUkhN?=
 =?utf-8?B?Z3lib2plUWVjTmlad3ZnWTJGRXBleDdVMStXRS9zSEJuMUxjSzYvYm16dko0?=
 =?utf-8?B?OTRiVTA2NUZBVlhOakxqNVJMbzR2a2o5anZiSGxXdlFtKzFLSlMzYjU2aE9V?=
 =?utf-8?B?YzFNSUxJcUhHTjJsNVBYMlptSjFENEtaOG5uWlBuaUZPYUIrZElNU1VNWVFK?=
 =?utf-8?B?RGxQQSs2ZGdXSEVNalN2VnMxbTF3RHo5VFBWT3Z1dTZjZzhwMS83L0pkMkw5?=
 =?utf-8?B?Wmh4MXMwNXFkcWg1MktWMjhwWkJWcklBRFlwL2RFWkxpYjY5RTF1OEZEMWhJ?=
 =?utf-8?B?ZUl6WEw0Mnd3ZkhiK0t6ODgzZXo1SXMxMndjb09LZVlGQ0dXWXlyc0YxalM2?=
 =?utf-8?B?MEJ1NnVVZ1BSa3RNU2dXVWJNdXNySlFzVzVpREc4bU5JekRWcHpTNmFNSkVr?=
 =?utf-8?B?TnE3Smw5eXFveXRiKzljdm5rSlBGWTlJSlZBSzN3dXl4NlI2SDYweStjdExp?=
 =?utf-8?B?M1g4enQ2eEJCeGljKzdVSU4wdGFHWHNDME9NZWprN0Y1UVQrekhCWU9xMno2?=
 =?utf-8?Q?ZJcc=3D?=
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
X-MS-Exchange-CrossTenant-AuthSource: LV3PR12MB9265.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 23b3dbd1-b5fd-436f-6172-08dd7c2e214e
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Apr 2025 14:59:32.5533
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lNVkyfCo1gkf4aa/hPPOMM1Wg/pytjtxyqBGc1Dn2HghE+68ebJUG44qqLJyuF4y
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6162

W0FNRCBPZmZpY2lhbCBVc2UgT25seSAtIEFNRCBJbnRlcm5hbCBEaXN0cmlidXRpb24gT25seV0N
Cg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBKb3NoIFBvaW1ib2V1ZiA8
anBvaW1ib2VAa2VybmVsLm9yZz4NCj4gU2VudDogTW9uZGF5LCBBcHJpbCAxNCwgMjAyNSA2OjUx
IFBNDQo+IFRvOiBLYXBsYW4sIERhdmlkIDxEYXZpZC5LYXBsYW5AYW1kLmNvbT4NCj4gQ2M6IFRo
b21hcyBHbGVpeG5lciA8dGdseEBsaW51dHJvbml4LmRlPjsgQm9yaXNsYXYgUGV0a292IDxicEBh
bGllbjguZGU+Ow0KPiBQZXRlciBaaWpsc3RyYSA8cGV0ZXJ6QGluZnJhZGVhZC5vcmc+OyBQYXdh
biBHdXB0YQ0KPiA8cGF3YW4ua3VtYXIuZ3VwdGFAbGludXguaW50ZWwuY29tPjsgSW5nbyBNb2xu
YXIgPG1pbmdvQHJlZGhhdC5jb20+OyBEYXZlDQo+IEhhbnNlbiA8ZGF2ZS5oYW5zZW5AbGludXgu
aW50ZWwuY29tPjsgeDg2QGtlcm5lbC5vcmc7IEggLiBQZXRlciBBbnZpbg0KPiA8aHBhQHp5dG9y
LmNvbT47IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc7IEJyZW5kYW4gSmFja21hbg0KPiA8
amFja21hbmJAZ29vZ2xlLmNvbT47IERlcmVrIE1hbndhcmluZyA8ZGVyZWttbkBhbWF6b24uY29t
Pg0KPiBTdWJqZWN0OiBSZTogW1BBVENIIHY0IDE3LzM2XSBEb2N1bWVudGF0aW9uL3g4NjogRG9j
dW1lbnQgdGhlIG5ldyBhdHRhY2sNCj4gdmVjdG9yIGNvbnRyb2xzDQo+DQo+IENhdXRpb246IFRo
aXMgbWVzc2FnZSBvcmlnaW5hdGVkIGZyb20gYW4gRXh0ZXJuYWwgU291cmNlLiBVc2UgcHJvcGVy
IGNhdXRpb24NCj4gd2hlbiBvcGVuaW5nIGF0dGFjaG1lbnRzLCBjbGlja2luZyBsaW5rcywgb3Ig
cmVzcG9uZGluZy4NCj4NCj4NCj4gT24gTW9uLCBBcHIgMTQsIDIwMjUgYXQgMDk6MTU6NTRQTSAr
MDAwMCwgS2FwbGFuLCBEYXZpZCB3cm90ZToNCj4gPiBbQU1EIE9mZmljaWFsIFVzZSBPbmx5IC0g
QU1EIEludGVybmFsIERpc3RyaWJ1dGlvbiBPbmx5XQ0KPiA+DQo+ID4gPiAtLS0tLU9yaWdpbmFs
IE1lc3NhZ2UtLS0tLQ0KPiA+ID4gRnJvbTogSm9zaCBQb2ltYm9ldWYgPGpwb2ltYm9lQGtlcm5l
bC5vcmc+DQo+ID4gPiBTZW50OiBUaHVyc2RheSwgQXByaWwgMTAsIDIwMjUgMToxNSBQTQ0KPiA+
ID4gVG86IEthcGxhbiwgRGF2aWQgPERhdmlkLkthcGxhbkBhbWQuY29tPg0KPiA+ID4gQ2M6IFRo
b21hcyBHbGVpeG5lciA8dGdseEBsaW51dHJvbml4LmRlPjsgQm9yaXNsYXYgUGV0a292DQo+ID4g
PiA8YnBAYWxpZW44LmRlPjsgUGV0ZXIgWmlqbHN0cmEgPHBldGVyekBpbmZyYWRlYWQub3JnPjsg
UGF3YW4gR3VwdGENCj4gPiA+IDxwYXdhbi5rdW1hci5ndXB0YUBsaW51eC5pbnRlbC5jb20+OyBJ
bmdvIE1vbG5hciA8bWluZ29AcmVkaGF0LmNvbT47DQo+ID4gPiBEYXZlIEhhbnNlbiA8ZGF2ZS5o
YW5zZW5AbGludXguaW50ZWwuY29tPjsgeDg2QGtlcm5lbC5vcmc7IEggLiBQZXRlcg0KPiA+ID4g
QW52aW4gPGhwYUB6eXRvci5jb20+OyBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnOyBCcmVu
ZGFuIEphY2ttYW4NCj4gPiA+IDxqYWNrbWFuYkBnb29nbGUuY29tPjsgRGVyZWsgTWFud2FyaW5n
IDxkZXJla21uQGFtYXpvbi5jb20+DQo+ID4gPiBTdWJqZWN0OiBSZTogW1BBVENIIHY0IDE3LzM2
XSBEb2N1bWVudGF0aW9uL3g4NjogRG9jdW1lbnQgdGhlIG5ldw0KPiA+ID4gYXR0YWNrIHZlY3Rv
ciBjb250cm9scw0KPiA+ID4NCj4gPiA+IENhdXRpb246IFRoaXMgbWVzc2FnZSBvcmlnaW5hdGVk
IGZyb20gYW4gRXh0ZXJuYWwgU291cmNlLiBVc2UgcHJvcGVyDQo+ID4gPiBjYXV0aW9uIHdoZW4g
b3BlbmluZyBhdHRhY2htZW50cywgY2xpY2tpbmcgbGlua3MsIG9yIHJlc3BvbmRpbmcuDQo+ID4g
Pg0KPiA+ID4NCj4gPiA+IE9uIE1vbiwgTWFyIDEwLCAyMDI1IGF0IDExOjQwOjA0QU0gLTA1MDAs
IERhdmlkIEthcGxhbiB3cm90ZToNCj4gPiA+ID4gKz09PT09PT09PT09PT09PSA9PT09PT09PT09
PT09PSA9PT09PT09PT09PT0gPT09PT09PT09PT09PQ0KPiA+ID4gPT09PT09PT09PT09PT0gPT09
PT09PT09PT09DQo+ID4gPiA+ICtWdWxuZXJhYmlsaXR5ICAgVXNlci10by1LZXJuZWwgVXNlci10
by1Vc2VyIEd1ZXN0LXRvLUhvc3QgR3Vlc3QtdG8tR3Vlc3QNCj4gPiA+IENyb3NzLVRocmVhZA0K
PiA+ID4gPiArPT09PT09PT09PT09PT09ID09PT09PT09PT09PT09ID09PT09PT09PT09PSA9PT09
PT09PT09PT09DQo+ID4gPiA9PT09PT09PT09PT09PSA9PT09PT09PT09PT0NCj4gPiA+ID4gK0JI
SSAgICAgICAgICAgICAgICAgICBYICAgICAgICAgICAgICAgICAgICAgICAgICAgWA0KPiA+ID4g
PiArR0RTICAgICAgICAgICAgICAgICAgIFggICAgICAgICAgICAgIFggICAgICAgICAgICBYICAg
ICAgICAgICAgICBYICAgICAgICAoTm90ZSAxKQ0KPiA+ID4gPiArTDFURiAgICAgICAgICAgICAg
ICAgIFggICAgICAgICAgICAgICAgICAgICAgICAgICBYICAgICAgICAgICAgICAgICAgICAgICAo
Tm90ZSAyKQ0KPiA+ID4gPiArTURTICAgICAgICAgICAgICAgICAgIFggICAgICAgICAgICAgIFgg
ICAgICAgICAgICBYICAgICAgICAgICAgICBYICAgICAgICAoTm90ZSAyKQ0KPiA+ID4gPiArTU1J
TyAgICAgICAgICAgICAgICAgIFggICAgICAgICAgICAgIFggICAgICAgICAgICBYICAgICAgICAg
ICAgICBYICAgICAgICAoTm90ZSAyKQ0KPiA+ID4gPiArTWVsdGRvd24gICAgICAgICAgICAgIFgN
Cj4gPiA+ID4gK1JldGJsZWVkICAgICAgICAgICAgICBYICAgICAgICAgICAgICAgICAgICAgICAg
ICAgWCAgICAgICAgICAgICAgICAgICAgICAgKE5vdGUgMykNCj4gPiA+ID4gK1JGRFMgICAgICAg
ICAgICAgICAgICBYICAgICAgICAgICAgICBYICAgICAgICAgICAgWCAgICAgICAgICAgICAgWA0K
PiA+ID4gPiArU3BlY3RyZV92MSAgICAgICAgICAgIFgNCj4gPiA+ID4gK1NwZWN0cmVfdjIgICAg
ICAgICAgICBYICAgICAgICAgICAgICAgICAgICAgICAgICAgWA0KPiA+ID4gPiArU3BlY3RyZV92
Ml91c2VyICAgICAgICAgICAgICAgICAgICAgIFggICAgICAgICAgICAgICAgICAgICAgICAgICBY
ICAgICAgICAoTm90ZSAxKQ0KPiA+ID4gPiArU1JCRFMgICAgICAgICAgICAgICAgIFggICAgICAg
ICAgICAgIFggICAgICAgICAgICBYICAgICAgICAgICAgICBYDQo+ID4gPiA+ICtTUlNPICAgICAg
ICAgICAgICAgICAgWCAgICAgICAgICAgICAgICAgICAgICAgICAgIFgNCj4gPiA+ID4gK1NTQiAo
Tm90ZSA0KQ0KPiA+ID4NCj4gPiA+IEFueSByZWFzb24gbm90IHRvIHB1dCB0aGUgIk5vdGUgNCIg
aW4gdGhlIHNhbWUgY29sdW1uIGFzIHRoZSBvdGhlcnM/DQo+ID4gPg0KPiA+DQo+ID4gVGhlIG90
aGVyIG5vdGVzIGFyZSBhYm91dCBjcm9zcy10aHJlYWQgbWl0aWdhdGlvbiBzcGVjaWZpY2FsbHkg
YW5kIHRob3NlIG5vdGVzDQo+IHJlZmVyIHRvIHRoZSBTTVQgYXNwZWN0cyBvZiB0aG9zZSBpc3N1
ZXMuDQo+ID4NCj4gPiBOb3RlIDQgaW4gdGhpcyBjYXNlIGlzIGFib3V0IHRoZSBTU0IgdnVsbmVy
YWJpbGl0eSBpdHNlbGYsIGV4cGxhaW5pbmcNCj4gPiB0aGF0IGJ5IGRlZmF1bHQgdGhlcmUgaXMg
bm8gbWl0aWdhdGlvbiBmb3IgYW55IGNhc2UuICBJIHdhcyBjb25jZXJuZWQNCj4gPiB0aGF0IGlu
Y2x1ZGluZyBTU0IgYnV0IHdpdGhvdXQgYW55IFgncyBpbiBhbnkgb2YgdGhlIGNvbHVtbnMgd291
bGQgYmUNCj4gPiBjb25mdXNpbmcsIHNvIHRoZSBub3RlIGF0dGVtcHRlZCB0byBleHBsYWluIHRo
YXQgdGhlcmUgd2VyZSBubyBkZWZhdWx0DQo+ID4gbWl0aWdhdGlvbnMgZm9yIFNTQiB1bmRlciBh
bnkgYXR0YWNrIHZlY3Rvci4NCj4NCj4gUHV0dGluZyB0aGUgbm90ZSB0aGVyZSBtYWtlcyBpdCBh
IGxvdCBoYXJkZXIgdG8gc2VlIGl0LiAgQW5kIEkgdGhpbmsgdGhlIGxhY2sgb2YgWCdzIGlzDQo+
IGFjY3VyYXRlLCBubz8NCj4NCg0KSXQgaXMsIGl0J3MganVzdCByYXRoZXIgdW5pcXVlIGNvbXBh
cmVkIHRvIHRoZSBvdGhlciBidWdzLiAgSSBjb3VsZCByZW1vdmUgdGhlIG5vdGUgZW50aXJlbHks
IGJ1dCBJIHdhcyBjb25jZXJuZWQgdGhhdCBtaWdodCBsb29rIG9kZCBiZWNhdXNlIGl0J2QgYmUg
dGhlIG9ubHkgYnVnIHRoYXQgaXNuJ3QgbWl0aWdhdGVkIHVuZGVyIGFueSBvZiB0aGUgYXR0YWNr
IHZlY3RvcnMuICBBbmQgdGhhdCdzIHJlYWxseSBqdXN0IGJlY2F1c2UgdGhlIGN1cnJlbnQgZGVm
YXVsdCBpcyBub3QgdG8gbWl0aWdhdGUgdGhhdCBvbmUuDQoNCi0tRGF2aWQgS2FwbGFuDQoNCg0K
