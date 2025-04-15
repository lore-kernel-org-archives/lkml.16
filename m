Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D975827A936;
	Tue, 15 Apr 2025 11:38:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744717113; cv=none; b=ftlIIvAsP+zT5I4gRTAoxXcsqQW+kSZnTF//aXyosIeBDeEKUiWOzl37HHJzHC3ZYhZa5AUa3jQJjxxBXEUodhvlYRQsd72AZ7KS1ymC8zv0KeZwrkZhIgfLlSiLMDCjZvAqzEJGxQ2iNK6l8lgvln9zne8wvwWpGahETqnRrRo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744717113; c=relaxed/simple;
	bh=kPQvr1LgSycPwkM2qthickUuMnXmIg7fIdTJtU4UCH4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IlR6LeE2WNi0RILAfeg5WQODjAChvC5rsyoFKxlr4JsLruuCzI+7Drdm5UyG6kPnNJPk21WR2eGxmBmBKR3S8gKvC28HAvap756SsM0HHsxIa+91uL+/Scjf3rBepR0srUBT/NmcubBodQbyjI2jcJrHueWuWuFP3AJPkGW+oDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=D3UWi2P3; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="D3UWi2P3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C597AC4CEDD;
	Tue, 15 Apr 2025 11:38:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1744717112;
	bh=kPQvr1LgSycPwkM2qthickUuMnXmIg7fIdTJtU4UCH4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=D3UWi2P3Fc7BIzQzAHuG7AGyOYLMeTu9zyv7P4HTNY95UCzsnw1+2tBq8++XE4187
	 OUb7wxDsD2zXIOYC66co0kFvYINitlefkHRUbVyAS/bGz+9NUYFoE9jS1GZbuNiTmt
	 9FP2uF4iMb/291ywcWnYX2UCO5C34OFACkb7+U80=
Date: Tue, 15 Apr 2025 13:38:29 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Danilo Krummrich <dakr@kernel.org>
Cc: rafael@kernel.org, david.m.ertman@intel.com, ira.weiny@intel.com,
	ojeda@kernel.org, alex.gaynor@gmail.com, boqun.feng@gmail.com,
	gary@garyguo.net, bjorn3_gh@protonmail.com, benno.lossin@proton.me,
	a.hindborg@kernel.org, aliceryhl@google.com, tmgross@umich.edu,
	airlied@gmail.com, acourbot@nvidia.com, jhubbard@nvidia.com,
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v4 0/5] Auxiliary bus Rust abstractions
Message-ID: <2025041559-regulator-mutt-e8ed@gregkh>
References: <20250414131934.28418-1-dakr@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250414131934.28418-1-dakr@kernel.org>

On Mon, Apr 14, 2025 at 03:18:03PM +0200, Danilo Krummrich wrote:
> This series adds Rust abstractions for the auxiliary bus.
> 
> It implements the required abstractions to write auxiliary drivers and create
> auxiliary device registrations. A driver sample illustrates how the
> corresponding abstractions work.
> 
> The auxiliary abstractions are required for the Nova driver project, in order to
> connect nova-core with the nova-drm driver.
> 
> A branch containing the patches can be found in [1].
> 
> [1] https://web.git.kernel.org/pub/scm/linux/kernel/git/dakr/linux.git/log/?h=rust/auxiliary

Looks good to me, want to take this through a gpu tree so you can build
on top of it, or do you want it in the driver-core.git tree?

thanks,

greg k-h
