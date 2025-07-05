Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7D6A2AD00;
	Sat,  5 Jul 2025 15:13:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751728416; cv=none; b=K1rxREvCJMUOqVpsPKP80vxENYp3u0/BCDEipbHSUy6Xf2ZrOsFWtbWl02Dr+uav2UH6szgRv42g6WU0QKfENknWh893zwxpQjaxbKXf40dkCZkvstVsLOQjCl23ZeAfdHL+EdfwfUdivBfOjnjitTywO28OqpIf50m78hW6M7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751728416; c=relaxed/simple;
	bh=pbYc899ugfS+3JQFPEpK/eeKMAYdzT6GkuQcpM03RUE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WingRFoBVwPaHmuXRgOU/EJLW7CSRrVQBH/SAJ1xsOrSus9Vt2/pHWrIWlM4gKA6hf9n3gCrXs5lCMe6EBliAUU7a99WrHh7I1l2CIal9mb5TmG774QgiJqAqBeA46vfEsiZMzUW5qI45XdEd8HIWWB5Hqlj+KXYpRJaD+PMs4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ofFU0t0I; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ofFU0t0I"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD22EC4CEE7;
	Sat,  5 Jul 2025 15:13:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751728416;
	bh=pbYc899ugfS+3JQFPEpK/eeKMAYdzT6GkuQcpM03RUE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ofFU0t0IR4m48VVue/vFF+ulb++KqyfJqRY8ycS6BlUPSp5KsbSqHOVNuIgG4AHdK
	 U7BlsV3nI4+JUppwoluVker/R18iEtTBpLqxQfkQ4npBrP55W+Miv2vzbv6cLPSqIs
	 Y0jXeLR90BUfSAOC4rubsqAmmBJA2roRbtHf7UU6bUaQP/XySGIjYUVBDrtTTd/V9N
	 HVgvdrVbcMDGQyETU547dwjhEP77aEvHGoj0h25axhzUyWImV58zYLfoaL8Zdm3Jre
	 Bdx9nlqC1LsHaBIr/TyOROb64+wm088hrcncc2LfVHhAVAXXQUBO5iWvbcgSCk3lZi
	 ZcEvitHYDYEGA==
Date: Sat, 5 Jul 2025 17:13:30 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: Tamir Duberstein <tamird@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dave Ertman <david.m.ertman@intel.com>,
	Ira Weiny <ira.weiny@intel.com>, Leon Romanovsky <leon@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] rust: auxiliary: remove unnecessary import
Message-ID: <aGlBGqIMmDUYdWn9@cassiopeiae>
References: <20250704-cstr-include-aux-v1-1-e1a404ae92ac@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250704-cstr-include-aux-v1-1-e1a404ae92ac@gmail.com>

On Fri, Jul 04, 2025 at 03:50:44PM -0400, Tamir Duberstein wrote:
> `kernel::str::CStr` is included in the prelude.
> 
> Signed-off-by: Tamir Duberstein <tamird@gmail.com>

Applied to driver-core-testing, thanks!
