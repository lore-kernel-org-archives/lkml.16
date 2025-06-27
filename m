Received: from AS8PR03CU001.outbound.protection.outlook.com (mail-westeuropeazon11022089.outbound.protection.outlook.com [52.101.71.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1698C23BCF3;
	Fri, 27 Jun 2025 08:40:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.71.89
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751013659; cv=fail; b=RYJIbD/0gpH27m0bdhEUBsX1yu4dxaDKHAv2FDf6+F/MknXt/RJrPsgfbyJxqIgyMzyF/S1aCviQKh/t28CvUn4jgq9ZGBjEtfoeH3K5cxl6cSaxHqj2t33BobdX1HAD/x5HUCQCA5OB9Q+fwfPqVgWd7LTLnFv+WKhM0o9QPR0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751013659; c=relaxed/simple;
	bh=mKxOMd9tsLpyXBoLHg3EIAZSCPmE+PQ5QKmJogRouAg=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=tAFjpTxHH+2GnefcNd0G2+gXATiUbi5MnfI+abA2kQG3Sntd9kgiPO5L4MTqB3pl73jSO+Gl+oW6r3MJHLU/41TuMY+PJJTpBTZI/b3siPetJLW36WhGtGhqfQEejXkkv1lOdCnFxrODv2jPcTeLJDgD61IdGwhWjw+DVswh2jo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=htecgroup.com; spf=pass smtp.mailfrom=htecgroup.com; dkim=pass (2048-bit key) header.d=htecgroup.com header.i=@htecgroup.com header.b=mZaTVEeK; arc=fail smtp.client-ip=52.101.71.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=htecgroup.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=htecgroup.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=htecgroup.com header.i=@htecgroup.com header.b="mZaTVEeK"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xvBb3thhfTVqHc2UKkO/3x4GZjTO4GA3X5C+C/DMq+H488iZSvCGFQ/b8l/5FmSzZYKZmypQt0ud+TTxWJLUM62lx8gU20qvoiAF9I8uk7i4kMnVW6ZwwUG4DYE3/bSDNOjG9OS00B7V5FTtSbBur30ZQwgtktpCqZxOTeOZzegk3udzcF22xHNxb8mhH9i9dIL+NaGf74LkBbQu7SCerZ0crYDITeuNIlidiPtY2soiJ21ejE5Ok+EjRbniAetvWU6O9Z1L3jAibEStZKye2+y21xMWNfNfEpS+4dd8PJezax9MpM5T/nyr3L/s1hIhRF9tBwcJL1+WAyKXoMzYHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mKxOMd9tsLpyXBoLHg3EIAZSCPmE+PQ5QKmJogRouAg=;
 b=bbkfUOZgeiSaM4cjcDAG9aesser46iJGhvLpTZbChGqgTpSWX1YQ5lRI52sXdmXB6VMTvJDoms4dTYuNU9l9CLNodkzsxb0iVm2M/qbSNTRbPcwIUcq4OqumkfEyFSO3k3rcmG3qFS/PXPXnpE4oK9PNVtwrewOXxl9Zw5HEmyah9dIYGBQkQlPlmUMjvFoyjfKvviIyfKSfmZqQrZhnApA3bYgWT59XS6Pfea6xSbJ8zu8Dv/KlrcHL6Pwqbf1x3+Vn/1ypcvbgnF80XkbXbdJOIPBpShpj7VwtlahkDK2htT70GLa+8ReTSkmM0ZFFXkdVIMHVPSSVqRNyvwlkrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=htecgroup.com; dmarc=pass action=none
 header.from=htecgroup.com; dkim=pass header.d=htecgroup.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=htecgroup.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mKxOMd9tsLpyXBoLHg3EIAZSCPmE+PQ5QKmJogRouAg=;
 b=mZaTVEeKtBnbPSGuc/jxaLRw89qetbBbLz8UnJuALSb0clHxSCVf1XG5wgjJ8G26tEMV/PzseBehZ0FHyXXY6GDRK4x/W/tCLQKiFRMkWQWK/w+UKtfIhONqwQBvRh9tsoo6e/nz9h8HVEmdUJ2BMZ3tMsE0WjEyhv0dZdoISZvvi6OCDkYPMwz6KE4biua09AYLN1tcdAFA7XDspyvwNGe627BAUPwx6uyQlntrZd6J/8RSb3dLKlTTsIDVSm3otmIkLCRJjcLpXiHEkN3fRi1diGS5bcl1biUCMlLpT2XMGGIamYAYhpcHqBj1nKjnr4Nqas7LLTjuzVc2hkrpYQ==
Received: from AM6PR09MB2296.eurprd09.prod.outlook.com (2603:10a6:20b:49::18)
 by FRWPR09MB8190.eurprd09.prod.outlook.com (2603:10a6:d10:179::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.26; Fri, 27 Jun
 2025 08:40:53 +0000
Received: from AM6PR09MB2296.eurprd09.prod.outlook.com
 ([fe80::eb0d:36d4:bbb6:d662]) by AM6PR09MB2296.eurprd09.prod.outlook.com
 ([fe80::eb0d:36d4:bbb6:d662%4]) with mapi id 15.20.8857.025; Fri, 27 Jun 2025
 08:40:53 +0000
From: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
To: "ajones@ventanamicro.com" <ajones@ventanamicro.com>
CC: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>, "alex@ghiti.fr"
	<alex@ghiti.fr>, "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>, "conor@kernel.org"
	<conor@kernel.org>, "corbet@lwn.net" <corbet@lwn.net>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"devnull+aleksa.paunovic.htecgroup.com@kernel.org"
	<devnull+aleksa.paunovic.htecgroup.com@kernel.org>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, "linux-doc@vger.kernel.org"
	<linux-doc@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-riscv@lists.infradead.org"
	<linux-riscv@lists.infradead.org>, "palmer@dabbelt.com" <palmer@dabbelt.com>,
	"palmer@sifive.com" <palmer@sifive.com>, "paul.walmsley@sifive.com"
	<paul.walmsley@sifive.com>, "robh@kernel.org" <robh@kernel.org>
Subject: Re: [PATCH v4 6/7] riscv: Add tools support for xmipsexectl
Thread-Topic: [PATCH v4 6/7] riscv: Add tools support for xmipsexectl
Thread-Index: AQHb5dxjaqbHoDAWk0qz9dJPHr4eTrQVK5UAgAADr4CAABUIgIABblaA
Date: Fri, 27 Jun 2025 08:40:53 +0000
Message-ID: <b579eb63-c465-45df-9558-a11c02fdb02b@htecgroup.com>
References: <20250626-af013235ad8d22421b2fe5b1@orel>
In-Reply-To: <20250626-af013235ad8d22421b2fe5b1@orel>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=htecgroup.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM6PR09MB2296:EE_|FRWPR09MB8190:EE_
x-ms-office365-filtering-correlation-id: 3967cbf8-cbd1-49cf-5e55-08ddb55653ab
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|7416014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?YTYweldSWDhGeWtjR2ZjT0hnYlFCNk8vYkdScXNPN05XQnI5ZVU0M3FvSHZO?=
 =?utf-8?B?T1NnNytmbmxHZXAweEJoOVFCLys4UkJ0YUNEanQ0TS9YcXFaZDJweUd2RUVw?=
 =?utf-8?B?ME9IYTNoU2J6Y3ZoaVJRN1U5ZzVnWWVVRDVkY0V3T1VoZldSOHJQWlRsT1ZM?=
 =?utf-8?B?ODhHVlBiWklXT3VlVVFFV1ZwQ2p2bWgxQS96OXpKUlZzSXdtQk1xWVdSOU5X?=
 =?utf-8?B?UmdEbW1zaEQ3VEF4a04xTW4veTR0V1ovUDVnRGVDOUdubTh2QVorbFB4MlYr?=
 =?utf-8?B?Z2JnL3NlL2dISzh1Vk9jMStyUkpDU3VPN3BBV3pGU1hQN0kwY2g3cTdhL1hn?=
 =?utf-8?B?WmM2c3hCTGZsZUZuOWVLOVlrRVJOUHIxWHl5RFFya1cxVFEyczdUbG1TbmxY?=
 =?utf-8?B?VEEwMXo2V0lGQUxGdjRXRGRxSWpibkxieWdzcjZnWXpuUnZxVnJ0TU8zOUI1?=
 =?utf-8?B?dmlPanBmd1l4N0plN0pvemVmdmt5QXg5a1A1L3UrUjcwcko3MXUwSFRmd2ww?=
 =?utf-8?B?Y0FhaXlTYTRtTTczVVR2Z1YyMXBGakhNL0J3dnk2eE1TMkIzTFpDZG1ZdUJQ?=
 =?utf-8?B?N0FuWXFZTVFBNm9hSHU5RmZTbUsxME13WC9NbFhkVU05ZExkU05vV2x0U0Jp?=
 =?utf-8?B?NjYzVmVRaWNkdWdiekY2d3BNS3N3alhXOFdFa1luOGQ1eDlPaWpjWHpSMUd3?=
 =?utf-8?B?NmZUWld6eEttdlZwVmVqQlhxK3dtVUdoSWVTVWl4bHo4bWh5eUZSLzAvUlJB?=
 =?utf-8?B?dDd5VHFKN21FNkpHQ0xVSTlnSHdvck96K1NSTkRKelY5b2liejFmZitQV1lR?=
 =?utf-8?B?enRrdFg3RlJSM2ZwckdxTnI5aUJTTGh4elROSWlibm4yNnB4WTJEVUhNdDhS?=
 =?utf-8?B?QVNJcDY4cWU2VFVyRkZiRU81bzVKSmZqcVZFNy8vd3ZOTGlkYyt1NFVudjdF?=
 =?utf-8?B?eGJSUGtCbFphMU10d0doeFpWaTJoYTd1TXFNdnVkblZFZnRPTnBlcElCNExV?=
 =?utf-8?B?aENmODNrMUllMUNZbWRrR3djSWRTV2p4V3YrVVp3aWE0NmRtOGRNdWZhQVI4?=
 =?utf-8?B?SHdBVi9tY3cyTDFVbGphM3YySjdUQnprem5rbWhLeHExT2ozbDMwajBrRkVE?=
 =?utf-8?B?UG9LL0VWV21lWXRJb2VaRWh0T1FjTndxS3YwQlhYcHhGSk1yZ3hweEtRNmtv?=
 =?utf-8?B?b3U0Q3kxN1lJcE9OOHBJMU9XaHJTT204ZzVVNWxtNjVBQ1ZESjloNmRaUldF?=
 =?utf-8?B?TFdNZDVqRHE0eFk5eThGeGlML1d6VnVoRjJyNmZxZ1oxUnhSU0ZQRm96L0pE?=
 =?utf-8?B?OXRFcmtOSVVuaE1lTjg5NU9sQmFOV1QrYmx0dkVibHFOTTVqYml0d3dCTHZL?=
 =?utf-8?B?S3Uzd0dENHRXdFlJNThXMXlOWnlXL2l3SzBUZlcwSzJ3YU1EMHNTY0U3bTEv?=
 =?utf-8?B?SkswY3J0V3FDTm1SRTI3dFFTTGU1cjcxb3Mxbis3dktIVkNpU294ZTA3Y2pF?=
 =?utf-8?B?WmFMVTlDNU1IUjB5U084aXkwdDB2Uys1Z1ZMUXV1REtxRGJKM1YwR1ZTWTdT?=
 =?utf-8?B?UkYvNUhJRDV4dGVrdWh6K2xmWldaVFA2c0VSeHpFOXBqVmRwV1ZrcFpleVdT?=
 =?utf-8?B?N3N5b09RN2VxZzR5Vmw4VVFoK2NrekExaU9lcDNMeFM5ZVJlMnlpd2MyUFJz?=
 =?utf-8?B?QjFSQ1BLN0FJb0ZYUTByNHJMVG1BTThRNjJGWFVtRTF6bHZ5MmpVOEgzV29x?=
 =?utf-8?B?ZzNkTUdNRlpJWlJjYVpkWUtCUzdka3ZtdW1OcGhuMDU5RlhsM0NYUG45b0w1?=
 =?utf-8?B?VzNSZ25kMnAyYlVhQWVNcTQ3bG5NNVhNMEF6YUhRc3B1MlJWOEFWcnFHaEFJ?=
 =?utf-8?B?dXc2ejFBQTZJUm1BQ09mV1c0UVdGMGVxdE12V2lac2R3enZYYzJhMENqSWpS?=
 =?utf-8?B?MGRGYlRLUWo1VjBNT3lLMExreGxDRmR0Vzk1aHJGNTlmL1RNemJyM3RZbEhz?=
 =?utf-8?B?SW1wdzJzRm1nPT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR09MB2296.eurprd09.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?SmppVkVvRW5EZmxJSFA4N2Q4N1M2d2cydnVBeFFvay95VFhoQTMxb1pDVmlD?=
 =?utf-8?B?M1ArUGdtQ1Z0UkNrTkp3MFpGaklLVUowQ0UrU3p5YmhoT0lkWEtYbHpOblJZ?=
 =?utf-8?B?dEhWaFl3dEtpa2JVZVJsTWFNcFNnVTFCSm9mNGhLblkyQndxSFVqTkZRckxE?=
 =?utf-8?B?bUR3czdDNXM4ajZhT1g2VXBwdHZ5RXNWaHVoUFYwbm5DLzROL015ckpkdTlT?=
 =?utf-8?B?MWk2RlJWRUp4ZWpKeHByNEtidmRrNUFPalppVHRMemlOUS8rWG5wSnVWaEs5?=
 =?utf-8?B?K3N0eHBHcVliN3VGY1ZXV0xqUVRYVWwza1haT1p5U00ybmNHbDhOTXFBWmNJ?=
 =?utf-8?B?L3JJYVp5VjlmWUU5cjFqc01Cd0lNR3NmTlpMMUdOWVRSVEcyR200QWNjMCt5?=
 =?utf-8?B?QWZmczJ3RE9OTzlYNnJsZDVEMXc3NGt6SHFTWHkyRkdCak0rU0FPV1VRYlpI?=
 =?utf-8?B?ckNJMGhrTnlXSG5nNXh2K29zdDI3UDNkOWZXWUF4cFU0LzRERTZnaUNlRENj?=
 =?utf-8?B?ZE5paFZWR2o5ZXNWZTdlSjZ2UHViVE4vejJmNUdwRWNFOGtVS0xlWVpXV2R3?=
 =?utf-8?B?SjBRWFgxbHhFSHpkQThqaEMxZXhQZXRBa1lVUzBMUXZHZG83ekxnWnRXaWQw?=
 =?utf-8?B?eUJON05ZRUN3YUlua1ltWjhUTkI4a29SMGJsZ2g4MmJIRi94QUc4QXdzQ3pT?=
 =?utf-8?B?Yy82Z2VwdDZ6ZXp2bGFMUjNOWXhtV2dVV3lKNHFRYzdVV2ZRYnVKSmgyQlV2?=
 =?utf-8?B?QWpiRDY4dDFMS0lla0pHVEJQNlVzRVhyT0V3dkVpZFJNVlFJSmxWa0cyYVhI?=
 =?utf-8?B?dGhuOG1Ucm44NnZNU1BzcFVJVS83bkVSMmZ6YmhKcWJGM0pOMjlJUnE0b0s5?=
 =?utf-8?B?OG1HVUtNY3VuOTQ5LzlMSWRjWXdremJiMTRCRnkycjFjQXpSckRnN0gxaVc1?=
 =?utf-8?B?K2hvak5vQnVudVNmR0NRNFh6L2dNK21kWDNUOWNNTXF3bUdGYTEzL2FSV1VQ?=
 =?utf-8?B?YjJwT0pnVWRNUXpEektuNnFpVWNHemp2bDJsWnhmNVhrcXFZYTAyL0wzVEQx?=
 =?utf-8?B?YVhTcnJoWDV1ZEdZc2lTT2JYZnl3NjM2eWEzQTBsbm1QU1h2N0VNcGRzdUVk?=
 =?utf-8?B?RVpzeW9qNDlSd3AyaGRMb2ZHWTZxSHd1Nk8xeE12czRuTHAvZ3VTZ3FaTlpK?=
 =?utf-8?B?NyttQzFCY0ZabnFjTDkzQktZQXYweXdzVjIyUkNZaEtVTElKeXlIV1dpYUgr?=
 =?utf-8?B?OTVISnZrQkRGa2FTM2haTUFUUC9uY24zL2I2dTVlaXVSb2RWcGJZMXB1OWc2?=
 =?utf-8?B?aXFFNHlsUFh2a0VSRDJVcWVLOW1lcXdNdlg2NUsxWHFtOXdXSXVwVC9TMlY3?=
 =?utf-8?B?cS9FNnBqblhsWHR4bGg4R24vOGlFWmVXREM1RVpTajhqZ2hLUFZMSmZqZkV6?=
 =?utf-8?B?WW1xTndjS3dNQi8vRDhyYVJacWgxekR3YXNHOUVmeDI1dlQvOE9GZ1lDcE91?=
 =?utf-8?B?R29KYTFySHhiL3dIZFIvUmxFOVY2aFBhZDZ5eHk0OSthSmFRbTYzbS94Mi9V?=
 =?utf-8?B?OEpoWHBSclUvZ2VIZ3YrRmxzK05EeDZoUUhwWk1IRFpmVStSWDNEbkc3UGE2?=
 =?utf-8?B?ZVBpMUE1WkNGRzhIQ2xWSnc3RmlCT0Y3T0lxOVFOMzZINiszbzcvWlFYcEU0?=
 =?utf-8?B?bzVHbjBDQ3V0cjM0OE1LWDRSd2tQaysxK0tETDNqTmhsdHo4MGRuY25BdEtp?=
 =?utf-8?B?V3A4RmE3Nk95b1g3Z2kwc2VocVRKWnlhT2dvVHFaYlFoYm1qaWl2T2ptWjF0?=
 =?utf-8?B?YzltcWpyZ1lHRDVJeEkySTc4SHhQaVdpdjBDNnhHai9nUEhLUUtHNTRjWHlj?=
 =?utf-8?B?bTBnVS9yT05MSGowakxJZmVudGhreHlPRTVoZFpMMHc0MERHSzZWMEJzL25S?=
 =?utf-8?B?V1ErR0tiU0lEeFRyZUF4M1E0Q3NTdmpnR2hnYWRmMlVCM0YvRmM3dlkvY2lr?=
 =?utf-8?B?cithTktad1NMT21jRHI4REgvU1dmUlV0dngzZm5CRm9uYTFsU0I4RGdaNGph?=
 =?utf-8?B?UTl5VGdSSU1YRG9JZ0IwWkVVMGJIRC9iT0Z4R2hCcmRqTmlkUFR0QklQenlI?=
 =?utf-8?B?andDeXRuK3dGSWRjTVFHbjJKeVRpTW10TlhTMkt5U21LNkY1OEpmMitRRFky?=
 =?utf-8?Q?ESnNVe2Fw1xMZOl6EdrjEgo=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <4332AD80B8AF124E80B110471B3A8A5A@eurprd09.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: htecgroup.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM6PR09MB2296.eurprd09.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3967cbf8-cbd1-49cf-5e55-08ddb55653ab
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jun 2025 08:40:53.1717
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9f85665b-7efd-4776-9dfe-b6bfda2565ee
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ANUU7/gWXtr313lc1ul6ze40BD1kFuAFPvZFpOUWKzz6ooYpTs7RtWEEe0kwAVTnZC90dSrqpChrafwFs7r6iFA/Ismc5scwtPkrFpFpD1k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FRWPR09MB8190

T24gMjYuIDYuIDI1LiAxMjo0OSwgQW5kcmV3IEpvbmVzIHdyb3RlOj4gT24gVGh1LCBKdW4gMjYs
IDIwMjUgYXQgMTE6MzQ6MjFBTSArMDIwMCwgQW5kcmV3IEpvbmVzIHdyb3RlOg0KPj4gT24gVGh1
LCBKdW4gMjYsIDIwMjUgYXQgMTE6MjE6MTBBTSArMDIwMCwgQW5kcmV3IEpvbmVzIHdyb3RlOg0K
Pj4+IE9uIFdlZCwgSnVuIDI1LCAyMDI1IGF0IDA0OjIxOjAxUE0gKzAyMDAsIEFsZWtzYSBQYXVu
b3ZpYyB2aWEgQjQgUmVsYXkgd3JvdGU6DQo+Pj4+IEZyb206IEFsZWtzYSBQYXVub3ZpYyA8YWxl
a3NhLnBhdW5vdmljQGh0ZWNncm91cC5jb20+DQo+Pj4+DQo+Pj4+IFVzZSB0aGUgaHdwcm9iZSBz
eXNjYWxsIHRvIGRlY2lkZSB3aGljaCBQQVVTRSBpbnN0cnVjdGlvbiB0byBleGVjdXRlIGluDQo+
Pj4+IHVzZXJzcGFjZSBjb2RlLg0KPj4+Pg0KPj4+PiBTaWduZWQtb2ZmLWJ5OiBBbGVrc2EgUGF1
bm92aWMgPGFsZWtzYS5wYXVub3ZpY0BodGVjZ3JvdXAuY29tPg0KPj4+PiAtLS0NCj4+Pj4gIHRv
b2xzL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vdmRzby9wcm9jZXNzb3IuaCB8IDI3ICsrKysrKysr
KysrKysrKysrLS0tLS0tLS0tLQ0KPj4+PiAgMSBmaWxlIGNoYW5nZWQsIDE3IGluc2VydGlvbnMo
KyksIDEwIGRlbGV0aW9ucygtKQ0KPj4+Pg0KPj4+PiBkaWZmIC0tZ2l0IGEvdG9vbHMvYXJjaC9y
aXNjdi9pbmNsdWRlL2FzbS92ZHNvL3Byb2Nlc3Nvci5oIGIvdG9vbHMvYXJjaC9yaXNjdi9pbmNs
dWRlL2FzbS92ZHNvL3Byb2Nlc3Nvci5oDQo+Pj4+IGluZGV4IDY2MmFjYTAzOTg0ODE3ZjljNjkx
ODY2NThiMTllOWRhZDllNDc3MWMuLjAyNzIxOWE0ODZiN2I5MzgxNDg4ODE5MGY4MjI0YWYyOTQ5
ODcwN2MgMTAwNjQ0DQo+Pj4+IC0tLSBhL3Rvb2xzL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vdmRz
by9wcm9jZXNzb3IuaA0KPj4+PiArKysgYi90b29scy9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3Zk
c28vcHJvY2Vzc29yLmgNCj4+Pj4gQEAgLTQsMjYgKzQsMzMgQEANCj4+Pj4NCj4+Pj4gICNpZm5k
ZWYgX19BU1NFTUJMWV9fDQo+Pj4+DQo+Pj4+ICsjaW5jbHVkZSA8YXNtL2h3cHJvYmUuaD4NCj4+
Pj4gKyNpbmNsdWRlIDxzeXMvaHdwcm9iZS5oPg0KPj4+PiArI2luY2x1ZGUgPGFzbS92ZW5kb3Iv
bWlwcy5oPg0KPj4+PiAgI2luY2x1ZGUgPGFzbS1nZW5lcmljL2JhcnJpZXIuaD4NCj4+Pj4NCj4+
Pj4gIHN0YXRpYyBpbmxpbmUgdm9pZCBjcHVfcmVsYXgodm9pZCkNCj4+Pj4gIHsNCj4+Pj4gKyBz
dHJ1Y3QgcmlzY3ZfaHdwcm9iZSBwYWlyOw0KPj4+PiArIGJvb2wgaGFzX21pcHNwYXVzZTsNCj4+
Pj4gICNpZmRlZiBfX3Jpc2N2X211bGRpdg0KPj4+PiAgIGludCBkdW1teTsNCj4+Pj4gICAvKiBJ
biBsaWV1IG9mIGEgaGFsdCBpbnN0cnVjdGlvbiwgaW5kdWNlIGEgbG9uZy1sYXRlbmN5IHN0YWxs
LiAqLw0KPj4+PiAgIF9fYXNtX18gX192b2xhdGlsZV9fICgiZGl2ICUwLCAlMCwgemVybyIgOiAi
PXIiIChkdW1teSkpOw0KPj4+PiAgI2VuZGlmDQo+Pj4+DQo+Pj4+IC0jaWZkZWYgQ09ORklHX1RP
T0xDSEFJTl9IQVNfWklISU5UUEFVU0UNCj4+Pj4gLSAvKg0KPj4+PiAtICAqIFJlZHVjZSBpbnN0
cnVjdGlvbiByZXRpcmVtZW50Lg0KPj4+PiAtICAqIFRoaXMgYXNzdW1lcyB0aGUgUEMgY2hhbmdl
cy4NCj4+Pj4gLSAgKi8NCj4+Pj4gLSBfX2FzbV9fIF9fdm9sYXRpbGVfXyAoInBhdXNlIik7DQo+
Pj4+IC0jZWxzZQ0KPj4+PiAtIC8qIEVuY29kaW5nIG9mIHRoZSBwYXVzZSBpbnN0cnVjdGlvbiAq
Lw0KPj4+PiAtIF9fYXNtX18gX192b2xhdGlsZV9fICgiLjRieXRlIDB4MTAwMDAwRiIpOw0KPj4+
PiAtI2VuZGlmDQo+Pj4+ICsgcGFpci5rZXkgPSBSSVNDVl9IV1BST0JFX0tFWV9WRU5ET1JfRVhU
X01JUFNfMDsNCj4+Pj4gKyBfX3Jpc2N2X2h3cHJvYmUoJnBhaXIsIDEsIDAsIE5VTEwsIDApOw0K
Pj4+PiArIGhhc19taXBzcGF1c2UgPSBwYWlyLnZhbHVlICYgUklTQ1ZfSFdQUk9CRV9WRU5ET1Jf
RVhUX1hNSVBTRVhFQ1RMOw0KPj4+PiArDQo+Pj4+ICsgaWYgKGhhc19taXBzcGF1c2UpIHsNCj4+
Pj4gKyAgICAgICAgIC8qIEVuY29kaW5nIG9mIHRoZSBtaXBzIHBhdXNlIGluc3RydWN0aW9uICov
DQo+Pj4+ICsgICAgICAgICBfX2FzbV9fIF9fdm9sYXRpbGVfXygiLjRieXRlIDB4MDA1MDEwMTMi
KTsNCj4+Pj4gKyB9IGVsc2Ugew0KPj4+PiArICAgICAgICAgLyogRW5jb2Rpbmcgb2YgdGhlIHBh
dXNlIGluc3RydWN0aW9uICovDQo+Pj4+ICsgICAgICAgICBfX2FzbV9fIF9fdm9sYXRpbGVfXygi
LjRieXRlIDB4MTAwMDAwRiIpOw0KPj4+PiArIH0NCj4+Pj4gKw0KPj4+DQo+Pj4gY3B1X3JlbGF4
KCkgaXMgdXNlZCBpbiBwbGFjZXMgd2hlcmUgd2UgY2Fubm90IGFmZm9yZCB0aGUgb3ZlcmhlYWQg
bm9yIGNhbGwNCj4+PiBhcmJpdHJhcnkgZnVuY3Rpb25zIHdoaWNoIG1heSB0YWtlIGxvY2tzLCBl
dGMuIFdlJ3ZlIGV2ZW4gaGFkIHRyb3VibGUNCj4+PiB1c2luZyBhIHN0YXRpYyBrZXkgaGVyZSBp
biB0aGUgcGFzdCBzaW5jZSB0aGlzIGlzIGlubGluZWQgYW5kIGl0IGJsb2F0ZWQNCj4+PiB0aGUg
c2l6ZSB0b28gbXVjaC4gWW91J2xsIG5lZWQgdG8gdXNlIEFMVEVSTkFUSVZFKCkuDQo+Pg0KPj4g
T2gsIEkgc2VlIG5vdyB0aGF0IHRoZSBuZXh0IHBhdGNoIGlzIGhhbmRsaW5nIHRoZSBrZXJuZWwg
Y3B1X3JlbGF4IHdpdGgNCj4+IEFMVEVSTkFUSVZFIGFuZCB0aGlzIHdhcyBqdXN0IHRoZSB0b29s
cyBjcHVfcmVsYXguIFdlIGRvbid0IHdhbnQgdG8gbWFrZQ0KPj4gYSBzeXNjYWxsIGluc2lkZSBj
cHVfcmVsYXggdGhvdWdoIGVpdGhlciwgc2luY2UgaXQgZ2V0cyBjYWxsZWQgaW4gbG9vcHMuDQo+
IA0KPiAoQW5vdGhlciBmb2xsb3cgdXAgdG8gbXlzZWxmLi4uKQ0KPiANCj4gSSBndWVzcyB3aXRo
IHRoZSB2ZHNvIGNhY2hlZCByZXN1bHQgaXQgc2hvdWxkIG9ubHkgYmUgYSBoYW5kZnVsIG9mDQo+
IGluc3RydWN0aW9ucywgYnV0IGl0IHN0aWxsIHNlZW1zIG9kZCB0byBlbWJlZCBhIGNhbGwgaW4g
Y3B1X3JlbGF4Lg0KPg0KICANCkhpIEFuZHJldywNCg0KVGhhbmsgeW91IGZvciB5b3VyIGNvbW1l
bnRzIQ0KDQo+IFRoYW5rcywNCj4gZHJldw0KPiANCj4+IEl0J2QgYmUgYmV0dGVyIHRvIGp1c3Qg
Y2FsbCB0aGUgc3RhbmRhcmQgcGF1c2UgKDB4MTAwMDAwRikgZXZlbiBpZiBpdA0KPj4gZG9lcyBu
b3RoaW5nLiBPciBtYXliZSB0aGVyZSdzIHNvbWUgZGVmaW5lIHRoYXQgY2FuIGJlIGFkZGVkL3Vz
ZWQgdG8NCj4+IHNlbGVjdCB0aGUgY29ycmVjdCBpbnN0cnVjdGlvbj8NCj4+DQoNCldlIGRpZCB0
cnkgdXNpbmcgYW4gaWZkZWYvZWxzZSBpbiB2MywgYnV0IHNpbmNlIHRoYXQgd291bGQgaGF2ZSB0
byBiZSBtYXJrZWQNCm5vbi1wb3J0YWJsZSwgd2UgZGVjaWRlZCB0byBnbyB3aXRoIGEgaHdwcm9i
ZSBjYWxsLiANClNpbmNlIHRoZSBNSVBTIHBhdXNlIHNob3VsZCBiZWhhdmUgYXMgYSBub3Agb24g
b3RoZXIgQ1BVcywNCndvdWxkIGxlYXZpbmcgYm90aCB0aGUgc3RhbmRhcmQgcGF1c2UgYW5kIHRo
ZSBNSVBTIHBhdXNlIGNhbGxzIGJlIGFuIGFjY2VwdGFibGUgc29sdXRpb24/DQoNClRoYXQgc2Fp
ZCwgSSBhbSBub3Qgc3VyZSBob3cgdGhpcyB3b3VsZCBiZWhhdmUgb24gZnV0dXJlIE1JUFMgQ1BV
cyBpbiBjYXNlIHRoZXkgc3VwcG9ydCBib3RoIGVuY29kaW5ncy4NCg0KQmVzdCByZWdhcmRzLA0K
QWxla3NhDQoNCj4+IFRoYW5rcywNCj4+IGRyZXcNCg==
