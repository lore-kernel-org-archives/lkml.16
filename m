Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2055.outbound.protection.outlook.com [40.107.20.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E86B9253957;
	Fri, 25 Apr 2025 13:38:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745588324; cv=fail; b=SnmS8DvzMCdrfwUZEP4celqvFnPI9WolyjiUdoAJ/CecKdBBS+ydiqzPaHDUDKg7Lb5P/JsdoDqYxLh/SE2B61t8maRESsJvDvkQmn6aril9KusI6Sft4QEyv5hrxsjunUtJ8Z08YNTGclur8PRyQ2q+xqDOVrFnwJIr+cWiRM4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745588324; c=relaxed/simple;
	bh=DRkDZg1VfpzhFBuixQT+JSk3xiHDgMICrZU2Rgis64E=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=pbR+QNdu/K5NIvp1ytIfjPI11PlwC3+cKAv75LLcU9Fbxgm739gyAcZmjaAulhvm9D2w4UWCz9ih67tmUz1kvoGvxCbk3GPGOhuhK+PGfghCvgJZgCbhroWCrfBsr/tL1NqVfDCb7ck4G0vGBcYmy6D/bmyfs0i1pXkZ2uADqL0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=QI4s68eD; arc=fail smtp.client-ip=40.107.20.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="QI4s68eD"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PgurwuUF1u9YIXPTuf433rZBNjk87CQwUyJrn99+6KBotKVnojT0ChhlsNErqvwXwxk+O+F4j9uv2FGt0VDGN/rtmdongUEl6dKChKy/YnQVlbX8l8wXAdUFmKcEXDvE1DUh9vyIOCRMG9tRA6NflAi6I1jkzud2VI6bWxZjZ7hvpraeuzEk8sW4nI2a64q2kOng1J4C14d2SAE2fZeOakbezq0Pm8cQetTtkUlB1PoPzz2sGmhTOAy4tdFRXqzmwIgjY7uDux4CGCBpgFmUUv+Da2mZpxnhB9s33SOBefnPqMM40/TnZA8tc3qfxwecSqH/Ea8SJInJ41zw73OODw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YJ9glBG/Fa0FANTVAW4gygMrCec6MV9a5TSsfhDsytc=;
 b=FpzJhDD/DFtk34FuhWsjR84B1N3g35nNjKDNtezEJk7Jn0crnMFiS2fQ5dyltNPfIVxJoi/Lm+aAB9nfx8HxeGfjgp1sqpJ+jyHiMcxJ31NVHYEAW7yFhFfefCm+I05sr1UjyLqEsSsF2XMRhzVRkJdt/oIanew4Jy2vWJjufoJIgn+6c1XUgDBz348xLGvPUsmail+Xy7sA/sifu699SRCW+6N/l+15i+NUG+oYlwpZny40I3ULmEhmONiL2fFyu9FEgexrQUKEZHvD+lYLTK8QV7iZAX7aufEjfkM1wrR3C7iF6mDAfO3OY+nHGakpIiHK7HTRJUEU4nUlZT3lLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YJ9glBG/Fa0FANTVAW4gygMrCec6MV9a5TSsfhDsytc=;
 b=QI4s68eDyidSpX751MhuJeVNNoBP6AF7nZq2NmlDflNIM7HvC9DVNDnzfDkhLjEiXvW9mKOhasIeT+9nD/wKOE/rVLE29yXS1UqNBG23l4/T5TvmiC4EGfZwnMp3Z83UNU2svfiesKWB9O2D+C6vf8TqMfp13+9hYS418rckwxcn9/yB5od038H+NT/r8O3Q9aUrEMWKt6dX6SxmRTED4xHb63guujcEqMFBvIqnbuhWkLrVaQ6QRRGli0/p3fbBwPHVrubuA79L20rSpe+vPG3+S8XSBT0sqpCsYVDg681PlDIu+VSQ/UR2RjDauK4k+rWWzj/DjSP3R0HkQMJwLQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM9PR04MB8604.eurprd04.prod.outlook.com (2603:10a6:20b:43b::21)
 by GV1PR04MB10454.eurprd04.prod.outlook.com (2603:10a6:150:1cd::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.27; Fri, 25 Apr
 2025 13:38:40 +0000
Received: from AM9PR04MB8604.eurprd04.prod.outlook.com
 ([fe80::e751:223e:aa3d:5827]) by AM9PR04MB8604.eurprd04.prod.outlook.com
 ([fe80::e751:223e:aa3d:5827%7]) with mapi id 15.20.8678.025; Fri, 25 Apr 2025
 13:38:40 +0000
From: Pankaj Gupta <pankaj.gupta@nxp.com>
Date: Sat, 26 Apr 2025 00:31:33 +0530
Subject: [PATCH v17 2/7] dt-bindings: arm: fsl: add imx-se-fw binding doc
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250426-imx-se-if-v17-2-0c85155a50d1@nxp.com>
References: <20250426-imx-se-if-v17-0-0c85155a50d1@nxp.com>
In-Reply-To: <20250426-imx-se-if-v17-0-0c85155a50d1@nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745607704; l=3712;
 i=pankaj.gupta@nxp.com; s=20240523; h=from:subject:message-id;
 bh=DRkDZg1VfpzhFBuixQT+JSk3xiHDgMICrZU2Rgis64E=;
 b=+vFhUzC6apyEio1dDUS3OI2qqOcQodoY5G0gsGxteB0pLSZjL68NuEYPxaf9cGDMZ8Q3cI/xD
 U41acCz+0ssDW55LoTQZmjNaooda+0aZDkAuUdV0UsLuiI2Bhjy5eQ6
X-Developer-Key: i=pankaj.gupta@nxp.com; a=ed25519;
 pk=OA0pBQoupy5lV0XfKzD8B0OOBVB6tpAoIf+0x1bYGRg=
X-ClientProxiedBy: SGXP274CA0011.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b8::23)
 To AM9PR04MB8604.eurprd04.prod.outlook.com (2603:10a6:20b:43b::21)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8604:EE_|GV1PR04MB10454:EE_
X-MS-Office365-Filtering-Correlation-Id: 8b4f45e5-8cd2-4467-ad48-08dd83fe7d2b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dkprR2gvczgrSklQK1B5WVdEUnRxa1JDZ2pwYWxNOGZVTTE5TFpIRmVHMGNn?=
 =?utf-8?B?cElpMjd6bGd4cjZVeWRaNm5xM1JRM0hSQUd1RGNUc1J4NUFZRStXSWRpaW1l?=
 =?utf-8?B?SUtJUkFhcHlQQllCSktqWG92OEs4bkgweGVxMmlFWHROL3lDQXlqbEp5U2JP?=
 =?utf-8?B?QzZRYTFqdmZwQlBDMEt4YmxyMmhDSWp3M1A3SDMzU1BCVU5ncVIvSjZudXFy?=
 =?utf-8?B?WXdvN3ZnNlcvWFVoQytTTzNMU0NKRTgwWEd5VHEwTjd5cXJoMEN3TTFscmNE?=
 =?utf-8?B?bjNhM25nRmpmQUR2VjJCUU9ncGMyWEVwMXEwM2YvRWprVXR3Z2g4aDFpOUFL?=
 =?utf-8?B?T2o3V254S2FBZS9hd1E2dGpUOFlxaFEwdUtrcVJ2SWlJMXhlQW1XZmlFOFc3?=
 =?utf-8?B?dVl1ZjY2QUxkVmJ3TGJ3bHk1RlVhUk5YNFFxeU5OV1hyR2k5M28wd243WlhM?=
 =?utf-8?B?c0MwVlpaRERjbFpZWnVqYjk2dk1acjVnSTRiRXV3RGNCMHlDWmE4UjJuYmdT?=
 =?utf-8?B?c200Z1EyUUdNOEh4UlVHWTc3RllnNHNOR29XR2V2UEVYa09EeEIzZVFOT0cv?=
 =?utf-8?B?RUgrNGxUdGFZSzBZTUVveXA4SHh6TDVpM0RYQ1NVMGlSNUZPM0Y3d3N0OWFR?=
 =?utf-8?B?UFk2b1hvYmZ0T3JsWUVRQ0tNbXdTRkEvWFpLOXNzb2NSY0lPQnFHRmVTRTN6?=
 =?utf-8?B?ZHJNL1UzQlByckh2R0JjQ3pCeEhnY3V6cGtyeEhqNTBBbVNTL2w3dUZZWGVX?=
 =?utf-8?B?Qlk3cnFscGVHM2NrMW1vTmhTK1VDa1JBTzRpb0xGcy8wUUVxZUlOdkwwOEc4?=
 =?utf-8?B?N1MzTmNaNVJ3N3dqdGJwbE15OFM0bXdUKzZqUE5RZDF3SFYxQ1NKSkhSQXVM?=
 =?utf-8?B?RGg4SUlsV1NiQmQvdk9QeXp0Q294NnUydkJtVVFHeTU2THdybm1uS3ZvRW9N?=
 =?utf-8?B?WjNwNTdmYkJqNmE0NzhOckN4UVd4MjlucDlLVGswalZrNzVpV2RESEJPRjU4?=
 =?utf-8?B?anFpMzkxRVlKOTBMK0JTRzVFSTBHZWZlWmNDUEdVbmNZT1NJWGF6WWxHNjMw?=
 =?utf-8?B?YWdRSmplV2hUQzMwaDBrNksvSTNuLzZ2MGErZW5lMm5mUWFVNU1uQ3R1cU1J?=
 =?utf-8?B?YVBpZldKRVM0K3NXYS9XN3hOT0o5R0VuSy9wZGxBYWpWR1FaWnhPclVLVFg4?=
 =?utf-8?B?b0ZidHVEc2lHNWtSdHZyVVQyWGg0azJETHZ3bGZqUmF1SmlYSlYzUGY2WDd6?=
 =?utf-8?B?bit6cTkxSVNmcTIxYklIU1NacE00djM2QXdaYUk1QnF6dVBBdk52YzFuL05O?=
 =?utf-8?B?V3FXUTE5Tkg5TTQrbzVVTVp5aFk3Mjl6MVpsOU54ODFaRDJPZGkwS2FicGhH?=
 =?utf-8?B?V0tBbkNjcHl0STVwR1V3QW1CUlBnbnR1azVRcWdlUXhzd2JQWHMzNmF0Mmp5?=
 =?utf-8?B?ODBuZEdnSU4yL3Roa1RKRVg4bWNVd0UrM0ZCZmFXQkJ1d1BEcWM4M1JCUnRp?=
 =?utf-8?B?UUcvYmFyWU54WDdBeUM4VFZUWm1NdnlSMWZEaGZOUElKWlRFUWdqV0U3YzFh?=
 =?utf-8?B?V1JaMEYxaC9peS8xNEZOdkJSMHd2bXkrK29id0xTQmRmbDFHVTBnN3lrbC82?=
 =?utf-8?B?d3R1RE01VUlwbkIwTisybWo4a3ZoVmx3c0tCbTdCRUpqd0srWCtleEJMZjhr?=
 =?utf-8?B?SzJQUWlKRWVRWHRjdEZpVGxEYlpEYlg1TFMrR2dzajdGWDVuSndOTENqVDBi?=
 =?utf-8?B?aU9kK2Q1WlBNRnUzUGRmbk5JbnJrODErUmFuZ3BBZWRHcUkrUFlhczkwM1c0?=
 =?utf-8?B?M2pRRUxGYlBrSXFpQitWM0FIcm8rbldSc2R5dGJKTC9FaVVFOGJmOXdXeHdN?=
 =?utf-8?B?OFQrVEZod00vdWhWYlFocG1rSGIxWk5nUE1hSGRyUHp4TXdzV3VTWElKUU94?=
 =?utf-8?Q?CBJAY7FpsRU=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8604.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QjlDUCtnTExMNzhmYnMwcm9TZUxuNklQSTVnOVdWZmtWUGpxQjhEcjkvVE1K?=
 =?utf-8?B?NFp1ZU4rNytWM201MDNJRW45eUtXUU9QeGdmOUZLS08rRDZnMU5kLzFOdHBR?=
 =?utf-8?B?YjNvbDVtT0VmOGRHQ0xDdjVvKysxMVB3MUhTZVVNTDZ1M0czdUdSQ0dCeTdy?=
 =?utf-8?B?dkZTcWQrckNpWjRZWDMvNDVpNEhVZC9jRFNQK2xweE1xNkNOUi84UExmN1Ni?=
 =?utf-8?B?R0JEOFUrdTc2cTNrTnUvZlowU3lleSsvLzFBa0JsaXlpcWN5TzJON0F0enZT?=
 =?utf-8?B?cVo2UnhTOGdZR3NSY1pteHhTRzBaaXZLQ2ZUazVxekFEV0tYS1crWXZhQTVh?=
 =?utf-8?B?eElNWi9pcG9sRmMydko4K3Z1b0Fvb2daS1EyckpTeGp3bEk0cVRGSG5pVUNs?=
 =?utf-8?B?ZGk3WkpPNTdOMnN6NEh4dzJzbjIxU21udHQxOThDQ01YWlV4SWwwdnpjSkds?=
 =?utf-8?B?bXhITDdTUlUySkJzbi9ZOGVNMnRhd0pjWTB5UDN6dE5oSnpVdzBwNkY5Njgr?=
 =?utf-8?B?cGlIS0UrUzdFbjkwMjAyQ2I4SXdKb2t3dGMrOHNuRlcrcER3R0hpMWFpV3Y0?=
 =?utf-8?B?eXlZdUNCNDcxSnBlOHpxUG1qMXdWNW5ia3lZSW0rTkZSMDBhaFFxQzVSQWtw?=
 =?utf-8?B?RTkzcVJkSGF1YVdEWDkyQk1lVlExUG9kejM3VGxPUFVFaWtzYTlCamVXQ3o1?=
 =?utf-8?B?Q1ZrUEtOY0g1SjgwSEY2UGI5cGR2NkVxalFUOTZkL21ZV0VsQXhzZ3FxT294?=
 =?utf-8?B?QTV2SXRwQlJiM09Gd1hCbFVjbFo1V0FkaGthZ0J5QzJHeTJZTXg4ZVY5MXdG?=
 =?utf-8?B?V3NDZ29KWGNZaDJSc2RoeDM2dFloWCtUalBwaW9ZSURZQzhhKzE3Zm5jelpa?=
 =?utf-8?B?SEJnSkp4RUw4dmxmbkRHU043cWpuYnZpSWtpVnZTNGs3R25SQU5RcjA5ZVlJ?=
 =?utf-8?B?dTVVWE55elNkcEcyeGdxUHVlUTRSVE5CeU1RVEU3Sk16SnBFNEVVWjlHdUdT?=
 =?utf-8?B?S3NhN2VDcGFOOFVML0p5R2xqS0t1Z2VqTmNWWVI0SmtFQXJObXptRHBUOCtO?=
 =?utf-8?B?L2ZHNnRackRwUEMwLzBHdm5rWit5anlrMUVyTHNaRWNqeUV0bFJzNmNGQWpn?=
 =?utf-8?B?clFXZUNDZ2d2UXhjYkVtbmhUVXdFbnhGZC9IVmFOUzE5UTlkNHB5Ump5cEE0?=
 =?utf-8?B?NFlVTWhieWNkY0RmMzNBRGpQRWVXWE1oWmZHMVQ1aCtOelJ1VXk1SGZNZHVh?=
 =?utf-8?B?U2FUZitQWlBwdXNXdHJ0Z0x3TER3MUMzNGl2MncxR1Z2eW91SStjbHkwZGt2?=
 =?utf-8?B?SlJuanJrU011ckVHT2ptV2JSQWxoSHlSeWFlMmp6VUZ2ZzEyeWdSWjZDU25G?=
 =?utf-8?B?NldtUVdKaEN5cCt0dkEwOWVVaVppN3FITFk3QXcwRFpuQmFvWHBNNElrQktn?=
 =?utf-8?B?M3VQWHo0cGwvdzlhWjE2Mk1IS3p0K3hsUkZLcmFNb2NzQkVIaHdLeXVIYjBS?=
 =?utf-8?B?ZHcyTklzeDVtOWFqcHd2SnkvK1RIeVRCV0pPTGxxaHpZMTNHYXZOaXc5MWFB?=
 =?utf-8?B?VmEwd3h5ZzFuaytqRzZieDlpM3BQT05OS1NLeWFaWVJsUHhJaDBraUFBV1lq?=
 =?utf-8?B?UlpTRHh6UUhxVzBwcGdiaG9ZZHNFakYxRVo3THdWbHlGL0xWTnd6U1JhSGJ1?=
 =?utf-8?B?TzBBcUR6QjA2dVoycUl6QjZNVjdGWHRRT3VrajVlSy9LYk0ra0VOa3ViUU9a?=
 =?utf-8?B?bXUweS9KNG4yZnFLbVpzNllWWCtaWG5zWDBhOXlvWFpzYzRKOGFSc0xEUG15?=
 =?utf-8?B?SjFUcVEwZlBMNEtkNFhsQ0h2bWw0dmhiYXVxVWFIdWlvczlMSFJqeU5WVFBa?=
 =?utf-8?B?amFVN3EwS2J6Y3JCMG1SWG9odm5GdWxWbE1wTmNkd2RKWlphYzlMT3Rucmhv?=
 =?utf-8?B?RW1WeFZZNTZBU3grNnlNdUFyQTQwUENQS2dyN3htQmZ2Tk9sRWlkNWxHSlNI?=
 =?utf-8?B?L2oyMDAyRUl3WHI3bmhkRTZqNmV4ekVCaXZpRXNHV0I5NUlnMldtYzN5RVpO?=
 =?utf-8?B?R21UUW5GWkpISG5hei91NmpEUWRwU0RHcHVwMUViTEVqVnZwOTlxalFvcHBY?=
 =?utf-8?Q?vvJ6nvVLGVzp987sk+nNwo413?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b4f45e5-8cd2-4467-ad48-08dd83fe7d2b
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8604.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Apr 2025 13:38:40.2573
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: W1JZxTJNoN1J9LA2LB5cwT2pjNuVi1wL6tCHLruF/H4B/90FidsFnGe/8dZMmNdqS/08jnJjEc7jfmofavKd3A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10454

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

