Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2060.outbound.protection.outlook.com [40.107.22.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 527E220C006
	for <linux-kernel@vger.kernel.org>; Mon, 26 May 2025 16:30:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748277005; cv=fail; b=c3wKT4YO2ls5QcjEOWvbcNffFYF/pFf/beBuXBuxAfLZxOFsLb59e1hx3IJn8vxrJ2WVItlkzqvcmJ1QKBPZgZ0h2IE495ZS6QF1eXTm1+XpySZRoU61i5lZkWaj5Sj8ho5dhbXceYi00YURNOHhU7r1fmhNvPCzMchAifRabdI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748277005; c=relaxed/simple;
	bh=hogq5E5qek2n+FNvHYGAE0qnwQerHqESkqi2JguJp8w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=CiFxkcFSD7mjL2wPJeUGp9CyuWw92u0HAI1y8u8I0nYYFiXjZb1r5mHznSLe4I5vVUfYDR9AvhF6a5qky/yi66B8YE4gIYjZ0nl4j3gU1u48rBbGMReWYJpyfsmlmSmNZ4imqxoJhrYsavja4rxoh1Smqt4JA3O+yxc0I+uF+IY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=V9V5vI6t; arc=fail smtp.client-ip=40.107.22.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="V9V5vI6t"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xXholvrVaf5MlOQORHAsH5VOCt2fzAg55oDnE4p+ZLHKtcgugTLBCyMdRuWsVghpZqJ+Ro01SxFV+6t1vpkSvXM9GqKB9QFVFTgEeDsMUfehcR3CZTYodcFki36MEasY9/vKN/clhPoipJ7XuizQV3TFuXMVIRU3eWFq8lrQeD+8t7GGv5kN+fTi6ns4qx2izT8MAQPHnkbmmC8C0vitMUsqoNuPsZBf/mTJO5fQVJFXSoXv0ILBbKKVmPRMM1eE2iPbcPQojFrfUtahtUYoXwY8mCvzkDKYimce2DWoNsnxXz36qYyxVMbJ3DtXB2uF0Xz969QFRqLZ2Y/Y3V8d5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QTGM0GNVeqUiQOx6Fe48ANf2kL/Lp6OmpwkYaq3SeoA=;
 b=C7WfK4zNASNQKe7cZF7tDr0EDoG3cPFn8ceZN3nCSVaBfkYiEWFnFQirrZ1bDCYoAbyQ4z9ixViEZ310UCXR19+0LacT0P8QO/Yo1dTSuc6am5FFoPjVeWpeMoPWlI+f4rlTdduFO/BlETnF/+k7Q55olkFigrwzfWS24ZvFHSuUN8HmBkron75dkrg+vc2NEigXKLaTVBEfPF63BEjNpRcDGcB9p0qp205UEiYQQZX7e0Z9ZLqrP6GuR8/vV0XtNLaHdPng+lY+skK04ycXj7c0ZZ2p51uAyl7vIHDLHupF9Id84ur4k8RYfR6KBJAuoPFaG5ZL8vkVRf2tegIGeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QTGM0GNVeqUiQOx6Fe48ANf2kL/Lp6OmpwkYaq3SeoA=;
 b=V9V5vI6tOtBkoHjYmKDO+elDv4ExsqPQ5wieoG6QmkRxVrCN9kkYE+Rea9nGIGWJlINYYu/uTsBLtQjSahUuPZ508hHBn/d21FiIIzUZeZxF2W/HLnSZiDH+s52xjiC6Hrl5ShkSJR1RqqaRzNNnDUHq02VAPRJjWEV6MuF0H8toXpq1ehdVxK8idwRKbmIrI82zvYFZkK2PrCDHdqWV9OXjV2WKwQNejnbO+AloKSidm6W2jYBIr/eo9N2Y50yqv0QBlXiyKWIdAVQecYn3k46ZSH0nfrQ3++scQrAw0KbC4kkdXcGffnW1+wOZGOjW3aJ2Qt1VyfeQPM2lDWUEOA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU0PR04MB9251.eurprd04.prod.outlook.com (2603:10a6:10:352::15)
 by PAXPR04MB8473.eurprd04.prod.outlook.com (2603:10a6:102:1dc::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.32; Mon, 26 May
 2025 16:29:59 +0000
Received: from DU0PR04MB9251.eurprd04.prod.outlook.com
 ([fe80::708f:69ee:15df:6ebd]) by DU0PR04MB9251.eurprd04.prod.outlook.com
 ([fe80::708f:69ee:15df:6ebd%5]) with mapi id 15.20.8769.022; Mon, 26 May 2025
 16:29:59 +0000
From: Ciprian Costea <ciprianmarian.costea@oss.nxp.com>
To: Shawn Guo <shawnguo@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	Christophe Lizzi <clizzi@redhat.com>,
	Alberto Ruiz <aruizrui@redhat.com>,
	Enric Balletbo <eballetb@redhat.com>,
	Eric Chanudet <echanude@redhat.com>,
	imx@lists.linux.dev,
	Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
Subject: [PATCH] MAINTAINERS: add NXP S32G RTC driver
Date: Mon, 26 May 2025 19:29:54 +0300
Message-ID: <20250526162954.2467894-2-ciprianmarian.costea@oss.nxp.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250526162954.2467894-1-ciprianmarian.costea@oss.nxp.com>
References: <20250526162954.2467894-1-ciprianmarian.costea@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM8P251CA0027.EURP251.PROD.OUTLOOK.COM
 (2603:10a6:20b:21b::32) To DU0PR04MB9251.eurprd04.prod.outlook.com
 (2603:10a6:10:352::15)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR04MB9251:EE_|PAXPR04MB8473:EE_
X-MS-Office365-Filtering-Correlation-Id: ac36aa7b-8971-4e78-8ff0-08dd9c728ecd
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dXNYc2dYRE5sR2J2WUlsR2tZL2d2SUVHRjdaci94aXBhcmpEZXhYekZmV0FV?=
 =?utf-8?B?SzA1VlQwRVZ6Q2M3ZWkxc2RscWQrcGQ1TWh1MXNlVTl3RzZsVWRuSDRmUGxt?=
 =?utf-8?B?V2RCd0s0OG9HOHRXd0oyR1FjVkNXOTUzU2xYN1JrTm1vTFlZMVNUMTZoVnlp?=
 =?utf-8?B?QnJRaEgyR2p6THZUVTJzUEppRnc4TDZFWEU1c20xS2dlTVh0REVzZlJlU3J5?=
 =?utf-8?B?b2FLdFpQQmdsV0hrR2tyZHlXWkxpVSt2VHExTkRwOXU5TGlhczVCN29CQ01r?=
 =?utf-8?B?b213aWZCMXg0YW5wU2JaUktiL3VCSUkybG96dTJydEU3Y3pnNHRZNHRER0xE?=
 =?utf-8?B?UzVXanZKNXY2WC9wT2ViclpROWtQOXpXdGtrUDFxQkdKU2NQblJaSEhyODkr?=
 =?utf-8?B?UzQwYWtYSXNHd0NjY3dvZ3VjYlo5d010VmtDSEg2ODcrZXVpVTIwRFZIenVo?=
 =?utf-8?B?d1d2R3NpMkhUNm5XRUY4L1FDK2JtMWptV1VzZTJyMDdocndINSt3VXByRnZJ?=
 =?utf-8?B?eXNNTzdGTE1JS3VBcDdKTWNiTWJGNnFxZWlqQUwzRWs1N1hEaDZqK3FKMG5Y?=
 =?utf-8?B?T2dxdUZOZ3RNVzN4bmxpQXlQRFVrdmF1Ylc4bkpXaW50UWIzTDJjK3hkdC9I?=
 =?utf-8?B?NHBTY00vL2kyY3M0M052ajBCcFRkbjhuMjJ1djhJWkpkMjlVcjFoNkx1VDJK?=
 =?utf-8?B?bG5iZTI4ZlBkczQxZHNrK3VKMWdxTkFxZ2tnN0J6T0pWY3BCaFRSWjFEZlMy?=
 =?utf-8?B?NDdOcWlZQUJmc21iRkNMYlBTNlN4RFZod1ZtWThMVkh4THJaZVdGUHllQ2lM?=
 =?utf-8?B?Q1I3M0VreEc4N3J1MEtqV0xuUWR2OS95ejgwVVgvNnc4djVCZUxub3lxTU1t?=
 =?utf-8?B?c081dUhHd052R2VkcVRtZThDMXFQeVFoa0N5ZUtwR1VwV0JsaGVqb21BNENC?=
 =?utf-8?B?Z1lZZTllRXBYM21IbVU0TnN0UnJtenVwVU9lZGlRK1l2WkNxZWZPbmNOTXBr?=
 =?utf-8?B?MTlaZDJmS0pqMThJMkUwR0JwVWx4WWh6VDBQZmlnT3VYU1EvZFJONFF4amRN?=
 =?utf-8?B?NDhJM0dMTzBKcWdPcHhvbGx2UFpibjN2bzlOVHNrQjBXdWdqR2JmQnU0S2xP?=
 =?utf-8?B?OHNHZE10VVFGL3JsMjQySzVQL0ZJRDFkVklHUnptc1FhUW8xSlQzTXJlVnNH?=
 =?utf-8?B?aWlyREovRkhRSkd5bm5KYk9sUTdlc3R6R1FpS3VMZnpmbjJKa1FKWkI4Tml0?=
 =?utf-8?B?bEVGK0NSL3V6SVhOZndkRzR6UzJzMGtISHJiSDA3WmpQcUZRcFpSVzlCalR3?=
 =?utf-8?B?azhnYTBvTWpVZlBjOWhqa3c5WVdvSUgweCt6N2J1TmsrbnZLWUNyeCtvMkRk?=
 =?utf-8?B?dVY3Q1RUaksyNGFPUGEyYnZwNHZSV245WGVXcjNkYzZMU1JLVGRvTmxrOFY3?=
 =?utf-8?B?Q2s0SDF2QncrVnNXL05RUTFuZVZTanVxOEl0RnJJMmlwb3V3a0JaejhTVVhN?=
 =?utf-8?B?ZzEwUytCeDZHWTFOcExnelpzUm80R3kzQ2FiM3NxM0haYWlFZnZ0MXNpRUJs?=
 =?utf-8?B?d0ptWDVwc0Fid2VSZldGbHQvQXE5Q3ZHR2IzTkd0TjJFUTJDTDZMNWs5ckxP?=
 =?utf-8?B?MERXWHptQmxsOWpyZ2lDaTFyM1dxeXFSUitSM1Rhb3RWdGFMK3FaU3hOM2FM?=
 =?utf-8?B?OVB3V2pVdTB4MGhvYVFWU2FNUkpsVnlzTEZDeCsrekZrYmJxUXBhb2EwSzZK?=
 =?utf-8?B?WFdhZnJnaVhKU0JFa2lROE83Z2FwaXF5eG1tN3Y5bWFKbGhWbkVPM2h0bStU?=
 =?utf-8?B?NDV0NGRQYzFIb3ltWktrRlAyWVBrVml3d0x6b0k2T2ZyZWRJK2YyajdkK21n?=
 =?utf-8?B?SWYxZHU0VVlqSW9NZ2w0cDloV21hakdlQTV3MEtzWUJMZEd0WWJnUGdmdndr?=
 =?utf-8?Q?o5X/5A7681k=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9251.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?a1YzdVRseW5RVG9xcmhOYkgxS0V6NTVXS0lMNUcxeDE4Y25mR0pSWUl1QllJ?=
 =?utf-8?B?VXpHK29xVENUeUJDRTh5YkpmWjUrd3U1cndTdEh4UlJjaEt0M1BKOGMycWhI?=
 =?utf-8?B?THVQc0ZZNVRORS9yV3dtSzBlUnZSTS9PWXlKbjY0S2ZZaTVYSU8vcUl5ZmdF?=
 =?utf-8?B?TUc2bjd3U0RDbjVqUUxXUDVIK0d0NmhtR05SWGIwbmtzU0Y1TGt3NWdrOXZm?=
 =?utf-8?B?bzR0Mk1nOFBBa3grTXA1TmRpTXVUc3ErQ0E0bnBaSlNJVWFadW5XQ1I2WlpH?=
 =?utf-8?B?cTA2MHBZQnZjdWxzb2toWmd2c1RWcE02a3JYMGJWeGV4MUxKanM5NFcza3R4?=
 =?utf-8?B?ejEySGlDY1F0Z0lOSG9SK2h5MHJaR2tOc1hpNXczV1k0REtOWDZxdjk3M0Y0?=
 =?utf-8?B?eGcweStsZml0VkEySFFuL2FkcVhrOURqRUgwcGZQdzdsdFN0SFg2S1Z2WFdx?=
 =?utf-8?B?UkxrUjB6VVVNVkVsU25UYUtOWTFJK1hlSFRJSVhpSmgxZlp6ZjVWOWpEM2Vj?=
 =?utf-8?B?ZFhmaTA2OG80ZFNjNEFmK3hKTVUyRmNuU3lKTmRQVldQaE54Q280L2JYcFpp?=
 =?utf-8?B?WjhBMytpYzhGNFhYcVFnNDBzMEUrWERjTlZVd2txL2ltQlMrV05ORTFMK1ZI?=
 =?utf-8?B?blZtb3d3TDBFd0xSaGwyNzJlSy9CVDZlWHVnbzFiSGxzZ29hVjYxdnhpTnIy?=
 =?utf-8?B?NDgwUUlYQWRUQ0s2VnJURStNemxkSmJHZUZyQ0hSTmVtWk93ZDV3djNEOXg0?=
 =?utf-8?B?bmxTeDNzTTFycDdtb1dobHRWaFc2M2RHV29uQ2FKbkFEd3RISUNBNFJ2WFF6?=
 =?utf-8?B?MlJleVpUVGFDejNMb09rck53Rk1PYU4zK3luamlCdkhBWmZKTW10MHYvNTZW?=
 =?utf-8?B?aUF3Z3RwR09oZ2gzclB6NTJINUpJK1JQWXNQM01xNXJJc2NlUmpSRVFrOWpO?=
 =?utf-8?B?aVJ5aTRBYnlxdnJwVXk2VkJ6WkdyL1BLcFV1N1JDd2czQU54cGR5T2pvTFZ2?=
 =?utf-8?B?TGpiaW95dGpQZkpGdkJHKzNaYzlPOE5yUDMyTHpiUW10b29KMXpjNnAvNWlx?=
 =?utf-8?B?a0kvUTZLZFQvbzI0dDZ1RHZoUUFRTUtUNUNqUy91UnQ2cXM5UzlNTjUxRGVh?=
 =?utf-8?B?bHVTUHlaR1YzVGJQQTV6TFVtcFVJNWVWWVNXcFB1eE81a2loSDJEMzVDMFF4?=
 =?utf-8?B?Y0NLZGdCVWZEUndPZmpNaCtyaS94VTNNZE9SMWdIdlR4WkxQdHIzTUxuemd6?=
 =?utf-8?B?RkFlcGUza0hZWHBhc0RGdm1WZEs4TGlHaVZrVmhsazlmUGoydnhTZ2tKYjVv?=
 =?utf-8?B?NVB0RDhtT0N3N0x3cHZjRFoza0pIUy9OTnpEejlFVmh0QW5UKzEyQm1ieGp1?=
 =?utf-8?B?U0owSW9UeXk1RHNsWEN0TWJIUWNIQnVQM2VxWGlEUkpXVUVNZGZCRUFCR3N6?=
 =?utf-8?B?V1l2TUY0c2x1QlRoUU5wWEpOYlAyaVdXRG82MWZZdUF5S1M0ZGRyWFVxOVYx?=
 =?utf-8?B?WVV2RzVYN1JtdzVJdENVUEY4bjRKSnBaK1JGcC9Ya1Yva3lyaXhobWZEK2VI?=
 =?utf-8?B?cDFzZENKKytGTVl0d2t1N1NhQzFZYW5VRjNLL3lZMm9HSWloL1FuY2dwWlFr?=
 =?utf-8?B?WmdRcDZJNkhqRk5GTktrbWlBbmdrdm40NGhxQUJmbDRqL1MrWFRCRU0zTHM3?=
 =?utf-8?B?c1BZc3gyY1JvQTBHcE1hRk9vK0FzVVlyQmZhVzh4dVlsblpxR2Z3T1NhRnB5?=
 =?utf-8?B?R28rVWUyL1pVMGMvVmJ1bzZUYzZjMWR6bGdnTnFRME1ncFdzTXNHYVFmdmMx?=
 =?utf-8?B?N0FVWHFjdXRZZUR4WVJWMUY1eGxiN0tDZEtrNytPejY2d3NVMk8rVHN2Q3hk?=
 =?utf-8?B?YmppWHZIdXpSQmFDVjA0bGZVcmR0YUJUOE9vREwvWVVIS2EwYm84MDF2NXA4?=
 =?utf-8?B?MFRYdVlldmRUNGMvSXlzVnhQd21YZEh0aEMrYVZYOXpDVXNKbkxGQnFKMG8y?=
 =?utf-8?B?dHJHbFI4Y1FvWWJWM2RLaWxSTHZJREVkM3hTMWk1a25VbVl2NEo1eTQrbmVM?=
 =?utf-8?B?c21xc3lnN1ZYU25hMkFhUXRweDl1bElKckRySXpKWEg4OVZQY0NSa29lSnZ5?=
 =?utf-8?B?VkpXeE9hQ2FJYXQ5UkwzeVZvbitjY3BxenpGaXdlLzFWdHMyNzhNREszb0lM?=
 =?utf-8?B?T1E9PQ==?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ac36aa7b-8971-4e78-8ff0-08dd9c728ecd
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9251.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2025 16:29:59.3890
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: T94Nv2oA1ohaetsB51icQCHzate3iy6UbCcWD+DJOZ8jyhKs29uRvivK8wFAPp0szc+OFhoBnJpjp065XbR2qXhFhWoDsNUOQczSc+0zYKs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8473

From: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>

Add the NXP S32G RTC driver as maintained so further patches on this
driver can be reviewed under this architecture.

Signed-off-by: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
---
 MAINTAINERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index e20de38ffa54..dd0c02846de7 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3001,8 +3001,10 @@ R:	Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>
 R:	NXP S32 Linux Team <s32@nxp.com>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 S:	Maintained
+F:	Documentation/devicetree/bindings/rtc/nxp,s32g-rtc.yaml
 F:	arch/arm64/boot/dts/freescale/s32g*.dts*
 F:	drivers/pinctrl/nxp/
+F:	drivers/rtc/rtc-s32g.c
 
 ARM/NXP S32G/S32R DWMAC ETHERNET DRIVER
 M:	Jan Petrous <jan.petrous@oss.nxp.com>
-- 
2.45.2

