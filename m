Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9A85165F1A
	for <linux-kernel@vger.kernel.org>; Sun,  8 Jun 2025 19:58:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749412714; cv=none; b=hbigdOLts9E0TRR/njZJ7GE8Poo7EOiepDm9tzbZw/ZI5FeakCi05nJOFmv3fhW4owuWAX4rMOfs7bPHuIM/8tTsQALUAafF2aLlbTKQkwR+mEPwuHrKuyikDzOubUYK+9SURb8BeRxPC7s5T3HtCZUjlnI/qgov++5bIjOaqp4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749412714; c=relaxed/simple;
	bh=BLmXJzTM5ia8opzo1LdCoiOFsDBXD+MPSBLR8pplt3k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ABNkRARBi9zD22MsZ7mFgCh92VlJmcebIJ80QrkWmruKj78teqQ1eVJe/qCvipkfKD9Sw9qaCpHI1C6Q/3n6VI7Jgd6LyXrS6J7DVwuw8piquHQkL6VkcYNVnpHg9z0q7KwLeC6x8DEMyFr5QrXSwcqL2Grf2CViu4tDyy9F+dQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pdp7.com; spf=none smtp.mailfrom=pdp7.com; dkim=pass (2048-bit key) header.d=pdp7-com.20230601.gappssmtp.com header.i=@pdp7-com.20230601.gappssmtp.com header.b=o0zl0a5W; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pdp7.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=pdp7.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pdp7-com.20230601.gappssmtp.com header.i=@pdp7-com.20230601.gappssmtp.com header.b="o0zl0a5W"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-747fc77bb2aso2754845b3a.3
        for <linux-kernel@vger.kernel.org>; Sun, 08 Jun 2025 12:58:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pdp7-com.20230601.gappssmtp.com; s=20230601; t=1749412713; x=1750017513; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=SO/TiV/eetgiNfMpNbC5+xBYaQpqY6ayGmPuNTPhj0k=;
        b=o0zl0a5W2JtCxMthNz0mlEdGoO5932iXTBqqEUQTXIn/7roxnt/UGnc6klhq1fFad/
         oh7W4Kfc/lihWp2q1xXCxz6M8WnvrPn+3mzQNG7uUh3CLd8VhRVNxFg3FjF3/S7mHZaP
         016iZkVXqfash9pU937ZpNr9TXAgRSGtp+LqVRHn3qrM5L79k+vD5A4LggEFd5JlMJ1t
         Ma6f6aCvL4G14LkjX19k5u506at6hU4ZIUR5LwndFX9CH2frP2Ah4X2Hk4C5idOU2ydl
         JHsRt0OhOdMQDdmzJ16QSRhHgh+OwFXY0QAQt5+r+X+s41FLNwT5zbxpjGSPt8Tj1ODE
         0Gcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749412713; x=1750017513;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SO/TiV/eetgiNfMpNbC5+xBYaQpqY6ayGmPuNTPhj0k=;
        b=J1OqThPeBk5UpkAyAdrzVhEF7DC0ve9f+OQVtZgUVZCU7l8ACMFTVuJhreY8EzsdRU
         nfxOGAftNrY4DXgk630j8xxmFm75qJJYrnAe81tShb5Z8YRmIq/h5RLxYV14uzsGYbsA
         Sos6jIC5igLcta1oew8YY0sGTUZWqef/kT6j0dsseiaWxaC1Tx8zTqJljZJPvGK17H6R
         irByjLE5mwNnhMxJVcHBC9P/tb7hmIhPnTQj+EZa00EPczlfNzum7CJDIokoufnqvpzj
         eBRrMLygmJZAuJtpm5brTBiUT5PhepPiOUx7DV+HPtfct29p8LkB/oki+Gabm0GyQibh
         JkbA==
X-Forwarded-Encrypted: i=1; AJvYcCWG4nE8T6n3ZzvPChvGQYzb8R4hURlRSgnC/LVhc81Ue6SAXnHevTo5AtXARBPlNzaETvVTQzB9uGP7obs=@vger.kernel.org
X-Gm-Message-State: AOJu0YyP0pkxBZtUGAHt60FwQh+YcZOAGD21WcLNEjM1ohijZZsa/WJz
	yWgzL0GdOgMUp+hd0jjQTVIUBeXCA6LRJpm9dokdfo9bHtS8MRVmzYhQa7GxbvVUGe3Sr7VvjH6
	g9tGS7MU=
X-Gm-Gg: ASbGnctxVwHQtt3+guP8yefJ6mmDS/1v0DD26wz/mJtC5oUE4uubBLr4EU6DZUrA7Bq
	mPTM3esiyo2sne5mKBSJlJoDrQuuhsfkluaplrJwH9eAG6vQCNer00zlbuQdYdPG44cdlxP8G+9
	Qtt/PSy6rwCx9PEh/uaz2VL9xYviJGYzsA0IUhkGHjMYlhOoUyvR3gTWDB8hkfT6bI7v6qcqQ3e
	ToSNJD5E4UeXhnr13ppMeT9aGc0I90GiOsh57aU1zuo6mfBQlV5NvHTap8adWPi7tXryYRkRa6Y
	101uJW0W1U4i0lkdEKXmwoFUiwntCf0r
X-Google-Smtp-Source: AGHT+IFbXbhXFIU9zLa+fXurTHgYmeXx2QZmDu603fA5wHw0+5DeqF3jW9IscpN1oxDbST4x8Tn+iw==
X-Received: by 2002:a05:6300:6c03:b0:21f:54aa:2004 with SMTP id adf61e73a8af0-21f54aa2170mr4488578637.2.1749412712968;
        Sun, 08 Jun 2025 12:58:32 -0700 (PDT)
Received: from x1 ([97.120.245.255])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b2f5ee73e2asm3467343a12.29.2025.06.08.12.58.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Jun 2025 12:58:32 -0700 (PDT)
Date: Sun, 8 Jun 2025 12:58:30 -0700
From: Drew Fustini <drew@pdp7.com>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Benno Lossin <lossin@kernel.org>,
	Michal Wilczynski <m.wilczynski@samsung.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>, Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org,
	rust-for-linux@vger.kernel.org, linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH RFC 0/6] Rust Abstractions for PWM subsystem with TH1520
 PWM driver
Message-ID: <aEXrZvpTD30a5OhT@x1>
References: <CGME20250524211519eucas1p218997c69b98b14d3af2eb6bf4e9d3187@eucas1p2.samsung.com>
 <20250524-rust-next-pwm-working-fan-for-sending-v1-0-bdd2d5094ff7@samsung.com>
 <aDJGgLZ9tITwGBxq@x1>
 <b5f4af17-05ef-453d-8f04-283590ae5b87@samsung.com>
 <DA5YY0YF28GO.3DONTQDLY6VBD@kernel.org>
 <aEXBH5r05FkTxpV+@x1>
 <CANiq72k-FmZe3P_y6FjmiqXViqLKXkDqHY1-KLfmgwAe98oBAQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANiq72k-FmZe3P_y6FjmiqXViqLKXkDqHY1-KLfmgwAe98oBAQ@mail.gmail.com>

On Sun, Jun 08, 2025 at 07:14:18PM +0200, Miguel Ojeda wrote:
> On Sun, Jun 8, 2025 at 6:58 PM Drew Fustini <drew@pdp7.com> wrote:
> >
> > I'm not sure if that bindgen warning matters?
> 
> If you don't see the `FromBytesWithNulError` error, then it should be
> fine, but I would recommend using a newer version anyway.
> 
> I hope that helps.
> 
> Cheers,
> Miguel

Thanks for the quick response. I seemed to have updated it with:

 cargo install bindgen-cli

And it seems Linux is now happy :)

 $ make LLVM=1 rustavailable
 Rust is available!

-Drew
