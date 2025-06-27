Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011052.outbound.protection.outlook.com [52.101.70.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 037622A8D0;
	Fri, 27 Jun 2025 06:05:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751004342; cv=fail; b=CuHG9cePy1j+NEkDOKkR9MkYcXLulZ3/jwunQOVl6LjWamuzt4vaEtF/TivVzy2SpAnVaV5ABwY65Hycc3d4Aj6foLA46C/7Pm76IKove80wS9fbVcvYOEp8VxGtk22kZADd3EIfDQgRWs/ICxua6YQ94fXd6k9FRRlTLwj2cK4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751004342; c=relaxed/simple;
	bh=srPnsH9ozEqweQdHZL0gRG3vGlT9ak6+Uv7ZrYORZR4=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=ZKBXfV0vgupNGQTKoyaxT6Qx92cAX27VXWRdI5QWEBimtDniZRorOcbVHQOPK1p/gbgB+CllmkfLDaWuKyKUNESiEO1AE6Z3gDYiIPtayF8O1LOLEX51iMlPz42yUEz1sRusZV7G+bcXG52l8nqPuFbcMcnIF4jt5OlONXUE3xo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=knle2GFF; arc=fail smtp.client-ip=52.101.70.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="knle2GFF"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VhEgsP798qrSfhtHlYC/Lve1+j1B9Ci7rnNr5TArUIPNcg+2aCBj2rBtVw/gJwX8f9nkhwsvpXtodRy/ST5xEIlzxIXMtHKAz38sKpc+wwFfUsIjdWflb99jw1gWVJ5hmtuFh6aNdwCKFhSl4vU0Jhqn1DodQ7aDbk/PLN4UFZmuK+jnI0kXygB+8f8JCSKfa2mPSWfUYRN+atRl2+7d3B3p1uSgUPn3HzIODpEzmaoya7vKm3DPbByAqAezENb6YgSWyA1+KcBz72bMurNp0tLESaix7k7iAynXYmVdEDWVH8iiCEtACWnPP3WDOEbcGNz0i/bSJPqwCIGZhEsUyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KxL5tyzqksq7IwmKlMQnnm1idlgUCgk2KiFSR+0GjrE=;
 b=Gd5LVyS4DfdBGLUFj1bN2pVC7ZHAtTazk6/NBVS+XQaAj0aoDFR8rUJ/CMlcXXpdtV76no8tEUMZtXIrZPpvkWZa/+HE2iqpdiMCpynMgzpwvu2KntY1idM9H5re+pKa1o4WneokIjl14cIhrl4ScGxBxJ9tzRRtu8OsX9ZlG9p3GEjYPraoPLPvUubPkoj8jJpHH/1hDPO0JO6IK6dPsb3x4VsZ7WFmpXKFVZaVEL/6AHMJ0hFhpjU41/RYYXe9XpQLOcSWBI7RDpLqUlFBLtr4K2NB/KIy6MKt2IQkUGtC45HjWOTeGUZ/mk+duaz9BY/on4j2fzQznMDE0jqZcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KxL5tyzqksq7IwmKlMQnnm1idlgUCgk2KiFSR+0GjrE=;
 b=knle2GFFysyWIhNsaxjvMTgaQEeOwYLhcPswd3jA7mBc2+tdLkYIMt5P9atOLgSb+WTqR8sAVqXs0VbYQA5+R0Yts7lzk6bVSxF1rGbE6UDK9RlCbQ2kXv99rv8b8qm9yXoIqB7FybdTgmqrZOHk0T/jNlHSGb+UfNqFe7zTkvcVrIMkG0BpMo2Zxyqg7xzu8Ws6o+5g+7fnkTRLYu0AlL/JHCxoHDiKvq0i708Pgo+GXOT2ecd3EQ36k2YF0BVzBNdlzzTTd7O0vp/iEwcwRKH2RoNvKOc8EyxABdhqs95IWdoYsfWkOm8MjNps6Wiqdgd0evJ3lVrBwkR58P8Ylg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by AM9PR04MB8906.eurprd04.prod.outlook.com (2603:10a6:20b:409::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.16; Fri, 27 Jun
 2025 06:05:37 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%6]) with mapi id 15.20.8880.021; Fri, 27 Jun 2025
 06:05:37 +0000
From: Peng Fan <peng.fan@nxp.com>
Subject: [PATCH 0/7] firmware: arm_scmi: imx: Dump syslog and system_info
Date: Fri, 27 Jun 2025 14:03:43 +0800
Message-Id: <20250627-sm-misc-api-v1-v1-0-2b99481fe825@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAD80XmgC/x2MQQqAIBAAvyJ7bkENLfpKdBDbag+VuCCB9Pekw
 xzmMFNBKDMJTKpCpsLC99XEdAriEa6dkNfmYLV12tsB5cSTJWJIjMXg6KLudfRDA1qUMm38/MN
 5ed8PdqmJhGAAAAA=
X-Change-ID: 20250627-sm-misc-api-v1-85c030c670c6
To: Sudeep Holla <sudeep.holla@arm.com>, 
 Cristian Marussi <cristian.marussi@arm.com>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: arm-scmi@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751004238; l=1895;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=srPnsH9ozEqweQdHZL0gRG3vGlT9ak6+Uv7ZrYORZR4=;
 b=qYn+iaDJxIFEirbLxllNkhb+pA+5sbbsCip0h7lwbCuVB7PJO2mq+11iG3XYsdjwxLewEu3iT
 nGlgChY67GWBaW9VyA+Da56miSpNBST9LF5tJQ90xL0ZTERvKXN4a07
X-Developer-Key: i=peng.fan@nxp.com; a=ed25519;
 pk=I4sJg7atIT1g63H7bb5lDRGR2gJW14RKDD0wFL8TT1g=
X-ClientProxiedBy: MAXPR01CA0109.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:5d::27) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|AM9PR04MB8906:EE_
X-MS-Office365-Filtering-Correlation-Id: 36733d04-f6ff-4528-558b-08ddb540a2f2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|366016|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NFk1OFFrc0RQWklWcGZPS2t6cS9mWGlUdUduVXNyMDBuNkpOWXVzUm9WU3N0?=
 =?utf-8?B?WjJyeGliaG14endoQmRzNVB2L2MyQXhmb2RUWEl1VW1WTzN6aGJiaFQzajV4?=
 =?utf-8?B?ZTE4MU4zUjEwdGJ3NzZxdUtaOW5Na2xNU2Z5eUJ5cW9MQmhlaE1EaThCakZT?=
 =?utf-8?B?NG9ZWVhDOUhzTlFxVDN6ZUEyN2ZzYmk5VndQTkJhM2hmUTlyRTFHYjJGYXR6?=
 =?utf-8?B?ZGVDMnczaXFqMDhVZiszd3lYUytFNXZhZFd0YkFtODRZNVR3SU94VE96Nlc3?=
 =?utf-8?B?Zms2VHl6eitqRGtTOEg5MmF0enA0ZWpZSTR4SDY5eWw4Q2ozelpXU092U2Vk?=
 =?utf-8?B?cUVzY29EQU10SG1nTmlXVGQrSXpjNHhjSjRYWU85bWxuNEYyS0haRHJCMXhI?=
 =?utf-8?B?a2RRenRzN1I4YndaanJNdE5GenBpVzV0azNXMy9DbFVha3RxMWxNZHlzTzNY?=
 =?utf-8?B?VzFna1RCbEcxc2xZQklHYWJJQjM4WmNiRm8zR09wRWlnY1RFUVdlZHlwM0l4?=
 =?utf-8?B?aUlvcXBLQ201dDVkUTA5QklBYUpmdUF2dkM3eEdHaGFIRVJKNFp1RDRwenFt?=
 =?utf-8?B?YVQySVo2WE5FZm95c0ttM25PMWtRZHNYa0FTWE5HQ1M3VmtHRG5BRFRjc0tO?=
 =?utf-8?B?aEZYL09CYVp4d3JBZ25EdHNHU1JiMDZxSEFlVWM2aDBNTTZlRDhkQ3I0blpW?=
 =?utf-8?B?S080UFlseHRyTXJDWWw3WEdaT1lrVkFJR1JyZWR0aG1LZTFDNjRmNDdqTEFK?=
 =?utf-8?B?UE5icVVvcVhSc0I2Z3BRRUl4UVkvSFROVWxpZmlHY3ZVTHZ0ZHdtL3FIZ1hF?=
 =?utf-8?B?OXBMV28ybDd6NnRDS2J2Nzg3dEFOOXdPbElyWTRWcG9xb3JsL3VvMFdMRHN6?=
 =?utf-8?B?czFYQVplTFhPMnFmVkZFUnhDWjZuZDJhb0FEMGF1bHh1TVA1S2NWL2EyUDVz?=
 =?utf-8?B?YXd1U1p1WVc1cUdKRVhTUmxDaFJPMU10eklPeTV0U0E4UEZNUTNKS0RWSkt0?=
 =?utf-8?B?TzByV2NBYkI4YWZydG9kS0cxSVZpNmVtMEpVbE41eUVoTEJ6VVdHa1piUkRS?=
 =?utf-8?B?djRUNFhlSzF2NEF0WHFvNkxKZjBQeFBJZ3N0NnpqcnkvOHMwcDdFeEpJRDU5?=
 =?utf-8?B?ajRiQWR3cGR4TmxaV2ZmejNiT3ZHS1p3SFB1aTM4VUQ0RnlsbWFGVEZDL0hv?=
 =?utf-8?B?cnBGdnFLNDRSTysxSnBsSm1yY3Rzd1ZjSHA0QlVMT2FuWlpqd3ZUTFA2MVVj?=
 =?utf-8?B?NDFFaWlBUFlDajJVbVBKYklHSmVvZkx1YXBsK2MrM3VpdExVVFVDVUhkWDFo?=
 =?utf-8?B?UG9ycUszOHBmWldDRERZUmlSTXlYTnN5TEVPRDFmWDBMUE1IcTIrZ1F6Rkli?=
 =?utf-8?B?MWhST05rNmZON05hKzh6b0VuMjgyS1N5RDRWaWdwM0dEaXRPdjBzalZIeXlY?=
 =?utf-8?B?NlNheU5LYTF6N3VQWitWY05XdWdkRkRUalJaTktYMnJZQ1QvTzBlOFM5SmJx?=
 =?utf-8?B?dG43ek1JQzVlQkZka0NselBBYTg1Wi9pZklzKysvMU1pbEtBSWp0NC9jMGY2?=
 =?utf-8?B?S04yOEpWOVBIWEZaYUlXY2RVNUl0NmFhQ2tCeHZmTFhkS3psbHdmV25qWENW?=
 =?utf-8?B?SzdzSmJRK1pFVEFUejhESXI0V3dqc1owNHZyQS9PWFZPeTVERFhsN2dWR3Jp?=
 =?utf-8?B?cVVCYkNBYTY3U0dNZVNXK2U2cytTTEN6OStSZDh6d3k4SmpYTHMycW5adDZN?=
 =?utf-8?B?Rk1hR3p6VTlKTVBDVTM4NzJWV29NOWduWGdKejY5UnlSMTU4a0RCL0luTU9k?=
 =?utf-8?B?U3dCOHAyYVNnM0lOa041QmdINmlZSCtHNWZxdHVBTVl1UVlNVVJ2aHVWUmVG?=
 =?utf-8?B?TWdVUlRLU3ZCbHoraFFEMWQ3VVBkRnNjeU54aVhzdU9KL3VEQnhkV1FpZCs2?=
 =?utf-8?B?WG1FNzFYM25TZGJIci81clFhY1pudVcvZlIwUWV4QkxIejFBdyt4b0xHcmVu?=
 =?utf-8?B?L0F0SjVFVyt3PT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(366016)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eTYyVXhvMmlxRXg2VXJkdVE5eUJ0bjkyUEU3N1p0SHZIejBVWTN0cEdUTnZV?=
 =?utf-8?B?ZTZPZnNyZTcvM0k3eWVuUzU1K21mWWhnOXhmV1pORlZwa2lHbFdKTlR6Ymdm?=
 =?utf-8?B?VlkrTHVPVVI4OFdyNGNnWGtWWEpSQ2k2N3doYkJUV1F2dFdXU05zMVVtVDV2?=
 =?utf-8?B?OU0ycW96aWE0VjZYL0E3MzkyRVNaNmZhSWgvdkdPSjJNVTVQWFVpTnlUK05L?=
 =?utf-8?B?cG1NeEVGbENaOGl5clFZUGpZajZBa2tNN3ZLMElZaGtxa1pCb1dsMWNDZlRW?=
 =?utf-8?B?K29TWEo2VGNzZWpSdGlNSkxoYmtkdkxxUDNxSlZjcndXdnhNRWREclhsNnBF?=
 =?utf-8?B?SXRVSGNqVWV5cjZUUEJIYXJpR2U0aHlMekxOWFBHZ21zRHNxMkV1d1VxODdm?=
 =?utf-8?B?aWNFZFgxWTlxZ0Jadzl6RTJVbENqaHR6VmZMT1FzUldCOSs5bmpubEFSVi9D?=
 =?utf-8?B?UWdwaXVLS0t1WlAySllsZmJSUUZwN1NISGdnZUE3VVZrZWZQSEY3SFlTWHJj?=
 =?utf-8?B?WWZSUXdpby96elVtekRnNmNXMTZEK3ljRWFxbVNLMHhTSHAwRjVpWEsyN2hE?=
 =?utf-8?B?UkEwcWtsV0JOUm1Ba0tJUnM1dXAwRDZIRjI2YnBUV1MySE9SY3RPOVhNeXRL?=
 =?utf-8?B?VkYrcGxsRVBqQkdKUEM3MXE1aHlHREd2dkkrZkxLeTJRQ2NlK0ZtWkF0MzJN?=
 =?utf-8?B?NHlTdG10WHVJTEd2N1JZQmRNek9WUVVtM3Uvc1kzaHBpQ1FGdE9LaExWbVBr?=
 =?utf-8?B?YVF2dmdHcVNxT0VlNmwveGVCKytUbUNocWwyV2daWEJvV2pHeUFMUWJKK25j?=
 =?utf-8?B?ZUQ5bGF1K2NLdWdSOXo0SXdZK1FnMzhJZGg5eFl4QUl3ODBnOGdvQ3MyN0JN?=
 =?utf-8?B?ZmFiVjluN2M0TmYyVDFaTHR2SVZaNW03SFFtSVE2WFJVU3VWM0hTdHVYV3dC?=
 =?utf-8?B?S3dVT0E3WFRua0c5aUV1TnBONWJKbThKT3ErY0VSSW1SSllCV2hlb3k4NnpG?=
 =?utf-8?B?RmpidDhvSEtDSnFBc1VkNHFSTjdJTmJ1ajFsLzR1QldjK0FLWVpWbmhTWGl5?=
 =?utf-8?B?UWM2Vzk5Q0pSaEVVL2JCZmdNcWtFaW1LbUhyOWt6cGhWUklrWW8zWHE4YUkz?=
 =?utf-8?B?NWpyN21LQzRYSStBTlRVcUpUSkJRUHBSeUpWZWVSejZVU3MrUVJsazdqakFK?=
 =?utf-8?B?bDdtejUzRmVFNHhkaFJPbmpTYkRWQ1lBRW1MeUY1eHlZYWUzQSs4bzEwN2w4?=
 =?utf-8?B?RmxDUCs1ajdQK0dvaXlJdERJTFNQTGZON05jMFFUUk5TR0lpUExGOHU3RTJx?=
 =?utf-8?B?UllqTWhTdFRCRzh5NnBWZzZZaERvaEthSzlrbXJoZlNrUWowVlp5OTFIMnJT?=
 =?utf-8?B?ck5tTWlpMHNGTUh0MVlkelJPTWsxeHdsdnFURmFxR0d1YlVLNmRrL1d2YlhD?=
 =?utf-8?B?cFZGMTlWdkQrTU10U2tUK1ZySWQrVysrNkRCSWppam51Z3F4SVVjK0lwQUYw?=
 =?utf-8?B?OHRZSG04ZmJFcWVwYXI3NUR2dC9WSGU4elJUS2NjNjdLYmlBd0Q1bHhrcGlJ?=
 =?utf-8?B?a2VqMXJXNEV5OGs3bWJRNDBScjQ5dEVKMjNIUDJ6OG1YN3ZtbmFKSmpOSWFa?=
 =?utf-8?B?UzRhVU9qMkZ5V3YxTmFxem14OFVRUEZSNk00U0cwSlY4RFJaMDJEZFdJR2lU?=
 =?utf-8?B?WklQZndpL3hzdUFlOVpzMTNQSnlUMER4MzlhU2tzWlp4V0FrVDNlb1QybnJv?=
 =?utf-8?B?T044OHNNdEcxR3lxMHcvTjRKa2tFSHNxcWJBeUM3WllSZkRFRXBUWnJMYzNV?=
 =?utf-8?B?OS8yZjN4aU96S2VKRURBcVIrNmwrK3FLV2RBZjh2QmNSMEI4c3FFNUp2OUty?=
 =?utf-8?B?cnZMZnVHL3BlUkFtYXBMNXBEcjlpd1N2K2o1K05rRldpbU4rZTVMZ2kxVTJF?=
 =?utf-8?B?QTJtQ1EweDBJZ0dvQmNXODVOdWxJb2pVbFA4VXBFUld3RHRoSFp2elFFWDJP?=
 =?utf-8?B?N3dCNnJIWDZ4R3IyamtwWWFlMEJGaENLaXBHaGMyc0luVDg1YXg0clBTdEZK?=
 =?utf-8?B?ZjZ4U1ZKNFA5NzlPaW9hWWRLOVZvTE9GaXdyRk40UHVDdlE1cUFEOE12eno0?=
 =?utf-8?Q?5JyXu37EP1TRFHJ2mVw9AnuT7?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 36733d04-f6ff-4528-558b-08ddb540a2f2
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jun 2025 06:05:37.3799
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OAbgrq1a3TgqiglYDa5jTY21u39fAUfqprf5AppjcmXddliRLM/LhYZD2lhQ5tevIrdx/Hb7TQ/VZi3OLWXeRw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8906

System Manager firmware provides API to dump board, silicon, firmware
information. It also provides API to dump system sleep, wakeup
information. So add the interface for Linux to retrieve the information:

patch 1 is to add doc for board information which was missed before.

The output as below:
root@imx95evk:~# cat /sys/devices/platform/arm-scmi.0.auto/scmi_dev.14/syslog
Wake Vector = 36
Sys sleep mode = 0
Sys sleep flags = 0x00000000
MIX power status = 0x00030017
MEM power status = 0x00014400
PLL power status = 0x00000020
Sleep latency = 764
Wake latency = 3728
Sleep count = 1
root@imx95evk:~# cat /sys/devices/platform/arm-scmi.0.auto/scmi_dev.14/system_info
SM Version    = Build 646, Commit 08707569f4
SM Config     = mx95evkrpmsg, mSel=0
Silicon       = i.MX95 B0
Board         = i.MX95 EVK, attr=0x00000000

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
Peng Fan (7):
      firmware: arm_scmi: imx: Add documentation for MISC_BOARD_INFO
      firmware: arm_scmi: imx: Support discovering buildinfo of MISC protocol
      firmware: arm_scmi: imx: Support getting cfg info of MISC protocol
      firmware: arm_scmi: imx: Support getting silicon info of MISC protocol
      firmware: arm_scmi: imx: Support getting syslog of MISC protocol
      firmware: arm_scmi: imx: Support getting board info of MISC protocol
      firmware: imx: sm-misc: Dump syslog and system info

 .../firmware/arm_scmi/vendors/imx/imx-sm-misc.c    | 207 +++++++++++++++++++++
 drivers/firmware/arm_scmi/vendors/imx/imx95.rst    |  20 ++
 drivers/firmware/imx/sm-misc.c                     |  97 ++++++++++
 include/linux/scmi_imx_protocol.h                  |  49 +++++
 4 files changed, 373 insertions(+)
---
base-commit: ecb259c4f70dd5c83907809f45bf4dc6869961d7
change-id: 20250627-sm-misc-api-v1-85c030c670c6

Best regards,
-- 
Peng Fan <peng.fan@nxp.com>

