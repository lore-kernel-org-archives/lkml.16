Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2073.outbound.protection.outlook.com [40.107.22.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FDE7258CFF;
	Fri, 25 Apr 2025 13:38:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.73
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745588342; cv=fail; b=eZCGkR0tWZXG/RXAiBjMBUOt2XQTwX8io/Efc5jHle21oJenq/yWdldYTH395gZe2IA+4pioR+IG4+1Ad8HxNQU1nEMSM0GVmRC8HFFMR0xCfgeKx34v/SMfkjUGbPUuqfhu1dDmtyd0zguotBPp/c7oQy3PSktqe/842OIfGyY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745588342; c=relaxed/simple;
	bh=OzeSWTQ8pkFd70KLrEBR2u1L3tVlLYzKpWoMLGmCQe8=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=HUAeC4rvHe9mEcOfW+tQsF/nQZrdOyYskY0mzr/jCdvIS+5dKdZsTA/OYXBOZUeN0Pqo8QjBORwokm/EAzt7QFlmh1AMZ1GwDxXtMfU7j51GfxhAbGOFTx5EfD7xsitpPT+ucPw1jEsSLTpI3MZLNM/8b66L8ld+1iQ6YqsZ9m0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=f/h3IqVn; arc=fail smtp.client-ip=40.107.22.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="f/h3IqVn"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wOlgMOsevlQJWXHJptiotCDG+affhDijdQKRtOg6FVXO5TKabdtd4jpPjyY2rW8KqZOzrbl75piCy8i3iXqix/wIi3zZvAxaRASreY4RrM39XjwG9+ddgLTIYwH8YXCtN517+eof4AcHUXAdRhOXee4ckj84VSVZgvJlqJC+gEzazx5Rut2uIi/HupdAEfCFWp9gydg19KjpCUfuqOF3OjYovkmx6zHlL1MvNX3RaMoue7ZkhryTtVKy/N1FrklA3gNUFXj0s8D9n4LYPEp4yS0UMW4EPOUhCknd9o0hK57spWZ0R/whGwo8bkDptw4TiDBqQlh8+NYPBDVCWQftzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2hIe7qlOREVblDS5RVeGTxxnk61nDJ/pHaYEZx3tMPw=;
 b=zOCTwzCR/gO5I9OhRSD69irl1Ebz2vZ22e3A3NthuerOG1k9oZ6IFiXb2KTxnS7yRpWRtwwOJI0ydgecCQF5zVhr7dWJ8ot2OGaBGg/hNb3bDkx2cqyXy0IUiYiZc84hJajM8KPoqHhUnHVGCtUNErWZR38pfdNFx0xv82AoxAG4MprXYsegcfVRItWwGoXstXc0Bcky1P1PCXJalmIzm6xz9KMxdwvym7CBu82f8NihlaLQCf6rmhCOYIhc5MWXCs6KQw9MviIb+Px7sWdTRB7bRGmWcBJ+tjj7pFmfaLiKNQKYQuFKH2EZnt0iQnZ8j09tjTpqeVznEL3cnjzxMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2hIe7qlOREVblDS5RVeGTxxnk61nDJ/pHaYEZx3tMPw=;
 b=f/h3IqVnurOfqapg9VR+lh1dFSW9qz0+7XkRsQXCk/DQTVaZkKcyRGHNlirFPRTC4Nzk8lmrDly5nQC75l0b0LvPSyo5d//9uMLLl6dTkkkUQzzITiEDuc520FDDOe0Vmfg7kudiaYhg+AiXMeTZh8wQ7vqebugS/LUCkx/tujV6lvJA4jdcC5fmAMUcKo4cIAK9JRe8faEtw31MnK90IDHOPP2ZGvTWK0PMh391hS8mZq2cZBwF6XudVBPrpmxwdYiKQoiFzPpmoz+pxUv0B3+e3qp1JyjqU9m9KzLEu6hDQ95xc1qG0qpgeqwOk/5ACf0GZSARb9I2SFIpwc4ohA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM9PR04MB8604.eurprd04.prod.outlook.com (2603:10a6:20b:43b::21)
 by DBAPR04MB7253.eurprd04.prod.outlook.com (2603:10a6:10:1a2::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.27; Fri, 25 Apr
 2025 13:38:57 +0000
Received: from AM9PR04MB8604.eurprd04.prod.outlook.com
 ([fe80::e751:223e:aa3d:5827]) by AM9PR04MB8604.eurprd04.prod.outlook.com
 ([fe80::e751:223e:aa3d:5827%7]) with mapi id 15.20.8678.025; Fri, 25 Apr 2025
 13:38:57 +0000
From: Pankaj Gupta <pankaj.gupta@nxp.com>
Date: Sat, 26 Apr 2025 00:31:37 +0530
Subject: [PATCH v17 6/7] arm64: dts: imx8ulp: add secure enclave node
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250426-imx-se-if-v17-6-0c85155a50d1@nxp.com>
References: <20250426-imx-se-if-v17-0-0c85155a50d1@nxp.com>
In-Reply-To: <20250426-imx-se-if-v17-0-0c85155a50d1@nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745607704; l=1446;
 i=pankaj.gupta@nxp.com; s=20240523; h=from:subject:message-id;
 bh=OzeSWTQ8pkFd70KLrEBR2u1L3tVlLYzKpWoMLGmCQe8=;
 b=qODjlsPnBJgeKEzgeM53wAonD6xmknJ6FHzMCkxTZYKINJ54mzf5yO0BQqajcFRy1lhR2lFHc
 q/CWsI6T7sdDfsnjHZWfcsHDCujOdO9bPspEKMDVcfJI7oLHJgHWa+O
X-Developer-Key: i=pankaj.gupta@nxp.com; a=ed25519;
 pk=OA0pBQoupy5lV0XfKzD8B0OOBVB6tpAoIf+0x1bYGRg=
X-ClientProxiedBy: SGXP274CA0011.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b8::23)
 To AM9PR04MB8604.eurprd04.prod.outlook.com (2603:10a6:20b:43b::21)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8604:EE_|DBAPR04MB7253:EE_
X-MS-Office365-Filtering-Correlation-Id: 71d9863d-44de-4493-9772-08dd83fe8795
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UEJxR3lxdGFGa1grSTVPZXo1Z0NkeGh0K3MyU2FBZnJLZ2pCTjQ2VnBpRVdk?=
 =?utf-8?B?d1NCRTYrSzBmQ1cxenIrVXpRelEwQWljSEdRNVlxK2ZqT3dLcEliL2h5NlNT?=
 =?utf-8?B?Ym5mYmpDek1vUWhZTGhhZWo4QkNNMGtHVzhvS3NYRVRVcFlVKzhoVkRROVQr?=
 =?utf-8?B?UDdwdkFQVFpCNzZKdmxBcEh2L3V0RjdpSDBXU1p4ZWtuY3l5a3BpVEtMaDcy?=
 =?utf-8?B?Rk9FQnZDNFhsYStHMkR3OXVoMm10bXg0YnRSM3Q3UW8rU2I2SzZZZThZSTd3?=
 =?utf-8?B?MERsUDdSc2J3aFpnVkoxbXlDZ2JTUDE3czNqcXo1dHp2cGdHQ3ZXOTZUSll6?=
 =?utf-8?B?ajBwUStOUitPUGZNTS9BTll6NXhFSk9UeEpRRXdpSmFjVUkrbW0zMjg2eXJ6?=
 =?utf-8?B?bmpDQUUvM1d2enVkeURaV0pDVmJDYmptbUh6YmxjRVhjK0g3djNhVFUyUE1y?=
 =?utf-8?B?K3Z0eDFydmNubHpjamRtZjVjb1BDT29FWlFwZjVDZmVnb1kvOGFaVlMrZEdH?=
 =?utf-8?B?WDJNeXdjUGd1S3V5U3BjdGdSd3lyWFgwUWdQRitlWDF3ejZiWXB1Sm9ZZEpZ?=
 =?utf-8?B?U0pvOW9Pd0UrYVNmb0pmbUZLRmpWMWZSQmVQajdnQytIMjRFb1M2SWdRSWNp?=
 =?utf-8?B?NXdOemlPZWpBMTVuVENTZEt0SDEyQmdIbXoycDkrZ0N4SFhpZW0vak1lQUlx?=
 =?utf-8?B?OW5pcWVtcGlCaGR4dFluM29Ndkhrem1VdTF2UU9RSUVoM0pMZkJTZTR2d01i?=
 =?utf-8?B?TVIxUEluUVMwMUNra00yUFVXd0FxaFdsTUdJRDdtdGgzbGV1S2puWXhhem5p?=
 =?utf-8?B?Y0d0RVFrRFNYOUgrMHRWbHdWaVBYKy9sVlNuaWI1UWtGdWZPbVhKWmM0akVr?=
 =?utf-8?B?bldZdjZycEtEOXBQQXViRW9hRWFPQ0JJWFg2VHlSMmg1bnUvN1h0OFlaZDZM?=
 =?utf-8?B?eTdYYXRMUnRCYmNFQkFYbUs3bVErQnkwbnZKUkd3c3I3UmxvbjR5SGhxay9s?=
 =?utf-8?B?TkdlQ3RvVkVLNVk3ZHUrK05UYktxOWVtRmwwL1l3QXdqQU1IeGJSN1hvMlRz?=
 =?utf-8?B?V0k3S2NGUWRqZHhFRGZIcFZCYlA1bzFRUW8zSWtJU2NjLzhFYXpBSWhJZFhX?=
 =?utf-8?B?UDJVcU9pdkEyVkVCSElaVUZ6NUVkS0hEYXFDNm5NTFZneEgyTkhJbGhqWm9h?=
 =?utf-8?B?SVJRRGorbXoxcUNMWVA4ZlA5VnhxVllaZktZMGw4R3hsUjJRQzQ2WE1JOElz?=
 =?utf-8?B?YzJzbDZhUUJ5TXhyRU03Nmx2QlhIQytnNmx3bmxyQ0Ntd3JRYnE4MEpTZ3pL?=
 =?utf-8?B?aXEwd0FySzlBS0RyTlFEZWtGZ3BLRkNXaVMrZ1NiekxLWUlCMm1qYXZmQjZF?=
 =?utf-8?B?YUM2R1loOFhYd0NZZGZhNHZuamRhaHhLcEI2TkVPZm94QUxyUEFTMHpvY3Na?=
 =?utf-8?B?dGxMVDRVK29rRlhWMC9jbUUwNXR0RC9yemVRN0x1WWZjanBkNk1lNkZkK1Jr?=
 =?utf-8?B?Z3NGWURyKy96RDNWMFNWL3hzYWVmRXRWVFV5YUVCdDF2MUxiOEdsVkQ0UmE4?=
 =?utf-8?B?RjQrY1hpaERaODR0MEozMzZFTWhWRjJSRnF2WXBqdUc2dWJRdVN5aElETDVz?=
 =?utf-8?B?WnI4TUdKYlhuZ0lCNmJvNGJlakV1bUVwc0tZeVlIQ01KenFtdFNlVDB4UHJS?=
 =?utf-8?B?bFQ1czJ4N0NUMk81YWxNRzkya3FwaHJEbmtlTXFVQWxhTzBNOE10bUxXUnp5?=
 =?utf-8?B?Zm9ORVRDcTVEOTB3dmFIdFBvdGJwVDFVdU1ZZDZ4ZGJDMndYblJCaklBTzFL?=
 =?utf-8?B?eFJiZjNnbEVlSlJxQ05DcFI3QW9BZk9NQ3FlTDdMOUlBcUhoL0hSaGFGdTVS?=
 =?utf-8?B?TXE1Q2RQWGVnYURmWW96SlVURENHUnRtNE9UcjRqYUxlT3VROWdTL1dIWE96?=
 =?utf-8?B?czlkMlhLa2NoU3NlMHpDcTJycE5BZnNhZDFHcGsrSG5qSjRNWFBPUHQvdk1l?=
 =?utf-8?B?OU05VmlDeUdBPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8604.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?M3liaHE2L3RpdVVWcDZoaXVsSG9mVG1RelFHWTdmQU5ySGZjdmcva0hwMlJW?=
 =?utf-8?B?UnoyQXhSME55bzA4QXlsV2wwdlM3TUsybllWd1pXc0p5b3RiOWphS2JVUVZo?=
 =?utf-8?B?L29UTnI4M3RhSWMxU0x0YlFSN21USENsckpNN0N4TW9QeWw5VHU4c3RkL1Nw?=
 =?utf-8?B?WjB4Q1Y1ZVpuclNWZ1JmYlNDQWNkZ1M1NlZyZzNWMnl5Y0xxZjNuaXlxWnVL?=
 =?utf-8?B?OVB5YmJpUC8xcS9ZYXVpazdCYnM5c012WnJ2T3BnanliQ1IyQXNEOFVjeDRa?=
 =?utf-8?B?ZlJ4WFVNajcxVk5SWmlBREY2U1dNeGtrM01WcHMvYWF4aTJuazAvU09tK3NN?=
 =?utf-8?B?MXl2VU1OYmlLS1IrR0FESUx0bGVJZDA4bmdubmw0MXpEYVA4NldEdmJ4cWZX?=
 =?utf-8?B?OUVCenpFRW1TUkpKbCtPZGtlY2sxWDFYdWdYZUE5S3JsU2ZRVFVXSkdXRUQ1?=
 =?utf-8?B?VTRrdVdLYkViTTl6ZVNtR2NXTjFEYkpzTlJsTDhsVU0vakF5VWpqbTdYYk5t?=
 =?utf-8?B?Wk1NOXA0K2ZKWWdrakZVMXZHK1Q2cEF4TXhKRWN6eUNsK2llMnFIMk84TWMv?=
 =?utf-8?B?STVvazJpaFA0TlRyeHJ6aDgrQWRScVRBbTg0S1dzWDdYcWhDdDdjT0UybTdR?=
 =?utf-8?B?WUx6Ykx2SCtCRHFmNlZnbVdtWjkrMi90aCs2Qlg4d3lWY0RObExwTm40RFp0?=
 =?utf-8?B?TTA4YkpJQmt4M2pQQ2l0eXZYVjk4TGlsQjU4K1FSclhBZnNISmFNc0NxTTZ2?=
 =?utf-8?B?R0lKZVRCeVUwaldjMVcvZGJlMGdoblpvZUJ3bGVVeDQrdE1yS0JSZVlHeXI5?=
 =?utf-8?B?cVZPdVVsWlBiL3JnaGQ4UUZXY0ZTUWVBYWFmQTlXTUhzMjNaR3JZWURzN2tM?=
 =?utf-8?B?WTdBTTBLc2pNcDNETit2UVJBRmFBeVhuQ2VNUmhVaHR2UGNHUDUvNE5UL2k5?=
 =?utf-8?B?NkswQW9ORFdpVGp2cUc1azVCTmZkM1VDZkowK0p1RGdDQWU0bjBOK09CejAr?=
 =?utf-8?B?MUxhekszRlZUYjRqcFhCNU1LYTdxU0RBa1NPM3BtTzJtMDE0bU9mdTlHZmJi?=
 =?utf-8?B?ZFZTRGlFSnpaUm5tWnk1eW5NZEZPTFA2Q3FjODFSQW4zeEZTSVJrQ2wzWjFi?=
 =?utf-8?B?eDNzbzRXWk50NlY2eVZnNmpYdGo2RWJ4VTlUTW1GcTdYQk1kdnJZTmI4T0xX?=
 =?utf-8?B?SUo0OGdONE82T3BnQmFZZi9XWDM4YndycDZTNjFlVk1sRzN4elhOTWFSL2o2?=
 =?utf-8?B?OGR2azFjZmdaM1lqazhsMGt1R0dCMDZOcS9aM0txY3ZtbGlYMXU4Y244MENt?=
 =?utf-8?B?OFIyZWRXUkpXWklpL0FmU0lrYTFsZ0xaV2J6Yk9EdFRSTkZjbG5rRHZEZGg3?=
 =?utf-8?B?SjFkR2dFck9tRlRhMndYNDRrbW5RUWVvK0dyQVhtMUlnMnJOZ0xYMmZJc2xD?=
 =?utf-8?B?U1hpVGlhbFB4RUFTK2U1a2tKUll3Zm8xc1FCMjBaTzlPVUo0MWdTQjRsY0xv?=
 =?utf-8?B?MDZkM3liUGtmUmZxNkUzbXVaMlNneUtmRWtpVi8vVTNvdDUzWEpjMW1iMUNI?=
 =?utf-8?B?Z2ZYTld1ZDNTbGI4Skg3QitHc3RUTU54Z1d3d1hJUTFqUG1jOVVTUjQyV2xJ?=
 =?utf-8?B?cTFVLzN2MVRSQ0VySXZyUDBzb21LdjA5ZCtjSE1jeXNWeDgwUW5KUmk1Z082?=
 =?utf-8?B?dE4ycXdQVEY2VDVHZU56RlozRU5xenBjWHlRRzBrMFlXeW5sc2RTSkVqY1Mv?=
 =?utf-8?B?VjlRcDBMRG01eTZrR3NlQWF0SWVwMmRpalNEaXphTVlmWjIzMDVuUkRIcFNQ?=
 =?utf-8?B?MUdvTllaY2JLVGFvYXppcmlobzA5SDRsVTB2NldVYi9Da0tWS2YxMWw0OXV4?=
 =?utf-8?B?dC9URVlHSU5RUlhtRkczdUR5UGxrdEJpUldBWi9hcWdsS2dCbnprQzdnUHpU?=
 =?utf-8?B?bUdqZnYzS0J1R29TWTA1L0loVkFNQ1dSekNuKzZBUGpnUFZCdzlPczNHVC92?=
 =?utf-8?B?Z1hGaS9iNk5nM1BFUGRZU2JESDdRVlVMbEtOYU9IVDlFT1RXcTNIcVF5QXZm?=
 =?utf-8?B?VGpYYjBJVnIvYWJxNE5ENW1tRFFaRUEzWm05YmtrWlVmS1FMK3QxNWUrQnVJ?=
 =?utf-8?Q?cqFfHa11e6lNp2goZAYAjeF6u?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 71d9863d-44de-4493-9772-08dd83fe8795
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8604.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Apr 2025 13:38:57.7286
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dYP3CjUJnD9QrECM1OeIRI08NklFIrdFs4BvXE8jDkeYYE+EKLFkfVkYYUVdNvRp1BrXB2awDklV78r2eoQPzQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7253

Add support for NXP secure enclave called EdgeLock Enclave firmware (se-fw)
for imx8ulp-evk.

Add label sram0 for sram@2201f000 and add secure-enclave node

Signed-off-by: Pankaj Gupta <pankaj.gupta@nxp.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
changes from v16 to v17:
- Collected Frank's R-b tag.

Note: copied the change logs for v15 to v16, to cover letter.
---
 arch/arm64/boot/dts/freescale/imx8ulp.dtsi | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8ulp.dtsi b/arch/arm64/boot/dts/freescale/imx8ulp.dtsi
index 2562a35286c2..05db47668b7e 100644
--- a/arch/arm64/boot/dts/freescale/imx8ulp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8ulp.dtsi
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: (GPL-2.0+ OR MIT)
 /*
- * Copyright 2021 NXP
+ * Copyright 2021, 2025 NXP
  */
 
 #include <dt-bindings/clock/imx8ulp-clock.h>
@@ -154,7 +154,7 @@ sosc: clock-sosc {
 		#clock-cells = <0>;
 	};
 
-	sram@2201f000 {
+	sram0: sram@2201f000 {
 		compatible = "mmio-sram";
 		reg = <0x0 0x2201f000 0x0 0x1000>;
 
@@ -186,6 +186,13 @@ scmi_sensor: protocol@15 {
 				#thermal-sensor-cells = <1>;
 			};
 		};
+
+		hsm0: secure-enclave {
+			 compatible = "fsl,imx8ulp-se-ele-hsm";
+			 mbox-names = "tx", "rx";
+			 mboxes = <&s4muap 0 0>, <&s4muap 1 0>;
+			 sram = <&sram0>;
+		 };
 	};
 
 	cm33: remoteproc-cm33 {

-- 
2.43.0

