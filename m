Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 008DD199E9D;
	Sat, 28 Jun 2025 06:06:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751090802; cv=none; b=jMdowqIXhnkWM78jOiVLfNv1CTTa6htGiqGXfqlKra/TG3nbidBDpeeF8SRLszEiKH7yAtT7vDvnp+MMllAHC2+FPUhcLrG0UkdHnas8DZa7JFJ4e/L4jQVqRt86sWrysMQjG5Z/7K4FaLP7grATYTKEvPLWfOd88CR1KOjn170=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751090802; c=relaxed/simple;
	bh=fKbg/NIIoxfAHjE8h++RspDS4XkNumWXH5La9thCeJ8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tVxLC8VBdr+Q7KOG2WZ8JYAEHNXrOOjG9e/tNs4ofyPl8AXeeXQSuUzZWGQA3sd8/tKLZ49leVcrmjHhW5TQk9V0eHgpIiqGJdYDWBZ/JkQMclrzMUZbWqqPi7PTo+gJ8m6o/Bf+XJMAfd1T7faE1E/AlRvEyOOU4udHwQ+gTpo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=CHnT9JHd; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="CHnT9JHd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB665C4CEEA;
	Sat, 28 Jun 2025 06:06:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1751090801;
	bh=fKbg/NIIoxfAHjE8h++RspDS4XkNumWXH5La9thCeJ8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CHnT9JHd/quelBSGW2Ue0wl8nevROlnpwqlPtVeewjGayKD5D105ilC6jJBBWwN4N
	 vTLCrnUivFjkfJhugpb2RJgeb7dfdmlsRFOwXcqTW6Db1wGlYsaohq9hP2qXjf5I6P
	 fXyML2yZOMFVLtpK6kYr3JKb0qSMmQSK8NRXbfxU=
Date: Sat, 28 Jun 2025 07:06:38 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Matthew Maurer <mmaurer@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	"Isaac J. Manjarres" <isaacmanjarres@google.com>,
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] rust: miscdevice: Export vtable testing
Message-ID: <2025062836-reactor-mandate-6712@gregkh>
References: <20250627-linux-miscident-v1-1-d37c870550ef@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250627-linux-miscident-v1-1-d37c870550ef@google.com>

On Fri, Jun 27, 2025 at 11:42:38PM +0000, Matthew Maurer wrote:
> A common pattern in the kernel is to test whether a file belongs to a
> particular driver by checking its `f_op` struct against an expected
> value. This provides a safe way to perform that test for `MiscDevice`
> implementations without needing to directly expose the vtable.

Ick, who does that?  And why?  Who cares within the kernel what driver
owns a fd as why would any driver ever be passed a fd that is not owned
by it?

I would like to see a real user first please, or point out some places
in the kernel today that does this so we can go and fix them up :)

thanks,

greg k-h
