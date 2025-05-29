Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012036.outbound.protection.outlook.com [52.101.66.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C70D1DB924;
	Thu, 29 May 2025 18:48:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.36
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748544530; cv=fail; b=p1kOpTujmGjFm5R/HibLJaRuXAa70MFbTjpXTk1kQ1Q17+cBGBK/euVITN/wT+U1omFKf8EzceV4sxUKyNzPaSHnHNGSJPlOsdjICIyVoeOIMLjBUYlRijeiYWDkitVS/DOceQta7xVxai9fb6Hez+Ny6Qz+asVtugwYDK1YYbM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748544530; c=relaxed/simple;
	bh=MEOHZJPVrqQU9iDeC0m1P4fMPChZsRBuov11VcxTI1g=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=M/17un9PZpci2yFuv5DF7Uj918rN6KiGtDaEdZ8mjtgAkDfL/4zurq1Sk4k8LcZGkikqzxP455tF+D1oaro+UHEJO0jMDaKzroPZHnXNucMsSRclfTNnT5EKqPKhnHg56WaD+3OYgjearWaoStu5GjYAjssK+yxM5ExJ3+LW0Ck=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=XkccM9Z3; arc=fail smtp.client-ip=52.101.66.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="XkccM9Z3"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v5v+fKju/z8fePB7TC1h+kGjCdz9QErjtPLrCd13KIgc062VX1PNvpr9TWVAR52ttSslt953xwzE3V9RpCDU8I8Iq1bK8yDvjRS+O83f1ihXPYN5kXaHIyYKFAhJLZCFQtJxVDB/X6S/L8HOkpEuhg2h1oAEx9LnHHb6qiQh8DYRHxXX4fjfGLEmHQrIqucNfF6CDXnO7SmcPBQs6laDNJ3wJfidVZN/UTH4evdKr2XJl7pYw8JJPcnv2eGkMOUrtcMHOBVhQDS3xiaBbVWr8aLo2VHKX4wn8wnJKMLAk4LVOfGnanygJgAi+josu+AebK1sS4oiHfbYRuQCoMNOzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VR8PZBcp0z5oz4s1d4FOdZZ3eRSs2dEaPFmCRV3HVjU=;
 b=PU9ITmVvyPZMWQqjl9d6jU/4aVBbAjqeAsCNc32BpSGDRWA2f5y4o5fxS4nZbAyCfvAez4DOgyUMERoo4BSAinoPANKxJgmJ5sgAmdU++st4HdDEF4eDMUQGfYI1RmjCFQD65a2lMeCqP2CD9RwwqwZslGvS5XqY9I/QLX/maF2a9E5gW1qCeyBhlRpFhuj5vMU1VRa0X4wT1WSc1obvYvLxpcqdiecXaw8xX7QkSGhgajDnwdS4IBsVzNWB8krxEIiLLgAWyciqf/YeoN2OjQXN/fawR8gnuRip0KnmPZl51odg27fL1WQlYSmTLtO6vVL2DZv0Lu05MaAc+Nt7fw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VR8PZBcp0z5oz4s1d4FOdZZ3eRSs2dEaPFmCRV3HVjU=;
 b=XkccM9Z3tKMevR1Iz7H1tDhXLcfWDCjkCOd2Bv15MBh9v6sG7miGZIRiY1R4CeXYowfkiGIJ82elM0+x9hr8HUIBpb9Xd8GsEb2P9BgEZflx8hmQ1VvDNL08+o8/17Ce0cSD/9Smf5sxBOOZK9B1cPmyv14G9UPociPLu6zCu77l3HrLZyVaukYb3g5JoF3Ood3cwqVTobPLdvieTptmHC7EL2R7alKOcn9TikX/Dz+v0Gl8oydKAPto8/XRTMu3ILUCrQbuzXxQrWupLQGTRnjGC/N3rv3rplRNTIthWjRV0lZPbOmOXIaiv5zXHMxIrq7ccSZ3yQUpFT7CRT0nKg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by GVXPR04MB10354.eurprd04.prod.outlook.com (2603:10a6:150:1e4::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.29; Thu, 29 May
 2025 18:48:45 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%6]) with mapi id 15.20.8769.025; Thu, 29 May 2025
 18:48:45 +0000
From: Frank Li <Frank.Li@nxp.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Noah Wang <noahwang.wang@outlook.com>,
	Michal Simek <michal.simek@amd.com>,
	Naresh Solanki <naresh.solanki@9elements.com>,
	Fabio Estevam <festevam@gmail.com>,
	Rodrigo Gobbi <rodrigo.gobbi.7@gmail.com>,
	Grant Peltier <grantpeltier93@gmail.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-kernel@vger.kernel.org (open list)
Cc: imx@lists.linux.dev
Subject: [PATCH 1/1] dt-bindings: trivial-devices: Add compatible string synaptics,synaptics_i2c
Date: Thu, 29 May 2025 14:48:27 -0400
Message-Id: <20250529184828.787082-1-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0063.namprd05.prod.outlook.com
 (2603:10b6:a03:332::8) To DB9PR04MB9626.eurprd04.prod.outlook.com
 (2603:10a6:10:309::18)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|GVXPR04MB10354:EE_
X-MS-Office365-Filtering-Correlation-Id: 9c8ddd6a-2163-4e48-4cee-08dd9ee1704b
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|1800799024|52116014|366016|7416014|376014|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?w7/B8OUcoDjFHZ6QiOetZhix1lM7kZb66aTp9azi4zi2Q2z7vPfeQ82UZHR3?=
 =?us-ascii?Q?xTDbP6Kvk25sLN8kChNzlKTCzj7/7RTOyooN08GfaAYLylwDBmnDP4QRXWWz?=
 =?us-ascii?Q?9j6Zvz7b4uRGESK75x9OKSsUzTzPMj9y9aCDEN5GXeA70K2yIJZQb/RjyuTf?=
 =?us-ascii?Q?D3jOlxVtsggLbIVnjqHhe1C/nOSvPYi918MrM322zYlJMFC5PIWaUn0YfzaX?=
 =?us-ascii?Q?i5NL+fnR9sgGilcW2RNcBSzRfHPzxf1TEYzr/cFXlb6XY1B3HGWh1zRGB9mD?=
 =?us-ascii?Q?Bl8FmbFiYgi6FdOT6FzG57TwObhFrWtrqg7QtAuxqydsQ1K6LURKWh4PFW7x?=
 =?us-ascii?Q?gBJkeX/OQaZWfwfDRV4BpWRBzuElOJ+5P5eYRSszZQiBjL1epGADL4lFMwgU?=
 =?us-ascii?Q?ymLvNLTrk5XXgQWeGjH8nG5L7708JsfAuHTTzbueAj8nmNavmGbfe3/bNGxD?=
 =?us-ascii?Q?dAdTzr7VV3pzsUzVT+0ISsZvNQf13fEs2he8Mvu7STbLXgTvEgxQW/9mfVo/?=
 =?us-ascii?Q?nx4Toh9vRAiUj7fqLkJ0nrzflZf8Z06WEwO7xmFeoJY8hrsOPXnn34OoUnEV?=
 =?us-ascii?Q?gQurerEh2f+s5YHsbXMPZwGtKFc4cT3cCHimFTHNh5XJa8X2V77xqhReV/14?=
 =?us-ascii?Q?1mbpDMq9Gf4XqUGZJ/oMQnT1ERJFUWyceK1Z1u2v4q03wEcQL2S2mi5aWwmA?=
 =?us-ascii?Q?VkS52HaBXXws3IUhvSWtZ5Cyjqtpjc9b2vhu+06zMDjmMC2dd79Dm4IAGSIG?=
 =?us-ascii?Q?AwJu/tmLyvnAksGJeRLl6wMxrvpHiwOvbc5mirIV/RHG6jkVQuVj7ypHoobA?=
 =?us-ascii?Q?itp0mcZpBrqSmAD4rU/LFboCbRFmk9vweSaeu9lV7BHGLWR6msZZoJ8sDsTu?=
 =?us-ascii?Q?1xZeY0W1PXxOkI4o6llT08Sn22qj9RMlteozWbtrjV/UQy0/5kRYQyvmjym6?=
 =?us-ascii?Q?M61LkqeBzoNplKZ24xt8yTsGAG16W0EhtQZTt5WoAmmNqEISLZ8eKoXHopd9?=
 =?us-ascii?Q?j4eVC0mdCvwREQrrWM+zwkPmWl6fvJufU1lS5X6dgD9vMtVVfWObc5Wt9dY7?=
 =?us-ascii?Q?exHvu7NjrjigszcM+/z7bjyJ5QeMppwQM03/ZAVqOo668tv3CMrnu0k9NtPz?=
 =?us-ascii?Q?E2bwHg5tYgPQjX1Nel+N7CY1sVt33if+XbFZdbo+QdA7lca1UU/S4SbaCGWd?=
 =?us-ascii?Q?yk+EB8t2Rhg7h03ZozcukX2dcFncGRBvDov8duR1DDvoNUncie4xlOukVAns?=
 =?us-ascii?Q?2kZ5lPD9cXqa37DuLcy7CSDAfdHtu8fSSn93DvsDqgtVPYiGcsAhvP9yXCM7?=
 =?us-ascii?Q?tD6THYXVtuVHzUzHeyJ7008CnV0jPjZU9j/MRgKVM0Yf1XjNFE2y8LzRF5M1?=
 =?us-ascii?Q?0A6U4Bt7kq3GSByuA1C78MkUHLrJUCoU3PhgRKGtv8oBiTJk+TwURu+Q6Ila?=
 =?us-ascii?Q?LSAh6WDKW6R0MovPCNvi7PD1ULLlRaDmv2Gb7Ts9XmwZDSYdRhaYRP2VA59z?=
 =?us-ascii?Q?awOAX3L3HBLbn5A=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(366016)(7416014)(376014)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?ViwimyxQmmNcio/MnxGN/nmfhZK+F5G3P/klFNHJVmc0rlAglyvj+BF0CyZR?=
 =?us-ascii?Q?8ohLdgFa3irCf2mdRBp6p3XNxdkALGd33qwQPRzJMtaoLK4n4VgxGCWklBUm?=
 =?us-ascii?Q?0os7t3lMCnC4lmRBP8qpeho91GIMIlfx2H+P6wNyYfzBAObzKlU1NEFh6xA6?=
 =?us-ascii?Q?jyc7S/wdlztgLAfN2uRl/icO6oUop1An2ZqX9tFym+BOkZ7npDJjhyJ9jFH0?=
 =?us-ascii?Q?/wF3dfLwB8mjMQWoyduQ1bQcoVAKWJGYmXzqrf4iJqUGpNZzj7u4FSj0IIPZ?=
 =?us-ascii?Q?Quhg7r/F6kAYsibBhvbVZSVbg0SWdNm0efoF5RToVzUuMQsUGSp88ctNsJT5?=
 =?us-ascii?Q?/rjg+KhGTSdSoqs183iza6yybPTc7XgrYVBTnqLv4TRpXLgaYcwWazvv4Fgw?=
 =?us-ascii?Q?cJgcmDmu7zKhLajn8mcvLocfDUMZkElhvRqYN0kcimaqSH0bfd6t1CvK2KGb?=
 =?us-ascii?Q?xynqyE4ApxmfJL8AnQ9acM0CmkkR3QreKo83BSoQf/Z3oPRuJm9dtNgtxuRS?=
 =?us-ascii?Q?Gf7LNaryAbWG1st441SH8sxKq+Id02yliBiMFDvdONbcEyQrgwFXQ3FThvzs?=
 =?us-ascii?Q?xR82me7uz6bqFar0KsmGZgVTchiKUGT44ns02xz/vAH3708KdENIrv4tv22F?=
 =?us-ascii?Q?r5F7nxrTRpUSuYU9Mjf9BWad3a9mpx2bZLkVXseph4rEIv3MjxZcR6gt8Y42?=
 =?us-ascii?Q?dQnMjEPrfW1aLsOJx1GaBk1I0x/013Xs8AudMFCrQB4gyi1rKGIKU0uQXZSc?=
 =?us-ascii?Q?1Pil1LFnYupRwh3M7pPc1lCmLwU3t/IpUFF6WrZNhzBP6cU8yBUM/OQhy80b?=
 =?us-ascii?Q?sc8CW1WZMXGv0lhSqa2ZQYu6Gy442oqoQmzJ2mJIBQ39rBgo2ARtRwguAJPk?=
 =?us-ascii?Q?50p9wEi87F8vtkXLr6OiespVAqWaVRLoCbtabN7oqlhihzO2Q5xqfbVud+1R?=
 =?us-ascii?Q?Hu37FVzJz6fsCpmTFKms7BjfPfvHujYTm1pVCTS/LkPcpGyEtV5IEd0VTNjx?=
 =?us-ascii?Q?R41iTG7HpJalZs/pVUg8lfgxliXLIwYCt+7oSNsyU/Lfpilz9oz4fZCWNSm6?=
 =?us-ascii?Q?HXso0dTBRlYKu36JmGqNWcUmQNXgDt2Lw6Xm8vEe9Zo9tZbKz2z4EFOmlQsd?=
 =?us-ascii?Q?ODPoDQbcC6y9ST5v/MIAat+waKK6YrYC+8W2L1MYKi8iheM8aCJjkTabNmUW?=
 =?us-ascii?Q?zW8si9ECJ8ogZD1mk3xv8Cv6TqAS2qjpgPYdN2lSMBhRYqbMpz5S/qd0PTUn?=
 =?us-ascii?Q?UfmeSoseN7ge2iG7wXgpgpBePDQGzsXyzGLJs596TOH78t3wjTyTQ8wNnluF?=
 =?us-ascii?Q?KlUDeOh6S9ca5tLkMZqtnNLNflKFXzb+eQmLt0e5Qz9peWVHcrkfu0r1bS0b?=
 =?us-ascii?Q?ASJdNOfV0VcO8DNLXIv1DaLe+0Hld7hxlmgULGFFxiWaaeTSJECy62IpmeS4?=
 =?us-ascii?Q?qik6OtJ8vyVUM6hAYbKRP6bpowwP6C8se2mhwHcCzI+vC7Sc/J6UJ6ZG7laF?=
 =?us-ascii?Q?++xYBwcHWZZjWeBaPnSHqpCWypyrxoruk6RhrEiXoiFWo/wY72KWPdSU77Mh?=
 =?us-ascii?Q?76zNUx6XTQxv3Qw/tjo=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c8ddd6a-2163-4e48-4cee-08dd9ee1704b
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9626.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2025 18:48:45.1225
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kQZXLIfcTT3GWRUmORN4kM/vj1S7D78rCRaTUl+GTL3ln5zGqhmAvXAydhnedrG4/5a1PWOLod5jdjAdI4cXFA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10354

Add compatible string synaptics,synaptics_i2c for synaptics touch pad. It
match existed driver drivers/input/mouse/synaptics_i2c.c.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 Documentation/devicetree/bindings/trivial-devices.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/trivial-devices.yaml b/Documentation/devicetree/bindings/trivial-devices.yaml
index 38bc1937ff3c9..dbec1300bb7ed 100644
--- a/Documentation/devicetree/bindings/trivial-devices.yaml
+++ b/Documentation/devicetree/bindings/trivial-devices.yaml
@@ -362,6 +362,8 @@ properties:
           - sparkfun,qwiic-joystick
             # Sierra Wireless mangOH Green SPI IoT interface
           - swir,mangoh-iotport-spi
+            # Synaptics I2C touchpad
+          - synaptics,synaptics_i2c
             # Ambient Light Sensor with SMBUS/Two Wire Serial Interface
           - taos,tsl2550
             # Temperature and humidity sensor with i2c interface
-- 
2.34.1

