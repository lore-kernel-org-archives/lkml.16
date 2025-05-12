Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2083.outbound.protection.outlook.com [40.107.94.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECFFA29710B;
	Mon, 12 May 2025 20:51:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.83
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747083120; cv=fail; b=SVJ8UqbGqsCebv2EWCLNumfcFpwvyHuMiYPS65koHxTe2lo6c68iV30N96DLbpCtEp7ittiqKMVQqxPrgO8ZUF6JKuTAFcWo9WiA62dfIsMl4lumvtwtSmfrl6TY5HrgqSUSqBt676SVKEuKYD5QpH/PYkFdaKRUZFIjQYc545w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747083120; c=relaxed/simple;
	bh=EnUfFDJVM/U7Q4nEC08Pn9VMgCnbllIEpIGE1KGZxsA=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=WciItRM6DKXK8KLaCLypphqp6sQhISTJ9QyU5MJyjYnnJr5bMCMV/Vd3g75dreFWksvuYjTVDZ0F7phCXsiwVfZ676Pbg9IXYnWPjsm7Q7cMXo2e+sRR/gUn3S6iu4uy2515kCraaUwhZVrgixvIrZiZ8+K2At9Ld0psH4j8J7Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=rdTiQ8Qy; arc=fail smtp.client-ip=40.107.94.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="rdTiQ8Qy"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cqr6D5DtP+ZaIERLt7wEe7gJmNIhKdiaGohQTkyPhCDKgzHaPu0NBSebw1cnU2H96ArM9Nic2kWW6+3jaAyoev4CWOPtbceWSsHpLkeWlDDRKfksc6RjLH0dvpva3//wW82nlNdmEb79kF24AMFkrJvzX8Zh93DfmcqGebBO5XG/t9BQsHMCegNFGOQMgOVFuxb/aAcNx5Y1xSMm76iTFKdKHUgEloUuHMZ5OhEgHEG8i2mRvIYzFO1jQmi2eSwsPsI7QlK/9SxI9slSBtsuWhqHorRGRv8E/37HHxjiFrIBiE20ZbZ3CyPHQNj/m+EC1IgfgkKnp+O6+63xMuVsBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EnUfFDJVM/U7Q4nEC08Pn9VMgCnbllIEpIGE1KGZxsA=;
 b=K7YRo9thmpwKQ/7LF61xAnpobNyLMlP05vdnnvDpl/SyGJIip+hT9kTiXfLSpsvjoAM/vY5YziyFXKhsTL4PJbu8GkG2gpM/Tk8qxWFiP6vQTKAXCcEifRhHkudu3FAmDwgFXDc3PH3gD2kCfRBzcZ9zfezWH+J172J+M6xv1RqFldUmtaasrKpf280iht9NRW/z9PGb7n48OpLIZaGPZC7Jx4ymaabDGU112yh70SKEDbtBQtPXNTp+o0IoPXCODv2HBg5KoTFF04BpYTqtiYuEwVmxD0p45mSW2uwgxxXOEBO8zz74EsgjNzXfJuN4th7eEUNZQUU8DaSidps9Zg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EnUfFDJVM/U7Q4nEC08Pn9VMgCnbllIEpIGE1KGZxsA=;
 b=rdTiQ8QylmHYbFOMskHtay/ZtrWSmAuu3uy+mm1k0y2ON19p74YMh4MSCdA3bNzSC+Uxc7kQzdFk3Gz/CszaFMYWrj6GchQQlpo4dqqtnEbRXSaHnBoSWUtk/iYE5C00muBzQ9WFVBn0LYYpcTO8w8LD4SKJobIQsVZY0FOKF+Z8bVUHu674C22A6EWYCSYhaTKZaJWJeVJtI5/mlx6dDyGzjkgFb4HXNOcN4EdanxQGmZcC4ZpuC8fZJPisppjZkcBXZ9tHDohRTlJbHV8Aw03CdJryWgu61kpTe8Qv4oxJxlH8EiA+hRL44+lcGBBiqmF5dDeKYWLz0jIr1MlH2g==
Received: from CY5PR12MB6526.namprd12.prod.outlook.com (2603:10b6:930:31::20)
 by PH8PR12MB6841.namprd12.prod.outlook.com (2603:10b6:510:1c8::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.26; Mon, 12 May
 2025 20:51:53 +0000
Received: from CY5PR12MB6526.namprd12.prod.outlook.com
 ([fe80::e420:4e37:166:9c56]) by CY5PR12MB6526.namprd12.prod.outlook.com
 ([fe80::e420:4e37:166:9c56%5]) with mapi id 15.20.8722.027; Mon, 12 May 2025
 20:51:53 +0000
From: Timur Tabi <ttabi@nvidia.com>
To: "tmgross@umich.edu" <tmgross@umich.edu>, "benno.lossin@proton.me"
	<benno.lossin@proton.me>, "gregkh@linuxfoundation.org"
	<gregkh@linuxfoundation.org>, "gary@garyguo.net" <gary@garyguo.net>,
	"mmaurer@google.com" <mmaurer@google.com>, "a.hindborg@kernel.org"
	<a.hindborg@kernel.org>, "bjorn3_gh@protonmail.com"
	<bjorn3_gh@protonmail.com>, "boqun.feng@gmail.com" <boqun.feng@gmail.com>,
	"dakr@kernel.org" <dakr@kernel.org>, "alex.gaynor@gmail.com"
	<alex.gaynor@gmail.com>, "aliceryhl@google.com" <aliceryhl@google.com>,
	"ojeda@kernel.org" <ojeda@kernel.org>, "rafael@kernel.org"
	<rafael@kernel.org>, "samitolvanen@google.com" <samitolvanen@google.com>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH v5 2/4] rust: debugfs: Bind file creation for long-lived
 Display
Thread-Topic: [PATCH v5 2/4] rust: debugfs: Bind file creation for long-lived
 Display
Thread-Index: AQHbvhioLApbfeXiQ0C8x1ix4mlMT7PPgy4A
Date: Mon, 12 May 2025 20:51:53 +0000
Message-ID: <549e2bc42037ca6b366947160784794091069a07.camel@nvidia.com>
References: <20250505-debugfs-rust-v5-0-3e93ce7bb76e@google.com>
	 <20250505-debugfs-rust-v5-2-3e93ce7bb76e@google.com>
In-Reply-To: <20250505-debugfs-rust-v5-2-3e93ce7bb76e@google.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.52.3-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR12MB6526:EE_|PH8PR12MB6841:EE_
x-ms-office365-filtering-correlation-id: 9473d228-bc60-4ad9-aab7-08dd9196d337
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|7416014|376014|38070700018|921020;
x-microsoft-antispam-message-info:
 =?utf-8?B?NEdKcVN1RWVVWm1JRTYralNUL3pJVXlEeC8zdEhKVk5uT1NXamFyMGJ2WFFL?=
 =?utf-8?B?YWhOQ05icks0ejEvOE96YVIvdGNqaWZMZUZ6ZE9nSzdqaFVYTHhLSzdzZ0Fl?=
 =?utf-8?B?Y2x3Z3M1MnQ4MDRSNE9nK2w5dXNVemFsTjNQWWZxNjgzRG1iYUFDT3BuQ096?=
 =?utf-8?B?MDdzUXlXcnNnVmRaeGoyOHdGRThWbVFsVWFMV2I1UnpqeUdrdE5VamxtQUNG?=
 =?utf-8?B?WlpMS2NONWFhODNoek8vTWtTT3JRTmx5cktlYVdMWWl0NkZoQ1hrTXZST05I?=
 =?utf-8?B?amxTcXlyYnhrNjVHZW9GS1BSbmxLSlgreFZzRTNHbC9pa1ZhNUw5eUx3STFv?=
 =?utf-8?B?M200RVJmQUNKNG5HbUxneUVqbVNIWjRqR01aaEt4Qm8vNlRnWXlXcnZ4K29L?=
 =?utf-8?B?UlAzWXJ0UGxMVkFDTi9KQzhGcVRINFIrRFZNZUQrcXFjSm9xZ20zZXVaaTZB?=
 =?utf-8?B?NFlIY2hSRHlmRjNSSExQb1praExTUkxjazBhZWI1enFaVEd0ZU1pZkdSU1lw?=
 =?utf-8?B?ZVFmTEhQM3dVMjk1OWtSNlZNM2FzYzl2NnZZbzU2ZjJSVWViSERReUxFOHo0?=
 =?utf-8?B?ejhKaW0yL2cvd2R6UXJkdlR0NHFjSXh0Yjk2MC90eWlwR1BEU0JaY2l4T2Zl?=
 =?utf-8?B?eFZsb3ptNEI3cS90amVsbUROMXhBS3lKSHlJTzdTeVN6Rk5NV2FMb015RWZ5?=
 =?utf-8?B?eEEwQzUzNGt2ZWJwNjRMcU5XWCtTTHhqQTVjeWRUdGpVMkRYbkpSRXF6UUVW?=
 =?utf-8?B?T1NXV3pjK2FCSFZFcSs3Wi9VMmgxWmFFUWRuSFM1N3Q1c2FWN3JudzZUWmY2?=
 =?utf-8?B?NFg2aytKSHdNbnU1UzFMaVdyVkROVDhZeG1FcVZMMUFmYitCamJCRHUxZWRD?=
 =?utf-8?B?Z2RXNURCNTdsdzdkTE5CY052OG9jb3Flbmt3VXYxeUdZWStiUGtzTVcxWTN2?=
 =?utf-8?B?VkN4N0xJVEZVUytpRko1SDF1a2ZaeDMwaW5HTGlEQ1dIR0RWbUM3WXhOYTRC?=
 =?utf-8?B?U0VwdkppNiswL3ZJZDhHWGlMaUx5cFJVSnhEeXlSVlFhUFJKcUlWMXN1R0M2?=
 =?utf-8?B?MjRsZldNMVdmYXRXK0hSaFArTE1jNzNkWHU5emRQaGt1MWl0RWMrY2Fmc3li?=
 =?utf-8?B?MmdnYmdDelhra3pPSlNDZ1lzMjhzUWNYcW1ReXZnTmYrY0IyQXhkVTZNT1Qz?=
 =?utf-8?B?bzVGK0ZwRTFYUUFCTzVDc3haNE0yREdIVnJlMFduemJPcTdmcGN4d1RWMk9X?=
 =?utf-8?B?VERodlFaZXY5c0JjcHpwQTg3MjU1SDQzTlZrdmJ1cDYrdm1nM2pNQmwxWG4w?=
 =?utf-8?B?cWpVR2tGWU5EOC9KUXJDdGpwSE9qbHUvQWFCQTFzVEplMHBUMXJ5bkIrbFkx?=
 =?utf-8?B?WlgzRXJmZTBoYTEyRytvM2lPV1k0aU5KTTFsNzJYT1FSdmpVWU9uRUlGTkxn?=
 =?utf-8?B?bjNzNHYxTnVkVGpRSlNBK2dac2lNcjhqZ2ZkVWc0MExYY3ZHY3JrUkw5Y2Er?=
 =?utf-8?B?ekN6ZmFqa0hZMllkOGFiVStnSjhjV1NyQ0FuZkdiMWJacThEZjcrelBIbHRN?=
 =?utf-8?B?RURJREJ4cmpzSjJCOGgwV1gyQklLUnB4RHZoT3k4RlJZdmZVVlVqVjZHR0ZZ?=
 =?utf-8?B?QUMvMVZwMXNNekRVN1FkSFdFUG8wTVl3T0t0cER5T0FEdVNESFlueUVOZXVK?=
 =?utf-8?B?a3pPQW4wRnhsM0szMlJONHUzaG50eHdxQzBBdXViYVN0VldzTjNGQWZUK2w0?=
 =?utf-8?B?TVVVRTJFQWgySmIrYUFaNXRzS3poQ3VERkFYbEJ3Q2xMMFBIcTB3OCtDd0pU?=
 =?utf-8?B?SUwxZDR2NjhYaFUwL0VCQmdoenp1cWVnbEFOZEtaSFRGejRCbnZqelNsckxr?=
 =?utf-8?B?TGovOVZoSGVQelBjSkZtSlFnai9KbXJuNTJDaUErQmxmS1N5Z2JiN3pqMnlE?=
 =?utf-8?B?RHpQWm1FcnhKNThoN05SWk8zZFJzZUNjc1Q0Z1hDckRYNDRlSmtCM3pyclNR?=
 =?utf-8?Q?32rFzKv95lWyIzDEV1jkeBlkiq6TFQ=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR12MB6526.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(38070700018)(921020);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?eGh0aVNVMmJRek0vdDNRLzdSalNtMHpjb0cyZjliVHJGUTltUGJXdWE0bFVG?=
 =?utf-8?B?TTQzK3hoL0kxeC9lNHlMamZubXI0MVR2ekk2WTVlWHVEWmpoZ0EvZUNlVmNF?=
 =?utf-8?B?SmNtWkJMN2YydEJTRUljVVV6NU83THhqbys0amxubW1JVEFBM0VLRVI2VUQv?=
 =?utf-8?B?REJ5Tnh4ckorR2xHa0RKdjE1ZTc3L1NzUi9MZ2xEY1B1ZGtvRFlDTlIvbHlJ?=
 =?utf-8?B?ZDhWSm1qc1psOTNIK09xWk0wTkZWazV0eStaTWUrU25ETytWWTdmZEVaZ0da?=
 =?utf-8?B?L0c1SUYwOUoxS0NPQkxFamtoQTIxNkVVRlNXY1JFMysxb2MzdXVmaDkrK2pX?=
 =?utf-8?B?TXUvbmFtdzc2UDkzN3pFUDU2d0pVVjNwVUtwN09LZTZvS3htRnRENWJXOFBl?=
 =?utf-8?B?ejM1TkY2K3RpYnVlN0x4QU9EcEZYdWtlaDJkeHBvSzRoalBWRmsrMjhLbUY1?=
 =?utf-8?B?Z2xqUytaRzVXWUhDMlgvZFZwQWgydjJzUFByM2l5MStocEZPeGxnUlgyMytm?=
 =?utf-8?B?MWlYUk1SeFRyNDJDVmkxR0FyTk5IRGc0b0FrY0dGUDFTcGRCME03RGowckQx?=
 =?utf-8?B?dzhqdW5rTnBWb2E5SEsxUFFVdlNiT1loZ3phc2JIUFlrcll0b290VzZhVXlw?=
 =?utf-8?B?ZHdVMnJtL2szR2dKRmgwdWlGWGxFbnBKaVBSVW42VnVGV1REQTE5alNKL1dZ?=
 =?utf-8?B?cUsyRmh1WVhLbEFtQ04zU05xdWI4cUIzR0U2dUVkRlVhOVFtY3NHUTdEWU1m?=
 =?utf-8?B?L1Q4VFBZUzEraHZ6eU14bXA1MDZhQlRDUDBNS056dmkwSGxhcVIxeVgyZkNC?=
 =?utf-8?B?VHZ5NEtRTEVkTVpBQmQrL0NFc2YxeGJTZ1hzOEdsN25SNStOMlVLSUlUM0JF?=
 =?utf-8?B?Q1I4SmpxRlNZNUdHWGdwaDZoR3JxbndPd3hwR3d3L3FRMGV4WHU4dlo0Vmx3?=
 =?utf-8?B?d0ExVmVWRythaVhwK0lndWkrNnlQcytvdS96cDJzd1h3NkV0MnN3eWNEV0NT?=
 =?utf-8?B?VWlYYzVrY2VTRUV0bEhtdXp4MzBBaUJ5SThrVVlMeWE4SnBuRnRsN3ZNek9Y?=
 =?utf-8?B?eEFyY1VvQ0JwcmtLNnBFeHI4NWVlbVlQNzdLbXBIVC80VUx2dGVxNytEQnI4?=
 =?utf-8?B?ZVFHbDlRRDVIL1R3UVFwSFpVeUp0NlpoWkJSRWRZcU9paTZybS9jRTFTNVFr?=
 =?utf-8?B?S2JXcnkydjBjTTB3K0E4V2R0Y3VtQlpWODFHeHB1Szh4eGhwKzJTNVlFTUZR?=
 =?utf-8?B?UkdhNmtRcTIwam9QQVp4bFp3RXliMEVQZmdnSHQvWTVZNDM5R2RucXBSUUxw?=
 =?utf-8?B?M2NRZVVLRjdacThCU2tNQUpET0ZJQXFNLzc2UjhTN1pya1hld01KZlhHV2lD?=
 =?utf-8?B?OVlmcnJ1UXp2VTF3bXJxU1VuWWdyeGxlOHB0RWltR2FGS21kYUV4YkRoYzVM?=
 =?utf-8?B?bFVvN3lwTnp0aDVVVzdDbVV6S1Y0a2RhR2NrTDlmaW5lcGRDREVpUHpQNEJZ?=
 =?utf-8?B?bUF0OEFBNG9wQUtUVnl5VVBESmxlUUhJRWwwZyt2RDJXMjhZWHJCTG4yckRE?=
 =?utf-8?B?WFBCTlJXVTcyeUdPa1VPL3RGQk1BTnMvY3VPbWtHTXNiTlN1SUM4L2FFK3U5?=
 =?utf-8?B?VXZRVEZHelVDbzhsVFdGd2p6Q01uSzV0cDIraGIyd1NYTVlHdDRCckF0WEVL?=
 =?utf-8?B?b2I1Wk1IUXRmOS9jcWJxVW1CSTROMjhmUTZNeDhyZmJiK0swZnhCaWlNTUtl?=
 =?utf-8?B?dmovTHRxNUMyVDJtRTZKaWhkR2VDV29zRU5VRWpaS2d1UFAwc09oU1JSTDll?=
 =?utf-8?B?RDl5RmQyY1NBbTYyejZFV2psdDdUNjV6UXhtMFVrVVNVZmtaL3M0TVRmbTdD?=
 =?utf-8?B?OVR6YzdRSVFjckl5dks2S013Vy9yVUs5WnZaTkFDbHMyVzNzeHQ2RENxNVZR?=
 =?utf-8?B?Vnlqd3dRbjVBRDU4d3BFN1A5MW1EY2pWTTU3aE1oeTNjKzBjUFlPRHNpWVhZ?=
 =?utf-8?B?bkZWWWdndTVFZ05FaXN3LzVtTHZwZTZVbE5TNWsvVlJQWDN4ekQyQS9GQlEv?=
 =?utf-8?B?clRJVU94K1NKR2w1d1pvc2xEZm5LOXZuK1ZNY2kxa0JNUFI3UGR1cGZvbkt6?=
 =?utf-8?Q?mU3gIdWgveWSsCDxcW+1QXgAu?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <2BF6EBBF419A1A4EAB807AC7BFF12CB6@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR12MB6526.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9473d228-bc60-4ad9-aab7-08dd9196d337
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 May 2025 20:51:53.0654
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SqvwVfEQ5FxTSDNON99mHKOSTh67zbQStJ7mvbBrKvZE2jYL+LyGx60/BrAycXfphGvk/WRqQQhRU/rKQYSEGg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6841

T24gTW9uLCAyMDI1LTA1LTA1IGF0IDIzOjUxICswMDAwLCBNYXR0aGV3IE1hdXJlciB3cm90ZToN
Cj4gK8KgwqDCoCBwdWIoY3JhdGUpIHVuc2FmZSBleHRlcm4gIkMiIGZuIGRpc3BsYXlfYWN0PFQ6
IERpc3BsYXk+KA0KPiArwqDCoMKgwqDCoMKgwqAgc2VxOiAqbXV0IGJpbmRpbmdzOjpzZXFfZmls
ZSwNCj4gK8KgwqDCoMKgwqDCoMKgIF86ICptdXQgY29yZTo6ZmZpOjpjX3ZvaWQsDQo+ICvCoMKg
wqAgKSAtPiBpMzIgew0KPiArwqDCoMKgwqDCoMKgwqAgLy8gU0FGRVRZOiBCeSBjYWxsZXIgcHJl
Y29uZGl0aW9uLCB0aGlzIHBvaW50ZXIgaXMgbGl2ZSwgcG9pbnRzIHRvIGEgdmFsdWUgb2YgdHlw
ZSBgVGAsDQo+IGFuZA0KPiArwqDCoMKgwqDCoMKgwqAgLy8gaXMgbm90IGJlaW5nIG11dGF0ZWQu
DQo+ICvCoMKgwqDCoMKgwqDCoCBsZXQgZGF0YSA9IHVuc2FmZSB7ICYqKCgqc2VxKS5wcml2YXRl
IGFzICptdXQgVCkgfTsNCj4gK8KgwqDCoMKgwqDCoMKgIC8vIFNBRkVUWTogQnkgY2FsbGVyIHBy
ZWNvbmRpdGlvbiwgYHNlcV9maWxlYCBwb2ludHMgdG8gYSBsaXZlIGBzZXFfZmlsZWAsIHNvIHdl
IGNhbiBsaWZ0DQo+ICvCoMKgwqDCoMKgwqDCoCAvLyBpdC4NCj4gK8KgwqDCoMKgwqDCoMKgIGxl
dCBzZXFfZmlsZSA9IHVuc2FmZSB7IFNlcUZpbGU6OmZyb21fcmF3KHNlcSkgfTsNCj4gK8KgwqDC
oMKgwqDCoMKgIHNlcV9wcmludCEoc2VxX2ZpbGUsICJ7fSIsIGRhdGEpOw0KDQpEb2Vzbid0IHRo
aXMgcmVzdHJpY3QgVCB0byBkYXRhIHR5cGVzIHRoYXQgYXJlIHN1cHBvcnRlZCBieSAie30iPyAg
U28sIGZvciBleGFtcGxlLCBUIGNhbm5vdCBiZSBhDQpWZWMsIGNvcnJlY3Q/DQoNCkZvciBub3Zh
LWNvcmUsIHdlIG5lZWQgdG8gYmUgYWJsZSB0byAicHJpbnQiIGFuIGFycmF5IG9mIGJ5dGVzIGFz
LWlzLiAgU3BlY2lmaWNhbGx5LCBhIERNQSBidWZmZXINCnRoYXQganVzdCBjb250YWlucyBiaW5h
cnkgZGF0YS4gIEJ1dCBieSB1c2luZyBzZXFfcHJpbnQhLCBhcmVuJ3Qgd2UgZm9yY2luZyBUIHRv
IGNvbnRhaW4gb25seQ0KcHJpbnRhYmxlIGNoYXJhY3RlcnM/DQo=
