Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2076.outbound.protection.outlook.com [40.107.20.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BA1915666D;
	Thu, 24 Apr 2025 00:42:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745455331; cv=fail; b=CfwuhS9FpoOta+t1HrPl3wjSWrV5Hh7HfTkf857zWJ3gkfgEjfVb7oon6+bmHWjsotGYq4oluJj3HMMO08mS/T95QX4h6Pz2ajEozitcFpDGWpngLia5ke2RZ2NuF9lcXn1gX6Xqx6jpqxTIGwLxDVU9zgJTJoR1XgdQ1gj/T5Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745455331; c=relaxed/simple;
	bh=PhWPisi5kXMbu/rzWYSCgSjC9WxUbBLNSmNWpOAZeOg=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=kaZByUa4AirCOhoReQU7WaK0hdPRm4kgCAk6aFewNY17LJfW/OiCesmEwUj9sfJWzJQG479HyM+shrAbwnmX0lXZJHQ2PRMQec+spIiQJsJQHYxY/LnML0XTRZVEjAxayExEtWExUTOyXrsJadJe5nr8MakHGaE5Tgfy1eIoJDw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=MvnOS6BP; arc=fail smtp.client-ip=40.107.20.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="MvnOS6BP"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jKaJWdHO0Aq0nl4Skz/h2qcClKn9NsgPmAomyBPtiItmm3f41jU0+SCnEDFoIEqIdNfTMstJSzpNngxPPMTTh8dETW4hTGs8g/p87qPQsjV8V0a6ZYwEB0LF0VaMM/Prq2BlNatFU9mGQQg1l04KZzIg8AAmxH9UevZwR4e5Y5SoNJWoOjqy0I5xw19YYEEqUp2H43BfF5sE2FqPgijJpNx0qfrZeZurdBfc2XfCB4x4vh0TtsuiusNk5bdOF04c9aA5U9J7E61R4Nb84ngl0wbjaPtN66x7JfPexj0rSjTs3Z3AU8wdSRmcGe7HYIC8VP7HUONvll3im1MEzvOTqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xC2Co5X0e3KVOhGC4ejhkOlWBPt5DykyunDdFDHsSl4=;
 b=p/kBDeY9NAnmeOrmKFd9EBqYL12WD6+AilcUCJXIXnoilbziEqWMgdHKt5vVXbUo1Wa/TX+Ln0HYLRrI3hLdPeiPVZA1nILM0fPotayyrcN3rIMUdywe8UO0PL89b1uuFo7edHiVfnoJegVtzkwSjd+pz4uiEkal5hV/D4yd7Cic0MzakVkF1p1Q/DrKfGKfkFr38QuNnd7haDVJs3dkkV6usFKS/DVGZ+zws9S2fIS8viJlVefVhJg/JQgqkw9zGsvYaWHWqDaTJGIz+zlvBJ2/Cuq4rpnXFhNYa3qWHwI+kk1a5qbQXvtzxsctdvlwlR/N+AiXE6ByKkAcwUY1Hw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xC2Co5X0e3KVOhGC4ejhkOlWBPt5DykyunDdFDHsSl4=;
 b=MvnOS6BPeunQD1rGRAxUy2lxYeL3xM24JMi64QrSoPd1kYgLfjP4bWzrBBuR8yHgvBL1/sgwoQpip3bEhcNDR815jg89SETTtKj1buSJt4layjuxo6lXF1cwY+zbCKBWq2erG0G9Tqi4QMYCSZ1gnQBKkvXHDmJtxlSRMOVT/pTb579UwJqLTK2laWlpLuqsU3GlnRBmR03oDi/AaFYfELSvvRVQ27HGRx21KS7oKWKR7NsqusbUDsWeZ6WLU9djTJx14kbYfrWoim7GqoE8aF5aHxcH+lmq5ooXuu0d2RLo5vlhQXm1U+mFEbkmK9v9uqFWSW3Dm89xlJLLpo4DrA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by PAXPR04MB8605.eurprd04.prod.outlook.com (2603:10a6:102:218::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.23; Thu, 24 Apr
 2025 00:42:07 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%2]) with mapi id 15.20.8678.021; Thu, 24 Apr 2025
 00:42:06 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Wed, 23 Apr 2025 20:41:29 -0400
Subject: [PATCH v2 7/8] arm64: dts: imx8mq: add pcie0-ep node
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250423-imx8_pcie_ep_dts-v2-7-43c982d83a8f@nxp.com>
References: <20250423-imx8_pcie_ep_dts-v2-0-43c982d83a8f@nxp.com>
In-Reply-To: <20250423-imx8_pcie_ep_dts-v2-0-43c982d83a8f@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 hongxing.zhu@nxp.com, Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.13-dev-e586c
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745455301; l=1940;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=PhWPisi5kXMbu/rzWYSCgSjC9WxUbBLNSmNWpOAZeOg=;
 b=H4LBtnBOwlPHsa7BgdAs4dykci36/JAqmskEssjZEIALHMmjiEeYktbu1iepKKYM36SdGgqm2
 LFSvu6qHfJhAt4zGL2YAVtPDQRiKQhLHT5GBZDvyNWd3d+bRJOrtwKs
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: PH7P222CA0001.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:510:33a::14) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|PAXPR04MB8605:EE_
X-MS-Office365-Filtering-Correlation-Id: 15270085-d183-4147-0995-08dd82c8d6e7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|7416014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aUwzRFdWY3ZlZGMxUHVDcysxR2tTR1hsT3QxdDF0SnM4Tk42TW41ZXl6ZlFk?=
 =?utf-8?B?QzNwbnNZZjZVd0pnTjRPU05WN2NZWXpZQ3ZjYnM5OHA3ZHp5MElLalRwaFFm?=
 =?utf-8?B?VmpMaWZURC9yRW9oT1hiYm8rb2hNTExlK0NpRjZ3U2prVmppMDM3U3djMmlq?=
 =?utf-8?B?Z2NjS3BTdWNFWlh0bzU4YXc1NlFGNVA0YVBVb1k5eG0yL282dU1Wa2c0aEQw?=
 =?utf-8?B?S0UxTUFSNmlaL2lJdjR4dktXK253Q1NxUkMwbklUTFAycE5Ya1ltUUNwNmtm?=
 =?utf-8?B?SkRWYXFHdmQwZE9QbHhzTHZzRVIzMHB3M0phQVdmSitFUkNKYmZBL3lJYkQz?=
 =?utf-8?B?czM4V0hwYVg0NTFDTDhtTXk4eU5WQlFKWHpOQ213RzU5RWhLc3hBT2F4NW1M?=
 =?utf-8?B?MG1LL0dib2Z2NmF2ZkR0TEkwK0RTRExDYkkyZ2lMWXNRaXdyS1hLZkkyeFpa?=
 =?utf-8?B?SmNWOXJvOHlGQS9yTGVpaDRXM1d3c0xsRHlBY3R4NExaT28wc3lJeE9QVVlo?=
 =?utf-8?B?bVdTbUgyNGlKb2ViSFo0WHJ1NklnMWlUWk5Fa0xtblo2aDFOcFZKMWRXZmx5?=
 =?utf-8?B?UmNqWk5TQmE3ODMxcEJncnVHN24vVUdhZG5hVHJUQVpDZjhRa0lSam96VVE4?=
 =?utf-8?B?bGNQZ0dqcHBRcGFLN1lFaEJNaVZLVmt0WTN4N3FFL3paVjcra2tFZ3hKdEox?=
 =?utf-8?B?RUE0RnNCak16aEllRFpSV1VEdms5M2E2NjdSb2VFOE1kOW56NDRUWXFpL2Vp?=
 =?utf-8?B?QnRZdWtxaHhBNUdoWXJIZTZsVnJXQ3NwNGt6VkUwQktMSzJtSHNtN3VSNGkz?=
 =?utf-8?B?N0tCMUdUMUlQN3RKMVRuQnZDdXI0R1h3OFhWTWplK1FpSzJ1aVZDVjh4Lzd4?=
 =?utf-8?B?ZGdpMEc5VDluajFtVkNoeWJYckdaMzFmTCt5c2Jzd3BId01QR2VScll2MU1y?=
 =?utf-8?B?Q0FMaVVrRjZORHNvQWpSUEZXckZtbUdTajlPeGpsbVdDZXBDYXFYWFFjRWkv?=
 =?utf-8?B?QTcrUlpvOFdPMGNMeWpvU2plNjhpZmhKU2VJdVM2QzUzY2ZVdjhxbnIrNTVx?=
 =?utf-8?B?R1pLSVJsQzBzTHBLMGdFRkxNNXVUN2FtVWJYSUgwZi9KeDd0MGNHSjJ4RmMx?=
 =?utf-8?B?VHh4SjlTVHpJbmFTZ0QyWHNFak5hYVZsd2R6VDdvLzJXeWl3ZVlWOCsxRUlv?=
 =?utf-8?B?QUFvd2ZhL2NjcUNOVDQ0U29hclhDdGdtUlByY1pNMTQwaU9iY3huUjI2cDlZ?=
 =?utf-8?B?OGxoY2ZuWUt5aFlCUzlhdTVqNFV2Y0lIQ2YvZXdHOTNFeUtDSXlIUkJ2NFpM?=
 =?utf-8?B?UjNBWlQ5eVk2TWpTUk9Lbld6TS9zYjh4T1Z5dHkweXJlYndUbCtUT3NGNlZp?=
 =?utf-8?B?dkZhZ0lBRUhkamliYm1YK2xmQTR4ZzFiblFvNzlEa0t6TkFmcWFlOUMzcVl0?=
 =?utf-8?B?VHFEdWlDbHNVS1BrV1FOaUhMcURrYkVFT0dBaVVKbVhvbU10dlAvZTRYbEoz?=
 =?utf-8?B?UTJBcEc2akozSjUrRVQwdHNkc05kZE1WOXdWN1UzY2JRZjRYSGpZeHVUdCtj?=
 =?utf-8?B?amdVd00rVHk5OHlrOCtNa0FiejNzb25GdUF4eWhrQmorUTMwV3p1QkNHVzFJ?=
 =?utf-8?B?WHQxKytZSENac3V3N0VYQUpUZnY5WEdheEkyNmF1NU9ZbzJTdlZMNHhtY0Q1?=
 =?utf-8?B?ZGQ0VHFEc2s5bU5jNnE1OUJ5aW1HMTZiVG44QjVTa05xb2pXbWh5c01HVnJU?=
 =?utf-8?B?V0VvaFJLMEZiNWh1UFRwU0lrdDNvQkNUZnBSTzJLSXpnbkJid2JtODBNV2E0?=
 =?utf-8?B?MXBrcDJhWnFMNHF1OUx0aUlHM01yUmhkd3dkdllTVi81Z3EyZXV2b2ZzR3JV?=
 =?utf-8?B?c0FmaWZ4R3hWWHViRUdidWNkc2t5M0RFTlpBbjl3b09BOHdlQ1BpazR1eUtV?=
 =?utf-8?B?NFcvTEdycUZRQ3VHaWtqeVh1bW9tYkVkYUp2MHl2UUR3djBFTDEzcjhWSnZp?=
 =?utf-8?B?WTJTbmxxQW9nPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(7416014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WkU4UDBCencxVDVZTzhuS3RWU3pSS0hBSHhxVXdJQmVNWlhieXI5czg0ZG1B?=
 =?utf-8?B?cENpUDBMWkZpL05jYVh6aURwL3UzbmM1SXFwb0pwenZITVFPQmxxbGx4QlVL?=
 =?utf-8?B?NDkxQS9yQ0U3dmVJVkpTN2F3TUVFMVFRVUtMOE5qN2d1Z3BPcU40NkpvbHZB?=
 =?utf-8?B?MGlVdXlIRDJlcUpsT0I2RkZSK0RwYnQzN0hPNTErTlM1WldVRDFtMXUxWWww?=
 =?utf-8?B?MG53bk5mNGl2bDFzSEt4K3lSbUtzUGxkMmNCM2pBRlMzWGZ0TDFzMnZvallo?=
 =?utf-8?B?TU5tclFVZmhQQ0psUnFPMm5NQ3B5MjlmQTNQdnRJRUg2SElFM0xPNlpQMldM?=
 =?utf-8?B?Vk92RW8vc243alpCRnNGVEsrT1JTSDZXaCtsdmRKcjRodEFYMzdjMmNiWUl2?=
 =?utf-8?B?OG1YMUwzcjRqSEExakJqL1VjbkExV2dTaTFSK0o2N1VGY3BiNDdZdnRiblRs?=
 =?utf-8?B?UWFRdUZuTVpaQ29BL3VpS1kyMHFmWVZRMDdGd1JDZ2RhOVdmNkhaNmFQMlU2?=
 =?utf-8?B?cTlOZzBtOHdUL3NEY3lMVzhTamYvQlVhS0MrNS84NEZiaHhIa1ZLWW1iUng4?=
 =?utf-8?B?Zm82TmhCanp6empScS9hdTF1VU82SUNBSEs3S1Z2dmRwZXovR0l4SFErY05O?=
 =?utf-8?B?MlkrR0N0TFVWZmJjK2lIdHdsWUJ3S3R2enhxdlM2MGdob1RrU0sweWFmTVA3?=
 =?utf-8?B?Qy8ydTAyMEg4bXJzbDdWT2xxK3lNbENPZFBSTHUrZnhNaHpuMXhrd3prOFR2?=
 =?utf-8?B?c0p6YnIySDMzd21Ca3N6R0ZWcm9mOVlWcmIybFF1c2lsbHN6N1FYQ2pQRGdX?=
 =?utf-8?B?SklWK3ZqSlN5OEtWOEZXVTdZUXgxQU5ZY0luamIwSm0ydDE1alZ2SzN1aGUv?=
 =?utf-8?B?c0diZjRRRXRzeFpCSGQwMlBnOXpaMXZnZlVCblVjMk5rT1Z6M2c0cCsxaGtR?=
 =?utf-8?B?ZTViQzlLK1NDemVpcG80aEtHZ0pidDltYnFtcW5lb0RzZ0RJMllnRHpkbTlw?=
 =?utf-8?B?QlRTd1FBeXVBOHo5NGZPaDMycVpDVFlsRERTcjZqaWtCTlA5UkxjVVFoNVJr?=
 =?utf-8?B?MGRLZGRxSVdjc0xza3NzRlZJYWN2V2xPYlRubkUwdE9iOGczekNNL2NpZjd5?=
 =?utf-8?B?ZDBNUlFiSFJMRjh4WUl1MXlHcXc5bEQ2bWppQ3F4cmwvWWZmM3pGd2hNbDZj?=
 =?utf-8?B?Z1JUVmVib3dxckJLQnVyS2R2QWdITU5aa1p5YUxNQysxWEErOVRXVW1hYWh0?=
 =?utf-8?B?KzNOVVRzN0RBYU5CODJhY3pqVkI5ZmZvOVZTa3RaNlE4ZU9hdTNEdTdJeEZH?=
 =?utf-8?B?L1RObVpxbS9heVBGT2lqVUR2MnQwdGxRSnhKdXRVZzFsSlVvdTY4cW1mM0V0?=
 =?utf-8?B?dWErdFpsUkNSSFp3OUdvS0hDU3ZwMVZWaDJkZm02RlF0V2JCYk5YWUEwVDZa?=
 =?utf-8?B?MHdUZTh3cFpqMnpCYmhvRXJMZWF6SkNlbTNLZGdXOUZTRU9kWnl4Sm5hM0tY?=
 =?utf-8?B?MVU4cllmSTY0SnZFd29EaU8zZlVoTElCRytnWGl1cjFxS2t3UTlJTVprMng0?=
 =?utf-8?B?RU10Zm14ZTdZUE14dzZkbExaS0wyNzVoTlFSU2prTWlaaHRvT2hmSVE5cVN2?=
 =?utf-8?B?Y1hFK3ByS1o1NlFUaVB6ekEydWwxUmYyRDFiUmJscEZsQjhDVnZGS3o0Qm5M?=
 =?utf-8?B?MjlvbmV4NVRRaE1XMFJTVldieDNoS1ZETlFXd2c0YVJoVlBOcVZuMFh5K0la?=
 =?utf-8?B?ekN6RUtwZ3luWUNzNklnSU4ydTFXWFhCTzFLZEtQWWVZYW5ncWZMVE1tWDA1?=
 =?utf-8?B?eThnWFNvUW9kSVVhaU5QNk9jNjVaWjRVbU5MVWNZdkFsaG1kcHlMTXNLcXZP?=
 =?utf-8?B?WE5yWDRXUzlrdXp6ZXN6c1NQUnNodWlQSSsxdHdsaWg5eXg1bElqTjdYcWVD?=
 =?utf-8?B?anlkZXJycnhBQjY4cXFEWExUamN2RUtVaUVFeS9sZGZhQTNTSHFnUHZ5WG5Z?=
 =?utf-8?B?bjAyMVRyeE16Z2VCYjk0bVNFN2p6R2RYSGp5enQ3eWNtK2dmRUtjeGNQaUpq?=
 =?utf-8?B?NFIrTFRMemt3YktqcEdhZWVYVFJjTHNTdUNLa3VnYjBkbzZXNSs3aFBjbXdF?=
 =?utf-8?Q?6824=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 15270085-d183-4147-0995-08dd82c8d6e7
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2025 00:42:06.8888
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NK5xf6SzDHAnIdaTkQ1lbCu5pbkrisju0nRwMSMDs2qx34BF1O8n850K8Ku8zMqhWEps0guWRNrSHojiFM8gvQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8605

Add pcie0-ep node for i.MX8QM.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8mq.dtsi | 35 +++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mq.dtsi b/arch/arm64/boot/dts/freescale/imx8mq.dtsi
index 07925b387677b..c9040d1131a80 100644
--- a/arch/arm64/boot/dts/freescale/imx8mq.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mq.dtsi
@@ -1770,6 +1770,41 @@ pcie0: pcie@33800000 {
 			status = "disabled";
 		};
 
+		pcie0_ep: pcie-ep@33800000 {
+			compatible = "fsl,imx8mq-pcie-ep";
+			reg = <0x33800000 0x100000>,
+			      <0x18000000 0x8000000>,
+			      <0x33900000 0x100000>,
+			      <0x33b00000 0x100000>;
+			reg-names = "dbi", "addr_space", "dbi2", "atu";
+			num-lanes = <1>;
+			interrupts = <GIC_SPI 127 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "dma";
+			linux,pci-domain = <0>;
+			clocks = <&clk IMX8MQ_CLK_PCIE2_ROOT>,
+				 <&clk IMX8MQ_CLK_PCIE2_PHY>,
+				 <&clk IMX8MQ_CLK_PCIE2_PHY>,
+				 <&clk IMX8MQ_CLK_PCIE2_AUX>;
+			clock-names = "pcie", "pcie_bus", "pcie_phy", "pcie_aux";
+			power-domains = <&pgc_pcie>;
+			resets = <&src IMX8MQ_RESET_PCIEPHY2>,
+				 <&src IMX8MQ_RESET_PCIE2_CTRL_APPS_EN>,
+				 <&src IMX8MQ_RESET_PCIE2_CTRL_APPS_TURNOFF>;
+			reset-names = "pciephy", "apps", "turnoff";
+			assigned-clocks = <&clk IMX8MQ_CLK_PCIE2_CTRL>,
+					  <&clk IMX8MQ_CLK_PCIE2_PHY>,
+					  <&clk IMX8MQ_CLK_PCIE2_AUX>;
+			assigned-clock-parents = <&clk IMX8MQ_SYS2_PLL_250M>,
+						 <&clk IMX8MQ_SYS2_PLL_100M>,
+						 <&clk IMX8MQ_SYS1_PLL_80M>;
+			assigned-clock-rates = <250000000>, <100000000>,
+					       <10000000>;
+			num-ib-windows = <4>;
+			num-ob-windows = <4>;
+			fsl,max-link-speed = <2>;
+			status = "disabled";
+		};
+
 		pcie1: pcie@33c00000 {
 			compatible = "fsl,imx8mq-pcie";
 			reg = <0x33c00000 0x400000>,

-- 
2.34.1

