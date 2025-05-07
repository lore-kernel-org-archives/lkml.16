Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C233515E8B
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 00:42:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746578548; cv=none; b=P9AacTfp2H6fu1rxeso2zP0KTNpfBU3PJHH/PWX0aaG3RDcGBQJlrDfg6jWNFbWIlHsZ8cRQr4ha23ZSTZCjJ+3E/nOTUr3Bdcm98wgxqCuuWpPABFFnRBr/wkyHrDXNwfiM13eqoiECkQDzsRBbqoXlnh+yIbYTxEBV2O8fY/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746578548; c=relaxed/simple;
	bh=Rji2eeaP5Ev3tZhFRXgJ1dqG0yEWEdfxRUtVU++OOBo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jklVwPt/N3MwpGGKFxE9LEcQsfiZmrV4StM6Iakq0DXsmay3PcnlPucF1nEGU22UKUm70/65CQTizy87OPSyPORpZSDJGiqPhwfL0XmrUxKhLvs9PY4/vfd98R8kKjGY8BKoqleNzVlS0Ve3pUjoWQrOKGzptYAi9SG1lKTykuQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fXU5YDUW; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fXU5YDUW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15B3FC4CEE4;
	Wed,  7 May 2025 00:42:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746578548;
	bh=Rji2eeaP5Ev3tZhFRXgJ1dqG0yEWEdfxRUtVU++OOBo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fXU5YDUWTN64fQMXIswVQUYm+mxjpE+TeCDtMAaJfVLUYkEOfAABNaOCse2f5F2zg
	 70C99BtzvTgbEgPljr+Z6CyGeSKXtl+H6Fm1ujBxyd3TU8/t2zLWhWfzO8IZKCaRgC
	 kTndeo8NId4+xEc2O9s2BcLzwl9WFuzxeW9dIj9mRS+hiJdoWav7I64dbszAMLH/nf
	 e79YBMK/oFLFHNwfCQ4faufy7xjsXeuGUQFvgXmCHiXVqJoHXR1chCw0jJwhHaKtfD
	 lvdMWLrFSOac18/iP4NYLKUG6Hi2EYS+4AmKBJ1xFu+hJMJQp2H6CQcaDthD8VmpIS
	 DFs9CxNBZmBeA==
Date: Tue, 6 May 2025 14:42:26 -1000
From: Tejun Heo <tj@kernel.org>
To: Frederic Weisbecker <frederic@kernel.org>
Cc: Marco Crivellari <marco.crivellari@suse.com>,
	linux-kernel@vger.kernel.org,
	Lai Jiangshan <jiangshanlai@gmail.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Subject: Re: [PATCH 0/4] Workqueue: rename system workqueue and add WQ_PERCPU
Message-ID: <aBqscir2gawbEdg1@slm.duckdns.org>
References: <20250503082834.49413-1-marco.crivellari@suse.com>
 <aBlMLQl504ThYbnf@slm.duckdns.org>
 <CAAofZF60A82utmB2LiVw910cdFDiHd+fPaozUKpQwfXUqv7R_g@mail.gmail.com>
 <aBoGskbRu0RyRXMF@localhost.localdomain>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aBoGskbRu0RyRXMF@localhost.localdomain>

On Tue, May 06, 2025 at 02:55:14PM +0200, Frederic Weisbecker wrote:
> Le Tue, May 06, 2025 at 12:10:18PM +0200, Marco Crivellari a écrit :
> > Hi,
> > 
> > > Can you please make a summary of the discussion here? Referring to old
> > > thread is useful but it'd be nice to have the rationales laid out in the
> > > patchset - why this is desirable, what is the transition plan and what are
> > > the rationales for it? Also, please include a short summary in the patches.
> > 
> > Sure, thanks for the advice.
> > 
> > > Let's keep the old names for a release or two and trigger printk_once()
> > > warnings about the renames. These are pretty widely used, so I think it
> > > warrants a bit of extra effort.
> > 
> > Good, sounds fine.
> > But I don't understand where printk_once() should be placed.
> > Can you give me some further guidance?
> 
> So one possibility to achieve this is to not do a rename of system_wq
> to system_percpu_wq but eventually keep system_wq around and create the
> new system_percpu_wq. Convert all current users of system_wq to system_percpu_wq
> and warn from queue_work() when system_wq is used.
> 
> I would personally prefer that we use WARN_ON_ONCE() so that this really
> gets noticed. Tejun what do you think?

I'd stick with printk_once() at least for a while. There are systems set up
to panic on warnings and there will be a bunch of out-of-tree usages too.
Let's latch it up over multiple releases.

Thanks.

-- 
tejun
