Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8DACEED7
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 00:45:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747788341; cv=none; b=XN30K0C2UBfoNW0lFfIYUl4PPid62oI3ueyxU7IItb06vHv9cD1ql5TS0VYDXJjG64X1clDZ0Tv8jVSSXRPnSrW/9wU00UGgMlQvQtiiVIU4YkJpMS5lW+I7qLqPkZ+NqKS9QIMqJojN6ZS+jKST2j9cYGctzK1GKF02rFptCoA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747788341; c=relaxed/simple;
	bh=IVLFBuPCLVJp1dDri4+4+5zjSksnJTsdwu4zaj/p8G0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=u/ROuHLuAdjEwd5KT4o0E47wiXJdVnkMZ8D3BzJsmfOA8cJoSszjJO3ezDBBj8kivwQXpGaoOkkfiqtuUsZa2ikbG1+1XM6bOm9ObiyvoTt6iDPQTUDwYZG3Wy5OL6ilmXD996mVx7M3Y8GL7i7Jj77fXShACZjRLWseCjNcyWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Fs5LJTxE; arc=none smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Fs5LJTxE"
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-48b7747f881so1261371cf.1
        for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 17:45:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747788338; x=1748393138; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=41ZeFF/Uoe+vO+A8jB271Cv5/G5Vsaf1M+8Qv5TcKvg=;
        b=Fs5LJTxEClivsgDv/J9mhnHIXJ3QpQus2+OnHCDl5J0oG3XgqdNlL4KDBgdzoBRQRb
         0mM87euY9FL9z9dEB3Z4xEyvHH0JA6MouAoVFWPxKp87j8e9VWT6VxPVANAR5eYVZObI
         it1EKHkdKCmgcUrn2fh4EEIy74RLfdMtjjEmeX9K26u5iuEVQ6YVuo3V2ruSEJa1BvPs
         WPGwefCcMFT/KyMwbK+rLstWOLG+mc+zBb209V5OFgVA66kzr7rHSQHqeZVQrU8uCzpR
         s2x5lHlfOgKX3Q03EcmQyR6CS0EbDUJ9RCMMe1cUTH+9grz6vhYAx5ZZZ21Q+IIa1Wpe
         6fqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747788338; x=1748393138;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=41ZeFF/Uoe+vO+A8jB271Cv5/G5Vsaf1M+8Qv5TcKvg=;
        b=KJPjtIUYVvufte3gYNYrnpReOHNaP4SMNvM+t4gPQEU8l2QfHm83PayXKAVZQzLpkM
         8Sx49XQfn+nX4wo4ABCM9UfjJBXUXRhnFKMycpoWWe3ijNTYqeR1zGBZMAEZZJHtUNjb
         V2f41z18SNY9+oxpW5p6OMblzL9qTa9Dp3rdB7d1/jkPBAkAuWgXC2DQPxzS/xKtPlVD
         MLk57SnYODJxn1DavSTYR5CdZunE8fOm5mGGEJRcT67ulTdcQEqE55QBLmLrWw+U63jo
         9KhuZjyTZD9zFYGNJ195n3ES3vxUC1n/m2tmCMtIzdudM4+q/N4UL8vP1yi8hv/+mtba
         AHvA==
X-Forwarded-Encrypted: i=1; AJvYcCWQrxggACUwuk3J9Xn2SI6VxmQiZyH6tjGuvK9QZhh73R7aYymcYMZ+2aZhLpWxa/OaXgVrvW+jqx6ZLXc=@vger.kernel.org
X-Gm-Message-State: AOJu0YyF5PXI/T3KjSd1/aIfjHwgSUcFMp8RSyF4aqwO2TBevtlRTSgn
	RbQvg566j/DZVrP68t/vG68rJkCRGSKjV3/vclUpWIFN//y8PA/VAsWMJwNzdun+BBPDA+n0usv
	XWYaQ9KDJvXtWBIxrdhsZ+F7GtHqSgEooxWBheIeN
X-Gm-Gg: ASbGnctD/354zZw04Iswh9xPGF+Anmwo7RNNGTGq4kLvLqW8WpCymCaf2XrExNn0Xkz
	JCTqO5DEToFyW/eCG4rHUFjCBv+C6s9boEpb0KVaHXZ42hre5SVc3UCg1Zt4XNY+OwDKo/5TtPE
	42cz3t7c3IOOhcbjQyTxP8kDELKUMObkVAz9MaL8N82kNRstAAk3mbgHT0iJzVgIvSGyxgi+4=
X-Google-Smtp-Source: AGHT+IEXTXPJQm0T9eDr3vJq9iE5El8FsF6uIvOw9Nm8WXEy/tM0zh40MQQEzT1Jbs3YkOGT+8bdAsJbKJdc8H8sG6s=
X-Received: by 2002:a05:622a:44:b0:486:a185:3136 with SMTP id
 d75a77b69052e-4958d21875dmr14894661cf.14.1747788338089; Tue, 20 May 2025
 17:45:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250517000739.5930-1-surenb@google.com> <20250520231620.15259-1-cachen@purestorage.com>
 <CAJuCfpEz2mbVmGJnp0JHKsip2HVkp+=yHOj3oRtDrKzXXG5Xag@mail.gmail.com> <CALCePG1uoNN4vB3HguOi+ZYjwUcTPHmtp4RCZey0r6qCUJMLCg@mail.gmail.com>
In-Reply-To: <CALCePG1uoNN4vB3HguOi+ZYjwUcTPHmtp4RCZey0r6qCUJMLCg@mail.gmail.com>
From: Suren Baghdasaryan <surenb@google.com>
Date: Wed, 21 May 2025 00:45:27 +0000
X-Gm-Features: AX0GCFsM7DrzVFiemEJjS9D1zWCEPyE8iaICaBVjRVTuTWwTtnQXPqlf-ZlzGp8
Message-ID: <CAJuCfpF+YYBEZPmf-+k7N05R+T96MM3nzegcGWOPguX=Xu8ANA@mail.gmail.com>
Subject: Re: comments on patch "alloc_tag: allocate percpu counters for module
 tags dynamically"
To: Casey Chen <cachen@purestorage.com>
Cc: 00107082@163.com, akpm@linux-foundation.org, cl@gentwo.org, 
	dennis@kernel.org, kent.overstreet@linux.dev, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, pasha.tatashin@soleen.com, tj@kernel.org, 
	yzhong@purestorage.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 20, 2025 at 11:48=E2=80=AFPM Casey Chen <cachen@purestorage.com=
> wrote:
>
> On Tue, May 20, 2025 at 4:26=E2=80=AFPM Suren Baghdasaryan <surenb@google=
.com> wrote:
> >
> > On Tue, May 20, 2025 at 4:16=E2=80=AFPM Casey Chen <cachen@purestorage.=
com> wrote:
> > >
> > > Hi Suren,
> >
> > Hi Casey,
> >
> > >
> > > I have two questions on this patch.
> > > 1. If load_module() fails to allocate memory for percpu counters, sho=
uld we call codetag_free_module_sections() to clean up module tags memory ?
> >
> > Does this address your question:
> > https://lore.kernel.org/all/20250518101212.19930-1-00107082@163.com/
> >
>
> module_deallocate() is called in error handling of load_module(). And
> codetag_load_module() is at the very end of load_module(). If counter
> allocation fails, it doesn't go to the error path to clean up module
> tag memory.

Ah, right. I didn't have the code in front of me but now I see what
you mean. codetag_load_module() does not return a fault if percpu
counters fail to allocate.

>
> My code base is at a5806cd506af ("Linux 6.15-rc7")
> 3250 /*
> 3251  * Allocate and load the module: note that size of section 0 is alwa=
ys
> 3252  * zero, and we rely on this for optional sections.
> 3253  */
> 3254 static int load_module(struct load_info *info, const char __user *ua=
rgs,
> 3255                        int flags)
> 3256 {
> ...
> 3403
> 3404         codetag_load_module(mod);
> 3405
> 3406         /* Done! */
> 3407         trace_module_load(mod);
> 3408
> 3409         return do_init_module(mod);
> ...
> 3445  free_module:
> 3446         mod_stat_bump_invalid(info, flags);
> 3447         /* Free lock-classes; relies on the preceding sync_rcu() */
> 3448         for_class_mod_mem_type(type, core_data) {
> 3449                 lockdep_free_key_range(mod->mem[type].base,
> 3450                                        mod->mem[type].size);
> 3451         }
> 3452
> 3453         module_memory_restore_rox(mod);
> 3454         module_deallocate(mod, info);
>
>
> > > 2. How about moving percpu counters allocation to move_module() where=
 codetag_alloc_module_section() is called ? So they can be cleaned up toget=
her.
> >
> > That would not work because tag->counters are initialized with NULL
> > after move_module() executes, so if we allocate there our allocations
> > will be overridden. We have to do that at the end of load_module()
> > where codetag_load_module() is.
>
> codetag_alloc_module_section() is called in move_module() to allocate
> module tag memory. I mean we can also allocate memory for percpu
> counters inside move_module().

I thought you were suggesting to allocate percpu counters inside
codetag_alloc_module_section(). I guess we could introduce another
callback to allocate these counters at the end of the move_module(). I
think simpler option is to let codetag_load_module() to fail and
handle that failure, OTOH that means that we do more work before
failing... Let me think some more on which way is preferable and I'll
post a fixup to my earlier patch.

> We have implemented such a thing in our code base and it works fine.
> Just do it right after copying ELF sections to memory. If it fails it
> goes to the error path and calls codetag_free_module_sections() to
> clean up.
>
> 2650                 if (codetag_needs_module_section(mod, sname,
> shdr->sh_size)) {
> 2651                         dest =3D codetag_alloc_module_section(mod,
> sname, shdr->sh_size,
> 2652
> arch_mod_section_prepend(mod, i), shdr->sh_addralign);
>
> > Thanks,
> > Suren.
> >
> > >
> > > Thanks,
> > > Casey
