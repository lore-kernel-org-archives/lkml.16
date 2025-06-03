Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011001.outbound.protection.outlook.com [40.107.130.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1BCC22DF84;
	Tue,  3 Jun 2025 11:26:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.1
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748950011; cv=fail; b=YycuMNlWOSsL7sQT++pPH01tUkdSPTgyH5siBVqHcJU+K/Vf9+V0zLYALbCPRLef8WQs4M+NKDTjFxLaGkUV2hucDp+eTsE6GLjI1TAsy7qkfx9dIzFOzIHrlII7viyzH5z+V68hy9F/Wjdec2bL6egalRhzUITQEsZyvHveZf8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748950011; c=relaxed/simple;
	bh=0nG12CaphM7O46YrQZZBRWqs8XEAH0sULyG6S/LdppA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=StKA80Wj+n344Cf1vy1UVANcg+lGQjomx2xCJejCsQviFoqL2IaBuUQWcr5NkE/fnh9/O1NpeEupPcypfd0149fFj905P74dxYtlDZfwQ4hViMJhC/mLAHVv+S8NvlNhUiGn5lz0JM+/xIZgP2w2+fpw8M0TLfRxRYLCtgIEGWU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=Fw6ns1mE; arc=fail smtp.client-ip=40.107.130.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="Fw6ns1mE"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dgBXhCJFmAXSe1cYnn/CuapXSVRnmcyjRJRdVGa2ZhKQEAjgZs5LYfhACaWdOvCKBz1eC3Kqe/Z3LyUQmnXq6BEPbYVILRG1Z85CACWVcj3iawf1P3539sJF8dzIvbJcM4nZnMOjZ7qFTr7aQfkArVTaMfaYaH/L4KwsGA0LxVsutw6tGnJQICv8yNzm4q750eo6ESymRNsotjoNWiBD4EJN9Vz0PoZyTOg6TNFDzzgiTepPI6U6GQ2DVLuvM1AtwfNy7Nqh3DAkpnqbsEOuvcMhKRb81NZDW4dAzszM6RTx3dnPGH2AZXl3pXhzKOiDpY8Y/gjxHUN/27pyfeSZ/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xIEkMqy0nehBhARzMJRS5BpeyFT3rHfo99MhWCeKj3A=;
 b=Q06CmHueYDuj7o45Nd089AEnjWAkHAg1EFpEzFK42aek1bfBNYaFIOuYMvB7AnyFmJUMGfzO6yZU2QwXJtAeZJbakBVKMqCwsmrmhH7XJgci9RSdC6awfi0ZTM/uItzVL/6ylFifApE64/6ymCr5bXElMvCs056NEgL4Ec4NJx7fDpcdwSgF6aI33ECWmdna+GBEOuE0pjvMor5LlWhb+9//mjrnz8SpB388SVwv3hGmxjZDv2qO8og7h16/3pezFo4bO7XWFhmIFZO+g/J3vy7+mRZanNNcB3xq+AO6vtiSOzOXu160TVCSnk3IzQR4Vodpss43Er4UM/hISDTtHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xIEkMqy0nehBhARzMJRS5BpeyFT3rHfo99MhWCeKj3A=;
 b=Fw6ns1mE1DZCIa22EO1kr3KKW4xy0oWlIfrOuzT6jWLGW+raw+rCMd+TI7seJ5bRrRyagJ5+Oi3MRJIqADMIUdDYNcQqdHb9hmOMxlhS7z0s1j34L2vUp8aDy7PLs8EqhC/bd1UfOKXpExsj7AJvTlxkC4V5b9j8p8h/+/wPPwIdkJaZB9rTiLqORMUxy2sZiHBhzeS5u33Ics1FqJ9tS1W8SzqgmIXAkCenhGx7SyvYQgw5I9TOV7aqNDfyi9T/ZnBlE20JAju1qo8c1YZvOy3jE+rYjANJ2p7yJpWH4BSNKSpGRk5SdlP0iwbjpC3YaoT2aTblGfuUSlibnfpsIQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU7PR04MB11163.eurprd04.prod.outlook.com (2603:10a6:10:5b3::14)
 by GV1PR04MB10079.eurprd04.prod.outlook.com (2603:10a6:150:1ab::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.37; Tue, 3 Jun
 2025 11:26:45 +0000
Received: from DU7PR04MB11163.eurprd04.prod.outlook.com
 ([fe80::3a74:80e4:4144:62db]) by DU7PR04MB11163.eurprd04.prod.outlook.com
 ([fe80::3a74:80e4:4144:62db%4]) with mapi id 15.20.8769.035; Tue, 3 Jun 2025
 11:26:45 +0000
From: florin.leotescu@oss.nxp.com
To: Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Florin Leotescu <florin.leotescu@nxp.com>,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: viorel.suman@nxp.com,
	carlos.song@nxp.com,
	daniel.baluta@nxp.com,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	festevam@gmail.com
Subject: [PATCH 3/4] hwmon: emc2305: Enable PWM polarity and output configuration
Date: Tue,  3 Jun 2025 14:31:24 +0300
Message-Id: <20250603113125.3175103-4-florin.leotescu@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250603113125.3175103-1-florin.leotescu@oss.nxp.com>
References: <20250603113125.3175103-1-florin.leotescu@oss.nxp.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM0PR10CA0049.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:150::29) To DU7PR04MB11163.eurprd04.prod.outlook.com
 (2603:10a6:10:5b3::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU7PR04MB11163:EE_|GV1PR04MB10079:EE_
X-MS-Office365-Filtering-Correlation-Id: 65708fdd-4340-4e5d-929e-08dda2918589
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?iso-8859-1?Q?4hhv52RYWwrE8LNCvCMssFULBq1Z2Fkotx6bUTBOzwLxXjbAWvKU55l5WY?=
 =?iso-8859-1?Q?59kRACFCcJ8SS2Op0tk8jpa3HpsyYCQzC4L1A2lc/aK8hOch7GgEejuv0c?=
 =?iso-8859-1?Q?N3wxQWlVk78UNIEH+8YNyJ4xqjPliEs5eKnXjo5yXUuU4okf6T9+eoLYZ5?=
 =?iso-8859-1?Q?z9PlINYoxsN4M+StVlNAz+5xo8uwnrTJHaD/zdB95Cuepie5ePXAjGyJoA?=
 =?iso-8859-1?Q?uFcjEzEPbdeDyGvnPknE9qncDuCUudjId5K1e7hZGP7FZwkLHUAYdaLS/T?=
 =?iso-8859-1?Q?ul3DhE3tpy2mxx3JhMeMtTfI1Kt8sDqnL3tKrqwkCDAFjCetldkU0bk+Nu?=
 =?iso-8859-1?Q?hdn4qoxCpVEmOSznA0urBTLE2sjJU4V3froYWZJCiZgaT1ZnfBl3BK/6f6?=
 =?iso-8859-1?Q?jGKajc96TQFY8PL2WDG9i2GVpkFJ07o8vjvC8+0Pya61in6tbm8uULl6MX?=
 =?iso-8859-1?Q?IR68ZKu27e+oskN7lAJ4hPOmi+ZCQbIyDW32XtMwoVtHv8JLkUutg3I0cr?=
 =?iso-8859-1?Q?2f22pdsNRSUarjkSfXObOpM+93CEIOUB+Say8xVnjw5I93muuWXRzIXMM9?=
 =?iso-8859-1?Q?igLtAOeWBQX6mQkIhIPftsYWio/pATijjYtdUQxxv6VEcTXaQZkIyPr96p?=
 =?iso-8859-1?Q?L7WFMSTQY7Rq/lPPz7Vn9Al+2pKCx+OK6uKa/NngE53y1PkKdt4g8XTqkY?=
 =?iso-8859-1?Q?e15XsnqZM+2enzLzBRGAos44K+1AkmhWbfFbBbUtfT7ANfJrSkvv/1Xl7K?=
 =?iso-8859-1?Q?bB/qO/RYLWKA9ocr4sbTxBg2pkaO5Pa3dXiJWomZ80zy/eDc7DAFCKccvy?=
 =?iso-8859-1?Q?iI69q8ry6Xa8xG15AW3gYZP6phF/hwlKcbuqDnep7+EjPRrhY4aCzMutU0?=
 =?iso-8859-1?Q?QfAO1EEFROzwTOB5LcdMguUxcET15UzPzmzjmbmTl/nsWH5ublUyajAeVh?=
 =?iso-8859-1?Q?SaEypQtgMTxXyVyjm8BVrr956Onsu+G8XqXRlWq99UQ26srcUNEOO03o7V?=
 =?iso-8859-1?Q?6SLE9wh/sCoQB3cKYcIOg/6BcCB2Da2+KG2uxv5bQBeAmPdRCMjv2z1gWs?=
 =?iso-8859-1?Q?NeHfFF3JZdRaCEkIKBivMAyDZS5Cq73BYgma3NmtEHw622UOipl2bnI0g0?=
 =?iso-8859-1?Q?zee5iJug9PIchFGl8QdUHjrWy0EfVWp9GDhFyWfDNks5COgagTGloEsHdW?=
 =?iso-8859-1?Q?TJkpqvtMfEBSacdRiRYIarwf35BGbwcZl93sY5jkqZ8KLkXT9hvsZSnVLj?=
 =?iso-8859-1?Q?b3pscd21/BKeTS6Jytx5vwvk/wOX7fioIKH50h3rzrJdRCA+YsBpqmy/fH?=
 =?iso-8859-1?Q?wktJJeGVqC6K6I7ViWy+aoqMlwFw51icvrALU5zd7fUi2HOSlCd3fW8P5/?=
 =?iso-8859-1?Q?A18zlkQc4tiMyPbOgi8QfelgoyBuS6tnKMJRckTbPFu1denhH4m9skjAwZ?=
 =?iso-8859-1?Q?HaU55S4IDIMykXX5l54No2H9spf2aRYCdbtFTrIKuundbrdwTpnBo+LxY3?=
 =?iso-8859-1?Q?4=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU7PR04MB11163.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?Kw9QzuuDzHFC8zzpxjuqLR6Um9jT3mxGdFSvHeUEpwVrtKEoIXIwMVjZ1F?=
 =?iso-8859-1?Q?vnwR82Ou9kToJkKRBU1yM39FlWPDQMq4vq58WCyj0skrW9VAIP6lSwJ9OO?=
 =?iso-8859-1?Q?HibHa08kFKORW11YjhQiVDC2vvqY7gTx0D3uRX5C8TvqQKu59DhU9wY9X5?=
 =?iso-8859-1?Q?c89DYIYqZHqcKN1Uq98+RXB14/AvghZ8joxlpi2pUTFo+67WTxlWv4skBr?=
 =?iso-8859-1?Q?NDzVYaXr5mwK4O0NlLG59jfxTWJcOIuOX3JOCLHTPhHwRl1dtQv6DxWxWq?=
 =?iso-8859-1?Q?CTnF5YVWZqVmPWJ6FKhVQgSvALnA5lQtlj7DEN43alDSpmRFNiUuxZHKYv?=
 =?iso-8859-1?Q?wk2rdsb/f2vw/GtzFGY3eeo6lS4i1VldD3rkP5zbeLmHxkyGPu08SOp2IB?=
 =?iso-8859-1?Q?kpSRhVg+02c96USHsr2F5j3FdDgqAA56BNmWdIRA2XQrbK0Le3DIeq+ih+?=
 =?iso-8859-1?Q?zgXY/8JZj8GIQcnrqbjlV7OJhetx9pdkRHiwgLZDXUUhJ5rgXYlmqvJ/7/?=
 =?iso-8859-1?Q?xKVItnD44E8Jgi9+agRxaCKj00t15SVGO7CLS3NWMzw97Tdz4FnUm3fmig?=
 =?iso-8859-1?Q?upe/myr3tf+0PbHk68itBOBsC8Rnh7WFHX8a4EKKtzqSFk1UMGQ+tzJvLu?=
 =?iso-8859-1?Q?Lc1HY7q3WcICQVukrJ6lR+EHKR+yAqdXtxVzuk9/lXfBdIbQmAWaExzDTY?=
 =?iso-8859-1?Q?wpdwPZiM7VLsy4oEyS31cnoWHPSZ1k/Yl4yaTulpzgDMbYHKKXpAx77X2N?=
 =?iso-8859-1?Q?MQFVy2S8qhxKshN6XfRnBzcbcU8VMWBZ4Wtf17EzcXLzkioSkW09D7UvHj?=
 =?iso-8859-1?Q?J45TteoNg/5twQSO57RHqsHv36EP1nveOXjKiShz66Qxv+QtjPsGKOAbiz?=
 =?iso-8859-1?Q?NK8uwzgui0MKX6zM2YXvDEKkdDMaDct2OYwXuZslNdKRRYm93OazZal05E?=
 =?iso-8859-1?Q?ConSznUiGNe9lKea5vHVnKvgdRDVIsk+boide40YEnYmZHkQ9IDW8v+V6l?=
 =?iso-8859-1?Q?G/UVA4ggRIyiSF7q/8AZn95Bp2mGMNyCJVMaxq9YQSo6nMAFCyL34JZ3sK?=
 =?iso-8859-1?Q?9z1qQ5Be9T4CO+hix5uIA5SyqXl2DY8h8HRmA7VwFJmFg4HF/6mK8UvW3C?=
 =?iso-8859-1?Q?40jq7xb5+q66rSaxc8JO2UmmZO+CtwuIpJ8JNMSiSeXeHwvRvcqLiAYErI?=
 =?iso-8859-1?Q?mGIUCqTHqAOMR6a5Y1o5Wa7wRdgt2E/DCBe0pDMTW6TBX4ae3zZ/yPHR/O?=
 =?iso-8859-1?Q?psQ+CAthMgBDuLVeY12M5aWX8PZNo1kC/mhczVuA4Yen9rY3WA7U1/d461?=
 =?iso-8859-1?Q?05prn8HmLX0AX6x1BU22l1nXiXgMLQUKiybDIZa5U+V9fqg6ga++0UcK/z?=
 =?iso-8859-1?Q?bwTGpNT0IRRDKp/s6ENcBareNwwImPyRVovzhAjKdeXMsz2kfZw01GHcbG?=
 =?iso-8859-1?Q?KTwbxWPt9z/5iSuZMirs2BkNDRPanHz36pXehqe2/iv67Q6GEYULivMBz3?=
 =?iso-8859-1?Q?69/T37NaZGJlC5tRNejs+OckA6Lfhh1USzfI2HsZDMC+gWNxWOpm62YpBo?=
 =?iso-8859-1?Q?uESIZ8v4Wst0Gr/5+SuXI7MaTfTNuEuQ1GtpdCW9uGITt4NttegGyv65UV?=
 =?iso-8859-1?Q?3Ds/a3a1G8JfuCNyfZvck1akS99THBnVsB?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 65708fdd-4340-4e5d-929e-08dda2918589
X-MS-Exchange-CrossTenant-AuthSource: DU7PR04MB11163.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2025 11:26:45.4514
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vpFg6LHWeENcqIm+KilifFsSBj/Q/pbS3vdOrFkBYcCb2nn6LZ8XWyRzfUVQIeByc+1bPPA2czLqT5x9WnL7yQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10079

From: Florin Leotescu <florin.leotescu@nxp.com>

Enable configuration of PWM polarity and PWM output config
based Device Tree properties.

Signed-off-by: Florin Leotescu <florin.leotescu@nxp.com>
---
 drivers/hwmon/emc2305.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/hwmon/emc2305.c b/drivers/hwmon/emc2305.c
index 0228511f4753..db65c3177f29 100644
--- a/drivers/hwmon/emc2305.c
+++ b/drivers/hwmon/emc2305.c
@@ -28,6 +28,10 @@
 #define EMC2305_TACH_RANGE_MIN		480
 #define EMC2305_DEFAULT_OUTPUT		0x0
 #define EMC2305_DEFAULT_POLARITY	0x0
+#define EMC2305_REG_POLARITY		0x2a
+#define EMC2305_REG_DRIVE_PWM_OUT	0x2b
+#define EMC2305_OPEN_DRAIN		0x0
+#define EMC2305_PUSH_PULL		0x1
 
 #define EMC2305_PWM_DUTY2STATE(duty, max_state, pwm_max) \
 	DIV_ROUND_CLOSEST((duty) * (max_state), (pwm_max))
@@ -686,6 +690,16 @@ static int emc2305_probe(struct i2c_client *client)
 		}
 	}
 
+	ret = i2c_smbus_write_byte_data(client, EMC2305_REG_DRIVE_PWM_OUT,
+					data->pwm_output_mask);
+	if (ret < 0)
+		dev_err(dev, "Failed to configure pwm output, using default\n");
+
+	ret = i2c_smbus_write_byte_data(client, EMC2305_REG_POLARITY,
+					data->pwm_polarity_mask);
+	if (ret < 0)
+		dev_err(dev, "Failed to configure pwm polarity, using default\n");
+
 	for (i = 0; i < data->pwm_num; i++) {
 		ret = i2c_smbus_write_byte_data(client, EMC2305_REG_FAN_MIN_DRIVE(i),
 						data->pwm_min[i]);
-- 
2.34.1

