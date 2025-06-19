Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010043.outbound.protection.outlook.com [52.101.84.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3F0024466E;
	Thu, 19 Jun 2025 11:58:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750334298; cv=fail; b=FK0qxz309NEsIw1quepZq8+Z5OVe1wXa3rlhD6lq4Usseg4f0gpQRyKslljz/7N6X2yLIWEpI9NlkOEiWFz4bZ1H1hvuZ3eg9vRSHWD2p8+aHOYTw8U6hv3Pa/NtXqbqm3vh0AaHDe1CurmFafqG4Mk+zv4vxuY5oR2q/FAx5iA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750334298; c=relaxed/simple;
	bh=tOtSXomq2KH+8clEacb9RWYs1iYcwyaRAGNdBtHVSY4=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=aW/ZgaCm2ZHXUR/bmwKCz1znq+rGtWF88U/HkCRclR1jtzOz3NIEriwLbOuqsU45LpIFxeTqYWXC71v1KEN1CbQ7lF+avkDOB8ngIikOHTSz8y4LaedmyisIuAaOe7TCX0Ig+TMr0yY+gzAj8HqOpwbyK7Gwl4x+BZl+DrOYzL4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=NhmVmcdB; arc=fail smtp.client-ip=52.101.84.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="NhmVmcdB"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=raQyKSqFYg6b4moxa0KbVl1GIz3Gluq8Ol0xNxnXCRKNNb6BsMwtkR2NvUqYxZnRpqtz9V2KrhAKA3Og/5meZW0TrNlt81/AN5Hik+w+eQRCVopUlNP/T/FSAMVEilFJu+QIXWo1CRQWtnUewPX9a4GhtZfFUILCQAljipLM0TndeltKJA2y6Ffwvin4ne1Nqpr6s9sPYpeSYunGllKBBWelSnPg4qoWtQyD0JAhTkXEqInKa00HEbf72hTiEnpq8xLIVZ6zXW/syf0QXspZP75akfgE0YDt3MZCOrq8E4hP9izmBKE+Mrn5Vc+YVf+v47UBc66XRI4BwbB9bT6cwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q9LQ6U97DJmOvAnP/Hm3/sLsl0YOZft52i2nAtpwopw=;
 b=VKZ9afMp7MDtBUEzEZbgHaKP34vQLnav7d8DU6/1m29b/H6COmibMW7ZTilY9d4L4PeAaZaW+L6Mc+H8q6vqrgLz/gL1hkAPqVD8rk2PeQPKRPw4TvY1/8mAvtacu/V4MyXARVcNHdmJjtm8LXUAuTRYjVpmPeJrQDfpVKM366Pq14Bf5QbxGDBoAiuH0Xyi6x1YGk3N0SAJfY5znUUxq8f25B8v8VOWlZl8/d70ZVaeimM/i7lza7vUtPSUOxUB+Hu43uyu4HNEFUPNkFVK28IJCPtEe5qXHtvcLJpVk+ZgBqGHTBM0ypxb1cLI1FxNLF/9wGHJmQz7S6zZpMDNhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q9LQ6U97DJmOvAnP/Hm3/sLsl0YOZft52i2nAtpwopw=;
 b=NhmVmcdB48239se50kXCXYoFcnE/Nsu5Z2N6dM1/aZj4iI4qS+pjnMF5CY9xyZXURpYFpKII1XgKoPTqLgnnZCw+7hMspPBFqhkNn9NuxKYKxyRb7Hp9DPL9tsVJgSSwhtfAD+cGNPe7Y0wcQXwk7yhgNNYwiGgevy75c5m9cp95K7Uro/skmrXdXRTxBd9PdgbNNpcJCvb6vA33lmWEEcDfoJDnXjpaY+L1/dLvDywnGZsEPo+pOMoEEFWlIwoP4NAK4HiAYhWo2jFSaUT5J6ibvOPUDERlUvlUqbZ10zeC+SAV5rrLqr4jtgxdkEZsTA/X/6//TeG6+ZerCL3B0Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM9PR04MB8604.eurprd04.prod.outlook.com (2603:10a6:20b:43b::21)
 by PA4PR04MB7855.eurprd04.prod.outlook.com (2603:10a6:102:ca::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.23; Thu, 19 Jun
 2025 11:58:14 +0000
Received: from AM9PR04MB8604.eurprd04.prod.outlook.com
 ([fe80::e751:223e:aa3d:5827]) by AM9PR04MB8604.eurprd04.prod.outlook.com
 ([fe80::e751:223e:aa3d:5827%7]) with mapi id 15.20.8835.032; Thu, 19 Jun 2025
 11:58:14 +0000
From: Pankaj Gupta <pankaj.gupta@nxp.com>
Date: Thu, 19 Jun 2025 22:50:11 +0530
Subject: [PATCH v18 2/7] dt-bindings: arm: fsl: add imx-se-fw binding doc
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250619-imx-se-if-v18-2-c98391ba446d@nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750353651; l=3201;
 i=pankaj.gupta@nxp.com; s=20240523; h=from:subject:message-id;
 bh=tOtSXomq2KH+8clEacb9RWYs1iYcwyaRAGNdBtHVSY4=;
 b=iEL9Aq3xjjUvnYtNS3a44dFDkooycYWA+joRnrXuSsqfUrnqPQiaCJ/cWUFOJsqS2nCj1VoUb
 cA3B/Bs2RJzBs9tUBuyXEAYSSNBd5rjuUFQwuodMNdeNd/2RcrVzDRu
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
X-MS-Office365-Filtering-Correlation-Id: 5ccc4aeb-843e-4850-534c-08ddaf289210
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aVNzTDcyOVNGbXR2R29uZUJNbEJUUTFGcUJjY2N1SUtaNjgxWjNSaUlCcnY2?=
 =?utf-8?B?empOSnRrTzgrZ1RxOWV6NVE1M29UMDM4a3RteXNXUEYzaVpBVklUUTdGYUxi?=
 =?utf-8?B?TDFHMUYwTzJ4M2d2OEZoSWFwcWJKMjhVbTJ2eXRPdElwbjREczZ3eUNUWU44?=
 =?utf-8?B?QUJmeXJiSEFqVC9RMm5aTS9pSlZwSG9HcHQ0RkgrT2lseU4yK05GMit1dVVy?=
 =?utf-8?B?OTQzLzJkYVFwdjQ5QkduTGhSTFRDckdvL1R3Vkdpa2VoV2k3RHY0QjJQaXpj?=
 =?utf-8?B?OUxmb3ZnWUM1SWJ4TkRkQmxGaU10WTZNdENPRExxNkw1WVlMK24xZHMzYUxB?=
 =?utf-8?B?OXR0eEIvOTU1djJpV1BYTmZ2UmFIcTRvSlRYc2xYRlVqUDZqNkFxTXlKTzhJ?=
 =?utf-8?B?VjZZRi93N0IrNWQ2aFZrM3VXejFYMDV0TlNYbEpRS3EySGN5Uktac3hoNjgx?=
 =?utf-8?B?NmllU0xndVJqODFGMXdRSCszU0FGcEZuNWZlZ0lNeGNHdnVqM2c1c2F6anZx?=
 =?utf-8?B?bDZiYnFMdVo5OVg2LzJETEZMUGZ1Ui9KKzA1OFl0Z3NLcVE5b1FnOGdjaHUz?=
 =?utf-8?B?T2xxQnZaMzU1dGx4emIyelBLUitKcHVXVVM1a0YwRDBFV21Pb0MzT1dZWGJa?=
 =?utf-8?B?SEQ3S056b3dURUY0WFM4ZWRMRWFuaHJrbk4vT0EyLytydTdPdzYwSDVVV29a?=
 =?utf-8?B?Q1pWNk1wazRTb1Y0NzBqSERGOUlhZXlOcVByb3REUjk5SjdnYklseTJJWVMw?=
 =?utf-8?B?Y1BLVmZLSEUvcG1xa3pJTlF2bzFzc1F0NGxFL2VTdmZUT0J1aEQyRndoYmVF?=
 =?utf-8?B?SDEzQlppVWxxRVczbGk3b0ZZaTZtL1NQQUs3SmZkWmtyTGxIQ0R1clI4emxN?=
 =?utf-8?B?azluWUNlWmZiREFiSjNLREdnK2NRTnVjcU1oWXcwSVBLeHovWXQ3RUZWL1FQ?=
 =?utf-8?B?ZUVqUkJtaUEydk92Vk5rbklrVDlQdmN0dnZzS1JGSkJwREM1QUFrR1FBSEha?=
 =?utf-8?B?dldNQzlkNTFaTk5sOGtyS1VSNmsxU0luVWo5QkN5aS9EU0RHZnNzMTI0VkR4?=
 =?utf-8?B?U1VOSjhQZVFJSzI5QSsyN0FtYmZrcXUyUG05dDVmcUlRMlBURWE3OFdlQ3pL?=
 =?utf-8?B?Uzl1WVRZbDZaMjUvanh5cXB3SW1icHlab1U1N1FoYnpIeXJzazB5bitEVnpL?=
 =?utf-8?B?SW1wOVdJL0Z3YkNhTThLczlWQnQ5Lzh0Qng3MFVGRTJlaVlicFkwRC9sUkJw?=
 =?utf-8?B?d25rYVh2M29admsvYjVmc1dueWhoTCtFRm1GcmMxRm9ocGJwalRHa2ZlL0p3?=
 =?utf-8?B?QStQWnFPMVJUV01oeC9GbDJSWjU0YVo5OVVJb1RENDAydUtjaXZORmRHZGFw?=
 =?utf-8?B?N0V0SUFPcVMzRC9xM1NEZXFsREkzWlpFS3krM0pSWDBOYVJ1N25sRzFKQUxu?=
 =?utf-8?B?MkFPc254N1QxaFp1ZTBxdE9xT2xNL1EwajdVeXdhWUFpQjZBNjhWQkJqTzlx?=
 =?utf-8?B?L2JlWS8reHBMMUh4UGFyeW9CclNVNVlONGs0TUJPNGYrR2UvYWVvWmcrMk5R?=
 =?utf-8?B?ZE9wZ1NuVkFqUjBZMWRnQjMxTkVSL2xvVmpmc2RRamlVK0pPTWtIQjZOTGlQ?=
 =?utf-8?B?RmhTTlFVU29SczFGWFVyM3JVUzE0TDBkQUlENGxnelk3anBlaDlVUVZtQUx1?=
 =?utf-8?B?Ly94ODNmcjh4Z0dWNnBkOTFvWXFvOHlGUnI2T1p0YlVyWmR2d3RBVWEyOWw5?=
 =?utf-8?B?UGN2Wjd1eXVvNkdqVnFzVDhyVWNLUUUybmoyNFErSU1yQUhIaTRYWHpnQTZX?=
 =?utf-8?B?RWZDMHM2MDZWV1ZUS0R6K1lzQStxMTlDdDljZ29qWHQ0d3JuWXVjYldmUVRZ?=
 =?utf-8?B?SUlOblR5UnZJcG1EVTdrUXMxNG5aNlZvRHpqK2lGTS9nbzJMSUh1ZE80dlR0?=
 =?utf-8?Q?c+ZCWD83Jm8=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8604.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(52116014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SkFZclFULzBLYlBEdFJrOHdZbkZINnNwdldYRHpoc21vUzQ0MXNrbjRVbnRR?=
 =?utf-8?B?NFZ6bDFIeVhwSldqVENrdFZwU3IybUtneC9xaTFpWWhmUFJRanJHQ0plQ0lz?=
 =?utf-8?B?U0U0VldIakJFbHYrVDdiSERzMmhlbS9PM1V3MkJNRzNTdlRPekFWQ1owZXdD?=
 =?utf-8?B?endWNnhDZk9oalZlOWhiY2xsM3hhN2dWK01qWE1xd3dwazVaT0RGVStndVQ2?=
 =?utf-8?B?QmRweDFnWGx4d2lWR3BvV3BSRERoWkUrM3VvZ09JNERPL2I1VkRZekdnMGYr?=
 =?utf-8?B?V1Q1dXNyRXg2bnlJeENZTWk2U254aUR2R2tQaEpjbTlQV00yWDhKdWs2dUdw?=
 =?utf-8?B?eE8xWDErQVZPVzlmWElZVFBidDlzSnVYMU5jWDFxZExDQVpwZm95cjM1QnRI?=
 =?utf-8?B?NGtnYWVrVGYvTVVvREtjR2EwSXdwVTVKUk9wQk5vLzFURDEvNGswbTRWcXZD?=
 =?utf-8?B?eS9XYmk5Unh0SVRibnlpbjg2RUpkczFmeFh1YXBEQVh3TmkvNmwvcENkQURi?=
 =?utf-8?B?NkpkNW9CSG1obXdUeGZpdFpuYUIvSHRPbEZVRUw0bkppOGdzZDVhRG9UdVJq?=
 =?utf-8?B?YnJ6MHl5dldpeDkxMVVvbTNrZjhRd1dDdGhJdUlsWDYwcmtQSEFyK2kycC9P?=
 =?utf-8?B?Tmp4WTVsK2ZoL1V2cHFGM1NQMmhabHU1UThQS1N6eEJXdkZGV0RwbGYvUmNn?=
 =?utf-8?B?RmlGMzhaRHJzNkMyK3hUY1c0WDM5MVRGYnFiWFVnQzNvc2FvaE9EYWJMb1VB?=
 =?utf-8?B?bGt4SjFTUm15NDA5ZFhpNUorTWVuV2w0bUxUTEtycFdTTzdJdWtEQjVaaEYz?=
 =?utf-8?B?VWFoaEJHWUpoR2t0TGVrZnBuRThieHZSdzJwY1d4alJhTDFucDROWWd2bzNP?=
 =?utf-8?B?T29BWFdVd1NIU1hZeVY4V0dQN0I2L0hITVVEMHkveUNaakdabHVOMCs4eUlN?=
 =?utf-8?B?eERaRmtBL28zcVg1NDMrdERLZkk3RktxeHpkMlJVZW45TzNvc1JJUG0wK2tE?=
 =?utf-8?B?L0tlUzc5Vm5TOWpWSGRndHVsbDFTSDY5SXBmUmkxa3cyZWJxaHVUTnBvVWth?=
 =?utf-8?B?WEgzOVJOYnRkRkQyY0dJV25hWFlNTGxsTUUwSG41SFVZblFPLzVFN3N1bDlV?=
 =?utf-8?B?Z2UrWnFUUm4zc3N0V3ZRNnNTd1pUQVVPRjY5VVU2aDVDbytYN0JvbXRQNE5k?=
 =?utf-8?B?Rlp1VitLMEFIZjVTTDlHNU5kc00wTVk4MGRHTi9ZOW5hQlRIYmFaYU5WK1Iv?=
 =?utf-8?B?cy84bUY3bzJzbVQzR0VTNlp6VjZ6VXkrdk1tdFB5cmRMM2IwOXdyYnllb1dD?=
 =?utf-8?B?M0c1TndnaDUvRFBvVFQwMHVGelU5cDVDdTFEU3BaVGZ6ZkRkb20rY1EvWHhp?=
 =?utf-8?B?RFdRYzlvVFFVWHZkNEQ5a2lNUEc3dFdFMm1JN1dOUmRsYWZmQWRJRmUwY1J1?=
 =?utf-8?B?TXVsZStJMTdzSUtMNktIeUZDTC9IajN6d0RVYTRZeC8vTkhwbGFoUTB4NVlE?=
 =?utf-8?B?cGdZM29SSjZsMWlOUE8yZ0JCMUFqVmQwdVhPQ0ZUZGpqTHhMTXl3VWc4SW5u?=
 =?utf-8?B?N0lpRXhlbC9iVURkREFpQ1NxZkFWTTQzWm1EakEwdDZyb2FLZllxQXBLbUdB?=
 =?utf-8?B?SVNjY2NKa2dFbG9xOEphdExKY3pqbGZnMHJiUmlwZGNDcXdYS2pPd3JWQzY1?=
 =?utf-8?B?RFM4ZW1iODFaeTZyemE3YnFob2VRQk8vZ0JFZnN3RzJycnBrNjloK1pCRHJi?=
 =?utf-8?B?ZVJEa3hyU2lpVTAxY1ZLNzZjMDN0OTRLdEt6WmlXbUd3dFBpQndwVTM1QmVt?=
 =?utf-8?B?ODlRNHdCdFM5b2M3Z2pqRndEVm1GTXN0bkhudGVHSGNQQUwzaGdKUElDei9q?=
 =?utf-8?B?UkJNVHhNQmh5VVpZdURYeDZnaEdZUzlTeEtsaTUxelYzYmpiQzF4bTVodlZF?=
 =?utf-8?B?dDkwVitvZThzYjBNOCtFTzVmQWJzM3UvY0RMeWhESlQ4cFVvdW1jZVREYzFV?=
 =?utf-8?B?R2RDSHNpRStQbWE1dDliOFF3RnRpaGtPNklLU0UvYjhIY0NXZjNwdTh6QjRx?=
 =?utf-8?B?dDl2QWVVbFI2eHZJcUNSemtpUG9ZcGNSbktyYTh1SUpjaUwrYTJrYTQvM3No?=
 =?utf-8?Q?TjRdV6zCLPOp3BxH3bymOKs3Q?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ccc4aeb-843e-4850-534c-08ddaf289210
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8604.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2025 11:58:14.2496
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ab6bcJrgFrIpN7rbPnVdcgZMpmJ5j+L96U+C5zsXTYC617kswpdICnT/VSywYOjZZVdJ2ZKjYRk66yxivliR7w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7855

The NXP security hardware IP(s) like: i.MX EdgeLock Enclave, V2X etc.,
creates an embedded secure enclave within the SoC boundary to enable
features like:
- HSM
- SHE
- V2X

Secure-Enclave(s) communication interface are typically via message
unit, i.e., based on mailbox linux kernel driver. This driver enables
communication ensuring well defined message sequence protocol between
Application Core and enclave's firmware.

Driver configures multiple misc-device on the MU, for multiple
user-space applications, to be able to communicate over single MU.

It exists on some i.MX processors. e.g. i.MX8ULP, i.MX93 etc.

Signed-off-by: Pankaj Gupta <pankaj.gupta@nxp.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../devicetree/bindings/firmware/fsl,imx-se.yaml   | 91 ++++++++++++++++++++++
 1 file changed, 91 insertions(+)

diff --git a/Documentation/devicetree/bindings/firmware/fsl,imx-se.yaml b/Documentation/devicetree/bindings/firmware/fsl,imx-se.yaml
new file mode 100644
index 000000000000..fa81adbf9b80
--- /dev/null
+++ b/Documentation/devicetree/bindings/firmware/fsl,imx-se.yaml
@@ -0,0 +1,91 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/firmware/fsl,imx-se.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NXP i.MX HW Secure Enclave(s) EdgeLock Enclave
+
+maintainers:
+  - Pankaj Gupta <pankaj.gupta@nxp.com>
+
+description: |
+  NXP's SoC may contain one or multiple embedded secure-enclave HW
+  IP(s) like i.MX EdgeLock Enclave, V2X etc. These NXP's HW IP(s)
+  enables features like
+    - Hardware Security Module (HSM),
+    - Security Hardware Extension (SHE), and
+    - Vehicular to Anything (V2X)
+
+  Communication interface to the secure-enclaves(se) is based on the
+  messaging unit(s).
+
+properties:
+  compatible:
+    enum:
+      - fsl,imx8ulp-se-ele-hsm
+      - fsl,imx93-se-ele-hsm
+      - fsl,imx95-se-ele-hsm
+
+  mboxes:
+    items:
+      - description: mailbox phandle to send message to se firmware
+      - description: mailbox phandle to receive message from se firmware
+
+  mbox-names:
+    items:
+      - const: tx
+      - const: rx
+
+  memory-region:
+    maxItems: 1
+
+  sram:
+    maxItems: 1
+
+required:
+  - compatible
+  - mboxes
+  - mbox-names
+
+allOf:
+  # memory-region
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - fsl,imx8ulp-se-ele-hsm
+              - fsl,imx93-se-ele-hsm
+    then:
+      required:
+        - memory-region
+    else:
+      properties:
+        memory-region: false
+
+  # sram
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - fsl,imx8ulp-se-ele-hsm
+    then:
+      required:
+        - sram
+
+    else:
+      properties:
+        sram: false
+
+additionalProperties: false
+
+examples:
+  - |
+    secure-enclave {
+      compatible = "fsl,imx95-se-ele-hsm";
+      mboxes = <&ele_mu0 0 0>, <&ele_mu0 1 0>;
+      mbox-names = "tx", "rx";
+    };
+...

-- 
2.43.0

