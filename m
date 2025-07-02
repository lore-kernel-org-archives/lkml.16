Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80AE625CC75;
	Wed,  2 Jul 2025 10:36:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751452579; cv=none; b=aFkcfP+Th5ALbWOvQALl8FntSJ1kDlL51bbvUMvWahZ/Ik3lIo9MIK0sF3F/WE8DkasHcCx7QxE3KW/UpXCuK0SLrhfn6ApQffKHC7b44qb7Gn/McOXvh5oYknJW+sLDEcPl8bxezvCyilU0RqEu8GW8IudUPBvceNoYWjXjPOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751452579; c=relaxed/simple;
	bh=KDfQy2Js+DDupyUNw5tCWwVU8Kf4ZX6Tyd3TY+aYtPI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qkWHQNDqev6ZxBCg/K7AoiYU9UkAwdawNL1Q+zgc1jDCDXq/Q29zSsEfd+9JBRD2/ePNdzUEEKeYtj2hWrkZ5/t6FcfLsSmf07mqMbTh4Tze4Q5TlVY/kVPXEbrGGbYalhKm5JZrI14OLOcb8dQFczyWpVpYGK+UPOPtGET9mAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HeaxcCEo; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HeaxcCEo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B121C4CEF3;
	Wed,  2 Jul 2025 10:36:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751452579;
	bh=KDfQy2Js+DDupyUNw5tCWwVU8Kf4ZX6Tyd3TY+aYtPI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=HeaxcCEof/T5tcjSpfypJYjUjeO0YqCVP4CNbnzkBfi/8EW4+iA+03FfhUuoxhUMP
	 oDmlxWB0Orbb9aMq8e6LYookLN5S2N4ThYY8TKOMNmO525atV2yJkQuCuk9+6gFv4J
	 wqknRS7wd4b6Pz409E0QewhRivdiU30piaxQqHPN+uluIrZuaRV46PmZSAPa1g1Csd
	 8EsekOzoIRr/j4Pjpe3u2XzXaBF3HjV6tITQT4cvPJyAqU007CgIfiYpRHdew24JmO
	 3jFPg8DT9s1RX5fGVzbzdb6BXMf1hkNwfoqxXyPR32Kgvfsm3CucnB17w3L99LNSvh
	 nSA5mKnMJXk8Q==
Message-ID: <ce990cdf-f279-466d-b402-d98e4a75edb3@kernel.org>
Date: Wed, 2 Jul 2025 12:36:13 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 4/4] rust: platform: allow ioremap of platform
 resources
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
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
References: <20250701-topics-tyr-platform_iomem-v11-0-6cd5d5061151@collabora.com>
 <20250701-topics-tyr-platform_iomem-v11-4-6cd5d5061151@collabora.com>
From: Danilo Krummrich <dakr@kernel.org>
Content-Language: en-US
In-Reply-To: <20250701-topics-tyr-platform_iomem-v11-4-6cd5d5061151@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/1/25 4:34 PM, Daniel Almeida wrote:
> +impl Device<device::Bound> {

<snip>

> +    pub fn iomap_resource_sized<const SIZE: usize>(
> +        &self,
> +        resource: &Resource,
> +    ) -> Result<impl PinInit<Devres<IoMem<SIZE>>, Error> + '_> {
> +        IoMem::new(resource, self.as_ref())
> +    }

Sorry that I did not catch this earlier, but what if I supply a Resource here
that has *not* been obtained by any of the platform::Device methods and from the
same platform::Device as you call this function for?

I think this also needs something similar to what we do in the IRQ abstraction,
e.g.:

	/// # Invariants
	///
	/// `res` has been obtained from `dev`.
	pub struct IoRequest<'a> {
	   dev: &'a Device<Bound>,
	   res: &'a Resource,
	}

Such that IoMem::new() can take an IoRequest instance instead.
