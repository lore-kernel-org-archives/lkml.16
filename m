Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16E6A1FF5F9;
	Tue, 10 Jun 2025 09:43:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749548602; cv=none; b=NDEY3RDcVeW4a/o12BqNScvXh6a8edKAn4UyGSdpRtvjrG1m+y9dX76IBIYKnekZNvqHBFrMiQOMMzjIz94C2G/AYPr3y7fuTd9TD1xjw4bA9H5pXZJFJRYskfUFMLBZt3Sy3xZbC6zrbemBRx1Y3JvRNbfGRi2DfZYVc+vKEgU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749548602; c=relaxed/simple;
	bh=q8DPayD2lvtgLiBeC6Hc0iKcrlH6S10VoZwf7CzolPA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BAQLMSHlfOtomV80Y6VCVLrX9aDtSgtTFEDW5bhdHnO6ABCktZqMmQ+JgKeZ2SCqfLWsRPTfouGEANAqxZhPhWr9uFhkEx+tNWNag/LptPLMjKGvc2bI3DBgkRILDqYeJbML3JIs474lUfVKy9E5XFS8ZGd7QgOZ56qYaLjLb+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X/OmDuZL; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X/OmDuZL"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-313756c602fso482136a91.3;
        Tue, 10 Jun 2025 02:43:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749548599; x=1750153399; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q8DPayD2lvtgLiBeC6Hc0iKcrlH6S10VoZwf7CzolPA=;
        b=X/OmDuZLm0CvT3GlmIgitobMeyjsf9pAcQ9FmgV7zF2Wk8zGycaGbU9KpHv526IAHi
         2rEN1I5D/zEq8UpKrO5Q5lnEYNWltkILblYO8NdzDBw8P+qfrPl4aPM2MPyqTC8K+Zr7
         6fGM9PmQkmGDuKlsVmP9m7nmip3GtcGx0VgsjPHlsZDsT+qa5qQ/JllCk49i0fmxY68i
         aqWpFZS9vyuJlBkTRDVFUbXiiW/EFGDT3Cp5AK5A9G7Pb3wNIvbvStO5zbQSQOjnVEtc
         umTKl04nwAXHvMsoYSx0rL6daBHk+i54kIBJvVfORvV7e/WKMdgQUB8DSyONwRjmOTco
         xScQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749548599; x=1750153399;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q8DPayD2lvtgLiBeC6Hc0iKcrlH6S10VoZwf7CzolPA=;
        b=lev9Gj5sLLHzNbr/WlI056VpErsZ/iSE5SK7cO0eSwtWbxnZIYmor5yofqaOeEJ+rq
         kbYWjNP3RoffdjrNJhQS8erd3HojTQrMldCio/HVvzQeYGq2puBh7v7BCcBu063Uhr7Z
         AY+xtasaHjrUnDbo0YWL3xCox7KygUyaYZ1by/nQayFECao/sisbkfEOm3mldHGbF/8n
         r792xjpSbRWDHVPBftfM5opULUlLOHwoRGnqONuuN0lxDr0lLg4SpR4Ug28Ulm1IUWzb
         HdodL+SFZp9HOQn1BAyf7fGGaMvG75AOBVEXuvoZWvQv8XA/tEB9AjQp5LnKSIJbPKY5
         5/wQ==
X-Forwarded-Encrypted: i=1; AJvYcCUADWx57pUM3sX0XBLEkyU57g2H0Vx4FlQ2ME68Q3kHTCZxlaYEWKgefkdL8c2tZxC6HhLQGNxb78SHIsYzcdg=@vger.kernel.org, AJvYcCVshzakHhTZsj2zox8ODp+e36dxWxe178uayeht+l8R4ZKrK4k3PJCFTlBgtHlCS/QDaqyw9SKpisyBpZc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzCqyVcdxsSzzZJAwBSdWKKOFGy3vBsS3Z6F+NjdiPBvpbLWK76
	z8GZeurytK3LpeT6WOLkzkpke85w1ra1U/2DMagoH+tj8PjAIYqOnVyoVoHYdZA774detWK58La
	K9Kdk/qPCx+/KpQfvvvnnrvIzj3AFEnc=
X-Gm-Gg: ASbGncvOEb8S4lEe/0/fEqwyqRiTRNCwXpotWa0ORZMn5wQ7LZyvGE0bECgDg2uaSTi
	9y7dK9t0jvuhGHo1P5d/ox0ZN2uwHU7MB2SBi+SX9eLXrgiQyttuyLW6jeV3wtNNyV+kHgflbIl
	sdjl1zuIUbYEnsmXN04k4iN8fJNQmjYpulvvTDjogbEbWbgkYnJo/PBg==
X-Google-Smtp-Source: AGHT+IHtwSpnIky6YUDKcRK/zDGLXCExE9ImXQ3ic2AWs5W1UELFP1znNDeqwAJ8ihsm4xL1+zu+MRqPeIR6jwzmWKo=
X-Received: by 2002:a17:90b:3a82:b0:311:b0d3:851 with SMTP id
 98e67ed59e1d1-3134e3e72eemr7524086a91.4.1749548599158; Tue, 10 Jun 2025
 02:43:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1749463570.git.viresh.kumar@linaro.org> <f10910c7585f5556869ea6f34b64d4136b8d5581.1749463570.git.viresh.kumar@linaro.org>
 <CANiq72=WpuGELzLbH-fxdOeJy9fiDFwatz6ynERDh=HP2z2MBw@mail.gmail.com> <20250610060711.zp6lua4kcwi2z777@vireshk-i7>
In-Reply-To: <20250610060711.zp6lua4kcwi2z777@vireshk-i7>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 10 Jun 2025 11:43:06 +0200
X-Gm-Features: AX0GCFsXs62gU6ti9YBQRF7p1UaFVfDU9iPib5UH6y4VFkNaY3Vlp_Tk0poYmOo
Message-ID: <CANiq72kD9iQh6TPo3Rwk7AmPXEarogUrM2fmhkDn5XNfKrr_jw@mail.gmail.com>
Subject: Re: [PATCH V2 1/2] rust: cpu: Introduce CpuId abstraction
To: Viresh Kumar <viresh.kumar@linaro.org>, Danilo Krummrich <dakr@kernel.org>, 
	FUJITA Tomonori <fujita.tomonori@gmail.com>
Cc: Boqun Feng <boqun.feng@gmail.com>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Peter Zijlstra <peterz@infradead.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Vincent Guittot <vincent.guittot@linaro.org>, Yury Norov <yury.norov@gmail.com>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 10, 2025 at 8:07=E2=80=AFAM Viresh Kumar <viresh.kumar@linaro.o=
rg> wrote:
>
> What do you suggest ?

I think you are right, we should keep both directions of conversion.

(By the way, as far as I understand there is no way we could wrap
going to `i32`, but it may not hurt to add a `debug_assert!` in the
`u32` constructors.)

> Sorry, not sure I understood that. Are you talking about type of the
> `cpu` argument ?

Yeah.

Thanks!

Cheers,
Miguel
