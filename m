Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B859C1DE88E
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 14:28:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744036125; cv=none; b=P1tSGH9A8dI2BBJU+YYw5uzd1WQ6DFwUUvgvllU/4GGoCIsV52XHNcOJ6Em5zC8gZDGOrUdQJZ8aaKJjT9UH0sdOculaxOc9ugpF5FApRvE/TSQ9rEV3YtgtDGAtx4SsRNj37n6YIHG6fBT9u5BRPqIDFp3vEddqH8ywLMGwo/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744036125; c=relaxed/simple;
	bh=tgpYDzyk0T8UJPAcg2eUtJ/L/heaNPsCXU4/1WIhyJ8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=X5s8uS1bbkJkqgesi7YCQwcV9qzbZoG/WwvWZE4hYWPWaGoaDKendKWJytGbRb3VDOG0n2sxhibQs+dNgk43fUPD+I/i/ZjqFE/13jenOyuJ2/sLv0BiM0GvofvATOl8qAKdPVh7pu6cwggnQlQ4bS5aAPYdMLaKK7iCnz6h1cQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com; spf=pass smtp.mailfrom=googlemail.com; dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b=IWP+usEC; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="IWP+usEC"
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-30c091b54aaso40708341fa.3
        for <linux-kernel@vger.kernel.org>; Mon, 07 Apr 2025 07:28:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1744036121; x=1744640921; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=tgpYDzyk0T8UJPAcg2eUtJ/L/heaNPsCXU4/1WIhyJ8=;
        b=IWP+usECUcJjTTTpzhYuEayKR0DKIyZ4aPr7ZxEWLJ/apcNR9T0YTCV7IOxYoEfFI2
         oSUgv9FHpVB7P1Ec44xHwMG9MaNonH8YwXw7RDy93VV3eVgLZeToHajUWWw0i9zEx5ee
         XUxgmkxjOoM5OValln855M6sb2d3v6A2ysUdECcp229CgazKkzx0fJ4WEtfjvYXv1Pya
         y9QzaRVafbZyOg1jX3+Um2wzxUWJBLW6FkEUssSc5jCWKkFUnRj6an9AuHxpuwIEBmwB
         ebhhX1GB2ajubncRk0X7LtC7yXp9NN7ebnFANU7xOP9GCdWmKkU4T5W8fAfNIhADVaMG
         KJ2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744036121; x=1744640921;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tgpYDzyk0T8UJPAcg2eUtJ/L/heaNPsCXU4/1WIhyJ8=;
        b=vLk7zZ5ptcHfrIgEd5ArFZnG7ful2QAX9nVsOEeQMC6+mYrvpJUYJiqeLgr9RKIW0K
         thewt0vtNMg+uyUN1NPA3V3EgB9YptAyBRnzyiBYMq99WMuakx9s9b/k0aM0USl4d056
         FsV6TvT6PfLZaX6HF+TUVycpYvuMsw2Ko226CIe96u7MJDbOMeZk0BGqmCcjOxuPyOyP
         TiR/yZbjuEWnWCnEMyDONRSGixVV9d0+IT/4JoWLz/MRdyhkDSNkqU7Wb+1QuLew/1Ca
         BPqTyvmqKlfXYMINNlAl5y0kcuAeCtOJD909NDMh8DwsHS46cuBq9xusvPnXZj3YLupt
         ox5Q==
X-Forwarded-Encrypted: i=1; AJvYcCWWI5XVFbcmrEC7+ZUy7LOo8L7g58N4aHSX3YjkNYiKVVMcQTYBfp97x18sRUAiy4anDsaDSwTHS5SDj8o=@vger.kernel.org
X-Gm-Message-State: AOJu0YwqD/6YKeDc7riJOXazNWZKy4csPdoxwOqLaZeN+IOX19TLvd8/
	x4BznGAbgY4h8sqWqBZaC9vqgWn5WGmT5omjtBYICmoDhkae9K4jaR4uWls3q+iX+h4b0fYMAas
	J9PD8KwjaFTo7FQMy/cTdwL/Ej8c=
X-Gm-Gg: ASbGnctDIHHxKZp4SVwzXNKgvakTjCOTOHqpzJEQUEFhb38tXcr+S+m51EfFkALP4Am
	1yB9HBOV+ulQxQaqJ8MU+MPYVzhavCxrqraEuu8piB6TfLQTG01YLMtRBzO2uRNPrUrqbJYP+/y
	rWtkoAo79AhRCSZ0PpCQFt2xh1PlSpJfEkqT2gMLHPt8/cju8+Grwjdp382jlG
X-Google-Smtp-Source: AGHT+IH2B/WX78cienOY6GlnCXQOrmsPkCxV3RuW4fsifbNG6eUj4fWSuDTaUMuY1bNITW6uP7DdY8KtOONzxKPVEyY=
X-Received: by 2002:a05:651c:2107:b0:302:2598:de91 with SMTP id
 38308e7fff4ca-30f1650e508mr22570561fa.16.1744036120582; Mon, 07 Apr 2025
 07:28:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CANpbe9Wm3z8fy9HbgS8cuhoj0TREYEEkBipDuhgkWFvqX0UoVQ@mail.gmail.com>
 <20250405130306.ca9822c1f27db119cc973603@ombertech.com> <20250405093127.GAZ_D4b6NdyTS-UW1J@fat_crate.local>
 <20250406164049.c0666bc18073e3b88c92d1f1@ombertech.com> <20250406174633.2c581923c145687476191753@ombertech.com>
 <20250406190253.GAZ_LP3RPZInWKcHN7@fat_crate.local> <20250407095848.7933a358c9f450fe03fb8234@ombertech.com>
 <20250407102927.GAZ_OpBw5hJ2QTFsKz@fat_crate.local> <20250408002150.8955343f4e2f2ac31b4663e8@ombertech.com>
 <20250407135533.GDZ_PZVZ-2CKmhbt7d@fat_crate.local>
In-Reply-To: <20250407135533.GDZ_PZVZ-2CKmhbt7d@fat_crate.local>
From: Oerg866 <oerg866@googlemail.com>
Date: Mon, 7 Apr 2025 16:28:29 +0200
X-Gm-Features: ATxdqUFMsLyCGXgL8xuV-5XR5L3FePqMGovSzsZjeJFfnF-6bmw7aEIQFFhHpEk
Message-ID: <CANpbe9Vyss7wEd0rQA7Z=mfi6WTkm5JjCJjTkcsqGCd0mGA2aw@mail.gmail.com>
Subject: Re: [PATCH] x86/microcode: Fix crashes on early 486 CPUs due to usage
 of 'cpuid'.
To: Borislav Petkov <bp@alien8.de>
Cc: Kevin Koster <lkml@ombertech.com>, Thomas Gleixner <tglx@linutronix.de>, linux-kernel@vger.kernel.org, 
	Ingo Molnar <mingo@redhat.com>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>
Content-Type: text/plain; charset="UTF-8"

Thank you for your discussions,
I'm happy that a fix for this is happening after all :)

FYI, the link above containing files to easily reproduce in an emulator
*should* still work, so if anyone else wants to see this virtual "rust",
for some reason, go ahead - Even includes the genuine BIOS startup, haha.

I must say that it's quite extraordinary how well the kernel runs on a
486. Wish the same could be said for userspace...

I know my voice really doesn't matter, but I would love for 486
support to remain intact. It's an invaluable help for people who tinker
with old stuff but have grown accustomed to modern tools and habits...

One of my projects uses a modern Linux kernel to install Windows 9x (sorry!)
onto a legacy (or modern, if that's your thing) systems, including
magical things like VESA Local Bus 486 systems, way faster than the
official MS installer ever could. There's quirks here and there, especially
with regards to libata and obscure IDE/SCSI controllers, but other than
that the kernel does its job and it does it extremely well.

I've been experimenting with kernel versions and I'm happy to report that
since 4.x there hasn't been any sort of noticeable performance regression
on old systems like that.

Also some newly written BIOS / DOS driver code could not have happened
if Linux wasn't such an excellent reference. Well written drivers for
the old stuff can practically compensate for the lack of datasheets for
example.

I think that's something worth applauding, even if some may think it's
better to throw the old stuff "in the garbage" ;)

Sorry I'm rambling a bit :) Anyway - Thanks for your efforts everyone.

See you next patch!

Eric Voirin
