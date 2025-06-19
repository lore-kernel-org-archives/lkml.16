Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011071.outbound.protection.outlook.com [40.107.130.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A9052505A9;
	Thu, 19 Jun 2025 11:58:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750334321; cv=fail; b=jsvNprIfhzQLJ9ySh8qy0nvxlUaKFRwZAg/8AABQjnZA/bk1MDrgzgUWgyYJUcgz7P0zP5+0LAornPt7K0cgNiXh7nNuoRvlqky8CqgjzPXuxi2n9Sb4Y/ytSZZ86z46PowcNj54YlP5FRiGRTnXzrgY/FqorUS4LrK5Dd1inis=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750334321; c=relaxed/simple;
	bh=C+/byolstUK3qbG2fKo1MZ04D0IETXzzliSh+5Ny0lw=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=uuijF5ZQnB2fap56nK8vciVI6+2u4D2mS5cmZSt/56o23WVZh/sNgUyOUPlIW4mMMjAf85mE4QFewh7jjOhEXVpB0v4L1ftByHzdvlixafcOqMIJGVYCsXmim4THT9jxKS3JoD45RWIgUpPkAC9W515H95NAR6FajsxuUOlLaGQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=OCJTXIhl; arc=fail smtp.client-ip=40.107.130.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="OCJTXIhl"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Gr6ty23Z/ZlI5ydsc+ZDuVu/SUBfRf6v/KrfwoBQQ5N+BJECYrXpLFoPMot9q7AFdI1DvawN942iYLM8r5zUY+EL7coVAe1E5oLDT1FhdjyXXknaII2n4Av1qJUbr6SqXSFD9P2xxJkTF1J/w+/S334s/hdluTSUBfwx/1SGbwRjyjwFuTTf06+rcRgL5jURxHKSD8dwtZFTZOA4TW7qFLpIDLC7GKYwE/LKHhaKWROTRabJ6WYM+W9vGw9R6byv1TQzlyyfpEWRCwrhWdVAWINASJiZcrWHsniXao3+BiX7Q0kQlHMCm0UrL9J5OoBb1XdKlhiuKDN+mly827ThGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=twxCJtmU2KZ98rqCXb/Uh81mNSAdCjdLoHTNJdLz9Gg=;
 b=Xvovja46YWlsfQ1uPwPJrrmxFetsIoeztDZ+V0wOYn7Sep9VFQYuewydkmm7ZjrypqvS4vMfM3eJOr9aEOfyI47f2l9BCSJ/I5kzTp5Z5u4+DiAGBrejZeHWp8J9mQ2HJzs+LHx40yligT6/gnjfCk+VQlBQvNw5skp5WGvl2nS4cjggiLn4UQi++UbCCae5bD6QjTscZqpt53P1pqczf7Ga4gQBJY2bAmFbJfLBwWOIYSdu81b5HXWcjowXHoqLD5ysmgwD3qHW4Ztc9vEIeFl8IMRLECG47IH0qQnKf+LW8hUjeHneH2baLIrfR2jtQXynT3/UVMgbixNDmypFbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=twxCJtmU2KZ98rqCXb/Uh81mNSAdCjdLoHTNJdLz9Gg=;
 b=OCJTXIhl+wbxmVAkbVF3CH9GEeoc0DnMvYtVlK4G0xO0e1d7NKBeGsAARet8WYj3r2cEbdU/N0QQ78bN/5Yiri0zN4DY1m3eg59Z2qsXYraljZeicquNhukxe9EcqxNgI6wmxLW7KFrf7OqhBoPd97vMYkUIJxPxfNfSFHEdfr+NEu5nbb4noim72Z4KqvFvBGFeH8QLFeCp5o3MPGXIRJ57xf/WplWyQvI2X431tFnnj8Oa2zbuAhE4OV4oyb5D/Ygy526QJGOBCjsRZoZ16/MVoKqETwjd1x1Upd5rjl+JmlxFfUqlYwBT8eZ3jcIbQrnCjRnNwbhk3z6ndYRIZQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM9PR04MB8604.eurprd04.prod.outlook.com (2603:10a6:20b:43b::21)
 by PA1PR04MB10414.eurprd04.prod.outlook.com (2603:10a6:102:44f::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.23; Thu, 19 Jun
 2025 11:58:36 +0000
Received: from AM9PR04MB8604.eurprd04.prod.outlook.com
 ([fe80::e751:223e:aa3d:5827]) by AM9PR04MB8604.eurprd04.prod.outlook.com
 ([fe80::e751:223e:aa3d:5827%7]) with mapi id 15.20.8835.032; Thu, 19 Jun 2025
 11:58:36 +0000
From: Pankaj Gupta <pankaj.gupta@nxp.com>
Date: Thu, 19 Jun 2025 22:50:16 +0530
Subject: [PATCH v18 7/7] arm64: dts: imx8ulp-evk: add reserved memory
 property
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250619-imx-se-if-v18-7-c98391ba446d@nxp.com>
References: <20250619-imx-se-if-v18-0-c98391ba446d@nxp.com>
In-Reply-To: <20250619-imx-se-if-v18-0-c98391ba446d@nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750353651; l=1279;
 i=pankaj.gupta@nxp.com; s=20240523; h=from:subject:message-id;
 bh=C+/byolstUK3qbG2fKo1MZ04D0IETXzzliSh+5Ny0lw=;
 b=XiFOoS9050+IbNgoBg+MLkbZpYqtQ4FmuRP3roYX5cKGTN/PMJdtOwWGE/Xy9Ruedk3uS2YpC
 NGNbRcwdDeHDceGrHczIyVWZWme3WeVon3VHj1ROxISLNVaIztIKPy9
X-Developer-Key: i=pankaj.gupta@nxp.com; a=ed25519;
 pk=OA0pBQoupy5lV0XfKzD8B0OOBVB6tpAoIf+0x1bYGRg=
X-ClientProxiedBy: SG2P153CA0027.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c7::14)
 To AM9PR04MB8604.eurprd04.prod.outlook.com (2603:10a6:20b:43b::21)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8604:EE_|PA1PR04MB10414:EE_
X-MS-Office365-Filtering-Correlation-Id: 9356533f-5bd9-473f-37a5-08ddaf289f58
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|52116014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WUYyNkhySmhKdlBzM2dVY0RPQ1hyNi9QUnNqeVdKK1hMa1BHWW1raUN0YjRB?=
 =?utf-8?B?Q3BZRHJIWHFVNEYvVVZ0RE5ubnA1b3kwLy92ZHRrVTdsU0h0TVdtODIxUjJJ?=
 =?utf-8?B?N0htQVVWVHY0YldZd0JBRXVvV0ZtVUNOeWk2UmNrZmZ0NWhUTFg4UE54YUZJ?=
 =?utf-8?B?bXNvUHZvZjc1RTJJWGxHVmRQUTRhSmUxSmRSTkVNa1VseGN5UzJ3S3FUTEk3?=
 =?utf-8?B?SWUvY2U3bStENWRaTVBibmlMQlQxZTNBUThOS1ZsWGhMZ1FGUjNaNlozcURP?=
 =?utf-8?B?NFNYUitRWWhYZ3hPQUc1VndpTytJL0ZFU0JjZ3VtYUpGSyt3OG5JdVdsZzdi?=
 =?utf-8?B?cjVrVkZ4dVAwZnA4WHpjMEUwL2l0Y3MwaTdtYk5oNXJBdlRtVGM0OE16dFZI?=
 =?utf-8?B?UktLK2lSKzU3Z1pTV0QvVVU2SXJaVk9yQ09ERGhTWHpaRjJRRHpaN1dCSmo2?=
 =?utf-8?B?Q1ZNWXBDdFNoMzJ1bnVjQWR3aHNIaFRFdndQNkVEUU9md0FLSm5YSkRxcThh?=
 =?utf-8?B?VFNWZFd6L1JPS0lxVEpXL3h3YXZZdW5mdWlsOWJWek9BelFmWDU2WUJmdVpI?=
 =?utf-8?B?N2V0b0JZM3NyZlFweWtCcDVKUlNWTElpenVYcVhoYjlxOFJHNXhVbkJWY3Ex?=
 =?utf-8?B?NGJIRlZ1cEFwV0hjVkNmUXNVWi81L0I5ZUo5TGtGa3VZaDZmQTRtSVVqTG1N?=
 =?utf-8?B?R0JWL1ZucWhFV0pFNDNlSmxSbFg2Um5td25HamtzZ0xRc3Z4WkNGaVlMaE9P?=
 =?utf-8?B?U0Z1L1lublVGZlc4aE1sZEl6dVM0RmlUVzhHUFJzWG9FZUZlYVBiM3lITzFZ?=
 =?utf-8?B?SmgyVGZYek14MFpNNDJLWHZvWnRiVzRud29FbzF2SU0xZkZjU0hHZ0Y3TXFw?=
 =?utf-8?B?UXNEZ1NxT0h6TVdEaXI1YitFM2FLN1cxRGVFcHZ5cEVHZ0t3eC9tejRiSzBx?=
 =?utf-8?B?Z1VkN1FBQ2J5Z0ZKWkZJcjhlVXlMQ0pESW9FYUt6cUI3Vmc4bHhqUVFZK005?=
 =?utf-8?B?YTF2bm5iSWxHYmxra1d3SW00N1dvcEFmNEtDcU5Kdlhzb1pvOTN1WUdWK1gv?=
 =?utf-8?B?WDNtUHg4OWNORTZSVU8wOHNOMmpkWFlEWENzclpaTmxKWTFSd3UvVUFWcGVO?=
 =?utf-8?B?K25mSmR5ZXNZZG82SEdJYWdWU1Q3dlJ4c09MTksxWnFWVjdTcjRUZGN5K05N?=
 =?utf-8?B?WFlWRTNnWWg5OHZRbExTaXdOa0dobHcxdUc3eXJ0STRKNnlIVjB5aVNYdGF6?=
 =?utf-8?B?ZU01NmdGN0JFN0N6SHJjVUhFYlo1Znlnb3FlZmpJV2ltNEJzWVBHT1RkMmtm?=
 =?utf-8?B?ZkFob3cwM2xvU1hCUWhpSll6MFJZNGFTaWdqVU5tSnlINU9xZlI3RW54b1pa?=
 =?utf-8?B?MVV5RGxQdm5wZUg2dGFBbjlFeW1DbS9DMjhDS1BvU2tZUHVrOGZIUjNveE80?=
 =?utf-8?B?T0U0TVFmK2IrV2VnSXkrQysyWXZobXoycE1HRDg4anhVY3RTKzVCWnhJZlF4?=
 =?utf-8?B?cFY3bnZ1ZlZMRGd1ZzFvNmZMOGhMY2JFN25tZk5SS1ZVbFNpbURHQnRGSW43?=
 =?utf-8?B?bHNiVU1LYXJOMGMwUEZ5WGI0TUVCN29xeGFtQ2JxZzBPM1Zzd2lPa1VTYVBY?=
 =?utf-8?B?WTRWYUpaRXVZczRpbU5wOXFBOHB2aWprQ3ltY2tDSCs5c1Mrdnd5TGcrQ0hD?=
 =?utf-8?B?K3dpQ1V5K3BmRldoNXBOWm1zeXdZdTNpNDRWTjgvM2grRWM3VUQ5NjVHQW1n?=
 =?utf-8?B?RnRpdmZMN1dWVStOeU13QWRBZjBQS1FyYzlwbHJ3VFZsV3pFTUlYMlBTK0pP?=
 =?utf-8?B?TnVXT1FPL1BXYVcwU0RlbnBhVEdZSlgxMDBROVVGT2h3WHZtcWw0TlRIZTF4?=
 =?utf-8?B?U3N2Tkt3dzFyM2M4UVlvSDVnbnZmK3k2NVMxclJWbGFlMlVrV0lXbDg5cUNp?=
 =?utf-8?B?Q1R1UGpwSmR5NHN6Z3hKVlhld0VRTnNEOFB5WmQ0cVM0SkNxa3JpU2RVMWlP?=
 =?utf-8?B?S1F0cnU0OWFBPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8604.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(52116014)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Mm1GbmJTc1dnQzlDYnRLVzdRNk1DL3d6U1NsRkpjb1cwK0dFMTl5UnZNZjJa?=
 =?utf-8?B?ZzYvU0hRMHpXUzZNLzZlcGZYSUZTWmZ4b3pPKzFEUmlmNFUxdkV3ZnJaVkQr?=
 =?utf-8?B?YS9nQ3g4TjkrbUtXYUNUblR4SGcvSjBZZzBtMzJUWmQ4cFNwelYvOTg0bUNK?=
 =?utf-8?B?cGswM1JRcHcxSFpkRDhwTE85MVJneW15eHJ3bUNydERpSGhNcGE2V2kzWjJK?=
 =?utf-8?B?R1pwSkRyZlA5Z3ZVV0JLR1NJRE53RkNVMU5iY3JKK3l6MitvNXU5Z0FCWEth?=
 =?utf-8?B?YmszSVFsLzlSZUtkUVpvTk9YWUNYQkd4Rkp0S0FVaHdHU3dPd0lwd2U2MEsz?=
 =?utf-8?B?akZ4emV4MHRCdFBEWW55R0I4WGllYk12RDE4ajFiQmtYS0doK21vMmFuY25q?=
 =?utf-8?B?S3QwK0tIUXRySG5BVzhhd3hoTUx5Vyt1WW1Wd1dUMkNHdk5QV2RZNTc5T1VT?=
 =?utf-8?B?OW9HeEZIbmowSEFjOFNmNFhMYkV3NjhjK3IvTk5BbFVFdkhKbnVNRDlac2FJ?=
 =?utf-8?B?eVlJUzVtRnJGOHJaNk80OGNEN1g5eEwzQ0g2Um14alV3NUd4ekd2SnZyZ09u?=
 =?utf-8?B?dTRZdEtzdS9jSE00L0dLRG0vaGRBMHF4RVF5L25OZnQrQTBVckxnUjhkNFNC?=
 =?utf-8?B?QW9xWXFoNkNjSlhtSllaUTVDQzVOV2tCcW9mOU1Odm1sTjNSazNFRXYvMWJa?=
 =?utf-8?B?bmxzWjVZLzVQWm05cVh6Tk1HZVFaVXhzeThPUmQ3UmpabThZU2ttNkp5QUZo?=
 =?utf-8?B?Wm5hY3VhNmlJd1R1YjBEdjBWUzJWK2JXS0d5WGNOV3hHQUNvS3M2SitvZVdi?=
 =?utf-8?B?dlJHR3V0REIvaU40YzdXeXpWaExJS2RmOFZnakJwY1ArRjcrSkt6Q1A0Mm5w?=
 =?utf-8?B?RGd1eEhTcUtMNS80T2xOQ2hQeVNjay9vSHV0Y0pTUFkxdEFTS096eHBRSWxh?=
 =?utf-8?B?bWVGYzlGbnNtTThvcXJ1TjRkSkZTK1JVazJaenVCZ1VrTmx0NTJlMmZaT0l2?=
 =?utf-8?B?Z2xHZ0s4eVBsQ0J4Ylg3cXNjUjBsa0w0eWdDZkw3NnM4UVg1VHU4KzVBT0VK?=
 =?utf-8?B?aTdjRTNzZnpPdTlqN3h0TzRueTQ2Ykl0MWFzQUo2Lys2bFZPcUVpRC9UamFN?=
 =?utf-8?B?MmZxQWRiRkN4bFBEbzR1Y2MycEZOTWpmZkZ2QnBsbUVJbWZvV3hVWlR5Vy9Y?=
 =?utf-8?B?dVhCMzM1ZFZiZTB5SnlqNDZRb0xNYXozMTRYVy9hWmk2aGRqK0hvZzN3V3RV?=
 =?utf-8?B?cS9hQTl2OUdENTVEUmN6bHpsdURPTHpaNjIvbC9tNXNFbitDdE1QRjdkT1ps?=
 =?utf-8?B?bzJLNE5PMWE1YWxPUy9TWmw1eUtVNTJDc0lkdGlsMlV0aVhtMXFMQ2UxUzZv?=
 =?utf-8?B?d1RPRXoxend5SlFhK082QnE4aGRYZituWHcrN0kwWVlSbHd3d2w1TkZVU2xl?=
 =?utf-8?B?aVVvR0tQUXFtTHVQY2VEWGRwTWRPT2VzQlhTOVFkOFpDRG5RamU3SkpPajZt?=
 =?utf-8?B?QUdNdVBKeWs1cWFhVVNNNDRnZFpxNUZnTGxlUmV5Zk5xb3FmdTF6cXBML0c1?=
 =?utf-8?B?dlY5VXgwNUttMDJaUjJjNzRDaE1SUXhvbXZtOXRmekdZZWFwVUhYd0VBK3ZW?=
 =?utf-8?B?emNuSDRuSUxUdkhMRzNWRTkxTmdERjFhM3FuQ21NNEJQVnlZa1U1MDVhek5J?=
 =?utf-8?B?b0NmdWwxZ3k1d01FL3dzY3FrWFBqSnpaazR6Q0hESnpBK0dodzRaNVg3M1pT?=
 =?utf-8?B?QVBBM1hzMlJTTDU2TUxNUGVKNXpGM2tnU3BVSG8zeVZqZVhhWUtJcTlDd0t5?=
 =?utf-8?B?RXZWandlb2VuNGcyUDR0TG4zSWlQbWdYUVBmbm50T0gyTEVpdVhBL01QVnhj?=
 =?utf-8?B?eUxkSHNNU3hleTNOY1BxR1Y4T3R6WEVZZUExV3RsZXM2Z1dOc0tRbVVQMXJs?=
 =?utf-8?B?T1V0SlhVZ1lSSXNBR2hPa1JuR1dDcHYyREZ3UlVpQVpRQjZZY3BJcFFFWTRU?=
 =?utf-8?B?ZWFWb0dWVHNGN0lBSGNVdXRBVklrN3RLNFRGNm1JME9JVXpLdHZBQW05WGw2?=
 =?utf-8?B?NEVLdTlZL1k5WTQrakx4TlB1ZmkzSWM4SmhzUWhZTjFVaklXS1BnUWRsQkU4?=
 =?utf-8?Q?xU1qyk8l6U/33I7hYHptWBw0J?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9356533f-5bd9-473f-37a5-08ddaf289f58
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8604.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2025 11:58:36.4713
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: saMfFKODtBBkI2OdieSOlKwfyqw9+PHwfCsPamdM0sKzMxCfJxvyqOGssyW3VRO4nJOQeFEPb7/WVQhTn7m/HQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10414

Reserve 1MB of DDR memory region due to EdgeLock Enclave's hardware
limitation restricting access to DDR addresses from 0x80000000
to 0xafffffff.

Signed-off-by: Pankaj Gupta <pankaj.gupta@nxp.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8ulp-evk.dts | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8ulp-evk.dts b/arch/arm64/boot/dts/freescale/imx8ulp-evk.dts
index 290a49bea2f7..10aaf02f8ea7 100644
--- a/arch/arm64/boot/dts/freescale/imx8ulp-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx8ulp-evk.dts
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: (GPL-2.0+ OR MIT)
 /*
- * Copyright 2021 NXP
+ * Copyright 2021, 2025 NXP
  */
 
 /dts-v1/;
@@ -37,6 +37,12 @@ linux,cma {
 			linux,cma-default;
 		};
 
+		ele_reserved: memory@90000000 {
+			compatible = "shared-dma-pool";
+			reg = <0 0x90000000 0 0x100000>;
+			no-map;
+		};
+
 		m33_reserved: noncacheable-section@a8600000 {
 			reg = <0 0xa8600000 0 0x1000000>;
 			no-map;
@@ -259,6 +265,10 @@ &usdhc0 {
 	status = "okay";
 };
 
+&hsm0 {
+	memory-region = <&ele_reserved>;
+};
+
 &fec {
 	pinctrl-names = "default", "sleep";
 	pinctrl-0 = <&pinctrl_enet>;

-- 
2.43.0

