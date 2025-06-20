Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11020107.outbound.protection.outlook.com [52.101.84.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BE7B18E20
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 16:52:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.107
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750438382; cv=fail; b=KFdq11cB8EkD/R6+L01LeWTAWKSwy6seNAjxj4Z8NJTsyzW7Hp75gnyJGQPIMAU3BNLb9g35xuS6QTXS3zwXb5z4GQ7N/BE++GsMi3V6Fbe+whSZhSQruTuv0n35Jks7MKEHbenbW7k5SeNEUDiSUi2Xu29h7g9FwHdjXplNcjo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750438382; c=relaxed/simple;
	bh=JLhgEsYJ5eXNyC9n051tQDN5NtqDBqqEblrmS+a+dPM=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=O0SsTtBiMLbwstu+9PYazTwu04sLkju5IMc/0eAq7djA3tbnUFtCeUglbqSir7dS+z80p7TFJdiZMgLrqdjchxE/bPo8UCEUazYTBrw5cV7+umMpJTkoPTMEOyZLD6Kd1eKV2cVEb0kkeM0wDMdNPBQaR5tE6vtvK4tLkigYxS8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=santannapisa.it; spf=pass smtp.mailfrom=santannapisa.it; dkim=pass (1024-bit key) header.d=santannapisa.it header.i=@santannapisa.it header.b=L/MDZO0E; arc=fail smtp.client-ip=52.101.84.107
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=santannapisa.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=santannapisa.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=santannapisa.it header.i=@santannapisa.it header.b="L/MDZO0E"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VNpRldd8w98iNtzd7Um9y6hChocbL520f0GUhlY9Hd1fSB+AetrCDkkdMQ9G9BiVMqIqlqRhA84KnhVs1El24L26BwCJUJ59vw81Tr3pcoB8CXAvnDrExSF2mB6aPT8DhZSRd+6NAiYfJ7OUYAWJrw163s2w3UzIeqq/4fxqsYo3mbpThvQs8iL2Uc3LRBhLlPEVvgPnviHd+f8AgZDtuoVWY3wkgVw/ZOAnfpOtWiRiUB/qvU9jTx7bIY5poxeps0ZNHMI6DDLFb2ftSkJ0wr3nf9YLBvxT9cvUFIVqf+1IXQk14K5ajptanYtbaQMAbvWvA/YoISBeZI/7jRwlJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MB4okZiKqbNP3RMtprhM1Ht8jALx5PEsX8n0kta4xfc=;
 b=MJ7QyPtrdNlnWXn08Ac5A66fULCBOEVH3mdkvNeLeeADs13qM4K7VHr9nZ/LN6hOaMomXJclaj4JUWR2qzr28CXg9vGj5vE2FGLcaAgVg7fYl8U6fye4ZtBmAtN8/07Fn/wAd6uM0NMLBHPTndAuBdVP8mkFFr3CMUF72xWjh5+4q9bS42gqt5ry/YiOBmTUf9CEgza8BEginwDYNrDXDwsSoyf1/JuMtsVEOAcF54fbBf4w/GDJDTjkzh6RBp/M15tMTHF4sSwmg+e++SJ7wXrUf8WJcG890k5dYbmPoa58qPMkroW50zfY6jg5VES20eNJlj3ZFQIXZWVa6TWR8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=santannapisa.it; dmarc=pass action=none
 header.from=santannapisa.it; dkim=pass header.d=santannapisa.it; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=santannapisa.it;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MB4okZiKqbNP3RMtprhM1Ht8jALx5PEsX8n0kta4xfc=;
 b=L/MDZO0EeA+RuXW8fwm75ON0XAAzqCN8LTEst7Nvf5sKtVU6DRQ6wTtWw89NzlSm/uSJyK5ID/SATk9qvRAE/E2riWLMbdaqRyOAYDCd+vurOEGeEzJ/486FBGeLxIC2naZaCDNxVC5RC/kyXR8nVyYpS6gxCY8f6WhQzPen7s4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=santannapisa.it;
Received: from PAVPR03MB8969.eurprd03.prod.outlook.com (2603:10a6:102:32e::7)
 by GV2PR03MB8802.eurprd03.prod.outlook.com (2603:10a6:150:b8::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.34; Fri, 20 Jun
 2025 16:52:53 +0000
Received: from PAVPR03MB8969.eurprd03.prod.outlook.com
 ([fe80::6bbe:2e22:5b77:7235]) by PAVPR03MB8969.eurprd03.prod.outlook.com
 ([fe80::6bbe:2e22:5b77:7235%6]) with mapi id 15.20.8857.022; Fri, 20 Jun 2025
 16:52:52 +0000
Date: Fri, 20 Jun 2025 18:52:48 +0200
From: luca abeni <luca.abeni@santannapisa.it>
To: Juri Lelli <juri.lelli@redhat.com>
Cc: Marcel Ziswiler <marcel.ziswiler@codethink.co.uk>,
 linux-kernel@vger.kernel.org, Ingo Molnar <mingo@redhat.com>, Peter
 Zijlstra <peterz@infradead.org>, Vineeth Pillai <vineeth@bitbyteword.org>
Subject: Re: SCHED_DEADLINE tasks missing their deadline with
 SCHED_FLAG_RECLAIM jobs in the mix (using GRUB)
Message-ID: <20250620185248.634101cc@nowhere>
In-Reply-To: <aFV-HEwOTq0a37ax@jlelli-thinkpadt14gen4.remote.csb>
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
Organization: Scuola Superiore Sant'Anna
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-pc-linux-gnu)
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MR1P264CA0131.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:51::16) To PAVPR03MB8969.eurprd03.prod.outlook.com
 (2603:10a6:102:32e::7)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAVPR03MB8969:EE_|GV2PR03MB8802:EE_
X-MS-Office365-Filtering-Correlation-Id: 59f90beb-0e8a-4266-9c8b-08ddb01ae5a7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?G0diGc+85IR+K238w79hIiro1FvlI1SDHDLRt9Cckc/sT2NMbkSg8iOGR5Sh?=
 =?us-ascii?Q?EY7VTZKYwJkpjEfWel9B9HazlCcXS+uyb97hzOVVaEF7wp1IdRQfbYl7tuBs?=
 =?us-ascii?Q?nLckWVblC1h/gqwQn2/RgwSKJVoRvo7gxQvh5IFbdaU9w2X/G+FwwfHw4Skx?=
 =?us-ascii?Q?WhZ78XoyFV0p3ty47ApGBThzQ654Ikj/X5RPxi+9/bF9XFsLphIJuAh1w0PC?=
 =?us-ascii?Q?1RQ1D6r4nwJGaIqWFz/m1tBc4f7KCL+TpDwD58u3tfwnF9dru0PObzFNRy3a?=
 =?us-ascii?Q?ynE9OXW5ndkKmWjCWQ/tvroARIl8f2TMArSeRl43yQyOG7URpeDDGSIJB6zK?=
 =?us-ascii?Q?BS7d557/dKNOYkM7HLq6m5I8pcEG4mKJ/xizgg8PXaWI6oFUDbHS8tnekscW?=
 =?us-ascii?Q?1KSNhPhmXHou3jeJpNTLV1YwK5im9GCa3RBYhDlTxF93Fili5OKjNEPKP+SZ?=
 =?us-ascii?Q?v6Pn+tDN2+ho3QHjzYtNuBhozTn00SxLjPaQEJYY/AJoDSL0VxkqBjsKa+Rz?=
 =?us-ascii?Q?h5l89QKJjsZyPGxFoAcWlOjP+WquPagttb9W00gVpGcv2Bm8uA3b1OuBPcnV?=
 =?us-ascii?Q?qYF9lVanQ4fWN0I0MsZRTWIVbonN7+WhhEyq0Gs6hRCUDj+5hGvV3tmADtCk?=
 =?us-ascii?Q?6enw7fG6ft3fN++TvHuOL9WZYO8phA4Sc3gpbZZ38lCzA6T1Ye+/dSyinlP7?=
 =?us-ascii?Q?+odX6iX4Zj9iaS+E1NJexQG5N2jhWmPQXza1MUnvTA0tBJSH6V6Vzo7ULQBC?=
 =?us-ascii?Q?7hYQeKYfB1ip4og0Til8vvscQGUlGTxlEMr1CT0H06gl93D00Hiqqt110dvg?=
 =?us-ascii?Q?ufXCHNjpsPnwB3oQMNnBh9Q3o4RAIumVuQQt98Wyhl5E7zKiYPbnW50ELcB5?=
 =?us-ascii?Q?5mUgOzwyEAFpBHLETjpo6lKdexvR3dc1fWSYOtl7W//qJTdubec1mIuAXzFK?=
 =?us-ascii?Q?n1N3S+QrB0tVmMZwtvsEI9eYdvZCV/lNpOagqD+1IDmbMoOraMWmT3HT9uqs?=
 =?us-ascii?Q?bLkrXuipHxzfDv5asq5qf51ezWinoY2F5k5gndXJqyO4kC3CRhlWP3ay/8kQ?=
 =?us-ascii?Q?WKaBqPZjfgN/5+y3XIHGvU+DZKmFil4P7gbAZc3BmE3mLoyqd9WnF6aYLQ9j?=
 =?us-ascii?Q?fZ4S3DKN3izxbH7OLGvQav0RcHdwdOygVbacP+J5+lbEuQoj5rb74PeXeDJ1?=
 =?us-ascii?Q?boRYg60Qb9AMsZj+7PGfBrImwSrC4azSpBsJlpygRA5gREWQDz40gFzjKkCY?=
 =?us-ascii?Q?WhsCAJBG8w7sjUVtXn5B8EfzCCTWZzDgW2w4sl0BWFY1p5EP9kb72bKaz0aH?=
 =?us-ascii?Q?BUP1F/K2CWyL0befSwgzfDs5kkxfe8OgZORsK98VF+iZ/9qofZv+N/FDSk3T?=
 =?us-ascii?Q?sc9TnVaR63MNmf6zb9TLDz4CMfvN3/craUQynqKyb/H0CYH7IhIJtILcQ2jB?=
 =?us-ascii?Q?5UQN1HZgkYY=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB8969.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?DGtAAG4TXw7HdZdNCI/Uvj2KlF3I4kG9FxHWNGnmuw5H4Hno3mhAMWMJ3+8B?=
 =?us-ascii?Q?YaEKdXcWtR8vk+LcPoQHca/qMsnu52a9awbPmnOJ7HJBFdruriNcMwx1qR4G?=
 =?us-ascii?Q?csautqYgOCZO4RngnyhI2R5UFwI3INaqPalYOR1jcruW8+/X/2DWtvbdnM30?=
 =?us-ascii?Q?N9MpyRVYHsS2M91nk/ntsZio2BExUjPbQFn37kJOPhoU475DxKYBVuvxPPgk?=
 =?us-ascii?Q?xszk8bvoT2faL7Aq+FyXhUvaR/ZoSzRQiv7DGJ0HlPG1ivGES1WPijS1GBSE?=
 =?us-ascii?Q?uc2AOyADCsBAbwRbb3QfjrGPDUv7Pmv8X6lwPmG0DXe7x1b2b47kxVogXAAJ?=
 =?us-ascii?Q?5zjiRXYerGpZMhB+Nf1REeoTJRv1jQjFFr+Hw5jf/gucUqI0/5dVU2fYtcLO?=
 =?us-ascii?Q?8PfyLdD5d5wuxT/wsQqhqCvJO35ksHCMWMlH9ntXpNMba4y59qxug7MDYB2e?=
 =?us-ascii?Q?BxF5+3/EcsvGm++uVMFFyG9mHexIdYd2DgIQIQjEwlLN7h29XdD56eTnN/+d?=
 =?us-ascii?Q?DcQcJeYRjOnvJ2E44xRg2HaKNmg6Ev/jsmZMAY+3tBA4Vk1JudK3p/WgG/8V?=
 =?us-ascii?Q?bwHNwBZZOjbmCRibXJs9yBfHdlczbJ1lFeK6IUsjy7NGsnIg2YJDUQUFk6rS?=
 =?us-ascii?Q?aioy/bzFgHdkCRiyTlxPAdK9/6/kc13ug5VyniXmxRD3EvOouBYbLFXyztbe?=
 =?us-ascii?Q?hKXZTYIey6DCkMTMGkb1/AFdRTywwZCtdZu2onVE87KdI9/jlfQRelSk1mkA?=
 =?us-ascii?Q?rb76AOAxXoVg0YvMAgn+ARZiGz/VTMKefkyBK7O5O8ONUmQ+vu5P6a0xuYaF?=
 =?us-ascii?Q?dRU1hGdnzscpeYEOSeKqfuz5I6RZ6Qp8tj4UYIp1dfHrhj4/6sBP0cR/ggjy?=
 =?us-ascii?Q?MGop0kYknrmd7ziBHCJ4Ks4HDultBO1CnN0rGm7r1cXpqgNWQB3ACVncAsuZ?=
 =?us-ascii?Q?OJQzP/l/dmGyam67uwOykeamHxPCebkcdgrnKTdI+a4O2E/MtfhqIUEjWJWa?=
 =?us-ascii?Q?MnOQ2E2ZJgv790m0dOJe8v17EDuWwvuEkrqf2kVq9wJpa015pXqbYV7sTykw?=
 =?us-ascii?Q?WwAjdFS9FPNCOithApNPtkK7SHaLzd0CHfjUehbR6HIkU8fn09Buf/9JOfgw?=
 =?us-ascii?Q?XW0WxuUnOQl4ZfjujTxs4yPn0j7yyhuwcb7oKtbDZbi3tWsuMTD9avG69793?=
 =?us-ascii?Q?iK+ZE82hdXIQ21rGxMLudkhzFLstiYm6TAR4e6UVm0ezj8cmSdhLc3YT/Ubg?=
 =?us-ascii?Q?LVXknh/g1IUNgN59VECmDyG2+jaYFNQxNc2HQkQG+PufisZ+D/lMGLmTykTq?=
 =?us-ascii?Q?6JFH1UoPgaR77qPdULJ22y1khodAem867bdwAgD9Q4oGO9ZqQujUiHvBQNpC?=
 =?us-ascii?Q?Ld5/2Z4bFhjlNDINRwqfydjasSQLAIpQn6UEnDoTKheH7tch0YPsRV1owl+j?=
 =?us-ascii?Q?rwioFTygFI65p3sxJUvdo42IubYd6bd3Smb1+c3uxsUtRY/ZnMiyC4yPTeB5?=
 =?us-ascii?Q?Y/Z/YXxRPmJn56K7/kPSdZPSRWRkwSS0DqqFyQRAD2NBk7BO5CS560BtnY1J?=
 =?us-ascii?Q?fbfUChEIgE7PyogRMnINqQUIYqFIoHj8zMv+hOt9Yc8XYaQpuoE3p0k+Zf9R?=
 =?us-ascii?Q?8A=3D=3D?=
X-OriginatorOrg: santannapisa.it
X-MS-Exchange-CrossTenant-Network-Message-Id: 59f90beb-0e8a-4266-9c8b-08ddb01ae5a7
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB8969.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2025 16:52:52.7231
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d97360e3-138d-4b5f-956f-a646c364a01e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yALhPiMq7Lt5rAPfiaQXiXsvUJCLdIKK4HPcnyzobjjGBo5Vev+rVJ4akJEzmSLDUlylkDP7VkUgb4+RS8+/NHGHIU+lpTZ6pZ5dsl6+M7c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR03MB8802

On Fri, 20 Jun 2025 17:28:28 +0200
Juri Lelli <juri.lelli@redhat.com> wrote:

> On 20/06/25 16:16, luca abeni wrote:
[...]
> > So, I had a look tying to to remember the situation... This is my
> > current understanding:
> > - the max_bw field should be just the maximum amount of CPU
> > bandwidth we want to use with reclaiming... It is rt_runtime_us /
> > rt_period_us; I guess it is cached in this field just to avoid
> > computing it every time.
> >   So, max_bw should be updated only when
> >   /proc/sys/kernel/sched_rt_{runtime,period}_us are written
> > - the extra_bw field represents an additional amount of CPU
> > bandwidth we can reclaim on each core (the original m-GRUB
> > algorithm just reclaimed Uinact, the utilization of inactive tasks).
> >   It is initialized to Umax when no SCHED_DEADLINE tasks exist and  
> 
> Is Umax == max_bw from above?

Yes; sorry about the confusion


> >   should be decreased by Ui when a task with utilization Ui becomes
> >   SCHED_DEADLINE (and increased by Ui when the SCHED_DEADLINE task
> >   terminates or changes scheduling policy). Since this value is
> >   per_core, Ui is divided by the number of cores in the root
> > domain... From what you write, I guess extra_bw is not correctly
> >   initialized/updated when a new root domain is created?  
> 
> It looks like so yeah. After boot and when domains are dinamically
> created. But, I am still not 100%, I only see weird numbers that I
> struggle to relate with what you say above. :)

BTW, when running some tests on different machines I think I found out
that 6.11 does not exhibit this issue (this needs to be confirmed, I am
working on reproducing the test with different kernels on the same
machine)

If I manage to reproduce this result, I think I can run a bisect to the
commit introducing the issue (git is telling me that I'll need about 15
tests :)
So, stay tuned...


> > All this information is probably not properly documented... Should I
> > improve the description in
> > Documentation/scheduler/sched-deadline.rst or do you prefer some
> > comments in kernel/sched/deadline.c? (or .h?)  
> 
> I think ideally both. sched-deadline.rst should probably contain the
> whole picture with more information and .c/.h the condendensed
> version.

OK, I'll try to do this in next week


			Thanks,
				Luca
