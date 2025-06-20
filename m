Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011022.outbound.protection.outlook.com [52.101.70.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3888026FD95;
	Fri, 20 Jun 2025 08:46:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.22
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750409182; cv=fail; b=D3RmYmkWVYUVD2bavXIcNaNbe6CxfB1FUNWR9/MPOJ+n+Jm54rdNBbqTfsR7xVHstVkbYtJ0u+rftPT4wAEBxqorzOTKarJUzg04IsMIRqzHovFz9Tv/FwN+FDIiP9KMPnBK32yoBtA7EM5FvEGQ+Gq+5LNi7QyBctN5AomAI4c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750409182; c=relaxed/simple;
	bh=wkKJkFD7AEsU2zG8BGom1g0vcXONp3lB84ytkcLI7pE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=n90UAJpU6QyYNSrljTprQFf58NVfLegHljgYtGMK7788uhndTVZ3G14VZ2u8kvfSxJWErE3KqMMyNzQFQDgS+Z8j/ni3BzVuqpIm17YvHJQXG/6AzSNuPJhDcWd8eff+5VfXd1IlpnJsonCqtbrsunQKDTcL49HoepAUdg6szFw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mt.com; spf=fail smtp.mailfrom=mt.com; dkim=pass (2048-bit key) header.d=mt.com header.i=@mt.com header.b=t/px059W; arc=fail smtp.client-ip=52.101.70.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mt.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=mt.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mt.com header.i=@mt.com header.b="t/px059W"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UzEgslMjt3fAnzoa/5hw65qDlY25najqJOL6hIIBy3SQ49EBZkFG3gO86TCFXjuYL9nY2XYy4PrGE06MnPJQrV0FRu/m69trUZu39QQsboer1NHv2P1rb0OVQ23aXaNTzvItTb56dS4wFfOKUNQdqmfGRuQa1COPAJjO9W7sC0QwjnRKSoYBuoDeG33CUUQhQ/qHfyTyMhLwdlMc4wyuXY00WkGP2w+nzUGaLykKmfZx8aJe0DNCK9ibG0C02VGQkKahB0HVnX9v8sVW0nIm6VbXFlsIYHG/FyaMokRCRnc/Ps2Q1f36O7NA4TKs5Rlp0q7V62cX5Mz5o9zksYKVkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=21ImcdqNDn/AF0Aj/hwX8wgS3FREKqU6tRsgJAZF88o=;
 b=TNLk2JlUYO7x9LNdiz3f94L1gQfRN+dOtSP0iNF6ghE/McJlIPuRhE+McHIBbA36TAhHvL5dGWaYzHADX9/Ji3r6/DssZ4Ob5y3JCbjYX6KUA/uvN7jNwO3HYI1tX7wnxBdfS0zGsrLwirnHooOsmIkm0EmOEEcA2aZSCKyJlyF3IB3ds1WPNljN6uIwveOyviahAwn6LoYO+XS6IcbpaHAAcuP30a4zgIbuiQu6/GfE3Sr3chHxSleoxLDV6b8SaWMa9z8asRyRiu3vgyL6DLWXvClaUNg1HWZpsL1I0VUFX0BIYa3lt0jzYw/pvqtH9eswAsnuCgalkVFZbItPuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mt.com; dmarc=pass action=none header.from=mt.com; dkim=pass
 header.d=mt.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mt.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=21ImcdqNDn/AF0Aj/hwX8wgS3FREKqU6tRsgJAZF88o=;
 b=t/px059W0TuM6YfwRKOw8zvH2uOKh5V+3cle17sihJm5KcmxuCwlvepVKqKgrwgt9PL+pNLutCcfNsizqnISs8ypdFfcZYkScRiXx9Upx/QsCpW85xAsaOvgfo0CF3XODknZ7oghqGmqkDSZ6aD/E3VAm9TA9WPkhi1RwS3YmIdmCYVcg6fDEAB4u6+h4BYj3szrJ4QsM9hoZouUDS8Q9kmNZ3EWgoFpaQkbSTeIgqzuygwUS4w4F2rKNus8fCaKoNDt0rU1CTGpYuAnsHKAnypfNhc9tGttgZliKQHBDvca/0oPopdOIdRPuYIs+uILRHNal9lYoOa1Mmof5UpXaw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mt.com;
Received: from VI1PR03MB3856.eurprd03.prod.outlook.com (2603:10a6:803:66::33)
 by AS2PR03MB9490.eurprd03.prod.outlook.com (2603:10a6:20b:59a::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.23; Fri, 20 Jun
 2025 08:46:14 +0000
Received: from VI1PR03MB3856.eurprd03.prod.outlook.com
 ([fe80::e9fe:470f:27e0:b265]) by VI1PR03MB3856.eurprd03.prod.outlook.com
 ([fe80::e9fe:470f:27e0:b265%5]) with mapi id 15.20.8857.016; Fri, 20 Jun 2025
 08:46:14 +0000
From: Wojciech Dubowik <Wojciech.Dubowik@mt.com>
To: linux-kernel@vger.kernel.org
Cc: Wojciech Dubowik <Wojciech.Dubowik@mt.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Wojciech Dubowik <wojciech.dubowik@mt.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Marek Vasut <marex@denx.de>,
	Frieder Schrempf <frieder.schrempf@kontron.de>,
	Markus Niebel <Markus.Niebel@tq-group.com>,
	Frank Li <Frank.Li@nxp.com>,
	=?UTF-8?q?Jo=C3=A3o=20Paulo=20Gon=C3=A7alves?= <joao.goncalves@toradex.com>,
	Michael Walle <mwalle@kernel.org>,
	Heiko Schocher <hs@denx.de>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Max Merchel <Max.Merchel@ew.tq-group.com>,
	Tim Harvey <tharvey@gateworks.com>,
	Primoz Fiser <primoz.fiser@norik.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Kever Yang <kever.yang@rock-chips.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 2/4] dt-bindings: arm: fsl: Add Mettler-Toledo Snowflake V2 board
Date: Fri, 20 Jun 2025 10:41:43 +0200
Message-ID: <20250620084512.31147-3-Wojciech.Dubowik@mt.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250620084512.31147-1-Wojciech.Dubowik@mt.com>
References: <20250620084512.31147-1-Wojciech.Dubowik@mt.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: ZR0P278CA0063.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:21::14) To VI1PR03MB3856.eurprd03.prod.outlook.com
 (2603:10a6:803:66::33)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR03MB3856:EE_|AS2PR03MB9490:EE_
X-MS-Office365-Filtering-Correlation-Id: 1c831896-9e09-4be6-caf8-08ddafd6e9ef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|52116014|376014|366016|10070799003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?NsESILkF+8yM2+d/RHC9RJye20U9QcC0rvSIxxylR68F1OCzy9DStqPQDX8E?=
 =?us-ascii?Q?C8IwzZLNnGWdLACZFgqeXl5ewAL5KElsUFLJEF3hQVhUwE1q3Lf39RhRn2tR?=
 =?us-ascii?Q?gptLeYdwMvUQVLvOmHXpclekUsBvjf71AVBfe/yHBzmtPTUf1XJdXQ253MBt?=
 =?us-ascii?Q?A3zdm+EfHp5Y5VvT65OF0ql31qfV4fDYdJhefhIohBmvbrqLRYwoZp1WQBMi?=
 =?us-ascii?Q?QgBR+B4pi8QfY1CMJvIZZLyvibaTvQ611ahKVa2pt+BgxMrQ+Ms0dkSj9vD/?=
 =?us-ascii?Q?KmRfQKRRMLtlPCHuGpjannruyW1fDMj7IxSeG2YnBssn7Kxr4sS4juFM4riJ?=
 =?us-ascii?Q?zY30PUXti0/18+IVfC/cE0U/7oPhe86LNkKbshObaH2RX70QmXmwdD+XUXn3?=
 =?us-ascii?Q?Zd5nKBgY+cgXhSVS6zWfhYYvGcsEtMyxQ0xCHLP9swZB/Th0NJmw+gBtfWx1?=
 =?us-ascii?Q?4P3mRp7rPjzfI6NA8XfEfYLeC2bYfOyB72/1UFBbCXr/AuuFVgSfpdjVRt3r?=
 =?us-ascii?Q?07Gzu83dSi3HIe3iv4qXuwPvWmeji3SYQU3hQ6ZzJpQ4xDe86xCiVmQcw+IJ?=
 =?us-ascii?Q?BTaaplFxkI03pvQgxglDSamFyGnxgW8vkIsT/gXLd/MlFtUYMWkuGHj+TMF+?=
 =?us-ascii?Q?7rnky2Hv6nNx7AlH3c8w/H7xreTrgKpebuEMV9weiIP4vcchMVRofOK5lSug?=
 =?us-ascii?Q?Y3vymeujjsZCXh3hBSxfDSXcvKqRUegde8uK8jJOU8tuj/yRjAAz5a4BmgUh?=
 =?us-ascii?Q?Uob35FkU00zC1l+c1Tnf/Oq9UMB+saek3dmVs7PachADAtC6bgqoZYcQ4K6e?=
 =?us-ascii?Q?wYec/vU5w3JQX3Vqpw5d5Ka4m1uVPpgf5mX2FjKBLhkr2xaP8INqGiCy2JCq?=
 =?us-ascii?Q?MHDv5FLcoqfNpOgkGHVIAXXWSe6sjHxIJllxT/0G8EDXBkE8K2CroqLvaPXR?=
 =?us-ascii?Q?B4vdp0bNFZM15cQ3Cn/ECnwFQO0Uqv0NMe9aOUonOpNQcE/fzv9Vcv4nxgk4?=
 =?us-ascii?Q?mUTyXydIrls/VXeWkQhVi8WsFdFfJOsL7O3EF4uNWFoxLIK2W3o5S5y15N+0?=
 =?us-ascii?Q?ieKK1dYB5AGQfS1qe+m3kh5U0+B1SQ8HNjU5TDMvXJVxvoHTus+eByy89fAm?=
 =?us-ascii?Q?tlapAkRtrDB7XQqywFGqbAH4OWy5/ntC0/w9yhtStZlx6Dx4Tm0VN+OxBjto?=
 =?us-ascii?Q?MlLXvCMaT49q+0lidQnoQdKc9KmU+MljeDxnH6XhnNI23OVqWrIExz/4gZb9?=
 =?us-ascii?Q?pTFaMhsqCwnNt9LNRJQUCKLP7cFqsBQl5upavj0wOP1U6eeRQDzm/puewY1U?=
 =?us-ascii?Q?824mGuaC6PfYLCXbMScmBTe33KtkrsXz/blveXT3mV1M75oILteU0PXSvSGI?=
 =?us-ascii?Q?7ePlsKDRlHl0YSbWfJVRuxPK8jbUjRhZ8ESvSRwdTAyZrJ2Ky0l9yWzfMHAZ?=
 =?us-ascii?Q?C6hWNSbtY/c=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR03MB3856.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(52116014)(376014)(366016)(10070799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?g3X8HO+v0KqsWWGxWEThrvAd3yJ2KtWzKZOpqHacKZhwRF4+QXWWf0Qp258g?=
 =?us-ascii?Q?q501yLbVHX09ygKhggLHIZWlhQvo4XmBsX1hDuqHSA1XpaCFHDdT2xOvJVb+?=
 =?us-ascii?Q?C0uP/3YaKNl/0Su6/xp8wm25EBsx/E1BEDQXg6Zp4UaZnGoOiVJh0qrkhkPH?=
 =?us-ascii?Q?+McW1v64OYhLZ5bSHMRo/qMB66fZiVqKIlot6HCQ5TaGpi72M4HQm3vxz3Sn?=
 =?us-ascii?Q?9bxziV2cyrxbFKOi0RTALx5n7p26q5yTc5zOqvYxGCQzm8TR5jhuhjxtIaWY?=
 =?us-ascii?Q?Ja+2uk7JPLjVEnzgBZ7M1I/8TX9Gr4BIQ0nulaXBI0CvUvtBufxD+QqYnRY3?=
 =?us-ascii?Q?fVHWGEU4T6OxPhYzZCLhBMcpE8wpHErttpz9U4ly1DD0BOnsXZECujSIGJ+0?=
 =?us-ascii?Q?5tQh92JhqzptBtKoNYv87kKM1quz7r4cubLljnDzAUNaBUiPjbfNI5TpUvML?=
 =?us-ascii?Q?tv8nX0aeIMpRdU3kUjDI5b2LWKuM9QZ954e/n6aP19recel9SwbUZnGLMTHk?=
 =?us-ascii?Q?91xtykJn6dIlasmwo/wy7mj39nKjWNkKjBbNyU9MdBVNyb6lVOgMyrEx6duL?=
 =?us-ascii?Q?+y3JVLQLDI92BRQWcZW7MvHODzU/b4K0nKwdTF94MIAtIrA8IZuPjYneuNlW?=
 =?us-ascii?Q?jiWGtUhyj+y8MoZcjW6Nsb+wR3D1FZlqfsG+hawqqGRnls9Rc959X20asWpj?=
 =?us-ascii?Q?7SeKk6LRaruIXRkE6+qCYqukG8g5t1fk4krveRl2PaPH4f1suzIvyGxi+Yzl?=
 =?us-ascii?Q?pK8pjrfhFPzaYtRGiAxCp19VPRxFX8F5+yxx87NaaixkkGuFhR4dGThCgKzp?=
 =?us-ascii?Q?rVq463aAoiWobSpwUuDUO/FbH0AQxGEj+DEh9qFMsfMzMnlh8wyL953fTMlZ?=
 =?us-ascii?Q?vFCaIp2G9NnMOyAdtZO5X2QWN8QxfO7yafJ1JZbOeNXM2i3pUYVUb3V5tcsa?=
 =?us-ascii?Q?wFKSspWL0V07V4hQxjHt1BdP8RY9iv7JkanDe0DL0WRI57YdAL+H4CkMX4Qi?=
 =?us-ascii?Q?9MzPPdbCEaLa5kNwheHj94gjOnz2hyY4sh22Gvdnl0WhJ404BPDmxA9P+HzZ?=
 =?us-ascii?Q?WGbFTdwgIQCZPIqSOLIbwUNlA0W3R+Ov4tQY4WIpD5k1QiAaQic3JUGE3G76?=
 =?us-ascii?Q?FlFz6Ir4NWwsR+jRhhE5TGk5cPmZWc1aC/1bVHVudfveCw4LeCyPIDqo8fnv?=
 =?us-ascii?Q?gKonid35krXmKXhJgnxTZxOqdqwgCNqT6m4M/vLT+b9MxoQ9o00M3P1IwuiS?=
 =?us-ascii?Q?2XiFGuO34MY2ZgHJOV+QrcKLttld5ZdjoET4/pXJXpVa3CAzYG8GEjAYauDi?=
 =?us-ascii?Q?QNWexr9tSfVJFpax6pHOwoltwr6G+PGx3tGyrHXf5Z0Bg30EEMv2lzdj1EPd?=
 =?us-ascii?Q?nKTYPVI3F3/rRiNkY1hrpGQy2oERzwCsNyUbpBP4BYWY6+ije1VzaPGxSMM1?=
 =?us-ascii?Q?cMaXEJdLtBDRo+eKE0U/sit5AR9CvmFaRnFXoaFmS4fdEfj6h+paTI1u6GDm?=
 =?us-ascii?Q?D4EFsvn32z/ca0gCMKKNqz2IMDV94sfPyKpMUkY/CWGatyeYdUXeeExbmix/?=
 =?us-ascii?Q?xPVnk3PfnfPEraa87BeXEOoXPCEFBHTP/sxfmjnZXc3KjAg2xkh+TcxAxXvs?=
 =?us-ascii?Q?WD2tdU6diDq+JA+gKArS4XC7Use1qcU45gSYd0cx0jlpmSpqhvyl0okAPOgV?=
 =?us-ascii?Q?TDMuPA=3D=3D?=
X-OriginatorOrg: mt.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c831896-9e09-4be6-caf8-08ddafd6e9ef
X-MS-Exchange-CrossTenant-AuthSource: VI1PR03MB3856.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2025 08:46:14.0410
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fb4c0aee-6cd2-482f-a1a5-717e7c02496b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cLnIcjVwgZlrVKGG4s+KFNYkXzE4qzky3v8Aql39/yvvgr+UrCPj/Y51HwaA1Y3XikIOllYoEDeRdrCPmhdH7g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR03MB9490

Add bindings for Mettler-Toledo Snowflake V2 terminal. The board
is using Kontron SL i.MX 8M Mini SoM.
Split the existing Kontron BL i.MX8MM as it uses the same module.

Signed-off-by: Wojciech Dubowik <Wojciech.Dubowik@mt.com>
---
 Documentation/devicetree/bindings/arm/fsl.yaml | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index d3b5e6923e41..fe5eeb4355e8 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -986,9 +986,11 @@ properties:
           - const: engicam,icore-mx8mm             # i.MX8MM Engicam i.Core MX8M Mini SoM
           - const: fsl,imx8mm
 
-      - description: Kontron BL i.MX8MM (N801X S) Board
+      - description: Kontron i.MX8MM N801X SOM based boards
         items:
-          - const: kontron,imx8mm-bl
+          - enum:
+              - kontron,imx8mm-bl                  # i.MX8MM Kontron BL i.MX8MM (N801X S) Board
+              - mt,imx8mm-snowflake-v2             # i.MX8MM Mettler-Toledo Snowflake V2 Board
           - const: kontron,imx8mm-sl
           - const: fsl,imx8mm
 
-- 
2.47.2

