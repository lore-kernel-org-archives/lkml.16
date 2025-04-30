Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC86A25D553;
	Wed, 30 Apr 2025 12:06:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746014785; cv=none; b=oJAHP9cjkpvoSmRyAF23dCF/7vKx5J2Jm4jKJKK0X8KRt2h6S6Gx2q5i6uf5GNZ50BppGdrZvG/cAqjXOT4hLXJHJ/+u9ZIPnzdOwnfIXe/RN5zScBp01xBDD01J4iAQNdUu5Bhr8jTy8a+aMNbtDPtC2bqBL3NhcztFusjQXAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746014785; c=relaxed/simple;
	bh=bnMLu4pVkf1lQX+0PxE5pWPqFqFRrbaYe7y7NbZ6EXA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fdtiYCATavKcX1ItzrXTHz27ZlucNgPDPNf5a+8vgChKiMnS4OMc7gF3UhD2ie7PsG+CHdcflO4V7ks4j1FXd7iMc4C5UL7zeGli4fiMO27yDcSgOAc5nFZnR7ufIWEBU3tS2bg7bwzN+xmdD3B8IPGq+BJ96/ksbEWYPNC1ark=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=zK1VEXPq; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="zK1VEXPq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7A2BC4CEE9;
	Wed, 30 Apr 2025 12:06:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1746014785;
	bh=bnMLu4pVkf1lQX+0PxE5pWPqFqFRrbaYe7y7NbZ6EXA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=zK1VEXPqZRguWtH+GBHXDxMV9OGM6dJJ/6jooyIt3bhVVavyH/WU3Cu8jYCfV5LEP
	 f3zs7/AIFwgDuoega31YEqMdEUVV5pAEx8Hz+U3OErVHbrB6I4rejM4yhK4nw+x6RF
	 pZXmbC8gpuVkDOnCSgMFYur/f0VXxQCdvJVfXZFg=
Date: Wed, 30 Apr 2025 10:03:31 +0200
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
Subject: Re: [PATCH 0/8] rust: DebugFS Bindings
Message-ID: <2025043024-disk-rockfish-1c1b@gregkh>
References: <20250429-debugfs-rust-v1-0-6b6e7cb7929f@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250429-debugfs-rust-v1-0-6b6e7cb7929f@google.com>

On Tue, Apr 29, 2025 at 11:15:54PM +0000, Matthew Maurer wrote:
> This series provides safe DebugFS bindings for Rust, with a sample
> driver using them.
> 
> The primary intended way to use these bindings is to attach a data
> object to a DebugFS directory handle, and use the contents of that
> attached object to serve what's inside the directory.

That's cool, but really, not the common use for debugfs.  Why not make
the "simple" way work first (i.e. just create/remove directories and
files attached to variables and generic read/write functions) and then,
if really needed, we can add the structure layout mess like you are
wanting to do here.

And yes, I know why you want to tie debugfs layout to a structure
layout, it makes one type of debugfs use really easy to write in rust,
but that's not the common user for what we have today.  Let's address
the common use first please, save the "builder" pattern stuff for after
we nail all of that down.

thanks,

greg k-h
