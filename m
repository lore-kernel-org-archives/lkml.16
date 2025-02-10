Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2101.outbound.protection.outlook.com [40.107.21.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42FFA1BEF85;
	Mon, 10 Feb 2025 08:29:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.101
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739176154; cv=fail; b=i9UlB+xAJFi+OU3eI8okpdr9o2Pu96agx9+ijPjP+8h+6FX0BhmrgLc9ZI8ANJFnvEnB0c4+22Pm5NA97d5h2MSUfrByIwGPlsais5MzY33lqVTB30e1dYwvKlVNEjlviDw0WRjY7Lda0B329iA37Zr31KPk3610x+yqxVIrXNQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739176154; c=relaxed/simple;
	bh=a37tE8KpP9bcWXmVr+BCUyq9g6TOZYsRFFL3VmXb5dU=;
	h=From:Date:Subject:Content-Type:Message-Id:To:Cc:MIME-Version; b=b5RpOrRbkSifF6ekgb4on5CRPRfqDjGabkZMSkiW+DDQTQbKJHmv6jVzGHAMTKUgj6+5gxwsgyyysT7qs0++OPMKLq4loSFYEMiiEbwEC5Xv/EHGwmI85/uvznccggjGTqTqDhPyS0oQETFgeu1dqsoXvZyoRPvr1ecloIB8DI4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wolfvision.net; spf=pass smtp.mailfrom=wolfvision.net; dkim=pass (1024-bit key) header.d=wolfvision.net header.i=@wolfvision.net header.b=rWb5EbDs; arc=fail smtp.client-ip=40.107.21.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wolfvision.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wolfvision.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=wolfvision.net header.i=@wolfvision.net header.b="rWb5EbDs"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MwGjMHgtx2mRe4Zuj8FU9ULcXGYoTquoEExCqJZGJN0qowQGHckVpGibikZhjSP/lGbSAHGmwhMPYe7h8QDDysxVlTXPB7urx5JHauOKfoicj5T8lrFg3fexvnfTnJo5Z9tDN8kiM8mANy2AGBjgtSYSlXHZpKuazZaOwcGraD1fx5XKv54GIowG+xL3XHEOREoKTFHNEiZZh0ZxAYc+LUL+ymXgoGUit0LYVv152z4ZoV7q3OWKu890fCaj07Pnqky5sfchTdpZCz4TUe1CzMUVeQGNhABvIGFK4krQtnd5dZG1BR7EghpghsUCz5ubQeJLfy8dLnnMYUNDRtPVgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sopq3O/vL4DLfUlCRzSfV73OkzX7pXLUYZP45czpZ+w=;
 b=Z+TniMXX/DpIwVZSN8vldmXPa2oswjeom5wl2vevrmbSspJ0xXZ09f5BTtmsnC1xjhZqluRABPtTucvw9Vs+H0xBl4SfgyRpsirgxaq2uKrR+jYmZjAia9t9t1OErsh5fmR5dJeGO8oHBNz3ZH61w7ZenRqXmlvapbsS1LbbdoUtyVOzwuX0hR3hz/cBJk6quKuayru2E0O+4jObOEaZWD/U/hX23YRjlMBj8WtkeMNg9MIRCTrwBGNtiwOWKnqi+uo96fSwWj1+DJBHVwxzQiqHDWeZQSQk88PJNNH30dfdwSCCXSQQ34gjmX+2LbQHtFwkRWG8hqTxbRingRuAYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wolfvision.net; dmarc=pass action=none
 header.from=wolfvision.net; dkim=pass header.d=wolfvision.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wolfvision.net;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sopq3O/vL4DLfUlCRzSfV73OkzX7pXLUYZP45czpZ+w=;
 b=rWb5EbDsei1xLILB3avg/dkrhjFvz/a4syqk0neHTvNSW7uP/OuUuXiaHqllstbs4JLubogqoxvYYNu9mJe0GWKG00M/tFr2tryMkHDJK9K93LfFbiwwFKxBKnkDybJInEeRBL8VK0TtwZ2roUspAonnKkSOTDuj2JfNXvVjcGE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wolfvision.net;
Received: from DU0PR08MB9155.eurprd08.prod.outlook.com (2603:10a6:10:416::5)
 by AM0PR08MB5300.eurprd08.prod.outlook.com (2603:10a6:208:18e::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.18; Mon, 10 Feb
 2025 08:29:09 +0000
Received: from DU0PR08MB9155.eurprd08.prod.outlook.com
 ([fe80::4e72:c5d4:488e:f16d]) by DU0PR08MB9155.eurprd08.prod.outlook.com
 ([fe80::4e72:c5d4:488e:f16d%5]) with mapi id 15.20.8422.015; Mon, 10 Feb 2025
 08:29:09 +0000
From: Michael Riesch <michael.riesch@wolfvision.net>
Date: Mon, 10 Feb 2025 09:29:02 +0100
Subject: [PATCH] clk: rockchip: mark hclk_vi as critical on rk3568
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250210-rk3568-hclk-vi-v1-1-9ade2626f638@wolfvision.net>
X-B4-Tracking: v=1; b=H4sIAM24qWcC/x3MQQqAIBBA0avIrBtQy6iuEi3EphoKCwUJxLsnL
 d/i/wyRAlOESWQIlDjy7StUI8Ad1u+EvFaDltpIrSSGszX9gIe7TkyM1jrqzDga1Sqo0RNo4/c
 fzkspH3H4mKBgAAAA
To: Nicolas Frattaroli <frattaroli.nicolas@gmail.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Michael Riesch <michael.riesch@wolfvision.net>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1739176148; l=1153;
 i=michael.riesch@wolfvision.net; s=20240405; h=from:subject:message-id;
 bh=a37tE8KpP9bcWXmVr+BCUyq9g6TOZYsRFFL3VmXb5dU=;
 b=MmVMs5j4qToaDAqaZBBQkjPFg5U6b/XEsOYgOqyAoA/6o3LKGV+bt66FYaYM4lUzpGV1DdCdu
 dKBGyits/7BABMuwlAL8agScjyUnnYaqGVGshRiXDtCpK64YFF8VtFz
X-Developer-Key: i=michael.riesch@wolfvision.net; a=ed25519;
 pk=cSJmgKSH3B6kdCIDCl+IYDW1Pw/Ybc6g9rmnUd/G7Ck=
X-ClientProxiedBy: VE1PR03CA0003.eurprd03.prod.outlook.com
 (2603:10a6:802:a0::15) To DU0PR08MB9155.eurprd08.prod.outlook.com
 (2603:10a6:10:416::5)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR08MB9155:EE_|AM0PR08MB5300:EE_
X-MS-Office365-Filtering-Correlation-Id: 586dd0e5-b706-472d-96bf-08dd49acfd49
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RWp6T1drWmFqSGVEY1lreTN1Y1JjTzVaazlSczV5WXNpYzFNL1g5d1dFb2kx?=
 =?utf-8?B?WVVsNlEzQTZEUGhha0h4U3VoQmRiZ2VpU3NVUm1Lams1ZGhXakdKWkpwMGJ4?=
 =?utf-8?B?MFk3ekoyWUtaS00rMFd1MkV4eEVjbGJ0bmdlWUI1YXp5WHNidFlEVUZqT2g4?=
 =?utf-8?B?NTVGRWpDUE54NllpM3hKb3JIbzNQQ1pmL1hCMFNYSkovTmxORnRoeXJHWUtq?=
 =?utf-8?B?OW9qWW1WRnVYNlgxYjFmdHgrRllLWWczQmI0WnorU2VpT2I3aEFES2x6a2Q3?=
 =?utf-8?B?TGE4dllNTldvMFc2Y1lUZXJhcUlaV3AvWkFXSjY5YWhuMTYxQzVXb0ppejlB?=
 =?utf-8?B?RGZMUHJGc29CMjdQalY5WlQwV1NzMFk4Wi9mTi9mdUlwQlMvbWFmMFJzd3Vo?=
 =?utf-8?B?Zjg4RnlGVEp2eDFLNytleUV3TU5PZEVBYmcvWFo2SDd5RGlnTlFzOFBSSlll?=
 =?utf-8?B?VllwejZtREZsQnR4MmF1WDduazJ2TWpsYWZlZCtMSHkrSGJpUDdYQXhuOHpJ?=
 =?utf-8?B?R0wvS3M3aitIVEFuTXFhYjdxK2N6dWtZMlBuNHR3MlRDSmV5Wk9vYSsrR0Rt?=
 =?utf-8?B?ZHlEQmw4d0s0NFZySldWbUdQcXhhK0ZtTnVpekR6elRycENMVUJPbW53R0xr?=
 =?utf-8?B?T0pyMHdhSzNCWG9WRnpCMHJhNFc2dDJQYmk3bUFUVXhGWGVFZzcyR01vMjF5?=
 =?utf-8?B?dWpYaGtBQ1k3ak1SVUNnMlUwejd4UE9WWjlUUWl6MzgyRndhNzJKd1M4aGg5?=
 =?utf-8?B?Sk5peVNYWXlRdjBwc003OGVidExaMG4yUWRkMTU3WE5XUURhM0ROUWVXSFFM?=
 =?utf-8?B?b0ZUSXEyckVFeVJJeXViTElZZW03RFNNQmF3Q3JhTVkvaDVFU1I4eVJsblhI?=
 =?utf-8?B?VUdHbnNOS2xJSlNIWktDbnFVVUFwYXo5dGZaVkZzM1ljbERzdU1IZlF3YnJK?=
 =?utf-8?B?cEtyc3VlQnJLcGFSTGsxb2ZSRmE4bWVkQkZOYUZmT05PNm8rYlVYTGJxUXVC?=
 =?utf-8?B?dEQxUitGQ3RiejhjZEhSNVJDRitTblA2RkY5TDV5M3p0VUVmV0NqSUxLS05Y?=
 =?utf-8?B?Wm1uQmlPT2F4NjBHbkdOR083QW45ck5lZ015NEdNdE9xM1Q2WW0xZGU4NTRD?=
 =?utf-8?B?Z2c1ZXN1eG84UEdyRng2M2doK21OZWVmbE5UWWZiOGswOFFOeFFxUDZ5Kzlt?=
 =?utf-8?B?alNiQUF6MWQyeWJ3MkUySXhsUXluWEFaRFpONmxDelNabFF0d0FGeHo2cERj?=
 =?utf-8?B?WExYYzErV1QzN2lRd1hBU0hLaWpHcnQvK0wxNFUxd0ZqL0xEZ2hXRkkyVTZK?=
 =?utf-8?B?Y3hRbVF1Z3lwQTJBeVRtWTVLbWJuMXlZWWQrM2ozRTBCYlB1aWFoZXAwNUhN?=
 =?utf-8?B?Zm5lRXg4RmZ1bDEwRHYxR1d2V2wzZE5zV1o5M0JuQlpmYXlzMzBneFhUVnIy?=
 =?utf-8?B?NVBYVkFWS1FtQVlmYTFiRDNqdm5UMmlZYlE3WHV4TFp0YWVJS0hyKzJSWlFa?=
 =?utf-8?B?bzdyU2xWL3MzbzQwM1UrZnljeUhickdoQmkzV0NkeDUvSnFGaHV4L2ZONWY0?=
 =?utf-8?B?TXhLR2ZQMEcwdzdtTktBMTVRUHhEZmlwSXg3QWxFZ3pzTzFuamNJdWFQTjcx?=
 =?utf-8?B?dForSFlMTWVCTmFuMlpnR044K0hEM0R3NDY3UXNFT1lWRFFuRWRzNzJzdGNw?=
 =?utf-8?B?U1p2V2lER2ZzTDlMTlpCc2lMREtOTE0zLzZzeE1nQlBsYzd5YnNUMlBHRDF5?=
 =?utf-8?B?Q2c4QnNGMTBPNXRHVTVETnRKOUsyU094Q01yWFpJU2x5cXBzRXJheE1rVVND?=
 =?utf-8?B?cy9lS05Vam5OZ0l0dm1iS0cxbzFNWFA4RitnSzZRYUhiMTVGWVdVejB2SjI5?=
 =?utf-8?B?aXQ2ZkNreXJyNDV0SEV5OHlwUXg0aldTbkhFelluZ3l2UUlBekRGRzdjUis1?=
 =?utf-8?Q?dZnQmT3+odpdHVDPp4JYX0qZWsFMJwni?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR08MB9155.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cUNVY2VSbWd3TldHZHFxQkNZenYrTFZsWDcrNnhYaGNuNmR3MUdVNDhLMXpX?=
 =?utf-8?B?bm52aDdrZUJURXh6YnVVYjAxRGJWUXpSc0hRcWx2R0JHZ0ZoN2VQVGhOMXY0?=
 =?utf-8?B?UkFTTUFvZnlEOEFHekYrQi9MdFRxbXBiWWVXYjB4OW9wRUM3Ukg3NjNjcHNT?=
 =?utf-8?B?T0dEcml0SDNJQ0VmRU0raTIxS245Y1lYdnNsVGNWVDJadEFvdWtzWGxNTzgx?=
 =?utf-8?B?dzB5MXNVWFVPSmF1RkpuUlcxRGdOWXVENjZZSTV0Q3VOalZKbG5sNXhXUEd0?=
 =?utf-8?B?THAyMTdSRkpkdlVvTmF6OWt1OXg5SlZUUTlBTWd4Q1VYMkxNakx1TENRa1d6?=
 =?utf-8?B?KzJHWFNhNDNKVy9CUXlMbjJiLy81bERkQWZXQzBsdzh0RXo3czJ6ZVFyZGto?=
 =?utf-8?B?V0pRSzYxWWtwMUhPb2FFQ1prZXNTeS9keTZBSWM2U1pBNFlkMjJSVVZ3OVp0?=
 =?utf-8?B?U1ZSMUY1SUtEYi9zYW5vVjFCbGhsb1loMWJNVEl6c3FScS8ydldkSzlKMWF1?=
 =?utf-8?B?SEVNWVE4OURpZUZ2MXFlNWhUakdEcmtuRTZXZ3F0cUtQRnA5blRWV2xaVGRQ?=
 =?utf-8?B?UGRQV1pNK3ZVdU1PMVFPVEZjMHN5R2N1aU5OVXR0a2prUDZyY0dBSDgwSGFQ?=
 =?utf-8?B?RThCVWhDNFd0YlpGV1lFY1Z2a0ZiSFJCVE0zV1JiRlZxYXJsaFFodEF1bldV?=
 =?utf-8?B?N2N5eEs2MGN6SXUrOUowT2draGhHSG1rV0gxSXFKcDJpcW5iVEZiVW5YSEF2?=
 =?utf-8?B?VmZzS1VzQW4yVWRwRlNNVVpnQnJmdEIvL3Q3bXZVM0liSHV3R0E5dDJ4WlVZ?=
 =?utf-8?B?R3QrdlVjYVd4ZFJJb2VRV1BHVnhrZndZcSthbE9sd3hxQW1pa3RaRG1zTEc2?=
 =?utf-8?B?aE16UHdRbEdsWjFsMk1jUlpER2dvK2t2VXhpWnM0b0VkTllqM2huanVVaDYv?=
 =?utf-8?B?d3k3OXZCUzBYSXJ1bXpXTFhSb2dXdFdIK3c0T3A3dm5jY21YR3hwT0dsZS9B?=
 =?utf-8?B?MGFSYkhGdmtuZmduUDh6VUNHV3IwRHptWGN0M2JxN3BYMWx1YTg5RHNGeXRP?=
 =?utf-8?B?dU14c3I5U1FSUEcvWTNaUHdNQ1VOcW5reGtlejRsTEJpcEYrQTd5ZHhrZUVN?=
 =?utf-8?B?a0NNclg5MDlMNHJ3SE1NalRxZlVnK2JJQ1VRSll1WVYrTjY1aVZQNm96SVhz?=
 =?utf-8?B?NmJIend4UWR4R0cwR3F4bDdBN2tWaXluM2wybk9QMGtGZUMwRGorZVVaMDV1?=
 =?utf-8?B?Y0xJVys5eTZHN29VcnpTcmszY0hLNWdTbU5FUVcxMzJnQXBwM1FaZExkMkFx?=
 =?utf-8?B?S0FKZmJzaURycnlncXZjd0tSajFETkF4RCtyYlg5WUMvemFsQ0pqblVzaTFV?=
 =?utf-8?B?L2VpSW5pa3Y1bjRIMkVpeVBhZGhTTzRDZXlMS3B2SEFZS2NWNVp2SXdRaVA3?=
 =?utf-8?B?NmZwN3ZmZCtDUHNlNHNrZTIrYy8rWjY1eXpNRjdlNnZ1VXFTOTJiSDF0Vk1u?=
 =?utf-8?B?Zm5MUmhIMFBzNmtKZklaR2ExSWVORUsxWVE2Q2RFR1A4bEIvTjhmcnFzZXhp?=
 =?utf-8?B?UFNnRk94aXY2TkNjd29yUkhDa0VWN0VJVHVObXZ2V1VaVXhNTmNZNUJvRGp0?=
 =?utf-8?B?T0V2WkpOKzBZL2hmaDdHQnVyTEUyLzZzUjVmdmVETWtpeCtGczhCcGdyeTd2?=
 =?utf-8?B?a3VQd0RaZ1ByeWhJUWVJbUNFdWRFdE9VZnJZdnBzZjlHbHZ5dzFMVzI2OXdH?=
 =?utf-8?B?Rm4zeFl2NmJEbUw3NFNlcjRVUlVkYUZVOUY0MDVVaEg3VTFnYzlhbk4wVk9p?=
 =?utf-8?B?UkZqemJiZHlqcjNVR2FENno3cElhdVlDQlhlSUFobHlya00wR0xSSytKemZ1?=
 =?utf-8?B?eUd1MHlFSXBOZDVvSWVldnVZQkJ4QmtNTDZabjhIVDF1YWt5WXFhek13NXhP?=
 =?utf-8?B?RGMvSTRoRXlNeXdwNDBKM25qb2d5bVIxZ0l2WjhWeWhNcGJmaUVXVC80OFhO?=
 =?utf-8?B?TkhobVZWMm1tS1djNGZJUHRad3RkOTRGNDhFNU9VZFk0RTFjVGM3SG5LMUFC?=
 =?utf-8?B?NmdrVjNWcDF0VzE5b3Awa2NsUFlxR2UxcW1CcmJvREgzVGY4UlhIZ3czZTFN?=
 =?utf-8?B?YitxR0g3KzEvZmcvbFVJdW5pTzVTOWZneURLRkJWNGJlUWlyejkyRnZ6T2xJ?=
 =?utf-8?B?VFE9PQ==?=
X-OriginatorOrg: wolfvision.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 586dd0e5-b706-472d-96bf-08dd49acfd49
X-MS-Exchange-CrossTenant-AuthSource: DU0PR08MB9155.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2025 08:29:09.0789
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e94ec9da-9183-471e-83b3-51baa8eb804f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2x9NlCroKRRckbBXpz8ZcqD77QNoSj+VRgs41oRrV8As5Nd4zNBr+Xq8CapWDLVMnRSKjRTkwUWpum4TfbOnrcPWEbXvO5MpZIHMNxKvQg4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB5300

The clock 'pclk_vi_niu' has a dependency on 'hclk_vi_niu' according
to the Technical Reference Manual section '2.8.6 NIU Clock gating
reliance'. However, this kind of dependency cannot be addressed
properly at the moment (until the support for linked clocks is
implemented for the RK3568).
As an intermediate solution, mark the hclk_vi as critical on the
Rockchip RK3568.

Suggested-by: Nicolas Frattaroli <frattaroli.nicolas@gmail.com>
Signed-off-by: Michael Riesch <michael.riesch@wolfvision.net>
---
 drivers/clk/rockchip/clk-rk3568.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/rockchip/clk-rk3568.c b/drivers/clk/rockchip/clk-rk3568.c
index 53d10b1c627b..7d9279291e76 100644
--- a/drivers/clk/rockchip/clk-rk3568.c
+++ b/drivers/clk/rockchip/clk-rk3568.c
@@ -1602,6 +1602,7 @@ static const char *const rk3568_cru_critical_clocks[] __initconst = {
 	"pclk_php",
 	"hclk_usb",
 	"pclk_usb",
+	"hclk_vi",
 	"hclk_vo",
 };
 

---
base-commit: 2014c95afecee3e76ca4a56956a936e23283f05b
change-id: 20250210-rk3568-hclk-vi-aace45995131

Best regards,
-- 
Michael Riesch <michael.riesch@wolfvision.net>

