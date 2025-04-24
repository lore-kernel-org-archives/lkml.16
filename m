Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2051.outbound.protection.outlook.com [40.107.21.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDA2513B5A0;
	Thu, 24 Apr 2025 00:41:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745455319; cv=fail; b=Xl1PFAqWNHE3StX7WtJYzXyXfzL/fW4PsZ0zWEZzKbpN0OQXghZy27TYiez8HJyZaBSUSOgMH8H1YVhniLkKvUykIoG0WLSsuQtnIL6IWBZQkm/leYrwSnpq7G9jHBNUQAQmjxGAPxYt13WOKtG8Djbjf9E8M5Uj8+V7OzeG7T0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745455319; c=relaxed/simple;
	bh=1DqlLGg1ovHjqQCcJEV0D1tKUYq9HtRbAkWYIjmhJbw=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=WsbLWFySMxKsG983k5G6q00FamkbtzmhRXH0g/alh1wX3gjd9rQfD+8/VrJn/rMdWqHqExYOeBeXF1ZEo0nrMhkmhsRHejc/qO4rvI+wEtGgLVEzwPXOd4buJIu7A9cbOkH9oYe+WLrTZh5m6e5AUbGUR51lhAj6RlcW/aM313Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=OXUkCHwI; arc=fail smtp.client-ip=40.107.21.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="OXUkCHwI"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eZ1KMXEi8DIHK9DhsiXeWZEhqTHwqdKNd2cfz1tHGfQcTIYitW+zzvGubEhTaWsSXvhoF7txUyZ2NAGtJKpttgQvNNxFIr9vqdQTapZUqcj6o9uQQscEzdGVhrc3js3cvZMrqs2AjmUR2ILhdAV5/jUkhiytGkQ0Gpo2ScZpfSLVT/iZIwoacLowroPVLYmaYbveFI/hGM+Z+9HN2qxo79/mxWr4VBY1Fx5q1D+VFbPuNhNK6HFE9Spba3j3tq7IONEQgk1RTnW5yrE09lSA51M0GMlA35ExNj2W0iKLh7drYURscLNFqSci0TiOPogVbM9Ym3WM92fGL63OEUkDdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EdCZGUoHIU3FjGom6iUNE2NlfkLEhe1qnZT+t+3f70U=;
 b=eU13vdABdVkRgANWi4ve8UyNZQteXQ6kqPhVOegHTGCOBfLk6l7XIR50375QO7sDq24PzPoWF86vp6YMFIvyBoyFk/g1S1eNbAxkhweiR+VmlopviaH7ipldcY3GldJ0/A0GUnH6A3kMWnQSvKyZHpCPKZnzZU/4V3hhd6frpANZO7PVwfVyPEE7uFSuYokvXXwjMZ7htT0S6jdMA5CIAdKnzRm9jf4gQ7amQZR+ucSRat2l/GEfqeBxF4OEXRhO25Cg3/2dNOy6rlXU4MNjta+2ojkN9bhntTE30CWJks4txuHq5PQPNwtcfjEfqCItr0g8ym3wq9p5ZKojtkHtOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EdCZGUoHIU3FjGom6iUNE2NlfkLEhe1qnZT+t+3f70U=;
 b=OXUkCHwINS9pWdNgG9PSycpcjuMC86ZSBA7iXD7BAqhOn2Ui0JKTtoDkoDZT5s4MOTm1Y8hnPZGBPftylGWUOzq7RAMy8buSoNWi6V0R9x8BL52pf92xfI7BxSJ/dwPyxQ67qXTUN8TVRwO6nzh9UjC0NXdyxXX/U34nhhgoc18pTPXRQqCcj6sJY9m9Nds1+66mOGj/7ydAMXA2JBFc7vy8K1qaUZKgSfuVcYEUuRc+4qnAdSdMxOaJWpZLAaxltjS/Z34yT12sVVTfK+GohHDeooAj7jRe+nebzAjrKI/QAILipHIYW4FnmV/qhqxxnBqn9PyUoObpf2Y2w6aGOg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by PAXPR04MB8605.eurprd04.prod.outlook.com (2603:10a6:102:218::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.23; Thu, 24 Apr
 2025 00:41:56 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%2]) with mapi id 15.20.8678.021; Thu, 24 Apr 2025
 00:41:56 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Wed, 23 Apr 2025 20:41:26 -0400
Subject: [PATCH v2 4/8] arm64: dts: imx8: use common imx-pcie0-ep.dtso to
 enable PCI ep function
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250423-imx8_pcie_ep_dts-v2-4-43c982d83a8f@nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745455301; l=5205;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=1DqlLGg1ovHjqQCcJEV0D1tKUYq9HtRbAkWYIjmhJbw=;
 b=WznwIw/BXNDYuZblsomvF24Ri89yiQ2sbdAr+2GAmj8NNkZ0TMGR9wQJpX4rUeRutUhk6WdbW
 FO0dMSetLVsAH+/Z2WSGFBIgL97EhHY3yDBlLwrcz7aOT6GTiaqBDch
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
X-MS-Office365-Filtering-Correlation-Id: 17f7388c-eb71-4ab2-55ec-08dd82c8d0cf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|7416014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?alp3Mkx1ZzROSHRVQjJlWTc5VlBhK3pJTHNDRExzOW1jYlJ3RnptU3NOZDZH?=
 =?utf-8?B?Ujl2YURCM3RxRXd1dzBtTzIzTjJSZEU3V3ZMcWZxeURna2Z6T0JPa0ZObEhn?=
 =?utf-8?B?MWMvTWMvQ2VkczdWcVY4MUoxMm1VNjJoSjg3VnNHNWNyUE5yemN2VW91N2pY?=
 =?utf-8?B?REtLVDBUYjNCeVJGaXlVZGF0R0hlbjlkU0tKeUlxYmdsaEV6dWF5L0tmVFRR?=
 =?utf-8?B?amVxRWplTlVYYlhKVVFxM0NyZmdTTFlyYVAwTDUyNTdaaExLalM1eVJMT1ds?=
 =?utf-8?B?WEIyNjEyUGlCY0RWaCt2RkdmbXlIU0ozcEhnWWxTejZaMFVNMVUrOHZpWHdh?=
 =?utf-8?B?VkUyK1B2TGJqQjdxQzE3NmJwTlcwWVBQd3EzV1RXZjJEbGdnNGtIS2RkQlRj?=
 =?utf-8?B?Mkl4WVlNZ2E3UlRKR0UxV1JhUnJJa3pGZmRacHZxbzM4eGk3Y1ZhTHI5Tnph?=
 =?utf-8?B?WUo2aXdsSllXeldSMkplRjRvQUlaV0NGc28zVG1ucUlPZUhYd2djdDg3VXFt?=
 =?utf-8?B?TTljMlROSDc5OXpSL0FPbkZEcFMyV3RvaC96cUxya2JoMDlrakRobzZCL3dh?=
 =?utf-8?B?ODM0UTNxa3ErV0FIWHlERWtaQUdQcEM0Z2wrUlBrQVMwRk1sY3lMMldhSm9r?=
 =?utf-8?B?aStKUDNXazhUbHhlbmppdkkrY3JzUHg3eEcxRTd0bmt1ZlVBYmdjVHRpQzY2?=
 =?utf-8?B?Q3NlRWkyR0I3T2pqbUZ5TzZYTHNrQkNuZnBEWkNxSlI0QmlhV0tLY1Z6VS8r?=
 =?utf-8?B?ZmRaLzFYM3J4Y1dsQm5LdDVUZkVKUDBoZXYyUkd5TXMzUlllSmhCOEdieEkr?=
 =?utf-8?B?WkpuekMxRGxzRW5uU3VvMklnV1ZoT2RuWUdMdDZwZWsvU29VUVJ6TmZWZHpY?=
 =?utf-8?B?SGtxVjdSOWtLY0M0a0dqM2l1c0pQN3NjVHFQNUlRR0VmRE5ZTTJpamRWalZk?=
 =?utf-8?B?T3dFYTkwYlVZbk5iYytKM1k0UzVhL0dDZFJoS3N1Y2dYZEV5Y3FZa2pzSUlw?=
 =?utf-8?B?SjMvSWhCVG92bG40VWwzMGp3T2MySXVmTU9ZUm1OcUFUaVRxdUJyWmNveU9J?=
 =?utf-8?B?azl0eTdIUDhFSDh1MkZYOFpIZm5yWjVVc2M2V0dnUmVIS253K21QVHRxS2p6?=
 =?utf-8?B?UjBzay9JYzJiaDFnNHFJdXRJUU1zT290SjJ5UnJzOGdyUm52NExyNjB4dWxE?=
 =?utf-8?B?bzYvZy9XK3VOdmF2eEdMWms1Ym50ZVBiVFRRWjg2REJESXliUlVlNWRQZzRJ?=
 =?utf-8?B?bVBTNEwvODA0QWRVeThWMWdHNW9hMGVrdzMwVWxuL21MS2M4anJUQlIyeGZh?=
 =?utf-8?B?bDFGaXRDd0lCeDE3bWZKeXhyRmI0K0pKMGhya2M4RFBNOGtmaTFqdUdQQlhT?=
 =?utf-8?B?N0lwdlQ1eDQ3UFRETkEvOS84dFA2MllsU00rVEx6ckZBY3JiTkFHOTlaeUhF?=
 =?utf-8?B?Um4zZE5odDdnRVlKdTNMZlJna3EzcjArcFgzc0UxZVQ5amtKaWNkYzFqWW5U?=
 =?utf-8?B?N1BLcytiNkJ6dGI1NTlhRnhpaEpEdVl2UVRTeTg3WGFBWHMrR2ZuK0FvQkdq?=
 =?utf-8?B?K2IwZU80NlJOZkduN1FxM0pRQm55MjRyN21lajBrcXIrMmNwOUROVDBuNFRM?=
 =?utf-8?B?M0MvRjNLUkpzSjNXckhzRTh3d3ZwWThEMjR5R1hSQVVGa0FNeW01WEdMdWw5?=
 =?utf-8?B?WDFCQXRmbXdMRmZWd2pKcXovWitMTDJoblh6bGF1WnBEVjBOSTZ3eEpSMDBQ?=
 =?utf-8?B?NDROQTk5VGlyQjZua0ZXaHlEQmxEN3g5REtOSExGYjlUOWpEamFyVDZMYjFi?=
 =?utf-8?B?c0w1VVRPMjhCUjRJYWNya2RVZkErdk9GSGJFNW9Lb29HMXlvbEp5YUtHMEpM?=
 =?utf-8?B?ajFJTWFpUWoxSjFwNGE3Nks0OXU3dkV5dkY3ajRhVXRtU2txWjAwYU5XQXhJ?=
 =?utf-8?B?czN5TWFRcnQwYkNaS0RJcHhFbHJBYk9uY3RkMHl5Ny9IcVdLSmo4bnJlbjRv?=
 =?utf-8?Q?jTPe9KMi33T1QKU2iueUiQF5Ajqs2k=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(7416014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RnJqNnprc3hqTmg1L3lCVW53U0tZbExKT2xDejJSNjFjZjdyR0ZtYzhTSVVZ?=
 =?utf-8?B?ZVZmS3lnMTFYUE1XNzNwaG1NbkQvU1BlYTQ0Tkt3R0d2bFNoU21kdGdOeUdq?=
 =?utf-8?B?ZlI2bXIzVlU5eDVoSlh1VHMvUldZUit3Vlk5VElMaHMwTWdJREVEZFg5UCtl?=
 =?utf-8?B?bGV5SGU5WEk3ZmJsZlNIb3JqcnNkcTd5OUtkbVJDQTBOeXFXdXM0R3plMHc1?=
 =?utf-8?B?cmlNZXpWWlF2c3RJcGNEU2pkMGRzKzRqRkhJbzgvTlQxNUwwV0Y4SFRzdDNM?=
 =?utf-8?B?QTF1ZFFQS2poVFgrU054UnY0cG9mZFVSZFBiMWVPdStUVS84VS8yM2lhMlEw?=
 =?utf-8?B?djNsU1pmNUM3TW1DK1o4SFprc2Jwdm1tQmd0Y3JhdzJOQ0RzZm1ZcUEzdmM3?=
 =?utf-8?B?SFpWT1NYa1dHdUVFZGNTbmFKbnFsaENhUnVCaHo2NjdybWtvclZHc0pNekxn?=
 =?utf-8?B?MDZCWFIwOWhFTDJ1cktmeGJNR2RuSEZ1TEdzWWxybXBRcTF3QUtpN2taS0VO?=
 =?utf-8?B?MFVYdDBFZ0ZjMFhNQWE5R2tVelhROHNFb2pkVXZlOG4vNUJaemdyRjNNdUN3?=
 =?utf-8?B?YVFLZDcvUldmSmZGSFFuMWxUMmVIRjBTbXdaQW1EQXVnKytyMzRHb3g0T0g0?=
 =?utf-8?B?ckFzUGV4ZDNDb2o1UnUvUGgxcUJzSjNDZjcrZ3d5aWJHdGlwNndBUmk5ZDcw?=
 =?utf-8?B?cFhSR1RKTGlFVWZxUHJiTWVNdW9EajlsZ0RnSWtCOXBYemQ3S2ZXV2RLbjdW?=
 =?utf-8?B?V1pXNktTbWI5REZWdDF2V09QOVN2Y0ZXWGYyL0U5dEdqd25kZEtwNnRPb2Vz?=
 =?utf-8?B?Tjc5bnZMOWVqY3ZVMG5ZU0xBd01hUC9VYzVvcnlOTEhrbStheitWVEhhZWRi?=
 =?utf-8?B?Smoza3R4bmVvM3B1Z09Hd3psZU90cURKQlZDbjdqMlpkV04vN2xJNCs2RFBD?=
 =?utf-8?B?V0pRVkd5TXhocGNjdUNoY1VTb09PTnkrTUI4VzRyWDdWMVR4cmVYczJ6dlRR?=
 =?utf-8?B?ZjRsWGlyd0t0aFFtYjk4cDZNdGFlOGdCRXBRQjY3bUhlemxHUkxBcFZkWTQy?=
 =?utf-8?B?YnZWenpxYjJNSW91SHRrRTJEcFd1NGwxNmMzR093cEVvd3BOOGpaOHlHYnht?=
 =?utf-8?B?elBkcVR5UjI1c011czYxblV6S2hNVUljcG1RaDRNbUgwdjFTT2tPdzVCSFJZ?=
 =?utf-8?B?eWp1VkF0bHNIeUZjTE1zaURIUFM4Mzltdlo4QmVsc0dKZVJpSXdBbGliZ1Yr?=
 =?utf-8?B?TDNLL1J3dmEwUWx2UW8vUW9EbTA2ODZZWTFlWUxLV1JjYklUYlBlYm5UK2tv?=
 =?utf-8?B?eWZ0cGF1U1NVK1l6NWNXYUtrUFlTSzFqbEw1ZDBOdC9CVkNoWlZLZkxTczYx?=
 =?utf-8?B?SDFIQUYydVQwNGhiOWhrdzB5VmN0TGRrMjZRZDVrWWc1Sjhqemh2NlhGTG9N?=
 =?utf-8?B?WVJWcDgra0k0Y1ZRZGxZcWZCRVV4b3FaZUQzSFVLWTE1R1NtMnhBeFU0U0wx?=
 =?utf-8?B?YW1iaGVTV2ZwQ3d6cnU5VThGMHc5VjhLeVN4VmhubnZxVG53cGVNU0U2L2NK?=
 =?utf-8?B?Wi95WlIwNU96cUFiVE8wdlRURGNyS2htNE12Q1hWbUd2ZlVqWHp5QmpiTFJl?=
 =?utf-8?B?TDFWTjNkQTN6TWNmVyttcm4vMnpFVTUzZE1SeEtlQlhiNjlEK25qcDZseHpr?=
 =?utf-8?B?T3JmWVBpdGROdFhtNTJhV1FtSUhEVXJWc2xhRVpqVzNoRWE1dDFGdTI0RUpn?=
 =?utf-8?B?UzN2b0VsT3NueUJ0ZER1VmhUU2tiMEl2eXJWTTVucUFFaGRpcGNWSm9ZR1VY?=
 =?utf-8?B?bDZndDlXUEhyR0UxbkpMWkd3TEgrMHdlYnJLMXM5Z2puMG50N1JldzhITFgv?=
 =?utf-8?B?TUxBK1FuL3AwdGpGUktpVXVDV0Y0dGNwTVFoeUZqT3JWOUZJVlJXcTM3eDVK?=
 =?utf-8?B?NHVuNkFnYTJ1djZRMHpScTExcUdFVzZyRC9yRkNIeHA2WEYwb214RWdGVGRk?=
 =?utf-8?B?MTc1ZXEveng2VXBpOU5TY3gwV01mUUFuVGJYV1BzZk1CSVdHZmx4TnV6dkFq?=
 =?utf-8?B?a2R6N2JKV1dlTVVjb1NwR0cxRUlyRjBoNmdqdytGenArRFRoNFF6YW9xSDU5?=
 =?utf-8?Q?dI1M=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 17f7388c-eb71-4ab2-55ec-08dd82c8d0cf
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2025 00:41:56.7260
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xkTYLOkX3xazSp5j+c2V+aIYcrdjzAdV05eLJ1/iJjXvywzMoq57WFcBkzCKoacW1siDqXYqgXeOsIIShaqwHQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8605

Use common imx-pcie0-ep.dtso for imx8mp-evk-pcie-ep and
imx8qxp-mek-pcie-ep. No functional change.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 arch/arm64/boot/dts/freescale/Makefile             |  8 ++++++--
 .../{imx8mp-evk-pcie-ep.dtso => imx-pcie0-ep.dtso} |  6 ++----
 arch/arm64/boot/dts/freescale/imx8mp-evk.dts       |  8 +++++++-
 .../boot/dts/freescale/imx8qxp-mek-pcie-ep.dtso    | 22 ----------------------
 arch/arm64/boot/dts/freescale/imx8qxp-mek.dts      | 11 ++++++++++-
 5 files changed, 25 insertions(+), 30 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index dba0c9ac10cf1..b485e2260a3bd 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -104,6 +104,10 @@ dtb-$(CONFIG_ARCH_MXC) += imx8dx-colibri-eval-v3.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8dx-colibri-iris-v2.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8dx-colibri-iris.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8dxl-evk.dtb
+
+imx8dxl-evk-pcie-ep-dtbs += imx8dxl-evk.dtb imx-pcie0-ep.dtbo
+dtb-$(CONFIG_ARCH_MXC) += imx8dxl-evk-pcie-ep.dtb
+
 dtb-$(CONFIG_ARCH_MXC) += imx8dxp-tqma8xdp-mba8xx.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-beacon-kit.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-data-modul-edm-sbc.dtb
@@ -237,7 +241,7 @@ imx8mp-evk-lvds0-imx-lvds-hdmi-dtbs += imx8mp-evk.dtb imx8mp-evk-lvds0-imx-lvds-
 imx8mp-evk-lvds1-imx-dlvds-hdmi-channel0-dtbs += imx8mp-evk.dtb imx8mp-evk-lvds1-imx-dlvds-hdmi-channel0.dtbo
 imx8mp-evk-lvds1-imx-lvds-hdmi-dtbs += imx8mp-evk.dtb imx8mp-evk-lvds1-imx-lvds-hdmi.dtbo
 imx8mp-evk-mx8-dlvds-lcd1-dtbs += imx8mp-evk.dtb imx8mp-evk-mx8-dlvds-lcd1.dtbo
-imx8mp-evk-pcie-ep-dtbs += imx8mp-evk.dtb imx8mp-evk-pcie-ep.dtbo
+imx8mp-evk-pcie-ep-dtbs += imx8mp-evk.dtb imx-pcie0-ep.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-evk-lvds0-imx-dlvds-hdmi-channel0.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-evk-lvds0-imx-lvds-hdmi.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-evk-lvds1-imx-dlvds-hdmi-channel0.dtb
@@ -284,7 +288,7 @@ dtb-$(CONFIG_ARCH_MXC) += imx8qxp-colibri-iris.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8qxp-colibri-iris-v2.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8qxp-mek.dtb
 
-imx8qxp-mek-pcie-ep-dtbs += imx8qxp-mek.dtb imx8qxp-mek-pcie-ep.dtbo
+imx8qxp-mek-pcie-ep-dtbs += imx8qxp-mek.dtb imx-pcie0-ep.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx8qxp-mek-pcie-ep.dtb
 
 dtb-$(CONFIG_ARCH_MXC) += imx8qxp-tqma8xqp-mba8xx.dtb
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-evk-pcie-ep.dtso b/arch/arm64/boot/dts/freescale/imx-pcie0-ep.dtso
similarity index 64%
rename from arch/arm64/boot/dts/freescale/imx8mp-evk-pcie-ep.dtso
rename to arch/arm64/boot/dts/freescale/imx-pcie0-ep.dtso
index 244e820699b50..ed73284d9bb61 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-evk-pcie-ep.dtso
+++ b/arch/arm64/boot/dts/freescale/imx-pcie0-ep.dtso
@@ -6,12 +6,10 @@
 /dts-v1/;
 /plugin/;
 
-&pcie {
+&pcie0 {
 	status = "disabled";
 };
 
-&pcie_ep {
-	pinctrl-0 = <&pinctrl_pcie0>;
-	pinctrl-names = "default";
+&pcie0_ep {
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-evk.dts b/arch/arm64/boot/dts/freescale/imx8mp-evk.dts
index 9ab3ee93a35b2..1ba3018c621e2 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-evk.dts
@@ -711,7 +711,7 @@ &pcie_phy {
 	status = "okay";
 };
 
-&pcie {
+&pcie0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_pcie0>;
 	reset-gpio = <&gpio2 7 GPIO_ACTIVE_LOW>;
@@ -719,6 +719,12 @@ &pcie {
 	status = "okay";
 };
 
+&pcie0_ep {
+	pinctrl-0 = <&pinctrl_pcie0>;
+	pinctrl-names = "default";
+	status = "disabled";
+};
+
 &pwm1 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_pwm1>;
diff --git a/arch/arm64/boot/dts/freescale/imx8qxp-mek-pcie-ep.dtso b/arch/arm64/boot/dts/freescale/imx8qxp-mek-pcie-ep.dtso
deleted file mode 100644
index 4f562eb5c5b1d..0000000000000
--- a/arch/arm64/boot/dts/freescale/imx8qxp-mek-pcie-ep.dtso
+++ /dev/null
@@ -1,22 +0,0 @@
-// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
-/*
- * Copyright 2025 NXP
- */
-
-#include <dt-bindings/phy/phy.h>
-
-/dts-v1/;
-/plugin/;
-
-&pcieb {
-	status = "disabled";
-};
-
-&pcieb_ep {
-	phys = <&hsio_phy 0 PHY_TYPE_PCIE 0>;
-	phy-names = "pcie-phy";
-	pinctrl-0 = <&pinctrl_pcieb>;
-	pinctrl-names = "default";
-	vpcie-supply = <&reg_pcieb>;
-	status = "okay";
-};
diff --git a/arch/arm64/boot/dts/freescale/imx8qxp-mek.dts b/arch/arm64/boot/dts/freescale/imx8qxp-mek.dts
index 4ba8ddd472234..c93d123670bd2 100644
--- a/arch/arm64/boot/dts/freescale/imx8qxp-mek.dts
+++ b/arch/arm64/boot/dts/freescale/imx8qxp-mek.dts
@@ -537,7 +537,7 @@ &mu1_m0 {
 	status = "okay";
 };
 
-&pcieb {
+&pcie0 {
 	phys = <&hsio_phy 0 PHY_TYPE_PCIE 0>;
 	phy-names = "pcie-phy";
 	pinctrl-0 = <&pinctrl_pcieb>;
@@ -547,6 +547,15 @@ &pcieb {
 	status = "okay";
 };
 
+&pcie0_ep {
+	phys = <&hsio_phy 0 PHY_TYPE_PCIE 0>;
+	phy-names = "pcie-phy";
+	pinctrl-0 = <&pinctrl_pcieb>;
+	pinctrl-names = "default";
+	vpcie-supply = <&reg_pcieb>;
+	status = "disabled";
+};
+
 &scu_key {
 	status = "okay";
 };

-- 
2.34.1

