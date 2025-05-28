Received: from zeniv.linux.org.uk (zeniv.linux.org.uk [62.89.141.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63A671B6D06;
	Wed, 28 May 2025 17:45:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.89.141.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748454356; cv=none; b=hsj6HO8QUlEUsVBdMPdCDeIqCy4Sq2xN3GwOWyZBt9BXYmgyhyu1LqVd7a/IPM1HAjAij+0UwRcMgxygFl100pgL/8H64k/+m3x8601Zsc1/17Q3qQ0RftbC5+SJz7ZMdPvyYHcaEykfnzn/LfQ0Q5LaIyEvuua76cOo1AibJRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748454356; c=relaxed/simple;
	bh=HYHkALbXo3pnLVUrs+6b3S7pMKN/XYoSOkMG6JfxG6I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MV2izN3IOe3JJluMIeqY/l31btC/XEVm/DTpo5QHD0JsHimdYbbkMujkV4mT340TYLwEKh1eQvZVEmhN3HwKMB7aAREAP78uToqQtLxL/Sn5/ZmoiSbjRxuTN8PSSVpwRUQiE2hK6I558rPFHxMOh2sETWWOFx5/kOCn41RoI/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zeniv.linux.org.uk; spf=none smtp.mailfrom=ftp.linux.org.uk; dkim=pass (2048-bit key) header.d=linux.org.uk header.i=@linux.org.uk header.b=A4+5FNp7; arc=none smtp.client-ip=62.89.141.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zeniv.linux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ftp.linux.org.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linux.org.uk header.i=@linux.org.uk header.b="A4+5FNp7"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=linux.org.uk; s=zeniv-20220401; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=5WyBr0ASdpvAFCWr18lM8e8ssQr82+v2ps7SNoOuuGk=; b=A4+5FNp7Jp3OY3LPC2nM7n28l7
	LO1OZChVBlk/8JjBkvtFKKLGaD2EvXkokSX0h1flzskpgFtm0zlAP1Y2rNf+jrFhRJowGdhkOlIkM
	ukz396ZCEm6xb3WuOgC+qbdy6m6HD9cistodIQmRHCmPeAIcBvzF8NmUEVMjVl8X6e7Vz7/9E5jXy
	Ae+TR9HP/kOuR2CARGJkuwSHHOb3f+khFi2c2HCv+Eb4MPDVAhDeuocmgDtGlPUHri0sqKyMipXMF
	9ktHbwBT6PqLEga4Az3FH868qJBDj5fa8gM2DnRsRw0t04HosYSlMxIOm4dZ2ojGWC7h9Klfhx9PH
	P15ULvMg==;
Received: from viro by zeniv.linux.org.uk with local (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKKqY-00000007yio-1e8O;
	Wed, 28 May 2025 17:45:46 +0000
Date: Wed, 28 May 2025 18:45:46 +0100
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
Message-ID: <20250528174546.GC2023217@ZenIV>
References: <20250527-userptr-newtype-v2-1-a789d266f6b0@google.com>
 <20250527221211.GB2023217@ZenIV>
 <aDbpsB3ayj6tFfbI@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aDbpsB3ayj6tFfbI@google.com>
Sender: Al Viro <viro@ftp.linux.org.uk>

On Wed, May 28, 2025 at 10:47:12AM +0000, Alice Ryhl wrote:

> We don't currently have any way to perform that kind of pointer-math on
> user pointers, nor do we have any users of it. I imagine that this type
> checking is only useful if you can actually perform pointer math in the
> first place?

What you want is something like
	x->field::UserPtr(beta) iff
		x::UserPtr(alpha) and
		_.field::beta where _::alpha

Generated code would be "add offset and cast to pointer to type of...",
but doing that manually would really invite headache.
