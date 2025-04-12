Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A15172367DB;
	Sat, 12 Apr 2025 14:53:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744469592; cv=none; b=T6NbRc2PZ0pf7Kdw5NfmFkxq3Udg/N++MK8ZXE53F984q+FcXQUdbMEAZO+vxGNKJWRzefkJd+9q5KTEHQN5qAMBX3m5ReODzIwbxh07QBfgTwzHfa5MnI1YE92mC57xO0YUpId6zMBctxp0RaCTCHqVKtX8hMIqhoDPStPO5i0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744469592; c=relaxed/simple;
	bh=KJvcw7s62BQZZ771kg+Ctzm2F1K76QG8aFGD8mzaXcA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bOOrLg9RlwZcbbfu4TX47Og++AmmRPeTj2Jb06m5+PgLH7jSqhuXgXVAVnElKgL4dDI43jizIRgbleW0vW26h2jwMPOuL6SLDicMF8hU0PlgYI3OYtxD9f3DNRc7QAZFCLrOxbG7HTyIYBd6vnGXDEHdyb/Ieuzl96teHJhQGlM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oXGVIS0a; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oXGVIS0a"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6EF5C4CEE3;
	Sat, 12 Apr 2025 14:53:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744469591;
	bh=KJvcw7s62BQZZ771kg+Ctzm2F1K76QG8aFGD8mzaXcA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oXGVIS0anaXjEGffYf8Pc+BRPOqx0HrI9xpsQ8+d1a+3o094GYoZ/zFyCU0M5RbJm
	 hyIhlmeqjJbZCQ+T7R5A8oxz8Up62wEUM8NA96ovxhH7pTG435xNmQbiHOE6mKgO3A
	 QlEdT3YCVPawU9zbwhmHWB7lxX56aRAPmVBlrFhtpVcHsDd58pInOSrvgx2SSbioc9
	 nDm0Y5k10E74GhIL60Zk7Ekq3MpVv84p9xDM4CGIhweUYE/GPOY86L21ECNZt3O5Df
	 K49hBW0ey/FVV6/3KNMhlEYzQn8RzLNEsj72mL6IAbyFvrPYK0nxDgSzugsQaQoZ3Q
	 nywZdWdrUtTsA==
Date: Sat, 12 Apr 2025 16:53:06 +0200
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
Message-ID: <Z_p-UoycGk3BceXm@pollux>
References: <20250412-rust_arm_fix_fw_abstaction-v2-1-8e6fdf093d71@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250412-rust_arm_fix_fw_abstaction-v2-1-8e6fdf093d71@gmail.com>

On Sat, Apr 12, 2025 at 12:29:48PM +0200, Christian Schrefl wrote:
> The `FwFunc` struct contains an function with a char pointer argument,
> for which a `*const u8` pointer was used. This is not really the
> "propper" type for this, so use a `*const kernel::ffi::c_char` pointer
> instad.
> 
> This has no real functionality changes, since `kernel::ffi::c_char` is
> a type alias to `u8` anyways.
> 
> This used to cause problems on 6.13 when building for 32 bit arm (with
> my patches), since rust mapped c_char to i8 instead.

Now that I read this again:

Isn't it the other way around? For arm32 c_char was mapped to u8, but FwFunc
expected i8 (since that's what c_char was mapped to for all other architectures
that are supported in v6.13).

Can you please clarify this in the commit message?
