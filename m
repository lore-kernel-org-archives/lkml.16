Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27BDA1E51F6
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 20:29:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745872192; cv=none; b=dtY8zEJAAP1NlEpV0BF9IuteWHPJQUP2jyzPHh95HZTyOpgliXH2VJYlfrT/ErKwu9jNKi2iO14I09R0q2I0SrmtOYXGnrP0t/eXMI8GuOMG5dP8P3GGVz/CVLByG2K7xV/31UEcF2oIg6EmJ1120SilR55Qf21rsk+HSw2q1wo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745872192; c=relaxed/simple;
	bh=9y0PfaE/6TV4pAXVufp0rlzILp7rIOKrXiLkxRqTKx0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qOO1TzAqVH2DF/060itVkTQJzLiRfbCsWuYVhUJQN+ZBbv9s7ue6TTNbWMjSeXWJIcQeMAF59CS2jYjJ8slm7Wfobks4XxVASTyfau3b4eKcoua0Ecw13s1IxYWXoLU7Oz9YaGjpvu9XmLMO4KYmulzyxbIIUIAz3KBmB8e7YVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JxUZcQv4; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JxUZcQv4"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-301a8b7398cso745827a91.1
        for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 13:29:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745872190; x=1746476990; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=muruLZ8jDogUrA97U90RpTPwvwdtevKxgVq9iGiXD/0=;
        b=JxUZcQv4OrARfCogIskNlkfC9FQ17opV0lIlJH3Xpwz3SOPOzlKPtqBaW+wZLO5lzA
         uz02W24AW7OEb8rX3CPoZ0GfpvkPdYS0f6e+hBDSWKnXSMooNVX44IKCXLx2LDZuAFFM
         EKvGO+TxSXLI1L1sYAHR0cowESXxy8oqbxEy37Ov1zRQouM8CQlARf45oybbE3hWcYWU
         k6xksAwdCC/GuxdOm3+RftaBWMCz4ybylNmxaql1REO0ryq2sBV51sgSC69BEt+MBxMI
         Tp1bQh5t149vHdGV5DAoqk+nfH9LjAUDi39V8mhQD/qbX2uf5t7wJmt/1nQEUkV2tD3H
         tbXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745872190; x=1746476990;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=muruLZ8jDogUrA97U90RpTPwvwdtevKxgVq9iGiXD/0=;
        b=pZfmt38T9NjZzJPQOJ2LppT+sNsFLKkeUwYwwwuI5C35uKxivIBoXQl7zj4OLz2icm
         jbLWXIQ86gIiZAlVso3Yk5IeZ7BSxVg0v6GoazoKYjKk3ikhQNwN42s2V/Poa2QJdVeI
         MhNtugLwiW/bNPxUTArlPj9nKuYMOKHe7pDbf8uatqtGup+0FxP5Pq3hMCJfZ22UAEKe
         N+Smlu/ek8sJoIcPl/KwvOEyI/NE10XZj3oYUvjqNlHYGRec7TNIttrhWEkt+YVoMYwh
         zlfrbMIsy8U4K+UFmw4X1MEjQ464fHO5RGSIMjs1I1hahlhdmyBCE0/fDYvU+FOVlmfe
         4Okg==
X-Forwarded-Encrypted: i=1; AJvYcCX/nUiI602vYfHtgewpXsP+wYPgyptY4lpFO8sQmd5ddD9FNARHu/DT/kt3d8ItN9TrA+qbtf5sO1UqZ6Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YzsOs0CB2oUHZGUJRopA+Jd3gRjapffIqf2DhdwU7wR3t8XNPr5
	LY/duN3rArowGzlV/Vx/bWGw92oxI81D0QWydWxJHVJWqK2HcCK0xp2u/NGGr+75/jdEBq0VEu7
	OII+qhInXp80fw/cwAbW3w9pqDGE=
X-Gm-Gg: ASbGncvQRs+I17RyN6fldNiAKDUIteYnCoNtb2VE0vSksLmlio2G/aPD8xkMKiNmhAw
	cZrZP1tgD78t8HPvY7ShxTJrYbPu8eJIQRPHMCvn/SVRONGgNAdO5bgddERVaXAngDk/vA8Twgk
	gYdx8MwmsyjN4pdnVTsHxT8A==
X-Google-Smtp-Source: AGHT+IEUTtzLxs5g5kci6lKCF5KVuZ0xnaZX56Mvsf90g0KbQUQr8wiEQn+WQgoSjGtyk87mNvopu1KNHYsC8JAMUx4=
X-Received: by 2002:a17:90b:4d08:b0:304:eacf:8bba with SMTP id
 98e67ed59e1d1-30a220c9efdmr372231a91.4.1745872190315; Mon, 28 Apr 2025
 13:29:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250114132856.19463-1-yangtiezhu@loongson.cn> <ab7f1ba8-a49c-41a1-9b6f-ca142fbbe9d2@aosc.io>
In-Reply-To: <ab7f1ba8-a49c-41a1-9b6f-ca142fbbe9d2@aosc.io>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 28 Apr 2025 16:29:39 -0400
X-Gm-Features: ATxdqUGv1ycYYD9t-wVox9vr8AM5Fx_3PDDiQ8wX5TQlGWUKZ2inXTmqYb8_VfM
Message-ID: <CADnq5_PCMDBVQn6sL7_3C=aHk-b-wn-JzPnQoTun7DcqN1PNrQ@mail.gmail.com>
Subject: Re: [PATCH v4 0/3] drm/amd/display: Stop control flow if the divisior
 is zero
To: Mingcong Bai <jeffbai@aosc.io>
Cc: Tiezhu Yang <yangtiezhu@loongson.cn>, Alex Deucher <alexander.deucher@amd.com>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Xinhui Pan <Xinhui.Pan@amd.com>, Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>, 
	Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, Huacai Chen <chenhuacai@loongson.cn>, 
	Nathan Chancellor <nathan@kernel.org>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, loongarch@lists.linux.dev, 
	amd-gfx@lists.freedesktop.org, llvm@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Kexy Biscuit <kexybiscuit@aosc.io>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 22, 2025 at 11:55=E2=80=AFPM Mingcong Bai <jeffbai@aosc.io> wro=
te:
>
> Hi all,
>
> =E5=9C=A8 2025/1/14 21:28, Tiezhu Yang =E5=86=99=E9=81=93:
> > As far as I can tell, with the current existing macro definitions, ther=
e
> > is no better way to do the minimal and proper changes to stop the contr=
ol
> > flow if the divisior is zero.
> >
> > In order to keep the current ability for the aim of debugging and avoid
> > printing the warning message twice, it is better to only use ASSERT_BUG=
()
> > and SPL_ASSERT_BUG() directly after doing the following two steps:
> >
> > (1) Add ASSERT_BUG() macro definition
> > (2) Add SPL_ASSERT_BUG() macro definition
> >
> > This version is based on 6.13-rc7, tested on x86 and LoongArch.
> >
> > Tiezhu Yang (3):
> >    drm/amd/display: Add ASSERT_BUG() macro definition
> >    drm/amd/display: Add SPL_ASSERT_BUG() macro definition
> >    drm/amd/display: Harden callers of division functions
> >
> >   drivers/gpu/drm/amd/display/dc/basics/fixpt31_32.c  |  2 +-
> >   drivers/gpu/drm/amd/display/dc/os_types.h           |  7 +++++++
> >   drivers/gpu/drm/amd/display/dc/spl/spl_debug.h      | 11 +++++++++++
> >   drivers/gpu/drm/amd/display/dc/spl/spl_fixpt31_32.c |  2 +-
> >   4 files changed, 20 insertions(+), 2 deletions(-)
> >
>
> Gentle ping on this series...
>
> Harry and Huacai, can you please take a look at this updated series
> (since you have both provided comments on previous revisions?), thank you=
!

I grabbed this series, but after reading this thread:
https://lists.freedesktop.org/archives/dri-devel/2025-April/503021.html
I'm wondering if it wouldn't be better to just allow the divide by 0
rather than triggering BUG().

Alex
