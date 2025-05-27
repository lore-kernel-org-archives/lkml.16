Received: from zeniv.linux.org.uk (zeniv.linux.org.uk [62.89.141.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA6C914A4C7;
	Tue, 27 May 2025 22:12:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.89.141.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748383942; cv=none; b=aB4kxscj/rjEIDYQOTyQZBT3vnR7SGN/UD/wdtFlWdb5V5o6fzH93tfXS/rlpdLlO8Sh8WnVJliNbt0j14kGyTsb9EOIp17yYTWkCzGVmBaI6JQRDtqchFXiLpKDcL3oSOah3vn1zg0ODuph0tBwyyZSH3xuUMU4C2dzHnxKtno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748383942; c=relaxed/simple;
	bh=uPs433VGRl9db/ILN2nMaCBUmPTAy/uIceD+r1Ft9qA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YK8XDuRiVIscUIENj0psFR6exoiSMyINOT92/m3ZaqjeYi+ORCHoaehKa7ytV7zhSM0fe1kzabMNhWyXJ433/22uf35WBzRCq0mNH2WfDAI4J1JMabaBODPeld6ewk8fcM7rzjBTblRaNwplNpcHAGf9UBZXTOgcLUtnroW1M04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zeniv.linux.org.uk; spf=none smtp.mailfrom=ftp.linux.org.uk; dkim=pass (2048-bit key) header.d=linux.org.uk header.i=@linux.org.uk header.b=ArWIVe6p; arc=none smtp.client-ip=62.89.141.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zeniv.linux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ftp.linux.org.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linux.org.uk header.i=@linux.org.uk header.b="ArWIVe6p"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=linux.org.uk; s=zeniv-20220401; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=b0vSVo0YmWdp5tB1WDGuqHQ2nb5vuvg5ODXM7uOhpJo=; b=ArWIVe6pN3qYHfM60zjkOC7qJ/
	J+rrxrBTDz5EnDcHIB0wiNIxHwrc6uzRwcGI7RMSHmLm1dW7rVdPHfWPlTtOrJiIYCfjEcgMFU2et
	eo3NK06dla3tu3sLlaqVOaCcnMmZqG6MgpXsrnleEWlt8FXoy0rmxRy1sp+ykNBT9SJrfoFAU36Ia
	ls7r/q4scskJezGXynZhkxnowIV16TZMhPH/mKjRMdHAzGTSnFzLa7jixHzX857xq6B5ULR6Uy/5E
	wDCdZC2k7F/MYwc4+tDS02EEtbNr7oqVrbEqsDzlsWcGk6VcT/qFt4Eb9oKeWdxMGpvUx9faIvMW5
	GXEiDJoQ==;
Received: from viro by zeniv.linux.org.uk with local (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uK2Wp-0000000GUH1-2gtE;
	Tue, 27 May 2025 22:12:11 +0000
Date: Tue, 27 May 2025 23:12:11 +0100
From: Al Viro <viro@zeniv.linux.org.uk>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Andrew Morton <akpm@linux-foundation.org>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] uaccess: rust: use newtype for user pointers
Message-ID: <20250527221211.GB2023217@ZenIV>
References: <20250527-userptr-newtype-v2-1-a789d266f6b0@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250527-userptr-newtype-v2-1-a789d266f6b0@google.com>
Sender: Al Viro <viro@ftp.linux.org.uk>

On Tue, May 27, 2025 at 01:53:12PM +0000, Alice Ryhl wrote:
> In C code we use sparse with the __user annotation to detect cases where
> a user pointer is mixed up with other things. To replicate that, we
> introduce a new struct UserPtr that serves the same purpose using the
> newtype pattern.
> 
> The UserPtr type is not marked with #[derive(Debug)], which means that
> it's not possible to print values of this type. This avoids ASLR
> leakage.
> 
> The type is added to the prelude as it is a fairly fundamental type
> similar to c_int. The wrapping_add() method is renamed to
> wrapping_byte_add() for consistency with the method name found on raw
> pointers.

That's considerably weaker than __user, though - with
	struct foo {struct bar x; struct baz y[2]; };
	struct foo __user *p;
	void f(struct bar __user *);
sparse does figure out that f(&p->y[1]) is a type error - &p->y[1] is
struct baz __user * and f() expects struct bar __user *.

It's not just mixing userland pointers with other things - it's not mixing
userland pointers to different types, etc.

In practice I've seen quite a few brainos caught by that...
