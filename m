Received: from NAM02-DM3-obe.outbound.protection.outlook.com (mail-dm3nam02on2085.outbound.protection.outlook.com [40.107.95.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 336AA1FF1C8;
	Mon, 28 Apr 2025 20:25:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.95.85
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745871912; cv=fail; b=joiIVPYiKcXUuVDOcAN2QXYLzUhr/REGzEdzIur5SRxXBZ35wCw1eOPAAOA3Y0iKVnLaC06kiq0w72GdZh0Us2w/HA14gnJqSHFff4zPXTmHCFDSvo9GCdz/sDdIxLGsQrlnl2ZFZtUgDT+ocRtkuSTXr7+ILT9wN+0sGVgN8u4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745871912; c=relaxed/simple;
	bh=xpd3HWFirYrNS6cw1+aKS5Xj9ah+NlLv2VIzXR6Gzgo=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=XlGaj9tJpKbK3lk6Hlh7nZ6Ux5/SY5CJ9+YfqABkcxGhCaBLZUc5lgr/Ss7bwFeEu6QByWv9X2FMzLc2hactwwV8v1TmUC44rETCJD1W/61UEpLD8Ech45qVv+OrTqIZvNrT4ZeBhzLwRuxUMLiqrtuBvzHMPEgkk3il/W12pPk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=NJsGswYs; arc=fail smtp.client-ip=40.107.95.85
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="NJsGswYs"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JtfaHKzC/Y1IGiiyfEg9A7plZTS5wyu74whoqYcub04kDiFFb4WvH9MpTzhPrQWQAIV27Wvx72jILX/1nzPQ0XkOEDlLGnwKlHQST02l/23Bpt8JOloN+j4y4/Bw8DvqCsBFoXYlZPhQAhbP8HXyAk84XufkhqJg8Cn7GfLA7NI6PDu/ncdv5WSTeSbG4hdR2LXK8sfduTPf/nF2n94Bop/xHWTA28dT041QwbFgOhlsTazV7ezfuAEYxAR/CCU+QGM0sCkLBXmFqhVYxI18/5dZ0YK+htDs0G2PVS5uzPnMmwD3EZfSfSXE7YGli5PD2dQcDAg+m6FyjKSlUr6MmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k+5X/LMfXq0aBKNt1G/uqRcgsNDmR+2U3Q1BljuZuoU=;
 b=PrB/COczxZnIogAsdkZJhZL4bTkoMB0kF06UfmGyrVXzfUsqPnFoLq/3Z2qlrIAZ8WEl8nFxv6ajeGMy6TvGgnx8LBBox/LZCj1Xd866oqyL6RimjhEmWqE9ejWGndTrqX6DprpfkUyKZ7WNYLhj1cZcmSrEbWHY9sksI57B37FJRgmV5Q9iUchzGUj2M+BXP+iC4c2gLIQwMrOosoak7yThWnWmdg+XMNRg7P7Qqept78THQdKsVrgp/06CVObqP+3PJV8JvXh4ZTLkxqshgbJQH/FOYAOcUY3yrtNUkTQ1T9w6mlbHw6VEtRXQmocHMlHcI2XBDTUQtQiDnmycQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k+5X/LMfXq0aBKNt1G/uqRcgsNDmR+2U3Q1BljuZuoU=;
 b=NJsGswYsWS+JzHMslr+y/p6Vk9Ln4T9NIEvdeVN03L1zqRs40osRUfuS8ev/MhVnqtkUYVTgXVVzpffk2H7/pcbMul/8GC64m2AHOcWmU8/LcxLSremRPO/t7ioLkT/Ub6Z891ZQ/pB3HhIC3fmqSPiwltuY2jd2wmHIqoNR7zwEY5xODI7Ohl0A+eAcRYljtJMHhp3bEzynNJUV4icOaW5zaObCmNgskE1Xts9uwKd3Tf2E5NdDLeRhVKNMvM0xqBmcTlPvFL6LjLOkShAZkP45GYKl8LQtlUC8rCwxCEyD44GTUjKFqERdNKx8MOUsQhJ4Tyf6wyAuESecEWaNPQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BL1PR12MB5945.namprd12.prod.outlook.com (2603:10b6:208:398::14)
 by DS0PR12MB7801.namprd12.prod.outlook.com (2603:10b6:8:140::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.33; Mon, 28 Apr
 2025 20:25:07 +0000
Received: from BL1PR12MB5945.namprd12.prod.outlook.com
 ([fe80::1faa:be1:ae57:44fd]) by BL1PR12MB5945.namprd12.prod.outlook.com
 ([fe80::1faa:be1:ae57:44fd%4]) with mapi id 15.20.8678.028; Mon, 28 Apr 2025
 20:25:07 +0000
Message-ID: <32b5e40d-f1a1-4104-b4e4-1471de77e2d8@nvidia.com>
Date: Mon, 28 Apr 2025 13:25:03 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/7] rust: property: Introduce PropertyGuard
To: Rob Herring <robh@kernel.org>
Cc: Remo Senekowitsch <remo@buenzli.dev>, Danilo Krummrich <dakr@kernel.org>,
 Dirk Behme <dirk.behme@gmail.com>, Saravana Kannan <saravanak@google.com>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Dirk Behme
 <dirk.behme@de.bosch.com>, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, rust-for-linux@vger.kernel.org
References: <20250425150130.13917-4-remo@buenzli.dev>
 <aAuryiI0lY4qYyIt@pollux> <81a65d89-b3e1-4a52-b385-6c8544c76dd2@gmail.com>
 <aAyyR5LyhmGVNQpm@pollux> <D9GIUOH0CKE4.3R01AYKCCG54O@buenzli.dev>
 <aAzrg31NB2g0X4qL@cassiopeiae>
 <39798ebd-35a8-4a67-9df4-f12a6f20ef11@gmail.com>
 <aAz1f2jhdwjXmHex@cassiopeiae> <D9GWI4GT3ZK4.25N3DYX5MSX0P@buenzli.dev>
 <c922d67c-ab20-4e46-9359-01fb32223d17@nvidia.com>
 <20250428201821.GA1572343-robh@kernel.org>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <20250428201821.GA1572343-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR13CA0095.namprd13.prod.outlook.com
 (2603:10b6:a03:2c5::10) To BL1PR12MB5945.namprd12.prod.outlook.com
 (2603:10b6:208:398::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5945:EE_|DS0PR12MB7801:EE_
X-MS-Office365-Filtering-Correlation-Id: 5892483f-3bb9-4e0f-1c4f-08dd8692c419
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dEdxcUpWc0dCWU5PSEpJc3AzdHdlV2J0d2h0eUR2RllFK0ZuMnM0UnBTcU9o?=
 =?utf-8?B?eGtMdW10S2dlS01kMG53aE9YWjQvYkVpdmgxNjVRb1lPK3AvZHBpenBnMUlo?=
 =?utf-8?B?eEpQMWh5MlRteWt0MUhybFZ1RmlTSFNSV3RTb1pyeTdWRXlhV2I0OUl0cGx1?=
 =?utf-8?B?K0tieDNpTkpKLzdBSU03Z1BSRThuSHVpWndQR1Awbnd5MUFOUGJqc1ROODlk?=
 =?utf-8?B?SUhJczUxaTA4djlYNmNBVEtZSkVaRURGU3Y5ZjdjejJZTGxSM3p6NmdBcnpn?=
 =?utf-8?B?Nkt0UFc0MDEyYXdvU2UyMzh5bkZMRWQ2bmZ3ZDY5U0d3eG1ISDNkUkVMc0t3?=
 =?utf-8?B?akU1WHFwTThKZVZZRnVZbHJHVVpFTngwMDFkYzg5SVc5Tjlib0J3TG11YU9Z?=
 =?utf-8?B?ZFlDVW9FbWtKYXQ4aFRhZWtuWmhCZVUybXh3V04rNjE2cXR3NmhNRkFtcXk1?=
 =?utf-8?B?QTUvZXFMd0NSR2lxV0l0ZG5QdlVzbUErNXR1cUhtZ1RJR1BPRmRSVmtUWkJa?=
 =?utf-8?B?bVlJbHJrYVVjVVJvaHBxMHIvdzJiL1k1SXppZXhFQUUxaXFML2dxeXJhU3Fp?=
 =?utf-8?B?ZXd3NXJyUW1RTDVGSXhBcFdiSXRSd2dmV3ByWkE5MXAxUWRQbHFEK1R3OE1C?=
 =?utf-8?B?TFhTSXhxMUltbGhhOEdlNU9JNGkrM3VRcU16UkFJQjVJWDRuMWNLeEo5RmpI?=
 =?utf-8?B?SUJ3dmNic1FZTmd0aUlJUFJuSEVtL0dFbnE1LzJWTG9kbUxTTFVkZlZlOC9n?=
 =?utf-8?B?cnA2TVpIQlB6VGQyaTl5aGFPVnkydXdQd3RhRlBFbWNiTTdieXYyNDB5VXVa?=
 =?utf-8?B?aEEveHZZSExNS216WnBDRG9HL3ovWngwZVdRdjBiQ3p1L3hwYVQycXBPNUtr?=
 =?utf-8?B?ZWRPa0RiN2p2VVYwOFdpbkxnWWp3N0NnM25FdGlaZVJPLzd6T3VFTnE1eXJy?=
 =?utf-8?B?bjNSU0JIK3F3SWNlRWpqNThIQTBBaHhxU3c5ZldWWEgyZGxNaXFTcmh5Vkph?=
 =?utf-8?B?TUIya1VUMkplUnY4RUQvcUZrMnY2dG41Wi9wbU5RaWwzUWNZMXI0ZnBOZWM2?=
 =?utf-8?B?b1NPS3hXN2ZuYWl1d2N5eWt6ZVpwMEZybUtpYVhiZ2h5ME5CWm44a2lGdHZK?=
 =?utf-8?B?QXBYTThaMXJGTEhkMDIyM21BL0U1RG1adkRRcjg1Z0J3RWY2MVl2R2hZV0FT?=
 =?utf-8?B?eWNwOUg2ZWVBZURQVXBTRFcwem9vaXBjSXB6ckhXZWo1S3VkZ2dMd0l6SERt?=
 =?utf-8?B?MEo1UGJBVjNZeU5sK21FeVQ5VVM3K294bUFONXdaTDdZa2xZWk5qU1pIRThY?=
 =?utf-8?B?d1hnQmt2RGM1YnQrNFNLaG15UkUxMHl6a29zNEd6SkV4OUtBek90endlNndL?=
 =?utf-8?B?ejhLNm1zdHBZdEdVUHIzTGgrRit4M3dxOEJ1ZXpHTnVTbHFLNEppLzBZeUdt?=
 =?utf-8?B?UkVjMW01dzdDYklYOHNmR0U0dlMrelFwVDhaQ2RXenU4N3JUMEd0azNCT3cy?=
 =?utf-8?B?OXVWdHZRUnpMNnFlSnordVJsQ0h5eElTRTBFTTNySWU2UnFxMW45SS9GbXN4?=
 =?utf-8?B?dHgwU0plNTh2T0xPbjNBNE10dWhVbTY0ZGU0NTRseVhiWlhnZHB6aU9NRlFF?=
 =?utf-8?B?T0hJVUJUK0RsbGFpTzdsekNwdG9XVUxEV004OUlGTzFEbjB4T2M2R2hmSHMy?=
 =?utf-8?B?WG4zYTZMcFB4Q0k4amNCeGJnamxNTlRHUzZQTGdrTEY3ZVBFN1g1MHM4Tytj?=
 =?utf-8?B?WnNxNVczMUx5R3hTaVZBQmM1bGpsMllSN2xSbXpSOXRRRUphUWp4b2wydFlM?=
 =?utf-8?B?NC9kRTlzcURsRk5Id2tSTk1rekFKb0hYQjJnNFZFWTVWYnU4MDhvSWJCRUtZ?=
 =?utf-8?B?L29JcXJBVnk1Wjl0eDBMNVZNY3BXKzdlUkl2WCtlbXc3azR0azB2dTEvbW9s?=
 =?utf-8?Q?W1lT15pXBm0=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5945.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?N09KTGU2S2x4MkU4Qm1EbVdtSEVvaXF5c1hMTGIzSzc4NmtRTE8zYVhvQitQ?=
 =?utf-8?B?WGR5clJ0SHlDOVdlZWlQM3pqVDRNT2dwcVM5Wk5nYWp4Z0x6aUVYRkV6RVNs?=
 =?utf-8?B?a1NrOTVmNVBSdldadFZyRE00NHArT3daTVkzdTNuamo4RDdYOHNMQ09UNEta?=
 =?utf-8?B?NDFid0ZyMlVjdUpIdHRuZEN6V0lIS0dZTjZMRDVaOTUwUCt6dlMxcEhaamdB?=
 =?utf-8?B?Y25LbzdEcy9qR2h2Q2Nqb0J0d0lSQkxuQU9ZVEw0QXoyS0xrVVRXOGNEZmph?=
 =?utf-8?B?ZnBBSDlPeE41bk9ZOUFHTUVCb0pEcEp6ZXpOUUsxcWQrS25VZWZHWUdSR3Vp?=
 =?utf-8?B?M0dYK0xFcFphaDM3SXZHRUVocVgzRjg2cnJJQS9yTHQwMXBmc3FvNVJZZ2Vq?=
 =?utf-8?B?SEdKMEd0Tnp3MGpaeERUZ0RMZ0hkSzFhNytFdSs4ZW9PZURhVEh0YTI5Mkh2?=
 =?utf-8?B?czRxNmJWaGlEWlRSKzVhTkE3Q0RmOTgyTmtTTjdxTGF3TFRYemJmOE1tTFIy?=
 =?utf-8?B?QWJRT05JbGN2bWg3MDUwam8yNVVNZ0NQaU0rNWNOUWtaS1FoQW5NSkVqMHBL?=
 =?utf-8?B?eHpYbzlZanlPTTFVOWgvTXEwUk5wck5JUUpOaG4vK2ZiVVMzeW5ic0JyWGN6?=
 =?utf-8?B?ZVpUNDduZ3ZuKzBPbHVSN0RKN1NzckFwdnVJbHkxRXAyOFUvemtMMWdPWVpU?=
 =?utf-8?B?VWtzbnpZM09rckU4V0FHMnB6aUxzbzRpWEtpVFB0YkpOMzlBSTcxMWtwR2Rh?=
 =?utf-8?B?TGNMRmdqU2JuWHhyd1lNU1BidWE4cU9OUUVqWGVDV2hldFFHM1pZY05ZN1Q1?=
 =?utf-8?B?RFI4ZVVyLzg3eTNIWE5jTVVRN3YwVUdvWUxKbHdhaHk0RUtoakt4YkdmQUV1?=
 =?utf-8?B?UGJNWndHVXVXbVg2NFJFNlJnNXZ3elVZTnlyQ2ZlYkhKUWRjVExObFR5WnNq?=
 =?utf-8?B?VS9sZERmUHZOSDB3eVo0cHVJYnZ2ZFczelh2MlJ6SWVNUlBqMDhEOFROV1Ir?=
 =?utf-8?B?c2k5R0VxOFg1bWdzM05lVUd3QTR2MlplSENLVStFeVZvczlrU2hBZDFaWmhU?=
 =?utf-8?B?a1M5aUNCQ0VqVnp2cmsrMnhXVDNZYnhQU0hFeHdhaUpmUVUxa2pvSHNUaXhn?=
 =?utf-8?B?b1VkZzgwd2VhYkY1L3ZwSWUxeDJkK3JjWHZmT0V3U1JBSEt0VVRFYzJRd1B5?=
 =?utf-8?B?VFNweHl0UlVMeXNwcy9MRGxWbHFzT01OYjJYZkNVRHFrNVgvaTBTNHRwYTFn?=
 =?utf-8?B?aHFpUWp1SmVDVFhlYkRzVUEzUWZUVTBGdk5uSEROQUg2T3I0bUFnTWdaRno2?=
 =?utf-8?B?T1BLcW1HUk1EaWJQTmJ2N1h3VEtWU2loSzY4VmlWazMrdmtsOVRDQTNseUVQ?=
 =?utf-8?B?bkNVN0FDZTNDY2xndVdpdVhRZzd2ZUpabzlwRVlkY3Vvd1MwWmFCcW9vbTY0?=
 =?utf-8?B?REY3TkRSZXdmNHpWa0V3ZkRCb0c3YUxaV09HanhMbkl2MkVkUHY2ZlZabnkw?=
 =?utf-8?B?eXRaSElYQkIzT0xMVFF2ZVdHQ2J0ZXFnbXcyVndQZlFjaitFM0IzTEVyQm9I?=
 =?utf-8?B?TzI3dFFVdUJRaVVDTVRnQ2NRRUN6WGx6LzVOVVY3SUtHNCsxZHRnRkszYWxm?=
 =?utf-8?B?K1VObktIMStwTGxiVjgvM2pQR2JTYUd5b3NPcGZpdjcyZkRqdkdDTHlzamk1?=
 =?utf-8?B?ejRoZ1A0bm1YQ0luZW9YbUdYdmhVem81Mlk5Y2JxY09BcUE2emJZVzY5Y1dJ?=
 =?utf-8?B?a0YwMXprcHdLakx4bFNaSWVOOVl5U3hCYllKdDB6Y2tRb0N4MVN6Sk1ncnZ2?=
 =?utf-8?B?emlkandMNnFXTndFbGViTlpJcFZYZ005VnYya2p2eXFqSHk1NEUwU1RnME51?=
 =?utf-8?B?d0RKc1FPTHRFWlVnN0hnSjNKK3RUSWtCSlQ0eE1GdVdZNFdwVXZ2dVNnK3Bz?=
 =?utf-8?B?UXJTOTAwV2x2K1hvR2g1OVlKcjE0WFBaVG1UaGhEdFd4anRWRmo0bkY1Y2Q3?=
 =?utf-8?B?YkthM2dwcTZhVzNYNWFZSVpEZVIrUmw5TXM5UzAycEhIT3RtUGp5YlQvc2pJ?=
 =?utf-8?B?b3cweDA1bnJJRFIwY0p2WmRjQk9GalVHSGcvdEwybXQxYm5VcmF0M0dmbmNi?=
 =?utf-8?Q?FqOSepJJ8gSWjAVlr+apdpp8j?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5892483f-3bb9-4e0f-1c4f-08dd8692c419
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5945.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2025 20:25:07.1684
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ERH9wRINwVDf0802zXT7as12HkkR9aQk04o72//6R4vb2NC4J4cSgNArGJiLjYuliPg8CHxi2/gz/1fi3y93Wg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7801

On 4/28/25 1:18 PM, Rob Herring wrote:
> On Sun, Apr 27, 2025 at 03:12:18PM -0700, John Hubbard wrote:
>> On 4/26/25 2:50 PM, Remo Senekowitsch wrote:
>>> On Sat Apr 26, 2025 at 5:02 PM CEST, Danilo Krummrich wrote:
>>>> On Sat, Apr 26, 2025 at 04:35:07PM +0200, Dirk Behme wrote:
>>>>> On 26.04.25 16:19, Danilo Krummrich wrote:
>>>>>> On Sat, Apr 26, 2025 at 01:08:39PM +0200, Remo Senekowitsch wrote:
>>>>>>> On Sat Apr 26, 2025 at 12:15 PM CEST, Danilo Krummrich wrote:
>> ...
>> The idea is that the lower level you are in the software stack, the
>> more rare printing should be.
> 
> If that's a kernel style/requirement, I've never heard that. About the 
> only coding style in this area I'm aware of don't print messages on 
> kmalloc failure because the core does. It's the same concept here.
> 
> When practically every caller is printing a message, it should go in the 

If *every* caller, without exception, today and tomorrow, including 
callers that expect failure--if all of those require printing a message,
then yes, it's time to print from the lower level routine.

Short of that, you end up with potentially excessive, and definitely
unrequested and/or undesirable printing.

> called function. It's not really different than anything else we do. If 
> we have 2 functions commonly called in sequence, we combine them into a 
> single helper function. 
> 

Right. And the rules are similar: the lower level has to be accurately
factored out. Not approximately.

thanks,
-- 
John Hubbard

