Received: from EUR03-AM7-obe.outbound.protection.outlook.com (mail-am7eur03on2054.outbound.protection.outlook.com [40.107.105.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 662303D69;
	Fri, 16 May 2025 03:15:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.105.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747365318; cv=fail; b=kN/IZU0sHyC0pz3FXfMxLgUr9DEBEmnwIqQu0XOStsguUVn7jT6oWkMJzABpernyF+Zq0vp+jMx4d0B+bBTK0A+vFmciTqG2KaPQ62e0Sz3r4PxhTdjAc6y9RzrO3KVWWs22L2uyiSfKSxg8JOC5KeWIi3d7uMj9wfvBfmb7OeA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747365318; c=relaxed/simple;
	bh=/tGH5fTanNsi+wktD0Y3HyJhMjqLpC9LMrRT5bzSs5w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=TjgrC/gfLokQB1aIlM4ANCx4uTRXZ7x56LMewCgkrHrNiKym60Y+1+nml8FyG9t5zMvVTj29oMv1QNgRDtmLGQYJHY2BaesnwMzoUzfBN0rCeNiw5Mk4lkLyJLJO1A9EdR3OXMQkAu5pnA8yoGBNnTWKYYdh4HEP2ZztrrZQXM4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=UA7e6r7Z; arc=fail smtp.client-ip=40.107.105.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="UA7e6r7Z"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WPvTPCFFMnE7bJMuNZlk+ixIa5WY3RXo7snn8YaINRkdTAzBoybAO/Td4raZlaY1cn5f3gSQiLcSerIPRhC3peP3LKr6jEf+D7QY3MDUJF8S2AkDIgRyRjj7hAxzrF3vxyT65TkwFn+I5cSJa4PuFTCTFx38PqDZg2JyoPZruTyqvj/DuXyKp+H4wt9KjsipfPe2c3vP5EtP3VexCkeBFSvgE9zC0eDWEUTF9EC1+egW0MJ4TtBAFQSuGSyDPB5nKqGYvV/MX3DTlqdVvSfRR821ed1rqTW93o6nirb/RaOyAtaonjIxj3D3/ZwMB6VxXElgGTnKUDFi2LKCrhQ+AQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/tGH5fTanNsi+wktD0Y3HyJhMjqLpC9LMrRT5bzSs5w=;
 b=dVVp4pY2kH5rF3k3YZYjg3J5qwJFLVTet7WCb+59FLN4n5yxdnDYPdU9puyf3V+sER0SOYXMqruciSKfh25yx3FCPkLKpLj4V3jh2z20ebxXJJllVYTQK4Z8mMzLl/T0c/ZbHnkBUanFFB2LI+JytxA1GzElnSmrZkzj+Acn27+DdG5eHHvrCHNzKKtfCJ3LDfKFus5ko+jIUuygo8xfmnZrTTI3q7shis58sqzPCud3rmPZCzl+B0mb5w5m77o8unmmtIF/RmDAjzs4Vj50gyUqTjWI3hHnMHywD2eCUde4I0/gNTOanpmEbcBa6/nY5t9+wZIsD82NDWuq/z/JZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/tGH5fTanNsi+wktD0Y3HyJhMjqLpC9LMrRT5bzSs5w=;
 b=UA7e6r7Z7JIy9psDQrPxUkazDRXCv/H06TQObKGewZuBHH5cfUmcO7ogCujYR9K7PQ6sHENGSyQAmBH7N1FyvBJWe/Q2J3yZXvLBi/YvlrNvXLxvPoXkS8MFsk9DZuy4acg6+55w2gGGaHJJ4BlYWvxBqYcQEciUAnRvgtmzGGzuuN30PZfSjCYd+OyPOI77wWAvXt/BXjB+7LbkaEArI32Nj29g9NVB/5BuFgNNVqE42DO7Ox4rct7kkYuCIaweKWjl+09cA6UwU99OKU4tJYqW7H2DHwZpC5woN1ju3x75ajVR6wxON14QHt+r2U+aKCU8JlMBvQuMsx2XI1L1nA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by VI2PR04MB10114.eurprd04.prod.outlook.com (2603:10a6:800:22d::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.33; Fri, 16 May
 2025 03:14:37 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.8722.031; Fri, 16 May 2025
 03:14:37 +0000
Date: Fri, 16 May 2025 12:24:03 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: linux-kernel@vger.kernel.org, Simon Holesch <simon.holesch@bshg.com>,
	Karthikdatt Anantharamrao <karthikdatt.anantharamrao@in.bosch.com>,
	michael@amarulasolutions.com, linux-amarula@amarulasolutions.com,
	Wolfgang Birkner <wolfgang.birkner@bshg.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 5/9] arm64: dts: imx8mn-bsh-smm-s2-common: Pull Up
 Console UART pins
Message-ID: <20250516042403.GG28759@nxa18884-linux>
References: <20250514082507.1983849-1-dario.binacchi@amarulasolutions.com>
 <20250514082507.1983849-6-dario.binacchi@amarulasolutions.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250514082507.1983849-6-dario.binacchi@amarulasolutions.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: SI2PR01CA0021.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::19) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|VI2PR04MB10114:EE_
X-MS-Office365-Filtering-Correlation-Id: 952e7072-aa6b-4453-c7b2-08dd9427c9eb
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|7416014|52116014|1800799024|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?aWjS2a8Unss59W2A5fo8GkVfg6Ay5h1xQOJs/FV/OUl8xynjpTla7dwN1P3y?=
 =?us-ascii?Q?0sqhzbK6gn19Hj1XBZeJk83LBQ3LbhFF6P8rSUT6C7Cl532M9DjNFFmWKsLy?=
 =?us-ascii?Q?BJiDvfms+de3u3v8y4m7WprBlFifD2IASpb3YKRiU4D1b+KrKwTo7LVjwI+E?=
 =?us-ascii?Q?a4CzfWsAYQRS1TLQVzcGfQ3AEA2a5wq3iRd3fHtSKkaPPEirCvxBPyX8nVHm?=
 =?us-ascii?Q?akbe7H0vckGqzSz3viAbXHPtm0ucZvonx/D7PKPQH6MgnCwSQlybfPtt6dJT?=
 =?us-ascii?Q?lr77qh/jTmbhJcy67aNsyCMYKgHYfPBNgDIZ6y8P2ApCJ7fwrcCjCarJYgwf?=
 =?us-ascii?Q?5QCMlNQ0zgs2nnZdP1WtXtbe04CDPFSCtQPX65tyXTzxq4zD3l3wss1vgH/M?=
 =?us-ascii?Q?a71GhyXwtY2tBxxyYwGNpFiAGgo5S53x0IgSQZaaHc+hlo5R9KZcU8gdchgA?=
 =?us-ascii?Q?RNGAntSOiegUPn9Yy8hdeKTq6tn++aleTwWu6XqI3iPObPLnJ4INyCgbxXWE?=
 =?us-ascii?Q?ABw9Ej7kzogHbx12x+lg+qOP1yyvgXruLIELBbaaLcY7m1EAxzj+BR7KKqvx?=
 =?us-ascii?Q?VexkRJyYg4wO6FogN5XCn2GB4vJiMejl+kEmJptE+F5On3w8yfp0C1N6+LUC?=
 =?us-ascii?Q?Ljtyw6VP3OlU7CrkFEmJFTqa+Q8lEAINDju/yjABkvjclxDmZi9MKb+8i21B?=
 =?us-ascii?Q?+Mef6ZKgUQF8iEohh0rGt2dF0BpOsgfYAd4PtSJO4iJp8DDT0wO1SalhFNXa?=
 =?us-ascii?Q?KAyicchY3hEBh1ZOCdYFu2+l1ldSz8TpWNA5xl+QzLN5xiUbQX1ItHUs2Qa1?=
 =?us-ascii?Q?9n+HVfhZUOdaRrL8JO+ghC5IQ6Hz9X82HhW/eN1CtCGrdypQ4ed4JpjtsF8h?=
 =?us-ascii?Q?jxE82bBvDNbvLDTKfhw0I70IaoKWk/ByYqmR8zvUHWptv0sWDwkikpkfxthd?=
 =?us-ascii?Q?OTTW7rTiZh3vXYlmnAtCqihimiLKkEc64LMsepvF/xeajjyCY5mp1xW6XZor?=
 =?us-ascii?Q?vDBYcw1JC+Rhy3uSIvztzXbYOn0DfxcjXdS+U6d3k/XLNVx1bzNNuYA8PIaC?=
 =?us-ascii?Q?JVpF13dnqwougicPf36sIZo5eQe4suNMFozGnxrGlJ1BJHNE6pK0o93p9j9R?=
 =?us-ascii?Q?ZdNH2AF4lI+joAy393SisMhSqf4ZGw69T/0GmV07M+5xXwcb+EQsS9Mu+cBj?=
 =?us-ascii?Q?wyCYdhB3sOYsE6u8rMeWeWjTOC5WgzpCOpWlLa0rUUfETk4Bih8z6jWC5YhJ?=
 =?us-ascii?Q?Obe6Uc+UbZ/CN6SGL5GbQI/8qxor8uaJlE6BHq/HNqWp2ebdAv37R8EDRl0T?=
 =?us-ascii?Q?kFXAh/+5Vg6NwCuYuExNYL1ci/Wwiyd/wE+YcKlo9m5VtVidRwIYaNcS5qVz?=
 =?us-ascii?Q?+nGejddX1bUKyWuuqT8ir2mAzKiyCbC3JcEgk5+AScicUsIJxY1xcgJHk9MJ?=
 =?us-ascii?Q?jx6s+M2o6ayUjIIR58CsdaoFGE6Y3FOuP4T/UadsnHb9nWGdeblqXw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(52116014)(1800799024)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Erq7OcMbPZ4rgnJ4gxZTWa2Zj5kMBeeFk3tSmvAkoQeukn9e/iA2gJLBnDZj?=
 =?us-ascii?Q?VAqoshmaTGanrXM7wPTQ28LLcFQtYrhfsG38H2tJIyaILPsrtjC5moVm6rOG?=
 =?us-ascii?Q?GCNpYZ/CWmTh20uGQ5j5avKgao/y/BXHIgoH8eJxiDAeeiG5VYko7fDcsgzT?=
 =?us-ascii?Q?wVXBAV29RTcrxohf1gu0NFJlaVm7zt2dyRW44mtsaF/LVBILJ6ng8GKcoBpb?=
 =?us-ascii?Q?bl/XTmbPiOz43i8XoJD13lMxGii3n5LjBobz14SnWs3muNLyl5kcOQD8QkzK?=
 =?us-ascii?Q?fUDe+ekBaDp1Xkt9ncnWT8DL1ekCUGjnhMRTs1R1jxYTJkGlwqBl/M6M7jvk?=
 =?us-ascii?Q?ReumIQJljB93MGCQAUJi6wQl5i8aoh8Dn+SRLNGdjYL/0P9HMVNV4PLc1QR/?=
 =?us-ascii?Q?K2RLFlCONGJGToGuVqMk/raSBY470Zx8lpvFPpvM9FfzkYb9RiLhV/I/BAuV?=
 =?us-ascii?Q?xAX86enpJDYQH7fcm+ALcPVwfAWVn9Q8mvs9bVNx+gzJb6CFwuarELhlOWIh?=
 =?us-ascii?Q?Ebf4zMjGbBVVHIo0nhr5bJvAKUNRAoyY/1kBK7mohuCVojDfWqFCf/571MTl?=
 =?us-ascii?Q?oRd+5yoKx2X5gUqvvIJLnzLS7RlImoTqTZshhiknmLQ28+Etjiq1/8yTN+Cp?=
 =?us-ascii?Q?FQte9FJzq5Sx2l5suU/70A3r80YgFlNVLcEIwr0CysYN94LyXztYAJdrMtT/?=
 =?us-ascii?Q?sFFs4sdbiCaZZeuQ0haQTn1MWoqh7FYxoHKT21oSbSrmcWwFLhMBIEnHuzUm?=
 =?us-ascii?Q?uFQDdYTgeKhzQgXQndviV+oYhYMQAHfe5f113mxBzt76g1zanLS0nJa77/GJ?=
 =?us-ascii?Q?SC2cQJE3Wn8za5uV8SPHjyVjaZYtm1WVb1ZWmjLGxmMvkmy3VOG2tel5tAlq?=
 =?us-ascii?Q?sGcrFikOZ3vdVn8g4PATruMtrxYh7JpSlw1U6ECGigfRgW/He0ONBfIYlo5Y?=
 =?us-ascii?Q?8vk8JTEvpCTPBC8pImt3l/iTWAEgd41u5JxsMz5LtLbF3324TMbJYvUVnajC?=
 =?us-ascii?Q?QecOfVmKInlSxMScx4uwhGKQVEK62+GULBX5A6cAe74xTaX/6fSnfNgofIng?=
 =?us-ascii?Q?gYD0Qa+iPpcrJeHyWMJH6r2IbYVcdominicV1mBAzRUU3r3gY8ioIXoGs2Wp?=
 =?us-ascii?Q?Zv5j+QzhNpAkLuqOMcrHa0qOmr9g6fsN7RzEmSIJ2dZ5937VwD3cc6uZMjp/?=
 =?us-ascii?Q?3qNjj40SBCHoHUs8NKI6corag0makkmbaHWLOF2pVoHCPjr+oXE8hi8EVYSm?=
 =?us-ascii?Q?hdb7Z0e2Tu/kejchw2I31hi70ClS+2vlwolkjECP1PCgfeJDJ1M1DywFlTLZ?=
 =?us-ascii?Q?ZNEjAICwmaRD4XUIGtl8/9guPM7CiKxyko380s/tsjFTZFawAtKfRoO+z7ve?=
 =?us-ascii?Q?SEpMoHYz46r/ZYVhQbCGYZr89nGBN1Ni/+lzEcmPaDuKKcxtvwUq04W1wkDj?=
 =?us-ascii?Q?iYY9OI03V8Yw6DUbATnqI01l0yFhyMiA/6SSJQ02lELvSN9EXkz5FrdEbLbB?=
 =?us-ascii?Q?Fl1zzo0X0K1m3Ysh+gC8+u6AmWuE+HruF1Klkl6tBRBP62TUXAK/SYSQRQZC?=
 =?us-ascii?Q?QBYqORq8OA4WWe7g8NVWfR0rWEXcl5FNM94EzMvN?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 952e7072-aa6b-4453-c7b2-08dd9427c9eb
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2025 03:14:37.0279
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QMVOt2pjCQs/vLAdCfLVmsE4uIUeNiFEZMXFfJKz3h2gL3GBphch+bs1PQh/4fdBpUQT76TzvLWObErEieC6Og==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB10114

On Wed, May 14, 2025 at 10:24:59AM +0200, Dario Binacchi wrote:
>From: Simon Holesch <simon.holesch@bshg.com>
>
>The UART pins are floating, if nothing is connected. This can trigger a
>Magic SysRq (e.g. reset).
>
>Signed-off-by: Simon Holesch <simon.holesch@bshg.com>
>Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

Reviewed-by: Peng Fan <peng.fan@nxp.com>
