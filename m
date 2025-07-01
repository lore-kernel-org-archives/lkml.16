Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14570433A0
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 12:17:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751372267; cv=none; b=fpX3Yw27HBlV6ncOIckktxgho/W3dZFqakAEfly/Zs8Y7GVva41ZKWcfirautzg3QI+NZADT3BArBjB/kvWPf7lN/wHReKB2C8gkHYm0UxnModYzwTbuqV3hhjIl2+PdyOzF2b5+tdJAj+jH+OgmSAyv6Zfgfd3Zb6gsHjEcTsM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751372267; c=relaxed/simple;
	bh=wYk9AylY09l8uNGrSbHX4zHJJrhd4ZCoh4vmrv5C+yk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cOx5ezx7mMdkxO+Q+XTPW7ew58p7aQVg6+P2GkPUPVPHg7V9qZ7hNtmjrNwftup7uwG+wwgxXbMRT7Vysq+EIipkfvBIh8C71PfbqCTdOJ4MR/uYLkA/sbfadfKIltNbP855wu93GfDKHk7LCx4WMlzvacZtQs0ilkUGEu6QH/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=j9dHqDUu; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="j9dHqDUu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 201CBC4CEEB;
	Tue,  1 Jul 2025 12:17:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751372265;
	bh=wYk9AylY09l8uNGrSbHX4zHJJrhd4ZCoh4vmrv5C+yk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=j9dHqDUuFXoCVwqI0YMxOssOe9e0EytYKobmLZerE6qLZSotIufSHY0BMRuaN+RCm
	 3NSPZIhccwqUjUltprtiGRR79Jof+bTYUcMti+GCiGxFiJGOpcse0NpWOp2uHn9TkX
	 dKZCdVdwKv8pCcab2WprAF8bRpTcQZ8SKkTlalbXf1sHng8KW59mwCKHABaN3/x6EL
	 YkexOiUfruzLMztOhsKtQzIeLiiPLQdjhKxih55ufbMEv6py4C1FKHDSXIWmoW6Bin
	 7zFtxCvXUtvK/wti+bI5eTfseJDSHarq4IseZ1tNNwbi7n4+R2SsOuv9akGLVzqtjK
	 eaCChCEo4V3PA==
Date: Tue, 1 Jul 2025 14:17:42 +0200
From: Frederic Weisbecker <frederic@kernel.org>
To: Shrikanth Hegde <sshegde@linux.ibm.com>
Cc: LKML <linux-kernel@vger.kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Ingo Molnar <mingo@redhat.com>,
	Marcelo Tosatti <mtosatti@redhat.com>,
	Michal Hocko <mhocko@kernel.org>, Oleg Nesterov <oleg@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Valentin Schneider <vschneid@redhat.com>,
	Vlastimil Babka <vbabka@suse.cz>, linux-mm@kvack.org
Subject: Re: [PATCH 4/6] tick/nohz: Move nohz_full related fields out of hot
 task struct's places
Message-ID: <aGPR5srdOX8UWakS@localhost.localdomain>
References: <20250410152327.24504-1-frederic@kernel.org>
 <20250410152327.24504-5-frederic@kernel.org>
 <cd6d72c7-cdc7-4af6-b070-076f64887ee7@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cd6d72c7-cdc7-4af6-b070-076f64887ee7@linux.ibm.com>

Le Thu, Apr 24, 2025 at 12:10:26AM +0530, Shrikanth Hegde a écrit :
> 
> 
> On 4/10/25 20:53, Frederic Weisbecker wrote:
> > nohz_full is a feature that only fits into rare and very corner cases.
> > Yet distros enable it by default and therefore the related fields are
> > always reserved in the task struct.
> > 
> > Those task fields are stored in the middle of cacheline hot places such
> > as cputime accounting and context switch counting, which doesn't make
> > any sense for a feature that is disabled most of the time.
> > 
> > Move the nohz_full storage to colder places.
> > 
> > Signed-off-by: Frederic Weisbecker <frederic@kernel.org>
> > ---
> >   include/linux/sched.h | 14 ++++++++------
> >   1 file changed, 8 insertions(+), 6 deletions(-)
> > 
> > diff --git a/include/linux/sched.h b/include/linux/sched.h
> > index f96ac1982893..b5ce76db6d75 100644
> > --- a/include/linux/sched.h
> > +++ b/include/linux/sched.h
> > @@ -1110,13 +1110,7 @@ struct task_struct {
> >   #endif
> >   	u64				gtime;
> >   	struct prev_cputime		prev_cputime;
> > -#ifdef CONFIG_VIRT_CPU_ACCOUNTING_GEN
> > -	struct vtime			vtime;
> > -#endif
> > -#ifdef CONFIG_NO_HZ_FULL
> > -	atomic_t			tick_dep_mask;
> > -#endif
> >   	/* Context switch counts: */
> >   	unsigned long			nvcsw;
> >   	unsigned long			nivcsw;
> > @@ -1438,6 +1432,14 @@ struct task_struct {
> >   	struct task_delay_info		*delays;
> >   #endif
> > +#ifdef CONFIG_VIRT_CPU_ACCOUNTING_GEN
> > +	struct vtime			vtime;
> > +#endif
> > +
> > +#ifdef CONFIG_NO_HZ_FULL
> > +	atomic_t			tick_dep_mask;
> > +#endif
> > +
> >   #ifdef CONFIG_FAULT_INJECTION
> >   	int				make_it_fail;
> >   	unsigned int			fail_nth;
> > 
> 
> Hi Frederic.
> 
> maybe move these nohz related fields into their own cacheline instead?
> 
> 
> on PowerPC where we have 128byte cache instead, i see
> these fields are crossing a cache line boundary.
> 
> without patch:
> 	/* XXX last struct has 4 bytes of padding */
> 
> 	struct vtime               vtime;                /*  2360    48 */
> 	atomic_t                   tick_dep_mask;        /*  2408     4 */
> 	/* XXX 4 bytes hole, try to pack */
> 
> 	long unsigned int          nvcsw;                /*  2416     8 */
> 	long unsigned int          nivcsw;               /*  2424     8 */
> 	/* --- cacheline 19 boundary (2432 bytes) --- */
> 
> 
> With patch:
> 	struct vtime               vtime;                /*  3272    48 */
> 	struct callback_head       nohz_full_work;       /*  3320    16 */
> 	/* --- cacheline 26 boundary (3328 bytes) was 8 bytes ago --- */
> 	atomic_t                   tick_dep_mask;        /*  3336     4 */
> 

It's not much a big deal because those fields shouldn't be accessed much
closely in time. Also such a cache alignement is hard to maintain everywhere
when there are so many ifdefferies in that structure.

Thanks.

-- 
Frederic Weisbecker
SUSE Labs
