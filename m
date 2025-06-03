Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA65C2C3263;
	Tue,  3 Jun 2025 10:16:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748945804; cv=none; b=ZhKu+ObkkObexxo1I0ocnYmCK+A0WORpJDRo5iV7GJtGBLcmey6DKVs33XYw5oJFQWHLIcnAk4lw8Sjj1uwByaqo7MkR8LW6BRJ+PfTD/lk9yx0B3t9B2do62ASmRGzuYNhhAmn+mpg+tWnvqtDNXAGkqRvtVOMnK0y44Ax2DaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748945804; c=relaxed/simple;
	bh=/fWbrAfSvD6ghG9IM5OHzjF23efs9oxp1r8ZV6cPJ6I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e1mb/EZmK+C904WWkHAY9Z8jmejAxrUHpCR2OIqwAdmWCeAc1D6zJdkqSW5+ebjKnDREy2GM0acGFGCRtGPJGjb5GHizvU0Yl7yHL1VauzbP6NoJSgPVP1whRQW933danrrRGfOWDoLiLjD3ZHQmzKDBDzv6E6aAkTwYGWmnsvg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bkVsmbt5; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bkVsmbt5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32CE2C4CEED;
	Tue,  3 Jun 2025 10:16:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748945804;
	bh=/fWbrAfSvD6ghG9IM5OHzjF23efs9oxp1r8ZV6cPJ6I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bkVsmbt5uyL0JLT/XmHYoYuwHxTrb21PaNeP/w/gxYNkCfNIDbKR9o648aoFRu8Do
	 qtMDvYwgqHjliXvWQpL36QEZ7nAEcSMpaKdP3O328qDyDC7ZxudqHGVAnDRDkegcOS
	 CfBk6BtMvsQwoVeri0ucPrdB3bzU39JJ/kHpW66RxBKyX8ceWSjh3ytNFvFWC0SGjq
	 ADmMP5lr0Rre0KnCpAsMxuVIWMf/ImFBZYPigSp2D92IQAqNwsgQyvPJyZaFKQTwfp
	 Z3nzEYMrdVsGPQOR/sfSIpT2IeognUqd04jy+mEVXWy4Z/GNin1nfDyJ4rBuRD/O1g
	 9ExBKhguwXTAA==
Date: Tue, 3 Jun 2025 12:16:38 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Daniel Almeida <daniel.almeida@collabora.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>, linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v3 1/2] rust: irq: add support for request_irq()
Message-ID: <aD7Lhsjh6HPXedjT@cassiopeiae>
References: <aD3PCc6QREqNgBYU@google.com>
 <aD3f1GSZJ6K-RP5r@pollux>
 <aD6yOte8g4_pcks7@google.com>
 <aD62ZGBwqXxTroeX@cassiopeiae>
 <aD64YNuqbPPZHAa5@google.com>
 <aD68BzKRAvmNBLaV@cassiopeiae>
 <CAH5fLgjweugttOtuiyawNp5s2N9JPoo5FTJ+Zs9t_S87ggC1Gg@mail.gmail.com>
 <aD7DvBfAxKi7Fpg_@cassiopeiae>
 <CAH5fLggKL4jMjrJJEYV=Snqftu+oc4-sTNj9spinON5kHVP9xg@mail.gmail.com>
 <aD7JuyVRVr5dSqE9@cassiopeiae>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aD7JuyVRVr5dSqE9@cassiopeiae>

On Tue, Jun 03, 2025 at 12:09:05PM +0200, Danilo Krummrich wrote:
> Yes, we could solve this with a lock as well, but it would be an additional
> lock, just to maintain the current drop() semantics, which I don't see much
> value in.

If we want to keep the current drop() semantics we could use a completion
instead.

	// Devres::drop()
	revoke_nosync()
	complete()

	// devres_callback
	if !try_revoke() {
		// we end up here if try_revoke() indicates that the object was
		// revoked already
		wait_for_completion()
	}
