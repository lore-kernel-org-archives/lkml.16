Received: from EUR03-VI1-obe.outbound.protection.outlook.com (mail-vi1eur03on2057.outbound.protection.outlook.com [40.107.103.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7895F221D90;
	Wed,  5 Feb 2025 06:25:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.103.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738736757; cv=fail; b=QDe/4UYhRKoo2mqOAOB9iBkYtsf/31qw4a6PhylA2Fm0MUs58jp5OhSitypGluSyde/PcZLhZQ1uIFCmWKU2TH2Bq5bPNTCxiN+DYaW/pJS9Wg/+cbZtAHaNG0peA5YcltbDCjl0unYDPEdwI57GUfuxNE095h+cc0iEIe95v4o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738736757; c=relaxed/simple;
	bh=RjebZi1ycRE30UblWZBtKqU+3ht8e3joErEJ4McmHIE=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=NIoOLcf6iYswspK1vQ1ivMaw7ekK6ww4ILDsnhNpzxhfCix4EWlq+kx0bqcatbLFlhs4zE7VAjLVQ/Ovy3ratfbFeYSeHpKQQzszfS8XLwBJM8AlfHqrkIgMGU3dYzRWFFHq9JSACmSVhAh2qkjPw5phff7itdQF0ZxS9C7ABDw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=YjEnBr59; arc=fail smtp.client-ip=40.107.103.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="YjEnBr59"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MnBU4G7t/sc7j8rdVIcumXyM0LYMZSwKCSmYPJ0a7f9SHAKPw6jOOLdSWxEbVWlhD3xVmCTiXRIlqdsIRmbGiuHVgOFW4tccZmQIYMReSuE3x+1mmnqh9BcpCZzhG/aLVaXrt6SpOR5b2LXDPgHWJ8YlwTO2by6VI10qF1MVujiaMN9TK/YLpfvdRMenhtxz9XTiKmD6IcYbx4uvN/SJQmFQrAigaaPfqUm0HI4qjx0m8ghM6CaNXHQvCjJS7EzC5lUT+IbbFD3crBTgqhm7UEBFKNrk+IGMJo8B9eG9t9OMGkKv2fyN5fvTU5tVz6EiarYig9KvN2KNYhWvT9x/RA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XDtDw1dlGV88Oi2Gb9GE/H03Mn/7LQzpMzFarw3NcMs=;
 b=ZxOrc7nFXBaeVAaXbvUGoPLNISji7h3ZIhnRPCHikPnJcmb06iLFlDjbG9gmPOL0UQxdg7IhYjZ8IPLp8na7qPIL+flE8odBxaeBS+K6ffPlBIpK9bBY1zyg2mawsO47FM5y6R1kURV2WbJIKxIDyCswUdOr+xr+16NieRLl4tI8bOzBpKiv30hVzAhjdC4kTWAeKngjD1RB+70G2qnHjJjP7TlPAMNPg6wEYi0dblpqFdZZghEzf+ai03kH/Ri78KxUEKGCG6BY/m/x9mLomgb3/XxJ3xp7VTU6eN2lSg9a9Y6MDccRXb7PHkOcGhq1gz3nHgRA1Lq9oTkfJWLbjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XDtDw1dlGV88Oi2Gb9GE/H03Mn/7LQzpMzFarw3NcMs=;
 b=YjEnBr59nzFkOQf5FEwg9ubBaMtGqkoWW9tZGFnGpdl95wFKY84WOgJ3yh9eX1X1nu5bdRzf3M2d8X0YThYD8NAA1NIKLP10IV+Ynp3EyiTI0hYtSJgJOVWJ5YXdoaL5sxuOxfH1wMZWucQbRr4wqu52NuWRyRCvCzsIXnUbwEZkpIVy9hrvnGo3QF3PIFT2CQxI/yvhxLsW/ha68n/QCvSCp+7PurPdr6pIkwghHpcnedFwxKTyui33/ut9xEDc2Rcb+fPPMkmNiiT8JE0sd5Aqa9hCCt71p1ZoVOWYvJ1KjDiWUbKzmbjiu/juUXSarFCEi+8WtzKh3qaZbzhhFw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com (2603:10a6:208:191::20)
 by AM0PR04MB6787.eurprd04.prod.outlook.com (2603:10a6:208:18a::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.25; Wed, 5 Feb
 2025 06:25:51 +0000
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::7be0:296:768c:e891]) by AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::7be0:296:768c:e891%3]) with mapi id 15.20.8398.025; Wed, 5 Feb 2025
 06:25:50 +0000
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: shengjiu.wang@gmail.com
Subject: [PATCH] ASoC: dmic: Add DSD big endian format support
Date: Wed,  5 Feb 2025 14:24:44 +0800
Message-Id: <20250205062444.1694810-1-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.37.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR02CA0050.apcprd02.prod.outlook.com
 (2603:1096:4:196::11) To AM0PR04MB7044.eurprd04.prod.outlook.com
 (2603:10a6:208:191::20)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR04MB7044:EE_|AM0PR04MB6787:EE_
X-MS-Office365-Filtering-Correlation-Id: d76b69e2-d985-4a76-063a-08dd45adef6c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?cyITgqSqI5KdKaUYxT+J3LtKgHm/bdyK5LOLo5QhZZBwuvvHmQJDs0xM5m/2?=
 =?us-ascii?Q?DiubfEdCzpghM7qv9TRnmjU+zdUpC8VLoFmi/3oRSJHZyyxycZI0XzHMYxXZ?=
 =?us-ascii?Q?0w47fD48mAUV3SlYaQsePJhIIhFe1jphqxUe2vX1Bt1HHlCIBEKYD0cSye7R?=
 =?us-ascii?Q?Zc+umYfCCJFli9Nx7robx++YqZsE7L93fpvWT/gtDB4dzqoM40I6/8sLZJ1d?=
 =?us-ascii?Q?fpWYNZ89VFXjy+mU7fNgI9AlHm4e7KZ1UOWlyj0q29g4pHgbyHn9OeQw5JR9?=
 =?us-ascii?Q?uzPE0yjkvA/IvtU4q3q5z+bCSVEZG06JHmB69UUv73NScYyB66G2AQuJsGUo?=
 =?us-ascii?Q?Zzbuvdg+wC8tBjZjNQNHP8ka3oFXz+QTGsHVDYW1xZQl2UdMWNGmk5YkYoSq?=
 =?us-ascii?Q?US7OrT9m9xKuqTNe5hMMLc0JK+yjibpKEqdxalwS2p6c7B1RzHhzfvyhh78A?=
 =?us-ascii?Q?3j/C5SV1YqiyobOMIXN9L9ieBuEg/jvq51Rh+r2UoYAm8be/pn3oi/ny7O6+?=
 =?us-ascii?Q?z5LMfZC+oJ3yK8AYXJSez9LO6Edywrn93PEjym/njZCZTeu3V28OZYVKmzrH?=
 =?us-ascii?Q?oknKvJBt6FaFbp/V9grdHidochyoXjSpY5O98ij3oeEPUrj0zCY8sQW6iuZK?=
 =?us-ascii?Q?CxmL9xDjrwgkc1RED66LxG5XqcVrAleQ7Esnt0jgn+MTX/9imC7MmS0skL+D?=
 =?us-ascii?Q?oaNLhAT2Ap7cB5BY7pe2+dqBbI/xLxheyDEyK1wJuj6DX2Ps7MgpNqMHPHz5?=
 =?us-ascii?Q?ER7wz+byk5Vm4V75TA1GgJPkt7ihAi2TEO+d1pfiRwj2W4BYbmydZfn9KuOx?=
 =?us-ascii?Q?IvCGpjzOdz7s15qM1aMlPG0eLj4Q7j8gmqzHggsmrY7nyVqOFdX0GDMUV0z7?=
 =?us-ascii?Q?FSlO0HLlacfd7h09oiDXrduL9jMl0I7iN1BYMOnm6E1aZSzm8eVJ/0Uzsmim?=
 =?us-ascii?Q?sk5goUunKEgAM6tTgDcdIyaSjViRFRh4RPCUk9n3eux/3wwoQyj7RP32ohtQ?=
 =?us-ascii?Q?fXzd//YVELx4c3Ps4A+VFqH59gfFgZ4EstRQ3IZ70SiOP+nHoi3uo3ctq9C6?=
 =?us-ascii?Q?EPpUWOc84dFXcGPOmb3nwlMKjQuAc9AFkVrboQ+Amlfh20jkc+ekPQYIjZp8?=
 =?us-ascii?Q?RjZsaWkWikt/UeRKJppnyVfAZf9ulp1btDVgdnjraoFNWc7kdHJUbl86uO5H?=
 =?us-ascii?Q?HcJKWV6ntv9gJfBLeufyotkCseN2tStUudJGGI8/3nzPqeMrDOf+5gFmxY6+?=
 =?us-ascii?Q?K6zbQbrQ4z8hnJZRHdiByyWbY7mHjJrLLXWtqon/jDEQQtXKlALBv2qg83HD?=
 =?us-ascii?Q?/UYfVdbIe3QPgJihbNyG1JcahD466g2TqGY92KIV3JyE/cGtYlSLcVvvykwy?=
 =?us-ascii?Q?Mknsz4dn+37eIyoLsQnlQETMH+g3XOCRuddfvII6oLfg2kMjgn43E2fsK3Z1?=
 =?us-ascii?Q?T5iUKvxepW5YczbPY363tB2P/t/Xzwls?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB7044.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?iY+tBPRjK1Hiu3Vp5bQN6VJiwHYuVRyJ/zljQP+tgvVNCuauBIKRO6Rs5VTl?=
 =?us-ascii?Q?Hx2bc5bsS4oFAGiTwY2tQ8XkbiXoLD8DHwOg6Uq7TS42txBcolViPRm6YXAK?=
 =?us-ascii?Q?YEB/F4i+JK1YEorw8lHR25FwTJyGMChTBlwdQbk+yzEa5tBWTjqx+ZKRl57L?=
 =?us-ascii?Q?rGedMKMr0mR9o5t28LtHe/fpHQ1AwdLwh/jv0l36xp7I5dYxpNZynT0tBmQ1?=
 =?us-ascii?Q?+iqjQFwrNiW5dXV+rLlZYjGHymaGn1Kmoj71zf9GciPIkUwLF6a/+4tw3gSm?=
 =?us-ascii?Q?3mvlIG0ThX7qIw+dBa2AaAG0ZRuFgOpucKS3BEb1r9aSK8KbALoyCvlTEMJj?=
 =?us-ascii?Q?IEJ83J9nKuss9X/qNzwO7rl0xnHCgOktBfGULO1MsUaI8wxlUe8dHr3UxNtQ?=
 =?us-ascii?Q?/6t/E68DaQFlvML2hUrNavA7gUbD/CVlLePlI9Z5nWLYhcV2xhx/Aa9gVUJR?=
 =?us-ascii?Q?9R+2SXvLsSC7ZERuk8ky771QYb0st+g6QieKDhDci65ZVsOD3s30UrO/Pbod?=
 =?us-ascii?Q?uWwYmRlh6MmEetc3XxHGuV2DxHp99XIx1Wow0niF9QhN/b6PpOAHk5baXXB4?=
 =?us-ascii?Q?6RhD8YjPYtTUH4neFMkte+RzIOmFgzg6rUt7K/FpFP7xcgLfJBZO0QN4f16s?=
 =?us-ascii?Q?3J/s85y02U4UJYFmNCftnnhukgzs3uxlSBNqXBlhzL3mdUM2qrz9lHoliCEV?=
 =?us-ascii?Q?TfhGUFBSlu3E8/zAP0cOA6OebZ0CagTxJ4ZiHg8zUVh1DId7T/tZ4YV68rOZ?=
 =?us-ascii?Q?tpUgQJ9mfUfI5zsWL6oBEAjo323FcvLyUcWaiyWuvdySK4FMywrXOrNanni9?=
 =?us-ascii?Q?dR+mgoPIk3P7uBQJyJmhMGz+nuoMhitoVTO1Ne+xF2r+NmsR8pBkw2ChT7K0?=
 =?us-ascii?Q?b4TmLH+vk6VU/HcreXTljVTA9Icfn308aH/yzRH/yGYub0oijC1jYpkr2ple?=
 =?us-ascii?Q?5tnQ9sk2y4rkeyLreTvPX9yNt/rZOF92nDaYZWnSs4ayxiAmejqBx7Z+039n?=
 =?us-ascii?Q?lkHNQC6msJrqkqqOIsgqAWVJtx3yvcBV1Gfx+0lC+hgqoMZHrYHLsXOyBn5E?=
 =?us-ascii?Q?XLfSGPFWMcNoV7PjtaKgR0FZurPIHOCLxC6+sIDJfHGoh1itVr1TLHdxb3qp?=
 =?us-ascii?Q?bnHKmu7RqaM7l241ReBf2k0UZ023y+kwNJpMDoY2Sao77Bqu0TzFjRhWBW1H?=
 =?us-ascii?Q?/uvFAOT0bR28+Fd9olE7hiloa+aul7Mr3rXE+f6aZfoZOc0l/ydIL3eUj0jV?=
 =?us-ascii?Q?Vi3d9ki3re9zcM1ddCF9EfEwk/wmYKySq3NqvI/SvlnV38e2Di2Sda1gcpHX?=
 =?us-ascii?Q?/QGIety7hQto1uLtfNC+FdLr82v2Xm1HHygIUttbuNkOyKXwo8CValegKm19?=
 =?us-ascii?Q?4Q6n/+29DioekaJp/9t4CHC6vUQaCkzpg04oP90HgYLHQ58NVINbtW39YRl+?=
 =?us-ascii?Q?oHIV9JEN7T/k1DaKbEFiE8H71kEEWBVIiEQMxiTK6gh8TO8DaR4MOxiDjne+?=
 =?us-ascii?Q?nQpoMwDWZ27TmIL8/qWLv++gitk7eXZ5YvdPLOK7741QnKThZq8+OVrHmCVb?=
 =?us-ascii?Q?jEZOaFD1XfWaNV7t8Wpng6SVHJu2ohDW8BXh9GAU?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d76b69e2-d985-4a76-063a-08dd45adef6c
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB7044.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2025 06:25:50.8281
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OFLKvbOcFMsbKzwTvFt73+agFFT+iznwMeKMP5KBMk39JlHCewnF0zID+Z7oYtBf6HzPc2DPyDbOlzReyvOJBA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6787

Add DSD big endian format support in this generic dmic driver:
DSD_U16_BE and DSD_U32_BE.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 sound/soc/codecs/dmic.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/dmic.c b/sound/soc/codecs/dmic.c
index 4fd6f97e5a49..0388f115470c 100644
--- a/sound/soc/codecs/dmic.c
+++ b/sound/soc/codecs/dmic.c
@@ -85,7 +85,9 @@ static struct snd_soc_dai_driver dmic_dai = {
 			| SNDRV_PCM_FMTBIT_S16_LE
 			| SNDRV_PCM_FMTBIT_DSD_U8
 			| SNDRV_PCM_FMTBIT_DSD_U16_LE
-			| SNDRV_PCM_FMTBIT_DSD_U32_LE,
+			| SNDRV_PCM_FMTBIT_DSD_U32_LE
+			| SNDRV_PCM_FMTBIT_DSD_U16_BE
+			| SNDRV_PCM_FMTBIT_DSD_U32_BE,
 	},
 	.ops    = &dmic_dai_ops,
 };
-- 
2.34.1

