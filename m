Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0382915E97
	for <linux-kernel@vger.kernel.org>; Sat, 31 May 2025 18:20:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748715643; cv=none; b=BAmSQ/X+/+EAj63XTi4ml5102VrckjEH4MpKOqvZ41cGXgK7RupvlsVtAvtXs+jyQaODmJGBoLiaGDBV2Q5Q2Nl3UiNFkXEqjatfbrBD7Glx+Fr6JK1E52OZPk9DXGTWpE34IeTorRTAFgJnrMNOldmYPx/Jw4T7Oehos9XgE8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748715643; c=relaxed/simple;
	bh=g1YXaWkHeBBoh5aON1H/wkbwtxVq56hqXg0PL20DN6k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NpOjKiPD3CRuDQCRQ1Yfq7qXHhKiUtAi8V1F9Wy3DnUvz7Mc5NLoX4WzgX+UjAXnTdkKsswZOGwHlejs7OgYhGrj6KInvlReYSwVek0Br50UJqvP/hPUhe2k3laOAtph0PCRDdgBYZIwzPgy9Mx0hg6Nby7pN6OQBujY8ldbwPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=QpXbdA1M; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="QpXbdA1M"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-acacb8743a7so550277366b.1
        for <linux-kernel@vger.kernel.org>; Sat, 31 May 2025 11:20:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1748715639; x=1749320439; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=3TCK79rzW2CQXkeBe174A4ly8q1x+sDUlP4xsDI45wY=;
        b=QpXbdA1MQvmHhY2XKJ2Xd7JCdgGbx1fzT+iwMbtlnOB3iMABoPqwtvLLTeDjGQdAkY
         wDxzRh4XEZWYwNDO8gouJCWfOmXr0FZEursOcG8bAhUwUiLV32lRhl+cWW6Ica149Fck
         v76JTh8K1F2U99umvOc2Wp5LZxpH3eoI3kx1g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748715639; x=1749320439;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3TCK79rzW2CQXkeBe174A4ly8q1x+sDUlP4xsDI45wY=;
        b=gx8EdC7R/pMfu3nS9fbT40LiUpmvsKWPBiVYxU/seIIYQYeKjujBtuAAhpcnZJS1w4
         VgaDwX/JzPNEkk0CnRaQrbyHG5XlflTKeN1WNYPVeEFEXd3Ze4Zy0+DYZ37Vnc1/w28G
         8cXQLdXy+ecLdX9/gxoYTTFM/biLk6MkM1Uzb8etnJUrxFCxwUVjeUTY/KdIXX/JU0Qa
         AfSeZ0PBsKbrrpde7u7KRX1qNd62wZhgHsLv9LdUvhufMF3mx7+0WCFpfV23sZKABHmu
         qtPxqs+BnUOcawUTnRuine/9Y6IgzLyGpDXdiHWbv3VFeRrITyaeywaD/Pbw7oXes0Bm
         A6Ig==
X-Gm-Message-State: AOJu0YxBHtAZ0df8Wf8mNMNe+JpkORGZpT8uX+gN723/ZR4rDcgeVzZZ
	1QSfKa7ZTvP2Uf4DsOe2hMoyP5Oih52/P/4A8SB02KJ7AWlZS1/LQ5yDQicdacDoMR9Jsp6NdeB
	URsa6t30=
X-Gm-Gg: ASbGncuaIAWWu+JrLTEo1qE8WJ9v3O3iWMQ+smkGhzcuLHLirSO6L/7+aUYaFbh9hp6
	FdzazJgL3Gwp+r8/6qaPB5ETp2kFTKCsoeBJk9T10tbXYqOTpR4YAKMv6uYgGpWIv0fasB/rXsr
	vmH/y/lQ7rEcln0QRYWD0LZ2FW0X6Kctq7c3wPPcirh6eSHsYqik1tp0SGXADLiZj9rcpONGFzN
	a/RnyrXfknrAMEn5wA6BDsiKyLOpefy2/LV/ejJsF1lN9Z+cRgIbYgH8ieQJzcXseuf9L32X36O
	ZNKhWZatEAiiQdsEkN2oBQR5gZNYf56HLhWMqY+lIb33CyjZE2F6HyW+mrGvQHOTT97KrNtbMLV
	a2Y7MAI29UW33QQySqNfwfZ3Psw==
X-Google-Smtp-Source: AGHT+IHIIDs5U40cJEIfvXiVPKEy5PruHRglH6qtdvM7/LbBZpU5PDl/0MLLC78+JIeEgcHg9N9Atw==
X-Received: by 2002:a17:906:c10e:b0:ad5:6258:996f with SMTP id a640c23a62f3a-ad8b0e38931mr986712566b.19.1748715639026;
        Sat, 31 May 2025 11:20:39 -0700 (PDT)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com. [209.85.208.52])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ada6ad6aa17sm535369866b.175.2025.05.31.11.20.37
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 31 May 2025 11:20:37 -0700 (PDT)
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-6020ff8d35dso1069003a12.0
        for <linux-kernel@vger.kernel.org>; Sat, 31 May 2025 11:20:37 -0700 (PDT)
X-Received: by 2002:a05:6402:13c2:b0:5f4:8c80:77d with SMTP id
 4fb4d7f45d1cf-6056f2dcee6mr7392841a12.6.1748715637006; Sat, 31 May 2025
 11:20:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <202505310759.3A40AD051@keescook>
In-Reply-To: <202505310759.3A40AD051@keescook>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sat, 31 May 2025 11:20:20 -0700
X-Gmail-Original-Message-ID: <CAHk-=wj4a_CvL6-=8gobwScstu-gJpX4XbX__hvcE=e9zaQ_9A@mail.gmail.com>
X-Gm-Features: AX0GCFsw0RakLu4NbgZH60L9hc3sRPVu3EiOps6PGFrH5DreN9vxerKDG8IrIHM
Message-ID: <CAHk-=wj4a_CvL6-=8gobwScstu-gJpX4XbX__hvcE=e9zaQ_9A@mail.gmail.com>
Subject: Re: [GIT PULL] hardening fixes for v6.16-rc1
To: Kees Cook <kees@kernel.org>, Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org, Eric Biggers <ebiggers@kernel.org>, 
	Ingo Saitz <ingo@hannover.ccc.de>, kernel test robot <oliver.sang@intel.com>, 
	Marco Elver <elver@google.com>, Nathan Chancellor <nathan@kernel.org>, 
	Thiago Jung Bauermann <thiago.bauermann@linaro.org>
Content-Type: text/plain; charset="UTF-8"

On Sat, 31 May 2025 at 08:00, Kees Cook <kees@kernel.org> wrote:
>
> Please pull this small handful of hardening fixes for v6.16-rc1.

WTF, Kees?

You seem to have actively maliciously modified your tree completely.

There are completely crazy commits in there that are entirely fake.

You have this: f8b59a0f90a2 Merge tag 'driver-core-6.16-rc1' of
git://git.kernel.org/pub/scm/linux/kernel/git/driver-core/driver-core

which *claims* to be from me, and committed by me, but is very much
not. It's some garbage you have entirely made up.

Yes, there is a real commit like that, but it's has the SHA1 ID of
9d230d500b0e.

And this isn't some kind of innocent rebasing mistake, because this
actively lies about who committed it.

This is completely unacceptable.

I will now refuse to pull *anything* from you until you explain what
the f&*^ you have been up to, because this looks like you have been
doing actively bad things.

You need to nuke that tree, and come up with a good explanation for
this kind of shit.

I'm cc'ing Konstantin, because I really think these kinds of games are
COMPLETELY UNACCEPTABLE, and this is not the kind of behavior we can
have on kernel.org accounts.

Konstantin - please disable Kees' account immediately until this is
cleared up. Because this looks *malicious*.

                 Linus
