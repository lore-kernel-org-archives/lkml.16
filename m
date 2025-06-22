Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EB9022318
	for <linux-kernel@vger.kernel.org>; Sun, 22 Jun 2025 23:45:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750635942; cv=none; b=cakpHv5sVnTQfdgvnP1FjGqYcjyqYHkvieCL707lMzQ1zvD7JrJ53H9ZK4wLTGYweadAtg5fE50VBRHVx6pO937PtN2ZFA6hAdWPdOyg4W30m2jFuxND2yE3wDtxrKUuNmZB7VCXatsRY+dh17IUuF25f9QFO2vh2pDBQquQEMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750635942; c=relaxed/simple;
	bh=r+lr8BJR78FxJjNc353w9E+E4MDdUpORu+N1ALoAoB4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nNw5z5nSvEakgMI5t4XTdBOE1Th3A3700vTckcI7+dTn3jgpa9olkv76+fLtGixDkxkkdOhp+kRYGVMkm6MbEUpP96fSzJjvYPmv11LJugViAX6ojjhqA9gYy5/9CXU1hvssGI7BzxsnpAA3UyCXza0LVk3k/XtQbFkMqYBPs+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eVU75TJJ; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eVU75TJJ"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-450cb2ddd46so20407965e9.2
        for <linux-kernel@vger.kernel.org>; Sun, 22 Jun 2025 16:45:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750635939; x=1751240739; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AfRSgbFZSy5dkhaBXEq2u/k7fzFxoV0b6ZxvQq5cauk=;
        b=eVU75TJJsJqM5x0JFCwVSM/zHeWm0+dA3BjbYBwt/iM0BMf1qRos9dIST+NPixU9J9
         jNjEPKcn7g3Hr1XvWyY1ejARno8Q7o6MDXWQgmc74aan41V3cSFK6jRPZNVgiEMnzqs7
         TKUQ1dJieAEWtORTk/vdACJQvocpCc/4D3XcapOGky3r7fkSR4sMf3jVKhkS+SJLzdTq
         6Q3PmWX7AefDrmFEmfJ2mqKnD4VJ43cz0qeqgiyTxelW2+LJvf60GgDE5FczXTKtTz73
         rJoRGcpwGY7S8Tec0ZADp+LU5ZTSIx2GHIxBVqDK3Qx1oFcW77/0HCo+yx0o9152I0uG
         uSuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750635939; x=1751240739;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AfRSgbFZSy5dkhaBXEq2u/k7fzFxoV0b6ZxvQq5cauk=;
        b=acxDk/R3uf9rBi/MlfcN2sI1agZGVxKBMDkXJsWHCQyHn7v0+Ca6UgxsVL/IwGhCWz
         hT+cUCywQLutVBFBAQCCHYQ/0pXSPgrhZkgwhfQuYuodIxMLV5jRJ2QiY2ZL16j5kaie
         Z0t9PgT4iQ5rmRDr6o/T4S3XOa3qvCEEQpokdWWsGoTpdu8zWaWtcxmgiNpHHQBzPvq4
         pp95Lq+j6Ml6HsdVIdp9fvkyAU15ol9lK7pcEpOC9jb4r5pNnKid3NPljJb9zw3oFC/H
         J25z2IUClf/DUv69qYisz5stlt8kRuvefAc9SCCao4zqZC1n0YlL2snuXwAGpNayEm84
         8Mhw==
X-Forwarded-Encrypted: i=1; AJvYcCX6FTGm0K7PizyEefkNJQ/yhM44gzOcI9s87f5UjpHV0gBYJm0AchQHzhHHWpt7rNSb1l9HyM+wUFWkxbM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzN7mfcSs5MWJBMGiThVFTBOoJ5PaftYO7clEJJbcm7/UUtfBSn
	BwMG/1ahq+DlEFD81K6/SfrF7CXw8hZXVJ8Zye9M+DEwP9qIayo1ZMU9kDpKeGOeM0cPD7oLDdX
	d9ZJgVNTYFgVPMoe4IWJydy8cNQ0Ixr8=
X-Gm-Gg: ASbGncsuykKJZlQsN2QcIxf1zYgRBIJ+gPb7RCt4cjK4UGXHFdIOibRqPcOgnfOMh8b
	Zn+OKfwSdk08czRRxi37pMXUpm5nmKmdMKab/nnpwU4eIcK+2ibgAC1DSvPOb5+/ULa6Y/5LG/b
	PmtppP0HJYCFFIx31gPP+AorZ7zu2Kdt1ma96B+BjnunLrMg==
X-Google-Smtp-Source: AGHT+IHtMH20yLlfwi3w/7no5bDWf4VeH0DHMUuDCUAAEMpLhHI+Eo4qFXT+L771UDCTYftg0Xdc3Mrk8fARzS1E+YI=
X-Received: by 2002:a05:6000:4812:b0:3a5:85cb:e9f3 with SMTP id
 ffacd0b85a97d-3a6d12fb438mr8377371f8f.12.1750635938566; Sun, 22 Jun 2025
 16:45:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CA+fCnZeb4eKAf18U7YQEUvS1GVJdC1+gn3PSAS2b4_hnkf8xaw@mail.gmail.com>
 <20250622141142.79332-1-snovitoll@gmail.com> <20250622112014.76bdd8929ecdb1c1fb3015b5@linux-foundation.org>
 <CACzwLxgSBszyEr4zRqMbnoA0PEnZQNy8_ZKTMtwm-Nkho5MePg@mail.gmail.com>
In-Reply-To: <CACzwLxgSBszyEr4zRqMbnoA0PEnZQNy8_ZKTMtwm-Nkho5MePg@mail.gmail.com>
From: Andrey Konovalov <andreyknvl@gmail.com>
Date: Mon, 23 Jun 2025 01:45:27 +0200
X-Gm-Features: Ac12FXwUkZLlD3Swe_7wD6CkEWUE3IVyAJ6jtFRMciaxOVoXB7zY_DK7oRwjgAQ
Message-ID: <CA+fCnZce9dB9WLXuw+gteoR2+Brq8H6zLo8JaLGuVg=Rfmj78w@mail.gmail.com>
Subject: Re: [PATCH v2] mm: unexport globally copy_to_kernel_nofault
To: Sabyrzhan Tasbolatov <snovitoll@gmail.com>, Andrew Morton <akpm@linux-foundation.org>
Cc: arnd@arndb.de, david@redhat.com, dvyukov@google.com, elver@google.com, 
	glider@google.com, hch@infradead.org, kasan-dev@googlegroups.com, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, ryabinin.a.a@gmail.com, 
	vincenzo.frascino@arm.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 22, 2025 at 9:09=E2=80=AFPM Sabyrzhan Tasbolatov
<snovitoll@gmail.com> wrote:
>
> I haven't verified this, but theoretically, it's a handy
> =E2=80=9Cwrite-anywhere-safely=E2=80=9D ROP gadget.
> Assume the attacker has already gained an arbitrary RW primitive
> via a UAF/OOB bug. Instead of stitching together
> prepare_kernel_cred() + commit_creds(), which is a common path
> of using exported symbols to achieve privilege escalation.
> This path needs two symbols and register juggling.
> With exported copy_to_kernel_nofault() they can do this:
>
> /* Pseudocode of exploit for a ROP stage running in kernel context */
>         struct cred *cred =3D leaked_pointer;
>         rop_call(copy_to_kernel_nofault, &cred->uid, &zero, 4)
>
> copy_to_kernel_nofault() disables page-faults around the write,
> so even if cred corupts a guard-page, the write will not crash.

Attacker can use copy_to_kernel_nofault without it being exported as well.

So I'd say this patch is more of a clean-up of exports.
