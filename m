Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 985B410F1;
	Fri, 30 May 2025 06:23:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748586184; cv=none; b=Bl/UzzKXZZsQ3qapLSAE8HWppJMpX2rc46ePjzVCNNIAy6hANwRghJpzYU/+LEPlrt6iJ6pb2Y3mQEqnX+2Hsc/H5V89u2Id3rKDVDliKFezeeUEJ66wHuWFP+9H1Ylox8Ea/4Lw7hUY13jOuYmiYLyLPK6zbcepO9ry7BV8tBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748586184; c=relaxed/simple;
	bh=FOSthH/1rXZrhrtot136ukOnJbdXJeg/VHSPCgjh1LA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CMEqsoTQepimyh+niWyE7aomxuk618wCf5XZ47+Vo90Aey5bVCktH+MQdXAuxlyIKXsuUY4zTo0tO3R/yoflcx1HDjh7jTPJnWgzSQV7JGciGXC1V5xKILtSVyHZJ1mJNbFSlWGKqvVQykenm2sc4EnniYtcfo+QmlH3C8ZkjZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=ySJ154gT; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="ySJ154gT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F447C4CEE9;
	Fri, 30 May 2025 06:23:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1748586182;
	bh=FOSthH/1rXZrhrtot136ukOnJbdXJeg/VHSPCgjh1LA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ySJ154gTwLJsa/AYQnWgBFB6WRQu/12MKxZwyHjhRowQXkr6VbhPdnKIUwhBNws+L
	 kQ7tZkGDRfO/Kg86ehkLWi3h5JDR887CG3cq17Lp8naxiWKyb9yaAINY3r2ezN3a+n
	 KnwfAz2XDh5uBglLQOtaimy3o7CuuEtdIYxykRw8=
Date: Fri, 30 May 2025 08:22:59 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Danilo Krummrich <dakr@kernel.org>, Timur Tabi <timur@kernel.org>,
	John Hubbard <jhubbard@nvidia.com>, Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH] rust: add basic ELF sections parser
Message-ID: <2025053047-theology-unsaid-d6ac@gregkh>
References: <8b14b078-b899-42e8-8522-599daa65bc63@nvidia.com>
 <2025051647-urology-think-b8e0@gregkh>
 <D9XMAV4ERYK7.39TLQBLYTX3TU@nvidia.com>
 <aCc_PSOPkLWTcTru@pollux>
 <D9XNS413TVXB.3SWWJE4JGEN8B@nvidia.com>
 <CAOZdJXW+PoFgxH+wPEum-kYvRmSRd8c4kaxvbNAq5dfZJiXapA@mail.gmail.com>
 <D9Y0VJKOAQAY.2GJSAZ5II54VV@nvidia.com>
 <DA8G3G918FS4.X8D7PQMT4TGB@nvidia.com>
 <2025052932-pyramid-unvisited-68f7@gregkh>
 <DA935OIFBM1H.3CMSHQ46LLG4P@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DA935OIFBM1H.3CMSHQ46LLG4P@nvidia.com>

On Fri, May 30, 2025 at 09:58:02AM +0900, Alexandre Courbot wrote:
> However, Nova also supports a couple of older chip generations that use
> the same GSP firmware -  it is for these that the ELF unpacking must
> occur in the kernel. IIUC this has to do with the capabilities of the
> microcontroller that ultimately does the loading (more capable RISC-V on
> Hopper+ vs. older and more limited Falcon).

Why specifically does the kernel have to get involved here?  What
requires it to do it that userspace can not?

thanks,

greg k-h
