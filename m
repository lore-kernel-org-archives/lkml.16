Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2066.outbound.protection.outlook.com [40.107.220.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7375228C005
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 14:45:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751294742; cv=fail; b=NFmJD8uY2wMLFk/19/6idkp7BqE9fwgGgrksuy9jtzX97HKKSfv1LedhuIka1FOttNjr0/v28h9U/Y5ohCmTDJrVoJnyFB5NMgdRODcfS+2Y72uwdZmV/Q4tc483H4Ko4HjoM5ZQnCDtADcpGhZctKMzJqPGS1+X+j6Jc8OR4u4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751294742; c=relaxed/simple;
	bh=xpJa+f2qzL2ZFQTc9In8mrRij77m7cwQmL84Br5EMiM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Whyfzff+ZukGkZelcuSgm8mosvHB+gKtOcmBUIkLacALhS3yH9jWboTqEOVlg7CEYEL4UoTn8PdBttNp0zyHJbiUFKFGzXoWMY/DXbuTU6D2RvlXVNj+iCik1maHEIF5cNMj3wmKfWPAEg163GQ4FBb1Pa3aCAW8TnmeCZRQMIE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=i/nBP3s+; arc=fail smtp.client-ip=40.107.220.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="i/nBP3s+"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eTVCQRAy6VLa/HrgOIV4YXPteY+8xKtzA5ESqRibMaejcn5DkTR78vKENo8AQTMGf10ZxUtFR58H25+etkhtj3XZ2U9OhBev+uMBFeERvKBlQbh+eDcUYVdViyKFDX/wXj9W5C6mpkYhEVUmtzif41G8S1DUTbfZrwoTiwPXf+/aGFdUETI9iyiOIH5wsiB9SkxLLaOYaHNMeqAGoGXvI0xda7PUBMuJcp2ZgoGrAIUC+xRPCXY/0LJYq75PZAfcZI2KMv7afGI9SD55NBfHp4wLvOh30X3LVfgFyqCy08XXag7iYE+Bgqm6ZwLfPvPboN2qDaKJejFVZB2/YrQZVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pqv259gIvnh9TV41J8pkGgoqyLd+R8qzKzR/YsNROno=;
 b=OAlkZz0dWr5wRhHJID6aY1Oc6o7waoDSRqdzhaGV3i/kZtRruqI1/Aq6J0KFLP6QgA0KB+ZkRkR2jMBQGkPCbntaX+hUvoOOoxvEixFFxFx7f4IM189zAAYSCPhgfDlii3+5RDjrea8/g59FZs4U7wbGH33/M1gpttHLgKuJGequZgk+89RmVN3gfwjw5fgniVAuUvRahgK2gpalyRtp2Judsgxla/wf95dvhkoeEM1vFMhELyW7H0u0kFq5bHLQmwTFBGMcLi2uQUNMKrckEHeXo+5rVUYoAfR27vROQ8EavC/SWblpCu9PcDZeadqzjqL1sbWAga5jhfl17SfCZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pqv259gIvnh9TV41J8pkGgoqyLd+R8qzKzR/YsNROno=;
 b=i/nBP3s+BnbdEVPbBX0FJRXN5+y9VmdU+GuR7+lTwLQGlujWIxItCHwu6oJd4OmDyXhtcpvY/gUVe5rKQlCAxO1f5RQ8sPcLKwUi5QT5QNHC2kly3tUxPPl8RpUcWCgYVBkvFlu5/tuCkt6yi3/yQF3n4TRNTwJ+3yRGrJGikX7Y3g60XIPSMkg0byuGnax25+FZSUA031xWuqtJKGOdD7l/Z1D/pkAu1tx6FSddahBwunVVWCr+QdHmRk2lmzwYKZLcPK6nstsaY3nFb7SfRdkg1cDuxlsn2UZAEuHHB2UvluFgeJHHo6ongwOy9AovtnDcOY6RGt1FkBjRcgoXEg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by CY1PR12MB9649.namprd12.prod.outlook.com (2603:10b6:930:106::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.29; Mon, 30 Jun
 2025 14:45:37 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%3]) with mapi id 15.20.8835.027; Mon, 30 Jun 2025
 14:45:37 +0000
Date: Mon, 30 Jun 2025 10:45:34 -0400
From: Joel Fernandes <joelagnelf@nvidia.com>
To: Juri Lelli <juri.lelli@redhat.com>
Cc: linux-kernel@vger.kernel.org, Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>, Tejun Heo <tj@kernel.org>,
	David Vernet <void@manifault.com>, Andrea Righi <arighi@nvidia.com>,
	Changwoo Min <changwoo@igalia.com>
Subject: Re: [PATCH v5 04/14] sched/deadline: Prevent setting server as
 started if params couldn't be applied
Message-ID: <20250630144534.GA2439051@joelnvbox>
References: <20250620203234.3349930-1-joelagnelf@nvidia.com>
 <20250620203234.3349930-5-joelagnelf@nvidia.com>
 <aFvx-z7Dd_0mYMeg@jlelli-thinkpadt14gen4.remote.csb>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aFvx-z7Dd_0mYMeg@jlelli-thinkpadt14gen4.remote.csb>
X-ClientProxiedBy: MN0PR04CA0002.namprd04.prod.outlook.com
 (2603:10b6:208:52d::13) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|CY1PR12MB9649:EE_
X-MS-Office365-Filtering-Correlation-Id: 09170df8-7d3e-46d1-b972-08ddb7e4c69e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?nCN26WlVClU3Uvr6eWWRZfpo3dD1j5RbWuMwD8ghaUYaYwBq8FYHE/RLA8kI?=
 =?us-ascii?Q?e4bsVaDUm2HkX6Bf8SEPdnI6lbd9mWGMlWdkrLANrV77TBJ+zTeFSGhKWiVI?=
 =?us-ascii?Q?xcOwnrZMJE0pZ0ZADBKtlHJ4vOiQDccJNkU77OKKBrLlY9113ou7f7mgMzAj?=
 =?us-ascii?Q?MYLOmUG1rhlAc0nsPDxdgI1Ljb0yImGWlEEqwcSbISPTMttWqmp61KtgyHgg?=
 =?us-ascii?Q?xeNlDEaJMFon2PznByvPiaSlk9L1yhpmp5CknNvi1Z7O8DU2uv0QNEc+SXLL?=
 =?us-ascii?Q?02DU1FI5gAmZegIfKOCWM2kcFTj1g4SYQ31LaVoudAXdZLqRXHbK5euga3Qw?=
 =?us-ascii?Q?g+NeGFTiHMIdAjF2B1RfRH6fGthRV3ueFXie5zyrjTbaBVKK3StymInMZ6J1?=
 =?us-ascii?Q?JDITyOSpLu562YizyERpXQe22M1AIM0RTvG44wSe2bBPaCPUUrtL0dzclBgM?=
 =?us-ascii?Q?HU9HzUlo//8qH9erDYzxlydVf1uBbJW9EZFVNoOpU0JgM/wClYhnLDnNC5oq?=
 =?us-ascii?Q?tM8sdijNhW2EShrqryw9gKWS5To1gR/SICACy9jjLfw6pJA8MzAV+gWQVW4U?=
 =?us-ascii?Q?0mJKEKGnHcGv9qik5/pXvm5l1wb2CC/59W0IhVEnd4t7/SOUCV3LZZhtYdJ0?=
 =?us-ascii?Q?NtZ0I4HqUNtcmX1LFZ5xhl4YtUO7gCbe75Zq47Y3rtjhorHHDxDSgB0ghZvg?=
 =?us-ascii?Q?R7hbA4/Errw5dcwtOC3CV6pXelSQORnU91RG/H7/hXF6yq/NOao6IYwIUQLF?=
 =?us-ascii?Q?feOCrArZkBVqLmV/VnNVR/iUgh0ioX6BDfCWjVcjcFarkIOuz6MTEctTGp38?=
 =?us-ascii?Q?5c7UiGcKJdJ1SLsfAKciXkDo+cxXcwSn3NeATIkzgch4UcfsV/RIms+hHmv0?=
 =?us-ascii?Q?Y0P9uXYhVQacUn2HrIPK4KvtW5jkGeOthTBjdFQapAnTzi7VyjtRIe4bu5wj?=
 =?us-ascii?Q?ViO5m/DKPr4SweYm9v2x8KZO5JvWXL09ZSSrIveaoy6l7ZHnmN7esD9+PbRw?=
 =?us-ascii?Q?hVQrZCkERhuMrAcgg5ZGy3Yu7hrcUSGpQRApxBgBjtNaq93VYe1fMxTDzuoH?=
 =?us-ascii?Q?8/ySAcP+CA7GUdZ8DaoZRO1ywS4Vofzajd8G1I1vfzxfxcOAaiL2PavkDISS?=
 =?us-ascii?Q?ss0+J57lEb+uUqKXwiGTVL0he7cmDfV2lmQ34Xeepq1nY2ItNSQwm5YCmfMT?=
 =?us-ascii?Q?bchzSAq7Y+myB2GSnoOPscy6XXquc2E0ZDS6ZJwvDRWPsHizsezFmuO5pTYY?=
 =?us-ascii?Q?lEonNuaUGaUmk0BBZUas7v5bZ+FcFpGuYT8lj0H1DpkPXz0PBYhGBl2fzMyg?=
 =?us-ascii?Q?017aMtI5HgHpdEgzkNE7yX6it4OGczy5yULOZ/0Szk5F6WcHKzvebzQ5FWpm?=
 =?us-ascii?Q?E2DT8s0L6AR28AJ72I/4fyY6bx2uRV7D/IPwH6n69iJsecnELbQ4xi/j+LU/?=
 =?us-ascii?Q?bK7un4bj2fU=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR12MB8059.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?y168WBkjBcTvX9Qt9I2yj70gQRjk1FDZvpQvx+V8irlz+kW2Uylo/FQEN19F?=
 =?us-ascii?Q?OPylSGIhQoyUeljTUWyfxJb8wCWltveXxv/qhkZEjCExlVFNjYfW8Wszcxan?=
 =?us-ascii?Q?iiYIMPZObC11K7t3ORS4cAe7TPcAYApO1aFsget0ovXU7A7VSFivXnKTmhg5?=
 =?us-ascii?Q?0yux+8Rkm5a/Mbu2ABUeNHvrAFomtP7CAirIh1Xj9wgMi5H6SgtSHb5Lod8y?=
 =?us-ascii?Q?a6SlOz73GUj5zcvHdpOo2GTMInlfoHPFSS4fBTv9r9K2RxodjBC2cs/4qFI4?=
 =?us-ascii?Q?DlbWjMQIzvK/3g8cB1Ao2TyxLyqxpYDAVd61L7N7SYqRpsd9r6LDFG7RfRCG?=
 =?us-ascii?Q?dIhnrG5iuAyX4jM/MMsd6ozm35v2e2nTZH1p4zpEdnZgyr3YbeGrQuxP/OzW?=
 =?us-ascii?Q?Img8emjNdeYG1Qjc2D9ZCGOJAKfhuLi0gj/9odM8Qv8hDKcjGp3v29/FhU5L?=
 =?us-ascii?Q?oYfCGfj83D4E3sTmln2NXOdoilKxo56v9qnOGfwp8szR/+QFr5YcylhPKJEe?=
 =?us-ascii?Q?Acphl3hiJFblSQ5bo5nerdUMErGbycH/vMPUMH2WPGNZAg8CcuCw5sBHEp7m?=
 =?us-ascii?Q?mRPK2fyxhJ2z1QAMv9/KmNSDbO7QHy1BnZltefolFpeuAqGyIwHvLVEju5td?=
 =?us-ascii?Q?PJWSIsjaz95gj82zgjJONuo15SAf9n4VUvjXLkjY7PUWWJFe6HLYSBINUgir?=
 =?us-ascii?Q?yVt7kOO2LvL/zY7oIgWmYF69SIdCWcnvXKcBQKdtnmUahZJDbdEk+vUIAFt3?=
 =?us-ascii?Q?X+kMLSgVq3QSYh9O6bHVlQggp6m3rGsyFuPxJl2eyrzHRNwvbLK9Otj42lBl?=
 =?us-ascii?Q?giNnikceeP1SPxucreMq4iQjVl2ypgFuJIOh+r0AOWRJdgCEePbdM/hZs+w5?=
 =?us-ascii?Q?xXbKf6NIXK0KBeoU4KZ0YHHL5qWlcalMZmiFv5rySHOuwdZ6T2ZgDIYe0HzI?=
 =?us-ascii?Q?FpwwA+CqF1eRsTYAWlbN/OV1RJf6BkxeRyictRSA902bf60lfno/URZbcREx?=
 =?us-ascii?Q?vO5iM7jyNw986irLlec7cvIq9SfYx6Yong0fwR7ZmX0UT3JNoxDnZ9fBLJDF?=
 =?us-ascii?Q?lzKm/3dRyfe3sOYCGtdTDbQu3wPNOz2xPfVox9EGxNrFET0bPa920LHmWnFX?=
 =?us-ascii?Q?JFmiLLaMAQIgQCx6XbvOecuc3DNFYg4wCG/Ex7vCrBCMeIYdRYtmQJSH2OqV?=
 =?us-ascii?Q?HA2RdeIHjL5VKp37VereuCXWhQjPAB48IYpWgdvxrth6ItfIQ5lGjI9QKFyv?=
 =?us-ascii?Q?FOf9w5vqmc2R4vrET9FJdLYBl8hXk5tzFwlQncDFqoBHIAnsaleQeNuO3bPN?=
 =?us-ascii?Q?MDSuwo1urb+shHu1Aih6/uHhbVK3UzkONVADdPIiQVMGnWtw4cTxbQhkEOt2?=
 =?us-ascii?Q?ToaT9W+7B67fNVORGAFuYVuHuof6DvFZzG9uX8srSUuQ7cn7Fjd9XfjjDv8J?=
 =?us-ascii?Q?Fc5ZSJs9176dDFHieTqYZgBI5ZCSksoSApCi5poZu5Bhpowl0NzXW9GzvnJ6?=
 =?us-ascii?Q?rG3Xeenl+7fACF73nHTfWVrUgZ91lYba1zpUQC42uCUIIxB/q9bzdZ0rDr4B?=
 =?us-ascii?Q?rv1V7mBQ1t/7+8oXScv33iWa/pD5xhAb/uZGCk0d?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 09170df8-7d3e-46d1-b972-08ddb7e4c69e
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2025 14:45:37.0546
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: siaIAsoB2a8i0AkuED4Hx5V9lYw8MfPZe6FSZHf7U8yleuUZC9Tcu4a6glebSREDFlaruKFu4QbHBDwfAHxIWg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR12MB9649

On Wed, Jun 25, 2025 at 02:56:27PM +0200, Juri Lelli wrote:
> Hi Joel,
> 
> On 20/06/25 16:32, Joel Fernandes wrote:
> > The following call trace fails to set dl_server_apply_params() as
> > dl_bw_cpus() is 0 during CPU onlining.
> > 
> > [   11.878356] ------------[ cut here ]------------
> > [   11.882592]  <TASK>
> > [   11.882685]  enqueue_task_scx+0x190/0x280
> > [   11.882802]  ttwu_do_activate+0xaa/0x2a0
> > [   11.882925]  try_to_wake_up+0x371/0x600
> > [   11.883047]  cpuhp_bringup_ap+0xd6/0x170
> > [   11.883172]  cpuhp_invoke_callback+0x142/0x540
> > [   11.883327]  _cpu_up+0x15b/0x270
> > [   11.883450]  cpu_up+0x52/0xb0
> > [   11.883576]  cpu_subsys_online+0x32/0x120
> > [   11.883704]  online_store+0x98/0x130
> > [   11.883824]  kernfs_fop_write_iter+0xeb/0x170
> > [   11.883972]  vfs_write+0x2c7/0x430
> > [   11.884091]  ksys_write+0x70/0xe0
> > [   11.884209]  do_syscall_64+0xd6/0x250
> > [   11.884327]  ? clear_bhb_loop+0x40/0x90
> > [   11.884443]  entry_SYSCALL_64_after_hwframe+0x77/0x7f
> > 
> > It is too early to start the server. Simply defer the starting of the
> > server to the next enqueue if dl_server_apply_params() returns an error.
> > In any case, we should not pretend like the server started and it does
> > seem to mess up with the sched_ext CPU hotplug test.
> > 
> > With this, the sched_ext hotplug test reliably passes.
> > 
> > Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
> > ---
> >  kernel/sched/deadline.c | 6 +++---
> >  1 file changed, 3 insertions(+), 3 deletions(-)
> > 
> > diff --git a/kernel/sched/deadline.c b/kernel/sched/deadline.c
> > index ae15ec6294cf..d2eb31b45ba9 100644
> > --- a/kernel/sched/deadline.c
> > +++ b/kernel/sched/deadline.c
> > @@ -1656,8 +1656,8 @@ void dl_server_start(struct sched_dl_entity *dl_se)
> >  		u64 runtime =  50 * NSEC_PER_MSEC;
> >  		u64 period = 1000 * NSEC_PER_MSEC;
> >  
> > -		dl_server_apply_params(dl_se, runtime, period, 1);
> > -
> > +		if (dl_server_apply_params(dl_se, runtime, period, 1))
> > +			return;
> >  		dl_se->dl_server = 1;
> >  		dl_se->dl_defer = 1;
> >  		setup_new_dl_entity(dl_se);
> > @@ -1674,7 +1674,7 @@ void dl_server_start(struct sched_dl_entity *dl_se)
> 
> I wonder if the above will still be needed if we move dl-servers init
> further down (later) the boot process as I am trying to do to fix issues
> reported at [1]. Also, failing to apply parameters at boot is not very
> nice I am thinking. Wondering if we should WARN or do something about
> it.

I will add a warning as you suggest. I think it might be still be needed, if
for whatever reason, the apply_params fail and we end up warning? I think
your new patch should also include a warning.

I suggest, if its Ok with you, let us take my change unless your patch is
getting merged soon'ish. But if your merging is imminent, I'm happy to rebase
and test again, let me know, thanks!

> >  void dl_server_stop(struct sched_dl_entity *dl_se)
> >  {
> > -	if (!dl_se->dl_runtime)
> > +	if (!dl_se->dl_runtime || !dl_se->dl_server_active)
> >  		return;
> >  
> >  	dequeue_dl_entity(dl_se, DEQUEUE_SLEEP);
> 
> Yeah, I ended up adding the same check as a fixup in my WIP fix series.
> :-)
> 
> https://github.com/jlelli/linux/commits/upstream/fix-grub/
> 
> 1 - https://lore.kernel.org/lkml/aFvLYv0xSXxoyZZ8@jlelli-thinkpadt14gen4.remote.csb/

Ah, cool. :-) 

thanks,

 - Joel

> 
