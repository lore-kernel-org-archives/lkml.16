Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E379D1B4F1F;
	Mon, 30 Jun 2025 12:07:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751285271; cv=none; b=uAk+S19nWQbdcemn4OQ1FOoUDtiolwlT6MOaccrpqOLRIqgZOqh3FDNNl6nziS1RpUgs7yL9o4xOuptkOgdHgifC+pB7RBO5bxU/ub/rQkphvPQA9xJUKELiCdLcF/3GxZ2Yk0xy8nTFjprmhkxAAXxL33FUE/Mt82vZDUDovMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751285271; c=relaxed/simple;
	bh=K6sDj8Y3Id8aGk55FOquNgDdQNjc/xmBJbe4VS+6ADU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=CNSM3g9FaPeFJsVLCI2/0TgYXoseBBFEfzWFICMu1+co9k4Yp7ZcGPke0d6R1oK4WLVVldbpqrcxoyDzn5OsmHPMz0Sz08hws6Erh9u6efd9YT+LXF9n8HBzP7m0iAkRqeqeAaR2Stw9sEioSCkYw/BvtvGNHwL0T1jfcGYnUAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uiJPCBxN; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uiJPCBxN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D5B6C4CEE3;
	Mon, 30 Jun 2025 12:07:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751285270;
	bh=K6sDj8Y3Id8aGk55FOquNgDdQNjc/xmBJbe4VS+6ADU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=uiJPCBxNTtTsU5sR7PxgNVMAC2o09n+Cd4UwiIIWUztvh8fsdJsxX2Ur03b4LTMo8
	 0+DmHRm4AoV4PAHJaqZE7rWN90NjWNTRaphGKily+0ZZ7nFWHq39Evc34ynOCueRN9
	 skUFu1b0cW02VQyLMUuWWZ6sWGAdPI9KtL5cS0ZVWFfkRDBkk+6+kprz/klPu1XgMD
	 ICqmGMjjBbyFdM2/DJFbU7t9yG2QFNhghFi81N+JlmBNfEzCNSAZiHA0eT4b7sQNoZ
	 BaIl5TBs9mR00WcTOlApAuL+nxdHyD54+KroZ1lHyW+vRpvhBzevwwijJfNRQObwUW
	 ipa5oOSI8UHjQ==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: alex.gaynor@gmail.com, ojeda@kernel.org, 
 FUJITA Tomonori <fujita.tomonori@gmail.com>
Cc: aliceryhl@google.com, anna-maria@linutronix.de, 
 bjorn3_gh@protonmail.com, boqun.feng@gmail.com, dakr@kernel.org, 
 frederic@kernel.org, gary@garyguo.net, jstultz@google.com, 
 linux-kernel@vger.kernel.org, lossin@kernel.org, lyude@redhat.com, 
 rust-for-linux@vger.kernel.org, sboyd@kernel.org, tglx@linutronix.de, 
 tmgross@umich.edu
In-Reply-To: <20250617232806.3950141-1-fujita.tomonori@gmail.com>
References: <20250617232806.3950141-1-fujita.tomonori@gmail.com>
Subject: Re: [PATCH] rust: time: Seal the HrTimerMode trait
Message-Id: <175128525177.98300.14448740434083814902.b4-ty@kernel.org>
Date: Mon, 30 Jun 2025 14:07:31 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2


On Wed, 18 Jun 2025 08:28:06 +0900, FUJITA Tomonori wrote:
> Prevent downstream crates or drivers from implementing `HrTimerMode`
> for arbitrary types, which could otherwise leads to unsupported
> behavior.
> 
> Introduce a `private::Sealed` trait and implement it for all types
> that implement `HrTimerMode`.
> 
> [...]

Applied, thanks!

[1/1] rust: time: Seal the HrTimerMode trait
      commit: fc38b7ff879683669bd9ff5dc7e7b6aeeb07bf2a

Best regards,
-- 
Andreas Hindborg <a.hindborg@kernel.org>


