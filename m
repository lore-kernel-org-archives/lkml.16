Received: from zeniv.linux.org.uk (zeniv.linux.org.uk [62.89.141.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0C001DE8AD;
	Wed, 28 May 2025 20:01:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.89.141.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748462492; cv=none; b=CzpBul+nLol+jemG+1JhyqMoF1WTZ+C/A/BA4sLhoJ8qOVwJ/9gybJ7HiAjqYFfA7jIBRmYU/KFWEXD5Rfl2zjjtRJJyUufsISy372mY5/8Y/vXGxKGWP6/BX8IhFz63ULIVdN9EMj2gGVswJHAEbAlsI6A3gQs3vPt8K8AXyzc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748462492; c=relaxed/simple;
	bh=A1Ky1Pg/WuDt4SJ7yWJhVPZwBDVd6rWYJ8XLCUaDi0k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qXRXr1a52e8b6F8n43Pgvi8nEMhDFfe7mvB+lrToqOAsmioROSX1p1UU4eb0QlzXX4fVVg6BGHk4ZurotxcptMdhxGp9gV/E8NxYSTSkh88yFfehH8+2rJwRso0O5dzG9y86M5M5wXj3iWVqK3RDPDcOdduON2+S1wq6BfaC1IM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zeniv.linux.org.uk; spf=none smtp.mailfrom=ftp.linux.org.uk; dkim=pass (2048-bit key) header.d=linux.org.uk header.i=@linux.org.uk header.b=d8PcjOyN; arc=none smtp.client-ip=62.89.141.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zeniv.linux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ftp.linux.org.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linux.org.uk header.i=@linux.org.uk header.b="d8PcjOyN"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=linux.org.uk; s=zeniv-20220401; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=t9ZDI2fbFaZxw/Hi/Ar0BF0dqM6pRsb+8q9S5GBxCqQ=; b=d8PcjOyNcAEYTX5j/kM5EuKi9t
	wk4la5Uic8Fd1vZKOP8roelHlrSEBLnGS+LGU6hve2XokIBNWtWjHvkAXOCGlwP/+hqNpdtHEX5yZ
	IJ5Efuhnipe8tg17fLTNwRT6fuNOB68DQ2LyZkvx5NIvAbuMO4KT31M8XvOSoRIJ0VrPcG3fh0XpL
	9lAFgyocpwJOJIFwUK63PlkwNQYQrfxUKWesETHfq6/ncq9bvkAdLmmZWXDlWqguZWoQzlr6SyQSc
	KVj6TBT1FrnabtLBe7uADlTcylKSBz0vgBOB2yjH0ID44uRyq11Q290dGl/VbzIIQJ7hXkBaxqd85
	ZroSaD5g==;
Received: from viro by zeniv.linux.org.uk with local (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKMxl-000000094hL-1gS9;
	Wed, 28 May 2025 20:01:21 +0000
Date: Wed, 28 May 2025 21:01:21 +0100
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
Message-ID: <20250528200121.GD2023217@ZenIV>
References: <20250527-userptr-newtype-v2-1-a789d266f6b0@google.com>
 <20250527221211.GB2023217@ZenIV>
 <aDbpsB3ayj6tFfbI@google.com>
 <20250528174546.GC2023217@ZenIV>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250528174546.GC2023217@ZenIV>
Sender: Al Viro <viro@ftp.linux.org.uk>

On Wed, May 28, 2025 at 06:45:46PM +0100, Al Viro wrote:
> On Wed, May 28, 2025 at 10:47:12AM +0000, Alice Ryhl wrote:
> 
> > We don't currently have any way to perform that kind of pointer-math on
> > user pointers, nor do we have any users of it. I imagine that this type
> > checking is only useful if you can actually perform pointer math in the
> > first place?
> 
> What you want is something like
> 	x->field::UserPtr(beta) iff
> 		x::UserPtr(alpha) and
> 		_.field::beta where _::alpha
> 
> Generated code would be "add offset and cast to pointer to type of...",
> but doing that manually would really invite headache.

... except that -> comes with wrong connotations, of course.  Hell knows
what a decent syntax would look like.
