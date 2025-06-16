Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2083.outbound.protection.outlook.com [40.107.236.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09A9321ABAD;
	Mon, 16 Jun 2025 18:10:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.83
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750097409; cv=fail; b=l1ZdMItoBCLV6nozTJsAQlun3qUn8gLqo9HjXTmzBoVc5CWpZpEmKynNPT8LKratlSqgECDnkbxFLCjrSuCWVb+GICDyyQ6NrMHkGYX3WEiY0TzgkllZfAm5jQvG5QcAkCebOKJsRWebVVQbr+MzH2MW3rwt5BaxeGHBh1QkbKA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750097409; c=relaxed/simple;
	bh=IAIFvOR1COG7wwN10uZHaR5cENnTSlF+WI026wQSNkE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Bk2a+59+Bo7KkfAyvNSfBD7lInN8ToGjAyn2yF2zIQ6W8hsILQHM6gnqea9U0tVmMHqRSBndLleDc7pOkc+3KdqQ40SrFboFMGJ5NkVYsgViGt4CDl2c3ccpkoZOwQ5qfElJhcbBHg3n9hwI6L2hKwrvpU158S8uz4TCEJ1Ft0E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=E1lN29Kx; arc=fail smtp.client-ip=40.107.236.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="E1lN29Kx"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oo0O7ksXpNQaNQgWTC5u4m0zL+WKUupHvP5WDx64cIr3iDwqxqQq5CqHM1pJOKdAMH2jdtGX3+bOo5Pqy+lJNSI6ZokeTWvXkrJdeLVSTc/+MgvZMZdMizMZAuvXNIeuvrSsGcgSu3HBVeasREcIPdup0Y9p8Gw0uJ2erh9ulJ/hLuhBv+ScXrE2EWr8hQTmJIXkWQg/3zFt1EvUOjxF2HVKZAD+BfASJpkOXo+qnBodhp71ZF+TmxlJK0SwH1Mn0Zq9R+m5AxM+KJzowTlMMIWi+7sV2ubxvN70gNmDJYJB5R1mRhV7evP7/ypiWRVwneo9AHewLshP066NXBoCOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iU7kJhWWyr3F62YZky3PoHCib8qdYR8w2eHbFXkPgOg=;
 b=YHx6Fdkpv+Rr/ckGYBkXD1WpkszHWqDy7j3HW+EU5nkYN7Nj/PZJW9Ouw7tfCH3yo4jW4NdSNQP/r3qAVGbu1CFqvLSZP6JGK5cFyjz75rhBknKi4KrIdIhf4kOpfWEavZvA0TMR7UqYhwNYebJmKZ7/PaavJ300me3oARsQnXh7H6nphh2jfiliSxDbSx6nGgB/2PVO/s9o2K2qqNIwmxYlkFs5x/nHYZleskmYqylvnLuOdevzg6YfVEs+0SBNgtMazQPlcKU7Fl9JiEi91IkJWA7OJXFreSt8jGKlliNbFmS3NLCQGjrrNb7nN6sLcJIDv4OYEZ901M8kmDywJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iU7kJhWWyr3F62YZky3PoHCib8qdYR8w2eHbFXkPgOg=;
 b=E1lN29KxnVQ8N4GsndRtnOqKpZa8qtIznxC1s2Ahovzb1Pn4prVfoZtofI79ta1egmIHXt60Z7ND6XzW8BZB3S5Kn8K2Y5fQvYC19k2bub0T/HrotNiJ/DmO4MG2WLONJq1BJNHZ809vax7hgyXgDmeSwY6iYCQj1ETBf2vB6pZFrHTfUxZMZ+ZyJl9BXkVuxOKxAxxz5txBzI6MIZMc9VBKLD1GW0mc4YfIkeUM0l/Tovy0+MPFGyKvFj3sgbMJWssf0ZFId5K+P2YchvMVngRYdgbn8x1nlKAsUjwwftwNbzZgkLVO3Il19aekfMOm8jZscEyfKJRQuYM1qt/tKw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by SN7PR12MB7810.namprd12.prod.outlook.com (2603:10b6:806:34c::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.33; Mon, 16 Jun
 2025 18:10:03 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%3]) with mapi id 15.20.8835.027; Mon, 16 Jun 2025
 18:10:02 +0000
Date: Mon, 16 Jun 2025 14:10:01 -0400
From: Joel Fernandes <joelagnelf@nvidia.com>
To: Lyude Paul <lyude@redhat.com>
Cc: rust-for-linux@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
	Boqun Feng <boqun.feng@gmail.com>, linux-kernel@vger.kernel.org,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Juri Lelli <juri.lelli@redhat.com>,
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
Message-ID: <20250616181001.GA905960@joelnvbox>
References: <20250527222254.565881-1-lyude@redhat.com>
 <20250527222254.565881-4-lyude@redhat.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250527222254.565881-4-lyude@redhat.com>
X-ClientProxiedBy: BN9PR03CA0383.namprd03.prod.outlook.com
 (2603:10b6:408:f7::28) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|SN7PR12MB7810:EE_
X-MS-Office365-Filtering-Correlation-Id: 5de2c9a2-8a3a-413b-c730-08ddad0103ca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?0x+BecRMGgq2IIrn1jAuHbimULJiKRozRPDxlQDPBpiAUNUDX/ltfb9W0SZQ?=
 =?us-ascii?Q?5D5CdcMohLC0jDatZMrZ2vrIGfsC3RuNO98VLxTY52Iv8kk5+3CqPlqYqkFT?=
 =?us-ascii?Q?d8PsH3Dg6EYDsPRnN0nyI9TWJJcd0hWEkHOQjBL7U/aSCcmsZOe4w/Iv+d9D?=
 =?us-ascii?Q?3yNJOs++920fJ/LM0bNf0ogE0UnanqbcU1nhHwqhgnteBCRnfQ0AUtfq9ay3?=
 =?us-ascii?Q?Ze79Zc1sKDE+oaknkqKal8SyFB+O20rL4aRZtdgylLnax0S/a7cfYP6QUm3d?=
 =?us-ascii?Q?FxjOqi8Jf7VExhT9YwZqkhAIZQhg1TmuML1r1Loj4LL6RP93eNbpGUZdXOQK?=
 =?us-ascii?Q?Fe3lLP9fY400lgRtRLmN4x2PS4uPNJtwU4grIeByHPwFaYeObOuqShPttoSc?=
 =?us-ascii?Q?CXOAmxEJQie9Yuo3VW3lk6xV4DmPl9Sbtv0OlsgH1pSkQ6zS/HzU9L+GBdqU?=
 =?us-ascii?Q?Yqbouvzcie9pqir0G1pSabvtLYTFXTTCUOXvw8GzjTyj4c7EJlMzb5yKiM5o?=
 =?us-ascii?Q?B7ygltt0gEx/hwaBpdRjiS8dGKnTwH+nYHq7RDwgizo/niVPdsFomIUrEBFv?=
 =?us-ascii?Q?ua3JORNIpsG/SU2Xd4c4ube+MOWY1hpwU30o1MkV35AsuC/x77M+5d1kp7PA?=
 =?us-ascii?Q?mSz07R8pHaGo8lw3v+8OEfThDbRAcWBGTfXdNgJElBJ2fVQOYzz1IXUB5Rh5?=
 =?us-ascii?Q?3xlQo7Xzee7CIrAvl3dV14Qfr9IFL3Y/6M6LbNUs4MC9AfD8gNRfMo6+SlWQ?=
 =?us-ascii?Q?NWPYw+YlAs+TRTRjFBV9ZV3Gh6UxT2yAGCju52r/Pf/uXDv4v8VjJkd4VXBB?=
 =?us-ascii?Q?R0lu16cb8ZjfdcDYte7uYmSTeNbNU1NKEQPrp1OLXNb22ZYSIAd2d0dl87Hd?=
 =?us-ascii?Q?NCmYTGEHF1sVsQ6G4xdxOhQwcslMm0oiI5uxE54Nq80ZBDRCA5xQG3CyTgq0?=
 =?us-ascii?Q?2BX7GGT0w9BIKl5ww010HSBmwom3ZHlVnzGHW7RFMoY2D8bxCd0n2N4EryY3?=
 =?us-ascii?Q?69aGXCpa2gDalOyNi0/yW/ooBOMvfd2v5bmFg5T75/rEKd/emHpKbyWqPMHd?=
 =?us-ascii?Q?vS8n8JlLduVVyk+mzO+IIVp7byGt90G5UFTaeoa3CHB+HM8a7z+uCytmJUoY?=
 =?us-ascii?Q?PfSNEhrqxYbSVeAkPUsA/GCDz7iUQjrbGG5+L7IX71CxjCATunG/DqnuQFDA?=
 =?us-ascii?Q?j7a+Mq68v6OwMm3Bkb502SMsPfpnOqwbPWLFM3vf8KRlGQEiiIpvtJFuJXAP?=
 =?us-ascii?Q?kqN8GcruY9nxu9Fv07CFDHZYO9Ojyy+7Ke1qj17TClnCiWEg6E6mCSWU1Xgm?=
 =?us-ascii?Q?kAtfnsv2CdDhnX92rd2jA1wWMzO6cuX/3LSouWEjsFbWupHdspvzejgXjnXo?=
 =?us-ascii?Q?4Uz+TbONVKmseBsNYYcoBJVw33EmXYqSOzmbgjkT0RDvmdJLeWGLwkIl3yAF?=
 =?us-ascii?Q?h4jxqC2Kw40=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR12MB8059.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?/8StcK7hv4nbtlFh6dTzKg2KV1h6XAs6MLkYODs0Sq+3/QuEUqOLfdOG3JCd?=
 =?us-ascii?Q?lAjNT+JKHGBVp3qLi8FuKLrS3zfRYR83JHKHLu6oKQ/ZFlpQplU4ev13vdtm?=
 =?us-ascii?Q?79ybIX5VPq/9wWCXwNR5ZKwjm7JNuikgXTlq+bCopkT9yP+WQm7CfoRS72bd?=
 =?us-ascii?Q?4q07xv5b8mPn6DDl5p+wyVrKaDn3njCUjGFLFVmoiKgJ26mD8ogNb7pqIcbr?=
 =?us-ascii?Q?MZYKV9fpCCVzh1WhrWofUUnpG+6RF3DByyOvAtSiy536hSyfzTkKHS0YokhZ?=
 =?us-ascii?Q?DeBpQwNM/VOMTKzlNuyEPkhq/n6Uxqi9WuaPHGIbUUvuwM3ai8YjGTJqXQ7J?=
 =?us-ascii?Q?m/GACb5pD9+zWF4oZIvpwpQClMuqVdSsTWbxHMBBkTBdImvvZ0IuT4xs9Zd7?=
 =?us-ascii?Q?Zoht2IFZUQIwRcnUYve6qVsxfE3lv1ICsKSOvCBKRVbhbvZTsHO3AKkiuEk+?=
 =?us-ascii?Q?pYMQvrRymLHmaw1C8Z1kpvQfyoLigbZFdcV5Ok2KHKd3qZiuG/JWLfp6Xyq3?=
 =?us-ascii?Q?WL/96T2avH5NUvJnYgNxMH84hi5r39uBxdwbM6JmloWhxGPBI/O77SPQeSRd?=
 =?us-ascii?Q?qx8UCBCwjMbbufB7kks7Rb8MoYk70HeXVc4YXPQZiLJa88jztJ+e+Tpp1/UN?=
 =?us-ascii?Q?6Bn2b8XzTh+TavEkqCI4gpzMU5ePUef+qbGfe1J6mDXPsN13wHPbM/MIy0b0?=
 =?us-ascii?Q?fAYR3Ztl4H/ApuLs/WjPBtkmv9/iWuD1Pw42GeQGOkriQikItLy1lEjm1eH9?=
 =?us-ascii?Q?q/poZT1QQEVgTtjgNJ2lntddeqcGdvhxu31pHwYK+wQktpw4/nnbBvigHmm1?=
 =?us-ascii?Q?lM9LHLbFx0e/u7RElKdHjDxSBP1jKxjQkxzX/gBMzYQGSQoASGmjdJfKY8Pt?=
 =?us-ascii?Q?deIW5VijVHkGK2+7zO+4Ugqp5j+ZS2CJC9jn1Y1bvQTc9KhyRtPFuqhf53nC?=
 =?us-ascii?Q?uSQyS2O+GKHAZCMBsScnEE4pZP1SkueD1lb73CxqZbo5Jt7qZo4oYaq+r2JO?=
 =?us-ascii?Q?4fxhV17FW74BtQXyb99K5b4iRzR84NK1plcDy+lG9DcX5zATm0Q9B9jCrErW?=
 =?us-ascii?Q?NDJ3OYODbDPnE4biOnqZWGFh90Exz+3q/AZ9P4110BhHMRgI9ZwRzDyIsOp1?=
 =?us-ascii?Q?QY0Wi8lNq92DXf/YLNR77K1j+3f/CBNIkyjmY+HzWQ9Hdz7Wbu6lqoZYvlop?=
 =?us-ascii?Q?7s/aHK+AqsNaYBrOlAkwAok4seOCgFrB7Qw8ykZY2oyp4y13TmX3p+5pwX8P?=
 =?us-ascii?Q?5ogwZHPt+YtFUWpVWxglwqXFXHNWsPvEsVvEtANZiceq8AsjMqKkqsPQAx0M?=
 =?us-ascii?Q?bUWSANEKBiKJHuwBk4Vrb/FFPAwcEQV2n8INVx2MbhA+mbszv9/QdwRLE0J8?=
 =?us-ascii?Q?JwfQ1jyrdUNFXEMO2WkokExAD/YiXFFXi8K7LwomzdmOwJRvKeQw5TReEtdJ?=
 =?us-ascii?Q?Ue/78W2S8KFh6gCVUq05e6xtllLu+hWUjWrWHYf3/sZuYoTn+W/D4rhmAQ3I?=
 =?us-ascii?Q?kcKhagpUKFh/MdNZ1L10urabYtU5U5pizLi0t3g5QTc4/2uO5gcmucVKYVxc?=
 =?us-ascii?Q?D2wpfW5ZQlS2xqT0jPnMJ8rNeAiVqqfevFOC4/4J?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5de2c9a2-8a3a-413b-c730-08ddad0103ca
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2025 18:10:02.8987
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /sRgLmR6lGks5Re6+uoMYxqjkf1Xdh+BIzoxz4VN/B4pAXLj0agoyn+IZhBKfCXMSZObHIyJZMNaJhd5or0+/w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7810

On Tue, May 27, 2025 at 06:21:44PM -0400, Lyude Paul wrote:
> From: Boqun Feng <boqun.feng@gmail.com>
> 
> Currently the nested interrupt disabling and enabling is present by
> _irqsave() and _irqrestore() APIs, which are relatively unsafe, for
> example:
[...]
> diff --git a/include/linux/irqflags_types.h b/include/linux/irqflags_types.h
> index c13f0d915097a..277433f7f53eb 100644
> --- a/include/linux/irqflags_types.h
> +++ b/include/linux/irqflags_types.h
> @@ -19,4 +19,10 @@ struct irqtrace_events {
>  
>  #endif
>  
> +/* Per-cpu interrupt disabling state for local_interrupt_{disable,enable}() */
> +struct interrupt_disable_state {
> +	unsigned long flags;
> +	long count;

Is count unused? I found it in earlier series but not this one. Now count
should be in the preempt counter, not in this new per-cpu var?

Sorry if I missed it from some other patch in this series.  thanks,

 - Joel


> +};
> +
>  #endif /* _LINUX_IRQFLAGS_TYPES_H */
> diff --git a/include/linux/preempt.h b/include/linux/preempt.h
> index 809af7b57470a..c1c5795be5d0f 100644
> --- a/include/linux/preempt.h
> +++ b/include/linux/preempt.h
> @@ -148,6 +148,10 @@ static __always_inline unsigned char interrupt_context_level(void)
>  #define in_softirq()		(softirq_count())
>  #define in_interrupt()		(irq_count())
>  
> +#define hardirq_disable_count()	((preempt_count() & HARDIRQ_DISABLE_MASK) >> HARDIRQ_DISABLE_SHIFT)
> +#define hardirq_disable_enter()	__preempt_count_add_return(HARDIRQ_DISABLE_OFFSET)
> +#define hardirq_disable_exit()	__preempt_count_sub_return(HARDIRQ_DISABLE_OFFSET)
> +
>  /*
>   * The preempt_count offset after preempt_disable();
>   */
> diff --git a/include/linux/spinlock.h b/include/linux/spinlock.h
> index d3561c4a080e2..b21da4bd51a42 100644
> --- a/include/linux/spinlock.h
> +++ b/include/linux/spinlock.h
> @@ -272,9 +272,11 @@ static inline void do_raw_spin_unlock(raw_spinlock_t *lock) __releases(lock)
>  #endif
>  
>  #define raw_spin_lock_irq(lock)		_raw_spin_lock_irq(lock)
> +#define raw_spin_lock_irq_disable(lock)	_raw_spin_lock_irq_disable(lock)
>  #define raw_spin_lock_bh(lock)		_raw_spin_lock_bh(lock)
>  #define raw_spin_unlock(lock)		_raw_spin_unlock(lock)
>  #define raw_spin_unlock_irq(lock)	_raw_spin_unlock_irq(lock)
> +#define raw_spin_unlock_irq_enable(lock)	_raw_spin_unlock_irq_enable(lock)
>  
>  #define raw_spin_unlock_irqrestore(lock, flags)		\
>  	do {							\
> @@ -300,11 +302,56 @@ static inline void do_raw_spin_unlock(raw_spinlock_t *lock) __releases(lock)
>  	1 : ({ local_irq_restore(flags); 0; }); \
>  })
>  
> +#define raw_spin_trylock_irq_disable(lock) \
> +({ \
> +	local_interrupt_disable(); \
> +	raw_spin_trylock(lock) ? \
> +	1 : ({ local_interrupt_enable(); 0; }); \
> +})
> +
>  #ifndef CONFIG_PREEMPT_RT
>  /* Include rwlock functions for !RT */
>  #include <linux/rwlock.h>
>  #endif
>  
> +DECLARE_PER_CPU(struct interrupt_disable_state, local_interrupt_disable_state);
> +
> +static inline void local_interrupt_disable(void)
> +{
> +	unsigned long flags;
> +	int new_count;
> +
> +	new_count = hardirq_disable_enter();
> +
> +	if ((new_count & HARDIRQ_DISABLE_MASK) == HARDIRQ_DISABLE_OFFSET) {
> +		local_irq_save(flags);
> +		raw_cpu_write(local_interrupt_disable_state.flags, flags);
> +	}
> +}
> +
> +static inline void local_interrupt_enable(void)
> +{
> +	int new_count;
> +
> +	new_count = hardirq_disable_exit();
> +
> +	if ((new_count & HARDIRQ_DISABLE_MASK) == 0) {
> +		unsigned long flags;
> +
> +		flags = raw_cpu_read(local_interrupt_disable_state.flags);
> +		local_irq_restore(flags);
> +		/*
> +		 * TODO: re-read preempt count can be avoided, but it needs
> +		 * should_resched() taking another parameter as the current
> +		 * preempt count
> +		 */
> +#ifdef PREEMPTION
> +		if (should_resched(0))
> +			__preempt_schedule();
> +#endif
> +	}
> +}
> +
>  /*
>   * Pull the _spin_*()/_read_*()/_write_*() functions/declarations:
>   */
> @@ -376,6 +423,11 @@ static __always_inline void spin_lock_irq(spinlock_t *lock)
>  	raw_spin_lock_irq(&lock->rlock);
>  }
>  
> +static __always_inline void spin_lock_irq_disable(spinlock_t *lock)
> +{
> +	raw_spin_lock_irq_disable(&lock->rlock);
> +}
> +
>  #define spin_lock_irqsave(lock, flags)				\
>  do {								\
>  	raw_spin_lock_irqsave(spinlock_check(lock), flags);	\
> @@ -401,6 +453,11 @@ static __always_inline void spin_unlock_irq(spinlock_t *lock)
>  	raw_spin_unlock_irq(&lock->rlock);
>  }
>  
> +static __always_inline void spin_unlock_irq_enable(spinlock_t *lock)
> +{
> +	raw_spin_unlock_irq_enable(&lock->rlock);
> +}
> +
>  static __always_inline void spin_unlock_irqrestore(spinlock_t *lock, unsigned long flags)
>  {
>  	raw_spin_unlock_irqrestore(&lock->rlock, flags);
> @@ -421,6 +478,11 @@ static __always_inline int spin_trylock_irq(spinlock_t *lock)
>  	raw_spin_trylock_irqsave(spinlock_check(lock), flags); \
>  })
>  
> +static __always_inline int spin_trylock_irq_disable(spinlock_t *lock)
> +{
> +	return raw_spin_trylock_irq_disable(&lock->rlock);
> +}
> +
>  /**
>   * spin_is_locked() - Check whether a spinlock is locked.
>   * @lock: Pointer to the spinlock.
> diff --git a/include/linux/spinlock_api_smp.h b/include/linux/spinlock_api_smp.h
> index 9ecb0ab504e32..92532103b9eaa 100644
> --- a/include/linux/spinlock_api_smp.h
> +++ b/include/linux/spinlock_api_smp.h
> @@ -28,6 +28,8 @@ _raw_spin_lock_nest_lock(raw_spinlock_t *lock, struct lockdep_map *map)
>  void __lockfunc _raw_spin_lock_bh(raw_spinlock_t *lock)		__acquires(lock);
>  void __lockfunc _raw_spin_lock_irq(raw_spinlock_t *lock)
>  								__acquires(lock);
> +void __lockfunc _raw_spin_lock_irq_disable(raw_spinlock_t *lock)
> +								__acquires(lock);
>  
>  unsigned long __lockfunc _raw_spin_lock_irqsave(raw_spinlock_t *lock)
>  								__acquires(lock);
> @@ -39,6 +41,7 @@ int __lockfunc _raw_spin_trylock_bh(raw_spinlock_t *lock);
>  void __lockfunc _raw_spin_unlock(raw_spinlock_t *lock)		__releases(lock);
>  void __lockfunc _raw_spin_unlock_bh(raw_spinlock_t *lock)	__releases(lock);
>  void __lockfunc _raw_spin_unlock_irq(raw_spinlock_t *lock)	__releases(lock);
> +void __lockfunc _raw_spin_unlock_irq_enable(raw_spinlock_t *lock)	__releases(lock);
>  void __lockfunc
>  _raw_spin_unlock_irqrestore(raw_spinlock_t *lock, unsigned long flags)
>  								__releases(lock);
> @@ -55,6 +58,11 @@ _raw_spin_unlock_irqrestore(raw_spinlock_t *lock, unsigned long flags)
>  #define _raw_spin_lock_irq(lock) __raw_spin_lock_irq(lock)
>  #endif
>  
> +/* Use the same config as spin_lock_irq() temporarily. */
> +#ifdef CONFIG_INLINE_SPIN_LOCK_IRQ
> +#define _raw_spin_lock_irq_disable(lock) __raw_spin_lock_irq_disable(lock)
> +#endif
> +
>  #ifdef CONFIG_INLINE_SPIN_LOCK_IRQSAVE
>  #define _raw_spin_lock_irqsave(lock) __raw_spin_lock_irqsave(lock)
>  #endif
> @@ -79,6 +87,11 @@ _raw_spin_unlock_irqrestore(raw_spinlock_t *lock, unsigned long flags)
>  #define _raw_spin_unlock_irq(lock) __raw_spin_unlock_irq(lock)
>  #endif
>  
> +/* Use the same config as spin_unlock_irq() temporarily. */
> +#ifdef CONFIG_INLINE_SPIN_UNLOCK_IRQ
> +#define _raw_spin_unlock_irq_enable(lock) __raw_spin_unlock_irq_enable(lock)
> +#endif
> +
>  #ifdef CONFIG_INLINE_SPIN_UNLOCK_IRQRESTORE
>  #define _raw_spin_unlock_irqrestore(lock, flags) __raw_spin_unlock_irqrestore(lock, flags)
>  #endif
> @@ -120,6 +133,13 @@ static inline void __raw_spin_lock_irq(raw_spinlock_t *lock)
>  	LOCK_CONTENDED(lock, do_raw_spin_trylock, do_raw_spin_lock);
>  }
>  
> +static inline void __raw_spin_lock_irq_disable(raw_spinlock_t *lock)
> +{
> +	local_interrupt_disable();
> +	spin_acquire(&lock->dep_map, 0, 0, _RET_IP_);
> +	LOCK_CONTENDED(lock, do_raw_spin_trylock, do_raw_spin_lock);
> +}
> +
>  static inline void __raw_spin_lock_bh(raw_spinlock_t *lock)
>  {
>  	__local_bh_disable_ip(_RET_IP_, SOFTIRQ_LOCK_OFFSET);
> @@ -160,6 +180,13 @@ static inline void __raw_spin_unlock_irq(raw_spinlock_t *lock)
>  	preempt_enable();
>  }
>  
> +static inline void __raw_spin_unlock_irq_enable(raw_spinlock_t *lock)
> +{
> +	spin_release(&lock->dep_map, _RET_IP_);
> +	do_raw_spin_unlock(lock);
> +	local_interrupt_enable();
> +}
> +
>  static inline void __raw_spin_unlock_bh(raw_spinlock_t *lock)
>  {
>  	spin_release(&lock->dep_map, _RET_IP_);
> diff --git a/include/linux/spinlock_api_up.h b/include/linux/spinlock_api_up.h
> index 819aeba1c87e6..d02a73671713b 100644
> --- a/include/linux/spinlock_api_up.h
> +++ b/include/linux/spinlock_api_up.h
> @@ -36,6 +36,9 @@
>  #define __LOCK_IRQ(lock) \
>    do { local_irq_disable(); __LOCK(lock); } while (0)
>  
> +#define __LOCK_IRQ_DISABLE(lock) \
> +  do { local_interrupt_disable(); __LOCK(lock); } while (0)
> +
>  #define __LOCK_IRQSAVE(lock, flags) \
>    do { local_irq_save(flags); __LOCK(lock); } while (0)
>  
> @@ -52,6 +55,9 @@
>  #define __UNLOCK_IRQ(lock) \
>    do { local_irq_enable(); __UNLOCK(lock); } while (0)
>  
> +#define __UNLOCK_IRQ_ENABLE(lock) \
> +  do { __UNLOCK(lock); local_interrupt_enable(); } while (0)
> +
>  #define __UNLOCK_IRQRESTORE(lock, flags) \
>    do { local_irq_restore(flags); __UNLOCK(lock); } while (0)
>  
> @@ -64,6 +70,7 @@
>  #define _raw_read_lock_bh(lock)			__LOCK_BH(lock)
>  #define _raw_write_lock_bh(lock)		__LOCK_BH(lock)
>  #define _raw_spin_lock_irq(lock)		__LOCK_IRQ(lock)
> +#define _raw_spin_lock_irq_disable(lock)	__LOCK_IRQ_DISABLE(lock)
>  #define _raw_read_lock_irq(lock)		__LOCK_IRQ(lock)
>  #define _raw_write_lock_irq(lock)		__LOCK_IRQ(lock)
>  #define _raw_spin_lock_irqsave(lock, flags)	__LOCK_IRQSAVE(lock, flags)
> @@ -80,6 +87,7 @@
>  #define _raw_write_unlock_bh(lock)		__UNLOCK_BH(lock)
>  #define _raw_read_unlock_bh(lock)		__UNLOCK_BH(lock)
>  #define _raw_spin_unlock_irq(lock)		__UNLOCK_IRQ(lock)
> +#define _raw_spin_unlock_irq_enable(lock)	__UNLOCK_IRQ_ENABLE(lock)
>  #define _raw_read_unlock_irq(lock)		__UNLOCK_IRQ(lock)
>  #define _raw_write_unlock_irq(lock)		__UNLOCK_IRQ(lock)
>  #define _raw_spin_unlock_irqrestore(lock, flags) \
> diff --git a/include/linux/spinlock_rt.h b/include/linux/spinlock_rt.h
> index f6499c37157df..6ea08fafa6d7b 100644
> --- a/include/linux/spinlock_rt.h
> +++ b/include/linux/spinlock_rt.h
> @@ -93,6 +93,11 @@ static __always_inline void spin_lock_irq(spinlock_t *lock)
>  	rt_spin_lock(lock);
>  }
>  
> +static __always_inline void spin_lock_irq_disable(spinlock_t *lock)
> +{
> +	rt_spin_lock(lock);
> +}
> +
>  #define spin_lock_irqsave(lock, flags)			 \
>  	do {						 \
>  		typecheck(unsigned long, flags);	 \
> @@ -116,6 +121,11 @@ static __always_inline void spin_unlock_irq(spinlock_t *lock)
>  	rt_spin_unlock(lock);
>  }
>  
> +static __always_inline void spin_unlock_irq_enable(spinlock_t *lock)
> +{
> +	rt_spin_unlock(lock);
> +}
> +
>  static __always_inline void spin_unlock_irqrestore(spinlock_t *lock,
>  						   unsigned long flags)
>  {
> diff --git a/kernel/locking/spinlock.c b/kernel/locking/spinlock.c
> index 7685defd7c526..13f91117794fd 100644
> --- a/kernel/locking/spinlock.c
> +++ b/kernel/locking/spinlock.c
> @@ -125,6 +125,21 @@ static void __lockfunc __raw_##op##_lock_bh(locktype##_t *lock)		\
>   */
>  BUILD_LOCK_OPS(spin, raw_spinlock);
>  
> +/* No rwlock_t variants for now, so just build this function by hand */
> +static void __lockfunc __raw_spin_lock_irq_disable(raw_spinlock_t *lock)
> +{
> +	for (;;) {
> +		preempt_disable();
> +		local_interrupt_disable();
> +		if (likely(do_raw_spin_trylock(lock)))
> +			break;
> +		local_interrupt_enable();
> +		preempt_enable();
> +
> +		arch_spin_relax(&lock->raw_lock);
> +	}
> +}
> +
>  #ifndef CONFIG_PREEMPT_RT
>  BUILD_LOCK_OPS(read, rwlock);
>  BUILD_LOCK_OPS(write, rwlock);
> @@ -172,6 +187,14 @@ noinline void __lockfunc _raw_spin_lock_irq(raw_spinlock_t *lock)
>  EXPORT_SYMBOL(_raw_spin_lock_irq);
>  #endif
>  
> +#ifndef CONFIG_INLINE_SPIN_LOCK_IRQ
> +noinline void __lockfunc _raw_spin_lock_irq_disable(raw_spinlock_t *lock)
> +{
> +	__raw_spin_lock_irq_disable(lock);
> +}
> +EXPORT_SYMBOL_GPL(_raw_spin_lock_irq_disable);
> +#endif
> +
>  #ifndef CONFIG_INLINE_SPIN_LOCK_BH
>  noinline void __lockfunc _raw_spin_lock_bh(raw_spinlock_t *lock)
>  {
> @@ -204,6 +227,14 @@ noinline void __lockfunc _raw_spin_unlock_irq(raw_spinlock_t *lock)
>  EXPORT_SYMBOL(_raw_spin_unlock_irq);
>  #endif
>  
> +#ifndef CONFIG_INLINE_SPIN_UNLOCK_IRQ
> +noinline void __lockfunc _raw_spin_unlock_irq_enable(raw_spinlock_t *lock)
> +{
> +	__raw_spin_unlock_irq_enable(lock);
> +}
> +EXPORT_SYMBOL_GPL(_raw_spin_unlock_irq_enable);
> +#endif
> +
>  #ifndef CONFIG_INLINE_SPIN_UNLOCK_BH
>  noinline void __lockfunc _raw_spin_unlock_bh(raw_spinlock_t *lock)
>  {
> diff --git a/kernel/softirq.c b/kernel/softirq.c
> index 513b1945987cc..f7a2ff4d123be 100644
> --- a/kernel/softirq.c
> +++ b/kernel/softirq.c
> @@ -88,6 +88,9 @@ EXPORT_PER_CPU_SYMBOL_GPL(hardirqs_enabled);
>  EXPORT_PER_CPU_SYMBOL_GPL(hardirq_context);
>  #endif
>  
> +DEFINE_PER_CPU(struct interrupt_disable_state, local_interrupt_disable_state);
> +EXPORT_PER_CPU_SYMBOL_GPL(local_interrupt_disable_state);
> +
>  /*
>   * SOFTIRQ_OFFSET usage:
>   *
> -- 
> 2.49.0
> 
