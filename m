Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EED91684AC
	for <linux-kernel@vger.kernel.org>; Mon,  2 Jun 2025 23:03:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748905405; cv=none; b=AonpRXKvthyd6F+kkBUZd3dlGlBD/Ii/dPWcgmqy/O/lqHLo5kujEEesak5CXvD7c0s+WMThLwrTn+O62TSI4Mpp6DUFScSJgRoPBKkokMx1MbIUljxxYwF4F6+FNDt/rc+u0YUKcnaUGSiYMHL81h5h5ZtFxnlBBfxqkJlQ8X0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748905405; c=relaxed/simple;
	bh=++szFMEtgyqwwYz0D+PwSonYFKpvE5qF2EiDkDJfZzU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QVipQhsmUTUMWBfVhfWssPGqKx9fZ8QGVK0uLrUNLhBSPR0pf+3516IzUqWsCvFx1yx7eGr3agr7HKsmZdM993mDMjwCUCQGk09fpQdMobcP/ciJgdQxFbpwVGFU0b9jQjF226hTvXJMylvoB814pishd+tJpdVaeEG0itAuXbM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=cYreCx9b; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="cYreCx9b"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-604e2a2f200so9584823a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Jun 2025 16:03:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1748905402; x=1749510202; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=7f60M5hYbeRCzldPkBmcnfnzcWSP10+sVHiJXwkVxp4=;
        b=cYreCx9bW7WngsCxJWcewL0auRG94kbPb512YwN/ssiGgdK319jFSlUM+LSN0QGRV1
         hSi3hdaNKrwGyByEG8u/YpHtWsrrCaZesgsLlMkMfk01imkfY0z19Bm2ksGzvFsdAtHl
         imeGe+OQglb5CXv7x0M/QZbaV0btZqeTyWozs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748905402; x=1749510202;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7f60M5hYbeRCzldPkBmcnfnzcWSP10+sVHiJXwkVxp4=;
        b=M+Fn1FatWYA8xmIQ5tZcq540+r/M2luiHPiVuOIa5C0P4IQ6tVZ7d5sjQ3oFK8/y8z
         52GqPmM4hVcEXz7AudYqsPABEGF57Xm6UqGsbYGXYrYna030ymFeee3PN+Hg5olarDkp
         5Ksp4qhHWDeSjQtGZUsgVMysI6/lOpK8cmZ1G4XW6U3ouTWU7OEyaONtZgH9FjJcMVv1
         4VZkxZw1j1dMhkMZ+aivXSt1V/URc2OqvkTKWK2cgqhOoS3KP8Yp7NcB2zpqY+ZsA6VZ
         uOuUTBQaYmNteEqBzT4SSqYn/yv/rHTDeUPMi4BkvQjS2aQlRXAHT1WkWDXPz1QanPfV
         XAmQ==
X-Forwarded-Encrypted: i=1; AJvYcCXm37sRePQGr3V6DEawP/tbU3f3E1/SfP2nOWEKT3DYXpztA5jS9DYVGPLYdlouvdocYwhE7R+jSjFTmHI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzQiOJeaDhFIZQuUERwrB4/28Wn0RldpCSkqqaCouVyqSUIDkJy
	wGuk9ImtF633Sbx3Z1FQTwJoOlLqKKSc4OFI8/Tn7th5qKTrK/YhZKhs1vl5kbql8RyRf3sV+rL
	AqChUtLHqsA==
X-Gm-Gg: ASbGncvo8yra3XvAOMWCaP1QuOWB0QsgVC+qx+xYPguAxyzMc/ee2vx7TKklSmUU3tZ
	/f/Qqof2/uSqgkxgrtYyJg479UlT9toJppMRm+X9apOrj4mTHluj5olYmhM9pr56F03aKkQowE1
	6NSN1r9n7GYnaJL1rIeGlZMh6dm+BkItrkbuo+/wq0jel9DfSDX0uwESR4v0zDMOMrAhmrxd2Fj
	G9Isg/elaQHtqeXgO1+aahEznxYaUaNPxi2fRwVX7hD4uBSvUyU9/FwPsUjF9Tqi+X5UjQ6Ilgm
	lSuE+TFu6s1nLo1X3JjY4L9OBVph084qowEYtTGH6ha/hW6CRVcqgEmZ0OcGC4vgPv8+KU/0k2x
	rqCY+E4CYp+yBdHEvFMGomRAGfg==
X-Google-Smtp-Source: AGHT+IEYXN9p3EWI9+LKmpO5q/Qz7z+O2A2iH6rTMatYpacNFKNWCyGnX3tvywJRAGaZ0c6ORmhwag==
X-Received: by 2002:a05:6402:1e92:b0:606:4802:2c47 with SMTP id 4fb4d7f45d1cf-60648022fcdmr4311892a12.24.1748905401500;
        Mon, 02 Jun 2025 16:03:21 -0700 (PDT)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com. [209.85.208.42])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60566c5b69asm6677152a12.22.2025.06.02.16.03.19
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Jun 2025 16:03:20 -0700 (PDT)
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-602c3f113bbso9668306a12.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Jun 2025 16:03:19 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV9JVLwxwpGufXHsOny4K9XPuX0nYnkeVPjN/n8UfVdE1j6Yjd9fCaduvD3HjQTdl9gRxbDvh6xxRmX6aU=@vger.kernel.org
X-Received: by 2002:a05:6402:518a:b0:5ff:f524:90e0 with SMTP id
 4fb4d7f45d1cf-605b751baf6mr9475234a12.11.1748905399615; Mon, 02 Jun 2025
 16:03:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250601151222.60ead71e7d8492a18c711a05@linux-foundation.org> <aD29wnb5zR-afWpM@casper.infradead.org>
In-Reply-To: <aD29wnb5zR-afWpM@casper.infradead.org>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 2 Jun 2025 16:03:03 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjtk+LLCWt9JLGip+qb2Vksq727V6anKg2gN2Z1npO+GA@mail.gmail.com>
X-Gm-Features: AX0GCFuFKxyTIMjLhDG9GgQUaYyPLSKJxQy9zCek0XFUSfqYyE2N5joutpwyQnw
Message-ID: <CAHk-=wjtk+LLCWt9JLGip+qb2Vksq727V6anKg2gN2Z1npO+GA@mail.gmail.com>
Subject: Re: [GIT PULL] Additional MM updates for 6.16-rc1
To: Matthew Wilcox <willy@infradead.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org, 
	mm-commits@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 2 Jun 2025 at 08:05, Matthew Wilcox <willy@infradead.org> wrote:
>
> A word of warning for Linus since he wouldn't've been cc'd on the
> earlier email.  This branch is based on v6.15-rc6 but contains a
> commit which depends on 97dfbbd135cb which was merged during the
> current merge window.  You might want to do a rebase or ask Andrew to
> do it in order to prevent a bisection hazard.

Gah.

If I rebase the thing, I lose the pgp signature.

This is not optimal, but let's hope nobody hits the bisect issue.

            Linus
