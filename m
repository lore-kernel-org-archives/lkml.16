Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2074.outbound.protection.outlook.com [40.107.21.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FBC91DEFE1
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 13:16:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.74
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744377363; cv=fail; b=rm2EwW14AEgZfJa81txp17dliVjGq9G4FZGJFSieYeQfAsdQvXgJm+xfqmksCNQDrK+I+doRgGdwwBZyhbgYFWQRyMJ85CNUhjRkVtJ6OnzLB5s8F5paczM/X/dKz660Hj2qDUex8CSvWDeJRVc4J+rlyYdlRUwQ0RyVWVsavg0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744377363; c=relaxed/simple;
	bh=qE0clyk1dzQxtO0OQ1Wy1u9YSda03bJ+9FPAgTj8aL8=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=brIVP9klfRM2NYFWOab2w3tVeGq39KwW19Ij+ERHFP7BV8bb88cbghQKE1SrDauh5uKH7r52eJ77vnwlqMbHJ/tdVQw6385nvchHkhim+XfJIfGf/npSkF9pwrpwGS7tDxYtWM9kC0MMo71yDthNswyrpJydZE0HyVvL+T2cDmc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=aUKIM0Xk; arc=fail smtp.client-ip=40.107.21.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="aUKIM0Xk"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jGRqiFRkG5zyEim5036j2EtErz+Psz3G4BSdUkal1fvjzJm1CndZ2evZTQrKs6whLdK5f/6avDSHCoDlWGFt630sW/dk/Ds3G+y8pk9dsiy5hVlqGgQVB8tUdxOyWFTeGbqbGehM1EtKMjQl6jCPuPf8CgVYhNWvbnGcNrqQJRh7n+zisx+9LHGaS48cOXfoVFF8covytH5QuLndz+7XdnCzguFX2afpro2qhRjIzDVNouFi5JWWxR8SQua26688F7uD5eNdoSXNCxX6FVFgkBK6qMWMSC+BpXqVUbwioErHoxDz6O8ib7GRMMCTM6Gb4O4Pd3XwMV8eeyD8ps/1lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9Ek9PlQL3L7F/GT5aHQ9Ql/XYFXtYwJ848RD7txB0GQ=;
 b=L+U7jUep8xJ573lStgyyvvaZ5XvEJmcz5L4h3XpVBx/jwqdRf+8jna0e47zrJvJX9VJDsJq9oQyRynLnNypjkrNhAkkOJ6W6qzKC7BopRJSUaKPgv2KDTMshP7AqNHuljR/Mkvho/m4xqT9YE4VghUsu/nDo4JPTwWqCFO8I+S/TywvowwkVFoDeEe+YRZrZWqBBaGoeZkSnwjq3xfzu9iZ5M0fCUc0aXi9Isuoq5eIPkejWvadSuZMbIiCWqKankMUwhsuSerK1ORQwxaR7lBz4hgIEiT9VoB8+Fe0A5bpKA6RGqZMumX7uRbzDdUWa4wEf35ya7q0zXMvYZFUX/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9Ek9PlQL3L7F/GT5aHQ9Ql/XYFXtYwJ848RD7txB0GQ=;
 b=aUKIM0XkQGxW67Xo0SzER0R63ZwG0c1x+XL4fBW0Ff+e2UslhkKnE61VfXcZVHv+olHf5Y1IM2xBgTESFU1M8QybUf6Q6iiioCL2iV5olEOcIfqetwzvQyd1x48c7rZLe77HmHT5V8FDr0lntIu2ISv/LfJKo7oCRt7jRFYZCYs+J6D4FJiFKlo1KFUzKrTxEtq/9uEmPsMTOUXBPCpRDWcq1A2IomUHZojmQXa838uD/yoCQ5j7xaQj9+hrtwicSV+yarALO56L/eWKnZ5d/f9s9ZevQ7fGpNb4alItSIEFLxz6CYKlgMhzzkYQKJ/RNE3sQ/1YiMfv2l0b94mvRQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by PA1PR04MB10674.eurprd04.prod.outlook.com (2603:10a6:102:483::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.28; Fri, 11 Apr
 2025 13:15:58 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%5]) with mapi id 15.20.8632.025; Fri, 11 Apr 2025
 13:15:58 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Fri, 11 Apr 2025 21:14:13 +0800
Subject: [PATCH 5/6] mailbox: Use guard/scoped_guard for con_mutex
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250411-mailbox-cleanup-v1-5-8db541394dc2@nxp.com>
References: <20250411-mailbox-cleanup-v1-0-8db541394dc2@nxp.com>
In-Reply-To: <20250411-mailbox-cleanup-v1-0-8db541394dc2@nxp.com>
To: Jassi Brar <jassisinghbrar@gmail.com>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Elliot Berman <quic_eberman@quicinc.com>, 
 Thierry Reding <treding@nvidia.com>, Sudeep Holla <sudeep.holla@arm.com>, 
 linux-kernel@vger.kernel.org, mailbox@lists.linux.dev, 
 Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744377279; l=3115;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=r0VYGdsKbpTESeFSS5JyC7sEdaPJ+c5WRhpXb4zBr/I=;
 b=sUx1TVg/qmjp6O85mjCi88OAfDTekjeAlVQJKgULHJmvQfOMXN0nzR8WvcanRw3xzbpabBFp6
 wkNXSne9OYhB5Wg6SK8qIiJYR5I+WpD3pwh+rtl8tqS6ZJZTiIC4rWK
X-Developer-Key: i=peng.fan@nxp.com; a=ed25519;
 pk=I4sJg7atIT1g63H7bb5lDRGR2gJW14RKDD0wFL8TT1g=
X-ClientProxiedBy: MAXPR01CA0104.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:5d::22) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|PA1PR04MB10674:EE_
X-MS-Office365-Filtering-Correlation-Id: fd5ec770-8899-4e9c-fd65-08dd78faffd1
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Tm83Q1VqeFd5NmdqNlZwNVFyS1c2WDloNlYvRjRDRWEyTmc0WnNpTDZBSHJs?=
 =?utf-8?B?OU4zc1lPeHgzK0ZvVndkbDRLZEdpd3hydHdjcForbE5Ta2l4aVdIL2lYaVJ2?=
 =?utf-8?B?cWE1NkIvV0k3RVV1MGFZV2xCcUxEOTFRWlY4U2hFM010RlhHWm5rZE03d1hS?=
 =?utf-8?B?MmdEd3hjWnVIK3F3VlhEOXJZRjVta1hiU0J4dUtSZTcwUzkyQ0ZkSHU5QU8x?=
 =?utf-8?B?K1phNkR1cWVFbnZHeXFSNkhUVmdEMWliaVRiWXdoMWxyWmxLdDdabmU5TnNH?=
 =?utf-8?B?cmdDMFRBb1JZRkllaTVoWnE3S2c2QnZjeTFEd3ZLWTIxZXU2VytrWVZ4anY4?=
 =?utf-8?B?ZWY3MnFkbTVveXlORjZlR1lqa0JxWTh6Q2VtQW9LOTNSSjBLNXJMVHNvaWQ2?=
 =?utf-8?B?ejV0UkcrSkpKcEFJTzd6MlNBMjRhUFhOYjdDYmtXTDBHTXBuc1ZBRHNjVkFs?=
 =?utf-8?B?dmRSandWMlQ0V0FzeHgyVlpDVjVzSlh0VldDaW9aQytyTUc0Z3NZZlR5SENS?=
 =?utf-8?B?eGpvU2lybjV1bmRFNnkwazNSYzFBclJteDZCaWZPMHRRdWgybGhhVlpLRVBv?=
 =?utf-8?B?U0xudzhMZjhlMXFvR3BvMkpBdW1nZGl1VmJ4d05UNzU3dGhmQU5RdHpxQ2gz?=
 =?utf-8?B?Y1ByTFN2V0RobVI2K21YQys5b29uN1hJaFZTL0J0S1dZc0JrUDVkUjRmMlpm?=
 =?utf-8?B?bW9kZnNGVmlpVkJBKzQ3QU4zL3FSQUIrOERVd01RQjVhT3RMQ2hvMlBadnAr?=
 =?utf-8?B?STZBL0t2YWJmOVBEdjlUQVhWaWp2cnYxYVlxL3RLZTdqOThjRmJVOWd0N0g5?=
 =?utf-8?B?NHlob2ZoRjBkTjc1ajc3VEt2eUhrdWUzcXROd3NsYmFrQk9JdzNYOTcycGtV?=
 =?utf-8?B?N2JLVkZDcEFnZG5kMzhrK1ZyaHJ5RFlBWnJrUXVOcGpQaEpPMXJtMmVlTFdz?=
 =?utf-8?B?LzFQdnZZUUZCNDFUVVExTTJVTmFIZEsyVDlOK2FJNy8ycjBjQXdKV2pOMEdp?=
 =?utf-8?B?OXZGbGxCek95N0ZjSVVJVTJybXUrMkdQNi9IVzZpakl3S0pXaEtiUUpFLytV?=
 =?utf-8?B?cFhNSkxQOFJrNG42cmJGYUo2N3NObTJWRDdmUEQxRVJ2RU40M2RhTzJpSEZC?=
 =?utf-8?B?WWh4Sm9UdVYzMWx2aDIxbkVrcEJWRjJTNXBvV2F5dW8xendsY2UvYjdPRlJH?=
 =?utf-8?B?bThOY1JvNWpOM3ZFem04U3BkNWh5R3ZDc2tjaTltUGFuVC8yM2NJMW84a2d2?=
 =?utf-8?B?a3FxQTZneUQ5WU43Qi9td3NWVzAzOVVzSDN2R2FFYXc2TWpPSzV4bjVMVENq?=
 =?utf-8?B?T3pITHZvSm5TK3NZRFZVclFuRVhYV0cyWWRuOWdmMDcvYWUxT2lyQUFPYWxj?=
 =?utf-8?B?blF3MTFzNk9KMFA3UVFETkJwcUxVcGhKVGZNc3pCWDI0R0JVeTNBOE91U3B2?=
 =?utf-8?B?K2JhRjhHYnpCK2pXQlJMblNmTytBcWVWalN3WkJNS0lTY3hHVldTOU12WGgw?=
 =?utf-8?B?ZkNnenN4WERweHB2aGRzdXM4Y3E5M2xHYllkRlMwT2l5ZEF2N3EyYlNOZHUr?=
 =?utf-8?B?cVhoV0QxVkJPY21EVTZkaENjN3d3SkwvU3dzSy9nMk42VHBiSzliTVBaZGpM?=
 =?utf-8?B?dXJxTkdCb2JhczNkQ1Z6dzNXR3paM2paZGs2VzhLWUlTY1VNOVNQNzlPaWly?=
 =?utf-8?B?OUt0cnpjNDZ4S0hkbnNBaGw3NUZQdyt1Z0ZHMFNIaCtaK1M4M2lJNjlkaEJj?=
 =?utf-8?B?M3FCNnNUdytiSnQwcjI1ZDlaTm9HSXBERnFORys0T2N3TzJkUGV0NTBibmtN?=
 =?utf-8?B?c1lpaDFUOWloOU8yUER1NlVqM29reXFFcGlnWVRSVHNFNk1ISGw3ZS81djh6?=
 =?utf-8?B?czVPbjN1NjdlQVdkTVJsQXVXSGw0Q0I5OE1KOTh2Y3B2QkRKZ1MwNkh5R0M4?=
 =?utf-8?B?WlpzTVBLam92djJHaU1jbndCdXYyS3ovM2lhZnd5YzYyeFlNbWk3NDU3dXNR?=
 =?utf-8?B?NjNmYzl6TjV3PT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TWQxQlN2NEhkckc0QlpwN1JKMGxzZlYvYmxQS2RzSllTcDZoaDZXSTdQd29I?=
 =?utf-8?B?U0lGUVNTc1dCdEhsTkxkUHRCYW92REF5c3dyL0Zra2hwNk9ZV2pKNnFRaTAv?=
 =?utf-8?B?eG0vOW56T0tKeXJSdnhTUTczaUI1MGJJRHpZbitMbTh4bWc1SFhZMERpZzJ1?=
 =?utf-8?B?RTRESThCM1dYSHQxSks5RjlHNXd3bDM5NTZaZWFROHQzK3ZqWUhSWitVUjg2?=
 =?utf-8?B?VHRNNVl2b3NTc3JJNWlmVGNITWZzbkxWUlRseklucXVJQmJNMmRvbThQbVhk?=
 =?utf-8?B?R3FiSzV3UC9pNTJFdHZqai9PZlRnZkVtVGRPa3dkUyt1V3QxNWliVk40VE1p?=
 =?utf-8?B?Uk1DUXBVSmJsVFA5a1RBeFRKVkd1d3NNZUVGVXIxSThuUUo5d3ROc1FOSUtW?=
 =?utf-8?B?OFZYTVZxUTNCNERORkZ5dFVEM1diQmNWSCtaQmRlVUZObmR0L1d3MzdnWTgr?=
 =?utf-8?B?NGZDaGlRQmRCaTJqRE1Sb2NRK2NOY3h0TS8wRzJqNDViUDVRTlhZKzM4L2pt?=
 =?utf-8?B?Q0ZUdHNqaFQvdThHcXhGZmZ4UVBmWUlZOEJocUZ3OERwUHZlWnExZzZiQVNh?=
 =?utf-8?B?UnFKaWVQQXNmam43c1FieVVKNk1mbmdQMVltT2RTUkhHSlFHZVE2VmtndDdL?=
 =?utf-8?B?STZtRVkzdUFMTnFKTmxxWXliTXR1Q3ZzSnZTcHpZRlRjSGkvSjdESnZZY3pS?=
 =?utf-8?B?LzRoRTV4QjNMVUEyUkNUYnV5MzRCUjRuMmRTTzNNcFIwSVI1Q0dRTGxZS0Ni?=
 =?utf-8?B?L2JhOU82RkFVb3N5eTV0YXZaZjZxSnE2b1Y3aUwveitCUDY5NnlsMGdhaVZK?=
 =?utf-8?B?cXM4UnBhcHJjazd5N2p5amVKRlVBeTJzOCt3cndSc2JFcXh6MktBOUVhWGRQ?=
 =?utf-8?B?RG5sY2wvTDlmd3NQZmg0STRXWHZXZFA0cklRRFl4MWdQckNmQWtTUFl5Nkkz?=
 =?utf-8?B?NlhKUXVSekwrSzFGOHNjcTcyU2NrZUVJck5HOFBERjgrN2NLbEV2UmZ5ZE1U?=
 =?utf-8?B?ZjdBeXVLNGtwOGNIRm4ydXhKRUc4NVdOajRxTy9BYjRuZDR2VmdmMXJ3M0hS?=
 =?utf-8?B?ZDhsckhibmtIWDNBM2txcjh4ekZXVWVlbGhYRjdDQW5ZWGk5MStsY0M2VWJk?=
 =?utf-8?B?WUdzb0c1TzF1bGNDNjlxTDZWeFROdFNLWjZMaktlMGRuODBDUGdvWTBrQkJG?=
 =?utf-8?B?QlRoM0xkQUJVczFVRlJ5MWJ2SGsrSXdIdmZBOXZ0S1J5QU5NemRqK00xWUlI?=
 =?utf-8?B?a1JYcGY2WUdyZUJCdkRlcXJFL2ttZjlVL3E4T0tPbjdORHdUUkhqQU8rdnU4?=
 =?utf-8?B?WXE2R0NqaUhPbmZxQmhZSW1kbzZ0WUh5am84Mis1QmlOTXdFdDVFU0M2REZa?=
 =?utf-8?B?NkI2c2YrV05UWlBnb01ZbGhlSm54dGVYM0xwU3RFMDhiN2JSelRLTTRVU3Nh?=
 =?utf-8?B?djh2aUtTREFoYlFrWjBlVnBIbUVsSWJzZmYwYnpia2xVQXhlcW5kNjJJb1Rn?=
 =?utf-8?B?eVNJak0wVHEvVmtEcWNCQWJpdTBYZXFBUWtaS01GMXBnczZIQUU3S2FRK0wr?=
 =?utf-8?B?dlpPQ2k5blRSbURvdXFPWkxpbjlsVW9DekhkQ01xODlvL01RbmlEd3NNLzR3?=
 =?utf-8?B?amJFdDRRQmtCQnhRbUIyWDlvUFJRTlV3emk2Y2VqdXBCSTlKZE9pNlM4SC9k?=
 =?utf-8?B?ck1TV2p6V3Y4TllqUkdHUEZaTGtFT3ZuMEpMNWU4d1FLNjB3VlJqVFYwdWtV?=
 =?utf-8?B?RmVhTDlRTDdhb0xpbUozN0JnOGdQTzlJTDVVS2I4TVlpOERRZmRlZGdxMWk4?=
 =?utf-8?B?UlZTRFZvZzJiRS9zQjBDT1dnVE5tSmRMblRJVk5wL3NDYkI5bGxWNUtrNVdh?=
 =?utf-8?B?NGZxMENLTklLbHgya0NGbXF2amhzMnQ2cHFJejJGY2RXQ1JJMWVIR2FadlNS?=
 =?utf-8?B?d1hMYW5zZUIyYldHNEMxYUNmazVHbDJETkplTFFOMXJYL0hUSFk2N1gveWNQ?=
 =?utf-8?B?UGVxbWM0cVhyYWNlMktHeVRWbFhJSjFYL244Si9sM0pqRXdDSlF3VGsvaEpU?=
 =?utf-8?B?Tmh6Y1NVcjd4QnZVcURCK0lYSFdsZUszYjV6dFBXa1Fpb3l2T0pGVDZxUEVD?=
 =?utf-8?Q?QBlxPnHj3LHModZhNs1LZZ66q?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fd5ec770-8899-4e9c-fd65-08dd78faffd1
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2025 13:15:58.6586
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: D7VWpeqKzw6sSGLzi5ZJtzPSieusahxx4kYEBIoN+vUUx1tiUGjHnBrFUPcFKY2vEJCwVuInsTxLZEKristNyQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10674

From: Peng Fan <peng.fan@nxp.com>

Use guard and scoped_guard for con_mutex to simplify code.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/mailbox/mailbox.c | 61 ++++++++++++++++++++---------------------------
 1 file changed, 26 insertions(+), 35 deletions(-)

diff --git a/drivers/mailbox/mailbox.c b/drivers/mailbox/mailbox.c
index 3c3bdf278b8e729f494b0e61c008b63dbc4f9344..0d2f3ab79189731974a58bf7b90a60c972f7261f 100644
--- a/drivers/mailbox/mailbox.c
+++ b/drivers/mailbox/mailbox.c
@@ -6,6 +6,7 @@
  * Author: Jassi Brar <jassisinghbrar@gmail.com>
  */
 
+#include <linux/cleanup.h>
 #include <linux/delay.h>
 #include <linux/device.h>
 #include <linux/err.h>
@@ -370,13 +371,9 @@ static int __mbox_bind_client(struct mbox_chan *chan, struct mbox_client *cl)
  */
 int mbox_bind_client(struct mbox_chan *chan, struct mbox_client *cl)
 {
-	int ret;
-
-	mutex_lock(&con_mutex);
-	ret = __mbox_bind_client(chan, cl);
-	mutex_unlock(&con_mutex);
+	guard(mutex)(&con_mutex);
 
-	return ret;
+	return __mbox_bind_client(chan, cl);
 }
 EXPORT_SYMBOL_GPL(mbox_bind_client);
 
@@ -417,28 +414,25 @@ struct mbox_chan *mbox_request_channel(struct mbox_client *cl, int index)
 		return ERR_PTR(ret);
 	}
 
-	mutex_lock(&con_mutex);
+	scoped_guard(mutex, &con_mutex) {
+		chan = ERR_PTR(-EPROBE_DEFER);
+		list_for_each_entry(mbox, &mbox_cons, node)
+			if (mbox->dev->of_node == spec.np) {
+				chan = mbox->of_xlate(mbox, &spec);
+				if (!IS_ERR(chan))
+					break;
+			}
 
-	chan = ERR_PTR(-EPROBE_DEFER);
-	list_for_each_entry(mbox, &mbox_cons, node)
-		if (mbox->dev->of_node == spec.np) {
-			chan = mbox->of_xlate(mbox, &spec);
-			if (!IS_ERR(chan))
-				break;
-		}
+		of_node_put(spec.np);
 
-	of_node_put(spec.np);
+		if (IS_ERR(chan))
+			return chan;
 
-	if (IS_ERR(chan)) {
-		mutex_unlock(&con_mutex);
-		return chan;
+		ret = __mbox_bind_client(chan, cl);
+		if (ret)
+			chan = ERR_PTR(ret);
 	}
 
-	ret = __mbox_bind_client(chan, cl);
-	if (ret)
-		chan = ERR_PTR(ret);
-
-	mutex_unlock(&con_mutex);
 	return chan;
 }
 EXPORT_SYMBOL_GPL(mbox_request_channel);
@@ -547,9 +541,8 @@ int mbox_controller_register(struct mbox_controller *mbox)
 	if (!mbox->of_xlate)
 		mbox->of_xlate = of_mbox_index_xlate;
 
-	mutex_lock(&con_mutex);
-	list_add_tail(&mbox->node, &mbox_cons);
-	mutex_unlock(&con_mutex);
+	scoped_guard(mutex, &con_mutex)
+		list_add_tail(&mbox->node, &mbox_cons);
 
 	return 0;
 }
@@ -566,17 +559,15 @@ void mbox_controller_unregister(struct mbox_controller *mbox)
 	if (!mbox)
 		return;
 
-	mutex_lock(&con_mutex);
-
-	list_del(&mbox->node);
+	scoped_guard(mutex, &con_mutex) {
+		list_del(&mbox->node);
 
-	for (i = 0; i < mbox->num_chans; i++)
-		mbox_free_channel(&mbox->chans[i]);
+		for (i = 0; i < mbox->num_chans; i++)
+			mbox_free_channel(&mbox->chans[i]);
 
-	if (mbox->txdone_poll)
-		hrtimer_cancel(&mbox->poll_hrt);
-
-	mutex_unlock(&con_mutex);
+		if (mbox->txdone_poll)
+			hrtimer_cancel(&mbox->poll_hrt);
+	}
 }
 EXPORT_SYMBOL_GPL(mbox_controller_unregister);
 

-- 
2.37.1

