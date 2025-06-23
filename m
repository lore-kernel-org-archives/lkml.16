Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F13C929A300;
	Mon, 23 Jun 2025 16:07:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750694839; cv=none; b=m4lwxgT8fA7qQFfWYXYAmhX9FjqfY9CFe2Ok8KtdVqf8E4NF3fHW24oaA8hOXCK2nG662EZj2tL6uMfhSpajTNLbT4FUUk6GYLP+ak/TvcHyfOnHeZSU94I5Kd7FeMynNTYZLdzNyPa9aI/sKrxbIS4pYnOu+Mx+PX94eXT0r/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750694839; c=relaxed/simple;
	bh=0tcXdovPS+zbja9QJVEVBxGT38A9W3l9YFmoO5UqOAk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sac+ynCOUop2cSaM5Aju2+fGLksCo4htWPfl7QjApdVvtebbNaXWT9pkZAjX5zxk9gIqsaRSApJwgS9HKQssOQHaeYQHM0Vk7n3N8+UAKMfAQ9r1TBXufUUJyLbv2ujKlh2OaPyAl8zQxFDHgOSH8t3/TAYvBVg5dzg7eIT9xMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fa1/GkpO; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fa1/GkpO"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-b31ca219b97so652340a12.2;
        Mon, 23 Jun 2025 09:07:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750694836; x=1751299636; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0tcXdovPS+zbja9QJVEVBxGT38A9W3l9YFmoO5UqOAk=;
        b=fa1/GkpOkoCsFuKgai6tHv127/vIC+s8HfQlNjMyQxpVR7JO9aJTZSSJX9YXZRRGcL
         OQUKb1KE8P+q1/L/uhk3kJil2nBHKH/0aa5HNl7BXtjnc3OG166eQjBFddhb+E6QIUmM
         0GkSVmUV9cQzuxQ8bY1p8Fq+p0Vfz3L4nMflBKHy9D8PLNfzSwKlIZZUmUQHF3OwjMOO
         jdLFc0ss511VC3T0G607+d27hBUdwTHZE0CUyF7dNOjTXvy4q1X1y19JtM+avfoTww7u
         bMxh/Njcs2KyFOB064uABJtG5S2xmlaxb55grDZW+GxmQKfDszcFc4RbDiYenFqBAr3n
         ObBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750694836; x=1751299636;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0tcXdovPS+zbja9QJVEVBxGT38A9W3l9YFmoO5UqOAk=;
        b=SxDUQq/rR6anXJAVcp9q4CcmWYq1jSFEAgPn1p/OnGxxSYbNF/nzbGubOmTisCHSFX
         0doliVQknFTXw9r/AQaPQdiRawNnZtIoIomM/gtc8KvLkfjUfx03GotmAPsZhvFGDSI0
         I3N5fouryfG6NhgTNwXBPlnwIoCCvhg6bsOQLcxmvnMgN1Xfyk8HhPrDf/rxAblcDMqE
         y4Hmrrw2mvVa00SQF9h79KICz4JShjtmnHhjA55wsTioPaMdxR78r7B9goFmRNtP3ajF
         3IYKmR8CteY0CJFwy0I0Y/J/LI54LbUJE1VaqA7KpfK3aTshy4g5bi+5CHLB4I1TYzQy
         ehIA==
X-Forwarded-Encrypted: i=1; AJvYcCXN5Y2ogQGEV4rxAMxLpEcw2TOhdz+eg3hNDJ+xztVi3sw1DdXy4Hy/Z8dpC+4JGxnhixsQGftg7+O7aFA=@vger.kernel.org, AJvYcCXuZKnsQXUmYUFc0Apuww4QYC6x94ewNMe6YK6MqUMPETnn1QykHed8l/wiQc4JiVVVpSxMRUJY4gfrkst1MGA=@vger.kernel.org
X-Gm-Message-State: AOJu0YyzsOVzgTrSMzXcDOgOScWoxF3ZugNBgKHK3Odj0ijDfr7zrIXl
	F402JgzTGbHtSOaynT1qoDGrbCLFpKsvYegqtIjOIqPoQ+Yv/XxTyypuJvN1IDqhd7pXQ59P5Lf
	PTlyrlGwyWw49lfts7muk8N95yr1CcvI=
X-Gm-Gg: ASbGncsKwgKrDID8liUqJu/P9DsH2Y51ysI+sz6j9cmX3gj0qsCJOhOOxqV9mITLVQZ
	PzHupwGtxeDbLBkHU93vMrHTSNm7e4bvGMY91kJFaR1Y6cpKN5GtlLpSO6ZNBIOHtpdjOBiow/Z
	bTGgEXOWya6XEj6D3h5csiSWPqAcqB65F/ke9lUgGBwfU=
X-Google-Smtp-Source: AGHT+IH9NL2lR9Uv4yi5aC7j9ur7IZFnZE3iQLVNBw894nkCrk2aK30n5d+w8auc9bWtvBbdzHz7hXqgkVpLEIog/tI=
X-Received: by 2002:a17:90b:5305:b0:312:e987:11b0 with SMTP id
 98e67ed59e1d1-3159d8d99d5mr7675733a91.6.1750694836185; Mon, 23 Jun 2025
 09:07:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250619-nova-frts-v6-0-ecf41ef99252@nvidia.com> <20250619-nova-frts-v6-4-ecf41ef99252@nvidia.com>
In-Reply-To: <20250619-nova-frts-v6-4-ecf41ef99252@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 23 Jun 2025 18:07:04 +0200
X-Gm-Features: Ac12FXxeFboeOQbrXj_NuX7sHbNjZwJOguO3r6RADbc_AKUo0NVkevTFuXJ8N_8
Message-ID: <CANiq72moyFrMi--y9ZdZK0EAoG26bTVsAo2O8ETxYHv4v_C6SQ@mail.gmail.com>
Subject: Re: [PATCH v6 04/24] rust: make ETIMEDOUT error available
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Benno Lossin <lossin@kernel.org>, John Hubbard <jhubbard@nvidia.com>, Ben Skeggs <bskeggs@nvidia.com>, 
	Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
	Alistair Popple <apopple@nvidia.com>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, nouveau@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 19, 2025 at 3:24=E2=80=AFPM Alexandre Courbot <acourbot@nvidia.=
com> wrote:
>
> We will use this error in the nova-core driver.
>
> Reviewed-by: Benno Lossin <lossin@kernel.org>
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>

Acked-by: Miguel Ojeda <ojeda@kernel.org>

Cheers,
Miguel
