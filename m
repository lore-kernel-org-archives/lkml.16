Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5946C24729C
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 21:38:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749591484; cv=none; b=BEqvJDQ4QBofM+PFybNsr2RoOuUuri9ir/86Xp50FxbArTUlnBEKzP+6XfpteqYmjiHVvS/etMujyHMTzdE8g0uXih1pforGi2ApRchPChoheRmmjMGJltriKrpKJXs0r2oP6zeZwiSebQ6Osa22iXl9J0lDw+4FjnYNWFxuWeI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749591484; c=relaxed/simple;
	bh=pdhO4DMPIZII4BZaVvdEx5U9jIKTjh3FpPVXXtzfHg8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NB6HZucTXwZiiBkEyz9UFsiPY1TyjV0V6bhyKlJGi/ROp3oVA3VuJicJSgVgKsgW/tWLZpYLPqf/N5nbk9QDCXkErR7GA+rzEPvpV71qf5scw89x66mM/hqb54Af6sulgosEuDypS2DRDJleXwb/N2bmnqLjUDOAF9aqElJSSIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=J2IztQLO; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="J2IztQLO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C571AC4CEED;
	Tue, 10 Jun 2025 21:38:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749591484;
	bh=pdhO4DMPIZII4BZaVvdEx5U9jIKTjh3FpPVXXtzfHg8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=J2IztQLO/MJJ6vt9VnbQE2w1iA6i9qdGvPGXkN/2O0xejaE3NRhEgWbPRSiKGA7LO
	 Ex8Q9znR3kwb2ac+UquDrGldvaXHRVIi8oFBrVC9BgIXrgAcaUx3pVP2S7znXT9H4N
	 2cBgercJftsV1rjxZzDUXy/idG2A/NaLeO6pLHl0oFFsNIltJxlAvmmk8Cu8EUJRWF
	 zgMpfFmjy8JO063/zhrTduKsgda3XIpgOumdKLngauhP+A06o/0eq4JCLuP7i8zuqM
	 DeH62e6F3gClKBqVlWNQxqRQdqyXS/v2fTnuSPLGqZgZlm+bQN7JZ8fSr5sRLUxozo
	 5pyN6LBTSs/nQ==
Date: Tue, 10 Jun 2025 11:38:01 -1000
From: Tejun Heo <tj@kernel.org>
To: Marco Crivellari <marco.crivellari@suse.com>
Cc: linux-kernel@vger.kernel.org, Lai Jiangshan <jiangshanlai@gmail.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Frederic Weisbecker <frederic@kernel.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Michal Hocko <mhocko@suse.com>
Subject: Re: [PATCH v2 0/4] Workqueue: rename system workqueue and add
 WQ_PERCPU
Message-ID: <aEilufYKeex0diW-@slm.duckdns.org>
References: <20250609103535.780069-1-marco.crivellari@suse.com>
 <aEcvBadg_rT2_roQ@slm.duckdns.org>
 <CAAofZF6AfmjYcNQSBFHsteN_10=z0RSt20DpOM8i_NLQBO5qLQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAAofZF6AfmjYcNQSBFHsteN_10=z0RSt20DpOM8i_NLQBO5qLQ@mail.gmail.com>

Hello, Marco.

On Tue, Jun 10, 2025 at 10:34:15AM +0200, Marco Crivellari wrote:
> >- Separate out patches to add the new flag and wq. Don't add the warnings
> >  yet. I'll commit these patches to a separate wq branch.
> 
> Basically these means have 2 more patches, one for WQ_PERCPU (only the
> new flag, like in the v1 let's say) and another patch that adds the wq(s).
> 
> So, all the logic changes (also in __alloc_workqueue), pr_warn_once() will
> stay in the other patch (that you will apply later); this is not only 1 patch,
> following your next point.
> 
> If I understood correctly, it makes sense to me.

Yeah.

> >- Split out patches by subsystems. I know this is tedious but think it'd
> > still be worth doing. It doesn't have to be completely granular. e.g. We
> > know that network changes go through a single tree, so all network changes
> >  can be in a single patch. Each patch can explain the workqueue changes and
> >  that the patch can be either routed through the subysstem which would
> >  require pulling from the above wq branch, or, as the default option, we'd
> >  be happy to route the patch through the workqueue tree. I can create a
> >  separate branch to collect the conversion patches that can go through wq
> >  tree.
> 
> This impacts patch 3, so instead of 1 big patch, you are thinking of N patches,
> in order to add WQ_PERCPU to the callers of subsystems first.
> 
> So, something like:
> - net/
> - mm/
> - fs/
> 
> Do you have something different in mind?

No, that sounds fine.

> >- After the next rc1 drops, I can apply the patches to add warnings to the
> >  -fixes branch and then send them to Linus.
> 
> Sounds good.

I think we're in agreement.

Thanks.

-- 
tejun
