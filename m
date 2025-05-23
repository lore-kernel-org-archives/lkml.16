Received: from EUR03-DBA-obe.outbound.protection.outlook.com (mail-dbaeur03on2058.outbound.protection.outlook.com [40.107.104.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CF00294A04;
	Fri, 23 May 2025 15:13:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.104.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748013240; cv=fail; b=M8ZUO2vSF4ylDnzc54nl9ndkQ4dgJ9nYHZ1H7uWv/holMrwL5r4tt/ZUZOBtIqAg5N1DJfZEgkYTxdDkOqfSPgLawIrDgb6gfxT1PGAas1g4Oitbm9/cj6HprvE76l+y+t1R4B/flXbdsCiO+eZyMFq5hgb9JnE1nvRo77/PZy0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748013240; c=relaxed/simple;
	bh=tclHQ/s4eFe3qCC+ybEq7QsWjqDxNbeKxoeL3dH6flE=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=ZlBryeK8NZXBCbiiYXcYy6/UjVkNkjhNXJgyd6v05nCaxEVRPOaxRy0d7lEatJuEy5kLESHN9w+Sf6+/OvJSw3mptMNJQ0aKlaRMmHFtiYUuduDfJIkUEJB9CFIKrNawDvUebnd+YYkhIO/6+i8IUnTl+357LZslX6LRaUt1fXA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Lj2IwDvI; arc=fail smtp.client-ip=40.107.104.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Lj2IwDvI"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t72oGVF64qmMxx33N4EPIZNKComdmDclBzlWNbFjgt2DT/rq15fCod6SibpdhxjZoSBAlpA6EkVoHxSywaCa+boXtSSc4BuaZ7iSi/3u33fRuWTj+t2fmeoaI4G4CoByAb96dMbsLoUuXOLhTF8+eP6aFpHt/d/hjhmTGfz1uIZ+Js/+XREkZkpaBg6Yhc6GYvAGNyhulEJC5W12lr12FR/h8Brs0tPaKtSYgQUvBlRzKZLujS9PZScJGPdY2Rd6UIBSRBrgL9s8HMyY0sCUEUA7HTap+Pz13ZKl+FRowOqLsNwfw43qD8nRECBvMQ1C0nRSDYWOHL9gsD8M34i0zQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+tEtQW60YbL6oovHtoy1yfaikBZjEGLvji46XN47itw=;
 b=GOoU07FrclaSUAfu1N5MOZrkNY5CZ2QUi/Janu0wprcItH8zpRb6ZJaXMH44VnnlhdFEBbWG6uKfMJab3+dC2zWnez6MVFjtVoOLBAhdN8TjBTWkwwiyQ+3VO9xWx5fwC4s+HEUgwE3A9jbphJU0O/iFBBh2Jzw2F/k48WBuxnJgCJtTcY9p3casSghqLXdVkxdJzPiPXBVUqegUwSnaAY3Z3+XLq/4UPIBhv7/cP4i/QZnbadts4Vb2q/HHDG8HjXpmPF/2WKKpjl64d82wfV+XOT6VUxbrf9TBNMtziWaiUukyj0TSdg01bvuKfWM+HdFA36KOhpQhRuY9/08HmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+tEtQW60YbL6oovHtoy1yfaikBZjEGLvji46XN47itw=;
 b=Lj2IwDvIz9pvEwhHJueg9P2ZVurIzrFVDSb9TZdD7Ut3l+ExKkHLamFgp7JlxM3FQD6JBPwzEZq7vtU7qSURNynffE2gz/LzcVBmkvxArjkv3W5MUKRcI7MVDoKZU34w+7shAPl9AjZsGBBMOxi4slgsYuM3sDLKYYBCyTuXZKtCE/RcuC7RwekPyprYcvKa+rB3z1Wvz1/9fK/MBmLgQFc8z9e6QvVpPQepQnN0Gt54LmaUem2iHW1YSE9YpaYpHCcK+aOYrSl1pmzgt3TpdOlgem5SrVtNdJICgprlChmPQW0f9PJ5lNpdXcz27/lEhOkyjcnmtYo1M4HMINPfSQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by AS8PR04MB8708.eurprd04.prod.outlook.com (2603:10a6:20b:42b::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.21; Fri, 23 May
 2025 15:13:55 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%2]) with mapi id 15.20.8746.030; Fri, 23 May 2025
 15:13:55 +0000
From: Frank Li <Frank.Li@nxp.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Noah Wang <noahwang.wang@outlook.com>,
	Naresh Solanki <naresh.solanki@9elements.com>,
	Michal Simek <michal.simek@amd.com>,
	Fabio Estevam <festevam@gmail.com>,
	Rodrigo Gobbi <rodrigo.gobbi.7@gmail.com>,
	Grant Peltier <grantpeltier93@gmail.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-kernel@vger.kernel.org (open list)
Cc: imx@lists.linux.dev
Subject: [PATCH 1/1] dt-bindings: trivial-devices: Add compatible string adi,adt7411
Date: Fri, 23 May 2025 11:13:37 -0400
Message-Id: <20250523151338.541529-1-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR07CA0086.namprd07.prod.outlook.com
 (2603:10b6:a03:12b::27) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|AS8PR04MB8708:EE_
X-MS-Office365-Filtering-Correlation-Id: 5a9fa9ba-5e4d-49fe-7e9a-08dd9a0c6f09
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|1800799024|366016|52116014|7416014|376014|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?jueFWhWhX6vKX+3w0cEop745oIF0zj2c9mOe8k6sm3pyxxZ13MIlaEjkP+T3?=
 =?us-ascii?Q?zQL2cGsbto+f9zjItslyz936cISy463nk3kJGqVlm/OPi4Pyat4Z5J0PF4/A?=
 =?us-ascii?Q?+iE8kn7zgkgiVW1A3Fh3WrR7ZBx01T1ADtDZ+vHecZ/Qh1Vv0zbbDoGafnZk?=
 =?us-ascii?Q?TOb3Wvoos1wEHKbGyB5MTLvwV8uFYntaGV5I0QWVJLbh0YA2QmEg/yLD03rF?=
 =?us-ascii?Q?0+RTQz6ZajNuVVs49dREU72rGa6penJOKkht3z5ZsNe6V8c+K/EmdLoBnMwo?=
 =?us-ascii?Q?W/e4KeRDPsoEeXil5W3KSAji76cjQgK/zQWAMhV+i/B/sa+GfYWPxQb2Nlh4?=
 =?us-ascii?Q?E7MEizCt80JSFzV7MLbdoQqMAYh2XuI4q/8xVhs6nP2SSvUlR3gpoaFdHLG3?=
 =?us-ascii?Q?KBUAl82Q71NI/O7sCb0h9we5RO47gBvTZx4qXv1wr3bRjJ3xnnsbWE3Ge4RD?=
 =?us-ascii?Q?J4KQTjzVEKMtckWPZnq/MkPMW2SKooBlYAj7zykMDrAHdPWkiI3td1k7USvi?=
 =?us-ascii?Q?m5xuzNdua18B+PQBAQyEL/JVTaJ5iqEsYQFSsm9GA33pSgWbXIWFIWq0O+Nt?=
 =?us-ascii?Q?Djwnli7RdjfHQzXHWCJbB/ewAiZ4PTHAr3RWUl1oxZoux5FMNqc4vfHQzhz3?=
 =?us-ascii?Q?C7F7bi6M7LpQKW5EA2Vp4TV+c2z4k6DcpUQVWSFvBh4sT5+gJKYDCkpyFfMh?=
 =?us-ascii?Q?ryZ0UT204p46ZZgLQ0kwdRrkV5EIyHC6fEnmXaFWuY/ynUZIThXLC81WCllg?=
 =?us-ascii?Q?1yN2YTpM2nxTuvWUteCK9mhBhwvsdPNdVX8j6f21dHkrTT/pyTiq0bvcU8vZ?=
 =?us-ascii?Q?QhhOnXKV7gqA964T4kPthf3PnVkVndq2u0hpEwDQrmbpCN36XEvGPbX6Mjox?=
 =?us-ascii?Q?kYND80BGwgaQLHb7dhPyUSe6pq0G13W5i9mIUnrl+8+IuPVLMgq5CBJaWckj?=
 =?us-ascii?Q?ZpH9dLbqShcK7PANoIeOK7pI+/EVZlh3sDwYaVo17GyuRDqFR7o2XSDMgxqE?=
 =?us-ascii?Q?+ARnJWOXFc72kmY2x8p3FgZS1kq5/zYPZyNr3SbaTcvgANjn9YGgu8QsXDhB?=
 =?us-ascii?Q?q9vNxQHyUJQFtabJPInYER8dwVDKX3mnBJJ5+WR8yqAXH+9gfue4ZknxZT3N?=
 =?us-ascii?Q?G0G1NSSiP5WXCBtUqE/gqKotQvCMtoKKgsTC12JbxPvNJ8m2CfZ2SDqJF5LJ?=
 =?us-ascii?Q?AGm9K+GFRhBn6MPa05Egd7f/XF+y/6SK7IZtF7fLc3adJCBo4sCR2YS+3now?=
 =?us-ascii?Q?NzNVt7TVHmfIfbTx0DtOovTm3Sae1dr5OZG9Q+VWzEfkkmvOuY2q1zn3F77Q?=
 =?us-ascii?Q?C2DzmIoeaEh3FP+rZg2U6eKqMTZPt0VIlgL8pbejbWUQsLfGdOOk7JUuptVR?=
 =?us-ascii?Q?cZoQJqDC5/HGfzR6urKcg2cXj467nNNgGorAvlymhAvpOjCSfbuovunLEhvD?=
 =?us-ascii?Q?mPycBHnPiHAuQfK6d9eVwipTz+TUlX/M212UEtuY/nBasnj0LIffdHPpHgml?=
 =?us-ascii?Q?1p5x8GnbMB//ZF4=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(7416014)(376014)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?Ko1ogkWSSse1NBFJrw9yLFSgp3wSC/RBPMb4hehIctZoryshLai+8FlP7Fn9?=
 =?us-ascii?Q?lvH9PhmQVWQ7d++6CdmnGbUR01SNmnMFuQkAlaitJZDwJyDei1FuRfpA/oy5?=
 =?us-ascii?Q?xFTqa1sjjpW06TuCkLH72/z0vCvO0ZsYCJgcNLKAwWrO2wMPEtU1uXAPsPOp?=
 =?us-ascii?Q?mvpLuK71LRZIW9JVISAJgQmae7XadYioylvB8lk9zGLQw3FaT5adFGiWeTP+?=
 =?us-ascii?Q?yMuqJtIiTTo6+bYKxNpQLjsUHqdo2MkQKOo5XrFMKwOOj2U81S5CJ+e+D0pm?=
 =?us-ascii?Q?nzKV+Y+E9n24I+SReyBtggYGkV2iBLGMwTmIpcpfP0xMR+FAJU+OB/pBaFc8?=
 =?us-ascii?Q?7//NG5tcemie57hbzG5JLIJOzcvWUiw0+v+1aY0odSG+sVBf+Pl4J367kYRV?=
 =?us-ascii?Q?WW2xVC/opPyJnqtjC8XtdSUtUtndbMj+VJRsoClNqbHznTo12IMPzl/CRS/E?=
 =?us-ascii?Q?WprYjmG387R5Uwq47kAigqhtGGm6CxwBSLm668HNzOP2t8tnPlfRew2roupW?=
 =?us-ascii?Q?TgJYGJv5yB/gETskhfaT6YHfF3TSKy6XbKThQhRzskLyOLEtb0VzTb0jtReL?=
 =?us-ascii?Q?F+Osp9NtOo72LB0F7IxM1leg95qeehzm3ZSU2I57JUNZGDIdMYnuH/Q+nz9U?=
 =?us-ascii?Q?hWDr1IBElGO1HzrS2MOK0Si02yqm7Y940NRql+7m1VQoCr3fCWoMs+KaesyW?=
 =?us-ascii?Q?oiNEArqkCyrZsRJgByppouLluESrYz/MCzVXVN1ZvDCZNt4zJ+NiX/PckYtL?=
 =?us-ascii?Q?Q6mGyIvVeh5xNsOnt7nwKJUZX8IyxkBJ/Be9EXhjIjz0wmrDV12gjZjtwTkS?=
 =?us-ascii?Q?MH1qRtJbszx+nhhJo0A6lbblvcYos0AAN21rEm7HqyjhAF0IIVhyXvCBq5d0?=
 =?us-ascii?Q?R6ltB52JmhOPo0P5pyVJdkf/q6YBtpLk01IHslP4A+0Dbi48CbOXdhs6mG9X?=
 =?us-ascii?Q?BaaAfdNl3ad9JTki+QukNj4EkCwnqWcVypSyt+joBvf7DWNaGXQ2v4+iSyoy?=
 =?us-ascii?Q?6nMVgj2djsZEvMsC2eI4qdyQuyz4tcuetzcS3JyTd9jfKKQUNv4xXGHFpRvA?=
 =?us-ascii?Q?r52vILoxYTMUtl6v/MD5BfTlg8nbCR79m+WhNau9l0sfUyjKguu3b517oaIK?=
 =?us-ascii?Q?rObcBKFY4hRphpegIkDfGPcl2f/0+VV7z0OoIRY30XzouUftscJRNlVmFbc/?=
 =?us-ascii?Q?CAwTOyLw5xGasPyq2kpmexOpgpE3tEDbk6KsH8iDMonD8VJBNkaTOKiC88sY?=
 =?us-ascii?Q?9TufQe32Ww990m+vv1/gQYa1sYfLSuufoy5qpg5vP2yDwobPeU2DaxzLNq6+?=
 =?us-ascii?Q?1fe5tl7wvGyE56ugcAz8DYp0c4rnFjnxBakpo+mhA66OH96S3V7O6moVH51Q?=
 =?us-ascii?Q?XxXRidsZrFWXTmMWiVITEFA65gk6n9/WjC/KmiunKH+xs2VYiqy1ckBsnQwM?=
 =?us-ascii?Q?clww+eQZVaM1SHzgC4VWOe2UEvuv/czqX3/OGfPvfZzDWAn97qPU26LFV4q4?=
 =?us-ascii?Q?68WNvAcKXFDMCOi+t8Sj5rX6sMWS264Oig0BhNiTQLoDUds11MD/6e4TAR2y?=
 =?us-ascii?Q?WgxLr82BIu2khmxZjPE=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a9fa9ba-5e4d-49fe-7e9a-08dd9a0c6f09
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 May 2025 15:13:55.4816
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tRNyRmFZ+0onL+vtceesYR36Fc3Ax/o7GsRMdz9+s6iqQrtG99fCCmqEKxWB/qBww/Bb076H6Vu3Bv4NZunSwA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8708

Add compatible string adi,adt7411, which is temperature sensor and
8-Channel ADC.

Fix below CHECK_DTB warning:

arch/arm/boot/dts/nxp/vf/vf610-zii-scu4-aib.dtb: /soc/bus@40080000/i2c@400e6000/adc@4a:
    failed to match any schema with compatible: ['adi,adt7411']

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 Documentation/devicetree/bindings/trivial-devices.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/trivial-devices.yaml b/Documentation/devicetree/bindings/trivial-devices.yaml
index 27930708ccd58..38bc1937ff3c9 100644
--- a/Documentation/devicetree/bindings/trivial-devices.yaml
+++ b/Documentation/devicetree/bindings/trivial-devices.yaml
@@ -41,6 +41,7 @@ properties:
           - adi,ad5110
             # Analog Devices ADP5589 Keypad Decoder and I/O Expansion
           - adi,adp5589
+          - adi,adt7411 # Temperature Sensor and 8-Channel ADC
             # Analog Devices LT7182S Dual Channel 6A, 20V PolyPhase Step-Down Silent Switcher
           - adi,lt7182s
             # AMS iAQ-Core VOC Sensor
-- 
2.34.1

