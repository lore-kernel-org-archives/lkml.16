Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 868911FDA92;
	Sun, 15 Jun 2025 09:37:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749980255; cv=none; b=uVkNEB1WhBtI+w1ZYWNTDzeFoVLmXjkQv8jv3KEdU7QUvDzWr6kR8GyGQMNkD67PNzuXpo+x2H2mAeiu3toVOhWrCgDScfeRnVhLBi6HWZeSTW2IcBY5VQjt2FQHhKUS5UBtQqSI5RkDjlbj+0xWAsWJSlRRyBEW2T5uu0Fgi1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749980255; c=relaxed/simple;
	bh=CTWzHn/PGIzCFEtFlkOvvF0afWt97hgrTyK/bTQwo48=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Qnm16WHGxWVg9d8j//e4QRQlob0zrgnmqSlCMULLhnYuoKydG7ZaDvCeKZ3TklJQReZYixCTERpHCH64Ub8cwNOggkUs4l3rl5Kc09I++imFFUYj/+0EGqbHTgq8I5VrlRk93rbOVfE3Y64Xbfi8h48KPcysGdExujJd/QLAmjo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nsHSGm1P; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nsHSGm1P"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-312efc384fcso606064a91.3;
        Sun, 15 Jun 2025 02:37:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749980254; x=1750585054; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/gjcFnYr1zulmPLSgYp/FlvofVHo2jy2BSHVlmNjNfE=;
        b=nsHSGm1PYt9TSKbVaOmNSzzM2e3pRU/AFRzNxb2OHwU7bbtQqFFwW2CibGQtn/5k7p
         H4VC5c/3KiqP10f+dSroeVSWCHCWL7P078GAIuQ7TLa/ne1fAZ4l4COW6g44/hFOviIf
         7GlXosf//eBtBFfxjJatHQ14AmJ9gFNIx2l1e5ona7ZSjAUd+kWAKu8t7NK9xeKb8KUJ
         PX9Ec7Vs42dgRFRoz+MthHCVPfkpXGzOhZDM1o/UdWEvEDkKawhV2yf27PUhlfp1/bzV
         V/pLqTkaYEMmYNCcRvwN42fjMOMZOFO3+D0ZmQBoqHiS1Jw2DCq0y/K7Y/Fw1qjckbl9
         NtNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749980254; x=1750585054;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/gjcFnYr1zulmPLSgYp/FlvofVHo2jy2BSHVlmNjNfE=;
        b=TufGH82hz/eoCzQgiaq0QoIa46S77OX8/+oLwir1mDTkOiF14bfDV1CuEXHUxZCsmM
         v2+mZW8+U4Yym8D+gv6Xd7idORNJsLKnS6WLJu5JiNVHcQHrprduWt7cDUNXSPy306va
         qbI5Bbg1jb57+8tmDAF6Me/ItV4A30pyVcbslZkELMhlWU5B29OmGRXGGSqdeNbO7POf
         vi9psirbDfFPiVC253Zyvy83NPsHYYwt7tzZSwlWMjB1ORn23jXNYY3OHGKZcazZV32M
         eQT4DWdz/LoZkF/RlF2/UWigeO2jAWEdpvbrwH0JMBu6f3Q//van5ly7F/t7iUS+QKQh
         rekg==
X-Forwarded-Encrypted: i=1; AJvYcCUz8qmb91Uo15LAp9Fp7Q0DAx7WVOQHOtF0I8I3VUJfF7oFCnBJHJBi1rHxNLN+4/10KZBERFhQaX2cZxU4uHg=@vger.kernel.org, AJvYcCX4PSCk8c1T6nCKztuQiAmQ5okjr8ncfFo9kQR7MGj4cp0eQOVKEEIw0pOo6ghhuYSHPnNVm0KDfCwNJ0U=@vger.kernel.org
X-Gm-Message-State: AOJu0YxT6NGPNbCjF2eoBA5DG57zejSsegx0n0uAAbfrTEJaJY1YYcYU
	pQKdX78rdiIUO1rfoyPKTOVGFWf5xm2k3zaOZKZ5e8TrbNXBEJzmmLt59tsufCK1W3jO9leOjW5
	9eajojek0pC+6ahy3Tl0aBCYNc50wZ8w=
X-Gm-Gg: ASbGncuNKDfFhVEQGjt0bZBMMLoqTvBb8ipow3nuTT58fNZ7uwiLkE8kG3DQA83GY4p
	aDzqCw0DwVYA/YPWTjvZPex1uEKnFWYBhG/+eGTZrlQhwId+TIAPCQPAhbOOAxseXZARjnQKJyL
	iw765wcee0qDEze8EFleAnHmFg+zjKsJqeM5t5NQsjTK/Ac1Oyrh9CYA==
X-Google-Smtp-Source: AGHT+IGbIX4ZqW4W6JqEhTUKL7JgH4ax75TOpKeUB9Si29+wvmi0/pBeO4Qe4njiFfgTj8c0Ruhx6A+eKMp32rUHjw8=
X-Received: by 2002:a17:90b:17c8:b0:30a:80bc:ad4 with SMTP id
 98e67ed59e1d1-313f18d8384mr2404966a91.0.1749980253763; Sun, 15 Jun 2025
 02:37:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250612-nova-frts-v5-0-14ba7eaf166b@nvidia.com> <20250612-nova-frts-v5-5-14ba7eaf166b@nvidia.com>
In-Reply-To: <20250612-nova-frts-v5-5-14ba7eaf166b@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 15 Jun 2025 11:37:21 +0200
X-Gm-Features: AX0GCFsoXlgaGr3xG5wD7wf0x5De99vBBegtuz6QksxqbmtS7108VOxDnXnDgxI
Message-ID: <CANiq72=3nDR=J2OXu9nWwZW_kcWfZ4KhZ3aS12_dcB=1EP2icQ@mail.gmail.com>
Subject: Re: [PATCH v5 05/23] rust: num: add the `fls` operation
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

On Thu, Jun 12, 2025 at 4:02=E2=80=AFPM Alexandre Courbot <acourbot@nvidia.=
com> wrote:
>
> +            /// ```
> +            /// use kernel::num::fls_u32;
> +            ///
> +            /// assert_eq!(fls_u32(0x0), 0);
> +            /// assert_eq!(fls_u32(0x1), 1);
> +            /// assert_eq!(fls_u32(0x10), 5);
> +            /// assert_eq!(fls_u32(0xffff), 16);
> +            /// assert_eq!(fls_u32(0x8000_0000), 32);
> +            /// ```

For a future patch series: this could provide examples per type
(passing them in the `impl_fls!` call).

I can create a good first issue if this lands and it is not somewhere alrea=
dy.

Cheers,
Miguel
