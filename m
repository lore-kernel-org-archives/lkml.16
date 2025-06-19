Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD7A230E82C;
	Thu, 19 Jun 2025 19:03:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750359800; cv=none; b=Cotr+RuBTA479xIokrK/8fvQKIod8zFetePXiNUpUmXPaGSB/UHav7afMk2uo9cNYQy7VWfTibf+ELjEvlPO/XHHdGHcZWj1N+QifvnNVM9Qf7JP6xtnjg1rqFlAMfxebaVlR23vcFVzrdr+p8pRUWYUl8+lOX0DH6nHvOL2Bfs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750359800; c=relaxed/simple;
	bh=xBTz5orrYmK4KTDBCO+zH7v6G/lA5S0UByrPx51Mrz4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ngGy/XgQ0BFrNxRpMtgCV3GYlb8XY/ECekSryCsCfdkxo9BPRPkvcf9v+Q3LXsNvNeo8oSGNsHnAKvHL9dYXJpE8LS34qwf3IpmfKTN/8L70Dq5hCtZmbSEZGRTdthH0Z4aofX14/OZ+W9KpbtNOLoDUTcafuO044ewzq+56fAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kvx3R2Ew; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kvx3R2Ew"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-235db423abdso677505ad.1;
        Thu, 19 Jun 2025 12:03:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750359798; x=1750964598; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xBTz5orrYmK4KTDBCO+zH7v6G/lA5S0UByrPx51Mrz4=;
        b=kvx3R2Ew7C1QiOXzfJlcXIHbUP4btguNwYQ8z05lSDhlzW70MhgRlyhEs1Zf0z3IY2
         yzjNamyR1YnyW+rNntC41UQT79RHlxuIRueWj3D3lt41SNRr43PKndsN3m83y30qbbBO
         J6j8yMD+zIHHI7I6A9+Wq2/sHOgZKsgZuNYvIuxGgQTiiWSeVXoqBrUcQ5ijXMRj5Mxi
         J7+WCoMPPT9RSXNBjRNaQVqxOJpmqeM3Dghvvpa6huDjvCzJh17REVV1nWON7/d73yJN
         tNalKf7akuu4O58OPzNmk95r3InaIWoHN4Aj1TRR6A/0ExYmzBDVwV6ohAkCVU5ejZ8x
         SQCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750359798; x=1750964598;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xBTz5orrYmK4KTDBCO+zH7v6G/lA5S0UByrPx51Mrz4=;
        b=UeXa42op6zukMXUDdMc5Z4anjxH6UKuCER+jiKLlw8Umj/aH7JBgzHL+67AAeyn0wW
         P+BdBcPyEZzvPENaaQs3HldnFoybC42BDEvvZOVwg9tZqW8RWwiRM7u/g0AxJZa+OYSP
         3qWgCjFPl1uyKu22HMTV1hcL+mQBOwBuXLhSKaUfmuWgahe1fOo24J/FvXtU3pUOhdEU
         ON1G/xWbpNOSSxwqxg87p/eWVAd+Wypqzb/blUdETrDwm+ibjD1kpA45XSQURpE7UaTw
         Jlg5N607Fx5SYra2XNFHYaJAPjT7E4CbpTGM3mShMXQcw2xRfUgtMdTW1uSWBaQ8RR9a
         HPTQ==
X-Forwarded-Encrypted: i=1; AJvYcCUFmt8Ek4wi9nxT3hneqhpucUjdNMvtJjHo7FIqVdd4mzXzntQLYn2hTx6uzVu8IU78L9VRY4aHWvb05IE=@vger.kernel.org, AJvYcCVr+l4b9s0TcguQBVAbc/azWUmsvehkK9ZA67d3koSeE7aCaLBVFtpPgUpjHuT0wowkSPC44ZXhUhHjlnUXsuk=@vger.kernel.org
X-Gm-Message-State: AOJu0YysXKIS/FCzjcFkdacWtD2AiUxRKXtDrrbsz+HnSO6qDEyKhjkL
	S+hZGJ/A8bGt2AQUGQvF8O+2PKiJIrP2vkKmcP+rzvQrKDLpI0jB0pZW7Nici9BS1v6ptc+A3Zy
	UObe3XS6yTubU/uSpz7J3H9IwkRI6D3o=
X-Gm-Gg: ASbGncv0twNCb3+8LY9p1psPslWePUiL0aiu1w8+qCqL2tGmVWrpxoIU8M/21LKguKY
	xvVeualg1wHQYIABTluJzrBfBtTlNZvGByzNBFzQT5GU9CCdUPogpdx7ahRc8LszwNrQPsRwAY/
	oHjAJcqT3R5nvichjoSX+jnMN1Br9377IzIToUY38a678=
X-Google-Smtp-Source: AGHT+IGRChojdP7TypA+NL9GYAe9jvVcBK7o/oASVAbfXjseQlF7YDg9tcQwykugO9gzCciBsPUAiiSEUzZSxrT9PdU=
X-Received: by 2002:a17:902:d487:b0:231:c9bb:6105 with SMTP id
 d9443c01a7336-237d94bfe5bmr180855ad.0.1750359797909; Thu, 19 Jun 2025
 12:03:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CANiq72kSfHTPeRQjhHKhdw8zuozvNy50CJjTuEbUnW_3j9x8tw@mail.gmail.com>
 <CAH5fLgggDKUwmU3oCTMS1dQGzA5Whp2fnXoLmbGmNF1W89Ar_A@mail.gmail.com>
 <CANiq72mBfTr0cdj_4Cpdk62h2k+Y5K3NSs54_1-9jiszMZ6AuA@mail.gmail.com>
 <20250619.160844.1477802332578239775.fujita.tomonori@gmail.com>
 <v2VP7JfqanHzCbCjzZsKXCG3l7icurTwDY22nHhk0sJjQjy2gubeujbVvfLe7c8-2KOURnZ87UHLxjAGiTxfeQ==@protonmail.internalid>
 <CANiq72kacWaLo=EE8WyA_M2Pr9h1MkqjeAmqet6CSGWLvM7B9g@mail.gmail.com>
 <87ikks84im.fsf@kernel.org> <eA4kkaheodmz2bvo4hsNPi7K85CCQheFde7p25BWA83Kxp8_GQ-Anf_QVdhuIPAm9bDHnZqTlpAqcluWgNw4og==@protonmail.internalid>
 <CANiq72kHvfkrK0KG2Y60HkLMt=mgJrJMOcuF9Feker0FjgoVkg@mail.gmail.com> <878qln7v33.fsf@kernel.org>
In-Reply-To: <878qln7v33.fsf@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 19 Jun 2025 21:03:05 +0200
X-Gm-Features: Ac12FXx0ckhobQZd-2JoKghl3SLFtSpyK9hOqSHSwuHRJ-qfEnfjOV7jqfQ-LyQ
Message-ID: <CANiq72nd6m3eOxF+6kscXuVu7uLim4KgpONupgTsMcAF9TNhYQ@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] rust: time: Rename Delta's methods as_micros_ceil
 and as_millis
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: FUJITA Tomonori <fujita.tomonori@gmail.com>, aliceryhl@google.com, alex.gaynor@gmail.com, 
	ojeda@kernel.org, anna-maria@linutronix.de, bjorn3_gh@protonmail.com, 
	boqun.feng@gmail.com, dakr@kernel.org, frederic@kernel.org, gary@garyguo.net, 
	jstultz@google.com, linux-kernel@vger.kernel.org, lossin@kernel.org, 
	lyude@redhat.com, rust-for-linux@vger.kernel.org, sboyd@kernel.org, 
	tglx@linutronix.de, tmgross@umich.edu
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 19, 2025 at 2:51=E2=80=AFPM Andreas Hindborg <a.hindborg@kernel=
.org> wrote:
>
> Yes, I would prefer taking by value. I think Alice mentioned earlier in
> this thread that the compiler will be smart about this and just pass the
> value. But it still feels wrong to me.

If inlined/private, yes; but not always.

So for small ("free") functions like this, it should generally not
matter, since they should be inlined whether by manual marking or by
the compiler.

But, in general, it is not the same, and you can see cases where the
compiler will still pass a pointer, and thus dereferences and writes
to memory to take an address to pass it.

Which means that, outside small things like `as_*`, one should still
probably take by value. Which creates an inconsistency.

Cheers,
Miguel
