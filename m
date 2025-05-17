Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 012BF18A6A5;
	Sat, 17 May 2025 12:05:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747483518; cv=none; b=e2KSEbwNHDctkulG7QaQb4/xiOnce9gW84rqP2Us0HNL0YgJiCJPwnhLnn6ZRJap+lhSVLs7P67r69+R7E1yHSigI1Ian/dTiKAfohHWVDEMp2yxTRw2uRSjosagz51pvrdpxoEhASiMysf7KxGqTI9W8jfhktkOd6gsnIcTh8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747483518; c=relaxed/simple;
	bh=lAtnCfMZOKs9Cll0kaKJqrK4KbGBELtukF3hLliN84M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XT+RSQCR5gSt2J4fzKvOn7FCAlfPo8IN6+TSNwYeNsSuxc+chetZW4yjw4rk9EaUh/zW+XWJdMtB7y7y4GHw9eIMUK/9UsDDeT08Ag7zGPYYYW6z9l73z36AYIqeh08riugWFAumL6fxX44FnY4xMxj30eoLbwWK8ivdsKKYe4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HgBlyN7F; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HgBlyN7F"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-30e57a37294so2646503a91.2;
        Sat, 17 May 2025 05:05:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747483516; x=1748088316; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=trS5Tf45Q4Q8voIZQsRn1URle1hcyp3FyQgBJHTcYHE=;
        b=HgBlyN7FUzU4eJrKM9PUEDNxQ0ilh4D+4xeI1mkkpgHGRxSdKdQYwUyMOAi7Qy0/+r
         W5SWNCVI/+r7zGL79FN0jpK9woAyBaoulqnTB1/2ERLcQz4NrBdYvk98H+BQqj/6gkTb
         8pV6H/AFjNyZWkztcUTpnedKtkFFjv/9gb/HQfiYkARYGHPTqrSEJbJQ2siPmRHytf3j
         /DPrf/Ylfbp5IQQkxP6gypm3hURt5+4fxwVwgLGNaRy3jePdFF5Plun0hG2oFINo4f/j
         /kr+NKjEMVUpNmXsNcGXO/pOW+Upk8Gwqx/BTcHoYMb+6KWGv9Ge/IQkNpqv7mwtCsUA
         f+OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747483516; x=1748088316;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=trS5Tf45Q4Q8voIZQsRn1URle1hcyp3FyQgBJHTcYHE=;
        b=qIdnZtj4Xn386aJShHkUHdQJviajYUxNixVLxEOAFZLN7mlXkPVs7lNHOAxmLv5Zfr
         Zgi9G8UXP3pfLpE5Pcw5yK2q9OKdyfx7zNIJltxQjDR0YxnpgKxCnuF+5AMoTZF6Aom7
         jGS79WdeJgogc9w+E3Vp1w1gV6qyaHOuHaHlZ6m6JgHgUW8fgdhMdc46vbu1YzSYWXZH
         MFsDLv/zJtGrVSnVAsoWXWd4SAuz+yJnmugQXNPGo5L03LAMWmBNcK5Xl2a7pidUldbY
         VVgSu2oRencukcHh+NNwtoXQF49KKPvT8hay3AFjlepSRQXG0/3kXCA/QwXAwckcQZkk
         BMBw==
X-Forwarded-Encrypted: i=1; AJvYcCUG0WJRoXG8zDdNbqbgTtP7baQOSbAO/FFKIgzoxSaM7cyj9Vg06Swphld8X+lMoRHRvlPKMvG2LfXY@vger.kernel.org, AJvYcCW8tL25eAb9xpcDe7mHV9KiJvo6XBrf4VVqj8kzfzhaANYgk0U3OmkPYZuR53X3XzUFtErU/IOpx1oGAIb8@vger.kernel.org
X-Gm-Message-State: AOJu0YzrSRgO4rfhgRE/7OPnW+NFv6I5vtGIszabd5GW03Ve3iW90+GK
	psRghMjyJynigWdZgZdipTuEL5PCP+A6lposIkT0FqzwNKU+gn0jeDpIv+7HTgyGOPbhV5H9i+N
	ObTYqbQJDb2vlg/+kNVJO5csnuJ64Cw==
X-Gm-Gg: ASbGncsFWFYsvwHs2hR9yFVRmTxFlxtScnMYJX05I7cHfqBdR6TUORa/LCnd3wyk5XA
	2wvL5yrqKiq045ffDNo8Irxo3s3mULv05nketABFvdiNQ/zovR6rJ4GI8ATGQMT6N7KJhNy98l+
	C7boH8eGOgzb9tkDfJtTIfS8DuQwPfAQbhxWsWRpwdOnyyXLXHoWE=
X-Google-Smtp-Source: AGHT+IFI8t5oUuYfe512sN4hbdlkBf4YUWLXrADSfeEF5vKKfDDHKRQpVIRW80AfaLm76cL3FeIf/kIdhg0r0WB9ivI=
X-Received: by 2002:a17:90a:c883:b0:305:5f25:fd30 with SMTP id
 98e67ed59e1d1-30e830c515amr9459443a91.4.1747483516125; Sat, 17 May 2025
 05:05:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250517020552.737932-1-jihed.chaibi.dev@gmail.com> <62bd6757-c4d0-42c1-a76d-abea18a8a55e@kernel.org>
In-Reply-To: <62bd6757-c4d0-42c1-a76d-abea18a8a55e@kernel.org>
From: Jihed Chaibi <jihed.chaibi.dev@gmail.com>
Date: Sat, 17 May 2025 14:05:03 +0200
X-Gm-Features: AX0GCFuNFekTg5gca9fpp_VxfmBAQaFo3x-lUPk2J9pqCLWIQ9UGAmDnzGo-2_o
Message-ID: <CANBuOYpRQNx+n6BjpAF0LufpUqRA3wU-GzSNygeWurohXYNF6A@mail.gmail.com>
Subject: Re: [PATCH 1/1] Fixing a minor typo in YAML document
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: heiko@sntech.de, briannorris@chromium.org, devicetree@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, linux-kernel-mentees@lists.linux.dev, 
	skhan@linuxfoundation.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks for the feedback, this fix being kind of "trivial" I didn't
initially want to include everyone and thought it would end up to the
main maintainer after being reviewed by the reviewers/authors of the
file, sorry for that, I will make sure every maintainer is included in
future patches.

On the other hand, I can confirm that I'm using the last kernel version.

Best regards,


On Sat, May 17, 2025 at 1:21=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On 17/05/2025 04:05, Jihed Chaibi wrote:
> > A small typo in the rockchip,rk3399 YAML document ;
> > "less then" should become: "less than"
> >
> > Signed-off-by: Jihed Chaibi <jihed.chaibi.dev@gmail.com>
> > ---
> >  .../bindings/memory-controllers/rockchip,rk3399-dmc.yaml    | 6 +++---
>
> You not only skipped me as DT maintainer for this file but also skipped
> me as the actual subsystem maintainer.
>
> <form letter>
> Please use scripts/get_maintainers.pl to get a list of necessary people
> and lists to CC (and consider --no-git-fallback argument, so you will
> not CC people just because they made one commit years ago). It might
> happen, that command when run on an older kernel, gives you outdated
> entries. Therefore please be sure you base your patches on recent Linux
> kernel.
>
> Tools like b4 or scripts/get_maintainer.pl provide you proper list of
> people, so fix your workflow. Tools might also fail if you work on some
> ancient tree (don't, instead use mainline) or work on fork of kernel
> (don't, instead use mainline). Just use b4 and everything should be
> fine, although remember about `b4 prep --auto-to-cc` if you added new
> patches to the patchset.
> </form letter>
>
> Best regards,
> Krzysztof
