Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B0173FB0E;
	Mon,  2 Jun 2025 09:39:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748857182; cv=none; b=mZX7fxm5HCvyWvoA5yeuRyaDZauOSbJ4DSilO20LZOPC1stVPdJcZwAmP8d4VKKnawhbT/AWm4mryiYzVWNwniseJZCNlHVjrr/26YC48alDo0G8Ab3Vn0DoH9mFj4u7nywUallvomNQWirtHDQ+1aDUSwCW4D3VlY2wjN8rba8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748857182; c=relaxed/simple;
	bh=EpczvPljsIHCCSerQ8PlUVESAr97xCCeUPVmwWEVuko=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ibCB9TNNZh3x11OiOCPnswDWh8I8nSKbrE8IzpbkTLEOovvbz6xFptmlcAr9xx+PtLbmViIygXDus4/Z6TkO1LwvYCBlmTN54rMYPauY4mQ1gwdxfZC1UwByfY8R55w4OMyjJoQB41finvBI7z7us8MfJy698U41i3wIufJwaFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ODV/5L/u; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ODV/5L/u"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11A7BC4CEEB;
	Mon,  2 Jun 2025 09:39:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748857182;
	bh=EpczvPljsIHCCSerQ8PlUVESAr97xCCeUPVmwWEVuko=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ODV/5L/uN51j4TwraKZ3BycfSVRlESswLej+FDW09tuaWtYSdO6nPVR1qDSq0BnVj
	 m/zXMgoP3AvYZabDO/9Yzp75n+qMBFO8JjLT8ZaMoLwTGZK2iZngAol/tbpaQZR2NK
	 FlzG72XCHoT3DNr9I3f2g5rHrZUPxMBZQ0CFytRtiYBiNM1zhxKEgtYb64G7gL+XcB
	 WPv+8YHjq3Qr2RyDfyBr3XZ4rvFCLIMju6+Red0wHTf/Cr5EPi7gx2FqlBASui+Mn3
	 +k1lyYd9cBaod5t0GFMU19xY/qkf0zyla2RkR4EUpufwgn+mbEXCrJ7dtHTtuXNiXk
	 I0GolDOu0P+7w==
Date: Mon, 2 Jun 2025 11:39:34 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: Benno Lossin <lossin@kernel.org>
Cc: Alexandre Courbot <acourbot@nvidia.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	John Hubbard <jhubbard@nvidia.com>, Ben Skeggs <bskeggs@nvidia.com>,
	Joel Fernandes <joelagnelf@nvidia.com>,
	Timur Tabi <ttabi@nvidia.com>, Alistair Popple <apopple@nvidia.com>,
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
	nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v4 04/20] rust: add new `num` module with useful integer
 operations
Message-ID: <aD1xVkggDrCvA7ve@pollux>
References: <20250521-nova-frts-v4-0-05dfd4f39479@nvidia.com>
 <20250521-nova-frts-v4-4-05dfd4f39479@nvidia.com>
 <DA82KFLNAOG7.R7YT4BHCLNZQ@kernel.org>
 <DA88YHU4AZT7.B8JGZHW9P9L9@nvidia.com>
 <DA8GTD7LT7KO.1A3LBQGEQTCEW@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DA8GTD7LT7KO.1A3LBQGEQTCEW@kernel.org>

On Thu, May 29, 2025 at 09:27:33AM +0200, Benno Lossin wrote:
> That's also fair, but we lose the constness of `next_multiple_of`, so
> you can't use `align_up` in a const function. That might confuse people
> and then they write their own const helper function... I'd prefer we use
> all functions that are available in the stdlib.

Considering that, what's the suggestion for this trait?

I don't think we should have a trait with align_down() and fls() only and
otherwise use next_multiple_of(), i.e. mix things up.

I think we should either align with the Rust nomenclature - whatever this means
for fls() - or implement the trait with all three methods.
