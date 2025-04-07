Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2051.outbound.protection.outlook.com [40.107.22.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71759238D2D;
	Mon,  7 Apr 2025 10:57:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744023446; cv=fail; b=Aof+fstwIT74Eox2bfHzh//pFJMLKy/3Ii7ZZIJypvsYK0zNQKHYZOgND5JoQbyKTt4GDYJRaY4rN4VRq7v7aBsSWL1y51tKmxwX7eWFJ+NJARD0gklC36TvXbXUPdTbN9hYiuk5tTCL/CQezsylTLotvfh+WcuXVgnt1hHsemk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744023446; c=relaxed/simple;
	bh=8QvSWd4rmn+G1ZEKi8f+TGc8yN5T+yIQA/mdWdtzwO0=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=rkTLNDxUHKBcx4wOYuuG0dxuMEpfmULJ+Q7Wiw79Gv98YUY0bITjiUgVHdVqM1FT0uz/V2AZU/7PwgFOjNE7uHCNiLGzHWOHb4Y6rUhmafCEkzkohTtw7rmrGeIZI5nMprpC/3Y10t2nEfdSZFNDLotE+J+1aSkZ7XxVXU0cmTc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=NjW+ATIS; arc=fail smtp.client-ip=40.107.22.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="NjW+ATIS"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Gh5rp7RIwRuACr0aA9WsSmUVMfLMvqyX2UVk/CYkcSEabmrwKtmFhg/ktD0ZYKOVAueo6iAkwwPel0wrmPC9UR+dCxdfH9e3AUuYTyjkEKx2+eLpsHfOWQ4S+1BKNn8z18MAPxjtSHEb8aKos6JEyYc3qNV8pSqbIcTrQdiVMkuhEZKj6DUrOjvOWaTtV6u1ETbiM2vJG+rZqXlii5XDyNbsk9gkO1V9zY1qC5rOvs6zvaknRb5Iyipb6cxG7ktMTnsZZUtQBW3qljnAhm5+ltT23K0xFdhNY5+QzRZlHeSZyy+8CgMvXhZN9Dw+54NA1KlBKV4LVIxfuoGUnqltKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8+o55FPMa7m6VVea9dp3slj5OALcBnoJzyUth39j3Gk=;
 b=ftx02DwRNlRVWnCDFShPreQkxWofbxbEJx5BV6HGLdj5xRYss+OvphT8/c1rIlY3ieCLNC/8i1Uj055IfHxJSC7I+Bgw1CLo0CWaScwDzGWO5pK3OPPQFuKYYbed+5oGvMrsvKX5kaspc0Gu+3yL+8keTHb1xWAQhX2gCB90EMd1NFgDrXz+hk7yqSuDNgVrUDOxrzsYg4bNZZqXZL4VNY76l3i8AONNCZcM3pl6h8yO1+2PS1MN8/qAyUDhISzWZK769nygEulNINKwd/EuBK0mmMPi19l+4VNqp7JmWjMfPaw0jo4pID4z+08mflxW0dQ2BKQUGZMf70cs5R+NQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8+o55FPMa7m6VVea9dp3slj5OALcBnoJzyUth39j3Gk=;
 b=NjW+ATISD9YW9K8CthINsQO1QQlDbNzBD5NXUmnE3lfasmK7anGLrP25jGOBac5g/EgnrpuwZuNLvZDKI8KV4Rxd9EwSSwPQ2+AyOj9MD1SvNVpjtjyOuoxQHIKXw/OrH2nJD8u9xi/tBc8tWNeiXoWDKlEjN+s/pNpo5I6LX4CNWzovF6jUMh9znEEAC9hAgOFwkh/3coY3bkeDoInGTZN6sRt3uzL/ltWNsuuyPIlUy9sDYrUUZ/ytsrLy7v/3HgGFxUVNd9p/nmDdxrRSBIxsmEZEkA+ZoLxWSz895zzHiu2Ej/JBBpmXaGYCBHFBGewiP35YJlEx1rLzpy3QOg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM9PR04MB8604.eurprd04.prod.outlook.com (2603:10a6:20b:43b::21)
 by DB9PR04MB8493.eurprd04.prod.outlook.com (2603:10a6:10:2c5::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8583.43; Mon, 7 Apr
 2025 10:57:22 +0000
Received: from AM9PR04MB8604.eurprd04.prod.outlook.com
 ([fe80::e751:223e:aa3d:5827]) by AM9PR04MB8604.eurprd04.prod.outlook.com
 ([fe80::e751:223e:aa3d:5827%6]) with mapi id 15.20.8583.045; Mon, 7 Apr 2025
 10:57:22 +0000
From: Pankaj Gupta <pankaj.gupta@nxp.com>
Date: Mon, 07 Apr 2025 21:50:17 +0530
Subject: [PATCH v15 1/7] Documentation/firmware: add imx/se to
 other_interfaces
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250407-imx-se-if-v15-1-e3382cecda01@nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744042844; l=6679;
 i=pankaj.gupta@nxp.com; s=20240523; h=from:subject:message-id;
 bh=8QvSWd4rmn+G1ZEKi8f+TGc8yN5T+yIQA/mdWdtzwO0=;
 b=cnLODRBINgMk4IGg+gWCaCZdQ4at2BGQgAmiZpfAkiD8zHP6GuBcIo4a1JDptjYTa/kxDx45P
 rL4NpClCvtaCm/x7hbdeI4ObBrMQMqmTeArlA95cBYNs4rARBQ8UvHm
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
X-MS-Office365-Filtering-Correlation-Id: 160ce391-adb8-4cc9-65de-08dd75c2f907
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|366016|7416014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aDgzeVRFeWNkaUd5MGtDVHdmbW5pM2xleVU3Ry95WkNoN1NtV1hURUFXOHlI?=
 =?utf-8?B?WHBFM1lWT0Ira0R6ZWprbCtDKzBoYVZEUGJ4TlE1S0pMYlFST01xa0Mva0F3?=
 =?utf-8?B?SnZSbkN4clArOEhySklDaTRqZ216RWVCanF0SmsrS3dFWXkzSXhhR2hSNW5I?=
 =?utf-8?B?SklWYnBHOVlRY2dEVk04ZkpQckpGcEdUL2FZcEhYQ3NybWw3TW93M1RnQ1d4?=
 =?utf-8?B?d2c4cWJGNEhJRFE3cGZhQTFBN1M4UTNYSU55S09UQlEweUFmSHBrVjhNbU90?=
 =?utf-8?B?K21sR1FXZzJYRnlldnZveERzbUVENjh0VjFzMXpQcTZMblY5YXl1OWJYdkxR?=
 =?utf-8?B?aFNDL3V0RWdaV2hQcjI2MGcyNHFoZkl6RlJMa3N6MFBlWVV1QVhmQmxQTFZ2?=
 =?utf-8?B?UjhuelRoS20rTnVPcHZhTGRtR3BhQTVrMkg2MENDb1ZIckJpa2NjMjdVb0Nj?=
 =?utf-8?B?QzlLSWhJL2JIMUp5bE9STi9xNEpxaFF6NnAwK0NEN0NoKzkzck5lZTV1ZCti?=
 =?utf-8?B?UG1WVGZXNityQlQ4V204bUVJN0VqcFQ0UTNybnJUalk4NGNiTjdyclV0NmhY?=
 =?utf-8?B?UDFtZVFqVW0xajQ4eXc0V2QzckNLek5QWG96RTBPLzFvNFZERGFiMVNyb2V5?=
 =?utf-8?B?UUZMY0RKODB2WWl1NWxEOVlBdXBieHVJaHNBbVM0Ni9ic3Vld1Y0TDNVMDZL?=
 =?utf-8?B?ZkQyakVMelJ5T2NyeWlCdWdIYTZ5d01OODJvSVU2amg1VDhSUVp5RHZncEdw?=
 =?utf-8?B?SVlnK3RvcXE2UGNZMGoweFpVUTRPc01uTm1SUmJvMElKbkRGZy80K2RFSVBO?=
 =?utf-8?B?OVA3cHZSalg5RlFVaXhCZ3p4bVlWdlhGVEtDS2RXVmlXS1pCU09JV2ZrRklR?=
 =?utf-8?B?L1R3ZWg1Mm5OdjVUbkd5VUJUR3ZwOEJ0bnk0ZjJhVElLVFJvanJlTmhKb1pM?=
 =?utf-8?B?dHNucHg5b3ZGcVBWZTd3M2dGTnIvTXAyZDlzbEVLZjNwUmtWeWJ6akdFakFL?=
 =?utf-8?B?WjhES2lCcXhHcFNvak9CQ3pHQU1wMWxyRnUrOGZKSFhVQVZjTU8yNjZpc2Vk?=
 =?utf-8?B?MSs1R1hHTldkUE5kMGNqNWMySHRoTUNNZjdzRmJkWDVtb1ljalA3bmp5OVdR?=
 =?utf-8?B?a09KbTlIZmxoM016NnB5ZVM1eVVRS1FJcnY3ZU1CZUhWYk0zQVhpcWZKaSts?=
 =?utf-8?B?bERnaUptRkV2a0t1NGM1aTZYTWpOUGFUTmV2QUYvN1lHYUt2eHJ5bmtnVXli?=
 =?utf-8?B?ZGNYVWNhOW9XRnhVaW5hdUV1L2wzaVZVTUVYa3lMOE1KaXlwc3pvL296N2Rq?=
 =?utf-8?B?MmE5TEVBcWhIV1Rtd2xlNFJqbjdYUTVZZEI4VWJFajdNNThrcll0RXgxL3dL?=
 =?utf-8?B?VVBrQW9MT3RZWitVb2tFdWRaVVhpU3plcXNsMTFrRE5Dc25NZ1pFOVVKcHhJ?=
 =?utf-8?B?M2dRMmdzUVoxcTVSTGlIUWdrVzF5Y0xIbTkwQUVaajdzU0p5Mlk4UnlYQ3Jn?=
 =?utf-8?B?VWl1bXFtckJsYW5zZm9jclllZzViVHhWMzdTZUxYQnZGdkl6cDExWTR5QU1G?=
 =?utf-8?B?VlErYUI2aGRicDhXbDNlemFodC90UlhTVnhOK0tyT3dVRnJrY25FUzA0amM4?=
 =?utf-8?B?aFQ0aDhpQkJTTmtXdEU2VGQydVBCaktBYTJkVUhWT3pWQ2dMMUNIYzVod0tu?=
 =?utf-8?B?NVhQOW1BeW9paG81TjI5dld2NytYeW1nL2MzVnBpUGx0eW92Rm1FVGIwenk4?=
 =?utf-8?B?QzBtVFk0Q2V4QXFFZGtwRVVCc1FWblU1R2UwcElzVjN0azlFbWtQa0F0dng3?=
 =?utf-8?B?TFkzendHak9vZWU3NWQwdjl4d3FFSFRwcnJ3QmNqY1MvUk9CSEIxQXVrWEdD?=
 =?utf-8?B?Q1k1dzFzWllrcGhLRVFzYUMxN1c4cy91Mlk5UmFZekpwai9MaDB6S2Y2V1FY?=
 =?utf-8?B?d2V5eURyMWx3T3V4Y2xvN05xdkxtWmtTZUFmSHd0ZUlFZUpWWUpqMi9FMC9m?=
 =?utf-8?B?VjFTRUMvMWVnPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8604.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(366016)(7416014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aHpTVDJoL0N0dm5UbGRQdUl4ZDdpQWh2ZDg0MTZiNEZIUEZ3d2U5NDBCdWVX?=
 =?utf-8?B?K1haMEpaYmw1YjVMOCtRODYvZStsUy8vVVFGMGRpeFlhU0tGYmNHS0VGQ29p?=
 =?utf-8?B?QlZGWm04VGU0em4rYXhpUCtpc3VtdTRiMldFNFRWQTJHZVVRbFBDTEhySDZr?=
 =?utf-8?B?ZW5VNkhNcVVQSHNzV1c4QlVkZmJsTmZnNEFsdWZwRUJ3OUtEQ1ZySjZkTmRi?=
 =?utf-8?B?MDNaM09IVitJRVd0Q3VOQ3A1WlBSMkEvQWhvQmNLUGljdm5NY0c5aFFyOXlL?=
 =?utf-8?B?K2tBMG9nUmFtTjZOMUNyeEpuZzB1SE1IY2k0blV0c1kzNkVTMEx2eFkvYUdl?=
 =?utf-8?B?Q2JCYW95SDAzaWlVMEZ6WTFKVDRKclZzLytVc0syUk00c05JNkNZWklKSGRY?=
 =?utf-8?B?cFM2UWcwemF3OVQyZEFqLzV6VXlNSXpXb2dXUXBPei9NWkJQYnplUVRwN2tK?=
 =?utf-8?B?MzAvYXpXQ29udmY5Y2NWc0NSM1d6VHFTcWg5a3Y4Z292RWl5Rm5jQWdUTDVl?=
 =?utf-8?B?bldNdmxMVHhnc1ZFOUJqcUVHdnFDUVZtNVY2OWNhMHVpbU9jTGF6RmNVMEhI?=
 =?utf-8?B?MlpDN0ltVEVZNW9uZDR3a2hHYUxMVzlQbUVuSytuL3FiTThIOFlneVBiUzV6?=
 =?utf-8?B?TnlTVlB6SFBlb0trTTAyZGw4RkxxNWZTU1VCdFhZaEFxZkhHT09Ec1FRVnRh?=
 =?utf-8?B?amRuQkVmNFR3V2NCNnU1OEpxNjgyQTFGQnBZQXJHRzNNS3Q3cTV2aS9XeTJ6?=
 =?utf-8?B?R002UjhXekh3T0lnUkN6K2FJR3VRYS90Um04azU2aTVTVEU2Q3RPbjZEd3Fm?=
 =?utf-8?B?NGVRQU1OajY1YktzM2tyUTFZeHo5Ui92bVBHVFRNWFpmb2R5WEJwYXRPdXgv?=
 =?utf-8?B?NkdiUmhkR3MySlZZNnBzVTFLclRMVll0N2JneForZlA4ejY1MVR1cEdRSWcy?=
 =?utf-8?B?VmZhK291OHliNk1pR3VqUENKcUpnazlEUk5WenRCaGFrTWNveWx0T1dGVWs2?=
 =?utf-8?B?RVQ3MXFxRlpPZVJSeXpnc1lxdzdDL1IzUGg0RG04Z0xtVTFwVG1IVFp0RjY2?=
 =?utf-8?B?ZDI3SU9GcnVaRjFreHRDRk5BRmliNVFFNUNpanNFTFMwaGJhS2Q5Wk9pVTFM?=
 =?utf-8?B?QzMxUU4vWmkyUTdJRTZOSjVYa1Y0ZWhoNWV3YnErZUtTNEhrMU9aaWVZVnIz?=
 =?utf-8?B?R1NoMFY3V2I3UjM3cTJIWngwTm5YWmZSQ2c0S0FqRUJ6Y0RaNy96dHZOTGhE?=
 =?utf-8?B?R2FldUxRZzRGT04va3ZrOWRrNDV5RHUyZTM3d3dZYk5Qd3pDZWpUTkJEcXF4?=
 =?utf-8?B?SEkxQk5ZQU9WKzdDbTQzS2piY01BZVhzZjVJRW1SYjZOcUFCeXZsWERRYnQ1?=
 =?utf-8?B?eElZVTJCaWk0aGxCUEtIdTdaYXdyNWowZGZTazBWTW92TUNIODRQUlczMTJP?=
 =?utf-8?B?cTFqODZGT3dlejlSazNaM0pUVUlIYUpvQnFUN0RyNWphYUhDdklxWVFLcGhm?=
 =?utf-8?B?dlVKaFFyeHhaY2pjaXR5UlV3VjIvUXdhRUpJRnduVXNjWDZNN0M4SmQraDVY?=
 =?utf-8?B?R1ZoRXpMRGN4cDl5UmhWUmRrSGVvRk5pdWd3T1hHVTNMT2xzRC9JTmRmV1dR?=
 =?utf-8?B?dlZFWGc5UzNCUkY3WDNYc0RzVmdpNWliK0VuV25IWFQ4N2twN3RxVDJJNVZ1?=
 =?utf-8?B?aC9hT1RnQ2NnYVZtK1RoWndCSmFVNTFiWUlLdXpicFFEcXc3YXAzT1FvbGFV?=
 =?utf-8?B?emgxOVpnRVIxZGMrVFVMY09ORXdab0pEUytXY3dCQ0xEN3I5RmlxcWpHdEhT?=
 =?utf-8?B?WVo1UWd3VU5UMzUzZWttYkFlaWxRMzZrQnBpSzlKc0IwWHg3eC9DWUJaQ2tE?=
 =?utf-8?B?T3VQcmNYZnFRck5TQXMzL254SnR0TVk3N3QwZjlGejBnVGIxK1U3b2VzRUlH?=
 =?utf-8?B?dFFKUm90WkR2aktHbkd4bkZkelRqdi8rQzJVQ0FGMHBTSGF5eXhSdnVWdlhF?=
 =?utf-8?B?bStHNW85bkhxNW9OREU4WnBZUC9CTlpaVlV6enh5MzcrbmdyQ0ZObFFTQlF0?=
 =?utf-8?B?Z3QrREt4QnU2UHJpY0x1YTEyMmwzTmhZQndPWlhETTdqZUhkWmw5VmQxV3hQ?=
 =?utf-8?Q?y6QyzQlGSEGzuw56Nwt32C8YV?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 160ce391-adb8-4cc9-65de-08dd75c2f907
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8604.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2025 10:57:22.0433
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /9mgEMvEDs+BzVlxyk9GVyMc8w6ty3Ucc+BQpUmOza4nvQ0lU4xZoc2cmmt0lmP2a/kAM8vcRi43ViikKar9Ow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8493

Documents i.MX SoC's Service layer and C_DEV driver for selected SoC(s)
that contains the NXP hardware IP(s) for Secure Enclaves(se) like:
- NXP EdgeLock Enclave on i.MX93 & i.MX8ULP

Signed-off-by: Pankaj Gupta <pankaj.gupta@nxp.com>
---
 .../driver-api/firmware/other_interfaces.rst       | 121 +++++++++++++++++++++
 1 file changed, 121 insertions(+)

diff --git a/Documentation/driver-api/firmware/other_interfaces.rst b/Documentation/driver-api/firmware/other_interfaces.rst
index 06ac89adaafb..a3a95b54a174 100644
--- a/Documentation/driver-api/firmware/other_interfaces.rst
+++ b/Documentation/driver-api/firmware/other_interfaces.rst
@@ -49,3 +49,124 @@ of the requests on to a secure monitor (EL3).
 
 .. kernel-doc:: drivers/firmware/stratix10-svc.c
    :export:
+
+NXP Secure Enclave Firmware Interface
+=====================================
+
+Introduction
+------------
+The NXP's i.MX HW IP like EdgeLock Enclave, V2X etc., creates an embedded secure
+enclave within the SoC boundary to enable features like
+ - Hardware Security Module (HSM)
+ - Security Hardware Extension (SHE)
+ - Vehicular to Anything (V2X)
+
+Each of the above feature is enabled through dedicated NXP H/W IP on the SoC.
+On a single SoC, multiple hardware IP (or can say more than one secure enclave)
+can exist.
+
+NXP SoCs enabled with the such secure enclaves(SEs) IPs are:
+i.MX93, i.MX8ULP
+
+To communicate with one or more co-existing SE(s) on SoC, there is/are dedicated
+messaging units(MU) per SE. Each co-existing SE can have one or multiple exclusive
+MUs, dedicated to itself. None of the MU is shared between two SEs.
+Communication of the MU is realized using the Linux mailbox driver.
+
+NXP Secure Enclave(SE) Interface
+--------------------------------
+Although MU(s) is/are not shared between SE(s). But for SoC like i.MX95 which has
+multiple SE(s) like HSM, V2X-HSM, V2X-SHE; all the SE(s) and their interfaces 'se-if'
+that is/are dedicated to a particular SE will be enumerated and provisioned using the
+single compatible node("fsl,imx95-se").
+
+Each 'se-if' comprise of twp layers:
+- (C_DEV Layer) User-Space software-access interface.
+- (Service Layer) OS-level software-access interface.
+
+   +--------------------------------------------+
+   |            Character Device(C_DEV)         |
+   |                                            |
+   |   +---------+ +---------+     +---------+  |
+   |   | misc #1 | | misc #2 | ... | misc #n |  |
+   |   |  dev    | |  dev    |     | dev     |  |
+   |   +---------+ +---------+     +---------+  |
+   |        +-------------------------+         |
+   |        | Misc. Dev Synchr. Logic |         |
+   |        +-------------------------+         |
+   |                                            |
+   +--------------------------------------------+
+
+   +--------------------------------------------+
+   |               Service Layer                |
+   |                                            |
+   |      +-----------------------------+       |
+   |      | Message Serialization Logic |       |
+   |      +-----------------------------+       |
+   |          +---------------+                 |
+   |          |  imx-mailbox  |                 |
+   |          |   mailbox.c   |                 |
+   |          +---------------+                 |
+   |                                            |
+   +--------------------------------------------+
+
+- service layer:
+  This layer is responsible for ensuring the communication protocol that is defined
+  for communication with firmware.
+
+  FW Communication protocol ensures two things:
+  - Serializing the messages to be sent over an MU.
+
+  - FW can handle one command message at a time.
+
+- c_dev:
+  This layer offers character device contexts, created as '/dev/<se>_mux_chx'.
+  Using these multiple device contexts that are getting multiplexed over a single MU,
+  userspace application(s) can call fops like write/read to send the command message,
+  and read back the command response message to/from Firmware.
+  fops like read & write use the above defined service layer API(s) to communicate with
+  Firmware.
+
+  Misc-device(/dev/<se>_mux_chn) synchronization protocol:
+
+                                Non-Secure               +   Secure
+                                                         |
+                                                         |
+                  +---------+      +-------------+       |
+                  | se_fw.c +<---->+imx-mailbox.c|       |
+                  |         |      |  mailbox.c  +<-->+------+    +------+
+                  +---+-----+      +-------------+    | MU X +<-->+ ELE |
+                      |                               +------+    +------+
+                      +----------------+                 |
+                      |                |                 |
+                      v                v                 |
+                  logical           logical              |
+                  receiver          waiter               |
+                     +                 +                 |
+                     |                 |                 |
+                     |                 |                 |
+                     |            +----+------+          |
+                     |            |           |          |
+                     |            |           |          |
+              device_ctx     device_ctx     device_ctx   |
+                                                         |
+                User 0        User 1       User Y        |
+                +------+      +------+     +------+      |
+                |misc.c|      |misc.c|     |misc.c|      |
+ kernel space   +------+      +------+     +------+      |
+                                                         |
+ +------------------------------------------------------ |
+                    |             |           |          |
+ userspace     /dev/ele_muXch0    |           |          |
+                          /dev/ele_muXch1     |          |
+                                        /dev/ele_muXchY  |
+                                                         |
+
+When a user sends a command to the firmware, it registers its device_ctx
+as waiter of a response from firmware.
+
+Enclave's Firmware owns the storage management, over Linux filesystem.
+For this c_dev provisions a dedicated slave device called "receiver".
+
+.. kernel-doc:: drivers/firmware/imx/se_fw.c
+   :export:

-- 
2.43.0

