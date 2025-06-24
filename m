Received: from mail-io1-f54.google.com (mail-io1-f54.google.com [209.85.166.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F89B291894
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 14:30:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750775439; cv=none; b=swZLGhjb6JMZvpOGgAE+OwLz/ZhJmdfwm5l1cKuGPTXA75gOgcj6V9RyQ/pZb9gG+84P0UVhr0om3/XhgsRAttlVfz84Rik2hRuXjWtYCpbkyEBwN4nXT0ze9wvJquY5LykEKHH7Qve1YWHWnd8aBfd7e64H65c9kSmqHqNOmPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750775439; c=relaxed/simple;
	bh=nD6d1oQU0U6CEQ1PjJb3tKi1fzkMIlIjezBHP9gjyFE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sHJLWQ4w+XRqy9MEzLQmYNtNnJ2hXrIlcMPnDlyRUibJuQIIBbfD+fBm6NQAtynbswPk+K9b8RxdiF513M9ygdblSXZkRQgzXoBfZdOxviYfyh2GeM2RS9wmC2zNx8Cep3+HUFBNPSv/YpwBZ6aJboLmIxaTVrPFv1YbBdG/9cs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=pVXza9or; arc=none smtp.client-ip=209.85.166.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="pVXza9or"
Received: by mail-io1-f54.google.com with SMTP id ca18e2360f4ac-86d01686196so15932939f.1
        for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 07:30:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750775437; x=1751380237; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=nD6d1oQU0U6CEQ1PjJb3tKi1fzkMIlIjezBHP9gjyFE=;
        b=pVXza9orz/i1vTC6WD5SzWZ+9Z3/DY5r2DSictTUKkTInwmPH5OnYzr5WG6eQIcW4W
         odMhv0h8vNFRwKNkNlNS+U0C02sBlt5TwnjM+exmHAKBF6+EEAbMPKZulwWcpMHZMqkO
         Qo703bL29SunEIMVfZO3e0PM0e55g3w8kCeWzjTvsjR2Vd2A7XcdQqPZd9MLfj0wK4bT
         PoFYQckPL6q/xJo9uuoxq2yeVcWVPRiWhyZoYoH1iJfMgO2liLA+f1uoo6t4LIAYMiyV
         vZSDkZ+caPSH9YMUfYueiQrC1xdi+wyQeKIU9L/0J7eLrPqvdtPEkyAb/SHP0Ti4NAjX
         97/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750775437; x=1751380237;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nD6d1oQU0U6CEQ1PjJb3tKi1fzkMIlIjezBHP9gjyFE=;
        b=J3MuwKuMbWaFR4B6sDMGRjxYyu4ah4Mr1u/ft8CIfHLipmB2bvyrhvCLIikGHBiGE0
         b3NLTwVLAJi4CfKYaefVK66eVJSYwXoUNHuUH/z3YJd9xACTe0VEyew9HeHibyZZqvPc
         RZe74zPCDvu7EcSwyPiaMjarDgdQ/XdnnVZvx0dLKgFuBaDoCo4hrnyAuNkQpZDcOMPk
         g2NJqQbobFMLD7LVU9vxq8rqSCR6tJE7CNNehIFctw9lgX/KhQtJ7qH6GDLwsa7cWiTx
         qKc0WxXIbU9rknXOcTCNe+vToknI8LKIUqKWfNzs+dOJ7HiwFVJfO/HwvdEISPdPUtu9
         YFUg==
X-Forwarded-Encrypted: i=1; AJvYcCU4utH8t6v24cqEdTiQ7kWC/mreHrp7YhYx3Rn+tho3Vpjd3cmp7V52bb0uj6UVOJD2wv532BiArFue5W4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2rPLAx1gDPpCFRLHpsiZfZrwx7FGrGc0rBch2esfl2cIXb6Cl
	VPYZ7QOizuf7FY+FqaoIr9pbwZ13TRHlwRDxfipM5dz+QKdqiBx4lUbzFykPfG0a+CBPfMvd36o
	PPA/VL3rGaP+ctP9o1k+riDfghsgTPuJ3jeAEzD6d
X-Gm-Gg: ASbGnctfgKFQLUtje2/PaYc+44qWV+Vz7Y3dTygGgnrdRMuHDVmpuLB7nLxSE9J+gEn
	qW3M2LlEf+UwABK1YNR4v5cQwU8k+3sSTTZh3wYLBfp9MMgB1kMKBe/nUItAwgs1dcrjivAT+BK
	JBMK6D8hGy441SwIjd9rxgdAp9xvQXAZQoOUeAz1ypYN7scPipZW2LUTKhcWZsX8NQ0E+E/f7M
X-Google-Smtp-Source: AGHT+IEHixcelKr3ZDZkYGsXMHko5Eg4schrz3wOXp27EKQA6K+fy348hW6r2MyxxJ0URo5kPr2rZaqYfCP2unLWoUs=
X-Received: by 2002:a92:ca0e:0:b0:3dd:bfba:ff9c with SMTP id
 e9e14a558f8ab-3de38ca2a44mr177442515ab.11.1750775436923; Tue, 24 Jun 2025
 07:30:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <aFNYQkbEctT6N0Hb@lappy> <20250623132803.26760-1-dvyukov@google.com>
 <aFqw5-PO4MjsEdYU@yuki.lan>
In-Reply-To: <aFqw5-PO4MjsEdYU@yuki.lan>
From: Dmitry Vyukov <dvyukov@google.com>
Date: Tue, 24 Jun 2025 16:30:23 +0200
X-Gm-Features: AX0GCFsbVHjLUySg8qRCEV1aKqnjgETI6fmZpybrMY1RcxRtsY4qbFVJBY3VhYg
Message-ID: <CACT4Y+Youc3M0z0U9arrTgyOC1+UKytav4zObhjUXn8-RLThMQ@mail.gmail.com>
Subject: Re: [RFC 00/19] Kernel API Specification Framework
To: Cyril Hrubis <chrubis@suse.cz>
Cc: sashal@kernel.org, kees@kernel.org, elver@google.com, 
	linux-api@vger.kernel.org, linux-kernel@vger.kernel.org, tools@kernel.org, 
	workflows@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 24 Jun 2025 at 16:05, Cyril Hrubis <chrubis@suse.cz> wrote:
>
> Hi!
> > 6. What's the goal of validation of the input arguments?
> > Kernel code must do this validation anyway, right.
> > Any non-trivial validation is hard, e.g. even for open the validation function
> > for file name would need to have access to flags and check file precense for
> > some flags combinations. That may add significant amount of non-trivial code
> > that duplicates main syscall logic, and that logic may also have bugs and
> > memory leaks.
>
> I was looking at that part and thinking that we could generate (at least
> some) automated conformance tests based on this information. We could
> make sure that invalid parameters are properly rejected. For open(),
> some combinations would be difficuilt to model though, e.g. for
> O_DIRECTORY the pathname is supposed to be a path to a directory and
> also the file descriptor returned has different properties. Also O_CREAT
> requires third parameter and changes which kinds of filepaths are
> invalid. Demultiplexing syscalls like this is going to be difficult to
> get right.
>
> As for testing purposes, most of the time it would be enough just to say
> something as "this parameter is an existing file". If we have this
> information in a machine parseable format we can generate automatic
> tests for various error conditions e.g. ELOOP, EACESS, ENAMETOOLONG,
> ENOENT, ...
>
> For paths we could have something as:
>
> file:existing
> file:notexisting
> file:replaced|nonexisting
> file:nonexisting|existing
> dir:existing
> dir:nonexisting
>
> Then for open() syscall we can do:
>
> flags=O_DIRECTORY path=dir:existing
> flags=O_CREAT path=file:nonexisting|existing
> flags=O_CREAT|O_EXCL path=file:nonexisting
> ...
>
> You may wonder if such kind of tests are useful at all, since quite a
> few of these errors are checked for and generated from a common
> functions. There are at least two cases I can think of. First of all it
> makes sure that errors are stable when particular function/subsystem is
> rewritten. And it can also make sure that errors are consistent across
> different implementation of the same functionality e.g. filesystems. I
> remember that some of the less used FUSE filesystems returned puzzling
> errors in certain corner cases.

I am not following how this is related to the validation part of the
patch series. Can you elaborate?

Generation of such conformance tests would need info about parameter
types and their semantic meaning, not the validation part.
The conformance tests should test that actual syscall checking of
arguments, not the validation added by this framework.


> Maybe it would be more useful to steer this towards a system that
> annotates better the types for the syscall parameters and return values.
> Something that would be an extension to a C types with a description on
> how particular string or integer is interpreted.

+1


> > Side-effects specification potentially can be used to detect logical kernel bugs,
> > e.g. if a syscall does not claim to change fs state, but it does, it's a bug.
> > Though, a more useful check should be failure/concurrency atomicity.
> > Namely, if a syscall claims to not alter state on failure, it shouldn't do so.
> > Concurrency atomicity means linearizability of concurrent syscalls
> > (side-effects match one of 2 possible orders of syscalls).
> > But for these we would need to add additional flags to the descriptions
> > that say that a syscall supports failure/concurrency atomicity.
> >
> > 8. It would be useful to have a mapping of file_operations to actual files in fs.
> > Otherwise the exposed info is not very actionable, since there is no way to understand
> > what actual file/fd the ioctl's can be applied to.
>
> +1 There are many different kinds of file descriptors and they differ
> wildy in what operations they support.
>
> Maybe we would need a subclass for a file descriptor, something as:
>
> fd:file
> fd:timerfd
> fd:pidfs

FWIW syzkaller has this for the purpose of automatic generation of test inputs.
