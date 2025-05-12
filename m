Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2080.outbound.protection.outlook.com [40.107.236.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1760C255E47
	for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 19:08:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.80
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747076882; cv=fail; b=HP3Ipb78l6XgO8NScS7CnqOoU28xHjT/tK/rphxE+MP0bS2r7LnAYURllLEvvpRn//nt6IUCKoLjYqAzgYogGMz69En0q66qhTFwXLhcKioDx7jC7GeZXoDxv8djrE5RoTHF6BM3L5Zxh5lBIZ4UY9uPEo/oDtWdYPlLChD4Tq4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747076882; c=relaxed/simple;
	bh=f+fV1Nipa2LIu6o2hGksPPWAU0NmB9WPU5LH3bjCaIA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Y6qMjtXdZhiFg8BuaTCwMm8vdxXZdmJ+La+FVysN7euAP3/BCs8lb5OZXJgc2MkCr1NKE2lMA96v5grTAMWrZ55gnAAI2n/AuDDsN2iO3eWj/qCwGcx89KISUKJblrQwlvhPSbH5+jyOLTzuTxyGUOCn6mY7CQhQ+fB5psn3D4M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=gIFjZKk7; arc=fail smtp.client-ip=40.107.236.80
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="gIFjZKk7"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q6+bH2yXTQ60j+s2tJ/2rYZHnadG/KNP1ajqSXMngV/izvqe82ApjwsoEnPJHY/ceuV1V31Wr7dg9/Uji9BtushpKm2WIggNNn/Oe8QrHh+bCQsLe5JQe9He0+y53F7r5nJVBVQVinXVepTspFXe+a3Sy8VOEYpWXLi3BXerOhtPMN9TDyvd0ibwSnPquOtRL5erVoJh9A/znIvcoxn5RRUqcf9Ddx4N/THdW8v3BPLWstLcE5+nXDWPQRWvcavAB6tuvq7tEi0eF9oT5olFEhD7Q4QvUEfnbsC5LetPIuviQXl4x3wsTYrD0pc+reG5780Sgbi7LCPtA1ugQKSreg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lqK6tFZOQudU/tWVocNHf98dUfYGG7phoMGAX/84DVY=;
 b=ueCW+v+BYqa0NLW8Zvazbcp5GvnQ2zPwrhsbOQFKOyV8BF7EB3Lj4+NYc8/5BLhwfL2OQlyAIjo7k+PAbb2/VJfMWwuAHxRanjkO/BeRjSDkDGXpJ9jvCEErQwkJlOk11bD462Qtj+Hz+ithsRvWPnh5CxHAW/p064Kj7C48HFJMO6Bokd9n3O5wk7W6mab6eZrWSIL26pi/7G7uOCrsEc7EwUb1I43w185pbZ1M8aq/9cJmWQap6niF0BVep2LuBEHe8uSQsZm1cB8+gjD7bEIEpd39N3RgJGyIshaXOYxfN9LdVcHnSr2F8lln8VAE0356M/KPwFgQ1YFc80o30Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lqK6tFZOQudU/tWVocNHf98dUfYGG7phoMGAX/84DVY=;
 b=gIFjZKk71+bE8CpD3MPXYcY6nFOlj31ZhKj8j0ce8REL9mB3z4ykoRYQcSNqPUvF0TaD3bBeXqH1IS96YiVmEtnZ8qcMKRZ/U4lkcNlVJm2bjvy+q3/pYWBV/LdsAHC4wm08+f2ic7U/Rm2PK92Fa8KRHK8FizKRi5dshCdIRtf/v5hiAfX+NcR0w2M/opW38cRWkAg94+lfYAIrMr7dbKgyxmUn6drGUM8kq+ld+ux3bkCV54Dt5UBRV/BSGumdksu3IJIOj33y1nwdHHF7/K7XkEy/7UFgIM9YqtVvMSoi6mv7o2Ur/39K+ok98plOHNCnDTC74ka7zM/QlLne7g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV8PR12MB9620.namprd12.prod.outlook.com (2603:10b6:408:2a1::19)
 by MW5PR12MB5624.namprd12.prod.outlook.com (2603:10b6:303:19d::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.20; Mon, 12 May
 2025 19:07:57 +0000
Received: from LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::1b59:c8a2:4c00:8a2c]) by LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::1b59:c8a2:4c00:8a2c%7]) with mapi id 15.20.8722.027; Mon, 12 May 2025
 19:07:57 +0000
Date: Mon, 12 May 2025 21:07:49 +0200
From: Andrea Righi <arighi@nvidia.com>
To: David Vernet <void@manifault.com>
Cc: Tejun Heo <tj@kernel.org>, Changwoo Min <changwoo@igalia.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] sched_ext/idle: Make scx_bpf_select_cpu_and() usable
 from any context
Message-ID: <aCJHBSmb0mjCbiQ4@gpd3>
References: <20250512151743.42988-1-arighi@nvidia.com>
 <20250512151743.42988-3-arighi@nvidia.com>
 <bylpnof6h3mmeaovba573fer4ikrr5zhr53htbso6zzuw5czzj@tihl7ajm4eaj>
 <aCI9_GBpky0cowH9@gpd3>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aCI9_GBpky0cowH9@gpd3>
X-ClientProxiedBy: MI2P293CA0002.ITAP293.PROD.OUTLOOK.COM
 (2603:10a6:290:45::17) To LV8PR12MB9620.namprd12.prod.outlook.com
 (2603:10b6:408:2a1::19)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR12MB9620:EE_|MW5PR12MB5624:EE_
X-MS-Office365-Filtering-Correlation-Id: fd5e021a-d3f4-4ac1-d153-08dd91884e43
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?bn2sGJ77zmqcR7jxG9W6m9ziY5HWRfOHXZXi0JwA8KN1OUywfHlOjqxcT7Oo?=
 =?us-ascii?Q?sNJBdFsNBMRhSBZvmHR2nMJY3oQZgYfdrZVUKuOeF1NGvRuTLPWiaUc9jNJP?=
 =?us-ascii?Q?Ni/rltXW5VGai1YnJtpip5eZRYWtdnbb3kxmsvXflvqTc6s5hQJim4at3clu?=
 =?us-ascii?Q?A8GBC6E133gxCtie6N1hh9AZrqMg+KovUDYW5oQxzTYZMhzNaDE0ddC4QCQi?=
 =?us-ascii?Q?ONUM+MJv8QVbAv3VJ6Qu0zhS1w26WbKAvsT/sTJ9HTAmGqPGqjZOl+5gD9Pr?=
 =?us-ascii?Q?n1p2UutZ2uRtCjSz/hJ4rUhCOtaVm5CNCa6mhxXQJ+Poh6J8wR4TuP3o77DO?=
 =?us-ascii?Q?We7LtRhuX3YjNHV10B/I2AE8IkT8YWSnclO+gnKODW2KigiM273EX9pIZzhx?=
 =?us-ascii?Q?PtUF0k/2Go/Aive17SL3Tcf4nQF3suEqDEY4QDM37OGnnsfaxdaNo9AUF0wx?=
 =?us-ascii?Q?uH/NRCBTt41VyxhUp5345/kIOqJ8O+ZVRWzC84d5SslFIVwZwvaxEY3bvmQa?=
 =?us-ascii?Q?U4siOorEGeeXDn1nAgV0fS7spBIGqUdUt+lCyD6TqVVK64RKgTHK3Of1pAzL?=
 =?us-ascii?Q?LggvuE5Kt5EUvzsIV4JIZR5iTbaTGXyTU+33S3s1Peuc6x0eBksbwhGKtKf8?=
 =?us-ascii?Q?XJA7ycr9jS6oKENTWT7hYdMCE8PPXdqujkVoml45zzc5IZFFeiLD75K+M5Me?=
 =?us-ascii?Q?wpq7qTuCqa/5AikPOee0ySnDveozS0sR/eH0wPNXHrtQRbtYDdcg031Wpha4?=
 =?us-ascii?Q?1GeH1K53tAV7aEMRCmcOCq9sNP0f8H7wiQ+1shjwJhZ7bTmOo4zIKLTtc4JC?=
 =?us-ascii?Q?Mu4FzsxX0bnAs4g7iGn3EnJqIbLRQzFNmwmng4Qz+fAUhzxR89ouysri5nvc?=
 =?us-ascii?Q?MnFw7Sd6RybVj6ClFdCDNaEBWJ1xPQJB4Bc48LqZX2pb/dGwWNdpJ/EBwi9z?=
 =?us-ascii?Q?ViqXmd57iHMMgNYnPbTgWNvyPugE0DmTTJMeu4+tBzriEEWtlmyW57HNtAr9?=
 =?us-ascii?Q?WgG9pJv9nVRLwX1jyDwRgYDfSm7dJoSOVFUHTZ1QQg3TlG7EXqzjlP9oHQD2?=
 =?us-ascii?Q?6t+r965jKasoL4pqugjQgEmU9fnJSE+XGsXxF4cFV+DQglMMf6KNU9N+3ELV?=
 =?us-ascii?Q?nv36kad6gdXZFdxFZHcHTAv+XaBEXpeYz0c8UQsXtt0Ef0MlU+ZjsYHVw2q1?=
 =?us-ascii?Q?kB2a1e6lkqiQ8cWhMVKnaBptx5svgf/ZI5d5i1xER2TT743sk+oANObB+0/u?=
 =?us-ascii?Q?JDYPOV6lRwvn7MbtmbEFlND4LVCQQ60uQxp0J1DOwc1GF35CPbLHnxRZTt8y?=
 =?us-ascii?Q?MXLWpFw27rA+S+TfVMHPdnY61mkqxCcjCwkB2Vz0uc8+WrggkA8HhCrtKQ6h?=
 =?us-ascii?Q?nlhk85Mom9+1fo2qPXru9k/B+r+BRAPJ8W3GM6n2Qgp8bhJOAqDdwF8PL21u?=
 =?us-ascii?Q?TwVXCZ86V1U=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV8PR12MB9620.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?evSLfQBRqc+fkT3B3j1RQdwhYMMmwcWl0n1mo7TUydzuYr2MCzAOyKita8hJ?=
 =?us-ascii?Q?vkqXZNiBPOUlgrjMurRmVD9MLKq62XlIZYfMI++jTQm10EkRIogGjDLii/vt?=
 =?us-ascii?Q?H9p16C9PwR19a8O9TstTQcmoH5giWU9iY0RjBRXbaVXmcpyL1HfdnNEDu/7C?=
 =?us-ascii?Q?g1LhAzjtRIiRx3C7iuQvTEVoxdHM64b/e0YrdRdrlQa47lRzXyMEFg0lo8jX?=
 =?us-ascii?Q?HlxbMCixJgz0QMqRw8U9ZJkuUd21JrbOwijSrHKZ/hAFBV27WHo6Uf7nWOYK?=
 =?us-ascii?Q?HCrjXO7GCrXsu7NgbJ+IHmegSX/MZodKMiuzZrDu+PCRymCT5wOdLzQTHIHY?=
 =?us-ascii?Q?Wd974aruTeD7NXC6kP+/xBG1QYOYg5z8fZ8mYmweNlWd00E922AHyr796HOl?=
 =?us-ascii?Q?dhYYOP7Ni8EYUwqL+UCPbbVmBYz6PNC3zlzL//9yJKGWFe7EmTn3+MBnnJsC?=
 =?us-ascii?Q?bIVFwC4a9TN76XHlu+RXmvjIuEdTJp5TrmJwYwlimi7mVbS98IfKKbWb+SPP?=
 =?us-ascii?Q?+n8h6ly4lqDZxXIm0sXT7VpB3xX0yjwnJ/0hDNiqEeg9UnSwWqzBd1oDEkzb?=
 =?us-ascii?Q?+BuBi3E2H6Pb5bbncO1YNPk44piq+4EN3q4dCANHz0KKsngAXGCB7q56l3Vy?=
 =?us-ascii?Q?X0ZTD+4zEcFU+r7NhqoSjRw6CfcanTPr/vdxQHBw0CYKCTW/mR1eUgikBbMV?=
 =?us-ascii?Q?N89fpKqszcP1FeWcOCKGtgL+mGkPrll3tQeWj9I4tHwX9ZeQaes67zQuGylH?=
 =?us-ascii?Q?krLRJpisuE2uaxQ0chtvUsBHoDx21ON41ksKDi9aWy28rse9LkSE4SK51dwG?=
 =?us-ascii?Q?avKSC+4fgomU2SG7ip2F/b6rRN6JVuiC6/9JB4E6g43QQKUKVJjLXk8WtSbZ?=
 =?us-ascii?Q?euA21R9uaTUouxPmOiry3hbLFaljrQfrhGQPH9bg/ChUTBM8CCMruCB6Nv0r?=
 =?us-ascii?Q?eNZafUSGy9+6wu7lva6ZwqfGFavGdH4lGuSm4GTf62N5F+WzJlBX+fsPBtzN?=
 =?us-ascii?Q?2k0od3kuGXZgrxpQ/gRSHWTKmruKwEFyZ0hMXQ1tukEWaV6fKqQUVeOXO0Bq?=
 =?us-ascii?Q?myJi/5e2s0noNKt478Xc3fnUs2rbSKdU9p8h8bhIiUJiQHpUQHveFjjmta8Z?=
 =?us-ascii?Q?U822uJZlwG9Rw8eKPcAfUQBTMuGCpUG9dJoKaloxLIU0QvLKkRYxYVsKXOSW?=
 =?us-ascii?Q?zPxdc+6vb4+x/374AkSevQWMSwvMX/lp3ju+Rz8i5ETp0xIFSfsu9k7DaC/K?=
 =?us-ascii?Q?f6tDPPH5CqnE2z129ZVvC9Cb+GrzG1B8Mbw+V+FZ8MmXNIfFnZ/A/igx8SfX?=
 =?us-ascii?Q?JsF4cj8h/E2hkDANduYOFBoM8q/rzqO/r5mJKr74RK8vtibHHfavhZ2Sjjky?=
 =?us-ascii?Q?9KyfM5/unAS2UAIpkVxl6Ywka8fkRrlCsUgyzzbJkYPXTLS/UcvdJXjqfoJa?=
 =?us-ascii?Q?Gu1SaJj7/Hg86LxQNZLN4Ak9csYZbiubH7iQkbZWQsxrHwH5h8Os5A+UiSC7?=
 =?us-ascii?Q?uR+4a1fVnmYL1b1G0q4D+9xeqTFFXv92Pcr06PGGMQ/+2dd/8AawrXySgLMv?=
 =?us-ascii?Q?7c9bgHH4Ps+9A3iiKsRNx/m6FkOJDj6/P1NM4N4F?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fd5e021a-d3f4-4ac1-d153-08dd91884e43
X-MS-Exchange-CrossTenant-AuthSource: LV8PR12MB9620.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2025 19:07:57.2066
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0Day74nEwaXmqCepb9ldrZkj3vIqio1abZzREQa3mrKsQrzAqyKl4hh64eoy6IHpTXJn951BosHfL2uez1Y1SA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR12MB5624

On Mon, May 12, 2025 at 08:29:26PM +0200, Andrea Righi wrote:
...
> > > +	/*
> > > +	 * If called from an unlocked context, try to acquire
> > > +	 * cpus_read_lock() to avoid races with CPU hotplug.
> > > +	 */
> > > +	if (scx_kf_allowed_if_unlocked())
> > > +		if (!cpus_read_trylock())
> > > +			return -EBUSY;
> > 
> > Hmm, so this now assumes that this function can be called without the rq lock
> > held. I'm not sure if that's safe, as scx_select_cpu_dfl() queries p->cpus_ptr,
> > which is protected by the rq lock. Additionally, scx_bpf_select_cpu_and()
> > checks p->nr_cpus_allowed which is protected sometimes by pi_lock, sometimes by
> > the rq lock, etc depending on its state.
> 
> Yeah, it makes locking quite tricky. Maybe we can acquire the rq lock if
> called from an unlocked context, instead of cpu_read_lock(), but then we
> still have to deal with pi_lock.

Actually that might work, since pi_lock should never be held when
scx_kf_allowed_if_unlocked() is true, so basically we can do:

	if (scx_kf_allowed_if_unlocked())
		rq = task_rq_lock(p, &rf);
	...
	if (scx_kf_allowed_if_unlocked())
		task_rq_unlock(rq, p, &rf);

Or at least it should cover all current use cases. The tricky one is
scx_bpf_select_cpu_and() being called via BPF test_run from a user-space
task (scx_rustland_core).

If we had a way to clearly identify a test_run context, we could restrict
this to BPF_PROG_TYPE_STRUCT_OPS and BPF_PROG_TYPE_TEST_RUN (but as far as
I can tell, the latter doesn't exist).

Thanks,
-Andrea
