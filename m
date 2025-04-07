Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E909C254B09;
	Mon,  7 Apr 2025 18:37:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744051050; cv=none; b=N+h0wpOa9pmm8cEv7/tcyqBaptWx6JpXSypCnRDSKLiA1uga7GFKH1HSXOX9cGyUwjcoIVVDJXDOytSrPawTy3DeinNMoHtrRQI8j3hcnteGQftLoEzRlhbH7e3IAujqoPTrX2rVhIbvwXEcrs9ErtQ1u0j+rZemi/Zf5UkaUc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744051050; c=relaxed/simple;
	bh=FGbSI/28Hz9KQ9YaHunwslOCD0Bk1Rfmixa+KYW1cyc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mRUR6EGGs2QYAi+w922fwvRWtvryLMgDLVh+udh2dd+6yfny2v5i4KzBrWRI7FZgQzLfmOfvJjedCaToN3g8OQfcSk/yPHVvVdzQX/ZaqgRrAaJP3VbqSgV+j3gum/zWdSUEQOii2XtbRa+WSCdFc6ADuoekHzgiDVcCoYAwlBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O44ibCw+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O44ibCw+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A0F8C4CEDD;
	Mon,  7 Apr 2025 18:37:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744051049;
	bh=FGbSI/28Hz9KQ9YaHunwslOCD0Bk1Rfmixa+KYW1cyc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=O44ibCw+UBbtuFD9jYF8aBawVsYVga9zL9EdhjmfOJC/QFZgAnXZEf2822hlUWw+h
	 eAaJkPBiU3KntFUG3h2ouJmq/zJA121+As53Va766IvbfYn4Wwi1mxHuemEBi17zzl
	 Iqzm0Fh8G8dGmLt5zklBjbMI8TKv84b3ncZkvnwBD1cec+CdM3ML2DBAyZZxGssHKP
	 8VnqZM0nOmeXEqhvKbuA6xyIRh4s4BTnhM2A9kJs/inebcaBKn6VRriKU4WzHzawPH
	 LYfzWlUFGRkzEy5aqgYXGXaYn3Vko3+ltqq+Jfc0P39cOlomTfFJMAoeoYBF9cFDDx
	 IyvI8+iDqccOg==
From: Miguel Ojeda <ojeda@kernel.org>
To: Christian Schrrefl <chrisi.schrefl@gmail.com>
Cc: naresh.kamboju@linaro.org,
	Russell King <rmk+kernel@armlinux.org.uk>,
	Rudraksha Gupta <guptarud@gmail.com>,
	Alice Ryhl <aliceryhl@google.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	anders.roxell@linaro.org,
	arnd@arndb.de,
	dan.carpenter@linaro.org,
	laura.nao@collabora.com,
	linux-kernel@vger.kernel.org,
	lkft-triage@lists.linaro.org,
	regressions@lists.linux.dev,
	rust-for-linux@vger.kernel.org,
	torvalds@linux-foundation.org
Subject: Re: Build: arm rustgcc unknown argument '-mno-fdpic'
Date: Mon,  7 Apr 2025 20:37:16 +0200
Message-ID: <20250407183716.796891-1-ojeda@kernel.org>
In-Reply-To: <CA+G9fYvOanQBYXKSg7C6EU30k8sTRC0JRPJXYu7wWK51w38QUQ@mail.gmail.com>
References: <CA+G9fYvOanQBYXKSg7C6EU30k8sTRC0JRPJXYu7wWK51w38QUQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Mon, 07 Apr 2025 22:58:02 +0530 Naresh Kamboju <naresh.kamboju@linaro.org> wrote:
>
> Regressions on arm build with config rustgcc-lkftconfig-kselftest on the
> Linux mainline and next failed with CONFIG_RUST=y enabled.

> Bad: next-20250327
> Good: next-20250326

> Unable to generate bindings: clang diagnosed error: error: unknown
> argument: '-mno-fdpic'

I assume this is the arm support, i.e. commit ccb8ce526807 ("ARM: 9441/1:
rust: Enable Rust support for ARMv7").

Clang does not seem to support `-mno-fdpic`, thus you probably need to add it to
`bindgen_skip_c_flags` in `rust/Makefile` so that it gets skipped when the C
compiler is GCC.

If you do so, please double-check if the flag could potentially alter the ABI in
a way that `bindgen` would generate the wrong bindings.

I hope that helps!

Cheers,
Miguel
