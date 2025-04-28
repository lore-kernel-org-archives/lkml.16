Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D11B61BBBFD;
	Mon, 28 Apr 2025 18:39:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745865574; cv=none; b=YhxmJbA4ZsQIwYxLBoCsTajTPpIiAi1qJh0NMk4bKVYYvZdLhx6AZBtWRnadjp0KV0/U6ObtBiI0omBrYFWfzAgLYUHwL6BXFJMUutb/bmVqly42u/V/ItjzWM3DD10dAtkP1zmf3ShvRMwPmLcF34scUU1EVdjtbUWuUwFo624=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745865574; c=relaxed/simple;
	bh=+GntzX7snpb3B1krCu6ijRajRoUoSqjhzmxdnCjdGVA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N466VGZ86k3AE9Dyj+tnI8799zrzU4XCgt9mrkNknpAUmUN6EMzaGQL4/Wx3Tkwyt1xkM1fkOCb2Xeh6BgghEurFNoKLVy/2eBJWI62Ea2EyIf3famq7h+o+0MXtt+uIq4Gjd7VXQ9FR374Lvc4YAGt2MO5/nRRu3q1aaKsAkU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hZibGdfa; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hZibGdfa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F264DC4CEE4;
	Mon, 28 Apr 2025 18:39:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745865574;
	bh=+GntzX7snpb3B1krCu6ijRajRoUoSqjhzmxdnCjdGVA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hZibGdfaBaYjKj/JT7l/bvE6YUWtHgeDPuzyFxLAk+ntVlGIlIwxP4E0fNNV3dCRg
	 KY7FpVfXaqXu+26ws2Zyl62LUGIzkeS5kVE+IrwAWMQdHpIJbS81zPlCA5r1xJuA+I
	 rV8cBW6/uXE92RPO6EJCAT6BTZ11g+rMUmsNcOSCUuGVG7fUht6TuwTNeCyYzV37JA
	 B7ghQa5E6lgfVZJrQCr5z+WvCLuVBWdyHN2cNi79buESSYOT103ObccirdEvbVX+EM
	 5dTBX7Ah2IO5PfFszPka/PzOwt9jY+3ZgbcazqQOAf9hpc7/2BbySg3OcMIAQkyZwy
	 eQC8EcrpFEAJQ==
Date: Mon, 28 Apr 2025 20:39:28 +0200
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
Subject: Re: [PATCH] rust: kernel: device: Add of_platform_populate/depopulate
Message-ID: <aA_LYKhbQ0iKM7n2@cassiopeiae>
References: <20250428-rust-of-populate-v1-1-1d33777427c4@beagleboard.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250428-rust-of-populate-v1-1-1d33777427c4@beagleboard.org>

On Mon, Apr 28, 2025 at 07:52:29PM +0530, Ayush Singh wrote:
> Open Questions
> ***************
> 
> 1. Function names
> 
> The rust implementations are based on devm_* versions of these
> functions, i.e of_platform_depopulate() is called when the device is
> unbound. Since in case of Rust, these are methods on the Device struct,
> I am not sure if the `devm_` prefix is required.

Please add the 'devm' prefix.

> 2. Maybe should be functions instead of methods?

Making those methods is the correct thing.

> +    /// Populate platform_devices from device tree data
> +    pub fn of_platform_populate(&self) -> crate::error::Result<()> {
> +        crate::error::to_result(unsafe { bindings::devm_of_platform_populate(self.as_raw()) })

As Greg mentioned, please add the missing safety comments. Additionally, I
suggest to import to_result().

Please also make sure to go through [1].

> +    }
> +
> +    /// Remove devices populated from device tree
> +    pub fn of_platform_depopulate(&self) {
> +        unsafe { bindings::devm_of_platform_depopulate(self.as_raw()) }
> +    }
>  }

Please move both of those methods into

	impl Device<Bound> {

which ensures that those methods can only be called for a bound device, which is
required by devres.

The impl block does not exist for Device yet, so you have to create it with your
patch.

- Danilo

[1] https://rust-for-linux.com/contributing#submit-checklist-addendum
