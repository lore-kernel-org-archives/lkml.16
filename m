Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2041.outbound.protection.outlook.com [40.107.20.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD21222DA0F;
	Fri, 16 May 2025 03:08:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747364896; cv=fail; b=aBCxCV6CLmFUErphlBMDSU8qnmXqKlfXc+l4gAmYkW4Hui6BFRiN2pFD73BEcejSpSdl7VKoJHwOjhAnKwl+H7TyGQm3MOIDOyb7D2/5ptDjg+rRf9AOAS1sl1Bqif0Gsbo3WiyY84GhhcddF6qJF4/PjR4F10WXnqZKJVm3Zzs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747364896; c=relaxed/simple;
	bh=GcDEqgsDhjL8qOBsfA0S8QJulw1Usz9bkg+oQOBQoEs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=ZjmSgH/Su6sP0IWVJJqYkBa0v1tgHE8mlbNpMFFeKAlEiXis+IbrMM45etc0h9UXfbedCSZxNlc4yIbGR7cjZnD6gHQj/FJs32+6P33z2DWjpI5mYw7htQkzoJWMzd4dC3t0VknZZP++E3bShm6wls8isrU8mMLMxXp+BCBJRrI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=asES1MVA; arc=fail smtp.client-ip=40.107.20.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="asES1MVA"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yHXVEyPwfhEk79mwWX8t6QplcxxEaqcp691Pyk67Od67Hv/JTSjpr5k0TKwJCBeJY8WhyJCoGjMbXDwi1yXQquD/2hvTH3vFPygMQIpj7OPZHRy4O+afvGD0yrKJO2ravumrwzT7GlqaDJL0/lshxo0ahrZ5C03R9HjpzA6pESWE+lOfnNxuRoheTRPLUK66banSxMxgfiFgcSKnqTBnGk6ya+2jSrgCURMHHa9OovXGtBHW42/+uJcAxPn2lQA+ZJ8WWDjLnAOwZC2xrtixhZLgvyzKJyKp2RrS2NRKd199CHPcR2/ZctsRWVmc+LvLAFSyMDG3Tq+E9DtVON8NtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GcDEqgsDhjL8qOBsfA0S8QJulw1Usz9bkg+oQOBQoEs=;
 b=szJjyJeCgKN+1I0yt6oG19DWHIBvsPCalIfKdnQLhhl0JjoSORE6yBtj80Iw1B9c1QXcf2fTEjyEtzJ94wtRzbR3T8OTj0Mub3RIbME6+erlatNfTfaOhLsxOpPb0q6VDDgEkm4GwWeGE1/9jxgErEMaemebSgYcZwhon+1bbph3Am5+3fcpvLYLJ/yB3cZNWUjj358g0M/XT8oz8SGeNnFt/fT0H+Cq40SVe3Zy6CYQ7mir9oE7Gu9+1QWbzoBeLYU3I2jM5HmaNqP5FCYQJnvJrsXkxks9kEgCeY3Ir/+SREZ1xp2sHGj3bVO7pNm3agG7NnPLsdchXaEF4f15Ng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GcDEqgsDhjL8qOBsfA0S8QJulw1Usz9bkg+oQOBQoEs=;
 b=asES1MVADzgbDDywXFJtkZl09hsXNbb6y3JrfLLVpLEc/AMbqKraQNnvseLh8PewW+a5wgqtUifca3gv7JTOxyebaMyJbpYTx7HPCV7G68ITWj0Q3P/zQ7hTWscw9GQv+cEAADZ7kq0SlgWU6osfCy/h1qJAS/JDzR/1NN6uGonvnrArCAjHKCscQyG+spWB79m1ve3W/ps2Nl7s0ZbGWwsQrMOj2TJRIZzf+rpGn1xrdWwtLB7TH1u8lH4NkXk7ZDUWMiU9WOBy6iJJzCp6C7X5p7uZvFWNtpIpN0JxFUViy8tFil15iTZ8Zz30GowFHQuhJ5vlQIXu8Tt+9ge/oA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by AM9PR04MB8291.eurprd04.prod.outlook.com (2603:10a6:20b:3e5::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.31; Fri, 16 May
 2025 03:08:06 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.8722.031; Fri, 16 May 2025
 03:08:06 +0000
Date: Fri, 16 May 2025 12:17:33 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: linux-kernel@vger.kernel.org, Simon Holesch <simon.holesch@bshg.com>,
	Karthikdatt Anantharamrao <karthikdatt.anantharamrao@in.bosch.com>,
	michael@amarulasolutions.com, linux-amarula@amarulasolutions.com,
	Wolfgang Birkner <wolfgang.birkner@bshg.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 3/9] arm64: dts: imx8mn-bsh-smm-s2-common: Keep wifi
 enable during suspend
Message-ID: <20250516041733.GE28759@nxa18884-linux>
References: <20250514082507.1983849-1-dario.binacchi@amarulasolutions.com>
 <20250514082507.1983849-4-dario.binacchi@amarulasolutions.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250514082507.1983849-4-dario.binacchi@amarulasolutions.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: SI2PR06CA0015.apcprd06.prod.outlook.com
 (2603:1096:4:186::7) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|AM9PR04MB8291:EE_
X-MS-Office365-Filtering-Correlation-Id: 5cea2b45-ea4f-4a55-2568-08dd9426e0d4
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|376014|1800799024|52116014|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?F2itKDOYJkeMsjdzKjTHI+qnVK8Tdsu1U+ubhhWhRPm/ZYTriegTLjaxWkpI?=
 =?us-ascii?Q?2gDT3EuEZo6oPe4TAGJJOsfnPObGWFdWQ7V+dJC9/zEBEeQ2YmJYpOYSh3Ws?=
 =?us-ascii?Q?12GC8y/AZcyVyEJTZJcjhHqB21zrGdZYajGGxh53mfUYXYZKNzZsxY+SH8fY?=
 =?us-ascii?Q?Y3PyjuI2RgKUnC2Mh7tJT2XfunT59CRjDcQcnTVE5IBS26QxdKllyHqb/s2Y?=
 =?us-ascii?Q?gWNnGdOuBRfsUU0wNOR8MxNKf4yOa+ZCpOzr311nv4nMNnwDu1Vcul9VJ1Ku?=
 =?us-ascii?Q?xJL4jligKZq9VS4Nr/RRBHqWxf+rO1KgGR2wjvl3mbuE/vfC1m8R3rWWOyEI?=
 =?us-ascii?Q?Ye0PhZzU4R4D9ZCLR44Zqd1SuWn6Sd284m1XlwA7ruzdsBzW839AYr9acSdc?=
 =?us-ascii?Q?dIG3FNmGSUbBEps6hd9rGxIYepNVTgT+w8Fei6MtdOEeXVroZm0okMIC4hbb?=
 =?us-ascii?Q?ZWRfPRG+lJZuKjCDuivM+xWn3EGunelSmrdnp7bra9lPUQXzHUgeWrTPS5QG?=
 =?us-ascii?Q?GztqtyPnOd++M5JScm6f/jtxrDK8QtTK0wTPpHzVXMCSoEl8vmaWlOdHqkzE?=
 =?us-ascii?Q?YXuqtCqxYkZES7bOnhPaN6VBYLBFEftOPi1P+KJ9ieKxdmAtjT2JTzVwmQbu?=
 =?us-ascii?Q?EiMFOCXGek6oIsGEi3/66Fp0tCIdHtXlMI+ksKGYce4nzM2m7X7hCjZ1vFG7?=
 =?us-ascii?Q?6kgJbhY6BQwYMVhrCBSlzOaTNfMQ4vr9pARM/lWAnPx+i8/R4L6bFGZHBpgZ?=
 =?us-ascii?Q?Qq37976vGUbXnJ8HFpAqD8UKlOeDi0MFvBH0IDqizxc2v3Faa7h/KE5gg/Xj?=
 =?us-ascii?Q?/UV9+3+51bhPAJXnWoWSjGYKw5LKnZxa4gUsNIop6U038btIcCg6+3GNplfk?=
 =?us-ascii?Q?5eVfPpvdA1EsImrX+3DJT/GQUWhxQYWP5tWpJJcIPmB48ghGcjPEK+G8kJKh?=
 =?us-ascii?Q?w72RlFJcVyYYNZoVKlocDwBKUgYUFUfClPqfyEkgBTNkVbGJrcf1IYAsEwSl?=
 =?us-ascii?Q?AIECxm9EiZNawPPf4V4ffBXNLMewrejp9ub8GWLVtKcN28++9wa+fBgGX41M?=
 =?us-ascii?Q?hnhU3lcAVn7Gp1h5YuPFZnzbaBFslKsmSrXVvRBbvHRs+XJqokdHANBFlL0h?=
 =?us-ascii?Q?+nDKokT7cHGk3ghD6UsAYAV24Q9/QfqIqhSa9dXzQOAG6NDEyvsIT/tJVPt9?=
 =?us-ascii?Q?la5mD2f/Pzeyto92Z2C39CTwdkkCbdxVsN2wy2W9u9zui3xkHABcoy2/Fs3+?=
 =?us-ascii?Q?z8rM7+9dO0UQrCVS/tHx9hOManMuWxA65EOKexLidZRPj6PcaOMAuTu+kraV?=
 =?us-ascii?Q?1PwvEb3zB1m6TUIcejBE7rBXznTUiZYIURQW3WrktS30Nx8XRxqRwfKohNwh?=
 =?us-ascii?Q?8CuX0eBnGnEEbhOMZyRrK/t+M8PX0pCr6dD2mOS+GPtiyNYTKvxk4XRX06Bk?=
 =?us-ascii?Q?oQtvn7oyUEnRyz57jnBVoMvkUDNqaps2n+PNkElpF9soQ7HtuGSRE9X++VJF?=
 =?us-ascii?Q?d9RqvwpxNN7kCx4=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(52116014)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?P8PmhYTzpv6yKj7Nzyi0+OYqqsl0J7zfsV3mpPV9Hg6tj6fvLnV9pLLSIGa0?=
 =?us-ascii?Q?ez4d7fv863VNMiWDudBM2MgzGMAOgzV2rUoq6m+LfNoLteNbHqkpvRskS1G5?=
 =?us-ascii?Q?ZkyR/KSGsbxWzpAlgn2GxqnB6EePbxHv4L8rmCKlSgymOr2rFV+0C+5fOgGr?=
 =?us-ascii?Q?Njd/xuuYRx3swQ3FBbk6GcKjGtxHUtH57S8a13+dGmbKGm2+3iERTIfNmRVu?=
 =?us-ascii?Q?WnsKbkwYUNMbEXMix7GxQP6g769DaxHKbJj6FCJDyFz9RMXm/9bQHC1eTtGJ?=
 =?us-ascii?Q?QDph8At5Yy0dWSvxZ6RjZyfGssago/SQuQzMgL+iS35DnXKuKejnAJYiGlAd?=
 =?us-ascii?Q?LZdqHcTvLFkDvbLsJSTod0+Z/KNgz27a1hM/FCqVQYd39p7/qVrhfpTWWe4s?=
 =?us-ascii?Q?zK7fEOzdXZ0/hLTmxxeoG7x082JO6BQlDbx0CwZJ1PMGgUx8xG5tCtKL34jO?=
 =?us-ascii?Q?fVAONCWhreB8xBV/Rq0bn6BkNDJtJmV34rHz+FCgdRUdtYf4Zx5Z1FTqXPSb?=
 =?us-ascii?Q?44pptJRbnM486HezFmPbnWqooplnW6oOerTewcYtDkp+SVag3o/Tvx3pH6VB?=
 =?us-ascii?Q?rCw86fWygneJ3Cq8gxGCqpcmPMP4BAhcO17aTtK5mx+yABVmQCN3hizQTBif?=
 =?us-ascii?Q?sDMpCzGNGGFHtHT06ne+wBPg+u9kE6hNKbdMv/Y/Dyewh55r11goKKdIvxxX?=
 =?us-ascii?Q?adZtpsSVphWqm4/iys8C62UMLHZdgo8+rjTt2Fqs7QfB3tihooadoaSdVJOM?=
 =?us-ascii?Q?MOKr1Z3AroaxAbNQLg+sAMAMOUb5fkJhnTUpibGH9jwvyFl7yUiULH+BYGiw?=
 =?us-ascii?Q?CxKUahI0nasW28z7ShBso4DbFoPOKJ/5T7VHecPW7kGuLSIWQyBljYoew9c1?=
 =?us-ascii?Q?shyO8AOxFjXgV+8CKDMZVEkY2dnxirsQvnX9udQ89pAmAK9hjwbWlCJsU2Jw?=
 =?us-ascii?Q?nm+uA2Ir2zl2MaBU1OOswTHP4GAY6BTFJjcIo1ziyP6VuIWUMZUJ4ue9V2gM?=
 =?us-ascii?Q?feBrV2yKbTA+KSz42Snki2KuzQCj2C3dB9V5CiAmP9VnGqXmBesuXc65t8QR?=
 =?us-ascii?Q?zcCydC4gWzR8GtUU5/TO4WHRoaf51om3xw8bhyV1/vnlKgXVLu4TN80zC3v/?=
 =?us-ascii?Q?gaGCm9LOdGOjix664q+wchHxyW2fGlkyaUCVU/UfdacJxh3otEhLe8MbIQv9?=
 =?us-ascii?Q?FmmaVUcy6LWD74b9OcNUp86BGjnw5VtygintZemR2iv0ybvP/LEI848T2uCR?=
 =?us-ascii?Q?S5HKYMfrx/YE8WpjQgS73PVL3eInGKYwTA6PFFbgwh9szzK+PBLMyHn6Xr3n?=
 =?us-ascii?Q?xgdVdOf/lx3Fof/RQGhU7PF04jcXQ4BB+dBOVpzKrCZuo/N2DeiA616/pQcC?=
 =?us-ascii?Q?/MF2vdMafKMbti6I6XGQviusjdinjB8E9PV/t6sqd+FSY4x/bmEtMSIZI8Ji?=
 =?us-ascii?Q?PGAfVhiFHY3gShk1rAqmJog1sDIvRH9e0RrXIWrywcniqgvJ+WIPuU1Ba/1l?=
 =?us-ascii?Q?LTiAFCMmn5DrKGYXHVrZSSerbpwKRb7s94sh4GoSoroBaB5Ef1LtWLZsqFMo?=
 =?us-ascii?Q?6tNRnPQRlctiu0Hht9Xx2cJbrX89lKDHv9L/9SVB?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5cea2b45-ea4f-4a55-2568-08dd9426e0d4
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2025 03:08:06.0259
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GbesQIKbcj9RQSJG4zhw34Pgxol17pOc7vRMTsUa6fyOf/dV1jjgYmWPgyME+rXIW/9ThGBOuAIroKjEeZIYkQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8291

On Wed, May 14, 2025 at 10:24:57AM +0200, Dario Binacchi wrote:
>From: Michael Trimarchi <michael@amarulasolutions.com>
>
>Allow the wifi to be enabled during suspend. Use case is needed in most
>of the devices deployed in the field
>
>Signed-off-by: Michael Trimarchi <michael@amarulasolutions.com>
>Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

Reviewed-by: Peng Fan <peng.fan@nxp.com>
