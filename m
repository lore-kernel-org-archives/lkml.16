Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 373B4215176;
	Wed,  5 Feb 2025 23:08:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738796918; cv=none; b=gXzOCgYeyhFgoMfi9N/E7Ch9flKncr00a8DiW3ra2bLpbBCe+WJkAVKoNX5QfluPBYoKAmmYTZdXO//v7Kejm5kfmmUrVj4zZFziLnihEsQwb4B8abx7X4/+LmZuKkAnK/qE7g1wHPR5uN3e2eiit7KJ3q4KoVDqw99RZ37Q868=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738796918; c=relaxed/simple;
	bh=fuDkEVMB8kWb5BIlq15+1fTm+CoSPxa8lvWLL5RgHxo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PRBPtsNtTuWK1Nr58yjZIcalkqo5oN42IKCbAmbkc5ub6FuDotv6Lmsx/sH5qc0SHXlJGU4+j9FITT/iaPVQmR4VnnnTJoncQ2LXhTpfseflIjtVremc7ReT495iEN1kE385fzNbIe7Zced7/wShhmzr1SGtyy74/ouV24p6Dhk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gpbhfii0; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gpbhfii0"
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-30616d71bb0so3275971fa.3;
        Wed, 05 Feb 2025 15:08:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738796915; x=1739401715; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fuDkEVMB8kWb5BIlq15+1fTm+CoSPxa8lvWLL5RgHxo=;
        b=gpbhfii0Vggl6Ge4G3PlddedrcgpAnsGzsuzVINBLC09ekEvpJ1uh3n3zO3QcvBA1k
         mmkc6E5B1qaJzjCd9Nguax+5eBuAmPlIN94/uQnLm1d4NaYfMEa7P/Q1fi+n3cWAcFrv
         nAcRJepD8Ax+JG1/W18i05Ql08xZwETp932YSoIOPpX0lQZre2ShmRccqN4rwP/6TKqT
         K50tlOq5TGLarQk1HPd8lwKgEvg/JGUKlpbaEba+cvyZYbI0Ktz+I28PRrp+ux2FnLhn
         wW/xXHLW1ewoOH2jTBmrvfQv/jzzHvONP1tiLEEjzat9HmtgAhd1/3a/LoA1aB4qyW9I
         JmTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738796915; x=1739401715;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fuDkEVMB8kWb5BIlq15+1fTm+CoSPxa8lvWLL5RgHxo=;
        b=p3K/mL3b9inrCFpwhcCwYv+01VceHC2Pq9pRpWKTTrFSDZdflm6fSVbpp6wJkGukCD
         uAF/FnGvikmOwo3E2ZS6EnO3ASTteDoxKqPqz5u+es8J8zqrncrxrUH9OI2ZUYh2Nw+4
         4ldD6dM90Yr+W3C3XZi3nAoneJ55BElXfpUEufIxHyqRtRY5UrK0Izbx9WOHSpTXCLO6
         APDgk5/nRNIguyDUwPbZ2U0krK2GhbO5gjG934/UsHnEVgSsPRj1Vl+aZNix9ew/IjWJ
         W7uLkkBOGYZsztlvjgPyUEOdbSRqtjj5RtW6GEuhlX3PIYDehJWegchZCQdP9svb45ZW
         H7PQ==
X-Forwarded-Encrypted: i=1; AJvYcCUqNDzmL2O3J5ngQPGxC+YpKi5Ut5DBvpJW5/bDwhzSLgP8nuj2SYlZ/UBz0baNId1AaN/M5C7UqSvQtLc=@vger.kernel.org, AJvYcCXjMxqtZo4fa6dXlUfAdxeacnDgIfZ15+4+43oP6bRKIlemGpEQPLR48t1HopI54aiTbaImMrkhYXv8NegHTdU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxxCFXlpGZDIJddUSNhdNnkF7fL8oLYjG+aVJVr0jRXkf6WxonD
	j3q5By4zMaWUss65PM9WUSxptjTo6JGaFiTu2/1bLqgG/aW+/NJFog6RR5/2LG42bQ2o+XMkYtn
	9LUKWluAtQWfF3cSLSq49tWVydQg=
X-Gm-Gg: ASbGncu1i8D9zZfm9dKPcN55+gzenyMze4t+YZDuD6IZBnCHozBduOr3mClSnQl/J6u
	uHhPrU7BXiFkwd8NuJbte2KwHqUZxVBBwrIMxRYxOOCkK71UC6MpVColpAtkglG7hS6rUPml6Cy
	8KEa7ftGn4+E9q466F8pOKcr+hdEQe
X-Google-Smtp-Source: AGHT+IGXtWJu1TuEzqD2mC0rHrBhNn8jf2CoT5OcbuaYRRc/MtWYWlzfKTExPmHCLgov+AB6zIYwwAr3GPgvUW4f/5U=
X-Received: by 2002:a2e:be0d:0:b0:302:4115:acc with SMTP id
 38308e7fff4ca-307cf3819ebmr15102291fa.26.1738796914900; Wed, 05 Feb 2025
 15:08:34 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250201-fix-mac-build-again-v1-1-ca665f5d7de7@gmail.com> <CANiq72kDzfDhzE4ZiZ2YEtOmFwh5u9pwy-_76xRURd9WabPEdA@mail.gmail.com>
In-Reply-To: <CANiq72kDzfDhzE4ZiZ2YEtOmFwh5u9pwy-_76xRURd9WabPEdA@mail.gmail.com>
From: Tamir Duberstein <tamird@gmail.com>
Date: Wed, 5 Feb 2025 18:07:58 -0500
X-Gm-Features: AWEUYZkMk_m_U_88hDFjqAEJY5HLb1KkTzQ-eoIGeyChu1oEsxjZ4sqZJV55FXM
Message-ID: <CAJ-ks9nh=oM=d4dyJz_Pi3M=46QGRpcqX699muB+qvd01ZuRFA@mail.gmail.com>
Subject: Re: [PATCH] rust: use host dylib naming in rusttestlib-kernel
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, Fiona Behrens <me@kloenk.dev>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 5, 2025 at 6:05=E2=80=AFPM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> On Sat, Feb 1, 2025 at 6:40=E2=80=AFPM Tamir Duberstein <tamird@gmail.com=
> wrote:
> >
> > Fixes: 0730422bced5 ("rust: use host dylib naming convention to support=
 macOS")
> > ---
> > Signed-off-by: Tamir Duberstein <tamird@gmail.com>
>
> Spurious `---`, but I have fixed it on my side.
>
> I also noticed another recent message from you with an empty line
> between tags too. Something strange is going on with the tags you add.
>
> Cheers,
> Miguel

Thanks for fixing it. I think in this case the SoB came from the b4
cover letter rather than the commit itself, which is why it appeared
after the `---`.

I'll audit to make sure all my commits are properly SoB'd and file a
bug with b4 if necessary.
