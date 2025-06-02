Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60FA619FA92;
	Mon,  2 Jun 2025 12:41:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748868118; cv=none; b=dmm7WAgmjul03gjAMP3flsePZNmHOyznu20ALIBed7nJGcTf6lwoEsLf11ccyYKeQQulavw0ZpTByJJhnIjsj3e9nJhQgkJPnQvHlzzj3Y+N6ikoNW8iuxsP/+MfgkiD4B2BMyxo3ZWIv59kHei5kPrRt+hGDno8GdXRdwKGBUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748868118; c=relaxed/simple;
	bh=sgxfGAZf2g1JFLcnPZyqLXLDnCCXX2Nzl8Ky3k+/JWU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=S/hos3U7kDxRVgCK+njXyo+dJ6Wk9nE1Gn7JM4kXbauU/weTMXlxklYUOqesSukTF14edePivT0Jn10a/SXA1fDB1D/lGYJrJOmMVLlTsd7M2wE8VOhstHxKZUu31GgA38hVjg2TcmOvjU/3lggPGaSKjljK/8MyMo7AdB/jIq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WLVW9s0i; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WLVW9s0i"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55F15C4CEED;
	Mon,  2 Jun 2025 12:41:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748868117;
	bh=sgxfGAZf2g1JFLcnPZyqLXLDnCCXX2Nzl8Ky3k+/JWU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=WLVW9s0i1QotaDaSi91lIrt+hGpTX4i2Hh+zprk3w/SXEjRgns86QN7bxy6jlr+Nv
	 3vrq/GGCfkZ6HI3eOEMms7nTas/o7Qyj0GB1KUIskswDVVzGPcr/2E5Q5Zks/IkYfO
	 ZFe4TVcjrcJhHfrmXjCZm8GPyIcPh50PkzKbpUqU7izsF3P1bXF/wsnwqVQiLiYjAa
	 lQHU3Hm34pEsEhtvUe2zJ5IWtrWOIF42FPfjI2pdJdZqAxoNuclWMbxyyNDjCiomCR
	 Au5rTmCEn5n5duzSeLaYaRLo45BnnmnIco8Ip3tffhCyxZsaFAgl+ADHh0p+KiYVXh
	 ySN93UKzQ213Q==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: "FUJITA Tomonori" <fujita.tomonori@gmail.com>
Cc: <rust-for-linux@vger.kernel.org>,  <boqun.feng@gmail.com>,
  <frederic@kernel.org>,  <lyude@redhat.com>,  <tglx@linutronix.de>,
  <anna-maria@linutronix.de>,  <jstultz@google.com>,  <sboyd@kernel.org>,
  <ojeda@kernel.org>,  <alex.gaynor@gmail.com>,  <gary@garyguo.net>,
  <bjorn3_gh@protonmail.com>,  <benno.lossin@proton.me>,
  <aliceryhl@google.com>,  <tmgross@umich.edu>,  <dakr@kernel.org>,
  <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v1 5/5] rust: time: Remove Ktime in hrtimer
In-Reply-To: <20250504045959.238068-6-fujita.tomonori@gmail.com> (FUJITA
	Tomonori's message of "Sun, 04 May 2025 13:59:58 +0900")
References: <20250504045959.238068-1-fujita.tomonori@gmail.com>
	<ho-bQm911GM-oup9JOH_9gUxM7yLMGLfqiKsmagDZ1_ZOLC0RgwOet4aKUZIv6-87L0gTCaQ3aoqj1KZz0Kilw==@protonmail.internalid>
	<20250504045959.238068-6-fujita.tomonori@gmail.com>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Mon, 02 Jun 2025 14:41:47 +0200
Message-ID: <871ps271tg.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

"FUJITA Tomonori" <fujita.tomonori@gmail.com> writes:

> Remove the use of `Ktime` from the hrtimer code, which was originally
> introduced as a temporary workaround. The hrtimer has now been fully
> converted to use the `Instant` and `Delta` types instead.
>
> Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>

Reviewed-by: Andreas Hindborg <a.hindborg@kernel.org>


Best regards,
Andreas Hindborg


