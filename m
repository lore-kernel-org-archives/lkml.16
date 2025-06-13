Received: from SEYPR02CU001.outbound.protection.outlook.com (mail-koreacentralazon11023074.outbound.protection.outlook.com [40.107.44.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8E3624BD1A;
	Fri, 13 Jun 2025 09:39:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.44.74
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749807553; cv=fail; b=hJ5Ca6qzIhTiNFw2n627Z7moMqF75aoifpGmFBMups6/uz83A+Dw3/l5LTkvZPIoS37ExUfFtKPHgqQeHZYhOo/Jj7UvkjFu+eyMhN3x5+70NjXPPIgYwkam8GTJ/OByXF6t2jpbCCk9WGV2/gzHaOaAXs81/h59G45Qx1QWP68=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749807553; c=relaxed/simple;
	bh=IaFTtqOUvikSiFdGUlCrv1cDojZ/16nQR75Sb7OrtP0=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=GRDRw0JivUmUR9Bcd95cYTSexYPY3AOQNkQvdcvaeTqejN7RHmTdW+foleeV0fcwmn0aYalENuRR9aTBSFhGM7MaT6zEq189C+7LmI2UN+ccoTsHWOKDWWnmxH8SYB1S3T2DtL8UC1XSRIoXN9cjPN81ohYk2PS9hb+Twk4HqlQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amlogic.com; spf=pass smtp.mailfrom=amlogic.com; dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b=qapbt+xR; arc=fail smtp.client-ip=40.107.44.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amlogic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amlogic.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b="qapbt+xR"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rPQw/0AQy+uF9Gki9qRFt0k3UY1ekbJ8HV1Gy2OPBAZXEX7DsYS2qVMl1Q1zYCO2fyB0V9rN516WVJuv/n3OrFCpReg7g4jfrusd+sII30hmllZAOFt9xqLgDrLvjNTduYLjN/H/z9ZX62TH2sL7jV3Oml7bIqC/QzmttghLw2UwAtu+9dcdp9RjO0JpsgJpjnuM0ojwYJFOiJ5Ho8Fru4YMCZiezwdMQVYbjiev4ShbYx2EUE6jkPLwbDTCWtIVjgs8Vma9JmmmeTSSOqnhNoIQ5LLvrLvYoDBw1JJEm9R5NSHKW2p7DeNHan3FFOG6064VH7S5mDfUJJ7aTQIhhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PijZJiYHSmOkV1ew7Oz60T6GDs942y8HTyI1XDVHxVk=;
 b=Q8GcLBKUVuOiEBSeco3LihH7BfIoqvP5yyoHSe+VrkbFwvw3ayD8tQTWYB/VbrA6PyAFmbWz1HLUbjNp9Nh1sSZ/34NG8yuYP7aMfiG7IcFmd1T7mYRYvTM0+VzkbTIRVKB5zPiHuFwIF7SpmS2XMr/RdzrIUYa8NzeOD6utxoUDNwPUOz8+e6izFebOXJhQT70DEDHVX9O3v9p3aTucm+qJLDOZx0imc5gb9zTm4OuIgGz+yMfpp7TZD532TQszq8/i5DPoC7ouA73chh3JGnuFMv41mFrWkL8eEa2iDnwrR8tZfM+Razi5h5ALF/7+6galq5CRQlK7NYsolNxhSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PijZJiYHSmOkV1ew7Oz60T6GDs942y8HTyI1XDVHxVk=;
 b=qapbt+xRnneVCU0jGRSpmFimShGWDMvOJgGxlkQbwsAm7hxUv7+Gx+LMeDychpHD4IwYic6Vw28bs8yBvF1DKe8XClc/N/5gKkro7qcoFSsPPU1kNC5bU2KwLRbOiyjBhv/jGjlfzCNG/xzJpqeJU/vfj2KTvHZy3vFXs1whBMXk2gTtmetwean3b4SU4pxX4pVfC3J5dSeDLjgRZ7t5/b6c7aegDwuoLWxUKuAzrIrKhY5tB64lG+Wlmryjww4+PZO4EvWy1TmWBwMx8P/a7zd+d3qdsbkgAZZoCvJRGPxB9TJVsO8bSqFlOT2ouDptTm2EAsWyEglYg3hnDqcBgg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from KL1PR03MB7149.apcprd03.prod.outlook.com (2603:1096:820:ca::7)
 by OSQPR03MB8526.apcprd03.prod.outlook.com (2603:1096:604:280::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.26; Fri, 13 Jun
 2025 09:39:07 +0000
Received: from KL1PR03MB7149.apcprd03.prod.outlook.com
 ([fe80::a311:33f6:519d:73bf]) by KL1PR03MB7149.apcprd03.prod.outlook.com
 ([fe80::a311:33f6:519d:73bf%3]) with mapi id 15.20.8813.036; Fri, 13 Jun 2025
 09:39:05 +0000
Message-ID: <faf7d7bd-489a-4cc2-bb00-7df5980161cf@amlogic.com>
Date: Fri, 13 Jun 2025 17:39:03 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 6/6] clk: meson: t7: add t7 clock peripherals
 controller driver
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Xianwei Zhao <xianwei.zhao@amlogic.com>, Chuan Liu
 <chuan.liu@amlogic.com>, Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Dmitry Rokosov <ddrokosov@sberdevices.ru>, robh+dt <robh+dt@kernel.org>,
 Rob Herring <robh@kernel.org>, devicetree <devicetree@vger.kernel.org>,
 linux-clk <linux-clk@vger.kernel.org>,
 linux-amlogic <linux-amlogic@lists.infradead.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
References: <20250509074825.1933254-1-jian.hu@amlogic.com>
 <20250509074825.1933254-7-jian.hu@amlogic.com>
 <1jo6vvy63e.fsf@starbuckisacylon.baylibre.com>
From: Jian Hu <jian.hu@amlogic.com>
In-Reply-To: <1jo6vvy63e.fsf@starbuckisacylon.baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SG2PR06CA0218.apcprd06.prod.outlook.com
 (2603:1096:4:68::26) To KL1PR03MB7149.apcprd03.prod.outlook.com
 (2603:1096:820:ca::7)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: KL1PR03MB7149:EE_|OSQPR03MB8526:EE_
X-MS-Office365-Filtering-Correlation-Id: bc6287ad-b159-4be9-3b28-08ddaa5e238d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TXRva25YSEZQcTRoK0JNYWpDcVVVeTk5WU9qUWtPaEhkNlkrbXRsK3BYRWpz?=
 =?utf-8?B?ektTaEZaOEo2a2FOeVFIYVkrZ1RBaFh3WTR5dUR1eklSKzkwdlFuOENoN0x4?=
 =?utf-8?B?cUw5R3dHTzYwK0lnRDI0bVZzeEIxempySGI3VkxlYjA2SzFzektCSkZad2xM?=
 =?utf-8?B?VkZIT2drZk1IOXBrRkdVNU5JUm5VWDRXeHRMampLOGJIMHNtNTVIaTk1aEF0?=
 =?utf-8?B?dFRsTStkYWJhZisySmxyblRtMXZLUjgyanorOUlFTjRIblp0d0ZtSGJVSVIr?=
 =?utf-8?B?a00xOTNjRzFYQ2ZHWVF4Qkt1MEFkd1VxNkEzczZBSGpBUWs2Q2NWa3lPZjBi?=
 =?utf-8?B?Vm1IUlZjRGJBQlVLR1h6K09iSVMrMHovVHYyUDlqOTd5eHBYTnZObEg3WFJ0?=
 =?utf-8?B?elF4cFdDVkJzYXAxUUdTbjJmMTJsdjdVdmYwamtBMHhrZVlHNjBMc2lvU0R4?=
 =?utf-8?B?TFFuZkNrZHRWMXZ2YVBpVUVadTZKNDZIbHgvT3V0TnhLOURTQVdXVFJKSHJp?=
 =?utf-8?B?OXhpbnhvcW55ZEwxczF2anlYQ1JEa3drODcya21oc21hSFJBUmFiaC9IRTVR?=
 =?utf-8?B?S09NOFR3VFhhZ1RsU29NNnhoSGlIU1o1ZEM0ZjNIUkZvbHpoTWZXL3FRZFh1?=
 =?utf-8?B?VktSTUVvdU1SV09EVWxJc2RSZVZNY1phZU5hREJJNURha2p0Y1JuM3F0K0s1?=
 =?utf-8?B?bDgzcDBlSmNBT1hKN0F4cXF6ZzB5bXBFLzBreHYyYnFDV0xlcEFlUHliTjB1?=
 =?utf-8?B?aXFGdVc1OGJxajlmWWR0WnJkWkIyQm5XRDF4QmdIWkM0ZUpmSFc1eFJjQ1FR?=
 =?utf-8?B?R2J4eG43VFFlSVVtaC94VGpYSDYzR3pBMFlXajJKT201MUF4M0F2Rk55dHEv?=
 =?utf-8?B?MkROQ2ppRVpLTWFHOGJ0WDQwM28xb0NvSGV0UHI4NUxHOHpwOXhuM3BLRHBy?=
 =?utf-8?B?dG54NTZUa2NRbC96aWpEVVpGZ0RPd1JlYy8vekFvUGNJVzJrV08vbEQ4OWhp?=
 =?utf-8?B?SWlFcGwvODEvVFVNWmRWT0JmWWNrZy91RkNRYlZBNWpKUXYxdlJ6VkJ1aDhz?=
 =?utf-8?B?ZkorMXdSaTY2L2ZYaDZSN0J5VEt0ayt6MHVxS2VURlo2MGx5a29ITE5pUEVY?=
 =?utf-8?B?TjlOdHh2dUlwblZ1U1hPSkpERE5mdE9sQ0NtZTBGa1NudjBRbmZKSmtHZXp5?=
 =?utf-8?B?Wm01bkVqUy9DeEo5YjJzZDlIS2hzTUo4cW9IczZ2dU9qcG5RODZ0MXk4elRj?=
 =?utf-8?B?c0p0QmJxVGN1RGxjSitVbnJqVUQ0d0txaXJjSENkYmYxbW5ORCtuRlJWd05R?=
 =?utf-8?B?dHZGeFg3ZTZvNm1SSjk0K2plcmFrc2tYU3hFSktTa2dDd2d2Q0Vxd0dxWXBC?=
 =?utf-8?B?Q1M0UHp4Z290RUt1SkRybGlUY2JwUndxdGpZcG10K3NKdnRBTTU3VWFheWtW?=
 =?utf-8?B?eU5wZkx6SVpNb0lQeWRCRVlhWXdpQ3V1UlpjZ1gwOERESC9ob2tQd0tLUFF0?=
 =?utf-8?B?VW4yM05CVmJXRHp0ZnhySU02SGxsZ3hlZ1Y1SEttOGZuU0VmcWJBUUVGSWJ1?=
 =?utf-8?B?U1Z1Rkx2Rjd5aE95RXR6djZRS282dURwcFNpSWtkdXRsVnNoL0RmMm01NXlZ?=
 =?utf-8?B?YWcwMDBrK1hya3IzYVRuTDZNYzBrUnlHZnppdkhzMGdGcEpEQVNaRUJaallB?=
 =?utf-8?B?N213SzF3eXVXTGt1NkpZdE5yN1RUdFVHS3Ftd05YRG1rMmM3d2xYTUp1NWht?=
 =?utf-8?B?b0gvZWU2TU9CZGJPRjVxdTNjNWJodXZudDJqV1RNUnN4bkRkV2J2dlpWZlc1?=
 =?utf-8?B?QS94RXppN1kzZWVNb2hCdlhQMDNXbkZsR0g2aVFKN3krT0x3dkN1NzBqRDVn?=
 =?utf-8?B?S3hRUHp0VW4xOGllNng1WmNISzl4Mm5XcVhpRnlQK0RQbDFPQTNLY29QcnBr?=
 =?utf-8?Q?nsmuOAdeTCY=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR03MB7149.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SDNUaDUvRnZoTHg4ZksrTWZmTmM0eFE4YU8xZCtFSHlZcTJmK0RKZXgvYjhY?=
 =?utf-8?B?V1NCZWtsTjlmUStmTGRnZWJ6dHZuV2FYNEdFNUtwenhGNWRZK0dZVk9PL0lM?=
 =?utf-8?B?VXo3MTF4L21sazB6d0dSTkJ6MllqQWVqcGEvc0lMZUZDSnMxUDVBbWFqdjRn?=
 =?utf-8?B?MlFLYVJWd015OGxvd2l6OFMxRlBjS1pZeTFidDhOMjNNcnJZbHdyTnZ5S3E0?=
 =?utf-8?B?UGd2U0h0NitTU2RZakd5RmdzVzg1M09Ydjd6eWR4bk0vUEt5Nkx0ODFicUpX?=
 =?utf-8?B?emJ5WFF4OG53QVhqb01ZK2g5L0tJTThkdHF0V25NTkRpZkthZFh5NkZnTHpl?=
 =?utf-8?B?ZERMN2ovZDY5UzRCSXdpVWZUZzhjL3oxZWNOUEtmZnNyY28yU2c1TWg3WkY3?=
 =?utf-8?B?aXhrMk85TUwwNEFweVl4WnhwWU1ZU2ViYWFYcjF3TzkrUEdaOHNJNExDT2dI?=
 =?utf-8?B?UWVLbVFGa3h0SDRsL2RaaGNHbnRPa29kYW1NcEhMb0dGaEFOUXlQUXhjd1Na?=
 =?utf-8?B?RGMvZ0Mrc2FPVzVRcDN0ZjBCZFBqSHVtS0xLeDhQVzAzUVFNN2xuWnpVaVJI?=
 =?utf-8?B?Q0pjQStVRldOclZUdFZ0Z3JaWDdqejc5N0FpaHYzeDlDMUE2YTlRZ1hHaS9U?=
 =?utf-8?B?VGRSbGh5OXpHc3RiZjlkQmtwazdMbjBLUXRwOU1UMTBrREFGb0FyYlFVNWV1?=
 =?utf-8?B?S2ZzbHc2MytjY3FSYTZEMkpTNFdsTmpNZWtkRzRuZUdBN0sydTZUMXJFOXRL?=
 =?utf-8?B?TDRhamFKYnpPTThlQys3N0Jpc0xQRm0veHNLaUVBT0ZwemE2KzRPQTNCVkNj?=
 =?utf-8?B?MXpBUHA5VGRUMTZad3M3TzRvTVIvS1dic1ppekFWaCtMeUl1eHJXaGJXdWVC?=
 =?utf-8?B?Q295Z0NRRTZ4SXhPL1UvUG1SZ2ZQQ2Q4a3ZOcitvZjgzZkxNWmNzdCtUbHRX?=
 =?utf-8?B?bS94ZjRpT20xc1NpcktpRjNQTThqbkpjN0kyZFBVeWkrL0t4VnhieTJId3g1?=
 =?utf-8?B?SE42ZXllK2lsdXk2dWxPeC9INVJ3ditSYTB4cVZjZHhIeDAxcGg1cmRVcGZR?=
 =?utf-8?B?SS9MS29GZldhdjIxTVlJVHYrN2RuSDNpU29Rb1dOVGt6amRsZ3ZMZ2x6R0FU?=
 =?utf-8?B?TDNLc1VkK1BFR3pQRlByM3VXay8wU3BPY0FqVTRPNjdUOU11dFViLzgvRnJa?=
 =?utf-8?B?WVVjUnF4S01lcjMxMlVyczBiR3Y5a1B6eW5jdHcwdWlDS3N6M1VOL1JmK08r?=
 =?utf-8?B?eE5FUzFHZk1sM3RKVlhlS3diYTdhakxiWWI5Zk96N0dYREVGQytTODc1MENU?=
 =?utf-8?B?UEVOeElRbUxMTHRld3ppNGlKYzFYaSt5R0VBUnhQVDRvbFJZU1NnQjNyUDMr?=
 =?utf-8?B?TEVvZE9ncExyazhjUWc4aERhTnVvK3RvaWNiSGJrSU52dXdRSmxsaXo5Qncz?=
 =?utf-8?B?Nm1LdVp1eUo4Y2NIV1l5U3pUdjhpUXhCbjZRb2ZnUDdWM2dQRmVCK2RNbUlZ?=
 =?utf-8?B?Z0FHZGttSDVJWFROd3psZUZwZDlIa0pDbmlmSytPVExMZmlwc0dhTENFc1RP?=
 =?utf-8?B?MENwNEg0M3dvT29Obnc4dzFGMmI1LzFob1QxM21tK3ZOemx2TUU0ZU40Nmtm?=
 =?utf-8?B?YWRxTHdXV2J1WWtqdENtM3dZdTdyY2lndDR3N0R5aUVKRW1vZjdwRTlyaW5i?=
 =?utf-8?B?RXdmWU1COTBxMTFEbkExUEJlSzBsb0MvdHNaamlmby9NUWE5ZkNwVDk4WDNZ?=
 =?utf-8?B?eGFEak1VMm9YeTJWaUsxOVUwNjluYjg3WDA2MEQ1SklMWnMzSWhEUy9GQTBU?=
 =?utf-8?B?VnFaNi8xS1RQYXVIaVR4V1NjeFFVWjc3c25WQU5MZi9jbllmdklNc2pIVHhF?=
 =?utf-8?B?K0lXb2hISXRFcE9QdXJOcDFnUXhNQVhPbk9BM1A5MVE4Ull1YWJSZDU2eC9x?=
 =?utf-8?B?bERWQTRHek5OVHRyNTNBRlF0RXNPeUYvSjZoUkEvN0l2U1VueGlFd251cFR5?=
 =?utf-8?B?cXFBTi9KVjFpVnF2SkxSMDVpUHVjeWpqL2pJT3BKV2JCUEZtSER4Q0tFcVZv?=
 =?utf-8?B?c0lVWXgxT0NoZEJSek05em5lVUx0ZDBzSXFDbWFFVkt5dVE1YVhSd3lIak1G?=
 =?utf-8?Q?RFhSYDIXg4D64VIFKpgx6WvDh?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bc6287ad-b159-4be9-3b28-08ddaa5e238d
X-MS-Exchange-CrossTenant-AuthSource: KL1PR03MB7149.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2025 09:39:05.8142
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /9jhUEpmGEIoZJGENaIFKW+HSgso5gPCMJdm+JcCgiozRDbRCUHNkZA1HD1vWAfq4WrPfVVi+qqY+d6EoaWS6Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSQPR03MB8526


On 2025/5/14 16:00, Jerome Brunet wrote:
> [ EXTERNAL EMAIL ]
>
> On Fri 09 May 2025 at 07:48, Jian Hu <jian.hu@amlogic.com> wrote:
>
>> Add Peripheral clock controller driver for the Amlogic T7 SoC family.
>>
>> Signed-off-by: Jian Hu <jian.hu@amlogic.com>
>> ---
>>   drivers/clk/meson/Kconfig          |   13 +
>>   drivers/clk/meson/Makefile         |    1 +
>>   drivers/clk/meson/t7-peripherals.c | 2359 ++++++++++++++++++++++++++++
>>   3 files changed, 2373 insertions(+)
>>   create mode 100644 drivers/clk/meson/t7-peripherals.c
>>
>> ......
>>
>> +
>> +static u32 t7_eth_rmii_table[] = { 0, 7 };
>> +
>> +static const struct clk_parent_data t7_eth_rmii_parents[] = {
>> +     { .fw_name = "fdiv2", },
>> +     { .fw_name = "rmii_pad", },
> Are you sure about that ? check the bindings


Ok, rmii_pad is optional parent, I will update it in DT bindings.

>> +
>> +#define SPI_PWM_CLK_MUX(_name, _reg, _mask, _shift, _parent_data) {  \
>> +     .data = &(struct clk_regmap_mux_data) {                 \
>> +             .offset = _reg,                                 \
>> +             .mask = _mask,                                  \
>> +             .shift = _shift,                                \
>> +     },                                                      \
>> +     .hw.init = &(struct clk_init_data) {                    \
>> +             .name = #_name "_sel",                          \
>> +             .ops = &clk_regmap_mux_ops,                     \
>> +             .parent_data = _parent_data,                    \
>> +             .num_parents = ARRAY_SIZE(_parent_data),        \
>> +     },                                                      \
>> +}
>> +
>> +#define SPI_PWM_CLK_DIV(_name, _reg, _shift, _width, _parent) {      \
>> +     .data = &(struct clk_regmap_div_data) {                 \
>> +             .offset = _reg,                                 \
>> +             .shift = _shift,                                \
>> +             .width = _width,                                \
>> +     },                                                      \
>> +     .hw.init = &(struct clk_init_data) {                    \
>> +             .name = #_name "_div",                          \
>> +             .ops = &clk_regmap_divider_ops,                 \
>> +             .parent_hws = (const struct clk_hw *[]) {       \
>> +                     &_parent.hw                             \
>> +             },                                              \
>> +             .num_parents = 1,                               \
>> +             .flags = CLK_SET_RATE_PARENT,                   \
>> +     },                                                      \
>> +}
>> +
>> +#define SPI_PWM_CLK_GATE(_name, _reg, _bit, _parent) {               \
>> +     .data = &(struct clk_regmap_gate_data) {                \
>> +             .offset = _reg,                                 \
>> +             .bit_idx = _bit,                                \
>> +     },                                                      \
>> +     .hw.init = &(struct clk_init_data) {                    \
>> +             .name = #_name,                                 \
>> +             .ops = &clk_regmap_gate_ops,                    \
>> +             .parent_hws = (const struct clk_hw *[]) {       \
>> +                     &_parent.hw                             \
>> +             },                                              \
>> +             .num_parents = 1,                               \
>> +             .flags = CLK_SET_RATE_PARENT,                   \
>> +     },                                                      \
>> +}
>
> Again that something that has been repeated for way too long.
> You'll wait for the clean-up to be done. If you want to help, you can
> review and test the patch being sent. It may speed things up.


I want to confirm here .

you said the clean-up patch is not related to spi and pwm clocks, Right ?


I can see the regmap drop table patch [0], is it the sending patch?


[0]: 
https://patchwork.kernel.org/project/linux-amlogic/patch/20250120-amlogic-clk-drop-clk-regmap-tables-v3-0-126244146947@baylibre.com/


I will apply the regmap clean-up patch serial and verified it on T7.


If not， Please correct me.

>> +
>> +static const struct clk_parent_data t7_spicc_parents[] = {
>> +     { .fw_name = "xtal", },
>> +     { .fw_name = "sys", },
>> +     { .fw_name = "fdiv4", },
>> +     { .fw_name = "fdiv3", },
>> +     { .fw_name = "fdiv2", },
>> +     { .fw_name = "fdiv5", },
>> +     { .fw_name = "fdiv7", },
>> +     { .fw_name = "gp1", },
>> +};
>> +
>> ......
>> +static struct clk_regmap t7_sys_gic = {
>> +     .data = &(struct clk_regmap_gate_data) {
>> +             .offset = CLKCTRL_SYS_CLK_EN0_REG2,
>> +             .bit_idx = 30,
>> +     },
>> +     .hw.init = &(struct clk_init_data){
>> +             .name = "t7_sys_gic",
>> +             .ops = &clk_regmap_gate_ops,
>> +             .parent_data = &(const struct clk_parent_data) {
>> +                     .fw_name = "sys",
>> +             },
>> +             .num_parents = 1,
>> +             .flags = CLK_SET_RATE_PARENT | CLK_IS_CRITICAL,
> Do you really intend to for the rate of the sys pll to be set through
> this clock ?


Ok, CLK_SET_RATE_PARENT is not necessary here, I will remove it.

>> ......
> --
> Jerome
