Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2040.outbound.protection.outlook.com [40.107.93.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1877B79C0
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 06:37:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749623879; cv=fail; b=j8lAUzaCsFhMo+j6TnqrEMGKSCbQuV6RkXvS0t8q2/2QqJ0r4CJdO40vcZ3QtPc4hrs9QkCE5X9TUe2UtOJ4Nnb3bZnY67he3hz5s6vjg1c5Jap+IlnCYlu5BF/XA4/khaFKec7GViaS3xEkTA7xDc6fO7GnyC9jP7lYhOWX41k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749623879; c=relaxed/simple;
	bh=MJFCTtZe7mdl6LcNMJF2G6BMdN6DU+FOQE3CMl/2Ot8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=MhwiT8qSta+7ci4yJsIDTApYJ4r2+sKdqa7wkLNcPRpHt6Y5veIVp2VogRlmlom6BheBvvE+1xR9e19fveFd8zXJUew0wNM/3VsDFFlVi5quk7u8pEn5jJxS/zkzqg+f9+acGpzcG+63gWR0fCmprcSQd/ggakTQDov1piZATgs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=oI312vM4; arc=fail smtp.client-ip=40.107.93.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="oI312vM4"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S95TDkFcnWO7xfyJxBkTodlDd2lFPRN1hb0j6mGiCHqi6C05grFvMZRfL69pnWa+Nk44oLArcuiYv060SzKWmnnYtSpxPAiRKKY59bpaeVCnxiOPQmKYV5tgAAE2eFvkcEWPRvnfjvmhFHU4VpiC9vNOkYfeq6KnmoEYqm/XCqCqmapDuIc8W9ztMuj//cJaTSJvTYz3WRQ+yHTDARpSyzoqXMjo4Q7vfuAe7l4DcOj6PCwGrlYE68zQcHInfvFKDUiHH4YEV5vjcNCuWLx1g5zb3/a+X85s2I9/az9CKJFanfGRlz81H6cI/b3kGpXAzE9W/9q2zIbah9Gtqy2EBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F359gV1j6HvAzCUHiMDNB7Wml+/hQc8wqijtkpawxPE=;
 b=gYhIVQ8KAL32T8dPMlt90MxhCqo4lRkg1E0LOltFH13jhjv+y9wD583NqRo35IJTZtCYAmpW02jCo5rnRNgG5+Bh/zTtBjVZRrz1Y+SbJBNtC9hhAOupZv2Pg+NWwZ1Tga/KToeWKbgPTkpjuOmsHV5xN6YufBqd4oVNXiKpfdJv/ShtW4dJhvNzA28UmKY2tLia0xIyS1bHpOVpmPVefWa4U85B94eNS1Y0ZJp5O4VLJyZplsYAhyKBhK/sRWKGPC6EGbzBcN8JArmFjHKY47N713lBkvcVKe1L8uwX1h1oRmO2+1l9xcC84sP33npKkJO906gr5kJU3p9e+HtLAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F359gV1j6HvAzCUHiMDNB7Wml+/hQc8wqijtkpawxPE=;
 b=oI312vM4Ky6RvWJ1u646r+cOKIMLsuCH/2KUnNxUyM3+7rZYVFdsdPh+CSMBpzy+1tsXv7lEV0BfUmEUl8PXCH1FYIULZBIyZWiNW6KrXTG8r08o4zonBNjH2Qbks+uob918w9z/x1qW2tzTLEPyKlAhPcXvA659yK53lv7ezftC1AYJmvPyR3zMsFuvxtXVQVbhB0vinFTjSOq+6r8Tf15TF4sfP2yIYGWfFo5kMcgyk7Hl5RuI2pXNajwUa9PZ/JlSfoqRWV7YH15o+USQh1vYqy8crn6iIZE7NfpsnDPCO2wf3p7ySnUeJIY1bC/5+kflqTUeHAkcH4sftW2gbA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV8PR12MB9620.namprd12.prod.outlook.com (2603:10b6:408:2a1::19)
 by BY5PR12MB4242.namprd12.prod.outlook.com (2603:10b6:a03:203::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.39; Wed, 11 Jun
 2025 06:37:52 +0000
Received: from LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::1b59:c8a2:4c00:8a2c]) by LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::1b59:c8a2:4c00:8a2c%5]) with mapi id 15.20.8792.039; Wed, 11 Jun 2025
 06:37:51 +0000
Date: Wed, 11 Jun 2025 08:37:48 +0200
From: Andrea Righi <arighi@nvidia.com>
To: liuwenfang <liuwenfang@honor.com>
Cc: 'Tejun Heo' <tj@kernel.org>, 'David Vernet' <void@manifault.com>,
	'Changwoo Min' <changwoo@igalia.com>,
	'Ingo Molnar' <mingo@redhat.com>,
	'Peter Zijlstra' <peterz@infradead.org>,
	'Juri Lelli' <juri.lelli@redhat.com>,
	'Vincent Guittot' <vincent.guittot@linaro.org>,
	'Dietmar Eggemann' <dietmar.eggemann@arm.com>,
	'Steven Rostedt' <rostedt@goodmis.org>,
	'Ben Segall' <bsegall@google.com>, 'Mel Gorman' <mgorman@suse.de>,
	'Valentin Schneider' <vschneid@redhat.com>,
	"'linux-kernel@vger.kernel.org'" <linux-kernel@vger.kernel.org>
Subject: Re: =?utf-8?B?5Zue5aSNOiBbUEFUQ0hdIHNjaGVk?= =?utf-8?B?X2V4dDo=?=
 Fix NULL pointer dereferences in put_prev_task_scx
Message-ID: <aEkkPNKtS9tRnkgR@gpd4>
References: <dc2d908cd429473a9d46255272231f38@honor.com>
 <aEbO3DmwY4Tg6HT1@gpd4>
 <4f5b6cf9dca0492aad16472cbd49a528@honor.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4f5b6cf9dca0492aad16472cbd49a528@honor.com>
X-ClientProxiedBy: ZR2P278CA0061.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:52::19) To LV8PR12MB9620.namprd12.prod.outlook.com
 (2603:10b6:408:2a1::19)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR12MB9620:EE_|BY5PR12MB4242:EE_
X-MS-Office365-Filtering-Correlation-Id: 65d78a30-fea5-4084-c036-08dda8b27d39
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?E7gc3/SG+Xewh89J4uwMP1tJfCRPqr33Q6zfhj+6HwIgBt8jI3xL4IH5oUnS?=
 =?us-ascii?Q?OuEgkp/a5joPqp5Pmoqfmgf+bmC2BwU2IYRgXnMWE8i0rWPWSyiR+SPH1lu+?=
 =?us-ascii?Q?oxj4Ut7RqPIe+FRfKsfrGh5iRf9DcvNGPei22APgn8PoJqCtF9K5N9I2iY8E?=
 =?us-ascii?Q?WmexCjhqG0B2QF15AOZy3WDLPqXrvmh9hLMVo7DfuIj4UE/qD/1WP35N4xn7?=
 =?us-ascii?Q?d4zipBofYzRec8zVZcur3FAR18U+0OIzFejKlGZnkPzp5WLcE5cD3YQikIQa?=
 =?us-ascii?Q?4ZqS4OhNNwnt8QiMMsS2iP9hBjssuTUz22HWNFSkgIoOYtrVOgX5G0HZUT2X?=
 =?us-ascii?Q?WGYJqiCdOptZvGUxvQWj8kQW7ruUP5iZbjyWQUB3TFt3kbJ3cVuaos4K5QE2?=
 =?us-ascii?Q?Q1H515ImNEyeI1jS7JXWTuGWDZNysNGGcDxL/xVzFS9Val+gEEfYOorljjvD?=
 =?us-ascii?Q?zRBYnezgRsadpvIGTX9ElyU3+slSM1EwhvOrhQdPowQ15VxmBCwOJ10+4Sur?=
 =?us-ascii?Q?CY6mUH45tvp4jcepCg07yTuRQP5WFpCsn9b6RwYPsItaERkcf3eqUk62l8M6?=
 =?us-ascii?Q?qilyc0W2pghD2U+x1UYeN9x63LA6/wvwuF7L7cB5D/IZ0r8mnGX2oYA7e462?=
 =?us-ascii?Q?klPqib8feuTie7T/o52ua9SwmGy4AEXwGo0lAY2TILOT5em/6/q+Sl4ZCflj?=
 =?us-ascii?Q?IvardELEyI4W2Omu3IkCjyGp1tiR8UUC4F0k6E90PNpTsbhNhymsOKsNM2KI?=
 =?us-ascii?Q?5GzNRL5WGWH6xphtuIORbX1Ko+d9+pTu+OaZCSU+prQA9K9mXgX7l76GxxiC?=
 =?us-ascii?Q?CcRLG5t09G4v04HN99VWEruBnleUwOwIQoNcZFZUWelhsYufE+yPvwojMOiW?=
 =?us-ascii?Q?5dFhRykpNNRO7cUopiHATYMCYVFI/UtN3i00PyOTtNMWhT3u5Qud1ybdj+xD?=
 =?us-ascii?Q?cSlQF9DsN8XGs/chH71PDHuY/syMuxRr2MpmcIKnf9PCk2Yq/3G1Ll+aD1uI?=
 =?us-ascii?Q?nmrfWdFnbQdyOGGTEqrQiqi29QQG1kv13koAfzqISNAtFSdlsgKWjZ2QcM8S?=
 =?us-ascii?Q?AdkEHlV88zUq0rZEeIlFid1LdGx6TTwenV7lKSV+Vw++Ghn/WNYItzyBemia?=
 =?us-ascii?Q?PJzbvei+G6M/xAUwphgCzBiMjSK9BVhpd36nbzyVofJYZl37bHYZxk3HheF4?=
 =?us-ascii?Q?0JMZriC+HKrJfpUF/wlP+5QQKUVEbDBh0odwPQxi6On62NOKe00ka0bf3Q3x?=
 =?us-ascii?Q?ySmyL5zlb1Qi35n9GmFDhU3oRaz9Osw7QiqdUJBWBfs21v6RQN+lck+jJd7P?=
 =?us-ascii?Q?W5em0Rpunynv7x3hTEgM2oVRO/iECHtR0OsFBdZzd0CQFTAGjrINrmCbdeyq?=
 =?us-ascii?Q?INe049FFi0huKkCVmzejwSGW+rqtyJF2ZLuh9VDhqaY2SOYoUNUF5mq9S8VY?=
 =?us-ascii?Q?DnYj890TTYM=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV8PR12MB9620.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Pfwz9bCYCjNKYkemnBL/YOC0uu3LwUpljA67L/NiqnWYFyK1T1ogNHE19ULY?=
 =?us-ascii?Q?DmPnWXn7iNaZJr+oZCmVHt8+PhPV7V3culUYgcLsikJXkWg8ifLH+UKPiS3B?=
 =?us-ascii?Q?mBCc73Perl7DYmIvsq7y9YU7qiUpFmog6ParIgMrTU0UGy4AZ93ViR29Hwcg?=
 =?us-ascii?Q?vQ3FCp6XmLxJhvWAMJpO/QfzbzcJNUoGgSDJMnohUM7Q1u9osj1vWWcsS4nx?=
 =?us-ascii?Q?XnZrJcpMkuKlvoZ8H/hBopo14W+lOo8PeDvIZOcSFQPPmVJAUynLQfLc5ygZ?=
 =?us-ascii?Q?3ZEmvDUR9mv4swSeuT5hVtYNxQPW8c9M1TKNkh1Sope9DhwPKy3vNA3Bd3HV?=
 =?us-ascii?Q?ON2kgkBSZoYbKsalyz0HGNM4QtBdWisomxDtNECSMfO4atfRBIYMSNo3TJ0v?=
 =?us-ascii?Q?bILG+otfTtthpDpwkIea3ARP6pHKh+CFo9Sf2c4YLGa7lFzpOfykm5JjDaOc?=
 =?us-ascii?Q?ph1LEydrM5HxFWeSz1Ct7ljKK6o3msieSozXkzta7IIZi4bpaOfgYEmUmXtU?=
 =?us-ascii?Q?NfjueOGJguQmMVa++JTG7uS2C+XXm1pv4jp5QgxtM1ReBfvPV2V8A6x2V6lI?=
 =?us-ascii?Q?YiSqdsKIjD5KeVf9M0Vvn9JNWknAQA6WRm9A3hYUKjXqrSxqVfEO5ZOF8IY4?=
 =?us-ascii?Q?HeI88uKqtXd2TMnwKbG1Zp0iyHjr00b+9sAzMZ1f/m7LZkOXG+yXcYw3el/6?=
 =?us-ascii?Q?bGG7S0ZqujoXshok12SdjyqVVsUcTmNFs0dxfjz0NbCM7tF0ETwdm6rzOkSW?=
 =?us-ascii?Q?O/GJh5khUeA/WfknmgXLSTBJWprEpaPoLnFzLEidn6lRKNVyto06tFX55Jpx?=
 =?us-ascii?Q?M2XLmwRydJJRMLBenTZz+tIw6qGAa+5YuWXTMvJBf7txKUq5/qCl6pqzOJda?=
 =?us-ascii?Q?oM/P0Ws9FahyG+KVgvteSCEoY1k1lqbZf0kSX/l0vcoc8OwsAxJu+KqZkdpY?=
 =?us-ascii?Q?b5lK2YkykZ8nIkpcfQ6Fa+CnfEMjfZVr014+JYHw3pZAn+gRolZPOwEftKTW?=
 =?us-ascii?Q?Y5zP0nKuHeRigA+NHcXRm4F/0IKmIV2MiwVWaCIEBzRJ8kv/8bXPUYQ+02RR?=
 =?us-ascii?Q?nZi/eN/v6eC7jHfaAMAkxTVo+jD8vbJ2kl4F9R4Siue81qiEWmiHiEuEJisy?=
 =?us-ascii?Q?6Xh25ROj3lKYIQaMO7gAGGO3UDi2UbHWh35wg7teLzlLz77U4WKECjUKQJnQ?=
 =?us-ascii?Q?r+7yixG2UEhzuoWWA4a4qxbxp0hbxYMUQPpPYR7TdxaBRxj+bNLl98j4drab?=
 =?us-ascii?Q?j+ljzaNmNNYku9u+4I/UdwasR7zAJLHNSD8lzRJjL/usDAonSyJKKmR0Cgvb?=
 =?us-ascii?Q?av2UjBZJNXuCFlUoM65K+silQl/XUXeLBLDk4uWrO3UDEIR5XHL+JylafJou?=
 =?us-ascii?Q?8jIrGnmkl7LzwJE/JgkTNetOzg/WMfr41aubBQ0j2D3zoZ78JS1qIHkQju1W?=
 =?us-ascii?Q?T5YuJfmSW5RQiKrR74Ft+PA+EibvXHSHDYyuuNNO19rvo7g4bF2iCZre1CZ8?=
 =?us-ascii?Q?T61iXCbEfr8ZSu+r5XAzXuDgzNz7VpAWZUutMT85M6sl0+q87hkIOpYYHOIu?=
 =?us-ascii?Q?8hM9XgSxxPFov2I2YjuhPR+Rkysh4NT4W6ChZNrP?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 65d78a30-fea5-4084-c036-08dda8b27d39
X-MS-Exchange-CrossTenant-AuthSource: LV8PR12MB9620.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2025 06:37:51.7775
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /aB/SzQz6GvCCyB7xshtlLaHZ6m8hMFINZ5+w3JcWb4wOdKyaCDVMf9s3p/a4x3bujqdybdZfbbHmUeWv1xoVg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4242

Hi liuwenfang,

On Tue, Jun 10, 2025 at 06:22:22AM +0000, liuwenfang wrote:
> Thanks for your feedback.
> This is triggered in kernel modules developed In the mobile scenario: 
> tasks on rq are migrated while the current cpu should be halted for power saving policy.
> Its migration logic:
> drain_rq_cpu_stop -- migrate_all_tasks :
> for (;;) {
> 	if (rq->nr_running == 1)
> 		break;
> 	for_each_class(class) {
> 		next = class->pick_next_task(rq);
> 		if (next) {
> 			next->sched_class->put_prev_task(rq, next, NULL);

Can you do something like this instead?

  next->sched_class->put_prev_task(rq, next, next);

this should give you the same behavior you're relying on, without requiring
the extra check in ext.c.

> 			break;
> 		}
> 	}
> 	if (is_idle_task(next))
> 		break;
> 	dest_cpu = select_task_rq(next...);
> 	move_queued_task(rq, rf, next, dest_cpu);
> 	...
> }
> 
> put_prev_task in this function is selected to update util and statistics info for each runnable tasks,
> here they are not dequeued yet.

I see, so it's an optimization/workaround to update utilization info
without fully dequeuing the tasks. Is this out-of-tree code, I guess?

When you say the CPU is halted, we're not talking about CPU hotplugging,
right? We're just migrating tasks off the CPU?

Also, if you're running sched_ext there are ways to exclude certain CPUs at
the scheduler's level via ops.select_cpu() / ops.dispatch(). Do you think
this could be a viable solution for your specific use case?

Thanks,
-Andrea

PS https://subspace.kernel.org/etiquette.html#do-not-top-post-when-replying

> 
> Best regards,
>  
> > On Mon, Jun 09, 2025 at 11:36:15AM +0000, liuwenfang wrote:
> > > As put_prev_task can be used in other kernel modules which can lead to
> > > a NULL pointer. Fix this by checking for a valid next.
> > 
> > Actually, put_prev_task() should be used only within kernel/sched/ and, in theory,
> > you should have done a dequeue_task() before put_prev_task() in this scenario,
> > so SCX_TASK_QUEUED shouldn't be set in p->scx.flags.
> > 
> > The change might still make sense, but can you clarify how you triggered the
> > NULL pointer dereference?
> > 
> > Thanks,
> > -Andrea
> > 
> > >
> > > Signed-off-by: l00013971 <l00013971@hihonor.com>
> > > ---
> > >  kernel/sched/ext.c | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/kernel/sched/ext.c b/kernel/sched/ext.c index
> > > f5133249f..6a579babd 100644
> > > --- a/kernel/sched/ext.c
> > > +++ b/kernel/sched/ext.c
> > > @@ -3262,7 +3262,7 @@ static void put_prev_task_scx(struct rq *rq, struct
> > task_struct *p,
> > >  		 * ops.enqueue() that @p is the only one available for this cpu,
> > >  		 * which should trigger an explicit follow-up scheduling event.
> > >  		 */
> > > -		if (sched_class_above(&ext_sched_class, next->sched_class)) {
> > > +		if (next && sched_class_above(&ext_sched_class, next->sched_class))
> > > +{
> > >  			WARN_ON_ONCE(!static_branch_unlikely(&scx_ops_enq_last));
> > >  			do_enqueue_task(rq, p, SCX_ENQ_LAST, -1);
> > >  		} else {
> > > --
> > > 2.17.1
