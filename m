Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 432F6A55
	for <linux-kernel@vger.kernel.org>; Sun, 27 Apr 2025 19:02:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745780544; cv=none; b=Pm/v9x9JiPzMUsdFFhPW5cDc6bhBMlR1nEWFrNI8Mxw3LSbpYGGDhXM2QqTOIKkw4QomLusvHEMCM5BoOAsmjI3Rz038rAdsxeUce26K22i/cTw0xdDId7Zo1fwR2aXAqhpS6Sac8VkWpmDXuCoMOkO8FGqkED9kIX7mFTfVKXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745780544; c=relaxed/simple;
	bh=F6b907E0q1NnoYDyDm0n8OMnVyfUHGPTmeS7ucUIsgE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BVmMVfoxdfeHOzctK0UJA6dqC/wuQ5NVRZwK9/08sCNjm1dwytFzkpJdr6zr/y8BGHribEpvnde+bf2j6dEeZyhhFgVswUX6M7JTkvckUfTFOsRuNNxkw3d4FGcNdR1V3o1cftnJVW2y4q465wiAsMd9PQCmOebN1gKEu3cAZmg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CTi+I275; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CTi+I275"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5499614d3d2so4217204e87.3
        for <linux-kernel@vger.kernel.org>; Sun, 27 Apr 2025 12:02:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745780540; x=1746385340; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QaPmd9YiR7u0cQFaQBbg/+xZGk1+cLK6Ao/42+Ljo6g=;
        b=CTi+I275CKJ2jlsU2oKunUAPZjSvFtq/yOCEeP9d/tp+3YSN7DX4PDex05AbqQwcd4
         ElQOqxybTXzTiKcJR1QajHuKZ66x9JRBFJxr9BBf2A1TsR+398aTj6fwcKsrdvMlCerz
         OpSAOz9vFX7/qzA9zzbkfqGVVdGf48pw8ZRdTd+FnoZtIQu/fUejcrpq7CoDhQi/zAm7
         bcoODzdNe3ucLrVnDOlNYWdYAvZWGBgS/TKI0Ds0u74BMKv55kk2DDSxteX+j9xDuVeF
         L1fpDCocw5BQy+uNmConq2q7/N9iFcOdkDuJ09dgaxqBD9BUBJT3lb+BhxlR/Ub+xrry
         JvGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745780540; x=1746385340;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QaPmd9YiR7u0cQFaQBbg/+xZGk1+cLK6Ao/42+Ljo6g=;
        b=T95lhSU07dWqn4q0Pu3fWWaHN9QGkhUbFknjjesbfmMQ0dKpuFq8gMeT1yMsyHwgwY
         tdqPX/WX98KFeIYB2yD0/Xv0MEIbnmMg91w3GBDqNjZF46i4zWILEx7KNPnf1Dclj0Gk
         xEOaYbxOFZ3iGAVFNUm8J3F5j7ojb3MkeROLWlLQGKT1WQwEQxy7AmrmQ/lLRgeeq3gF
         if8Xw9s8jLc973eeyo8DaMt4EoESz0QEQjAehpEH83lhM7+7QcGw/3WqqAVXJu3q2AHU
         DODPKeD/JY9hibVVxYgQv2m0E4plCrfUeCIM+2OPmIIECmpEtCboyjCREsoBhs4n4wjY
         6QUA==
X-Forwarded-Encrypted: i=1; AJvYcCWX4ZhjxIeGlcL649WEA+GmwyjqCkJoiw6OMK/GvPyMd+RPZppWaPxLyjuP5l7VVwnlWpHlGq2y8Z7y520=@vger.kernel.org
X-Gm-Message-State: AOJu0YynwvINfXA/vMdmV7vxyXft2JwtGuPMO+iAsJVTVWWp4SJNXiT+
	W27ZTLTgAUMQx2aHc7CHoV1Bbw1btSVomINMjr3abVqL8gWPVnqtv1gGYvXT+igygKXVT3o2/z4
	Ln/lRpgHFLP1ffouVNe/kj09lkXA=
X-Gm-Gg: ASbGnctHZ3UblEDzSXbMx/YVGkdnUv1Q2FFpJo8IDPWJtH+WKY2a9lH+7Fw3aX/fnGl
	+36gOYa2xE/2XTetrq2ya/CtaQ/88Z4hQC3Atk/EMqwMgfAyditr0q0qRGHPsk+ItP7dlg47itP
	OrOxVEu2N630NfqTjngV/mdUeVQUQ/XkP5
X-Google-Smtp-Source: AGHT+IHWiQabEQvzZn/gJJDNCBQro1R9DpRyeMEUSWGCTEA5LCHCYvP4MVSgJDZSZgfyKi8OV+mqGVl41yhcqWUGx24=
X-Received: by 2002:a2e:bea2:0:b0:300:3307:389d with SMTP id
 38308e7fff4ca-319070257c7mr33511981fa.19.1745780540070; Sun, 27 Apr 2025
 12:02:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250427185908.90450-1-ryncsn@gmail.com>
In-Reply-To: <20250427185908.90450-1-ryncsn@gmail.com>
From: Kairui Song <ryncsn@gmail.com>
Date: Mon, 28 Apr 2025 03:02:03 +0800
X-Gm-Features: ATxdqUE8KRHu9JAAsSR6mshU6QdBJrhqHafCjj6o9Ntpfk2Q2LRBFeME5awI3u8
Message-ID: <CAMgjq7Av8weoyhnk0-u6HZFdJn29bUzkJ60X9=sz5qrWGPNp1A@mail.gmail.com>
Subject: Re: [PATCH 0/6] mm, swap: clean up swap cache mapping helper
To: linux-mm@kvack.org
Cc: Andrew Morton <akpm@linux-foundation.org>, Matthew Wilcox <willy@infradead.org>, 
	David Hildenbrand <david@redhat.com>, Hugh Dickins <hughd@google.com>, Chris Li <chrisl@kernel.org>, 
	Yosry Ahmed <yosryahmed@google.com>, "Huang, Ying" <ying.huang@linux.alibaba.com>, 
	Nhat Pham <nphamcs@gmail.com>, Johannes Weiner <hannes@cmpxchg.org>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 28, 2025 at 3:00=E2=80=AFAM Kairui Song <ryncsn@gmail.com> wrot=
e:
>
> From: Kairui Song <kasong@tencent.com>
>
> This series removes usage of folio_index usage in fs/, and remove swap
> cache checking in folio_contains.
>
> Currently, the swap cache is already no longer directly exposed to fs,
> and swap cache will be more different from page cache. Clean up the
> helpers first to simplify the code and eliminate the helpers used for
> resolving circular header dependency issue between filemap and swap
> headers.
>
> Kairui Song (6):
>   fuse: drop usage of folio_index
>   btrfs: drop usage of folio_index
>   f2fs: drop usage of folio_index
>   filemap: do not use folio_contains for swap cache folios
>   mm: move folio_index to mm/swap.h and remove no longer needed helper
>   mm, swap: remove no longer used swap mapping helper
>
>  fs/btrfs/extent_io.c    |  2 +-
>  fs/f2fs/data.c          |  4 ++--
>  fs/f2fs/inline.c        |  4 ++--
>  fs/f2fs/super.c         |  2 +-
>  fs/fuse/file.c          |  4 ++--
>  include/linux/pagemap.h | 29 ++++-------------------------
>  mm/memfd.c              |  1 +
>  mm/migrate.c            |  1 +
>  mm/swap.h               | 18 ++++++++++++++++++
>  mm/swapfile.c           | 15 ---------------
>  10 files changed, 32 insertions(+), 48 deletions(-)
>
> --
> 2.49.0
>

I just realized I added duplicated Sign-off-by in a few commits, sorry abou=
t it.
