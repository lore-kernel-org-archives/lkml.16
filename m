Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11021120.outbound.protection.outlook.com [40.107.130.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D347E2BF3C5
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 13:36:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.120
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750772205; cv=fail; b=CtuXqqpxHivUXQYNNbfd6vI7ADFMIqiuLZX7JMyoPY5Worja4nNd24KXySvYBiVs/jmiBSelui+Dzk/9mxSXZ7GLG0qFA3htlGoRJ7G+wcZM0yKM8+AQMM8fpLggS72QixXVG8PtOtyCb4h211z/LSmeACRNCF0qFWhePxAocpw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750772205; c=relaxed/simple;
	bh=WwkyOzd9KJMWSd9STVZKyFnzdsuXmXgiJM0Gck6ZTpg=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=mjRDx79TQli0mm3tFbtnPHf/SdcmgB8/2nIYtYN30OTgDeGQTyKypYb74QV/6L0B58uDflO7ylhldm1tkDJgJpHictehIYsilSYFNn6FE7af/Y6HHWAR8cXBXiaxwqOlPPLIpcDZtpNqTOCIYHLBX1QZqIeRgN0CkEgntUWp+gk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=santannapisa.it; spf=pass smtp.mailfrom=santannapisa.it; dkim=pass (1024-bit key) header.d=santannapisa.it header.i=@santannapisa.it header.b=xPyS7qIY; arc=fail smtp.client-ip=40.107.130.120
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=santannapisa.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=santannapisa.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=santannapisa.it header.i=@santannapisa.it header.b="xPyS7qIY"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A0Ut+p6lEYBUX8EQ73wUJfxuHbOs16MFg9t54D3Kfm6faISXgUWsEtwDQqxQSwJ09DVgfUwH8BrOLrmREVTZjqRe1f0UNsPK9L9LBtFHmrXHu3XzWnEWg3Zr9ggz9ffFSLP8PpUlqSOokH9fVufREc8YMILCawy4bG/ELIySQIY9Vt+ZVD5e87La1SP68J2b2QTnfJ6JVzcFJ6fDa+M0gHjaf67OpyZJQ9qtzQDVNf0NW/ItsYKsQpw+sH6V5vXtjNHnXbyVOHjlK+tR9p6ybZP5NS7Ez80cVYFyV25e3cWXPduEMuSoEHKdM68zNDEUtPzwQ0UzTsXn/zXAZmvUuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FoHCZ6Y1blS5uEtsD8CWs0Wkfoxz/3VMk1Y05OwZVUA=;
 b=SPKEOG3p1plraqpGV9yFI4IvXinOuJC11/jO7jiU527RP5YBA2upVscON/k2I2Lm8Uc+8sOxbrdF0n52CBWeIiaLAX6OWtFv+B8EMNocVkczodFsUrGyzvm4kxaq42xn88UnkzXsiktBA2OAndEVyt7pQmvBSYjwC8YAi27fpRIdoOsQoCKEPne8491Z09z9iQjHZjACGO5bVBH3D7Kq84R0tHZg8JMUVoDPSBn2NGLqP4BeGRF7KsZ9lfDNKRUGhqo+R6TRa9g5fPpGFKx3JjLOBi43uIVaQduWuX+SMbv2RX+e3ycdwNdqFwEZ7FMgAKtFngS+OkP2ozHGqverLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=santannapisa.it; dmarc=pass action=none
 header.from=santannapisa.it; dkim=pass header.d=santannapisa.it; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=santannapisa.it;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FoHCZ6Y1blS5uEtsD8CWs0Wkfoxz/3VMk1Y05OwZVUA=;
 b=xPyS7qIYshOagJf6nY3/BhFPFVKo/9Bxlttlefk+RhNDxGyV9ogTl0MSJUz4g4B4lLrEyvxO38+1dUa3Mz9taAohRtvbbwxnwngxm9GKHl65AlPlFvxuTxEWNaloEYI5Jy8WeW1KSXkuEwK4Td0lZG4cypxllkK8VfSto8ou45o=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=santannapisa.it;
Received: from PAVPR03MB8969.eurprd03.prod.outlook.com (2603:10a6:102:32e::7)
 by PA4PR03MB6752.eurprd03.prod.outlook.com (2603:10a6:102:ea::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.30; Tue, 24 Jun
 2025 13:36:37 +0000
Received: from PAVPR03MB8969.eurprd03.prod.outlook.com
 ([fe80::6bbe:2e22:5b77:7235]) by PAVPR03MB8969.eurprd03.prod.outlook.com
 ([fe80::6bbe:2e22:5b77:7235%6]) with mapi id 15.20.8857.026; Tue, 24 Jun 2025
 13:36:37 +0000
Date: Tue, 24 Jun 2025 15:36:33 +0200
From: luca abeni <luca.abeni@santannapisa.it>
To: Juri Lelli <juri.lelli@redhat.com>
Cc: Marcel Ziswiler <marcel.ziswiler@codethink.co.uk>,
 <linux-kernel@vger.kernel.org>, Ingo Molnar <mingo@redhat.com>, "Peter
 Zijlstra" <peterz@infradead.org>, Vineeth Pillai <vineeth@bitbyteword.org>
Subject: Re: SCHED_DEADLINE tasks missing their deadline with
 SCHED_FLAG_RECLAIM jobs in the mix (using GRUB)
Message-ID: <20250624153633.6cb8dde8@nowhere>
In-Reply-To: <20250620185248.634101cc@nowhere>
References: <92690eb9158c1019dc0945f8298800cad17cae05.camel@codethink.co.uk>
	<20250523214603.043833e3@nowhere>
	<c91a117401225290fbf0390f2ce78c3e0fb3b2d5.camel@codethink.co.uk>
	<aDgrOWgYKb1_xMT6@jlelli-thinkpadt14gen4.remote.csb>
	<8d6dd3013b05225541821132398cb7615cdd874e.camel@codethink.co.uk>
	<aFFdseGAqImLtVCH@jlelli-thinkpadt14gen4.remote.csb>
	<880890e699117e02d984ba2bb391c63be5fd71e8.camel@codethink.co.uk>
	<aFUqELdqM8VcyNCh@jlelli-thinkpadt14gen4.remote.csb>
	<20250620113745.6833bccb@luca64>
	<20250620161606.2ff81fb1@nowhere>
	<aFV-HEwOTq0a37ax@jlelli-thinkpadt14gen4.remote.csb>
	<20250620185248.634101cc@nowhere>
Organization: Scuola Superiore Sant'Anna
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-pc-linux-gnu)
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MRXP264CA0038.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:14::26) To PAVPR03MB8969.eurprd03.prod.outlook.com
 (2603:10a6:102:32e::7)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAVPR03MB8969:EE_|PA4PR03MB6752:EE_
X-MS-Office365-Filtering-Correlation-Id: e92d3004-fa2b-4a04-7bd5-08ddb32424a6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?adL1856ihPUFytCPbXlkDQ5ACRJ4PtEgQ6KHW1ngUigJ9XFbZg2zQsSCGwlL?=
 =?us-ascii?Q?trZ/CauIX3h9iVMdoktCaa8klxrcEkFKfbS72erhpl3FzxqhKI7h1H/lXPbd?=
 =?us-ascii?Q?YRbZzbrtJkpdYW3gLlqjS9H+c2fN9ajCIs/6FkjnVszySNB7ZXn4DxwOVOKK?=
 =?us-ascii?Q?FDg59/6tVpzivMjqNseu76nBm20RWJAAqOqJlPjDJ3Qy5wEnr+5t16bjIVC9?=
 =?us-ascii?Q?XgM/qrVm260Hdr83xNkT/OARc7zw7My2IWhkZ8R5t0PHEXEpe8vYhJMLtdkS?=
 =?us-ascii?Q?mbWVSjWEKOVUBRzMNKaryDqy9lG4Y1TfD0s1sJE4hyPev86yS4iX1HR/OiES?=
 =?us-ascii?Q?EJtLH6R1c4mMpCel8acPBqGrczAMB2Gz8v060sLDCUv6wgd3npqvdNd8viUn?=
 =?us-ascii?Q?bOKTza22iJpx4LAhGTazAv+zC38W1Ck29IKMPUFLNoB/RcDWOqH/dz12rFhE?=
 =?us-ascii?Q?A+UEQpDNVgAwh1LR9cWSPR5WWsDTue59QXrLFjReO555o1OFnTMvFxQyZSdw?=
 =?us-ascii?Q?bYz3GtjGIILZ8Oik2Ogu02npxzqmaqb/Mpr/PyQO+7RGKvvibHJhzW4JM2nZ?=
 =?us-ascii?Q?i16BTy3jfeH1WM2PvSnQdpKMG0Ckp2YHmFUgyp+hpr+0TKtDK9vt3lioVLLa?=
 =?us-ascii?Q?fJnPGvgyqocqynYm+cpykzLvM6vpNDeITm8F8jkdsiCHCmjOql4aeVS7juiv?=
 =?us-ascii?Q?dPhmxsz5WdQsm52xZ2OXe7I6i9Q0BTdRbXBFFZlym+A3ZSh9w6QKXVJgmK+5?=
 =?us-ascii?Q?TpF+w6dh5jdOn4X/NGbNCJ1NsmNGLn6BIBa2ZalKm8Tykdd2RMfLK7ylpKbM?=
 =?us-ascii?Q?wpRnbdOLRVE13+SKH6gYJHm31HNIK2hU5u68qfE5sWbIl9Eh4jwc1NrXBeaY?=
 =?us-ascii?Q?2lheKzklqWWO8W0WXlg+O70SSqz2S4rwWpvgbBse60LMZyk5XyX3v3VrcxlN?=
 =?us-ascii?Q?9WK5Yvnr/tDQFh+yum8zgd5uUDXbV4jPldg8kft4eEr+8M02cMT8D8YQBBv7?=
 =?us-ascii?Q?5Xf4j9eGKjcbM9m7N1/fsFp4aRfLhaDhGJMryEfLJtDrWdrNWcVA8nwkFY3a?=
 =?us-ascii?Q?UVK6d5C1gW59Vp3557K5MloboJKvOQDqX/ykUsPEXufpvJ4xhx5oiZx2fB4s?=
 =?us-ascii?Q?QSO231oj9Ma5ZFxS7fPI6LWhQ3nIiWdSC7le8Vzy43tk6Rqn3qEFPCFKj965?=
 =?us-ascii?Q?ZMe0HnWXfxg+BFvaRJXfLAYzTB2mCFV4O67P0CcEltiMlK4uvFR3L5kn3Glw?=
 =?us-ascii?Q?oHI2zaxzdESdoAcFnzwsukwJH1dtZMrWRw49sSUcpIVp7gzlIjq2ntRe2D5p?=
 =?us-ascii?Q?URXyZ1rlC8/REiS4HqoyHMzch1xLcFTlVHIxWGklveqsQkEKpE/74wRii7uG?=
 =?us-ascii?Q?kZOMg3vhjYhioyMwlqpLQN11dM/npd0mVVTk1Twu8yzT6x3J/jmmP1gEKLgZ?=
 =?us-ascii?Q?iuc0Wnev6/Q=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB8969.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?PMPPzqgBdn9m6bghK4DqSHpLbiOdq0F42RlW6HoTz9qXMvYNVKUoBac2cK2b?=
 =?us-ascii?Q?mAzTHhSgb3N/ORMIVNPlYaNw0+/KX/tFMlNiTAtNwKXWQyd/NqUIu6dcw9cT?=
 =?us-ascii?Q?3kTgRX4x3UY+SrnilLEGN58hgLClua9U140Cweglapds9jeE1Tp5M5pNklgx?=
 =?us-ascii?Q?iBP0DWpT8lm0Rf6sJgJRO/DocpGW1Dx0UaZ9+xlRbf8bb+hNUilo+NoGBFJM?=
 =?us-ascii?Q?rUOXljgsjIBmvT7tJ9iRYqMxojzWu42Fz1/VbTnTgOHgf+pC9DdHVbo+NFW4?=
 =?us-ascii?Q?0A3Hq4GkwTJuN6UGduK+ZgRt3wlMJOt+b58s4C/BlAvjaJqgdN6ixvdSiOPv?=
 =?us-ascii?Q?vEnDidcHtGVGLLpCzXtkaVZNFvAcpeC7qpjuDI22p3wpDtrS3infFNffJiKC?=
 =?us-ascii?Q?HJXiYgW85B/HpEEPHkBrREfzIiRsbR42pSH4C6iuo0f0a54Hu7PuPkdp6RRk?=
 =?us-ascii?Q?VLAq1BspgYifvfDS3xGY05QLHHEQ5xzWDVsUnvQEnBgeP+f80Fm9P8eIL4cw?=
 =?us-ascii?Q?QO7iYGVxiDUmI9psYpaYnxl3BCCGSoh0oNV2bSyoCweFkdbKLEue0pWFElVX?=
 =?us-ascii?Q?93QU4Xdwy13zfCmptXRhNs2Y1aDmZ4CdqolJP5drU47Ndu/AXQ4du56HNk56?=
 =?us-ascii?Q?Og9fVki5n88/c69/FEOEJMd4GcvTgdZhAHsAh6oWOTARLAUCPtNChTMC9TKi?=
 =?us-ascii?Q?nUnSaC/cvH2rxVSlqwktQJzJNn/eQYvAl4kP8fTvi56RHGjTeCNkj8kyaoQg?=
 =?us-ascii?Q?G1TmFVgVmiiP7N0WEY8eT8ILAsD0nzzr81MRxGtTnPD17EO0+bHG9r52QGWk?=
 =?us-ascii?Q?VXuEIByPAQQlQi/JeGjFPSjDX6H62uw/xFEQrd+QdRDzJVzlwGD6ciKZhre2?=
 =?us-ascii?Q?iyroeIptXVi1JUKNS15+t3VoSNm6jwh4xaw1xrmmCGhHuvZU9j0niQBq+1VK?=
 =?us-ascii?Q?2KX/dwA3kqSRPkPADw2ljMgll7+u6e1JB+0OqutPnqVYCMJWPh0zmDrVshPe?=
 =?us-ascii?Q?b0Jma+rj16BvMxtjPc0euGs9BT8J8RmiZkVOvtYhr6/YX05KIySdk1Hn1OlC?=
 =?us-ascii?Q?tho0XW8PbvsCtSZgAhXCniNDJ/9ShK1fePtEBFY4zIyC6dFZAV81fLY4I98R?=
 =?us-ascii?Q?YJIn8zoIx4XMlgSr+/ssTtR/Szm41Oaam6aEyBlJuPg9G3QEMe7X2nDnvxWn?=
 =?us-ascii?Q?pI5Njizse0fvndL3REAQ9Sx7fBKvPmMnIvFVIBuTPPm+TVbEy1Em67L19HFj?=
 =?us-ascii?Q?CsYLB08URo82MW43MG/QCDeIJqgot5qHQQbttePwvvEmxkVCCjqex1uzdM2C?=
 =?us-ascii?Q?xTmh4oT+fXN8hZF6zOKwawN4a1ZeJkPsR9TNoyWUQagMZC7cP9O69DC8/ap+?=
 =?us-ascii?Q?8vSxkbkfzb8yIwZNUeKBER/GfuR57gU0RwQ8i4bpr3I7uXz3NSKYauFCGHCI?=
 =?us-ascii?Q?yFhniv2DgeFmqmNlb15DxJ2GmDigvIWPhzrHIeCclByJMD1trgmpDDSCCCoc?=
 =?us-ascii?Q?t9puPD6eTq7JkYTuzi86B133sTHF8gbZyVWoFcf5CIOYn9T/HGM5shm1BlUR?=
 =?us-ascii?Q?zcdz1bwQwcVB83zeYp90MvgWMuWewc6+zr31XH80Bs07iGT9uwmURqGtSxG3?=
 =?us-ascii?Q?uA=3D=3D?=
X-OriginatorOrg: santannapisa.it
X-MS-Exchange-CrossTenant-Network-Message-Id: e92d3004-fa2b-4a04-7bd5-08ddb32424a6
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB8969.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2025 13:36:37.3874
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d97360e3-138d-4b5f-956f-a646c364a01e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4Sm8NwpCQzk0avtfOudU4IrmvtKHpESeMyAX8lmjpOeuV9db/IxefgoECBf3I2U9FktmBVpu6WgOVKL3AwWgknk3lGsWry8/4jg6gosmjTA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR03MB6752

On Fri, 20 Jun 2025 18:52:48 +0200
luca abeni <luca.abeni@santannapisa.it> wrote:
[...]
> > >   should be decreased by Ui when a task with utilization Ui
> > > becomes SCHED_DEADLINE (and increased by Ui when the
> > > SCHED_DEADLINE task terminates or changes scheduling policy).
> > > Since this value is per_core, Ui is divided by the number of
> > > cores in the root domain... From what you write, I guess extra_bw
> > > is not correctly initialized/updated when a new root domain is
> > > created?    
> > 
> > It looks like so yeah. After boot and when domains are dinamically
> > created. But, I am still not 100%, I only see weird numbers that I
> > struggle to relate with what you say above. :)  
> 
> BTW, when running some tests on different machines I think I found out
> that 6.11 does not exhibit this issue (this needs to be confirmed, I
> am working on reproducing the test with different kernels on the same
> machine)
> 
> If I manage to reproduce this result, I think I can run a bisect to
> the commit introducing the issue (git is telling me that I'll need
> about 15 tests :)
> So, stay tuned...

It took more than I expected, but I think I found the guilty commit...
It seems to be
[5f6bd380c7bdbe10f7b4e8ddcceed60ce0714c6d] sched/rt: Remove default bandwidth control

Starting from this commit, I can reproduce the issue, but if I test the
previous commit (c8a85394cfdb4696b4e2f8a0f3066a1c921af426
sched/core: Fix picking of tasks for core scheduling with DL server)
the issue disappears.

Maybe this information can help in better understanding the problem :)



			Luca

> 
> > > All this information is probably not properly documented...
> > > Should I improve the description in
> > > Documentation/scheduler/sched-deadline.rst or do you prefer some
> > > comments in kernel/sched/deadline.c? (or .h?)    
> > 
> > I think ideally both. sched-deadline.rst should probably contain the
> > whole picture with more information and .c/.h the condendensed
> > version.  
> 
> OK, I'll try to do this in next week
> 
> 
> 			Thanks,
> 				Luca

