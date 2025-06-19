Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011024.outbound.protection.outlook.com [52.101.70.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFBC522FAD3;
	Thu, 19 Jun 2025 11:58:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.24
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750334314; cv=fail; b=rNA3Y9cdrrrOrAkKWMxCYw8SMVJfk8/uyMkHtra8IdAxAf6bX/prV7HrGMMTzfVw4oUYc7UNvCw0I6I3VIiBwTmpBxOR1XMO5TkQUyWgOIVRKbF61NqlqlMmQkkNi6F3BKaXJ7KK3G00gov8EvR5EgbBOHP367bj9Q8gjvXw5cw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750334314; c=relaxed/simple;
	bh=FLnIRi5cTPNBZAh+UhkCshhTBVW4NnN6H3RB3mQ3MNA=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=KkCnIRpzg73/e0zftiae+Km/lr2TWqkjR/Ql0NSEjLfWQkzP0pZK3Lk0BgG4dTB33gYGiKlA8YoAh0ctXmiqA3fGgndCV/ubjsuI/fUoB5NbJLqwyKrxGiSa1NCgMq2UDTHqaEkvZ4Co2r3Bws7kKhlkGpcsW5a25wPcme224UA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=MM7nxFhP; arc=fail smtp.client-ip=52.101.70.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="MM7nxFhP"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BKBwyWhzi9tzo3pXOku2tyXcsYQMwQzS6Cez9xR1FUrXEoTbX1Mf+6u4n43vaasyD/BmC/PQVLaIO8mfZ81CI7zHMDMyZM6b7hjBVdwruDx4BI2TcNxuXRePqrAN05XoMiDzqs/GvcsEgVtBTTAOxIYVq25YaNFXFEdbqISvok/XtzwJt+6cLRaO5rjQlaT82djU9xYoiR9bupI5lLtmar3Ryv5Q9eIsU8mg/dJ2oXdssIPhcJ5T48/gepRlf/AzeAh4HkNcQ8pcNaCt+xdhYDXvQDyKw5twJnN0gjl/j1kpSoJFubqsr1VJRukjxBVTMyRFSmCWf9dG23ST7LEJHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YtHwUPX0mkTp1rMnxFsCGlFPu+A0iTGvk4r7WxfYHeY=;
 b=DJm20auFKykvxRHhphokghKX7vFsoXl44jm8LwXc/ogcRHVz2oSE/55UsvpIBt7HpRfnMYw2pX2zqLO5+QRrfwBbw1Dq4L0sOEQlWsq1k9YbweqiyShvUmgmTsBNNEa93Bz5AbeIGso1Fo5Ea3GOEVUlCaOiHcaxSO2KC9s/ErC4EB3isfdOYGwhcF9QAq5basgE3pPlKjWbGKKvHj+DjXBISuyRlttxEjAFZU3AQVuAw8loDBIEmk8PDzUbV5Gy7/MOHImm0NFVs2S+ADwuL9yiSP9xFtC4/B7QznJpc0ZWGrrad085btKPIYSIMs5gy6jfPaaFbSF3CTLaD/AKTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YtHwUPX0mkTp1rMnxFsCGlFPu+A0iTGvk4r7WxfYHeY=;
 b=MM7nxFhP3RnB3QDbww+4DI7qkzwBs5aVX09ZuZJok/nD8kYlxD7BjRbFm9CW5xa8k3+6Q35xe+DI5ev3sjoeeCfqIt389hZQLZDGjttIae42/WfoFKlTAIB2GZ4iFKhnOJ6bFMa6BM/RuJcBYDAf7sy9ACn7pU3dCp2RqaJ2BwTa3/LPM2r22tvuF8xALrnhYrEaYd//1lUunNY1L/u/C5WUEu9M9A2AUjGjdDd89/tRdzP3EROsepOT8trRQuGL22t1c6b/L6nO24aOOY7Se41U/S0VhOZ1P9zcoCw2jFJcdGrwW6cj5T3MwzQvuz+tEQ6dK09zEo3OZ0vfOdK7Ew==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM9PR04MB8604.eurprd04.prod.outlook.com (2603:10a6:20b:43b::21)
 by PA4PR04MB7855.eurprd04.prod.outlook.com (2603:10a6:102:ca::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.23; Thu, 19 Jun
 2025 11:58:28 +0000
Received: from AM9PR04MB8604.eurprd04.prod.outlook.com
 ([fe80::e751:223e:aa3d:5827]) by AM9PR04MB8604.eurprd04.prod.outlook.com
 ([fe80::e751:223e:aa3d:5827%7]) with mapi id 15.20.8835.032; Thu, 19 Jun 2025
 11:58:27 +0000
From: Pankaj Gupta <pankaj.gupta@nxp.com>
Date: Thu, 19 Jun 2025 22:50:14 +0530
Subject: [PATCH v18 5/7] firmware: drivers: imx: adds miscdev
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250619-imx-se-if-v18-5-c98391ba446d@nxp.com>
References: <20250619-imx-se-if-v18-0-c98391ba446d@nxp.com>
In-Reply-To: <20250619-imx-se-if-v18-0-c98391ba446d@nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750353651; l=33997;
 i=pankaj.gupta@nxp.com; s=20240523; h=from:subject:message-id;
 bh=FLnIRi5cTPNBZAh+UhkCshhTBVW4NnN6H3RB3mQ3MNA=;
 b=EfSE2KdIAS+fUs+in1SImi6+wkK9Dp51ecofYUzOGg9tVONCSGSAL81ggQuVl1MrTXyXPVzcw
 zftfEvqTCQWDARlBoldoAATfjZ2KXZuQpbXqF4HblZsLXG2gVvgEjif
X-Developer-Key: i=pankaj.gupta@nxp.com; a=ed25519;
 pk=OA0pBQoupy5lV0XfKzD8B0OOBVB6tpAoIf+0x1bYGRg=
X-ClientProxiedBy: SG2P153CA0027.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c7::14)
 To AM9PR04MB8604.eurprd04.prod.outlook.com (2603:10a6:20b:43b::21)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8604:EE_|PA4PR04MB7855:EE_
X-MS-Office365-Filtering-Correlation-Id: b6627cb9-45c8-454b-fe1c-08ddaf289a1d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|52116014|366016|13003099007|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UTEybElnaFRkNWEycmYyclIxQTV4RkZrMWVCU2Nod3JTQStNWC9FMGJnQnZj?=
 =?utf-8?B?NHcwZFBkQjVtaWgzZlk3YU1lbUQvVG9PS0JGV004TU93T3FrbVNTVmlMR2k2?=
 =?utf-8?B?b2s1ODZWamxxMHNJVWdKM1NGVnNSVlhINnFac09HZEM5VkxyVFdSQ0VCZWt6?=
 =?utf-8?B?UTJYeVNmVGdUWTlVN3g5b0Q5ekdWOEZrdlJDZG9HK215Z2FwSGpNKy9uNjl4?=
 =?utf-8?B?VFFiazlydXkwcGt1dDBTS1RKelJIUitGZGdZWGxIaWhySExrakN0ci9YbXps?=
 =?utf-8?B?eCszTWdoQkE0SllTWmxaSVJVWkZJaEpEd01yenVkdXJRWE1SZkpCR3I0WHFx?=
 =?utf-8?B?QzJHcUtoSFRTM0FSTzBSUmpYdS9hMEZJam12b2J4UlVpZzM1Unc4RmxGOERv?=
 =?utf-8?B?ZlUrellqWmw5SGlEUkNlWmQ2RU9NWmZDaXJBSkVrdThQMUNrK0FsdnI0VWNl?=
 =?utf-8?B?d3h3MlUxNkRLWGpPbnZ4MnFENGpleFgrV1FYdk5CZGY4dUgvQmxxMzFreXMz?=
 =?utf-8?B?bDZ3ankwRTY0bnNDTERXUy83N1dsbjI4aWRjVXlNT2dITjNmbkNXbzlpOHU5?=
 =?utf-8?B?WENoMHhhSXlFVFpaMTBvZFJBN3MwVGFSQ3d2TUdRSVoyQitLZCs3eVpuSUky?=
 =?utf-8?B?RVpZZmtIV05idHYzWGhtWkdiWnIvamxGTG12TGhmNXM4WE4rMzFPby92RzE0?=
 =?utf-8?B?WWFuMFA2Q3A5aTRGa3JMbVYwTGF0eTBMZDVrQ24ydUhXelZhS1ZIUkk4Uzly?=
 =?utf-8?B?Mkx5bmZLZ2toTzlCQXZlN0tYVVE1cVd0dWt4Mi9QMm9tTmtXSDd2dCtKWkJp?=
 =?utf-8?B?M0EyYThzTjk1bUJxTXFWSUxoZXlHNVpyajBjNFpZM01QYjV5b0hET1FCV1B4?=
 =?utf-8?B?V2srWFRsWW5VQnY1d05oeWtUQmhjMVIwZzRUUHhMVDNnK08xN3c1aHlmSk1B?=
 =?utf-8?B?SkdQdEpNUEhlTldWeGVxelpxcFQrQ29WYVdudlpRMWZTTC91ajBXcm9LT1Ja?=
 =?utf-8?B?TUpHdTB2anAwQVJUd3IxWElmT2VBTDYwUTRrbkpka2NTWmd6ZTJvNjcyRU4r?=
 =?utf-8?B?R0trSFVNOGFPWGI2ZGFVMnp5T3BucFdzNUU5aElqRS9GVFI1d0VkTld2RC8y?=
 =?utf-8?B?VHhCQVVVTzQvUFliQUsydlc4QnYzRURZSmZyZGRYY3pmY202QzU5K1dDanFq?=
 =?utf-8?B?NmRCQ05qL3lzOGRTdkpIeXlkWDFaVVRIUEVzL0hrbXFQb0FMTjJTQk9odkc2?=
 =?utf-8?B?bS9MMG1aY1NQYlpwQW9WWG1TajlteDZNYVVCZEpTdDF4Z0ovMDIwYUh6aEVn?=
 =?utf-8?B?K0dSNWwrRWRQdGpPcmRXSG1wbnNXRnBwTll2QjZSa3VEd3VBdU1ZNWRCQ1RC?=
 =?utf-8?B?bnMvVDN4TG9pMTZKQTNzRDZ2d1JEQytzUVBnSVVaWGYyN2dEUk9wRjJoOUZD?=
 =?utf-8?B?ZjJBT0ZoNTZ0RVVEMWZ4SG4rVUV2OEFmMytnVFJJY2JpcWY3M29vaDYyN0pP?=
 =?utf-8?B?MWR2TVBCV0dDLzZHbFRGb21jTjVBWk9CVmlKdWI4VHlzVHRHcEF0M3hjTXgx?=
 =?utf-8?B?ZVlRa0Uyb0YwMXBxRnNaRCtqNkJML3B4cnBqNWpwbTNaeHV0T2xVQTJmN3lq?=
 =?utf-8?B?bStVb25rYWVUODByaFNqQ2FTZjR6VEhxQzdUckJyZDZJamQyUDJxMjlyZFdN?=
 =?utf-8?B?Q1FHQ2dLYzBycHRQcW42WVlHeWZUdDRmbkoyejUzdHhCQkgzTnNqZjcwVkto?=
 =?utf-8?B?MlBlUGNFdnI2V2NhcDJVZ1VkQkFyTS8wcUIrRjdmU3ZsV1pWYWlSZUpLVmtI?=
 =?utf-8?B?Nm4vUjFOSDgzNjJvZlcxcVZSbXFWblZ4N1ZwY2RFd1R3SzViRGtOTktvSU53?=
 =?utf-8?B?UmFiaU5LSk8wdm5wbWJEVFdVS05INHh3S0VTSUk3R08vTkpMVitCenhVemdD?=
 =?utf-8?B?WUtGeUZXL2tNRzdyS0NQR2xJMkcvdnJjSmxJT2ZQWXNMekpJT0sxdUxBUkJ3?=
 =?utf-8?Q?kC7QPdBiKuqcGQ37KFFDqpw4VEfOSY=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8604.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(52116014)(366016)(13003099007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YW5RMnEwajV1eEtKYmRWZ3ZYdCtWdk8rbUFuV0dqUHJFTEhXTFo3d291ally?=
 =?utf-8?B?UDdPVUQvQzlwanZaUndkUmdaYkVVZ0ZOV21OTW5XVlIrejRjb1FQN3lsSlFi?=
 =?utf-8?B?SDB5bG9kU3huZEVTRTJ6TURpN3B4czNvQ3hZZ0ZNM010Q1BoZVUwQktkVVdI?=
 =?utf-8?B?OFVXaHIraG10ZWdjTWRjQi81RlEway9aRzVEcUpaWnlsTjRpeklZYjl2SnEr?=
 =?utf-8?B?QUY0bjhNWDdUTjNZU2pWZ2d0cEFSb1FPUEdSb2ZvUEVWQ1h5eHJZNjJVUVRN?=
 =?utf-8?B?aFhpRXpscTFOcGwrSzVpaUdiYzNRK29vYmtCMXZYVTU0UURiOTU5WTk3QUlT?=
 =?utf-8?B?MjNTM3FKWmhNOVhlaUhuT0N2c2w2Vmc4WE9jU2YxUktCSUZmRllUOXFrcTNk?=
 =?utf-8?B?bUhWdUNmZmM0b2E5MmFJdGRMVXRVNW91WS9maEVDYUdEQUViRTVoNStVaWZG?=
 =?utf-8?B?MmFadHZGbWd0c3VXZHJIOHE0bTVsN3pnVXlSQ29GM3ZNVnJxOCsyeHVoY1di?=
 =?utf-8?B?TUhMZGZ6K25CeHVacm1hQi9YeCthdzJ3bGgxVVM4Wjhic0NnYUNQdWZhbGdX?=
 =?utf-8?B?SHJMRkhsQmVSb0l0cTJTYW1EdGUxSkxVWmZDVFphNWE0VHE0MUtoYTNnYUpD?=
 =?utf-8?B?RzI2UzdscExJYysyRkVmb2FaNUhjU054S1IrMytvS3NOUkhpM1MxRE1MUVFt?=
 =?utf-8?B?UGcyamdSc3JWUUNPeXBhaytUN0I3c3JFekZrdGE4K3E4TFNFTVEyaU9rOEc5?=
 =?utf-8?B?UVNkdHorTjRLK1A0UXEzMmhYWlkzcG52bWJUVFVqSDF4TUVDQXRiOWpyelNG?=
 =?utf-8?B?Nys5OWFPRk1keVUzRlA4cHloTHdvRFYvanRQaDU2MjE5MUpOS2czMDNvOVpn?=
 =?utf-8?B?MDFsVThFVzNKbmNUbmYvTnB5RkhxbEw2cHBKY2orMWhjQUh0WmVBbDJHMFRJ?=
 =?utf-8?B?T2pCOHowWklsOHovSFRNTTVkYmErZnBEYnhNeEVjL3QydU5MYnptWEE3Y1RP?=
 =?utf-8?B?V05GQTM5VTJZc2tqRGlJalBRVUFqbFN5R1RNK0t4ZVdRUHcrT1cxb2lGOUh3?=
 =?utf-8?B?MHdzc20yZDBrZXFIS3Bjb1dsYk5sNDBmNkIxQ1dtU21zZi95a09wK1RzbG81?=
 =?utf-8?B?YktNQzYzdXloSkxuMlZLV3RLaWpRV0pTZjQ2NEs2bE5hbEk5OTdpRkpYQlpE?=
 =?utf-8?B?VU5sTXo4cVA2Z3Q2Ny9GUG9TTFFsR2N0UEdwVWVWWVVZbUVyOGJMd2ZDZVlZ?=
 =?utf-8?B?d1I4M3UvM1hzZkRhNzlPU29rdFNsd1BsMnpQSldVYitxQVVWeFBZeEFWdTVt?=
 =?utf-8?B?MGJTM3BSRWxOMjdNbHNTQzMyL0xRdzdJdEpsVmxKUnVVNk93TVFMNWJvMFBr?=
 =?utf-8?B?ZGhGc1RaamM1aGJYSm5pOGQxaHFrRit1cDRsb0c2OUZ4czVtUWR0ZWErUXI2?=
 =?utf-8?B?NmJOVno5eTgxcW5vZkh6WXBiWHd0R2VOd1Y0QmRKOXJjVnF5S0dlWWY5R1RH?=
 =?utf-8?B?U1kwbGp4dDEzWXJvSnFaTXErSzhNalBnSThtWTU2WVYxNVg5SFlJU3VnWHda?=
 =?utf-8?B?N3BUclNDK1VlMldrWVp3SGRlVzR1aitTU1I0alhucUJaV1NCNCs5eGtCcVBM?=
 =?utf-8?B?bzhwbHJ1dUswYTA3aVFpUDhCTkhBczlueEF1R1VxWnVpRVFaNTVIdnRTc3Jt?=
 =?utf-8?B?aTBMM1F3eWZSRlVZUFRlUGs4ZEZySVphUmdzcGp0ZWY0Y1BPUmhEdFJiY24y?=
 =?utf-8?B?VVNiU0FtZjlqK2ozNUVxbWIzRmFUb0JINDl6NW5vT1NQejFzdVY1Vy83R25t?=
 =?utf-8?B?VTUxZ3BaalVKTmlucGN2cU1ZdUMyOTNGMlU3cm4zamhqQlM4NTlWNG9iR3NO?=
 =?utf-8?B?YXMxK1k0WlhIOGU1WWVMbGxBSmVmbE5hY3k4SnEwU2JKUGN2cTRUTzBQbFVK?=
 =?utf-8?B?WkhPUDNKcEJ3dEFSL0c5U29YeEV3WWszeE9jMHpGa2VEYnNVT1Z2Ymt0Nkhk?=
 =?utf-8?B?cy9qYklwOGhOT3JKbldMck5INGs4cmFMdERvQno1NkIwSFk3dkQ2RVZxYkI4?=
 =?utf-8?B?ZHBpL0FmY0xyQkVsd1VEQUxHYW90YzJpKythalMrSldVZTZNZjdvTmZEU0xr?=
 =?utf-8?Q?czhZWwXVxKoT5Tz9pUfcFNurO?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b6627cb9-45c8-454b-fe1c-08ddaf289a1d
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8604.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2025 11:58:27.6914
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6t4MrnpQMe29z3tTnl64B1hVeknfzDVUM2WAljcWbjlIq95L11BcARX1/dJc/bKDiIBQxyqR1dMnkDgADIzfSQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7855

Adds the driver for communication interface to secure-enclave, for
exchanging messages with NXP secure enclave HW IP(s) like EdgeLock Enclave
from:
- User-Space Applications via character driver.

ABI documentation for the NXP secure-enclave driver.

User-space library using this driver:
- i.MX Secure Enclave library:
  -- URL: https://github.com/nxp-imx/imx-secure-enclave.git,
- i.MX Secure Middle-Ware:
  -- URL: https://github.com/nxp-imx/imx-smw.git

Signed-off-by: Pankaj Gupta <pankaj.gupta@nxp.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>

---
changes from v17 to v18
- Collected Frank's R-b tag.
---
 Documentation/ABI/testing/se-cdev |  43 +++
 drivers/firmware/imx/ele_common.c |  20 +-
 drivers/firmware/imx/ele_common.h |   4 +
 drivers/firmware/imx/se_ctrl.c    | 733 +++++++++++++++++++++++++++++++++++++-
 drivers/firmware/imx/se_ctrl.h    |  33 ++
 include/uapi/linux/se_ioctl.h     |  97 +++++
 6 files changed, 918 insertions(+), 12 deletions(-)

diff --git a/Documentation/ABI/testing/se-cdev b/Documentation/ABI/testing/se-cdev
new file mode 100644
index 000000000000..dad39ffd245a
--- /dev/null
+++ b/Documentation/ABI/testing/se-cdev
@@ -0,0 +1,43 @@
+What:		/dev/<se>_mu[0-9]+_ch[0-9]+
+Date:		Mar 2025
+KernelVersion:	6.8
+Contact:	linux-imx@nxp.com, pankaj.gupta@nxp.com
+Description:
+		NXP offers multiple hardware IP(s) for secure enclaves like EdgeLock-
+		Enclave(ELE), SECO. The character device file descriptors
+		/dev/<se>_mu*_ch* are the interface between userspace NXP's secure-
+		enclave shared library and the kernel driver.
+
+		The ioctl(2)-based ABI is defined and documented in
+		[include]<linux/firmware/imx/ele_mu_ioctl.h>.
+		ioctl(s) are used primarily for:
+			- shared memory management
+			- allocation of I/O buffers
+			- getting mu info
+			- setting a dev-ctx as receiver to receive all the commands from FW
+			- getting SoC info
+			- send command and receive command response
+
+		The following file operations are supported:
+
+		open(2)
+		  Currently the only useful flags are O_RDWR.
+
+		read(2)
+		  Every read() from the opened character device context is waiting on
+		  wait_event_interruptible, that gets set by the registered mailbox callback
+		  function, indicating a message received from the firmware on message-
+		  unit.
+
+		write(2)
+		  Every write() to the opened character device context needs to acquire
+		  mailbox_lock before sending message on to the message unit.
+
+		close(2)
+		  Stops and frees up the I/O contexts that were associated
+		  with the file descriptor.
+
+Users:		https://github.com/nxp-imx/imx-secure-enclave.git,
+		https://github.com/nxp-imx/imx-smw.git
+		crypto/skcipher,
+		drivers/nvmem/imx-ocotp-ele.c
diff --git a/drivers/firmware/imx/ele_common.c b/drivers/firmware/imx/ele_common.c
index f26fb4d55a9a..dc4607984f00 100644
--- a/drivers/firmware/imx/ele_common.c
+++ b/drivers/firmware/imx/ele_common.c
@@ -42,15 +42,22 @@ u32 se_get_msg_chksum(u32 *msg, u32 msg_len)
 	return chksum;
 }
 
+void set_se_rcv_msg_timeout(struct se_if_priv *priv, u32 timeout_ms)
+{
+	priv->se_rcv_msg_timeout_ms = timeout_ms;
+}
+
 int ele_msg_rcv(struct se_if_device_ctx *dev_ctx, struct se_clbk_handle *se_clbk_hdl)
 {
-	unsigned long timeout;
+	unsigned long timeout_ms;
 	int ret;
 
 	do {
-		timeout = MAX_SCHEDULE_TIMEOUT;
+		timeout_ms = MAX_SCHEDULE_TIMEOUT;
+		if (dev_ctx->priv->cmd_receiver_clbk_hdl.dev_ctx != dev_ctx)
+			timeout_ms = msecs_to_jiffies(dev_ctx->priv->se_rcv_msg_timeout_ms);
 
-		ret = wait_for_completion_interruptible_timeout(&se_clbk_hdl->done, timeout);
+		ret = wait_for_completion_interruptible_timeout(&se_clbk_hdl->done, timeout_ms);
 		if (ret == -ERESTARTSYS) {
 			if (dev_ctx->priv->waiting_rsp_clbk_hdl.dev_ctx) {
 				dev_ctx->priv->waiting_rsp_clbk_hdl.signal_rcvd = true;
@@ -59,6 +66,13 @@ int ele_msg_rcv(struct se_if_device_ctx *dev_ctx, struct se_clbk_handle *se_clbk
 			ret = -EINTR;
 			break;
 		}
+		if (ret == 0) {
+			ret = -ETIMEDOUT;
+			dev_err(dev_ctx->priv->dev,
+				"Fatal Error: SE interface: %s0, hangs indefinitely.\n",
+				get_se_if_name(dev_ctx->priv->if_defs->se_if_type));
+			break;
+		}
 		ret = se_clbk_hdl->rx_msg_sz;
 		break;
 	} while (ret < 0);
diff --git a/drivers/firmware/imx/ele_common.h b/drivers/firmware/imx/ele_common.h
index 5bac14439d7d..3e88ea45ca5d 100644
--- a/drivers/firmware/imx/ele_common.h
+++ b/drivers/firmware/imx/ele_common.h
@@ -12,6 +12,10 @@
 
 #define IMX_ELE_FW_DIR                 "imx/ele/"
 
+#define SE_RCV_MSG_DEFAULT_TIMEOUT	5000
+#define SE_RCV_MSG_LONG_TIMEOUT		5000000
+
+void set_se_rcv_msg_timeout(struct se_if_priv *priv, u32 val);
 u32 se_get_msg_chksum(u32 *msg, u32 msg_len);
 
 int ele_msg_rcv(struct se_if_device_ctx *dev_ctx, struct se_clbk_handle *se_clbk_hdl);
diff --git a/drivers/firmware/imx/se_ctrl.c b/drivers/firmware/imx/se_ctrl.c
index 40544cbc70ca..5766d0759955 100644
--- a/drivers/firmware/imx/se_ctrl.c
+++ b/drivers/firmware/imx/se_ctrl.c
@@ -23,6 +23,7 @@
 #include <linux/slab.h>
 #include <linux/string.h>
 #include <linux/sys_soc.h>
+#include <uapi/linux/se_ioctl.h>
 
 #include "ele_base_msg.h"
 #include "ele_common.h"
@@ -32,12 +33,6 @@
 #define MBOX_TX_NAME			"tx"
 #define MBOX_RX_NAME			"rx"
 
-#define SE_TYPE_STR_DBG			"dbg"
-#define SE_TYPE_STR_HSM			"hsm"
-
-#define SE_TYPE_ID_DBG			0x1
-#define SE_TYPE_ID_HSM			0x2
-
 struct se_fw_img_name {
 	const u8 *prim_fw_nm_in_rfs;
 	const u8 *seco_fw_nm_in_rfs;
@@ -130,6 +125,13 @@ char *get_se_if_name(u8 se_if_id)
 	return NULL;
 }
 
+static u32 get_se_soc_id(struct se_if_priv *priv)
+{
+	const struct se_soc_info *se_info = device_get_match_data(priv->dev);
+
+	return se_info->soc_id;
+}
+
 static struct se_fw_load_info *get_load_fw_instance(struct se_if_priv *priv)
 {
 	return &var_se_info.load_fw;
@@ -203,8 +205,213 @@ static int get_se_soc_info(struct se_if_priv *priv, const struct se_soc_info *se
 	return 0;
 }
 
+static int load_firmware(struct se_if_priv *priv, const u8 *se_img_file_to_load)
+{
+	const struct firmware *fw = NULL;
+	phys_addr_t se_fw_phyaddr;
+	u8 *se_fw_buf;
+	int ret;
+
+	if (!se_img_file_to_load) {
+		dev_err(priv->dev, "FW image is not provided.");
+		return -EINVAL;
+	}
+	ret = request_firmware(&fw, se_img_file_to_load, priv->dev);
+	if (ret)
+		return ret;
+
+	dev_info(priv->dev, "loading firmware %s.", se_img_file_to_load);
+
+	/* allocate buffer to store the SE FW */
+	se_fw_buf = dma_alloc_coherent(priv->dev, fw->size, &se_fw_phyaddr, GFP_KERNEL);
+	if (!se_fw_buf) {
+		ret = -ENOMEM;
+		goto exit;
+	}
+
+	memcpy(se_fw_buf, fw->data, fw->size);
+	ret = ele_fw_authenticate(priv, se_fw_phyaddr, se_fw_phyaddr);
+	if (ret < 0) {
+		dev_err(priv->dev,
+			"Error %pe: Authenticate & load SE firmware %s.",
+			ERR_PTR(ret), se_img_file_to_load);
+		ret = -EPERM;
+	}
+	dma_free_coherent(priv->dev, fw->size, se_fw_buf, se_fw_phyaddr);
+exit:
+	release_firmware(fw);
+
+	return ret;
+}
+
+static int se_load_firmware(struct se_if_priv *priv)
+{
+	struct se_fw_load_info *load_fw = get_load_fw_instance(priv);
+	int ret = 0;
+
+	if (!load_fw->is_fw_tobe_loaded)
+		return 0;
+
+	if (load_fw->imem.state == ELE_IMEM_STATE_BAD) {
+		ret = load_firmware(priv, load_fw->se_fw_img_nm->prim_fw_nm_in_rfs);
+		if (ret) {
+			dev_err(priv->dev, "Failed to load boot firmware.");
+			return -EPERM;
+		}
+	}
+
+	ret = load_firmware(priv, load_fw->se_fw_img_nm->seco_fw_nm_in_rfs);
+	if (ret) {
+		dev_err(priv->dev, "Failed to load runtime firmware.");
+		return -EPERM;
+	}
+
+	load_fw->is_fw_tobe_loaded = false;
+
+	return ret;
+}
+
+static int init_se_shared_mem(struct se_if_device_ctx *dev_ctx)
+{
+	struct se_shared_mem_mgmt_info *se_shared_mem_mgmt = &dev_ctx->se_shared_mem_mgmt;
+	struct se_if_priv *priv = dev_ctx->priv;
+
+	INIT_LIST_HEAD(&se_shared_mem_mgmt->pending_out);
+	INIT_LIST_HEAD(&se_shared_mem_mgmt->pending_in);
+
+	/*
+	 * Allocate some memory for data exchanges with S40x.
+	 * This will be used for data not requiring secure memory.
+	 */
+	se_shared_mem_mgmt->non_secure_mem.ptr =
+			dma_alloc_coherent(priv->dev, MAX_DATA_SIZE_PER_USER,
+					   &se_shared_mem_mgmt->non_secure_mem.dma_addr,
+					   GFP_KERNEL);
+	if (!se_shared_mem_mgmt->non_secure_mem.ptr)
+		return -ENOMEM;
+
+	se_shared_mem_mgmt->non_secure_mem.size = MAX_DATA_SIZE_PER_USER;
+	se_shared_mem_mgmt->non_secure_mem.pos = 0;
+
+	return 0;
+}
+
+static void cleanup_se_shared_mem(struct se_if_device_ctx *dev_ctx)
+{
+	struct se_shared_mem_mgmt_info *se_shared_mem_mgmt = &dev_ctx->se_shared_mem_mgmt;
+	struct se_if_priv *priv = dev_ctx->priv;
+
+	/* Free non-secure shared buffer. */
+	dma_free_coherent(priv->dev, MAX_DATA_SIZE_PER_USER,
+			  se_shared_mem_mgmt->non_secure_mem.ptr,
+			  se_shared_mem_mgmt->non_secure_mem.dma_addr);
+
+	se_shared_mem_mgmt->non_secure_mem.ptr = NULL;
+	se_shared_mem_mgmt->non_secure_mem.dma_addr = 0;
+	se_shared_mem_mgmt->non_secure_mem.size = 0;
+	se_shared_mem_mgmt->non_secure_mem.pos = 0;
+}
+
+/* Need to copy the output data to user-device context.
+ */
+static int se_dev_ctx_cpy_out_data(struct se_if_device_ctx *dev_ctx)
+{
+	struct se_shared_mem_mgmt_info *se_shared_mem_mgmt = &dev_ctx->se_shared_mem_mgmt;
+	struct se_if_priv *priv = dev_ctx->priv;
+	struct se_buf_desc *b_desc, *temp;
+	bool do_cpy = true;
+
+	list_for_each_entry_safe(b_desc, temp, &se_shared_mem_mgmt->pending_out, link) {
+		if (b_desc->usr_buf_ptr && b_desc->shared_buf_ptr && do_cpy) {
+			dev_dbg(priv->dev, "Copying output data to user.");
+			if (do_cpy && copy_to_user(b_desc->usr_buf_ptr,
+						   b_desc->shared_buf_ptr,
+						   b_desc->size)) {
+				dev_err(priv->dev, "Failure copying output data to user.");
+				do_cpy = false;
+			}
+		}
+
+		if (b_desc->shared_buf_ptr)
+			memset(b_desc->shared_buf_ptr, 0, b_desc->size);
+
+		list_del(&b_desc->link);
+		kfree(b_desc);
+	}
+
+	return do_cpy ? 0 : -EFAULT;
+}
+
+/*
+ * Clean the used Shared Memory space,
+ * whether its Input Data copied from user buffers, or
+ * Data received from FW.
+ */
+static void se_dev_ctx_shared_mem_cleanup(struct se_if_device_ctx *dev_ctx)
+{
+	struct se_shared_mem_mgmt_info *se_shared_mem_mgmt = &dev_ctx->se_shared_mem_mgmt;
+	struct list_head *pending_lists[] = {&se_shared_mem_mgmt->pending_in,
+						&se_shared_mem_mgmt->pending_out};
+	struct se_buf_desc *b_desc, *temp;
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(pending_lists); i++) {
+		list_for_each_entry_safe(b_desc, temp, pending_lists[i], link) {
+			if (b_desc->shared_buf_ptr)
+				memset(b_desc->shared_buf_ptr, 0, b_desc->size);
+
+			list_del(&b_desc->link);
+			kfree(b_desc);
+		}
+	}
+	se_shared_mem_mgmt->non_secure_mem.pos = 0;
+}
+
+static int add_b_desc_to_pending_list(void *shared_ptr_with_pos,
+				      struct se_ioctl_setup_iobuf *io,
+				      struct se_if_device_ctx *dev_ctx)
+{
+	struct se_shared_mem_mgmt_info *se_shared_mem_mgmt = &dev_ctx->se_shared_mem_mgmt;
+	struct se_buf_desc *b_desc;
+
+	b_desc = kzalloc(sizeof(*b_desc), GFP_KERNEL);
+	if (!b_desc)
+		return -ENOMEM;
+
+	b_desc->shared_buf_ptr = shared_ptr_with_pos;
+	b_desc->usr_buf_ptr = io->user_buf;
+	b_desc->size = io->length;
+
+	if (io->flags & SE_IO_BUF_FLAGS_IS_INPUT) {
+		/*
+		 * buffer is input:
+		 * add an entry in the "pending input buffers" list so
+		 * that copied data can be cleaned from shared memory
+		 * later.
+		 */
+		list_add_tail(&b_desc->link, &se_shared_mem_mgmt->pending_in);
+	} else {
+		/*
+		 * buffer is output:
+		 * add an entry in the "pending out buffers" list so data
+		 * can be copied to user space when receiving Secure-Enclave
+		 * response.
+		 */
+		list_add_tail(&b_desc->link, &se_shared_mem_mgmt->pending_out);
+	}
+
+	return 0;
+}
+
+/* interface for managed res to unregister a character device */
+static void if_misc_deregister(void *miscdevice)
+{
+	misc_deregister(miscdevice);
+}
+
 static int init_misc_device_context(struct se_if_priv *priv, int ch_id,
-				    struct se_if_device_ctx **new_dev_ctx)
+				    struct se_if_device_ctx **new_dev_ctx,
+				    const struct file_operations *se_if_fops)
 {
 	struct se_if_device_ctx *dev_ctx;
 	int ret = 0;
@@ -220,12 +427,509 @@ static int init_misc_device_context(struct se_if_priv *priv, int ch_id,
 	if (!dev_ctx->devname)
 		return -ENOMEM;
 
+	mutex_init(&dev_ctx->fops_lock);
+
+	dev_ctx->priv = priv;
+	*new_dev_ctx = dev_ctx;
+
+	dev_ctx->miscdev = devm_kzalloc(priv->dev, sizeof(*dev_ctx->miscdev), GFP_KERNEL);
+	if (!dev_ctx->miscdev) {
+		*new_dev_ctx = NULL;
+		return -ENOMEM;
+	}
+
+	dev_ctx->miscdev->name = dev_ctx->devname;
+	dev_ctx->miscdev->minor = MISC_DYNAMIC_MINOR;
+	dev_ctx->miscdev->fops = se_if_fops;
+	dev_ctx->miscdev->parent = priv->dev;
+	ret = misc_register(dev_ctx->miscdev);
+	if (ret)
+		return dev_err_probe(priv->dev, ret, "Failed to register misc device.");
+
+	ret = devm_add_action_or_reset(priv->dev, if_misc_deregister, dev_ctx->miscdev);
+	if (ret)
+		return dev_err_probe(priv->dev, ret,
+				     "Failed to add action to the misc-dev.");
+	return ret;
+}
+
+static int init_device_context(struct se_if_priv *priv, int ch_id,
+			       struct se_if_device_ctx **new_dev_ctx)
+{
+	struct se_if_device_ctx *dev_ctx;
+	int ret = 0;
+
+	dev_ctx = kzalloc(sizeof(*dev_ctx), GFP_KERNEL);
+
+	if (!dev_ctx)
+		return -ENOMEM;
+
+	dev_ctx->devname = kasprintf(GFP_KERNEL, "%s0_ch%d",
+				     get_se_if_name(priv->if_defs->se_if_type),
+				     ch_id);
+	if (!dev_ctx->devname) {
+		kfree(dev_ctx);
+		return -ENOMEM;
+	}
+
+	mutex_init(&dev_ctx->fops_lock);
 	dev_ctx->priv = priv;
 	*new_dev_ctx = dev_ctx;
 
+	list_add_tail(&dev_ctx->link, &priv->dev_ctx_list);
+	priv->active_devctx_count++;
+
+	ret = init_se_shared_mem(dev_ctx);
+	if (ret < 0) {
+		kfree(dev_ctx->devname);
+		kfree(dev_ctx);
+		*new_dev_ctx = NULL;
+	}
+
 	return ret;
 }
 
+static int se_ioctl_cmd_snd_rcv_rsp_handler(struct se_if_device_ctx *dev_ctx,
+					    u64 arg)
+{
+	struct se_ioctl_cmd_snd_rcv_rsp_info cmd_snd_rcv_rsp_info = {0};
+	struct se_api_msg *tx_msg __free(kfree) = NULL;
+	struct se_api_msg *rx_msg __free(kfree) = NULL;
+	struct se_if_priv *priv = dev_ctx->priv;
+	int err = 0;
+
+	if (copy_from_user(&cmd_snd_rcv_rsp_info, (u8 __user *)arg,
+			   sizeof(cmd_snd_rcv_rsp_info))) {
+		dev_err(priv->dev,
+			"%s: Failed to copy cmd_snd_rcv_rsp_info from user.",
+			dev_ctx->devname);
+		err = -EFAULT;
+		goto exit;
+	}
+
+	if (cmd_snd_rcv_rsp_info.tx_buf_sz < SE_MU_HDR_SZ) {
+		dev_err(priv->dev, "%s: User buffer too small(%d < %d)",
+			dev_ctx->devname, cmd_snd_rcv_rsp_info.tx_buf_sz, SE_MU_HDR_SZ);
+		err = -ENOSPC;
+		goto exit;
+	}
+
+	rx_msg = kzalloc(cmd_snd_rcv_rsp_info.rx_buf_sz, GFP_KERNEL);
+	if (!rx_msg) {
+		err = -ENOMEM;
+		goto exit;
+	}
+
+	tx_msg = memdup_user(cmd_snd_rcv_rsp_info.tx_buf,
+			     cmd_snd_rcv_rsp_info.tx_buf_sz);
+	if (IS_ERR(tx_msg)) {
+		err = PTR_ERR(tx_msg);
+		goto exit;
+	}
+
+	if (tx_msg->header.tag != priv->if_defs->cmd_tag) {
+		err = -EINVAL;
+		goto exit;
+	}
+
+	if (tx_msg->header.ver == priv->if_defs->fw_api_ver &&
+	    get_load_fw_instance(priv)->is_fw_tobe_loaded) {
+		err = se_load_firmware(priv);
+		if (err) {
+			dev_err(priv->dev, "Could not send msg as FW is not loaded.");
+			err = -EPERM;
+			goto exit;
+		}
+	}
+	set_se_rcv_msg_timeout(priv, SE_RCV_MSG_LONG_TIMEOUT);
+
+	err = ele_msg_send_rcv(dev_ctx, tx_msg, cmd_snd_rcv_rsp_info.tx_buf_sz,
+			       rx_msg, cmd_snd_rcv_rsp_info.rx_buf_sz);
+	if (err < 0)
+		goto exit;
+
+	dev_dbg(priv->dev, "%s: %s %s.", dev_ctx->devname, __func__,
+		"message received, start transmit to user");
+
+	/* We may need to copy the output data to user before
+	 * delivering the completion message.
+	 */
+	err = se_dev_ctx_cpy_out_data(dev_ctx);
+	if (err < 0)
+		goto exit;
+
+	/* Copy data from the buffer */
+	print_hex_dump_debug("to user ", DUMP_PREFIX_OFFSET, 4, 4, rx_msg,
+			     cmd_snd_rcv_rsp_info.rx_buf_sz, false);
+
+	if (copy_to_user(cmd_snd_rcv_rsp_info.rx_buf, rx_msg,
+			 cmd_snd_rcv_rsp_info.rx_buf_sz)) {
+		dev_err(priv->dev, "%s: Failed to copy to user.", dev_ctx->devname);
+		err = -EFAULT;
+	}
+
+exit:
+
+	/* shared memory is allocated before this IOCTL */
+	se_dev_ctx_shared_mem_cleanup(dev_ctx);
+
+	if (copy_to_user((void __user *)arg, &cmd_snd_rcv_rsp_info,
+			 sizeof(cmd_snd_rcv_rsp_info))) {
+		dev_err(priv->dev, "%s: Failed to copy cmd_snd_rcv_rsp_info from user.",
+			dev_ctx->devname);
+		err = -EFAULT;
+	}
+
+	return err;
+}
+
+static int se_ioctl_get_mu_info(struct se_if_device_ctx *dev_ctx,
+				u64 arg)
+{
+	struct se_if_priv *priv = dev_ctx->priv;
+	struct se_ioctl_get_if_info if_info;
+	struct se_if_node *if_node;
+	int err = 0;
+
+	if_node = container_of(priv->if_defs, typeof(*if_node), if_defs);
+
+	if_info.se_if_id = 0;
+	if_info.interrupt_idx = 0;
+	if_info.tz = 0;
+	if_info.did = 0;
+	if_info.cmd_tag = priv->if_defs->cmd_tag;
+	if_info.rsp_tag = priv->if_defs->rsp_tag;
+	if_info.success_tag = priv->if_defs->success_tag;
+	if_info.base_api_ver = priv->if_defs->base_api_ver;
+	if_info.fw_api_ver = priv->if_defs->fw_api_ver;
+
+	dev_dbg(priv->dev, "%s: info [se_if_id: %d, irq_idx: %d, tz: 0x%x, did: 0x%x].",
+		dev_ctx->devname, if_info.se_if_id, if_info.interrupt_idx, if_info.tz,
+		if_info.did);
+
+	if (copy_to_user((u8 __user *)arg, &if_info, sizeof(if_info))) {
+		dev_err(priv->dev, "%s: Failed to copy mu info to user.",
+			dev_ctx->devname);
+		err = -EFAULT;
+	}
+
+	return err;
+}
+
+/*
+ * Copy a buffer of data to/from the user and return the address to use in
+ * messages
+ */
+static int se_ioctl_setup_iobuf_handler(struct se_if_device_ctx *dev_ctx,
+					u64 arg)
+{
+	struct se_shared_mem *shared_mem = NULL;
+	struct se_ioctl_setup_iobuf io = {0};
+	int err = 0;
+	u32 pos;
+
+	if (copy_from_user(&io, (u8 __user *)arg, sizeof(io))) {
+		dev_err(dev_ctx->priv->dev, "%s: Failed copy iobuf config from user.",
+			dev_ctx->devname);
+		return -EFAULT;
+	}
+
+	dev_dbg(dev_ctx->priv->dev, "%s: io [buf: %p(%d) flag: %x].", dev_ctx->devname,
+		io.user_buf, io.length, io.flags);
+
+	if (io.length == 0 || !io.user_buf) {
+		/*
+		 * Accept NULL pointers since some buffers are optional
+		 * in FW commands. In this case we should return 0 as
+		 * pointer to be embedded into the message.
+		 * Skip all data copy part of code below.
+		 */
+		io.ele_addr = 0;
+		goto copy;
+	}
+
+	/* No specific requirement for this buffer. */
+	shared_mem = &dev_ctx->se_shared_mem_mgmt.non_secure_mem;
+
+	/* Check there is enough space in the shared memory. */
+	dev_dbg(dev_ctx->priv->dev, "%s: req_size = %d, max_size= %d, curr_pos = %d",
+		dev_ctx->devname, round_up(io.length, 8u), shared_mem->size,
+		shared_mem->pos);
+
+	if (shared_mem->size < shared_mem->pos ||
+	    round_up(io.length, 8u) > (shared_mem->size - shared_mem->pos)) {
+		dev_err(dev_ctx->priv->dev, "%s: Not enough space in shared memory.",
+			dev_ctx->devname);
+		return -ENOMEM;
+	}
+
+	/* Allocate space in shared memory. 8 bytes aligned. */
+	pos = shared_mem->pos;
+	shared_mem->pos += round_up(io.length, 8u);
+	io.ele_addr = (u64)shared_mem->dma_addr + pos;
+
+	memset(shared_mem->ptr + pos, 0, io.length);
+	if ((io.flags & SE_IO_BUF_FLAGS_IS_INPUT) ||
+	    (io.flags & SE_IO_BUF_FLAGS_IS_IN_OUT)) {
+		/*
+		 * buffer is input:
+		 * copy data from user space to this allocated buffer.
+		 */
+		if (copy_from_user(shared_mem->ptr + pos, io.user_buf, io.length)) {
+			dev_err(dev_ctx->priv->dev,
+				"%s: Failed copy data to shared memory.",
+				dev_ctx->devname);
+			return -EFAULT;
+		}
+	}
+
+	err = add_b_desc_to_pending_list(shared_mem->ptr + pos, &io, dev_ctx);
+	if (err < 0)
+		dev_err(dev_ctx->priv->dev, "%s: Failed to allocate/link b_desc.",
+			dev_ctx->devname);
+
+copy:
+	/* Provide the EdgeLock Enclave address to user space only if success.*/
+	if (copy_to_user((u8 __user *)arg, &io, sizeof(io))) {
+		dev_err(dev_ctx->priv->dev, "%s: Failed to copy iobuff setup to user.",
+			dev_ctx->devname);
+		err = -EFAULT;
+	}
+
+	return err;
+}
+
+/* IOCTL to provide SoC information */
+static int se_ioctl_get_se_soc_info_handler(struct se_if_device_ctx *dev_ctx, u64 arg)
+{
+	struct se_ioctl_get_soc_info soc_info;
+	int err = -EINVAL;
+
+	soc_info.soc_id = get_se_soc_id(dev_ctx->priv);
+	soc_info.soc_rev = var_se_info.soc_rev;
+
+	err = copy_to_user((u8 __user *)arg, (u8 *)(&soc_info), sizeof(soc_info));
+	if (err) {
+		dev_err(dev_ctx->priv->dev, "%s: Failed to copy soc info to user.",
+			dev_ctx->devname);
+		err = -EFAULT;
+	}
+
+	return err;
+}
+
+/*
+ * File operations for user-space
+ */
+
+/* Write a message to the MU. */
+static ssize_t se_if_fops_write(struct file *fp, const char __user *buf,
+				size_t size, loff_t *ppos)
+{
+	struct se_if_device_ctx *dev_ctx = fp->private_data;
+	struct se_api_msg *tx_msg __free(kfree) = NULL;
+	struct se_if_priv *priv = dev_ctx->priv;
+	int err;
+
+	dev_dbg(priv->dev, "%s: write from buf (%p)%zu, ppos=%lld.", dev_ctx->devname,
+		buf, size, ((ppos) ? *ppos : 0));
+
+	scoped_cond_guard(mutex_intr, return -EBUSY, &dev_ctx->fops_lock) {
+		if (dev_ctx != priv->cmd_receiver_clbk_hdl.dev_ctx)
+			return -EINVAL;
+
+		if (size < SE_MU_HDR_SZ) {
+			dev_err(priv->dev, "%s: User buffer too small(%zu < %d).",
+				dev_ctx->devname, size, SE_MU_HDR_SZ);
+			return -ENOSPC;
+		}
+
+		tx_msg = memdup_user(buf, size);
+		if (IS_ERR(tx_msg))
+			return PTR_ERR(tx_msg);
+
+		print_hex_dump_debug("from user ", DUMP_PREFIX_OFFSET, 4, 4,
+				     tx_msg, size, false);
+
+		err = ele_msg_send(dev_ctx, tx_msg, size);
+
+		return err;
+	}
+}
+
+/*
+ * Read a message from the MU.
+ * Blocking until a message is available.
+ */
+static ssize_t se_if_fops_read(struct file *fp, char __user *buf, size_t size,
+			       loff_t *ppos)
+{
+	struct se_if_device_ctx *dev_ctx = fp->private_data;
+	struct se_if_priv *priv = dev_ctx->priv;
+	int err;
+
+	dev_dbg(priv->dev, "%s: read to buf %p(%zu), ppos=%lld.", dev_ctx->devname,
+		buf, size, ((ppos) ? *ppos : 0));
+
+	scoped_cond_guard(mutex_intr, return -EBUSY, &dev_ctx->fops_lock) {
+		if (dev_ctx != priv->cmd_receiver_clbk_hdl.dev_ctx) {
+			err = -EINVAL;
+			goto exit;
+		}
+
+		err = ele_msg_rcv(dev_ctx, &priv->cmd_receiver_clbk_hdl);
+		if (err < 0) {
+			dev_err(priv->dev, "%s: Err[0x%x]:Interrupted by signal."
+				"Current active dev-ctx count = %d.",
+				dev_ctx->devname, err, dev_ctx->priv->active_devctx_count);
+			goto exit;
+		}
+
+		/* We may need to copy the output data to user before
+		 * delivering the completion message.
+		 */
+		err = se_dev_ctx_cpy_out_data(dev_ctx);
+		if (err < 0)
+			goto exit;
+
+		/* Copy data from the buffer */
+		print_hex_dump_debug("to user ", DUMP_PREFIX_OFFSET, 4, 4,
+				     priv->cmd_receiver_clbk_hdl.rx_msg,
+				     priv->cmd_receiver_clbk_hdl.rx_msg_sz,
+				     false);
+
+		if (copy_to_user(buf, priv->cmd_receiver_clbk_hdl.rx_msg,
+				 priv->cmd_receiver_clbk_hdl.rx_msg_sz)) {
+			dev_err(priv->dev, "%s: Failed to copy to user.",
+				dev_ctx->devname);
+			err = -EFAULT;
+		} else {
+			err = priv->cmd_receiver_clbk_hdl.rx_msg_sz;
+		}
+exit:
+		priv->cmd_receiver_clbk_hdl.rx_msg_sz = 0;
+
+		se_dev_ctx_shared_mem_cleanup(dev_ctx);
+
+		return err;
+	}
+}
+
+/* Open a character device. */
+static int se_if_fops_open(struct inode *nd, struct file *fp)
+{
+	struct miscdevice *miscdev = fp->private_data;
+	struct se_if_device_ctx *misc_dev_ctx;
+	struct se_if_device_ctx *dev_ctx;
+	struct se_if_priv *priv;
+	int err = 0;
+
+	priv = dev_get_drvdata(miscdev->parent);
+	misc_dev_ctx = priv->priv_dev_ctx;
+
+	scoped_cond_guard(mutex_intr, return -EBUSY, &misc_dev_ctx->fops_lock) {
+		priv->dev_ctx_mono_count++;
+		err = init_device_context(priv,
+					  priv->dev_ctx_mono_count ?
+					  priv->dev_ctx_mono_count
+					  : priv->dev_ctx_mono_count++,
+					  &dev_ctx);
+		if (err)
+			dev_err(priv->dev, "Failed[0x%x] to create dev-ctx.", err);
+		else
+			fp->private_data = dev_ctx;
+
+		return err;
+	}
+}
+
+/* Close a character device. */
+static int se_if_fops_close(struct inode *nd, struct file *fp)
+{
+	struct se_if_device_ctx *dev_ctx = fp->private_data;
+	struct se_if_priv *priv = dev_ctx->priv;
+
+	scoped_cond_guard(mutex_intr, return -EBUSY, &dev_ctx->fops_lock) {
+		/* check if this device was registered as command receiver. */
+		if (priv->cmd_receiver_clbk_hdl.dev_ctx == dev_ctx) {
+			priv->cmd_receiver_clbk_hdl.dev_ctx = NULL;
+			kfree(priv->cmd_receiver_clbk_hdl.rx_msg);
+			priv->cmd_receiver_clbk_hdl.rx_msg = NULL;
+		}
+
+		se_dev_ctx_shared_mem_cleanup(dev_ctx);
+		cleanup_se_shared_mem(dev_ctx);
+
+		priv->active_devctx_count--;
+		list_del(&dev_ctx->link);
+
+		kfree(dev_ctx->devname);
+		kfree(dev_ctx);
+	}
+
+	return 0;
+}
+
+/* IOCTL entry point of a character device */
+static long se_ioctl(struct file *fp, unsigned int cmd, unsigned long arg)
+{
+	struct se_if_device_ctx *dev_ctx = fp->private_data;
+	struct se_if_priv *priv = dev_ctx->priv;
+	long err;
+
+	/* Prevent race during change of device context */
+	scoped_cond_guard(mutex_intr, return -EBUSY, &dev_ctx->fops_lock) {
+		switch (cmd) {
+		case SE_IOCTL_ENABLE_CMD_RCV:
+			if (!priv->cmd_receiver_clbk_hdl.dev_ctx) {
+				if (!priv->cmd_receiver_clbk_hdl.rx_msg) {
+					priv->cmd_receiver_clbk_hdl.rx_msg =
+						kzalloc(MAX_NVM_MSG_LEN,
+							GFP_KERNEL);
+					if (!priv->cmd_receiver_clbk_hdl.rx_msg) {
+						err = -ENOMEM;
+						break;
+					}
+				}
+				priv->cmd_receiver_clbk_hdl.rx_msg_sz = MAX_NVM_MSG_LEN;
+				priv->cmd_receiver_clbk_hdl.dev_ctx = dev_ctx;
+				err = 0;
+			} else {
+				err = -EBUSY;
+			}
+			break;
+		case SE_IOCTL_GET_MU_INFO:
+			err = se_ioctl_get_mu_info(dev_ctx, arg);
+			break;
+		case SE_IOCTL_SETUP_IOBUF:
+			err = se_ioctl_setup_iobuf_handler(dev_ctx, arg);
+			break;
+		case SE_IOCTL_GET_SOC_INFO:
+			err = se_ioctl_get_se_soc_info_handler(dev_ctx, arg);
+			break;
+		case SE_IOCTL_CMD_SEND_RCV_RSP:
+			err = se_ioctl_cmd_snd_rcv_rsp_handler(dev_ctx, arg);
+			break;
+		default:
+			err = -EINVAL;
+			dev_dbg(priv->dev, "%s: IOCTL %.8x not supported.",
+				dev_ctx->devname, cmd);
+		}
+	}
+
+	return err;
+}
+
+/* Char driver setup */
+static const struct file_operations se_if_fops = {
+	.open		= se_if_fops_open,
+	.owner		= THIS_MODULE,
+	.release	= se_if_fops_close,
+	.unlocked_ioctl = se_ioctl,
+	.read		= se_if_fops_read,
+	.write		= se_if_fops_write,
+};
+
 /* interface for managed res to free a mailbox channel */
 static void if_mbox_free_channel(void *mbox_chan)
 {
@@ -246,7 +950,7 @@ static int se_if_request_channel(struct device *dev, struct mbox_chan **chan,
 	ret = devm_add_action_or_reset(dev, if_mbox_free_channel, t_chan);
 	if (ret)
 		return dev_err_probe(dev, -EPERM,
-				     "Failed to add-action for removal of mbox: %s\n",
+				     "Failed to add-action for removal of mbox: %s.",
 				     name);
 	*chan = t_chan;
 
@@ -255,6 +959,7 @@ static int se_if_request_channel(struct device *dev, struct mbox_chan **chan,
 
 static void se_if_probe_cleanup(void *plat_dev)
 {
+	struct se_if_device_ctx *dev_ctx, *t_dev_ctx;
 	struct platform_device *pdev = plat_dev;
 	struct se_fw_load_info *load_fw;
 	struct device *dev = &pdev->dev;
@@ -279,6 +984,13 @@ static void se_if_probe_cleanup(void *plat_dev)
 		load_fw->imem.buf = NULL;
 	}
 
+	if (priv->dev_ctx_mono_count) {
+		list_for_each_entry_safe(dev_ctx, t_dev_ctx, &priv->dev_ctx_list, link) {
+			list_del(&dev_ctx->link);
+			priv->active_devctx_count--;
+		}
+	}
+
 	/*
 	 * No need to check, if reserved memory is allocated
 	 * before calling for its release. Or clearing the
@@ -319,6 +1031,7 @@ static int se_if_probe(struct platform_device *pdev)
 	priv->se_mb_cl.tx_block		= false;
 	priv->se_mb_cl.knows_txdone	= true;
 	priv->se_mb_cl.rx_callback	= se_if_rx_callback;
+	set_se_rcv_msg_timeout(priv, SE_RCV_MSG_DEFAULT_TIMEOUT);
 
 	ret = se_if_request_channel(dev, &priv->tx_chan, &priv->se_mb_cl, MBOX_TX_NAME);
 	if (ret)
@@ -340,6 +1053,7 @@ static int se_if_probe(struct platform_device *pdev)
 					     "Unable to get sram pool = %s.",
 					     if_node->pool_name);
 	}
+	INIT_LIST_HEAD(&priv->dev_ctx_list);
 
 	if (if_node->reserved_dma_ranges) {
 		ret = of_reserved_mem_device_init(dev);
@@ -348,7 +1062,7 @@ static int se_if_probe(struct platform_device *pdev)
 					    "Failed to init reserved memory region.");
 	}
 
-	ret = init_misc_device_context(priv, 0, &priv->priv_dev_ctx);
+	ret = init_misc_device_context(priv, 0, &priv->priv_dev_ctx, &se_if_fops);
 	if (ret)
 		return dev_err_probe(dev, ret,
 				     "Failed[0x%x] to create device contexts.",
@@ -389,6 +1103,7 @@ static int se_suspend(struct device *dev)
 	struct se_fw_load_info *load_fw;
 	int ret = 0;
 
+	set_se_rcv_msg_timeout(priv, SE_RCV_MSG_DEFAULT_TIMEOUT);
 	load_fw = get_load_fw_instance(priv);
 
 	if (load_fw->imem_mgmt)
diff --git a/drivers/firmware/imx/se_ctrl.h b/drivers/firmware/imx/se_ctrl.h
index b5e7705e2f26..5fcdcfe3e8e5 100644
--- a/drivers/firmware/imx/se_ctrl.h
+++ b/drivers/firmware/imx/se_ctrl.h
@@ -14,6 +14,7 @@
 #define SE_MSG_WORD_SZ			0x4
 
 #define RES_STATUS(x)			FIELD_GET(0x000000ff, x)
+#define MAX_DATA_SIZE_PER_USER		(65 * 1024)
 #define MAX_NVM_MSG_LEN			(256)
 #define MESSAGING_VERSION_6		0x6
 #define MESSAGING_VERSION_7		0x7
@@ -37,10 +38,38 @@ struct se_imem_buf {
 	u32 state;
 };
 
+struct se_buf_desc {
+	u8 *shared_buf_ptr;
+	void __user *usr_buf_ptr;
+	u32 size;
+	struct list_head link;
+};
+
+struct se_shared_mem {
+	dma_addr_t dma_addr;
+	u32 size;
+	u32 pos;
+	u8 *ptr;
+};
+
+struct se_shared_mem_mgmt_info {
+	struct list_head pending_in;
+	struct list_head pending_out;
+
+	struct se_shared_mem non_secure_mem;
+};
+
 /* Private struct for each char device instance. */
 struct se_if_device_ctx {
 	struct se_if_priv *priv;
+	struct miscdevice *miscdev;
 	const char *devname;
+
+	/* process one file operation at a time. */
+	struct mutex fops_lock;
+
+	struct se_shared_mem_mgmt_info se_shared_mem_mgmt;
+	struct list_head link;
 };
 
 /* Header of the messages exchange with the EdgeLock Enclave */
@@ -89,6 +118,10 @@ struct se_if_priv {
 	const struct se_if_defines *if_defs;
 
 	struct se_if_device_ctx *priv_dev_ctx;
+	struct list_head dev_ctx_list;
+	u32 active_devctx_count;
+	u32 dev_ctx_mono_count;
+	u32 se_rcv_msg_timeout_ms;
 };
 
 char *get_se_if_name(u8 se_if_id);
diff --git a/include/uapi/linux/se_ioctl.h b/include/uapi/linux/se_ioctl.h
new file mode 100644
index 000000000000..0c948bdc8c26
--- /dev/null
+++ b/include/uapi/linux/se_ioctl.h
@@ -0,0 +1,97 @@
+/* SPDX-License-Identifier: (GPL-2.0 WITH Linux-syscall-note) OR BSD-3-Clause*/
+/*
+ * Copyright 2025 NXP
+ */
+
+#ifndef SE_IOCTL_H
+#define SE_IOCTL_H
+
+#include <linux/types.h>
+
+#define SE_TYPE_STR_DBG			"dbg"
+#define SE_TYPE_STR_HSM			"hsm"
+#define SE_TYPE_ID_UNKWN		0x0
+#define SE_TYPE_ID_DBG			0x1
+#define SE_TYPE_ID_HSM			0x2
+/* IOCTL definitions. */
+
+struct se_ioctl_setup_iobuf {
+	void __user *user_buf;
+	__u32 length;
+	__u32 flags;
+	__u64 ele_addr;
+};
+
+struct se_ioctl_shared_mem_cfg {
+	__u32 base_offset;
+	__u32 size;
+};
+
+struct se_ioctl_get_if_info {
+	__u8 se_if_id;
+	__u8 interrupt_idx;
+	__u8 tz;
+	__u8 did;
+	__u8 cmd_tag;
+	__u8 rsp_tag;
+	__u8 success_tag;
+	__u8 base_api_ver;
+	__u8 fw_api_ver;
+};
+
+struct se_ioctl_cmd_snd_rcv_rsp_info {
+	__u32 __user *tx_buf;
+	int tx_buf_sz;
+	__u32 __user *rx_buf;
+	int rx_buf_sz;
+};
+
+struct se_ioctl_get_soc_info {
+	__u16 soc_id;
+	__u16 soc_rev;
+};
+
+/* IO Buffer Flags */
+#define SE_IO_BUF_FLAGS_IS_OUTPUT	(0x00u)
+#define SE_IO_BUF_FLAGS_IS_INPUT	(0x01u)
+#define SE_IO_BUF_FLAGS_USE_SEC_MEM	(0x02u)
+#define SE_IO_BUF_FLAGS_USE_SHORT_ADDR	(0x04u)
+#define SE_IO_BUF_FLAGS_IS_IN_OUT	(0x10u)
+
+/* IOCTLS */
+#define SE_IOCTL			0x0A /* like MISC_MAJOR. */
+
+/*
+ * ioctl to designated the current fd as logical-reciever.
+ * This is ioctl is send when the nvm-daemon, a slave to the
+ * firmware is started by the user.
+ */
+#define SE_IOCTL_ENABLE_CMD_RCV	_IO(SE_IOCTL, 0x01)
+
+/*
+ * ioctl to get the buffer allocated from the memory, which is shared
+ * between kernel and FW.
+ * Post allocation, the kernel tagged the allocated memory with:
+ *  Output
+ *  Input
+ *  Input-Output
+ *  Short address
+ *  Secure-memory
+ */
+#define SE_IOCTL_SETUP_IOBUF	_IOWR(SE_IOCTL, 0x03, struct se_ioctl_setup_iobuf)
+
+/*
+ * ioctl to get the mu information, that is used to exchange message
+ * with FW, from user-spaced.
+ */
+#define SE_IOCTL_GET_MU_INFO	_IOR(SE_IOCTL, 0x04, struct se_ioctl_get_if_info)
+/*
+ * ioctl to get SoC Info from user-space.
+ */
+#define SE_IOCTL_GET_SOC_INFO      _IOR(SE_IOCTL, 0x06, struct se_ioctl_get_soc_info)
+
+/*
+ * ioctl to send command and receive response from user-space.
+ */
+#define SE_IOCTL_CMD_SEND_RCV_RSP _IOWR(SE_IOCTL, 0x07, struct se_ioctl_cmd_snd_rcv_rsp_info)
+#endif

-- 
2.43.0

