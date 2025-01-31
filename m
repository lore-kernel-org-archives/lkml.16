Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D9831EBA02;
	Fri, 31 Jan 2025 16:05:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738339534; cv=none; b=ElPfmU2gA/3h8Prf1pQPQP0R8WhPNsQz/DoxNjdjap6b/p5SiW6TWCpCI4nAM2jrRGez2WPvng/5vAYZcVzcwvNEYUvPxH1K/I8bXMS9aejjiZaCgtGL+GSrN0ZwWhtLI48LQMRRiXNRm/TpPFou8kOuiGAN4JvhDiQD8MlNjOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738339534; c=relaxed/simple;
	bh=1omhRQmvSB/Qil1fK+3eh4SCjNKBsj0EYIu0AGn7V7Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X2u6f1TLqHPaXVdfw1cDzONoEPgU29dovY5ndo72d4HuJ6zhIL6msN3dM795v3Xcf+kUmhy1y6ZW/tHkbjIlFqN1lkrcLeSIa9BLwOrCyn4CnFN7XQLdnq4eoeb/0WMhW1g/bGf6Y+hIPdX2DPJHI0XPO1j4HPZjd91byL0sVLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=1MYRElUg; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="1MYRElUg"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=oiBjie/3ciEURIkZ+iLsXyNmqPRpB2PMG1wBn3Ax9Sg=; b=1MYRElUgqBxjWkVDqUZZxZcr+8
	ONv5FvkVLHES1aKsbjZX2Pd8KJ1igu+ZChE//zmIzI6E/JJkxufl/3qydIO3GW+s2+WuTOOYnInRi
	gkcKLlHtiYE/pzVQaPZwXFtqUrpiJ7jKe7FEyyQZS7tr4nWqoZecl617/SEkPEaJIOQM=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1tdtVv-009jXz-O6; Fri, 31 Jan 2025 17:05:03 +0100
Date: Fri, 31 Jan 2025 17:05:03 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Christian Schrefl <chrisi.schrefl@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Jonathan Corbet <corbet@lwn.net>,
	Russell King <linux@armlinux.org.uk>,
	Rudraksha Gupta <guptarud@gmail.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Geert Stappers <stappers@stappers.nl>,
	Jamie Cunliffe <Jamie.Cunliffe@arm.com>,
	Sven Van Asbroeck <thesven73@gmail.com>,
	rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3] arm: rust: Enable Rust support for ARMv7
Message-ID: <65da77f7-bbd4-4cbe-a06c-75f10a6ec4ce@lunn.ch>
References: <20250123-rfl-arm32-v3-1-8f13623d42c5@gmail.com>
 <a83b0149-7055-411b-ba86-d227919c7c32@app.fastmail.com>
 <f8b59f05-55b5-4208-8bdf-b4be8e93bc22@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f8b59f05-55b5-4208-8bdf-b4be8e93bc22@gmail.com>

> To fix this Rust would have to provide a way to build the core
> library without float support. I don't know if there is a plan
> already to allow this.

Floating point is banned within the kernel, except for in very narrow
conditions, because the floating point registers are lazy saved on
context switch. If the kernel uses the floating point registers, you
can break user space in bad ways.

I expect this has been discussed, since it is well known kernel
restriction. Maybe go see what happened to that discussion within RfL?

	Andrew
