Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91C7E217F29;
	Mon, 30 Jun 2025 10:33:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751279604; cv=none; b=TfMvCxzxMqieyknCxQmk9FgbTrXDbknvqizWOVH44mIMDMdCez7c0drrc8ISfLt/ZbHkUTbPMOWHNeS3FH6X1sHC7LVg9ypciHjKx13TVqAHL6SjFL24odblosc3xP+mQ/leiFsiMQ9kjbWcmQmFh18wOPHoElLfboIIRQ2skjo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751279604; c=relaxed/simple;
	bh=uvmm6kOYnnwhxg/iJJSH+MjYnVVzoGmRf3mhxGk/d/I=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=tDpPTv+z2+wIrE54bomZaUTwsFaG/Jy1VxgC6v8aXUA5/gHNcycajQfP6GR6Guv328fwvwPz/W5ACSjxLJNEGmPASYIMjvFBdYQ814lrNCxgGbWRlgGtL+XAPceAfjBLjopLqU4PAOaNLFqg+5dtkppQoXzoocFQ2StxlCLs95A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mEl2V5W7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mEl2V5W7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5282BC4CEE3;
	Mon, 30 Jun 2025 10:33:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751279604;
	bh=uvmm6kOYnnwhxg/iJJSH+MjYnVVzoGmRf3mhxGk/d/I=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=mEl2V5W7bkDwhc6Xn+Kt8nd7ywhb7WqeKQOZd8jDodQoiSQOEoHJJ9IFJapdgtI0F
	 i5mp2svYgy3bfWdp3FrLhbLV3XSzv9qRAaotCdVwGJysH8j/5s+ybBkoNE9Z1p9KsM
	 cOa2Ot8lSEO+kVVM4Ca858qU6Cq6ZN2U/p8rnHmJ32gQc1nLrPltCdCQzWKxkfAbAH
	 eH9eFBGOCb8pxbCBlnBOPm3rYs+oD5VQf+FQS9G/RdFIzOQmpajXkBgf1CL0aBp9Or
	 B7Tckt5UDs5UuSdX0SES+uET0ogM4BUJgP2sCNOlYnaQDHERuhXWMFEezcye9hMHAn
	 JhUfPdPsk9sCg==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: "Danilo Krummrich" <dakr@kernel.org>
Cc: <abdiel.janulgue@gmail.com>,  <daniel.almeida@collabora.com>,
  <robin.murphy@arm.com>,  <ojeda@kernel.org>,  <alex.gaynor@gmail.com>,
  <boqun.feng@gmail.com>,  <gary@garyguo.net>,  <bjorn3_gh@protonmail.com>,
  <lossin@kernel.org>,  <aliceryhl@google.com>,  <tmgross@umich.edu>,
  <acourbot@nvidia.com>,  <rust-for-linux@vger.kernel.org>,
  <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] rust: dma: require mutable reference for as_slice_mut()
 and write()
In-Reply-To: <20250628165120.90149-1-dakr@kernel.org> (Danilo Krummrich's
	message of "Sat, 28 Jun 2025 18:49:54 +0200")
References: <VIEdXN6CCu8vh_24Ew2HvHggO8rA-9Vg6BHi7y6kj3Wh2W-s1If1YITFfHta4MCYR3GQbYhffNc81E0AjI1AUg==@protonmail.internalid>
	<20250628165120.90149-1-dakr@kernel.org>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Mon, 30 Jun 2025 12:33:16 +0200
Message-ID: <8734bhzfgz.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

"Danilo Krummrich" <dakr@kernel.org> writes:

> Given the safety requirements of as_slice_mut() and write() taking an
> immutable reference is technically not incorrect.
>
> However, let's leverage the compiler's capabilities and require a
> mutable reference to ensure exclusive access.
>
> This also fixes a clippy warning introduced with 1.88:
>
>   warning: mutable borrow from immutable input(s)
>      --> rust/kernel/dma.rs:297:78
>       |
>   297 |     pub unsafe fn as_slice_mut(&self, offset: usize, count: usize) -> Result<&mut [T]> {
>       |                                                                              ^^^^^^^^
>
> Fixes: d37a39f607c4 ("rust: dma: add as_slice/write functions for CoherentAllocation")
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>


Reviewed-by: Andreas Hindborg <a.hindborg@kernel.org>


Best regards,
Andreas Hindborg



