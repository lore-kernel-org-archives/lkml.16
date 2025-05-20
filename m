Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC8E325B1C5;
	Tue, 20 May 2025 05:01:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747717279; cv=none; b=gkCfrYL/t8F/y6LS45dJ3snj8BSkd9mTnqZs+qxtOL+4sXwRsXi9gw3cHn4OkHAwiWetkB7FEHWcrCIEH/PoVndFuVbHouzizjtkbr8xZ0j0k9f6+WwNGOjyGRA4ZmEMZcZltKNIRoWYEooviefaP9/EJEWFI5mXlkaTDbYZc00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747717279; c=relaxed/simple;
	bh=/f9inSBBw1FpFk23RnNhhj4e42pJmmWSrQe4LCigA/g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nKCYoRsBKw1lHoMqNcGbVkYV8G762EisbskSm4jtATXCCU5kS3tgylXHlN2zxZmOKIftLzzpY6F7vWFT5IFTWybpHk0r9/Xxql21rbnAaueQyx9bbcEozSWEesfjRa0X6Tl3LUwsajklZb4tfca2ReyUzlvLXmesT6Bqq1vIfYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=RS2nDKiJ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="RS2nDKiJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B745CC4CEEA;
	Tue, 20 May 2025 05:01:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1747717279;
	bh=/f9inSBBw1FpFk23RnNhhj4e42pJmmWSrQe4LCigA/g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RS2nDKiJPG7LreutyPwdoM/+GHI0tVDM/a1z67DUqzjp2fUh4V+a2YI9RIzRq9qry
	 6IQOuUOdeWeODId05sYopsyKQIE4GNUZQFWeUyxCdP/AzOlXbW0v0s1dkej10q5ROV
	 WXjrpeByXdPMap9Kn4UVh+NWDfReYxJV/Lc4Nt8c=
Date: Tue, 20 May 2025 06:59:29 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Christian Schrefl <chrisi.schrefl@gmail.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] rust: miscdevice: fix typo in MiscDevice::ioctl
 documentation
Message-ID: <2025052020-unpopular-sternum-a032@gregkh>
References: <20250517-rust_miscdevice_fix_typo-v1-1-8c30a6237ba9@gmail.com>
 <aCtzxoDeo6boMQMT@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aCtzxoDeo6boMQMT@google.com>

On Mon, May 19, 2025 at 06:09:10PM +0000, Alice Ryhl wrote:
> On Sat, May 17, 2025 at 01:06:15PM +0200, Christian Schrefl wrote:
> > Fixes one small typo (`utilties` to `utilities`) in the documentation of
> > `MiscDevice::ioctl`.
> > 
> > Fixes: f893691e7426 ("rust: miscdevice: add base miscdevice abstraction")
> > Signed-off-by: Christian Schrefl <chrisi.schrefl@gmail.com>
> 
> Reviewed-by: Alice Ryhl <aliceryhl@google.com>
> 
> I guess this should go through Greg's tree?

Sure, I'll take it later today, thanks.

greg k-h
