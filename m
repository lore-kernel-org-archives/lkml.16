Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8101247299;
	Mon, 14 Apr 2025 15:38:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744645114; cv=none; b=atg/6bmF9/1/zoJYqnvdxI8OOfyAeFB0ocgrpEmd8uNl+36P6ZBWDN4n8ACsStfbhyZ0+hBf5NomI9PbJHPAgjbv8aF8xQZy4UxFO9jrGPsmCQVLfhJsPvFvn9JqaaQwpZmhdLBEvatRAVvH2Dkuf2DgJC5bjXcHRK1UbkRQRHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744645114; c=relaxed/simple;
	bh=RuecTKg0iaNM2FTHixYTxLi4zj7VKfj4amF92wuExCg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Rz9PZr8/38+cuqTWrkCpNKuxniPpe1V87TI00NZPs/IfU1A2vEockmDe6mhZN0t8/26WynqITgMLaqpJ/lxMdRLZjHIQ7VKRJBumzLORyhe6Q9RX0PNizvkUKM56t8NccJM5FOsdcKrfvcDe9T6UCP8wqyv5aR5Hf3Fk4oCe5DQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mOkodUOk; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mOkodUOk"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-b07698318ebso122644a12.2;
        Mon, 14 Apr 2025 08:38:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744645112; x=1745249912; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7hTVE72PCT4HpQ9Apgj1j1o70imaRSlg41FJYH8UsUw=;
        b=mOkodUOkYFh91YD9qDudqktn+oBiGjWvUybCk0XRA/WWQ4Ai33PY/WLuWn4AKOVQmO
         ua2Hzy8PEV2IRs9qDS2f1g15+ee3N7ZfKmSDsqKRdnrCpLtFaqxaP5KZgjGD3JUJzNX0
         RDGd8wEQvUCe8KWfoFDG0OvniPeqokiWDNCC0eyYjilVmy3RTLXEkpdZoofWFVyQ29Qk
         ZnGVUjMysMruvXtHr5Qb07oBZ+ZToZ7LX9qOuf2o3f+l+WBmKrXYN9+4b0XEExWxt5As
         wU8ayOoEUORnzCXO7+rNCQI8ME2H/9u8J3zS/y9BsGh5X421TD7FKanhCqet3CCMbZdn
         /sww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744645112; x=1745249912;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7hTVE72PCT4HpQ9Apgj1j1o70imaRSlg41FJYH8UsUw=;
        b=LLrXOYx8N0by2DCNQoeGShgw9KOdIDUmPHpzFLQrjOKth0Aji+Nstai3Kergsy/5Qd
         IO8Ndel+4fikDJar2FifPXzhH/itPteKoBTHm9vmH5SuOCqOA3C0zGmXks4UsHQKVnG0
         oioc674dtBS7b4VaqAaMJV1ljfW1vEJ8rucIECKO3/IrrkEwYUV/ly3EhtG72afjLJUw
         ZA1nrEETGa7m7njzWMT5TSLjO/dAP/PrKsDMldMlJoVBLfz7YCIQBjxGF9UpWbr93pYF
         ZaJFCilEYQfm3uT112Ncqd4NhD2UP2Lv8cEeHKXqOSS68WzrAOD7z+2/HONdqTlnHN84
         SoTA==
X-Forwarded-Encrypted: i=1; AJvYcCU9iTC6g9fJdhgHf5Mos0SEnyR2D3SI9wZSFjwn2OsHR5jRrP2hWV+S6ViYcWYbF+2KUOqu+WbKiBiOBTiU@vger.kernel.org, AJvYcCWvhKlJTGKfoVF9mRBHFODW8KBIbTPH3MuUADt5W8+TzZ9SOyEDotar52fTjNRUvrUb3NLjXJN7J+k+@vger.kernel.org, AJvYcCWzvFfAsmHeFYn5pkdRpaje2QqTVa3V07CkQ5YcLRsB8mMabCsy0y7A5rlj5rPgEP5dhZLjbuwg857TGRFtlt8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzkQsR2vNcHgL2Bjfa8bvKE21BjR05TRx1lwTHL9gZpB0Rq9e50
	fAuNePaafKDX+gEV53V+HPw03k+Youq/M10oILdd8lHwOjWwhWtUDakha6emgN3tgUloSSkw/Xz
	CCXzMmYz3zlQQ91gsoV0qz7ZnDJA=
X-Gm-Gg: ASbGncsOH9qmggji9+k+26Y8dk19a7fVvY6G3zV0yVCmoKDaITf20mrk095b8zoEJpa
	XiolzHgyXwU3xzd0fRpPAxyRyWTNFMuWvXvfKL4/7oeXFN7lqOpV1/2Ciia3d2mLeDTxEvGTEp0
	eFSsdZY8Fgf6SrYXLh7lqAkg==
X-Google-Smtp-Source: AGHT+IEl7wHf0Sakgfm/WJeSfZvJ7q2i4J1DoJtq8lyP7HES/L27EXmyf/TNfYuKtRGxT9VdHhTRtMrGWU2WyCxoBIg=
X-Received: by 2002:a17:90b:1c8c:b0:306:e6ec:dc82 with SMTP id
 98e67ed59e1d1-3084e76898dmr133828a91.6.1744645111895; Mon, 14 Apr 2025
 08:38:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250326171411.590681-1-remo@buenzli.dev> <20250414152630.1691179-1-remo@buenzli.dev>
In-Reply-To: <20250414152630.1691179-1-remo@buenzli.dev>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 14 Apr 2025 17:38:18 +0200
X-Gm-Features: ATxdqUHT3bhfx4obPIev5V4LNaD5n_eUigTkiTFuP1PQG7JIim9RVDEyLqHrD9g
Message-ID: <CANiq72mJubnGyqSk3sqKVa7g9HvnJvmRg=gJ2kaBtbMMVWWC8g@mail.gmail.com>
Subject: Re: [PATCH v2 0/5] More Rust bindings for device property reads
To: Remo Senekowitsch <remo@buenzli.dev>
Cc: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 14, 2025 at 5:26=E2=80=AFPM Remo Senekowitsch <remo@buenzli.dev=
> wrote:
>
> changes in v2:

If possible (no need to resend, it is just a suggestion), please
submit new versions (especially multi-patch ones) in a new thread,
otherwise in some clients (including lore.kernel.org) it gets harder
to read.

> Link: https://www.kernel.org/doc/html/latest/process/submitting-patches.h=
tml#the-canonical-patch-format [2]

By the way, since I am here: to link to docs, nowadays there is
docs.kernel.org which is nicer/shorter:

    https://docs.kernel.org/process/submitting-patches.html#the-canonical-p=
atch-format

I hope that helps!

Cheers,
Miguel
