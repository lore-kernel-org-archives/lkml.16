Received: from EUR03-VI1-obe.outbound.protection.outlook.com (mail-vi1eur03on2075.outbound.protection.outlook.com [40.107.103.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF32E1E32B9;
	Wed,  9 Apr 2025 06:14:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.103.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744179289; cv=fail; b=o+4t8cHVD2wpkEW02EnlVHgcaAK0GRSiN7L0tcl1ELANUsrjz7e3bjLtbcpatDqSu3E78hqiPzFMHNzBf0JEWFDxsRi4Ez91OpZoc1IHvnrzPQEL3ZRdLxqWBMpAeNlBlsLAmUlY2ToPLWgCq431ABbc6eVtdp/9dEKrtiAZXSk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744179289; c=relaxed/simple;
	bh=3BWBL8JrYh1ihvsuXfRERwm52I+oJnGSinYF4hYMrlc=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=Z8eL6vwUrQ6Twdvs6ZK6cn41OhcYGywHXmxopPFM7AWRflsOdZ4Ybz3A0yz5oqtDqwa1YtWUsBeuFPuhNUJBv6K77NcM8jWj60YOX3NB++3tMHzcpcf/teQXPsuY7sdKTPBtq5P0R1GbRQpLQzzmkLenI8R4oxAR85ULNrWgrDA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=RiVtCW9b; arc=fail smtp.client-ip=40.107.103.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="RiVtCW9b"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UUyE/4o7zeSWoeo/VcvgU+hbelleTPQDT0wx0IlGz9EpblumphNgm/SQ+7ZzyK3PgRvOjHAWX5sPBc+P9JKQGsqSiXpOqrsbxiODW5LmRZQ4px3pUfU3gHaVkq6wb/eakrMqkSL/urcuINELiQsz6vf9OaO4BLfPQXaqch+TCHPzzdHFjOIZ6jqKqXq0PphOtsUiIZM9haN7jMcqjKr2huTDxI0H9YAfsnEYejIEgVNjo5VNwTU6vPPO54FzVMpEOdUR96goenQFHdeM1lLTl3Y8jx93topJZLumQ+POMV9oz/4g99B72LK8fsIkhyS07ExZQolx/oR2xWwtJyl4xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+bKdgOGnUv9OkKEfjXiJBYl9aIy5qKz0RBTJ+yHTnbM=;
 b=bWF2peEALuY5j5Zy1L/kKPTczJmSvLPszZZ/u9+lC5/mkEsB2OnxY0wfl+GOvvvBTaEmeGqmQqn2J4y12SzY1bcnCrFprg/wQe15OknBquI6igPQ1o6UCZXloEdreAoUq7vkmOnqJHc300HTjeDZ2U7rhQNnQyDde5OCjzWzdiAXP2ZgVM7sGwb/uv8gqZRZ09k3PH7QBaeAuFdtguuqIrlwIW0ltZwXwPT6INDFRauKiwyuUeZ+Xxy6D4I9qE34u7XoX3Je8pbYOG/90np0HWv8L5Vjxpw8ZU/TZvnXywwi0Y3exN9jdxTvvOCJwdKFEVaiylDXB7jk28q92VfZZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+bKdgOGnUv9OkKEfjXiJBYl9aIy5qKz0RBTJ+yHTnbM=;
 b=RiVtCW9b/iqAojnPdu7aNsKgMw1Pw+xqvTK6yMKF7MgFTj/aEJ28rWhzaeOdrav83Z9CdtJsSJRfG9ldJYPK5XJpLbgjY/4kT/rt8vzazqLv5scuNKrPV361sdXOYCj57mPiPW5X0DQ5t0cnApI3WxSSF/Pf1rPZa6sbExx2wmk2nXSx+3cxCWlo1FYZzZAzLgH/l8hAaQxAYpb86NzszHAY6HaI93mzxHCcyc3mf7ukg1WNHaqALTjrAGRjE0wzEdjG1yRRIom82o0p3FnJIlZp/CPrc5RzQSPgo39mW+RlUiq78Q0kiDl2U38+dwEM10whg3GgTocdEIGm3/IE1Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM9PR04MB8604.eurprd04.prod.outlook.com (2603:10a6:20b:43b::21)
 by AM0PR04MB6882.eurprd04.prod.outlook.com (2603:10a6:208:184::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.29; Wed, 9 Apr
 2025 06:14:45 +0000
Received: from AM9PR04MB8604.eurprd04.prod.outlook.com
 ([fe80::e751:223e:aa3d:5827]) by AM9PR04MB8604.eurprd04.prod.outlook.com
 ([fe80::e751:223e:aa3d:5827%6]) with mapi id 15.20.8606.033; Wed, 9 Apr 2025
 06:14:45 +0000
From: Pankaj Gupta <pankaj.gupta@nxp.com>
Date: Wed, 09 Apr 2025 17:07:45 +0530
Subject: [PATCH v16 4/7] firmware: imx: device context dedicated to priv
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250409-imx-se-if-v16-4-5394e5f3417e@nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744198674; l=10229;
 i=pankaj.gupta@nxp.com; s=20240523; h=from:subject:message-id;
 bh=3BWBL8JrYh1ihvsuXfRERwm52I+oJnGSinYF4hYMrlc=;
 b=QXPPjQ2GfBvIA6oy0kFuPhfs366uUjcV33YNeE3PfPdRAX8nkvFi1w/mXT2nHwL4dC0FZaq5m
 LuHxXOcOsjmC/QvCEl+mj556yPqHxh4+JdgwsKrDrWp/ub7mnAGtl+o
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
X-MS-TrafficTypeDiagnostic: AM9PR04MB8604:EE_|AM0PR04MB6882:EE_
X-MS-Office365-Filtering-Correlation-Id: 02e9507f-8865-4133-c323-08dd772dd2ea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|7416014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MDEweXNBU3VsV2RHSEViQzZMeG45MXBVUnZmR0tvZy9ZQkYrd0E1cVlES3Vl?=
 =?utf-8?B?VUZnS0VXWmRORm5KQzVxeFFJQ1oySGZBS2ptc1FraG9kV0d0TUFxcWFZa3ZY?=
 =?utf-8?B?NWdZMUViTjZPVlZjNnBXWll5Yy9ORjFGZUpvb0t6bjZLWHZUSFR4WVREYU9Q?=
 =?utf-8?B?NWcwY0ltT3hxc2k2WnpLTVdmRTd6UjAwdGdIOE0vWE5WOVR6VWRFMVl6RFZZ?=
 =?utf-8?B?ODNmc0FRSlFsY1p6M2QxYkdDQ0F3eVMyMkZSVGJPZUNEZXdwL3ZrbmlkeUZh?=
 =?utf-8?B?RnFxWWhWRjhwdlAvTzh6RlhKMGVPL1ZBZzNIZFJPMTNFbTJMRVdycDIvNGRj?=
 =?utf-8?B?TUJHcWxDRTNUb05xTEtNd2FvdFRCUUxpNnN1NmxoUktNK2wxT3Z2MUx3RitQ?=
 =?utf-8?B?Zlo0ejdxSCtKaVhaU0hpa2JEb3U4WllJTERqSGM5c3FIQkE2ajI3VnJsQzNB?=
 =?utf-8?B?RmlmbTBFYWIvT0E0Um1VSzBiaUN2MmlBRWNNZU1qdktRbU11K0Nsb082MERY?=
 =?utf-8?B?WGt2YVBoVUkvQkdmUFlaM2hxZzdoZEo5UlF2ODlFUTlRVzhGcFFrd0xtb3M5?=
 =?utf-8?B?NzJ3VVdHdVRveXVPYkZ1cHBCeGZ3NFduQng5bHdaK3NXWVBlR3JBL1cxdklU?=
 =?utf-8?B?WmlIbXFDVkpkYUpyNHNmZWxnWlpyM3F0TDhQbXI1dXFPQXdGV3Y4eW0vSmxv?=
 =?utf-8?B?VnNoRHNxUDBSeDErc1ROWTFqRkNJdEFhQ1h4QURPTklJalJNZFg3ZmhwMU9w?=
 =?utf-8?B?bzVnU3Q5Vkc3ZDBML3MvNzZFQVBTa1JIaG5mczdPb2Fuc3RhQzE2bVpQUFpi?=
 =?utf-8?B?TzFkdVhIWUtrZHBUUlZKVndia3J6RTRrSHVyWlluaXpPUWhicVB4MVc3UURX?=
 =?utf-8?B?NVlMbEtyWnArNDQvczdTRm9jY1F5UVBYOVZLT3F6UW1mR25udU5LNzlEQktI?=
 =?utf-8?B?YWVoVXVJWmVteFBac21vRlpQTzBUVlltY2J2SmM5bU9CTDE2ajRxTVZUM1Qw?=
 =?utf-8?B?T004YWNXa3pjU25zL0o1a01XdlJyZW56ZzdHbHYreWgrS094M2pvd1haK3Iw?=
 =?utf-8?B?L0xiWW82bS9xMDY0ZUh1cGRDUDZSK2ZTTW9UaVM2KzliNjVQQkNJa2xxeGk0?=
 =?utf-8?B?NXM0ZnRjaXBKQ3NIRXNyRmswSmt2bk81TGp5ZFBydmNYLzhvbEk0V0tHdDhT?=
 =?utf-8?B?QmtFTXlrSXRRTy9KZUlkN0RKNURoeEZ6ZWJkRU1kNm9NWEZubnJpYlk4dkpB?=
 =?utf-8?B?d0Rzenc1Y1RyejZFd3VoMlF6am9jNGRWaE5SRWJmR1RiSWExRUtXTjhSWXE3?=
 =?utf-8?B?SWVOUlM0MGVjK3pWWGY0N2x2NU1UR2xpVVlFdThTd0VJQkRocGdMNFh3OFdk?=
 =?utf-8?B?VEUrVXJTaVhsVEd6cEI1N3IwSmV0MXdEUGdpdkFVM0hTZ3lhSFgvVmJDWW9H?=
 =?utf-8?B?M0h4Z0ZwNVlaSThBTVgxVStEYlBWT0VMU1ZxZCsxbDhSR09XQkhkc0J1TU9O?=
 =?utf-8?B?SjhuRzZ4Vytwekw2ZlEyK0p5ZHM0RlV4aitjRUdhSE9WdnYvZDVQZDVDcE1a?=
 =?utf-8?B?WFlrTStDdnBQRUQ2dWkxdTJpdWlBTWM0Y1d4M1FGd24ydUFYVkJDU3hETXVI?=
 =?utf-8?B?OUZOTXpYbS8wcHExaWJWNGxaaCtOam1zUEVqVnl2TmtIczF1ei9QdEpBSlJ5?=
 =?utf-8?B?dTcwOXB0RS80bnJ2c1h5VHhYVjZTMEFxUXJKbmd1KzhJN1ZXdVFuK2RpS0FJ?=
 =?utf-8?B?ZXBNWEZ6K3I1ejZneGpyN05OV3FZcXZ1MC8xRjlSWlZyd1VrRVBPRUJDSTR3?=
 =?utf-8?B?azNzSVZBTFdnR2VTcVlDUHJGUWtab25BV2dvL0hPS2syUExmcFl3RVA0OFEx?=
 =?utf-8?B?S2o2ZWU3NjFIVEZ1YkVuWnVOZE9BU0V3ckZxdG1ZM0VTelhtSWtvQ3RQSUsz?=
 =?utf-8?B?YlBZSmptbU16SGpwWUVTNk1oWFZDcWxKQWwvdktNa0krckdnVUxYVzJmZERJ?=
 =?utf-8?B?Qkg5YkpZakV3PT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8604.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(7416014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MXNNMG9kZiszcFhMM0pNSnpxWmFIdlJEMjZNWkt2T1V4dDQvQVhaSmRTdmlU?=
 =?utf-8?B?T09aV1NoblZuZVZTdU1uaWhNVGkxZDNEMFpSYUszbEdueWRQRHVCOEFnOUFs?=
 =?utf-8?B?dDBCTENhUjdtYUdyUjJlZElzS1pyZkZpSGlPdVJBNWx2Mys2OGRpM3FnNHU4?=
 =?utf-8?B?ZlhJY1IwUVY2bHMzQStweDQ3Z2xuVE1qYjNVdFI3VE0yQXE4ZnphMnNKaFFt?=
 =?utf-8?B?YWs4azdSMGcyWUloUXp4MVJVN081THdyQUhYcXJtZG9wRklNWUd5ZXdZTGxF?=
 =?utf-8?B?N1NUL3AyaEJBVWF1czVhVFRkRVAzU0VpUlRCNHZCR2grWEMyNXVGUFZKbWdr?=
 =?utf-8?B?SXJZMGZRSlp2RnNYTzRtR0ZrZkY4a2tlblJyQTcyVWxNU3N5aFE2aFgzMnZi?=
 =?utf-8?B?U1FySlI0aUtid3pmVTk2Ni8xcDZpM3FIZ1JwNFpJaU5Ca0NtbklXYUJReVo2?=
 =?utf-8?B?SWlDb1BHNUtsRUF2dW84dHNTNmsxWkIzWjlaWitleWFwUHo4MnNLZ1hLNlNp?=
 =?utf-8?B?alJmYXN0dWZWQXQwMzVjVkpVNDY1ZlNlVG1ZV1NFcitnTndRQ0lhS1Y3Z203?=
 =?utf-8?B?cnVMN0dMdFYzU1VaZzkrTVFjbzM0U1dUd3VTYzBFdGpQcjhpZ2pXZjdxenIx?=
 =?utf-8?B?UktyV2FLWkpnUCsxOEdsQ1kxWVB0a284ZE8yRWpSajM1cHJ3ZUh5N1U2ODIr?=
 =?utf-8?B?VVZKT2tQMFJ1cUZrdW5ZTlpOc1pkZldNcWdoN1p4Q2p0eTNEZE9pNHFxUFc3?=
 =?utf-8?B?NjlEdjgxN1R4UCtNTFRjSGdQd2krMDdncmtwV1BZQkhqWmphNWlFTGplbTZY?=
 =?utf-8?B?YWVsMVlGWWFESmd0WlpTOUhraDhhNnpSYVlHak5zS1VuL2J2ZUhLZnhoU1hM?=
 =?utf-8?B?L05sWHgvRC9sckwxdHl6ampDRlVUc3E5U0NlOHZSWlNlalIwZzY2VUZINlhD?=
 =?utf-8?B?V3doVDg5QXVoZjlDNTJhc2t2VlVHMHhyU2xndG9ZZkhkQnBaMU1QTVl4RURE?=
 =?utf-8?B?dElScFE5NE5JbSt6QnQ2SGZ2MFZzbW9aVzJuSUd0WG9YQkJWR2FKVXdtWUt4?=
 =?utf-8?B?L0V1alE4QUZZdHF1aERFUHpjek15S0d5WnRyUkZOWE5vNW1rTnB1OVpLZ05o?=
 =?utf-8?B?R3lxcVVOSW5VdzAwbDdteHRWcEpTcjhSUUpMVEhiTldOR1gvNHU3dlZRSkpv?=
 =?utf-8?B?YklXL09OY1FTZ2tOcGRQU3NpckJZZ2JtTGFBcDM5V0pjWldmRldFcUxYa2d2?=
 =?utf-8?B?d2xOL0lpSXhzaWR6ancrTUJIY0FJZjJUZUhCMWdOUGIzc0hSZk9BM2RmanNN?=
 =?utf-8?B?YjRGTCtuWWpJZ2RERTB1MHNIYWFSS2pZcG5FY3VoRDBDdlhJL3VwQnBPcEJB?=
 =?utf-8?B?NUVjMndMNTFyMlJFT2JZbTMvMTY1YThqWUNmUFFkKy9TdUpiUlJDRTArcWpw?=
 =?utf-8?B?YytMeXlFVUZ1TUh4a0NMNWlGTUpLMXdveFEwMUhoTTNkL2ZRbGgvR3dCYmY5?=
 =?utf-8?B?WWVsTFRiUFZRd2wwMEdkY2J2TDNpelJ2T01HOHZkRlRFZC8rRngyWE5jSExh?=
 =?utf-8?B?R1lmWDdvMVVBOXlDMmR6UzdxbXlNdzlBRjFXc0FVNzVUQnJSMmZvM2JIOENC?=
 =?utf-8?B?L2JsRVV0RUxNemlOR1F2WUhOcm9jU0FlRHFXVzNCc3hlRXRUSG43N24yWmhW?=
 =?utf-8?B?OXg2djVPTlJNNEdQRmRkR1JvZmx0QldEVUo0UDdyWFF4dmw0MnlxaHRxZStB?=
 =?utf-8?B?dFoxTjVONXNaZk5wTDFhbXR6c0M1Rnd0ZUZ4UUJXZXB4TEwvcWR1UzhRcTZa?=
 =?utf-8?B?NlByUXkzeEY4ZjkzQ1Azb1dNS01zMHFxRWo5VWs3aTByWVExTndEZ1dHbGZq?=
 =?utf-8?B?SWFGRmx1SUw5eFpoK2dLTGhnb1NCK1o5NUIrZy96RmcwRG1iQVBxUWRMREhq?=
 =?utf-8?B?ZWZsbm8wVHVxOTVmWVI1dXM0ODRyV3Y5VFZYVEIxbXExZVMzeGRjdGxTZmND?=
 =?utf-8?B?TElMVXZKa0MvYWtQTVNTUGNNd2FxUVNQaktXUGhGankwdlErUHMvM3pJd0Fa?=
 =?utf-8?B?c1VzdUNZU00zSlJqWklOenBlNXorNW9yNkVQZXZGcUtTOU4zWnNSR3pnVlJq?=
 =?utf-8?Q?rrluILTI6nnhmmlEKOEfPyWro?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 02e9507f-8865-4133-c323-08dd772dd2ea
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8604.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2025 06:14:45.3572
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zAHfpJvqT9Z6l5cTL/bI1oB2te7iOKLspIREbBWKpk2hlj830R8CJR4/AYSDOGmcbYM1DT3XcKV/TRba+7ZBoA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6882

Add priv_dev_ctx to prepare enabling misc-device context based send-receive
path, to communicate with FW.

No functionality change.

Signed-off-by: Pankaj Gupta <pankaj.gupta@nxp.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>

---
Changes from v15 to v16:
- commit message is updated to wrap at 75 characters.

Note: copied the change logs for v14 to v15, to cover letter.
---
 drivers/firmware/imx/ele_base_msg.c | 10 ++++-----
 drivers/firmware/imx/ele_common.c   | 43 +++++++++++++++++++++++--------------
 drivers/firmware/imx/ele_common.h   |  6 +++---
 drivers/firmware/imx/se_ctrl.c      | 29 +++++++++++++++++++++++++
 drivers/firmware/imx/se_ctrl.h      |  9 ++++++++
 5 files changed, 73 insertions(+), 24 deletions(-)

diff --git a/drivers/firmware/imx/ele_base_msg.c b/drivers/firmware/imx/ele_base_msg.c
index 3e3b684e46f0..bed1a0459d8d 100644
--- a/drivers/firmware/imx/ele_base_msg.c
+++ b/drivers/firmware/imx/ele_base_msg.c
@@ -62,7 +62,7 @@ int ele_get_info(struct se_if_priv *priv, struct ele_dev_info *s_info)
 	tx_msg->data[0] = upper_32_bits(get_info_addr);
 	tx_msg->data[1] = lower_32_bits(get_info_addr);
 	tx_msg->data[2] = sizeof(*s_info);
-	ret = ele_msg_send_rcv(priv,
+	ret = ele_msg_send_rcv(priv->priv_dev_ctx,
 			       tx_msg,
 			       ELE_GET_INFO_REQ_MSG_SZ,
 			       rx_msg,
@@ -122,7 +122,7 @@ int ele_ping(struct se_if_priv *priv)
 		return ret;
 	}
 
-	ret = ele_msg_send_rcv(priv,
+	ret = ele_msg_send_rcv(priv->priv_dev_ctx,
 			       tx_msg,
 			       ELE_PING_REQ_SZ,
 			       rx_msg,
@@ -174,7 +174,7 @@ int ele_service_swap(struct se_if_priv *priv,
 	if (!tx_msg->data[4])
 		return -EINVAL;
 
-	ret = ele_msg_send_rcv(priv,
+	ret = ele_msg_send_rcv(priv->priv_dev_ctx,
 			       tx_msg,
 			       ELE_SERVICE_SWAP_REQ_MSG_SZ,
 			       rx_msg,
@@ -228,7 +228,7 @@ int ele_fw_authenticate(struct se_if_priv *priv, phys_addr_t contnr_addr,
 	tx_msg->data[1] = upper_32_bits(contnr_addr);
 	tx_msg->data[2] = img_addr;
 
-	ret = ele_msg_send_rcv(priv,
+	ret = ele_msg_send_rcv(priv->priv_dev_ctx,
 			       tx_msg,
 			       ELE_FW_AUTH_REQ_SZ,
 			       rx_msg,
@@ -276,7 +276,7 @@ int ele_debug_dump(struct se_if_priv *priv)
 	do {
 		memset(rx_msg, 0x0, ELE_DEBUG_DUMP_RSP_SZ);
 
-		ret = ele_msg_send_rcv(priv,
+		ret = ele_msg_send_rcv(priv->priv_dev_ctx,
 				       tx_msg,
 				       ELE_DEBUG_DUMP_REQ_SZ,
 				       rx_msg,
diff --git a/drivers/firmware/imx/ele_common.c b/drivers/firmware/imx/ele_common.c
index 7573603cdbec..baf83f03c1a0 100644
--- a/drivers/firmware/imx/ele_common.c
+++ b/drivers/firmware/imx/ele_common.c
@@ -42,7 +42,7 @@ u32 se_get_msg_chksum(u32 *msg, u32 msg_len)
 	return chksum;
 }
 
-int ele_msg_rcv(struct se_if_priv *priv, struct se_clbk_handle *se_clbk_hdl)
+int ele_msg_rcv(struct se_if_device_ctx *dev_ctx, struct se_clbk_handle *se_clbk_hdl)
 {
 	unsigned long timeout;
 	int ret;
@@ -52,8 +52,8 @@ int ele_msg_rcv(struct se_if_priv *priv, struct se_clbk_handle *se_clbk_hdl)
 
 		ret = wait_for_completion_interruptible_timeout(&se_clbk_hdl->done, timeout);
 		if (ret == -ERESTARTSYS) {
-			if (priv->waiting_rsp_clbk_hdl.rx_msg) {
-				priv->waiting_rsp_clbk_hdl.signal_rcvd = true;
+			if (dev_ctx->priv->waiting_rsp_clbk_hdl.dev_ctx) {
+				dev_ctx->priv->waiting_rsp_clbk_hdl.signal_rcvd = true;
 				continue;
 			}
 			ret = -EINTR;
@@ -66,7 +66,7 @@ int ele_msg_rcv(struct se_if_priv *priv, struct se_clbk_handle *se_clbk_hdl)
 	return ret;
 }
 
-int ele_msg_send(struct se_if_priv *priv,
+int ele_msg_send(struct se_if_device_ctx *dev_ctx,
 		 void *tx_msg,
 		 int tx_msg_sz)
 {
@@ -78,16 +78,19 @@ int ele_msg_send(struct se_if_priv *priv,
 	 * carried in the message.
 	 */
 	if (header->size << 2 != tx_msg_sz) {
-		dev_err(priv->dev,
-			"User buf hdr: 0x%x, sz mismatced with input-sz (%d != %d).",
+		dev_err(dev_ctx->priv->dev,
+			"%s: User buf hdr: 0x%x, sz mismatced with input-sz (%d != %d).",
+			dev_ctx->devname,
 			*(u32 *)header,
 			header->size << 2, tx_msg_sz);
 		return -EINVAL;
 	}
 
-	err = mbox_send_message(priv->tx_chan, tx_msg);
+	err = mbox_send_message(dev_ctx->priv->tx_chan, tx_msg);
 	if (err < 0) {
-		dev_err(priv->dev, "Error: mbox_send_message failure.\n");
+		dev_err(dev_ctx->priv->dev,
+			"%s: Error: mbox_send_message failure.",
+			dev_ctx->devname);
 		return err;
 	}
 
@@ -95,31 +98,35 @@ int ele_msg_send(struct se_if_priv *priv,
 }
 
 /* API used for send/receive blocking call. */
-int ele_msg_send_rcv(struct se_if_priv *priv,
+int ele_msg_send_rcv(struct se_if_device_ctx *dev_ctx,
 		     void *tx_msg,
 		     int tx_msg_sz,
 		     void *rx_msg,
 		     int exp_rx_msg_sz)
 {
+	struct se_if_priv *priv = dev_ctx->priv;
 	int err;
 
 	guard(mutex)(&priv->se_if_cmd_lock);
 
+	priv->waiting_rsp_clbk_hdl.dev_ctx = dev_ctx;
 	priv->waiting_rsp_clbk_hdl.rx_msg_sz = exp_rx_msg_sz;
 	priv->waiting_rsp_clbk_hdl.rx_msg = rx_msg;
 
-	err = ele_msg_send(priv, tx_msg, tx_msg_sz);
+	err = ele_msg_send(dev_ctx, tx_msg, tx_msg_sz);
 	if (err < 0)
 		return err;
 
-	err = ele_msg_rcv(priv, &priv->waiting_rsp_clbk_hdl);
+	err = ele_msg_rcv(dev_ctx, &priv->waiting_rsp_clbk_hdl);
 
 	if (priv->waiting_rsp_clbk_hdl.signal_rcvd) {
 		err = -EINTR;
 		priv->waiting_rsp_clbk_hdl.signal_rcvd = false;
 		dev_err(priv->dev,
-			"Err[0x%x]:Interrupted by signal.\n", err);
+			"%s: Err[0x%x]:Interrupted by signal.\n",
+			dev_ctx->devname, err);
 	}
+	priv->waiting_rsp_clbk_hdl.dev_ctx = NULL;
 
 	return err;
 }
@@ -166,7 +173,8 @@ void se_if_rx_callback(struct mbox_client *mbox_cl, void *msg)
 	if (header->tag == priv->if_defs->cmd_tag) {
 		se_clbk_hdl = &priv->cmd_receiver_clbk_hdl;
 		dev_dbg(dev,
-			"Selecting cmd receiver for mesg header:0x%x.",
+			"Selecting cmd receiver:%s for mesg header:0x%x.",
+			se_clbk_hdl->dev_ctx->devname,
 			*(u32 *)header);
 
 		/*
@@ -176,7 +184,8 @@ void se_if_rx_callback(struct mbox_client *mbox_cl, void *msg)
 		 */
 		if (rx_msg_sz > MAX_NVM_MSG_LEN) {
 			dev_err(dev,
-				"CMD-RCVER NVM: hdr(0x%x) with different sz(%d != %d).\n",
+				"%s: CMD-RCVER NVM: hdr(0x%x) with different sz(%d != %d).\n",
+				se_clbk_hdl->dev_ctx->devname,
 				*(u32 *)header,
 				rx_msg_sz, se_clbk_hdl->rx_msg_sz);
 
@@ -187,13 +196,15 @@ void se_if_rx_callback(struct mbox_client *mbox_cl, void *msg)
 	} else if (header->tag == priv->if_defs->rsp_tag) {
 		se_clbk_hdl = &priv->waiting_rsp_clbk_hdl;
 		dev_dbg(dev,
-			"Selecting resp waiter for mesg header:0x%x.",
+			"Selecting resp waiter:%s for mesg header:0x%x.",
+			se_clbk_hdl->dev_ctx->devname,
 			*(u32 *)header);
 
 		if (rx_msg_sz != se_clbk_hdl->rx_msg_sz &&
 		    check_hdr_exception_for_sz(priv, header)) {
 			dev_err(dev,
-				"Rsp to CMD: hdr(0x%x) with different sz(%d != %d).\n",
+				"%s: Rsp to CMD: hdr(0x%x) with different sz(%d != %d).\n",
+				se_clbk_hdl->dev_ctx->devname,
 				*(u32 *)header,
 				rx_msg_sz, se_clbk_hdl->rx_msg_sz);
 
diff --git a/drivers/firmware/imx/ele_common.h b/drivers/firmware/imx/ele_common.h
index cba2c7854455..62c75e149d95 100644
--- a/drivers/firmware/imx/ele_common.h
+++ b/drivers/firmware/imx/ele_common.h
@@ -13,12 +13,12 @@
 #define IMX_ELE_FW_DIR                 "imx/ele/"
 
 u32 se_get_msg_chksum(u32 *msg, u32 msg_len);
-int ele_msg_rcv(struct se_if_priv *priv,
+int ele_msg_rcv(struct se_if_device_ctx *dev_ctx,
 		struct se_clbk_handle *se_clbk_hdl);
-int ele_msg_send(struct se_if_priv *priv,
+int ele_msg_send(struct se_if_device_ctx *dev_ctx,
 		 void *tx_msg,
 		 int tx_msg_sz);
-int ele_msg_send_rcv(struct se_if_priv *priv,
+int ele_msg_send_rcv(struct se_if_device_ctx *dev_ctx,
 		     void *tx_msg,
 		     int tx_msg_sz,
 		     void *rx_msg,
diff --git a/drivers/firmware/imx/se_ctrl.c b/drivers/firmware/imx/se_ctrl.c
index 24a32fe137eb..1df2cd847fc4 100644
--- a/drivers/firmware/imx/se_ctrl.c
+++ b/drivers/firmware/imx/se_ctrl.c
@@ -203,6 +203,29 @@ static int get_se_soc_info(struct se_if_priv *priv, const struct se_soc_info *se
 	return 0;
 }
 
+static int init_misc_device_context(struct se_if_priv *priv, int ch_id,
+				    struct se_if_device_ctx **new_dev_ctx)
+{
+	struct se_if_device_ctx *dev_ctx;
+	int ret = 0;
+
+	dev_ctx = devm_kzalloc(priv->dev, sizeof(*dev_ctx), GFP_KERNEL);
+
+	if (!dev_ctx)
+		return -ENOMEM;
+
+	dev_ctx->devname = devm_kasprintf(priv->dev, GFP_KERNEL, "%s0_ch%d",
+					  get_se_if_name(priv->if_defs->se_if_type),
+					  ch_id);
+	if (!dev_ctx->devname)
+		return -ENOMEM;
+
+	dev_ctx->priv = priv;
+	*new_dev_ctx = dev_ctx;
+
+	return ret;
+}
+
 /* interface for managed res to free a mailbox channel */
 static void if_mbox_free_channel(void *mbox_chan)
 {
@@ -332,6 +355,12 @@ static int se_if_probe(struct platform_device *pdev)
 					    "Failed to init reserved memory region.");
 	}
 
+	ret = init_misc_device_context(priv, 0, &priv->priv_dev_ctx);
+	if (ret)
+		return dev_err_probe(dev, ret,
+				     "Failed[0x%x] to create device contexts.",
+				     ret);
+
 	if (if_node->if_defs.se_if_type == SE_TYPE_ID_HSM) {
 		ret = get_se_soc_info(priv, se_info);
 		if (ret)
diff --git a/drivers/firmware/imx/se_ctrl.h b/drivers/firmware/imx/se_ctrl.h
index b15c4022a46c..b5e7705e2f26 100644
--- a/drivers/firmware/imx/se_ctrl.h
+++ b/drivers/firmware/imx/se_ctrl.h
@@ -19,6 +19,7 @@
 #define MESSAGING_VERSION_7		0x7
 
 struct se_clbk_handle {
+	struct se_if_device_ctx *dev_ctx;
 	struct completion done;
 	bool signal_rcvd;
 	u32 rx_msg_sz;
@@ -36,6 +37,12 @@ struct se_imem_buf {
 	u32 state;
 };
 
+/* Private struct for each char device instance. */
+struct se_if_device_ctx {
+	struct se_if_priv *priv;
+	const char *devname;
+};
+
 /* Header of the messages exchange with the EdgeLock Enclave */
 struct se_msg_hdr {
 	u8 ver;
@@ -80,6 +87,8 @@ struct se_if_priv {
 
 	struct gen_pool *mem_pool;
 	const struct se_if_defines *if_defs;
+
+	struct se_if_device_ctx *priv_dev_ctx;
 };
 
 char *get_se_if_name(u8 se_if_id);

-- 
2.43.0

