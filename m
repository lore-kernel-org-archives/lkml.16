Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013023.outbound.protection.outlook.com [40.107.159.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17C1C1DE2C6;
	Wed,  9 Apr 2025 06:15:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.23
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744179308; cv=fail; b=Ven2s2hON3MAy+PKcBxpApIuaMT8DWx/66WaZ6+m9m4S7M5scNqZBSfI9iU8R2QIZ7pzGMje962mam5DjYp33QITeCrqHbrXGM7ivbMhBemHYl2Qv63bzySp9wWVc6CU9b9SAZewsqv74ONfujUlpCO21l04OBZxShkaZwB8arM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744179308; c=relaxed/simple;
	bh=YzhYqFJe6UZXhpq8PbsSekpK+8sbVDUzk+LTdh3FPlQ=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=e2K1H95gc8ffplsrA4r89MqDCA1SqTn2mfjJwBkYg6+2FFXfiib/XOog8gRW04sMV7R5Rdyx0EB8C7ep+cyHKtu2i/v1YA2A3KO10PAh93ea41eNBiEMcJMq7r16GQV27yf1DUR1xC4wf9RKLxHSekU7DBXPdN02corhA0RS5Z8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=k02+54DU; arc=fail smtp.client-ip=40.107.159.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="k02+54DU"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZV2U2gO0eXtHEWwYsRvITwTGi6/RtqLuoIbcJqIRS+KAZZME4nGRqkZnOGjSIFWjx9+RDpvZJJ1bujlAiILJblpjbZRqS2Fga76ht5u8ZkpcK6XIg84bLP2V/r+ge5QOxGduHauC6tV/FAzIfcItU3/b0fEOBEKPo9MM2uiGlmgjc4TQb1h0uIp7odRcR3eyGRSsaJ1RpOAzhyinUPdV4UlBf7bv263Y8KYzbb53M0kZX5CrHOQZ3zW/JVnuJRIUDxDVsrB44TbSdsDrJ020yU8NTlRzyl+pAXEs9loLIdbCOoJn6Rg9RXyubN+5aHHAKM0ViCm55Y29EH7XIJgD2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0GdE9/juU29x7EiabbFBcIghv9x7bN4+uj5hi4s49z0=;
 b=Fqwxe96/GvRWgzgaLa8lWMZmCor2VEy4N6Airs+RTSgxPBcf7LcETYhPwDokhLWN3li/Q+MzooNN8qtoeQsr8uC5x7c3QSbXOF5zwJyA79fjqM6kFaFldqgX1+5HmEkcU9dfgVtSuhgY/9U/OZwGVd1hNcueuweVvVXxXWyFrBSaxgkIY8pj4kAV+86Q1bfIX2c8DlgisKR8F4BXmxp9cOgvydEwPjYFfTb8nBzBDZgW/W7facd21JSyvp8wOrX9hm4lTUsZzdefhmCrNNNcsVFkqY6ByS4+0SO5Y2jL0hbUZtA9EV+VECGoo+zoWS4vW26fxsPwhBsw1R0ms+oYYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0GdE9/juU29x7EiabbFBcIghv9x7bN4+uj5hi4s49z0=;
 b=k02+54DUkeJgWlE8fMXwfCy84uBmbSFNWXQx6Vgth9Jb4kQoghtLZ6SXNDFVpopDCjvohVuvrlxDrmSY4o1drA+xzwSBqADdSGCZyymjByxbI2wdvybQyOeSqxY6vOu9ohTZS6QXkdyM4z1Lmz1Pm4BRuTdxaELc8zamXWneLp45ECmBhP/NrXqJqR8Z2M/7IIi2Z2HCCE4RK4JhfHQggNUsJuuzNGk71VX9Mz8O6rfvshrZdSzu3+VtYjx9UeItSQSJp8hkXeuzA3TFcfaJS3Pjd1PA+2iBJZOFF3SDmcvcImfmx0yP3hycvnLd98ekzRE6EAAlsD6zIUkK3SUXJQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM9PR04MB8604.eurprd04.prod.outlook.com (2603:10a6:20b:43b::21)
 by VI1PR04MB6864.eurprd04.prod.outlook.com (2603:10a6:803:138::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.34; Wed, 9 Apr
 2025 06:14:59 +0000
Received: from AM9PR04MB8604.eurprd04.prod.outlook.com
 ([fe80::e751:223e:aa3d:5827]) by AM9PR04MB8604.eurprd04.prod.outlook.com
 ([fe80::e751:223e:aa3d:5827%6]) with mapi id 15.20.8606.033; Wed, 9 Apr 2025
 06:14:59 +0000
From: Pankaj Gupta <pankaj.gupta@nxp.com>
Date: Wed, 09 Apr 2025 17:07:48 +0530
Subject: [PATCH v16 7/7] arm64: dts: imx8ulp-evk: add reserved memory
 property
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250409-imx-se-if-v16-7-5394e5f3417e@nxp.com>
References: <20250409-imx-se-if-v16-0-5394e5f3417e@nxp.com>
In-Reply-To: <20250409-imx-se-if-v16-0-5394e5f3417e@nxp.com>
To: Jonathan Corbet <corbet@lwn.net>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Pankaj Gupta <pankaj.gupta@nxp.com>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744198674; l=1341;
 i=pankaj.gupta@nxp.com; s=20240523; h=from:subject:message-id;
 bh=YzhYqFJe6UZXhpq8PbsSekpK+8sbVDUzk+LTdh3FPlQ=;
 b=MzbCVU33KA4tb3ifrmn+LOTnHiwLsl/yMRjtn/pFFR2QLg7weZttPA0LLwpexTO2DtXkCmQ5g
 h+q1ptzI9nkA4OM/5TPXVcBD6pHOuXY0kzY5fD7ITiS/634dcPUJHEL
X-Developer-Key: i=pankaj.gupta@nxp.com; a=ed25519;
 pk=OA0pBQoupy5lV0XfKzD8B0OOBVB6tpAoIf+0x1bYGRg=
X-ClientProxiedBy: SI2PR01CA0052.apcprd01.prod.exchangelabs.com
 (2603:1096:4:193::11) To AM9PR04MB8604.eurprd04.prod.outlook.com
 (2603:10a6:20b:43b::21)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8604:EE_|VI1PR04MB6864:EE_
X-MS-Office365-Filtering-Correlation-Id: ba6e3020-2bf5-4006-fdb0-08dd772ddb14
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|7416014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?KzBQQlhJbm83NHBJa0NneGdHQ1ZxWStaNkJNaUxSclExZGlxRFkvYkpvTHFp?=
 =?utf-8?B?dWNMek1HR2FYV0djQjFMMVRxS3RieGNIVnZXTnUxa09LVFRnRmtMSVM5Mk9N?=
 =?utf-8?B?QnZaRjRpZmMvUFlNZ1VLOWJIY05Sa1VmZUtoZTlYSEZpRFNNS3Y4L3ZlNjRS?=
 =?utf-8?B?RXFHQ0xBbnpFck1lN1NOQ0F1RW5Ic2N1azFKQlJxdFRzeGo2Z1QyU2N0KzA5?=
 =?utf-8?B?aDNBcXdneWNHaGpNVWFobWF2QmhWbkoxc1Z0QjlUVEV0OE5RZ2RhTXczRFR1?=
 =?utf-8?B?R1dLYVRnZ0VTS0NhQlJhZ0F3QmRTbi9zOHFJcThQOTI3MjVvRCtDaS9JSUJk?=
 =?utf-8?B?YlM5NDhXUy9PRmN1OGExeXFJUW1lRDBSbkNFa1A4MXdrUE9sdXlIdm5UTFpi?=
 =?utf-8?B?L3ZKTnNsR29TbzExd1JFNUxPQWVQTDZPTjRab1VmenlCUFR0aEQ4ZFk1R1JY?=
 =?utf-8?B?VGhQS3ZVbUorcFdReTJ0ODhNZXpRZGQzcG10Vm5JNTZ5WUluV0pFNmM3UzIv?=
 =?utf-8?B?S2ZCek44ck9ZOXF2QVVSbjR1ZW9yTVVkTkFUMHRmeW5EelVlVlFVaXZveUd1?=
 =?utf-8?B?dG1OQ0doOXU0UEgvOE1nc1pYVzBOemZ0VjkvZkdpWmNoNmovREpZcEF1NlVJ?=
 =?utf-8?B?OGJ0cDVKQzVUbnFUdjh5NVZOR3pJNlgyVk9JVk9zUmdkRGVBTlNNWWNYMjQ0?=
 =?utf-8?B?VklSYzlqSEpGMkxhOXd1M25RSU40UnlwRmtpOFNtSlAvZS9nT0NHM1pmb3BC?=
 =?utf-8?B?ZGp2RDM4aDdybkZWaWlYM2xCUDhJazRkaFJSS3RrU09MRXJqcjdWaVJnWlpW?=
 =?utf-8?B?c3pKam9kSk0reG1jZ1hhaVhJSDl3UzN2bllRMGF6YUU3Z0l6VHE2VXlGckh0?=
 =?utf-8?B?THJHcUM4VWhVMXN4N2VjMWVQcjYrdmpxTWN5NytWc2tQeVdYZFJIYWdlT0Z6?=
 =?utf-8?B?TEtXQkROaGpSZ1RWQjRvOUF2ZkFubkIwaERLNUFaK0ptcElSbUg0MWJBdWc3?=
 =?utf-8?B?SlFibURwMjVMc0t3RTZPQXgrNE14S04vUitrUlZLdjVpbEpMN0dNbTZvL0lk?=
 =?utf-8?B?WVJVRU0wNnh5UHZ2VVVlSk1hbklCR3E1YVIzUFhpZTVvWTgxUi9ZVmhOSDJp?=
 =?utf-8?B?ajEzVTM4dUtxYmtQM0p4NHI2OVNWbm54M1E0eUFmcmtNN1VpbDRJUEZ4Qkpl?=
 =?utf-8?B?bDdIdzNrODNhczltUzBFaE1xUDdkWEN2RmlUck14UEU2VS9TcXJKSDU3TXlG?=
 =?utf-8?B?TkhDRmFkMHdadXpsTkN0a29Bc04yd1FEMDZoRVFmRHlSSWljc3RKaTFSR0Fm?=
 =?utf-8?B?N3FZRHZiWXF2Q1p6TGJzYk1QUm8rMTBHNkUzY0h0dnB5dGQzNjArYWZYU2pv?=
 =?utf-8?B?dWt5aTJza3d4Y0R6bVJ1MkdXTTIxcWF0L2NpNEFYY0YrRDZJT29aTy85SFFr?=
 =?utf-8?B?MEFMdXcvWjhpUDI1N2YzbHNaYzhFclNyUy8rWEE4M3ZNMWd6dnlOa20yUytS?=
 =?utf-8?B?SXIwZ01OVDhBQ04wanlRUXNqcnNFRVVyZHVpT0djZ0s0eFlRancwNlE2ZTlX?=
 =?utf-8?B?QjJGVHR2NmIvYjZvM0JDODd1MlViYkZIOThNQXZpejI4bVI3VDZKM3hFRlVY?=
 =?utf-8?B?TXRzR1JMeC85UkF3QzhrYVBKWkM0Q2pzNk1xRytRNW5MV1RxSWRWQkxBUjhn?=
 =?utf-8?B?M055SzR3VHdSMHIwKy9CZEwxQ3hQVmpPb1ZnUVVNbWl1OVUyN3BidldBcnVs?=
 =?utf-8?B?eWg5aTg0eVRIQzdwVFJKWjc0RXpkR2lpNSs2cjFRdnRHdjAyNmYvTFZxUmZo?=
 =?utf-8?B?SlJMWVR1blVDc1pIV1JGR1hmWGphcVJUZGJLMEsyZTdWWmNleDNxWGc5aG9z?=
 =?utf-8?B?cTVQWkFMN2FZZitSeHNMMi8wZ0wzRGNzc3drNXFUaFBtQVp5T2V5LzZoM3VZ?=
 =?utf-8?Q?/KsokzcaIpGhRyzT+8x7+IQLddyOmQI6?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8604.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(7416014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZTFvTXFFM05hNy9YbnZiemRVTXgyWnFLM0Q2TCt0L3FaYW1MY0dZdmF5T1pt?=
 =?utf-8?B?SU9PTnFYQ0N2RVErUXRVcUpMN3VLV1lwM3NsSlRaNXhJYXprSm5LY0F0dFlP?=
 =?utf-8?B?Wm1TRGt0d0t3TWV3SXVDUE9PNHJNOXViQi9vT1k1WjE5cDZOZjd0eFl1R2Rv?=
 =?utf-8?B?d1d6aHNPbktDMDJXVzBDVW9EZTl1MWZGUkNCVXdiU0g5bEUvek9mVmJBbjZQ?=
 =?utf-8?B?L0cybklXeG9CbytuL3owNUFLNVc5TFRLMWJ0a0RaTXpmclNTcERhMEdvWXMy?=
 =?utf-8?B?cGhucVBIZFd4RkFpbUUzSlRWeDhqQndKQ1ltU2ZIOTF6Z09MdGdRVDl0Ukd1?=
 =?utf-8?B?MEVKbXR5SGVhVC9sRHZ2KytsYS9rSGVXa3d1SUVYVnpReExQTmorblp5YzVy?=
 =?utf-8?B?cHpQRGlzYUZrOXdWK1A5K21qdWFMN01nWStlaE52b3JIeENuQ1lzM2R1NGxx?=
 =?utf-8?B?cE13NW9GM1MyczNiY3l1UmFDS2pMM2JFM3IyZG03TXBvUlp0WXVLbWxtVVF1?=
 =?utf-8?B?QnF5VnFPOGNVU0tJTXBrTEIwK1VMSk5yNWcyQ1JZSGZaTHNaWTVSL3BnblNF?=
 =?utf-8?B?RE15K3o0L2NHNXVDR0llcWRicXowaGtVajNUazBBUEw2cFlUK2NURmpENG9N?=
 =?utf-8?B?WlVwQlNQVElmSExuZzJ3RUtUeHlzZ0J6TERoWjNocjVDbzZZbk1wY01MTXhW?=
 =?utf-8?B?UGpxVDl1TDJ4QW1SZURXZWp1UzBPMlFXZkQzSnhoZ0RCL1M4ODhZTG1iUzFq?=
 =?utf-8?B?d3JnSmNVS0xCTDBqZDF6VzZYUW1DMEpWOENBcnE2REpYajBjc2JlWU9Bblc4?=
 =?utf-8?B?UnlHLzg5WWtQTllTNXAxSitZM1lzZDREaGRadkdNbGNqK3RSV08vSjhabnBS?=
 =?utf-8?B?T254MXZCNVNOSzl4VFdjUTVMWktkQkxSc2NNRWMrQnAxKzREUTRkRktmZmh5?=
 =?utf-8?B?dEZSRTRxTHdXM1plY3VySzRkQlVGWjFCb1h6Y2g0a1duK3dhUnM2UVE3dzIy?=
 =?utf-8?B?aUpzMW51eHhseEJkbFE2b2graTBTRGgzNlhLVnQrcUowd3ZTYU9jMlVKd0d3?=
 =?utf-8?B?VGVjV0J0eXlHREhmUlJoT1F5dE1NUS9IRjEzMUlOeVpHVTZxOXB1a08yWFk4?=
 =?utf-8?B?dDZ2aUJPbkRsV1h0UlpjREV2YVdYcmJwR0o1MUtONktGYVdleU4zbXY0UXd0?=
 =?utf-8?B?MVhyelRCQlhnMUR5OVNSSFQ3N0c3QitxNXlXbmR4YmFCWnFBZzhxWWdJbHNN?=
 =?utf-8?B?N1NtdFBDbEN2eVVRUGxlZjJhV2RCSzdaZWs5VWlTS2czdDl3R1lWR1NFUGtU?=
 =?utf-8?B?cGRsdHUveG0rVXZucFl1WWlQM0RoQ2tTNTNra1VGVDlHVmlZYWd1d1h2M3Jh?=
 =?utf-8?B?WlEzdmJlb2JSUEJSTXdsaXdoeGJnM0c5OTN1YlMxMm1zN0JwNkRURXhsRk9x?=
 =?utf-8?B?UC9IaDA3dU9qQThwOXVwc1lxRXIwazJrdlpSaC91ait0VEVING9qVnMvV3dY?=
 =?utf-8?B?blRtVW9hc2tYcWtUZW9jMCtmRllqR200MUlsY0xjOUczcllTdlAwOE5Pb0li?=
 =?utf-8?B?OVJuOVBWZTJCRDQwM0tBVjRVZW0vK09VOE4xS2w4dThnVXU4MmI0UHpjdGVV?=
 =?utf-8?B?bGw0c2NrRGs4L1k3U0k0T240YVgwN2RUU1E4MEpHTmVsZTk1cG9aOGFGVWp1?=
 =?utf-8?B?byt1MGFSQzRERDVmNitteHc4ZEdGNVlIMDRldnNWejZhdWRZVWc1cVRNS1lt?=
 =?utf-8?B?ODJRWDB6V1BNQVRGOVdpbGdtU3VmeFVna05OT2ZXeG5FeFI0TTBKN080eThO?=
 =?utf-8?B?cGxERENqYlQ3cWVVSGJZMkVrRUhPUFgvUVJpWkdwV05WNnJGQXFtZ2N1UzBn?=
 =?utf-8?B?RzJZRkx3MnlsR0U0NDN6U0FJbTBUN1pHbmJ3Nmk2OGZuWUR3TUlpOHgyZ0Jm?=
 =?utf-8?B?emRPTUo0NE1hQmxwMExXNzBlU3VnUVBwcWR2VVlMYWtUMUdDUjhUVGlnMmpY?=
 =?utf-8?B?MkNWM0c0d0lMV1ZGY3YzYU1sVlRITGtFMENpS2dSa0Z4ckxRVjlTRk9ZM2JP?=
 =?utf-8?B?MWcyQ29Tb2JVRHVGRHkxRFBOZ1NNc00yaytEQUVpUnhBR2t6MzR0b2JUYTBG?=
 =?utf-8?Q?nIaVImVKaAW3LeQ63r/oxSdkZ?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ba6e3020-2bf5-4006-fdb0-08dd772ddb14
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8604.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2025 06:14:59.0581
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KrNeCTeTuBYxfay1S17PVDMMdQmzoOo4x9QWoCHz6Ia87sow24DHy9DdO9uQoE9k/lE1Wl0VX15y2+e9Sm59XQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6864

Reserve 1MB of DDR memory region due to EdgeLock Enclave's hardware
limitation restricting access to DDR addresses from 0x80000000
to 0xafffffff.

Signed-off-by: Pankaj Gupta <pankaj.gupta@nxp.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>

---
changes from v15 to v16
- Collected Frank's R-b tag.
---
 arch/arm64/boot/dts/freescale/imx8ulp-evk.dts | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8ulp-evk.dts b/arch/arm64/boot/dts/freescale/imx8ulp-evk.dts
index 290a49bea2f7..10aaf02f8ea7 100644
--- a/arch/arm64/boot/dts/freescale/imx8ulp-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx8ulp-evk.dts
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: (GPL-2.0+ OR MIT)
 /*
- * Copyright 2021 NXP
+ * Copyright 2021, 2025 NXP
  */
 
 /dts-v1/;
@@ -37,6 +37,12 @@ linux,cma {
 			linux,cma-default;
 		};
 
+		ele_reserved: memory@90000000 {
+			compatible = "shared-dma-pool";
+			reg = <0 0x90000000 0 0x100000>;
+			no-map;
+		};
+
 		m33_reserved: noncacheable-section@a8600000 {
 			reg = <0 0xa8600000 0 0x1000000>;
 			no-map;
@@ -259,6 +265,10 @@ &usdhc0 {
 	status = "okay";
 };
 
+&hsm0 {
+	memory-region = <&ele_reserved>;
+};
+
 &fec {
 	pinctrl-names = "default", "sleep";
 	pinctrl-0 = <&pinctrl_enet>;

-- 
2.43.0

