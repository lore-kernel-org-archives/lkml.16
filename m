Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2051.outbound.protection.outlook.com [40.107.21.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E6CD1CD1F;
	Thu, 24 Apr 2025 00:41:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745455312; cv=fail; b=Ndn6pX3HJJCiobfRpTkkGVKQN4e4V7ha08vTq8Ax9INYXIE2JRwYIgvI+P0TNRkaBRrpwXRrqrMV4bYOYWM9EOZ2rlaDSiAy1SoWt1TOG3J8gNrfG2aOXk5sra2XIQYEzNzqWZPjuuZ0f4ToDsEgOKCJNuPz8ICjFVORoDvyv4c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745455312; c=relaxed/simple;
	bh=fb/wsgcQLcfW9+ZuT/B/c5ts0vkog6agmJOvPshSQA8=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=XeRB7sEu6vjN/thWrv7DZ0lyrrUZJpbef14pcHftSDEvhz/9DTZZU+hofvNK4Feb6UCGo5YYkejuxe14gmOJPP5aza67D0hywOgqWqEDaesfSlzc3I7sQFL1yqAT+6Sjz3vx/xYYcoWDX7Lo5ppMRmJ7rE+oxWo7N5H+hg4D36I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=A+p63lb/; arc=fail smtp.client-ip=40.107.21.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="A+p63lb/"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CFI4aNc9YjwgKxP1T+3ng8n0q0TbAsuxfT8xERAuv5FnQQu8bFc0JeJU5qFp1X7g8GWcWg5njYG4UuaD72F0JNWPtVxhX4N3+ok3rIRVxCb1/ar1yBTMa0QoZ8UYGAZ3N9mhIq1WkAQdjlDYmEApxFhAy9AFQkFQp6T/6i2RI9nWNAs+YjVRs3m0IHHJlatlPKNJqLEmz89oYlEIsWOjlAEunPUDSEQRMF+PnM8IwmPIL1C/hpNwE/kEJPyFmft4qBw5VLjEqE30ZxpZsMaU3s/Uh6/v5KOZRdxKwuygpmWCU/dzbzmru5ybPc60scv2Gtog3jSGX6neySEpb246kQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yp58FLoqla3NKEfeL0Y5KRsuF2FJfFcTtOrVuPciglM=;
 b=BhaECujkYj3rVfYRN/QRCJ5lX5ifialNdm3cGIsvSMQGzDrkGRh37XvyQEcEpwfAcX0K7ZSYuB1ksnFE8ixEHA03TbLepgs2bQPsAM2GeskbaATg724Kt8zTFUau0tTDwYd5wTNMHF0HOyo3d7shHyGH3vAREt1SBHam3M6fPgMhL/ogz+7ZeyYhuawy60aJ4TvLClDsmXyd26yS3GMuofjw92NNeD/paM1+hQnxhoUbniQdBoG7yn0X+YGOzABn1i+sVPpTvlQX59Uk3LWuutWGkG6L2AnjRiIAUQ522jBSGH2ovIBUbNBNqmXKjdKxGN1CQ4ckiS+SNed+IebYRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yp58FLoqla3NKEfeL0Y5KRsuF2FJfFcTtOrVuPciglM=;
 b=A+p63lb/phxOkbtjQh6W9ZvKrznN40imSrHFEU1Us4XB6bBebTiPqe4jQBFcAhZkITGd1ZpJSRVwJdCYGTUbvZNpMsmwsboX7cEd+hOBLZxRc80pl6JMQnQL7wYhZ6dCNPvGpzNcPv1op3mgVetXQzm7UMnc63p7IWDphhVUFq0ufsW5eN1vfrpRXYtcO+CNsdYYZImdnWk5FrT76CUftaOGXri/SLW3UyA1VigqsYlvJb5iSOFOn/a9jz09I5B/XTLwE+i7uWLJJdHBlZZS/Sfvc7vqChD0A11U244awQJdqh+7c9A8Fo/9XRhj4psl91EfSO1+w5mTE9aEV8B4Ew==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by PAXPR04MB8605.eurprd04.prod.outlook.com (2603:10a6:102:218::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.23; Thu, 24 Apr
 2025 00:41:47 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%2]) with mapi id 15.20.8678.021; Thu, 24 Apr 2025
 00:41:47 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Wed, 23 Apr 2025 20:41:23 -0400
Subject: [PATCH v2 1/8] arm64: dts: imx8: create unified pcie0 and pcie0_ep
 label for all chips
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250423-imx8_pcie_ep_dts-v2-1-43c982d83a8f@nxp.com>
References: <20250423-imx8_pcie_ep_dts-v2-0-43c982d83a8f@nxp.com>
In-Reply-To: <20250423-imx8_pcie_ep_dts-v2-0-43c982d83a8f@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 hongxing.zhu@nxp.com, Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.13-dev-e586c
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745455301; l=3810;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=fb/wsgcQLcfW9+ZuT/B/c5ts0vkog6agmJOvPshSQA8=;
 b=Xb4mB5RzTaVBf4S5pq1t9bCHPGXtLuLQk2ZgvvTzDRUzIQwrTr13tfCkSZBEQceqXgspxLcdm
 bUdbzNOJAhnD1J2nXU91taShjIs7NaWAVRrJ6cfizJs7KIowoUKJbZ3
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: PH7P222CA0001.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:510:33a::14) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|PAXPR04MB8605:EE_
X-MS-Office365-Filtering-Correlation-Id: 3e071b53-263d-4dbd-808c-08dd82c8cb3c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|7416014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ckZMMVFoc1BMeXdnRE8vUjdJdlR0bW5iVWphVnczQjdMcVVQY1BZUlM1TUgz?=
 =?utf-8?B?UVo3V3JtK3R2RGNya2NxVS91T2lYNVlaM3kraEQ3azNCMXhPVVgxZFFFUFNs?=
 =?utf-8?B?U3NjeUlzVk4xK0kvS2hwZWphdXYrc0xlMlUwekc4N1VHTmE4SU9nY3d3WW1D?=
 =?utf-8?B?SGRMS1JkekdMdTE4QTVVdnY2clJJd1U2RGpQZ205WXBWOEFQZC9jZFJlRlF6?=
 =?utf-8?B?YjZKc1hiRmF4ek8xWmVtUHZBWnlzZjYrSVByMzQ1dEpCYkhUVWMyTkE4a0U3?=
 =?utf-8?B?bWlGRElNbHVaUGhMK2xUOFFSZGk3SjJLcU9aVHFhWk16VE5Mbk0vVEc0QzNT?=
 =?utf-8?B?UTRxdHdHTkRCdlFhdEpqN3BrcHh0dzl0a3ZhNnlXNTlIY2N2TnZDUUNBOXdn?=
 =?utf-8?B?MWhwY3gwV0xWeXJYOHMySzUrSkhRQ3h0ZitWdkRtSmhDcktRaU41MHFncnNt?=
 =?utf-8?B?RVQwQjZ3akxFbVZ6eUoyL3hTYlBzOTUzMTd0TkxkNk5FRXNKekh2WkRvakEv?=
 =?utf-8?B?WDRmRUhVSzdaeWJ0dEU5aXJjMnhvMFk5TCs4NVgrQktma1R2L3NBcmdrWnRD?=
 =?utf-8?B?and3eUt1OXdONFBSL2dGcHZJRnRhSFBIQmFtSDZpSmt6S3hOMzlYQnY3L3Jz?=
 =?utf-8?B?Zlp4ckR4NS9SeEkwZVczMzdYMlhBaFVQaW8yK0lrcmRaL2FtZ1NxMlU3aWFp?=
 =?utf-8?B?RUVHMDJIV05aRjNTdFNvMTFCbUR1VGhmYzBjVDdrZlNMbHFyNnpiMHoxc3NW?=
 =?utf-8?B?WFVNYlkzWjd6K2w2NVBMaHA0TG5NdzJaeGxHNkdjRUhSeXdLVkRJbTJOZGlG?=
 =?utf-8?B?aFRUWGV0QjRKRXdqcFhtczNpUUpXUXJLelFLS0JYRStXeEt2d203VEJxdXRU?=
 =?utf-8?B?K1pNR0tUS011ZGZCbVhpcGd1RFZTSWtFbE9lOWt0OEJ3WGd4dVVSMCsxTHFo?=
 =?utf-8?B?cUxxMHVQWFRlN3Z1OXdsOGpJVy9OV25PSS9rUld3U1JBNG1nT2lVNVZKQ0JB?=
 =?utf-8?B?ZmhSUXduZGZPVy9BcG8xTWczT01kd3I1UG9ZNEVFWWZRZ0VRUCt2VDlFeFps?=
 =?utf-8?B?ZjJzQlQvZmxsMjhMdEFBNHd1b3RsaENJTjNBZHA2NXhablZkT3pJMUV2Qndt?=
 =?utf-8?B?RkhSZFhtTG51ZXViMzVmcjNaT1Y4ZVJqVHdJK0Qzckx1TVRJaEZRM3EydUZ6?=
 =?utf-8?B?MS9ZY1dTeEVsYmJnVjlGYndzN3JZYmlzZUl0RUhPdzBHeU4rK2pnZmZ5SVVT?=
 =?utf-8?B?cS9kVXF2dXppSzM1dlphdVhYTjNycHRqcm90cEE0clpybHVUT1AxenAzYmpu?=
 =?utf-8?B?UkQyUmNTYm04bU4yREtUanI4TUxIWWN0aTcrcHlGWlUxU3c3ZHNEVTNTTDVv?=
 =?utf-8?B?YjZKcjhXNUk2UHZDL2syblhRUHl6ZHJORkVkK2FzVEQrd0wzSzA5dkVOdE9u?=
 =?utf-8?B?SXZtMjdBYnNwNnRBaGxEMkJIRU0rOGJzdmcwbGYyOGExZ3pNdVJ2VDE4VXNT?=
 =?utf-8?B?WG9BR1h3bWRZc1VRMVEzQXVGQ0pDMWd3dDZOWGl2NzA3akp2OU1FUlc5YlBp?=
 =?utf-8?B?bmdRUEY3V1NyN0t5YWRmZWVBYmxuNzA3bVcxMk54YVhDMzhIUHJ4Z2VTbkox?=
 =?utf-8?B?aERjUEZKQy81M0pPbmFoWHFLNUxucDNYN1NjY3BnVFkvM096Smsxb0lGcEJK?=
 =?utf-8?B?TXhwK3hQMUFWUEN0dkJpZjcrckhxYzhyVG9vTkZySVloUXl4anhweUNLcEs3?=
 =?utf-8?B?Vjc3NXA0RHVzMGR6Wm05ZTl4ZEVlR2h0S1NVNVpZQWVGckJGYlMwMmp4ZXdp?=
 =?utf-8?B?VHEzejREQjVtR3RqWXM0cE8wNExCOWhwck1NVGp5YmxLSjdVUkhSRzZ1ZG1o?=
 =?utf-8?B?VmFoSnQrU0xkbTVxQjF1eHVpbU1taGY1ZHcxSEhJM0w0NmtHMVc4U0dHM3ht?=
 =?utf-8?B?RU51MDN5U3pXM1kvVE1ybjltUGQxZXQxdk01U3dtTlZSdWJ1a2doRUtFTklp?=
 =?utf-8?Q?XrAnIiQBA+T3+Y/2NASNNuyX0bHw8c=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(7416014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TGVYeFpqNkZac1NkTUwrdTBQV1dkUnZYdG9VckhLODN6aWY3VkdzbFppMWwy?=
 =?utf-8?B?VFlxVWpKUCtYcVJuMElkTmNUL1pPaDY3Y3lOZU4wNXMwVXRrcXIvOXAwV0x2?=
 =?utf-8?B?Y1FMSE94WVVEazR6cVBUWVEzOTVqUXEyOThRWjZwNDM5TVo0REthVHNCaTQv?=
 =?utf-8?B?L1JYWCtuZnREQVEzT3V5RzIzR09SbE9mdWI5YURzSWovV0h4ZTRGVXlEUFdB?=
 =?utf-8?B?Vmd5dnZOMmVtVWZvSW02czB6Q3VLMnpFQzZyRXpLMjlzWmViYzhISFExM1pk?=
 =?utf-8?B?UWFxNzI1cFh4MUF6QzcrZHZJY0lGT0hJNUltY1JjaENTbHZYTkZFTDI3WG5i?=
 =?utf-8?B?NWphRFlVSkdqOVpVTUEvWTJsMDFXekFGZDM0OEd3UEhCdnJFS24zSEtWbTRk?=
 =?utf-8?B?bFB0SFhDKytFNFJ0OGoya0lUMlBRclNUYXhZeTltd3ZvbHZGWmtydWg4ai9T?=
 =?utf-8?B?TmJwRVZHRGZmT0Z6UGJQN2w3eFg0NUxaRDFuTHRkYVdyT0hjNTJJVDdNZE16?=
 =?utf-8?B?WWp4QStTMnZhMHo1RndjWWdTb215QllVSmhFdHpuaWxjSlRDMEorbVZoU1Y2?=
 =?utf-8?B?Y1psWXpidktucjhkNWt4YWdWVUxCbTV4YS9vc1pYU0tTWEVpRXhPaEsyN2Y5?=
 =?utf-8?B?MFhtdUYwQ2dZSzdrOTc5NkpFVUg0N2x5bFFoRkpXZWhKbEJTS0doWXQ4c085?=
 =?utf-8?B?YUZOMmdxY3BXdjRJQU81Q0ZIZEppRFdGUDBGbkNHY3kzMUhvcytMeVpTZHcv?=
 =?utf-8?B?cHA2b3MrYVdmNmlMQ1BhdFdMWlQ1OTZkbUJUMmtjQUVIb3NWTkRGbE5sak5u?=
 =?utf-8?B?Mm16NFY2WmZMQm1tYzhheWJOQnV2SEs0NStXRTF6a0dQN0c3SEl2bGM3RFN0?=
 =?utf-8?B?QXdnR2ZCSjUxSVVRNWxqeXRHWFovVjhJV2theFBNUWtWWWVXMFpLY2FZTnpC?=
 =?utf-8?B?cW94UkxtT0QrWWxVeHJ6R1NzZE1Lc0ZRTkxzSDZNNjM2UHdKNy8rdU9YTnE1?=
 =?utf-8?B?WjRPQlVQcGFSUFVrRVBybVBqUmFqR2FGL0dka0FKc0lDYlkwa2ZrbnVWdEQv?=
 =?utf-8?B?VEZGdTEvdjhBQWhCR0hwT3ZQY1dVMGltZHpnRzArOG5INlBPL1ZhbGtRa0hB?=
 =?utf-8?B?eFFsS2pvOWFNYjgvZUI0Q0NhRGpOWW1QcWRkdTFJdUhlS1BTMTdXRUNlMU8x?=
 =?utf-8?B?emVya083cm5BaTFzZW5PVkdqbjZjclUzWTZoT29DdjlzZm05a0hnN3ZqS3Ev?=
 =?utf-8?B?ekh0dE1hNUJyR2JzZUVobEpwY3o5WjZrMS9KV1JQTVVFYmdrQzJ0TXhLR0Zp?=
 =?utf-8?B?SFBKQkhqNWJmV2x2eWgyWEU2RmhZR0lLQUJ3MUJ1MTM5S3pOUm1HNXMveXNL?=
 =?utf-8?B?YVYydVprNzc2YjlEYXdCdlNWRk1GelNUd2VyblRFSWdIbXdyQUpQSzE1Q3Z5?=
 =?utf-8?B?b1Y1TVQ5QzN4dHUzT3pYb01uZXRVUGhZaEtoY0JkbDRGaDVJWWhOL2Z2YzRI?=
 =?utf-8?B?MDB4bTJnTlBFbGMxY2lGL082dmVTWnJJYlNnUklGcGZQWFd2dHJRWTdJVDJF?=
 =?utf-8?B?TTJEaFZaUFRpU2N0a1N2UmJTdzRoZ21jRDJzRFJ0dUxVR0tNSHROTnhvTm5B?=
 =?utf-8?B?R2l3VVJRTmFoUm1nVldZdUxad0x4Ly9YMHNoL09CQkU5RWdnWWtqQ21UVS9x?=
 =?utf-8?B?SlhDTXFadnpwK1NGSnRPMlU1clFGRVFVZnV5QS96ZVgxWWFkK1dtRE5oaEk3?=
 =?utf-8?B?dUMwMThGYmlTOWk3b1Y3bDMzc0JlVndNMUV4L0s2dW1sMDZ0bFc4dWFKcTNl?=
 =?utf-8?B?ZWV5SXZINU1ENXk2cSt0N2FqVkRDV3NzbUJ6L3BzL0FoR0h5aTlhT2VXS1pJ?=
 =?utf-8?B?eHpwb2RXTlhaZkZXNm92enpJRTVYM1dwZzVqUndCUThkMWRST1VjL25kWE9r?=
 =?utf-8?B?V0xxa3p0bzd3dHpsMmVtbzFjZHFnaTRoL2ZMS1FTamVML0VMc2g2SDNIUnFB?=
 =?utf-8?B?NWFUWnE4ejNLMS9RMlpoNUZIMytQNldPaW5CYndsR3VneTBDc29RWVYrU2Z6?=
 =?utf-8?B?UTM1Nm9ZVmNxWXNzc0NuekFKdnZhdDNva3d5d240MkNsQXBCcHB5MkprbFhw?=
 =?utf-8?Q?EEiw=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e071b53-263d-4dbd-808c-08dd82c8cb3c
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2025 00:41:47.4048
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i6Xj+5Fg5YR0A2bvgon8EF0m/eBKzOYehAFwsdIenRdgXpbNCyuzLcB2twKR/+9DOXyz93/wDZS9KTfOXZmrrQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8605

Add unified pcie<n> and pcie<n>_ep label for existed chipes to prepare
applied one overay file to enable EP function.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8dxl-ss-hsio.dtsi | 23 ++++++++++++----------
 arch/arm64/boot/dts/freescale/imx8mp.dtsi          |  4 ++--
 arch/arm64/boot/dts/freescale/imx8qm-ss-hsio.dtsi  |  6 +++---
 arch/arm64/boot/dts/freescale/imx8qxp-ss-hsio.dtsi |  6 ++++++
 4 files changed, 24 insertions(+), 15 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8dxl-ss-hsio.dtsi b/arch/arm64/boot/dts/freescale/imx8dxl-ss-hsio.dtsi
index afbe962d78ce1..67c5c6029cd9b 100644
--- a/arch/arm64/boot/dts/freescale/imx8dxl-ss-hsio.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8dxl-ss-hsio.dtsi
@@ -37,15 +37,18 @@ hsio_phy: phy@5f1a0000 {
 		power-domains = <&pd IMX_SC_R_SERDES_1>;
 		status = "disabled";
 	};
-};
 
-&pcieb {
-	#interrupt-cells = <1>;
-	interrupts = <GIC_SPI 44 IRQ_TYPE_LEVEL_HIGH>;
-	interrupt-names = "msi";
-	interrupt-map = <0 0 0 1 &gic 0 47 4>,
-			 <0 0 0 2 &gic 0 48 4>,
-			 <0 0 0 3 &gic 0 49 4>,
-			 <0 0 0 4 &gic 0 50 4>;
-	interrupt-map-mask = <0 0 0 0x7>;
+	pcie0: pcie@5f010000 {
+		#interrupt-cells = <1>;
+		interrupts = <GIC_SPI 44 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-names = "msi";
+		interrupt-map = <0 0 0 1 &gic 0 47 4>,
+				<0 0 0 2 &gic 0 48 4>,
+				<0 0 0 3 &gic 0 49 4>,
+				<0 0 0 4 &gic 0 50 4>;
+		interrupt-map-mask = <0 0 0 0x7>;
+	};
+
+	pcie0_ep: pcie-ep@5f010000 {
+	};
 };
diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
index 75a1d02d39da4..50a07c56faffc 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
@@ -2153,7 +2153,7 @@ hdmi_tx_phy: phy@32fdff00 {
 			};
 		};
 
-		pcie: pcie@33800000 {
+		pcie0: pcie: pcie@33800000 {
 			compatible = "fsl,imx8mp-pcie";
 			reg = <0x33800000 0x400000>, <0x1ff00000 0x80000>;
 			reg-names = "dbi", "config";
@@ -2191,7 +2191,7 @@ pcie: pcie@33800000 {
 			status = "disabled";
 		};
 
-		pcie_ep: pcie-ep@33800000 {
+		pcie0_ep: pcie_ep: pcie-ep@33800000 {
 			compatible = "fsl,imx8mp-pcie-ep";
 			reg = <0x33800000 0x100000>,
 			      <0x18000000 0x8000000>,
diff --git a/arch/arm64/boot/dts/freescale/imx8qm-ss-hsio.dtsi b/arch/arm64/boot/dts/freescale/imx8qm-ss-hsio.dtsi
index e80f722dbe65f..50c0f6b0f0bdc 100644
--- a/arch/arm64/boot/dts/freescale/imx8qm-ss-hsio.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8qm-ss-hsio.dtsi
@@ -12,7 +12,7 @@ &hsio_subsys {
 	#address-cells = <1>;
 	#size-cells = <1>;
 
-	pciea: pcie@5f000000 {
+	pcie0: pciea: pcie@5f000000 {
 		compatible = "fsl,imx8q-pcie";
 		reg = <0x5f000000 0x10000>,
 		      <0x4ff00000 0x80000>;
@@ -42,7 +42,7 @@ pciea: pcie@5f000000 {
 		status = "disabled";
 	};
 
-	pciea_ep: pcie-ep@5f000000 {
+	pcie0_ep: pciea_ep: pcie-ep@5f000000 {
 		compatible = "fsl,imx8q-pcie-ep";
 		reg = <0x5f000000 0x00010000>,
 		      <0x40000000 0x10000000>;
@@ -61,7 +61,7 @@ pciea_ep: pcie-ep@5f000000 {
 		status = "disabled";
 	};
 
-	pcieb: pcie@5f010000 {
+	pcie1: pcieb: pcie@5f010000 {
 		compatible = "fsl,imx8q-pcie";
 		reg = <0x5f010000 0x10000>,
 		      <0x8ff00000 0x80000>;
diff --git a/arch/arm64/boot/dts/freescale/imx8qxp-ss-hsio.dtsi b/arch/arm64/boot/dts/freescale/imx8qxp-ss-hsio.dtsi
index 47fc6e0cff4a1..255b8c91c88cc 100644
--- a/arch/arm64/boot/dts/freescale/imx8qxp-ss-hsio.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8qxp-ss-hsio.dtsi
@@ -38,4 +38,10 @@ hsio_phy: phy@5f1a0000 {
 		power-domains = <&pd IMX_SC_R_SERDES_1>;
 		status = "disabled";
 	};
+
+	pcie0: pcie@5f010000 {
+	};
+
+	pcie0_ep: pcie-ep@5f010000 {
+	};
 };

-- 
2.34.1

