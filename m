Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11012039.outbound.protection.outlook.com [52.101.66.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5CD022ACCF;
	Wed,  5 Feb 2025 09:51:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.39
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738749072; cv=fail; b=e5NmJ9rS/vZ3JcJ80GlfHzDoh/ahyUNj0eu9wFjC637cv7ljmvYvzRx7334KJGNgP+9BGT/ZleuNkvlALnlv5mK6E1G3uEVoIsxvFBTcMug2vGs5tOF+/D3Jfgt708Hl+/dOnpvRimGfVdDwwJ/N1AiG5CZFRjerOfEs12V/x5E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738749072; c=relaxed/simple;
	bh=ffwsmpBfIesNfYlPEG/PfN+LdQioWrnxKIIBsXlzFHA=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=Zanc3dKPDIPRg3t+Nj6BYg5lRIrNBub9FZrubepzs4jA3c3A+Ex0ANGRABK9kZ0SpQjZ/AuzfT3/KOIa9DxC5dGqd/Hmdv9vNgIJbLY4Rpgj2mQER0nVHcq2cV5zTWWw916G9cXqoA4mfZf73s3iQlA3Zy6pmmvkUfTZFD0Sp0A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=J1xdtgWn; arc=fail smtp.client-ip=52.101.66.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="J1xdtgWn"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zKdqJ17+gGTbPxz6rbeoNRRZhFxgUVWKZGiSrlYs33Rb+Tj4hnApJihGmz14EXEVoY22FjGWXA6rSM3H5EJ6W0O1+H9JJ6W0kMcm9UfSu/TBZ6tO8rpO5CpflQPZtkGQXUhZ+jqi70QQi26RNCiGYL37D9OwNEoWAWQlMdrQQ/+hFOhkZk9IQB3mGa+HtWDTF6J5UrxthWrm9r5oiGqpRDtNPnkKUPo0yNWLys1w0ePdPIaItFW9fEplu1Soe0ZqTHAIELMmoOJsh8xOdTRYqUdQwrY9N2HMs6A0cZ2CEVkQhVXqIR0y5zmXuSB5m5omX2NStjxEObPYOrXk050z6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gU7+ZP6pMIoCBsURY7iz7g3g0e2ppp8+Og0/JWVDMQo=;
 b=h/PdDDCw8PiY3uPuFTncWeZmvhh8NEaLAIAheqU2UD5vwYpK6VbbHAmVFALuiJ82FnCwfTrm5nuEHAEFaXNtbZq/vrNw44FOrOBjKP78ohdSeZjn3/HiUeOgd0j3FxLcJ/XHbFOSYglvVlLsNXR/mEZ7VlXLwQIRSDV6uxMUozwzaAhUh0jxZfbgdO3ClSV21J5/tWl4m+7GDCf4aKEvI0q3tJtXNQDlx6GMInbV8VxqFE/7ii2VT3Amb5rwWqtFTYXCZR2d0jTDOmrrS4JExZ+Xlv4ABAOeawoSWZVgYiT2FDYFDxKU3L/jvMCUBaPPSxiX5/BOuvvI9Lq/NEv6TA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gU7+ZP6pMIoCBsURY7iz7g3g0e2ppp8+Og0/JWVDMQo=;
 b=J1xdtgWntkshYnG8paNWhAn4P5OJ8QigOFrScMnbqdoYLG7XS/z7OvugYmVisobnw2/UYRd1+S9egY3mrTZWstx6uphnSbXF0t8wPk5ZC0w30M7egIhIiHJRBFJLg7gJa6PHhMv17KM2a2wWpUwX8O5zSmyQ0Rp2lkfH2kVwXHbjudyxDKEKpcJYuxEf1BBXex1zkd1ySMb9FcanZdztgJd9/LEKUX+mg3gbhP1JeZOWO2KQaefdGDxfpKMwsQe8ZNYinh/MKjk4wZeww9sUC5YyH7DIQTdYJfVrZOQub0ChDSbh8WV00HwkmpZMurtzimrZ68uUgdB6qPtfRo0p3Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by AM9PR04MB8244.eurprd04.prod.outlook.com (2603:10a6:20b:3e0::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.10; Wed, 5 Feb
 2025 09:51:03 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%3]) with mapi id 15.20.8398.025; Wed, 5 Feb 2025
 09:51:03 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Wed, 05 Feb 2025 17:49:53 +0800
Subject: [PATCH v2 3/4] clk: imx: pll14xx: support spread spectrum clock
 generation
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250205-clk-ssc-v2-3-fa73083caa92@nxp.com>
References: <20250205-clk-ssc-v2-0-fa73083caa92@nxp.com>
In-Reply-To: <20250205-clk-ssc-v2-0-fa73083caa92@nxp.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Russell King <linux@armlinux.org.uk>, 
 Sudeep Holla <sudeep.holla@arm.com>, 
 Cristian Marussi <cristian.marussi@arm.com>, 
 Abel Vesa <abelvesa@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Dario Binacchi <dario.binacchi@amarulasolutions.com>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, imx@lists.linux.dev, 
 Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1738749007; l=4349;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=KRcjOzvpw/7k3Zo+dpLijDzx/J9AIHxlTggTa6PQqN8=;
 b=dULJcJfhwx1CNhkmzPH2eq1dJp374iXcZANZt/po7lNTP/oHHSUx+wsXXkuNMqxX+QWq7z4sH
 xa2blyq4zu/CyX3LoN9Sd8mtJamG/7bfFaMyji0QIsGjFoNfwvxNUaf
X-Developer-Key: i=peng.fan@nxp.com; a=ed25519;
 pk=I4sJg7atIT1g63H7bb5lDRGR2gJW14RKDD0wFL8TT1g=
X-ClientProxiedBy: SI2PR02CA0037.apcprd02.prod.outlook.com
 (2603:1096:4:196::8) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|AM9PR04MB8244:EE_
X-MS-Office365-Filtering-Correlation-Id: f3fa6fab-61b2-4922-33d3-08dd45ca9a7d
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|7416014|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NFVWME4rNDVObTlLTXVNblh6VEQ1eG1Yb3hCamJhSC9SeW1rMmxLcmlzRzVh?=
 =?utf-8?B?RnRUN2dLc1U5SUxIeURwdml2TnlmQWNCT3YrWWVEL2k4VVFmZmhXazNtTit2?=
 =?utf-8?B?ZXA0SHFqeTZQRlY5WTdlUmtxU1dTbmlsNlUrVWV4c1pkakNSV0twOVlaOGVW?=
 =?utf-8?B?QjZ1UGg1RGVKR3VjTXJ0MG9ld1ZuVWtvT05QcVpvY1c4cnU5UTV6UkMyUFc0?=
 =?utf-8?B?RzdsdnZxQ21JM1I3VHN3UlZnK1A0VnJ0UEdjYXZkeUY1ay9pT2xBQ3ltQTBK?=
 =?utf-8?B?dGZBWC9ZeXlpdi9GR0tFM0FYRUlCMS9PMURnUnJBK0ljdXlZcmdrQlhVZURo?=
 =?utf-8?B?Y2xPUE1vdXd1eURyZkdKbTRzeHVTU2xXdXJnN2ZNQkNoNi9yZ2xWTzZMRkNY?=
 =?utf-8?B?NXBDa0hCRENQNVU5ZWNsR2s5Wi9Ia29EOFhjMlRLdWZmK3ZlTktVK3d3SlhM?=
 =?utf-8?B?SXovQXpEM0UxcHJEalVEam4rRThjbXlBYlpZWTNJTjVkbThzY1VCb0FzK3ZZ?=
 =?utf-8?B?NEJvc1RWdmd0bzNzMjhzWGd4OFdZUFdvL2g0TFkwYmJtSE52aGtxVnZHZDJN?=
 =?utf-8?B?clVsVFRUVW1MTGU3MytxdVAzUmtaV0xkbXlBZzM3N1NUbGhBMjJvZFZNQncw?=
 =?utf-8?B?OEVpVHNRUUVWWmcwN0EzcTBBdnVZaFhwMzFTYWpmMmNSa2NzbjNLR0NBZE1l?=
 =?utf-8?B?VkYxcGQ5OGZjMnpZOTFRd1NlM1d5UGdoT1JZSlJqcExoMUdGaXRZODBsWHhR?=
 =?utf-8?B?dUtwVTdUL2lIZ0U2Z2dOVkw2eHRNRXNRRXQwNS93V0RxS2RYWEt2YU5HVHZF?=
 =?utf-8?B?VDMxKzgzdXE1a1V6VXNtZ3BUOGVtSTdsalJXNTFEZFR1RGxXc2RRcEo0Yzln?=
 =?utf-8?B?RzhvVDFzT1pRT1pHVG4vaks2YnJmN0oyRG45ZlFDbStQcDhGVWdBeUxDMlZ1?=
 =?utf-8?B?cTVTTERDc29xTTBKeVJxN1lTN05QZklpTkwxTFJkUVBMYW9aRk9mK29Ga2N4?=
 =?utf-8?B?VjVTcnNVeUEvMjE3VjFJZE9tUWVxdExaSkRrSW95clN2YzV0NElaUG55UFpz?=
 =?utf-8?B?bmpxNVlGYTNOU0gvTXNTNTdIczlmVlFEc0NlcVJBSVdDaU83UDFNYVlWcm5Y?=
 =?utf-8?B?OUF6THdKdzRIYWxjZWNwZTNZZXlmazBZUjVRV0ZwUGpPeTgzbUR2Z3FMN2hF?=
 =?utf-8?B?TExPYnhtRk11M2hNb056Ymw1TE9BWFQ4c3Nya2lhOG9ubkoxbllBMHR0S3RB?=
 =?utf-8?B?aksrSkVXVHI4SzFPb3M4cTJGSDExNWpIYzNLUytsQmNaTzdyMFo0TFR4aDht?=
 =?utf-8?B?RU9tQTFlbnNjck0zL1Q0VTVGWDhyNTNOa0RkbEZSRTNjY3dNM240b2VnMytG?=
 =?utf-8?B?Q0RRcnpQSUkremtmc1gva3B6VDdHbERlWjZZa0d2UEZPTnJjVmRpdjJ3SUFS?=
 =?utf-8?B?T1ZDZU51eUZJeENFeXFOSlpYdkRKQ2JQdE5rSFZIUE1MUmJGNkN3WEgrZEx3?=
 =?utf-8?B?dlZiMlhXVFRyb09iOGE1V0t1YUtxd2hpdm8vZEJJY0czMGdYVzRMWE9oWTcw?=
 =?utf-8?B?elRNaC95eWRJNkZ1ZnJLN29uang4YXZlQldlNTQwRWNPUWpBR3JWNmFQeUp2?=
 =?utf-8?B?SmgyMStHNHhOdkJuVnlvMzNadjdROXRPWmtHK1ZxbkxQVUFtUjhUL3ZvbVdp?=
 =?utf-8?B?Rm5abkp5cXRIR0RueFh6SU1VRXlMVEhTcVBJV0pycGxNMGtGVGx0TWY4NllC?=
 =?utf-8?B?NlJ0UE1HSThlalZRejEvOWFWYllOSDJOUDdvdks4eVU4NXU4cTlXbFc4dldq?=
 =?utf-8?B?RmhoN09mTkh5YTdValdpdGxLcUFDbGZnNExPT2x4eFVYMkhxV0NDMUFUd0xi?=
 =?utf-8?B?cjhnV2Q5dFJ3RjNabkhIQWlyZjdZblVqUnlwdjlERWJFdVB3U1hFR2dON1NY?=
 =?utf-8?Q?M8XSca2H9XcB8ga8eOWdmM0HNbukED25?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eUhIU1Rpc3JRSytocUIyeEZoT3QvWUVseUFtcDhDRkxENlU1ZGJRaElDdWJT?=
 =?utf-8?B?eXYwUDl4bjNKQkNRVlU2RHg5aURrNWkzMXNuTEtvKzVoM00yL1dJS2tQOWsy?=
 =?utf-8?B?di9mRENoYXAxQ1hOUys5RWowVG0xNWQyeERjRW1UUzRFNThrNFN2WExibWFU?=
 =?utf-8?B?VW1OZ0RPTGVIdE9URmV3cTRPRnBucHRCNEpRUC9vaU5uRU0vTWVrNFpKd0o1?=
 =?utf-8?B?S3hXVHBWR3BnNzhXSHI4MW00WVBNVHlKZXd1Mm4rREgvRmxvZUZpZTJtNjZG?=
 =?utf-8?B?KzQ2QjlTd2pKTitseDdick5vVHZ4ZlcyZjJnZVRVVUdnR08raDhzMUVLVjN5?=
 =?utf-8?B?WXFYQUJEUmJyYTBjcVlQNXRkaUF5RzV3V3lIRUdBSkRyZ1FrdHIxQzhoZUsv?=
 =?utf-8?B?WnFpWC94Zk9IbE0veGpOUXN1c0ZDWHVmcjlMaTArQllISGY4NXQ5Q3RWNkY5?=
 =?utf-8?B?K3NLWnV4dnk4MFZ0eStvQ3N3M3lMTkRSZGFTMkNRQmdLdGYyWXVDbmVsL0lI?=
 =?utf-8?B?dWw0VTNyaXIyY0w5YWZjZWhoTDBiVnNteTNSSGZHRnY2dVpjUjBZZWtjWncw?=
 =?utf-8?B?bEIzUmhuZnVEdzhUNEtaOTFwQk9BYUpHZmRaRWs1UGQ4TUhjVkZCSWNkaFpK?=
 =?utf-8?B?RGhtM0FJS2RlR2h4S1ZlVDZXaGNTb04zV3RteFpINTlLcVBGRmw1RWczZmVv?=
 =?utf-8?B?ZEZibExBQzg1QlQvS29tSytRQUVtd1RSVFhOem4ySlBRcjNjK0NraUhLd0Vq?=
 =?utf-8?B?aFV1MHJIRGdyemdMb1ZnRDZxNmlpMko1eTlnaHRBMjFqU2IzVHpJNGhVNk94?=
 =?utf-8?B?dGZPQ1Y3YkcrTzZ4enNoU0xxV0dlMFg0S3VVb2RjMXAvS2pMcmN0VUNPeThx?=
 =?utf-8?B?Z21PemlPNnJ2bjFHOHdyOFJBYmRVeGFEKzJuaXVqcWM2dTU0aG10WlMvaFFV?=
 =?utf-8?B?SWFEQndLVzd3WFBoYmpJL3RxTVBVczBhZURFeEU2L2gvWGJoMmtNSWpMVy9i?=
 =?utf-8?B?dzNmYmg4SmVBWCs5MXUvZWlBNGc4cWhURmpqMmxKTTVMYjhhUmE5V1F6a1Zm?=
 =?utf-8?B?SlpldHE0OWc3dW1sT0xXMlJzOVl2OE9qWmJYK2FpVjVwMy8xNFFUdTR4Q0Yy?=
 =?utf-8?B?RW1IZUQ3RE9qeEE4ZFBlWE5ZLzdVZVBUWXNDM09qK0c0WWdodlV1bzNFQzc5?=
 =?utf-8?B?QW44aFJXSjdaWmw4SlB4dDN4RXk0dGJuZ2dydW5IMFdUczU0SmxwY3U1WGpk?=
 =?utf-8?B?VmVYcEloL2R6OGRzS1ltU3l5amRRL2hlWTR6Y0gyOEhGQmVkV3diMGRVWUcr?=
 =?utf-8?B?bnNQdmNEZkZvNXV3RnA5dXd5WHZOc0Z4LzBKUGpTRFZCOHZHWU4rUWVZMFpF?=
 =?utf-8?B?end5cGpTQzB6NUIrUW84QVE4TGpvME5WcGZwQ0VxbGYybUFHb1ZUY0FhcHZU?=
 =?utf-8?B?ZmQvOFBoMDRDcnZwRGpoNlI4VFgxaStEc2xET3FVbGNXWWhzdlFVL2Z6YlBD?=
 =?utf-8?B?ZXBxb3h4dHJRRkV0S0hMZ1REMDhkMG1wQjhtNjYzMDdCK2VmZXV4b0drWVM5?=
 =?utf-8?B?RUxka3ZlQnEyQVVZNHg3Wkw4QW94Q3NSalg0SXVRb3dqazU2bWE5bW9MdUkz?=
 =?utf-8?B?N3dQMUFBeVQvTFJJM3g5bW1hY0kyM3JQcVkzTFZXYmdyZExEeDY3ays4dngy?=
 =?utf-8?B?TXBLVTh3NGdTaHd5WTdSOERteGNaYXV5cEk5THh1anR6ZGExbHRBQzROa0dC?=
 =?utf-8?B?MVBXMDI1dkRQRGpSMjlzNWNHK1ZLY25oQmNETmJMRXBvcGNQZEN2WFFHTzcx?=
 =?utf-8?B?c2MvTXhiano3MjB4S3ZGVEhWTTZLLzkvL2RSbFJneU5EN2hoMmF5VU9YVWdt?=
 =?utf-8?B?b2lqVEdEUUFWTGFhKzI0a1VWcHJCeVk2SmJzZGc0d2g0Tm9sNk5BRG9LZ2Ry?=
 =?utf-8?B?OUVQektVK0lYWFUrUTZvK3drUXZ5UmNuZ0FLTEVFSjlhZERkc3p3QTRsVE9k?=
 =?utf-8?B?SnhRRlJhU3NybWZQc3d6Yy9wWTJWL1FkNGxjcGFZUkZ3QnlVWm01aUxwamRZ?=
 =?utf-8?B?RzFmbWwxSE9KbGdGNWJKT2MvaFNqdmlhS0U0SFJGbHBpTEFjZEJzVE9ZUlNF?=
 =?utf-8?Q?vUBYTBaxe5xxJUVkNGT2suQR1?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f3fa6fab-61b2-4922-33d3-08dd45ca9a7d
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2025 09:51:03.5587
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ov6tmedNSewPTvPIHCo8ieKC/SxTBdirKj3QC4BfwlXcpaOKPcq88+95hmkoL/rkdnCPTS7wVU3692Z37V1xKA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8244

From: Peng Fan <peng.fan@nxp.com>

Add support for spread spectrum clock (SSC) generation to the pll14xxx
driver.

Co-developed-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/clk/imx/clk-pll14xx.c | 66 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 66 insertions(+)

diff --git a/drivers/clk/imx/clk-pll14xx.c b/drivers/clk/imx/clk-pll14xx.c
index f290981ea13bdba3602af7aa44aaadfe0b78dcf9..3bdce762a9d651a6fb048dcbf58db396af9d3aaf 100644
--- a/drivers/clk/imx/clk-pll14xx.c
+++ b/drivers/clk/imx/clk-pll14xx.c
@@ -20,6 +20,8 @@
 #define GNRL_CTL	0x0
 #define DIV_CTL0	0x4
 #define DIV_CTL1	0x8
+#define SSCG_CTRL	0xc
+
 #define LOCK_STATUS	BIT(31)
 #define LOCK_SEL_MASK	BIT(29)
 #define CLKE_MASK	BIT(11)
@@ -31,15 +33,26 @@
 #define KDIV_MASK	GENMASK(15, 0)
 #define KDIV_MIN	SHRT_MIN
 #define KDIV_MAX	SHRT_MAX
+#define SSCG_ENABLE	BIT(31)
+#define MFREQ_CTL_MASK	GENMASK(19, 12)
+#define MRAT_CTL_MASK	GENMASK(9, 4)
+#define SEL_PF_MASK	GENMASK(1, 0)
 
 #define LOCK_TIMEOUT_US		10000
 
+enum imx_pll14xx_ssc_mod_type {
+	IMX_PLL14XX_SSC_DOWN_SPREAD,
+	IMX_PLL14XX_SSC_UP_SPREAD,
+	IMX_PLL14XX_SSC_CENTER_SPREAD,
+};
+
 struct clk_pll14xx {
 	struct clk_hw			hw;
 	void __iomem			*base;
 	enum imx_pll14xx_type		type;
 	const struct imx_pll14xx_rate_table *rate_table;
 	int rate_count;
+	struct clk_spread_spectrum	ssc_conf;
 };
 
 #define to_clk_pll14xx(_hw) container_of(_hw, struct clk_pll14xx, hw)
@@ -349,6 +362,42 @@ static int clk_pll1416x_set_rate(struct clk_hw *hw, unsigned long drate,
 	return 0;
 }
 
+static void clk_pll1443x_enable_ssc(struct clk_hw *hw, unsigned long parent_rate,
+				    unsigned int pdiv, unsigned int mdiv)
+{
+	struct clk_pll14xx *pll = to_clk_pll14xx(hw);
+	struct clk_spread_spectrum *conf = &pll->ssc_conf;
+	u32 sscg_ctrl, mfr, mrr, mod_type;
+
+	sscg_ctrl = readl_relaxed(pll->base + SSCG_CTRL);
+	sscg_ctrl &=
+		~(SSCG_ENABLE | MFREQ_CTL_MASK | MRAT_CTL_MASK | SEL_PF_MASK);
+
+	mfr = parent_rate / (conf->modfreq * pdiv * (1 << 5));
+	mrr = ((conf->spreaddepth / 100) * mdiv * (1 << 6)) / (100 * mfr);
+
+	switch (conf->method) {
+	case CLK_SSC_CENTER_SPREAD:
+		mod_type = IMX_PLL14XX_SSC_CENTER_SPREAD;
+		break;
+	case CLK_SSC_UP_SPREAD:
+		mod_type = IMX_PLL14XX_SSC_UP_SPREAD;
+		break;
+	case CLK_SSC_DOWN_SPREAD:
+		mod_type = IMX_PLL14XX_SSC_DOWN_SPREAD;
+		break;
+	default:
+		mod_type = IMX_PLL14XX_SSC_DOWN_SPREAD;
+		break;
+	}
+
+	sscg_ctrl |= SSCG_ENABLE | FIELD_PREP(MFREQ_CTL_MASK, mfr) |
+		FIELD_PREP(MRAT_CTL_MASK, mrr) |
+		FIELD_PREP(SEL_PF_MASK, mod_type);
+
+	writel_relaxed(sscg_ctrl, pll->base + SSCG_CTRL);
+}
+
 static int clk_pll1443x_set_rate(struct clk_hw *hw, unsigned long drate,
 				 unsigned long prate)
 {
@@ -370,6 +419,9 @@ static int clk_pll1443x_set_rate(struct clk_hw *hw, unsigned long drate,
 		writel_relaxed(FIELD_PREP(KDIV_MASK, rate.kdiv),
 			       pll->base + DIV_CTL1);
 
+		if (pll->ssc_conf.enable)
+			clk_pll1443x_enable_ssc(hw, prate, rate.pdiv, rate.mdiv);
+
 		return 0;
 	}
 
@@ -410,6 +462,9 @@ static int clk_pll1443x_set_rate(struct clk_hw *hw, unsigned long drate,
 	gnrl_ctl &= ~BYPASS_MASK;
 	writel_relaxed(gnrl_ctl, pll->base + GNRL_CTL);
 
+	if (pll->ssc_conf.enable)
+		clk_pll1443x_enable_ssc(hw, prate, rate.pdiv, rate.mdiv);
+
 	return 0;
 }
 
@@ -465,6 +520,16 @@ static void clk_pll14xx_unprepare(struct clk_hw *hw)
 	writel_relaxed(val, pll->base + GNRL_CTL);
 }
 
+static int clk_pll1443x_set_spread_spectrum(struct clk_hw *hw,
+					    struct clk_spread_spectrum *clk_ss)
+{
+	struct clk_pll14xx *pll = to_clk_pll14xx(hw);
+
+	memcpy(&pll->ssc_conf, clk_ss, sizeof(pll->ssc_conf));
+
+	return 0;
+}
+
 static const struct clk_ops clk_pll1416x_ops = {
 	.prepare	= clk_pll14xx_prepare,
 	.unprepare	= clk_pll14xx_unprepare,
@@ -485,6 +550,7 @@ static const struct clk_ops clk_pll1443x_ops = {
 	.recalc_rate	= clk_pll14xx_recalc_rate,
 	.round_rate	= clk_pll1443x_round_rate,
 	.set_rate	= clk_pll1443x_set_rate,
+	.set_spread_spectrum = clk_pll1443x_set_spread_spectrum,
 };
 
 struct clk_hw *imx_dev_clk_hw_pll14xx(struct device *dev, const char *name,

-- 
2.37.1

