Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11020109.outbound.protection.outlook.com [52.101.84.109])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B51125B30D
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 12:50:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.109
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750855816; cv=fail; b=gi24SHni3G1e0z/DTy7N5NISXVkLGRjYHw1A4HDR8ODTDmBykqKw9atCqBadmHAIMrLiqr1kuUI3F8xym14pSy+BSfprLHrMaZlNp7i8lvA3kZyT2h8r6L3LnjiKQDKya3lT6m3pJryDDBMyhln9pVbiVz4E0dM7Tiui2mMuKX0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750855816; c=relaxed/simple;
	bh=ksmBeymDbR/9y78EWkvMsLXE3nLE/2oBtm19QoM/09A=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=YGyVXduZ/I34xLG4DX6Z11XMOw9vyf8AFqbAVukBIgli7vwj/R5vA5pwKXB9Y4ofKa5JDGo8UyqdIXLQe/8yM1WefIwExxaljG0/HrSqpb5+r7ALrluiWw0g5AOiYudvDh6EXNuM0QaRne3a0y8WKZGBU7q7El1ofZFD50GIMqs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=santannapisa.it; spf=pass smtp.mailfrom=santannapisa.it; dkim=pass (1024-bit key) header.d=santannapisa.it header.i=@santannapisa.it header.b=K04bC6nZ; arc=fail smtp.client-ip=52.101.84.109
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=santannapisa.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=santannapisa.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=santannapisa.it header.i=@santannapisa.it header.b="K04bC6nZ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W7bhq0vz/kntdw/SpnDE7hc6yx6eBx4TKqW7TbcPYclWm16g7NPiIFkgl+kngo8BDeu5X1+86MA8OpKvQbVT88ss6JEbXIDpOxDjHRHmh9z+xIUxEYfgr5FE5pD7P5fy/Zi52GMEe7INqJw97Sk+CRYt2lgSj4QISR1vj2XLih88Px5odHTldSSEUlSfaubLZgZ9tLrCJ7HSuY2nfqaMH8kK+zJ1OpKca32EDCWC831uOY9c9JhXxG8ftBNKo6xOxIdCT/q5j+CrIfuB6hJ75NUHG32Lw4nRPt0niMEEANNT9JouaXAeIIcC9xJnet8eqXsW+czebg+oNtmW7gBm7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TFLqSu1h/+P0KwP5w0ipBKqoWg8wUQrsCXPCd355ZWE=;
 b=ck7dIiA3RUICUDmjTmyoxHLVePaTTaEuyTbrjlnBzAhkkyCnInhx8kMHNX4ngkI1NX6OWDzE9AeEyF6YVFCWST5MSmSAI98pka+tHt8EKf/VBTR+z4ZCKD/Y8QlPn5MikxVMB9PlgkSQ0WR1nquw28NRbVSios2zWo6dR1/TU1AmH7b6ixCfQ4nyBU5MoiKNgH7tVg1xC1BhQ4OCLBosPMCu410usC0SZCZwUtMs3ytOtrsDgV1f0Me/eI7Orj08O0myhPTaAyFA48rDE/3B/UDdYxzJt+gHrbqRQm1/R7mpZRe9zGrP+SUB2VmPReoJ8Tsj5/GaecouT/yqu5oH7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=santannapisa.it; dmarc=pass action=none
 header.from=santannapisa.it; dkim=pass header.d=santannapisa.it; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=santannapisa.it;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TFLqSu1h/+P0KwP5w0ipBKqoWg8wUQrsCXPCd355ZWE=;
 b=K04bC6nZUxKckAv2JW0/P9wyGnAZAFYegWxjdOs/zuyGgvenQZedX9FuztLmGQqIa/2xmRyr9tSka3TLRqmeK4/sETE8nSJVhfH/BvbdQ0Wr9YcbPaGkOZQ7QEtXKhBJHd8K7PkfwWbYgJT3hDcphUG0CzGrYB1wt2Ago2RIcac=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=santannapisa.it;
Received: from PAVPR03MB8969.eurprd03.prod.outlook.com (2603:10a6:102:32e::7)
 by AS8PR03MB8974.eurprd03.prod.outlook.com (2603:10a6:20b:5bc::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.17; Wed, 25 Jun
 2025 12:50:07 +0000
Received: from PAVPR03MB8969.eurprd03.prod.outlook.com
 ([fe80::6bbe:2e22:5b77:7235]) by PAVPR03MB8969.eurprd03.prod.outlook.com
 ([fe80::6bbe:2e22:5b77:7235%6]) with mapi id 15.20.8857.026; Wed, 25 Jun 2025
 12:50:07 +0000
Date: Wed, 25 Jun 2025 14:50:01 +0200
From: luca abeni <luca.abeni@santannapisa.it>
To: Juri Lelli <juri.lelli@redhat.com>
Cc: Marcel Ziswiler <marcel.ziswiler@codethink.co.uk>,
 linux-kernel@vger.kernel.org, Ingo Molnar <mingo@redhat.com>, Peter
 Zijlstra <peterz@infradead.org>, Vineeth Pillai <vineeth@bitbyteword.org>
Subject: Re: SCHED_DEADLINE tasks missing their deadline with
 SCHED_FLAG_RECLAIM jobs in the mix (using GRUB)
Message-ID: <20250625145001.7709b647@nowhere>
In-Reply-To: <aFvLYv0xSXxoyZZ8@jlelli-thinkpadt14gen4.remote.csb>
References: <880890e699117e02d984ba2bb391c63be5fd71e8.camel@codethink.co.uk>
	<aFUqELdqM8VcyNCh@jlelli-thinkpadt14gen4.remote.csb>
	<20250620113745.6833bccb@luca64>
	<20250620161606.2ff81fb1@nowhere>
	<aFV-HEwOTq0a37ax@jlelli-thinkpadt14gen4.remote.csb>
	<20250620185248.634101cc@nowhere>
	<aFpYl53ZMThWjQai@jlelli-thinkpadt14gen4.remote.csb>
	<aFqhId-qMFNyPD1s@jlelli-thinkpadt14gen4.remote.csb>
	<20250624170030.4e5b440a@nowhere>
	<aFvBvxhw6ubpBefm@jlelli-thinkpadt14gen4.remote.csb>
	<aFvLYv0xSXxoyZZ8@jlelli-thinkpadt14gen4.remote.csb>
Organization: Scuola Superiore Sant'Anna
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-pc-linux-gnu)
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MR2P264CA0064.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:31::28) To PAVPR03MB8969.eurprd03.prod.outlook.com
 (2603:10a6:102:32e::7)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAVPR03MB8969:EE_|AS8PR03MB8974:EE_
X-MS-Office365-Filtering-Correlation-Id: 77e72b57-e4bc-4b03-2830-08ddb3e6d03e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?kFwIONB/IEASfKF+TGEFc7MSkM9QaHqoCC2kvt/DoPckYcdAYa2UlBMjT4vF?=
 =?us-ascii?Q?S0C4Oqzcy8aSOyRJ+RLeQeURBxrJBTqnkooMMKYL7seKQdOHflfygBWreKsQ?=
 =?us-ascii?Q?RS5mINfVFRppy+1N1W4j8wdhacnYmpMHvLfwNpYLGHKEuOpW27qAVk8dQzmB?=
 =?us-ascii?Q?oP7fZl/P8FGKzqW/7ESryMie1gMHtBz5N9g9gqGnbv07weoMZ2gVLB+hvJli?=
 =?us-ascii?Q?vx0+RCHBtsnZpAiQvnVrrmZAuzidLLYbiFOs9JqfUJwakHCC4axoO/by0lZo?=
 =?us-ascii?Q?awOQ25bA7vTaH4ODQsH9CMaC6eS3MtmxRfuCRyfeVreP6iB+I7vTGsGJ12MK?=
 =?us-ascii?Q?dCjdSSOa/qF7z6t7EfX90WY8hmpbpiSU8AKP3IlBw7zZ9ZxbC4D7LGXDNl2e?=
 =?us-ascii?Q?LKJt2rMAvX1RH/G9fDRZlBKSBZg+z7WkMAHfWK+8+qlKGTOKWHuFRDWA57qI?=
 =?us-ascii?Q?tlK2qtBA+rMe7pR8hbig0yg4J+lysvOH7X7LjRyItLz03WxQ51ebCgvszaAe?=
 =?us-ascii?Q?nlshWQu+zh7wgrVg0Q6XwGozDWLwE2dvjpsnDXwwcMLwxI1IMX2Qfh6VbhtR?=
 =?us-ascii?Q?kwtsVooKrx4VZeqCpMwhyPGL7iP5eIqj4uCqnW2EZ7bEJrQ5pMqNm+3+0ehi?=
 =?us-ascii?Q?8d8GtDZ0zz7pveHqXpaw6bYkJPCV05at4IPt/Ks/tI/kvP5KbevSsDjoht4j?=
 =?us-ascii?Q?0F+jWOODoWmejnnntGsdmh+pPKBZZIsluk/UJbz8cOoCt/Y4H4V9tTdqtXHl?=
 =?us-ascii?Q?j8AMAXpgQSqlpSuXVp0Re3QaKxG0NxgFGm7fon4UtWmfSi890Ui3NE/3VLAM?=
 =?us-ascii?Q?XUENDtFLqcGEj+W1l9+XL7hqQo5WF2bNb6PDbOLuMESTOaUc51P7Mh+WQnGh?=
 =?us-ascii?Q?wmZqFVu7pGuc//KEqRDO28i24LgFQFAs5j2XGXV36GDFAeVnwxOugeW7god7?=
 =?us-ascii?Q?Imvml6MsQUjZkvVVyR8StoYc4En1TAfRvGu7K25II9/v3CRfAqV7aatI72Oj?=
 =?us-ascii?Q?m0QpiZNPdxYVhw+WmOVkGfcrIiM5GKFnDqo6/fxVuS63Xrktxys070TCvPyD?=
 =?us-ascii?Q?FX77T2z9Sz2G+ZeKuUnAqodPC2e3SO2Klx4w+4fukdncTEybsUoF5QtHJWML?=
 =?us-ascii?Q?ePyOjFGj7cbI70oWyrJMBGFP4xgniiyyQLfuq/HATN8lxshRkHRQAGy2es+e?=
 =?us-ascii?Q?UnaSpCdJw3S4xEsig6UrnVJEcRpPCagGcgnLSor9md8rvY1uUztL/iNbvxFA?=
 =?us-ascii?Q?229n7QrrsN0dQ/Nok1NudQy6Qsd2RFqByz67KTM4tz4HT950TsfSRFQkbWbN?=
 =?us-ascii?Q?3CLXPC/pd+U3I6pU0Wy7dv+cdz7LimaDiyCCHTm/jOwnLfdLwlBzaeLY0WBI?=
 =?us-ascii?Q?Y8iTqU3ASKOmt2UxAttoRBFEsESY6GN1ia59GpkGfiYN/Z5YyZUC7HUaHT1N?=
 =?us-ascii?Q?w247ZJcRHD0=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB8969.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?yEhkoajpSijbTe7ZiGok/jwyidUQlso5PhBKxWctTKmArndTMNvkYClYNtWA?=
 =?us-ascii?Q?kC7KFy9wrCG123O6tdjtRZOqvGN3sOEsbpLYnukBORzlwR/w2di0g02H1b2Z?=
 =?us-ascii?Q?op/JUgJGF8PpFPAIoJSJLAb1WmehbUZ0y3R6n6u03HFQLci3EzUMGEUB3pi3?=
 =?us-ascii?Q?//jxrKt8ycVfZxLjFQOE7ht45EBZyftU4MN3lp9RJPu6hzgm8FmT43Fc1M2S?=
 =?us-ascii?Q?6XiacEQcckizOej/Q7t1V+lJiAL2RhlM4rQKdWkYBT33z31VftUpM3sio81t?=
 =?us-ascii?Q?YEN9r137KSS93W5GxVx8ic9FzQuBRwbZFsvrpoXh2pNPPWbS+rl2nsID7mW8?=
 =?us-ascii?Q?2RV/rjqAB3KlgsSHyoPRqeI8vRG6QuVM3qtYKJ+DYIv0TiSJ/uYI/DNrVP/U?=
 =?us-ascii?Q?Cxl1E2+OdiWyE1r2vRJYjEtewEhbZeC7S/Fmis8QuZ7qmyUAF1Tm7tMta6SY?=
 =?us-ascii?Q?WC4qduS9nSdcN5+TyGsd6/+YbrsWMslhmR4KsG3S8J6acx1QEJSKhFOYA1NZ?=
 =?us-ascii?Q?GGwBBnqWOANIEYKKcgPxfvkjaPMwUPvp+FBjGjcdOPMdlacaxHAWtBUv4xSe?=
 =?us-ascii?Q?vx8SbucxTORwzk0aS7PkoGQJj8eFdLCYROw1461Qso5fNsYXqx/cahn60u5g?=
 =?us-ascii?Q?t4EPvrTccr9fiivErPIaT97OS/2di0zSFlHpsDjEBWy8ZuUdOzFDeyHDu3F5?=
 =?us-ascii?Q?2idpPX1ZkVYsvZyeGUZ5WiZl+4p1NWwXRmAmHqJYR02zGDXvcaN0n4buxFr0?=
 =?us-ascii?Q?+EyJhVLXpp241z8PSljszHHPMqXcll7AhzeF2L+1mX/eqdC4+kcghXzEyko6?=
 =?us-ascii?Q?QQcVfTiUa+aa+9vwVrDMDkFOKy8PCVhSoS4GTr9SYZTK5BstnV7deW57GNmm?=
 =?us-ascii?Q?LEeSXEGKnggGI6r8aMMWoMOlxygBHmkeHo6+R0lvKwdKaL2kQfsYioh36yVi?=
 =?us-ascii?Q?8TUNG02PbZXu3bbgeSqEq3wwcp9tXV9oiSNGkuiiYnt1NLYYioPf0iQ1Za4q?=
 =?us-ascii?Q?RyXG3ODCdSfeNdL4+K4bMU2iW81DnagcOIsbN6/NqPbu3+N5/J7k6GXZPy7a?=
 =?us-ascii?Q?6t6rhezMrX+juR93Jkz26lrKteOzP9S5nT8UV7vAE+wRYsk6pW7UgBK9jXdJ?=
 =?us-ascii?Q?m14Zm5fCNpGbFJr6SAAuqmQiftWSgJ9YDNkbXcc0v1ouh/mLJV6w9bbLvaDF?=
 =?us-ascii?Q?1OvqAZxrLTJJpjH4lUOVUajmLZDggKDZTJVoKio8dI0YUDafq/VEp5Dss8+Z?=
 =?us-ascii?Q?C0Bx7UdO2DFa8e4lwZUqDf2xeJRS6UwneUfk6PlhkWYqI9nMvQmqjxlAzZ38?=
 =?us-ascii?Q?mIo8jUV0YEFq5coeZKhNhmLGgGI3C1pJyIQOlJgYrKJDeau1BijZ+09kVYPa?=
 =?us-ascii?Q?NP0YdB9Cc9MiEjiK3UpYf24U89QHZyEEYV0OHd17hRhRVEN2i0G0gRgFKMX5?=
 =?us-ascii?Q?lQnQl6cx4WjlVdj5HusTSK9QXasKAfqMzku8yUjy2sfYoeU3ziVbyz1r6YiK?=
 =?us-ascii?Q?NqC3anISvTvrKU/stZTEiLwbldG38eqMeQM4zPEX/8gtj+Szrx+EC1/9PcPb?=
 =?us-ascii?Q?Lk9OrZfIsgs4iUT5PbDiwxMX5ek00hbV/1C80uPV2s8BITJ1eSjNwKehJTV+?=
 =?us-ascii?Q?dA=3D=3D?=
X-OriginatorOrg: santannapisa.it
X-MS-Exchange-CrossTenant-Network-Message-Id: 77e72b57-e4bc-4b03-2830-08ddb3e6d03e
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB8969.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2025 12:50:07.5422
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d97360e3-138d-4b5f-956f-a646c364a01e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5syx2x+pWt5Kn8SHEGfLB1LOvX0drAgERrQb224nXq0o1wS7Mvg0pefXyV4nQ9ZGhpTQBmITvrKq22NRGW85NPY1dneCVsMXAKTaxi7GNrI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB8974

Hi Juri,

On Wed, 25 Jun 2025 12:11:46 +0200
Juri Lelli <juri.lelli@redhat.com> wrote:
[...]
> I pushed another fixup adding a check for dl_server_active in
> dl_server_stop(). It seems to cure the WARN here.
> 
> Could you please pull and re-test?

I added your last 2 commits, and tested again; it seems to me that
everything looks fine, now... Marcel, can you confirm?


			Luca
