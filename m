Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 411B535946;
	Tue, 29 Apr 2025 13:53:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745934793; cv=none; b=Vqk2KKuWGeEpKClNewCXr//F10pUCeV5VX1xYP8QzEZAoCrG+kqzdbZLxBW5b11HKgCin5mqtLZ1dV26+j7dGV6bXEIanDWKqDRaTxSt2cdFct0XUAN7utAkrf9oyr3jnzKHof0gOzNB0egrWWGAiLcvTIoK2I1Y/hnABbGoNt8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745934793; c=relaxed/simple;
	bh=Nr3mAztr8dYOKfSuDDppzh0U5c0NFW11Dhi/PR+c8o8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Tx1FNJSTe+8F+ojglnRM/pEbOwlJw6X/d0+A5GIHHkLCDU6JZnnaMsSodSSyhZQTQlzl22FPw7X7Z2/MF7KV2QfcsXx2oilRPA8Z9udbvk0knJbImn5fzCwWSAqyuapqF9nVmd6BARaKgIy0x2q0O27nk4XPTeR5BxyB3gBK5A8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gHoAnKxR; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gHoAnKxR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B0A0C4CEEE;
	Tue, 29 Apr 2025 13:53:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745934792;
	bh=Nr3mAztr8dYOKfSuDDppzh0U5c0NFW11Dhi/PR+c8o8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gHoAnKxRsJ3iU59NBpKsCtvOmCigHZrSIFzoOVeSYBn0TlJJfRQVVdWq3AfG7Xj1E
	 XKTFU2Qz3vhz1hYUmuid46RSVB3wKRn8+LhRKxgkI8/a5eCjJegbN3c81vsqwC9VgD
	 cVl3eXc+lra4CpSn136vfzYVqaTDv8c/nZEO+mWWjy3KmSPpoVNPPL3FTEcGpgc851
	 HDXWZl5u3EvHgrV6zBDBtANgLoxd1A9obBJFdcCCvhDOt0lDJapmpq4ZzU4OVWQmAI
	 /SfdgKPGZWmyDdxLq14d7nEUVCY5ItMrm4Y9k9jPITXpwO+0icxY7cq4WeVgq+u402
	 x/038JU+MKnOQ==
Date: Tue, 29 Apr 2025 15:53:06 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: Ayush Singh <ayush@beagleboard.org>
Cc: Jason Kridner <jkridner@beagleboard.org>,
	Deepak Khatri <lorforlinux@beagleboard.org>,
	Robert Nelson <robertcnelson@beagleboard.org>,
	Dhruva Gole <d-gole@ti.com>, Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] rust: kernel: device: Add
 devm_of_platform_populate/depopulate
Message-ID: <aBDZwoZTGgsWNYLJ@pollux>
References: <20250429-rust-of-populate-v2-1-0ad329d121c5@beagleboard.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250429-rust-of-populate-v2-1-0ad329d121c5@beagleboard.org>

On Tue, Apr 29, 2025 at 05:09:26PM +0530, Ayush Singh wrote:
> +impl Device<Bound> {
> +    /// Populate platform_devices from device tree data
> +    pub fn devm_of_platform_populate(&self) -> crate::error::Result<()> {
> +        // SAFETY: self is valid bound Device reference

Here and below, I'd write something along the lines of:

	// SAFETY: By its type invariant `self.as_raw()` is a valid pointer to a
	// `struct device`.

> +        to_result(unsafe { bindings::devm_of_platform_populate(self.as_raw()) })
> +    }
> +
> +    /// Remove devices populated from device tree
> +    pub fn devm_of_platform_depopulate(&self) {
> +        // SAFETY: self is valid bound Device reference
> +        unsafe { bindings::devm_of_platform_depopulate(self.as_raw()) }
> +    }
> +}
