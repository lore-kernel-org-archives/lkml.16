Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCED926B2A3;
	Tue,  1 Jul 2025 14:03:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751378635; cv=none; b=ff2LdN2MdvIl9xpiLYSQsuXOeHZAxEhidHnr10uF/hUDMEhm9rWcc58D5cGm6MDHT4vx2Wk0zCKdgkIJHORsciLNV/uk60zqFkY0Ri38Chjq1HJiQVDAoTldBfu7nqiwHznX0dSpCmlD7OaO1aFoBmRTfWmgTnFG9uw2fL3pdtk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751378635; c=relaxed/simple;
	bh=JpnJHKttvi0GcZ5UBPCK+C6cVI9saqBEWYeFkTDngSo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EFaYss2sgBrol7h38FcKL9k2tWisqn4xmUZwTuSOErp4s9Od+ZFJvRCJoxJ1WgyYnNDfDnWoy1uMq+KAgGLoNGLje5+/Uz//d/eoLxGjTAeECOwr300xcZF5y2AQLRMB+dmII1bykeAs5A3+cZWDxD833AqHgRyX/0no/9AZV+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=sPyrtI9E; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="sPyrtI9E"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2221C4CEEB;
	Tue,  1 Jul 2025 14:03:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1751378635;
	bh=JpnJHKttvi0GcZ5UBPCK+C6cVI9saqBEWYeFkTDngSo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sPyrtI9EHXW9bcOPclcHnBQi4LOOD7WE52Vo4utu5pxbdSfuX4PpMX9DAKmrvXgoj
	 AwLlTwejG0v8GDrkbSNQMukrT4qJMZgnoMPmulSDShBRUd5WlcqJmE9G8E2rRdWF+N
	 Ho578ru6V2nH8g7op7xIWzUDbsKThmoXrIgaV7O4=
Date: Tue, 1 Jul 2025 16:03:52 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Matthew Maurer <mmaurer@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Sami Tolvanen <samitolvanen@google.com>,
	Timur Tabi <ttabi@nvidia.com>, Benno Lossin <lossin@kernel.org>,
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
	Dirk Behme <dirk.behme@de.bosch.com>
Subject: Re: [PATCH v8 6/6] rust: samples: Add debugfs sample
Message-ID: <2025070148-primer-stillness-0409@gregkh>
References: <20250627-debugfs-rust-v8-0-c6526e413d40@google.com>
 <20250627-debugfs-rust-v8-6-c6526e413d40@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250627-debugfs-rust-v8-6-c6526e413d40@google.com>

On Fri, Jun 27, 2025 at 11:18:29PM +0000, Matthew Maurer wrote:
> +        // An `Arc<Mutex<usize>>` doesn't implement display, so let's give explicit instructions on
> +        // how to print it
> +        let file_2 = sub.fmt_file(c_str!("arc_backed"), my_arc.clone(), &|val, f| {
> +            writeln!(f, "locked value: {:#010x}", *val.lock())
> +        });

While cute, is this really going to be the way to describe all "custom"
debugfs function callbacks?  No other way to point to a function itself
instead?  Look at "fun" debugfs functions like qh_lines() in
drivers/usb/host/ehci-dbg.c that is dumping tons of data out.  Putting
that inline here is going to be a bit ackward :)

So can you show an example of a "traditional" debugfs file output with
multiple lines that is dealing with a dynamically allocated device that
is associated with the module (not the static example you showed here),
as that's going to be the real way this is used, not with static
variables.

thanks,

greg k-h
