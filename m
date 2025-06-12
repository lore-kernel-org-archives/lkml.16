Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010064.outbound.protection.outlook.com [52.101.84.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 774B41E487;
	Thu, 12 Jun 2025 02:37:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749695841; cv=fail; b=ibn8r3S7mTnooW/P+l9Wdw1ql2yhqpatYUswaUgkfeMijsn8dKCj2oKvX/s11+YmBAP8xAcubtM12mHvwZ8sKnUpltJmwauq69B3Biy8fMJfGneYEfWARhDnZm1Vza0zut2jIYDtnSfGOLcJyTm0cnhgmpvYaVEjs0CfBF80rS4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749695841; c=relaxed/simple;
	bh=zHdQ4Q3PVnjG99BeqS/kXkRRJc+GLWKKNku5VbBTcD4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=hWTunmlyBX1K66PkUz+Xjpv0ncgfUlbo5fsC62q+0BIp24i6PdevXcUeuISmZ1jP3inGYUyomXlmgO10NIm2eE1lo9u0rxJMY9KO/5z08HgUvmuRylmNYrbzvWCYcwA746+VzO8if+1phroyHrsulLNuEfXXKRNHancN+XnLj40=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=i2sB6GDK; arc=fail smtp.client-ip=52.101.84.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="i2sB6GDK"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n0guXTeUfKeTN/D5hWJM22sJIclLiKpHRUWiqUbldwBsZwQonhFakUMz5ywX9koR0uK+O93Ha01dm+i4hmoMTgY8nQ53RCPXboFD6m7pGCPi1k04M3NunoKs5lreAizVlRBF7DUnlR4gd/LkHJehVHQY2aN0lKYF2QhI6qXWVyf8AafIG/hTXj+VoL+tRlaeQ4Sq74r/O9aXlbJ5rtytsU7sT49tbTFmu4kpKix7oZkou2F2Hs8FduW5MNX1tVvkP99g+JNxzkH3afng1Eu11yj94tXWcg7A34LN2046j6S4hvcJPrktEqVL5M2eGlcIs7pKT9ZdtcEcOwtS/+rdwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=okndc97KXOd344oWbmTR6lCVvxtFiCiytaVvpoGwaHY=;
 b=GiS/gRaAuYHe9AABzUOt6VmvEik5+ihRGrBNFVrA4L5UkzQJdFmSTHTUdOXlER1BL7yIg0jOxItfXV40A1R0npbJ/E2JZQC5XsTrvnED/9FvBXrFMSdiglm1xenwyMGV8iirg0a1EObVKzMy6siWh+tEIhENUbFvV1bsRRsYjKvEzM2+Sm2OuE7LeEtkGBx1pHVkC0QSb0PEI5ItzwGulbzv9wM16kAr3Fz5Nx1d3zEkOwpWozjBsd/egyFUQ641gMWSuBJ0c6x17P0rvC3hQq+wH7ZQNqWYw1//mZyjUXh1rrQKuNmXHYZv+0tmZXl4qxtJHtO8DrQh1rR8dBUQ4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=okndc97KXOd344oWbmTR6lCVvxtFiCiytaVvpoGwaHY=;
 b=i2sB6GDKoP36OI3djtqVhz1Fj7D0EH0meZdMcKW4bTGiV3nm1EwudOa8x9uzz34mSkKWaP66hazwDt/W47960w5jZZ7kbF3Ns1C5so71fsF9p/avFJgkFwDZ7X/2aNjhDM8HyoeAgjHSMH5l8fEu33uuvN6xhDyrocqBmE4d9PMoGwwtP9PPx4lVVk+VmOLl17wPAYW/K9NEo5o9Pqlc1vOUb3NgsFddkwGoe0pwO3oJtJCe4EmDu07TOg09+6SRrdAki1xVwLieqtCz4vhbDWFGB64MtOWyByOc9QgF3EawJ8Ohnewi6bLJL298z6/ZwQaqF1vf5rRpVlF/LeDAPA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by GVXPR04MB10732.eurprd04.prod.outlook.com (2603:10a6:150:215::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.22; Thu, 12 Jun
 2025 02:37:14 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%3]) with mapi id 15.20.8813.024; Thu, 12 Jun 2025
 02:37:14 +0000
Date: Thu, 12 Jun 2025 11:47:23 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Peng Fan <peng.fan@nxp.com>,
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: scmi: Fix children encountered before parents case
Message-ID: <20250612034723.GB7552@nxa18884-linux>
References: <20250604-clk-scmi-children-parent-fix-v1-1-be206954d866@pengutronix.de>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250604-clk-scmi-children-parent-fix-v1-1-be206954d866@pengutronix.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: SI2PR06CA0002.apcprd06.prod.outlook.com
 (2603:1096:4:186::10) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|GVXPR04MB10732:EE_
X-MS-Office365-Filtering-Correlation-Id: 9df62419-f013-4e10-5640-08dda95a0a20
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?WaCIzsLmALOSgQrNpjYggWNMLmr0b9k1WrWOtHjOJFBT+CLAkVGlOVALIC1a?=
 =?us-ascii?Q?xXSYZZBnTLWrFRYgroONvsXux/MK3JXTA+XMY3gW4QbshHdEUKYosxSpaimj?=
 =?us-ascii?Q?x3rC42zOscYFiUugc3Rz76ET5m5jnBTnurTpCgMRhlOeBKzgXYd3mi8IbK2G?=
 =?us-ascii?Q?Jy+Km1nYisFqM80P7dmK5LaDYdQlIU8SAngunYM118Gan0Ua2tAIWrNIvUQt?=
 =?us-ascii?Q?1z1cKLbxdwValo7BGrpULdj1+I2q+qY3gn/PKvJtkQk+iOyO0ZPLb72LoanR?=
 =?us-ascii?Q?lZJXPUTa/GL5ZELJW3jX3z+uududToy/xuq5F7xURjJ/Pnyfs6+ok7wleGVa?=
 =?us-ascii?Q?SKBTP4KuzlolZEJneIxDDqcMJdtk/gnqUQh7+PvzpxvVnLs6OHcdlr59Q4Vs?=
 =?us-ascii?Q?9hkq1v8hW46yDWjyn3ZgvZVygJkP0VRQfQA8rfkeJhspoLqwbsarkFFqbNEx?=
 =?us-ascii?Q?7bGc8U2B6+QILZlNfvzYWeTNy1hCsi4vJ5AyuAnTigjOCbbN4mnizrg8Xle7?=
 =?us-ascii?Q?dEYTfjnAp7Qn+gHDiLNBeMuWdop0OozxAYMpM+o4QulxkbV4tf9ZRF1fPKx2?=
 =?us-ascii?Q?Sr06E8likaSTmAZm/ppobMxM95GWFFou+zt6WDKM9cc3P+uBqLvATQP5Ss0q?=
 =?us-ascii?Q?p1abfAZkhRWrh5gO56RJQl8sEMEF7wd8Spg1GOcT7x7OrOLneEQHaNcwnzRU?=
 =?us-ascii?Q?6oQPljwEqUOVdNYhevTBMGDcyL4Vx7Rt/iVA/zbakiGX3q/697R1Lk5v2ij2?=
 =?us-ascii?Q?MMR8pRZy3s0yEor/D1ghFX0Am36slUFZ0cgezwkpPzjMPp+T2m5dkhmkBSeU?=
 =?us-ascii?Q?HDlk2UEughkygbTboxDUa+qMsLSa7CiZzKgUzMuAmfObmq05+OlJhbU60oln?=
 =?us-ascii?Q?Xo5JBSXZ5uvICskGrfF/r9PoPae5jECDOfxNsQX6oRvwfd5dn73pI6AeI1Wv?=
 =?us-ascii?Q?4n3UfBcdCYJVtgrtm/UytL2IylaaUaW7NbpFVoms62XoBdwh4MBDETHoB9p2?=
 =?us-ascii?Q?8VCjKmBSVK16LAJoQme6pbVk7N7F40Io7NoWEvLrLppl+vFKcqFlla0WA4RS?=
 =?us-ascii?Q?SFv+JSpFCJ7hi9iVY6hIAiF2s4k+f5Lzt0MIkHZjM9Oq6sho4lLh2Z7rc73U?=
 =?us-ascii?Q?YCpP76rUMbev6hyEABSizffOzFWv9XH2n0eQ50GxuzHH6jkrLIRPt4NJ+r5V?=
 =?us-ascii?Q?FPVjo4KtPLXUxqMPOQeN1XspCvrULzgU4urGeMu/p4fubcllk8cI/dRVn8JC?=
 =?us-ascii?Q?ZgrIiqgyiLCNWrOl1EZjWiYNdyGoXpqHm6JjoHcZkoNsqH3p+KwT3mG+eLYV?=
 =?us-ascii?Q?pyawQWdLftbPtq8oyxc0ZyDrzZ5f9xLBX4uRtJA75u6YuEZcoU6BC3/CMcp0?=
 =?us-ascii?Q?buoMMX+rV2/J9hNhB1gbWzOPZMiVjz0ky8eTo5oTqKTqsq3hoCf4HYlBG9Qj?=
 =?us-ascii?Q?FP+kG1Y7ju6fQpi+VsPeBWcaBME8pnq25bAO2bUBsfxFCMiKQTeX+w=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?fcB7/PAjCQYld+XECE34CS+8k+23wQbLraH6CkBZElFNs2tfjvcJcTSUy3Yq?=
 =?us-ascii?Q?F7oN/H42f88wylIVizlYCPcfrsdhEL8q0aYC8+z3B9Q1m7PrXuaYnaI5rvnH?=
 =?us-ascii?Q?EYNlIYuCESDiidqZJFztI0WRPV9z3DeAcEO9d6WYDVMKvj9iXbL2KTkqlFyS?=
 =?us-ascii?Q?4wU5uI7yPb+d9Inh32eredbFmqJA3mcs2ueNWvxIk7B6KMgv/vKX2VcPyPyO?=
 =?us-ascii?Q?Fc7GHbMvbKV8NWlDGyp7pNW3D53Eaq5SHYpLdE3E5TlXQb20t04812PLkrxT?=
 =?us-ascii?Q?E+zHV9gJSKJdv8eFci9GcOXQrpl9ZfqknbidtDFf7OOX0AyW+RPDIgpYrcVc?=
 =?us-ascii?Q?qw6mh0qXN1ULpacWcIJ5Bfv8QhLhsMV+QVrPRhWnuoTG4vvs5CEcBBhjQjWw?=
 =?us-ascii?Q?PcQKR1NJm+9Q/fks0jINmNQyW11g2p72zHj5VW0G8/xmDjPGpnsXGLb5AGR1?=
 =?us-ascii?Q?83iiP1xa0RWJaGuuauP7J+7LHBOOK9RmYaO6iEVGYHjxHvQruGHYB/Dq6Lg9?=
 =?us-ascii?Q?ICojf+WRs05X7KGIW1CPnwAnt/yTkCtodmiccZGjUfgXD75WwR4b0KN0ktJK?=
 =?us-ascii?Q?hj7PaOZtIXG61m10EQS+Yx2myc/5OHcad2viGc0DWcSUlLccGxohi0h9d/AI?=
 =?us-ascii?Q?OQSEE84w8wtquLvyHbKEM7d5YPjOF09Vd7rHe5YvM5woZuWVfrAmAXHOPlsr?=
 =?us-ascii?Q?SzdXPGE4Uibutwi99HSLdVb7/EltvT+Re5o3FnXyywCfN4T51qEMpy04yN4a?=
 =?us-ascii?Q?uacciTjxXzAnz/013L8OgRccyPe9Tl0t4wpuAjGEA8u81ZlrsFf2ZXwvhqev?=
 =?us-ascii?Q?AP1d4uYI7CTUedoNpd4uBgUZDwxQ0j4PoP1dl7DXBTJ5hYKcI8Oa1Z6I71co?=
 =?us-ascii?Q?YvC/Xh8JXi69MVNkk0SAFPae+ENakqeIZLqJBalqaomnsM7/290QbmJIKnAT?=
 =?us-ascii?Q?fSJYLMHLQW9eITo+bslnf1W//VhGNb3ZYK2rbsJFTwNHXBIhea/zRJYbFe8o?=
 =?us-ascii?Q?vhDzbK72jKAjuxr3y7GhVzIcTRKHboWJE36tWcNa40/w1Xv2AtBpqlzhEXm2?=
 =?us-ascii?Q?KnM0a6zT0tEFi6KtTintWLtsqW5HaJMcfSrBfcGgP/u6WTYC7O8HzBOcDd0B?=
 =?us-ascii?Q?L83XgTDG3RzALZ6V47cwGrzyJ12oirt/R1TFF+Y3YJ4vcg8xdSnqV7/LNQxQ?=
 =?us-ascii?Q?hVHqgmXUb1MMNlOUKQRXfKVJTVIPbzxkP6OSrDAOFWaLlTzTltu0M9ZJBlFC?=
 =?us-ascii?Q?0fWFw8MOAyg2ki3D8H3Z4tSfuF3M7HnzjGPGUv6YGBDZpNeI22fzVOi5ILyO?=
 =?us-ascii?Q?RgWdwMypoItZAqUUCqe88z0ETvAq0IrtrBxRHcyBp7PdsOj41C/YrxklEusw?=
 =?us-ascii?Q?/1AJ6E7DMqdYyBtRXIRquz/JGLPuU1tHik5L/SoIiSeBoAuTMd9Zi20M5mor?=
 =?us-ascii?Q?5oS5VXo2kCtMvFalaZJiczBf3Qd/IkSI9UF1SC4Q7JxvLM4gXR9rqPljxIRA?=
 =?us-ascii?Q?HvSMISigxRoKV1iPwZP8V1BULc+0Ys/yag4QZ/SI58nGQ9QVvE6BI43wMrZg?=
 =?us-ascii?Q?T/gYNUl9ouAGxh/cksqv/O1eD/LR7uls6ETq1qRY?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9df62419-f013-4e10-5640-08dda95a0a20
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2025 02:37:14.0494
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: udeeuJ9HEnxSqIlb78EX54+yJJvD9VZpQhOCXH4QqYqTx+U1TrXfPA7WC0SMaQIeOaJTd6onovhEggWLzLImzw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10732

On Wed, Jun 04, 2025 at 01:00:30PM +0200, Sascha Hauer wrote:
>When it comes to clocks with parents the SCMI clk driver assumes that
>parents are always initialized before their children which might not
>always be the case.
>
>During initialization of the parent_data array we have:
>
>	sclk->parent_data[i].hw = hws[sclk->info->parents[i]];
>
>hws[sclk->info->parents[i]] will not yet be initialized when children
>are encountered before their possible parents. Solve this by allocating
>all struct scmi_clk as an array first and populating all hws[] upfront.
>
>Fixes: 65a8a3dd3b95f ("clk: scmi: Add support for clock {set,get}_parent")
>Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>

Thanks for the fix. To i.MX, the index of child clk is always after
parent clk per current SM design. Not sure you met real issue, anyway
this patch itself is correct.

Reviewed-by: <peng.fan@nxp.com>
