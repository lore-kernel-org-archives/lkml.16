Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53A7C194AC7;
	Sun, 13 Apr 2025 10:44:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744541080; cv=none; b=UpQeCu1kZXSKF0cX3Ur0S1WmskVd9AUyTGSKfm3AoKGASFpWGPBnPyc6ts0biRPeEhlydBNXwJ4OW/paiBDOaXMZvXds0e6iNefupU6Oqv+lzt7F86szCRM+U65q3OcTw/E5RW7pxUUuH9ZKiHd2OOmqWO3Spt11/hZ3LeNFgNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744541080; c=relaxed/simple;
	bh=b6dUActv/Ds9GlhYnYoOangXitEGt+tdrDfo1xWrlPk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IrvNm4R348lD5DJFPfbaNuv7XlCLH3S6iAQjznTMPB3v6v2xoNkZfZdsYk7uczjSUglbM5hUiHijnbL8XEBpM+MbjiEGiEla66QmJ1lluU6XHK0DDT8K9sClPdZ3nSvw0kHIwtqUdfvR8Ot9Jla0oNrdXXm6QNMMgFApflQVieA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rTry4dHB; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rTry4dHB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5751C4CEDD;
	Sun, 13 Apr 2025 10:44:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744541079;
	bh=b6dUActv/Ds9GlhYnYoOangXitEGt+tdrDfo1xWrlPk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rTry4dHBtM3F9aJFhH9iI335BlFKgDciIpSgdr8dYvnovfOnOoDq2grExTEXUh2l/
	 uZ6Yimxjk4Wc8RDNEq0xd+Tlh4F0IDVyD+OTu+OssP7nZWtGGLGVNfRFcbmacHtXqf
	 Totaocy8jNWXSzDPDfanwd5HNjvDJQwo8l/mFpcO+j2aixeoiQBHpkYovBULZZrjOV
	 B1r7FB1ymJmI3IInJWxgYhd77SuQ2pI+IJdZsoyitSodYIBMF6mZuYdHliTnzW9UA2
	 Qo5G+PgUVbZBpCHvUVIZYowYHMVAvr0H7v4XzkAtqsmRRrLoNZCoBsDnEvaavNF+0g
	 vn3a209eXHWbg==
Date: Sun, 13 Apr 2025 12:44:34 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: Christian Schrefl <chrisi.schrefl@gmail.com>
Cc: Luis Chamberlain <mcgrof@kernel.org>,
	Russ Weight <russ.weight@linux.dev>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v2] rust: Use `ffi::c_char` type in firmware abstraction
 `FwFunc`
Message-ID: <Z_uVklEntNZF7ONX@pollux>
References: <20250412-rust_arm_fix_fw_abstaction-v2-1-8e6fdf093d71@gmail.com>
 <Z_p-UoycGk3BceXm@pollux>
 <c04d3ec9-46f8-4ccd-b0ed-52a1adea11b7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c04d3ec9-46f8-4ccd-b0ed-52a1adea11b7@gmail.com>

On Sun, Apr 13, 2025 at 10:55:35AM +0200, Christian Schrefl wrote:
> On 12.04.25 4:53 PM, Danilo Krummrich wrote:
> > On Sat, Apr 12, 2025 at 12:29:48PM +0200, Christian Schrefl wrote:
> >> The `FwFunc` struct contains an function with a char pointer argument,
> >> for which a `*const u8` pointer was used. This is not really the
> >> "propper" type for this, so use a `*const kernel::ffi::c_char` pointer
> >> instad.
> >>
> >> This has no real functionality changes, since `kernel::ffi::c_char` is
> >> a type alias to `u8` anyways.
> >>
> >> This used to cause problems on 6.13 when building for 32 bit arm (with
> >> my patches), since rust mapped c_char to i8 instead.
> > 
> > Now that I read this again:
> > 
> > Isn't it the other way around? For arm32 c_char was mapped to u8, but FwFunc
> > expected i8 (since that's what c_char was mapped to for all other architectures
> > that are supported in v6.13).
> > 
> > Can you please clarify this in the commit message?
> 
> Ah sorry I got confused because by the change in 1bae8729e50a ("rust: 
> map `long` to `isize` and `char` to `u8`").
> 
> How about changing that section to:
> ....
> This has no real functionality changes, since now `kernel::ffi::c_char` 
> is now a type alias to `u8` anyways, but before commit 1bae8729e50a ("rust: 
> map `long` to `isize` and `char` to `u8`") the concrete type of 
> `core::ffi::c_char` depended on the architecture (However all 
> supported architectures at the time mapped to `i8`).
> 
> This causes problems on v6.13 when building for 32 bit arm (with my 
> patches), since back then `*const u8` was used in the function argument 

I'd put slightly more emphasis on the fact that there's no problem in v6.13
without addition your additional patches to introduce 32 bit arm support.

Otherwise, sounds good!

Thanks,
Danilo
