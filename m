Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 365262153CB
	for <linux-kernel@vger.kernel.org>; Tue,  4 Feb 2025 13:21:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738675319; cv=none; b=G5dV5tE5wm5QTBKyQFWxWyk6jVxhVpIhLPRVoK7O/7aDE+Fcv+jjhRKgRVY+cW7Gl6Bjn7yB8oX23AU61n0PNy8/9r1LLUfW4hobPNmXRAzlLHksHP9tR3yyh+RoXW3v43vkeM/kc4fdyup23B8pZl3BWxbk+bFrr9Xhdf4j1uc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738675319; c=relaxed/simple;
	bh=IF1zXuefYm5EPoZt4v+gsQ9Z3bt9qz4rG91VgAFndqI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MCTPyEVatdKWI06YkN3vkipAgGJLfqC+giFi7SmtxPSP4krGdRGFMm830Svsn4rhSYD/XNZ5XeDk+WXAnHbMv5NUR8/JPwVo1PyfbAlIM+filfB+TuikjnuCGty7h+atH/90nykpZjwbCsA0OU+Um+pQIzxGV0LMubG4bM5E5p4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=djLIrm1/; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="djLIrm1/"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-aaeef97ff02so881042466b.1
        for <linux-kernel@vger.kernel.org>; Tue, 04 Feb 2025 05:21:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1738675315; x=1739280115; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=19dcwyLK6HxBt3Sl1K7BYugVtKLA9XCCs/I2A977sT8=;
        b=djLIrm1/FQJS1ZQjK5e8+u/deqFLZcAE/ssEVSgRo5Y60LXlnjMIz2sOQvzdS0E7+y
         st0qDQhPFetgwdODpkFLCnGOZzSPI4yW4+u77NyUF68C7wSwPafzVGLjVLrbBrv0IuTQ
         DwTXr8Nb6w/wSrpda2WYMpW+VmgqKBEphrCIIs+E31wRwgc/nSSPISsv9uK+rdLwDGyf
         cWW+TkrQhbNybQcgKnRVZOqZDi5HzybP2tTFmDHvy2we34WfQNR1/KgtTwOacTqiG475
         4fPqQiOef8BG9FGI+prmgroIUcn2Id2iVZMEoUGghzZ0sUdDiWHDG20FKl+AXIduu83z
         /4dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738675315; x=1739280115;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=19dcwyLK6HxBt3Sl1K7BYugVtKLA9XCCs/I2A977sT8=;
        b=H5YHobOnpHaaI4ywpRsfORq4mNH2AVXrkoCStojioSozU0V92CFG8E2oegKCA/eRCw
         8+eDgvAA6lUVvh5MYUo2/eN/FbxSxrKVQcOFGVpl6zkyvmt/Onk1+gzFalBXP2dGLLBz
         HO9InuYezUtxk3jwAjlsMCrkxgljDLc/DDTJxm8nLtFGg8EjWMB6bv9xYHWHhKm31m7F
         URxIladBgwjCQEpffR8cpHzXUOo/hvX8Qz+xXXHWnmMzop74/GKhFPD+YapGnfY7XjfD
         akFC9Str4ScU2X5qN4KucA/FLHu2BCJUtgs9CD9z0kK/vgjMNbcoWg5VFzulHUoek9S0
         A0Rw==
X-Forwarded-Encrypted: i=1; AJvYcCU70GpCpXR17TBhYgZzSEuIuPaNY1UZL4wniPo8iQ/1vHi9A7TFPQ8deUe5h1hKQ9N+FdVkPMpvFrmgadk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxRKt2hj13svqVekkVs3aHT2s6Oi+ly0Da32Rs3wJ52JagKIxJA
	oJhKfriS2ZgJr8lpBG1vkBVT7fwCkvVAugqyKb8hnjVAhgUsdYpjUn9TRveQ8oA=
X-Gm-Gg: ASbGnct9l23awWHFHKNEAS2NorFlPYPRWrxEu9TZUT+NwBgcyRoD2+0EgEUzrCJoPaV
	irtrbJjN93SXRILP7p8LwEtksbTCb2Ky8G9EzbFaNto2tVI/kY+dHgLMsVJz3bN0CZ0LS+4MIMa
	fTrklRpW0MZQfzmEe4BGUCB7w44INsarslCvqOV0H6lOEDeJq83y+EECULRwUVMINYRkDI/Drvt
	t8H90WzN5ABcLp5fj4eQz5ozMCOP6suCx9sCJcqlkqCDGtaUTWl+7fWV0NsVjwz3BcA5OZm4W+q
	qZrGL1PiV5uUbHA7Yg==
X-Google-Smtp-Source: AGHT+IHo5NL/NiI3D81PFENm/glWsRlkC2C4A2oLyjusvgNEHIC8iCR7HCIqqnOROVR9nt6c7d2hQA==
X-Received: by 2002:a17:907:6096:b0:ab6:d79f:abe6 with SMTP id a640c23a62f3a-ab6d79faf7amr2766102566b.15.1738675315328;
        Tue, 04 Feb 2025 05:21:55 -0800 (PST)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab703fbcc0csm698691366b.53.2025.02.04.05.21.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Feb 2025 05:21:55 -0800 (PST)
Date: Tue, 4 Feb 2025 14:21:53 +0100
From: Petr Mladek <pmladek@suse.com>
To: Yafang Shao <laoar.shao@gmail.com>
Cc: jpoimboe@kernel.org, jikos@kernel.org, mbenes@suse.cz,
	joe.lawrence@redhat.com, live-patching@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 2/2] livepatch: Implement livepatch hybrid mode
Message-ID: <Z6IUcbeCSAzlZEGP@pathway.suse.cz>
References: <20250127063526.76687-1-laoar.shao@gmail.com>
 <20250127063526.76687-3-laoar.shao@gmail.com>
 <Z5eYzcF5JLR4o5Yl@pathway.suse.cz>
 <CALOAHbANtpY+ee9Wd+HV6-uPOw+Kq1JcU5UdOXjz8m_UJ_-XRA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CALOAHbANtpY+ee9Wd+HV6-uPOw+Kq1JcU5UdOXjz8m_UJ_-XRA@mail.gmail.com>

On Mon 2025-01-27 23:34:50, Yafang Shao wrote:
> On Mon, Jan 27, 2025 at 10:31 PM Petr Mladek <pmladek@suse.com> wrote:
> >
> > On Mon 2025-01-27 14:35:26, Yafang Shao wrote:
> > > The atomic replace livepatch mechanism was introduced to handle scenarios
> > > where we want to unload a specific livepatch without unloading others.
> > > However, its current implementation has significant shortcomings, making
> > > it less than ideal in practice. Below are the key downsides:
> >
> > [...]
> >
> > > In the hybrid mode:
> > >
> > > - Specific livepatches can be marked as "non-replaceable" to ensure they
> > >   remain active and unaffected during replacements.
> > >
> > > - Other livepatches can be marked as "replaceable," allowing targeted
> > >   replacements of only those patches.
> > >
> > > This selective approach would reduce unnecessary transitions, lower the
> > > risk of temporary patch loss, and mitigate performance issues during
> > > livepatch replacement.
> > >
> > > --- a/kernel/livepatch/core.c
> > > +++ b/kernel/livepatch/core.c
> > > @@ -658,6 +658,8 @@ static int klp_add_nops(struct klp_patch *patch)
> > >               klp_for_each_object(old_patch, old_obj) {
> > >                       int err;
> > >
> > > +                     if (!old_patch->replaceable)
> > > +                             continue;
> >
> > This is one example where things might get very complicated.
> 
> Why does this example even exist in the first place?
> If hybrid mode is enabled, this scenario could have been avoided entirely.

How exactly this scenario could be avoided, please?

In the real life, livepatches are used to fix many bugs.
And every bug is fixed by livepatching several functions.

Fix1 livepatches: funcA
Fix2 livepatches: funcA, funcB
Fix3 livepatches: funcB

How would you handle this with the hybrid model?

Which fix will be handled by livepatches installed in parallel?
Which fix will be handled by atomic replace?
How would you keep it consistent?

How would it work when there are hundreds of fixes and thousands
of livepatched functions?

Where exactly is the advantage of the hybrid model?

> >
> > The same function might be livepatched by more livepatches, see
> > ops->func_stack. For example, let's have funcA and three livepatches:
> > a
> >   + lp1:
> >         .replace = false,
> >         .non-replace = true,
> >         .func = {
> >                         .old_name = "funcA",
> >                         .new_func = lp1_funcA,
> >                 }, { }
> >
> >   + lp2:
> >         .replace = false,
> >         .non-replace = false,
> >         .func = {
> >                         .old_name = "funcA",
> >                         .new_func = lp2_funcA,
> >                 },{
> >                         .old_name = "funcB",
> >                         .new_func = lp2_funcB,
> >                 }, { }
> >
> >
> >   + lp3:
> >         .replace = true,
> >         .non-replace = false,
> >         .func = {
> >                         .old_name = "funcB",
> >                         .new_func = lp3_funcB,
> >                 }, { }
> >
> >
> > Now, apply lp1:
> >
> >       + funcA() gets redirected to lp1_funcA()
> >
> > Then, apply lp2
> >
> >       + funcA() gets redirected to lp2_funcA()
> >
> > Finally, apply lp3:
> >
> >       + The proposed code would add "nop()" for
> >         funcA() because it exists in lp2 and does not exist in lp3.
> >
> >       + funcA() will get redirected to the original code
> >         because of the nop() during transition
> >
> >       + nop() will get removed in klp_complete_transition() and
> >         funcA() will get suddenly redirected to lp1_funcA()
> >         because it will still be on ops->func_stack even
> >         after the "nop" and lp2_funcA() gets removed.
> >
> >            => The entire system will start using another funcA
> >               implementation at some random time
> >
> >            => this would violate the consistency model
> >
> >
> > The proper solution might be tricky:
> >
> > 1. We would need to detect this situation and do _not_ add
> >    the "nop" for lp3 and funcA().
> >
> > 2. We would need a more complicate code for handling the task states.
> >
> >    klp_update_patch_state() sets task->patch_state using
> >    the global "klp_target_state". But in the above example,
> >    when enabling lp3:
> >
> >     + funcA would need to get transitioned _backward_:
> >          KLP_TRANSITION_PATCHED -> KLP_TRANSITION_UNPATCHED
> >       , so that it goes on ops->func_stack:
> >          lp2_funcA -> lp1->funcA
> >
> >    while:
> >
> >     + funcA would need to get transitioned forward:
> >          KLP_TRANSITION_UNPATCHED -> KLP_TRANSITION_PATCHED
> >       , so that it goes on ops->func_stack:
> >          lp2_funcB -> lp3->funcB
> >
> >
> > => the hybrid mode would complicate the life for both livepatch
> >    creators/maintainers and kernel code developers/maintainers.
> >
> 
> I don’t believe they should be held responsible for poor
> configurations. These settings could have been avoided from the start.
> There are countless tunable knobs in the system—should we try to
> accommodate every possible combination? No, that’s not how systems are
> designed to operate. Instead, we should identify and follow best
> practices to ensure optimal functionality.

I am sorry but I do not understand the above paragraph at all.

Livepatches modify functions.
How is it related to system configuration or tunable knobs?
What best practices are you talking, please?

Best Regards,
Petr
