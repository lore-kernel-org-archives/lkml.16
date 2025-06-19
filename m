Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010043.outbound.protection.outlook.com [52.101.84.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7293723BF96;
	Thu, 19 Jun 2025 11:58:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750334296; cv=fail; b=uZkzH6g3rjxCLJpccOgDP4o6cOjaYMO7ttNuIBXRwj8lEJlLeG/x4VS4tSaOus9k9BX584L6mk7jevMWGHQu4WTBK6XvfaAOwHIrVOCQkWWCMhLYHk/OkI8omAwTmuLUURY+jue+fe6wrjvjhHHPpqmGt42fm6ZPjBeKQZ7OGQg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750334296; c=relaxed/simple;
	bh=2FrA9MWDt9lPoBVVdV+d8uQr9DATq5iVbio+8xzlJZs=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=OIiyCUUn9qnS1fwLplOEIV03AxgyioCv/bm4sgFBIFDPoCw1TaOIQSrb5OqBFqLm6xJ8UcbziwxQToCee9C5+9eLF/tBdARSGhCqjJn/4htQS4PivvfRPzNpXzC2hXpHIXcdrfeevYKKEq4u+23p50BW/2DDQ7IB9qVBfJkFZ50=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=cFEII18k; arc=fail smtp.client-ip=52.101.84.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="cFEII18k"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PS1qRDHfkNgxs0CxJ/c0pEapa/6BW9MrE08e2K1PIi68Su0kccethYEw606TMXBFPcb4jiF55dcoLrVuyg8S2VZ3pekNakCPVf9EzScUrn1SOy12Y2Etjvf+9crXjwwF24UHht1mEq09PwGt6nfGLSfX6tNi1a+9OTmFS/yPhV0iNBaJJx0hpsHbIVBqOEyBxM7AXIsp6b5MluIoA6z0L3gz7r7la5/wfD6jeGddqQGjNqYCK9qP9v8L4uGIxtGJwA0Cq/xycuHBKDXJDXgf/mvKQB/rjx7cfLy+exR+tsHS4EY8Ia5pPuirALLfOrbtyOakw2LcXN1XQZaz9jUUNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wRwu/i5KVb4emq8cKAgk4HLPXfBGEI2ogILUnQt0tCE=;
 b=ETVpB1AfssCLBQZLvdoaZTlV0qYcoBCqnoipNC2MRTL7Dkx6qPFpiPpP361KBMpFFaMjQdf9lVHqWUHeAtUR0M1N/9SnEOq+VL3034O1hIskiMkf7psBof4ANSdJx50qr5i3odd66IQAOYJUQ04FK3bn4pNk4ndY4ygDGQuw98zR7dzphv1vVwu7B1CzUuC+2urFIa30WzxjAnJsoXKLfm3y4GZSm+Y0wv/DTUKqDOFjV3Pc+oIxFQ0XiEYKMOWofucrHJZWloADJNQvQb73xy02cNvzLlkwxo6dT6HA/PgsEXzAym7QkL6NbmHCJNn/BYfA8TtHBer+haHU9uswsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wRwu/i5KVb4emq8cKAgk4HLPXfBGEI2ogILUnQt0tCE=;
 b=cFEII18kGeC7iKFqAjVODau1s98PE27fPB+P5W2XMy90vwX9eL1zAP/OI/m4QeYZljvb9eXx/QYW+xpC2rhOpOy5gaeBHK8RlOFSm2K6RBirkoj5wFV+f/csSAeIPRCQYWgddEXHKel4Cw3X4OTkRvpupubycNi7WbXcwJQcfMpTCEHqU5D8amxbFAWJlYwaqMhwNmuv2/gV1iwSIdUDpfEhehcSlkFyqkhfDEGQPDlip3ux54NG6D3HQugrCAmQpoJ8LhsyXROCEh3hwbqN/usMKurdemcljznUbc4/+GlEVTuWkr/jYvuBHF2BGCCD52PSs33ZNkkE5t0Z5ccmPA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM9PR04MB8604.eurprd04.prod.outlook.com (2603:10a6:20b:43b::21)
 by PA4PR04MB7855.eurprd04.prod.outlook.com (2603:10a6:102:ca::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.23; Thu, 19 Jun
 2025 11:58:09 +0000
Received: from AM9PR04MB8604.eurprd04.prod.outlook.com
 ([fe80::e751:223e:aa3d:5827]) by AM9PR04MB8604.eurprd04.prod.outlook.com
 ([fe80::e751:223e:aa3d:5827%7]) with mapi id 15.20.8835.032; Thu, 19 Jun 2025
 11:58:09 +0000
From: Pankaj Gupta <pankaj.gupta@nxp.com>
Date: Thu, 19 Jun 2025 22:50:10 +0530
Subject: [PATCH v18 1/7] Documentation/firmware: add imx/se to
 other_interfaces
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250619-imx-se-if-v18-1-c98391ba446d@nxp.com>
References: <20250619-imx-se-if-v18-0-c98391ba446d@nxp.com>
In-Reply-To: <20250619-imx-se-if-v18-0-c98391ba446d@nxp.com>
To: Jonathan Corbet <corbet@lwn.net>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Pankaj Gupta <pankaj.gupta@nxp.com>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750353651; l=6792;
 i=pankaj.gupta@nxp.com; s=20240523; h=from:subject:message-id;
 bh=2FrA9MWDt9lPoBVVdV+d8uQr9DATq5iVbio+8xzlJZs=;
 b=i3ezeNJ3ukaOJ3rUmf39MfgBQQTENVHXLp16FpURVjr4mmVe+NqnzeT6EHlyT4R+gK31B/5EF
 6FEu01wuZe7DTx7pU3xA4KuCWnzYTA4NDua9aF0TUQQSB4jfUYMXt+p
X-Developer-Key: i=pankaj.gupta@nxp.com; a=ed25519;
 pk=OA0pBQoupy5lV0XfKzD8B0OOBVB6tpAoIf+0x1bYGRg=
X-ClientProxiedBy: SG2P153CA0027.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c7::14)
 To AM9PR04MB8604.eurprd04.prod.outlook.com (2603:10a6:20b:43b::21)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8604:EE_|PA4PR04MB7855:EE_
X-MS-Office365-Filtering-Correlation-Id: 35df0a00-2780-4c67-14aa-08ddaf288f11
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WTZ0RVlLMlY4TFZObC9MY3pzaWV4a2NneGNvWlMrRm9YTVdvUkxid2R1U3oz?=
 =?utf-8?B?ckEvTUg3K3Y5MUpiM01XMllna25mbUtXZFgwV1kxdG5kblNFSmFpa2ZaVmpu?=
 =?utf-8?B?allwRi9ma3RiU0VNVE5rRkM4bDFoNldzL290aEJwT1puSjlOWGxzUGg5SVF3?=
 =?utf-8?B?UDUrUGEvZFNRRFpxWVcySVpGR0YxSDRRaGdER3NwZmk0elQyc3hmdnRHRnJa?=
 =?utf-8?B?clpIMTVPRW91QUIzZE0xM3ZYQ084bXBpQ1FWd2Q5SlhaUTZaV20yT2laR2NB?=
 =?utf-8?B?M3pOOWxuNk9HbHZuTEdGK1RZZTR5MU94Z1ZLWDNabE1QNnpKbnpvWkVzUGQ0?=
 =?utf-8?B?bU94NHk2RlF6ZVUxa1RwVCthbWpWK3pXUk9sbEdqNi9KWU8wRFhBMzkwcU0r?=
 =?utf-8?B?QzZiSFd6Z00wSGlYUVZua2RkVEtqRTVkd0ZSUGhyUVJPRFhVNVBSbGlyTUhk?=
 =?utf-8?B?VVZHU3BlNjB6T1FOOUR5d1IrWEQ3QWdRckFWYmNWUkhNby9WbHczdzBsZEhy?=
 =?utf-8?B?YzhIS2FOd2xnUCtrRXJnUzRQdysvcXN3RnNmZ05lcGdYRFdvR0Uvb0lkVUd5?=
 =?utf-8?B?cXlPSldGMXY5S1dFNWJUY1JuSVJTRGV1L3hjSnhudFpzNWlOeGxzTW9sdDJ5?=
 =?utf-8?B?RTJHU2NpOG9rcXlmc1h6VDNDWUhoZUVJM0w4QlVITkMwOTRxbFBvTDZ3aUF5?=
 =?utf-8?B?em9ueW05ZWd6aVNxRndqTDhqU3FUaGNvOXpnKzJBWklaZ0RYMmVPNUVLQ2pJ?=
 =?utf-8?B?ZTdNK1pQSVd4dXIzUElKUjNaQkMwb3laZWc0RWJ0ajAwemJ2ZDlUZFlpckJI?=
 =?utf-8?B?bCtKNUZ0azUwMTk5YW01ZEJMMmNCbnNlU05GeFY1bmVhZks4UytRcEhaNXhG?=
 =?utf-8?B?RmVONU1GcC9DVTFxRkxwQkk2SjJOSytDWktNbWVmY1d2N3E2b2ZreXhCYUEy?=
 =?utf-8?B?UDQzN2gxYXdBZ010ZmdQd0F5SzNjbjVwZVBHNnBoMWVFK3RIK0x6OU84Nkc4?=
 =?utf-8?B?ZHphem92MUYwYnlXV2psUGg3MHRJamI4NmZjeUhoSGovNFg3RkNtUXh4bGlJ?=
 =?utf-8?B?TmhWS25oWEZtdkw1VVViSGw3RlB0UE5wVUpmSGdFdE1IdjVVSW5ZSTE1MzIy?=
 =?utf-8?B?VUFwUnBVWlpOWmYrZmRQeXNuSGtUYndId3RtYVJ1bUh4bENpQ3NnSDhYTTQ0?=
 =?utf-8?B?K2ZsKzhzN1lwbUJWejhuT1BhMHhRYzZCdGlPODF3bDRRRUx3YzBXbzFraVhS?=
 =?utf-8?B?bEJpc2kzdkJZYTFwbkpkK0ZPKzM2UzIrYVlFa29ZTEgzWU9DMjFxS1BuaXhD?=
 =?utf-8?B?Nk9YQk1pb0V2MEJmVEVRa2dkd2hhbmR2VStsZkhKRjVBVjk1M0dJVkpESk5G?=
 =?utf-8?B?RG81SERONDhNUXMrbDQ2dndtUHl4Nk54akxZSkRQU2xLYU44WlhQWWdXT0pR?=
 =?utf-8?B?cElRVU85S3plT2ZXcjJpZnZ1QXpRcXgvWC9DdEJBREx5NXdGQm1VUmZCc2xJ?=
 =?utf-8?B?M0VncFZ3WkpJL3duSVRYdzRTUkU2a1VXdXFiV0RjZXBpT3RlYmg0QzA4aTNR?=
 =?utf-8?B?bUduelJZeklmSU40elJQckRHS1VLcUdRcVRtczEzTTYyeTBjMm5aU29tU09D?=
 =?utf-8?B?WitTSksyY1hnUkNPN0tLejhGOW8raVRBMlJ1NFNRd3FwWHpXL2NyN3liZXpM?=
 =?utf-8?B?U0pOVjlQUXdQRHNHOVV5Y0pvQkZIOW9VeXE3TkVZbENnWVlkUW5ISlIvaVMw?=
 =?utf-8?B?K0p6cW5KK3BYZXlBR2Zrang4djF2OWF4dUlFU291c3RiVDd2TG5STjJnRHJ0?=
 =?utf-8?B?SDJ2MDdNWlFUVVh0UW5uY1A3a2ZKbUpaeWdjNG9YN1MxR243WDQyNGt1SG1m?=
 =?utf-8?B?Yk5jM0d1SGtEalluejRrblFYa0tzL1hVRWtmeFRpT1BNdFp5Q3NUaDYvOVBW?=
 =?utf-8?B?OUZ2MTVNRkpHcUlscm0rQkNXb2F3bis0V05JQWVKNXdlUEhkeTlpTEVpa1VH?=
 =?utf-8?B?OTFWNlhlQWlBPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8604.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(52116014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aVpMQ0JjcVpWTDdwM091ZVg1Y3k3Q0FYL1JQMzhidzRDUVdEMUVTSFF5T3Yv?=
 =?utf-8?B?RGU3ZjlqWXh3T1lDNFdFRFllUmdpbERweDE3N29LRGJOb1pNT3lsd0JHajFK?=
 =?utf-8?B?dXFOOXhNTTVZUm53MWppNU1ZRFJnSVJMUTl0NEROY1BSSFFUS1lObjA3LzZq?=
 =?utf-8?B?K0pIUVpBZXMvZ2phb2R1R1RzNzNCbnNwWHpUeW4xL0p2Mms5NXhDNmh0QWtT?=
 =?utf-8?B?THJQODFIMkFQL3hlc1J1SkhFdWJBK2xWSmM0dWEvbmZYaWMwRzJvVHNOQ3pr?=
 =?utf-8?B?ejQ4T3hqSW9CVVlHMkk1Y3JMaE1rQ1NMSGFpMzhXbjZ0WExBQ0VERFM4cUVh?=
 =?utf-8?B?UlRPN3l5RnUxQmZPdnZBbjlZbUttUmdweVdSQmE1Mm9CRUxtWUFhczhZMWFq?=
 =?utf-8?B?OW52YjhwRUxvdXFOV2xzTkdmbE94a0RZVlRaZTV6Y09ud1NjYytvcXNEc0xu?=
 =?utf-8?B?UVhUaG9XN0xiR1ZSR09ZcnQrcVlYa0FKZmdzQzlpVGQ2RGJaSjZyVGczeDdC?=
 =?utf-8?B?OUFlbWY2T0RtMWtzRnB6V08zOUVNQlVvUWRjTncvUVp5TTZseFZWMm9MaW5G?=
 =?utf-8?B?M1VtWmZWWXBmRGNtS01KRko0N29lckl6NW02T3lrSE1iMzhhY1BHeXBUbVhs?=
 =?utf-8?B?cjZEQTVKL2tuZWNLOUhoNEdFN3JwUitOcEx3cVFTdUFaYmtTNkt2b0YwR1d4?=
 =?utf-8?B?ckRRWVB2aUZFc1RwK0NuSnJtc294ZlRkRW1YVEpST3V2SGZZMXRNMFNORUh1?=
 =?utf-8?B?MUNUQ0l1cXQrY2FoTGdhdlhLRW43ZVZjazd1MGxUak05cnZWdnFBZm5pZTBq?=
 =?utf-8?B?Vklhb0hEbXA2RzhzYXZnT1JxTUtLQzl1QVRtcWtsMTV5NjlrdWZNWVY3Nng0?=
 =?utf-8?B?Mk0wM3JmeVhvdlQycHZ6ZUJCMjVISWRlTkRQQ0EzOU5KNU1nQ3JaWXRVT0Mx?=
 =?utf-8?B?TDNqQjY3cUNjRDBpZno5NVR2NlNUbDNjc1RGVGlLTnkrbHl0T2s0NzBPMWhY?=
 =?utf-8?B?cy96UnZSQ0hlRTd1QkFjTU1Mak5SWU5mczQ4YVc1a2h1TGR5VEJMNmd6Ullp?=
 =?utf-8?B?cXZ6cTJJZUYxQ2RtdEZZNURqbFdMZlk4bGRubCtlNjZuMkc2Unp6QWphTW03?=
 =?utf-8?B?UkxPTkxIUWYzTE5laWhEQ3hYbVltc1p4M0dZeFl3VTNTaG55OUV4SVEra1ox?=
 =?utf-8?B?MXY2L0ErSmdqbEREdFhKV1c0SktoTEgwb1EwUWhjQzJ1RFVHSkhUR1M3c0Np?=
 =?utf-8?B?OXhmZjZvNEtFS3JmVC9ZelRPNlk0MDJpMzNsMVZTYjYrQlAyci9VcE5tNW1J?=
 =?utf-8?B?MHJNVFROMjgyNVFaZXM5WVlpWW5RbllwaFI4WnpIWjNZVWQ5SkZ0OTRLcnox?=
 =?utf-8?B?OUV3UDdFWU1XZ3R0Y1d3b2x1ekhlNkZueHp0azFvKzAvMCs4bExQNm1YMm1V?=
 =?utf-8?B?Q3BGWS9ZTTQrWTJxRFJoQnh0R2Z2clRKeUx0VkRRRUI5c0VZTTRLYkRjM3p4?=
 =?utf-8?B?WkpzblNsNk5uMVhlbEFYbXN5ZXdwSk02V0lKRkYyR0JjMFBOQ25zTHVVS3BS?=
 =?utf-8?B?MS9YOEtpbGFUQ1d6SnRaNzdxN2RFVUJ0K0ozdHcydG9jWDArN0ttdTFzd0VY?=
 =?utf-8?B?alJtellVbmdRTzZUakJYdnhUTjcwWG8zOFpvcyt2Q3FUSmkycnZsUEJSNDZ4?=
 =?utf-8?B?NnVtZDVReHc5aXptTnZmRWdVaU5XTzhidkROZWpBSTRzamVodjhCVi9Nb3A3?=
 =?utf-8?B?eGFuK2RvbFl3eVRkK2lWWjdOUUNUZWkwS2xrNlR2YXkrME96ZkpvZUlLR0ZN?=
 =?utf-8?B?alJ3cEVJSWNNRXp2M3NhQ3JBRmVzV0NZMjU5Q0g0RnFKT3dZeUZwNUJ6U0NM?=
 =?utf-8?B?MjRQczA5d1BLS3hEU1F1M2hOeVJaalFZeGkvaXhzbHFTNzEzWFVScHE4Qm4r?=
 =?utf-8?B?RUJWdUVkUkJvSTE0SFZPcjMzYjJLNEYzcmFTeGppdmY0MjdocTBjVzZrYUZs?=
 =?utf-8?B?L09KSnJrN3U1c1FwZHBBS2d3K0VTZ3cwa2ZWVUtUN0RRdmZmWGhkemMwOStJ?=
 =?utf-8?B?aG5WT3ZnYWZ6RlVaYzJPeStsY2sxNmNFRVNtS1UwNDQrUDdnMDJLeHhMWC8v?=
 =?utf-8?Q?D/1erQEYUDIu40+8/Cl6hRrYa?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 35df0a00-2780-4c67-14aa-08ddaf288f11
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8604.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2025 11:58:09.4699
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: onnN+ObJCrqyPXSFp6q320lHVjhykxoHL3gYBKVb2pz09jbXF2nhgXnl7iUt6Z2SUPMIR5hAL+FWN+DPMYWUgQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7855

Documents i.MX SoC's Service layer and C_DEV driver for selected SoC(s)
that contains the NXP hardware IP(s) for Secure Enclaves(se) like:
- NXP EdgeLock Enclave on i.MX93 & i.MX8ULP

Signed-off-by: Pankaj Gupta <pankaj.gupta@nxp.com>

---
changes from v17 to 18
- Wrap both diagrams above in literal code block by using double-colon
---
 .../driver-api/firmware/other_interfaces.rst       | 123 +++++++++++++++++++++
 1 file changed, 123 insertions(+)

diff --git a/Documentation/driver-api/firmware/other_interfaces.rst b/Documentation/driver-api/firmware/other_interfaces.rst
index 06ac89adaafb..0329bc32ca02 100644
--- a/Documentation/driver-api/firmware/other_interfaces.rst
+++ b/Documentation/driver-api/firmware/other_interfaces.rst
@@ -49,3 +49,126 @@ of the requests on to a secure monitor (EL3).
 
 .. kernel-doc:: drivers/firmware/stratix10-svc.c
    :export:
+
+NXP Secure Enclave Firmware Interface
+=====================================
+
+Introduction
+------------
+The NXP's i.MX HW IP like EdgeLock Enclave, V2X etc., creates an embedded secure
+enclave within the SoC boundary to enable features like
+ - Hardware Security Module (HSM)
+ - Security Hardware Extension (SHE)
+ - Vehicular to Anything (V2X)
+
+Each of the above feature is enabled through dedicated NXP H/W IP on the SoC.
+On a single SoC, multiple hardware IP (or can say more than one secure enclave)
+can exist.
+
+NXP SoCs enabled with the such secure enclaves(SEs) IPs are:
+i.MX93, i.MX8ULP
+
+To communicate with one or more co-existing SE(s) on SoC, there is/are dedicated
+messaging units(MU) per SE. Each co-existing SE can have one or multiple exclusive
+MUs, dedicated to itself. None of the MU is shared between two SEs.
+Communication of the MU is realized using the Linux mailbox driver.
+
+NXP Secure Enclave(SE) Interface
+--------------------------------
+Although MU(s) is/are not shared between SE(s). But for SoC like i.MX95 which has
+multiple SE(s) like HSM, V2X-HSM, V2X-SHE; all the SE(s) and their interfaces 'se-if'
+that is/are dedicated to a particular SE will be enumerated and provisioned using the
+single compatible node("fsl,imx95-se").
+
+Each 'se-if' comprise of twp layers:
+- (C_DEV Layer) User-Space software-access interface.
+- (Service Layer) OS-level software-access interface.
+
+::
+   +--------------------------------------------+
+   |            Character Device(C_DEV)         |
+   |                                            |
+   |   +---------+ +---------+     +---------+  |
+   |   | misc #1 | | misc #2 | ... | misc #n |  |
+   |   |  dev    | |  dev    |     | dev     |  |
+   |   +---------+ +---------+     +---------+  |
+   |        +-------------------------+         |
+   |        | Misc. Dev Synchr. Logic |         |
+   |        +-------------------------+         |
+   |                                            |
+   +--------------------------------------------+
+
+   +--------------------------------------------+
+   |               Service Layer                |
+   |                                            |
+   |      +-----------------------------+       |
+   |      | Message Serialization Logic |       |
+   |      +-----------------------------+       |
+   |          +---------------+                 |
+   |          |  imx-mailbox  |                 |
+   |          |   mailbox.c   |                 |
+   |          +---------------+                 |
+   |                                            |
+   +--------------------------------------------+
+
+- service layer:
+  This layer is responsible for ensuring the communication protocol that is defined
+  for communication with firmware.
+
+  FW Communication protocol ensures two things:
+  - Serializing the messages to be sent over an MU.
+
+  - FW can handle one command message at a time.
+
+- c_dev:
+  This layer offers character device contexts, created as '/dev/<se>_mux_chx'.
+  Using these multiple device contexts that are getting multiplexed over a single MU,
+  userspace application(s) can call fops like write/read to send the command message,
+  and read back the command response message to/from Firmware.
+  fops like read & write use the above defined service layer API(s) to communicate with
+  Firmware.
+
+  Misc-device(/dev/<se>_mux_chn) synchronization protocol:
+::
+
+                                Non-Secure               +   Secure
+                                                         |
+                                                         |
+                  +---------+      +-------------+       |
+                  | se_fw.c +<---->+imx-mailbox.c|       |
+                  |         |      |  mailbox.c  +<-->+------+    +------+
+                  +---+-----+      +-------------+    | MU X +<-->+ ELE |
+                      |                               +------+    +------+
+                      +----------------+                 |
+                      |                |                 |
+                      v                v                 |
+                  logical           logical              |
+                  receiver          waiter               |
+                     +                 +                 |
+                     |                 |                 |
+                     |                 |                 |
+                     |            +----+------+          |
+                     |            |           |          |
+                     |            |           |          |
+              device_ctx     device_ctx     device_ctx   |
+                                                         |
+                User 0        User 1       User Y        |
+                +------+      +------+     +------+      |
+                |misc.c|      |misc.c|     |misc.c|      |
+ kernel space   +------+      +------+     +------+      |
+                                                         |
+ +------------------------------------------------------ |
+                    |             |           |          |
+ userspace     /dev/ele_muXch0    |           |          |
+                          /dev/ele_muXch1     |          |
+                                        /dev/ele_muXchY  |
+                                                         |
+
+When a user sends a command to the firmware, it registers its device_ctx
+as waiter of a response from firmware.
+
+Enclave's Firmware owns the storage management, over Linux filesystem.
+For this c_dev provisions a dedicated slave device called "receiver".
+
+.. kernel-doc:: drivers/firmware/imx/se_fw.c
+   :export:

-- 
2.43.0

