Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B74C2F3B
	for <linux-kernel@vger.kernel.org>; Sun,  2 Feb 2025 06:57:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738479454; cv=none; b=UyRXJj4doK28wLj3cmLbwQ9agn+KETmrOm1rxvV/xCTqT0+h/iHdFuC89+QDExC1iD7eq1HReDdS4RVi3sDMLKE6X+iNjgnbYb0AwCefY9c5Gce8P7FRoqkGuvS9vV29jqUq2XUifHJVcxTjrU5NnAWepJhjZ+14W1JZmGlyUB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738479454; c=relaxed/simple;
	bh=NMUryZlKV+sivgMvzBFyLm+7Fa+86bzVAKLU1fXh5EA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=u3XwW//sEolE9pVQtV5sAx9XD1T68Z7xD11CyE5SwcmatYI3/Xgj1myCcP87rqrMfaYiBCqJgmx4j0cOvOBVSFLuPsI18y8Re6O6nIQF101eb3Yxszr20NcCZinpr3hxgLOr03q5a3dKj6SmB9HDaxgwijWMUmVN+49iGQaZGGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bCo/XkRm; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bCo/XkRm"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-53ff1f7caaeso3287755e87.0
        for <linux-kernel@vger.kernel.org>; Sat, 01 Feb 2025 22:57:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738479450; x=1739084250; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dcx3HkHaMhQAvBIUjx/kTteQW2Ra5NrKuwExWKNe1Bo=;
        b=bCo/XkRm5CCxFMzY4mM5GxcIeiNsFZjlJR7hWjiTqD9cfF9t6ctAWDUWN5dVyM6wGw
         FDuQRgchJqY8JlrNYXdYol69ACL7C2/lx65ekmEwpb9yICkRrwavlOdtnXtjEtXV4+Fb
         m+85hsjzZv1ewAHa84VnZm2cDMR+Katx/3Y/5EDNp5OrokWjVG+k4rqPHn0Q5R6fvZNt
         he1A/0VXSu2rA139W4oOAVxwNzN8lIvs9v1hy51MTc/ZOhBctnR7NhTH9Fah0PZwwkqt
         wzKlQQp0/PUXYd2Tq0CJAe+xa+pqmW0wrJTZv0xlQqunOvw2sWX/cPvz0h7ztoS9FNrq
         82/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738479450; x=1739084250;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dcx3HkHaMhQAvBIUjx/kTteQW2Ra5NrKuwExWKNe1Bo=;
        b=D5e80uSgiT1cz94dDKc/78aBcI4li/50ClzZN+2RAOleJxsJ28x/aCtPLm07xlEyt7
         yB65mrSqncm5nwG+E5FdHZcmC6zg1IMY5tJXqtTyPFGvtBkxSE5xbNY2hmLyaOTws1jl
         gL994OxdHAJAv3HMblyjutJSKNAQEqIDqnGN7mNN/JbTBTZ4BvlSwn5Nk/Sy7G/dLY7s
         rWOWtOp9wawdrCpqxZi5NLNdYuKV15lp81X4/J0U2bv63d0nfh3PA1G/Wimu18OenNUu
         z4MZqCPYz3O9EEhRmzSQDabe83+Z2WADa3pny3V/b1/JU0ZiZ1hkJr7C6jc+qD1jlBLS
         hBDw==
X-Forwarded-Encrypted: i=1; AJvYcCUxDx7tuXy46nCYASOB3ieAn64qHaTH2M7vLCkMyaZw5ocqPAfOLGP62WSS3ttQ9U+ax7BoztzYE7zcLqA=@vger.kernel.org
X-Gm-Message-State: AOJu0YyEl19nDby4mUUZ11klfm3dtfnQrGgJsNQqEYzG34geRtv3K1E9
	PRzBXWeu4LPzZ3aaaj/bMK/ZAQkjHEhhxaG1nFGUTIIudbk8qxGRrtHGm1E3gRGmzIYRF9elIiE
	yhkXcdiv6/e0tLbvA7Olp634GKfQ=
X-Gm-Gg: ASbGncuYp2ggjBrw0cbYzqDvXn66z4XGI9YTDn9BX6QvUJY7mT+oG3ttkXvfmW8I+Uy
	FssiDzx30mfOm2zS/skSmMhxi5FlX1CUy5DBY0TOJ/+rLLhrfITeyv5ODBtr7PgUf466aAgc7
X-Google-Smtp-Source: AGHT+IFI8wwWq5sXQKpfJSo6e7wuVv3KG1aA6VhOpOBRhi8gTIgLBtaFhhMylHPD8UCMp/xcdoV9OYrNUO9pk5fQYW8=
X-Received: by 2002:a05:6512:4026:b0:540:1f7d:8b9c with SMTP id
 2adb3069b0e04-543e4c3fd10mr6103544e87.45.1738479450078; Sat, 01 Feb 2025
 22:57:30 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250124164858.756425-1-kevin.brodsky@arm.com>
In-Reply-To: <20250124164858.756425-1-kevin.brodsky@arm.com>
From: Hyeonggon Yoo <42.hyeyoo@gmail.com>
Date: Sun, 2 Feb 2025 15:57:18 +0900
X-Gm-Features: AWEUYZn6OxSb75sYDq_0UftKbKne0UTyN6oHw9v44W4Q1A8hVvd3EAUTqglsJXg
Message-ID: <CAB=+i9QJsQEzSTf=LxY_Kuqm++2MZDXLL1eshngDZ5dAg5UzUQ@mail.gmail.com>
Subject: Re: [PATCH v2] mm/slab: simplify SLAB_* flag handling
To: Kevin Brodsky <kevin.brodsky@arm.com>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	Christoph Lameter <cl@linux.com>, Pekka Enberg <penberg@kernel.org>, David Rientjes <rientjes@google.com>, 
	Joonsoo Kim <iamjoonsoo.kim@lge.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Vlastimil Babka <vbabka@suse.cz>, Roman Gushchin <roman.gushchin@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jan 25, 2025 at 1:49=E2=80=AFAM Kevin Brodsky <kevin.brodsky@arm.co=
m> wrote:
>
> SLUB is the only remaining allocator. We can therefore get rid of
> the logic for allocator-specific flags:
>
> * Merge SLAB_CACHE_FLAGS into SLAB_CORE_FLAGS.
>
> * Remove CACHE_CREATE_MASK and instead mask out SLAB_DEBUG_FLAGS if
>   !CONFIG_SLUB_DEBUG. SLAB_DEBUG_FLAGS is now defined
>   unconditionally (no impact on existing code, which ignores it if
>   !CONFIG_SLUB_DEBUG).
>
> * Define SLAB_FLAGS_PERMITTED in terms of SLAB_CORE_FLAGS and
>   SLAB_DEBUG_FLAGS (no functional change).
>
> While at it also remove misleading comments that suggest that
> multiple allocators are available.
>
> Signed-off-by: Kevin Brodsky <kevin.brodsky@arm.com>

Hi Kevin,
This patch in general looks fine to me.

However, there are subtle changes that were not documented by the changelog=
.
SLUB currently does not _completely_ ignore debug flags even when
CONFIG_SLUB_DEBUG=3Dn. For example, calculate_sizes() relocate the free poi=
nter
regardless of CONFIG_SLUB_DEBUG.

I believe completely ignoring debug flags should be acceptable
when CONFIG_SLUB_DEBUG=3Dn, but this change should at least be documented
in the changelog.

Additionally, beyond what this patch currently does, we can remove several
CONFIG_SLUB_DEBUG #ifdefs in some functions (e.g., in calculate_sizes())
on top of this patch.

How does that sound to you?

Best,
Hyeonggon
