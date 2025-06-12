Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2061.outbound.protection.outlook.com [40.107.220.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F37C25487A;
	Thu, 12 Jun 2025 14:02:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749736976; cv=fail; b=A9+3/XKFg59/kP9CW/Rnz10MgW/TFAGf9+vcKRXy/mZqiEjJMzclEM7NlEFkbO8K4g47iAE9wB7kG1O2LYhEU3U3BKsR2FClkENqr+mJPRTV3DyGzFdVcRqYpbGvCklVdw5Sz5/4buYgtk5PPSHVZjvgjXmRv0RsAaiMfAZrBHI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749736976; c=relaxed/simple;
	bh=vgeCpHc5gDXcrjQVCkJYwTNYQ/KTgGZtznJyeDqN6+Q=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=KLxRCC51R13Lxf3a3j4R7McJ3LUggkGsLvUBWCd44sHzMS66xtod6rTF3ihsSfkymTClDUZPOYtInOT1E7aljFcIt4k1F7GMN4bdneIlszP0w3pG4axAz+LSBzlh01E/SSU3U2txXuNZILjbPg76fdZm18izcwzy8xkjXk8sPrQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=RkITzjdo; arc=fail smtp.client-ip=40.107.220.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="RkITzjdo"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PzOtxRa2VWa3QLu63WIMzsLUltBhK3nbnBUqahKdVMNvNYXZMeLY1lj17ZSOWZ0OPygzTAdCQFaylq6DvA8CqvHIHq8ET2F6JCrCTgDCkrCfvU5YGlEnNKBm60aTnj0e+Fw/EwsKjK5X3Xv3ADtJE2SHfWG141Q/xxM1TYNSMjwZ4hWErDEao4FaLxXZu6jP2RRV5eO+YjOM7z6TfuDTguLgf9exsXa+GCsA63xrs9VJG71J9jEKo/W+1m1fJRAazA9JYgVXZY4b0QpBmR+FnADsTy0zAM4Xt+IgWOQAuq6NzcRjh0H8BfGSACLClqjcJCOBUO7/kWY/4QLEZtLNcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T7E4m2II5j7uSOb9//xlcrTYSeByihbQNj/clr7DFco=;
 b=tN02+R1f5B1U/EzPqw4+LXx/PDM6AAqlSaFXmecmJrrWoSslL97vOjgSJvVpj4c+QZ4rMhMuIUgeUiNX7t52p2/ieMgzBNfEwX/XBaEE0cQc6qClklMLRSoN7nljNFAu+2d/JTLQYMR37IZKglLwzwt7jaknEYU8bw4A12ks/FPHQ/MfoGSz8+BIgR15MCy+Ae2f8lJO7dlsQGdbPdMOuwVOWSMSx4cnlRS9dey6No9twIWka7/1i8JmWXMvcuqrpj/2m+8wqV5zQn9OUb297HHFrecPx8Ix3ZSUg7clotEFwdMJ3mDxOUqzby7qu3h0fxFF6ealVfbycIU+T+hQng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T7E4m2II5j7uSOb9//xlcrTYSeByihbQNj/clr7DFco=;
 b=RkITzjdoFjOQpV51Nl1NCyIuhaVVhZvkjgQWZhgfCSvuELYlVl8+kZks1AWg8JAdgGmIFivK+fZ2UqRZ84o3d9A0nkE22Py67J3zGMyi2tNHF7MulN90+qt/M/hcXRV8ZCh/UBmtqT0AFiD+yuIOkMr4mDv/l3JuhYugwDvkGBL9V4Gd71I6ILbwKyoca29y0nQcC8UQDRUUiA/kzDMo82gOM9/nr7V6+jzRE6S5Ns4QlG3Zd/LtY/OY4JkMgghFpnarWHp+0iem5pcpB5KnzTWY48PBM4+Tjb6s/HLaFSc1RMfWqjwC5W0sJSkxlcqIBbdOo9wUWrfsv4go2LHilw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by CH3PR12MB8458.namprd12.prod.outlook.com (2603:10b6:610:155::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.18; Thu, 12 Jun
 2025 14:02:52 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%4]) with mapi id 15.20.8835.018; Thu, 12 Jun 2025
 14:02:52 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Thu, 12 Jun 2025 23:01:35 +0900
Subject: [PATCH v5 07/23] gpu: nova-core: add delimiter for helper rules in
 register!() macro
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250612-nova-frts-v5-7-14ba7eaf166b@nvidia.com>
References: <20250612-nova-frts-v5-0-14ba7eaf166b@nvidia.com>
In-Reply-To: <20250612-nova-frts-v5-0-14ba7eaf166b@nvidia.com>
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Benno Lossin <lossin@kernel.org>
Cc: John Hubbard <jhubbard@nvidia.com>, Ben Skeggs <bskeggs@nvidia.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 Alistair Popple <apopple@nvidia.com>, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, nouveau@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, Alexandre Courbot <acourbot@nvidia.com>, 
 Lyude Paul <lyude@redhat.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: TYCP286CA0278.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c9::19) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|CH3PR12MB8458:EE_
X-MS-Office365-Filtering-Correlation-Id: 19924bed-9037-443d-feb5-08dda9b9d28d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|1800799024|7416014|376014|366016|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VGk1V0QrcktGeWNHQ2dCYlVFV2dqMDIyN0dycEVYYVl6dThnUnI5eUE3eGM5?=
 =?utf-8?B?ZWdWcXBWRHVhWHJ6MFhjN3o1SmhYUUlMbDF0elgrN2sraG9nME82dGRjMWo3?=
 =?utf-8?B?WUVxeTlMZVc0VXFmQmNFYmROSmU2anRHNlZKMkw2VnI4aHgwMnowaEZ6V1pT?=
 =?utf-8?B?aHNSZ0t5eGZIR2dHelQzcmEwT2g1Rmh6YTRxaEk0dW9lS2J5S090RDZxMWE0?=
 =?utf-8?B?QTJ6Q3lmdytpblV4azlVWkErU25EMFI1Y1BneHJJMEhZVDVUZW9KeGxKVGwx?=
 =?utf-8?B?MzVtRnNhZjdlZHljNkl0STZLKzkwRVpBTzFOYXpaaHNwVFdvSFlOYnk0Sjd6?=
 =?utf-8?B?SzFhaFFLMVprcko2K0dwUzR2VHk1bFM0NkdxVUUvOXpNeHAyRlpoOWZrT2hw?=
 =?utf-8?B?ZUZ0QTVLSGNFbzhoQVR3QkpjMGgvOG9IWDg1WEYySHlsempka0RQZWxIQ2Fm?=
 =?utf-8?B?K2hJdGF3VkRjMFVCTVRjK0xoUFMvNXQ0aVlxcnJ4UGE0Zno4ZFBqOHJSYTJJ?=
 =?utf-8?B?MmVZSDkxQzE5K3JNUWdRRlU1NUVBR09aMUVYelZDMTZSMThiR1lDeEJ6VzVo?=
 =?utf-8?B?cW1HY01rd0NpNStVUW1tbm1lVlZWM0dxMWhOMlpRYVVaMUtDYVh6ankvL2xE?=
 =?utf-8?B?Y0VkQ3V2YjZzdWlxYUUrQVB4UmNkd3BGZVh0SVRIRHc4Vy9BRTA5Y3dudHdU?=
 =?utf-8?B?R1Z6RWxvVk9zRW02dG9PMEpmbTZLOU1QOTBySVJDRUowL2JndUt6akdPTnRl?=
 =?utf-8?B?U1lyMVU1bk9tVDgrOGlqVVZsQ211UXNZaks2Q1hMbjZXUGdKR2xKSXlQeFNz?=
 =?utf-8?B?NC9OeXhsM1VYZ051alZyU1c1OXhZaThjYmM0ajNVcUNrOFQxSTRJelR2cUFS?=
 =?utf-8?B?ZGdkRGIxTXpPdlczbUFOcldpRGNUWitqZHJoOHVialRteFdjNVpRVXNadk5m?=
 =?utf-8?B?L1lQQUxoWVJoejRqcFY5eHplVnViQ1JMRGlOUHZSK0FYbXl4T1VRMDI0Z0Yw?=
 =?utf-8?B?VTVVT1g5UWNsVmpWMmtOdE52Z2tGVFBJWHRkRHMyVEdvb2JKcGF1cU5sc2RN?=
 =?utf-8?B?SUxlaXRvQlJWUnNJRUphVGZxRnNpUC9GYm1Vc2h2UFZzUWRRRG42UlFHN29Q?=
 =?utf-8?B?elluZHJKU2JzVHZ2bUtqd1VKaEdadlVLMDU3RzJxLzJwaU5QK3czeXE3eEYx?=
 =?utf-8?B?R0tKREs1U2ZBdFU4Vms5czV1enJhNFBxTlppRGE3aXkxQXhBUlM3anJmb2Jm?=
 =?utf-8?B?dzBhVG02MHkzSGUxc2ttUVJqYkMybVRnTGxWWU1yS1hsVXNYK2E5eEtLSDhY?=
 =?utf-8?B?L25CNExRTXpBNmgvcllobWRXSnkyUzVrVS8yOGFwVmp2QjVGWUU4MklBTTRi?=
 =?utf-8?B?dkdKMjI1S2FJOFVTWC92V05ONDNnOEJELzV4Nyt6SkRLZFhCVFNyeHg1VkJN?=
 =?utf-8?B?Y2Z0NnF3QjhjQi9KYjdyQWZaSU5sS1VlNXhoU3Y1TFUrUEJiYWk5SDBJZjVo?=
 =?utf-8?B?ci80ZUV0azNuQkdxSlpIYm92aXkrRWVDdVBTTmV5aGdOLzJtcHB0aXJSaytZ?=
 =?utf-8?B?eXhRRFdwWUxMVzl6Mk11WkpOWk52MndNaE91VWsrdEVQc0NMUHl1cnpIcTlB?=
 =?utf-8?B?WXdtK3dpaUZlK1NocnVBbytXWkdVYk9XYUhnMlJYOW1SVTI4UmFxR2JWNEZa?=
 =?utf-8?B?RitlZnh3YVpiVERwT3FlaEl1L3I2a0JQVmt1TXFPcG00eTIrdlM3dEloSm9D?=
 =?utf-8?B?RFFEQTZvMk80ajdnbWdnUUlQVFZYZ2NIUlZNdkhpMlBYK21SVnJhaGxjVVhr?=
 =?utf-8?B?ampyU2ZIaXNnUXBEU3htUURQaU51dmdhR1NKRHg3ZUZvYjFZNURaK2xDY3pJ?=
 =?utf-8?B?UVM2V0dzTTNQcnBUZ0M3SlpaT211bE1za3Q5NnIxQk81UGxPakNUSmd3MjQw?=
 =?utf-8?B?Sm9IUzFKbHZWVEdOUzVoM0J3cm12QytWVk1TakdzVmU2bDhhVzdycUF5UHVm?=
 =?utf-8?B?MXhqS2s5TDJ3PT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(1800799024)(7416014)(376014)(366016)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?R1RKZG1IY0FtaVNMM1FydXQwUk9vZXdadEpyRXNkblZRc21DcXVMWnp3RXpu?=
 =?utf-8?B?L01Td2x0SkVsTTZhMzVQc00raVQvT1FLNGdKV3JpVGlXVlpZUDhrZWlUUnVu?=
 =?utf-8?B?TFlpbzNjTi9WV0pOV2lmay9FUTBxSVFsTGlZb3VScFY1TkxEMWtYTkJXc3hE?=
 =?utf-8?B?RG9KTnEwSk1sSnhySnRmMWc3K0FXa1czYWhjSHRlclcvVGZLZDhKNEp6MHRQ?=
 =?utf-8?B?cmxKdkRTbXRLaDNZWnVydVFwUjN4V3RrTlF0MmJHUHNRUGZJNVMrcFZpeW85?=
 =?utf-8?B?UHNkN0dNQllncEpPblZEdDVWNDdqS1Y3NjRPcmhtdjZSOU45dnJ2bVRsdjhw?=
 =?utf-8?B?YmVxdDZWUkNvRDhKNjJLeXBvMVg3ZDh5Slo1eDdnUXNMakxQU0FTNXoxWVBV?=
 =?utf-8?B?cFh1WlZnWTFXQ08yK2Z2NThMTnhBWi9sd1BLQ0d5Q04wMzVSU0tYQmhCTDk1?=
 =?utf-8?B?Q0ljVEVYUDRXU3Z5NXhMTmZ0RktYYlc4eXBzRGkrRDFQM0hPdGpSUm80OUo3?=
 =?utf-8?B?NERxLzYxR0JVajBkSDhidWlYLzMvVWxJMGNQOGk0MnRRSHRWSGlIV25qeVAy?=
 =?utf-8?B?c3pyWEE3UzRnM1A4RkY3dVgvTUxScmNadlVBZGhnZTBoVXlhaExKTC9mRmdy?=
 =?utf-8?B?YUNNOWRNMU1EMWNiSjRMcUlSWlJLWE8xaFhUcWYxNlk2L2JtYXhQZG52SldC?=
 =?utf-8?B?WlBVbUpTeUJ6Zkg4cTdvOFNha1kvL2hwQkJ2VWEvVkh3THdyWU1zalZHbk5E?=
 =?utf-8?B?R296bWpYeHNENjJ4a3pjNlRXUWsyOTZMdlZjTVhiVFhYZTZhWFJPQ3JQald5?=
 =?utf-8?B?VjcxaCtUc3JaTUd0SDd1QVFmZThyaEtqcEo1VjBIWlhWWWNXcTJiaFoxRnJk?=
 =?utf-8?B?RklKUEFDVU1xOVV6OTlTS3VYNWJkNzZzbE9JMnhlVjhSb2VnOFdCYXBRdEVn?=
 =?utf-8?B?alkxMGo5WkllL1E3dGkzUi9Ea0dNSlJ3OHdNSnUrckhsU01hUlpUQzYrWitl?=
 =?utf-8?B?U1VhaU16VFdFc1JQV1pEeThDVUtqTFlDZCtUVXo2WWJpcjhzbDVHSlplTmM5?=
 =?utf-8?B?RExBWVZ6K1FtK1lJd25wZHdjSWttelUzWE1naEtNQWs0aXhoTmZSYWN0TVZT?=
 =?utf-8?B?RXV1SEJXYmhIRWFRYU1xdGlrRmQxeExzZlYrRXRPcVlWNkFnNzMwV1pJMW41?=
 =?utf-8?B?UExvanVNN1BqT2tGTUlrYkJFSTRGdm0yK0svYTRiVjJUY1dieHVML2dQaDRt?=
 =?utf-8?B?OUlIU01BZUVkVTVFTk8zZWxpelQ2ck01dmpneW1hUmlHb0xSUjlwdmNUOGIz?=
 =?utf-8?B?VkZWb1hVbzZrMWhpQUdVcG4xTHlFVzJTb3VCV2R4cE02YWxkT1dXRjdBMDRr?=
 =?utf-8?B?cXMvUGpuNFl0eHp3NCtUYXc1QkpWNjZwMXMwOGJ5aXpCVVlQYmRvaktsSTN5?=
 =?utf-8?B?Zk1YZzZWK0lZNjRaL2FPQi9jY1pJb0FhOUtjZy85MXU1VzIvVXpybW9sUnVK?=
 =?utf-8?B?dzY1TnFYSy92ZUlZdVBOYWtzRENWdWI3aURNdnpXMVp5d3RkUVZIZXdDWnpW?=
 =?utf-8?B?UmNlRWRkdDNpY0N0R21za0NJa28zLzJwQ3ZaMDdTWHpHaG5nR09FQ0xha2FI?=
 =?utf-8?B?S3NEcVRLWFR5K05sUFNGZUJCSFBZNFM4Z1ZjUmtIcklJRW5seFBmM1RUdUhG?=
 =?utf-8?B?cm5jajQxSnc3cWh0SkVWSHhiNk1GUkNuNWZnbWxzdmlKSllRY0ROSG1VNmhL?=
 =?utf-8?B?bWcxemdEZEo5aXNOZ3dmbVFydEFSSnQ4RmgxVjV1WW8vak5DM1hnQnZybzV5?=
 =?utf-8?B?U1NmTjdyWjNOOU04Ym5PRDFXVzU4ZWJLNW1UTXgrM2ZZUFFYcEc1RWdNRmlU?=
 =?utf-8?B?ZU5JU244aXc3ZHZ6M3N3M0IwVVVqMC9POVgranVlTGZFOXlQdkVWYUkwZkUz?=
 =?utf-8?B?bDFnbXNyQXJPQkVsdGVpNFpWWXYzeFVzLzlXRWdZYW9aL29obEdiell5dXhY?=
 =?utf-8?B?NjlUUWZFTExwK1UyT3dGYndGcUNuOFpib3lWUFdtaWpaRXA4N1dVL2lXVWhj?=
 =?utf-8?B?M25YWVA5N2xlaTlxclRaQ3RvSkxxalkxNWZHMEpObmNhWDZFOWNSczNPMStW?=
 =?utf-8?B?SFZORWh2dFpYVjVpUE1IVDl2WURVS21ESEg0NkZzOEtkaTZJbHpHQ2FOSmJn?=
 =?utf-8?Q?fGq6yzoa3JcTz5E2g9PrA2soofWqWCwuxDM8A/214exN?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 19924bed-9037-443d-feb5-08dda9b9d28d
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2025 14:02:52.4260
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yosV5VrKaB/sJ1P1C6t4atHWIcdBd59iZ0f6SuIv/ue2gVqjkiemWc3iV5GDLJ2D9zoEBbyqd61lOQt/vMcj1w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8458

This macro is pretty complex, and most rules are just helper, so add a
delimiter to indicate when users only interested in using it can stop
reading.

Reviewed-by: Lyude Paul <lyude@redhat.com>
Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/regs/macros.rs | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/nova-core/regs/macros.rs b/drivers/gpu/nova-core/regs/macros.rs
index 40bf9346cd0699ede05cfddff5d39822c696c164..d7f09026390b4ccb1c969f2b29caf07fa9204a77 100644
--- a/drivers/gpu/nova-core/regs/macros.rs
+++ b/drivers/gpu/nova-core/regs/macros.rs
@@ -94,6 +94,8 @@ macro_rules! register {
         register!(@io$name @ + $offset);
     };
 
+    // All rules below are helpers.
+
     // Defines the wrapper `$name` type, as well as its relevant implementations (`Debug`, `BitOr`,
     // and conversion to regular `u32`).
     (@common $name:ident $(, $comment:literal)?) => {

-- 
2.49.0

