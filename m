Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 145001854
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 23:48:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747784916; cv=none; b=U3p9Q+ir4CQMlgi5yXAFSuPdzWLD9wGtebcyX0lYJ7QnEnI3QHJJYv3IcSWyNvX8FnznLI1afHS1ksnb/BzI9uVPP++5ELCCSy9wBNBgVYPWCovlUnwwBUVnTihGsqa714QcxL7/T0bjLyFF01gZ6R5hpuH4widHZ4xi+Yrm2Oo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747784916; c=relaxed/simple;
	bh=3dJwkMR78ygGJ26kpq3/8NRE5gL7ZDEd09irCsxSHsw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZkCkNUVAxFRJclwjBXbBrqecn/REB1zJnzfqa9BLUWb8DMT9mqWGwQGY6WnShSy+cOwddPqf2NbbIVPJ1OpSNCZt/Dh4Kq0foQ7Xs0qT3YW5bfn3yvBR7QY4zaQM6nSgORYG/rDWvcgPPCY9GBqAzl6TjkhezZmwmme7BoTCsZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com; spf=fail smtp.mailfrom=purestorage.com; dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b=Q+PD2b1t; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b="Q+PD2b1t"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-232776f0ffcso2121915ad.2
        for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 16:48:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1747784914; x=1748389714; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gmpPIOGdXeTJJ62xMcZcuRvAyBH/dJfC/scejZBoQNw=;
        b=Q+PD2b1tSk0dbQAdCrdHTg7LL1wH6SN+oTswZe/NV4z2lwzGhcz9EZ0SdTJRyGFNDk
         PqoMRHpuHWba/rrZzMnW8OVSKiQ+U3CnJnTl9P5qaeOzP6TEH1swZVg75qK+unepXmjj
         Wlj/X0AaOje0gEtZo8y1HEfCSdQXPKo6NVkcX6KvZ1tNha7TlJNeQkKQjYTB/CvjRCV2
         fKTiiDIjSiX1ceMk+JafGvU9gfLEGrcRXLJ+zPiPfiNdrbT46ucaKbDY+pKePr9Z2X3k
         VdEzX+IhHHKKxMLtymGJHksvV4mXAEFRoenkmENW2kMTw75NKmxZ+VJKS9iS9pKdU6nI
         f9+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747784914; x=1748389714;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gmpPIOGdXeTJJ62xMcZcuRvAyBH/dJfC/scejZBoQNw=;
        b=VKBiUdFX3qqKs4HGpVLN3bhINyvB+xdB0UeeaKUsLnqVmZCbWWHdMd7QaZLi5lOS3k
         NtKvhNC3EMCMTVJIkAfOIk7jbeSSkNeH6fNkelTvJ+dx6BFmQSl7123iT8Xmdp9CCgzR
         crFTPOITs/DTQUVDo6e5sJy3TLFGu3D0lR7NmARiYiCXYq1+QI0TF+J0MQ4YSnZ21tMZ
         7B4KXtK2Iy3JjncW8BjfFrLeB2m77x8eJt4Huw27G4uiiWW8QbpNvHUSWHLMrCr3f6an
         nsmyoCbF2GMdKE+x7bl4zwcNJHrzhx9yUfvVpYICK2glTY2sXdCr7ay417RqKCqgCM7t
         vRXA==
X-Forwarded-Encrypted: i=1; AJvYcCW9IJC/TSdH/hRsDeIKbbSslnONsP38qh6R+8+efXWJDee0jIYVgQvkt8PCsCoF6JSS6zd+kfZH7+LFyyw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/LYCTDEKFYdUTY68QLZvVStzXU1XvxTq9IKvKwfDNhujDP9kQ
	8IMH4DSWehxJo//JTrcnCyPrlvA9TcQkWpuOLeR6ajrAwVRHEzEAp/Bz9OeR6fHd232LcXK3SF9
	kwdv8lxDH/4FiRSV51AGSM7BdbjnaExvqMszdIEdYow==
X-Gm-Gg: ASbGncvzsTkSwk5duwwFu00FTDC+FOugo5O2yJA1UY4hQw0nT3vp+/JcqcTWX3Dx58P
	SBL0TJ40eHg250EvriF7NcoiFhT4nJB8oBrn44SUIEb0xX7eEYsx7JbBe3FpcdAcXX3cL5cTf5T
	B+Rv90ag14M7sU2JhV2yuA8O7exsMuxe8E
X-Google-Smtp-Source: AGHT+IGnevNpj9MhG/oplR3edPx4N1vkZ8r3DvX/Pt/hh1ZLYZjWA4tQx71kE9lTxzjC6FvCFNltEPHGjgkNsHUuIoE=
X-Received: by 2002:a17:902:ea0a:b0:224:c46:d164 with SMTP id
 d9443c01a7336-231d43891f9mr87560745ad.2.1747784914214; Tue, 20 May 2025
 16:48:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250517000739.5930-1-surenb@google.com> <20250520231620.15259-1-cachen@purestorage.com>
 <CAJuCfpEz2mbVmGJnp0JHKsip2HVkp+=yHOj3oRtDrKzXXG5Xag@mail.gmail.com>
In-Reply-To: <CAJuCfpEz2mbVmGJnp0JHKsip2HVkp+=yHOj3oRtDrKzXXG5Xag@mail.gmail.com>
From: Casey Chen <cachen@purestorage.com>
Date: Tue, 20 May 2025 16:48:23 -0700
X-Gm-Features: AX0GCFvk7QHDVRdeo5JApsfMv5EqqQlf5IszkCZmZujS6DHh02jCluKF1iE26XI
Message-ID: <CALCePG1uoNN4vB3HguOi+ZYjwUcTPHmtp4RCZey0r6qCUJMLCg@mail.gmail.com>
Subject: Re: comments on patch "alloc_tag: allocate percpu counters for module
 tags dynamically"
To: Suren Baghdasaryan <surenb@google.com>
Cc: 00107082@163.com, akpm@linux-foundation.org, cl@gentwo.org, 
	dennis@kernel.org, kent.overstreet@linux.dev, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, pasha.tatashin@soleen.com, tj@kernel.org, 
	yzhong@purestorage.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 20, 2025 at 4:26=E2=80=AFPM Suren Baghdasaryan <surenb@google.c=
om> wrote:
>
> On Tue, May 20, 2025 at 4:16=E2=80=AFPM Casey Chen <cachen@purestorage.co=
m> wrote:
> >
> > Hi Suren,
>
> Hi Casey,
>
> >
> > I have two questions on this patch.
> > 1. If load_module() fails to allocate memory for percpu counters, shoul=
d we call codetag_free_module_sections() to clean up module tags memory ?
>
> Does this address your question:
> https://lore.kernel.org/all/20250518101212.19930-1-00107082@163.com/
>

module_deallocate() is called in error handling of load_module(). And
codetag_load_module() is at the very end of load_module(). If counter
allocation fails, it doesn't go to the error path to clean up module
tag memory.

My code base is at a5806cd506af ("Linux 6.15-rc7")
3250 /*
3251  * Allocate and load the module: note that size of section 0 is always
3252  * zero, and we rely on this for optional sections.
3253  */
3254 static int load_module(struct load_info *info, const char __user *uarg=
s,
3255                        int flags)
3256 {
...
3403
3404         codetag_load_module(mod);
3405
3406         /* Done! */
3407         trace_module_load(mod);
3408
3409         return do_init_module(mod);
...
3445  free_module:
3446         mod_stat_bump_invalid(info, flags);
3447         /* Free lock-classes; relies on the preceding sync_rcu() */
3448         for_class_mod_mem_type(type, core_data) {
3449                 lockdep_free_key_range(mod->mem[type].base,
3450                                        mod->mem[type].size);
3451         }
3452
3453         module_memory_restore_rox(mod);
3454         module_deallocate(mod, info);


> > 2. How about moving percpu counters allocation to move_module() where c=
odetag_alloc_module_section() is called ? So they can be cleaned up togethe=
r.
>
> That would not work because tag->counters are initialized with NULL
> after move_module() executes, so if we allocate there our allocations
> will be overridden. We have to do that at the end of load_module()
> where codetag_load_module() is.

codetag_alloc_module_section() is called in move_module() to allocate
module tag memory. I mean we can also allocate memory for percpu
counters inside move_module().
We have implemented such a thing in our code base and it works fine.
Just do it right after copying ELF sections to memory. If it fails it
goes to the error path and calls codetag_free_module_sections() to
clean up.

2650                 if (codetag_needs_module_section(mod, sname,
shdr->sh_size)) {
2651                         dest =3D codetag_alloc_module_section(mod,
sname, shdr->sh_size,
2652
arch_mod_section_prepend(mod, i), shdr->sh_addralign);

> Thanks,
> Suren.
>
> >
> > Thanks,
> > Casey
