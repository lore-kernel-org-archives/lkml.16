Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2058.outbound.protection.outlook.com [40.107.236.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E3208635C;
	Mon, 19 May 2025 01:25:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747617949; cv=fail; b=lS1V99b0iTfNBVxijp8EczHLIBFS0xl/YH7OI5wdO+fnRz5omEalrCJGj3ayjZVRuLIq7MuaclFhdiHxifcKkCyuzHU6V7qO2MRh4ppW3SZGZ7cjPep2hyXQI5UCSCDl1NCdL/qEYapalZS+G1Itib6qDzjPrqjYrK/VzPXc6qY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747617949; c=relaxed/simple;
	bh=q4/EXdBnNUr/U/2CY0KN3LBPUnt6qPuyDdOLbjDu2Rw=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=fztCnCacvNa9EfXOZcjzvpZLD0SUOlrXcLylNrREPNKw8DFIPPtOmY39UXuMObnr9r4+AiqCerqOQcEpbMv+mdtUIPn/64klI3QInykA7Jdfx0ovE2tUE1qn6GxdULcvzSOs9/0VHc3xmOmshWbKSas31A6m88f6COh3Gvpqrns=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=L1as41Cg; arc=fail smtp.client-ip=40.107.236.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="L1as41Cg"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BycOURkXO/Ft7VsRjonxqY6InGMaTE9NTM8UKK2u7WrTa1GDISXW6d9RbupGW2jpafPEo9ol/uOHTitljXGmycYt4ITMgXmSEi7LfljMrlpFmcxThASdAg56+0p75ucErOkGxMYsFYfXmOs611wlOuJjiRtySrSGnU8eZ49SDnUxpUIvn5tUPDaXnNa4zr3QBcyY3SFv0cM4DnocEOjIwa1i+kwLMFwEp2fKzlz4Dl4WnbFh1MstOcicCfGABSW6hW0vOTExQtM3aa6U4U3cbxlXnvUY3UiW7CCyM+4YfG9HPVDVDkBXSetHcHoMqsnvtJp1ZFGr+XdOdVFU444tYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BqhS57oLSrG2fSbNi0LxlUuYEeBGug17mV356rXTqyI=;
 b=f1FyKIoW4KZ+X7KQFmrD9tO+jQsITNY76l4yFPOPin5lchSOimgCLglZsH0kdmrHQXZlRe1FcBjnr0kMtSXK/rINmU30AHAI60jhTpWJ1ad1AhBfrq9Hnj4ZBZYBjLgctD8EWFDBINKnrn/v5WDWHOzFaD0eO/SS4mJChENlpEpOvFG+pEF8TgcZk/lPkUWhmzm+4z5TPFoXVmF18pgfUPHeFixxAR7eOzIvHfvQYrip6mGf7EjenW6nrrdLd2qHYjqCmB4wKerkaXVgERthC9KCGcNRz/lzXQW2Sm9Ck8eI/kApzgka/KxWPIzn6FKZQjzTU5HblMd1DqiZmDU8XA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BqhS57oLSrG2fSbNi0LxlUuYEeBGug17mV356rXTqyI=;
 b=L1as41Cgo3Lkzkvj7idD4AvC4racLikXA/wlZRGE9WPKLVMNP+LO2JD8kY0Vpe7qUHcjZDYL50GXnYoJwhay4dgil++BjYVKDoE/J4NWObN4k7UZJFCv0lh2OYV7oSS0pwNj7IlzdExZEi0XQR3/UeTkGYc77ZRD6MpeHbCBSYHdxMDcQCO/fQ0Body8LHL0J/yrzBGIByfgXABpoTcbneCill+ILVSdERn5KsIeURyXp2aDxHYwsINF16Quykts6vz9EfxtUxMukkq14/2lCWrT5NlnfwD7C3IXySSWbUiWfDHT3kuUeS6rb63Se43vJ0fj94Bxf9D2xHwrYgCWWw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by DS7PR12MB9528.namprd12.prod.outlook.com (2603:10b6:8:252::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.30; Mon, 19 May
 2025 01:25:44 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%5]) with mapi id 15.20.8746.030; Mon, 19 May 2025
 01:25:43 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 19 May 2025 10:25:40 +0900
Message-Id: <D9ZQUUA4FLXD.19MJI9HD48EMZ@nvidia.com>
Cc: "Miguel Ojeda" <ojeda@kernel.org>, "Alex Gaynor"
 <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <benno.lossin@proton.me>,
 "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl"
 <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>, "Danilo
 Krummrich" <dakr@kernel.org>, "Boris Brezillon"
 <boris.brezillon@collabora.com>, "Sebastian Reichel"
 <sebastian.reichel@collabora.com>, "Liam Girdwood" <lgirdwood@gmail.com>,
 "Mark Brown" <broonie@kernel.org>, <linux-kernel@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH v3] rust: regulator: add a bare minimum regulator
 abstraction
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Daniel Almeida" <daniel.almeida@collabora.com>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250513-topics-tyr-regulator-v3-1-4cc2704dfec6@collabora.com>
 <D9YXK1J1XO37.JVILKENRKYXD@nvidia.com>
 <498AB71C-58EF-487E-8D9B-C7C113862948@collabora.com>
In-Reply-To: <498AB71C-58EF-487E-8D9B-C7C113862948@collabora.com>
X-ClientProxiedBy: TYCP286CA0004.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:26c::13) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|DS7PR12MB9528:EE_
X-MS-Office365-Filtering-Correlation-Id: 7e5b5d68-13d0-4f74-51de-08dd967412af
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|10070799003|7416014|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NEpqWExvTFg5UmlkcUR5bVBGRzNJcmxpaHZ1TmtGY2dSUGxtS1RYTHJ6OXY1?=
 =?utf-8?B?MXBIelNlY3RzK0JVOEx1emtNM2hYc3pBdDlQL00wLzU3WnBXRVFVSGtZMkR0?=
 =?utf-8?B?T2lzV3dBU0cyZG1zYy8wanNNamVjY1Qxd3d5RC9uYTUvUWJ5cmg0VStCaGtj?=
 =?utf-8?B?OHViR0ZPNlFTUkN6VTdoUkhKMEdzSHExeG11ajdNYjhiM3dyR3ZwR0t5K3lQ?=
 =?utf-8?B?UmtZekI2MlhJeUN6MVliaGtsYjJBOWdHb2gxOXB0dTdhaTgrT1l1amwvald2?=
 =?utf-8?B?TklnT1Q0WkpUS1E3NmNtbG52aVJpM2ZxQTcyVi9BVERDYThPTTZiaHJMdkt1?=
 =?utf-8?B?K0JIZXNGWDhsSExWbkNhMHN0Ymo5WHVLQjU3Ym9ESm1FeVc0bWZlQ2xoRHlR?=
 =?utf-8?B?ZE1rUXVxVHFTMjgzckwxWVJFTXl4Q0sxWVRxdEdodXRMZXE1ZnprTStFbnYr?=
 =?utf-8?B?Sm1zeTQ5SXc1MHN1eHVPZWN2R2ZhbS91QmN4ZjRUbXVTM3J6UzJtYlZwbitn?=
 =?utf-8?B?T0pCV00ra0FoeFlDUU02QXZXNzFKY1ZGQ05tQW50dVlPWG9NRWNzdGRSR3lH?=
 =?utf-8?B?cmhmUFVBcFl3VHFTOW82OWw3d2xQQzNOamdnNmNEUlNQYUozQkVNVFJ2NUZF?=
 =?utf-8?B?N0VabVdINHpUMmNYaXpZTDAxS1U5RWRkcHU0RHZjTXJkeW9PdTh2aU1BNTFB?=
 =?utf-8?B?Ums0OHJoR2F3TEZpYXNNY0tMV3Y4TXZENHV5bm1rTXhvVEFRV1Y2Vm15R05u?=
 =?utf-8?B?V1lFV1BGTTBzeVNFTGI4QklWUDZyazV5VlcxelM2VnJ4YVllQkFNMElHakxH?=
 =?utf-8?B?LzZDMW13dFJBeCthRDBETXAxZXJMUUNFTllDSTl1V2dqL2tEL2F0cjhMclow?=
 =?utf-8?B?MzFZNEwvTXNaekVpcG9zVEZacHA1UEcwL2FJWjdMK0lCcG5jZHJoVm9Ka2I2?=
 =?utf-8?B?YVVUOVZ4UzJWeWRJTHlnZHFrdHYrUFpzbDFmblh6ZVRkTHoxL3k1Q0hQRjRX?=
 =?utf-8?B?d2RpSmJCV01GaG4zT0RKYzRlYnd3T1Y1UzlkTEI2ZXd5SW4zTnBJc2V1UEpk?=
 =?utf-8?B?Y2ZTOS9ZdWk2dFBPMlFlUnc4UmNYMFdDU2NlYUFaU0JxNlFRREFtcFFYbVVM?=
 =?utf-8?B?L2NkN2w4dUNsZEZ1K1BsTk8xTW1MTzlYNzA4TEhKbVB6UXBYcFM1RWxaZHFC?=
 =?utf-8?B?UDVlS0d4UGZidXhSWDQ1UWhEYUFEbTF2bCtTT3pkbVYrOCtSdS9SdHA0aEZi?=
 =?utf-8?B?NjhmbGdUUzRsRkIxK0EvMzZmbXp5Q3VrN2RrRE1pRzlwVW0yVFBUYzNIWG1K?=
 =?utf-8?B?cWk3TEIreHp5V0lqMVhKVlhDL2dKTHJ6TE11ZGV0VkJXWTJqM1JCbngxWWV6?=
 =?utf-8?B?dzFwVVN1WndWZWE3OWRwSDlSTjNIdFBVYmtVZUF1ZmRlbnppMndka0I4N0hP?=
 =?utf-8?B?SDFiT2NiK1RUeHByRFkvaDNScEhqNWZ5MG04ZmcwS1BNdUJwZW91ZXZHZzgr?=
 =?utf-8?B?N0lvM2lHZlF3SitEZERNRXQwV0NpUHhEUXA5ZVZhMk1BeDJmT0lzWjhrQk5N?=
 =?utf-8?B?TlQwSXR6TmluUkNzWVdSUytTMExrM25IQmtLZUJ1OGljQlBjbmQvSml2azJo?=
 =?utf-8?B?UzVzWStVYnRxaUNwYSs5d095bXdOdGVJSkFUUVFSY2swYk9UY1NwWmZCSUlp?=
 =?utf-8?B?SC96NzJQOVJyY0lnZXAvYkZIZWJYT25mdnhWUjNGRjViZkpBUjJnc3BXVFMy?=
 =?utf-8?B?a09YdVl5YndCKzhINTdsOFdpZ2VhUFNIazJpcGNqTk1CRUdjbEZzRDdOWmRY?=
 =?utf-8?B?TE1QZFJlaDZoZzRCc25kT3d2S2dOSDFNTkZwdXRuU3dVZGJNT0Q0ajcyRDBS?=
 =?utf-8?B?MS9ZTkF3SE1CYk44K2FFeEh3eDlOTUliWkxPNDFyRHpSSG5iU0w3N3dzajlY?=
 =?utf-8?Q?M3TB/Cc8SpQ=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(10070799003)(7416014)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SVJsaUpnUVZpOHJnZGN6R2VtcnJWbVV1RlFWcytrS2NOMGRldEZ5bkxFV29P?=
 =?utf-8?B?RWZ3ZXhmbmxPdGlMMjduYTl3SlZxUk5XV3ErNm5ONnc1cVE3Wk1NMEZ1eDBI?=
 =?utf-8?B?YXZTYkluVGR6ZE5YQ1UrWFltbUJ1bzY1RThLK2dxRzNsTEhaRGdIVzh0NmxL?=
 =?utf-8?B?TElYMnVwRythY3JmQUxxaktBSUgwMER4WE5lcnlOaElKaVl0VXNrZENMUXlq?=
 =?utf-8?B?U3dOODZ0N3RET3RLQUFRcUJhbE81TTdQVEQvbXJIV2dHaVhkdkY3citiTU5I?=
 =?utf-8?B?b284bVU0alBxZmc4QnlTdjRQbDFJenZoRXl4a0FGSkRJbDc4VnlwTnVmSkJF?=
 =?utf-8?B?cm1nMGZpUGZrV2E3Si9vWmsza3FoSTZ5OHhJbWRmLzhyaFFWWEtObldoTU5T?=
 =?utf-8?B?UHpKWlBTUjFhdVBZVjBFREZ5T0U1c3VnQVVLazNhd1RCdFVYRjJMOU0zS1lO?=
 =?utf-8?B?b3A4NzRjTTRJRFF2SkZPaUZoczFhcEdjSDdjb3ZobDU4TDBmVUwvNWFjWHUz?=
 =?utf-8?B?ck0zWEFaZzQ3eDl6OEpqNEVEZ1J4RVZUaUhZSXk4cnM1SmRkK0c2V0NaVHFa?=
 =?utf-8?B?bmlMYTVGbWZqYnNjdk1SeW9LUGp2cjJRWkhPRFNEQW9GQzlUbjlvc1lFUFhT?=
 =?utf-8?B?VlBOdEpoSk1tb1dOcS9JMC9nU3dNYnNibHBIUkM0ek9Sd3pCV2ExV0REMm0y?=
 =?utf-8?B?dW5IeHVDcXI1MlFCVmp6Z3k0cGhGRFM0NHEyUjNvVENMdlhiTExodGR2bElU?=
 =?utf-8?B?MTZXRUxxUTdaUkNMbXZSbG9nSlJaMllIK1hjd2J4MUFscXRTQWRHWmw3SXlK?=
 =?utf-8?B?Q2RCV2ZUYUZLUzRheS84M1ltSjBKV00rRjE1eUQyM3NHVG43ekpNNFRzaTI3?=
 =?utf-8?B?R3dIRTV4aE5IVlY3QXlRWS9lb3JXVm1SZkpqN3JsTnpPblJWVkxVVzJ4bE1h?=
 =?utf-8?B?TUErelY0N09xdDRkek5sZGlDUmpIeVQzNjVhY0xzOWdzUXRTMUJ3bVIwZEJ0?=
 =?utf-8?B?WFlyVVR2VThWMHU4VEJkdzh2OEVVYjdIWXQyZ0htWjJqdTVQVlYweS9JWGp0?=
 =?utf-8?B?VjlDUnBMd3JCMUo4RkxvYUNhZmdveUZCQXVuQ0o4YjZnekxGdXZ0ZVNkMFFR?=
 =?utf-8?B?aW1JUkMzSGZRUi9QOFczWWFnS0ZFaHdMZk9LeEczbmNUOHlBWTh1bVlqRmVK?=
 =?utf-8?B?azBKbk13eHJaRHcxSHRCT1RzWXdjKzlYYUlHUUtFMUVIQ0JWNnVoN2RlcXFw?=
 =?utf-8?B?VkI5dWE5b1YxeVhNU25lcDJMOWd6SnpwTVhFZTA2SEg0MStnRGV4K0ZKYUUz?=
 =?utf-8?B?bFlyMXg3eWpGTWFUc2ZQc3F0VWFEL051ZFBZeWI3VjAzM1U0a3BwTThrc3k3?=
 =?utf-8?B?SEZtTVdlNEFXNlFIZ0RHMFNFTEt0RFpyakpUcllmVDZzZy8wVlBqdXMvSloz?=
 =?utf-8?B?eXFRWWQ5UTI1QXNxeFAvZm9PMy9aZFdnVTBSRzJ0L2dLWjNzMCsxZXlrRzRM?=
 =?utf-8?B?MGsveFJ0eUxQcjdUVlRkaXNqL1Q1OWFRNUs4U29uMDhNWUk2NDFGQzQ5K3pC?=
 =?utf-8?B?M05WZ2c5bDFuMXIrUTEzNUk0b2NnMU5zMnhxRFdHTjN4dlIveDgvcVZ6QmdI?=
 =?utf-8?B?NVhYYmRjZmRoSEI0NVFXSkF0VWMwcm9WQ3ZJbVdNZ0RTK2w2aHlpMlp4Rldh?=
 =?utf-8?B?eHVFOUZkNHhaZW1TUzVnMWovL1RYeHF0YkJtYm43a3FXNDM2MTBmQjZPaWRE?=
 =?utf-8?B?TFJ3NWtZSlB3V20zekVVSEVBNDlwYU5EQlo0dXFZL1NRSzkweVVhQllyZVVz?=
 =?utf-8?B?YldCT2EyZ1BrWVVCUXFzMDdtL3JJdkh5UXZTZ1RXcUgxdE1rUGY1aG1oaERX?=
 =?utf-8?B?c25FbEM2dEJmbDdjNVZPMlV1c3QyZkF6RkVwVFlhRU8vajNYZEZkcnlhMXpI?=
 =?utf-8?B?Q3l3eDRuQzZiVFNxalhQZzkvUjhWUHFGK3gyakRMczNaL1E1SmVpd0xGWHY2?=
 =?utf-8?B?NHdpTTdIdzgyWkJBNnlMMVRYRWtKVGZVd3ZGcW9kaWRyMUUxOU4rRUErV0ZZ?=
 =?utf-8?B?ekFTUUdlK29DMnR0RFh1citTcVdlTmFzK3BWWmxKNHFpaGpnaTZvZWRrRWUw?=
 =?utf-8?B?WmU2akdaYm5SZzgybk05SU1sVG8vQ2xoM055czluOGdxck9hamMvV3dqSXg0?=
 =?utf-8?Q?zV3keQxuIrCOpq9n6micvbcjWV0/PJTm/FZ8xFYN9xm0?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e5b5d68-13d0-4f74-51de-08dd967412af
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2025 01:25:43.6466
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: A+omzCCTdreULVJ5bG8NTtNpb2e2hrQxQHVzifUmK8EETa9lh9lWx7HWJ1XTtvwJ3MrgOiYRcQ5iLKjgju0bMg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB9528

Hi Daniel,

On Mon May 19, 2025 at 12:11 AM JST, Daniel Almeida wrote:
> Hi Alex, thanks for looking at this!
>
>> On 17 May 2025, at 23:28, Alexandre Courbot <acourbot@nvidia.com> wrote:
>>=20
>> Hi Daniel,
>>=20
>> On Wed May 14, 2025 at 12:44 AM JST, Daniel Almeida wrote:
>>> Add a bare minimum regulator abstraction to be used by Rust drivers.
>>> This abstraction adds a small subset of the regulator API, which is
>>> thought to be sufficient for the drivers we have now.
>>>=20
>>> Regulators provide the power needed by many hardware blocks and thus ar=
e
>>> likely to be needed by a lot of drivers.
>>>=20
>>> It was tested on rk3588, where it was used to power up the "mali"
>>> regulator in order to power up the GPU.
>>>=20
>>> Signed-off-by: Daniel Almeida <daniel.almeida@collabora.com>
>>> ---
>>> Changes in v3:
>>> - Rebased on rust-next
>>> - Added examples to showcase the API
>>> - Fixed some rendering issues in the docs
>>> - Exposed {get|set}_voltage for both Regulator and EnabledRegulator
>>> - Derived Clone, Copy, PartialEq and Eq for Microvolt
>>> - Link to v2: https://lore.kernel.org/r/20250326-topics-tyr-regulator-v=
2-1-c0ea6a861be6@collabora.com
>>>=20
>>> Resend v2:
>>>  - cc Regulator maintainers
>>> Changes from v1:
>>>  - Rebased on rust-next
>>>  - Split the design into two types as suggested by Alice Ryhl.
>>>  - Modify the docs to highlight how users can use kernel::types::Either
>>>    or an enum to enable and disable the regulator at runtime.
>>>  - Link to v1: https://lore.kernel.org/rust-for-linux/20250219162517.27=
8362-1-daniel.almeida@collabora.com/
>>> ---
>>> rust/bindings/bindings_helper.h |   1 +
>>> rust/kernel/lib.rs              |   2 +
>>> rust/kernel/regulator.rs        | 211 +++++++++++++++++++++++++++++++++=
+++++++
>>> 3 files changed, 214 insertions(+)
>>>=20
>>> diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_h=
elper.h
>>> index ab37e1d35c70d52e69b754bf855bc19911d156d8..e14cce03338ef5f6a09a23f=
d41ca47b8c913fa65 100644
>>> --- a/rust/bindings/bindings_helper.h
>>> +++ b/rust/bindings/bindings_helper.h
>>> @@ -31,6 +31,7 @@
>>> #include <linux/poll.h>
>>> #include <linux/property.h>
>>> #include <linux/refcount.h>
>>> +#include <linux/regulator/consumer.h>
>>> #include <linux/sched.h>
>>> #include <linux/security.h>
>>> #include <linux/slab.h>
>>> diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
>>> index 28007be98fbad0e875d7e5345e164e2af2c5da32..c8fd7e4e036e9e5b6958acf=
0dcfa952b916a3d48 100644
>>> --- a/rust/kernel/lib.rs
>>> +++ b/rust/kernel/lib.rs
>>> @@ -86,6 +86,8 @@
>>> pub mod prelude;
>>> pub mod print;
>>> pub mod rbtree;
>>> +#[cfg(CONFIG_REGULATOR)]
>>> +pub mod regulator;
>>> pub mod revocable;
>>> pub mod security;
>>> pub mod seq_file;
>>> diff --git a/rust/kernel/regulator.rs b/rust/kernel/regulator.rs
>>> new file mode 100644
>>> index 0000000000000000000000000000000000000000..7b07b64f61fdd4a84ffb38e=
9b0f90830d5291ab9
>>> --- /dev/null
>>> +++ b/rust/kernel/regulator.rs
>>> @@ -0,0 +1,211 @@
>>> +// SPDX-License-Identifier: GPL-2.0
>>> +
>>> +//! Regulator abstractions, providing a standard kernel interface to c=
ontrol
>>> +//! voltage and current regulators.
>>> +//!
>>> +//! The intention is to allow systems to dynamically control regulator=
 power
>>> +//! output in order to save power and prolong battery life. This appli=
es to both
>>> +//! voltage regulators (where voltage output is controllable) and curr=
ent sinks
>>> +//! (where current limit is controllable).
>>> +//!
>>> +//! C header: [`include/linux/regulator/consumer.h`](srctree/include/l=
inux/regulator/consumer.h)
>>> +//!
>>> +//! Regulators are modeled in Rust with two types: [`Regulator`] and
>>> +//! [`EnabledRegulator`].
>>> +//!
>>> +//! The transition between these types is done by calling
>>> +//! [`Regulator::enable()`] and [`EnabledRegulator::disable()`] respec=
tively.
>>> +//!
>>> +//! Use an enum or [`kernel::types::Either`] to gracefully transition =
between
>>> +//! the two states at runtime if needed. Store [`EnabledRegulator`] di=
rectly
>>> +//! otherwise.
>>=20
>> Having the enabled or disabled state baked into the type is indeed
>> valuable for drivers that just need to acquire and enable a regulator at
>> probe time. However, there are also more dynamic use cases and I don't
>> think the burden of managing this aspect - by either performing a manual
>> match to call any method (even the shared ones), or implementing custom
>> dispatch types (which will lead to many similar ad-hoc implementations)
>> - should fall on the user. Thus I strongly suggest that this module
>> provides a solution for this as well.
>
> I am not sure I understand what you mean by =E2=80=9Cdynamic use cases=E2=
=80=9D.
>
> Can you expand a bit on that?

I just mean the cases where users will want to enable and disable the
regulator more frequently than just enabling it at probe time.

>
>>=20
>> It has been proposed earlier to use a typestate, and this would indeed
>> provide several benefits, the first one being the ability to have shared
>> impl blocks (and shared documentation) between the enabled and disabled
>> states for methods like set/get_voltage().
>>=20
>> But the key benefit I see is that it could also address the
>> aforementioned dynamic management problem through the introduction of a
>> third state.
>>=20
>> Alongside the `Enabled` and `Disabled` states, there would be a third
>> state (`Dynamic`?) in which the regulator could either be enabled or
>> disabled. This `Dynamic` state is the only one providing `enable` and
>> `disable` methods (as well as `is_enabled`) to change its operational
>> state without affecting its type.
>
> Dynamic is just "Regulator" in the current version of this patch. There i=
s no
> "Disabled" because there is no guarantee that someone else won't enable t=
he
> regulator, trivially breaking this invariant at any moment.

There is a core difference, which is that in your version of
`Regulator`, `enable` takes ownership of `self` and returns a different
type, whereas `Dynamic` would take `&mut self` and change its internal
state, like the C API does.

>
> The only thing we can guarantee is "Enabled", through our own call to
> "regulator_enable()".
>
> In fact, for the typestate solution, I was thinking about "UnknownState" =
and
> "Enabled", or any nomenclature along these lines.
>
>>=20
>> All three states then implement `set_voltage` and `get_voltage` through
>> a common impl block, that could be extended with other methods from the
>> C API that are independent of the state, as needed.
>>=20
>> To handle typestate transitions:
>>=20
>> - The `Disabled` and `Dynamic` states provide a `try_into_enabled()`
>>  method to transition the regulator to the `Enabled` state.
>
> Why not =E2=80=9Cenable()=E2=80=9D as we currently have?

`enable()` to me sounds like a method that mutates `self` in-place,
whereas your version consumes it and turns it into a different type.
Such methods are typically named `into_*`, or `try_into_*` when they can
fail.

Actually, this could even be a `TryInto` implementation, but in this
particular case having methods with the target state in their names may
result in clearer code and allow the reader to model the transition
graph more easily.

>
> If we go with the "Dynamic" nomenclature, and we agree that there's no
> "Disabled",  then we can implement "pub fn enable(self) -> Regulator<Enab=
led>",
> for "Dynamic", which is what we currently have, but with other names.

Not if we want to provide the behavior of the C consumer API, which
requires multiple calls to `regulator_enable()` to be matched by an equal
number of calls to `regulator_disable()`, which could be useful to some
drivers (lest they reimplement their own counter).

>
> Also, I personally dislike this term: it's hard to tell what Regulator<Dy=
namic>
> means on a first glance.

Yeah I'm not a fan of it and I'm sure there are better alternatives.
Maybe `Controlled`?

>
>> - The `Enabled` and `Dynamic` states provide `try_into_disabled()`.
>> - `Enabled` and `Disabled` also provide `into_dynamic()` (which cannot
>>  fail).
>>=20
>> Essentially, the `Enabled` and `Disabled` states simply enforce an
>> additional operational state invariant on the underlying regulator, and
>> do not provide methods to change it.
>>=20
>> The `Dynamic` state would be the default for `Regulator`, so by just
>> using `Regulator`, the user gets an interface that works very similarly
>> to the C API it abstracts, making it intuitive to those familiar with
>> it.
>
> This is already how it works: Regulator is the default and EnabledRegulat=
or
> adds an extra invariant.

Hopefully the above clarified the differences.

>
>>=20
>> But for cases where the regulator is known to always be in a specific
>> state like `Enabled`, one can use `Regulator<Enabled>` and simplify
>> their code.
>>=20
>> This should retain the compile-time safety that your version proposed
>> for common cases, while still exposing the flexibility of the C API when
>> needed.
>>=20
>
> Yeah, I agree.

I think the concept looks better if you consider the generic parameter
of `Regulator` not as a state, but as a marker of guaranteed invariants
and allowed transitions.

- `Regulator<Enabled>` guarantees that the regulator is enabled on the
  consumer side. It is also disabled when the object is dropped. Many
  drivers will just do `Regulator::<Enabled>::get()` at probe time (the
  equivalent of `regulator_get_enable()`), store the object into the
  device's state, and forget about it.

- `Regulator<Disabled>` guarantees that the regulator is not enabled on
  the consumer side. It could be useful to have for drivers that use
  distinct types to store their state depending on their power status:
  the powered-on type would store a `Regulator<Enabled>`, the
  powered-off type a `Regulator<Disabled>`. That way you cannot even
  write code transitioning between the states if you omit the regulator
  - which I think is really neat.

These two should cover a large percentage of consumer needs, but for
those that need more fine-grained control we should also have one or two
policies that follow the C API a bit closer, e.g.:

- `Regulator<Controlled>` (or just `Regulator`): user is granted an API
  very close to the C one, and is responsible for balancing calls to
  `enable()` and `disable()`. Regulator remains in the state it was in
  when dropped.

- `Regulator<Switch>`: calls to `enable()` and `disable()` do not need
  to be balanced, and the regulator always transitions to one state if
  it was in the other. Regulator gets automatically disabled on drop.
  This provides a simpler, safer alternative to `Controlled`.

Note that I am not advocating for including these two policies
specifically, these are just examples. My main point is that we should
also provide a way to change the regulator's enabled state without
requiring a change of type ; which policy(es) to adopt will depend on
which restrictions we conclude are adequate to place on the C API, if
any.

