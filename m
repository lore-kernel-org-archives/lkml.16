Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012017.outbound.protection.outlook.com [52.101.66.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 224E91DDA18;
	Mon,  7 Jul 2025 02:27:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751855224; cv=fail; b=mMMlQ23hVUPRZGd3XrZG9xLOCrLRNiU9WQhSwTfYpWsGf5zBJWi+O3HFDwR8Fj4pBvUMh36lAH8eYqKRw8M7HYMJQkx5O6rlL3O5S44x1naacxKeXVeSQDYBVcx14XlpA9SJotyZYpCEmj0qle+7ObHzIQ6xQ4bcD7I/TBfR+/E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751855224; c=relaxed/simple;
	bh=mGdWb5Es8MsiPrSwPfbd1t10sUUVu4HqZhONQato8YE=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=pByyx3ZPp30zFMGfZ8EtJmgLlhWsw4TyS3SExvAxNT2x8U/WXDNhmfsZ/bKK5XThK5HwA8Ibx9J82E5qYjUmyBnYmnQ8bzHzhrr273GSXskUjVunntdCcGllXrZo/gHZpkqsfLQztJmSXf7jnAtPgZz43kU2hDY8xSmWgWNW1rk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=F9OBWbun; arc=fail smtp.client-ip=52.101.66.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="F9OBWbun"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sbkf5ZpyxA4lqTyUVLdkMZ7RbcuuYiJ1HlNeS/fvDhhTOQoQFYwnNRhUh5QpBHyaUCMVN1AR9j9yVs1WQr8ELZj4r37MsCxU1MgPz0rDsUvij4FoQJd+5NJdrnagp/MrTIOSgilsGm55AdCtosyVns/RUmkiT8A3878F0JWd9BD9+gKQXZWVLTZewN16/7nwR7GYG2elevIUdyAlI3yd87ut91m7Wy+FEWsf2CEvmgA9vWmVcTLXgO7eNM4d9pwfH1GfkZ5w14Hd82VJhaIvoyUHFkJ6OHdMN59haJx6lhNqb0JSY0Wt5+49e53cO9gb1PASMcpx0gqNRW/VXP5iqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wSNfqOmUGiv4YH7fcvUikevB3BNYCgt1Yw4NdmCGeCc=;
 b=fcgBudO+Bl5ipKlsz9uXIucHlaflkPqOT7kHnMWjU0f7/tWATFUvXj6cz88GHPpIWnjfDGQYcDAOVqlSaDXcOhlIUINX53J+ingX72yz34R0xlrdbpAuQ6PfOtLn9+S9SzW8jEql7FLzqxsgbkFRHFMk08F1tOnlyIBEj0IdkvolEKEZh94uFZ4R+ZI8hbqDKcXFZf2NuBPabJb4kLXE3qASxWJ62VTr2OBDybZ1Qso2XJfjnyOyrt6bVtUItfUKz09cQ96yNbY4Nj7i4koGt0cqPnU2JZxPqBKl70W8sWaDF8pFKOBPLQxoBO4S2ZvnIdBYw5xW7qDAa+r17MA+4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wSNfqOmUGiv4YH7fcvUikevB3BNYCgt1Yw4NdmCGeCc=;
 b=F9OBWbun56u1hENlCMnMVUKh9z2WGqNpNjimwugugagDExbjezM1zImVob5cEFa98biW2x1UMU2T+zA89mXtVKAXymrzFMzPLoy3dGgK9ePfCLo2UXHQsPWS5LHlZCF6/Nq0D6gRf0Od6796M+VbaeISrN/P8adNYDJj2SyaVQB4+IQlaiFNFUHfvfRdbWmbRVl/OZejVxdC0c9R7ZCqQvjF3UClJagI3b+j/FlQK3orKThoNYECS6Qj/SS8oaYAHsl/rzVxiYQbmD3Nln9lygHLG7RGU5UmnLaf96wEPD68YwrODbYce5e4GHQdbVqFTVBIf2z3C8b4iIN+njb7Ug==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by GV1PR04MB9150.eurprd04.prod.outlook.com (2603:10a6:150:25::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.25; Mon, 7 Jul
 2025 02:26:59 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%7]) with mapi id 15.20.8901.021; Mon, 7 Jul 2025
 02:26:59 +0000
From: Peng Fan <peng.fan@nxp.com>
Date: Mon, 07 Jul 2025 10:24:40 +0800
Subject: [PATCH v3 4/6] clk: imx95-blk-ctl: Add clock for i.MX94
 LVDS/Display CSR
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250707-imx95-blk-ctl-7-1-v3-4-c1b676ec13be@nxp.com>
References: <20250707-imx95-blk-ctl-7-1-v3-0-c1b676ec13be@nxp.com>
In-Reply-To: <20250707-imx95-blk-ctl-7-1-v3-0-c1b676ec13be@nxp.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Abel Vesa <abelvesa@kernel.org>, 
 Frank Li <frank.li@nxp.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>, 
 Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751855088; l=3141;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=mGdWb5Es8MsiPrSwPfbd1t10sUUVu4HqZhONQato8YE=;
 b=nIwEuonZnxQwa4Dwr3gQcfmCANW2HRox53OnFbXI+S81Z6v1DjdpTAWldS55Iunb+cYgXOQtm
 BCaSkguu1bqB9u0I9eouHuRfOVJuRym8TwirEgEWuSPYYdY995JCusR
X-Developer-Key: i=peng.fan@nxp.com; a=ed25519;
 pk=I4sJg7atIT1g63H7bb5lDRGR2gJW14RKDD0wFL8TT1g=
X-ClientProxiedBy: MAXPR01CA0102.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:5d::20) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|GV1PR04MB9150:EE_
X-MS-Office365-Filtering-Correlation-Id: b121011b-468b-45a7-2f5c-08ddbcfdbff8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|7416014|52116014|19092799006|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RE16bmdia0NyL01rTjI1cFpsRENzcmx3RDhaeWREQkNZSXgxSUtGbVg4d1Vq?=
 =?utf-8?B?c0JLb2czM2k5SUM5c0ZZOHRhR3ZwMDk5QW54bW5GOHQxQVVLYVhFNURxbSsv?=
 =?utf-8?B?ZmhQaTkyZUt2dCs3M1JQcEdaZWFlWng5TEw1SHpuV0xIMTd4em4ydXdpTGU1?=
 =?utf-8?B?R3hCR3h4WGV1TEh2biswaTJhMzlvUkpKMTYxaWFmN3VFZERXQUE3UXR2bGFo?=
 =?utf-8?B?cG43enorZ3BESDdlRDUzdmZyb3FyMUhDeEVFK3dSM2hGd0phM0RESnlJVWwx?=
 =?utf-8?B?Sk5wNndzMUlvZ2hHa2ExTlFzOUdLelRBdTdTRWdOVlZyZmt4WGlDZUdvbEZa?=
 =?utf-8?B?Q2lmNzJHdWQ1R1V6T2xURDJVOWYvQzJCWVhCMEhRZEhOTVFKYWdGbnNIWEtP?=
 =?utf-8?B?ZkxTS0luQ210aG9jRXJYQlpVZUJqUVVvQ01CaDRJSE9mRmJ3VDFFRVh2Y2I0?=
 =?utf-8?B?Ym1vLzBnc0FBbTRRaVBQTW9rOUV6RENGd01zOXlVa0w1Y2ZxaXpTT0FBZ2tR?=
 =?utf-8?B?empoQkdML1RZOE1uYWd4MVFuNk5nTHFBSG44emlROW9WTVg0TGliYmpvSGE0?=
 =?utf-8?B?b29Gblhrd2EwNkRGdjdrUS9EYXNQQnp1cXJCZk4yZkMxUy9uTlVYZEx6ZVBr?=
 =?utf-8?B?Sks3aEljWk1jVkVNVzl3d3EwcFFrNWpYV2pHeHRqeUphRDNleGRWNTRzTGFj?=
 =?utf-8?B?T0pObWlOakNDM2xLNTBud2Y1bFk1bWVnRUtrVDhrZUtHeTNYSzJqREpjR0pZ?=
 =?utf-8?B?eDBkVEFsZXBLdjhnNHRFckFHMEdMSVhxSTNDWUppa1Z3ZmxuSC8wSElla2VU?=
 =?utf-8?B?b1dZL2xsbU5nY0RKWFhtaCtGQjVQTjRRSnc0OVhyZ3c2Z3NyUHh3YmZINVJt?=
 =?utf-8?B?WVZIeUNkb2M5K1RyN3ZJZHh5bzkvMkNHalNla3JZc2ovQldSc3NmNldCNkpn?=
 =?utf-8?B?dHRxQ004SkZIV3BGd014ajFLbnFjZG1sR0NEN0JpRGlHajgvNU9KSTFGZUtN?=
 =?utf-8?B?YVg5V2pOWkw3dXlFWUFRdHhkaExaZlRuTmp5alNrQ0dNWFQ2ZGk3ZWRsaDhK?=
 =?utf-8?B?dEppL0VtOTRrQ3lTd3c0bDZRd3I1Uy9nR3Zra0d0S3l5aStoWW03ZG50ODFY?=
 =?utf-8?B?VEoxbGpnK3pxNlZ3eTlRV1kzSHdySE9VUktPRGtSV3ZXOHQ1ZFNua2NiRVhu?=
 =?utf-8?B?RVJXbmJVVk0rSE1SRDVXYVNXYWR3NTZsWGV3N3FyMFVWN0xoZERkZ3JMb3pL?=
 =?utf-8?B?THliSkFKWGRQY21ZeXdwNTBkd2srVVNLblB4cTZGTzB0cjZTczJpejZhM2hi?=
 =?utf-8?B?MjQ5T2YvbXU4ejE2b282STloQUxnaE1FcnVzQ0VSY2ZsSFJ4N3NvSGxQZHFG?=
 =?utf-8?B?TVpBcVZxYXNFNlg5UTZoL21TbWM4M1RBTFQzZlhlZVhDLzFwQjJlSkMrcnpx?=
 =?utf-8?B?dE80cGgzRk43MVNjM2phU3c2YzVkamNTd0dLNDFrZHpqZ0tiNC92aHZQaVBV?=
 =?utf-8?B?citSR1ZHUG45SGdZTVZZTFVXSXFRVW1BWGJPeC9FMUFQL1l0QW9CQlNaS1VY?=
 =?utf-8?B?clV1RFRjVWxTckg1U1JXUW5kOThyYUVXdWtidnBOcmYxdEg0SmorczJtZ2VF?=
 =?utf-8?B?WGR0SnRxaG9RUCs2RjhiVVRET0RiOHphazZZWnhNUDJ1U2ZMZjM3M1hSaS9i?=
 =?utf-8?B?YnlzWVFwOVRnV3d0OG56M2c5Ry9TVXQyVDVEZlF3VlpPZ1pUQ3lVSVBUdHlw?=
 =?utf-8?B?andkT1pSYUdnVE5iOUtML29KYU14dzJyWENGeXcxN1pHNU9sZmc5QUVjUStN?=
 =?utf-8?B?Q0s1QjJUakdtOFcrVlhhTk5xZGdmeXVTMGFDNFlwMzJtM2NtbW45d3JmaWgv?=
 =?utf-8?B?NERqeml4TVZTVUVkUUJnempxclpmKzlhRUJqRHAxcHEwb2pra0ZCSDRtRDFW?=
 =?utf-8?B?QTNnNWkwMlRielA5OFhtM2FqNFdlSEE5QWU5bTU0TmhURnhUMHVqdStxdlgy?=
 =?utf-8?Q?Ef8aZEBe5IIRJktDPrE88UjScqkJ54=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(52116014)(19092799006)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?M3JLSDR6WVlZR1lBYUowWHJ0VFNaZE9YTDJibGdIeExVT3hRWUxWUUJxZ2NI?=
 =?utf-8?B?V2xISmcrRDl3ZUxxL1FBemxZY0RENHB3MVV5UUE0aWVRWUdwYk5tNzdqcWpS?=
 =?utf-8?B?N3loQUVKN1JhdGIxWmlrc3ZIbVN0bG9CTDBjUWY3TWpOUzZPSEtQNUF0Y0lk?=
 =?utf-8?B?Um5MY3Awa0EzeC9VR3FrYXpBaHNFR1hYWTBlc0NyNHhnSUZyVEloMDlMYlJV?=
 =?utf-8?B?Mnd0THY2OUJlMkJDK0tTd25iai9Cbm9pL3R1OFdVL3RZVWx1ZS9LVGFsdlV5?=
 =?utf-8?B?ZE55U2lHcUp6WmFQYUF2c2haT0lXcDJHVkFMZFpLNGUxZDdDc0dZaXhvSWVI?=
 =?utf-8?B?L3dTTnIvWUsrdmd4aEJlV0w1VzFNak5wbEF5Q1d5RlV1ZURVK1IrS3ZEVlFJ?=
 =?utf-8?B?MFlUMkNVYUQ3dG1XejZNTkxkcFZjOVc3d0JiSVFQSWtlT0M1cUNoZmpMendB?=
 =?utf-8?B?VER4N2ticU1ReEY0YllYMjlkaHpSMVZUNkhIZDlLdkRiekdwN09YQ1Q4ajN2?=
 =?utf-8?B?MG9taVBKeXUzcTFPTUoyT0ZHRVVCc1ZTT1VINUZJUXVYazVpN1d2aEd0MUkr?=
 =?utf-8?B?RWFPMzhVNWNoR2F6eXVPamNNUENUOWQ1ODdkekRsSFRRbk9WZXVscTlPZ0dF?=
 =?utf-8?B?YmU2QmsvcFVTeGd0L0IwZTNSMkIrUmpIeUFpUTZzOW5LQTRBekQybW9WV0g4?=
 =?utf-8?B?KzQ4S1R6TkFIVGlzNXhvRzRNZitOL0RmSWp6YWlGUEpESHJ5QU5sczM5K1Jk?=
 =?utf-8?B?M1FLSFVudThNeVhVVCtFdEpIaVVLczAvL2lmejFPOGFxdldCUWlieXVFTVNI?=
 =?utf-8?B?eW5iRjA1VlZIZUVUQ05KMGd6YVFCVU1JTEZtZ20yQnJMUVg2cUNCR1l1c1R2?=
 =?utf-8?B?S25BdjdLL3l1c0xxb3RMRVBsUjBmUk1mZTRkcnV0T3FNSHZ1QTFIb0UyOXJL?=
 =?utf-8?B?b1FMencyclZEOEx0NVdHc1FsTTVpQkdmWVd0RXgyMEFyek9CZWxWTmN5WTJo?=
 =?utf-8?B?VGMwVUM5dGxaRlluWXd6WkJrYSs1T3E3bzhRRDdLVXhaZUorSTZaTlE5Ujh0?=
 =?utf-8?B?RlFpdjNDd0diNy81bUJaK25kdmlkWVJXRFhEbGNvSFBrVTI3MklXT2FTOVVn?=
 =?utf-8?B?R0pvTU1lMVZ0QjdvckJLdVYxeGdyd2oyTG00MWZOL1hKMWdabmZaSVhQdnpC?=
 =?utf-8?B?WEdGVGhrTTIyOGpBZXo0MFVVekdwbmNxalJTVEdxZ1VRcHpmenBFdFdyakxL?=
 =?utf-8?B?cW5leWJHZE51MnAyU2g3b2NlbFNOZEJ3blc5RkxrUGdDb1BMdkxrRDZ5U2hs?=
 =?utf-8?B?VVVlM1plN1NLdkZ2ZGRJVjVBQnNybVZnZDl4aW1KR2NxMjF0ZmVmYTZMQlpY?=
 =?utf-8?B?VE1BYXhoZjM1ckM4K1hUNi9tcDI1Q216Rkg4QUhReVU4NDJObUhjTkxmL2FG?=
 =?utf-8?B?MjJ2aXkxa0NhQVg0NjFhTWY3dUdsWXA5VXFnQWtXY2dpYmlLTGx5T05HS3lQ?=
 =?utf-8?B?YnhhTEc4WjdxVFRqaGIwY2dBLzBIUUNVRnNETHcrOENvMmFscVVLZFA0Z1g3?=
 =?utf-8?B?RGc2anhqcWJHWGJwSzFiSmpFckpjbzJJczVPaFBoVlN6SjlZN1ZBQi83S1B1?=
 =?utf-8?B?aUtFZTAwVVltN1Y5WnRNVFgxWERzeC9DRnBTTXZ4WmtRWTB5YXVhdHQ3bHZ2?=
 =?utf-8?B?czdkUUgya0U2QjBhQy9YNmVHeC9SaTFtSlRsQkNjcHFIVHdzNUIzSlYxWnp5?=
 =?utf-8?B?WmlhSnpYTkh6MGd4WlNxVjVvVkdrUzZIL0FBZUszRU8yTkFqOVBtNmNmSjYz?=
 =?utf-8?B?ZHNRRmQrK0EzN2NkRDVyRk5SdUoxMHUxNVZBM2VmRzBLVnQ0YjVhTjI1OTlh?=
 =?utf-8?B?Z0Nqcm5KTlArN293aWRWM2xYNjZ6WVk4cURvVStEb2Q1cUlPNlVMMk84V3cw?=
 =?utf-8?B?T2ViNUhRVkdhYmRHRnFhK1l0emlibGNGdndMejF3cGFoT2pETUNmcHJVbVZn?=
 =?utf-8?B?V0pzZWpudk80Z3lUNEtKV2U5K0NkS1VWMUs1MlYzN2ROd1hPN3VmaVBqSlBK?=
 =?utf-8?B?SXg3cDlXZ1VoeU14VWs5dlNqQ0VaaHBnSE1XMm5PMFlueEw5dEx4TXFmazgw?=
 =?utf-8?Q?jWZHPRsM5fy398jqelVMTySpO?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b121011b-468b-45a7-2f5c-08ddbcfdbff8
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2025 02:26:59.1399
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wIRwa8z+ZTTOp9Cu6Q+7fIz5Utqk8uQ9shmNQ+zgC/sjjJqTnxp/+nJkd9B4XKHTvY9JRgYGp/Sr8IYo/ZJ37g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB9150

i.MX94 BLK CTL LVDS CSR's LVDS_PHY_CLOCK_CONTRL register controls the clock
gating logic of LVDS units. Display CSR's DISPLAY_ENGINES_CLOCK_CONTROL
register controls the selection of the clock feeding the display engine.

Add clock gate support for the two CSRs.

Reviewed-by: Abel Vesa <abel.vesa@linaro.org>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/clk/imx/clk-imx95-blk-ctl.c | 50 ++++++++++++++++++++++++++++++++++++-
 1 file changed, 49 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/imx/clk-imx95-blk-ctl.c b/drivers/clk/imx/clk-imx95-blk-ctl.c
index c62d61c3444bd40fabcc0b50929584cc1724ae95..7e88877a624518cc679cfb3bf673418207a1bc74 100644
--- a/drivers/clk/imx/clk-imx95-blk-ctl.c
+++ b/drivers/clk/imx/clk-imx95-blk-ctl.c
@@ -1,8 +1,9 @@
 // SPDX-License-Identifier: GPL-2.0
 /*
- * Copyright 2024 NXP
+ * Copyright 2024-2025 NXP
  */
 
+#include <dt-bindings/clock/nxp,imx94-clock.h>
 #include <dt-bindings/clock/nxp,imx95-clock.h>
 #include <linux/clk.h>
 #include <linux/clk-provider.h>
@@ -300,6 +301,51 @@ static const struct imx95_blk_ctl_dev_data hsio_blk_ctl_dev_data = {
 	.clk_reg_offset = 0,
 };
 
+static const struct imx95_blk_ctl_clk_dev_data imx94_lvds_clk_dev_data[] = {
+	[IMX94_CLK_DISPMIX_LVDS_CLK_GATE] = {
+		.name = "lvds_clk_gate",
+		.parent_names = (const char *[]){ "ldbpll", },
+		.num_parents = 1,
+		.reg = 0,
+		.bit_idx = 1,
+		.bit_width = 1,
+		.type = CLK_GATE,
+		.flags = CLK_SET_RATE_PARENT,
+		.flags2 = CLK_GATE_SET_TO_DISABLE,
+	},
+};
+
+static const struct imx95_blk_ctl_dev_data imx94_lvds_csr_dev_data = {
+	.num_clks = ARRAY_SIZE(imx94_lvds_clk_dev_data),
+	.clk_dev_data = imx94_lvds_clk_dev_data,
+	.clk_reg_offset = 0,
+	.rpm_enabled = true,
+};
+
+static const char * const imx94_disp_engine_parents[] = {
+	"disppix", "ldb_pll_div7"
+};
+
+static const struct imx95_blk_ctl_clk_dev_data imx94_dispmix_csr_clk_dev_data[] = {
+	[IMX94_CLK_DISPMIX_CLK_SEL] = {
+		.name = "disp_clk_sel",
+		.parent_names = imx94_disp_engine_parents,
+		.num_parents = ARRAY_SIZE(imx94_disp_engine_parents),
+		.reg = 0,
+		.bit_idx = 1,
+		.bit_width = 1,
+		.type = CLK_MUX,
+		.flags = CLK_SET_RATE_NO_REPARENT | CLK_SET_RATE_PARENT,
+	},
+};
+
+static const struct imx95_blk_ctl_dev_data imx94_dispmix_csr_dev_data = {
+	.num_clks = ARRAY_SIZE(imx94_dispmix_csr_clk_dev_data),
+	.clk_dev_data = imx94_dispmix_csr_clk_dev_data,
+	.clk_reg_offset = 0,
+	.rpm_enabled = true,
+};
+
 static int imx95_bc_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -467,6 +513,8 @@ static const struct dev_pm_ops imx95_bc_pm_ops = {
 };
 
 static const struct of_device_id imx95_bc_of_match[] = {
+	{ .compatible = "nxp,imx94-display-csr", .data = &imx94_dispmix_csr_dev_data },
+	{ .compatible = "nxp,imx94-lvds-csr", .data = &imx94_lvds_csr_dev_data },
 	{ .compatible = "nxp,imx95-camera-csr", .data = &camblk_dev_data },
 	{ .compatible = "nxp,imx95-display-master-csr", },
 	{ .compatible = "nxp,imx95-display-csr", .data = &imx95_dispmix_csr_dev_data },

-- 
2.37.1

