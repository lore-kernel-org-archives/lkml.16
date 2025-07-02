Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 326E82309B0;
	Wed,  2 Jul 2025 07:45:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751442304; cv=none; b=eh17+VCvCcMLdzfUGaL5DeRO60ApMq8vQEqjE/jmTh3fVTR2OyBfrB8OjZBr53KclkMn9bkFaK74HdojYnlSDwGNz7Esqsrq3XwgR6W42XOCNUQFWdeUpysWX/xzfzWfddEpiFaYmQF6MG+cjI3i/6KJo3keIx6td1FSylS29cY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751442304; c=relaxed/simple;
	bh=pre4vDjtyp7Wl/CybJAIGJMG+1MDhzdhQIns4h3G9bs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EjThfuQjgs0/ot7rGdxDWlXtg4Di1uVOEbOs5DZbfHrDRgUw4hKCgN/GNyYEYzGk9ZNyEzGwW23qHhvFoBee0ARdZUO6TbQBJIg0vANKxFIXHjZ9sixRIWMOt0bzlss8eBdrq38ZBbjo7NJj5I/+0pYDBqzB7nyVr99/A6wDzLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U+Vp1UEq; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U+Vp1UEq"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2355360ea88so8713555ad.2;
        Wed, 02 Jul 2025 00:45:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751442302; x=1752047102; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rf4aXWUpjl6NdJSpomTP+fBehBlw99KYZBik9rzoGeo=;
        b=U+Vp1UEq9Ppv8rtOsqazdQuSaoULscIfBkeE64KsyyAOJUD/9jNCv4lYgPLuuqvXQO
         C+n8wW2AQQaT+aoNyANpzrmlU50J0HS/eKa5iHx/O4g1DVkC9bCwAg5JLuWR1Bv4mFh1
         QlvMmc9+/jCWj1yJ40cVgmE5qF4J9xAgifNBJgtUr83eie03xzPszoVmlK2dQLAb1u0r
         oLuZKKg6lpgWrYkhKlq7IoAZKleVoicfRGWTsTbq4qgqZnoC9KI88pogrA0SsiNcyV+z
         bFyV4a3HhGHN0dOXn+wVKkXTBQeXdaFIZ4G0APkWE9jhN2yZdXQJvyP901hzxhzAK5wa
         FvCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751442302; x=1752047102;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rf4aXWUpjl6NdJSpomTP+fBehBlw99KYZBik9rzoGeo=;
        b=S60veEXbmoYHZut2Kh+EKBFNZjbbtKQ85yymDp3D/ttpKLwLE3Rd5WDIHVBVpgTNGJ
         BMyx1PAXOSqCIFAnIL7bRoKTQ8gnRZ3p3lEWNC3cARpnLQ2WD2t37YkXCtBVuttzvOQh
         FKTTQh6WPxoCvzcM0WrM5nlpFbO3O/wEdoFN3gnWc5UmgGE51LIm/+9lXPltDLm5vY0v
         4P+O7L6lCg7ZqGqbQQo4pN0F6JK4Sc2HhO38Pnqxr3YDhgcwUQUPSdA4ChaMdvM5t8rk
         gNmpMSx8/+QJf8VrW8AVV/77Kq4/IHhNtXHdNdzWmdgzv+8+DfKp65QhgDSlcidfykTe
         KAnQ==
X-Forwarded-Encrypted: i=1; AJvYcCU/oyUscyrUBElI7Cf3bPioUwVeH7enEPKnPSUsAZ+iCnK/E7tONODwgSiUY8I7EsdcvXM07bP0+VkoHn8=@vger.kernel.org, AJvYcCXjIDiSPXRkgZirQ+DMl+ZdFF9sTfF4GQLAM+TwO3HbLW+Dtdr6BTYAHivZh1k0ddmd+QmZSJOS5rQy99Vsw3A=@vger.kernel.org
X-Gm-Message-State: AOJu0YyEJtcvMFrW00ISHvqxYeKS7x6nFVlvri1VtlNHRh8IXAWvgPwt
	X2XsQELHVBD2l6CvZdHSx2UTw5/W0yX5jOen2du0n0219a1ZRHGQb+7IybfqF1kUCGC7QOcoZYK
	fD/u3ABZdUoHWwRSgJPzcAU4l3xOTkzmI8bwYayGTZQ==
X-Gm-Gg: ASbGncu22o8fI7A+2y3UdgLcSfCV9+ysaFrMKwTiV+E1J9GkAOkWTScQzUESfTnlViL
	DA2Yqz+OY6umvj23M1C/SHja/k+1GQf2eTJRmvoraDhVCc/H65YkOLgfHkLW85I6aP2phBHCZjx
	yPHB+iJlc9adhKoSdiprYnRsev0o3rh+fFlA7cKbf+kro=
X-Google-Smtp-Source: AGHT+IENrXAwSSqPcBNdxcOkrjNtYy0CFllmWa+91OhtdmHsoRwKRsK7YXdSbGdM7D+vibb+wQySOuakjG1+iHnUmnY=
X-Received: by 2002:a17:902:c40f:b0:236:71f1:d347 with SMTP id
 d9443c01a7336-23c6e4f3d7emr9722695ad.10.1751442302440; Wed, 02 Jul 2025
 00:45:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250701-topics-tyr-platform_iomem-v11-0-6cd5d5061151@collabora.com>
 <20250701-topics-tyr-platform_iomem-v11-1-6cd5d5061151@collabora.com>
In-Reply-To: <20250701-topics-tyr-platform_iomem-v11-1-6cd5d5061151@collabora.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 2 Jul 2025 09:44:49 +0200
X-Gm-Features: Ac12FXxP4qnWpWLcaGljrca2qE1GskXhDNLdfN0123yWpoj-KbgX2CNUmx_w8o0
Message-ID: <CANiq72khZQMQcyp7uVjMz--U1dbbnx7K3pU1Eu=ZN6SXi98TZw@mail.gmail.com>
Subject: Re: [PATCH v11 1/4] rust: io: add resource abstraction
To: Daniel Almeida <daniel.almeida@collabora.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Bjorn Helgaas <bhelgaas@google.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, 
	Ying Huang <huang.ying.caritas@gmail.com>, Benno Lossin <lossin@kernel.org>, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	Fiona Behrens <me@kloenk.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Daniel,

A couple nits Danilo can take care of them on apply.

On Tue, Jul 1, 2025 at 4:35=E2=80=AFPM Daniel Almeida
<daniel.almeida@collabora.com> wrote:
>
> +//! Abstractions for system resources.

Potential link:

    https://docs.kernel.org/core-api/kernel-api.html#resources-management

I think there are a couple kernel-doc includes missing in the `.rst`
for this, so it is not great.

> +/// This is a type alias to `u64` depending on the config option

"to `u32` or `u64`"? (also below)

> +    /// The caller must ensure that for the duration of 'a, the pointer =
will

`'a` (same below).

> +        // SAFETY: Safe as per the invariant of `Resource`

"Safe", periods at the end. (few instances)

The last patch on the series has nice examples, thanks! It could be
nice to have some here too (e.g. on how `Flags` and its operators) and
nowadays also KUnit tests, but that can be a good first issue for
later.

Cheers,
Miguel
