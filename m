Received: from NAM02-BN1-obe.outbound.protection.outlook.com (mail-bn1nam02on2051.outbound.protection.outlook.com [40.107.212.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B3731DE3CA;
	Wed, 25 Jun 2025 18:13:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.212.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750875182; cv=fail; b=PsfIjgKdYsh896eJskWNnapAA1SVQ/NMVfGyicddy3xDlDwi6cyjaZuaGPFzRlram90+I3MNgIyNJ/UBK6aEXVkqAbesa8SfF0zzrEo4jEwyGXi5iDVy1m/R8P7vkN2aCA7yes4o+27QM+xD52DCT6KQMj+GddiW2uzyXd6NuIw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750875182; c=relaxed/simple;
	bh=EA917nPCUj/P/WXaxqcCgT8wICwVHZO/DCTt/+JQTUQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=O8Hl5f4f3NqAFcO3iJAlWKuFZ25W73HDLTosmKhYBKNADhtXnEQ9wJON7e9Z9CnmPIYmyhks3laukk9l4xIovKeYqy/FxKxxmY11+CiPFUw3HVKpw8x8RzsNeOcP12WWjf3zBoVTErru/W857A8nUPoLMYiE+BBVutCdMc7aIdw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=pXBiK4iJ; arc=fail smtp.client-ip=40.107.212.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="pXBiK4iJ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A/juVeGOa5DS2+sL9ebIe/ikcup74eZEjoowsGWT8xDZ4MMCfSYdFQNJ2GRdVFDNKPwmEFcItHuy4FjtEDn2dlE8Q7eKFjn8UuJg1+xVqNFQHilTkhWKcAXLlS9bEFdEYhBnqQbPc6gwXZjhVjh6Hb/lvfIXMwG0nwaJsE1+QnViEui8sDAYWtPMfia6W1n4Gh8P/aQzM2mtWVzc9a9IsafeYPE4Qod74eW2GiruYMIvzDDw7YqsISuI6tco8vXqxIHf49ntsFIm3i/dz3dTR5D6TpWfgalBjxM4OWQ/krNFZyUZT3d20WW1dyGrokURAsvgiJsqIbxTwT2WhQCoYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EA917nPCUj/P/WXaxqcCgT8wICwVHZO/DCTt/+JQTUQ=;
 b=bsYB7xdfWdeL7uDBZ0GHzifeZR3djUJ9uDk9Webaag6S1plNOZ15QHVFTL49IB9P2a3NgkC0sY48zaHEYt9nUS8CYkgNG54I4a7wt11pSegrnw4j5kTbwlBcJXSzwZZwDrvdW6JFXh2ndBwexn4IpS+ioaSlAii2lcctVXUk/zI4m/b7XhPYY7k+xllxgBjKzPrLjHAidkfP+ExEnK3H3b5XWAzZTS8lWIpFTKn5YBME2jWYA87cByChZSZL0vKQxrGsAl9bQhfpF4x3leFjYDjT0dM7W+bK6Mw9xvz8CJQ009LB2oKLO3onfwBvZ4qymxgL0pR3+1mGR/TaAt9v8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EA917nPCUj/P/WXaxqcCgT8wICwVHZO/DCTt/+JQTUQ=;
 b=pXBiK4iJ7qO8YYlHza+HTe/W7YST+2xQ5IkvwVkRkYZyhPX6lkCmZuQ3WLytGZ2iP9VVmdmOdZYz9gBST3kzLFM9ebuqLILco8GBg57Nyq25Z7Kw1JcldCEOjnP0+cWHamwggo8pFKFl4sQGhmZ39SjBsk0eNUtBJ3myjFpLnEFkUyO0ShJ+DZ0OeCAuqoe0q7oiV34kKYT/zYTiXeGHj2hAgjTD9srvI35K7tqwK3t5c6AX6w71AVR7unoKs5BkN6tEVSq6B9FLKASMEDifo3GYGqFgHeoTavDdAGwuGAhZ9HJA7LYcA6jSxWDCR5KVQAfLeJgdx7iWGZIqZg/myQ==
Received: from SN7PR12MB6670.namprd12.prod.outlook.com (2603:10b6:806:26e::12)
 by DM3PR12MB9414.namprd12.prod.outlook.com (2603:10b6:0:47::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.17; Wed, 25 Jun
 2025 18:12:56 +0000
Received: from SN7PR12MB6670.namprd12.prod.outlook.com
 ([fe80::229b:16e5:ec65:4c1b]) by SN7PR12MB6670.namprd12.prod.outlook.com
 ([fe80::229b:16e5:ec65:4c1b%3]) with mapi id 15.20.8857.026; Wed, 25 Jun 2025
 18:12:56 +0000
From: Vadim Pasternak <vadimp@nvidia.com>
To: Alok Tiwari <alok.a.tiwari@oracle.com>, "hansg@kernel.org"
	<hansg@kernel.org>, "ilpo.jarvinen@linux.intel.com"
	<ilpo.jarvinen@linux.intel.com>, David Thompson <davthompson@nvidia.com>,
	Michael Shych <michaelsh@nvidia.com>, "platform-driver-x86@vger.kernel.org"
	<platform-driver-x86@vger.kernel.org>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH 2/2] platform/mellanox: nvsw-sn2201: Fix bus number in
 adapter error message
Thread-Topic: [PATCH 2/2] platform/mellanox: nvsw-sn2201: Fix bus number in
 adapter error message
Thread-Index: AQHb40d8s1weDbImTEyl/8SFXfypUbQUMsnQ
Date: Wed, 25 Jun 2025 18:12:56 +0000
Message-ID:
 <SN7PR12MB6670DD61EA0A6388952E765DAF7BA@SN7PR12MB6670.namprd12.prod.outlook.com>
References: <20250622072921.4111552-1-alok.a.tiwari@oracle.com>
 <20250622072921.4111552-2-alok.a.tiwari@oracle.com>
In-Reply-To: <20250622072921.4111552-2-alok.a.tiwari@oracle.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN7PR12MB6670:EE_|DM3PR12MB9414:EE_
x-ms-office365-filtering-correlation-id: ffc87ac0-92a0-4969-99a9-08ddb413e8da
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|366016|7053199007|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?bTBmcU9jVktxN1dOVC9zZ2V6My9IN1VLaU5IMDhXbUl0NFlybmdnWm14TEta?=
 =?utf-8?B?V3RKTWt4Y3RGVWtOeWJDNEc3QkM0ZWZIMDJkZHFTcDEveW5qTU5EMG16SmlN?=
 =?utf-8?B?Rk5iYXFCUUNnTG9JaGZvcGpXMXlMTFFScUl0UitwdHdwRUFveW14MGJlS242?=
 =?utf-8?B?RkticWNnSUZSQmN1VjVBTTBLcEJid1NtYjhibFhRcVRNRWVoaHBqWmRuN2dD?=
 =?utf-8?B?RktsSlI4SDNrWGpleDIvY2xycHo4M2syRGZaaUtsbzFJVWhRU0M3ZnpiRHdx?=
 =?utf-8?B?Zm9oaHJURnhDelJIRzgralhaSXFRY3J2Tlpvb08zMGs1b3ZpV3RVY2lMMm1P?=
 =?utf-8?B?RlNVRWlVamtzVHNveG9aM1RpZDRualZHanc0aDZkSGF6d25TS0JwcTI4UnI3?=
 =?utf-8?B?NGhpL2ZCY3NidjVRTURoeEhQM05Ic1VRdUsrcHJ6YW53TFNzNXJlakFXdU9T?=
 =?utf-8?B?UUtRQ3RwL3AzWW1XUGxjbWV4ZFI0a2FnWTY0REdFTTFndTNtN1BEdld3NE5z?=
 =?utf-8?B?WjFTenJVblVmdHlxNnVWaTNPc05vSkcwYmE4cGdiSzZHVWRsK3ZjZkFOZFZH?=
 =?utf-8?B?MUxoM204Z2liY2plNzliL2RQc0syWGtabGhudmpWZytNMWJweU5mT0llWmpF?=
 =?utf-8?B?a0N6MXhiUHZ0SmZKNENIZWdLeXcxNVpOYXloQWlrWktBeDR6WGtNTnA2cnpl?=
 =?utf-8?B?RmJmYzFxaFVaUkFjVEt0eDM5MjNGV2MwNjFWOEJOQ3U5aGZTdTg3OGdiTUdk?=
 =?utf-8?B?ZWVFUlRJN0hzL3RjdHBKMXArREdQZGFvOW9QU2lRL1BvdnNmejF2WjR5TTFa?=
 =?utf-8?B?bVd3SXdsVFRqZVlBcXN5YytweDU5SC9YR3F2VithaHJIaDladGt2ajRHcTN4?=
 =?utf-8?B?VHZwSlBsVFNXdHNJY0hLcVVsZ0s5RXRVZnFIQUowRWJEclB3UUZFSXFtSXdD?=
 =?utf-8?B?RjRNV0tzZEkvUDlNbloyMG1HYW1tT2l6V1puM3pRc0lzRlM0aWwxQkw0bkJH?=
 =?utf-8?B?NWtKalNTM1dNK3VtTDBiVTk2ZE16T2tqeUdtVlI5NEkzZkVOQkdGTHJ1Z2FJ?=
 =?utf-8?B?aDB3SVlMNmczSWljajJESkphS1BTY0g0c1dCTUZoVm83Unh3eVJsdGZRMDR1?=
 =?utf-8?B?WFp5Qk54UVBtTVd6SWdaOEFiTXp0c0lrYlg5MVVod0NTRFZ4N3pHaWs5Ykww?=
 =?utf-8?B?RHNvbmNubnkzZzFwTXl3M0FoNXI3Rmh3OWNiM2syc2NFQVdOQjNKVlJtOEVv?=
 =?utf-8?B?Y1VuWmJDcCtab2MxaElleEFpWnZnZUs1aklJV2c5dS8xR1d3VllMSWRGbHZJ?=
 =?utf-8?B?N0tIeUpTakJLcldjMlJmRFlwZ0ZNK093RG1uYzJsZ2Z1YUNCZllHbzFTa3Qw?=
 =?utf-8?B?dGZuRzl4aFoyUnR1clRIbXg5OWlsOGtjaExOMi94N3p5RExoQnNPaWNrVmlq?=
 =?utf-8?B?TThSanVabkx5TVpJeEhFeDg5TzhSVzFjQXJVZlNYbTRCQWhLUk1hb1hrZUpv?=
 =?utf-8?B?czJjbjJUbTd5eE5MR0VFdlhCYzlCTnFBNDB3L0lLUzZWTzFqenZMLy9weEpu?=
 =?utf-8?B?a0E3WWFBYWVkYVphc1FUNExXMHNlN3hyOXByamdTeG12ZUpZbGtXRC8yMXpV?=
 =?utf-8?B?dWlVeG01N2VJalA2bWdWQkNtdUJia3dHdHJoYjNZOEMzRElzWFRYZWx6RmhO?=
 =?utf-8?B?Uy9aS1lVeVUrMVZPdnF6b1JqSlJPTGdWcW1SSkxMT3Z1ZTZURmVwc2Y3T014?=
 =?utf-8?B?MGdrclo0L3E1MTIrOGNmNE9Kcm1GNzJMalR4VjRMRkJLODlGZGhQQVk2eFdY?=
 =?utf-8?B?aitGT1JQajlYVEkvaHd1VEZRdzYzNXJiUDlIakxpdGRlSlpJU2VsMjN3NmZ5?=
 =?utf-8?B?Z3UySmQwZ1RqNTJHVXRrQWIyS1o0Q3ViL1pSSk5HUmtzK00wL1c0alpkK2Vk?=
 =?utf-8?B?RHJlOVdaSk5PUUNMcTdoZXJsTUFXRmFTb3dRSFFTMFBvZ2YvL0tGdVpCOVFi?=
 =?utf-8?B?QU12TDY4Ym1nPT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR12MB6670.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7053199007)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?RzA5S3pXY0NHem4wRU5BeTY0YXBGTGJVSmF3TzJXK3g2RzBBcHNjS1JKSFFa?=
 =?utf-8?B?bUVTWWJNZlY1aVdPckMxVXhya0JHSVFqd3VmRytRa1dleVBUanM5LzVaQ0h1?=
 =?utf-8?B?MTZNczJHcjAvc1BETTlqVkNuVkJCVGEzeElpbDJnejlVWXg1RnZTcTRJRDkx?=
 =?utf-8?B?VHVNK3ZDRjg2c3pqUjlxc0F3SDVQRm9kVW9UVUFIWWl2NVlkSGZCYVRoeU5t?=
 =?utf-8?B?TEZobTFxTFZld3huYlhWSk5uWTg4OVBHTEppbVg3MTBPTlhXUUIxTC9wRE80?=
 =?utf-8?B?OHdhNk1aYlQ2b3YwTkdxak9IZlRRcjJYQWxUcVNYSGgyaUE3V1BNTzB1YmFG?=
 =?utf-8?B?UXZnbDhxSlpIN1FPSnZpRWtwZGo4NTUyVG5nM21WS0c5clIvQWExNDhwRk1Y?=
 =?utf-8?B?QkZ0cHFTSWZ5eGJ2M1JuTmk1R2YzcEVLNklZUk9NQ0F0WUdNeGxlT0w3V0pQ?=
 =?utf-8?B?Vm5td0pxbmNKSnFWSUxITlB6OVlud21VQjFFNUdUNHRoUTFQMm4vZE5EYUdZ?=
 =?utf-8?B?U2kwcjB0bkhYc3NiQ0RNKzFGelFGYm14QlQwbEZZVk1CelVJaEN4d0hTc25B?=
 =?utf-8?B?Tjl3U3dWVGtkY3pnVGV1SlVDNXFRZEVwWmM3U0pWSEdyRmdjQWE0NGswU1Jl?=
 =?utf-8?B?R0p2SldubWxkcWhZVDl3RytFcklvT01NMGowL0F5aDBQZWkxVzBMUUo2aDhr?=
 =?utf-8?B?cmVvWVFHRkpIY2dIcS9yNUI1UHFEM1NoOGNTZUkwTERNNkEyQUVuR1haMDhE?=
 =?utf-8?B?SURGNGIvbEJYWCtNRWYzYXVEa2JIcVdpZlZVYjJPeHk4NVRyZ2FoMUZ6dlh6?=
 =?utf-8?B?dTgyV3RyUFJSclFxcTdKV0hrWnI5b0c3TkF0bHR3STc4VVNQUU91TnV5ZVZv?=
 =?utf-8?B?U2s3N3AweWRDcUgrL1Q3TzZ5UGR6NnRmOG9QK2hmak1GR1Qxc1hObDhiV2pz?=
 =?utf-8?B?UDhreTg3RVZ0UmlHL2IwSTJ3VUFKV2laK2NxQUpxd3lVWGZTWHJ3c0VWMW5F?=
 =?utf-8?B?OFBYTDZUb212Sjl0bGx6ckx1TjA0U0lxTU5MSVFqK0doRDFhMFd5U2g2ZTlJ?=
 =?utf-8?B?VXB5UlprYmF0TGErWmRhdE5qdW0xVWpBNGVEWHF6bW9KWTFEL1M2Y3JjWFpB?=
 =?utf-8?B?QjJIalM0eGRhOUhlN2JualE0YlBNSXZMK1c0SFpPcCt2WndZMUI4cURTb2V0?=
 =?utf-8?B?ODYzbTdETzV3UERKVVIyQzdKd1FXc0lsOXd4NjA2eUd5d21XNlBsRGU5RmpF?=
 =?utf-8?B?TWVwYzZVdWZ2VDdvVHl2ZzBnam8raDYzUzFCeHNMb3JoVzdORjAzUzNxWEI4?=
 =?utf-8?B?UXFzcTFrcXpGb2hVWGdrTnBaY0pNK20rYmRzN3hnRjc2M1pRanIwYVY3bUJU?=
 =?utf-8?B?b1FPalkvMkRCQkNQWlpScGlxS0tyY0NZTEdXeHRTMW4yOEFBdnpiWE1CSGRD?=
 =?utf-8?B?YTdYYzc0TDZyL2RsUy9odCtndGsyS1lVRkk2SWFyREJUT1k2Vyt2ZFBsbmtH?=
 =?utf-8?B?d0FwaVIvOTV0TXRFNGNnMStYbWZEVG5KK09oWHVwRXgvdHhUdEdhOGtwUnJ5?=
 =?utf-8?B?LzdyeExlTm1pSnJPendEc1ZFMHV4RWQraXViUGRGR3VYRjJVL2ovb2VRckp6?=
 =?utf-8?B?UjJwVkRad2NiZHhJOGUwNXdMMm12UE1DY1VhU2RsZjZqVXNydnV6a255TFdS?=
 =?utf-8?B?QlJRVU56QVIxRDNQUkJwVHJEcWZ5TXh5d292SEZqNWJjMmJWMlFueTRYVXJx?=
 =?utf-8?B?cTVoNzJxOTZRVStPS05QRWUvRXl0S3d6YW9Zc1FPL2FrM2xEMVdZcElhQjRr?=
 =?utf-8?B?RHF4bWVxbmg1SWhYbzluOUo2SWxHZFNvM2NoSmJSSHdpQklIOUREdmpCYUU3?=
 =?utf-8?B?WTAzcnE4TTQwemhPdjBYMU5yRy9DQUZPY2ZiQU16NVpOL1J4b3pCamY0QU9H?=
 =?utf-8?B?STRPdDVtTGRHeGFXTjdDN1prTS94SldmejJ3enRqVEZ1MGNXcnZhekt6SVdM?=
 =?utf-8?B?akdudFdOT1hGb1BoOFlEb0todDhPSTI3U3U2NTJ5NEJLSEV0K1FoYktDR0VU?=
 =?utf-8?B?elIwb2VGdVlLdTVwaFZLa0tnem9QbDdSVUxDLzFRWk5qRGN5Vkw2NTB6TC90?=
 =?utf-8?Q?gRyY=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB6670.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ffc87ac0-92a0-4969-99a9-08ddb413e8da
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jun 2025 18:12:56.0310
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BKu6ZBmVW82bE39GGjZFw70stNbXHt0CDGBbQxWduTs0vCaCRMJ08nFQcCDMm3p55kHNWrphrKzO4I3yWueKTw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR12MB9414

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQWxvayBUaXdhcmkgPGFs
b2suYS50aXdhcmlAb3JhY2xlLmNvbT4NCj4gU2VudDogU3VuZGF5LCAyMiBKdW5lIDIwMjUgMTA6
MjkNCj4gVG86IGhhbnNnQGtlcm5lbC5vcmc7IGlscG8uamFydmluZW5AbGludXguaW50ZWwuY29t
OyBEYXZpZCBUaG9tcHNvbg0KPiA8ZGF2dGhvbXBzb25AbnZpZGlhLmNvbT47IE1pY2hhZWwgU2h5
Y2ggPG1pY2hhZWxzaEBudmlkaWEuY29tPjsNCj4gVmFkaW0gUGFzdGVybmFrIDx2YWRpbXBAbnZp
ZGlhLmNvbT47IHBsYXRmb3JtLWRyaXZlci14ODZAdmdlci5rZXJuZWwub3JnDQo+IENjOiBhbG9r
LmEudGl3YXJpQG9yYWNsZS5jb207IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmcNCj4gU3Vi
amVjdDogW1BBVENIIDIvMl0gcGxhdGZvcm0vbWVsbGFub3g6IG52c3ctc24yMjAxOiBGaXggYnVz
IG51bWJlciBpbg0KPiBhZGFwdGVyIGVycm9yIG1lc3NhZ2UNCj4gDQo+IGNoYW5nZSBlcnJvciBs
b2cgdG8gdXNlIGNvcnJlY3QgYnVzIG51bWJlciBmcm9tIG1haW5fbXV4X2RldnMgaW5zdGVhZCBv
Zg0KPiBjcGxkX2RldnMuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBBbG9rIFRpd2FyaSA8YWxvay5h
LnRpd2FyaUBvcmFjbGUuY29tPg0KDQpSZXZpZXdlZC1ieTogVmFkaW0gUGFzdGVybmFrIDx2YWRp
bXBAbnZpZGlhLmNvbT4NCg0KPiAtLS0NCj4gIGRyaXZlcnMvcGxhdGZvcm0vbWVsbGFub3gvbnZz
dy1zbjIyMDEuYyB8IDIgKy0NCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBk
ZWxldGlvbigtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvcGxhdGZvcm0vbWVsbGFub3gv
bnZzdy1zbjIyMDEuYw0KPiBiL2RyaXZlcnMvcGxhdGZvcm0vbWVsbGFub3gvbnZzdy1zbjIyMDEu
Yw0KPiBpbmRleCBkYjMxYzhiZjIyNTUzLi41MTUwNDExM2MxN2VhIDEwMDY0NA0KPiAtLS0gYS9k
cml2ZXJzL3BsYXRmb3JtL21lbGxhbm94L252c3ctc24yMjAxLmMNCj4gKysrIGIvZHJpdmVycy9w
bGF0Zm9ybS9tZWxsYW5veC9udnN3LXNuMjIwMS5jDQo+IEBAIC0xMTgxLDcgKzExODEsNyBAQCBz
dGF0aWMgaW50DQo+IG52c3dfc24yMjAxX2kyY19jb21wbGV0aW9uX25vdGlmeSh2b2lkICpoYW5k
bGUsIGludCBpZCkNCj4gIAlpZiAoIW52c3dfc24yMjAxLT5tYWluX211eF9kZXZzLT5hZGFwdGVy
KSB7DQo+ICAJCWVyciA9IC1FTk9ERVY7DQo+ICAJCWRldl9lcnIobnZzd19zbjIyMDEtPmRldiwg
IkZhaWxlZCB0byBnZXQgYWRhcHRlciBmb3IgYnVzDQo+ICVkXG4iLA0KPiAtCQkJbnZzd19zbjIy
MDEtPmNwbGRfZGV2cy0+bnIpOw0KPiArCQkJbnZzd19zbjIyMDEtPm1haW5fbXV4X2RldnMtPm5y
KTsNCj4gIAkJZ290byBpMmNfZ2V0X2FkYXB0ZXJfbWFpbl9mYWlsOw0KPiAgCX0NCj4gDQo+IC0t
DQo+IDIuNDYuMA0KDQo=
