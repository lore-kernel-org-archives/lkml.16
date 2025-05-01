Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2749C20F091;
	Thu,  1 May 2025 09:22:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746091362; cv=none; b=qyx1+oXYCJDlV7bQsDzg47qLrRjTnp1vvcQI+E4p4qfSopwW6KWwetZsF5J28GT4he2BD8FWQwCTwTZArdGzOS/kLQP+rUoEuVlXdkaupD561h/POffTLa7adMEdkiRYy1xvRaY40X0xSEC4HmnQoIdqSOThZs0GfT4/cmYdUfU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746091362; c=relaxed/simple;
	bh=TPCz1U2y2kQUOod1TL37PUZG7miFnhkeZx9C+vxHSiU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LTQMg959qfuEBND9VOIyD64/1xfcb68fQPAh0oY+SmWynLw7BRTyg/Nc87Gq4A1k9zl+JLUS0fIIPENadMwhJc1p4geXXLAPSd4bT9AfdmTAQNpvd2tYPt3U9AFvxOLmES3yHvkss0zlFzR09wkeGH4KSJTVaNXFWju94qOUSUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aZFOVAcy; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aZFOVAcy"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-2ff62f9b6e4so108383a91.0;
        Thu, 01 May 2025 02:22:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746091360; x=1746696160; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jBlkClAHFTnqI0HbjC5YVeOxMOu1AU47lWCaGBtkdKg=;
        b=aZFOVAcysQzd95WPbLFDFunq9yMfHrA/DfqtZEvZhJlpO7kla/3+jS09W4c2DCpDfi
         ntdLZ81hOqBpFr/T/g3RpTW6W9pq9lgj6ymGFlmPJylxPJieUyCcEyUFSCX4vBkCU8lY
         Jql2GPxsGu7K+EyaR22X/Eu2xeD9Hnkp5UMJcYxPxbdXPwlOjtSFaZRrTGNXDup6HOaB
         ivexsv6iMGRkcHsjvPiv7/flFNfROILkaGYzVB5AytcFZY616E6s795v8O5zkAEYxStU
         apw33R9YhUyusqMckynWSYlhB1Cqgn/A4um8VqJRGG+d6zdG03KRJpuocrwnF4L1HZ+N
         7UdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746091360; x=1746696160;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jBlkClAHFTnqI0HbjC5YVeOxMOu1AU47lWCaGBtkdKg=;
        b=LtYcLqyCjzO+9f1FoFkYpDgx1Zg4Xcdz8zvbH3hou3Nx79uoPwAaiihdimYqWq1lto
         AW/8pa53F3Z9nsmmKbKEfLFEMXVyflypT5IIwIJRcymrDmgOQXR0vr/FY3rVjA54tR5Y
         IRKgEvo9L/nSCGc7ys+F1mszN3HfIhwoeZH9DX2ymYgaFCRPl+df4LgL/ESdivr8mIzw
         ujr0Ower0vwJLq8QC5QiibAI/s2zTgELJEzd0DI8Ef+1tHB2uENvAQ2qaitnMt8V4jfs
         hrSQmbOMTSvWxVMAzIBS7U+5fB1rbiXBlFQ+FACdEJgz2ycp1yJ5KImTzYkEIz6JgTn0
         1A0w==
X-Forwarded-Encrypted: i=1; AJvYcCXY++gwxJCHZLtMknlW/6C0q6j/qGFFPm+/vb7+F+CbLv0lYm/L4lHJvgLezxKQ0Imb8g/azwLJzGz8Fqs=@vger.kernel.org
X-Gm-Message-State: AOJu0YziN72u/6XmYL6DUi3a9oY5Q8GFdeTCaOTVmSBnrWbbUuIRDXT0
	pZZfMRK44IO7uL5kyArVs/8DWBVnJ4fxwYCpOZySX7RZWCXSFfpAfRyKYP/LgmPDBgUsoQ0EPrG
	LK3FSqfKu6cvOFZzPHpKZgGKrhAQ=
X-Gm-Gg: ASbGncsteI3m3AvJNmVpuDyJ3QrTVUz88ewpBmYAfjzRDRjvdOtmu4skoqziUUZGCE0
	2afI//HBcxPmJ5BCq0xEQpyT+Btr4u+4sXXTiGkHWP8YLt7FaOA5IG2BVJd1mn9hpNOZb5pn4bw
	2jp2vic2hH2abnQrKM+I7u+OjuclkNS44Z
X-Google-Smtp-Source: AGHT+IF6cCzK57m7UCpIms0aY70tBCwZLBdQLNtLMxH0LGssIuecBk5ZYr1Bt9QkGE8D5tRUgkpVByeYSL0KO/Bz6nc=
X-Received: by 2002:a17:90b:1e0a:b0:2fe:b45b:e7ec with SMTP id
 98e67ed59e1d1-30a34ab4053mr3188948a91.8.1746091360257; Thu, 01 May 2025
 02:22:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250501015818.226376-1-fujita.tomonori@gmail.com>
In-Reply-To: <20250501015818.226376-1-fujita.tomonori@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 1 May 2025 11:22:27 +0200
X-Gm-Features: ATxdqUHBI9dQkUswJF78TgUzK8Ok6dv_VNBa6u7LCuaEEvhjaBmLPPeDJJtOEjM
Message-ID: <CANiq72=kHzATUO_H=cVsuak0dajPH05toyjW+TBMovKid57zCQ@mail.gmail.com>
Subject: Re: [PATCH v1] rust: time: Avoid 64-bit integer division
To: FUJITA Tomonori <fujita.tomonori@gmail.com>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	a.hindborg@samsung.com, boqun.feng@gmail.com, frederic@kernel.org, 
	lyude@redhat.com, tglx@linutronix.de, anna-maria@linutronix.de, 
	jstultz@google.com, sboyd@kernel.org, ojeda@kernel.org, alex.gaynor@gmail.com, 
	gary@garyguo.net, bjorn3_gh@protonmail.com, benno.lossin@proton.me, 
	aliceryhl@google.com, tmgross@umich.edu, chrisi.schrefl@gmail.com, 
	arnd@arndb.de, linux@armlinux.org.uk
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 1, 2025 at 3:58=E2=80=AFAM FUJITA Tomonori
<fujita.tomonori@gmail.com> wrote:
>
> +s64 rust_helper_ktime_to_us(const ktime_t kt)
> +{
> +       return ktime_divns(kt, NSEC_PER_USEC);
> +}
> +
> +s64 rust_helper_ktime_to_ms(const ktime_t kt)
> +{
> +       return ktime_divns(kt, NSEC_PER_MSEC);
> +}

In general, we want to keep helpers mapping to the functions as close
as possible to the C side (e.g. same arguments), unless there is a
good reason not to -- but since you are changing it, let's review
v2...

Cheers,
Miguel
