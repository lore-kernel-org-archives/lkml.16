Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CCD33BB48
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 00:10:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746576653; cv=none; b=HGZmrd4Ud9T82PBCxcGOq2RDVPhSgr8hMWXYCB7iDadiavZZfxx+x/rFCcHgASeeowSfo/xCv0fCDnURbwO6cyauLj/kk0pZ54OhMsIgqdCByJblilmy6PyjaL6+T97r8jTnkkxI8tw85DvpObrSGTught1DCwT70BvMz4pCvN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746576653; c=relaxed/simple;
	bh=oDgUPGKFsW8595GnJVa8eZKTK3chh79fOciO/uFQHB4=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=oSEJMDi0hq8nJhcdxVn+YXaGPQZoLO/Y7tzYvu6l+aZ3DK/lwp/T2mYNxT2sZrxi49UEvAS8/Xk3nyxahRA83AL83IlXtcCta4dWQ3tXh6ZkRGSZhGWjvsnRx13XASc+DSCQyfcfY8Mdw+iHj8OiJBBAlDn7XhF5ApZurg5KloY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=hnj8VECe; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="hnj8VECe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F5BAC4CEEF;
	Wed,  7 May 2025 00:10:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1746576652;
	bh=oDgUPGKFsW8595GnJVa8eZKTK3chh79fOciO/uFQHB4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=hnj8VECe4xXdTXUtsonYBFVRdLaxLjTkmR9vS66O8ksAzzdUQem+loVccHfei+w2Y
	 qkeZZZKzFyYO+nTnXjTc6NeZ4PsyljtbLmd0EBIdGNo2nrKohrooeTnnQemvOYZFZW
	 39HnUMdK7FFFtWn/W7NgTML0z9B4gtme8lA0kNLk=
Date: Tue, 6 May 2025 17:10:51 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Mateusz Guzik <mjguzik@gmail.com>
Cc: Jeongjun Park <aha310510@gmail.com>, dennis@kernel.org, tj@kernel.org,
 cl@linux.com, jack@suse.cz, hughd@google.com, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] lib/percpu_counter: fix data race in
 __percpu_counter_limited_add()
Message-Id: <20250506171051.7c9a4bed6ff799e8060ca0d7@linux-foundation.org>
In-Reply-To: <aiap53zqms4igpmdxorv45xsgzyx44xb57jupr2ndiibu3qugo@mg53s6mdbq3j>
References: <20250506102402.88141-1-aha310510@gmail.com>
	<aiap53zqms4igpmdxorv45xsgzyx44xb57jupr2ndiibu3qugo@mg53s6mdbq3j>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 6 May 2025 13:56:13 +0200 Mateusz Guzik <mjguzik@gmail.com> wrote:

> >  	unknown = batch * num_online_cpus();
> >  	count = __this_cpu_read(*fbc->counters);
> >  
> > @@ -344,11 +345,10 @@ bool __percpu_counter_limited_add(struct percpu_counter *fbc,
> >  	    ((amount > 0 && fbc->count + unknown <= limit) ||
> >  	     (amount < 0 && fbc->count - unknown >= limit))) {
> >  		this_cpu_add(*fbc->counters, amount);
> > -		local_irq_restore(flags);
> > -		return true;
> > +		good = true;
> > +		goto out;
> >  	}
> >  
> > -	raw_spin_lock(&fbc->lock);
> >  	count = fbc->count + amount;
> >  
> >  	/* Skip percpu_counter_sum() when safe */
> > --
> > 
> 
> As this always takes the centralized lock in the fast path this defeats
> the point of using a per-cpu counter in the first place.

Well.  It partially "defeats the point" if the client code actually
uses percpu_counter_limited_add().  Only shmem.c does that.

> I noted this thing is buggy almost a year ago:
> https://lore.kernel.org/linux-mm/5eemkb4lo5eefp7ijgncgogwmadyzmvjfjmmmvfiki6cwdskfs@hi2z4drqeuz6/
> 
> per the e-mail I don't believe existence of this routine is warranted.
> 
> shmem is still the only consumer.

Totally.  It would be better to remove percpu_counter_limited_add() and
to implement its intended effect within shmem.c

