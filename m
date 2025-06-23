Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013017.outbound.protection.outlook.com [40.107.159.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FEFE2D323F;
	Mon, 23 Jun 2025 20:41:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750711273; cv=fail; b=BA3Xwq1vXfOw3Hgf63kW6NyS5TY5PntJulQ6malh6W0Ulje3PfGHaEnfHfyW851j1b5LO2zPVrcShAOgIgmSHhW5isJYGSRDxHK5HzqGXxrdTXsIPSgNgOynjHk6XEnpNivIKqTU+gOGaziUxiroSzpWOuEbahuZBVZYjjJJhog=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750711273; c=relaxed/simple;
	bh=C5hYULTvsu+uCQpNdJmLCaqtpHmVUrFpvYQIwDu6C2o=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=ZPV55Uc1XDe+53Uce4ML1E2SXUnARKgA9oOWHSbl6Er93Pm9GaBZfXJRHGusEHOCHfXvMInoK9ccNlvftT6BoWr3bxlGXs7JaQRArknt9nxqFhJoTGji4iuVZO5ASaa2/T7H6ZBpVKnaEQEZ6Zr5b0w5cOvdW24npVnU2oWpVLo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=e3qpw8GI; arc=fail smtp.client-ip=40.107.159.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="e3qpw8GI"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dB5wtEr0YItEot4cy/dHXdKBvQZ56VN1WIu7BeT5VbTj/FMzAsFCY+N035pUPGz0k8kpeYRuFu4PlqGUhGKo0yUzaGZcE25ZRHLdAz0TbYtuiGCYEUL75TsbWSnh5iz2t7IQHHJ+7OwPH8/8Y41TNA5TTNo2ak9ku7Zp87rbV59mMAXkOzlgKp75mE7sEP6pCuHxeYktI1TdLECO/3ezl2kG1fPSh1g1/IsJ4tzg7JHdtKnO8KuqMsDqRepezIdPJUCKx1EfJZK/cPmsUvF00VWa81v+DoMEPLEWuTWIWVUkW51Qf0pJjXlmWcxfQqTgKHHvuApjrPEqH861bEbd6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LGRLR1RiE1m4cV/vpYfuV8bVcjLYgmRRcrMjnNI42tc=;
 b=hC+vq2aNXBsjQnupEM+MFVGKqX7Ch3fdo8b1q0eDn6YODEUZgIIqW4LkWXKqKubX1b1vyVSSbryudtwbYLWbE+q2QduUWhuAelv9l8jVObtl3BcGi1L8S3KhlCEWhaThH6DDmDKG5bNzKiozdBFYHvpQTy+XE3Yt1z38umQem60BGUX6nH6q6aeA2xqjLysNRYfyjaCk+b7zT4WgMYbjWr0izkyW8JToJJJIDRUYJBuydW6G7OzXbbni4mLxRi3nF5IuQ0qQOYi0t5Qk1neNqwuLkA4sDjj/rPW01enVavOiYhnV8bBeVwsz56CV0qrF0qqEhax032aBX6idv8IMDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LGRLR1RiE1m4cV/vpYfuV8bVcjLYgmRRcrMjnNI42tc=;
 b=e3qpw8GIrftljLnyzn6Hc33lI14PwJ0OeFCzJadsqcEYK3w8R0pUXZbLUGRQ8E4xkSSLwrWAl8C79L46OMHQ33Nl4/ocg5znK2ebmBZurTDK2ivs6BqwqhgLK8TBQ28iKDPsfkyQ9tbrdXut/GGe11WQrren33nyYpjExXkZZVfmEJW0ffW7//ek8uvMOJ5LBX4SKiz3aOVNzB+Je4zjAJOnXJQca+gdS+pKJvFmMMybTMhbq2Q0pzUCxAEGkJpB3Dj0/yFUS9TY9Kp77djS62+NCio0nA9ggNihCyJJ4QTMMN3xz26Te9WgySch/UEyPMvknHjc0oEDHQB9NOu79w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by DUZPR04MB10061.eurprd04.prod.outlook.com (2603:10a6:10:4df::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.29; Mon, 23 Jun
 2025 20:41:05 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%7]) with mapi id 15.20.8835.027; Mon, 23 Jun 2025
 20:41:04 +0000
From: Frank Li <Frank.Li@nxp.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Michal Simek <michal.simek@amd.com>,
	Fabio Estevam <festevam@gmail.com>,
	Rodrigo Gobbi <rodrigo.gobbi.7@gmail.com>,
	Naresh Solanki <naresh.solanki@9elements.com>,
	Grant Peltier <grantpeltier93@gmail.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-kernel@vger.kernel.org (open list),
	linux-usb@vger.kernel.org (open list:USB SUBSYSTEM)
Cc: imx@lists.linux.dev
Subject: [PATCH 1/1] dt-bindings: trivial-devices: add compatible string nxp,isp1301 from isp1301.txt
Date: Mon, 23 Jun 2025 16:40:46 -0400
Message-Id: <20250623204048.2493819-1-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0002.namprd05.prod.outlook.com
 (2603:10b6:a03:33b::7) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|DUZPR04MB10061:EE_
X-MS-Office365-Filtering-Correlation-Id: 3d18ea3f-d7f5-4cf4-6e4a-08ddb2964605
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|1800799024|366016|52116014|7416014|376014|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?i0KE5VrTaUPjTMqa62lIGcVRbs4fCI4zca3Rw7SmY9Fy/hUua5k59hVS4YaS?=
 =?us-ascii?Q?qUdfH8+TLrNaSCLpJDPyYxDVO8MPHtOTsxImhNcJl8b/s2iWnQiiwMVSUQTA?=
 =?us-ascii?Q?ZZtNxCSz/KlCg+FA4D8RMSw7C2x7m5D5O1zMVio67de9v6KJgWX6vGGaRGPh?=
 =?us-ascii?Q?YoKOlN3DF5CnUIAxQ1ChWvxZj0zZoZcEFkeSdh6ViCeTi+1nndRQfTOkTMCz?=
 =?us-ascii?Q?XzuvmR3qrB/aDfYzOQIMrSdAXb4usaPpleW6Rj2GfOw7e5+66wuTiVgmrtW8?=
 =?us-ascii?Q?nK1XsrMFTjWlpSauppwsrE/qmrra11algI4uv+GoWCnyRSjCyuZENHGFwDbL?=
 =?us-ascii?Q?OFrkpqtKYP3I2NqqrxirtRHjSBR6JI3dKx7cYYvAG5FwNjo6av+rB22Q4w3V?=
 =?us-ascii?Q?SUQpFO29iv2cVj0WMU7Bb2AU8nivf0+hMBuDSTRsChuhyaoj1KfxcZpUHaCE?=
 =?us-ascii?Q?1hyprBHy/4OuV2rxPYzZSalNDk9RdNmVmUxr+FXlpirZsaGyTb4QQPbCFBtW?=
 =?us-ascii?Q?4prPH++h/SnzdjAQRSfVqD1IvkqwLqyEvCAe2mLK10Ocl90CQq3uZ/2YWeHC?=
 =?us-ascii?Q?nIia3f+eEG2xFvobhBQqABzNkjAthJX9gfC/zQpXVRNpXFyuwrhB2cZZ9QLf?=
 =?us-ascii?Q?AtSAs6msKmcFbewAXq61iSSv4miJeJjZA0W9HFpjU4AEX5groI0JNcu7YSA7?=
 =?us-ascii?Q?CzqaudUqFXf6UmM9pb+VSyDkNdhjKkH7kS6XNWzJ0pkeOGl8ldd8lG4lJnmX?=
 =?us-ascii?Q?pPhHb4N+MejMQ3uhhCoQN57+mXB2VepWuV4JUTj/VSttqQM+B2AYjll7mPFG?=
 =?us-ascii?Q?XY2HCqY6ig2S3gZ32EF+rSCnQXX18yYQAesWKgxE+bl0F4MEZ2uGijSuoBn4?=
 =?us-ascii?Q?iaW+QpG8oovML27PEZz+Fhd/LYHLgFtK3jravrwowy7ODLAJqdLWlQq4pewn?=
 =?us-ascii?Q?Hr7oyCaEUjgUsNwHcm2EFKq5mMqd14Tl03G7xwpr5T38uyyTPeDu2tFgJ0pf?=
 =?us-ascii?Q?HtxNjBek642fI0ve+NA8NpuuJ/STCF/ix/6ywe1ynyScY0BdeDfAQrmh8lmw?=
 =?us-ascii?Q?5ibDUMiBGpWOMCwYicIO8Hq9uAejvCUhef5rq0xZd50CplKksMnb8K/pm49N?=
 =?us-ascii?Q?K3z2UBPEGQrJ9IeqCFTZM4p8LenpEXaIyQGdpdu9nFFNK/yA8FwSEKJNYKQ8?=
 =?us-ascii?Q?ewtcivv9Bdx2PnqKUhPpVYRM/wNCuC2NBwYG/grJx6OSeui2b3+foemdyxQZ?=
 =?us-ascii?Q?zyTUD0H9jtkSococFOJSJQfS7E2G+ZIolOENR/S61m070NS1gD3TaXGn0J2F?=
 =?us-ascii?Q?6JyCeUAJFqBwozcZAISbcFn7sJkfOjVOp/FSZygQhJfEv+VVQVN+WCkl9V25?=
 =?us-ascii?Q?hbtJTHYs1tkQWZJCkqYVPQGrp09DHNb+qrZbwAdYMwKWgaV5WarCNPgivBH5?=
 =?us-ascii?Q?1ndrtKb6jvU5LtdmBZuQBbag1+2twEYVc1ewo+iSTWjQ04zP+6YxInqH6Xpm?=
 =?us-ascii?Q?CZ/XIE64LGqDsgY=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(7416014)(376014)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?CV4vBvGTccXyv2n0TOmw3QjkpcPGfwh9CaYDaTgqI7daG7ezkie717eaR6eP?=
 =?us-ascii?Q?bfX7Krsup5xb8BJodokwigTTa0no+Zdm50uOt3ntmhCVSXtKrGJPOuGHdar9?=
 =?us-ascii?Q?FySVxV1He9mLTvUw3tZv22paVdciY/+HIsKpbhT0vgfPeTpHFEwVj7IJ1h6u?=
 =?us-ascii?Q?sbGsMENNz/Qh8/KmYGodyZyh6AeOwpYnxEwvchCssA0kJd7cQiA0UlhjZJdt?=
 =?us-ascii?Q?C2N3VGKNKxC2sbqoY3fipKadXGnIe0dLlOMLroh12VYb1eysaIXIam56p9t7?=
 =?us-ascii?Q?nRMebSzsdVEdQKBS1MwlMy3wGViY5sGueZi3TXwlM++D0+VahfuKmfJ5Vl4J?=
 =?us-ascii?Q?CwKHTItTHDp6eGOqqrbT//7xT0dpWxPF/GmV3l2+D+Hd647NrfTiGFMNQzca?=
 =?us-ascii?Q?HR/K5DkccDeZ6qVugRd6hEfLfprRhjR85Eul9EJLG50dKsLtyj8YOS+RA4FZ?=
 =?us-ascii?Q?VpW0agzx3SEEF7iQQ1Bq+EYQt6+jaTfzzoFRtb7v9H4R2LrV51nMpKe6VAUN?=
 =?us-ascii?Q?GYHvXHJJCUVjOJbMo3qTdiLx63X5bRUOinH3yWDTkrkMyIhTGcuos1oqC85+?=
 =?us-ascii?Q?SbXTsfzUBL1Avy1kggUtKdkb0o8Bg31Tv9WMYId5cWRXPmhq8VwE/kHCUger?=
 =?us-ascii?Q?W9lCILIbiqy0NWw2fwNpJE6y0YFZ7x3IZFHko4YNuAqV3pMRLMvWfwWm2TR6?=
 =?us-ascii?Q?ONXUi9b/HD9nsU/BOtRUK6KSe8t/eqmkzrVm37QvUM50wwMHWPLd9sFG7NXQ?=
 =?us-ascii?Q?FiSY1FOE8dXdnnYKK33ySyCowEAlk52lrsfXmpBbYYxYl27jFIAoIzQjaFfs?=
 =?us-ascii?Q?K8LEGkzfHh2u/WsoqBLLISp51xw3Qo7GaxuUCb2JOB0sG0eeIaSVhGM/JzwB?=
 =?us-ascii?Q?dXYr3NHURy2U/5UGbZM2aTz4XlYb5pF7E0V1akNGL5YAvk5PZ0eemXIg37H5?=
 =?us-ascii?Q?Mnwy+M8W1luzXgLyhxHpepasXHLBu9fgdc9UE9iwjH6PQXfS9LLTHpbXjJWf?=
 =?us-ascii?Q?s+KRUvKCJBB6+RzZYZtvBwjzxpu5MykHPJXHSWCoOA9PKRSPmkHHQq94rmJU?=
 =?us-ascii?Q?+lbOtFONKLhpD2pPwZOTK2B/VGWSP0QGekeg2L5eeRfQDHqRHuJm5F3LAUBB?=
 =?us-ascii?Q?Fc6ksG/0N7buAJMTfuSeiFUwLRopDMCfk09oJg22Iynej9CM4n7cxqatTRyA?=
 =?us-ascii?Q?3O107baJWZyt4Yi7BrFshIR0k2zx4WU/gRdHMgbBJOCwJwMHCLNqse+0gm/C?=
 =?us-ascii?Q?K9sCr9EGjR/E9xjp92V0Nm4nB/JAA0JAmIuCTbrx0gW5ReF7rRkiJ8ZTQPf1?=
 =?us-ascii?Q?DEIi7yDi1BqRDVTo162LQ8j65vllpl2KQft9z6vKz5BG3KGNd5/nNB+x/Qjm?=
 =?us-ascii?Q?lIjjEi1Vh3MmOO8tGhaKhh5DsOmzPRxPR32oQt/Q9GgMg0PRKNDYtxJIQpfu?=
 =?us-ascii?Q?36+IYlllhxXfybPRlMnoXcqwz3Uslvk+269MchchpFi5sxUF0NEtqdJBKJEb?=
 =?us-ascii?Q?YxzeJTM0qHxqo1og4yrrbEeWjvHFYldol0Qfe+MNyISYaLR1MkCjBh1uY1Fg?=
 =?us-ascii?Q?zTd3MSC748RddhrG4TZsivbE8hcLKYJJl8/6AXWN?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d18ea3f-d7f5-4cf4-6e4a-08ddb2964605
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2025 20:41:04.8212
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nF8EEBvNC6je0TJch7AbjJdhS1jJOKCgQn9PlnVEQ+oHhf/dW6c3TQnz8HMTDcWHB5mLKyZdVWQAa85IBlJSZA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DUZPR04MB10061

Delete isp1301.txt and add compatible string nxp,isp1301 to trivial-devices
because this i2c device have only reg propepty.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 .../devicetree/bindings/trivial-devices.yaml  |  2 ++
 .../devicetree/bindings/usb/isp1301.txt       | 24 -------------------
 2 files changed, 2 insertions(+), 24 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/usb/isp1301.txt

diff --git a/Documentation/devicetree/bindings/trivial-devices.yaml b/Documentation/devicetree/bindings/trivial-devices.yaml
index dbec1300bb7ed..c2d5159054596 100644
--- a/Documentation/devicetree/bindings/trivial-devices.yaml
+++ b/Documentation/devicetree/bindings/trivial-devices.yaml
@@ -310,6 +310,8 @@ properties:
           - national,lm92
             # Nuvoton Temperature Sensor
           - nuvoton,w83773g
+            # NXP ISP1301 USB transceiver
+          - nxp,isp1301
             # OKI ML86V7667 video decoder
           - oki,ml86v7667
             # ON Semiconductor ADT7462 Temperature, Voltage Monitor and Fan Controller
diff --git a/Documentation/devicetree/bindings/usb/isp1301.txt b/Documentation/devicetree/bindings/usb/isp1301.txt
deleted file mode 100644
index ecd607dacba55..0000000000000
--- a/Documentation/devicetree/bindings/usb/isp1301.txt
+++ /dev/null
@@ -1,24 +0,0 @@
-* NXP ISP1301 USB transceiver
-
-Required properties:
-- compatible: must be "nxp,isp1301"
-- reg: I2C address of the ISP1301 device
-
-Optional properties of devices using ISP1301:
-- transceiver: phandle of isp1301 - this helps the ISP1301 driver to find the
-               ISP1301 instance associated with the respective USB driver
-
-Example:
-
-	isp1301: usb-transceiver@2c {
-		compatible = "nxp,isp1301";
-		reg = <0x2c>;
-	};
-
-	usbd@31020000 {
-		compatible = "nxp,lpc3220-udc";
-		reg = <0x31020000 0x300>;
-		interrupt-parent = <&mic>;
-		interrupts = <0x3d 0>, <0x3e 0>, <0x3c 0>, <0x3a 0>;
-		transceiver = <&isp1301>;
-	};
-- 
2.34.1

