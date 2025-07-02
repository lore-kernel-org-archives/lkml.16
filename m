Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 693F22594BD;
	Wed,  2 Jul 2025 10:21:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751451670; cv=none; b=ihGlq/oApoEnLGzvZMFMNr8as5IomnAB8K/oqS7RQYuzrlo3bSV4kb6WWGUQvF4LQ/JSOkSP43RcX0FSK67hhlPDX9mqcfNnPNZL3SthNdFOd2SlkSK/7yQDVVxsneO5RGHz2giZPZut3wN5Wcmgr3dW9ejL17qvpdf6aQfD3fo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751451670; c=relaxed/simple;
	bh=XH4seAkx/+Wdc115tc1uJi/R/MgxEBvbX4bonefNEUU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fBTRa904IQva7+kVkmukD6gDY/qL8G+hQeb6yWxBbDSopmIZd49gYGoCzqR6PkIERJGsW1G/CExTBf+npzBbLOTu+rlYitCwUyCP/YSsbRvnIG70UZXr7YHJz5OIz1JQd+HRMr3SEx5QJD8AC81BpSCMZpZsySiy+zHRunf3W20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MMNrw8JT; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MMNrw8JT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1ADC4C4CEED;
	Wed,  2 Jul 2025 10:21:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751451669;
	bh=XH4seAkx/+Wdc115tc1uJi/R/MgxEBvbX4bonefNEUU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=MMNrw8JTg4INuqObi2Fydr8ei5bzJgKowapOfaG9vhcJCHOvKaYW0eDGCvWlaFTwf
	 GBB4dmeeo4otgVyKGB6E1YT3G3u57piO1+J1+9PWUZS+YQYEwJVB3V0jaPRpSShfpV
	 xTxNf1MBg4lx6mgsdfmmIN7qcEmoFvSqoFcSm4ZUdtVSOC9BdCkkT+dTur12f28cP1
	 Td38g1xDbQbH5BWNh7c0R01UAxe6YQHFJsWHGkaiORM+NlpFALoeqpTOWCGHfFDQhk
	 AeRCDOvbz+hBmGje7QS6PC2foGmJ9jVBv+paW2h0ccoOqqvPJ3H8+9GHI4pReNLX3K
	 zV1bNwZ5YvUtg==
Message-ID: <6b8c65cc-d0cd-4022-8d8c-3a4aaf8d36e5@kernel.org>
Date: Wed, 2 Jul 2025 12:21:04 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 1/4] rust: io: add resource abstraction
To: Daniel Almeida <daniel.almeida@collabora.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 Ying Huang <huang.ying.caritas@gmail.com>, Benno Lossin <lossin@kernel.org>,
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 Fiona Behrens <me@kloenk.dev>
References: <20250701-topics-tyr-platform_iomem-v11-0-6cd5d5061151@collabora.com>
 <20250701-topics-tyr-platform_iomem-v11-1-6cd5d5061151@collabora.com>
From: Danilo Krummrich <dakr@kernel.org>
Content-Language: en-US
In-Reply-To: <20250701-topics-tyr-platform_iomem-v11-1-6cd5d5061151@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

> +#[cfg(CONFIG_HAS_IOPORT)]
> +/// Returns a reference to the global `ioport_resource` variable.
> +pub fn ioport_resource() -> &'static Resource {
> +    // SAFETY: `bindings::ioport_resoure` has global lifetime and is of type Resource.
> +    unsafe { Resource::as_ref(&raw mut bindings::ioport_resource) }
> +}
> +
> +#[cfg(CONFIG_HAS_IOMEM)]
> +/// Returns a reference to the global `iomem_resource` variable.
> +pub fn iomem_resource() -> &'static Resource {
> +    // SAFETY: `bindings::iomem_resoure` has global lifetime and is of type Resource.
> +    unsafe { Resource::as_ref(&raw mut bindings::iomem_resource) }
> +}

This caught my attention, and I have a few questions:

   1) What do you need them for? I don't see any methods that would usually
      consume those.

   2) Why are they behind CONFIG_HAS_IOPORT and CONFIG_HAS_IOMEM, even though the
      C instances are not?

   3) What happens if we pass them to IoMem::new()? Is this really safe, or do we
      need them to be a special Resource type?
