Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11021118.outbound.protection.outlook.com [52.101.70.118])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C49E7283CBF
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 09:37:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.118
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750412279; cv=fail; b=d2iDocFTjRDXUsda/LlclJCG0lounk9ssc3n873+gXLkL1oJtePJ0fmAjw7bBNfOcA8fmtAOvBglVnGwR2xlf8AVvnAypiCRzOiqiN9uwl6MPwPV2gQKMr1/+2yelQqf4xwSvmkbR/cE6C+AiBRCWE6W7Rgvea8Vf1ZqPZ1Lgss=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750412279; c=relaxed/simple;
	bh=xH22sH0AgGuX5+SOl5qPxNTfhKAAtJIdlxTWNSQFzRM=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=DQ+Viqty5OlP46n/u3jq1YjxWJ+9/0M7G9YM7VlAoYKKlrX7plxjZRk9XVUALyUqEv+0YA2Jfspfg53AYGZ+v60YlGnWtVERt2JVqx/DSbhBoJ2lE0dTIZSPK9iDLH5jS4dl4yUdQ989pN2UMGx9oGddwfOIcXT6ncW6Ke905VQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=santannapisa.it; spf=pass smtp.mailfrom=santannapisa.it; dkim=pass (1024-bit key) header.d=santannapisa.it header.i=@santannapisa.it header.b=W+Za2/OH; arc=fail smtp.client-ip=52.101.70.118
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=santannapisa.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=santannapisa.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=santannapisa.it header.i=@santannapisa.it header.b="W+Za2/OH"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NT9Jo7ijlq9Mo7Gq3dj0aKg9uHq8E+vK8GjLINhrBAaS7/v1yn0gesoSjDqMo02G1PzWy+9J/sq+8S6nNeoFokWfHh2KhCMhmksp9cB3whTgRPLcNzDxTvVKQGPdrX+jWjpYm8VpkB5bF2FzqrDKBlKmxf4VsIof2+5Ce3ZMlt1olrgOggzY21r6uzMVdZwokJm+A3NTjjRcFkS4LoQOmxin3lW1FgBIh/JyyKTVaeyU39G3fEAE56zesUkwhGMB+YQVFckzH/QkbSF54P6ikU3T9tnCLnH6fIFTKDclnvHtl3KZlVyRcGUnUKYySRpIKI6tFw3HFmoBnAiSoNVHug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XjWUufvlKBpelrwQMX5jUsQhbs6nQA9SJrcMsTkZz7U=;
 b=bU9jF6MVTag6DexysuegsDcq+jEgEfSVpTjGm0JkxR8PGOI3mNO1kGYh54OAV0jMRILEeKwGNBepFsSIMibwHDo7U0n5T/Q3iTJlAV4EPLlVpFJrvPUDTwNlvPlikC4iTT9eu8jPldDLHvXRmdTDr1Iv0o416uPMKEcGVvUbAGi2MFA9/lH7kJqrr/YJVrTCjNyxQVBIkcS9LpjyzhsxY0EdWq5N4JbfFfYLdvX7YCBew7klGb/1tO8ErSiSpY8i+RWdGT++mFv+Qy5nOeuesbbxaxHOeOBVtHq9ihL6o5VvRuBjysvaXakbVXmfq41Z6u+l753UnHTrqCIeFbu/iA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=santannapisa.it; dmarc=pass action=none
 header.from=santannapisa.it; dkim=pass header.d=santannapisa.it; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=santannapisa.it;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XjWUufvlKBpelrwQMX5jUsQhbs6nQA9SJrcMsTkZz7U=;
 b=W+Za2/OH9BmUYc8XiCaQU8oU4p5lnhkwycLMkkj2my4IHpaSVc5bq0U/vynl0cwu0R8jCz7m6phTRPzwmKtmURbLsSYoww/I297o+N0uELr6q/KRZyXWWAAGSFi4UDL1SNl7A+O9v2/3hnFIkhag77G/1S0VVXYK+hQMYXycdAQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=santannapisa.it;
Received: from PAVPR03MB8969.eurprd03.prod.outlook.com (2603:10a6:102:32e::7)
 by PAXPR03MB7934.eurprd03.prod.outlook.com (2603:10a6:102:219::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.25; Fri, 20 Jun
 2025 09:37:49 +0000
Received: from PAVPR03MB8969.eurprd03.prod.outlook.com
 ([fe80::6bbe:2e22:5b77:7235]) by PAVPR03MB8969.eurprd03.prod.outlook.com
 ([fe80::6bbe:2e22:5b77:7235%6]) with mapi id 15.20.8857.022; Fri, 20 Jun 2025
 09:37:49 +0000
Date: Fri, 20 Jun 2025 11:37:45 +0200
From: luca abeni <luca.abeni@santannapisa.it>
To: Juri Lelli <juri.lelli@redhat.com>
Cc: Marcel Ziswiler <marcel.ziswiler@codethink.co.uk>,
 linux-kernel@vger.kernel.org, Ingo Molnar <mingo@redhat.com>, Peter
 Zijlstra <peterz@infradead.org>, Vineeth Pillai <vineeth@bitbyteword.org>
Subject: Re: SCHED_DEADLINE tasks missing their deadline with
 SCHED_FLAG_RECLAIM jobs in the mix (using GRUB)
Message-ID: <20250620113745.6833bccb@luca64>
In-Reply-To: <aFUqELdqM8VcyNCh@jlelli-thinkpadt14gen4.remote.csb>
References: <aBTO3r6Py_emwf1Y@jlelli-thinkpadt14gen4.remote.csb>
	<f532441d8b3cf35e7058305fd9cd3f2cbd3a9fac.camel@codethink.co.uk>
	<20250507222549.183e0b4a@nowhere>
	<92690eb9158c1019dc0945f8298800cad17cae05.camel@codethink.co.uk>
	<20250523214603.043833e3@nowhere>
	<c91a117401225290fbf0390f2ce78c3e0fb3b2d5.camel@codethink.co.uk>
	<aDgrOWgYKb1_xMT6@jlelli-thinkpadt14gen4.remote.csb>
	<8d6dd3013b05225541821132398cb7615cdd874e.camel@codethink.co.uk>
	<aFFdseGAqImLtVCH@jlelli-thinkpadt14gen4.remote.csb>
	<880890e699117e02d984ba2bb391c63be5fd71e8.camel@codethink.co.uk>
	<aFUqELdqM8VcyNCh@jlelli-thinkpadt14gen4.remote.csb>
Organization: Scuola Superiore S. Anna
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-pc-linux-gnu)
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: ZR0P278CA0071.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:21::22) To PAVPR03MB8969.eurprd03.prod.outlook.com
 (2603:10a6:102:32e::7)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAVPR03MB8969:EE_|PAXPR03MB7934:EE_
X-MS-Office365-Filtering-Correlation-Id: 85db1eae-4ab9-43e2-6696-08ddafde1e93
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?csMlnwTwDG+vhL1fi012g4Hkxq12GJwiJ+F1Y70R70/huoifkUZhMd7NRPTf?=
 =?us-ascii?Q?gRlEs0wZS1kcDT1QvRtMQI7mmsU3St5bNF+pnMjs3B8+2uslKXS/rxbFkgyE?=
 =?us-ascii?Q?yXDq+mDFneDQiwZcISNJ/ZoritxDpAVAYvmNvJHIY9d6o8h7rJCOl/cy0nVw?=
 =?us-ascii?Q?jgt9ARInWc/gUc7TPQ8mf+Y/Zt7sGj5UFWnTApsa+zesFL/EtnNHIRuH4BWQ?=
 =?us-ascii?Q?gesOzP3OL16oUpmPIwC4iYESnLDrNJmVYo7PbHcrOolt2AvvkgXeFxvn/G03?=
 =?us-ascii?Q?V2Mjsn7jIJ8Kn5W/Z/01DbkPeQYsmGjXTpHcPdWG/IVY4EONa5posL5oBcb/?=
 =?us-ascii?Q?XEIbWhUumTotnVAIGaTZGjS5aiZ2JJhADBrS6hgipr+tbtpVnxUM/KQ6CC9H?=
 =?us-ascii?Q?ipvIiTWDoIwFqViinZGGbtteAbPGYBEAZMOjKZB0m3LIdlPaTuRGmaXJDLip?=
 =?us-ascii?Q?HPy2X5yp6uFZA9/W58jmuQuWdFnz2THI5JGxMcSNhVgqE3EK55BjN0tyiPFN?=
 =?us-ascii?Q?1gZMlA+RXsCH5/OmA7g4VlHyxJs4hiCawDQAqvnUOwLoKPyf4rFfrf1IksU/?=
 =?us-ascii?Q?ebsVqeQQpal6YUUe4rxFQc2Rw+nDK1N2xetePxOhyRdbcdXKC3VkAylrL6Ai?=
 =?us-ascii?Q?vUPvmz6TE76UPYHkj3qUthHR1DTmJpRDqGhc8wuNM4mQTrKNbycQnHlsjfpm?=
 =?us-ascii?Q?3O9oECmptRxtMms+qBfj96O+BN7sihMNhPptVh12Mi38Tq+hP9Ss5dfLHERJ?=
 =?us-ascii?Q?OWRmltGuHzQWJkOFSzoMEu/jkLySD6mxEiKhpBEn3HfSD+nsWpPplLPPIzB4?=
 =?us-ascii?Q?V6wqyUI1eu6IfO2QghBlaRpQ2OEulSkCrmt2DukIfYjYRvo62EwnzwfFBAli?=
 =?us-ascii?Q?2F0CKtXhDCa9LBEuOrDD09BzATTtiNRTlTI0EogSx/6xe7eGb1+4U0UMwriD?=
 =?us-ascii?Q?M9SRc0GWoMYuNLibu58TB0jRWxsIXYorDQqjStk+6iDuVlhGKBDKPCD1CI5h?=
 =?us-ascii?Q?96t49yZ26lAlnXEerKTLDshjXNVTiDUdaFoaPEDGqC2M0vrGTiiHeP83nyOM?=
 =?us-ascii?Q?k/cKfYFZifccQiXclK/uhaGxkAbFmvtrWovSaIewyS2vO1tv3uq6A/rv4yNC?=
 =?us-ascii?Q?u9o6h64BITDEZ5yNP86cv+pPl6rheb7Hl52ctrWVhcB4FEek4sb9LLMNckXF?=
 =?us-ascii?Q?FEylh8eZ+wpHauPMwYzYd1pR5Kp/Cw1/ep42YQvNhvge82J1yY4v6WMNB/Y3?=
 =?us-ascii?Q?IVwbx/EoVf/a6CpIrFbEyC28cn3CLUmfPKKIcLS782L2/OB5cF9rUlLTW56F?=
 =?us-ascii?Q?cDqBJh+HHHD0wzvvJIVQfwNLfhkOJvu4G834AY6aIC5SHqFkezpiyyRw0jl4?=
 =?us-ascii?Q?Aphk4UBss/kG9KYjMqPKWcXxp4PPr2P3kIesBid3/2uzMWgVUouZ8Nq488k9?=
 =?us-ascii?Q?TVrSW0oS6Sw=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB8969.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?edhnfzLQtAgY+xCiEbXp5C3Sog8MfFOba4AVkjl6ylsRqNLMuVDBQWFexaTg?=
 =?us-ascii?Q?1z89T8lKIyWRyqj6+IlwZDFwWjtQ0P+n50D5y02vqM4xQf4GzEgr0C78kSbl?=
 =?us-ascii?Q?rNqMD26MlFBuDU9GcqJnpOLEyLx+cW8fBLBLvMoAsbRx6lc12BCVywixJVWc?=
 =?us-ascii?Q?y/yssN1HqjyXebQbn4aiE9uqAexFG7uPnSPVA/QszOXXvIsfTdP/7V5KqpkN?=
 =?us-ascii?Q?W6TQz63dSx0GMrFieCE8QotdCylxONA+RSgmc77m9xuUOWrXbd1SEZG38kx/?=
 =?us-ascii?Q?SKIJGC5G3mdPqAippC5uR7mW8tjd/jrLjgRh5/8nsogUHQEoGfqmYZrtkalO?=
 =?us-ascii?Q?z3prgbOJEpE53l9632S83E6lUyBQwuwURKRz3gOJBv1+c+EfNYhv5Elmlw9+?=
 =?us-ascii?Q?XDtJdQ+HBtmH+KGwbs5vdjznmPPXzfcAgcqTbeB95sBZTTBJtG1dSBN/zkK5?=
 =?us-ascii?Q?xBlQiMT1WJp6LINip8X7BlE7eAPAZxeb0HTge8h7qQC9S69PN9ro3C4+bY23?=
 =?us-ascii?Q?la3DX3uLkfoodqXrEFq2X4JSdxUqP4ojoSYwbyuYbvuXkva5d60H7BNwzMoa?=
 =?us-ascii?Q?EUtTbVWJLrDUSCHlfvQXVbMumIxvufQlnY+9h4ED4AsMnYMR7/luf+4glM8n?=
 =?us-ascii?Q?3Fxu00WC7/q/gR8GqvbIISGrOkvD/cj4+m0tL7TkX5iiqfsaeVpkbIihlkZM?=
 =?us-ascii?Q?lvTw8ySUhWlM0+6J+BWnMCad147F5ZOWu8HPhB/yJHVZdDTtVEYyxPlU2y/w?=
 =?us-ascii?Q?I9X57+BB0ce/K2vHU9wZUVs9TLeH1v83fwrP//uwq6p8wBLeIJjLcpL8pJHX?=
 =?us-ascii?Q?n6c5YN8Hl5yy5NhEMYmubXMYcViM4nlnsrLT6AtAYuiPaa7JS3QOnuHkCIjB?=
 =?us-ascii?Q?2GIMhWRE7ZU1UU9FgVHOCDC/SyzBxJgvo91DPWbQ6FwQXTb8FNIyve9rWhEM?=
 =?us-ascii?Q?AvI6cRwUkont/RmdsuoHTo9NXUXWrRP1zmL3DdYbTq7KOHBBmpmwe6pmhfWv?=
 =?us-ascii?Q?LFWibNGgeAoNa62bn8ruJZ/1eCuFnHWRMOU/cQVldmoLGaNCe1zlt6YLMJ6Q?=
 =?us-ascii?Q?L8kN7M3V7WqwaBZR2EMAJPApMt6AkIau9wfYO/eNbULFSun0KcmNkM4cwg4/?=
 =?us-ascii?Q?5iiJxess/+lNrRHCziXw25hd03fz9E2Kv5NmWxvL2B240tKk30JJhxihY9TZ?=
 =?us-ascii?Q?CbHwhSW6FYaSEnLJgJwvUlJt8Zm43v/MTNkdzdK23FxZQxmKt+6vWw9H5xXv?=
 =?us-ascii?Q?u+pJjHYpJsmXfkultb9s3I3A509UF1UBTIgXNpGlDpL9vCnY/4d+Vc0qq9DG?=
 =?us-ascii?Q?sH+3GrQeVojS0k+cL4jfd9tVzJQ7SHkDBsUctHTysvvMav3BQOBFSWX44115?=
 =?us-ascii?Q?9qc28CBDJn8yd4vzOo4jccFBu6EpTgdtUj0omUjHRIla+kMGuko6wk067yUU?=
 =?us-ascii?Q?Wy/06Ql8LM7PCUkKHpHjCIaMVxLZTbQbN+MwIwqjW8mJGxqpbXxAYEhnQ50U?=
 =?us-ascii?Q?5jMZp+3MjT9EiNV8YK6a9FgSSVZ+d3eprmINIr+H/racLTutQJLLG5y7IDza?=
 =?us-ascii?Q?ByYh+zAhJaz1/Er8SVDc2e9FTh+AOwqOdkPcV9gPS3z5J6pbcYgozaCpbjhg?=
 =?us-ascii?Q?qQ=3D=3D?=
X-OriginatorOrg: santannapisa.it
X-MS-Exchange-CrossTenant-Network-Message-Id: 85db1eae-4ab9-43e2-6696-08ddafde1e93
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB8969.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2025 09:37:49.2270
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d97360e3-138d-4b5f-956f-a646c364a01e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FU5I9LOxlXb9nw4z/+3YjpbcmZI8kDFh1erlNRmKQwWHSur1Uzeyz4W8rl/AY3mUhWiyxT/poUNm4UOx7FFdKeabV2AYwdcTKuyEZOYVJDM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR03MB7934

Hi Juri,

On Fri, 20 Jun 2025 11:29:52 +0200
Juri Lelli <juri.lelli@redhat.com> wrote:
[...]
> I have been playing a little more with this and noticed (by chance)
> that after writing a value on sched_rt_runtime_us (even the 950000
> default) this seem to 'work' - I don't see deadline misses anymore.
> 
> I thus have moved my attention to GRUB related per-cpu variables [1]
> and noticed something that looks fishy with extra_bw: after boot and
> w/o any DEADLINE tasks around (other than dl_servers) all dl_rqs have
> different values [2]. E.g.,
> 
>   extra_bw   : (u64)447170
>   extra_bw   : (u64)604454
[...]
> So, this might be one thing to look at, but I am honestly still
> confused by why we have weird numbers as the above after boot. Also a
> bit confused by the actual meaning and purpose of the 5 GRUB
> variables we have to deal with.

Sorry about that... I was under the impression they were documented in
some comments, but I might be wrong...


> Luca, Vineeth (for the recent introduction of max_bw), maybe we could
> take a step back and re-check (and maybe and document better :) what
> each variable is meant to do and how it gets updated?

I am not sure about the funny values initially assigned to these
variables, but I can surely provide some documentation about what these
variables represent... I am going to look at this and I'll send some
comments or patches.


			Luca
