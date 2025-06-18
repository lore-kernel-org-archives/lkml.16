Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E35A2882D1;
	Wed, 18 Jun 2025 15:47:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750261661; cv=none; b=r8Auov85xB7sm+FH8NpnpkMqwJyM5dDq0pSYTmPuAAB3GprvucLeIjDmz2XKNg+LVhOY5RVBZGF3l5a0r3iJzTe31rpk0g5URZLbW5nNlSGtKX+lHKO/Rkt+z+k6UafY2G1vID9KcFyveOTwd6b9jkQgR+lWV+Y5cA5mB8WTg3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750261661; c=relaxed/simple;
	bh=1NWRcvqyk1HC6IXC66tM06YKT2T2SuTaEg9Je/zWpNY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ihLni4Z4awC0IwZTLGkABMhfvISePR1qffXXUhfsxE1Uou2ScO5xfR7/+4Gu2eoAoJuUIXG9cj5mlUOfypq9owXg35V3eyCNLw2y5N7o//cYp1a+A0pKel47uWVDJQbYPnho66eYUAu5jw38rEOv0koCr3Lhe0sDP3xFOEsucBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j6809X7b; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j6809X7b"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-312f53d0609so1123010a91.1;
        Wed, 18 Jun 2025 08:47:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750261660; x=1750866460; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1NWRcvqyk1HC6IXC66tM06YKT2T2SuTaEg9Je/zWpNY=;
        b=j6809X7bM6B2H/kHeEtt9peeQVuy1mv2YtNvH+7g/EI41ymDpvScDzVRFOPUoqRX4n
         w18Z8WrWpBduI9Ku7Yaa1orDhEbqZ5LHtpAHXYV4nNhDHg1nspzJejmQsNbOOhGSFkRQ
         m4cyBuEFBqZtxQfgU/OXXp1a1MnRMP58asBjfKFMF3PSVjeh+8BnbuCdc8/HJHuE1jIf
         App6BwrnSMkoQrmQrhJz2McbYD/830fXIl6eLEFfb+uq4cNNGAHW7NQuu7233qNTfYHS
         m28L9b4FsD6CjYfk1vHmtGpBlOx/HGcJaMk8H+2tat+DJC2a0ivOG/ZBKC5wt/ZFNS5o
         aSAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750261660; x=1750866460;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1NWRcvqyk1HC6IXC66tM06YKT2T2SuTaEg9Je/zWpNY=;
        b=M5foFr4todsjkd2ziYK1G/uXojLBoMVj9Fs00pDJNlduUfPOm7CV7I1y1Hf/uaImac
         J5afkXxh2cm7WVxG71KZuKGEH4Gj6LXZ2bCf7eOZ/8BAGRRPmbeO1g2TDltH+q9i7iMt
         cR7EmqCiT7YC5psyCLssZf5xAq73vNBIiDxDPrvM+vHG8ByBxuCziwL3r9bEDYoZEbxc
         7oDL1PXsHB5tLx33esZHDEC1dPPleLb4rb62BV7GjauY7bfKhbO7jEg6Pw7I9kuZIlfX
         i7Rhut7mGXD7GzZB7TFIerYqluCTCiYZ5AcXRwsncpRyUY5IwKlrgS6/goXLSvsBq61O
         6xFg==
X-Forwarded-Encrypted: i=1; AJvYcCUSXf4Zcrv7DijCwuFtThGMralp1uYHF76JrVTQ/MXONq8NdFfdJXK2FfrzsdbE6X4Y/BPVlO+rh5NLbd8=@vger.kernel.org, AJvYcCXHIuJGL1RaO++fSCg/x++ILHcwU7wbFTGCJ32hxfaF4yDC8la6JgBK9pkgMo0taSWzG13gpJm3W0Pns5T16cU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzsp2zTV4C6oHs4lGK8kkENbu6wffaiC7UFchVDcv9CEAy+l29+
	HKbTzvazpoyeT63/V9GMjjT0yVyaoq9XMiW+3LAI5a6X9g0EHF+gyHTVau/GCym5p6Gu1YEJ2i1
	v2e+pkebeFCDZiDI/GRiPY1x8Z96dUIg=
X-Gm-Gg: ASbGncu2qj1J/p6ZTEazrm/X7pE+2b8g3DOhw5RH0cMfhUaASP5ZBMqix4DefRgoYEU
	RxdvBWqxzMMXfQPvl2PJPsLd3xxMoAINQfi50KeGyulVjvGpuEDrjKcFWM/Y8Q9QeHaftuCw7kg
	qh5BUWbEG9FKxVL5DpjR5ejJMNdjOVQsqLaALkBofjxdA=
X-Google-Smtp-Source: AGHT+IFyYd+JxjMJtiuVxmSQK2fVe0FWUd5QPg4Vb9q9Xd73zFxOWEv5UEHwCCyXhu2Hq4ae7/DFdcxsuKfVrTQ+lEw=
X-Received: by 2002:a17:90b:1ccc:b0:311:c939:c842 with SMTP id
 98e67ed59e1d1-313f1de6397mr9265526a91.7.1750261659682; Wed, 18 Jun 2025
 08:47:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250617144155.3903431-1-fujita.tomonori@gmail.com>
 <20250617144155.3903431-2-fujita.tomonori@gmail.com> <aFJzNCCERjKHIVty@google.com>
 <CANiq72nP+dKugMv3KXdJJsFE0oD01+zYgWbjz3e04kmhj_5MbQ@mail.gmail.com>
 <aFKMXqak-mHraxU_@google.com> <CANiq72kSfHTPeRQjhHKhdw8zuozvNy50CJjTuEbUnW_3j9x8tw@mail.gmail.com>
 <CAH5fLgggDKUwmU3oCTMS1dQGzA5Whp2fnXoLmbGmNF1W89Ar_A@mail.gmail.com>
In-Reply-To: <CAH5fLgggDKUwmU3oCTMS1dQGzA5Whp2fnXoLmbGmNF1W89Ar_A@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 18 Jun 2025 17:47:27 +0200
X-Gm-Features: Ac12FXzvwz1JJyMgqNMj3Z9BJKGqVyQdYLECpyT70444q_vEtLig1KxU8dwcXLg
Message-ID: <CANiq72mBfTr0cdj_4Cpdk62h2k+Y5K3NSs54_1-9jiszMZ6AuA@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] rust: time: Rename Delta's methods as_micros_ceil
 and as_millis
To: Alice Ryhl <aliceryhl@google.com>
Cc: FUJITA Tomonori <fujita.tomonori@gmail.com>, a.hindborg@kernel.org, alex.gaynor@gmail.com, 
	ojeda@kernel.org, anna-maria@linutronix.de, bjorn3_gh@protonmail.com, 
	boqun.feng@gmail.com, dakr@kernel.org, frederic@kernel.org, gary@garyguo.net, 
	jstultz@google.com, linux-kernel@vger.kernel.org, lossin@kernel.org, 
	lyude@redhat.com, rust-for-linux@vger.kernel.org, sboyd@kernel.org, 
	tglx@linutronix.de, tmgross@umich.edu
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 18, 2025 at 3:17=E2=80=AFPM Alice Ryhl <aliceryhl@google.com> w=
rote:
>
> There are also methods such as Duration::as_millis(). Yes, those take
> &self but &self is equivalent to self for Copy types, so there is no
> difference. And even if we did treat them differently,
> Duration::as_millis() is actually borrowed->owned as the return type
> is not a reference, so ...

In most cases it may not matter, but even if taking either was exactly
the same, the point of the discussion(s) was what is more idiomatic,
i.e. how to spell those signatures.

I understand you are saying that `Duration::as_millis()` is already a
stable example from the standard library of something that is not
borrowed -> borrowed, and thus the guidelines should be understood as
implying it is fine either way. It is still confusing, as shown by
these repeated discussions, and on the parameter's side of things,
they still seem to prefer `&self`, including in the equivalent methods
of this patch.

Personally, I would use `self`, and clarify the guidelines.

Cheers,
Miguel
