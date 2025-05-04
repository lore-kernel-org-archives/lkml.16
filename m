Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 971B041A8F
	for <linux-kernel@vger.kernel.org>; Sun,  4 May 2025 06:36:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746340599; cv=none; b=sf+evZdeQk/mIptHIjtsq5cW5GdESxkvBKnmhRCGbZ4VNE+8+R3hBeexCmAPEumMFGofPZ5NG0D2hzEKAm9EuvgHQjULIc2OmGe+bEdyC7EKGo4Tw9LaCFjMbWqk2Vo5khf0QA/Pm98gvEa1jJMMwuOSjYQud9dt3px1t+30jLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746340599; c=relaxed/simple;
	bh=tOPjQ/cSKRGlSUrmXhAksC/DTHfM0mDazsryZyMgWuA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eG7c5ar5SqQBdkbLOZm9FViIweYCLAjOgPK4i+l9xgR4WaNjrUBlMvLgzXLfPgMmmirakfvxdMKac+lZNmQCoDHOwXDx93pe2MikbSjKWoYLcrH6enIXXkj9vLU/NKa4er9dg9U6B+Yq8axWR3WvxHyGpYItqvx+iPXGLAVlgGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ionos.com; spf=pass smtp.mailfrom=ionos.com; dkim=pass (2048-bit key) header.d=ionos.com header.i=@ionos.com header.b=QMpSLQkL; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ionos.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ionos.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ionos.com header.i=@ionos.com header.b="QMpSLQkL"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-acb2faa9f55so439111466b.3
        for <linux-kernel@vger.kernel.org>; Sat, 03 May 2025 23:36:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ionos.com; s=google; t=1746340595; x=1746945395; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JHaTiwJI4/sfwpLaaPdwgVUdtAp+UY67EwcfFEyOC2Q=;
        b=QMpSLQkLS7LHXSJTfzPz2TETAUYVPR8nk4lIIowQI8te3RyF+gPlORU/DKeKnCJnHG
         clwMeWZEKJRsIHiafGgPgSrh4+JrjHoQqmzU77tRdeLHfk5SSLFQ/sBHMVteJCo3UWz4
         2sKWz7GHzU+n6ZaXM0qgGnL+3FqxlAqDKCoybbH/ycNIxVlUdatf5G6T0lDQbEzILlHn
         Nd/NE3YUllbeDkNPPbzt15AJ9ZN3OZ1EDA1Fe+sfLS8QceD0jVd7NmjeZetTY8kOikUF
         Lnh1Nu5hsRJ4nc82pMcG2TvqxYrhG/R0JJeaOLLjLgX5OpV5cBVz9+6Gk8AwXC7jwJ23
         UoZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746340595; x=1746945395;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JHaTiwJI4/sfwpLaaPdwgVUdtAp+UY67EwcfFEyOC2Q=;
        b=aab43hA3ijg5ngP3ZDUwRA+u724q+EYAmEjmz/SgGtXrqDuLyzU8GCtcj2mlXjldhq
         FyloFHJQunjGtOYbfiD0jyoQkTTmISOzoufohZMTZgl0Leup/uLbGOKMsxwPuQV7CRLp
         i/GqAbHWqUr0Aaz3wuggjUxAOEADS30q3Y16vKlGTa3nOZxqG5iijNozQZnbuIBk7uaR
         OMCx/onQ39gsm9Zl34JUidU//lNgj7/yKoC/wMGNU83hMGAQSzxQPX4Lf2xOVsR8Dc3n
         KUHlXD9OhOljsYlqgoNMtvbOKtcZy0U0/hWASOG93E0Oi2XPTjDSVJbq0x9SWipFakI9
         WU4A==
X-Forwarded-Encrypted: i=1; AJvYcCV/sEvrpKa2fMHwwiqFX++96bbGd2fISWaoIMd7tJwaf/CEKutwLTNqel0SplOr7wvv6cRfgyCGA4EhT3g=@vger.kernel.org
X-Gm-Message-State: AOJu0YyZ+SMHY9gVcZxwmt5gBf1yOcFc5IKo2LY/Sw8HZWJSCnR2GyYk
	YJA2b00i4NYUYHyvpzIg2fYuR2gURxN1LbhvWAOAgh/pt776SlpKq4Xqspu+Az8ZZIGMqca+Xdz
	8ExMbZP2S8PXIyUpDTYm67s03AVCkmv4UaGu3Bg==
X-Gm-Gg: ASbGnctkR2eW8H7xpG+aBCbBn3D3QUoaS1d+0Ilt68/Q2mHmgA+psB59DFfHdz1poFe
	3819BHwWxgsmHTf0QPdIeQvtwG4tzsHwFD470paOFoOc12d9dMwKv146OJFyjRTZ+jMuC9g+Heg
	z92CiMtzbkYT/Uev5Mt+AWe+2LGN4bjf6dQ05ITCPrBmfHucsJzJA=
X-Google-Smtp-Source: AGHT+IEi9QI+iA/byljfNuvcUrhqdYq3BATKLzJM1rOkfGhccriVUv2+GXPzdWpc9xcFfaAADYuI5Vqi1Nltr6fxqlY=
X-Received: by 2002:a17:907:60cf:b0:ac4:169:3664 with SMTP id
 a640c23a62f3a-ad1a49ff001mr271572666b.33.1746340594757; Sat, 03 May 2025
 23:36:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250502103905.3995477-1-max.kellermann@ionos.com> <20250503194706.d9e775fe8b24ad357cc6db89@linux-foundation.org>
In-Reply-To: <20250503194706.d9e775fe8b24ad357cc6db89@linux-foundation.org>
From: Max Kellermann <max.kellermann@ionos.com>
Date: Sun, 4 May 2025 08:36:23 +0200
X-Gm-Features: ATxdqUELZLmeKzwME6pgBX0qe7w_KLlRNg2LFSpyezlG7ky2d2SYp611oocw1SY
Message-ID: <CAKPOu+_zurvzehn+Wp=gbQxafHP9jBEPM4NcrDzb6Kd2C0MmaA@mail.gmail.com>
Subject: Re: [PATCH 1/2] kernel/watchdog: add /sys/kernel/{hard,soft}lockup_count
To: Andrew Morton <akpm@linux-foundation.org>
Cc: song@kernel.org, joel.granados@kernel.org, dianders@chromium.org, 
	cminyard@mvista.com, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, May 4, 2025 at 4:47=E2=80=AFAM Andrew Morton <akpm@linux-foundation=
.org> wrote:
> Documenation/, please?

Do you mean Documentation/ABI/testing/ ? (like
Documentation/ABI/testing/sysfs-kernel-oops_count)
I'll add that; I was confused by the directory name "testing" and
didn't expect to find actual documentation there.

> >  Having this is useful for monitoring tools.
>
> Useful how?  Use cases?  Examples?

To detect whether the machine is healthy. If the kernel has
experienced a soft lockup, it's probably due to a kernel bug, and I'd
like to detect that quickly and easily. There is currently no way to
detect that, other than parsing dmesg. Or observing indirect effects:
such as certain tasks not responding, but then I need to observe all
tasks. I'd rather be able to detect the primary cause easily - just
like some people decided that they want to observe an oops and a
warning counter.

We always run the latest stable kernel on our production servers, and
this has brought great sorrow for the last year (I think the big netfs
drama began in 6.9 or so when the pgpriv2 refactoring began). There
have been numerous netfs/NFS/Ceph regressions, we had just as many
production outages, and the maintainers wouldn't respond to my bug
reports, so I had to figure it all out myself.
The latest regression that quickly took down our servers was a
"stable" backport of a performance optimization for epoll in 6.14.4,
leading to soft lockups in ep_poll(), see
https://lore.kernel.org/lkml/20250429185827.3564438-1-max.kellermann@ionos.=
com/
- but we observed it only after everything had already fallen apart.
Since our main process has switched from epoll to io_uring, only
second-order processes were falling apart. Had we had a soft lockup
counter, we could have noticed it earlier.

> A proposal to permanently extend Linux's userspace API requires better
> justification than an unsubstantiated assertion, surely?

The commits that added warn_count/oops_count literally only said "is a
fairly interesting signal". See commits 9db89b411170 ("exit: Expose
"oops_count" to sysfs") and 8b05aa263361 ("panic: Expose "warn_count"
to sysfs"). That's quite an unsubstantiated assertion, too, isn't it?

I agree with you, but I thought the point for a soft lockup counter
was trivial enough to see, and I didn't think you needed more
justification than the other counters.

Max
