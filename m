Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3A7B18B47D
	for <linux-kernel@vger.kernel.org>; Sun, 22 Jun 2025 19:09:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750619398; cv=none; b=lAOnK+OwSq7OUb8tF6Hikl+9/30UUUjRJ0oWtx3zWw/7RJqIhXEGe/CdgZ8ADJKO7+k95qzASw7Kr+1w4PZ/qdnr/Aj86AAB5Jgm2r0UTeWQfp+5r97veX9dIkt5UVb70nW6LRSfafGKkfANF8nzb5S7FgIWbaFfGlYWtWrqvfo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750619398; c=relaxed/simple;
	bh=7wZfGE+MEZQBeJOYLddgb48d7CwjKjMqK9CFI+98cDU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BQTGKUwEDci5cfPECQVwuxkWzulF+7IjcURLNKcgZZe5VC9Jt03xeyphtqdbL3xgQH1o0B0sYVJElFtfZKy6kqkQsQ1xXH3ZjhwSyLKMByQkftBYhnwxmQHjQP7u0PYFvnZ2YbiRHz6yVebW+gtX1NSxeljW25i764dIlNJljFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cSyp5hPp; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cSyp5hPp"
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-32b3b250621so33148131fa.2
        for <linux-kernel@vger.kernel.org>; Sun, 22 Jun 2025 12:09:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750619395; x=1751224195; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fPvPC3ewg8btyqEAcdiY9R7W/ks7YLMYkN0QU2bR+1Y=;
        b=cSyp5hPpxzPzdmZQ/ED9leFeCQtoPetVZuh6I6+qayz4QdUTerIfWCrJ5kSJ1QxH4a
         3unQBCNqgs95/Y/AZuP/Uk9RCMqhoCDlkVqIxlUrW1QWcB4n0ghRqCxqKHUDr4YSlf4z
         1a2FX8KlKFrK8ZN4DlqgOOz93woeNCC5kAGl0db7xrc3rSnAkAHWrVXdHKzej9YEuR+o
         /JBVRNf1Zut+r31gyJa9euZr36rafB5VJTJV1JX9jHst8lqwzvQ/1fC5CtF4z3MEhodn
         JyKNWqmhqh5KWC3ySs/7zQ/eocI2itIKa3ZTlaW867iuZPnNixiL9ACS/6hhvKIa+fjh
         BC6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750619395; x=1751224195;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fPvPC3ewg8btyqEAcdiY9R7W/ks7YLMYkN0QU2bR+1Y=;
        b=JXzYj/vvhXHEliEl48108KeLfLkLhAueESQtJGrbHUGPbfbT0twpv82bNMctx3K2ot
         HHzCC5/wY5rPoasYcaMkAdkEyw5xPzHu+41/WCx7yvb+hxEJ/cxip52DKlx0zBzzkbCA
         VXj2q7+iORQvkEJtZDpQ39J3RFs3wsNuFuRPccNRRZtcoZKhbfBGPjSedf1ECGRm1dQ1
         lJhdD+wWIZC5rD1Zl2eHeYs/hPcKpvhn1enWHZtf6z9Rk1kkF98XIjTkMw1jd/X+WSMF
         Wp6OTKTqXCBwdFjGWRx6UMhrgpOSHkKJfyZxKVvnyS/xmcS2m62ptxKVA+onjVLw89FE
         7scQ==
X-Forwarded-Encrypted: i=1; AJvYcCVh2C2s+8+s0diImjRKG0bWEg+oyPtcXiIqzgHInzGRb4+fFJWtOLE/7Xl3++pFN0SHDwYqxP3cJqpB7zw=@vger.kernel.org
X-Gm-Message-State: AOJu0YyHhrM8AJSuwpWhVYe6jHTCSfSfzUK1GZvCnjUJTwRYVSIIgOq7
	J4dSc/jCF0iOttkdu/qMrcwdg+qX6fb5AhnDHwz+yivCd/vZUtoTLAykBMHACRdV4+6nvLe5i4k
	bxNlPjivZDJljKo4ACJCauprqvIiui28=
X-Gm-Gg: ASbGncu8nVUl95jV20M/tcqBij+6UbSGlvwWtaptigQaCi9GRDpO+AUfMdxD7ZDnTwi
	DqdZSI+JKI5MZ+a7BGopdGFJ9lHSJrMqAcdiDpMFop2/1zzttvegK/TpMBk7zSRRrX/kiuq1/9I
	zrDQ24+Aktmzf6FjZv5ml7lIkANSnf04HSCkikC6WSpA==
X-Google-Smtp-Source: AGHT+IEP9JF0BFcToEhjegSHbFJk0PTOt+f9xK2X/vV0fQdTfHzEeIN5MYQBuD+Fh/GNwuhplztfeSXfowd92DL5nfA=
X-Received: by 2002:a2e:a375:0:b0:32a:77a3:877f with SMTP id
 38308e7fff4ca-32b98e07923mr22842501fa.2.1750619394440; Sun, 22 Jun 2025
 12:09:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CA+fCnZeb4eKAf18U7YQEUvS1GVJdC1+gn3PSAS2b4_hnkf8xaw@mail.gmail.com>
 <20250622141142.79332-1-snovitoll@gmail.com> <20250622112014.76bdd8929ecdb1c1fb3015b5@linux-foundation.org>
In-Reply-To: <20250622112014.76bdd8929ecdb1c1fb3015b5@linux-foundation.org>
From: Sabyrzhan Tasbolatov <snovitoll@gmail.com>
Date: Mon, 23 Jun 2025 00:09:37 +0500
X-Gm-Features: AX0GCFt_VnjkwnxlecvFFQmeMV04Nl7ypc_hhjKQR8oRDBApGtCmD_ujn1PLyAI
Message-ID: <CACzwLxgSBszyEr4zRqMbnoA0PEnZQNy8_ZKTMtwm-Nkho5MePg@mail.gmail.com>
Subject: Re: [PATCH v2] mm: unexport globally copy_to_kernel_nofault
To: Andrew Morton <akpm@linux-foundation.org>
Cc: andreyknvl@gmail.com, arnd@arndb.de, david@redhat.com, dvyukov@google.com, 
	elver@google.com, glider@google.com, hch@infradead.org, 
	kasan-dev@googlegroups.com, linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	ryabinin.a.a@gmail.com, vincenzo.frascino@arm.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 22, 2025 at 11:20=E2=80=AFPM Andrew Morton
<akpm@linux-foundation.org> wrote:
>
> On Sun, 22 Jun 2025 19:11:42 +0500 Sabyrzhan Tasbolatov <snovitoll@gmail.=
com> wrote:
>
> > `copy_to_kernel_nofault()` is an internal helper which should not be
> > visible to loadable modules =E2=80=93 exporting it would give exploit c=
ode a
> > cheap oracle to probe kernel addresses.  Instead, keep the helper
> > un-exported and compile the kunit case that exercises it only when
> > `mm/kasan/kasan_test.o` is linked into vmlinux.
>
> The recent 707f853d7fa3 ("module: Provide
> EXPORT_SYMBOL_GPL_FOR_MODULES() helper") quietly added a thing which
> might be useful here.  As far as I understand it, this will permit us
> to export copy_to_kernel_nofault to kasan_test_c.o and to nothing else.

Thanks for letting me know about this new method.
I believe, the usage for our case is:
EXPORT_SYMBOL_GPL_FOR_MODULES(copy_to_kernel_nofault, "kasan_test");

>
> "might".  It depends on how "exploit code" might get hold of the
> symbol.  Perhaps you/we can discuss this further.  Is the problem that
> copy_to_kernel_nofault() is non-static?  Or it the problem that
> "exploit code" is itself a kernel module?

I haven't verified this, but theoretically, it's a handy
=E2=80=9Cwrite-anywhere-safely=E2=80=9D ROP gadget.
Assume the attacker has already gained an arbitrary RW primitive
via a UAF/OOB bug. Instead of stitching together
prepare_kernel_cred() + commit_creds(), which is a common path
of using exported symbols to achieve privilege escalation.
This path needs two symbols and register juggling.
With exported copy_to_kernel_nofault() they can do this:

/* Pseudocode of exploit for a ROP stage running in kernel context */
        struct cred *cred =3D leaked_pointer;
        rop_call(copy_to_kernel_nofault, &cred->uid, &zero, 4)

copy_to_kernel_nofault() disables page-faults around the write,
so even if cred corupts a guard-page, the write will not crash.

>
> In other words, a fuller investigation of how this export presently benef=
its
> exploiters would help us understand how much
> EXPORT_SYMBOL_GPL_FOR_MODULES() will improve the situation.
>

Please let me know if I should send v3 with using
EXPORT_SYMBOL_GPL_FOR_MODULES(copy_to_kernel_nofault, "kasan_test");
