Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33E63405F7
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 00:35:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745282139; cv=none; b=UVmWT1jCl9LCDPLJZwyPQhuWT8SAGxiE/7sU43/fFTIlgDW+ZOLOnVtN1AnwdvHg9/whPFwz6sdjsiasI7zp1AD6sIW87Hug7T0bqPj0to7HgWpHoA5HrxdrdM/kB2apI4JkRDsB6uMVabo/1w3hnC1TfwaLYwH7re51QXZy48Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745282139; c=relaxed/simple;
	bh=6/keifbzIEtVJlfmUO30vCgig+0LPOXWxdcUmaG38oY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Qw2jGnDpHYH2oSpFJJ53xCm50Q7OAvicduPC7QSqn1WziRBorxm60ls3IBxqGG7PyYyTTnhLchE9wnpbPYJRXs1kS75Oaw6zHaQo/yK8e0XsDfyCH9oYSQoWrr7OayYtfwfJNp6uhNShRXZu1kaniJDwc4Qy2748cfZL+tmYzds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uNKeNDyX; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uNKeNDyX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C953C4CEF1
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 00:35:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745282138;
	bh=6/keifbzIEtVJlfmUO30vCgig+0LPOXWxdcUmaG38oY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=uNKeNDyXmWliC0evfHfEB1zR5j9FXZmNXh77klHVuqpl2kXU9PzX4lwILlAAuw3SQ
	 TnmoTrwfud0pA6p7nx8qMgdWxq1/LnOPkxrjC8CClY+v83yTJsmhV8GQI9TA+CaSOt
	 D3tvcvfJTyeZCReN4CCeOz0OYki7oGC9Bn+aRSOVBrukhbd8bpRbQYLFHVkveofC1q
	 ppLqbs/l6ajR6fXzYh7nwr2lMlVcAjAabS85JlJ3w80hggGL6LEi0bU88wPkVO8Jty
	 x4zXNkJUw7EW2hIOTOeT/vv7qE49Bbm81k6RzM5Ie923lFGAMKK4ihj4lnbzV5Qd1m
	 KpMX3TZJ9khjQ==
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-4769f3e19a9so30731471cf.0
        for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 17:35:38 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXAmfbHlyAOHaUg4BCbIBX5vve5ku5CO7hSJ+JNNiiyhoiy6LsNFmFTs0ka6aifEhOZKjTCfOOly91E+1w=@vger.kernel.org
X-Gm-Message-State: AOJu0YzhBi7F27dW93SW/PxNIt3SMf/n6lVd0M2fp1wCy3+TTbdvQ53I
	4FvVfLN6VgR4m4+XPSGYBtspe4LT9KMZWKDq9dRa9At5ZOOt9kzhOaXGTWH3d8LAtyLvIQwVSpk
	8iDHNLT7yMDv396xefRdAL6+7uC4=
X-Google-Smtp-Source: AGHT+IG9u8G20E0oo1O9mluOh2KQ5PFLirBFpteAz/tNX7rHCsPVff3ugqByeJ5CuCdd1xWJ/UgHWfBF3qZBa+iM5lQ=
X-Received: by 2002:a05:622a:650:b0:476:8132:c556 with SMTP id
 d75a77b69052e-47aec4dbfcdmr175809431cf.48.1745282137768; Mon, 21 Apr 2025
 17:35:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250412010940.1686376-1-dylanbhatch@google.com> <20250412010940.1686376-3-dylanbhatch@google.com>
In-Reply-To: <20250412010940.1686376-3-dylanbhatch@google.com>
From: Song Liu <song@kernel.org>
Date: Mon, 21 Apr 2025 17:35:26 -0700
X-Gmail-Original-Message-ID: <CAPhsuW4LO9Cr8kpTeNR7nBw1FYrNrXBndYtcTEnA408GL1jT0A@mail.gmail.com>
X-Gm-Features: ATxdqUF0eWQu3DIXlyOorPxXB9gWMbvA_2k01-Rt21URVsQ-cwGBXbzbfMHyhG8
Message-ID: <CAPhsuW4LO9Cr8kpTeNR7nBw1FYrNrXBndYtcTEnA408GL1jT0A@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] arm64/module: Use text-poke API for late relocations.
To: Dylan Hatch <dylanbhatch@google.com>
Cc: Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
	Martin KaFai Lau <martin.lau@linux.dev>, Eduard Zingerman <eddyz87@gmail.com>, 
	Yonghong Song <yonghong.song@linux.dev>, John Fastabend <john.fastabend@gmail.com>, 
	KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@fomichev.me>, Hao Luo <haoluo@google.com>, 
	Jiri Olsa <jolsa@kernel.org>, Puranjay Mohan <puranjay@kernel.org>, 
	Xu Kuohai <xukuohai@huaweicloud.com>, =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	"Mike Rapoport (Microsoft)" <rppt@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, Luis Chamberlain <mcgrof@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Ard Biesheuvel <ardb@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Roman Gushchin <roman.gushchin@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 11, 2025 at 6:10=E2=80=AFPM Dylan Hatch <dylanbhatch@google.com=
> wrote:
>
> To enable late module patching, livepatch modules need to be able to
> apply some of their relocations well after being loaded. In this
> scenario, use the text-poking API to allow this, even with
> STRICT_MODULE_RWX.
>
> This patch is largely based off commit 88fc078a7a8f6 ("x86/module: Use
> text_poke() for late relocations").
>
> Signed-off-by: Dylan Hatch <dylanbhatch@google.com>

Acked-by: Song Liu <song@kernel.org>
