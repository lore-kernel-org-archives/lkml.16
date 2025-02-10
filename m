Received: from EUR02-VI1-obe.outbound.protection.outlook.com (mail-vi1eur02on2094.outbound.protection.outlook.com [40.107.241.94])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B04C31BD9CB
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 08:21:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.241.94
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739175679; cv=fail; b=mqLuXT9q36S0DRLV/Dft8H780xaX2FsgeGV50sxGR7eRbPaD9WJb469B5p88lISldo6n5ICRoK73dVf4FcQP1jOuTTQaNW0fUFaSkk/9ePPYHNch1uUHQkdpuEVwWlJAJb7I4P0t7Hsh0wFurMxL6iknLJeQE49z3M4j6jxESXg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739175679; c=relaxed/simple;
	bh=M/xw/QxtEgb8RsQz3iSXA1VjCj/bpYyWouy4/ynzSSE=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=e7qVGSdupRMmTY0bsub5faiecpFA7lKRfowqFa5q4513EMAe2kKwVVLmlfeUsWo05/VKgzEHEBGn1ZZWoTylm3BBAn0MQhMGMzMOVkJZJuQfgCSdWEuf9tRrmkTbOH2FM5/6LOzdhZK2Lzx+hIX5yqcduiRsB2nO5iYW/gK/5iE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wolfvision.net; spf=pass smtp.mailfrom=wolfvision.net; dkim=pass (1024-bit key) header.d=wolfvision.net header.i=@wolfvision.net header.b=C+Is3YmG; arc=fail smtp.client-ip=40.107.241.94
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wolfvision.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wolfvision.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=wolfvision.net header.i=@wolfvision.net header.b="C+Is3YmG"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WC/ru9Jh9rv5x4R7v1oNhGsNDWVDCj9WGWNiH2kGHqin8UnCkL5289dX7BMBmJSL12LV0253Id0kstjCYbE2Cl7NvFG3cLWqdr0c0nKAGrPPaciY2USgLpm8JmDQohnNQA75bA6y9VycHTTUB82pjlrnKib7xUxiDyqOS2UtLW4yWOKzj7JC7MepzOS30orrzwSWLZWkAl3Z3zp3Df67aDpWdkftST0T3weJ/mjy2ji9oOG6W2CGstzY/qgUbAH5RNb6motl+KP4eCHjhyhWy47gg7Jmg8waTdoZGUE4UCwrhGeKo1E8c3Eqt9vlm4WCjWPCid/PtNz92ondDXiMXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sZSQqbM09NFfrpPrpS5+y1uuMrKKZ0qL226J7aS4p+g=;
 b=PIlno+YAEOP+2SDw2xofvgBvAhiSH6CmYYxfEgx8Dm7j25WNUqhC5V3w7Zx+nBdRPZ8373qDdHZ+vxn7TYCL+1s6uji/0SaLLo86ccCC0qQCBlIHj4ixL49ozhVmbGUm4OxqDMxGtkm8v0q8HsgQqtE/3zjfzX7Tr6asI7jnXddJCvNxy+s2SLvMuCXB6rifirkn4m53gXiQMJ7DORsdhkq2ZgeSg0xBY2IKs4yAYnZPY2Ey9zXFXyYVeGafV/WSNa0cGA9sRpZy7WG4yhsCnrywa1NZUTpGp/3CIG4UC6GXYn9Km6ZNIGn3LF4xpPP/Z+WDqAEbJpREniKKVTNGYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wolfvision.net; dmarc=pass action=none
 header.from=wolfvision.net; dkim=pass header.d=wolfvision.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wolfvision.net;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sZSQqbM09NFfrpPrpS5+y1uuMrKKZ0qL226J7aS4p+g=;
 b=C+Is3YmG15GFvjVWqgGqsL+qSz6Uxk83E2qPZR29X35HO5A6iD23OIZmtOmWkUCMW1SbWRjAuIMGdVmPIWX1/SpFfTl/Tn9xYShYc+c2InyXedlvbTU0SyaSFYe3zvoASoVfAkxydoRB0G+IJEJJMczCBI6RPWUGGivXYfjr7rY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wolfvision.net;
Received: from DU0PR08MB9155.eurprd08.prod.outlook.com (2603:10a6:10:416::5)
 by PAWPR08MB9470.eurprd08.prod.outlook.com (2603:10a6:102:2e9::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.18; Mon, 10 Feb
 2025 08:21:11 +0000
Received: from DU0PR08MB9155.eurprd08.prod.outlook.com
 ([fe80::4e72:c5d4:488e:f16d]) by DU0PR08MB9155.eurprd08.prod.outlook.com
 ([fe80::4e72:c5d4:488e:f16d%5]) with mapi id 15.20.8422.015; Mon, 10 Feb 2025
 08:21:11 +0000
From: Michael Riesch <michael.riesch@wolfvision.net>
Subject: [PATCH 0/2] clang-format: format short enums and macro definitions
 correctly
Date: Mon, 10 Feb 2025 09:20:59 +0100
Message-Id: <20250210-clang-format-fixes-v1-0-9bcf43a4b4b2@wolfvision.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOu2qWcC/x2LQQqAIBAAvxJ7bkGlovpKdBBda6EsNCKQ/t7Sc
 WaYApkSU4axKpDo5sxHFNB1BW61cSFkLwxGmVYZrdBtYjEcabcXBn4o46AbT15R1xsPMp6J/iD
 fNL/vBx8DC/9kAAAA
To: Miguel Ojeda <ojeda@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <ndesaulniers@google.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>
Cc: linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
 Michael Riesch <michael.riesch@wolfvision.net>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1739175670; l=608;
 i=michael.riesch@wolfvision.net; s=20240405; h=from:subject:message-id;
 bh=M/xw/QxtEgb8RsQz3iSXA1VjCj/bpYyWouy4/ynzSSE=;
 b=9UJWcSvGyuTH8quB4SN82pFxrHq0T61MYTCetN8MF6yb+OTmFmf++Q5EFj/wxg3Ad6k5siYIz
 cl3PiMd9LXhB/dctEdHnFR0efwcR4qy6ESI9XQYKhdhdWpOGpN3DCSR
X-Developer-Key: i=michael.riesch@wolfvision.net; a=ed25519;
 pk=cSJmgKSH3B6kdCIDCl+IYDW1Pw/Ybc6g9rmnUd/G7Ck=
X-ClientProxiedBy: VI1PR0102CA0055.eurprd01.prod.exchangelabs.com
 (2603:10a6:803::32) To DU0PR08MB9155.eurprd08.prod.outlook.com
 (2603:10a6:10:416::5)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR08MB9155:EE_|PAWPR08MB9470:EE_
X-MS-Office365-Filtering-Correlation-Id: 6f26689e-b2c3-46f9-2bd8-08dd49abe03c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Z2NsaTJFbFRLNVYvTDFzY0N5UkNRdnU4b0RQZnUvZ2ZjQUtRc3lKQkRNdDlx?=
 =?utf-8?B?dDdOb3RMUVFXM2puT3pmbFFDUGI3SWFqeDdsNUVIcnlHNitqTVJ0eWhCOFI1?=
 =?utf-8?B?UmFDTUQxNlRBZTVsVUkrK2E0ZTdvblFuMlFKOWo2L2hlQld4ZVhhcFR6TDJx?=
 =?utf-8?B?U0VlZ1BCUGZ5eHJwbGJMbTFNMmF4eWdOc3ZMRnc1U0JnMnRic2o3VzN2cnhm?=
 =?utf-8?B?TjJSUVcyOHorUVNFRUhPL1NnQkthaFB3Y2ZDZDhXRWxsa1BBekVIWWdTeVBS?=
 =?utf-8?B?QmVxUitueS9aQVRtWnNKMUZSSnZCdlROZE9hY0hyNEtVeDI5V0NIeXUwOWNT?=
 =?utf-8?B?RXJyVHUyWjFZTWtBU3JESkd0Z21vcDJoZE9VRXpNRzhWVDZHeTNZQUVZWFBt?=
 =?utf-8?B?RGMzMzg5SHU3aEJIcElMZ0VkUG9UVk5PZWtKNElYRkd6bWl3ME5KVU9CR0Vj?=
 =?utf-8?B?L1hhVUNjWFRrN3U5RVlZQ3ZDQU9BdFUxVEc1T0VWMFdOWG5SRjFxdnlRZUI3?=
 =?utf-8?B?VmxDay9WeHNLbDRoS3BLSlpJa2VOS1JaNmZwMTFGTUZnNTlMdis4SmJ0YjRV?=
 =?utf-8?B?VURxKy92Tkh2WFlITXJGM0lINHdCNkFUeUdRajRBVEhUQ1VSZHZFcEFCM0c2?=
 =?utf-8?B?N1Z5UGVuZjJVWitBd0d4ZFJ2OUR0MkRRZXNPdUNvd25NSmpXQlZ6bld1cUcy?=
 =?utf-8?B?U2lWTVd0Tmo3Q3JaTExNRktkem0zWnJwb1NnS25Wak1ZNG1hajRqRFpJRUNJ?=
 =?utf-8?B?WU5tdm0xVHVycndMYS8va3VJQjdtVHBwN0FYUlA2T29IM2ZMWFErZFc5Wklq?=
 =?utf-8?B?TU8xd3ZMcW9jRURRUjI4WUg3Tm5yT3Qvc3p5Z0ovd1NZN05sYzJkeFM4T1Zk?=
 =?utf-8?B?bnBrV0xuZlZvOFhDaElaNDJRSm8rOUZUdm5La2RuelQ3KzhBVDc1Uk9FVWdp?=
 =?utf-8?B?MGNhaE1ZN041T0ZTenFWNCtvWVdmSWFRWEhhbURLQTgyQitxOGxLNG40Z1E1?=
 =?utf-8?B?RThMd3EzZVArUlg2Wm5vcnozemlGM1ozMHJpdWVTUm1XWnY5OGc0VnBRZkFj?=
 =?utf-8?B?WUxvMVdLSElXSTErT2wxcjZPOWpxZE9ieHJPZGZDbG5XYmVNS2U5YlJHbGVz?=
 =?utf-8?B?Qkd6YWpTeDM3SGlCWGNqejAwVXBqRmJVVFlYaU9ONHlmZ0xhc1YvNjRZVjJU?=
 =?utf-8?B?N3ZSR2QxeHNYa0xNRmwrUDFQeU5HaHFzUzJ2RzZUZVFwM1JScHRYeGhSZTRC?=
 =?utf-8?B?RkdjVjA0N2VxVjdxTkpjUUU4UjQ1SFU5dUNsOThieGR0eGVIKzFtK1hwcUo4?=
 =?utf-8?B?RzVMcjAyS3dZUlZzT2xtRW4yQWtnSzQ1QjdSRDUrdmwwbDZFRjUreDRXaVZj?=
 =?utf-8?B?OWs0aE1Jb0M5YnpDWjBOU3pVd1dnbmxnSUltd1FqMnhQOFdGdGZVdXhSMnRq?=
 =?utf-8?B?NzF2SzdSUlBGYmR1bW80SEo0MUpSMXJ0eFEwekNPeHZ3VkMvTEtsZTZGWGsv?=
 =?utf-8?B?S3hCWUREM01IVUw1QjcxdmpDSDVCV0YyYUxoakVYRm1aUjg3Nk1jd2I4SFcw?=
 =?utf-8?B?Z0NMazVMQ3hrS2lrMWd1a1ZEMXFtUEJ0dTZiWGY1OE9KWHkyQlhpNFExNjJv?=
 =?utf-8?B?MWt3QkE5TnU4V3pCdVh0NXV5Q3F5MWJkYkQ0eStTYmtZK0I1NkdvaVN4VkhV?=
 =?utf-8?B?YmhrRWk0Qk92YlRqSDZCNm5HcUFIbGs1WEVQQ2cvZ0ZJQWJTL2xiR05kbGY2?=
 =?utf-8?B?b1RpbDgzd3c4Y01XVkE0dHdMc0RBemdldFVSSG8vKzN3QUdYYnZtbG50UkdG?=
 =?utf-8?B?UG5sRzJRekN4bzJ4RHdnL2dpSWpGWmVFRFRTeHowZWlKbjkwSko2VDRhT1dM?=
 =?utf-8?B?T3BSWGlhdGU5eEJmYnRnTEpQVW9BRldxUkVkbUVYczNlSHdtQ1ZudkxlT0o0?=
 =?utf-8?Q?O2FXqKaMtAgY1Fg78DWSMX7UmsabOiFM?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR08MB9155.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TzlTK3QveHlQMEFVdk1PVmlVZ2dDYjRORmxQZ29rRGpsc1hMaDRJVHA0djZn?=
 =?utf-8?B?bHJkcFRWRHd2VkU5QlNPU0tmTUhySmZiL3ZlNm5lZkxDOENaNGlVemZUbUts?=
 =?utf-8?B?UGlQaklDd24vRUpLMlNYWXRKUXRtQk81WEgvSk5WdXppKzZoRmMvQTZZQ2Jq?=
 =?utf-8?B?YzRSd3llbzBibTNVOGl5OERUWHIxaGtSeThPWEFUbm9Oa3dqTnlsYlFSc3dL?=
 =?utf-8?B?MExKcHdJUUR3UHNRdHpIbnVQL3haZlZpTHExWkFtZXJEcjVDNzRtVG1VZjlZ?=
 =?utf-8?B?TE1ibG5iTW5MMEV5K1d6aUdJRlpLR3Irb2FnWEswN1ZPeWdOZUVmNHplVkUx?=
 =?utf-8?B?NklUWExMTUNHZk9sSWJEQTFQV3RWQTBrUGttaEpVRndrV1RJR2hFbEszK2lQ?=
 =?utf-8?B?VDVkSkVTaUEzZGpSanZpRDhZWEZSY0VmNFZucEloM3VjK0lLSUh1S3M0OTFv?=
 =?utf-8?B?OW8zQnRPV3J2T1FlVTZSRnBXNXhDZUNSL0p0aG4xTUlUY3J5Vnp0Z2ZpRHlq?=
 =?utf-8?B?VlAyYk9TKzB5Mm9STUc4Rmt0MWI4M3RZVEtBVDFXTm50YW1Pektod2U5eGpY?=
 =?utf-8?B?RWo0U3E0blNnNm45alFPRE00YmJsUVYzbEgvSGM3aEZ0cXpiTXdYQTI4eWVS?=
 =?utf-8?B?MnBrclVCdHA4VkNkS3NLb2FXejBpVU1rcnVpMllSLzd5WHVVSFJvYWEza05v?=
 =?utf-8?B?cTNZRjE1czZOaU0wM1FRNTRoRTVHMXhNOTk2c3lNUVpMcFM0THc2NGJ0bURx?=
 =?utf-8?B?U0NQY0RlQ3o4UExNaHhUWG51ZjNTRDN4YkJYd25aNW1URVJRUUUzdm1Reit4?=
 =?utf-8?B?aEdJNnovMnppOVJBWE5tQk41cG5HbjQvNVBLQW91bHIyZEhGZ3ppdHZ5TXFa?=
 =?utf-8?B?c2RLVTRUdk5JdW53ZFA3SGVVU1Z4b3ZPaSs2RUIweCtoenNYOG1NSG1Lemw1?=
 =?utf-8?B?R1RiNGhUYkpNNU4rZFBYcFJnL1JZTXRVR0xNOTNlNlZ5NDQ1Z2lYQWU0Q2Vr?=
 =?utf-8?B?bFRqSi9PbVh3WWxKNkFISGsydklnaWZPcHRlb2hmcjRKUW9PcmRiWXNnNGNN?=
 =?utf-8?B?SGlWMWRlRkFWU0cxUWR6by9hQmdFVmErSm9qNE04UXpuU3BWYkQ2S3RnQ09P?=
 =?utf-8?B?Ymg5Z3J4OUc5NmErNGVoUmtMWmlXRHRidExkcVhvVjdCWEplWmNrWDkxUCtu?=
 =?utf-8?B?SmZidjdRTTZ1YlZRdEZlMUNDSG9TTFE3ZlI0bTJxV3JyZk9kU0RnZmk2VlpV?=
 =?utf-8?B?S0tqMzRoaXFJZE4rYnNYcFl5dmtWOEpxaWtGajJCb3FDSXpwTlkzN2dxVDBx?=
 =?utf-8?B?SVVCN3NENmE5S0xNYzdobEdwZ2gyUHQ3b05WMmlDcndWbGhmcnpNYnIzcGdM?=
 =?utf-8?B?NjliYld1RmhlQW94TmlqQmpqYzFGWVFKdEk1TUQ1aWIvdWg2eHAyOFJpb0Fn?=
 =?utf-8?B?dEhGWjJFY3hKMXZHc254Zlg2MjB1SXdISGJsdmV5eVNQR3kranpRbEZFYjg5?=
 =?utf-8?B?TWo2YVV0SGp5cHplWllFMWh2THMvcHJ2eVJvandaallZLzRBMXl1R0w4OCtC?=
 =?utf-8?B?L2JxYjlwK05wNDBscmtEelBGb2JIemp4elNOdkRENVFDbVJwRHpmK0t6VUYw?=
 =?utf-8?B?dWFkMkdlRUNlVzNXeU1aUWREQ2JTeVNlRmttcll0Unp1SEJSU1dIbFBJdDRl?=
 =?utf-8?B?c0pBTE9KY0lpcWNKRzFKRlA1VWdqU28yb0Q0WVpPdy9IZisrVTNOV2IrR2lS?=
 =?utf-8?B?azZINTRuM3p0STNvQS9UVllSdW4wT0xZelVPWjZkWTRVM0FQRHpXSkZwR2Zw?=
 =?utf-8?B?bG9mekFicVZuaW94OC81YW1QWHRudXJIR3ppK0lOSDdKSUs5Ry9IYW9hZFUw?=
 =?utf-8?B?ZnV6VGdab2RTZDdMU0lTSXlnZG1aSEpKUllKTDV2bStZMHpMM0psR2VsWU9v?=
 =?utf-8?B?UmxMdjNHLzhUWlFhYXVxVHFWVEhsNXVlWEpnTlh3RXJtME5yZXFFekd5NmFR?=
 =?utf-8?B?MGYwTnJhdHVtbjJtS25KSUJwaHNNeGFZeUV2U1hzT3MyT3RyNzRtZHN4VVFR?=
 =?utf-8?B?T2J2N2dVTVZ3NitpY1dUZVArYldZUHlDQy9UV2FjNEFqYUMyRjBoSFpGclVz?=
 =?utf-8?B?SGVWc0dEWFlURTdiQ1VrT0tOWlY5UXd4S0lCaFNCeStOK1RZT2pEQ0QxeWFp?=
 =?utf-8?B?ZUE9PQ==?=
X-OriginatorOrg: wolfvision.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f26689e-b2c3-46f9-2bd8-08dd49abe03c
X-MS-Exchange-CrossTenant-AuthSource: DU0PR08MB9155.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2025 08:21:11.1292
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e94ec9da-9183-471e-83b3-51baa8eb804f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LtcAA1N7eKi8bIeXN3kx6y4foKnu5pffdCsDrCuHv3a/C9tKBqQACwuKEsYZm69bAdc9LJxospg37025rKV4VeGAW5qQ27oB7zG7DcCFMsU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB9470

Habidere,

These patches set two previously unset clang-format options to
(hopefully) sane values.

Looking forward to your comments!

Best regards,
Michael

Signed-off-by: Michael Riesch <michael.riesch@wolfvision.net>
---
Michael Riesch (2):
      clang-format: do not allow short enums on a single line
      clang-format: align consecutive macros

 .clang-format | 2 ++
 1 file changed, 2 insertions(+)
---
base-commit: 2014c95afecee3e76ca4a56956a936e23283f05b
change-id: 20250210-clang-format-fixes-914ded0e682d

Best regards,
-- 
Michael Riesch <michael.riesch@wolfvision.net>

