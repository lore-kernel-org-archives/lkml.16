Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91A3B45BE3
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 06:01:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745474519; cv=none; b=k+MQR/wH4kKaoYGjCbQdSbzo/NMRmEVWz7nQLdWd7aLX9DsC2QNQC7Lb4VQZWMQLuPgR5HUL0fHNMJdWHkqhqRSG0CxHeY6r8nKokfd6O7mmCg8mIOewfmiV3GTClpac9zwuJbwjDXuzLjCNqrj+acaC1mnyFf2MxeGCt8owouE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745474519; c=relaxed/simple;
	bh=Z6mlm1vaiSd8DkRsHlERytRx9CV4SLqbuOmSjuJ/xNw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h4obXSq+l2akL6pUc+wN4pKKtLZD4PzDK9udzRa1H0w2Cc0YyLSP2/FSWBVsdyMOUOu12atcRcmvng5TiZ0b9Nm5oFabbe74OaaB20ew/rQoQJ7FPbReh701GDdjck2m3R1DL7qiG3nRw8yYtVnbkfcID2/3TPYdGymhQZUv614=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YvVTv8SI; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YvVTv8SI"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-739b3fe7ce8so556652b3a.0
        for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 23:01:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745474516; x=1746079316; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ItVzBTSerAAYDc2jtmllBIZUTwNzEBk5YDQRurUUd5o=;
        b=YvVTv8SIm/1ziikgPqOLmgvOOGO1SmfsO0yH2y9W/MobGSKdWIRQvTjyBckrmZaZBA
         23jVRF+rlKM7WIg7fTHeNaG7NlPKOZJ1lprvcz10MrSoyvoSN0nCmoB3Tt00w4kDJN4r
         Yf04VxktpC4gnVRqRHgeD/GHDTydV0DYk1ZWE3LkpMilt6JCiB7SUB9oBfG0dz2q2lsL
         7QbKgv9Cccz1PRngy7P5ozQQ59RB2k+4iVqcM54OxW9UEbN6Lz8BaS5j7dmhc9uwe2Bx
         ky0gTyM4LjyRLfOYEvso4OiQnGc3vyj+oqJuOWgMWv0VUcF6pApnKSGMn/PnxBScYUE+
         E5IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745474516; x=1746079316;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ItVzBTSerAAYDc2jtmllBIZUTwNzEBk5YDQRurUUd5o=;
        b=P8mSW6pbIIpgfuLpmyHCgXh8Cxy3g9V/ZweOVPHJW5+KLOvhMDsC7KL7LbWkwnpajp
         vyIP/C5yaNKyN66MZa7InpIVFRQ/XtSQ8FS0yZWePOEMro/RwUu/WZpRj3wOLoeWiQ87
         /G3haKhvVjm6CACPLc/jhnhaXz8kxMiryhpr0K2VCECxmA2iiBBIpv7/zfy/3SVu2qA3
         j2Dd+mC6w3PU0A8PvfHoVlUeYhtCXqi5A0rqAk6HII0gR40JJ0f/VuFWsXjCfK2kwp2h
         sZ4Pv3Rxnoq1UrwvPy/KXJgWTQOP/AuTQeuU25qDxvzm8jL8NKwcqfb3vcfM4SlgYPj0
         rrFg==
X-Forwarded-Encrypted: i=1; AJvYcCUFoY/XvvaubdhTSoIp5n+rkB9ydNhhWvk5jCyrjcWyt2UkY7gmW41gzxpcl7z3Y0PnTgq6gl5rL6pQhFc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzjxzDmM6gNX1iVQwhkiH5VMLdNuSY35jUdmPTXpEEn9ZGDr/td
	ab2x3zAQDwquxikVXMseNmMKU5EJdx0T7TBSzcC/MEJ/oUkv9RsfIyVxyxooGD8=
X-Gm-Gg: ASbGncsVY2/RuzmNI50JckUiH5WoOCz7KuziTGp0EoYwKT+qxBSCuVslwWPOquAHASz
	rbXsQXOpBP5WdxRWEMjwKAeO0OvhhcBxn5V+HpowslOrzu3Cg57JpwiIG8GIV7UOh3cjqfp2R6F
	oJo6BPrpEaCZeI/Vh5HLkaWOxbHNa2mB0AjPEs2MmpsjUotk1Yit371AAanLG3JTJXzSyhA87rq
	0iWpIb/g7XPxlOxBAwRbbECHDvfgWq21MgXzhFLrIRNFQpOgKCWtutDOGKwHZi3IrC0cTl5Ehpp
	0Z9x9/MwvcxYd27YBMVWTbj7G/I4USMCjYRMjUGqSQ==
X-Google-Smtp-Source: AGHT+IHpb+KQKs+bCW6EMMLRqMG+2nRuFK3vtw1oUdYl0ZcihCBk4ttWoQ5lM8jVKKGTONgQMih/FQ==
X-Received: by 2002:a05:6a00:ac86:b0:73c:3060:d53 with SMTP id d2e1a72fcca58-73e24ac977amr1991976b3a.18.1745474515750;
        Wed, 23 Apr 2025 23:01:55 -0700 (PDT)
Received: from localhost ([122.172.83.32])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73e259412b2sm603446b3a.66.2025.04.23.23.01.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 23:01:55 -0700 (PDT)
Date: Thu, 24 Apr 2025 11:31:52 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Danilo Krummrich <dakr@kernel.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
	Danilo Krummrich <dakr@redhat.com>, Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	linux-pm@vger.kernel.org,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Stephen Boyd <sboyd@kernel.org>, Nishanth Menon <nm@ti.com>,
	rust-for-linux@vger.kernel.org,
	Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
	Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Joakim Bech <joakim.bech@linaro.org>, Rob Herring <robh@kernel.org>,
	Yury Norov <yury.norov@gmail.com>, Burak Emir <bqe@google.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Russell King <linux@armlinux.org.uk>, linux-clk@vger.kernel.org,
	Michael Turquette <mturquette@baylibre.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH V11 13/15] rust: cpufreq: Extend abstractions for driver
 registration
Message-ID: <20250424060152.gsrdz3fonnnpn4oz@vireshk-i7>
References: <cover.1745218975.git.viresh.kumar@linaro.org>
 <a14f6927488b5c7d15930c37a3069f46a5c888a2.1745218976.git.viresh.kumar@linaro.org>
 <975c8346-dddc-44ef-ab24-71cadfbce23a@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <975c8346-dddc-44ef-ab24-71cadfbce23a@kernel.org>

On 23-04-25, 14:05, Danilo Krummrich wrote:
> On 4/21/25 9:22 AM, Viresh Kumar wrote:
> > +    /// Registers a CPU frequency driver with the cpufreq core.
> > +    pub fn new() -> Result<Self> {
> > +        // We can't use `&Self::VTABLE` directly because the cpufreq core modifies some fields in
> > +        // the C `struct cpufreq_driver`, which requires a mutable reference.
> > +        let mut drv = KBox::new(UnsafeCell::new(Self::VTABLE), GFP_KERNEL)?;
> 
> Maybe add a comment that it would be desired to make a struct cpufreq_driver
> capable of being declared as static const in the future.

Is it really the case ? I am not sure if that's how the C code sees
these structures.

Most of the driver structures (platform, etc) contain `struct
device_driver`, which is mostly modified from the bus layer when the
driver is registered, and so it can't be a `const`. Apart from that
too, the drivers many sometimes carry flags.

File operations (with just callbacks) can be `const` though.

> Either way,
> 
> 	Reviewed-by: Danilo Krummrich <dakr@kernel.org>

Thanks a lot Danilo.

-- 
viresh
