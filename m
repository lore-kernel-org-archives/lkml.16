Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5AE2292B5F;
	Tue, 17 Jun 2025 10:39:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750156747; cv=none; b=G9pkla1qpmVXKIvdhvCguwRTHPZ2pzbHXcOudaiTlCgD5KrasewIdJvN8KfCsqWqyx0ORDD8x2K6wRHBECepiOiF8bSflXDwE1Hbs8TfSK9xu3K/s1Ki8nzUrGw9lEnVntpOwxomBCp4MXvwipQzKSZlMCfq6Su20hQiLj1lA/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750156747; c=relaxed/simple;
	bh=5yPJNBmfdXvAOE/rAPylW6t0NlGPk7YDdIznpDZVewQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=SutfdjYT6ZuWeXKGf443lNN3IDSI/TxBo8COj7DUvogzeMXyKq26ybVlwXHcG+2KhD37dnDKjUj45UjT3gUrDFvSUq2xjzf69K0Gj7kNq3BuFC2RO5K+jqkvQuitE2Do2PujP5YULbMI4XdotuFRU2btdkqs9rFQ3fMZg8u+vDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FcQ1R1Tn; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FcQ1R1Tn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33FE6C4CEE3;
	Tue, 17 Jun 2025 10:39:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750156747;
	bh=5yPJNBmfdXvAOE/rAPylW6t0NlGPk7YDdIznpDZVewQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=FcQ1R1TnuPjK/UMLz/v5VhBYk9Dcb0+VI+PGR/OpnHG/z9kNgS70fMFx2P01Vlk0b
	 To01bZs48vyQo+jCwT4LiHaKw3uIlN8uo/wfGY64ZuL2d6KuP/fV8Vc6UvIUd5EnL1
	 68LpZIMbFOlcEHQnVXS9N+95WhTVqwlTemiiLATNmjTS9HI98VD3NfCp5NKMBGRQqY
	 Sx9p5vrg+1LKAiKN0w+sSrWWybV4mQA9nyBPEJXOnTT1h6TL9VasntdrJ9JDp1nGhJ
	 E7o5HHtsSbek1hBJPgxeiW+Mkvm+HXokiyBe8BUUBEa5juUQFnZktv3FV4OTR9g8r2
	 Vwq84717DRcJA==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: alex.gaynor@gmail.com, ojeda@kernel.org, 
 FUJITA Tomonori <fujita.tomonori@gmail.com>
Cc: aliceryhl@google.com, anna-maria@linutronix.de, 
 bjorn3_gh@protonmail.com, boqun.feng@gmail.com, dakr@kernel.org, 
 frederic@kernel.org, gary@garyguo.net, jstultz@google.com, 
 linux-kernel@vger.kernel.org, lossin@kernel.org, lyude@redhat.com, 
 rust-for-linux@vger.kernel.org, sboyd@kernel.org, tglx@linutronix.de, 
 tmgross@umich.edu
In-Reply-To: <20250610093258.3435874-1-fujita.tomonori@gmail.com>
References: <20250610093258.3435874-1-fujita.tomonori@gmail.com>
Subject: Re: [PATCH v4 0/3] rust: time: Introduce typed clock sources and
 generalize Instant
Message-Id: <175015666836.277659.13544106248408491638.b4-ty@kernel.org>
Date: Tue, 17 Jun 2025 12:37:48 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2


On Tue, 10 Jun 2025 18:32:53 +0900, FUJITA Tomonori wrote:
> This patch series introduces a type-safe abstraction over clock
> sources. The goal is to remove the need for runtime clock selection
> (via ClockId) and instead leverage Rust's type system to statically
> associate the Instant type with a specific clock.
> 
> This approach enables compile-time enforcement of clock correctness
> across the APIs of Instant type.
> 
> [...]

Applied, thanks!

[1/3] rust: time: Replace ClockId enum with ClockSource trait
      commit: 1664a671be46a0b0daf5250eb124d94a5501a64c
[2/3] rust: time: Make Instant generic over ClockSource
      commit: 768dfbfc98e26cfad45f7165a1801d188f3cbd81
[3/3] rust: time: Add ktime_get() to ClockSource trait
      commit: cc6d1098b4cca6ec8e659de8361457c59a90b583

Best regards,
-- 
Andreas Hindborg <a.hindborg@kernel.org>


