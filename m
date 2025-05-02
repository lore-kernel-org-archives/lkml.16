Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2114.outbound.protection.outlook.com [40.107.21.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A64323C4EB
	for <linux-kernel@vger.kernel.org>; Fri,  2 May 2025 14:10:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.114
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746195046; cv=fail; b=BEUz9FVhHdBUO7AZj01MlaGROWkpckgxixH9jL1kXx1JuzTwgamjGcxQUKNSBA6ePr5kGQE7vsi1aTYiePsaek3r8E+Qu+1b7VdnZKiUszqYeDoWEHO+FLndsSDavJzcvCJj13aWFoM9HSE0b4DwPB/lbLJnJ4mQFsVrlCLDYvs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746195046; c=relaxed/simple;
	bh=WXWDlxprorH2JxW3r83v20/IU8C8xfOtxA3J704Bo10=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=VlqBFnQMEcCfgR987JGqqf1FuT9KZfwFLMqojm1yDsCKG8flAORB0e8DSZIARLRQ8Y8VHlYnqnk3bQAIpsZpjQTigXxul00ul8sKd7cYcsm7ZDQaEqaujqWXdLs9BaoO1xrZuamNF8Ce39V4he3vk2fP+0d/8QXVmthE7EppdnQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=santannapisa.it; spf=pass smtp.mailfrom=santannapisa.it; dkim=pass (1024-bit key) header.d=santannapisa.it header.i=@santannapisa.it header.b=zejJkvtB; arc=fail smtp.client-ip=40.107.21.114
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=santannapisa.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=santannapisa.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=santannapisa.it header.i=@santannapisa.it header.b="zejJkvtB"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sqfTNS2wPS4xDgyfkVBDKv3GAagOudOb2GEn7YFpXrvS8++NCm6L6c81UrY+LZUtFqIzGUK+fzCwlDDHJuPsOIU5407ZodXji2k2JDonLfttFCm20SGAtoKoPB8Xz5pUii4wUvSSXX914y2Pwu3EghP0l4uNN/PQ1J2nywqFY6ixzMGFmsWF1IKd3a/uNjRdvCqGc9i3pTEQ3IaOIlrW5AqAxyGPklNoztDaGdX1CDewI/KMr+H2O0fjaT5dl47Jwnn4Pvorl59z0UfFVAAAHwU9R8IFKmI+Wh0Pexx4jvrOcwLEahjhikxWeiu2lqJqLqL0etdSQOTJiShHU+5Feg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0gtluTCqGV/uVpFyrzKIe9gbrhiw1+X39T+3/wndfyc=;
 b=U4oTTLn6AzsY6vQebMt3o6lbZQ39L2Tgb6SZ7QeFHvBkfSPYC1CPu0QkG5tiBWFDZNR2ClyppIfKVYj+L3hcfYYUHSD634d8aJJGAjFibi2tnV9ZUgBF5Y4KsfFQUgERlKUBj8R04fMsIqU8xunelbwW/kjyzpSaFbr8niEwDqi6UIxPKsU2G9AW1bkOfm+Gj2I7X8AgiV6bRUj+VcRJbFcfkd90GeYo5VGS5qNNqsOxGeHy9Z39P4oQ/5nB5W2zHcNCVSSf8PxSUsHc02DqV4B2ODS8zNoWQJZ1SExHAq28WmyG/h60DHPflI+03PChoGVRNPEdcmGwYSby8mp4Vg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=santannapisa.it; dmarc=pass action=none
 header.from=santannapisa.it; dkim=pass header.d=santannapisa.it; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=santannapisa.it;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0gtluTCqGV/uVpFyrzKIe9gbrhiw1+X39T+3/wndfyc=;
 b=zejJkvtB+w9KBhi2HV3Jnz3/izD+ehidqJ/HH2hUKCSjBen52nuMPYbI9xVNNy3sb0+s6Eu2Ns23Sl2GGjUjYVKZtb4L4Jvzg6p9q8Tsb7cfdcPZpvvJGigYfM+0Ty0hi37PTpSFCIk5Qf/QSrm8fTD0gzbSvD2Y6gh9p5e8vpA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=santannapisa.it;
Received: from PAVPR03MB8969.eurprd03.prod.outlook.com (2603:10a6:102:32e::7)
 by AM9PR03MB7442.eurprd03.prod.outlook.com (2603:10a6:20b:2db::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.24; Fri, 2 May
 2025 14:10:37 +0000
Received: from PAVPR03MB8969.eurprd03.prod.outlook.com
 ([fe80::6bbe:2e22:5b77:7235]) by PAVPR03MB8969.eurprd03.prod.outlook.com
 ([fe80::6bbe:2e22:5b77:7235%4]) with mapi id 15.20.8699.021; Fri, 2 May 2025
 14:10:37 +0000
Date: Fri, 2 May 2025 16:10:33 +0200
From: luca abeni <luca.abeni@santannapisa.it>
To: Juri Lelli <juri.lelli@redhat.com>
Cc: Marcel Ziswiler <marcel.ziswiler@codethink.co.uk>,
 linux-kernel@vger.kernel.org, Ingo Molnar <mingo@redhat.com>, Peter
 Zijlstra <peterz@infradead.org>, Vineeth Pillai <vineeth@bitbyteword.org>
Subject: Re: SCHED_DEADLINE tasks missing their deadline with
 SCHED_FLAG_RECLAIM jobs in the mix (using GRUB)
Message-ID: <20250502161033.1ed7ddef@nowhere>
In-Reply-To: <aBTO3r6Py_emwf1Y@jlelli-thinkpadt14gen4.remote.csb>
References: <ce8469c4fb2f3e2ada74add22cce4bfe61fd5bab.camel@codethink.co.uk>
	<aBTO3r6Py_emwf1Y@jlelli-thinkpadt14gen4.remote.csb>
Organization: Scuola Superiore Sant'Anna
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-pc-linux-gnu)
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MR1P264CA0165.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:55::13) To PAVPR03MB8969.eurprd03.prod.outlook.com
 (2603:10a6:102:32e::7)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAVPR03MB8969:EE_|AM9PR03MB7442:EE_
X-MS-Office365-Filtering-Correlation-Id: cc1affdb-837d-439b-f53d-08dd89831cf4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?wG02h7zxSw9bh9WdkZUb0KoDRQvgLMOLLS8NJPiS+FJE/PMxQemge4vqDcVR?=
 =?us-ascii?Q?U84CbxPfV4U+Z20/hP/fD8NqnlaDBhgEhEA/rRPpG6rK3v5kymWrBuVdqQwq?=
 =?us-ascii?Q?oXLLuGX7Tn+JBVO0DLXCOdxotX6gQftBUL+j4I8+7pz6A8kLweh/fJmPcKgJ?=
 =?us-ascii?Q?vYhtMqhRnAsl9Su4wR/45CDONl0C5laCwbzTV5GIrg18i5YMUCPcqS1hRFH/?=
 =?us-ascii?Q?bUJESaLU3QSRbNrNkH4DUWbF0Tj1dBEKoXXM/PeHqQC1+g15njIe323wbTy8?=
 =?us-ascii?Q?IU7sKekkzbFV2QiO0x5rFc0gSMU8FsoBppSfmdHJRkH77YDcGeIJXdZyfNjO?=
 =?us-ascii?Q?a6Ft2RkyuOjcmtbjdhpXZPn7t/vqTuP5DnLQ6JKLEZyaz5l++8+MqXBoe4MC?=
 =?us-ascii?Q?CWAFgsmNfV/KI0IaE8iTKZ7yxpAewMF536+KqghBNCdF29jjEBONAun+dLXJ?=
 =?us-ascii?Q?XhLfhGD7MfvPa8gvl5cT5sdP+LaVkxYj9taUp0ruujZsP4Yw1Dos+dO+dbX9?=
 =?us-ascii?Q?hV++Z2kZYW8Md1+qaPogIIbPvuxyGteNeTozC17tY7ox02K6cYjFH56Lxow/?=
 =?us-ascii?Q?KxcV9gsr5HAM5gXUGtVsf5oFhlcF48DPWtUkddORC12agtE7O6iXloXVnDPm?=
 =?us-ascii?Q?TPSSTSVF9pFv2KNKnfEOTOO7/L0aGEL4oexjSpXYeEVJfmoDBNWqBSxpsdDY?=
 =?us-ascii?Q?r4slnrQ2PN0JInfLu1OCAF+M+rIqKImmKd1S+XLDOhOikauxchoZX2PoWxnB?=
 =?us-ascii?Q?DEkJYG/ofm9JtuYG45u3hopLych1NDzhyMEKNoA2p/8yS/S0lghKrTGz7IW7?=
 =?us-ascii?Q?F1xInQIm76oHEhuBGzUKWHcNr+kBmKJsDlnYV8Z4a6RVcgNWxQJtxFfQiyAN?=
 =?us-ascii?Q?WnUbLsBb08f5X2IVJ7bLoRqEXOoPo+/13Fsk3bUPmgf93F1fpxBGI7j6Artk?=
 =?us-ascii?Q?hOoUji19eZ8zJA6TcnP9CxynHbo+4fApjZ6rxjSS1i7aW5ILo7mz+vAd7H77?=
 =?us-ascii?Q?quwo0Vt5mn7M665dZ5o61oBGKpSoJNrr94ghWT4ofPssxz28rXh0w+bwtp/9?=
 =?us-ascii?Q?QoZSef1/zwvLwHbRUywPa23BeYthx+XSFdrrjNw+xdrVVH2ubflIZY2EHAcp?=
 =?us-ascii?Q?H47u2xMuus5EbJwoCpOre6We8JezvcuKOkBXKYIHFkGYBa5bov15US9ChPVd?=
 =?us-ascii?Q?B7rUhWSTscUzSzNFYYJmmRjBfii66MqhFC4ALLArtoLHMEGBYfjDjM+cvwtH?=
 =?us-ascii?Q?DsEH89JZ5piJR/qqJx19g9+2RIMZILlA2modEhwmvNM5VfiVa8phO+6F19B7?=
 =?us-ascii?Q?EAQd4XQ08mpFyYUDymrD4MfYfOihMR7ltX1TMlypYqxCKzdpdTRC0eghRJv8?=
 =?us-ascii?Q?BXXseNJvd6aGks7X2MelR4nCK92sbRhLIZX6+hhedOx5K90WD3r9mDwy20sz?=
 =?us-ascii?Q?e9CHlVIZmCI=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB8969.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?XAW3FziLGMlJDvilEJszFpMn2NmQsIbJOLFbzhdYkRSpJ4UTqN7eC2lSnAaS?=
 =?us-ascii?Q?EdANlZmRwgTtfBNItPY8lLyOn/i/raudMWYlPBGH6ISPkPAmtobHfAcBSz1Y?=
 =?us-ascii?Q?O3/WmBlN5R0ovP1G6eo7uIhYvbGKNPshNJIuyhlR4Rz4BsWXvIrcQ4WWjjny?=
 =?us-ascii?Q?fVYAtMq+1Ge22rY+x/y5yRCpGyiov5q6gxObl+cqbVzWO6AluQVS42eZGhA9?=
 =?us-ascii?Q?UctQDnc81FU2nv6RpPjc0Zxgtn7y7fIyqojLFoaatHKOWszpk567m3iKC5XO?=
 =?us-ascii?Q?FxNHjYrY+UsuNvpPT5FSsmggnrkoZeNGQRAeRtIrMlfHos6CwPt5eyslLa6q?=
 =?us-ascii?Q?NGaFNFMXFY7GY5UTrdkcIH9K1xSRFi0/idEz8Y5OYebIs2HCCvXGTJvJIzdG?=
 =?us-ascii?Q?HnMpaF+HX309y1jJKa0tCCmjpBENMj3TulX86PpFR5Q5xLrbvsw8BEQA5OSu?=
 =?us-ascii?Q?rITig/jtwem2wIabykV7eUvlWdSvdaRVv+rdBVwYnYSWBAD/0RWhbkx50Y8R?=
 =?us-ascii?Q?DyTpLX/mXE8AEy1Y1jPvJxj2cFREuCV9GCsDlTmljSsBhnVGgtN6SHqI8LlM?=
 =?us-ascii?Q?ji6wOGtDAKOeZTGJuXQt8Cr/gDiHrOZH5SSVvtv22ZkDdukxt4tcFA99Dj4R?=
 =?us-ascii?Q?pxYF8s+2q+uSDE49e0oAmxpusZlCntWhO+KLeIs8MLE0BeGig5zC+pnxqCAo?=
 =?us-ascii?Q?I38vwYCm4V3cmurjwkf1RLMS3xgSFEI3k8QUk6qAoj6Upg1iw82BOKHxXs4B?=
 =?us-ascii?Q?jI3U4DDnpR1h2gMN5HcVK/+A7fZSMbjfnvZuzf/UB1F2T0dxW9FM1P7iJsyS?=
 =?us-ascii?Q?uHOLvmZ2kB5IfPCxNSlZn0yoBgB6Xohvz+B40Ih/I70Yn9fNZ3OMU1vfMpCV?=
 =?us-ascii?Q?1ewT4cSCvpJ4lydpyFhrrBsjAQy2VKfvieewG1DjR0Lwk/6iYleuCb0mMfav?=
 =?us-ascii?Q?SWXnoYgiV1xLGSy2wmMuuYaKMIndDEwjwfAG2t3rcc9XtG8mHG3/cYmZkjnn?=
 =?us-ascii?Q?iWA2M6UZyN6UeiP86w8cnCSN5/denVibKs9cqfEAKSeyb/3QzAoCDG3m7+jU?=
 =?us-ascii?Q?LZThZ4LCGh44N7RhqqC7YjlV1whRpy6XCt0z0KKBUfvLjGiphweqx9dXl2ia?=
 =?us-ascii?Q?YfmwzJ4y9IdtGdGrhlesvFVeP/vFSwrmjJovOG7yko3+0DbaaMFC5ph7ScUn?=
 =?us-ascii?Q?D5VJ5YOdSh5xyfMT3aYeNLlS+p5ciiO4laE5EeAmUkwZ9/mH6CIaetX0D/cE?=
 =?us-ascii?Q?PHcP3jeu8EoBfQRBvpxGJEY/HiIJ1R12RaZ/OSA7PIbh5BUbYT5562YcvP6F?=
 =?us-ascii?Q?H0I2oema2ddVg7WFW2yTUjwgr5OAsrtOlhS1HIRYLIXU6F7OXYqjdXu7EmTU?=
 =?us-ascii?Q?BLE4Q95gJKCgf5I5qMKLPI3uUllJBVyrpRFPxY0N5+23Vx6b3mnGjgdgijEm?=
 =?us-ascii?Q?UahMQxXwg3A0N8Z8q4Vu+8PIWivmuREhUwqVotWBXIflshk9izt0OmnbVmmI?=
 =?us-ascii?Q?Uki9rcU4s9gLGGopdaKAZ6ibqfgWr5T0C5MuK/XX6yLPxW2xydf2YtLAm9aU?=
 =?us-ascii?Q?mlhwvZ6G0LBugZ16FMYJ8zx7YhAjDkgmIfBdSp/Pxl/bzg0EhS8kALVE/hn7?=
 =?us-ascii?Q?Xg=3D=3D?=
X-OriginatorOrg: santannapisa.it
X-MS-Exchange-CrossTenant-Network-Message-Id: cc1affdb-837d-439b-f53d-08dd89831cf4
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB8969.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 May 2025 14:10:37.7251
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d97360e3-138d-4b5f-956f-a646c364a01e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OUVRs+2NTEWqI1JSJS6N1ji74RDBpvIsCBv6niAFQL4lwlXvV+0L2w57yXktNMqnNQxpiHdWZwXuSEd8dWwlfRAdHpwVvB7MRIn1fl0stjU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR03MB7442

Hi all,

On Fri, 2 May 2025 15:55:42 +0200
Juri Lelli <juri.lelli@redhat.com> wrote:

> Hi Marcel,
> 
> On 28/04/25 20:04, Marcel Ziswiler wrote:
> > Hi
> > 
> > As part of our trustable work [1], we also run a lot of real time
> > scheduler (SCHED_DEADLINE) tests on the mainline Linux kernel.
> > Overall, the Linux scheduler proves quite capable of scheduling
> > deadline tasks down to a granularity of 5ms on both of our test
> > systems (amd64-based Intel NUCs and aarch64-based RADXA ROCK5Bs).
> > However, recently, we noticed a lot of deadline misses if we
> > introduce overrunning jobs with reclaim mode enabled
> > (SCHED_FLAG_RECLAIM) using GRUB (Greedy Reclamation of Unused
> > Bandwidth). E.g. from hundreds of millions of test runs over the
> > course of a full week where we usually see absolutely zero deadline
> > misses, we see 43 million deadline misses on NUC and 600 thousand
> > on ROCK5B (which also has double the CPU cores). This is with
> > otherwise exactly the same test configuration, which adds exactly
> > the same two overrunning jobs to the job mix, but once without
> > reclaim enabled and once with reclaim enabled.
> > 
> > We are wondering whether there are any known limitations to GRUB or
> > what exactly could be the issue.
> > 
> > We are happy to provide more detailed debugging information but are
> > looking for suggestions how/what exactly to look at.  
> 
> Could you add details of the taskset you are working with? The number
> of tasks, their reservation parameters (runtime, period, deadline)
> and how much they are running (or trying to run) each time they wake
> up. Also which one is using GRUB and which one maybe is not.
> 
> Adding Luca in Cc so he can also take a look.

Thanks for cc-ing me, Jury! 

Marcel, are your tests on a multi-core machine with global scheduling?
If yes, we should check if the taskset is schedulable.


			Thanks,
				Luca
