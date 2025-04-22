Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013010.outbound.protection.outlook.com [52.101.72.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71C5DBE46;
	Tue, 22 Apr 2025 05:22:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745299335; cv=fail; b=LyL2ronJXhS47JMWhVtw36H15b4XQhehWQs++zRZGwFoDg2/Dz+bY/kv3SC+3z+PDv69XKMAT/5LtCCQP0ik1E4GvuB8iBz5E1iAgbQ+IgaYGMc3pTRlckI515CWoA2nNZBmQsDVdcp9Dco8M7Q8y0UXY298gG55T8prW0HvRCU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745299335; c=relaxed/simple;
	bh=F3+uR5fNkDTTPCW6Ty7cgz4Wvf7MaLWyATosqaCKX8s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Bx3pxqchRy8hHYqSDzOG1Hox1UHD58Kdbu3UzvV7oxrO3+/yZbXMBIIJwHD53WnQp3glD2N3Wz4z1ap44zJxdN5zQ7ppXF+HhOb1gB/yaGThtGZWQjFMtZTjyIL1jIKti7vqj5O2JuL0/WXlKEME/JIYGkt6/EqfwJWaYatrMvM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=LeFnk05G; arc=fail smtp.client-ip=52.101.72.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="LeFnk05G"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WHl5mZSDQgBGaWJEqJ72bhea0QAalM376znNLSpk6yLO0EF6Mh8P3KfRJRhxiU/wIqINIrNWQRGhMntXoir+/1oYFq9B8xLFcLlgw2jijHqfzofBfFnAg7CaNUAGuuUZnfSwYa6uh2Pynh4VEs/gqi0h6dW+kWEGh6K4nXj3GHA5G01cyTpXUCn3mOcQjOr7uKfimbsugTAJ3eak7wVqZN3z8Bonvay782CIhU0Xu/kpkqTqOMYaFWNZvm55VGyZhyNyoSwzDvPTMq622ImdxYM7sfelnscz5WQnExLs+Sge/u8GSGurBAvmflbpwRcm2mYGEouQFn7LLnaStWNffA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QRZdlQdHKE9kf5Y2A5dyZHugt6LrLEadC0t4Xd4vRM0=;
 b=Z4zyjq+0MgrnK8pqLdJeS5mwXNlOi+AOLrocYNvRxK2a0gYPifegNFEvhFmPjilWm4wsWFF4//U5Qkdz4cl9K9nNp5GeWA7pXmAQEGv+DFrAs2YjRrfE7U6ndZyOKsQ1r388Do/mwxekTJpnw4tq7sAnvdXY2MLurNHEceUNTJaqfkE5Wi//+mURHdHDNFTlRnVScQLhc1DOxKex2NwbksCtcjMG2oGaSxB48e+J3kJkmUXpcNnGFWJ5Bn2Yow68pj3uHmBAhr93H3zrSrHjztE6cw9KeLtLh8VQQjwZD9SSMvE+lpfQajCvx8hlIbijeF4kPjM10TgUvi46/UwfuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QRZdlQdHKE9kf5Y2A5dyZHugt6LrLEadC0t4Xd4vRM0=;
 b=LeFnk05GqCh++c2F5kq9aXnc/huHibNZSa3XbvaRdKULApoytCsf+D70kqc0FtXDn838m4rd5P7l/wzTRls63BrN4HoOdc3zftC++lkC7P4jcNLEcz28HKER+v6oWGMsTemlVJgwPhFYuTSLv+JWIJjdfEjPEdTakSHXycE/rbkXjfDuIF8ZIfgrxnjVeFYFDX++FljtfC+SEgUhXyrNL4Z4OyqQq4WrLl8mbBkxlM9sZ6NQtLtp2s/7ZzTpaSvcIpJ85GPed1RtSbOGgAqz8HxchJ7lPS+4XNkGShmO6/qgdtakFdjHh2Ov9mBETCbB5E9D2Q4CyvmAXixGbv4aMA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by PA4PR04MB9439.eurprd04.prod.outlook.com (2603:10a6:102:2ab::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.25; Tue, 22 Apr
 2025 05:22:09 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%5]) with mapi id 15.20.8655.033; Tue, 22 Apr 2025
 05:22:09 +0000
Date: Tue, 22 Apr 2025 14:30:52 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Frieder Schrempf <frieder@fris.de>
Cc: Peng Fan <peng.fan@nxp.com>, Pankaj Gupta <pankaj.gupta@nxp.com>,
	linux-arm-kernel@lists.infradead.org,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-kernel@vger.kernel.org, Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Frieder Schrempf <frieder.schrempf@kontron.de>,
	Arnd Bergmann <arnd@arndb.de>, Fabio Estevam <festevam@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	=?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	Shenwei Wang <shenwei.wang@nxp.com>, Xu Yang <xu.yang_2@nxp.com>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: Re: [RFC PATCH 0/5] Add NVMEM driver for i.MX93 OTP access through
 ELE
Message-ID: <20250422043635.GA27670@nxa18884-linux>
References: <20250416142715.1042363-1-frieder@fris.de>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250416142715.1042363-1-frieder@fris.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: SI1PR02CA0035.apcprd02.prod.outlook.com
 (2603:1096:4:1f6::8) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|PA4PR04MB9439:EE_
X-MS-Office365-Filtering-Correlation-Id: 28a667b8-5e80-4ace-9f0f-08dd815da12a
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|7416014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?GOkbNqkC2IhYGQZj0WjdwNAzpqqDYDcDc1Mf6pz7JOlIN5K1gDFrljfMpz5g?=
 =?us-ascii?Q?zQzVNTq3ERJpEZvAyu5vLG0t4VbWmeS8Nl3KjkfCcq2hTIs2vRplg9UlPL1C?=
 =?us-ascii?Q?eIot5UnUld7/Keg0H+80SaXGYnh35PVWpjzvP2LA5QtNmxqlREE9bQ7+hG5r?=
 =?us-ascii?Q?GIQxZvRPV7PdqnjeY1kOCzHYtD4APT/RgHMSqXsH65DpKRWtsNctmYyS16sR?=
 =?us-ascii?Q?f+H+sZgnShIf0OLnun2/o3txFAP6+AVf/mFQXy1EHlaETqVDrupGM7Jwca8x?=
 =?us-ascii?Q?WPcOwE+N31hSedWKrtgKd1jKX3i0yD7rLk1teFDW4jTqgreIv2gsJF1tTsTc?=
 =?us-ascii?Q?+SmG0VLyJ1vhnlCw6Z6RKhfbyDmiQorCLGpgU0NCaLncrxrRxoPbBRYPbCsM?=
 =?us-ascii?Q?e08gOlkhQ5yyGMeaEeB2iP7ZvcQ1Qxttr2JooF7s9sf6hbeKXZKgaE+eO4M1?=
 =?us-ascii?Q?mFhtxAAFhOaiP6BwrkG4fvcO8xICRb+C5hvppTw9VIr70vowZjNtQtfXQIPA?=
 =?us-ascii?Q?/RhSOGdPgddN8eeJwY02ODPi7B1e4R3THkGQXkdsdxpGoScgKBKCa3NkAeSE?=
 =?us-ascii?Q?bhAt81vZinSnmfd8RaCWhngZpn4X5JzVnQbg/nJR3IVJuwLT+alFxWOhANI7?=
 =?us-ascii?Q?IhmUZf0ixDJZ3QkoW0rfPR23gkxnUT/yCHhvtj0qICEQKpEH20+pcayBqdjN?=
 =?us-ascii?Q?vD9bwYtxiEuSBjikDTRmZ8bVIR6KvQHh7I8XEtbY/7Vve/ReODhhDm6PO0I/?=
 =?us-ascii?Q?njSKtNL3XdN6uLI5tA5Hp1HGL0QFn9KuTfCV5L7jyU/+yTcfVe3wh8jBhUwH?=
 =?us-ascii?Q?9iXB29oSRW2KFCbrn3N3qrHAGiGTjPwW1nJ9f/32v/e6KCBzg4V1gK+c2w+l?=
 =?us-ascii?Q?fPZA452D0nlQCgIQXTUT6+Aev01GZMy6S2qJI45vxiCXa91iNSm/RzJhbHKi?=
 =?us-ascii?Q?7iBgkW6I4GWgyLgHpXUrKhd+lWYOx0hnf7leJhOgy9vH5RlEb9sRVrXgEVG3?=
 =?us-ascii?Q?eF+t1YgSwmEeOO6vfX/nuCcEQn4Qq0dFPSXtObkrwdmqJfHu3yUDrk3379gc?=
 =?us-ascii?Q?a7H9JIYKzeVo5zqhxHpB0/AuUOZrhW6XOYlyagRDgt087dPO++2uwlBLBUNb?=
 =?us-ascii?Q?gLCqHSXY3aiCVb806g9d5vlN0oZzRfwqGj3A50PKlPHSmbHZfix+Rp50gVeS?=
 =?us-ascii?Q?O9wOFXnNzi1Cahkyshdo3rkibJF/bM0aI2pK92fo9gfPShGzv+NaFet2aRNz?=
 =?us-ascii?Q?xc4R0FqOPa9GSQm5ql/4aA5ja2wf1jp0yetcKB4G8wK0cuy4ZSxRUu64qe7a?=
 =?us-ascii?Q?tjdG4vOKWECaR81pwC9eP7Yr7c8pYn6j5Ze2Ot+/O59KsQ42U4tpwWCdc7Ly?=
 =?us-ascii?Q?cQ/CTaAeaBV3lV1vYpDYAk3gmZUV6qe6FMAKtjObNbRYK6kYgUftsv2YF++q?=
 =?us-ascii?Q?+gLr2+avgOiZAUqNRhu3/6kLzqwCuP5QcLizb6SzL00eQ+wy6V86/A=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?+KZfQ/FfhNpYf+Y8XkzQr5GEBGDgw0AlEk9DagthE0YdsRaggVyT9hxxtrAd?=
 =?us-ascii?Q?4yv0VYdy0H81rrqhxn7S1320UalL3X/MjEsFsAAdd6Ot1MaoQSlfmJtacsUM?=
 =?us-ascii?Q?ogIST5T2SO6JN9ELeq7FLHkHGAHlP9Raej75hxA+0g7+hXXAfjqiIu4CKDw2?=
 =?us-ascii?Q?Xtb3wS56S51hsYMSYthY48w+Thkx/utJaUXO171Ge7DqvxTWkjyYE5NAEI1w?=
 =?us-ascii?Q?lkoPLnoG4aBkk+gCRD/iKY2GcKI6OIlYo2Jfa7v2f1Vj1rozaZoDhRZyut+p?=
 =?us-ascii?Q?01ZlV/AGUY7gpp2h+KfNeHJJhirzI42qmY3WRS37ocfU91PSu1YW5Z430+EZ?=
 =?us-ascii?Q?MXf8q1Zimigd1te8ULieR8kMSlEZARGQt9HGZLYcYyPMu9mvL/UGj4kKt2ID?=
 =?us-ascii?Q?sUjlOx3KZPnExY08WuiYJMWdvhHZwXjQxb5NZ6jhBheuCD2S15QJpgzg7Fu8?=
 =?us-ascii?Q?RMoFGzGHr7fct0WW3hH/dCaBz0ZGgDbZIyrAvuKF5/MtuDjTL2nj6P5+m2HR?=
 =?us-ascii?Q?m7/y61ZBYQ7D4v+L1x7nf8HAHG5EdlddAhWtK+uIXUBthPCodXDl9lhQCewT?=
 =?us-ascii?Q?ciPkd9VaFKX505PtuN1pJ7Z6gZKkmETTMIfkC3jD1BmNm5Ul+HavP//rwjb6?=
 =?us-ascii?Q?CvTlBJjz9/xM0OqLL9c/bmAeHzEjs5Ep00V8ARWY7gMgWDQFBWPfvqRsWgLw?=
 =?us-ascii?Q?ZsNIEDJG7TdXgKJTQipPLmrJpRSkmr5U8UbBK4u/4f5GcWeMnAA9ISODW9I9?=
 =?us-ascii?Q?Jo08UPlvb9Fr1ZgZ3xIt0nyxwrIhLYdEqWU/uan5gyQN8dfqrje8Jz4OJukx?=
 =?us-ascii?Q?/4hTwIP92kDLxRhHNi+czNM9OT27St4NiuHzrvdTaBzLSQNNrIxUoiwJ44Xz?=
 =?us-ascii?Q?hZzTqXqiqctS9MQhUm53Hl++2KtuvHnZAD0pBKBklF531BiUwVFVezOar69U?=
 =?us-ascii?Q?7wYutK0l4lY1lLTYLE/bL/bCdbvf7cK75l6V9IFEoXtBryF8BG2rzrMxu7xR?=
 =?us-ascii?Q?qkJ38veDOBmv3dIRjbxbbMwGAd1dY1lk5S1GgzPkhhRlM4AjW2dtbWg125nA?=
 =?us-ascii?Q?UPAK5nef/WWHCZbvvjuk7sBGfMqeiskvIqkoL34n0CogZIZ7K17jSnmbnVH/?=
 =?us-ascii?Q?NYw5umwUYHwPtsiHDdf+AbJQm+mB7HFdsWya+MAj9ysxeTCfd/wxNVpyBgx1?=
 =?us-ascii?Q?4+Si1YKVqaHZATbpVVC5IYIk7+7EptFaW8R3a6AFDuusRPZ2PsRWe7bscb/V?=
 =?us-ascii?Q?R3+g8ag//04bN8s7gk3MRBtkMhOtgv5RjCn7wTkqWcjZtV08HNYP+IPOAaKJ?=
 =?us-ascii?Q?CPmyjbtiEQ92kWoABwy4Sn3Hl1vOkpoK0452hoWiueZOs3SQYEwOTVKvuR2p?=
 =?us-ascii?Q?VYkjLCMjf5FBcSaho8TWAnK5E+1p6Oe43tCxk1to+86tueJRqBOpqc/gzC4B?=
 =?us-ascii?Q?HJcgoEl/6pea2GL50dv8CR15PxcGBoPSdiJlQr7LbMtxXKHt0rs4s3RDFWPN?=
 =?us-ascii?Q?ZmT81d+XK7S+/NqkOg5is5CnQWgEnj3tPHL9UAotKDTyp8AEva7beh3897Hh?=
 =?us-ascii?Q?0WDrpaFvhvEoBn2kYCLSoHYAZKbCqOOv83OgmRl+?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 28a667b8-5e80-4ace-9f0f-08dd815da12a
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2025 05:22:09.5983
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DQN1zlafVt+epwfo4/PqewMqhq6hYJMSZ8XhV/ncWTlrPz2oSTV9PQ3EQHUBDZjDOHcsVwPN09gxiP8yYAJg6w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9439

Hi Frieder,

On Wed, Apr 16, 2025 at 04:26:19PM +0200, Frieder Schrempf wrote:
>From: Frieder Schrempf <frieder.schrempf@kontron.de>
>
>This depends on [1] for the support of the Edgelock Secure Enclave firmware
>driver.
>
>There are at least two ways to access the OTP fuses on i.MX93:
>
>(1) through the FSB (fuseblock) registers
>(2) through the ELE S400 API
>
>There currently is a NVMEM driver imx-ocotp-ele.c that (despite its name)
>implements (1). As the FSB only provides limited access to the OTP registers
>(read only) it's not sufficient for all use-cases.
>
>It seems like imx-ocotp-ele.c was intended to be extended later to implement
>(1) and (2) deciding on a per-fuse-register basis which of both access methods
>should be used.
>
>This has some downsides:
>
>* the driver gets convoluted and complex
>* the driver decides which OTP registers are accessed in which way and therefore
>  mixes read-only and read/write access
>
>Therefore I implemented a simple driver that uses the ELE S400 API only, as the
>FSB access (1) doesn't provide any benefits except for that it doesn't depend
>on the ELE firmware being available. This is used by us downstream.
>
>For the upstream solution I would like to have some feedback on how to move
>on:
>
>1. switch imx-ocotp-ele.c to use ELE API exclusively
>   -> this will create a hard dependency on the ELE firmware/driver being available
>2. extend imx-ocotp-ele.c to use FSB and ELE API
>   -> make the driver use ELE API for all registers if ELE firmware/driver is available
>3. create separate drivers as done in this RFC

Need to confirm ELE APIs supports all fuses. If yes, switching to using ELE API
exclusively should be ok, no need to mix FSB and ELE API. And drop the current
FSB usage

Thanks,
Peng.

>
>Thanks!
>
>[1] https://patchwork.kernel.org/project/linux-arm-kernel/cover/20250409-imx-se-if-v16-0-5394e5f3417e@nxp.com/
>
>Frieder Schrempf (5):
>  firmware: imx: ele: Add API functions for OCOTP fuse access
>  nvmem: Add i.MX OCOTP fuse driver using ELE S400 API
>  arm64: dts: imx93: Add node for EdgeLock Enclave (ELE) firmware driver
>  arm64: dts: imx93: Add node for OCOTP S400 NVMEM driver
>  arm64: dts: imx93-kontron: Add DMA memory region for ELE firmware
>
> .../dts/freescale/imx93-kontron-osm-s.dtsi    |  16 ++
> arch/arm64/boot/dts/freescale/imx93.dtsi      |  11 +
> drivers/firmware/imx/ele_base_msg.c           | 122 +++++++++++
> drivers/firmware/imx/ele_base_msg.h           |   8 +
> drivers/nvmem/Kconfig                         |  11 +
> drivers/nvmem/Makefile                        |   2 +
> drivers/nvmem/imx-ocotp-s400.c                | 195 ++++++++++++++++++
> include/linux/firmware/imx/se_api.h           |   3 +
> 8 files changed, 368 insertions(+)
> create mode 100644 drivers/nvmem/imx-ocotp-s400.c
>
>-- 
>2.49.0
