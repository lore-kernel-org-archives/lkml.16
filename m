Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD9E3524C
	for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 19:10:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745262623; cv=none; b=NFzNeXe8iYvpjF3y9TKSgy38DdciTcqlu0pwYBR2/xVfDaRjRocuXxXUXhESsMUB4ATmePMkG5zkQbkApoOirfxhHCZL/3t7twNTGb1vaRk13Ylen/PhvOAYmEWk47Dp6SzwxDjRabxI9/vBO1dt20nuvzoc8GPdaoUlcfAvkfY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745262623; c=relaxed/simple;
	bh=EffN5AU/cdkBd8YS1Onj3cKs7xiTNrKttWUX5X5z1bI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fLc18St9TLLYP5Va9Myd82AmyF0du7FUKKdNWtuYsuixpP2v02qEW4QAIcjKJTbwk5vrGIGshMCmlVOln124DFCC3GHv0Ew9hDJZfl5AoOJTptXqZUWQFd8PDL1zpXcHMkNN5LJ2J6TR7gpkQFyymKrvZsqoUFQEkkwsUlFDFWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com; spf=pass smtp.mailfrom=cloudflare.com; dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.b=OcKHr0zC; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.b="OcKHr0zC"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-ac28e66c0e1so528363966b.0
        for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 12:10:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudflare.com; s=google09082023; t=1745262616; x=1745867416; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=r1S1uSa7FoRwaHzZSTsxi0LrpVP2lyVsfRagPo55QsM=;
        b=OcKHr0zCAcMmmtx2HFMAcExGvqxbLzveWfZhQNerWku3tg9GIqGKee9G+VVCnk7RwL
         YD5IPFn37SK/reR8Ae7bYSExFnYYY9K1vsDOxPXsvudi+cw53TLKiJ/DbO6djsrSB/p3
         OqahHeO0isMyzGBEXjx+uD7VSUlYJyLMzqOWe5jME5xk8peITCWlaj6vicYFSFrIJR0Q
         1auAs0xXJtcfsb7fIv1DbdGGoPllJMX78/Bg1fWKKPHJt4P9GwNqWRWoaAhhoSk1bBSl
         Ozd3o4o/uQ+VnE/cfNiTFv29lhaHydBKcaO40Ek39BmuBqQgmap2Z09OqoO6K1u2wPxN
         t+rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745262616; x=1745867416;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=r1S1uSa7FoRwaHzZSTsxi0LrpVP2lyVsfRagPo55QsM=;
        b=maKXMzgQMKpeBcFSWUmvLIhj/IvA2Un6D8Lr58Enzfy90cBhtXiIoH3CY6lo6KEBv4
         /r39AI1dEhbaDhtkayR2By3HjOh8wVK/Tb1+K+OnSM4AfrzezrzGfrlmUo65/ZqXh1Uj
         jCbZ6uTkSwPuT3EfhSn4d3G8971Ie8PJfp7syuGqI3mFNaBh5yCNJaouCdS57G2TndGA
         AyRfE4oSpLLHEvoG0mkte9AuyuaSyGoiv9qHVmTizIq9bbiQmrshDPj/kcC7i6se+p1a
         LSXO5hK8ZtFB7RSbNmsMAzxFpU0QIP+bT+dcejvBnD2dkFeo69r/7h8KyQiFiVVmRC2z
         snwQ==
X-Forwarded-Encrypted: i=1; AJvYcCVRgUEteE5hMHAGLxjbcCeoycWx8o9NfkKqqKhd8mAkTOakxGcmleorD4/MQjRw/SvfnX12nf770SwdVrc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz65lJW52C51GFK1NiEs8SpjprKwVd6i0AWg41Pqay4MGcCfNP6
	5ebL0MS/GX3k1edNHHecjGDW43OzN1hjCZLXay+HO3jGbuNMsdmPc0ZEZclZfxOG706CAS7W0Ap
	vu3RD8Hqa2wnCzLAlQPV9yUQYpoYeppkr1/pSuzL9y2tZGa7RGY4=
X-Gm-Gg: ASbGncsL0hy5hv1t+OzSK5M7EqJX6Qpile3x1iJIa/EFwGfmJTnWFR/027m+LeebF/6
	rTFUUq1xMvtkIP90ngJ4tg7kgG6O8mojms0GkUxyNE9/iHocimsNYaMx7GOYsTW9eyAG9f9/O08
	+Fad9PMuA0eaVNDwi4iLYpDmQIxFxVAAvpHrkSaw==
X-Google-Smtp-Source: AGHT+IHhxSy1dhJgyP+n70dvP4JqFFWuHoYZvVjGROAgwVB1NczKG5HA5ih0gg9sQN9MV2VKnuG4visGOKD+PfLA8fA=
X-Received: by 2002:a17:907:94cd:b0:acb:126f:5315 with SMTP id
 a640c23a62f3a-acb74d655b3mr1228786866b.37.1745262616324; Mon, 21 Apr 2025
 12:10:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAGis_TVSAPjYwVjUyur0_NFsDi9jmJ_oWhBHrJ-bEknG-nJO9Q@mail.gmail.com>
 <aAZiwGy1A7J4spDk@kbusch-mbp.dhcp.thefacebook.com> <CAGis_TXyPtFiE=pLrLRh1MV3meE4aETi6z36NWLrMkYKkcjGNQ@mail.gmail.com>
 <aAaUKenXzkFPZaMb@kbusch-mbp.dhcp.thefacebook.com>
In-Reply-To: <aAaUKenXzkFPZaMb@kbusch-mbp.dhcp.thefacebook.com>
From: Matt Fleming <mfleming@cloudflare.com>
Date: Mon, 21 Apr 2025 20:10:05 +0100
X-Gm-Features: ATxdqUHhg4My8tEKsLC6N8JZACE9F23SwZ1M4WR2RYDmsf3_2nCe3Gn1GdYAHvM
Message-ID: <CAGis_TU1V2_L227SP9Ut1gSTNx9-AT9nbwgJH6azzH8==35hBQ@mail.gmail.com>
Subject: Re: 10x I/O await times in 6.12
To: Keith Busch <kbusch@kernel.org>
Cc: Jens Axboe <axboe@kernel.dk>, linux-block@vger.kernel.org, 
	linux-kernel@vger.kernel.org, kernel-team <kernel-team@cloudflare.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, 21 Apr 2025 at 19:53, Keith Busch <kbusch@kernel.org> wrote:
>
> Not sure. I'm also guessing cond_resched is the reason for your
> observation, so that might be worth confirming is happening in whatever
> IO paths you're workload is taking in case there's some other
> explanation.

Yep, you're spot on. We're hitting cond_resched() from various code
paths (xfs_buf_delwri_submit_buffers(), swap_writepage(),
rmap_walk_file(), etc, etc).

sudo bpftrace -e 'k:psi_task_switch {        $prev = (struct
task_struct *)arg0;        if ($prev->plug != 0) {
                if ($prev->plug->cur_ktime) {
                        @[kstack(3)] = count();
                }
        }
}'
Attaching 1 probe...
^C

@[
    psi_task_switch+5
    __schedule+2081
    __cond_resched+51
]: 3044

> fs-writeback happens to work around it by unplugging if it knows
> cond_resched is going to schedule. The decision to unplug here wasn't
> necessarily because of the plug's ktime, but it gets the job done:
>
>   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/fs/fs-writeback.c?h=v6.15-rc3#n1984
>
> Doesn't really scale well to copy this for every caller of
> cond_resched(), though. An io specific helper implementation of
> cond_resched might help.
>
> Or if we don't want cond_resched to unplug (though I feel like you would
> normally want that), I think we could invalidate the ktime when
> scheduling to get the stats to read the current ktime after the process
> is scheduled back in.

Thanks. Makes sense to me. I'll try this out and report back.

> ---
> --- a/kernel/sched/core.c
> +++ b/kernel/sched/core.c
> @@ -6978,6 +6978,9 @@ static void __sched notrace preempt_schedule_common(void)
>                  * between schedule and now.
>                  */
>         } while (need_resched());
> +
> +       if (current->flags & PF_BLOCK_TS)
> +               blk_plug_invalidate_ts(current);
>  }
>
>  #ifdef CONFIG_PREEMPTION
> --
