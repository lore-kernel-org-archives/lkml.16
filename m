Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BF0E28F939;
	Tue, 22 Apr 2025 15:37:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745336257; cv=none; b=Tuzp2Z1YqD+dkdLOnbE8HLP+zYCjagS3cuYOWM/C5ZFt6mtis+Wszzht/lAT+7UjTSYrvm+CileCccPtuVitX4URK8i1HxZ4ookDsoHglp4yZa/wV68cqXfUbZGynwEH3I0+b3B01ruhP/kCC4wS//IaiinoOkIHWoJyRG4XQWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745336257; c=relaxed/simple;
	bh=Jw42RzPTFH1JXQNle4D+HMuCHvBjjQsEcqF8GaNCQ+Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fbPcCY/s+EVhRSP6/VjSqHj1cn6I8fOvIp+PV9PNEleY1dE/A8zoW8VJcbs4rc4zOdcB10rWTV1KrcpvilrYS9MrgPK1HMt5rAXvwDecl4SDjieDxvOjJ8arkt0WOT5RR1syp+iNTwT7WAWzFMYCbUOmqd/ArBkRNcaTn3fGGqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=elv0NarH; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="elv0NarH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A3D4C4CEE9;
	Tue, 22 Apr 2025 15:37:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745336256;
	bh=Jw42RzPTFH1JXQNle4D+HMuCHvBjjQsEcqF8GaNCQ+Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=elv0NarH2n/lq8UrYUtfHAlnPf/1/3aBSPh+fAApFr3vHAJBaMeEaCOxedR7X/eHA
	 0O1Hp2gsWiNi6sOI1WpYiBrepayRN645FUwnridGqWldpYqc/VpUTyaUrQf4iPZiC9
	 ivQwg2KLIEre4q0vhgfCQUu0UZhLoay4HDly3YasZfChJn1OE9wqYECrxfwqsgPYsg
	 msT8SMAXytrt1XFbsu27m02zH3kGZKGMaHLbeJvAsiA/BUCqZdcVwj8uWi2unO4cli
	 z37W7wGYgvugjyC1gt88O381NfaoHOxNdokEKSS8oxH4C6S43dzWJMrS+ccrJIdcGg
	 Mns5sDlNhK4Uw==
Date: Tue, 22 Apr 2025 17:37:31 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] rust: alloc: allow coercion from `Box<T>` to `Box<dyn
 U>` if T implements U
Message-ID: <aAe3u_HHQUOmH0KS@cassiopeiae>
References: <20250412-box_trait_objs-v3-1-f67ced62d520@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250412-box_trait_objs-v3-1-f67ced62d520@nvidia.com>

On Sat, Apr 12, 2025 at 03:29:13PM +0900, Alexandre Courbot wrote:
> This enables the creation of trait objects backed by a Box, similarly to
> what can be done with the standard library.
> 
> Suggested-by: Benno Lossin <benno.lossin@proton.me>
> Reviewed-by: Alice Ryhl <aliceryhl@google.com>
> Reviewed-by: Benno Lossin <benno.lossin@proton.me>
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>

Applied to alloc-next, thanks!
