Received: from AS8PR03CU001.outbound.protection.outlook.com (mail-westeuropeazon11012059.outbound.protection.outlook.com [52.101.71.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2654D1E0DEA;
	Tue,  1 Jul 2025 07:07:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.71.59
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751353637; cv=fail; b=MqEoCy5j9kdHxTfIxG66TVXmWgOnPUOVTyhmxzCIV+2ABtFJ9lbQAmmYpw0VPQLx6JJtGzpD7ET91nmA1WquSd+hQrwn2k/2gLchGU+yHSdhVMzW1gCVoFjh+hDyatWsDhZrX0WnmdiqtfDMCqT9Bawpfc6xt1dC3hGaPVeTKMY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751353637; c=relaxed/simple;
	bh=d8ipzdV619BrjS6DQ4e96G4FsZjK57vDvmpRN4Ih47I=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=gbq5d0eZUIFBAgmxrD7xOpLI8tZmndq+LWulgQTAXL6aIgqK9nbzcH15yYcwC8YI091nZfuxWiadHmhsMML95OU+IQzajOYLxC9NaJcscsIg2V1nQF2J8oYA5bDM/DGoWIzX5Itjs4QgGizmRtM/VxQIh5+eSxHp9z4rOMrC+bA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=iiyOU6yz; arc=fail smtp.client-ip=52.101.71.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="iiyOU6yz"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ityMZJ95WF+o8yO+LOFlkJK0Si8qalm8eqmdOchFFNDe59h7aewJU34FZKz7K71Hw3+ja/KvGQz6Dwcsy1M9a0nvWuSg07cxU8TkjXJCaNbMfdh5+YkFlvmpItQ/tuEatDstflRuDbAbnY+dclpxi/rcZT2YHKQ0zzBdfXKvjtbkiCGyQN1Aq0vtcHUo/zw8FYAqStmhnbSRNDuGr12Q3mf8z/H1Rpd/ZWlaSVmnKmtxyBTMg+si7p/OPX/O9ZnIeYFztCcK+Xh01Lrsi4qZpHADe4veEaftZ/FaXitBE+ldZJBMgq0a8CBOvNXnUJlXYXSXHv8Q2HrtYGMKvQHXEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kIcVPiZWqQpuslJ+zDGHHUZuPDNfPKFYtoHFSe3Mwbk=;
 b=SmeE8yK7CLP0wETLDA18dM+05OFEt/N2SsZFacddxir47IBLXgnnDpMb8cbDIV8rfe+5ccgz8Y2FrdLtS3kBxlkywaL+x+48kXsBHlCROBBC26xRrSpa88g1cJ9xpfneLN7qmbySyx52wmk7wXqckncP6BOvff8zLM+MicX6WqD7Am0SpkQUBxf0q3E4WB5XGqrcOfTqJdAnHtjT4Boi8bCu18c2GUS225nHJAGj/N1GaboufJT3yq5T6ozCSwe8mP0N4zvMpfwaM5W6PvHEnSeLacWPg6WoxD0tczvpOscEhDnZ6SUeXCsyJnvv6bn+LsVuV8GLpz+x7pSEcPaprA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kIcVPiZWqQpuslJ+zDGHHUZuPDNfPKFYtoHFSe3Mwbk=;
 b=iiyOU6yzFUFtWPAuaKd21PAzEnB9z3WHbHz0UFin8P1Xrxj6157GUbPmNMiUEpMViStsJ++dpAaDMlk1mb0BT320uFDzjrFNHR7I4a8OyEVUD0SH5ZdcJzzhwce+ckKh3/toFRpzfHr8NhCYISRSqDR2IgXXCLnByq8UO16cLCTLFSb17S67Uz4D9ZDMzdc1rOJqhjGXCO9HYU/a2zHH+Lvh9Ojpp7yHfkbLyzjpGy9sQfnLH+e6ypwonJZaPkc8sJC6+gOLJZPbeYF1lwH1qberFRzYYNnj9s0y+hd1nu9m8pPtxE5ms+9oIdiEEIlSYUD+Y55oIvRlz8PEleyyxw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by DB9PR04MB8154.eurprd04.prod.outlook.com (2603:10a6:10:243::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.30; Tue, 1 Jul
 2025 07:07:12 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%6]) with mapi id 15.20.8880.029; Tue, 1 Jul 2025
 07:07:12 +0000
From: Peng Fan <peng.fan@nxp.com>
Date: Tue, 01 Jul 2025 15:04:41 +0800
Subject: [PATCH 5/5] arm64: dts: imx943: Add LVDS/DISPLAY CSR nodes
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250701-imx95-blk-ctl-7-1-v1-5-00db23bd8876@nxp.com>
References: <20250701-imx95-blk-ctl-7-1-v1-0-00db23bd8876@nxp.com>
In-Reply-To: <20250701-imx95-blk-ctl-7-1-v1-0-00db23bd8876@nxp.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Abel Vesa <abelvesa@kernel.org>, 
 Frank Li <frank.li@nxp.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>, 
 Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751353495; l=1830;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=d8ipzdV619BrjS6DQ4e96G4FsZjK57vDvmpRN4Ih47I=;
 b=qDPYRD0Yb7CRok/HN1gnc2aY2Ofg14HWmYllS2I9wXRE/YlAsSw/78e/tK62z2clSxplH6HUI
 9bQa/lm+ggdCs1w7Z+EoS1RogpxQagAvMU9U/bQvNs/MDztdCvU2O5A
X-Developer-Key: i=peng.fan@nxp.com; a=ed25519;
 pk=I4sJg7atIT1g63H7bb5lDRGR2gJW14RKDD0wFL8TT1g=
X-ClientProxiedBy: MA0PR01CA0071.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ad::11) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|DB9PR04MB8154:EE_
X-MS-Office365-Filtering-Correlation-Id: baeb0371-9e86-4d51-9440-08ddb86de71f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|7416014|52116014|19092799006|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dDZBblpBOVNNTlVJSnJhV0ZYSjNMTlB4dWNtMWs1bEZHSFRRZFA3ZnMvV1VG?=
 =?utf-8?B?QW5paUhBSStucHV4RzBGU01ZS0VWUWpCbXNySUVRTlhOSkczZVVpbGROMXZk?=
 =?utf-8?B?OEg3dHFYMVE3U1lRUDNuN0hNQmJSQlB3WnRjU2lOaUQxYnlqTCtrbkExOGJs?=
 =?utf-8?B?MHphTURreEV3dGZ3QTYvcXpjOHlnSzJKSVY3VHZUZnhtSW0yVm51aWlNNzFU?=
 =?utf-8?B?V3JtT0I4L0VmaWJWVFdKa3pPNE1JS3pBQU1yOFJOYnloMFlPbUpyeDdLck1i?=
 =?utf-8?B?aHNzcGJuaG14NklVNGZNRUw3ckN0cnFyQTNkYVNNWlA4RkVNQjFTOGhIYit3?=
 =?utf-8?B?SnFNeHA0RUVnd3JURWFRdGJmR3ZaelA0eFhpam1ncG1kUEthVHo0bE1ZN2dv?=
 =?utf-8?B?Q2gwMTVKQzUvZ0pMc1hJQnB2djRreUhoZC9YQnJJTGF6NktkTTdjUU9VODdj?=
 =?utf-8?B?aS9xVDYwZjBVQ1g2bG9VUnVqRG9tRkxjQTJFNXl6eXZIWnY3TDVpdlI5RWJz?=
 =?utf-8?B?VEZkUXlWamJFL3FnWkdPRWpnTFhLMXF0akVzY2JVbEFjRlhVUkhRR0hGbGh0?=
 =?utf-8?B?U0ltUU5ZTGJFMHJaakdyeXpUVm5kbmJTRllRVHVSYUx2UGxuVWdYZWRIZ1Zy?=
 =?utf-8?B?UjVlMThWUEVyUWgwSFUwL0NSMlVPUGpXR0NtZ21nQ1J6SUJlY0t5cUcyWnZt?=
 =?utf-8?B?UVFHci8zT2RqVkM5OHA4NHdWMkxsM2kyZEpnV0o1K1BydnZ6eTk3Z1ZkWXQ5?=
 =?utf-8?B?OU0yVkVuUmgxam5GOUFKdnU1Y0Q2dTBxS2o1OHg1RjZkYlZsS0xkUzRqa01W?=
 =?utf-8?B?NEJQTE80SHpHMllZcFlsRWNXKzdaT1NTV252eVY4ZXQyS0FXbnpYejFBM2xv?=
 =?utf-8?B?ekQxWWVIR0hkTlhHemE4OEJBc0ZlOUpSbXY5L1Q3YzE1WVZ4WnlWL3graG95?=
 =?utf-8?B?WVFnWjBHbFVDREkraW1KbkVod05sdFFyWUlwU05MMm5jNDR6Z3JuYmJid2lj?=
 =?utf-8?B?WnFVbnpJZlkxZ1g4QkYvR3VLbytYeFFNOTg2bkxURkRCMWc5SmlnR1pDSll0?=
 =?utf-8?B?Y2loTVVWTXFjSXpkNU1oSFB6L05aWjZVV3dZTktzMXlvL2ZCUjMxQXBnWktz?=
 =?utf-8?B?WFA3UWtSa0daUTROb2RPSEZDZ3NkdmhOdVlXRWx2WHV2a3A5SFRncm90YWE0?=
 =?utf-8?B?eWczS1U2RTYrUFZaRjJDRWRqRjBRV3VHM2dPaFZHTGpUeituZDhOUFJWSXVQ?=
 =?utf-8?B?Q3BBTXdHdnlTSHcxN1JkV084ckoyUEpMWnc2dUNncDE4WkxEeExkKzh5Skc0?=
 =?utf-8?B?OTNLc3ZtU2k2T0s4TmMweW42eHlCTDFNcXJUb1VkcFhkSEZNL3UyUSsvVXM5?=
 =?utf-8?B?aC9mQ2UydnFxclhJVWZKUENMcDVKSC9HcHhkVWhRTTMzd2pZT3UzTmJTMnU2?=
 =?utf-8?B?Q3FneG1POWVCNyt0YnlEd1lrMTUxV3dGcC9hN0E0ZTNTN1Y2S3VXaElxc3dN?=
 =?utf-8?B?TzR5NGRmaUdzQ2pVdWNEUlRQM1pkQ2cwSnVyNzh1cG52Z3JtbHVxUUlqQ0x0?=
 =?utf-8?B?Z1ZGTnhHd0ZnSVRmeCtVOTkyeWlMMVRrQzk4WmJ3b0V4cEI2dlNaa1J5RXpL?=
 =?utf-8?B?TkN2aHgrWXprYmZUblUzZ0xZdFNHdmo3aFZ6WWg4bXRiU1l3VjJhQmVLelFa?=
 =?utf-8?B?OXUycDE2RUlzR2tSOHZTbE8xczFsTXVZWW5nMGZhTitSaWZ6WlM1dE1VNDVQ?=
 =?utf-8?B?Uit3TE9ldlBzWURibUh0SWZrTkJmR2NwK3dKYWc5VUtaSGFZdGVmdEFheXhz?=
 =?utf-8?B?RHZ3SVYvcnB1NEpLZERIMWJVVDUzQUhybitYT1ZuekwrMGhTZCt1TDhRdG9G?=
 =?utf-8?B?NDh2WTBRTitJajE2WEVET01HNTNQd2RkUjJBWDU3U3ZaR0dzNDh5cjFVN3lI?=
 =?utf-8?B?eS9BNHY2OW5LNzhMRllTaGdnYlNUZ3RNZTFnSVVTZUNoOXYrN3hrZUtzT1cr?=
 =?utf-8?Q?5LndJ0xKPJdrtEQGk0rLquqG6oGRUY=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(52116014)(19092799006)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UEV2WTNhOEZ3ak1kYlZacHEyYXBLbHovZnhibW5jOE92aXV6WmgwbVo0bnpy?=
 =?utf-8?B?TWxrV1g5elZnMThKdnVDbmIvZ2JZTzVBL2Z4SVh2dStmNzJVUXlURFU0YSt5?=
 =?utf-8?B?RkR3MlhEV2l5NHFaaGJFWlo1SmZNeUdXR29qUzJFcnJZODlYNXJvWlBZRjM2?=
 =?utf-8?B?QTlqVkQ0SDNObWsvR1BCTndIRG5vWmhJenIxRDl5ZUd4aHNjRmlPTXdYTFZI?=
 =?utf-8?B?RG14dTY0VU9HNklMaVFLaDh0cFQ4cUpwaE5hK0ZuNy8vWkxFRG9STldhaUIv?=
 =?utf-8?B?UFNyY1A5a3lTSkpCLytueVJSRGh6a1pZMUJSN1BRaGdnclNCS3g1QlVrUmZz?=
 =?utf-8?B?VzJyVUgyUjU4Z1JUQ09RSm1JbFpicnJmbFVRTmVWYTlnNm5TeUxLN3JMaExU?=
 =?utf-8?B?K2FhakZKdEhxaG5xRU90NGZTOFRGbEpsaGpFdmxoOEFHUzB4NFJYcWVvTENk?=
 =?utf-8?B?K2UyQ01ESUlGQU51bUp0K2FJQkh6Vkdza3B1WUNRODlBODlmVStOU3IwMjJ3?=
 =?utf-8?B?WkxPYnJOcUhvUEdyYXJZa2lLVDhmUzM5RFQ5VVR6SWM4Ym4zUXY2bTgvVGs0?=
 =?utf-8?B?SVU3elIvSzBnN3dmMkVWZlM2cS94UXpSOGs4STlCa052NEhCMlNxd1dmd1dX?=
 =?utf-8?B?aVM2b1k5enc2NEs3ZEgxdlBqQnVTb0J0SXNPbWdEcStBbFdhTnZNaXltaksz?=
 =?utf-8?B?Vk1ZVjRUMWtCN1JuSW1xQUZMN3pWZkRWSEFGcUdiYUtCc2hFcENBZXQ4WWJK?=
 =?utf-8?B?T2cxZ2FzenIzQkFaVkh1T3FBSGFia0duYmRvcWdXM2RpcmtWbjBXUUVpeHNo?=
 =?utf-8?B?SkFHeWdrbUFxVm9WWHc5c3ZseGNVNFlGbjdENzF6d1A3SHpKcDlVT0VlR1JL?=
 =?utf-8?B?SkRXY2xoRyt3eFJhbWtuM1ZzZ3dHeUpZK04xZWZraTRpVmlYbEhCVUhzelU5?=
 =?utf-8?B?bGZxdEdvZnZQeENSbHViOW42bnZLZ2FrcXo3NDVMNXRJTlppUTlKMGU0N2Rq?=
 =?utf-8?B?dnV4RElDaHFQWFlqN1l6RS9EN2dhNXVJL1FSSkU2MkVJSk02TjhHTWRGNS9D?=
 =?utf-8?B?VlIrRlJ6azc5WE54T252dmhCUFNZbEliZ2NidER5RmpwTFBHU3h2aVVUS2ti?=
 =?utf-8?B?M1RVRDBRQkUxL1ZaMURxVzVnMWgzdlJ0SjFybkloYzVGMEc2Zkt5cUVCNzdv?=
 =?utf-8?B?dnAwSExma2FaS3NiMUhTOXoyMHpoTDZoUUdOK1ExTjc0d25tVEUxNkgxRlJz?=
 =?utf-8?B?cis4NHdHS3JWZUNpazRjcjRVWXhTcDdpL1djMEtGK0FZdG9lWGVodktFdkdE?=
 =?utf-8?B?NHZrbDA3TVBzbDBKcnA5cDNzTmVNNVJpaTh1ZUN1cFoxa25LVlNyQUtERW53?=
 =?utf-8?B?ZG13ZzFlUHJOWEwrT3I2QVdVc1JUZTlYdHpIaXJPenZFMDFEaGhJWit6Ymg4?=
 =?utf-8?B?eHVJcmR1U3ErT1QveW5oMUZvRzhVcHQ3VUh4VlpGYnJOM2kwa2s5TWZuRVlv?=
 =?utf-8?B?bDA2Vkc5RkVFVVBvOVN2RllXY1Rhb0M1UVhlZ3Z4WjNzRkZaSXpRSDc5SVZE?=
 =?utf-8?B?MFQ0U3JyNkQ1UENJYXJJeS95WHo0UXFxanJRdy9ITEZSSjZOYVlpNGY2ME4x?=
 =?utf-8?B?QkhSOS9RK296M0hDeTBZbGNkVHZoajcwb0ZqdWFUQkNNaEpTQ0c0K0xJWmdK?=
 =?utf-8?B?Y3h5UWtIYmNWcm5iMXJUNGxyUlh4bmdtR0RpUjlUUk9qVUdMZ3NKdUpNQTZ0?=
 =?utf-8?B?UjNrS3E3eS95SWRWWGZnRndsSStLc2RqN3daTEYzWkhqdXg0Z29HL2hnRGFY?=
 =?utf-8?B?Zmk4YVR0NDdveWZjUmE5bUU5YXZVaDVKL2pQZENETWhxdUVkanRpeEZNM042?=
 =?utf-8?B?clkwYStXbWE2eFh1Zm5iYXdQUDNtUlpmZ3djakttT1Z5TDU5K2EvRHl0eHpy?=
 =?utf-8?B?dG9IWHRoNHhGcjV1Y09naGFGUTQ5THBNN3NZN1ZhS0JQVHpQMzg2NlZLUjF0?=
 =?utf-8?B?UEkvU0JYa0pubjhzSXNNZVhjb1U5RVB2Mkc5TnBlVUd2dXlXOG8zN0xDS1ov?=
 =?utf-8?B?akRaeitCRTM0bmVBUi9NVUpQT1JsYnhmMllhUkh1Wm9HNGQrcGJIbU1UZHlJ?=
 =?utf-8?Q?RE3s+EGsrhrpnsL35W5w4WNsN?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: baeb0371-9e86-4d51-9440-08ddb86de71f
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2025 07:07:12.6323
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: J4r4qW6AzxoSE8qTGhFkz08vA0YgXCTmPCxX0Hqhsuv0s47vyOBHtbc5/vEfjuhf0XgND5XnZdDdN6CMuueuvg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8154

Add nodes for LVDS/DISPLAY CSR.

Add ldb_pll_div7 node which is used for clock source of DISPLAY CSR.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx943.dtsi | 34 +++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx943.dtsi b/arch/arm64/boot/dts/freescale/imx943.dtsi
index 45b8da758e87771c0775eb799ce2da3aac37c060..cf67dba21e4f6f27fff7e5d29744086e4ec9c021 100644
--- a/arch/arm64/boot/dts/freescale/imx943.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx943.dtsi
@@ -3,6 +3,8 @@
  * Copyright 2025 NXP
  */
 
+#include <dt-bindings/clock/nxp,imx94-clock.h>
+
 #include "imx94.dtsi"
 
 / {
@@ -145,4 +147,36 @@ l3_cache: l3-cache {
 			cache-unified;
 		};
 	};
+
+	ldb_pll_pixel: ldb_pll_div7 {
+		compatible = "fixed-factor-clock";
+		#clock-cells = <0>;
+		clocks = <&scmi_clk IMX94_CLK_LDBPLL>;
+		clock-div = <7>;
+		clock-mult = <1>;
+		clock-output-names = "ldb_pll_div7";
+	};
+
+	soc {
+		dispmix_csr: syscon@4b010000 {
+			compatible = "nxp,imx94-display-csr", "syscon";
+			reg = <0x0 0x4b010000 0x0 0x10000>;
+			clocks = <&scmi_clk IMX94_CLK_DISPAPB>;
+			#clock-cells = <1>;
+			power-domains = <&scmi_devpd IMX94_PD_DISPLAY>;
+			assigned-clocks = <&scmi_clk IMX94_CLK_DISPAXI>,
+					  <&scmi_clk IMX94_CLK_DISPAPB>;
+			assigned-clock-parents = <&scmi_clk IMX94_CLK_SYSPLL1_PFD1>,
+						 <&scmi_clk IMX94_CLK_SYSPLL1_PFD1_DIV2>;
+			assigned-clock-rates = <400000000>,  <133333333>;
+		};
+
+		lvds_csr: syscon@4b0c0000 {
+			compatible = "nxp,imx94-lvds-csr", "syscon";
+			reg = <0x0 0x4b0c0000 0x0 0x10000>;
+			clocks = <&scmi_clk IMX94_CLK_DISPAPB>;
+			#clock-cells = <1>;
+			power-domains = <&scmi_devpd IMX94_PD_DISPLAY>;
+		};
+	};
 };

-- 
2.37.1

