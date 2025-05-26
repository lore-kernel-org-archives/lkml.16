Received: from EUR03-DBA-obe.outbound.protection.outlook.com (mail-dbaeur03on2073.outbound.protection.outlook.com [40.107.104.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F34CF226D1B;
	Mon, 26 May 2025 16:21:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.104.73
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748276513; cv=fail; b=fCadj5kWfyKG+GmdU9CanXRUBxs6dV16p8a8T4jDPA2aDNfaQVhD0BE+U4Nrj0tmDcjvNCmCXyPsZwXdv1Py59edNHTF5VvrDV4mZKilUaOQS030kTa+K/pjr93nD40d7FkVRNn854GaVyLUxgb0/jM7d7guga2KUg9xVFq8XyQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748276513; c=relaxed/simple;
	bh=sh8xEkNwaDzxnampjkuplRzJXbLkRVc5gSUWwsHuSG4=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=I08ZmxoGIQdYbQDd3eCH652/H8YaYj6cTxnwclyKQuAsrDHTvbBVJiYYc9619LWEhAxsj97L65pJNe0gMxVjwJVCWolkdZuZkdTBB3RvI7jmxP64ZczkD5CQJnKByqgHXcB8sTvEASAzvfVYrUNJ4iE83GU+PjcYbVvDx57lpes=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=azUKD8uo; arc=fail smtp.client-ip=40.107.104.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="azUKD8uo"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lFzO3rTPpH1DIGuWXC2zRDhzk44cSZlMRok9tgf2sv7rHejAqTOqkpD3cTO7BFvvhE53XHKfSy1t0Dw2oWz9PO/2ztvMkGogynHfyIOAJtREpklaKylnemiT13hkBAVPibPjmQdPf+xm/10wJEDrwM4gDH+iP5mEp1i2lg3ywJiO8srmFL+Pcz7U+1GJUmKpr7zH/bsAUCN12tgK2b5/PML2D93FruTqUlCdCJfZsHJsAeOq7WiUWCTGksf9yjaILZ6aPIr55RICiTWhOO2D9IZnPK7bFyugFezUdtIaQAPGnxlVek+QC3gfn62231yn4OwSHpUw5s8AYJvyT7kdLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QNpa4GVkIXJG0wDX9VDfII3oceIlZMMmFqdB400VhWM=;
 b=EbGtnrVbIA5+TpNKNlkQG5HmoRK2BBrD0Ox/Bh4MIh/E8Dtk2svV1W8njVx8saWPD92AyFDVt+0xqAej6/nvTUOipHJm0Q+0hmbrIvMd2GAMSii4YDQficrI1vu5MFJIGWRz9KoY3qZNJ8SvsL/0ppSHURqKBRIJyq41Et15lQJ4CtogFxao0u2AQFGLbKaroS6vTrGm7S1rPle5Jhq6GayIAEH9VZ4Ct8CekONoNJJPBvGKGwGB2Y3B14zNzhTWFbI3U7nbypYuRp4XqCIBQTnqOoC0hCmSLNElhA8FmFqmV/8ispTsJBAeSLX4aBV7VILM9dE36LP3Y8ANzI6RSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QNpa4GVkIXJG0wDX9VDfII3oceIlZMMmFqdB400VhWM=;
 b=azUKD8uoIl8JJw9QjMKnR5iuIMJ7M65xgnF3gpPrd80D9EnNoVpIGAn8YxtUSMM1U07nFmMHMI6iEMPs6/gl+dds3/ZbUMUJ2KlXT9tNchZlxEZ9s9E0Kah6K4ygJhgM/n2blW8AftpcN5SQpcULROv4VL6p634NZuQyLvAdlz8BfvR1FwKhMwRWxhYS8GFpQgDmOO8IA8dlSudkKjVDROJCo+sle843RN7PJyrIl2BrEzPR/TKGEUn0HLvT1hh9q73Z4jb36PQQl0w96jyrXGHc+ZP4+e9PbeFzRqOmmCED+dPN+MpcW/C1zSnC72RVAdF9hoaUz5dizHTCK3AV9g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU0PR04MB9251.eurprd04.prod.outlook.com (2603:10a6:10:352::15)
 by DUZPR04MB9846.eurprd04.prod.outlook.com (2603:10a6:10:4db::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.21; Mon, 26 May
 2025 16:21:45 +0000
Received: from DU0PR04MB9251.eurprd04.prod.outlook.com
 ([fe80::708f:69ee:15df:6ebd]) by DU0PR04MB9251.eurprd04.prod.outlook.com
 ([fe80::708f:69ee:15df:6ebd%5]) with mapi id 15.20.8769.022; Mon, 26 May 2025
 16:21:45 +0000
From: Ciprian Costea <ciprianmarian.costea@oss.nxp.com>
To: Chester Lin <chester62515@gmail.com>,
	Matthias Brugger <mbrugger@suse.com>,
	Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: NXP S32 Linux Team <s32@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Christophe Lizzi <clizzi@redhat.com>,
	Alberto Ruiz <aruizrui@redhat.com>,
	Enric Balletbo <eballetb@redhat.com>,
	Eric Chanudet <echanude@redhat.com>,
	Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
Subject: [PATCH] arm64: dts: s32g: add RTC node
Date: Mon, 26 May 2025 19:21:40 +0300
Message-ID: <20250526162140.2460122-1-ciprianmarian.costea@oss.nxp.com>
X-Mailer: git-send-email 2.45.2
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM8P191CA0014.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:20b:21a::19) To DU0PR04MB9251.eurprd04.prod.outlook.com
 (2603:10a6:10:352::15)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR04MB9251:EE_|DUZPR04MB9846:EE_
X-MS-Office365-Filtering-Correlation-Id: 60023d50-8479-4f24-da26-08dd9c71671f
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?M05JankyR1NwTDYxQ2V6cDlkeVhZMlkrbFdOc1pjbUxWbnFTTmJCZDBuTjlq?=
 =?utf-8?B?eDFFbHZuWjVicHJSUUNxZi85bitnZE5aWFV3djg4RDAyQi90N2xLS2MxbmZY?=
 =?utf-8?B?d3k4Y3N3RFlDdmc1RFBlRTkyN1E3ZGhzdG91MnBzb0w2allJN0Ixb1E4OE1C?=
 =?utf-8?B?ckVuVCtudFJzcXFpL1ZtTmhEU0NNQnBHbG8waDViSS91ZElCcFhkNDBVRnZ4?=
 =?utf-8?B?b3BIaWFuaDZLVVZWVlB2ZEFaZmFKTDgydzhkTkhhWFlGa3hvRDNqejBGK3NU?=
 =?utf-8?B?ckJ3a2JKNHFiSXRRVGFFRWpQZmFmNEdYcDE0cTVaK2tsWUtHVit0ZjBHdU5x?=
 =?utf-8?B?VE5xZGI5N3Uxakh0bFllTjI3dHEybDAySE81MEE3UTdjNi9RRXRYT2dDUHR6?=
 =?utf-8?B?elJmL2hrWW9nRTV5Y0l5MTRTZjVqdkYwY014MmtWSFZiMEF4bkxWc296czVX?=
 =?utf-8?B?NitRR2lEbVBDc1E4OVJiRFZ6bU4xd2JLS0djV0hYYklnWUtNOGhqOFFDazBt?=
 =?utf-8?B?MzRzdituSVc2VmVsK3dwUWgrcW03dGtrenJtQ1FhbDZTZU00b09odU5EOTgw?=
 =?utf-8?B?QVNXMFhWb1ZjaGVUYXpBbUZHRzMyRXI1YUMvc2p1Tms0WlRUcmEwUUJXMEVQ?=
 =?utf-8?B?N3Nld0M3dlNFQlRkZ0p5WTN3cDZnZmI2R3ZYYzhzTFhKL0YrSFlQZC8rZ3cy?=
 =?utf-8?B?TEZaczloWnNNZHc3STR1eXF2cHBCMkswWWVQWWF1L2ROLzFmSGJuQ2JoTUQ4?=
 =?utf-8?B?RjUvUjJweVZ2ZHI4MWdVTGt1Q2FnenlVcGhYaXo5N3hkRW1qL0EzK3BQQjAr?=
 =?utf-8?B?L1RhejJaWjlEUW5jSU13WGprak9TVUJaK3g0UXhZdStXeEp1YXJnTDZ2ZldC?=
 =?utf-8?B?a0JlUTg3M2xKWm5ucE1JU3M2MXloQS9wTmNSVFBwWEx1Z3d4UU9ubXJHdXhI?=
 =?utf-8?B?MEd3QjlKZXkvcGZzckxOWkpsK0ZCdzVKSFRVQkE5cDZvYllWdW9jek80S2R4?=
 =?utf-8?B?R0hHVFJVa3QwQm1OeTg3bytjTkZVcEFGSHFteWNVcElIL2dTNllsZ0MrU2dC?=
 =?utf-8?B?SmgvQ0o2YkQzeGVtWjg4Vnh4WUJWWmxUNWkvY1ozU3h5WmNRdDZiemE0YzB3?=
 =?utf-8?B?dzVMZzMzNGtLdUFaSlg2bHJJSGlJTlA1MFNiTXg2QUR1OUpuOU9kd3RzbWcw?=
 =?utf-8?B?N05vRlY1UUFNbXd5bUI5SlRPQ0lFUXJlY1VKamhKUHcvOXpNbVFxRzB1bGlL?=
 =?utf-8?B?cHJHVnNuT0VQa1A3dW9FUFVuTmtodExrRXJmVnVZT2FUMEZiYXZsRE51c3dC?=
 =?utf-8?B?VGlUZ3pFZndXSHFRN2ZiYnVpQjdPemNQSTdmWU1nUG9ObzFpVjFKUHFsT3I2?=
 =?utf-8?B?cHF5dm9pUW15VHUxakk1Sk5PRDBGYTM3NEJwdUhCdk1mTzc0ajBWa2FYeVdP?=
 =?utf-8?B?UEZBSU1naVZJUEcydkpjTWFVOUx0ZTNFelFRQXZqdEl1OXY1dDlTMzlsTHlU?=
 =?utf-8?B?ZDA4UFUvY1hFUFk5bGdWeXBPb1RwWXNlWmdyR3pBb2dnMHNWY1ZQb0t3OEky?=
 =?utf-8?B?MlRkMmRWNCt5cEpwdmJCZ2pGYnV5MkttSzBtNG1ldEpBdlpMeXFScEFtalhX?=
 =?utf-8?B?TW9sd3Jnd0xRWHYyU00vellQaTNqVmtBZEFLZHVVbGRJRUs2MTU4aUk2R1Na?=
 =?utf-8?B?ajN4MWF0bDlFcytIaDd0Q3hhT0JlWFZTbDhVZHBWWk5uTUJOZGZ6aWVOUkVl?=
 =?utf-8?B?dzdXVmlPcVVLMnVWVW5iRXZkVWVMZGxmdlVkZ2UrQTdTUHFzSitRZlIvamh6?=
 =?utf-8?B?QmZ5aUJmTGMzcnZjMnlNV0hvVGxyY2YwK1VsZzNpc3RuUy9uWm5mRkprVHJ1?=
 =?utf-8?B?cVRXNUNzdUhuN1g4clkyQmx3THpOVUJOQjcrV3FJTnNMRjNXQjU1VzJFeTdT?=
 =?utf-8?Q?m0dZutLLOIk=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9251.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TmllTTRZay94czd6Kytpakt1QVhnNU1ZT3lMR2xkb3I0SkpjdkFTVGhQQXdK?=
 =?utf-8?B?UDBRMUdFR3BTWTJQM1dlRHp3ckFiTnJ0MUwrNzBmY2x6dHdLNGZrYTZSU3VW?=
 =?utf-8?B?Z0UvVVBTZEdydFZVRGZ1ald0UVdJcGpWWkw3N2dMLzVOL0tEM1RkNi9pcGw1?=
 =?utf-8?B?MUoyZGtScGR0R1lnYW85MU5PR1FqOG1XMWpGMjVPb0FTTmxQa2VSSC83Uzhh?=
 =?utf-8?B?NDd0Skg3V0NqN3lpOUZCR3RZRk1Nb25uWWYwdXhWUkdsckZ0am5sb3pJQlJ2?=
 =?utf-8?B?VnFRY2xlamxGcHRhandBR2RFeXhyZ01KcFAwRWI0aWFTVUFjVXU4MG5Kd2R4?=
 =?utf-8?B?eXJpanBybkh5dVA4UFNCMm4rcjBSdWJLRTFhdFZsMHJZcld2aFJhMityVEdD?=
 =?utf-8?B?S282dkdBbjRKVVVIaTZRaHYyNlV3SzdHblYxOVdHUDZZeVpFZjdMVnBFT2Uz?=
 =?utf-8?B?MHJEblJzYjhOTWxRQ2hBNHd5YzBKZVZET1Y2MDZGOERYUU1SVm5PelUzRzMy?=
 =?utf-8?B?R3lRNndMRXhMV2hwUmFsQk5mWm1rdEg4M2thcVNZUW5rSTNjVzA4OGpNMVZ3?=
 =?utf-8?B?VlFQLzJnSmg1TkdvWmJvV3RocDNSWUhaWkRueWdBakt4aTZIdEl5cGQ0dEIv?=
 =?utf-8?B?Wko5VVgxR0xTTk8wS2tVMW1SL1pkSncvOUpLeHRxQ2hSd2doU0VKT2dVSk8z?=
 =?utf-8?B?NElRU01LQmxlL3FIMFhSdUswbU44YmxpVmpCM1VzbjR6Z0RMQTlIT3JMMXFh?=
 =?utf-8?B?ZkY4eTFJUUJ1QURMalJxV3c0S0tUNHdMUWk1ejAxR2ZaUXd3akZLSDF6cGRB?=
 =?utf-8?B?dUFnWlRaM3Q1anpKVjcrdUtrUTNGOFpnK1k3QUJqb0xSR1g5UXlMREIzWnQ1?=
 =?utf-8?B?eTdtMGhIZXN0bkFmZEZQemVkK0IxbVNwZE1RTkFwUmc2RGpFalVSZWRIOFBD?=
 =?utf-8?B?N2pTalZuR1F1UjUwTzZnRVNNcEZxM3ZVWUpsWkxYQXVQR21RaHhoZ2NRMUZC?=
 =?utf-8?B?eTNIVlo3UjhlNmR5RkVVeVJFRG9tdVhwRWxrSmR2c0FRYTNnV211ZS9jb1lh?=
 =?utf-8?B?VG5EMS9VSGxuaXpPUWwxYnNpSzFIRDRDL0RRTHhTMElqMiswUDNja3FuVkJ6?=
 =?utf-8?B?dGltN2xZL3c4Vkw5dlpLT0dQZTluSGo1RWZXOU50ZTNFSUN6ZzQ2SUozWmZU?=
 =?utf-8?B?V2lGUHd4RUg3VTVOV2cxcVlQd2JjNU5HMmp5elU1OVNjU0w4cGhieTMwOGVU?=
 =?utf-8?B?ZElzSzVlL0ltSGROUnBRemNnemsybTRmSUhSZjRiN0docHRxem4zS3cycTMr?=
 =?utf-8?B?T3Q2eGRyNmh0ejRqdUh3ZUJDUXk3VnEzMmhzRzEvVWpBNnF5b0ZqdXpMZUdz?=
 =?utf-8?B?Yk5vbVVqWE51V3NWby8vQlpwQVdyMWhRTEEyTDRXR1krcXJwZVZNK3FFL09L?=
 =?utf-8?B?NjlwTGhBRXhWVjQ2Z3R6cWZEZEVsSUQ1aDIweHdIRnA2cnRBekJEWHV6WUQy?=
 =?utf-8?B?a1RZRUpCa2lDNXgrTXVsaGdNcnRvU0QzNVFPVVlMYlZjb1NxNzVtdnFVaWk3?=
 =?utf-8?B?clQ1Qi80TUhFb0NzRHJVdTVoUlVaRjFld1A4a1luUGtqK0xOTm00b1RSTDJV?=
 =?utf-8?B?YnFNYnBNYkZuazQ0ekRTNEQ4M3M5UHZpekpQVGpWM2NxR2pWRzliT1NuTXIv?=
 =?utf-8?B?dWkxZ2FLQkNMbFZ1ZUY5ODBzZTFUUndTcDF2c1IydDM2YUVqNDkrUTBzMmhV?=
 =?utf-8?B?R1ducVlySGdLVkpjR3JvYWdUOWs3dXJmeERJTW41NUxWZWNXeU5FZ3B3R25x?=
 =?utf-8?B?Z1lOdzJOTno4ZHdXaUxQQUhGYVJCV0RTUUxucGNRUkJCRGRmdWNDemZnbzdE?=
 =?utf-8?B?L0w0SXdSQ25JZ0g1SVI4dFR5YjQ5dHR4RFFIdm5WVVNoeVZwL2lvZUxsQjhI?=
 =?utf-8?B?dm4wUzlQOWlPTjlGaEdaL0NLU3dLRnFKZTNYb25FUHVQYzlYODlERDJ6T0Mz?=
 =?utf-8?B?TEIzQ2VMRENkcDJOMFpFRTJjM0xCbmY0TFdYeW15MXE5bWJZRS9TS1FJWjVC?=
 =?utf-8?B?OUNDcjcwY1JKNVZleFZUR1ZEdjgxRm5YR09GRDBhRUh0c0lCWVlDSFNjcjVw?=
 =?utf-8?B?eW5LNk93VW56U204REdscXVQa3VFRVk0WGpnRWhtTVFRMzVZdTZqMEoxeXdt?=
 =?utf-8?B?Y0E9PQ==?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 60023d50-8479-4f24-da26-08dd9c71671f
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9251.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2025 16:21:45.0335
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rVtM0ZItG5vUR9V1Sif/MOcInoAJyyWoBMh12mUcALG6e3uuUdtzC82qwV8cM2cih26aCo7lJ3TZnuwNkw15WXeTtGCQVmCWx4UoT5iGYHI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DUZPR04MB9846

From: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>

The RTC module on S32G2/S32G3 based SoCs is used as a wakeup source from
system suspend.

Signed-off-by: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
---
 arch/arm64/boot/dts/freescale/s32g2.dtsi | 8 ++++++++
 arch/arm64/boot/dts/freescale/s32g3.dtsi | 9 +++++++++
 2 files changed, 17 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/s32g2.dtsi b/arch/arm64/boot/dts/freescale/s32g2.dtsi
index fa054bfe7d5c..39d12422e3f3 100644
--- a/arch/arm64/boot/dts/freescale/s32g2.dtsi
+++ b/arch/arm64/boot/dts/freescale/s32g2.dtsi
@@ -114,6 +114,14 @@ soc@0 {
 		#size-cells = <1>;
 		ranges = <0 0 0 0x80000000>;
 
+		rtc0: rtc@40060000 {
+			compatible = "nxp,s32g2-rtc";
+			reg = <0x40060000 0x1000>;
+			interrupts = <GIC_SPI 121 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clks 54>, <&clks 55>;
+			clock-names = "ipg", "source0";
+		};
+
 		pinctrl: pinctrl@4009c240 {
 			compatible = "nxp,s32g2-siul2-pinctrl";
 				/* MSCR0-MSCR101 registers on siul2_0 */
diff --git a/arch/arm64/boot/dts/freescale/s32g3.dtsi b/arch/arm64/boot/dts/freescale/s32g3.dtsi
index b4226a9143c8..e71b80e048dc 100644
--- a/arch/arm64/boot/dts/freescale/s32g3.dtsi
+++ b/arch/arm64/boot/dts/freescale/s32g3.dtsi
@@ -171,6 +171,15 @@ soc@0 {
 		#size-cells = <1>;
 		ranges = <0 0 0 0x80000000>;
 
+		rtc0: rtc@40060000 {
+			compatible = "nxp,s32g3-rtc",
+				     "nxp,s32g2-rtc";
+			reg = <0x40060000 0x1000>;
+			interrupts = <GIC_SPI 121 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clks 54>, <&clks 55>;
+			clock-names = "ipg", "source0";
+		};
+
 		pinctrl: pinctrl@4009c240 {
 			compatible = "nxp,s32g2-siul2-pinctrl";
 				/* MSCR0-MSCR101 registers on siul2_0 */
-- 
2.45.2

