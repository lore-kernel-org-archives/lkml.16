Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88F0014A8B
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 16:09:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747152581; cv=none; b=FBIDn0qvUmUE1gtnFAiOOXNdN54an/qoYmHG0/YJuBl+xUgCOKGorR5sWWAmH8M6ZYAaFCF3oIdM2scpQrv6JFUbHHu+TSvXv/N1AHC7cyGC2IicBCewvPmHpTu3GYakk6oy+DvuEi858Q1yO5ZbLpiCeqml2mHa7xFrZVOorxI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747152581; c=relaxed/simple;
	bh=XY/ek0gkSV8i6PpcG+cgSu2ZcZTY5tOvfvynocqr7Ko=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=F6B8hTPU3clVDMBAzdTsDekK4MHq1G9mpJkQ7Ri0khHnp03TvtxDvLWSLs6nTznfsKYFiRWNDQ60PcAXqiLSS6qC4bzajBDplecL7N0p3CeTRPjfLuowQPoblbwc2ShYmaHe8ncYmbRepla0C55i9vSJXAKEzIPxDO2XmIqZzwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=J17kZtrd; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="J17kZtrd"
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-327e9bee7e9so4019621fa.0
        for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 09:09:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747152578; x=1747757378; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=2xPcbPcD1WbFPE2vOJqMYs+044knJo30NqABeyI0uT8=;
        b=J17kZtrdbUg5RgixPBWdnbRazCwferw+FOAY8z+85ngxVOmMxqdB1AIJM57/SKddhJ
         eUsLOn0zwGtiOcQiVNqqBOAatK8b+bVUC+lVm9tSVNgY98vLelKD0w6AuTZEjl+e2zEJ
         01GMQ8XFcfyoXS8FLpJSoywJR/MQ/bkJkJQZpsHmTZ52tOyYKs2PPToYaL5QdvWvvsee
         abyjGk8+AgGz/dt/8kKjjIKR+rYxxN/D6LNmmkhMQ2cGikhCjbjIlZjp+Jyox6qdFXa6
         8Y0OdiHFMO50TgnoYSD2G9vHyPIni4hM0KlQR4kPOZ+ZdQg58CQmOZLU/kGjaIUlrMPT
         WFsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747152578; x=1747757378;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2xPcbPcD1WbFPE2vOJqMYs+044knJo30NqABeyI0uT8=;
        b=moR8Jrl6MwU6jtEvP3t5xWjT+7ZC8npB+QVI7R5hr37HPQYOhLkELYg88+BKfSUqqH
         2qtZ7bXb+2rT+jnAjdJ6gk0NY1TqNZFJEejySF4apj8DMCOrYhGfN6O0AFMwEhmtTkyW
         tY/oFzZy9eE510nkfSmpo7/r5273RpD+ku4HBrr20BJeZe9RV8Rv2u/NPIduQSrHXjlS
         1NdNY5WftV//WXA4k8sqY+lPU03ype0Qs9U2J0SQ4aAI5TnVjB4cRvZugoGJpbuhEARO
         wV96DGJX6HIbUmoP0RrLx915b8BoqbtkEqeVmTtTy0yvQki21sfRV6bb9m+ESwa8Ksy/
         1+iA==
X-Forwarded-Encrypted: i=1; AJvYcCW8Wc7fcG24wVyGFe0pOt5P69u2Hh7/2ULTzFUAESpfRR0OeibYCI8zXu6SWt/evjyG6IHypU56MG+12wU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxJlNW29YCx/O1IMawnhh/brW7d/damIX6EzZ3hqVS9nWvlzLDE
	60GWlpb29+QPv4pLFeHv6Jv1Jwv0A2Mgdk8xhlnNKVGJHFLK8vhAR+8wzrTMwhgXw+6HAyR0Vqn
	5vtebhyK8I3L02t94qL+McWsYx5pqYQxykJP/
X-Gm-Gg: ASbGnctiIQReVmQiN4X6PRqCMPyvGp1uhHDe8NZcawHQrxVWaXBnR1m8Nv8JP0JExmM
	7UwI9wPShvkzagfNEau0TbVNLYFvigIzK58xjnYY4JMGT4qu91YftJ+H31l1037eKd3/xZ5xAZQ
	Rdej3w32CVwt/ydIG8Dai6urYSKG/0DOFFt/l7yD5VESaZsaWWGHVaok5JNM5JmlTIrA==
X-Google-Smtp-Source: AGHT+IECXHDt0eLcxw25idhLX/8kFgRZr8EWUZbj/LbdzvWUQEcF7UvzYKjtWLoyArk/1sFSJ0f2IWsS7BNTbCOzhcs=
X-Received: by 2002:a05:651c:885:b0:30d:e104:d64a with SMTP id
 38308e7fff4ca-326c46b2b7bmr73376971fa.38.1747152577424; Tue, 13 May 2025
 09:09:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <2025040820-REJECTED-6695@gregkh> <20250509072033.1335321-1-dvyukov@google.com>
 <2025050940-marrow-roundish-8b98@gregkh> <CACT4Y+aiQcbHfj2rB6pGKevUbUoYwrHMu+aC-xh0BCKE8D-8sQ@mail.gmail.com>
 <2025050924-marmalade-overfill-fc5a@gregkh> <CACT4Y+ZqToLK5R__x8O1ZctsG3wQtRn36JWF2MPRYqY+Zy_CUA@mail.gmail.com>
 <20250509121036.GA92783@mit.edu> <CACT4Y+Z8ANddFCpNHvNqq6u6=s_aWoYPwu_1HmH19OWeLBi47A@mail.gmail.com>
 <20250512144402.GA200944@mit.edu> <CACT4Y+as-Uy_BUjLDxfNwC2+78U3kJdaaKL=vbUNMZH9VcLiGQ@mail.gmail.com>
 <20250513120549.GA9943@mit.edu>
In-Reply-To: <20250513120549.GA9943@mit.edu>
From: Dmitry Vyukov <dvyukov@google.com>
Date: Tue, 13 May 2025 18:09:24 +0200
X-Gm-Features: AX0GCFvG059UfwJPZdMMMbtnK_PCOF6YmLs8bxPm__2O2ER2Feq-FUV5fuuH3Cw
Message-ID: <CACT4Y+Y+E6xnOOJ8zwSdy09FT-OLPPYVFLvZsdpEOkYQ2vsTRg@mail.gmail.com>
Subject: Re: REJECTED: CVE-2025-0927: heap overflow in the hfs and hfsplus
 filesystems with manually crafted filesystem
To: "Theodore Ts'o" <tytso@mit.edu>
Cc: Greg KH <gregkh@linuxfoundation.org>, cve@kernel.org, 
	linux-cve-announce@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 13 May 2025 at 14:05, Theodore Ts'o <tytso@mit.edu> wrote:
>
> On Tue, May 13, 2025 at 09:09:34AM +0200, Dmitry Vyukov wrote:
> > I just hoped for something at least somewhat stronger. Bugs flagged by
> > fsck won't require fixing in that model.
>
> Well, if you have the budget and the headcount to back up that hope,
> you know where to reach me.  Personally, I've hoped to win the lottery
> and own a private jet, but given that I'm not willing to pay the $$$
> for the private jet --- I fly economy.
>
> Consider carabiners.  I have one that I use for fastening my keys to
> my belt loop or knapsack. But there are also carabiners that are
> certified for climbing.  If you try to use the former for climbing, it
> wouldn't be safe.  But the climbing carabiner is a lot more expensive
> and a lot heavier.
>
> As far as file systems are concerned, a hardened file system will be
> more expensive, and will have less performance.  But if you are using
> file systems in a data center, where the hard drive is in within the
> Trusted Computing Base, paying the costs for a hardened file system is
> silly.  And in fact, companies are not silly; I have yet to work for a
> company, including my current employer, which has been willing to
> invest in a hardened file system.
>
> Now, the good news is that there are ways we can use a non-hardened
> file system in a safe way.  You just to have the system enforce the
> constraint that the file system must be fsck'ed before mounting the
> file system.

Ted, have you read what this thread is about? :)
I was talking only about images that fail fsck.

Re headcount, if we want that to ever happen, shouldn't we do what I proposed?

If we downplay all of these, pretend these don't exist, and argue it's
not important in any context, unsurprisingly nobody is willing to
allocate a headcount to fix this "unimportant nothing".


> If you want to be even more paranoid (or the proprietary file system
> doesn't have a good fsck), you could mount the file system via a guest
> kernel running in a VM, where the VM is locked down using a seccomp
> sandbox, and which provides file system services via 9pfs to the host
> kernel.  9pfs is a remote file system which is easy to audit, and this
> is a key part of the security strategy used by gVisor.
>
> See?  Easy peasy!  And far cheaper than attempting to harden a file
> system.
>
>                                                 - Ted
>
> P.S.  If some company wants the equivalent of a titanium carabiner,
> where we invest a huge amount of SWE effort in making a hardened file
> system which is as performant as possible, I'm certainly willing to
> work with such a team.  I haven't yet seen the business case where the
> ROI makes sense, but perhaps some company has a unique situation where
> such an investment makes sense.
>
