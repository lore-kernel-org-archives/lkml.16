Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E468C25C71C;
	Wed, 30 Apr 2025 12:06:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746014783; cv=none; b=TXQAjyey4XdiYGKVyYB2x5JmIu7sugKD/Gasxdksqaf1vgotEP4GuYP4BcGMJc9uORI1Ldg1YYNtPtDGqe3ARWULYBJhC0ItqrzmaWVN51juesb+KK9esARqtX+7HiZbz9aXD6V31afWWTP4Kx4tqS9F2Tji0VgeZCVSiw33IDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746014783; c=relaxed/simple;
	bh=iHOwroA1fJEc6iCDuL+qDXSxkmUymFI3FaIFuEBggcE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jgm1NNh0U2JtK3o5nNePsaqMFLXO91meWuMx9gff3B0VBDGrIpJqBMcvCapSEkqWZtIebfKnG5lehcmFUW2EXEooHsMK+rXVPEcDJLQtbFM9j8vBA/Mt2SXbmSNqmnr204c0AtT+L+ENvEU3OSz9b4I4u34cIkkHs+y7t2n0KBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=KR2fzrrz; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="KR2fzrrz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3659C4CEEC;
	Wed, 30 Apr 2025 12:06:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1746014782;
	bh=iHOwroA1fJEc6iCDuL+qDXSxkmUymFI3FaIFuEBggcE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KR2fzrrz3iBcrUjZ+fZ7gNwqpP/zoU8m2hnhf6wE4zbwvZo7GHzfsA165GuzYhWWJ
	 vhFwDfdNWuSw8u0LUz8ft0BNOEuvFgQvHPzh7KQIvTu8QtPbju4p007CxzN5StUyt9
	 FToaEtBpYPkyBcfUxeQ7AQy59DkH6HXcccFb9Wd8=
Date: Wed, 30 Apr 2025 10:01:08 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Matthew Maurer <mmaurer@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Sami Tolvanen <samitolvanen@google.com>,
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH 8/8] rust: samples: Add debugfs sample
Message-ID: <2025043046-dismiss-unclothed-01bc@gregkh>
References: <20250429-debugfs-rust-v1-0-6b6e7cb7929f@google.com>
 <20250429-debugfs-rust-v1-8-6b6e7cb7929f@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250429-debugfs-rust-v1-8-6b6e7cb7929f@google.com>

On Tue, Apr 29, 2025 at 11:16:02PM +0000, Matthew Maurer wrote:
> +    fn build<'a>(&'a self, builder: Builder<'a>) -> Result<()> {
> +        builder.display_file(c_str!("simple"), &self.simple)?;
> +        builder.display_file(c_str!("composite"), &self.composite)?;
> +        debugfs_fmt_file!(
> +            builder,
> +            c_str!("custom"),
> +            &self.custom,
> +            "Foo! {:#010x} Bar!\n"
> +        )?;
> +        for record in self.many.iter() {
> +            let dir = builder.dir(record.name)?;
> +            dir.display_file(c_str!("size"), &record.size)?;
> +            dir.display_file(c_str!("stride"), &record.stride)?;
> +        }
> +        builder.fmt_file(c_str!("atomic"), &self.atomic, &|atomic, f| {
> +            write!(f, "{}\n", atomic.load(Ordering::Relaxed))
> +        })?;
> +        builder.fmt_file(c_str!("locked"), &self.locked, &|locked, f| {
> +            write!(f, "{}\n", *locked.lock())
> +        })?;
> +        Ok(())

Good luck removing all of those ? checks, this should work just fine
without any of that.

I'm not set on the "builder" pattern here, it's not a normal one for C
to be following, why do you feel debugfs should be using it?

thanks,

greg k-h
