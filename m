Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2087.outbound.protection.outlook.com [40.107.92.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93CB6286D69;
	Mon, 16 Jun 2025 17:54:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.87
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750096495; cv=fail; b=Y6o62favCn9Gs9rWQq+qzLrCUFHN5IGGxJh6nfrJgC5/O+vYgWPM4iHEaWO1Ct8ecSjmfBpe4MMx5MFtnuZEdc5Kk1aYdaNbcRA1A4qveQ3bZNMJQpj5xwEd9z3WxUKllhoYeWfuJ90K660AbA9YJ7r8He/vX2C0N11fVJBaIlQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750096495; c=relaxed/simple;
	bh=X1P9Q0gecBHxPi0M3nQ7RQaNZko/YD54d+4vb+Q014o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=P2n9lTg6i4T1iQP6asV9KVTaq/qFhTkWSDjBtXctgXK3LLCnfBEh87z077l/FxQtIvinO7Tow3nyyoG7QYL9F1IL2M07CrPT2aQHy5Q9ThQetRQkjdCwMZLiSYcHEvbk2z6I9wReHNRC0HcRmft1z0exwI8rXBZN3+zK8C6w3jk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=JsTsjp6W; arc=fail smtp.client-ip=40.107.92.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="JsTsjp6W"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wXJRrMzHmxmUcdtxP9l8VdTuxOQU3dC8eFtoX3rt7pYYXNfpcx8yuROq8QqAPOVgN8KKKYFkTJo/HtqkWjAFua3UaRC8vFGZAPPkLiLus2JUG8nUt7blJm6u7X0GKgVfvSJzYce6vpC7kz2fX7imXnbMvskZBWmcpYoQmpilvnhjW7cTU4Xtrhhe3MlwbiggQy7D0sbUr4D7daFL7VCmCx515Nn2Yjr87ZBnzfCwakJfJJ8SZkshtz8SsnN4sSez2G47MzY9g+uTNQXSdTUi4TvLWlHzzfUMV2zyfHaHDefZv4wvqzT+ee+6XefpgKfeiEIPOBrbmZEWBx1lDSJGZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Rt1yg19vilXF+MDYqRC++zCE4boV9aM+1iR5WTAIEWg=;
 b=Pn05fJrb60FzdGtfIUcYAvf4LDsQQwYOVT7OK0i0KDHkPX1sSyRSlo9g6QVIUoADB2Hz8StnZqkc4WGEf3L4vBmjpqHddMc9nJAzlFDXxoj7AbgC6TRXuER24qmnfs5dRdTNYxuto1lD9KPISgSRT2CqfEGk3nV5sVXw11IHRQiARgZBgiETF0OUakznYhl/OLtpPl52TNqPZ8Grk2KQ8mL8PgWDeDga9mGqMipK8iadvMtlSSt518pCrYO1FZuxzEPey2rPhZ7/nme8Fx82jhv5lHi799o+OYVIVheuE5h0V9mkk91VFWe95Iz1BispvziEtDj17TOmM941L32UEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Rt1yg19vilXF+MDYqRC++zCE4boV9aM+1iR5WTAIEWg=;
 b=JsTsjp6W19fa0FYEqrypzQCDV1R9HfJJn/bnjPuAd8wX76WRdbrtFiDPU1yCfncrLmhsNryMzoLoeNHbNgKW1kVEq7VLnANECPM/NB57JmfI6ApUvdXU/0mBXEMdRAkidOigIFNqw7oTBR8lvfm0vxvLtZBsNDC+goUuaisD4mvGvilhouK+cd3HGMySBjS6rxTc9jhG9oRFUMj5gusPSdaMRhWgft4PTBaFGLyHyMC1tySduO5/7GNUkxB10ftLdfs8uwJ/WQlolgzuTXukqnYgZCEII83URZ3/lCjktgemxzQYQtAXehbY0Er0FWv2uGdPs/2p3jmjHEO7tx53Ew==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by CY5PR12MB6527.namprd12.prod.outlook.com (2603:10b6:930:30::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Mon, 16 Jun
 2025 17:54:49 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%3]) with mapi id 15.20.8835.027; Mon, 16 Jun 2025
 17:54:49 +0000
Date: Mon, 16 Jun 2025 13:54:47 -0400
From: Joel Fernandes <joelagnelf@nvidia.com>
To: Boqun Feng <boqun.feng@gmail.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Lyude Paul <lyude@redhat.com>,
	rust-for-linux@vger.kernel.org,
	Thomas Gleixner <tglx@linutronix.de>, linux-kernel@vger.kernel.org,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Ingo Molnar <mingo@redhat.com>, Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	Will Deacon <will@kernel.org>, Waiman Long <longman@redhat.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	David Woodhouse <dwmw@amazon.co.uk>, Jens Axboe <axboe@kernel.dk>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	NeilBrown <neilb@suse.de>,
	Caleb Sander Mateos <csander@purestorage.com>,
	Ryo Takakura <ryotkkr98@gmail.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>
Subject: Re: [RFC RESEND v10 03/14] irq & spin_lock: Add counted interrupt
 disabling/enabling
Message-ID: <20250616175447.GA900755@joelnvbox>
References: <20250527222254.565881-1-lyude@redhat.com>
 <20250527222254.565881-4-lyude@redhat.com>
 <20250528091023.GY39944@noisy.programming.kicks-ass.net>
 <683721f1.050a0220.80421.29ff@mx.google.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <683721f1.050a0220.80421.29ff@mx.google.com>
X-ClientProxiedBy: MN2PR01CA0031.prod.exchangelabs.com (2603:10b6:208:10c::44)
 To SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|CY5PR12MB6527:EE_
X-MS-Office365-Filtering-Correlation-Id: 2806d4f4-3463-4961-9dd2-08ddacfee377
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|7416014|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?TZYYsZAWqWW5wJt6jfZCJKf+hvY9EL2YTqdmd+y3k4krBGs4ii5lfvKnDQ23?=
 =?us-ascii?Q?d6a75yxYlGfmLHOvgI7eN5z6+DZc5oWNn0ezFL9GTPtamU7OLBalj+I18FfA?=
 =?us-ascii?Q?5t2WIF/tKaNi3SW+DJGjXZfLG+d7nv99R6x7cMJhKKgnDUZw1vnu2j8tedUA?=
 =?us-ascii?Q?sHU3ddvqvdYNHTdnQ1ZMc50knu0uCUjpe5Eo8EKZ4mSanHVymQYUfdhaGruM?=
 =?us-ascii?Q?z2r88o4A8PMYpw7szSoDaz0AVQQF4/h/PFAwRCv+ZGk70geG4y313UV+TdOd?=
 =?us-ascii?Q?mXTheM1f921gMklBsbzbpGIEkDkbAFdNL3IObcU4FY4hFOQewp6By3MkV1h2?=
 =?us-ascii?Q?8XiD27lXuIXeZ1OwCjMebj2CcaMAEPjtIYVPLbLbiVBlAyvM5DeTlkn7mhs1?=
 =?us-ascii?Q?h8Zgqp8BoIF2ygkPGyvpsG0P5EJf67hKgc/rnM4OzcksyhWWzTtUa4oTDh4t?=
 =?us-ascii?Q?rB7jSi/D+qdQ+lzxCK3iszHuVEDQcqYQjLqpGXANTkVbRYZ0OH+7uTlxJIz2?=
 =?us-ascii?Q?9Lii/iA81OKnXnohCF/YdBMw2atHuKk6RYOpD7ObQ7+yL+xF5Sr0jfsqstd+?=
 =?us-ascii?Q?6YlPpYaB86S4KCk4dsDOKd7hUz4gkXJvTpwbKo8wICVgVIky6t6ksAukVG72?=
 =?us-ascii?Q?ZZzfOlgyJEqVJxZMbLlbG7xf9+yM60D8lqoeWsnKobfIO025NJURTAlJOiSW?=
 =?us-ascii?Q?JabolLGjyH68EhnTtkG4p5etshqMqK5PHzFZ2+aGAhTOKTHmKadU0NkkIegN?=
 =?us-ascii?Q?WDFExpFB/2AjQpjHU4aEm77weYkvOLwbq0PrLooVIM70eiZjqn6cxWl9V7nf?=
 =?us-ascii?Q?oJHAdBO0M3PnWdL3zz6yQRFsejFBc8HvROtjKmb/jwX05VS/7uC3YUa0+Fu3?=
 =?us-ascii?Q?sgzuPtzpVL0jVxylLqCSZNmS9LyrdlvJXjlIN4HbCq1w+OeyXxg0WYqkzp4f?=
 =?us-ascii?Q?j6OLjUe+1S3tU8SJZoCE6nmJHsjz6cGEGElqMqKbvG7A7BEWW/YID707Oqej?=
 =?us-ascii?Q?pHTbmuC6gcSehII6VDTYWdugOlGqsdxqkwzqifKEh7W8pKPAFkb9qisWASs0?=
 =?us-ascii?Q?jcwDnxJPMoj9PTAcyBxCbVsI1FXZ1GjYQsdi8ru9B7Cbvh8xKKtfvnFy3N54?=
 =?us-ascii?Q?4PaW+74SoauBZPylAtwNa0f8sKdKZMtgKDZwynQNj2g6Hfu5Itf8CFE1gyXz?=
 =?us-ascii?Q?dPRIvojXnH29aXU214gn9PFUlUXvwjV0eYFQ/uncetzsEATs39tYePKarvbd?=
 =?us-ascii?Q?QEwS5+2FsDIu+Nd3dhGByKgXsS1A3uwy0ZhGCpCIc+HcOj3Wg6fF80HVOwdR?=
 =?us-ascii?Q?yz900HYaBi+U3XTinbr1yNoJdHHUgKwg8YnvMKxfa6kSU/geef2BCSR1JL4S?=
 =?us-ascii?Q?zdBduFUjkJeR/QvYiKV3Du2WmLQMkh6frXd4PZlocw2cJ6c94oO4UYnDK7Fm?=
 =?us-ascii?Q?q92GtfDcvdY=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR12MB8059.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ES8oBO3K9yQCS+txCe+4O9T62wvbpfr0Sprc4k2SRkcEGiv36MYv+ZD5UY8t?=
 =?us-ascii?Q?e2OSVAVmi8BntNz7LHpYHi1fRIYalXjpJllY7Dactbegd0DTX6Aq1M2WhAfl?=
 =?us-ascii?Q?0IzRV6xXA7+W3DD1i27Aj9xR4DhHYENf27vYjJXsePCItxyjLQYEriPnRToM?=
 =?us-ascii?Q?5unuly0XuGIx7D1Naa8v631Y4n9cpRk+6n7op5SPAZl33gbwsqFvmb53FbRc?=
 =?us-ascii?Q?rq/M6CxMv1kCRnO+1uBlvroI3uBskO4N2oSvA2JRl79gelR9yRSBAoiTIB7O?=
 =?us-ascii?Q?z6eZyVEfeQuzSwpBExWdiCV1xdGbEL6rtLyQPfLJv4HD0UocADV2JkfaPYpV?=
 =?us-ascii?Q?WmbjoqZT7F5+Ntn21phnZ78zYLcLjyDWWte4/sWEFCv22zBqbhgjw11poZlF?=
 =?us-ascii?Q?TO7VOLkGSo1xjSsbpRj0c8ND+4I7017CXEnDQDIP/NtO1kjMqH+qjlj+ama2?=
 =?us-ascii?Q?VwufORRFmiSpdV3CGG8jFph3V27SO0Scyk5eDqgFp0e0CLiv44kRXrHR9Ssf?=
 =?us-ascii?Q?ytksp/G8C3c3kEI4oniwO0rCBgDmDDcP+PknurvB0tGpEF5CVFpaL3U3iZjX?=
 =?us-ascii?Q?gkIsj5YsMqQe4y8q9h7UiDfiis6Ypa6Pq/OxICcm4Lc1Mdd/QVaxi8PjF9Lh?=
 =?us-ascii?Q?Em06r3mk8nilHAst4r2jk3gjauMBhPWjrlhUZmK81X9/CZNY+OS0KdH4yc5Y?=
 =?us-ascii?Q?uphhmnYP8yL08Bxx91QYVz8fhiLor5QnOZMVxrO+jO5/NaU/xDJKZfELqTRg?=
 =?us-ascii?Q?a2e3Lbzi+FgQ6Y73ij/IfdxRDW8fm6630uHHyavqcXPM7E1zDVeRgUGPOuci?=
 =?us-ascii?Q?M8GEnjO409SYHFpk9LtTXOoUWSGDWAbPj6ngQ3uvGtJpw/b6HbtsNBCekfa7?=
 =?us-ascii?Q?Tw/hnxGmweyQqr1DgWKfM1gSk/big5WM9a9m6wwa68D7GquN02c+Tk/Bg98N?=
 =?us-ascii?Q?2TEl21GWnUpeoSab0vW3uQ+QHQv1snF3BQmNPvKb3417n53vE/pav1fq4qLn?=
 =?us-ascii?Q?rP7k+llKXiq8uJH58NrRCGZbcYQRHGgbSFb49M4Igl3zW9xdLSrf5g/wbsCR?=
 =?us-ascii?Q?JBur0Q1ExVM6LYWscpGxuHp5I/ZJ0ek+8yXLpvT/Mc617LgBVKqAedYvdqn7?=
 =?us-ascii?Q?H0CocGAt8x8CawTmL0zEORXIHCQL3xLwZnlEr0/94m3mzQnXN735PCoY6e2N?=
 =?us-ascii?Q?BEPwOItHWB3ttVkLFWmeHRf6BOABRD6X9j7hGMDZkErrpq7O8s7Lk83F1D8c?=
 =?us-ascii?Q?VG5gsY0T+UGX85LxXZ8uomoR3qY0yQPrX+SVt6J1C8er0iLfIT/DIlAOkkbM?=
 =?us-ascii?Q?9zpA6OlCsuWyOkAjb45DgIJ+jB7b5+HEcr65OC6IJvn+43wk3k0HGv7L0UsT?=
 =?us-ascii?Q?vS370oJTp7TQBB+Da1nOBPnhs08ZYO9oyxmglU/W5exgc8P9Pr9xZi8DyPhE?=
 =?us-ascii?Q?gsIhFvbNZBW62umVmZI3rq1wUDM9G+9nV04n6NRkk1FuYk+GuHFCDujzfHsD?=
 =?us-ascii?Q?OZtRBimM7CY0C8CotAGlLkXcvyQdaXzwAsb1fIF3Bd++Izv7gpCYc3oAFC6d?=
 =?us-ascii?Q?2y9s6ED+rtK5QweeTWDxn7ZfOTI2WJmvIucVjHX0?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2806d4f4-3463-4961-9dd2-08ddacfee377
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2025 17:54:49.6851
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qGGKaQkkO5ongJbTXXmJ4/oc232X2ZLxdnNat3pW8FJhmZvlkpk2Fa89iLFbbkFtf1fK5Ui/GEP8YHXhz1wLfA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6527

On Wed, May 28, 2025 at 07:47:09AM -0700, Boqun Feng wrote:
> On Wed, May 28, 2025 at 11:10:23AM +0200, Peter Zijlstra wrote:
> > On Tue, May 27, 2025 at 06:21:44PM -0400, Lyude Paul wrote:
> > > From: Boqun Feng <boqun.feng@gmail.com>
> > > 
> > > Currently the nested interrupt disabling and enabling is present by
> > > _irqsave() and _irqrestore() APIs, which are relatively unsafe, for
> > > example:
> > > 
> > > 	<interrupts are enabled as beginning>
> > > 	spin_lock_irqsave(l1, flag1);
> > > 	spin_lock_irqsave(l2, flag2);
> > > 	spin_unlock_irqrestore(l1, flags1);
> > > 	<l2 is still held but interrupts are enabled>
> > > 	// accesses to interrupt-disable protect data will cause races.
> > > 
> > > This is even easier to triggered with guard facilities:
> > > 
> > > 	unsigned long flag2;
> > > 
> > > 	scoped_guard(spin_lock_irqsave, l1) {
> > > 		spin_lock_irqsave(l2, flag2);
> > > 	}
> > > 	// l2 locked but interrupts are enabled.
> > > 	spin_unlock_irqrestore(l2, flag2);
> > > 
> > > (Hand-to-hand locking critical sections are not uncommon for a
> > > fine-grained lock design)
> > > 
> > > And because this unsafety, Rust cannot easily wrap the
> > > interrupt-disabling locks in a safe API, which complicates the design.
> > > 
> > > To resolve this, introduce a new set of interrupt disabling APIs:
> > > 
> > > *	local_interrupt_disable();
> > > *	local_interrupt_enable();
> > > 
> > > They work like local_irq_save() and local_irq_restore() except that 1)
> > > the outermost local_interrupt_disable() call save the interrupt state
> > > into a percpu variable, so that the outermost local_interrupt_enable()
> > > can restore the state, and 2) a percpu counter is added to record the
> > > nest level of these calls, so that interrupts are not accidentally
> > > enabled inside the outermost critical section.
> > > 
> > > Also add the corresponding spin_lock primitives: spin_lock_irq_disable()
> > > and spin_unlock_irq_enable(), as a result, code as follow:
> > > 
> > > 	spin_lock_irq_disable(l1);
> > > 	spin_lock_irq_disable(l2);
> > > 	spin_unlock_irq_enable(l1);
> > > 	// Interrupts are still disabled.
> > > 	spin_unlock_irq_enable(l2);
> > > 
> > > doesn't have the issue that interrupts are accidentally enabled.
> > > 
> > > This also makes the wrapper of interrupt-disabling locks on Rust easier
> > > to design.
> > > 
> > > Signed-off-by: Boqun Feng <boqun.feng@gmail.com>
> > > 
> > > ---
> > > V10:
> > > * Add missing __raw_spin_lock_irq_disable() definition in spinlock.c
> > > 
> > > Signed-off-by: Lyude Paul <lyude@redhat.com>
> > 
> > Your SOB is placed wrong, should be below Boqun's. This way it gets
> > lost.
> > 
> > Also, is there effort planned to fully remove the save/restore variant?
> > As before, my main objection is adding variants with overlapping
> > functionality while not cleaning up the pre-existing code.
> > 
> 
> My plan is to map local_irq_disable() to local_interrupt_disable() and
> keep local_irq_save() as it is. That is, local_irq_disable() is the
> auto-pilot version and local_irq_save/restore() is the manual version.
> The reason is that I can see more "creative" (i.e. unpaired) usage of
> local_irq_save/restore(), and maybe someone would like to keep them.
> Thoughts?

My thought is it is better to keep them separate at first, let
local_interrupt_disable() stabilize with a few users, then convert the
callers (possibly with deprecation warnings with checkpatch), and then remove
the old API.

That appears lowest risk and easier transition.

thanks,

 - Joel

