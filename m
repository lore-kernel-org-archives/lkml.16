Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013004.outbound.protection.outlook.com [40.107.159.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 898471DDC0B;
	Wed, 28 May 2025 02:00:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.4
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748397654; cv=fail; b=t1pQM/5AjA9JTpgoFZoFf/8gTNJtkWKhdCyJsaK5D4x2/+FN5BULWvgcsD1Vdu41Y3CopEOm0CkIm2vmnKa23cxjGe1q9/IVDntAKxvTRVsfdLcvVXJ7Q+No0COHnwdHSSbkpEDk3A7nUYrvRP4/nWRsVj2Lj6ORb4UmR/7fG9E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748397654; c=relaxed/simple;
	bh=ewOvJ1EXLofwkHlywkxT4+spPyODQTJqAEVJZL4HljQ=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=IwffB5WdU/2yjvR/MHqLBAspzjQKVVMW5lZ7kPj2O7N1IQgtHCm+YwsSpk8kJrv4yc09dX3q9QiM5qAc7CYoHUoSexeQ6PvRVAW8aY9lN+mJhlO0bH4jijhM/QQZJgtN6x3Oqv2d8oEuFoYqR7ApqXvZXDiB7UV2JAwwE4ZcJgs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=EA1PPstQ; arc=fail smtp.client-ip=40.107.159.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="EA1PPstQ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U0OILmHSriXIl3PJKDsXqioe59nykExbBW/CrAXLQGIHGKKtFqby8Jdh/sA7kuwwZm1NHHAEVQP//roYepJmxxcD1vtOywvuIBdi4gQ7WvR1mW0vUZLv2Ss56H6NMgNQ7i5EH3wxRJmQ77IIaY+WndLx9wgKYzeqU1MY53SP5RCp5hK/nSn+WQigpyqtBmjtiEaWn0tqqDbm0DNQmBuM8JNGmAQqXhqjwnIAA1SxMqxRQfmbuBoKDi5QXpVjCZjHUoi9iFgtr9wt7frrN3zGDaKz+wL/gBgllQZoj9+E7zIiMQYu/9evsmJIOQnKEr2MoMxVdg0yysSqKyi3iSmhKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ffGQ4XqAf8WVFxkKl0Q6iMi1W1jzJfwO8ycB36gotpQ=;
 b=V7GWRqbSVaNYa+GjtOp6kLd+60XYnLWe7mpUbqkLkY9Pz9Lj4Ex6EvuEsU5ZAfBi6tcOmQYZdnvFX+/eyJo0ccd8RbF3nqTs+/9J2+LLDBZJmjBihnsQc7WDpmdNO8YykJIx4Wks0yX0Mz0DBr92xMIDE4HcY/TO0O3Bk3k7JEH77I6iToN9QVgikbIl61uEpfEimn6PtpLA/CZc7yDgBbee/M+Gy9Q01uSEa7649jFTBwMGCyO6FeAi3Zjop4ivhWxTC2cJrIDyDg/oPkTrwSzIvEQIAks1kLH8tL0atmTC1Rp4MTeoL+ufs59TYEsVChwgMvo0IcFMnX7c/saDvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ffGQ4XqAf8WVFxkKl0Q6iMi1W1jzJfwO8ycB36gotpQ=;
 b=EA1PPstQi9N2LCbYlY8YrccKpPK9ZQyJjRkxk0GbGmpF8XbbEvB/n0PS6xZ3mAzczpXgB28I31JMEHmWej403MjDtRzhnaLbdlR9hvn3ODLSGxRsBjNpWO0h5huPNQEbMSP7rEuB1eGv5Uf3C1UiJq0j7lL+4vJvzxQOG/RFTCEckeMNCHnfr4Aa4nmQLkBRExm7/FF13URQSiGB/Ed7uuOYxhixNTqgrj5Gy/A55VJlmAB/Ds2vmpXTel3fnvDPi4g/KkW1W7tU3UbZWdMaQYgYCrARmAt46NBkxK42mYUqL47W9tWDPr9cSZur8C+V83X8JkFkS7C+Kb0ag9XEFA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com (2603:10a6:208:191::20)
 by PA4PR04MB9293.eurprd04.prod.outlook.com (2603:10a6:102:2a4::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.24; Wed, 28 May
 2025 02:00:49 +0000
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::7be0:296:768c:e891]) by AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::7be0:296:768c:e891%4]) with mapi id 15.20.8769.022; Wed, 28 May 2025
 02:00:48 +0000
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	shengjiu.wang@gmail.com,
	carlos.song@nxp.com
Subject: [PATCH v2 3/6] arm64: dts: imx943-evk: add i2c io expander support
Date: Wed, 28 May 2025 09:58:34 +0800
Message-Id: <20250528015837.488376-4-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20250528015837.488376-1-shengjiu.wang@nxp.com>
References: <20250528015837.488376-1-shengjiu.wang@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR01CA0043.apcprd01.prod.exchangelabs.com
 (2603:1096:4:193::12) To AM0PR04MB7044.eurprd04.prod.outlook.com
 (2603:10a6:208:191::20)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR04MB7044:EE_|PA4PR04MB9293:EE_
X-MS-Office365-Filtering-Correlation-Id: e335457f-793b-4aa7-7baf-08dd9d8b76d1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|7416014|376014|1800799024|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?/Us6Z53u6NnY+AzjJHRL8diFBmn/q3JZLCycfTOoUKRjwgonVPRrTCxwrcGR?=
 =?us-ascii?Q?VYKNJKK+1vV2UAozyvVjz8aMVaMtfL6bA7zU3rklsshSGiiKHWDhP2AqnZVG?=
 =?us-ascii?Q?ACiqrf6yBIyjPVWnTooAGseKbrDFPEX/Qud9pW588uN9E0j1OaQu7Sz/SeBG?=
 =?us-ascii?Q?M8vyQgJaDnJw/BoKe2fK8R5Q+e/z/Wql/LamCL4+mfDB4zfq2suIaW+ot8ie?=
 =?us-ascii?Q?xufIQu0l7uRK2MeJGiRDih9i97iFJM8IN2WWbi1f+UC+CdtCF9cxAhf9qoZZ?=
 =?us-ascii?Q?T5nfIRgxlGJRP8tRgcH3P2BaKWq5CkhuR5kMilc8nntYCyi9FcPSBQcpgO9V?=
 =?us-ascii?Q?Y1RF5mYjlTdqi/G7S0yzzXtveGv4ObbIf7xHP5LE+1bJbUnaNzJYbriGR2vI?=
 =?us-ascii?Q?bpcl5Ly0HyV02Pqrm7CO4ryvcMcD99i4f32z7Zb/wjOMITmm10vllBLg9Z1l?=
 =?us-ascii?Q?6Ys7ZnZGnQwUZN7uN5ROgP8ack3aqQukRiziJenxQY6RoIap6unSYdxNGB+K?=
 =?us-ascii?Q?2NeclXVYwxQqKTtDcpWupyIgWn6Z2kBadX27DH5gw0+njoUk7tlTH8lmeD0v?=
 =?us-ascii?Q?cGMKmD9wJcE74gbq0zTK4L8XS+eLeWYqVZlLAJYMFys7lS+OJyDhww6yvYaa?=
 =?us-ascii?Q?kUpt7sD+4EslgDj6I/bs1PmRuvdqZKgGPpdPIqBeU5kHRFSI9gI3MozPGDQ3?=
 =?us-ascii?Q?rTKryGGGuL8hWZqhuhu/xWjHD6z2bUKSfegZU5Cmnt3joB3q53kNdD41r3NJ?=
 =?us-ascii?Q?MrFCrXY4pkE69KCb/FAZeC9hbxQ4/sh+/7vgYpfDK/aM5aEPRnhfQ6aJ4PsM?=
 =?us-ascii?Q?rnSAG/4OdkiQmleE8QsEpc3NhwkdDRyYu+wD2jyTXhHtugBtlzeXS9Hl5Ogb?=
 =?us-ascii?Q?wX8haLepMDcFfDiAl8zr9kg1Fw7L12FV9xDS7oESkBAcf/rRcqOFC3DkHcFS?=
 =?us-ascii?Q?kCKDrATjP2odcdQfqVxvCWC+gqIMH02XVux5nz2rtyHzlrf5gOmj7Fbu/c+m?=
 =?us-ascii?Q?R4RKLBLyuCjPV0EQNPb8su+cXQAqejx/ggR+UQIUgVzrl2iwXKZlTtH1e8hk?=
 =?us-ascii?Q?Y2CCfrxQc+DnR7WQAUz2bbCXeWhd5QvJAuc7wC79cYhWzsgpe39C8Pm4z1Re?=
 =?us-ascii?Q?rGPgLeDTjQ8rGJojV62TX5w/ffLYakUm81zdGsOztprd/TbMe3Gu3vpUmjq+?=
 =?us-ascii?Q?k7JmI4tSXEMRvhTOYP8TfrNF0BSgaCg9F6FfqCODbkgVZ/80lXrEdapIRusI?=
 =?us-ascii?Q?6JM5cfDoLSCKLBHRRPhAYFrgVsCFZOrTQOGt+9GfdmqAgtqGM7YydvkzzbzU?=
 =?us-ascii?Q?soS4b6oweAfujvsM2J7Sy1UN/6H1uHTGLI354iJG9gNDL5DPWFhrBr5WkdlB?=
 =?us-ascii?Q?HzFreOnbB+IzPvK2e7OMK6330TY4efDiIEfZqtuooSVzAgksooNTu7iDYwyL?=
 =?us-ascii?Q?dHtRVaB+HDtlHq5PGXqKm6OAci864jYAw935avCJ2KBgpCtTfrooAXgSU0Af?=
 =?us-ascii?Q?/xDvY1emx8N3bg4=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB7044.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(7416014)(376014)(1800799024)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?0F1dg4TRLMakSe8FbuikkpsjrlxfxiDm5EQq5ZDONlReMTPC4Tzb96oZduwW?=
 =?us-ascii?Q?dJEbIKtP+XfJ58nXKQlH+bZE+ViIOsehXhY2Jaxr8ZfetV6qy77z6TNjFczP?=
 =?us-ascii?Q?32qla5vNVXDtybNZ2fh4jOPWbn/wiLJB4GQLLfZeowBBW1IFE/xdEiItkZpP?=
 =?us-ascii?Q?vr2vSr1sE9ZyqT4+qlvuoN0bSkHQpHP2LTqizbSOGrQ7mndhy2qtjFo1tFcA?=
 =?us-ascii?Q?SKXNJESNfCl+VMI44lJhbtg/u/InSg19GnGqRrVaVhoaTvcVFQxgKOLp1qZY?=
 =?us-ascii?Q?VABPZlezRZ+Fv8zaBuBWTrnlWt7MIWFka7yqQvNjNb4JroqJowYkYFcrHmJK?=
 =?us-ascii?Q?xcMrTI8WZNx4kWGoktfL0+sO9vekryjw0rDUEfM0xGbLWkzpm4D0O+jFK+pA?=
 =?us-ascii?Q?/ZuHRp7I14lmnGDCf5335nRnCJOeGZriUnekLOC+PEB3IVzcG/YjetQSfThM?=
 =?us-ascii?Q?iiVzzbDdtdhHUsgwc+6kZkSLpwhouDWfBXvzn8T2TSZWi6pqEINRSueevjX/?=
 =?us-ascii?Q?LfFGlg1kqag3jogu5th68P8irr2FBjKESKIFRdHt20ARWrAp+PH5XMAuWyr2?=
 =?us-ascii?Q?nvwoGCms0TR8BZoxRpDGf2oX9J5N7SnEmovl2W9DWhPPr9zHJokfQd6UKAYb?=
 =?us-ascii?Q?i32KcG/kEp37uTPdPLU7UIbfbQRfjyz9ooP+k+ESxulUr3+WVyJJdSVNRHmg?=
 =?us-ascii?Q?/99eU2Y27XbMbGLSk/Kk3wrhWnUE8O9yaVoYWuHiA2BCxmkgWtOvLpmYI0fR?=
 =?us-ascii?Q?tO//rPsO/pj6/BlOLgoEH30Qi8nik+9XS8vrN0GuYDG5M17zpS3vu3FFKHaR?=
 =?us-ascii?Q?jK/oF/C/HIyfW/XP4+pXEH5XaVoAepqyeboUGa0wcF40cNMNhM4AH63BKVpj?=
 =?us-ascii?Q?bRNlWbPcoOuOD7pOGUIEKua8jgxd9fDBe/t69AFRNLHBMZg6TByEkSGL9/ud?=
 =?us-ascii?Q?8X0Fmb6J1tfiNzJwb6n3chBIl+yHtkumxCSPImJDbWsy2wS7MlGp2jiBjIPX?=
 =?us-ascii?Q?zD6BSaI0Co1fc+GdqZRJdq1TwRjMt4QMGqT8BHVnFvVvd2vcFusSJJQTAh8e?=
 =?us-ascii?Q?RUEM1V7j0+5CY6qcoDbJDrY1E3CMBzFnSzhC9+h5hK0zxgkpgfMHzEa7rEkm?=
 =?us-ascii?Q?JbmipQZEQiHjiD2QpN2r2GAjBUn0uHGIE+NuaRKV8W6SFhK75KAKAZNRxG0F?=
 =?us-ascii?Q?nSslWN6sAGiMQ0a+3NFqfYc6IorDuafLv0tOOh/pTxcYhDi21QYEw6WvoERV?=
 =?us-ascii?Q?GaAsucxj61x1oSMhFFtLTizN1N4i6/So2isN0xbjS17PJ4skJArUTJvurCwv?=
 =?us-ascii?Q?2zo9g8I5Ge65UAtuqSAsMdTVWxfplzc2gVNg+rb8RvDO5CCdbiAPrnqGFKDH?=
 =?us-ascii?Q?6dd5XeMnfoFRS9JriwGtYTnuqLYR6nXMGKSXb6htXouLAw2PIo3vKeJ/WSMB?=
 =?us-ascii?Q?N0oco9P9xKvGEPtdeFB2BRHGig5DHgMaraoBQGbLNO+7FLGh7rKp1NHM0KH0?=
 =?us-ascii?Q?S7Qt2mo6Qtye9IGQ+U3kBOd9zOojErqdOrrOhbQoYmkSTWzD8RLa7r34dGLu?=
 =?us-ascii?Q?O0+/TBBq6no86S5pqL46uthPs2gHZk8FGUjLmDyy?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e335457f-793b-4aa7-7baf-08dd9d8b76d1
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB7044.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2025 02:00:48.1351
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xxcbyUDlwq+7CbIcJCyDN0ucMpsqlH0bLaR5LoYPu/OwGAWlQBxMKlG7Fl1/T1eSQLocwvlyxqQ0IfkrtxAIDg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9293

From: Carlos Song <carlos.song@nxp.com>

Add i2c io expander support for imx943 evk board.

Signed-off-by: Carlos Song <carlos.song@nxp.com>
Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx943-evk.dts | 105 +++++++++++++++++++
 1 file changed, 105 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx943-evk.dts b/arch/arm64/boot/dts/freescale/imx943-evk.dts
index a566b9d8b813..ff6e9ac5477f 100644
--- a/arch/arm64/boot/dts/freescale/imx943-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx943-evk.dts
@@ -62,6 +62,13 @@ &lpi2c3 {
 	pinctrl-names = "default";
 	status = "okay";
 
+	pca9670_i2c3: gpio@23 {
+		compatible = "nxp,pca9670";
+		reg = <0x23>;
+		#gpio-cells = <2>;
+		gpio-controller;
+	};
+
 	pca9548_i2c3: i2c-mux@77 {
 		compatible = "nxp,pca9548";
 		reg = <0x77>;
@@ -102,18 +109,63 @@ i2c@5 {
 			reg = <5>;
 			#address-cells = <1>;
 			#size-cells = <0>;
+
+			pcal6416_i2c3_u46: gpio@20 {
+				compatible = "nxp,pcal6416";
+				reg = <0x20>;
+				#gpio-cells = <2>;
+				gpio-controller;
+
+				sd-card-on-hog {
+					gpios = <13 GPIO_ACTIVE_HIGH>;
+					gpio-hog;
+					output-high;
+				};
+			};
+
+			pcal6416_i2c3_u171: gpio@21 {
+				compatible = "nxp,pcal6416";
+				reg = <0x21>;
+				#gpio-cells = <2>;
+				gpio-controller;
+			};
 		};
 
 		i2c@6 {
 			reg = <6>;
 			#address-cells = <1>;
 			#size-cells = <0>;
+
+			pcal6416_i2c3_u48: gpio@20 {
+				compatible = "nxp,pcal6416";
+				reg = <0x20>;
+				#interrupt-cells = <2>;
+				interrupt-controller;
+				interrupt-parent = <&gpio3>;
+				interrupts = <13 IRQ_TYPE_LEVEL_LOW>;
+				#gpio-cells = <2>;
+				gpio-controller;
+				pinctrl-0 = <&pinctrl_ioexpander_int>;
+				pinctrl-names = "default";
+			};
 		};
 
 		i2c@7 {
 			reg = <7>;
 			#address-cells = <1>;
 			#size-cells = <0>;
+
+			pcal6408_i2c3_u172: gpio@20 {
+				compatible = "nxp,pcal6408";
+				reg = <0x20>;
+				#interrupt-cells = <2>;
+				interrupt-controller;
+				interrupt-parent = <&gpio3>;
+				/* shared int pin with u48 */
+				interrupts = <13 IRQ_TYPE_LEVEL_LOW>;
+				#gpio-cells = <2>;
+				gpio-controller;
+			};
 		};
 	};
 };
@@ -147,18 +199,59 @@ i2c@1 {
 			reg = <1>;
 			#address-cells = <1>;
 			#size-cells = <0>;
+
+			pcal6416_i2c6_u50: gpio@21 {
+				compatible = "nxp,pcal6416";
+				reg = <0x21>;
+				#gpio-cells = <2>;
+				gpio-controller;
+			};
 		};
 
 		i2c@2 {
 			reg = <2>;
 			#address-cells = <1>;
 			#size-cells = <0>;
+
+			pcal6408_i2c6_u170: gpio@20 {
+				compatible = "nxp,pcal6408";
+				reg = <0x20>;
+				#interrupt-cells = <2>;
+				interrupt-controller;
+				interrupt-parent = <&gpio4>;
+				interrupts = <3 IRQ_TYPE_LEVEL_LOW>;
+				#gpio-cells = <2>;
+				gpio-controller;
+				pinctrl-0 = <&pinctrl_ioexpander_int2>;
+				pinctrl-names = "default";
+			};
 		};
 
 		i2c@3 {
 			reg = <3>;
 			#address-cells = <1>;
 			#size-cells = <0>;
+
+			pcal6416_i2c6_u44: gpio@20 {
+				compatible = "nxp,pcal6416";
+				reg = <0x20>;
+				#gpio-cells = <2>;
+				gpio-controller;
+
+				/* eMMC IOMUX selection */
+				sd1-sel-hog {
+					gpios = <0 GPIO_ACTIVE_HIGH>;
+					gpio-hog;
+					output-high;
+				};
+
+				/* SD card IOMUX selection */
+				sd2-sel-hog {
+					gpios = <1 GPIO_ACTIVE_HIGH>;
+					gpio-hog;
+					output-high;
+				};
+			};
 		};
 	};
 };
@@ -171,6 +264,18 @@ &lpuart1 {
 
 &scmi_iomuxc {
 
+	pinctrl_ioexpander_int2: ioexpanderint2grp {
+		fsl,pins = <
+			IMX94_PAD_CCM_CLKO4__GPIO4_IO3		0x31e
+		>;
+	};
+
+	pinctrl_ioexpander_int: ioexpanderintgrp {
+		fsl,pins = <
+			IMX94_PAD_GPIO_IO45__GPIO3_IO13		0x31e
+		>;
+	};
+
 	pinctrl_lpi2c3: lpi2c3grp {
 		fsl,pins = <
 			IMX94_PAD_GPIO_IO16__LPI2C3_SDA		0x40000b9e
-- 
2.34.1

