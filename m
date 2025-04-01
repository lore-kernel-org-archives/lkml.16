Received: from EUR03-DBA-obe.outbound.protection.outlook.com (mail-dbaeur03on2083.outbound.protection.outlook.com [40.107.104.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5909A1EBA14
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 12:35:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.104.83
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743510927; cv=fail; b=johWd85bVupi23S6NwK3+qEfMa0UL12Bx5StmpXeJJ6DKquV3h/M0qSX9/mSVX9Y99zfGnjleXgZlaeVuLqZkbtr9cJgFBE+NU7MLzxKPzEhKP3Nioy1aKsZjp/SMYcBEcGFAfi5liXuSQb5bpn2q02Cx+Epcrn0lxtR3h9daJY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743510927; c=relaxed/simple;
	bh=DVdtACwLhSAFoJ+VlgDRBX5y73W+gwqUbPO+Go7KAEw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 Content-Type:MIME-Version; b=kIaQqAmO8hhHK2YJfR6YN62HNMRgsE+39Zfc1p+gKFNHxKYTS8O9rZB6ZVtYeNTy7zQlZd6aMZg+XdaoSpoYPY+oMR5xedvxxGnJK5QOrgTM/uA0B86BLlxMBVP/Tcfb8ka/jYwa/goAEiMvBjeiUS5iqzeNJ/DToTg9u9qSCDI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=prevas.dk; spf=pass smtp.mailfrom=prevas.dk; dkim=pass (1024-bit key) header.d=prevas.dk header.i=@prevas.dk header.b=DxxMVlKk; arc=fail smtp.client-ip=40.107.104.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=prevas.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=prevas.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=prevas.dk header.i=@prevas.dk header.b="DxxMVlKk"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kKNWUzPGsCaHKUC9BVNMD+7y75IlrVcDdXFrq+dKeqD+zdsCkxkMkRe1jeZWkC+81v9idwxLXJ7chE4iQ5QGeZ0bz+IdZE4u6ziYaISDDBotAJqWfGFRAWOTXlpg0OeRUGUo3wBBEdNyZ8E0u0BJAwXmZgcNBqJdpJ3+DtPlkWOYbwTd34vzF6cHM9z3t5Yn6mQ6fGiQkfjMlYwEkq2l3J3t0iIpgUOzVWnezdCdJBJSsg0lKFgicx9LC1lGE4dgQA4pLTG154p/o6tVucECAUBFDcnNco8ssCkZQ1AxQ1a0ncD3kmUiQNxIEWQUrNoRf8I9UCCT4Z0nM1ljY5OpOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3Y+/E3M2RBFa33YQGqbIcwDK7cZ/yNOmO+6dFtms8p4=;
 b=JJkdovJhreNYDvuV8Kp1KE0KaV9gTS0BpPHFuIuS1YIOjDrOPq0AIDf5DKR3m43Sx+xXNnCzAJkP3tNgN9xqT6W8CBk70VqKGpGCFTKRQbEOMr+okt2EGpuUY6aLDMYQNaEJU0rgsUF/oAWxkqMvGNv5H0gV90Q3U0anG/zKOvM58MUZxAVvopC/lyEuXgz3ETGonhXNwQgRXXHdiIjovmWZ4YytgMvug/xDXHl4wn3eMUM58SG4vflr+QdvdqospC0k/b17KOTPlI0fFm7j9FTAISSfFqg1TlXfVMJQPHcuS3TpelH4Zk4N6+YaKWcTy9wI06wrR1Ia6HmUmOJBzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=prevas.dk; dmarc=pass action=none header.from=prevas.dk;
 dkim=pass header.d=prevas.dk; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prevas.dk;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3Y+/E3M2RBFa33YQGqbIcwDK7cZ/yNOmO+6dFtms8p4=;
 b=DxxMVlKkVbvcZG8+AwU+H4jpEjhCPpOCtXrvOSDYrwIJNc3cP8GjzuoUd84xfiCoMI+ur6rZomPf5lrKI14g6EDve08Tq3HCheJczMR40lbP0WRK84gMTZHvogYvwKFGq373cotFOYaoy/os5i5plLixHPN5pVBD4NXOPBzhb6k=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=prevas.dk;
Received: from AS5PR10MB8243.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:681::18)
 by DB8PR10MB3942.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:16f::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8583.39; Tue, 1 Apr
 2025 12:35:19 +0000
Received: from AS5PR10MB8243.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::c2c9:6363:c7c2:fad5]) by AS5PR10MB8243.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::c2c9:6363:c7c2:fad5%3]) with mapi id 15.20.8583.038; Tue, 1 Apr 2025
 12:35:19 +0000
From: Rasmus Villemoes <ravi@prevas.dk>
To: Ingo Molnar <mingo@kernel.org>
Cc: linux-kernel@vger.kernel.org,  Linus Torvalds
 <torvalds@linux-foundation.org>,  Peter Zijlstra <peterz@infradead.org>
Subject: Re: [PATCH 0/5] Improve WARN_ON_ONCE() output by adding the
 condition string
In-Reply-To: <20250326084751.2260634-1-mingo@kernel.org> (Ingo Molnar's
	message of "Wed, 26 Mar 2025 09:47:45 +0100")
References: <20250326084751.2260634-1-mingo@kernel.org>
Date: Tue, 01 Apr 2025 14:35:17 +0200
Message-ID: <87tt78cb5m.fsf@prevas.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
Content-Type: text/plain
X-ClientProxiedBy: MM0P280CA0063.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:190:8::27) To AS5PR10MB8243.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:681::18)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS5PR10MB8243:EE_|DB8PR10MB3942:EE_
X-MS-Office365-Filtering-Correlation-Id: 2f62dd8d-47b1-40dc-d695-08dd7119a9b7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|52116014|1800799024|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?5RAXJwUZr5KzSZITTzuSRnskBG+lv7Z1Z0xhoqPqXey/8UbNl/Esrqbuflgc?=
 =?us-ascii?Q?OKIpWYh8MwJrLRrTFFsXORI8DzGaP4osfuNrVHmO9QkUer7HAw8Pm3HVQDVE?=
 =?us-ascii?Q?vc74sanm28Z9rHm1LzU6fo+Edvl/s7BXHfXuxPPmKNYh5sJiLcEuDCAQs7EE?=
 =?us-ascii?Q?kCMYfuACfZ1Du7X5Lpa0rcqKcXkWW+NA5F+vwaLa3Eb1dSTc5capXkDpVUX/?=
 =?us-ascii?Q?Uqz8JnNdIxOucGf9X2T5Aq8lbjm7U6PfPgmrhPvFIiGz5Q/6czgitt7CM6NY?=
 =?us-ascii?Q?RJHc1mpV7pJu1eI7v8Nlv+hJgiRJ6oDc50gwKT7MqPZ/lPbNzgL2vQLygLMq?=
 =?us-ascii?Q?sAyiD4sCcWVw/xu4Eh4jv3Q8WUdfHXaocU+wFuVgIgVILQcsLLyHbtGu0R8B?=
 =?us-ascii?Q?qEqtiZGdPtK8hrPbq6cjazAbTpOWpHiSYfPdEt7NxEL1BxouncVQ20QT9myJ?=
 =?us-ascii?Q?Q2BT7gKx6cHdl0D4CLhr9rQ9LVs0ZF//1V3wO+Z3atMHpE1NPo7S8ZMHQnRp?=
 =?us-ascii?Q?/Cg0gs70BdZOno4Iy2wM4hxD7oOVfc6oQI4N+ES4BJI9w2lXcLhZ5yPhB//c?=
 =?us-ascii?Q?AY5pES0cpcQjfpS3A6fyhy83CNhpghxyEcSNtO+hSqfryojO4UearIUrT5Wz?=
 =?us-ascii?Q?NK0y/OJnaHbKf47fUcttvFim27PEavL0YqiR2JEMoZfZgnkXDspYRyXZILfw?=
 =?us-ascii?Q?JFzWdttz1URgOBaCPuhGXEzCswoVe1hM35SCCPmJgHxXxHcNbKPLC1hvJoK4?=
 =?us-ascii?Q?qKoS+wqcY4meN66UO737/LKLoEzX7yRJK6bIfmw+bt1+Z+jYZB/irp9W6vwv?=
 =?us-ascii?Q?Bge2+GFqtnabRlDbszoeQ5Z/2WgNQxwu7O88C3C8fO/+dW1aNJpAbqn5tJXW?=
 =?us-ascii?Q?j5Tfzdfce8VT9XYZqotz9Y2ZhKL5xWzpa7yddcfmupmvWghLxIdN1ZGXsWCk?=
 =?us-ascii?Q?YWTTiADAS+jFkJAFb+Hr1T3/ir5X9OwqVzemgsKNZrM6+7ioSO44O1VX7fb3?=
 =?us-ascii?Q?dEBp9S12uV2ucMri8hsDMcvjU8fKxx6G1J+f5V29/oqnpHWvy3ds79p8V6Ex?=
 =?us-ascii?Q?fR+vDp1zVhJfmpNEEjSanT35zffi0eCWIJJwElxAA4THAjKr74Onq+hKLrUc?=
 =?us-ascii?Q?Zd6PDYh+e4Gw3xvjfNPtymPH8yY+f0mf5uOlEkq9ZON6ZTGz04wGGYPciL5f?=
 =?us-ascii?Q?FJ3WxW5Wuc54M6EiEz3AgND4onsOrP2/dwna26VLIO6WOqQ4lRGZJAyY5V7x?=
 =?us-ascii?Q?YCfxCj1cB9JS/KTgT0+XB/nZ1dneAFkRpJ2BY4jV+WhxEQtP5AZSQNkTKB9g?=
 =?us-ascii?Q?ofnIh5c5hoK4chpqEv2Fo6uvYjilMxViTi+IjXHtdDhg1XIWA7UhoBhMnTwh?=
 =?us-ascii?Q?s5ndHAWsBaD09huJ1ot1phyVzftM9bXTzOYi3W+Fhy4whlfVpjgwIPdn+5UP?=
 =?us-ascii?Q?0rbDi11qfeEwHWilJozpKdMpYPTW+n1F?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS5PR10MB8243.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(1800799024)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?tQnw7sI/DNC+LtrOvbgLAAZDQB2nWgY8Ho3EGpPkkmG4t3NAIkmMcrtoT3m4?=
 =?us-ascii?Q?cUNw9TszL8ccWeoNiqQtzPYCWt1KdZLRgjDEP0L/V10Vi0RvtLwecm8dfLIz?=
 =?us-ascii?Q?3ZA7KFgAeUYaLUAqKSAsinBz4onoAc5ZPPrlInbHwcxndtyruqnzCUWZFcYm?=
 =?us-ascii?Q?JbX6ogAYkY58y+8slQX3odLnwSSsaEy10ipPMefKAkDziNsiFnlfQuGRhtla?=
 =?us-ascii?Q?ekzfZnEesbtFVE18g9QeNtEjCuOuGZWueTyguw31rejNqmW3ii7okWHpn2aF?=
 =?us-ascii?Q?GA2DaWoXBTt514LkhDKWeKGfJM6w4plCVYHCllMZQid3fGRH04Jkl2au6mPM?=
 =?us-ascii?Q?AulN7VU+Lt6+81p4arVaxBEFGQWLnIE8hnqJvzhOcu0vQllzdkZc0SckR66K?=
 =?us-ascii?Q?F4VSHq/AZGpy4NdwmVkcp09jNE2xtgqi/vFiAQYjvJKQ1qugghyrD9MfwzkU?=
 =?us-ascii?Q?imMu/BUKR49b+d4kKYJNKtUWJ9tSv7qdwNqAH+ngfO8NB2SyjWESYnw0ZTVq?=
 =?us-ascii?Q?99SgwxnJtrpBAU2fDnAcZlkLy8h+zhuQf+xJlb7PaMt8vmbjjwpE/7Bnk39x?=
 =?us-ascii?Q?4vMrwThIX+QMFtbW97giRy5A8r7n6cMmP5dgRxBT+N5QlJIcGu7SYEnVt754?=
 =?us-ascii?Q?8iuBVBRddwt53KRU7PzFsDg+nQVEG7/v2BZVgUCdgfyrS32EyRAFENjCNaXb?=
 =?us-ascii?Q?5uWXYMA3BhDK2tovtJq/9CMyYn4fe1cmG25uZJfmmOtH05U0PGS3IzmgRgo7?=
 =?us-ascii?Q?TGiRoSOoKoNJGZ1OyPDtz1WZDc7FZPYmN0hR8gI6fNacgVIiC+VYBRNOwZX6?=
 =?us-ascii?Q?UTTj7hBxO088Ewy4eBNC4m7Ljs2+DkRX6n9ZArcJKMvZb6QJDjbkbUC7cnkP?=
 =?us-ascii?Q?hGomR3aJv/Zqi0Xm7k/v3gmOucwUZx70NMPSAoGZ/vytQqMQYyVQidse9zc2?=
 =?us-ascii?Q?b1uuhkJdXvnjZhQKzMVclnw4pL8LehOT4tuHVmfczO/F7p3dVl0tB8Qcayix?=
 =?us-ascii?Q?3UPGbutZaQf0pYFFXLAq68fQQhue7Fd96eWh1tTX1vhWy7tM57xSpC8OWbwg?=
 =?us-ascii?Q?WB0zAhujCWi3A8mLBq9Y1CiGGymq8i84ONr2klIEcj39KxOQuw0tGuDugXWE?=
 =?us-ascii?Q?fLOPQDaE16YvZjdkznwDlfZdVj5nzLmJs6PYdjZ1eZSZb1L+tqgbk8VTGxy7?=
 =?us-ascii?Q?+SFQPk9foBqcuU4FiieTTxS61Jl41JrJaKMG5+26iZJdQ/2tJ6WUagNq36md?=
 =?us-ascii?Q?TND3V/Gg57nIBoqMdCrbzwt/cWv+vBxnEKxOo3OBWWmasckhSS5fedqYR+Vs?=
 =?us-ascii?Q?5F4U3vfyRz39VoHCVj6yz1QNcgop7LU61/nmUFqWCj4ZjfprH0VhZiRjvaZR?=
 =?us-ascii?Q?SJAIEgGJzaYLWhTmyW4v+XLBNUVz3J/nD+zvpaBfYPRRSV10rlIxl3VeUSt5?=
 =?us-ascii?Q?hZdJoiKn9nXMnsrAnJvAuEA/WjR5fa5Ss6Tfy9d3/tS1sZn1zp1jNUiK1xa1?=
 =?us-ascii?Q?6aokjSdhivLQEo1NKjj4uq//Rd449hQMiTVFHlNN7wrp52MZ1QLTXslg75Ea?=
 =?us-ascii?Q?edkdapiFxLoVQQO6O8PWBdBgH7xNDW89Bq/XdM7JbEjDC2daA/ahXjXMgGyE?=
 =?us-ascii?Q?gA=3D=3D?=
X-OriginatorOrg: prevas.dk
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f62dd8d-47b1-40dc-d695-08dd7119a9b7
X-MS-Exchange-CrossTenant-AuthSource: AS5PR10MB8243.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2025 12:35:19.5662
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d350cf71-778d-4780-88f5-071a4cb1ed61
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZqCWj4GZ4DTfDfAcAjVK0XQfzkV5RW5DemPqIepBhH+7tl0r++C8BGEAHkh7FCf+iPtXQKrKIpSFORooJoFTvRP9DKUToysXaqlut41V9z4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR10MB3942

On Wed, Mar 26 2025, Ingo Molnar <mingo@kernel.org> wrote:

> The cost is about +100K more .data on a defconfig kernel, and no runtime
> code generation impact:
>
>        text       data        bss         dec        hex    filename
>    29523998    7926322    1389904    38840224    250a7a0    vmlinux.x86.defconfig.before
>    29523998    8024626    1389904    38938528    25227a0    vmlinue.x86.defconfig.after
>

That's quite a lot. I don't suppose the condition strings themselves are
responsible for most of that; how much is due to the __FILE__ strings
now no longer being deduplicated/shared between WARN instances in same
file? How much harder would it be to add a new cond_str member to
bug_entry, and how would the numbers look then?

Rasmus
