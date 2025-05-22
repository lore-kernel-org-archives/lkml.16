Received: from mail-il1-f174.google.com (mail-il1-f174.google.com [209.85.166.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1384D28D82B
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 22:48:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747954130; cv=none; b=IlzZKcXEvpH9H48t+HTTUfz7XdAlnmJxAOyUx44USAKFKtP5VOckeEZPxiz7Df4vCnN8RDjgbncf3NnTY4h4+N0rTU8RA2+UThluJPz2Xhj0x14MlXaU9bGFvXPzd6q/50pBTXrWMrz8JNMO/FH96ESVxtzq/pfYajZB/IRxi3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747954130; c=relaxed/simple;
	bh=Lh5XAd4GRusClK6uzw8nnaO+2cTgkyRFtkF5BPYJ2GM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JdPFP/vP0/A6KkdbRQFqockmlTp7ACrCc+8Y3CUQvaisF1BhWd/dLEWqu8Tb6zgZu2jd6C0yaDjJxwhYpYrIDaj++SUOE3M2w/HS60xhuJuo9Dk0siTt+Ir90D0qMeVnlQdfFwgVr3QPW7uGHgMKyK9Csq7X0DqdHH0gVmRP1Wo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ob+8ZXMl; arc=none smtp.client-ip=209.85.166.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ob+8ZXMl"
Received: by mail-il1-f174.google.com with SMTP id e9e14a558f8ab-3db82534852so63265ab.0
        for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 15:48:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747954128; x=1748558928; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Lh5XAd4GRusClK6uzw8nnaO+2cTgkyRFtkF5BPYJ2GM=;
        b=ob+8ZXMlEWoRKRBV0qSBfYePxB0rTmP8oXNU1hRwyFiR+EdP5/O3XPrmYYcCC+VjKK
         dsO6plBZiZis1EaD3byfNwxVFxdzZ0DhkRYUbRnL74YUdhh3k97NR1X/H3CdxkmL3Kgq
         UK4QuEltix4d+3wjdax9+rYkG9UxhSMFUygfdnZmxIAGFxYGgbWulX+213AyeEpbMToA
         AMEer515GJyCPQ8UjNIsbKW6vmi4kM9Jxl0zc2afpe4jw99p0BGKEquJuwbrp/pglyNs
         wjzpWGdDJIyK7bFBJipBWo/FYvDWoEPVn3DxR5WldYz4GgVwQgSLLErTp+HbTbgXBbTb
         oY5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747954128; x=1748558928;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Lh5XAd4GRusClK6uzw8nnaO+2cTgkyRFtkF5BPYJ2GM=;
        b=cB56lOBJ2mgfrfQPG6A4SJ57leHTGWWQa987TEjfQh9v8smBjAtr4vn63vghIx5tat
         rWjLFMMVXaHVFQ79E5sEms0evDaYcXwgEsPwaP+Ot46ZJpallOHqVHTQt7LutmcSuvSN
         aR5HB9ZeW5o4Rm+CAlcxvXi5Y6lOqTsLnh9abzmK9otk905aNYTKtrIqXT1bkDvsOPvs
         v2dVrzRobn/DtFP0a564BKK9gmt6NdvjI24VsG8RncPk0/KsmfTOc8LupmlCIcQybQci
         JX0gFAg1kRt5pZhZifXyk+aWEY40CVO34YGitC2GISt2Z95m8jFggO7TP6607NrApAX0
         MvUA==
X-Forwarded-Encrypted: i=1; AJvYcCV/Cd3qBuc8hZ7JSosC9ritfuBSDyoNvYdfgll9TIG9Cw9qs50YnBVAvl3/m/QHT1W+hTXalTMww56gmo0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwSmH315H37XbdxJNs8OKL3jt6KcHj6MQbSj403uBa5OXSCIN6B
	LlyqlEwwhryFks2tjfRYm73zejUNo61OMPNum7PTmgqIj02WevRw2kBwGpsDLtK2H2ojlcYyqId
	yge7eN8dwbvueQgQWfVP6XO+3hSeHUoetlh6sS3PM
X-Gm-Gg: ASbGncvzEinMJ9bSFHOgiS25zDV6woO5lIbJJafnf+pgC1OyrB8AXb8L7ndOSm0c58Z
	GgOrkgeNLofssfhP+XrD9gln9ZIeQ70yABWjisQJzrd9by7DGmL2DH0tCA8nDnnEvVh6LMvnWd8
	WJCXK9rafqlovaMgZPfLrY6OlkudCgAwPNCW9pn9QPWd+DlCtt1EHy
X-Google-Smtp-Source: AGHT+IEcVuhl6pdBtsJPO9SxSrdyzAjcwGvNTyJ8sZXSxIg3HhDaeESwLUjKBACBrwiGRGmplI7LBnRquwe4/RS9YQ8=
X-Received: by 2002:a92:cd85:0:b0:3dc:8041:2363 with SMTP id
 e9e14a558f8ab-3dc94246b2amr483255ab.3.1747954127815; Thu, 22 May 2025
 15:48:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250509072054.148257-1-chenridong@huaweicloud.com>
 <aCcl9M-BgOJ86gVJ@example.org> <f5c701d5-c501-4179-959c-85057705a09d@huaweicloud.com>
 <aCtdCkSGQJKCYApm@example.org> <6c3b4ac3-fe33-45d0-b7e8-d722e29c8240@huaweicloud.com>
 <aC2AyjNxKRLQf0fd@example.org>
In-Reply-To: <aC2AyjNxKRLQf0fd@example.org>
From: Andrei Vagin <avagin@google.com>
Date: Thu, 22 May 2025 15:48:35 -0700
X-Gm-Features: AX0GCFuP8oirMe6LkdD-GgSjeQX2qm3v4SPNsrZEFtM8AzcFsq5DRdNoFRaP9Bk
Message-ID: <CAEWA0a6t8nsXkiM=VF_zQ+vk+6hrbGt23oig1jf8No2GopGR1w@mail.gmail.com>
Subject: Re: [RFC next v2 0/5] ucount: add rlimit cache for ucount
To: Alexey Gladkov <legion@kernel.org>
Cc: Chen Ridong <chenridong@huaweicloud.com>, akpm@linux-foundation.org, 
	paulmck@kernel.org, bigeasy@linutronix.de, roman.gushchin@linux.dev, 
	brauner@kernel.org, tglx@linutronix.de, frederic@kernel.org, 
	peterz@infradead.org, oleg@redhat.com, joel.granados@kernel.org, 
	viro@zeniv.linux.org.uk, lorenzo.stoakes@oracle.com, mengensun@tencent.com, 
	linux@weissschuh.net, jlayton@kernel.org, ruanjinjie@huawei.com, 
	kees@kernel.org, linux-kernel@vger.kernel.org, lujialin4@huawei.com, 
	Eric Biederman <ebiederm@xmission.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 21, 2025 at 12:29=E2=80=AFAM Alexey Gladkov <legion@kernel.org>=
 wrote:
<....>
>
> > > All I'm saying is that "bottleneck" with atomic counter was there bef=
ore
> > > and can't be removed anywhere.
> > >
> >
> > Yes, it can not be removed anywhere, maybe we can make it better.
>
> Yes, we probably can, but we need to have a reason to complicate the code=
.
> And we're still talking about a synthetic test.

I think I have a real use case that will be negatively impacted by this
issue. This involves gVisor with the systrap platform. gVisor is an
application kernel, similar to user-mode Linux. The systrap platform
utilizes seccomp to intercept guest syscalls, meaning each guest syscall
triggers a SIGSYS signal. For some workloads, the signal handling overhead
accounts for over 50% of the total workload execution time.

However, considering the gVisor problem, I think the solution could be
simpler. Each task could reserve one signal in advance. Then, when a signal
is triggered by an 'exception' (e.g., seccomp or page fault), the kernel
could queue a force signal without incurring a ucount charge. Even
currently, such signals are allocated with the override_rlimit flag set,
meaning they are not subject to standard resource limits.

Thanks,
Andrei
