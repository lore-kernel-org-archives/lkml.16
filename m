Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6D2A2AC17
	for <linux-kernel@vger.kernel.org>; Sun, 15 Jun 2025 18:03:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750010588; cv=none; b=UEHn7v+0ONxzznt4TkKb0anfsX3FFM1x+MRLEQVudk4JOsZav+tiZd97yMkoMrqw0B4RSX7epp+NQzcRzzRhnb9JO8GdM8J1uLGVCiagYWHOZ+pN4ha0sV5LG6WS8bkyK79d+dEmim+kAneX6N88zahk1D2p8GcwMltnlMsHMpk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750010588; c=relaxed/simple;
	bh=8mt3/bSLgsA2Bh04ZQ8JA7fi6CzvpBsi1wChtdmV5NU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=t82FelCUenJQxOKvIB2lD9X+8eNRFvLDhXbVJ2/e7TGPy9t7jNbZupKUo0PqAdJI+UsmWTe8dx391FtRiwvNjNxdnzwDV64BACLI8tHeWM+quD9GQHDe6lbENJd1w1mgoPHHgmK2eQQHN9AzsbxvgZZvq6EIJNK3mDH2fo3xidU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen-com.20230601.gappssmtp.com header.i=@soleen-com.20230601.gappssmtp.com header.b=xWsKKBRg; arc=none smtp.client-ip=209.85.160.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen-com.20230601.gappssmtp.com header.i=@soleen-com.20230601.gappssmtp.com header.b="xWsKKBRg"
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-4a43afb04a7so28259261cf.0
        for <linux-kernel@vger.kernel.org>; Sun, 15 Jun 2025 11:03:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen-com.20230601.gappssmtp.com; s=20230601; t=1750010585; x=1750615385; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=JNaz1yRvnr0ZspYURl3ABko1+K9vEcbTR/IU/BQQjQA=;
        b=xWsKKBRgLAUoptlP1McUQb0NC8a74hJZoXpKxqcfv0KVoePBBkii/PbkKvZ54IyvwI
         gZMNsJMvf5CdQhgchzwcEuzRfhSwAD6HKBfGF68vRG5z9Tpt2zwwcVqedcQcPbZ/ER+T
         fAUPrTfGMTIwPjcehUBq3vqVz2ByoBjs6HEFpl6pM2PuLfBH78bO8t4t/3CJs45LzO1l
         9ocTlFG2ja0J2cANCisw/US60h3ch6dJ2NMm/kEW4fU2NyMDT1eQ6MAxL/9vx5DZxJzF
         Uv1S/9pluP9MRpMejhIXKXSVddNwSZueXRziYNDnV0sHcYOF6d3CYQ9cejaEa8i3fHW5
         cKRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750010585; x=1750615385;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JNaz1yRvnr0ZspYURl3ABko1+K9vEcbTR/IU/BQQjQA=;
        b=Rl/Vh1AYCkUaxXXWY/E7VkMnS6ZyEJHxZ0oDzoMek8XaVJ6EUEIMF7ZLSf2yw8YPfL
         k7fYV/NOoglB164ywrTFCZifyd133BYvB5I9mKWLMQdMzIsup8sObLZtY3T1Z5tZPUMA
         gheyDMPetIAIT5K+9DoTHNpIpX2AMKYAe7E0PcJQHwbD0t0UZpFG1TNVFT0aSziaqTmS
         3e7I+ncHGAQ3H1OnvYWZd6yd65P2KtfhPs282faOTGAFsEi2X9HsyJf1apCdfNHCM5LL
         k20+68BXP4+ZWLnuizWWw5cQf0fj0K4VG+bsBOWdwkKOd3GQFC4Qh/KT7Qyw2J82QVzk
         sQ0A==
X-Forwarded-Encrypted: i=1; AJvYcCVjEMgflatVN6k42LlkscDL1Dsy2qm+CyugYqJibywCtHS21HLKqnSq2thUb9+uMt0/W3vlAoEUw2B2gss=@vger.kernel.org
X-Gm-Message-State: AOJu0YxO9BZtXcVM7H4IgwPh5cL0NWTsW6DSGJILtFXrSHuXrLzIUxcV
	wRxCJwb9BWc1oX2A9FITTaTKWz3sPn+C9JNRQEy5Ov0mwuyavIJkfQjjQHmhsJuIoFoEeh4WZE7
	bxjkUVUhxlFLCFSzSR4Bb2SF/sDNzp0G+21NORzeQTg==
X-Gm-Gg: ASbGncvXpSJdfyDifyw6HdTdNnrVPmhxYsM6SdU+7VcE7hgj4FgX7ORTX0VzKSmHjOG
	O4gZZL0yia7dldo+ZBEBWABW4j674peajB5b5WZjkSv2lS00UpIhE9Yx3QXftaceq/TIvvydKeX
	/8tdRhXq4jo2jc/qIYXPP2VqFPDl41QCZXpKIdF1vTDoWmX2rY+et1iCE8IJfZTG2ViIDFcIUUv
	g==
X-Google-Smtp-Source: AGHT+IGGB8+eyL7WTYKqK3xwwDge70EilhWl/70ilTnxzvcGeeGrU4NeKpQh0oWeO/GG4vP2HfwKft+K2iVnAPOKiQI=
X-Received: by 2002:ac8:5f0e:0:b0:4a5:912a:7c64 with SMTP id
 d75a77b69052e-4a73c58f3e9mr111987711cf.30.1750010585395; Sun, 15 Jun 2025
 11:03:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250515182322.117840-1-pasha.tatashin@soleen.com>
 <20250515182322.117840-9-pasha.tatashin@soleen.com> <mafs034cetc5g.fsf@kernel.org>
 <CA+CK2bBeCOojpZ=qoefd6NG+bO6CUh+NU8=8dMhD01=LtC9eNg@mail.gmail.com> <mafs0cyb7mzl2.fsf@kernel.org>
In-Reply-To: <mafs0cyb7mzl2.fsf@kernel.org>
From: Pasha Tatashin <pasha.tatashin@soleen.com>
Date: Sun, 15 Jun 2025 14:02:28 -0400
X-Gm-Features: AX0GCFvmDSOv1q3E2SkUC9O11e4zxS3sZ68LrZGy8fBYesVRbqKv1FEcUE3nQ14
Message-ID: <CA+CK2bAgsPQNCDnsQV9RR7gYo+Vdye9oDkrGJwrgmSZm9vbwUQ@mail.gmail.com>
Subject: Re: [RFC v2 08/16] luo: luo_files: add infrastructure for FDs
To: Pratyush Yadav <pratyush@kernel.org>
Cc: jasonmiu@google.com, graf@amazon.com, changyuanl@google.com, 
	rppt@kernel.org, dmatlack@google.com, rientjes@google.com, corbet@lwn.net, 
	rdunlap@infradead.org, ilpo.jarvinen@linux.intel.com, kanie@linux.alibaba.com, 
	ojeda@kernel.org, aliceryhl@google.com, masahiroy@kernel.org, 
	akpm@linux-foundation.org, tj@kernel.org, yoann.congal@smile.fr, 
	mmaurer@google.com, roman.gushchin@linux.dev, chenridong@huawei.com, 
	axboe@kernel.dk, mark.rutland@arm.com, jannh@google.com, 
	vincent.guittot@linaro.org, hannes@cmpxchg.org, dan.j.williams@intel.com, 
	david@redhat.com, joel.granados@kernel.org, rostedt@goodmis.org, 
	anna.schumaker@oracle.com, song@kernel.org, zhangguopeng@kylinos.cn, 
	linux@weissschuh.net, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-mm@kvack.org, gregkh@linuxfoundation.org, tglx@linutronix.de, 
	mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com, x86@kernel.org, 
	hpa@zytor.com, rafael@kernel.org, dakr@kernel.org, 
	bartosz.golaszewski@linaro.org, cw00.choi@samsung.com, 
	myungjoo.ham@samsung.com, yesanishhere@gmail.com, Jonathan.Cameron@huawei.com, 
	quic_zijuhu@quicinc.com, aleksander.lobakin@intel.com, ira.weiny@intel.com, 
	andriy.shevchenko@linux.intel.com, leon@kernel.org, lukas@wunner.de, 
	bhelgaas@google.com, wagi@kernel.org, djeffery@redhat.com, 
	stuart.w.hayes@gmail.com
Content-Type: text/plain; charset="UTF-8"

> > This is not safe, the memory might be DMA or owned by a sensetive
> > process, and if we proceed liveupdate reboot without properly handling
> > memory, we can get corruptions, and memory leaks. Therefore, during
> > liveupdate boot if there are exceptions, we should panic.
>
> I don't get how it would result in memory leaks or corruptions, since
> KHO would have marked that memory as preserved, and the new kernel won't
> touch it until someone restores it.
>
> So it can at most lead to loss of data, and in that case, userspace can
> very well decide if it can live with that loss or not.
>
> Or are you assuming here that even data in KHO is broken? In that case,
> it would probably be a good idea to panic early.

A broken LUO format is a catastrophic failure. It's unclear at this
point in boot whether the problem lies with KHO, LUO itself, or
mismatched interface assumptions between kernel versions. Regardless,
falling back to a cold reboot is the safest course of action, rather
than attempting to boot into a potentially broken environment. Since
VMs or any preserved userspace won't survive, the additional delay of
a full reboot should not significantly worsen the impact.

>
> [...]
> >> > +             }
> >> > +
> >> > +             luo_file = kmalloc(sizeof(*luo_file),
> >> > +                                GFP_KERNEL | __GFP_NOFAIL);
> >> > +             luo_file->fs = fs;
> >> > +             luo_file->file = NULL;
> >> > +             memcpy(&luo_file->private_data, data_ptr, sizeof(u64));
> >>
> >> Why not make sure data_ptr is exactly sizeof(u64) when we parse it, and
> >> then simply do luo_file->private_data = (u64)*data_ptr ?
> >
> > Because FDT alignment is 4 bytes, we can't simply assign it.
>
> Hmm, good catch. Didn't think of that.
>
> >
> >> Because if the previous kernel wrote more than a u64 in data, then
> >> something is broken and we should catch that error anyway.
> >>
> >> > +             luo_file->reclaimed = false;
> >> > +             mutex_init(&luo_file->mutex);
> >> > +             luo_file->state = LIVEUPDATE_STATE_UPDATED;
> >> > +             ret = xa_err(xa_store(&luo_files_xa_in, token, luo_file,
> >> > +                                   GFP_KERNEL | __GFP_NOFAIL));
> >>
> [...]
> >> > +struct liveupdate_filesystem {
> >> > +     int (*prepare)(struct file *file, void *arg, u64 *data);
> >> > +     int (*freeze)(struct file *file, void *arg, u64 *data);
> >> > +     void (*cancel)(struct file *file, void *arg, u64 data);
> >> > +     void (*finish)(struct file *file, void *arg, u64 data, bool reclaimed);
> >> > +     int (*retrieve)(void *arg, u64 data, struct file **file);
> >> > +     bool (*can_preserve)(struct file *file, void *arg);
> >> > +     const char *compatible;
> >> > +     void *arg;
> >>
> >> What is the use for this arg? I would expect one file type/system to
> >> register one set of handlers. So they can keep their arg in a global in
> >> their code. I don't see why a per-filesystem arg is needed.
> >
> > I think, arg is useful in case we support a subsystem is registered
> > multiple times with some differences: i.e. based on mount point, or
> > file types handling. Let's keep it for now, but if needed, we can
> > remove that in future revisions.
> >
> >> What I do think is needed is a per-file arg. Each callback gets 'data',
> >> which is the serialized data, but there is no place to store runtime
> >> state, like some flags or serialization metadata. Sure, you could make
> >> place for it somewhere in the inode, but I think it would be a lot
> >> cleaner to be able to store it in struct luo_file.
> >>
> >> So perhaps rename private_data in struct luo_file to say
> >> serialized_data, and have a field called "private" that filesystems can
> >> use for their runtime state?
> >
> > I am not against this, but let's make this change when it is actually
> > needed by a registered filesystem.
>
> Okay, fair enough.
>
> --
> Regards,
> Pratyush Yadav
