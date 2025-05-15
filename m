Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010009.outbound.protection.outlook.com [52.101.228.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 850172D052;
	Thu, 15 May 2025 04:45:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747284330; cv=fail; b=JJOWBqf8rnB5LqlDDqbPKg68GXCNSqyzUbrQlq6gSrn1FJLEG5UZ/CaqAfr3R3gE50V0EElRUiR5R8MNfms+6FANi30cPEgUWlo2tZ9QoggG3OecWxP8usgBvVrpVZwu2aiLk0x95fFKzqdWXjT7hGRKtSunQKbMJO2VG1qLsPY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747284330; c=relaxed/simple;
	bh=1Y5iOVHvCTjEZiQqUW2t+3l9CbrxftSTKNUhl7Wh170=;
	h=Message-ID:From:To:Cc:Subject:Content-Type:Date:MIME-Version; b=e0zwmNI2hlZcLfUJOjgiEsjY7k1IWCN+hyXdbw8Bgs6WXPKJg3q+nqQP7+PlX5Y+GomL4wOBMQlwXsH5YIrbTDjzznMgB5TVtNI1bWltU4QCNXD2VnF+78Eb4jAao4oyGnNikcq0tN5JdiNW7v8z80A4feWpxrLelk7pJ1WqN+s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=RQ46kZSX; arc=fail smtp.client-ip=52.101.228.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="RQ46kZSX"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p1PpYFnykWxecDo2KQHqvqBADUCEk1FPvWcMKkTCzxzbKVSskIKXOgCvW9j4DODn7SoWYMkFtVZUW546cVUS6QtzUKomIpkbD/oWsmeNrhA8q30wESoWTLCTTR+M7SxIAcEzeOt1V3Cf+apkeL1D6MHHkTQc7rx6+++4Xe4HGFggYO4wopaO69LOladWSDZrWunCkzwD3piXPpQwkVVNR6i+ERCkmDoRuEVATnANxQa/iV0ske7NjmSuE9m7Kx/8a3VVLxd8XOxk/ftql4vciPS/aVyD4ija4Wh1iA+iRjFmCXEngbcI+APngQ5g4ZhI2vEjmeCpoKstMdGkDJyWgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Nf5RFvzG59YRee4tcVAsq9FchtAZrNPyti3WToOKg7I=;
 b=HblEEPUWC51c7Kx1a3ymVnlhMkvTBwA6hUJp2BNcqVL30rSEgwy5T1P69mryUaSwXOLPUqOmNq8gMbynpVot0I53MrqjQptLAtb560WwuAjeSTgKTGXbCNeaa6r5YNB/8rdAct1PRkZWBWduj8HbNoj+iwgE8rhIRM9nIGCzaQsP1qNBrhyGGxGsbUcJOC9lfyBgRuOLYDuBVoyKQhBC2XCWNfRU/YrhNh27PhMJFmGmTlwSozwjo0uwANjX10pOUp4rKmksrueaBRZfXQ4iEA1DW+9u/YfSyT0iRl1xDGu7jGZF4skxNkwaNRfWFEzarICIVLxnt6kNkC0TKlcqjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Nf5RFvzG59YRee4tcVAsq9FchtAZrNPyti3WToOKg7I=;
 b=RQ46kZSX97i5EQ7iHm+MOtz4i2B4kwH9neo7IfwKiT6a8yY9slSNL6xV6f0yxL9pv7m3OXuuDrn2Qxv4bNjZI9aI3nChyy7pDHdgIfV1sTuXQMQvro4AmOhkvmJsxop4WdkwM8FAz5MLqb1Eqh6XTDmyIbhlDTW2jS5GvpEEveg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYAPR01MB5770.jpnprd01.prod.outlook.com
 (2603:1096:404:8053::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.32; Thu, 15 May
 2025 04:45:23 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%6]) with mapi id 15.20.8722.031; Thu, 15 May 2025
 04:45:23 +0000
Message-ID: <87o6vutrbw.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Linux-Kernel <linux-kernel@vger.kernel.org>, devicetree@vger.kernel.org,
	(Renesas)shimoda <yoshihiro.shimoda.uh@renesas.com>,
	(Renesas)goda <yusuke.goda.sx@renesas.com>,
	(Renesas)Kurokawa <harunobu.kurokawa.dn@renesas.com>,
	(Renesas)Kihara <takeshi.kihara.df@renesas.com>,
	kazuya.mizuguchi.ks@renesas.com, takamitsu.honda.pv@renesas.com
Subject: Question about UIO vs DT
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 15 May 2025 04:45:23 +0000
X-ClientProxiedBy: TY2PR02CA0039.apcprd02.prod.outlook.com
 (2603:1096:404:a6::27) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYAPR01MB5770:EE_
X-MS-Office365-Filtering-Correlation-Id: 62770072-2f9f-4001-2779-08dd936b4e02
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|1800799024|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?sLxFFQ1NARu01HxdZwvmAc3llbwZ5UxSWCoUyRO0TaWCpozHc3RkwMyByIN3?=
 =?us-ascii?Q?NvzXPANI0vr7QDLNtzmhNr1KoDiOW8thGL3kP66YtbNRiiLrujlHBy6JWDp6?=
 =?us-ascii?Q?/riR6S77wqjZA7Dq5c2hOWMjm+8nksWSCIqw1tkKWGh2bv5vIKL3KC9y22oH?=
 =?us-ascii?Q?kcQnFmpB3TGS7jtEIlEyOORDLJfNQlnQwgU1/GNBaWvOZ6KCdSm9oYrAuE+y?=
 =?us-ascii?Q?FFTryzBKcOz4jWvoCEtV0bPcAFJ1ioe5UATW9WwF86Fcp2yT8tK31xx2NRMt?=
 =?us-ascii?Q?vP/ynf49S0K512w/IAIT0FY+sgiPljA2mfLpAVIYM0C+GbeOZeWExI7c6r9F?=
 =?us-ascii?Q?uSrRMk77amQpg3vFAiEo/6AYoiQxf0RzRedqdVnHLHGECqIqfQ7HXW8S3I4h?=
 =?us-ascii?Q?64QSkPUjiEPtjuJUnlelarlx1F6GARc/Fn3s72Diod9jD1FVzobipskVW91a?=
 =?us-ascii?Q?SNv0xPSEywkSSPa2egRI/Iz6QpxuJV5QXnViWAUJCfzPSvF6zGTjMQBX4UxY?=
 =?us-ascii?Q?yocOLlRZGtkssfU23GQZxj4Re+m8cUNH3c2Dy6/E82+TfEKZnln23d803klY?=
 =?us-ascii?Q?fI3AultKaEqlXBNcngAgLH26704pFroe6m6VWGUOqmdOrW0IjSSKV0TANNpt?=
 =?us-ascii?Q?iyLdkt5Ha1fPThL65L1M8JLu2XlZvFpzVVfmx8HJGIYV4LqL6ivuwVMVOL2F?=
 =?us-ascii?Q?lZqlbldcBUxmi0pfsqA8o8NmLRmnTqlQSt9xwA9juXZQJ5T2MJxKXGR2HVbw?=
 =?us-ascii?Q?0qQmZDQWapMhQMIUHXL6OcQmSQQNILZ9kIUMN1EImn0WfQXOSiVn47L0qzMJ?=
 =?us-ascii?Q?BaXPx/8GVMT7vIVxOEa9sZB8AEa5VprZwgofsHuWNEwRcOjnlTsIeSwDdjlG?=
 =?us-ascii?Q?uuAgL8mOwWyVO6VN2a3nazsdCowDBpvio73Rt1jGyanApeaN0yZ/Jbtey3fD?=
 =?us-ascii?Q?Js8z/TtV7tAdkwtdegRLs8pX/dD+SNL2ZFp6mEk/wBhBZByCe0N8T3WdEuCM?=
 =?us-ascii?Q?0neqtreuXGQ9I1iR9FSM4osOup8Q7R6tC3J3poB10LQVv4TDOBAWwKzOe5Yn?=
 =?us-ascii?Q?BLskIVb2RdS5+X2+TZsi3eqWwhQxFnnGOIVKd5qNhD42Wrq4KTpc4KEYcvMR?=
 =?us-ascii?Q?AfL8W7rfxAjbsJkE6bPHsOej46tcfNSoCHcWSyd+MNlwu7u8Uy+kNef1KvM4?=
 =?us-ascii?Q?gZrvNn+YHNLWBoh4QY7eLFx7yRRACOSImAFJJtHdn1yLQOrVlQBRGDOOicVR?=
 =?us-ascii?Q?wPUIHJqPNSz32z2IJgewO2B8BKsP11tH3+Y2HTytdqcRKIOobb4XXs/50teG?=
 =?us-ascii?Q?HZ47t7xTvupd/+Crf5e4GYDrDKNaeg/udWnFjXyZd6v58+cxXNf1H5vvIjV9?=
 =?us-ascii?Q?4K2RdqdnmeWYYaHllKfQyXy6SVdOxg3FVaY+A3CBWBz9ruCKoauFqKNjo+vK?=
 =?us-ascii?Q?F3hQrzvHD3kboXkYTFbG3NnbTTWDALnTg9SgSssgE4El8vgOJwgBtg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?CxfDs7Ai9cw+DsbIUmGPe7tCvqSa8UOfsr21F75OSrQyZ6ILFQJLGix3r8UF?=
 =?us-ascii?Q?lBS0Cau4Yl1IHQeHyZU4qRC5OPZZUjrKzKpMJhxlIqqTLEV6+WZW9abSBnX5?=
 =?us-ascii?Q?IZhA19xRL/GppGllIEt8f73Mmdr+pTie/Cc0p+A7O2n4mAko77lMxKBpooyH?=
 =?us-ascii?Q?J9qK4iuwSn1Jl6k0VYp5o/5cMiff/lJpbytUCf+yXn+G2VlX8rAj8eoZRCO0?=
 =?us-ascii?Q?3ABE4uOYC6ScY0+Qx7KolcuGtO1rAmlIOzsJwXuwZgj8RjEl3YBPqVQm4pKA?=
 =?us-ascii?Q?rIhCDLKwMBfVV+nZ1xfI1Nn19u+9jb3VKweg4XRhqCJfti7MzYhRqxOH97aA?=
 =?us-ascii?Q?fyg5BFT5O9/0fWXHXsFr0mLqMsmFrYoq68ZkrGg0weSuPxx1au+DYZ+Bf2TQ?=
 =?us-ascii?Q?VHkhOmHnF7BQs9/sRCLCrCz7NlTzp2EAVfNnp1j+F9fFTt2r1wpv03Qz+k4j?=
 =?us-ascii?Q?c258zNcGksWX4AnNONUygetc1g65ocgMoo250UTc5hLCVeVs9XEVGx8Q0jBl?=
 =?us-ascii?Q?GCAaPnChXujKDpYYJ+UjBw2bMQkKdbAaiWSdgz/TNBvnr9us9GxaU4Qxd2O/?=
 =?us-ascii?Q?W0EfdAkeM/zCfdrahcTqUYqjqmRDAtWwCS/I6I6HuEW7HS7qwNE29y8w9LyR?=
 =?us-ascii?Q?XeAZW+DulsNo72adAAyUSC81Z1hHTJD7fYzUR9Lltwtsj6hkXXhuZJNM4gyE?=
 =?us-ascii?Q?zCGfPbQV3CClf2rDVraSsPTEYcRvK59mapDvR80FcNQAIEJXwPP8j74fqfXs?=
 =?us-ascii?Q?SRpL4xQNAd9EXFylmF4jKsG8dMgnVD4XwuUEeHRJHQlUVzqYFHzZ6PmH9WyQ?=
 =?us-ascii?Q?N5wXttZpERGiCdEZ1y9hg2H7V/E9RHpiYSm/r2UP/meiiGJS5/bpsSVy4leK?=
 =?us-ascii?Q?NKx8iccselNyUZAsnbge3DcZ1e/Y6zW77/YErGhyuFeHczqOJRCJ+WDF8tDK?=
 =?us-ascii?Q?mJO7m97opJ1vX6VDytyienGtNPYUGS+WeYknmxytGSNbE4b3yky4gcOabteU?=
 =?us-ascii?Q?oUSaGJUwOu4BveAK+/xHBQZz/vsW0HOGVvF1WcASk4wdMTyzxPr1n+tSI9j3?=
 =?us-ascii?Q?SgS2mJx3ocYOJUjLYRB+gufQLhWipFMbOF2hyB/G2TS4AlVOhTyqFFw+EY9i?=
 =?us-ascii?Q?G1Y9/wMK0kSYQUNdEtA1TNjXIxEzKDyw56yeqLx8s8LuScBvLgZLTn2Ve+Dl?=
 =?us-ascii?Q?fVaa8RJ4uBGe8b5ujs8KmYPpcAEbHja5LqbIHr8GyDLHlElafZBwof8ZlgJP?=
 =?us-ascii?Q?sji4mcGDZUVWwTZ9s5wCCUljAF83Pj4Tc0/7sNxcsewcZW1sePNyRupT44gO?=
 =?us-ascii?Q?HO51emQnSAzbUVLtbucliEVL8WmcaqKnNWxZsmQyktu90FTTUVExW/Px9Okc?=
 =?us-ascii?Q?ObNPHYTrxKLYkkCvrr5l7erNbFBgBLpk8Zkw7ibcsSGT1p1roWrBvXea0DyE?=
 =?us-ascii?Q?hx8NaUwx+3lrgp49VDCYlXN3+bdTfXdaRYanh0Hz2u+5Qye0Nq6Ayp2j9jjk?=
 =?us-ascii?Q?AeZhzyNBniYGNZq6WdfanYMLjYpj22QZ9UONY5G0AsUAMYMFObsOTl3hs/lN?=
 =?us-ascii?Q?Na0WOIEHsh9cNeSuZEWEqTye6RR00SyeENpOjlRO73XKwMp+eVFn8x6DbN7o?=
 =?us-ascii?Q?NfqiFo/ABnSPVnSumscu+OU=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 62770072-2f9f-4001-2779-08dd936b4e02
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2025 04:45:23.7425
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +ww0SCF47ua4ug7NTiH63+Ckudh1vvPxml+tzNs7/O3Tksl8v5SjuS1S3YwvSg5oXQL8FPHZALFpQWOjp6xLKLSVql/15X6BUhfYxJl4YDh81vOjN7y4RqXAoIFSbH1Y
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB5770


Hi Greg / UIO / DT

I would like to ask about UIO vs DT.

If my understanding was correct, current UIO can use 1 IRQ / 1 reg per 1 UIO,
but some device needs multi-IRQ/reg. In such case, we need to use
multi-UIO. But it is not good much to DT rule. For example in case of
the device which needs "2 regs 3 irqs". it will be

(A)	[1 reg, 1 IRQ] UIO
(B)	[1 reg, 1 IRQ] UIO
(C)	[0 reg, 1 IRQ] UIO

and (C) will be DT error. Is this known issue ? Do we have better solution ?

Thank you for your help !!

Best regards
---
Kuninori Morimoto
