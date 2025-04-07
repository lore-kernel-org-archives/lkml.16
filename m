Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2051.outbound.protection.outlook.com [40.107.22.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81957237194;
	Mon,  7 Apr 2025 10:57:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744023444; cv=fail; b=orQocPrxx4af77Q6xo7N/NMB2VFVtEIi2pnPeen643Xy7PjRFCpdG0KuAESrlwTEvonXpOA04LB0H//KDvGsKlEjPpBpu60KcZlrdWEfk00qehmXGAXZYYGxju9Alxz4SiaCV+Tz9sNWKuTr3YPSQTS7sRk39492Br07+V1dYoU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744023444; c=relaxed/simple;
	bh=mnP4mpQycT1bhfeVbwPoQDSMKIGpg45PDImCKKTJAjA=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=HSNbfnkCj2RbtO6KL7yrzVed0VvZK7ESCtq7cYLLoQC5sd2Itd0TDDAJ0xicDiCU1sq7qGIKgDP8AaQ8k8pc51Cx1Wvps9XbroYp4Zl60H+xi3uANQTilNnrlUwaUJYJt9v7Ol09gIJsxGhaQ4kIyP664PEI10j72hAafH/xLRM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=oFzMMKsP; arc=fail smtp.client-ip=40.107.22.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="oFzMMKsP"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=njd3nxb2ToLlXf6SSYClzt+cubDeGg3sqYYWJ0W6CW9YRZkYimKm+rOjhc53E7HudDaGnq9qN5hX41SwmhbGNZe/HWMsIz3ZnxdkNhuQlM0Hf/aFZzAwCuKfLNtHnf+j40BWOVGWI4T4Z2+qHTwFPII8+/O3S1En/EjIoNu4nR88jaYLVlHoWzI9ZSd7oe7BkIHBFnhunPPqSFmwhAzpYXCovFyE2FD1n4jxxb0dh+ENL8hYFNkY4cp1KI4mO9PmkEdde2Y3PvwWMZVtXBq75zajnjEMmsuGSApr+u5eqiAq7M3pDXBVsMzhqoWNYUk9WAlExEcqHDqiupD+gMatSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U5o1zrsrM+PMf1J2Oyws0KM73c/w+/ftFlIOPA7dKj4=;
 b=wH7EQ8Yi+XPAerEoPaQ46ILCa+KjSzcvdKAtNi7ZIYLFzs1yP/MVh5L3A5J1zU2XNyg/2goazO3J9WVLWLoB21T6KwxIX+7zH/YM1QsGcqfUQvyaFNcqwVrNY9u8CTGiOcr+RYiwcmRbXyMMlU/A1dbHEnQVA7xF2YP9ujdXAJkqC9+eYImpJuoupxWoAJ+5kBUpaWt7UXGAuAqS8WxFo08qaf9g1i1FXhLF5geaytL2mZATnjUIE1D174X75UBRQ+Z5emjKkUX5JdQsoCsDUSUhlNIO1x/pzFbP+v5dxCGd3WhLIx55hAqu3HPPEpTnAFjbyGrTGNo0pPKtJIT0pg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U5o1zrsrM+PMf1J2Oyws0KM73c/w+/ftFlIOPA7dKj4=;
 b=oFzMMKsPAHbx2AbjC2P35CghjdJ1ysflXiITrIemyIXNE387lhw7P7OuAXrYs8kleGBNZiRhHLo7HkbGzogX2+54v07wQvAJPBsOZEejZjJ4Z/lIGb+bxJCSa003RrF3Kvv8orjF+x5Hin9QgBXqOoV/iADuQWArtbxW2URNiNhl2kEE0M7WIzLBlQa7WN95LtaihfOXQWdqY604pVpMhHtXHoEEfD7yua1J6Pl2z2nxxqy1LLyR+32oMFakjVYhiA8ko1YJB/ganeP/eWuyKXotzvKBbtrO4K3moWWM1StyutgV00+J+gcCCn+UQca6qgUdHZKNBOlr//oP8KZSdQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM9PR04MB8604.eurprd04.prod.outlook.com (2603:10a6:20b:43b::21)
 by DB9PR04MB8493.eurprd04.prod.outlook.com (2603:10a6:10:2c5::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8583.43; Mon, 7 Apr
 2025 10:57:17 +0000
Received: from AM9PR04MB8604.eurprd04.prod.outlook.com
 ([fe80::e751:223e:aa3d:5827]) by AM9PR04MB8604.eurprd04.prod.outlook.com
 ([fe80::e751:223e:aa3d:5827%6]) with mapi id 15.20.8583.045; Mon, 7 Apr 2025
 10:57:17 +0000
From: Pankaj Gupta <pankaj.gupta@nxp.com>
Subject: [PATCH v15 0/7] firmware: imx: driver for NXP secure-enclave
Date: Mon, 07 Apr 2025 21:50:16 +0530
Message-Id: <20250407-imx-se-if-v15-0-e3382cecda01@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAED782cC/13SO27DMAwG4KsEnuuCpEQ9OvUeRQdZj8ZDk8Auj
 BRB7l46KGLJowh/JCX/t27O05jn7u1w66a8jPN4PskB+eXQxWM4feV+TFLoCEgDg+3H72s/S7X
 0QQMwg1cpmk6+v0y5jNdHs49POR/H+ec8/T56L7hW/7sgVF0W7KEnGzkYqz2a9H66Xl7j+btbe
 yxUOVK1I3GCSkLnAyvfOrU5g/XWixIXbCKXcuCoQ+v05ixw7fQ6jxIAZHQBd3ty5ZBqx+KMCdZ
 7UMFZap2pHDXOiMuZjJjB0X5PuzkPunb28S4lURisJqNb554OAZv7OXEeWSsnQ21SrfO1M7Xz4
 kpyJUAEncPQOoQNYruoxAD6oYABp2L0tuzkFhkkaiOzZgaizYaTDdnuZz5Dw4A7uaYmcpZxrNl
 C3Em1SSVTarnmxsdo5KrJJNxLXUlqAodrcojQa+28olz9kfv9/gfuMjnngwMAAA==
To: Jonathan Corbet <corbet@lwn.net>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Pankaj Gupta <pankaj.gupta@nxp.com>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744042844; l=27778;
 i=pankaj.gupta@nxp.com; s=20240523; h=from:subject:message-id;
 bh=mnP4mpQycT1bhfeVbwPoQDSMKIGpg45PDImCKKTJAjA=;
 b=8ZMp2U0DtrGLisSLy648pT33btJet5ApIyzj8tljirSafMDGjmLAxOLiWtmPboMxvBRdFzr47
 fT6uGrMtk0YDFov26pqRw1cQWEDSP3HH7sdRwl2MhwLEDz3l0mkmbG0
X-Developer-Key: i=pankaj.gupta@nxp.com; a=ed25519;
 pk=OA0pBQoupy5lV0XfKzD8B0OOBVB6tpAoIf+0x1bYGRg=
X-ClientProxiedBy: SI2PR01CA0036.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::22) To AM9PR04MB8604.eurprd04.prod.outlook.com
 (2603:10a6:20b:43b::21)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8604:EE_|DB9PR04MB8493:EE_
X-MS-Office365-Filtering-Correlation-Id: c184fdd4-ce6b-4c2b-02db-08dd75c2f64a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|366016|7416014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?U2hOVWdVanNHMGZYVUpsZTRyR1Nrd3dzeUVGVUtDSXJNTCswSFdQdjQ0Q3p3?=
 =?utf-8?B?a25McSs5bHMyd3FHaklPbTdwb0wrbHZsQlc3aGRtK3o5MlAvRmcxNEltdVhR?=
 =?utf-8?B?OWo5ZWtmblg1Ymh0OG9lVVVNRVNEQjc0K0o4Q2FQbU9WMGFIMDFMSG1xT214?=
 =?utf-8?B?VFN0ckFIZWY4dlFMUFlPTnRKU3hyYjhZdy9EVkhCeUJtMUNndGFtN2JHTFBl?=
 =?utf-8?B?VDJyU3pDSi9vL05xdkdGemIzTFNXMmgvc1pmVmRFVDFuL09uOVZBQWIvY2U2?=
 =?utf-8?B?N2IyYWxTTk4rektTSEkwTzFqcTdEUlh3c1VCQmZkMGY2MWpoaGRmbGk3QlVk?=
 =?utf-8?B?ZUdJaVdaVExTdUtTb01RZ0ZubjdYQTdmcEIwWGdveVVhWUZDWHpwQVM2MHE5?=
 =?utf-8?B?bHZSVnBHb3gyZjBmcUh1L0czd0ZSN0VLQmUySXNxZVdwcUIzVjczL1BxL2VC?=
 =?utf-8?B?c1B2QnJzVkJwU25zaHg3eGVUYjZBSjBSd1k5L09ORzVjckRUWVhtYVlEMTFX?=
 =?utf-8?B?amZ0UktkNVhzdlF5ZFJBUnJ5RlNTQWduK0hJaHhOK2l6UmEyUm1VZExGcndK?=
 =?utf-8?B?RkNIeUt1N3hNM1Z2U1owY2R5Rjhsc3B3UTlKcmhYTWhWNkdML3ZzMmQ0MStU?=
 =?utf-8?B?NGNma3lXdFF3c0FhK2FCOXY2dlR6WTFMSHhEc0RqbDZUY0JkbHU0THZOZkN5?=
 =?utf-8?B?eUJ1a2gxQ2g2VjBJU2ROYnVhVG9La2VLRWEzTSt1UXo3UFNEVDEyVGRseFdp?=
 =?utf-8?B?bVl4ODNuS2NEbkw4cnFSM25GRzZnSHlPWjJ6UlFvRXZhcGd5NWhoWUNHSFpJ?=
 =?utf-8?B?SHpVWnYxZjlpUHNwRm02WXVBcGxtLzJQVXBHdWtnanpkcmFRUDFhYU9GVzcy?=
 =?utf-8?B?SlUvd0t5aWxhWEpvV2xIeTgzWnB6V0ZTdzNKbDB0Szdpa0RNQmlTV1FQbS8v?=
 =?utf-8?B?OXd1Vlk0ZzBEK3hsdHZoWkM3UDVnLyt3TmZRdmJsSWtlYmZSTWZYcDhJQXJ3?=
 =?utf-8?B?b2VUcjRpdmlyTkNkaHhHZWdZckcvWllDenc2bStUY0JsbEFNTHJ5SGxpdkwz?=
 =?utf-8?B?VnhHZDN6QTF0Z1JJSGtVdFE4T21NMG9aTTIvaUlDcHVteG9BNWwxb1VrVkVM?=
 =?utf-8?B?UlFwRHRuMXZ1RVkxdTkySy82dXRLYm43VThPa1Z2eE1rOGZOWmJUbW1TRDJ1?=
 =?utf-8?B?TjRha0UrU05FVEhOS3pGSU9hQ1BvUitmSkt4ZXgzS2hZTUFtdjRzZ21tV2Zq?=
 =?utf-8?B?NFBuRWdURHY0SkRMOWE2ZGNQYkZZSzhIMks4eWNRNUwzOWZxL2hKQnVhd3Ny?=
 =?utf-8?B?cEtyMDlUekJmWWIyMGNqS2E5TUNpQk8yT3VoekJXdmh3U0J5bk5RaisraXZK?=
 =?utf-8?B?MEZFQTYvc09oV21mOHI0VWFuNVJNN2twbGFiTVQ1UkJ6d09OUnFucHRUck84?=
 =?utf-8?B?RE56WDdDcmJMVVRLZ3g3U0FzNkgzZEY3RWhRcEEvcnJGd0hmeHI2bkFweG0r?=
 =?utf-8?B?dWN2UmIwTUJyS0RTTit5RWUwQVMzenpZcVdnUWlhTGRka1VWdEFNeDVZdXNl?=
 =?utf-8?B?eVdZS1RtRW5xWkhHSzlSbDN1ZzRSYXRoTk9LTEs3Y2x5emQ1d1ZsdGkvbmtw?=
 =?utf-8?B?WnpiV0lUTDgrSTFWUGZNeGNTS3JPRnpnZXlmZHJ1dll1QmRGdmVVZmZpWkln?=
 =?utf-8?B?dnNLalBldEFOS1N0aExQNVRPbjNGOVBDZXVHREg5b2NGZkl4b2dDVmdSZmlz?=
 =?utf-8?B?UkJDY0RMV2lsNGlvWTJiNWFrYXFKNy8vS3U1OCtia3lNTVZzRldCT0I4UVRP?=
 =?utf-8?B?YTNZcSthaGE3c1Y4NU1lMjZmTVg2WkVlMmNQa3Nyc0tvb0NpN2VMRnpKRlEw?=
 =?utf-8?B?VXRzcDNkeitwK2JCY3picGpBK05UWER1UEVSOWx3WG4yY0o0WEJxd1BBZ091?=
 =?utf-8?B?Snc2RTVjbGpDWGxhWE1SNVkxZkxYL3NRbXdza1FoVVVlOGZ1SjFCaFphdnZW?=
 =?utf-8?Q?uH7W870RXIiHwO4ne9/S+c/utCMUNs=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8604.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(366016)(7416014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ck9USlpuaWRjcUJ4Vm12eGZsMkZXSWRiSkJRRyt1SVhNZkhPeFAxTDVHYUUz?=
 =?utf-8?B?Y2Q4ZmJKekg0MmhCZjFBOE1xckQrWkh3Z3J5SlVhTkUzaU1WOXhRTHdHcEZy?=
 =?utf-8?B?eUxBOXhNMWw0OUZXaFgxSitMUFEvWlg0Z2RzTDBNMlVFc28yUW1ZK2FqYjJa?=
 =?utf-8?B?S2FJRmdBSjVRYll3NkkzNUZ1dzJTUE1CL29YYlJSY2F6Mm9NM3J2REhhZVFS?=
 =?utf-8?B?dFBzKzVab3p3SlR2MEZObkMrZktPamlmM05xdUVUc0psQXJtdllkRmF6S2Za?=
 =?utf-8?B?bDBsd1M2eFhoZXNTbnVjYSs1eUgyaFYzK1NCL3YvY2s0WldyanZHVnJLMjZl?=
 =?utf-8?B?YldVOTRGYXIwT2lKY0F4ZnlnMHp4clhJcmZ5TlNPSGh5Z3pTZU9MZ1dwSWMr?=
 =?utf-8?B?WEJLSlZpVFhvYjkxY1NrVXBuY04zdWh2dlc2SHhLUVJVSlBsWmRQSTZhUFJW?=
 =?utf-8?B?RHREOTJ4ZW9GRVhmbFZNMnQ5ZU9KbVVNcVZaMFFWcVU1SzNoZ1lSQnBuQ3lS?=
 =?utf-8?B?OHdMRmdFNkxZaTBncnJJNTZWSy80eEpGYTllWnF0alJvdElxMHN5U2w2WVdO?=
 =?utf-8?B?aCsyUzBPdnJTWVAyMEtzNVovdlhWYVpnWXc1LzlDOGRTVVM2ejRiS1NMVTVH?=
 =?utf-8?B?dFhBUFV0cy8zbW42ZitMejhvS013RlpMSHpuMnJCZ3hVU3poM3RBR3djQm11?=
 =?utf-8?B?WnA3M3pDblR6ZFhmT1ZnUGJsMmNRenkyaXBUVUxpOTZPRFllcWdUSmFqWkZC?=
 =?utf-8?B?QmVISWZDM09JMTJyaTRSRHhnVVdBY3NtczhDOW5qVk1pYk5rTExZeUpkdUJh?=
 =?utf-8?B?UEdQcnhkTWQwQWx0VjZPQnk1b2MyVmxWYkJrdUdLeGFZbTJqOTFFdXRjS2dV?=
 =?utf-8?B?Zmd2MlRmME9LMTBBQ25zSDg0VVI2M0Exd3BxN0dCdytZbEwvZk1hUVVOMXFH?=
 =?utf-8?B?ZUZjRFJ3aFNZcVcyRDgvam1aVi9JdkxwUlp6WUxFRDZRL0NrZGZKNm03aktS?=
 =?utf-8?B?ZU1QK2VoKzBvQkllMDk0Z1hjUGQvOEFIUkE5M0VsekNkL3V4WC9kVlhJdWFm?=
 =?utf-8?B?eVViNWp1TWJLSDdheCtIWFU3R1c5bUNXZTdtYkpDa2d3aGNsWVgzUzgvWmpW?=
 =?utf-8?B?OGkxS1lFSU1sTUc4OUppRWg4SVJQVzczUGxIZ01GeS8ySTlpVDFPNWZBVWFZ?=
 =?utf-8?B?WDljNzZOeUpjWXN6cklYRC82cUFCM2JqTWdkSjdFeStiYjg1NkpNTVBYOXBR?=
 =?utf-8?B?UUU4bkwyNnp2aHFpUUhaVG9ocUlKWnpCM2tTS0QvYmRyOWgwaHdtdlNBd01l?=
 =?utf-8?B?aW16ckRvMDVKUUUwT2NUaDZZaGpGUHlJMjhMbWVRKzFCZmpzZy9nNTB3b2NX?=
 =?utf-8?B?ZWttTzJDOEg1eHNYOXBWdTV0ZWlrYWdVUHJHWjIycWl1SFV5Y1dacjdEdTdp?=
 =?utf-8?B?d3NYcThDN0NLdnY2REtCY1VzK0N6V0U0UmMvbG9SZ0xXUVoyTWwrRGJJQ0Rl?=
 =?utf-8?B?TENYU1dJaTMxcmlqcEJrUlgwK3ZIM0FoNis2Y3BWWS8xRDhMS0o5bDBzSFNR?=
 =?utf-8?B?SFF4S29rSEt1bjBRZm1ka3VZRC9WUjh3ZmN6MzI2dUVRbXhvOS82S0xMM1g2?=
 =?utf-8?B?d2twZkY5eGh4eTZWVTF4MUlRc0k2SjZocW1hakZDcUFuVnpCajlaU1Q4TG1j?=
 =?utf-8?B?MnR0TEk0SzBnVytFMFYxOTdnSVNXckdSQm9mbkVUVVM5SHJQNkMvVU5sTDJY?=
 =?utf-8?B?dGk2QUt5MENZSnZNcnlwaDRMZGNBVXRZQkZBMWIwdThscmFoYWVmbFpCMVpt?=
 =?utf-8?B?d3JZRnJPWUJrcHRWeEtOOURhQVdnKy96Rnk1RnA5OWVJZjZWUlkvV2cxaHB3?=
 =?utf-8?B?TWFEY0N0cGpIa3BRbW44SG1pTUhnZXdtZ1F4NCt3WmF1SkRFbjJOYUNXVWRJ?=
 =?utf-8?B?MTlJV0QvdmZsVkNXWW1adUQzNUZEbjhKZWpFVE80b1pzOFJXUVFkN3JONGZN?=
 =?utf-8?B?dkxoNmhsc2R5TEJaRW80dC9FeGQyUE5Ya3FsQ01OZGhDUmxtTy90OXVlQk1v?=
 =?utf-8?B?d1lQbVgxeEd1N2xTc2xjOFZRVDk0VjVvVHdPR2tlZXlXMERUUUFNc0Y2OHo3?=
 =?utf-8?Q?e/jnpN/i0QqtgfSk2/XANC8s9?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c184fdd4-ce6b-4c2b-02db-08dd75c2f64a
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8604.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2025 10:57:17.5602
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aw6ts5xGkViPCI9OGwyQgJmhqYey3c9O6Wb5vX72bZIII4m+hz24SgKeOXnYmccV6EuIROP5kBJy/CjeJdjyzg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8493

Changes in v15:
- Patch 3/6 is split into two:
  - 3/7: arm64: dts: imx8ulp-evk: add reserved memory property
  - 4/7: arm64: dts: imx8ulp: add nxp secure enclave firmware
- change logs are added below to the respective commit message
- No change in 1/7 & 2/7.

Reference:
- Link to v14: https://lore.kernel.org/r/20250327-imx-se-if-v14-0-2219448932e4@nxp.com

Changes in v14:

- Patch 5/5 is split into two:
  - firmware: drivers: imx: adds miscdev
  - Introduce dev-ctx dedicated to private.
    -- Base patch before enabling misc-device context, to have the send-receive path, based on device context.
- No change in 1/6 & 2/6.
- Copied change logs from individual commits.

6/6
- moved definition of func se_load_firmware, from 4/6 patch to this patch.
- split init_device_context to init_misc_device_context.
- Different value of se_rcv_msg_timeout is required to be set. Receiving the response of 4K RSA operation can to take upto 3 minutes.
  This long value cannot be set during Linux: boot-up and suspend-resume.
  Hence, it will be set to default small-value during Linux: boot-up and suspend-resume.
- func se_dev_ctx_cpy_out_data(), in either case: do_cpy true or false, the clean-up needs to be done and it is implemented like wise.
  Once do_cpy is false, no need to continue copy to user buffer. But continue to do clean-up. hence cannot return.
  And every dev-ctx operation is done after taking the lock. Hence, two operations with same dev-ctx is not possible in parallel.
- func "init_device_context", for 0th misc dev_ctx, which is created at the time of probe, the device memory management is required. hence there is a difference.
- func "init_device_context", dev_er is replaced with return dev_err_probe.
- func "init_device_context", devm_add_action is replaced by devm_add_action_reset.
- removed type-cast from func se_ioctl_get_se_soc_info_handler().
- used scoped_cond_guard(mutex, _intr, return -EBUSY, &<mutex_lock>)
- combined dev_err & dev_dbg to one dev_err in se_if_fops_read().
- removed the structure member "se_shared_mem_mgmt->secure_mem".

4/6
- trimmed the ele_fetch_soc_info.
- removed the function ptr "se_info->se_fetch_soc_info" and replaced with ele_fetch_soc_info.
- moved definition of func se_load_firmware, to 6/6 patch.
- Different SoC, different ways to fetch soc_info. Generic function declaration for ele_fetch_soc_info() is needed. Hence wrapping ele_get_info() in it.
- Updated Kconfig help text for assertive tone.
- func ele_debug_dump is updated, to remove constructing the format string.
- removed the macro usage for SOC_ID_MASK.
- used low case hex number.
- Condition will never occur, where msg_len satisfy the following condition "msg_len % 4 != 0". Err msg is added if it occurs.
- Function description is added to se_add_msg_crc.
- timeout is added to function ele_msg_rcv, in 5/5 patch.
- local variable "header" is initialized with "tx_msg" and replaced "return err" with "return tx_msg_sz" in func ele_msg_send().
- replace function name from "exception_for_size" to "check_hdr_exception_for_sz"
- replaced "return ret > 0 ? 0 : -1;" with "return ret > 0 ? 0 : ret;" in func "se_save_imem_state".
- func "se_restore_imem_state", to return if the condition is false to proceed.
- removed casting by (void *).
- removed devm_kasprintf and done direct allocatiion for attr->soc_id = "i.MX8ULP" & attr->soc_id = "i.MX8ULP", & attr->family.
- Followed Reverse christmas tree order, whereever missing.
- There is no return if ele_fw_authenticate fails. Execution flow continue forward and execute the fucn dma_free_coherent().
- The loop is not for retry. The loop is needed to load secondary fw followed by loading primary fw, first. This is the case when ELE also got reset.
- dev_err_probe is corrected in func "se_if_request_channel".

3/6
-

Reference:
- Link to v13: https://lore.kernel.org/r/20250311-imx-se-if-v13-0-9cc6d8fd6d1c@nxp.com

Changes in v13:

5/5
- Updated the commit message for imperative mood.
- Remove the usage of macros- NODE_NAME, GET_ASCII_TO_U8, GET_IDX_FROM_DEV_NODE_NAME.
- Clean-up the return path by replacing "ret = -<err>; return ret;" with "return -<err>;"
- Clean-up the return path by replacing "ret = -<err>; goto exit;" with "return -<err>;"
- Removed goto statements from the entire driver, where there is no common code at function's exit.
- Fixes the check-patch erros reported with flag "--strict"
- Replaced devm_add_action, with devm_add_action_or_reset
- Removed the un-necesary and obvious code comments.
- Removed dev_probe_err at the exit of function se_if_probe().

4/5
- Clean-up the return path by replacing "ret = -<err>; return ret;" with "return -<err>;"
- Clean-up the return path by replacing "ret = -<err>; goto exit;" with "return -<err>;"
- Removed goto statements from the entire driver, where there is no common code at function's exit.
- fixes the check-patch erros reported with flag "--strict"
- removed the un-necesary and obvious code comments.
- variable received msg timeout to be different at boot-up & suspend/resume and send/recv ioctlis.

3/5
- compatible string is modified from "fsl,imx8ulp-se" to "fsl,imx8ulp-se-ele-hsm".
- updated the alias name.

2/5
- compatible string is modified from "fsl,imx8ulp-se" to "fsl,imx8ulp-se-ele-hsm".
- compatible string is modified from "fsl,imx93-se" to "fsl,imx93-se-ele-hsm".
- compatible string is modified from "fsl,imx95-se" to "fsl,imx95-se-ele-hsm".
- Mis-understood the +1 from Conor. Hence dropped the Reviewed-by tag.
- Collected Rob's R-b tag on v7 (https://lore.kernel.org/all/172589152997.4184616.5889493628960272898.robh@kernel.org/)

1/5
- No change

Reference:
- Link to v12: https://lore.kernel.org/r/20250120-imx-se-if-v12-0-c5ec9754570c@nxp.com

Changes in v12:

5/5
- increased the wait-timeout.

4/5
- rename flag "handle_susp_resm" to "imem_mgmt"
- moved the buffer allocation ot load_fw->imem.buf, to se_probe_if.
- setting imem state at initialization.

3/5
- No change

2/5
- No change

1/5
- No change

Reference:
- Link to v11: https://lore.kernel.org/r/20241220-imx-se-if-v11-0-0c7e65d7ae7b@nxp.com

Changes in v11:

5/5
- devname is constructed by concatinating get_se_if_name(se_if_id) & se_if_instance_id.
- ele_rcv_msg(), is updated to add the wait_interruptible_timeout for the non-NVM-Daemon message exchanges, such that in case of no response from FW,
  Linux donot hangs.
- added a new helper function get_se_if_name(), to return the secure-enclave interface owner's name string.
- added a new helper function get_se_soc_id(), to return the secure-enclave's SoC id.

4/5
- moved the se_if_node_info member "soc_register", to the struct "se_if_node_info_list"; as soc registration done once, not per interface.
- moved the se_if_node_info member "se_fetch_soc_info", to the struct "se_if_node_info_list"; as soc info fetching is done once, not per interface.
- Added two member variable se_if_id and se_if_instance_id to struct se_if_defines.
- removed the member "se_name" from struct "se_if_node_info". Rather, it will constructed by concatinating get_se_if_name(se_if_id) & se_if_instance_id.
- moved the static global variable "se_version", to the newly created structure "struct se_var_info".
- moved the member "struct se_fw_load_info load_fw" of "se_if_node_info_list", to the newly created structure "struct se_var_info".
- Replaced RUNTIME_PM_OPS with SET_SYSTEM_SLEEP_PM_OPS, in power-managment ops.

3/5
- No change

2/5
- No change

1/5
- No change

Reference:
- Link to v10: https://lore.kernel.org/r/20241104-imx-se-if-v10-0-bf06083cc97f@nxp.com

v10: firmware: imx: driver for NXP secure-enclave

Changes in v10:
5/5
- replaced the u8, u16, u32, u64, with __u8, __u16, __u32, __u64 in
  'include/uapi/linux/se_ioctl.h'.

4/5
- No change

3/5
- No change

2/5
- No change

1/5
- No change

Reference:
- Link to v9: https://lore.kernel.org/r/20241016-imx-se-if-v9-0-fd8fa0c04eab@nxp.com

Changes in v9:

4/5
- change se_if_remove function signature, required after rebase to v6.12-rc1.
- move the info->macros to a structure "struct se_if_defines if_defs".
- Removed "info" from "struct se_if_defines if_defs".
- Moved "mem_pool" from "struct se_if_defines if_defs" to "priv".
- Fetching "info" using container-of.

5/5
- Fetching "info" using container-of.
- Fixed issue reported by sparse.

Reference:
- Link to v8: https://lore.kernel.org/r/20241015-imx-se-if-v8-0-915438e267d3@nxp.com

Changes in v8:

5/5
- Remove the check for SE_IF_CTX_OPENED.
- replaced dev_ctx->priv-dev, priv->dev, whereever possible.
- func "if_misc_deregister" moved before func "init_device_context".
- func "init_device_context" before func "se_ioctl_cmd_snd_rcv_rsp_handler".
- func "se_if_fops_write" and "se_if_fops_read", are moved after func "se_ioctl_get_mu_info".
- non static functions "se_dev_ctx_cpy_out_data, se_dev_ctx_shared_mem_cleanup & init_device_context" are moved static and local scope.
- Removed back & forth between the two structs "struct se_if_device_ctx *dev_ctx" and "struct se_shared_mem_mgmt_info *se_shared_mem_mgmt"
- removed the NULL check for bdesc.
- fops_open, is corrected for acquiring the fops_lock.
- Fops_close, mutex unlock is removed. Infact check for waiting_rsp_clbk_hdl.dev_ctx, is removed.
- sema_init(&dev_ctx->fops_lock, 1);, replaced with Mutex.
- structure member se_notify, is removed.

4/5
- removed initializing err to zero in func ele_fetch_soc_info(),
- replaced 'return 0', with 'goto exit', if the condition (!priv->mem_pool) is true.
- replaced "struct *dev" with "struct se_if_priv *priv", in base_message API(s) and others.
- Created a separate structure "struct se_if_defines" to maintain interface's fixed values like cmd_tag, rsp_tag, success_tag etc.
- removed the macros "WORD_SZ", "SOC_VER_MASK", "DEFAULT_IMX_SOC_VER", "RESERVED_DMA_POOL".
- Added handling for "ctrl+c", by postponing the interrupt, till the response to the "command in flight" is received.
- Removed the mutext lock "se_if_lock".
- furnction prototype for "se_save_imem_state" and "se_restore_imem_state", is changed to pass "imem" by reference.
- Added a new structure "struct se_fw_load_info", dedicated to contain FW loading relevant info. It is a member of struct info_list.
- split "imem_mgmt_file_in_rfs" into two "prim_fw_nm_in_rfs" and "seco_fw_nm_in_rfs", to be part of "struct se_fw_load_info".
- moved the function "se_load_firmware" prior to func "if_mbox_free_channel".
- function "se_load_firmware" is updated to use "request_firmware", instead of "request_firmware_no_wait".
- function "se_load_firmware" is updated to load "primary" fw image, if the imem_state is not BAD. Then load the "secondary FW" image.
- Added a new mutex_lock in the function "se_load_firmware", for ensuring FW loading done once, when there are multiple application are in play.
- instead of "wait_queue_head_t wq", used "sruct completion".
- add devm_add_action with action as se_if_probe_cleanup.

Reference:
- Link to v7: https://lore.kernel.org/r/20240904-imx-se-if-v7-0-5afd2ab74264@nxp.com

Changes in v7:

5/5
- struct se_clbk_handle, is added with a member struct se_if_device_ctx *dev_ctx.
- func call to ele_miscdev_msg_rcv() & ele_miscdev_msg_send(), are removed.
- func se_ioctl_cmd_snd_rcv_rsp_handler(), is modified to remove the func call to ele_miscdev_msg_rcv() & ele_miscdev_msg_send()
- func se_ioctl_cmd_snd_rcv_rsp_handler is callig func ele_msg_send_rcv(), instead.
- Mutext "se_cmd_if_lock", handling is removed from this patch.
- func ele_miscdev_msg_send() is replaced with func ele_msg_send(), in fops_write.
- func ele_miscdev_msg_rcv() is replaced with func ele_msg_rcv(), in fops_read.
- fops_open is modified to create the new dev_ctx instance (using func init_device_context()), which is not registered as miscdev.
- Only one dev_ctx is registered as miscdev and its reference is stored in the struct se_if_priv, as priv_dev_ctx.
- Separate func cleanup_se_shared_mem() & func init_se_shared_mem(), for shared memory handling part of struct dev_ctx.
- Input param for func(s) ele_msg_rcv(), ele_msg_send() & ele_msg_send_rcv(), is replaced from struct se_if_priv to struct se_if_device_ctx.

4/5
- A new structure is defined name struct "se_clbk_handle", to contain members processed in mailbox call-back function.
- "struct se_if_priv" is modified to contain the two structures of "se_clbk_handle" - waiting_rsp_clbk_hdl & cmd_receiver_clbk_hdl.
- func ele_msg_rcv() is modified to take a new additional input reference param "struct se_clbk_handle *se_clbk_hdl".
- func ele_msg_send() is modified to take a new additional input tx_msg_sz.
- func ele_msg_send_rcv(), is modified to take 2 more inputs - tx_msg_sz & exp_rx_msg_sz.
- func se_val_rsp_hdr_n_status(), is modified to take input of rx_msg buffer, instead of header value, as input param.
- each caller of the func ele_msg_send_rcv(), is sending these two additional input params.
- func se_if_callback(), is modified to work on two structures of "se_clbk_handle" - waiting_rsp_clbk_hdl & cmd_receiver_clbk_hdl.
- Variable "max_dev_ctx", is removed from info & priv struture, as well its usage.
- New member variable "se_img_file_to_load", is added to structure "priv".
- Other member variables - rx_msg(ptr), rx_msg_sz, completion done & list of dev_ctxs, is removed from priv struture, along with their usage.
- func se_resume(), updated to wakeup the two "wq", part of "struct se_clbk_handle": priv->waiting_rsp_clbk_hdl & priv->cmd_receiver_clbk_hdl.

3/5
- Node name is changed from senclave-firmware@0 to "secure-enclave"

2/5
- Node name is changed to "secure-enclave".

Reference:
- Link to v6: https://lore.kernel.org/r/20240722-imx-se-if-v6-0-ee26a87b824a@nxp.com

Changes in v6:

5/5
- replaced scope_gaurd with gaurd.

4/5
- replaced scope_gaurd with gaurd.
- remove reading the regs property from dtb.
- Added NULL check for priv data fetched from device, as a sanity check, for ele_base_msg apis)

3/5
- replace firmware with senclave-firmware.

2/5
- replace firmware with senclave-firmware.
- drop description for mbox
- Replaced "items:" with maxItems:1 for "memory-region"
- Replaced "items:" with maxItems:1 for "sram"
- remove regs property.
- remove "$nodename"

Reference:
- Link to v5: https://lore.kernel.org/r/20240712-imx-se-if-v5-0-66a79903a872@nxp.com

Changes in v5:

2/5
- updated the description of mboxes
- updated the description & items for mbox-names.
- updated the description of memory-region
- move "additional properties: false" after allOf block.
- removed other example except one.

4/5
- Corrected the indentation in Kconfig.
- info members:mbox_tx_name & mbox_rx_name, are replaced with macros.

5/5
- Replaced "for  secure enclaves", with "for secure enclaves"
- Replaced "user space" with "userspace".
- End the line "[include]<linux/firmware/imx/ele_mu_ioctl.h>" with a period.

Reference:
- Link to v4: https://lore.kernel.org/r/20240705-imx-se-if-v4-0-52d000e18a1d@nxp.com

Changes in v4:

1/5
a. Removed - from EdgeLock Enclave.

b. Removed , after "Each of the above feature,"

c. replace "can exists" with "can exist".

d.
-messaging units(MU) per SE. Each co-existing 'se' can have one or multiple exclusive
-MU(s), dedicated to itself. None of the MU is shared between two SEs.
+messaging units(MU) per SE. Each co-existing SE can have one or multiple exclusive
+MUs, dedicated to itself. None of the MU is shared between two SEs.
 Communication of the MU is realized using the Linux mailbox driver.

e.
-All those SE interfaces 'se-if' that is/are dedicated to a particular SE, will be
-enumerated and provisioned under the very single 'SE' node.
+Although MU(s) is/are not shared between SE(s). But for SoC like i.MX95 which has
+multiple SE(s) like HSM, V2X-HSM, V2X-SHE; all the SE(s) and their interfaces 'se-if'
+that is/are dedicated to a particular SE will be enumerated and provisioned using the
+single compatible node("fsl,imx95-se").

f. Removed ",". Replaced for "Each 'se-if'," with "Each se-if'.

g. removed ","
-  This layer is responsible for ensuring the communication protocol, that is defined
+  This layer is responsible for ensuring the communication protocol that is defined

h. removed "-"
-  - FW can handle one command-message at a time.
+  - FW can handle one command message at a time.

i.
-  Using these multiple device contexts, that are getting multiplexed over a single MU,
-  user-space application(s) can call fops like write/read to send the command-message,
-  and read back the command-response-message to/from Firmware.
-  fops like read & write uses the above defined service layer API(s) to communicate with
+  Using these multiple device contexts that are getting multiplexed over a single MU,
+  userspace application(s) can call fops like write/read to send the command message,
+  and read back the command response message to/from Firmware.
+  fops like read & write use the above defined service layer API(s) to communicate with
   Firmware.

j. Uppercase for word "Linux".

2/5
a. Rephrased the description to remove list of phandles.

b. Moved required before allOf:
+required:
+  - compatible
+  - reg
+  - mboxes
+  - mbox-names
+
+additionalProperties: false
+
 allOf:

c. replaced not: required: with properties: <property-name>: false.
   # memory-region
-      not:
-        required:
-          - memory-region
+      properties:
+        memory-region: false

   # sram
-    else:
-      not:
-        required:
-          - sram

d. Reduced examples. keeping example of i.MX95.
e. node-name is changed to "firmware@<hex>"

3/5
- node name changed to "firmware@<hex>".

4/5
- used sizeof(*s_info)
- return early, rather than doing goto exit, in ele_get_info().
- Use upper_32_bits() and lower_32_bits()
- use rx_msg here instead of priv->rx_msg
- Moved the status check to validate_rsp_hdr. Rename the function to "se_val_rsp_hdr_n_status"
- typecasting removed header = (struct se_msg_hdr *) msg;
- Converted the API name with prefix imx_ele_* or imx_se_*, to ele_* and se_*, respectively.
- Removed the functions definition & declaration for: free_phybuf_mem_pool() & get_phybuf_mem_pool()
- removed the mbox_free_channel() calls from clean-up.
- Flag "priv->flags" is removed.
- Converted the int se_if_probe_cleanup() to void se_if_probe_cleanup().
- Replaced NULL initialization of structure members: priv->cmd_receiver_dev & priv->waiting_rsp_dev , with comments.
- Removed the function's declaration get_phy_buf_mem_pool1

5/5
Changes to Documentation/ABI/testing/se-cdev.
a. Removed "-" from "secure-enclave" and "file-descriptor".

b. Removed "-" from "shared-library"

c. Replaced "get" with "getting".

d. Added description for the new IOCTL "send command and receive command response"

e. Replaced "wakeup_intruptible" with "wait_event_interruptible"

f. Removed ";"

g. Removd "," from "mailbox_lock,"

h. Replaced "free" with "frees"

i. In mailbox callback function, checking the buffer size before
copying.

Reference:
- Link to v3: https://lore.kernel.org/r/20240617-imx-se-if-v3-0-a7d28dea5c4a@nxp.com

Changes in v3:
5/5:
- Initialize tx_msg with NULL.
- memdup_user() returns an error pointer, not NULL. correct it by adding check for err_ptr.
- new IOCTL is added to send & recieve the message.
- replaced the while loop till list is empty, with list_for_each_entry.
- replaced __list_del_entry, with list_del.
- Removed the dev_err message from copy to user.
- Removed the casting of void *.
- corrected the typcasting in copy to user.
- removed un-necessary goto statement.
- Removed dead code for clean-up of memory.
- Removed un-mapping of secured memory
- Passing se_if_priv structure to init_device_context.
- Updated the below check to replace io.length with round_up(io.length).
	if (shared_mem->size < shared_mem->pos|| io.length >= shared_mem->size - shared_mem->pos)
- Created a function to cleanup the list of shared memory buffers.
- Used list_for_each_entry_safe(). created a separate functions: se_dev_ctx_cpy_out_data() & se_dev_ctx_shared_mem_cleanup()

4/5
- Changed the compatible string to replace "-ele", to "-se".
- Declaration of imx_se_node_info, is done as const in the whole file
- Remove the unused macros from ele_base_msg.h
- Remove the function declaration get_phy_buf_mem_pool1, from the header file.
- Replace the use of dmam_alloc_coherent to dma_alloc_coherent
- Check for function pointer, before calling the fucntion pointer in imx_fetch_se_soc_info
- Removed the unused flag for SE_MU_IO_FLAGS_USE_SEC_MEM.
-  Removed the unused macros WORD_SZ
- instead of struct device *dev, struct se_if_priv *priv, is used as argument to the funtions:se_save_imem_state, se_restore_imem_state, imx_fetch_se_soc_info
- Removed ret from validate_rsp_hdr.
- changed the prefix of the funtion: plat_add_msg_crc and plat_fill_cmd_msg_hdr.
- indentation correction for info structures.
- remove the check for priv not null from se_if_probe_cleanup
- Removed the casting of void *.
- se_load_firmware function is corrected for not freeing the buffer when allocation fails.
- Checking if get_imx_se_node_info() can return NULL, in se_if_probe()
- imem.size has type u32. return value from se_save_imem_state() will be assigned to imem.size in case of success only.
- removed the flag un-setting in case of failure. priv->flags &= (~RESERVED_DMA_POOL);
- removed the function call for devm_of_platform_populate(dev);
- Checking for not-NULL,  before calling the funtion pointer se_fetch_soc_info.
- Removed the checking for reserved memory flag, before freeing up the reserved memory, in se_probe_if_cleanup.

3/5
- Changed the compatible string to replace "-ele", to "-se".

2/5
- to fix the warning error, replaced the "-ele" & "-v2x" in compatible string, to "-se".
- Added an example for ele@0 for compatible string "fsl,imx95-se"

Reference
- Link to v2: https://lore.kernel.org/r/20240523-imx-se-if-v2-0-5a6fd189a539@nxp.com

Changes in v2:

4/4
- Split this patch into two: 1. base driver & 2. Miscdev
- Initialize the return variable "err" as 0, before calling 'return err', in the file ele_common.c
- Fix the usage of un-iniitialized pointer variable, by initializing them with NULL, in ele_base_msg.c.
- Fix initializing the ret variable, to return the correct error code in case of issue.
- replaced dmam_alloc_coherent with dma_alloc_coherent.
- Replace the use of ELE_GET_INFO_READ_SZ, with sizeof(soc_info).
- Replaced -1 with -EPERM
- Removed the safety check on func-input param, in ele_get_info().
- fix the assigning data[1] with lower 32 address, rather than zero, for ele_fw_authenticate API.
- Correctly initializing the function's return error code, for file  ele_base_msg.c.
- replaced 'return' with 'goto'.
- Use length in bytes.
- Corrected the structure se_msg_hdr.
- Moved setting of rx_msg  to priv, into the function imx_ele_msg_send_rcv
- Will add lockdep_assert_held, to receive path, in v2.
- corrected the spacing at "ret  = validate_rsp_hdr"
- FIELD_GET() used for RES_STATUS
- Re-write the structure soc_info, matching the information provided in response to this api.
- The "|" goes to the end of the previous line.
- Moved the locking and unlocking of the command lock to the caller of the function.
- removed the safety check for device private data.
- Structure memory reference, used to read message header.
- In the interrupt call back function, remove assigning waiting_rsp_dev to NULL, in case of response message rcv from FW.
- do while removed.
- replaced BIT(1) for RESERVED_DMA_POOL, to BIT(0)
- The backslash is removed while assigning the file name with absolute path to structure variable.fw_name_in_rfs =.
- Update the 'if' condition by removing "idx < 0".
- mbox_request_channel_byname() uses a "char" for the name not a u8. Corrected.
- devm managed resources, are not cleaned now, in function se_probe_if_cleanup
- Used dev_err_probe().
- Used %pe to print error string.
- remove "__maybe_unused" for "struct platform_device *enum_plat_dev __maybe_unused;"
- used FIELD_GET(), for  RES_STATUS. Removed the use of MSG_TAG, MSG_COMMAND, MSG_SIZE, MSG_VER.
- Depricated the used of member of struct se_if_priv, bool no_dev_ctx_used;
- Moved the text explaing the synchronization logic via mutexes, from patch 1/4 to se_ctrl.h.
- removed the type casting of info_list = (struct imx_se_node_info_list *) device_get_match_data(dev->parent);
- Used static variable priv->soc_rev in the se_ctrl.c, replaced the following condition: if (info_list->soc_rev) to if (priv->soc_rev) for checking if this flow is already executed or not.
- imx_fetch_soc_info will return failure if the get_info function fails.
- Removed devm_free from imx_fetch_soc_info too.

3/3
- Made changes to move all the properties to parent node, without any child node.

2/4
- Use Hex pattern string.
- Move the properties to parent node, with no child node.
- Add i.MX95-ele to compatible nodes to fix the warning "/example-2/v2x: failed to match any schema with compatible: ['fsl,imx95-v2x']"

1/1
- Corrected the spelling from creats to creates.
- drop the braces around the plural 's' for interfaces
- written se in upper case SE.
- Replace "multiple message(s)" with messages.
- Removed too much details about locks.

Testing
- make CHECK_DTBS=y freescale/imx8ulp-evk.dtb;
- make ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- -j8  dt_binding_check DT_SCHEMA_FILES=fsl,imx-se.yaml
- make C=1 CHECK=scripts/coccicheck drivers/firmware/imx/*.* W=1 > r.txt
- ./scripts/checkpatch.pl --git <>..HEAD
- Tested the Image and .dtb, on the i.MX8ULP.

Reference
- Link to v1: https://lore.kernel.org/r/20240510-imx-se-if-v1-0-27c5a674916d@nxp.com

---
Pankaj Gupta (7):
      Documentation/firmware: add imx/se to other_interfaces
      dt-bindings: arm: fsl: add imx-se-fw binding doc
      arm64: dts: imx8ulp: add secure enclave node
      arm64: dts: imx8ulp-evk: add reserved memory property
      firmware: imx: add driver for NXP EdgeLock Enclave
      firmware: imx: device context dedicated to priv
      firmware: drivers: imx: adds miscdev

 Documentation/ABI/testing/se-cdev                  |   43 +
 .../devicetree/bindings/firmware/fsl,imx-se.yaml   |   91 ++
 .../driver-api/firmware/other_interfaces.rst       |  121 ++
 arch/arm64/boot/dts/freescale/imx8ulp-evk.dts      |   12 +-
 arch/arm64/boot/dts/freescale/imx8ulp.dtsi         |   11 +-
 drivers/firmware/imx/Kconfig                       |   13 +
 drivers/firmware/imx/Makefile                      |    2 +
 drivers/firmware/imx/ele_base_msg.c                |  312 +++++
 drivers/firmware/imx/ele_base_msg.h                |   95 ++
 drivers/firmware/imx/ele_common.c                  |  380 ++++++
 drivers/firmware/imx/ele_common.h                  |   54 +
 drivers/firmware/imx/se_ctrl.c                     | 1209 ++++++++++++++++++++
 drivers/firmware/imx/se_ctrl.h                     |  128 +++
 include/linux/firmware/imx/se_api.h                |   14 +
 include/uapi/linux/se_ioctl.h                      |  101 ++
 15 files changed, 2583 insertions(+), 3 deletions(-)
---
base-commit: 8250927cfd6e6538b6c569926865d833ae6b5bc0
change-id: 20240507-imx-se-if-a40055093dc6

Best regards,
-- 
Pankaj Gupta <pankaj.gupta@nxp.com>

