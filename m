Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11020115.outbound.protection.outlook.com [52.101.69.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B8C73595C
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 15:00:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.115
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750777249; cv=fail; b=r7a2Sp+ctX49XhbxfkGnEEhBik/SvCGgxs5kVdRYAja2Vsijo13dnEjnFtezkB/NeXiG8WAqmYRwyeNqm/GXZgWFka5rk6jCPgwXAo4g5M+4gOHwEzBIFfajTCwGAYE4VS6lhm9o1wqG0+G4X1+aev6dgO8waF1nSjc9CJqS/00=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750777249; c=relaxed/simple;
	bh=LMndpSMsky++a6I6Qyy8Pg0FQtNvY1Xw58uT/lKcUtM=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=D8CvAPErq6UEVxt4rcRnEeukQAEEW9M/Dxm58gjEQO1tL1nJsCYcR18aaFHggnyyQLLm5cpgsSbjJ/R+5DJUteduq+f5PkUXKA9o3URYqM26Q5BBOpmNiL7xj5xJ+Y/vRh84RK5yf7+MHXHVin5H5EGgYMs6l3WppGwVE+DEG7k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=santannapisa.it; spf=pass smtp.mailfrom=santannapisa.it; dkim=pass (1024-bit key) header.d=santannapisa.it header.i=@santannapisa.it header.b=FTQNvUyH; arc=fail smtp.client-ip=52.101.69.115
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=santannapisa.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=santannapisa.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=santannapisa.it header.i=@santannapisa.it header.b="FTQNvUyH"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R4FJbadA+Ycsvf0e9mGGlcDZXtExK5QRac18nFg4yR7/syiG78jvTrRLmD1Hp8L/L83/6uXkGkhupdTyqiu9FqyHvnJpWuTHd/3Dr/aowFkSTvREQEuTg4y4ZCFH3AFNAM9SwO9za3be70+KAGc5+XmPC0I5HgfrTe7/GKpvXKFmc/Btny/ZyO2ou05vjkdOIwGLJwhS+AJWNNuOZjTDtw1a/+gdwbLB9Aw4rDKqls9W9fhfPJsKYkjIo8r63ixFndSeTg1lM/uoGaPBG31+MP+050zLY4RdD/UiqsWc6/J8VXMjHTRRZ+OFd/NeFGbx7BUoPxw8VosdxDcb9uvI6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gTWNOUc5vwont3cIQBxaMvQsbeXbKDCxjx1izmVsU0M=;
 b=skF0gN4bVDapTr1fMBQAx5zPQyE91XEU8Our4fwpq57zjsjPw7Uz+FQRjvS+qrFLzGOkXGGfxCAKoHLzSeYal5aVES2n877snpvPAPnTB/LGqPLv7O8yrk4xHqPTy3lZ1mnJZe5iWy70U+J0v2/ZE2uux8yvpboGcMuar/mgXqM70RCpQFHwiAKbazAOk8GJWD0VO9vVu0N1MJ0t2PMKN5wLIjqpCf8zODBxfe7OKVJrGZouhR0Z0YCKPfvltGjsmgArtl6OaZIBwCe5hmD4Gp3sOL54A22nGqaROy5n2wDu+siiPokqkAmJKZVE9wdioqyWhDW/UupZu8LFIR+tPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=santannapisa.it; dmarc=pass action=none
 header.from=santannapisa.it; dkim=pass header.d=santannapisa.it; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=santannapisa.it;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gTWNOUc5vwont3cIQBxaMvQsbeXbKDCxjx1izmVsU0M=;
 b=FTQNvUyH5NDGrfmYo08l7nTXcfw6o8+n8EEsESM7XFtJ15wUu/S1rK1HmfFg/PL52VxgqVJu76JqQOyCYD0OqmtaXM4G6wfyyIXLToHljyQnMHjyc+VGAR2MWDP5Szrl1Fh5ilagIxnc4eI2q/qH5GZz+VOiK42/Q66PXlMvggs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=santannapisa.it;
Received: from PAVPR03MB8969.eurprd03.prod.outlook.com (2603:10a6:102:32e::7)
 by AS8PR03MB6709.eurprd03.prod.outlook.com (2603:10a6:20b:290::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.29; Tue, 24 Jun
 2025 15:00:41 +0000
Received: from PAVPR03MB8969.eurprd03.prod.outlook.com
 ([fe80::6bbe:2e22:5b77:7235]) by PAVPR03MB8969.eurprd03.prod.outlook.com
 ([fe80::6bbe:2e22:5b77:7235%6]) with mapi id 15.20.8857.026; Tue, 24 Jun 2025
 15:00:41 +0000
Date: Tue, 24 Jun 2025 17:00:30 +0200
From: luca abeni <luca.abeni@santannapisa.it>
To: Juri Lelli <juri.lelli@redhat.com>
Cc: Marcel Ziswiler <marcel.ziswiler@codethink.co.uk>,
 linux-kernel@vger.kernel.org, Ingo Molnar <mingo@redhat.com>, Peter
 Zijlstra <peterz@infradead.org>, Vineeth Pillai <vineeth@bitbyteword.org>
Subject: Re: SCHED_DEADLINE tasks missing their deadline with
 SCHED_FLAG_RECLAIM jobs in the mix (using GRUB)
Message-ID: <20250624170030.4e5b440a@nowhere>
In-Reply-To: <aFqhId-qMFNyPD1s@jlelli-thinkpadt14gen4.remote.csb>
References: <aDgrOWgYKb1_xMT6@jlelli-thinkpadt14gen4.remote.csb>
	<8d6dd3013b05225541821132398cb7615cdd874e.camel@codethink.co.uk>
	<aFFdseGAqImLtVCH@jlelli-thinkpadt14gen4.remote.csb>
	<880890e699117e02d984ba2bb391c63be5fd71e8.camel@codethink.co.uk>
	<aFUqELdqM8VcyNCh@jlelli-thinkpadt14gen4.remote.csb>
	<20250620113745.6833bccb@luca64>
	<20250620161606.2ff81fb1@nowhere>
	<aFV-HEwOTq0a37ax@jlelli-thinkpadt14gen4.remote.csb>
	<20250620185248.634101cc@nowhere>
	<aFpYl53ZMThWjQai@jlelli-thinkpadt14gen4.remote.csb>
	<aFqhId-qMFNyPD1s@jlelli-thinkpadt14gen4.remote.csb>
Organization: Scuola Superiore Sant'Anna
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-pc-linux-gnu)
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MR1P264CA0213.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:56::18) To PAVPR03MB8969.eurprd03.prod.outlook.com
 (2603:10a6:102:32e::7)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAVPR03MB8969:EE_|AS8PR03MB6709:EE_
X-MS-Office365-Filtering-Correlation-Id: 8d00f18b-311a-4c29-f32f-08ddb32fe2d8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?eFLpZYBFLiIw5+XvygGxCgpKznxtemv7/qOSnrZB6LBceMHSxlBMTD4Y0eaW?=
 =?us-ascii?Q?Uvyb20wcmL0m+HCCKqeQgisHSEk+l8GI3mWCKu08KGZ/KM+cDf6F0vRhTVdN?=
 =?us-ascii?Q?EJWEjSn71Notgf5E6paLUUR/t7NHiouTe9pQ+w/kHVpX1hUO2hvImqc9fCOg?=
 =?us-ascii?Q?rXgrezDD8xGDYKpJJb4u0SXVW8hcjM51py8rkY/H/6/QEdBrTXVrrmGo9V+L?=
 =?us-ascii?Q?uAcMNqhAimQaFaoV6TMExhbbXkiWWsjHf24UbwJBL/2wLCnG7CVwcAH1SzXq?=
 =?us-ascii?Q?SWFYlmOfr/ZD3OtaBa8VDMOhCDtrKbp2h0FgC1ViNFDYKoyUl4EWKfjq5D/P?=
 =?us-ascii?Q?jACsQbCOkkkHUBMB0OOYl4j6ydb/WaGFLSKy83eEu9kNLR6VpD12QN4YoMzi?=
 =?us-ascii?Q?31qWrYrgQe/gJwGDyhS5xdarWIYUM5ppawZ2nBinwRPvAPjKvre1+zXK7vBJ?=
 =?us-ascii?Q?I+PS+11r2bjP2Yun+x9dctQgKQkC89d3raJBdtovxYDF4O0GvGC+gi3lGmmV?=
 =?us-ascii?Q?a91ccH7hIOufnrWyRMGdFRB7B/0tYjtt2qiDQEytAr3SojBIysy+NtwbfZLd?=
 =?us-ascii?Q?jkaOChtoV22FHZJHsM+kQ/DabTcEgDYz6FQVUEp4tbWMC36iZn7UIsFqKoI+?=
 =?us-ascii?Q?M4RgDehgxwlDTRFA1wylWx6EtqVUh0BH3lV8/tsyvG/AEfvBZ1Nw90+PeQpb?=
 =?us-ascii?Q?ku6ZxoFloxhoCkcle8rxOVdbQzcrAIvfP4GQWx9HQlyT/SMCThEd4CZKj6RT?=
 =?us-ascii?Q?kqAsaPbYxyfWG7HGZQ3Ftlnz2y8gw77HY3IaPSL040XU/AvhaDjneMqJaJdp?=
 =?us-ascii?Q?8A9ZIKR/LGT/G+pxbv6TmW8rs/J6uuPBdOBvzukZR2AmARmcHRJ6YbR2JQRH?=
 =?us-ascii?Q?2nKcUU3RhVGJErU1hKIJbBVNUP6Q+6MByNHmECfjkwCaOKZSGOCLFv1cQvI0?=
 =?us-ascii?Q?CkW9ngEMXpxOACJxZaMtcBisD/MJRBhDsFXvNS5nTOAz9oPl+/IN/uwIQEpp?=
 =?us-ascii?Q?DjFA283NRwXolK0/kCFzsa8afW+iOUfT2lnSGdWTX6tMRnOAwT/a5hlGyLQX?=
 =?us-ascii?Q?Lo8fjUxLiSXZKocYZE985/rOvfzJlFhPY1bCOV/iGRjCXaV55Jm48GqUu8v8?=
 =?us-ascii?Q?FrTSV8tcD1dgME7lYZPztrBXR9nPwya4LHVYWU2s9E9X1IsRUuxgeRl/mve+?=
 =?us-ascii?Q?JG27PDtf9PFdXYk//Mgt/XfUyGwM1lG+fzFy/+MzylbcNzZzJXyLJDEL656P?=
 =?us-ascii?Q?sZBSLz3Rc/L04ge6d69lBrt/fj48wnTYkVnI06L+k4CqHY7B3o8ZHRGDyJ6I?=
 =?us-ascii?Q?e4kriDAwGIeRkwjvzFO4039tmJYPrpFopbHZR83PY8PJhwXbJ7fF8ePk31jj?=
 =?us-ascii?Q?u4nzc7BdSFeRnMDl4nel2BYBymGHXxj4LIQXlZk4+eG+UocGP6NPyZZvIU+k?=
 =?us-ascii?Q?JhUHVyhXv60=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB8969.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?n+loiMDDmSZMMSioyUxBQkfEjIO47hg955xN2pi6bcv3scbeg4gmGt82YS3M?=
 =?us-ascii?Q?d/cIPNLCPr64P/8Y16L+zDmMbxzMx+bvuBtzPhslA4Qrba+DoO6gf4klC6Ir?=
 =?us-ascii?Q?yEYDtS9kElAxNIzLqvLfYPeWfAjD6P4zMXFJerjZuElY6kNNieHI04GzB5a5?=
 =?us-ascii?Q?3cY5re7xBhODw0TwmoqLBdTM4El1jaxGYPYTYSFytUTBc+HtQKuO2Tl0VUpj?=
 =?us-ascii?Q?PH03Tw3m+QjU9Rhzyc7/CV2Mu4jmPAEHNMI0Oy1+LCUZsuALxyEKaSjfKYz7?=
 =?us-ascii?Q?XDIja+QF9BUp3lmyfTc2NP/6hk8nDD+H9r3Lt69I/2zCt9T4p966UTXwUxwu?=
 =?us-ascii?Q?m7gmnWNPMNOWll0uUz7nmVih0T3A9y349PQnYmOFVcWFdMP9VW3mwIcg6kex?=
 =?us-ascii?Q?cRbD4/DZzHJmmSlTeMLQTwjo4KQplc7BOGAB3dpbon38rBM0bmb/fejouByH?=
 =?us-ascii?Q?Fw4VsHHxtJWqUoOxOkhUFDFwbazU94UJY2iBB+agxZV7Jt2ofMVIoCTJol/8?=
 =?us-ascii?Q?szdHBoGTll2ll6wh8iHmwXv/fYp0Qoec4rc3XDLR8GVAYztZnxAL307WiHNM?=
 =?us-ascii?Q?+ShufgAIwtkk9zzl5QFNDdn+C36LICXHDly+bjp6FhLWhvw0ROgbwWAmewNC?=
 =?us-ascii?Q?YheDoDkI2bC26PPCqSbkwU+ZXryepLrtey0RJkKWRs8GlqhqpcLOrJ6JRAss?=
 =?us-ascii?Q?JDSyyfgbNhvGHwsHDemGBlfyEz/yWslKse/E0bzQ/VHP2qERZ5JGq+X6V8jH?=
 =?us-ascii?Q?rtOkoPntz91+vPLQAPnH24TxH48cGGh7e5MYspdQXy8oxzHdKk0yWcr2PMDy?=
 =?us-ascii?Q?4TWhPZKgeiAa9ZmP1E+br6SWbZrZdU/E9bC5sqOlGX+VOGjouo63r1XB6ule?=
 =?us-ascii?Q?MwR4ReLFM5iJShAHQCWcupMfHpbkv0dDEe6wOeNEnAbLbELgnawbokWiA6LJ?=
 =?us-ascii?Q?aMPnBX+4yLQreb8gnoehM0H3zaaa1+WGVEQRlFaN9Z9vbTiTuvM8DvS4FyfM?=
 =?us-ascii?Q?hWSLY9XEiwmTBtk4+MLzjWDh0GcO+lgSsw40z7WtxAmJUBKjHMVB4D5viZyO?=
 =?us-ascii?Q?VOm+hpm6SbyjdRJ/roaZBge0oy02tPF4zIDtnzKn2iWZ1bpo3mUBlguZ7RJ5?=
 =?us-ascii?Q?2SKEl7DZ0li4lhElA42mf4eOAVqlf/iesfQFbWJ2GEWcrUW36Jp9mU/R4uHu?=
 =?us-ascii?Q?xrYQp1EaAZt/knzeZFFplFy1wIz6GeLOMNXFp/n+o+W4itwJZYv571gPxmUh?=
 =?us-ascii?Q?wDuTA+hCei6mBzg+fbeB/lkcNwenFrKskXpHFTiceKKAuw+D8FCAyaEsS+/Z?=
 =?us-ascii?Q?MR21PytwPTJW1O7L1AAx3KWiA2U220G/O1u433rIiykT7iwrZ4uG0ZaGksp7?=
 =?us-ascii?Q?8Y05lLLAKRVNj8WCMGqo2zTYrQzf6AMvxz0aK6RtIUriVC7aUYDAipqg6T+P?=
 =?us-ascii?Q?8V6HdQL2/BeZovAArNOMcIpWIlxVQW8IIhWGMLtkF97sFwPX0PN77V/OdI8I?=
 =?us-ascii?Q?jL7iKzpAwf3c83TzZ+gyDrLXDO9+RLdXruNnbd3FyCmzBBG98WF3CuZDqX6N?=
 =?us-ascii?Q?Mrm9E2JOXEgDnSdwZssSA0cFgAW6WyoO0ySadZ/Fw99ZaI0kwFtMZJF4yI1w?=
 =?us-ascii?Q?0Q=3D=3D?=
X-OriginatorOrg: santannapisa.it
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d00f18b-311a-4c29-f32f-08ddb32fe2d8
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB8969.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2025 15:00:40.9671
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d97360e3-138d-4b5f-956f-a646c364a01e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zUKiFeO+h650yfv9R4B4/LyPMx3sWiJSNvqEorRhQjyb5CV04UUs5tiUxU/WekgawGEEQ/5v0qXcDsUZNYvZYvFetDQ4Ed2js4h/AQguT/w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB6709

On Tue, 24 Jun 2025 14:59:13 +0200
Juri Lelli <juri.lelli@redhat.com> wrote:

> Hello again,
> 
> On 24/06/25 09:49, Juri Lelli wrote:
> 
> ...
> 
> > The following seem to at least cure the problem after boot. Things
> > are still broken after cpusets creation. Moving to look into that,
> > but wanted to share where I am so that we don't duplicate work.  
> 
> I ended up with two additional patches that seem to make things a
> little better at my end. You can find them at
> 
> https://github.com/jlelli/linux/tree/upstream/fix-grub
> 
> Marcel, Luca, can you please give them a quick try to check if they do
> any good?

I applied your 3 patches to the master branch of linux.git, and they
indeed seems to fix the issue!

Now, I need to understand how they relate to
5f6bd380c7bdbe10f7b4e8ddcceed60ce0714c6d :)

One small issue: after applying your patches, I get this WARN at boot
time:
[    0.384481] ------------[ cut here ]------------
[    0.385384] WARNING: CPU: 0 PID: 1 at kernel/sched/deadline.c:265 task_non_contending+0x24d/0x3b0
[    0.385384] Modules linked in:
[    0.385384] CPU: 0 UID: 0 PID: 1 Comm: swapper/0 Not tainted 6.16.0-rc2-00234-ge35a18896578 #42 PREEMPT(voluntary)
[    0.385384] Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
[    0.385384] RIP: 0010:task_non_contending+0x24d/0x3b0
[    0.385384] Code: 59 49 00 e9 7a fe ff ff 48 8b 53 30 f6 43 53 10 0f 85 4c ff ff ff 48 8b 85 c8 08 00 00 48 29 d0 48 89 85 c8 08 00 00 73 0f 90 <0f> 0b 90 48 c7 85 c8 08 00 00 00 00 00 00 48 63 95 28 0b 00 00 48
[    0.385384] RSP: 0000:ffffb52300013c08 EFLAGS: 00010093
[    0.385384] RAX: ffffffffffff3334 RBX: ffff979ffe8292b0 RCX: 0000000000000001
[    0.385384] RDX: 000000000000cccc RSI: 0000000002faf080 RDI: ffff979ffe8292b0
[    0.385384] RBP: ffff979ffe8289c0 R08: 0000000000000001 R09: 00000000000002a5
[    0.385384] R10: 0000000000000000 R11: 0000000000000001 R12: ffffffffffe0ab69
[    0.385384] R13: ffff979ffe828a40 R14: 0000000000000009 R15: ffff979ffe8289c0
[    0.385384] FS:  0000000000000000(0000) GS:ffff97a05f709000(0000) knlGS:0000000000000000
[    0.385384] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[    0.385384] CR2: ffff979fdec01000 CR3: 000000001e030000 CR4: 00000000000006f0
[    0.385384] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
[    0.385384] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
[    0.385384] Call Trace:
[    0.385384]  <TASK>
[    0.385384]  dl_server_stop+0x21/0x40
[    0.385384]  dequeue_entities+0x604/0x900
[    0.385384]  dequeue_task_fair+0x85/0x190
[    0.385384]  ? update_rq_clock+0x6c/0x110
[    0.385384]  __schedule+0x1f0/0xee0
[    0.385384]  schedule+0x22/0xd0
[    0.385384]  schedule_timeout+0xf4/0x100
[    0.385384]  __wait_for_common+0x97/0x180
[    0.385384]  ? __pfx_schedule_timeout+0x10/0x10
[    0.385384]  ? __pfx_devtmpfsd+0x10/0x10
[    0.385384]  wait_for_completion_killable+0x1f/0x40
[    0.385384]  __kthread_create_on_node+0xe7/0x150
[    0.385384]  kthread_create_on_node+0x4f/0x70
[    0.385384]  ? register_filesystem+0x97/0xc0
[    0.385384]  devtmpfs_init+0x115/0x200
[    0.385384]  driver_init+0x15/0x50
[    0.385384]  kernel_init_freeable+0xf4/0x2d0
[    0.385384]  ? __pfx_kernel_init+0x10/0x10
[    0.385384]  kernel_init+0x15/0x1c0
[    0.385384]  ret_from_fork+0x80/0xd0
[    0.385384]  ? __pfx_kernel_init+0x10/0x10
[    0.385384]  ret_from_fork_asm+0x1a/0x30
[    0.385384]  </TASK>
[    0.385384] ---[ end trace 0000000000000000 ]---
                                                                                

				Luca
