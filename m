Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F24251865EE;
	Tue, 29 Apr 2025 14:31:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745937119; cv=none; b=HCT8J3IUwuuKAwTOfC8zlOHgz5/ZDB4KpieflC8yKnOtjQc+zdi4MIdKgLHVHajz584hpAFdKEoJJ0P2PaJ/92jPfr0Bm23oYujgZh547IDrCi9zUovgpmH1vnUQEct6aPK4ptjkjQc6XtpZFAqan17YCAMpW+i30eaXJDl8waw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745937119; c=relaxed/simple;
	bh=ycYLmloz+NSG7+QWN/h+ibcOHt9KPIjjbhKyyZFMIZE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LrHXx4expQ9bq7pziNzeIqOSVQ0BosvUP03n0S+ubWnfwR3G4SpIHTZ0MHcn0Ge6s+nzMQEDJxVBRIUSBBc45VKo8A7hyCIzENaYtGR2biRI5OwN//B/Q6o6jhUT0WyXfNx+aPwWsEQYhOHht9tvsj3oPB0djQ0pcoE4P+xOiuk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mBndihfw; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mBndihfw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9031C4CEE3;
	Tue, 29 Apr 2025 14:31:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745937118;
	bh=ycYLmloz+NSG7+QWN/h+ibcOHt9KPIjjbhKyyZFMIZE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mBndihfwHvAuE8T3l1xFn3ZYCZi5L2jU7u6WFqDCRwXfdJPE4eeo6KPbs/asZriDD
	 MVfWEpLQXVoL3jTL2JtH404OamCcpHZYJur1wPN97Z9SUfc3KckWsjtRU0VXA49ybo
	 BtiGwOlGTKKah/3Gvgw9S2z2g+X1DD14Z+luJ1uBLrLI22ErmSFyLGyArogFk9aQY7
	 tOpgPjCcD+NH9nW6AC22hfaqDT29bSZqpiI+Sa2AgjR/WfuLqAbLcS81COlVxEDznc
	 +/bqZ9t8LsX+4W32sfu5Y2d5bxl0pluwXc8FN6KnGv1xvuVW0h03F5lElxvU/WCjwr
	 nO5X458wbcD8Q==
Date: Tue, 29 Apr 2025 16:31:52 +0200
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
Message-ID: <aBDi2LE3O1rIsGqn@pollux>
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
> +    /// Remove devices populated from device tree
> +    pub fn devm_of_platform_depopulate(&self) {
> +        // SAFETY: self is valid bound Device reference
> +        unsafe { bindings::devm_of_platform_depopulate(self.as_raw()) }
> +    }
> +}

One additional question regarding devm_of_platform_depopulate(). This function
is only used once throughout the whole kernel (in [1]), and at a first glance
the usage there seems unnecessary.

In your upcoming driver you call devm_of_platform_depopulate() from a fallible
path [2].

So, I think we should change devm_of_platform_depopulate() to return an error
instead of WARN(ret).

If [1] needs it for some subtle reason I don't see, then I think we can still
call it from there as

	WARN(devm_of_platform_depopulate())

[1] https://elixir.bootlin.com/linux/v6.15-rc4/source/drivers/soc/ti/pruss.c#L558
[2] https://github.com/Ayush1325/linux/commit/cdb1322b7166532445c54b601ad0a252866e574d#diff-7b9e3179e36732d5f3a681034d70c2fda4ff57745c79ad4a656f328c91e54b77R71
