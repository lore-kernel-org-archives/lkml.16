Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11011049.outbound.protection.outlook.com [52.101.65.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 574211AAE17
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 13:15:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744377356; cv=fail; b=FAkO5aHfngSDetMWWgMaC141MrTIakFizGjP/P0rr5kzuz0ZJ9vXlI47syA6eDXxpkdPMW6RYD8rvWtOb4jJLvq0omDFGjKDvmxo93DReeTGzIzwIu82Vw6RsyWq911Odsu9nu+3Pc2VH/9M15N0C2wn722d2SVuEXu8DnADthk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744377356; c=relaxed/simple;
	bh=62N9Hf1pLtId20wyAem1DOQE1WqhH8PsEu2ds8C8GRc=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=J99bmlL/H+SCe8p+A+BpepDY9IAZCmKT/0rcjg5ceGEgBd7zuaGdUsDH19DF339FR7+pcESLefNMAf75juANBGJThidZW4Wpo54WL/RfUcWa/I4hFttzR2ldGKooJ5GoRFPukV/MI3S2CQZ51L0BDFBpEee6VI7oej/s+p3cX5E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=PkJF8FXb; arc=fail smtp.client-ip=52.101.65.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="PkJF8FXb"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=djCR61LmGU5yfVhVZ8vno9zbyv/iMva9ixjTe4ffw6iQosrSuy/fGZgObcoMd7DCQUxZBFZk/vbnJYZvuI3yZrRFCVMRrhM9bMi76798RDr6i5/p0qIkAKgayVz0TgxzNMwJRGpZnxbKDVN3CbTsMGOLM6GWtTiKJsaRFuO3v6O379aRUfURWb3x2nW38SgTGLqpgx6X+9R0gIBFdfwvnfTW9YdTTFLfjLlkO1tcuK78zLHDW9vgZLNEMYaMKkkFHKz38I7hMwCA/GYRtlIyS/ankt5kk2mHsNEYQCLrq19kjJIbyy/gLD0xzheCPtGvouDICzrjHs7PRtqsNiDheg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eErvUzkRXKgVUOWqvzVCfFz52PYjXaJbppG9t9DCIjU=;
 b=tp8x384zZZG6D5H7NS1Ugj7rIfuQUXOuhQpN8hqwV52H9b7JiuvKCz6pzMdaUdxk8tDTsy3L/R2bnfVk1SIAueGBlnL3zb0yCf0VdwXU5c8Q3EjfvaKmCOqBwKf3Fe0HBwgC4yfMO6KD/hrdOn0Xo+z0RVVGUNlS2yuh5ld5Ivr24sA7L1oLJAuSXZRL6c6XSwdzsbEn9ReCuT0SOUyPGYQ6xp5IEP9SUO7CFiFyF58Y7EQWhTyEv8QU48l3pw92KPvvYMg9Ae64OsJmd++OsrTycOZ0NtBP3aUiYr74RwCEfsiTSOVtQ5w+IYgD9nv0wPJg2XtXrp6kUVCME+ekeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eErvUzkRXKgVUOWqvzVCfFz52PYjXaJbppG9t9DCIjU=;
 b=PkJF8FXbHvpZ2AnMbJFEBUNAnb3nS5pi9ToYNgw5Lvt1FgANK/TizKffcfVHMDhwj9oXtJ3Rch+8o777XFLWSGLCYQPtynMZse4dw8TSg78Vpfk3iOD3g1ZV/SakDjWb2sGa2BbtUDnGCO0eCtxIZ8GoGLEup6hlcPEZGfXUfj6lxtPtBNv82o9wAQoCnMLS/MrYh/tS0/TrwhwoF91F28GvBQEditoM3jk7DfzfMEcLCVze58jzfaZJlImYdesN0Qs/1QJEIFf+a3h4xVaTxVjlKItSvQeBmdr0yGY8/lJ4zA6oTC+YD4Ty6XUOLGckMuG/rxYwAV623wUbUTZ0lA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by AM9PR04MB8682.eurprd04.prod.outlook.com (2603:10a6:20b:43d::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.27; Fri, 11 Apr
 2025 13:15:49 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%5]) with mapi id 15.20.8632.025; Fri, 11 Apr 2025
 13:15:49 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Fri, 11 Apr 2025 21:14:10 +0800
Subject: [PATCH 2/6] mailbox: Not protect module_put with spin_lock_irqsave
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250411-mailbox-cleanup-v1-2-8db541394dc2@nxp.com>
References: <20250411-mailbox-cleanup-v1-0-8db541394dc2@nxp.com>
In-Reply-To: <20250411-mailbox-cleanup-v1-0-8db541394dc2@nxp.com>
To: Jassi Brar <jassisinghbrar@gmail.com>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Elliot Berman <quic_eberman@quicinc.com>, 
 Thierry Reding <treding@nvidia.com>, Sudeep Holla <sudeep.holla@arm.com>, 
 linux-kernel@vger.kernel.org, mailbox@lists.linux.dev, 
 Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744377279; l=918;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=1h/hYGrZ9fi5AKuo3qMhUJI1JmurJT+n9QKZo/i0UWk=;
 b=PXL0okxKjMhmJSz8kYLaEnt96xVK8vVRJs6CfvxgPtozgmiMAH53pWbdK2F8yJWlg5f9aDf4D
 Dtt8uf0B/tBCtUqtllA28Yb53oLDdFSOTbvNSDI1Gr7GCRcg6YV98Wd
X-Developer-Key: i=peng.fan@nxp.com; a=ed25519;
 pk=I4sJg7atIT1g63H7bb5lDRGR2gJW14RKDD0wFL8TT1g=
X-ClientProxiedBy: MAXPR01CA0104.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:5d::22) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|AM9PR04MB8682:EE_
X-MS-Office365-Filtering-Correlation-Id: 365df2e7-98b3-4c18-d8ad-08dd78fafa45
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VXBiYWQ2WmVxUkQwT0hXQkM5MlJHSTlkSnQrOHV6VSt5Qk5EcXJkR3lJYU5k?=
 =?utf-8?B?dnBvTU9wZjc4S0tJZFVxc3N0VDk4T3BHVldUMlo5Z29mNTZtVUZTb1hLYXZ2?=
 =?utf-8?B?STVhRW5WNFNkV3locjFDcHg4bjUwNll5TGNuRzRoMjFwZCtyZmFxbTV1KzBI?=
 =?utf-8?B?aGZVN1lrUjBNSEJMZENMS2pWSDl5c1Z2cU56aUZtQTNldlNhR1d5SGM3dm4r?=
 =?utf-8?B?UEhhSjk2d3VCcFEySTY5MXROOHpVWDQwNGh1NmJJbFRXM2pMclExZ0NwN01T?=
 =?utf-8?B?eFlvdTV2MXpRQStNU1NRTGtHeG5XanB6ZlVsNWhTVy9YVlFJZWQvMW4vV1lW?=
 =?utf-8?B?akhHQ2dKNVJ5ekc4OEE4aXgrUEtLdXhDVTNwRk5XZ2FzQUlqTElMWWVHRVNl?=
 =?utf-8?B?U3ZKQ3FOUEZwSWwvY0pKR0wwOGM4TjhYdWJhTlBxbndNOHFJMG1vNklJTnN2?=
 =?utf-8?B?R1pNSEpZcGxSNzdkZWpzL2xXTXFyMzAxY1hCTVNLbWs5RkVRd1pJNTVYdkZl?=
 =?utf-8?B?aGhOZ1hsSEF2N0RMRlo3M2VoZGRaN3JBdDgxZ0JrQjF2ejRGczVRTlVlcGIx?=
 =?utf-8?B?SXVNaHJaVVVJSy9NR1JrWVVLcm0xTndiUHQ3K2REdjdhR0lvRlBKUkpQZ2tU?=
 =?utf-8?B?TVhSK1NyUHBTTk5ibDNjOEdYZCtTbG1UM0RkK0N4YmRoWVdMRUtxcHJnajFL?=
 =?utf-8?B?WGhuaUF2dmZac0VoRWVrcS9aRnAxWUxpNFFiM3ZMcng5bzhCT0h3czR6ajBs?=
 =?utf-8?B?QmEwZ3hoR1VaRTY1d0s0MFNneGxTS3pzajJwRThXeGxnbUdzVHc2ZnI0eXEw?=
 =?utf-8?B?dUNQLzVkN1NZUGdKS1gwcGdNQjYxNlM3eXZGM01VN1FzMUZxMXZ5YlZHOTc1?=
 =?utf-8?B?YUM3ZTFJOERnbmgxZXJ6amlYSHhDOXJ3c1hIcXBiUktUdlN5dlR0TEh0SDJD?=
 =?utf-8?B?WVdmRTkvRXhuNXlYRTBCUFFkTTlMdUVidE5uUTE4bGxaTVR4cUtFWmZ4Rklr?=
 =?utf-8?B?c2xYUHkyT0hRSzNTdG8vYWF5L2xreTV2VGhpYkdQYlVicUQyTE5YRFk2Mzdt?=
 =?utf-8?B?VmNyVElMK2NEd09kdFl0QVdXb1pML242TVRqdlpSZjBHYzZna3BBWlpmcWdH?=
 =?utf-8?B?MGZrQm4yZkNRVkV2cCtqRytSck1IeVhQU2lkWFB6V1ByYVJ0NHRnMzkxQ2lN?=
 =?utf-8?B?RDZTNnRFZGpIbU1MdWJjNTNOL29QQ3VkdXM5bXF2NGZ6cXZvV3NzK3NaSWc4?=
 =?utf-8?B?SHBNZE9wQkwvUXA1TzZ1cGhFK3JzcTl4bGhSQ2lqTFpwOFE2NzkwNW42Y3BH?=
 =?utf-8?B?emF6TVorQ000MERBaW03RnNlQ251VTRJT2tYSmZnS1dBcG5PbDVqMUhIcVpk?=
 =?utf-8?B?YkQ3bHAyZSt1ci9scUlFeXBaNVVPUE14TG5zSUxoWjEwRmg1SFNlQ3RXUTIr?=
 =?utf-8?B?RnhzR0toWmtIeXgvTGRRVWV2RklTbWZheEtCTXlqWHU1d2lUNzFZYTg2VWxD?=
 =?utf-8?B?VCtLYWszTjk1RHNQM3pITjdGZmhEaGpueTlNbGRxVUZNMjU4S2M5UjBkWjR3?=
 =?utf-8?B?WGRwLzhBRXFrMUFVc3llN08vTE92SzBPU2o5OUFESmREWEZrejJQMEpWNHVp?=
 =?utf-8?B?SDJOaC9MQ1BSU1lMTkJOb25PMnQvUGJ6QUhDaExuNUU5TUpUQ0F4aDhGaHJ4?=
 =?utf-8?B?bUIzNUtXbEl4RURXWklYeVJzRFFyYVg3VXUrTUFSNXR5QS80bDVETGM1WTlV?=
 =?utf-8?B?NmgzQndKSkp3YjJOTmZVczA1dDhLRXV4d1kvRW5QMklPTE0veVAyMUFxZnZG?=
 =?utf-8?B?NXI5T0JuMkJ5MDM2ODBBUFJqQVVkN1NEWjFVbVk2U2dxVFd4cHozMWlpck5P?=
 =?utf-8?B?b2NNNjBOeGZPZVVaZnRubUxtOTMwZmFqTWI4OVVFMFBSanhXQnl3YVFrd2pQ?=
 =?utf-8?B?RS9XMFNjSlRpTVczeUw2dVQ1Z25LQ290dHJFVG9jNVljMEY3aE5XRUZnQVFT?=
 =?utf-8?Q?TK62QB6TaTvlhtyGMJbNZSd8GnkIrY=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UmkyYnFpQmtjRG5OdVBNREpBNzFOOGxBejRYT0NCTXd4MVROQjdJNHZXMjlW?=
 =?utf-8?B?UFdrYlBndjI0cTZKQUNvTGNKejM2Nm9qNEZ2aUxoUHR0K21qNU9VN2I2S1VD?=
 =?utf-8?B?a2U4MEMxc3l0d25NK3B6c3E3eDIvRDdqSm1TaWVjSWpGYUpUOGc0RFRrZkd5?=
 =?utf-8?B?K3NxUTdJOERjOEpUQ09KMU1QTHdKeWhERHcrYjN2V2RJM3M0L013WklicDlF?=
 =?utf-8?B?VGZEbTJDd3FDSzJQMzVlSXdUemhWVEh4dm9YWGx2TFVjUWpsRnY2RGlxdlNF?=
 =?utf-8?B?RTFCU29LU2xPU2poY3VLS1RmNVJZL1FLUG85dGxXWFVEdXVER3g2MGhkQXkv?=
 =?utf-8?B?ajJsZXdTUUQ2L0hnUTNRTWFuVE1NWFVVcTN4S3RhOUM5K3ArUjMxaVpsZDlN?=
 =?utf-8?B?emFIc05UNmFrZ2JyY2VBL1BhOE5QL2pZRis4eUdzaHN2QVJ0Ylp6K29RZmE0?=
 =?utf-8?B?NU5vU0ErUE9XMGM5Nm9Hell6Q28vM1VtMEFFcEZNRG40bys2WHk3a3dFMHl3?=
 =?utf-8?B?bFkwdFQwYlJJenA1M3h3SU1DQU1KcFhtSXdBcjhSMVIrajFVcjk2TkhBSldr?=
 =?utf-8?B?WEFXMzFWUStsN29xRWg5RHp0VUlVMFFVUGZzc243TXpUSFQwMnFGR3dvaURO?=
 =?utf-8?B?Rkt0b0ZJUWgvY2YyeHNKUGZrcFBUSVRwam5oRmtpUWFxRm1YdG5VUCt5NGRv?=
 =?utf-8?B?OFRoZzBrY0JDNU5KWVlGcTNmL3cwTDFuYzROZUt3WXNydUd6a3VRdU1idldv?=
 =?utf-8?B?cTYwZHRwRkM0Nkt3aW5mUUxsb1VWN2RYeUNYWkNWSXN5cUVuRGF5Q0lZZFJs?=
 =?utf-8?B?aWt0eXVZTlBSOGxlb09CT1VOdVJoZDB5UEZDMGhvMGVCRzVScStEY1RZaENB?=
 =?utf-8?B?RUNDWDczeE1yU29XWElGZHp6RDQ2T2ZZai90WDk4U0wvQTBSV2JOT1ZPdS9Y?=
 =?utf-8?B?b1l0VTFnZGhpbS9YZGFoaEZkQllaaHVjci9hRDZBb0dIOGN5ODFWZU4wWGpE?=
 =?utf-8?B?bzdTVVN0eXpDZVo5QU1zcXNINExYeFdQdXdZeUNZNGFSL0tZM01QZUYrb0pM?=
 =?utf-8?B?MEdmdFF1eDVEeStDT0g4eWM4SVlWWHFRM3lCYklhcWRZWmNiRllteWlmam54?=
 =?utf-8?B?TGZXK1ltRHpjckRIL3ZYUFloNHQrRWNxNkU4TGpsTmtSZUpBYTdaNWFROTl0?=
 =?utf-8?B?S1BHcFdjejQ2U2VHdjlnRmhURFdyeTFPVXZSRGNJd0Z5YURnYkZYMGNhOXVk?=
 =?utf-8?B?cm5wSUdOVmFBZGFwUUdpcDZLcDNxaDVZRE5hTWpLbGMwcFJGRUtCazVJOFNQ?=
 =?utf-8?B?dDVJUGI4NktLajNwN1pNbjdaQUtCRS9YNzNQSFNtZmhueWx0ZGIyY1V5Q3VX?=
 =?utf-8?B?MmpGVitaaHlpRStrdC9kbDNETjYwUTB4S3p6cmNUZTBOampmREIyZW9WMWJW?=
 =?utf-8?B?UHJKZ1ptSVBvVXlqbktPRTB4djIwbUdNcUxCZzhKekZTYW1wYW1lSVNoeGo2?=
 =?utf-8?B?QmtzS3hrckRBWjJGZjEySVUzN05aaE1SdUJPdkwrSldkV3lTVmpSWkc3WXFD?=
 =?utf-8?B?d2pCQzhwdjFjL1ZidkRaT1VWeDZrVXdrU3p0UmVSUjFWZ0hhcisrNUhXS2xP?=
 =?utf-8?B?OXAvMlM1Mi9YTkRwN3NqYzJWVk9hK21yVitkR3ExdmlKRjFmUzJ0V1dYYk1p?=
 =?utf-8?B?bjFON012VkRnblpBVytycEJQUjRJc3djZDhRQk9uMXpReUcxenVxYnNrSHNl?=
 =?utf-8?B?eWNPNWJVYmVLaGNnZ0pvUzVmeTZaZ3docC9UaEUyeVQ1VDhxQjRXK3F2T05q?=
 =?utf-8?B?ck94Uzd4WCs5QTBlc1p0R3dQTHB0TThMNHZubitYZzNZVk5PSFcrdEs5UjVa?=
 =?utf-8?B?WTBENE9lWi94R3ZZMUI4ZGFyMm45ZzlvM0MySzc1NWk0UjFpTXZPaC90bTMz?=
 =?utf-8?B?NFowdFp3SXgvaGl6blgxU08xYWdIT1lWUWlpQ1JXd2hYSjUxVGhpc0tFeWxL?=
 =?utf-8?B?K3ZQQllMSSs3YW9MT2JNUkZob0NvTUpBVjR0UWNBL0pTaUNBaE4rVjdyVVIr?=
 =?utf-8?B?K2VYM0FuWnFXZVhxSk0veEdweVhtT28rTXg2WGlWdUluejBiNGJ0QmdzblBq?=
 =?utf-8?Q?5Y5A2e5OK3YmbQuSBamtFvZtx?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 365df2e7-98b3-4c18-d8ad-08dd78fafa45
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2025 13:15:49.4717
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TOeVAYDbyXR0kdJRzxVZHky/D+mUz2bf4cdilmzkxjK+6BWXiLrfrOek4wbhDHnGudlyPWWy4AGlTmmaLOQfPw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8682

From: Peng Fan <peng.fan@nxp.com>

&chan->lock is not supposed to protect 'chan->mbox'.
And in __mbox_bind_client, try_module_get is also not protected
by &chan->lock. So move module_put out of the lock protected
region.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/mailbox/mailbox.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mailbox/mailbox.c b/drivers/mailbox/mailbox.c
index e5e2a66355a712e71a92e4ad339e99d7ff8e34be..3ecf92a580fef031d8add5e4c2e4df494a34010a 100644
--- a/drivers/mailbox/mailbox.c
+++ b/drivers/mailbox/mailbox.c
@@ -486,8 +486,8 @@ void mbox_free_channel(struct mbox_chan *chan)
 	if (chan->txdone_method == TXDONE_BY_ACK)
 		chan->txdone_method = TXDONE_BY_POLL;
 
-	module_put(chan->mbox->dev->driver->owner);
 	spin_unlock_irqrestore(&chan->lock, flags);
+	module_put(chan->mbox->dev->driver->owner);
 }
 EXPORT_SYMBOL_GPL(mbox_free_channel);
 

-- 
2.37.1

