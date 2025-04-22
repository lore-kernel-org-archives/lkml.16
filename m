Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 743C015E90
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 00:32:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745281934; cv=none; b=sCrrGQD8oQlZPgvRbAmZMf9JJx4nwJ85sQ03wYCMNH9SnXsIKLFiP9o2mkjb6z4u3Fm0bgu6KZh4Pn7UYJA98m3WqmDQPLGCcTkejO7/7Chlv2ng8rgGcWhzLG4fXEmmzTCdsiwrcUcpG2uTasCoufoMWPGBqcANbeFq62ykjhs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745281934; c=relaxed/simple;
	bh=iCw6Dt3slKkxmbR6KL74m3SMvxMIomnJTYsCAq+YeBg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZT0SyBxMXnX5baKjGN5oLXLK328f2UOdK4Ek0nS9FRDGn8vezr7EVjW2topJgQGc8uUkBlVOJNwr3JR4iE36+nNt8B/7zOtxJXXC422H3FsdbyxYo27I+0FWeIibgnbythGZEleFmVsKpBRDm1riJtIsYE9KLnmhTSk3y+ZsAkY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=msHJv8oj; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="msHJv8oj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0FBEC4CEED
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 00:32:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745281933;
	bh=iCw6Dt3slKkxmbR6KL74m3SMvxMIomnJTYsCAq+YeBg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=msHJv8ojdvklSGKAN+h24sVK1+CKXsEjLe0nT/NMXSqc4ytGw95ks0WccZjBBaj+Q
	 A+khtAeSICUYY83qGO+smNsp6O/lZZe7lshRfeknFfdiWv0HCCf/ataTspOl6BDJJx
	 h4ysDE88Pq+QT1Re3rey8ZsGFcTAPAnTg6zomY7mw9sl8MWkr4L2k3kv9hxvBg7OIV
	 Zl1d8wYhFcYsajdw+dweGScy7WzweCLkMo7a0O6qGXwxLRgKasG7w2faC5kNo41vj7
	 bRCvLxN/ha3FBcg9hEq3mDZwZZhbaWVGvYD4LtDkj/ZGk/Ry0U/zhoNHGbWrXypfha
	 BFvo1ypR8sn8g==
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-476a720e806so41466411cf.0
        for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 17:32:13 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVk6CEKd9xhVBhgqzHzEWHBmpiTYksp2rJTuB0RypUn2KygqQTgYjF1WkhSf7x0FfdDhGPFm4sfHFoV31Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YxtuIUnb1WDbaNHhOTzip6xVqeOx+oxyG5gp8rzQVzqgx13AVEm
	NTPx1vy55CUqUgtGDsh5Wuh30AcHyDHq4hxzdZ1EPqHLWpFOgedH2fTjdcFl3Kzf9ACxXcrCSbx
	OVcf6SMTFwsmLpmq0eaTZzikic0Q=
X-Google-Smtp-Source: AGHT+IGaL+oVXQ+0FqVmw9bQumaSFF+4x9KoZGhd6tnMCmCAgtcpexZZgw6KB9L19Vn+Vxy54SDS7aSUKuKUDl3eZG8=
X-Received: by 2002:a05:622a:13d1:b0:476:8288:955f with SMTP id
 d75a77b69052e-47aec3541fdmr256753991cf.8.1745281933032; Mon, 21 Apr 2025
 17:32:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250412010940.1686376-1-dylanbhatch@google.com> <20250412010940.1686376-2-dylanbhatch@google.com>
In-Reply-To: <20250412010940.1686376-2-dylanbhatch@google.com>
From: Song Liu <song@kernel.org>
Date: Mon, 21 Apr 2025 17:32:01 -0700
X-Gmail-Original-Message-ID: <CAPhsuW4=dr1Zq5to-JVqHsvaKcg4V2MbJf7i_C=erfAG1XuD6w@mail.gmail.com>
X-Gm-Features: ATxdqUHiMCb3QBWfl3iq-hKAxCkLsWmEI2O_8MQLyC5Njubt0SDDzPTeNGE0enc
Message-ID: <CAPhsuW4=dr1Zq5to-JVqHsvaKcg4V2MbJf7i_C=erfAG1XuD6w@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] arm64: patching: Rename aarch64_insn_copy to text_poke.
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
> Match the name and signature of the equivalent in the x86 text-poke API.
> Making the src pointer const also allows this function to be
> interchangeable with memcpy().
>
> Signed-off-by: Dylan Hatch <dylanbhatch@google.com>

Acked-by: Song Liu <song@kernel.org>
