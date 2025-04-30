Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D397925A2A1;
	Wed, 30 Apr 2025 12:06:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746014769; cv=none; b=CmtX3SMrz1d1dSjPJrFJ0u45sWWCRBVZAI7knYxgBT5F4Jy9eflk2AymBGSdEFL04DQeS9GagcoEPk9PPufYfNaoeKY+se/fesmMqgNjsCMv7zXQkKwEJLzbgBrd5rm+hrmMboZsCbtjBCz9Av1KjSE739TdtFb66KR0cZ0ctDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746014769; c=relaxed/simple;
	bh=KGyDouURDXE7hbeYzJ3r25OgH01l+08sLFPoSt6WCmU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UYbemJDtdBbBpItD0f1ZBI2krTshbIfcnSM7UnX9SS/TvXoMqUr1ITEwTjniG6zXSPqjyrkwi9fNQASMakBytV0laO5lU25a9O6TbEsbxQOrlq4vDhjsR906k/WnVKqaFELH4F0KBOr8/wt2YeoWgojhXlPO9ZfzBnsoyqMdSD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=NdbcPAbe; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="NdbcPAbe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B275EC4CEE9;
	Wed, 30 Apr 2025 12:06:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1746014769;
	bh=KGyDouURDXE7hbeYzJ3r25OgH01l+08sLFPoSt6WCmU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NdbcPAbe2kE3408kpJKMB2IuvKjjuS3t0CZMJECnQj/fVibetx6Drg9AJErMY65q7
	 WDNKISuJlsZTVpoHZ7qHX0WlOgMkEIahiagaqu7N+J3iDRS1BrmhPaRwYrJe7qme5/
	 KUNA/UMIediPI8aj1vzgw9CawCAXXlva41QURs2A=
Date: Wed, 30 Apr 2025 09:52:52 +0200
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
Subject: Re: [PATCH 2/8] rust: debugfs: Bind file creation for long-lived
 Display
Message-ID: <2025043053-spelling-rehire-a460@gregkh>
References: <20250429-debugfs-rust-v1-0-6b6e7cb7929f@google.com>
 <20250429-debugfs-rust-v1-2-6b6e7cb7929f@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250429-debugfs-rust-v1-2-6b6e7cb7929f@google.com>

On Tue, Apr 29, 2025 at 11:15:56PM +0000, Matthew Maurer wrote:
> Allows creation of files for references that live forever and lack
> metadata through the `Display` implementation.

What do you mean "live forever"?  There's always a structure somewhere
that holds it, when it goes away the file/directory should also go away.

> The reference must live forever because the corresponding file is
> reference counted, so there's no way to say the lifetime outlives it
> otherwise. This restriction will be relaxed later in the series through
> use of `debugfs_remove`.

Why not use that from the beginning?

> The `Display` implementation is used because `seq_printf` needs to route
> through `%pA`, which in turn routes through Arguments. A more generic
> API is provided later in the series.

Building stuff up to review only to remove it later makes it harder to
review :)

thanks,

greg k-h
