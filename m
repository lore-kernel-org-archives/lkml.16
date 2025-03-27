Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2088.outbound.protection.outlook.com [40.107.94.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42F1E1A0BF8
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 07:56:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.88
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743062175; cv=fail; b=iddOytKbAhvHLntPea0pnbWL84zQvPjrKQY1BLrzVteaCfvYG0fT9J2Ir2k6V2HVFtuYo7x9hGEqLQyhOPk2Mzn7MoRz0Hx8FbMHigbnKsmgNk6z0Kz9bp25bhyu8sNs9fBtZwCs4gamwONCti9+FlFBovZ0K6n1XFBFwymApP0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743062175; c=relaxed/simple;
	bh=9ldCDd22EMpxjEXeGEFG2fx1tH/oE+Pjhl1IOE4y5h4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=oAW32PxOR0LIlVLwgXzxVD4MarEosJB279/PDwKgig9fu/4aKvGZM88OZbnQQnRKlPal8GM01zYGVy8HRM/5sl8ipyRGHM/PqFJvP87jgs4zamW9tr0Al5FYSaWL07rWoYDPM1+W8R59oTozgRZHePwOGhDrwM8W75lqU+Y4kJs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=hoGxh7i1; arc=fail smtp.client-ip=40.107.94.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="hoGxh7i1"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j4D0fVg69wS+kMlvQAm3N8RTHyCLCFkZD93DwZtMvDwBONXRSoY18JJZNNdJqgoyLRKRBoxyD0RmKxzHDEspZQswMwGPwM19Knf8xYmq57Zd7pF3KmPuve+PRDnxLiREsd8JA8KFatlBzTJXyAYr18RStmqq83ObgidiFO2rSQjndBUPd4k3ylfPyKgkNt37sI/o/ekHX3quhq//8CAuEDqpvvoEHr28d9V7JRzwvvzgOkZS1HAdh6ZPBk5GJLvfz8C/UhYrLeWs2QAZD0B7qgcY6iSIorK74QZbi7xH19zGgD9QbSl1/emF6RCGuRBrArg54I8k2AgLkazsvZEjpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iG6bVT7P8Am5NLoLqVan1zBYJndEk2mVQUkrB36dEag=;
 b=kK1d3eRPR2yXgujAMqNS06TjVJ7Nq9aymxAvEXS0rpx2cdFB4zfcvkcDdcCFTWZrDsjntc/x2x9/HBAMw6K+l5wtHmCu2l1z2y6GPcrzmtMb5dE+dh6hJCKITXBKcz4ZcslBNg2Q6gXD7F18qY7YWejuUqlaJNgXJ80SdNGVZduIOiIWFybQwNpP+K5wsPxsHMgkxf+xmuRnX7k1XoIIHCKHQ8uenwH/YiS+nlilLtGEDuiO1aPzo14Va5OcVAteboj8k5jXQ4Htx38O3oS+TDM1acKZlAMr8JkA/b09AVCvD4KlwE0BqdER81SMcytRYtY5UvvMpLjFexjjA4Jxrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iG6bVT7P8Am5NLoLqVan1zBYJndEk2mVQUkrB36dEag=;
 b=hoGxh7i1IoJN1gMWrK9xQulGNvFcT4TPS6ZQJ6i/g3k2AxRIdjR7P2PFO6qgIs61Qr2Qj3jiBzUZnylHCEZgHu9kJmEyuZCK5nAKj18wcJjDv3JPY72rnJApDEUTwU0/VAVylkmWQ8MFJDRsJ9Sdsc6s7kGR49vnYnXGh1cwC8sTmMrh8gqOD8FobyiRe64/Jl900XkW6tE0VCkjWBs6QZyOAysUeLtZ7KPbf3ert1DuebYj0nJS9/60urUXh5Sk+7G4C2sCehtQqPfA/fuldGxTXvzNziTA/OOB51+02P7iKfxRlVLzuYUOEwafFPz8r1osc1nDHboWjpHP9eKu7Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CY5PR12MB6405.namprd12.prod.outlook.com (2603:10b6:930:3e::17)
 by CY5PR12MB6455.namprd12.prod.outlook.com (2603:10b6:930:35::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Thu, 27 Mar
 2025 07:56:11 +0000
Received: from CY5PR12MB6405.namprd12.prod.outlook.com
 ([fe80::2119:c96c:b455:53b5]) by CY5PR12MB6405.namprd12.prod.outlook.com
 ([fe80::2119:c96c:b455:53b5%6]) with mapi id 15.20.8534.043; Thu, 27 Mar 2025
 07:56:11 +0000
Date: Thu, 27 Mar 2025 08:56:00 +0100
From: Andrea Righi <arighi@nvidia.com>
To: Tejun Heo <tj@kernel.org>
Cc: David Vernet <void@manifault.com>, Changwoo Min <changwoo@igalia.com>,
	Joel Fernandes <joelagnelf@nvidia.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] sched_ext: Fix missing rq lock in scx_bpf_cpuperf_set()
Message-ID: <Z-UEkJfkkBBKqCyU@gpd3>
References: <20250325140021.73570-1-arighi@nvidia.com>
 <Z-SasIwx5hINm1sf@slm.duckdns.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z-SasIwx5hINm1sf@slm.duckdns.org>
X-ClientProxiedBy: ZR0P278CA0114.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:20::11) To CY5PR12MB6405.namprd12.prod.outlook.com
 (2603:10b6:930:3e::17)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR12MB6405:EE_|CY5PR12MB6455:EE_
X-MS-Office365-Filtering-Correlation-Id: e141d4d7-fcd1-4cac-bbcd-08dd6d04d6fc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?tEEntvPHDZ6lvgPi88enww+RyKr4GFsYV0Nrhev3z29CBT9Tfufv4+U2mufK?=
 =?us-ascii?Q?FnQnPhLZFjS0sct5jVaPFaobpE1pkgLjkLApKheN+4TiTw8HZUVN2eN3c/4c?=
 =?us-ascii?Q?TffqSZ8qPmedyvd8e+mcKHWhg3+Omdw2rhGLoSOhUOO8Cwk9M874kV1HmvE/?=
 =?us-ascii?Q?ILvQ5SZW9ruay5srhd27pft3NpGD5Av71AnQ421IgLJdB8UADQPM57JaoxPO?=
 =?us-ascii?Q?L8M3k+rbKvvHzx3tY9x9FsAzpTey74F8Wrf3oDjsRy5GiR/C6a6lUu9yQe9N?=
 =?us-ascii?Q?zTGwbsd6cXbsXO2bxZJMES9yaAo0C+IZ6SOW83IaLfWiS1ebqnywuluvdq+i?=
 =?us-ascii?Q?UzfXVxXia5ek1u3irZZwcfwQtDC2eRaUAsLcIwG1CXLRdYZYiGPtPR+lV8nS?=
 =?us-ascii?Q?bUqj4pa3SnB9p8+Qej66+0aEEJ0MsG0RraVP6NspnpG/8hliqaan6TQO1Y2I?=
 =?us-ascii?Q?YzOrvgtiFfu9jLwVJlHAWvRQfWiasX3XpSU7xTrOWNvdLe6KLOxaSiDuqdp2?=
 =?us-ascii?Q?gnZEHh7MqQt6rRQ8U3Th+LREK7FE7+pn1RWOBCoGfv6KVC2Hak+IbbNSCLoq?=
 =?us-ascii?Q?I6uG16NB6vv5d516k1rvSe/tv3+P1RfXk6cn361u2fH+d3OwzejZuR29RQUP?=
 =?us-ascii?Q?g+XtbAV4dQqZIRs7D4iiHB3i7dTXDZcVR2sqj+C1bM7eGQt6m2cP2A7Ke4/A?=
 =?us-ascii?Q?3l6wS/+eD4V1pq6Z5rpTZyi6K8vP9V5YZEjJLc/U1DlewqZuy8k76SGqek9g?=
 =?us-ascii?Q?zkgstnfmkdy7T018eY5NpbHP/YUsBop4WLbd3Gjw2QH9KVavGn6BAaJ7X4S9?=
 =?us-ascii?Q?rt9esBnUVe6JfnaAI5oXXWdiybGLRrd3kj9rkuJ7NRZ2yU54nUXOV0AZ5gDH?=
 =?us-ascii?Q?8kkyZfwdLqJHwfEP0zeeNPh32JYa12X7Xr9Smfub9k1QizaKKxVjVgitUgxy?=
 =?us-ascii?Q?UfL0ioSmyuRzSoABz1BrvAt9g+kPffzLyw1pZFLFr1zp7igW/seo+1IAMWB/?=
 =?us-ascii?Q?TnfIgdnfG9evnq2+Lo9owk2OQD+otJiQjvF0zVQMiTsCuBroqa9pP0aYWMjQ?=
 =?us-ascii?Q?YTWKF01SchOsyUdr/6mf67IAzNLehyR0t5ITfE+eMvbVmujA193izm54424K?=
 =?us-ascii?Q?o8wA+MZwWYQbWrfomMiPH6dkBDpjmoR74A6umV1Kiwvh1aWtvY5VFvRAqLEO?=
 =?us-ascii?Q?K+xDP2Q+9OKGA+USmv+L0107iGnobW17kOISWVwrBUKwpim9+pO35Hd2fx3n?=
 =?us-ascii?Q?JTofC96mBMaQhBkJrIux69O6M4ofQbCBfsxTuKryFsEPd3AjPNhLqESR3EsC?=
 =?us-ascii?Q?JlGNB1q5tsPN1z5Qz0pjgh+n3GZXu9HkJsdd4ecS+tTUbUpHosziiT5J35X3?=
 =?us-ascii?Q?Bkw5sk+RPpo8BCsFJY5jZLDDcHDO?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR12MB6405.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?tZtzQWCY7TgqHs2541ABbxkkZD/rAuXtsfZzCtNmc+cW13fNKL9B+/nrAKD0?=
 =?us-ascii?Q?Ei6irVcJ8Knxtk/6uI2UxxEV2oVqp8y5FNEFYMSKB4TRkZjmiCOhL5EuWyY2?=
 =?us-ascii?Q?e3PR/l4gd0vwGSHIHVygi3OTI5fX58NJzgTKwk+Tftgf6Fa981S7wLv89wGH?=
 =?us-ascii?Q?poi56zEitRylZOBbZyepls9yNtcTgFB8clyoLQ/vzBhKrnve6PblAOE3rnUm?=
 =?us-ascii?Q?suY++CDlPyLLxLf1wjIjCDrOSdbLUeXnoceQlJEjspTxlnl3N+TFp8MA1vvx?=
 =?us-ascii?Q?OrwORpP9sZcb16L443bIynTr/T1pRFvlgzUnkkPvHvUCxKYQfLNKz8enfZFl?=
 =?us-ascii?Q?BwQZTEU6Rbjhv0go4tNilcX43ARoDGDoW8bSKG7CqnW+/JKNjh6zwREr1yVX?=
 =?us-ascii?Q?OSfA+DY2e44kiQxejY0bco3IzigjHsEyPIaCOghe/bFz+0KCk+AYaemnJn4Y?=
 =?us-ascii?Q?joPFsVapPB18VxEhU7+YMZA9yRpFllgdwFJXbSBOQ7gOdqLcHH+sQBHuMqIB?=
 =?us-ascii?Q?HBkigxemHLxtzenNwvGmN0U7WPiZ3US0gxwOV3AyrNFn1P1YONoqE+QCIlCg?=
 =?us-ascii?Q?+qHYfItUW1eYMoX4YMUikJHGto860/UAhpYR0r8IOndMH9DmvQGIkUDDMk1L?=
 =?us-ascii?Q?lbr6b/M+BopFdKAIklauIXDjX1REAyMTKgs3/UmD2zNW+JS0Jp2OO0mTOxeN?=
 =?us-ascii?Q?nvNJJAz1DG/9Q2Yqj+pGEg3c92FEutKV4zH2KXbmsBmkuS60pOONlP0Qozz9?=
 =?us-ascii?Q?NS5Ga6b1JxPq6c4el4W2Jy3voSz4Bie/wK7r0o+S3SgGiWAjI7MMWG8IViuF?=
 =?us-ascii?Q?4CEKaFsAFfyZbwd8J0/rT+ab9EiUkOwOzu4CIWORX+dfpF/60ksGTv+IHFqc?=
 =?us-ascii?Q?1EdndV1cwztGjky3k+wjaCKYZ8+TPOSb0x4Vn1ojPf++I/YKJkzWrl21V5mR?=
 =?us-ascii?Q?7kAc0Xp/lPRQ+r/rOcZR4L8cLR0jbfDaOHJfxGskUC4/1mQEAORjEGvqxPOt?=
 =?us-ascii?Q?JmfiZQGqrJAIWNT1/fg9p26b4mqcnNUajx+j9+PhSZBygQBlLytjFPHSqVGu?=
 =?us-ascii?Q?bHmbb1MKlYicVoCZQ13MKz29x+nUG2JoqzoXaFCSiHUPfksbzAEUAB+3E62n?=
 =?us-ascii?Q?Y87XtO8MHhRwWPG3ldQoVChjAYIHPKHSICw5IoR/OEccbznbY8tGiPDVve77?=
 =?us-ascii?Q?l96ulbHIuXFYF7y97lgu7rtp9Nbwq5lHXmV5rLevYenH+m91g149nlobyerK?=
 =?us-ascii?Q?VOxIPR/4sSVkAelW4f9RV0xVFGDS81RlOme07HgFy385Qw9+Ntsd8mU7AEzL?=
 =?us-ascii?Q?tfF/VT0OWPtIq3jsCHb7GJUA3vMz8QnDXq6wYsVLKTqdFgkG/7QlERUhdG9D?=
 =?us-ascii?Q?ti7nVdhxbL5QSgGJBuvkST2Yjc5PWRntumNMv3OswPbvu9edrghRZ7jJGR+X?=
 =?us-ascii?Q?QX6SFt+G4NLQmQrBDc2mLe18yVc3Hab5iZnh9UU3AoyD7SDYseO2K10C/0M6?=
 =?us-ascii?Q?g+dXqZZK617srRDDhzrX2ElaL45P1ZwvsEK4w0Momy9PMY4vxjfUQrY9RZOZ?=
 =?us-ascii?Q?U6u5M8I1b1Bp7F3P8qzTTChIfHIxtL3larIKtYqE?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e141d4d7-fcd1-4cac-bbcd-08dd6d04d6fc
X-MS-Exchange-CrossTenant-AuthSource: CY5PR12MB6405.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2025 07:56:11.2603
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xlGxQMYf4as3t98/splLfU1VmrDDC/EfRa8mJQEmlq5Xv8mmcPeMj/1/SNKXJ6XZp+0YV7vcOm0BQjHGzMN4wA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6455

On Wed, Mar 26, 2025 at 02:24:16PM -1000, Tejun Heo wrote:
> Hello, Andrea.
> 
> On Tue, Mar 25, 2025 at 03:00:21PM +0100, Andrea Righi wrote:
> > @@ -7114,12 +7114,22 @@ __bpf_kfunc void scx_bpf_cpuperf_set(s32 cpu, u32 perf)
> >  
> >  	if (ops_cpu_valid(cpu, NULL)) {
> >  		struct rq *rq = cpu_rq(cpu);
> > +		struct rq_flags rf;
> > +		bool rq_unlocked;
> > +
> > +		preempt_disable();
> > +		rq_unlocked = (rq != this_rq()) || scx_kf_allowed_if_unlocked();
> > +		if (rq_unlocked) {
> > +			rq_lock_irqsave(rq, &rf);
> 
> I don't think this is correct:
> 
> - This is double-locking regardless of the locking order and thus can lead
>   to ABBA deadlocks.
> 
> - There's no guarantee that the locked rq is this_rq(). e.g. In wakeup path,
>   the locked rq is on the CPU that the wakeup is targeting, not this_rq().
> 
> Hmm... this is a bit tricky. SCX_CALL_OP*() always knows whether the rq is
> locked or not. We might as well pass it the currently locked rq and remember
> that in a percpu variable, so that scx_bpf_*() can always tell whether and
> which cpu is rq-locked currently. If unlocked, we can grab the rq lock. If
> the traget cpu is not the locked one, we can either fail the operation (and
> trigger ops error) or bounce it to an irq work.

Hm... that's right, it looks like this requires a bit more work than
expected, but saving the currently locked rq might be helpful also for
other kfuncs, I'll take a look at this.

Thanks!
-Andrea
