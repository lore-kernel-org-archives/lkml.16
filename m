Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2046.outbound.protection.outlook.com [40.107.20.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4472023A99C;
	Mon,  7 Apr 2025 10:57:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744023455; cv=fail; b=YQ0jEtIGTqdlp6fnWJ3Q0k+orowVUBS04eSQlDsRdmCFxhJqTP469rIygry4SY9dwzFRCZHvMGRaJOdDfcqPcK9l3QN+PFtbLNAC77omXSC5ga7c3jSyDU2gHDnX2t0rc29crzb8NkVeSqfCxNwm7VSRW3wc07H0YuSWKhhoPkU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744023455; c=relaxed/simple;
	bh=DRkDZg1VfpzhFBuixQT+JSk3xiHDgMICrZU2Rgis64E=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=J9mxdY68yojH+6NCYy+L9//ttM8pK6kS4qJoKlyC/q16BpUMZs9GF+RJmwM6eYAx+Yt0SLOwkA5Q+q4TUd5ohNqkg3NZXaLMqjzD27gz583kS96rC8q4cndYRe7JPSMlem+VryfEWEmDCVpbL96Dh/7UzZgrcqWswtXCpj+ppSM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=hgsUBj+Y; arc=fail smtp.client-ip=40.107.20.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="hgsUBj+Y"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mfAdP9Vtp/0VhGYoMG70dkHNETDfSC3wo3Wg1SBVxqQIlbTuKJZQRK1BtV7Bq4oKibeXFHEL4nuVbHuVtkhDOQXBROuHr6pFTjLCL7ycSRdtvbzi7+cS9sDxIfUqh8GRiERlOfQlzdkI5vXOiSQLGxTV/RbFYdbBy242HL0Z/TI2v12gev6q7RjuAuzGZzMGAZ9CFp4WnCRwBh7bVu0rHcFT9PxY9zbNI/+QTf7h5JnrlUBnzzJ+TEFVx4NNiEl8opZTfXzCFBxqhJRQ0YKUstg5SwoZwiTs6bWV5UXGjcmlu907hn0/ro0Op3V+VZfp629gGIftzso23qfKdILebg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YJ9glBG/Fa0FANTVAW4gygMrCec6MV9a5TSsfhDsytc=;
 b=waNCk+pC+9ZZWo0PZ+aQKvMfNTk20Tn80iBsQlJLmXYL4+O1p5GT1fTcMTawVAcOWtZwyALG3XjrItmpvw2RmhKpiXyQUkypS0jQ/mNvm/epmGFrcIEe1u0wP4R+A3fTD1qJipylzneI9dOFDskvYfLcB8igTQCDKJzb9HzTUdOZ8VsDMpp2mm19OggWwDXVT7pP7TiEupy59qdycNiBFgQr68zGg03b/RZ7Syiqf2MNf5Hgy9S03T2uV4I8zOaejaehgx0uxq81ZjXrIHlT2ukFbq70AzvNnbogkaRm4mVIt6qkUItVTKbxJZKA5hkzregiKRx0NcLsXno4jtIYoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YJ9glBG/Fa0FANTVAW4gygMrCec6MV9a5TSsfhDsytc=;
 b=hgsUBj+YfqmuqJj8uZxvBl3far4rEdwS64Ea8QnwZIoOL8JA/I4yXJw3JGmjGjwOwf3PHJP7Ur1oSWiXeroNmdGWVWSFVgMi5CE8A4fo6NSmZGxrJrHdUSA1DLODlnDpstAgfD2SBFfEBK37PqyWr/aSC3ntwQpIMrmtopTrOUdP1quUznXQMUBoYjt2gBV/K3IOqCiUhPvJkg5xngx9/FUMNkW+u8BkwDwfhmsExQd//utgCTut5/Ry8P8M8fo8WeqnoTcH9+ZhSNTitk7X9l1sAJIkngb4CqiK23ZhswbZ+aFZhG1JXxb9YKk9HN9cspHAymA4NBfWkS08iXH2wA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM9PR04MB8604.eurprd04.prod.outlook.com (2603:10a6:20b:43b::21)
 by DB9PR04MB8493.eurprd04.prod.outlook.com (2603:10a6:10:2c5::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8583.43; Mon, 7 Apr
 2025 10:57:26 +0000
Received: from AM9PR04MB8604.eurprd04.prod.outlook.com
 ([fe80::e751:223e:aa3d:5827]) by AM9PR04MB8604.eurprd04.prod.outlook.com
 ([fe80::e751:223e:aa3d:5827%6]) with mapi id 15.20.8583.045; Mon, 7 Apr 2025
 10:57:26 +0000
From: Pankaj Gupta <pankaj.gupta@nxp.com>
Date: Mon, 07 Apr 2025 21:50:18 +0530
Subject: [PATCH v15 2/7] dt-bindings: arm: fsl: add imx-se-fw binding doc
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250407-imx-se-if-v15-2-e3382cecda01@nxp.com>
References: <20250407-imx-se-if-v15-0-e3382cecda01@nxp.com>
In-Reply-To: <20250407-imx-se-if-v15-0-e3382cecda01@nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744042844; l=3712;
 i=pankaj.gupta@nxp.com; s=20240523; h=from:subject:message-id;
 bh=DRkDZg1VfpzhFBuixQT+JSk3xiHDgMICrZU2Rgis64E=;
 b=M/5ymN8P8lONZoFPz3DnFWugD2sOBvnvdfnKqtwaVkvuocx9F6cyBMvHHpcThfcVIGUIfC+Tm
 z7rt3f/zyZTD1L1EoC1ekNVNKIUGo+3enl40spA2wPs7IlHNZhJIvuJ
X-Developer-Key: i=pankaj.gupta@nxp.com; a=ed25519;
 pk=OA0pBQoupy5lV0XfKzD8B0OOBVB6tpAoIf+0x1bYGRg=
X-ClientProxiedBy: SI2PR01CA0036.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::22) To AM9PR04MB8604.eurprd04.prod.outlook.com
 (2603:10a6:20b:43b::21)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8604:EE_|DB9PR04MB8493:EE_
X-MS-Office365-Filtering-Correlation-Id: 314d8809-8d9a-4448-bb1a-08dd75c2fbb8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|366016|7416014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UEcrUEt4UmRseGY4QVlqRmpnZUcwTXdZVGdSUUJUYUxvUFpCQlF3WU41TlFZ?=
 =?utf-8?B?dytaMWxjRnVqUm1sMkN4SkR2b1JrdkpleGVZOG9EV0JZbFVlSmd3U1Y0aDMw?=
 =?utf-8?B?Q0o2ZUdVNjBxSmc0U1AveXhFd0l6SHJJTUkvZlhML29CM1d0NkV6bFM2QmhX?=
 =?utf-8?B?b3BMaFNZS3ZrZEdtRkFwdmM5blZZYkxSNmczQmVZWXZMTVBTb0FvVlFVQUFk?=
 =?utf-8?B?YUxlbUpGQ3lTUVl5RzlVeHBDR2MzTTBSTHd5dmhIVDJLNFJ1czZvL29hRVdy?=
 =?utf-8?B?bm9tNWJuWlVZaDR5WnRLdXBoQnozYTRTT2U1SU1FTzYxNTJlMUVFR2xicE9G?=
 =?utf-8?B?Q3VROVBLMEhzZVFReEhDSHUyYWNPRjZITHBHcVBPQ3dkMnh4VnpDTlhkM2hu?=
 =?utf-8?B?RDlGcHNvNDExZitOZmdibkJoeGZvM1FubGxVZjExUGFXWTFXYmJSNno2dEF2?=
 =?utf-8?B?YUdkamFnRTl3TFBJbDBhRzdmbHhQcnBwS0ZpVm10MUl6OGc2UWQrUkhQSnRQ?=
 =?utf-8?B?RHd6WVF3eURjTnM0YjRneDg0YWFQWVNmUWNkWDZtR3BvRytodUswL2UwUUE5?=
 =?utf-8?B?M0ZwVG1TZGxONUVFWFBtNTkwYnBVcFVuQzBNRDRuUTBEdFpZcHVybElQcG1R?=
 =?utf-8?B?YlVPNSt5VjRPWVlycGloWFFjWThzYmNRT0tVMWlWVzNXM240V0tGVU9FNjlY?=
 =?utf-8?B?RERYSnNpYlJlSjZiUGptbTJPbTdVUlloWHZEQUJQRGUycVVlRXZ6TkVyMVdi?=
 =?utf-8?B?a0RsYS8wNVAvYm1jazR3ZVhDSVRtMUVTVW1rZkZaSkR5RXVwdHpwQWlnejNK?=
 =?utf-8?B?WWNkZ016Zzc5b0FnV09sbFhGWlRMUUNpRlVuNGJITjJ1d0IycThaS2x2Zldx?=
 =?utf-8?B?K1JnRU5rODVPanpvMnRqNjF1MUpVT1Z4eFkxOGFpa1NuYXNONndvbVcxODVX?=
 =?utf-8?B?c2tqa3hrUWhlSU9tcUMxdStRdFRJYVdqTTFZNUtSTE1FSE1qUFNZVzBWVU40?=
 =?utf-8?B?ZTNVRHh5MXo1b3doRmJnRW5odi96WjJqb1hvUTdJTXBSZFJyS2pydE9MZnFz?=
 =?utf-8?B?NFA1US91Z3p0Ym1Mbk1GT2xOUS9DMC9jMlRUNGo3N2lsNjYzejQvcEhBbUJx?=
 =?utf-8?B?SHlDaW82NnJiK3hvb0hjOWlHbkdwQW9KVnYvMHZOd3p3d05ZbXlZNXZYa0Y4?=
 =?utf-8?B?ejhTbkw5Y0hlaVVRYVNjcnI1T2psS2V1SnE2d3lJRlA5c0x1bFFlenlHYkdV?=
 =?utf-8?B?NUdOd04zUkhBYUNQdWVweEE5LzlEcUE0N2twa09kSWxIODhVWFJ2YTZKSUdk?=
 =?utf-8?B?cEJ5WnB0Q3dWVUgwOEJQYTMvT1lzeHVKYVhxUzZiRzZBM0pzMnJwSCtkZW5J?=
 =?utf-8?B?dXF0MGFQNldMa3RNUVVTVlB2cnB3bmN0VS9zSUdzZDZLVU1YVUcvcjQ4MnBB?=
 =?utf-8?B?d2hSY3BXcDR4d0QzTUxmcUtXMkxJRkdEN3h2RGdkeXkwWSt1N2xNWlM5VUlj?=
 =?utf-8?B?V2M4amJzeTJSZUJzSXB0NjZKeVJyOG1XZ1BFbmZPSDlvdTRTM1ZINnloWGRK?=
 =?utf-8?B?RHA1M3ZEVENWMWllcDdQeStKYnRCam9lZmE5S0Z1U25oTGNsRTcwU1VScWh0?=
 =?utf-8?B?WmJCWENSR2cxc1Q3a2UwZXdvV01PU2pkd0o1MnJ6SEp6WEVHY2N5K3NOV25n?=
 =?utf-8?B?enVzNWd0NnQxT3MzSThQdFhpUDkyRHloc3lGVzhnMmNFZDFGM0pBM3BSWG9k?=
 =?utf-8?B?VU9YQWhyNU1rWXdUS1NmVjh1ZWNBV1pYOGRjUzBxM2l6Y1BEb1ZXRk1uY2tV?=
 =?utf-8?B?NzZkdWZJVXZKemd1ZExDa0h2eG9Vc3JlM1V3Nk5Ba0lvc0dNRUFmRTZvalBs?=
 =?utf-8?B?VFN5bVJFSlZzckFldDhpMWxZeDJMVnZ5ZWtxUmdJMkJzT0RjK083ZE42aERC?=
 =?utf-8?Q?V6U3KrAxxbE=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8604.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(366016)(7416014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?L0JOb3I5b3dJNk5kYlB3RjVQWCtVR0dodzBwRk1BUnZEOEtudVE3NlM1aXhv?=
 =?utf-8?B?OXlWaDUrelQzNkFMdHBsbzU4QXA5RmltOFJBc3VSYi95cWxVaGlNRldxQVNT?=
 =?utf-8?B?NzV3MU1obndjalJRTFdnSUp3bm5DeVlmQm1JdnRuU2dhMWI2dWJva2dVUzVk?=
 =?utf-8?B?Z09DZTk0ZGxIS0RyYWFtay9YUVk1bUdxeUJVNU5mb2lKSTJtbW1BQ0MxTm1U?=
 =?utf-8?B?KzQyQTEyZGZnOXY0UC90MVljUXBYOHpQU0cyZ1dBK0JkT09TNmg5c3BmYisy?=
 =?utf-8?B?d3crZUpTTGRCM0xVVkZ4ZDhRT3VYWTQ3OC9nY2MyOG9ORENITHFoT3BBOEt2?=
 =?utf-8?B?ME1WU0Zqd2FyRzFlNll1cGNmUUZEWDBKcmJoWGloam5yeU9YUXVZd0V3Rkh2?=
 =?utf-8?B?UCtTdHVJQ0dkYmlHczNWOGkyNFRhQ3pNMmJsT2VmTjJpMzBZZUt3YTRPdjg1?=
 =?utf-8?B?Uk5KMW9QNGpJRURzbk5SUDFHSHdta1NJR0xGbWlUV21LVyt2c1ViOFpJY3FS?=
 =?utf-8?B?dG84OWM4a29NUTM3bG05ZkdyaUg5RVRCOWQrWGdEZzNTQkhUODZ6L0ZuWURK?=
 =?utf-8?B?Vk9pbmJFbVozdkZrSE0xU2l3eWJkRW95WmlUek1GUkVWUFZaYVZtcHEyejl1?=
 =?utf-8?B?ZWZSS0VHQjBuOGFOZ0FOOHdKSGRYWFpyM1J0dVBnNmJXNXU5aFBZTE9XcFdM?=
 =?utf-8?B?MU9KZDZRcHhZKytRcVV3U3ZPQVlnTGJtd2RENXgweXdnT2RhSEZHMTYraEdI?=
 =?utf-8?B?cjRTZi8xWVdEWXArTlFvbkdVQzVJYXlMWDAwNjdWNVNaL1paaTNFME02MXZi?=
 =?utf-8?B?d1BZZXV5Vmt3NDVSQjFYVXJ1cUpxSDYzL1lMLzdLbHdpbEg5YW1XaHBaTjY3?=
 =?utf-8?B?RlhFQnA4TkJOUmhyUFZEMHZ1UHdCeGpZVVZKbnpVVGtLTXNtejFxVHRXbXI4?=
 =?utf-8?B?c1dTb29BRkh6bDNXZk9hdU5WNS91YzU2TTl1SjQya3lRS2dlRlBNNHVwVDVz?=
 =?utf-8?B?ZXBwdVM5V2R0MHZwM1Z3emUwMFFhd3lxWHJuWCtFRzBrM3o0cFhvalF0bUtZ?=
 =?utf-8?B?eG52bDhDOGgvNWhLOFR0Z2d2S3pQZjdaZEtkOWliekVBRDM0dkovbVhSNGhJ?=
 =?utf-8?B?Y1RPSzN1L1AxS1NUd0xqb0kxV3hJY2NWaS9yVitrVEF6T1lMTTNneUl2T1pB?=
 =?utf-8?B?d2wzODFhU21VQzZVN1ZWZllpS2c3ZVM5Y2xlbU50SVZ0VHMxY1p2NjhaSVIy?=
 =?utf-8?B?R3lDSXE5VmdrMmtUQzZDajJZZGd2RWI0MlF2d0pqcUd1M2FBRXpFaEtYcGpq?=
 =?utf-8?B?N1FJOCt5bDZ2dmdYajBMN1NjN0p2TnhEalRuZ0Y5Nk12Z3dURmNEWmszT3Nx?=
 =?utf-8?B?QzlwS0lSY3gxaUh2RWNjYlRRMzdRQ3ZFU3RFSlZvVnN6SVpLOUJ5RXpzYmNX?=
 =?utf-8?B?bjFvYWhMK2xwdmJhVzBRVjdnbEVlYmxzazZ3by8wZ1NsMTJ4OUVuaWZKL0JS?=
 =?utf-8?B?dzk5UTdtdythbHVlbnI1bjNpNVVpVW5iWXRmOUpRbUpMcEh2R3FhSlM5ZjhI?=
 =?utf-8?B?YXcwb2M1U0k2Z241OVNFTDE2bFp3c3NYbFpmLy9iQ0RFc0UreFYxSzFUeUI5?=
 =?utf-8?B?RFVRWDFSdTQydFZwL2s0TVRTMzJxSE1FRko3VGd2YkxYRTN4VHJZSkRkWEta?=
 =?utf-8?B?bG1mWG1STHJ6MDFncmlqUkU5Ylh6aVFYUkExZ3hidEUwQzRoWVR0eUtIdHdG?=
 =?utf-8?B?eVBxdkdaT2kzbHIrZFZINmpJY1poSGorVzNreGd0dytDVzdnMm93MXZNRlRz?=
 =?utf-8?B?S2xLeWtCUXJRZzZJbWhlNTFuWGRZSXpML3hjcTlZa0tsWjM4dDRXUzVML0E5?=
 =?utf-8?B?Y0U0djR1eVFFNUJHbWJHblFtRWREYlZBd2h2djk0Mnpib0l2eFpPMjR4eUtz?=
 =?utf-8?B?dDcvUHZhNGk0QkJjcVR0a3BRVnAwZUprTlVCOEZ4ZVNKUHlHNlQyM0kzRHp6?=
 =?utf-8?B?aWhRS1g0QmpwU3RQOEJXVFIzOFhqRldqN2NMOFoxSmMxaWNJcWhmR0JJUElj?=
 =?utf-8?B?bXh3eHBmL29ydk1ybFEvZSt6bFBYWmJ6eTdVOW1zWmEzdWJVQzFINHlJMU5Y?=
 =?utf-8?Q?nzj0qkdEGXKh86bYiTGeAwe3I?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 314d8809-8d9a-4448-bb1a-08dd75c2fbb8
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8604.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2025 10:57:26.4831
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0LPSMozEC12XTUvAs5swsVOin6hHkTPHjT+bmbhOMf4yXMRLUeM6PkZNL70Qvv0RLQL1n6+Zo5lAjssxB4nqSg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8493

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
Changes from v13 to v14:
- No changed.

Changes from v12 to v13:
- compatible string is modified from "fsl,imx8ulp-se" to "fsl,imx8ulp-se-ele-hsm".
- compatible string is modified from "fsl,imx93-se" to "fsl,imx93-se-ele-hsm".
- compatible string is modified from "fsl,imx95-se" to "fsl,imx95-se-ele-hsm".
- Mis-understood the +1 from Conor. Hence dropped the Reviewed-by tag.
- Collected Rob's R-b tag on v7 (https://lore.kernel.org/all/172589152997.4184616.5889493628960272898.robh@kernel.org/)
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

