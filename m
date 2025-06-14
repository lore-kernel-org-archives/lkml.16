Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2071.outbound.protection.outlook.com [40.107.93.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A1FB7260E;
	Sat, 14 Jun 2025 13:38:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749908301; cv=fail; b=QWaA3dgQYLSGvWBkOzmmvdPSg3IJYemPfntDnDF15xQIHog5kFpGjZc7t0QnGU5BRQOMxpo4wgcOQHJJrZzQcVtdYRbYGC2yQ4adXLQ5BVXyQ5EP/mDE3TXpSN9ETDGlD5Qg6bvQs+7J5KS7Y6VwYurdwVYSBIeoYVMLXHEnrf8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749908301; c=relaxed/simple;
	bh=WERIeg7dewNXdmhw37tl/J/rwkI+Y3a0fJiEPUciPfY=;
	h=Content-Type:Date:Message-Id:To:Cc:Subject:From:References:
	 In-Reply-To:MIME-Version; b=TjkGqS+qOMzWh5FLkJYoyzDYv7r6GgbuEWYHef8cOFibbvUjsVFE/Dzm7btzacY7J2ptry9Q2oze//JBd0sjBdky4C8epmmAI6fOtFnaQ7X78Xkj2Lb29u30ryWogSZxMuGXjdfmFeiotfIzXCWYe/+UnKjgaA5LyGgyj+20pME=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=qG9vNbKv; arc=fail smtp.client-ip=40.107.93.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="qG9vNbKv"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PXV0zeUS61Jl+c4lqAXo/QYidLqQpb+TQT69oGVsB6+3yl+qNKMnWfX0KpCL54WNUYdrX+2q44pYinTpoznQjEunUr+kISFsqJXBuJ5U0Z2HjBatVQj+64/CmhQat0Mmfg1DxFtGpegzDG5XLs2AUyrqXORIS96IRog3xbY1Q9j+D8XAyCeOugI3I+QV1OvILb4/1X4fynUlakKrH9t4Bj2THbLqKPRpBmV8fkjw1NdqtXOETZKUR2PxJ+Wyt/PLu1YQuKLy4wjXDgYAqfaiffAxnGWhUSuRdR9LaSui6VbF1EYWKnx8gfG7SEXtZDb1kvwvxHrlZPp9raOT4WkZcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UpVVcNem6mRr214B+131lfo09EGD1ZQXVbecqGRNI28=;
 b=NIuV4yYIOCwRwJvhPum69AEEZkq1kdJn4ZyFh81cOqsZoXQabA0bdWzegUk99t7UlHhxP/i7/GNJjgMT7WAMctQ/huvlUuc2Tu3NZSWGLOxXlZEKEQHhy3Bj/mFMBL9J2KmD3GdCaaR1hO5iVBZFxbTCNSU1lFZbBTFPOPaIj6VKpDfskevdWMjNWClJaRx8k7/TgcXOAvtjynVtjoMKSCjbchO1ghO3zpiuqgn95HXlpYA/uATNt+ldMz0I6Z3K4sJtEwcl3ilIhNKPRh+UyPk/zp9caRgU7CZty0qrX4iQr+fqiXJQ95Ip8BSr5+9WhEFoQk4rX+K5rar4hJaUQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UpVVcNem6mRr214B+131lfo09EGD1ZQXVbecqGRNI28=;
 b=qG9vNbKv9SYbTo78uCKA1GOh6jCTi1ggx3lxToVQLSJCtWRhF6WJsoQ7WPSDj217FIQOaZtD/z54eihy6iGw34aFBcfFjIjOKbwrZxEduL4YnKusf1WXJgFDrHAOBDv2kaJV75i7JWVtwGg4UNOX8FMj8rOCtkBhZDQ6kUG5s1B5O1chaK6jIooZ0Y2tzuM0sAGU5v2wza70tTuws1LXZepPVTNyDc9IzmRYKqRAgZ3MCTP/I+GpoWWetMAVftXfqGTqxUBZGZL67Gm/O39IkGMbZKnC7gwFOhWzoqgz4vlO7R0yGsuDanuHypNmDoJ7aJA29oXjoCEaxrJycF0NoQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by CY8PR12MB7684.namprd12.prod.outlook.com (2603:10b6:930:87::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.25; Sat, 14 Jun
 2025 13:38:16 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%4]) with mapi id 15.20.8835.018; Sat, 14 Jun 2025
 13:38:16 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 14 Jun 2025 22:38:11 +0900
Message-Id: <DAMAPVAI3V8X.N8SAQD6KOO1Q@nvidia.com>
To: "Daniel Almeida" <daniel.almeida@collabora.com>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng"
 <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <benno.lossin@proton.me>, "Andreas Hindborg" <a.hindborg@kernel.org>,
 "Alice Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>,
 "Danilo Krummrich" <dakr@kernel.org>
Cc: <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH v6] rust: kernel: add support for bits/genmask macros
From: "Alexandre Courbot" <acourbot@nvidia.com>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250610-topic-panthor-rs-genmask-v6-1-50fa1a981bc1@collabora.com>
In-Reply-To: <20250610-topic-panthor-rs-genmask-v6-1-50fa1a981bc1@collabora.com>
X-ClientProxiedBy: TYAPR01CA0190.jpnprd01.prod.outlook.com
 (2603:1096:404:ba::34) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|CY8PR12MB7684:EE_
X-MS-Office365-Filtering-Correlation-Id: 54dacdc5-8233-4e08-485e-08ddab48b696
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|366016|1800799024|7416014|376014|921020|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?OTNMNHZpQnFoMFlwczI0cnBqZWtkNlU2ZjNMR3NDZFpCTk1GRDV3a2Rpb2NF?=
 =?utf-8?B?MDJvdUFqN0FWMENzWVVFamx2T01jUExjM0VuRU80bjcvWmduVm9KSitNQVI4?=
 =?utf-8?B?ejRQTUdWWWZhQjlMSHJuaWVscmQ5M2hmcWNiS21BQXZFQVUyeFhabmc1T2V2?=
 =?utf-8?B?MnpSV0M5NzY0LzBjSHEwNFZSbjViVTFUSHZZMExldFQzeGtPRTlZWFA2ZHgz?=
 =?utf-8?B?Q3pZeGRLV1FIU1ZneC9ZbTN0V3N6Ty81cUYrZnhxaysrcnl2Z2o2M0RtMm1Z?=
 =?utf-8?B?MGFNR0YzNjlOUEtMRDZMaWM4TEJvdkF4dGxMRm5NSU5mSXd3czlZSnlXSHdu?=
 =?utf-8?B?S1dCdk9LZWFrL29MNVVXa0pTbS9IOGlGVUZGVHVTZkp4YkQ3RDlNOFZnYXkz?=
 =?utf-8?B?bXlZblpQQjJGVHgxNmo4QmJBNWJxdVR0Z2NlZEsybU92aUhkWWFkWTRKNGw1?=
 =?utf-8?B?ZzZuVFRUZjg2UjdPQ29lWDhkaWJZY1R4cU9wOXhDaUpsS2l3K3NNOWlZNkpt?=
 =?utf-8?B?bmpVWTRpdnFTMGtzaUpOL3hvUGpOZ29rWS9NSUU4dGxPZ0ZmMDN1OGlOVWk2?=
 =?utf-8?B?Y2wvbVJxMWp4UlM3Vk5pRVRnVWtERnVmMTIzSEZmdjhKQ0Fja3haOHB1WVpR?=
 =?utf-8?B?ZnZVWGhoemJFa2lGMGIyU2M1NjZjVUVkT3JuVFFpRWh4ait0Zmk2ZGF3d0FC?=
 =?utf-8?B?RlV4ZXEzbEFEaENmOG5JaytXdTN5UUM0QStzMEkzM29tcTVRZktSNVdSQnY1?=
 =?utf-8?B?M0JtNTdxSUdOa0pSdDc4U1ByZE9mcmFJSmtrSHFRcGdYM1Nid0NIaU1LVWwx?=
 =?utf-8?B?emJoUTRlZDBpeXJNUldzeEtEMG5oRHg1MGF5b1ZFOGJvdks2NHd0cm1DbmV0?=
 =?utf-8?B?N0NZQXJ2ZlNrdmVoRlYvamtVSE5XVmlpaVl6WkI1UDhzRGJkNTA5K1FwY05n?=
 =?utf-8?B?WTI0S2VtclhEckhMYzhOUVZud2lhNHc5SEhwTlpTam51cCtMVDlZTnY3SjZU?=
 =?utf-8?B?TmxKc1p5SXJseHZBWjYyQUdPakhIQjkvbitWY3B6aTlWL0Vuby9xbExsZkUy?=
 =?utf-8?B?Yi94MEFHNGs0N2dnSnQ1U2tKRnVqa1BTYjFMbGdXODF1TTJsdEZheVBPMlcr?=
 =?utf-8?B?c1llWVhwUHczTzBUd0I4VHd4T3ZiNTRVQ1FlVXRSV1E2aHFtQVdMWVpwTEwy?=
 =?utf-8?B?Y1VYOGtON0V3b01sT0lEMzIyc1phTFZLcnNZL2VteVNSdy9DN3c0Y3dpL3Fu?=
 =?utf-8?B?K1RCUnd2czJVM25IUnI3dk0randuMkQrNXg2Qy8weUYvQ2NDNVVPN0NhRVk3?=
 =?utf-8?B?Y2VaaHR2K0J4d2RWdmlXYzNuQmVjWXZlVTdYSld6K0M4SmtVNHZ4WTNyZk9F?=
 =?utf-8?B?VVc1RVZKR1NVd0ZQSmYrUytqcTM4K0hnTERhVGZLbGduRlJUenFqME1Ha1FO?=
 =?utf-8?B?SVVsamF4Tlk4V1JwcmQrekFMRTQ2cTRONGRRM0M4YTZpSUMwN1p2S1hQL0ZX?=
 =?utf-8?B?bmFqblkySGM1amJRNE5IbXZhMkV4enoyOUhMU3V4ZWJuNzAzcFRJZG5PdzRn?=
 =?utf-8?B?VFFlQndaQnpwbU1yS3hVZnpEblZtYzhqbU5NQlRCZDhtV0VueU5JeXhpYm1M?=
 =?utf-8?B?aThta0FHbmUxTWVuUm8yMVN0elQ2TGFja0hKR2RoNllqMWpNbEIwWXlXMms1?=
 =?utf-8?B?S01QNjNabXpDY29GUnpuWmRXVU05Y0JxZVlZbjhaSTVxY3cvaWpuMzRPNEhY?=
 =?utf-8?B?QU9Uak4raWw5QmZVSzhXUjY5TkRTR3VWckdZOHA3TXFDYTVlOHJ0TFNDZFJJ?=
 =?utf-8?B?dTZJYnhnMnIwZXBlMmh4MHNtWFJOYzlCdUlkUURFQjg0QXRlcFEwRTluRXM5?=
 =?utf-8?B?c0QxNmNtZW53VjJLeTdza1AzZDR1Y1JhbE1zaEhlbHZWZVcxNlhUYXN2dUZs?=
 =?utf-8?B?YkpFQmZLcVRKZmROYkU0TWc4WXErazJReUMxNTg4Zno2WWRzT2NKTUs0ZzVy?=
 =?utf-8?B?YzFnVG5uN0NRPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(366016)(1800799024)(7416014)(376014)(921020)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VEJxbVkybnRkMnFBV2c2T05jS2wyUXFicU8vS05iaXpMemEvT3U0RjZZeUQ5?=
 =?utf-8?B?am5mQ2t3cUhMWnYxYS8xeXdhb0haU2hkUi9rMUJLTWVpaVl6SnZ0OFVFYmlt?=
 =?utf-8?B?NkFQK1pFQzU0c0FHcHdTNUx6Q3pIWHIzTThDbG5hMk1ETTRGQXBaeW83YmVa?=
 =?utf-8?B?dndoMXBxVmh4d1phYkdBaHMxN004cHRraDNmM2lYUnFWcVFVYVVJMU5DbzM1?=
 =?utf-8?B?YVJDdnJxNmY1Skt6akJDd3JoSW1hVlQ2eG5sbU95UmxzQ2xNZ0JMRElDbVBz?=
 =?utf-8?B?V09oSURiekpCSG1kRm5ISlVqTEVUZFdyM3dyekxLL3N4QzFMQitFbU5HVStS?=
 =?utf-8?B?c1ZmdHhXMm56Y0dsSjh5S3NvZGRRN0N2dllyVEhMbXQ0TkczOFRnb3BUbEE4?=
 =?utf-8?B?RXVtU0RqUmZJeTZQUHVsczdGb1dMZUh0aDVLd3RacGNHTUdxK3BDWDY1d095?=
 =?utf-8?B?SDZxcDBYWnlqT1pUQWFCQkJTejFyZXZ5MWc4T1Q1cUh0M3kwRGtVWlgydUZa?=
 =?utf-8?B?TmhlcFFKbnVGUFAwQ2UvbzRuc2ZvVXlONW1yNkp3dDYxYW9yNkpEQ045dHF0?=
 =?utf-8?B?bjhUaTBxM3lSbG9wNkNyZHdleXRWcnZ2MGU1Vk12ckhJbnovOWlJZStMTGdE?=
 =?utf-8?B?KytjTnN6czJoVnIvN292YWdRZTRVZ0Vmb2NNeGV4Rk5YZE8zOGM4WG5pcFNO?=
 =?utf-8?B?Y2lRNDZHZXZEUmVxN1pEVUw3V3lEOTJrZWIwSzdyN0dMSytiVWhkWFNrZUVV?=
 =?utf-8?B?V0lORHJlYmpRN2hkY09DcHlOYzcxLzdQd0ZFcHVUWlVuMUlZWWo4Nm9sQ3NX?=
 =?utf-8?B?ZlRiVWphc0VhZHhxUHhMWTUwdWZPSVlRTDFyRGNreWxPa1cvbmZrSmhaQ0NB?=
 =?utf-8?B?OGE2TlhGeFJBMXdWYkg3T0hjUkU2c200R0JXK0xBT0pNcWFlVHJOWHB0SFFO?=
 =?utf-8?B?ODMrSm5hNlM3Q3lsRzVUQmtKbE5uNzRwZ0pmbEFpTlJkRHhFRkRvakNIZFE3?=
 =?utf-8?B?djIrL1dHbVhQZGE1ZkR6cUZWSFFxWUk1MVRXN0RIUThsVlFrODl5eGRFUkdQ?=
 =?utf-8?B?WmVzY3pDc2tHU0doby9YUWhPekpzcktiQVhTb1VPcElKYkFLTHIvOGtvbldF?=
 =?utf-8?B?SWFQNUdhdkpvTXgvSTkzd01yQWVlMUlKU0c3a3dGVEF0Z1RyVjZ2VGNEcTBx?=
 =?utf-8?B?VU9rR0V1MjZJVGJHWHhBRDNkZTZMUm1xQU9VNTI1TEoydGFvTVB5T2dHckFC?=
 =?utf-8?B?SGx6TFZxa0tEWTZwcmNWZEdOM1BkUWNRWlNUZWg3ZWIxTHZRNUx1Z3N4aE9W?=
 =?utf-8?B?bzl5MlVSYVA4K2Y0R1c5SUdvMi9zVHh3V0RSL0I5SXhZa3M5RFVLcjlicDdC?=
 =?utf-8?B?RWdaMWt5NEJDZmZTcEZLSWVwUmRoYWpFZEJRVFlCS2pMNG0zNk42eWhLdTdG?=
 =?utf-8?B?cFk5c3lpYjF6bzJ5Qk9Md1p1c29BVDZTZEhKdU8rNmREU0R0ZVhRL2RGREZV?=
 =?utf-8?B?MXRONUlBdmtLVlBTVEpQYmdkVTFCb2gxb1ZPRzFWUy9LUCs0dkhoemEvNkRB?=
 =?utf-8?B?VWc0TU9mQ0QycU5lUUhVWnFCcTFSaXlkUEVzSGpRMy9kNHFaVjJiR1h5Z3cw?=
 =?utf-8?B?TmFTVEowK0ZLdk9ZcWdVdndWc0habHcxVS8xdktmeG93VVBFRGF3eHh2OUN1?=
 =?utf-8?B?bE9FcFBpcUxhZ1NnMW4zYTJ1cXMxNUFBdmNvSFFCd2t5UUJuVWpuWEJsWFJM?=
 =?utf-8?B?d1poNmdYTVVxSVhDOWk1VDgxWVVlZmpyU3I5Z0MwSll1aEMvVUxadG9PSmVj?=
 =?utf-8?B?bkNUbzM5SGp2MGdIclhZU25aMVVTYVpFSnhKWTU0ZXpjQXJ2ZnhPQWljam5r?=
 =?utf-8?B?WUh6NWZpY1lpQkJuYS9wNVc5NHJLTnlicWFzK2I3cVNHSnJ0ZlFrQWZ3S2la?=
 =?utf-8?B?TDZ2ejROdXR1RWxGbnVVaFFmcjZ2RUFFVE45TXN6aS9MWmJaN1N2SzBPV3Fp?=
 =?utf-8?B?b2FyWGp0WGVweVlOZzh5bWxseUp3N1p5KytWNSt5U2wycHpMQVNiN0ZVUklY?=
 =?utf-8?B?eVlBQW5CWU5jZ1llZFc1M0xYMTFPUjhZL2JaVHFyUW1oQWdzT3o1Q1g3bnlh?=
 =?utf-8?B?VlhTamE3TlJvZXEzYU1pSURHcDc3OEdVRTVOVE5Ua0Vzdm9GbUlobCtEbkVN?=
 =?utf-8?Q?BMiHTon4CfHuvvi6S271e7/LxQqnRRoIWk7QkuvriUoj?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 54dacdc5-8233-4e08-485e-08ddab48b696
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jun 2025 13:38:15.9860
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QQbE6E2kb53EteDtRWciedbC/oFFSy0bPAiYhC5bNrIjI6CHvH6UK9K4bIrPnKxDoA9hejY3gbyks5JBc0PblQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7684

Hi Daniel,

On Tue Jun 10, 2025 at 11:14 PM JST, Daniel Almeida wrote:
> In light of bindgen being unable to generate bindings for macros, and
> owing to the widespread use of these macros in drivers, manually define
> the bit and genmask C macros in Rust.
>
> The *_checked version of the functions provide runtime checking while
> the const version performs compile-time assertions on the arguments via
> the build_assert!() macro.

I think this is the right approach, I wish we could make the functions
generic but that doesn't appear to be currently possible (and it
wouldn't make their invocation shorter anyway).

I agree with Miguel's suggestion to use paste to shorten the macro
syntax, it would make it much easier to understand them (and most of the
naming could be harmonized in the macro itself instead of relying on the
invocations to use the same names).

>
> Signed-off-by: Daniel Almeida <daniel.almeida@collabora.com>
> ---
> Changes in v6:
> Thanks, Alex {
>   - Added _checked and _unbounded versions of the functions
>   - Implemented the functions through a macro
>   - Changed the genmask logic to prevent over/underflow (hopefully)
>   - Genmask now takes a range instead of "h" and "l" arguments
>   - Made all functions #[inline]
>   - +cc Alex directly
>   - Removed all panics
> }
> - Link to v5: https://lore.kernel.org/r/20250326-topic-panthor-rs-genmask=
-v5-1-bfa6140214da@collabora.com
>
> Changes in v5:
> - Added versions for u16 and u8 in order to reduce the amount of casts
>   for callers. This came up after discussing the issue with Alexandre
>   Courbot in light of his "register" abstractions.
> - Link to v4: https://lore.kernel.org/r/20250318-topic-panthor-rs-genmask=
-v4-1-35004fca6ac5@collabora.com
>
> Changes in v4:
> - Split bits into bits_u32 and bits_u64
> - Added r-b's
> - Rebased on top of rust-next
> - Link to v3: https://lore.kernel.org/r/20250121-topic-panthor-rs-genmask=
-v3-1-5c3bdf21ce05@collabora.com
>
> Changes in v3:
> - Changed from declarative macro to const fn
> - Added separate versions for u32 and u64
> - Link to v2: https://lore.kernel.org/r/20241024-topic-panthor-rs-genmask=
-v2-1-85237c1f0cea@collabora.com
>
> Changes in v2:
>
> - Added ticks around `BIT`, and `h >=3Dl` (Thanks, Benno).
> - Decided to keep the arguments as `expr`, as I see no issues with that
> - Added a proper example, with an assert_eq!() (Thanks, Benno)
> - Fixed the condition h <=3D l, which should be h >=3D l.
> - Checked that the assert for the condition above is described in the
>   docs.
> ---
>  rust/kernel/bits.rs | 168 ++++++++++++++++++++++++++++++++++++++++++++++=
++++++
>  rust/kernel/lib.rs  |   1 +
>  2 files changed, 169 insertions(+)
>
> diff --git a/rust/kernel/bits.rs b/rust/kernel/bits.rs
> new file mode 100644
> index 0000000000000000000000000000000000000000..98065c8f7c94cfc3b076e041d=
e190e942e1b4a9f
> --- /dev/null
> +++ b/rust/kernel/bits.rs
> @@ -0,0 +1,168 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +//! Bit manipulation macros.
> +//!
> +//! C header: [`include/linux/bits.h`](srctree/include/linux/bits.h)
> +
> +use crate::build_assert;
> +use core::ops::Range;
> +
> +macro_rules! impl_bit_fn {
> +    (
> +        $checked_name:ident, $unbounded_name:ident, $const_name:ident, $=
ty:ty
> +    ) =3D> {
> +        /// Computes `1 << n` if `n` is in bounds, i.e.: if `n` is small=
er than
> +        /// the maximum number of bits supported by the type.
> +        ///
> +        /// Returns [`None`] otherwise.
> +        #[inline]
> +        pub fn $checked_name(n: u32) -> Option<$ty> {
> +            (1 as $ty) .checked_shl(n)
> +        }
> +
> +        /// Computes `1 << n` if `n` is in bounds, i.e.: if `n` is small=
er than
> +        /// the maximum number of bits supported by the type.
> +        ///
> +        /// Returns `0` otherwise.
> +        ///
> +        /// This is a convenience, as [`Option::unwrap_or`] cannot be us=
ed in
> +        /// const-context.
> +        #[inline]
> +        pub fn $unbounded_name(n: u32) -> $ty {
> +            match $checked_name(n) {
> +                Some(v) =3D> v,
> +                None =3D> 0,
> +            }

This could more succintly be `$checked_name(n).unwrap_or(0)` (same
remark for `$genmask_unbounded` below).

> +        }
> +
> +        /// Computes `1 << n` by performing a compile-time assertion tha=
t `n` is
> +        /// in bounds.
> +        ///
> +        /// This version is the default and should be used if `n` is kno=
wn at
> +        /// compile time.
> +        #[inline]
> +        pub const fn $const_name(n: u32) -> $ty {
> +            build_assert!(n < <$ty>::BITS);
> +            1 as $ty << n
> +        }
> +    };
> +}
> +
> +impl_bit_fn!(checked_bit_u64, unbounded_bit_u64, bit_u64, u64);
> +impl_bit_fn!(checked_bit_u32, unbounded_bit_u32, bit_u32, u32);
> +impl_bit_fn!(checked_bit_u16, unbounded_bit_u16, bit_u16, u16);
> +impl_bit_fn!(checked_bit_u8, unbounded_bit_u8, bit_u8, u8);
> +
> +macro_rules! impl_genmask_fn {
> +    (
> +        $ty:ty, $checked_bit:ident, $bit:ident, $genmask:ident, $genmask=
_checked:ident, $genmask_unbounded:ident,
> +        $(#[$genmask_ex:meta])*
> +    ) =3D> {
> +        /// Creates a compile-time contiguous bitmask for the given rang=
e by
> +        /// validating the range at runtime.
> +        ///
> +        /// Returns [`None`] if the range is invalid, i.e.: if the start=
 is
> +        /// greater than or equal to the end.
> +        #[inline]
> +        pub fn $genmask_checked(range: Range<u32>) -> Option<$ty> {
> +            if range.start >=3D range.end || range.end > <$ty>::BITS {
> +                return None;
> +            }

From this check I assumed that you interpret `range` as non-inclusive,
since `range.end =3D=3D 32` is valid on u32...

> +            let high =3D $checked_bit(range.end)?;

... however IIUC `checked_bit` will return `None` here in such a case.
Should the argument be `range.end - 1`?

Your examples do seem to interpret the range as inclusive though, so
probably the check should be `|| range.end >=3D <$ty>::BITS`. But that
triggers the question, is it ok to use `Range` that way, when its
documentation specifically states that it is bounded exclusively above?
We could use `RangeInclusive` to match the semantics, which would
require us to write the ranges as `0..=3D7`. At least it is clear that the
upper bound is inclusive.

... or we make the methods generic against `RangeBounds` and allow both
`Range` and `RangeInclusive` to be used. But I'm concerned that callers
might use `0..1` thinking it is inclusive while it is not.

Thoughts?

> +            let low =3D $checked_bit(range.start)?;
> +            Some((high | (high - 1)) & !(low - 1))
> +        }
> +
> +        /// Creates a compile-time contiguous bitmask for the given rang=
e by
> +        /// validating the range at runtime.
> +        ///
> +        /// Returns `0` if the range is invalid, i.e.: if the start is g=
reater
> +        /// than or equal to the end.
> +        #[inline]
> +        pub fn $genmask_unbounded(range: Range<u32>) -> $ty {
> +            match $genmask_checked(range) {
> +                Some(v) =3D> v,
> +                None =3D> 0,
> +            }

This could more succintly be `$genmask_checked(range).unwrap_or(0)`.

> +        }
> +
> +        /// Creates a compile-time contiguous bitmask for the given rang=
e by
> +        /// performing a compile-time assertion that the range is valid.
> +        ///
> +        /// This version is the default and should be used if the range =
is known
> +        /// at compile time.
> +        $(#[$genmask_ex])*
> +        #[inline]
> +        pub const fn $genmask(range: Range<u32>) -> $ty {
> +            build_assert!(range.start < range.end);
> +            build_assert!(range.end <=3D <$ty>::BITS);

I guess this check also needs to be fixed.

