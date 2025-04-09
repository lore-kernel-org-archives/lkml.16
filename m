Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CFFB25DAF2;
	Wed,  9 Apr 2025 10:18:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744193889; cv=none; b=jiotmlX0CKtjVfUs/ZSQTApEio7z98XfJ/B5Rj1CUrvPzb7H3J1XXNQ+uG0bA7t9Tww6OozGFPNiQ6lK1U7oKRuyUJYQALM0PYjWv52L/NBa/6oITUCHl9zox7D3xXFnhD1Y7huZkSdJoa+12Koed6Hj0fH500sJcgbkeV9Gaeg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744193889; c=relaxed/simple;
	bh=f+bCIdAzqJR9DhddeAL7a4pbRlb41V0+iBkDqnK4uPw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=pDSSVe9c3ihr1MZbFLNvkf94bNbz1nKgyO1jsu9PXMsyyYE8mFWBDsLkTqeiGbxdsD7qpasWIXklPvIXZkwBXUOK6qZJc7dPnb+yftHGGOlIEN8VGKYcIypI1760RP8IgWebkS71HGz8/z57GJLS/vHTtZk/Qk/wEvoaT0Dx3hI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YXZtnNYh; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YXZtnNYh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04CDFC4CEE3;
	Wed,  9 Apr 2025 10:18:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744193889;
	bh=f+bCIdAzqJR9DhddeAL7a4pbRlb41V0+iBkDqnK4uPw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=YXZtnNYhI0ExO3Xz+2umZoCr8dAntmR65/Pie71QwTkGGcgMTr7lRS3VkaL40b4Y5
	 Og5Sq6uKSlVPqjStKt1HKMs2WfPoiM9Z+/05aKmC4b4FzNtYc9idf9n5Z9NvfHaQ/G
	 VLC23t+ASc2M3jCiIVHQDtFfY4R1J+6IoAO/o+1EsMmlLu3jeFiS5yM+hoKlGR3twB
	 Cl95eeY6YbyjPW5nY9grdpYAtJOv2HeS9fSPdetXrKXlSq4D8aMS0/zoqH9zQ/jb3u
	 MyVxz+W8vJXfVbzhfE8QVNFz6qVaPJnoa+EpgKO2yM166eOU1T7CpPj8eB5V8Jv7YY
	 8hxo4wFpUofDg==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: "Oliver Mangold" <oliver.mangold@pm.me>
Cc: "Miguel Ojeda" <ojeda@kernel.org>,  "Alex Gaynor"
 <alex.gaynor@gmail.com>,  "Boqun Feng" <boqun.feng@gmail.com>,  "Gary Guo"
 <gary@garyguo.net>,  =?utf-8?Q?Bj=C3=B6rn?= Roy Baron
 <bjorn3_gh@protonmail.com>,  "Benno
 Lossin" <benno.lossin@proton.me>,  "Alice Ryhl" <aliceryhl@google.com>,
  "Trevor Gross" <tmgross@umich.edu>,  "Asahi Lina" <lina@asahilina.net>,
  <rust-for-linux@vger.kernel.org>,  <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v9 4/5] rust: kbuild: provide
 `RUSTC_HAS_DO_NOT_RECOMMEND` symbol
In-Reply-To: <20250325-unique-ref-v9-4-e91618c1de26@pm.me> (Oliver Mangold's
	message of "Tue, 25 Mar 2025 11:57:19 +0000")
References: <20250325-unique-ref-v9-0-e91618c1de26@pm.me>
	<XJFS-SfVD4o0dEirvLz4JpaMPMyZ5TOplstLcc8j23SzVy0LIwpjj_RH9mCvK67zffFaUlz2R8agRPAAXltIrQ==@protonmail.internalid>
	<20250325-unique-ref-v9-4-e91618c1de26@pm.me>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Wed, 09 Apr 2025 11:27:49 +0200
Message-ID: <874iyxd6qy.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

"Oliver Mangold" <oliver.mangold@pm.me> writes:

> From: Miguel Ojeda <ojeda@kernel.org>
>
> Rust 1.85.0 (current stable version) stabilized [1]
> `#[diagnostic::do_not_recommend]` [2].
>
> In order to use it across all supported Rust versions, introduce a new
> Kconfig symbol for it.
>
> This allows to perform conditional compilation based on it, e.g. on the
> use site to enable the attribute:
>
>     #[cfg_attr(RUSTC_HAS_DO_NOT_RECOMMEND, diagnostic::do_not_recommend)]
>     impl A for i32 {}
>
> An alternative would have been to `allow` the following warning:
>
>     #![allow(unknown_or_malformed_diagnostic_attributes)]
>
> However, that would lose the checking for typos across all versions,
> which we do not want to lose.
>
> One can also use the Kconfig symbol to allow the warning in older
> compilers instead, to avoid repeating the `cfg_attr` line above in all
> use sites:
>
>     #![cfg_attr(
>         not(RUSTC_HAS_DO_NOT_RECOMMEND),
>         expect(unknown_or_malformed_diagnostic_attributes)
>     )]
>
> That still loses the checking for typos in older versions, but we still
> keep it in newer ones, thus we should still catch mistakes eventually.
>
> In this case we can promote it to `expect` as shown above, so that we do
> not forget to remove these lines if we stop using the attribute somewhere.
>
> Link: https://github.com/rust-lang/rust/pull/132056 [1]
> Link: https://doc.rust-lang.org/reference/attributes/diagnostics.html#the-diagnosticdo_not_recommend-attribute [2]
> Link: https://lore.kernel.org/rust-for-linux/CANiq72mYfhuRWkjomb1vOMMPOaxvdS6qjfVLAwxUw6ecdqyh2A@mail.gmail.com/
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
> Signed-off-by: Oliver Mangold <oliver.mangold@pm.me>


Reviewed-by: Andreas Hindborg <a.hindborg@kernel.org>


Best regards,
Andreas Hindborg


