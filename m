Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E7042BFC62
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 15:15:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750778139; cv=none; b=OArBnc62Fd7kAaqDuB0dp0n83zN/LbdB4QPCl74YuHiSP3Zmp6w5C4YlbKOt2fw38FG6rEBBQKZ+KEYB5SpgA88wOjGPhf2tf6fkd8jXqNzNuE/LRg5iZ5ug6wHIKktKSULEYODMvbR6Kc4F37z+LOG6pcWLxQUIdbNSyXzABpg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750778139; c=relaxed/simple;
	bh=ZrdxuWG7+LFoBk2IWmpfoUdLdIZz43RgZ3fNnrL1bTs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ckTiBCHFug+CHOM62s0EkmbfCIdFpim9ognOMjJku2roUgzNjdIyWJ8Fxno+77+hOK26xssEsGzc7WbWgoUYGjaZ8ROsU1H1X0l4VX9fxTIBwpWwKcWhLgp74eaLyFeB38GoXakcW18eSovdwzlmBwiFqDWYXe/9t6+8GQR3+EA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=D4O5FtOA; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="D4O5FtOA"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-ae0a420431bso222512366b.2
        for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 08:15:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1750778135; x=1751382935; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=eLkoFblRVcI4qlzicS3evY0eDoBrk4ZSgrPnvsJhZ+Q=;
        b=D4O5FtOA9Yt2WDFWzF48V0lhRyzjRMI77+3uvTWdycEfvkhBTQCW/8m6kmska5RZ42
         RTDPKfRjckSNgMzaXL1YIA1WY5+wqFsb/GlwARfZx+/K90ZnjB9hAIjDqlJ5RroKPv0B
         jL6sADr7ILu0b8cQK+jCNQ57unCHF2lLFa5Lg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750778135; x=1751382935;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eLkoFblRVcI4qlzicS3evY0eDoBrk4ZSgrPnvsJhZ+Q=;
        b=ZC+kintpir6RbtX5TFy18HwpyfRwLtZiDZqrZVQe+cFFct7WHIuE6kaO+csq1g8Qka
         GhEYEu+rzPPRdxaDl/wm3DEhdwEgJfsHC66H3irXS+OswnzaArbPTiBsJfLRmvJ1tYr5
         6OE53EBd1YXaH85AnZ4A5CggqVNuvjzpp/nTuX782W1BYFZGel24ZHAbp/5uezfnnpT9
         3jjMs7N9DFtpCEZYelqxq8VcopSBRXhZ8tfnnIavHoXnN0fUGcgV0VFxVb+aMM2eYZBC
         qIx+i/5JKy+P1amKXRgqPmQW04J18agRENMtHqBTcfGWZwATmfnoz9o2rdmaO7JKgGqm
         1/WQ==
X-Forwarded-Encrypted: i=1; AJvYcCXO3pwPN1BHw8IRfd3+hqnebhqEIO+xNVp4oxtIYLcVc9p7/JoSeaFjrDljPefLD7+ZXEuhskRIQIs4hjc=@vger.kernel.org
X-Gm-Message-State: AOJu0YyS8S8L6YoPr++Xg8aHk9rjqXp2MxgUdd0ITuSGEAm6Y7eJBkqX
	etUeKPA8Ny73yNLL6Qep18dZv7WRsegZtxrxGGVnM43n0j70jKSqUzA5UK85SB2wgbZJyf1F2PX
	hhVWJJIg=
X-Gm-Gg: ASbGncu2OGQed4D8S904n1Hrz7CIiTTUT+8//0ELfezqbTFmJ7c9a9EQi32xwBYgN3O
	FbL8cN1e0Xf37coqRvyvHCFU96AorV7vWeCMszpURQWaU2hphqblaU5gVr+/+2eeo7bORnHsQyG
	QoMXLGnSqTAsGKk8vVE64aXTUnqF2BYO0W7cQW7c+vmLnfM8B7DxG4muWQe5/GZBiAIqi9v+XKf
	OxBxjgr7wTXy54nLpHbq7V5maxSAf3z/BmvMAALt3JZZVeKK7NdGAEe1B+ulsOxO9dzxqAEWC1O
	eL4ET15mMjBxhmdAC9KAIcajhhn7tht4nZUIX/AUumUQDTZc34LR8Zjt53He3K9xaKpHoDovgyZ
	cQAgdhLfo0gzyMh8Nc6lzuf+BSjLrtu6A2nsP
X-Google-Smtp-Source: AGHT+IEzJTHPe/6wmovstaOb3scg6OvjcDRQxWNHFKPblkcNuWZDBXMHeNghfGiem3EtEcUkLkGbYQ==
X-Received: by 2002:a17:907:3dac:b0:ae0:a116:b9d3 with SMTP id a640c23a62f3a-ae0a116c3efmr491215566b.60.1750778134988;
        Tue, 24 Jun 2025 08:15:34 -0700 (PDT)
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com. [209.85.208.54])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae0b4968246sm65391766b.18.2025.06.24.08.15.32
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Jun 2025 08:15:33 -0700 (PDT)
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-601dfef6a8dso8698447a12.1
        for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 08:15:32 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU+5bFjLiA4GykzABXtypc7uo4YYWvG7FwzKjc/6ACTG6G0dMnV8CY0UZP9PD+FrPRqGpJqaNkfQeHJSes=@vger.kernel.org
X-Received: by 2002:a05:6402:4308:b0:608:330a:9f67 with SMTP id
 4fb4d7f45d1cf-60a1d1a2ecamr15042057a12.32.1750778131214; Tue, 24 Jun 2025
 08:15:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1750585239.git.christophe.leroy@csgroup.eu>
 <f4b2a32853b5daba7aeac9e9b96ec1ab88981589.1750585239.git.christophe.leroy@csgroup.eu>
 <CAHk-=wj4P6p1kBVW7aJbWAOGJZkB7fXFmwaXLieBRhjmvnWgvQ@mail.gmail.com> <2f569008-dd66-4bb6-bf5e-f2317bb95e10@csgroup.eu>
In-Reply-To: <2f569008-dd66-4bb6-bf5e-f2317bb95e10@csgroup.eu>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 24 Jun 2025 08:15:14 -0700
X-Gmail-Original-Message-ID: <CAHk-=wh+zcmrHM5ryM=_71vEwjaRjwRHVgFu8WRG5xsgu3ku+A@mail.gmail.com>
X-Gm-Features: Ac12FXyiIOMeVWX36Mt87GnZfIOR3ssqbql1oPQlXRyO409zF_tN4rQRqufbqcw
Message-ID: <CAHk-=wh+zcmrHM5ryM=_71vEwjaRjwRHVgFu8WRG5xsgu3ku+A@mail.gmail.com>
Subject: Re: [PATCH 2/5] uaccess: Add speculation barrier to copy_from_user_iter()
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	Naveen N Rao <naveen@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
	Peter Zijlstra <peterz@infradead.org>, Darren Hart <dvhart@infradead.org>, 
	Davidlohr Bueso <dave@stgolabs.net>, Andre Almeida <andrealmeid@igalia.com>, 
	Andrew Morton <akpm@linux-foundation.org>, David Laight <david.laight.linux@gmail.com>, 
	Dave Hansen <dave.hansen@linux.intel.com>, linux-kernel@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-fsdevel@vger.kernel.org, 
	linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 23 Jun 2025 at 22:49, Christophe Leroy
<christophe.leroy@csgroup.eu> wrote:
>
> >
> > (Although I also suspect that when we added ITER_UBUF we might have
> > created cases where those user addresses aren't checked at iter
> > creation time any more).
> >
>
> Let's take the follow path as an exemple:
>
> snd_pcm_ioctl(SNDRV_PCM_IOCTL_WRITEI_FRAMES)
>    snd_pcm_common_ioctl()
>      snd_pcm_xferi_frames_ioctl()
>        snd_pcm_lib_write()
>          __snd_pcm_lib_xfer()
>            default_write_copy()
>              copy_from_iter()
>                _copy_from_iter()
>                  __copy_from_iter()
>                    iterate_and_advance()
>                      iterate_and_advance2()
>                        iterate_iovec()
>                          copy_from_user_iter()
>
> As far as I can see, none of those functions check the accessibility of
> the iovec. Am I missing something ?

So we still to do this checking at creation time (see import_iovec ->
__import_iovec, and import_ubuf).

In the path you give as an example, the check happens at that
"do_transfer()" stage when it does

        err = import_ubuf(type, (__force void __user *)data, bytes, &iter);

but yeah, it's very non-obvious (see __snd_pcm_lib_xfer(), which calls
writer() which is either interleaved_copy() or noninterleaved_copy(),
and then they do that do_transfer() thing which does that
import_ubuf() thing.

So *because* you were supposed to have checked your iov_iters
beforehand, the actual iter code itself at some point just used
__copy_to_user() directly with no checking at all.

And that all was really *much* too subtle, and Al fixed this a few
years ago (see commit 09fc68dc66f7: "iov_iter: saner checks on
copyin/copyout")

                  Linus
