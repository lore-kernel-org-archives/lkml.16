Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB28D1AF0BB;
	Wed, 25 Jun 2025 12:47:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750855671; cv=none; b=EQJrJ0qRD0BkEMaUJA+B5ukqCz03t2deJ48f7fl/x7v9wXxDxYq4DXMG4fXLMUH89e57sX3tR88+1FZo7po0eAy5TtPyxA3rBEHUSYmHH1ekx0dy/PF/VdZGgPRwX+eNTjpeGvo7RODJL0Yes7+lAdb93LWAJba3+GhINQMoqJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750855671; c=relaxed/simple;
	bh=BU3167g77+eBh3FQcZRn67ZUlMzren6rPxnJ6rrLr6s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=REI3Q9K8jpb9/rZruWP9caCOX8a2LFjd62y7yD4nb5Vo444IW4ZB+g5RQg71eJjxiGKx9YVzCQ2hMw0ayp8ZnbyEj/xn8IToss7kTwT3/UzJanKiAB3ui5A4qHZepbK6xiGdm6K4UBzClDIcuW8a1VkMKWiyhEt9kNBU54l0Au0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gshbbXz5; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gshbbXz5"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-31306794b30so828382a91.2;
        Wed, 25 Jun 2025 05:47:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750855669; x=1751460469; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xRdtBmMzlAb9QIbZaGxD9UlH4C68HhmhN0SNfJyz9VA=;
        b=gshbbXz5/SsZ7hQ26jZvnlLorw82vS9epkibt48qKQ+I3QRnqDYp4oAFU6eKP1wYG4
         Pj9ebSQHVeCcnlQzOdTDUk/I9oCxkQzBa2LVDhbAPJ8zoDL+B0oIERtc4K5J4QSCXNSP
         tYfeKbVWuC+iRvqCe1LhtNg0ymG0evi4Y/1ZED3iI8Tc9pul3latsoTKJD8ZDT1/1pQB
         +teY42Upi/JSNFxbD1DZD5LMADrRhnTrIYbNYli1T5Q9Y314YQYzaSf4mJn4MOZ9FJ1o
         NfuGJHY3etuNnivspCvUDHPL4Gl0qEiiMs7mdVpWbq5suvb3lPiuYeEqh6b7qOTtw7yQ
         9YBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750855669; x=1751460469;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xRdtBmMzlAb9QIbZaGxD9UlH4C68HhmhN0SNfJyz9VA=;
        b=cFp46Lb+azDWNMfMSxjoOXG/4i6RQSJAiJHBxN4XmXzDvpbQAXSl1BFOrPxdNrYge9
         9SP9KqCbLtKNNL+vmS68n+ZPpeAuemRpJwLQc8kz1SvRjDaboprsh14nPq5PZmKW5rm0
         vVZWHQOrH5ynqTBdrQ8SGYMvR3FjFh3qtrn9NbSLrov/ovcSJ4F1ps2xjvTMDH3eEzKT
         yls4Iu8l95MVoeC4tFsLstEQKlacyaRGzGzH6KSm693r+myK3k23pd/kQO7L5+3/t4vM
         85HC/TKobaCwq1ZeoOB5DfdtljLtFfUE8jYEVr/NlOcyvC9uBDXx7arJ3Ncnp+xawH5l
         kDmQ==
X-Forwarded-Encrypted: i=1; AJvYcCUa/bjYF/7GmUmESIwvE0J5eZCAg6SH9OSiVa6qsobUq5cHp7KWfpFmXwV/0Csq5pxtJe7BVUUHhEn2peM=@vger.kernel.org, AJvYcCVrUG1Tm24Btu71/h4AfadRnSj4TrWF1C0A/Hvcgj/QzcNyYwLkwDceKzo1G+USS7Ztkj+tjnDt46iSfn7YbQM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzJNARyqt4rSTkOLcWDvRce9XTdasy/B/QYo75VkcFrqYt40wq2
	+0YGgvNQH+wT8793XLbPL9N3erGaF91TnwYh2JBoAC/HC6wx0C8lLytfNEN7VyI5ztgMCJCQarA
	tewwwbGDqqN48e4SgfYeibEKHA8ClSHo=
X-Gm-Gg: ASbGncthO7D+cDzBJx/ADsJWKqnEqXBvIaLWwijwk1V8vVCgXtBRMRxVeDINYwIGa4I
	TXSiRguY0V1lKdR2F0+5Z1tV1N555hU92q3dsbNTL+8cmRTZs6ZLQho388d/6rMLhFe0/4joUMv
	6IUsnO5y65Tuhan27OzZfmZjcewBOhgCIUqV6FY6glAFo=
X-Google-Smtp-Source: AGHT+IHnvlarZCuv/RCxHiq29Qi7ylrCmEZXswOwHX+FJluU1B6A+ro+JsxQXvsVUnAYNWJueug97Vcpgz4xDNQHbpo=
X-Received: by 2002:a17:90b:51c6:b0:30a:80bc:ad4 with SMTP id
 98e67ed59e1d1-315f25545b6mr1686463a91.0.1750855668951; Wed, 25 Jun 2025
 05:47:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250623-topics-tyr-drm_mm-v1-1-82fe8104a6f5@collabora.com>
In-Reply-To: <20250623-topics-tyr-drm_mm-v1-1-82fe8104a6f5@collabora.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 25 Jun 2025 14:47:36 +0200
X-Gm-Features: Ac12FXyWwIT-f0p09GbrWuQHLM0OEITTFnrLijUbU8qrHeVE1B6UgsCWrUJVsP0
Message-ID: <CANiq72k07PuSodVgb+LDNw1jZVWhKt1BuYSULfBY8DBH1EJbBA@mail.gmail.com>
Subject: Re: [PATCH] rust: drm: mm: Add DRM MM Range Allocator abstraction
To: Daniel Almeida <daniel.almeida@collabora.com>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, linux-kernel@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org, 
	Asahi Lina <lina+kernel@asahilina.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 24, 2025 at 12:13=E2=80=AFAM Daniel Almeida
<daniel.almeida@collabora.com> wrote:
>
> Signed-off-by: Asahi Lina <lina@asahilina.net>

Patches from others also need to be signed off by you as carrier.

> Changes from v0:

I assume you mean the RFC patch from more than 2 years ago, i.e.

    https://lore.kernel.org/rust-for-linux/20230307-rust-drm-v1-7-917ff5bc8=
0a8@asahilina.net/

Right?

(In general, it is very useful to have a link to the previous version
in the changelog, especially when it is a very long time ago, when
titles change, when it is non-obvious in general, etc.).

Thanks!

Cheers,
Miguel
