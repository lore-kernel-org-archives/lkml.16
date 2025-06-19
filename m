Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84699634;
	Thu, 19 Jun 2025 00:29:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750292949; cv=none; b=bXmu0LhUTucsV8ePRKdYcXi1M89suc0dzSc4VTd2j0P/+olzExtG4yabWqRX+lYjTIyqxau/sxOriyPfw5/AJUUuynCahPQQrJMGCpha0f1qlehWBP4KFIh/00RM+eJOhnUQj9hx6vno/s1wU3yrUDa89o5b0E665NSEQrQ1nDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750292949; c=relaxed/simple;
	bh=6pei+RlkyElO2Uh24RAFf4g7/Xewuciw1jDYZ/+HGLk=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=B82cF5Oi/w8HP0zWrD9jhkUz8DhzZNH3e3c35/VSboz3aQEfCXVTZv5OGJEolC+iFkiqFU0bLCqHeag/sBAznw1S1PIYNLq1HwbDLCSWDtdc/DGnMva2zARiYt2iNDknU/gKXtL4Aj+LOV60t8E3CQQ1r2IjUS922svTAd1MGxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Jppvijud; arc=none smtp.client-ip=209.85.219.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Jppvijud"
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-6fb0a05b56cso4075176d6.3;
        Wed, 18 Jun 2025 17:29:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750292946; x=1750897746; darn=vger.kernel.org;
        h=content-transfer-encoding:subject:references:in-reply-to:message-id
         :cc:to:from:date:mime-version:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1kVvNZNHp1yEFshwzWK0iJHRAsVEFrzGngGpDcIqaiM=;
        b=Jppvijudkzs5aDJ5w/Zzscyb5R7ZbVYeSJPJtJzxcJTpWf0EMLUSaZUmFlhu6dTPnj
         j8qlR8zxNJrsN5s1ymtgY97ICynF611xRjbxYRIP1RxX3K7gVWuR1dCHIPT/t3Gzli6u
         Ug66TR2gMlGc3IF0FT3UYIfMfZRw2DjJs3UxvEqk2AoAKfiP5sFPXiy7UnjB5qsoNpJ7
         VBTh/kfGjp9Lb5RDysqrIJrEC6IDCo6fu51uLfJzv0f11dL1aQ4/OWqC+xN+Slz8lsuV
         Okdi2LEgwwBcWn9EXQ02QIM4CIikWtIYxu4bWu6aSjbDi7kvLZ9NgFJX4ejROVgJtN4/
         sGpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750292946; x=1750897746;
        h=content-transfer-encoding:subject:references:in-reply-to:message-id
         :cc:to:from:date:mime-version:feedback-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1kVvNZNHp1yEFshwzWK0iJHRAsVEFrzGngGpDcIqaiM=;
        b=J/M6DiZyM9nDCktOgGJTVojEev7+KZ9N788/ZRezO9mAvGC0TkauGXSNlGaPinMsm1
         94DgqTthCKBfviAu2wHJ48uyJZbQbQ2oq3OYxlEwCp3C9NcUuWe8zLAvcOL2q4Ymei89
         cmn3piLU2KTCH2D2EJ+769AYoShp4NxTBzpMmG+8K/AQ/z0RqJe8ArcIDXIZYreL5bKR
         ZFTNa/v5nInwUpoMoBGfQlvmzerL8c0V4dMQmDPxq5YD8ybaE9sVTgg9a9+IpTH3Ooic
         cgfbhoS7sJyAU8Req+GxORmwZ+OcHa10wrvHWbzNRsEbyI2xSJGMweTiXikg01W31DLx
         hKYg==
X-Forwarded-Encrypted: i=1; AJvYcCW2GfiLvlR/FSzRTZ2GGhm7Skeod/HlI6NEcHEfniFN6Uqx3s2Qp4LJF+ihKrtIc4i3cpHYuJuW3xKlpyjBvc8=@vger.kernel.org, AJvYcCXR2BkuZTXSRoRO9KjIGLDFrh+IQA8M68Gtu02AKI/A9C4xX5yMZILtwAhmYBue8siO+q5tlPoif8lDuJ4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzR0x3KAlQMKp3ru2m1Kk42T253R4uj72eR3sSG3HuVCxty4Ltz
	nd0QroZmuzuWp68r8oZxMqEZyQNJYqHIqk7/TNsw74D07WsIHVvKzHIy
X-Gm-Gg: ASbGnctROY4vCOOt0BQSdKunjcP53ZVaAKQ0fwAq/xc+T0jcTrbwnr0nI9gjBXIQzxB
	JZ+bDG7N7ihufx8CSUXFn5rNVV3aN1JAi1kgKFfBp39Su7mtiz3tyx8Fc5UU3JnDjmp8Vwbo741
	FWBwZ1oFdHrky0Xz4f05nl/IHqJccPyF26uypzXxRyx5nN97MIT70XkIWxHr1Sa4gzAZwLAFDG2
	H/U0sO8B8dUMy0/cNfuqlsmOkMwbQmym0XMydufbiRnHU3KSun70D6pPscYJPDdgO1rnReVKuM8
	A3hpSWoieLMU4ocNHy2cBIZ8Zc0Rc+GtW3PiTn/RJRlsqEJWD/W46u5soZrXkU0gr3ucTfC/aZD
	yFDhcavNKUrlURrOKfxSQUxFEdTnRsKFKB+zra3+G19MQ0kYR/rYK
X-Google-Smtp-Source: AGHT+IH1SJEcOpceiiO4rLIB4JfTPyS+sH7ZYjy9fxFxalB8lQSSHtUJrjHp6J2hYDG1J+VT0NqohA==
X-Received: by 2002:a05:6214:f0a:b0:6fb:17a:c428 with SMTP id 6a1803df08f44-6fb47791754mr316419626d6.16.1750292946380;
        Wed, 18 Jun 2025 17:29:06 -0700 (PDT)
Received: from fauth-a1-smtp.messagingengine.com (fauth-a1-smtp.messagingengine.com. [103.168.172.200])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fd0163b008sm1417106d6.125.2025.06.18.17.29.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 17:29:05 -0700 (PDT)
Received: from phl-compute-01.internal (phl-compute-01.phl.internal [10.202.2.41])
	by mailfauth.phl.internal (Postfix) with ESMTP id 715F81200068;
	Wed, 18 Jun 2025 20:29:05 -0400 (EDT)
Received: from phl-imap-16 ([10.202.2.88])
  by phl-compute-01.internal (MEProxy); Wed, 18 Jun 2025 20:29:05 -0400
X-ME-Sender: <xms:0VlTaCaSz-Ivv1tJaTVQ5wlDECFjBkuk8ZItMp-nK19-rcTj9ychdQ>
    <xme:0VlTaFZ6rQYuMazDL559msAJeSW-qi-jQD5XN5KlWDoy7Ae_MxaNTcctB2yglPp7K
    SoZ0tmD_52IaJslvw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddvgdegtdekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtjeertdertddt
    necuhfhrohhmpedfuehoqhhunhcuhfgvnhhgfdcuoegsohhquhhnrdhfvghnghesghhmrg
    hilhdrtghomheqnecuggftrfgrthhtvghrnhephedufeelfffghefgveejteekvedtleeg
    fedtkedvieekgfffleelkeefhfefhfejnecuvehluhhsthgvrhfuihiivgeptdenucfrrg
    hrrghmpehmrghilhhfrhhomhepsghoqhhunhdomhgvshhmthhprghuthhhphgvrhhsohhn
    rghlihhthidqieelvdeghedtieegqddujeejkeehheehvddqsghoqhhunhdrfhgvnhhgpe
    epghhmrghilhdrtghomhesfhhigihmvgdrnhgrmhgvpdhnsggprhgtphhtthhopedukedp
    mhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepghgrrhihsehgrghrhihguhhordhnvg
    htpdhrtghpthhtoheprghlvgigrdhgrgihnhhorhesghhmrghilhdrtghomhdprhgtphht
    thhopehfuhhjihhtrgdrthhomhhonhhorhhisehgmhgrihhlrdgtohhmpdhrtghpthhtoh
    eprghlihgtvghrhihhlhesghhoohhglhgvrdgtohhmpdhrtghpthhtohepjhhsthhulhht
    iiesghhoohhglhgvrdgtohhmpdhrtghpthhtoheprgdrhhhinhgusghorhhgsehkvghrnh
    gvlhdrohhrghdprhgtphhtthhopegurghkrheskhgvrhhnvghlrdhorhhgpdhrtghpthht
    ohepfhhrvgguvghrihgtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehlohhsshhinh
    eskhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:0VlTaM-ybgaR3ZvXuLWbNDw0NpktjpGb8m35rERCg3GeZRLvWBtXaw>
    <xmx:0VlTaEqIf8_5vv-E1YNXzzj_PFLTZQbVuaSyCsZlQcjAFAbfXJQnPA>
    <xmx:0VlTaNpHO_rTdeNks0W6kXU_06TwgdKVIzBnjPs_BJwZx-nSqVJosA>
    <xmx:0VlTaCQQqpfss2fHIoxUkzjW2B253wCnQm0wv_ytd8jTLFrbdQf4sQ>
    <xmx:0VlTaNrItulI048K9shez1m09NKxBUO4bwyHih2j3qHg_2vPkGm7u2LM>
Feedback-ID: iad51458e:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 4B3FC2CC0081; Wed, 18 Jun 2025 20:29:05 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: T826ff79bc45770a9
Date: Wed, 18 Jun 2025 17:28:45 -0700
From: "Boqun Feng" <boqun.feng@gmail.com>
To: "FUJITA Tomonori" <fujita.tomonori@gmail.com>,
 "Andreas Hindborg" <a.hindborg@kernel.org>, alex.gaynor@gmail.com,
 "Miguel Ojeda" <ojeda@kernel.org>
Cc: "Alice Ryhl" <aliceryhl@google.com>,
 "Anna-Maria Gleixner" <anna-maria@linutronix.de>, bjorn3_gh@protonmail.com,
 "Danilo Krummrich" <dakr@kernel.org>,
 "Frederic Weisbecker" <frederic@kernel.org>, "Gary Guo" <gary@garyguo.net>,
 "John Stultz" <jstultz@google.com>, linux-kernel@vger.kernel.org,
 lossin@kernel.org, "Lyude Paul" <lyude@redhat.com>,
 rust-for-linux@vger.kernel.org, "Stephen Boyd" <sboyd@kernel.org>,
 "Thomas Gleixner" <tglx@linutronix.de>, "Trevor Gross" <tmgross@umich.edu>
Message-Id: <cdb12bc6-2372-43b3-b4e9-a1e31e5f9903@app.fastmail.com>
In-Reply-To: <20250617232806.3950141-1-fujita.tomonori@gmail.com>
References: <20250617232806.3950141-1-fujita.tomonori@gmail.com>
Subject: Re: [PATCH] rust: time: Seal the HrTimerMode trait
Content-Type: text/plain
Content-Transfer-Encoding: 7bit



On Tue, Jun 17, 2025, at 4:28 PM, FUJITA Tomonori wrote:
> Prevent downstream crates or drivers from implementing `HrTimerMode`
> for arbitrary types, which could otherwise leads to unsupported
> behavior.
>
> Introduce a `private::Sealed` trait and implement it for all types
> that implement `HrTimerMode`.
>
> Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>

Reviewed-by: Boqun Feng <boqun.feng@gmail.com>

Thanks!

Regards,
Boqun

> ---
>  rust/kernel/time/hrtimer.rs | 21 ++++++++++++++++++++-
>  1 file changed, 20 insertions(+), 1 deletion(-)
>
> diff --git a/rust/kernel/time/hrtimer.rs b/rust/kernel/time/hrtimer.rs
> index a6468bc50e57..0028720cb4e9 100644
> --- a/rust/kernel/time/hrtimer.rs
> +++ b/rust/kernel/time/hrtimer.rs
> @@ -442,8 +442,27 @@ fn into_nanos(self) -> i64 {
>      }
>  }
> 
> +mod private {
> +    use crate::time::ClockSource;
> +
> +    pub trait Sealed {}
> +
> +    impl<C: ClockSource> Sealed for super::AbsoluteMode<C> {}
> +    impl<C: ClockSource> Sealed for super::RelativeMode<C> {}
> +    impl<C: ClockSource> Sealed for super::AbsolutePinnedMode<C> {}
> +    impl<C: ClockSource> Sealed for super::RelativePinnedMode<C> {}
> +    impl<C: ClockSource> Sealed for super::AbsoluteSoftMode<C> {}
> +    impl<C: ClockSource> Sealed for super::RelativeSoftMode<C> {}
> +    impl<C: ClockSource> Sealed for super::AbsolutePinnedSoftMode<C> {}
> +    impl<C: ClockSource> Sealed for super::RelativePinnedSoftMode<C> {}
> +    impl<C: ClockSource> Sealed for super::AbsoluteHardMode<C> {}
> +    impl<C: ClockSource> Sealed for super::RelativeHardMode<C> {}
> +    impl<C: ClockSource> Sealed for super::AbsolutePinnedHardMode<C> {}
> +    impl<C: ClockSource> Sealed for super::RelativePinnedHardMode<C> {}
> +}
> +
>  /// Operational mode of [`HrTimer`].
> -pub trait HrTimerMode {
> +pub trait HrTimerMode: private::Sealed {
>      /// The C representation of hrtimer mode.
>      const C_MODE: bindings::hrtimer_mode;
> 
>
> base-commit: 994393295c89711531583f6de8f296a30b0d944a
> -- 
> 2.43.0
