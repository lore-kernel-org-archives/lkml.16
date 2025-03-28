Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2084.outbound.protection.outlook.com [40.107.20.84])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2016201260;
	Fri, 28 Mar 2025 02:15:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.84
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743128113; cv=fail; b=KEz640TOPATBktPh7ZQ1Xm4cHpREIRq//Z/zjbOsxfAdM2AMQb+g8/kNZogYrnSV6cEl/DAa7KrGnGerYKAPwzpbqVLjz+fMQQZSi+tVgaFVX4bxrrgGaGXM8XtBLgaW3dODopddlfoNao/6cUM7SHEf7JkPb2xwcTP8+vGKRyk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743128113; c=relaxed/simple;
	bh=5jvPSOT3ybSBZ3aYuBXsmn/ohWezjfKU8WuGrEw4McI=;
	h=From:To:Subject:Date:Message-Id:Content-Type:MIME-Version; b=dWCBYUlTIHnOZdx3AAgF6dQYzdQHuUPxxtDXIEz5/JYGhI3xPRgV99DvuhJtmnF0sZCmAbABXecCNntZn74wFa04UC1bhs4wMoJp0pst7nxv4sl4zpERe0k0EU1w3Zmac9+16FG8UBuzk2CucgdkQzAO7jzWreOH5oh3z3LRPmY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=TTA3W9qO; arc=fail smtp.client-ip=40.107.20.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="TTA3W9qO"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z/WNfdrX0raPZSZle28iwbTglYZ6rSdu5Hqy7JL9Bs3SR8JXMuqstQ23mfDdfnn7n7dLL6NjlBCT32NLVAQrTCoxVZfgmH0G9l0SpL9RY6ArlhDYJnuVnYffVOyjau9H9QNLLl2kytvJyFViT7jZByniUi2FZn4VAiBW0w+agdchpjW2dHWb/neNdetVucVy1pxERCAq3gaO2F9w+yE0Y3zHWLTKos/qjvwasywyAszO2XMiMwANDVXvo9QlB0WhBGD0DHCuwSiryOBspagua061ziD2VaCbh27AAEx0Vz/xdgbE/XNmF+JG/hwrxVOJjYZ3pn9ceh25SHMRf1ETPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Nfq3otGA5ILHZSuGXPi93w6wqQwrmpaPH7nS08yMxDI=;
 b=BRSYgks9tPAD7PsW2J0Q035rw0cPTsiYViSw89kaQPt1HupnYIy9jCY6ZGo6/QYdqggC6UAO/aMYA/JTc9KHLqberxoWt/y65q+enz9tefNsAHttov5aGUvDx5khV6saBk9cyXkYmArE7Yfi/A2I4uuVMFArUAEj9i6polo8THlzcVVMwfg6XG+dLDKbkoY/ZbSB896jJ0Q+RfoX1TxOMKRogBqgUQwaNstcYzazAIqla0L+aHLF2nrJ2+zjtehcwg6CJYyvq8of/YsXwNukTpR2HmVFyKXMCKWIOmGEnuEHrxhbVu3e0QzMuaLrRCkauQQhjtAtOsuocUFSjGFSdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Nfq3otGA5ILHZSuGXPi93w6wqQwrmpaPH7nS08yMxDI=;
 b=TTA3W9qOw2O0iwTBI2xsXp+lRgL8SB62/cj+Ob8TmWENvkQjeoP30BxcksZLcu8Cf6EwWH1GBEulVTUXS+/Z0zLa6fUT74KjLhKHv1xPbHDvs8IYuQSuMdQeIkjMvTbW7ziORBkJM7FKmjTtV62uekpEq5KkVJr/aZz0cKPFA0tcnUbvn+v1JKtv7i3pSJ+dZPQ2iAQz0nq2NWwK2juTkl6llnmiaMRPRJr7FmF1a/zl7GrvaRDJ4gq64kB+dLwFXJ3ILnAy5jJRUP2osaujApcfLvHzBcoheJsCH+V+zMrrtj5sjlupemraXYsKXoURpllhz0TFr3hJRyTLb/mZGw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com (2603:10a6:208:191::20)
 by DB8PR04MB7018.eurprd04.prod.outlook.com (2603:10a6:10:121::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Fri, 28 Mar
 2025 02:15:09 +0000
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::7be0:296:768c:e891]) by AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::7be0:296:768c:e891%3]) with mapi id 15.20.8534.043; Fri, 28 Mar 2025
 02:15:09 +0000
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] ASoC: dt-bindings: fsl,mqs: Reference common DAI properties
Date: Fri, 28 Mar 2025 10:13:39 +0800
Message-Id: <20250328021339.1593635-1-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.37.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR03CA0099.apcprd03.prod.outlook.com
 (2603:1096:4:7c::27) To AM0PR04MB7044.eurprd04.prod.outlook.com
 (2603:10a6:208:191::20)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR04MB7044:EE_|DB8PR04MB7018:EE_
X-MS-Office365-Filtering-Correlation-Id: 7e3bbda8-1162-4762-4598-08dd6d9e5cdf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ys/xkueZ2gYpr2W+dlggOr7ehExge8y46fU2Ns3jvYoRIMOO3Rw1grkasHFM?=
 =?us-ascii?Q?ai9SufBRma0PsYpCyYU8muBvnnfJ8lEJjsPgujrmaDeVAmX1YY7HdcZgipe2?=
 =?us-ascii?Q?Dd6tY6WT0Txuk2MhflMUldaYZlxuHZ9iEh8za/zpNBZE9qSzOs9pFGDZNsrv?=
 =?us-ascii?Q?ChAPGVNM5Z9yJlApPIDQysGAQq1YJt5lfMUpLZe0lsHGX1f/60BTZqsLh4zH?=
 =?us-ascii?Q?cPYjPZxYbfS6mpLvqkAcI2zLZ13WFewOhX7XsB6Z8jwt8PLHKzEjbn0j33fD?=
 =?us-ascii?Q?caAIetui2eNxtdmAgsA37xZtzwnuYOW7wbczW+MJIahStOY+utckq64vot0z?=
 =?us-ascii?Q?lX9lfaSWXm8Fv4Io95kyCg2q/rQk7zHANA0ezQa7Th313duyFpfHxHWVGlTz?=
 =?us-ascii?Q?hqC1riRmm+Bn2pSd4WMEGEPxLUsLKdH9IkjL2rd+TLhWrhmx77//GojDq1KP?=
 =?us-ascii?Q?ZbT+Q8CcAlxxppfvmM75fe2nCnDVkebVL0EfjolM+WEIQuuZNoIid2jt/vYO?=
 =?us-ascii?Q?b/q4ketwAS36dCYYB+0dOQM7EbtsW2TRRLqLwfd8ydc60Nfvv5KZUH5FK46z?=
 =?us-ascii?Q?0f6s+uZsj4RCxtk/W4ehYJ/23j3Tnz89DqImWjEH26OSE5kGG1HTLOWW+pLQ?=
 =?us-ascii?Q?KE724oznM6+/rP4JjxaQH0ymjubNHcIT/RjPXvkhZ+LZnwK+T1uTg5QOCRd9?=
 =?us-ascii?Q?QWkJBi0xDDKd9/YVWdwkyfYaNM+X/8JZR6XMCN80mOEznFXX595LNq3r5ynL?=
 =?us-ascii?Q?QDiMOQNVLxRA2VdlJcXy5rKIMDjOqkMRneKf2p3wQ2H3Aa2EbUjAisnTC50n?=
 =?us-ascii?Q?i144Aywc2njWzP9AmbcOGGCpRtNSMt8X2nvRT9cDAdLY9YAwDegXBBhW0xRi?=
 =?us-ascii?Q?222cXBeziQj8OB+c4ahns5sgKCvGZYHHUOuyzRYvGhR1haNJmItdOEjH3YYD?=
 =?us-ascii?Q?zNm/qrajl5XnhVSUaNlSVfwcxNQFA/YinOoxAX30aWiw8XwBaE1thWidJl0h?=
 =?us-ascii?Q?h7FA7Dsshs+IcSVtGksEGP/feKR//LoScAmkUOOeXnN3ss4Nr+DxKMB1hY4l?=
 =?us-ascii?Q?tqI7POn/WT2lvnz2ITUYMdsjbaZjPQbeOO1jAzDUYkoAJlDY/La7Fr5j1GKt?=
 =?us-ascii?Q?e1oy0oy3fdEAvSBd/Y4X+Uv1dA7OBwBPo1e5gswpuTeb9WcCxvgJOTQjADwt?=
 =?us-ascii?Q?I0NDNCGy27wbBUdBa8qg8bxdxovHIwllX6s8F6kGM+HkJi4SFvcqWNedM6oV?=
 =?us-ascii?Q?TTT6p9VGT292VbMDEVMGs/dthmMYboyecYUL8O8ZmKdihTnlepWoDfPsJtbs?=
 =?us-ascii?Q?Sf1AWkhdOXTIhZy19vg8zHLf/m3DGfuIxY4vTXM5isotXTy5jL770zQsD6Np?=
 =?us-ascii?Q?TrNgERX3zLJlLFHkvM4VXaN/61SdKHgd3MGB6qNMUxwl9XGO+WzSXt52dKge?=
 =?us-ascii?Q?/SRowITB0LZlOSMuguqyTu8aIVFBPinY?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB7044.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?QlATJvCMMPxtRmrBOUq3/0TbnqgrAwag8ObwW1oaZDnA4DdsjNNNtBER/TEg?=
 =?us-ascii?Q?6ZtBdKLqRmeZb4FwbPic45TFXINGLYsicKzfeTgQdWNvJl3bLrdb52kyASEC?=
 =?us-ascii?Q?ZjDnr04UgjJkHaxKvwn2jsIELYlpqTIL863/qguVRXbAgkfwtFJ6xKNYyvWr?=
 =?us-ascii?Q?zUxhcvQ0yPQ2//OoOIsLuUtFRHaf25q3p4icMndNLHMTEnaYgVzE/cBs7DEE?=
 =?us-ascii?Q?YF4VzFsvnQQdESR6Txp2Uw7EWr4F+skgEQ1ecoSUSVljYKk36qkTTLwjAJux?=
 =?us-ascii?Q?egOLrd8vMRqQ4Mu8BoEXuHxMazKt5cmBXRsA7T50guOQi/1BgqUowL7IZtHE?=
 =?us-ascii?Q?Bzi9qiW2oE+Qp3yo0e9arMeI7B5AjJ+slBXXJTM+XUnfCuPn6qISnMI4Zg5I?=
 =?us-ascii?Q?dE4TbMI7zs4Fj2sHZNdWH+0AqpyUR55tzfM4Z+M4zvoj5Fa7Ot3iFUE/62iI?=
 =?us-ascii?Q?IxaHPXFQUdDg3vag3J9qXhUEK34i1HUw2HLXcWMbCta8Ps0YotfGYpNTlVqt?=
 =?us-ascii?Q?OfCgbtvBQj8zMCgGNSx+a4oK/3H23GXN4K+fb4w9xHedXIWCOjPS1qf74BWm?=
 =?us-ascii?Q?7/6sk08KZthstXs7LVrY5Uq1I3RcF1h+UgX4TIjyY5kG65e00Y2mVYY2tj9+?=
 =?us-ascii?Q?Ncp82vXItjLC4K3wNfrFKEcAiGCE+LTjld/7ZFcF7mZ2+np7a1tAlmZLChby?=
 =?us-ascii?Q?OqjnsdntwURM+U7HFKWYHAeQ1EptmKwr8Jde5n+rUI/640elg6N/aRWXIBQO?=
 =?us-ascii?Q?FcT3PAwcz+p6fMW3mWUPxBAczsyJkxwVWcPQ9utgVRh0unQ/89XDnCIf+qPy?=
 =?us-ascii?Q?HsnJn9iW4pKNxNSsaxlsn8mhv+GMQ28nh1BJqqZXRVpmKNBsbnK7frz1mHjj?=
 =?us-ascii?Q?QBcrknWIXVgP1lWcOU/CQjkie8rONnxXQIOhhS50/J3aWStPnvyoHZj47mMA?=
 =?us-ascii?Q?4aSZUahoEK2AYn5D5dw0ZZdpfWbPG/ILDlGInY+4RqCPf5CF4dhj5FhWXfiG?=
 =?us-ascii?Q?CwTEfqqvzBcRTyVgzJgmSn8Tm9DZxUcDRJdmWtWuO9FRW5FJOfqvDaLbzFlJ?=
 =?us-ascii?Q?6kKCyT1kazIU7P8SM4bkCZ2N59s8VJyeLoX0DwTGgoCXE8R/e9eWqLvNZFge?=
 =?us-ascii?Q?R2JJFqGSyveJXumKLgP6UF2FKQiW1bgBS+C/bZ8fHBuaOMNuD4SnwDnCRsni?=
 =?us-ascii?Q?LJdEOckfgAChLbmTBg7OGUkzSAB2wias47/eZU4Wb+ugH+54QoRkB6i/uAva?=
 =?us-ascii?Q?rx2nvP5eyV2YHAxW0w7h5LVhfhip+Cp0GtEkFzi+IWKZw7gvEnEiOx3PIxau?=
 =?us-ascii?Q?UPC4ZKmAtwa8yTpcewsDRNCp8e/IJwxCbXpg+PPLxegquurrpBHLCFP5b3TU?=
 =?us-ascii?Q?BcIIa0LiEgy7HWoHtJ13abfpeSV9OdrVhU+im4QICLEp7r2STE9pTIY4pipT?=
 =?us-ascii?Q?/ljPgc8Cm4lJHIqY+iJgaU0xTYs5qC1O8Wpvyx/WRO1KAT0R74sx4jCTa76+?=
 =?us-ascii?Q?cpGkMz9zT4+J8Wf82XkU66cr7FWL7/Bf7ZTEEJbeVN3Arwe9Rj4wLiP9FfFU?=
 =?us-ascii?Q?rdKxK2Fx7lS+8H8rnFgMe390lv+t+/xRM6MpJBEx?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e3bbda8-1162-4762-4598-08dd6d9e5cdf
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB7044.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2025 02:15:09.0620
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +tyLMhg5Bc3m3smdx1iXvhic4kv7UPR470VxIyyf1LL148Z2NIwLe7q34sJHL1q8ZjXSCrNdka4UKZMpAcY86Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB7018

Reference the dai-common.yaml schema to allow '#sound-dai-cells' and
"sound-name-prefix' to be used.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
changes in v2:
- add constrain for sound-dai-cells

 Documentation/devicetree/bindings/sound/fsl,mqs.yaml | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/sound/fsl,mqs.yaml b/Documentation/devicetree/bindings/sound/fsl,mqs.yaml
index 8c22e8348b14..d1ac84e518a0 100644
--- a/Documentation/devicetree/bindings/sound/fsl,mqs.yaml
+++ b/Documentation/devicetree/bindings/sound/fsl,mqs.yaml
@@ -28,6 +28,9 @@ properties:
       - fsl,imx95-aonmix-mqs
       - fsl,imx95-netcmix-mqs
 
+  "#sound-dai-cells":
+    const: 0
+
   clocks:
     minItems: 1
     maxItems: 2
@@ -55,6 +58,7 @@ required:
   - clock-names
 
 allOf:
+  - $ref: dai-common.yaml#
   - if:
       properties:
         compatible:
@@ -86,7 +90,7 @@ allOf:
       required:
         - gpr
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |
-- 
2.34.1

