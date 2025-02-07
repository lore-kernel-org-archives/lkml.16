Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F00B4B652;
	Fri,  7 Feb 2025 00:35:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738888544; cv=none; b=uPzyjJ255M3pk1IiabneYIKd8n1smlV6MSG2Aott56m9ExsVlxCNJp1stuRwAv6L/zI/2Rx++FMhE5vnhVTlhsB/YlhyHYUBsTNHomNBro38HV5sSsKIz0YZTV7JEo97WeJlZySECiGEpc1WwpU82X/TuvKxRW+4mT/TIfrAhJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738888544; c=relaxed/simple;
	bh=O/WXDPFFzJgiadrkK901IXY0sEUM6zkrUhB7U50NAlc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a9YE58T9nZc2js18AmLbNIIse2kCQNYueeM1ujc/SdNyo1fxx/DZOmeR8IlXPltis7q7Nog+njp9xtnYFnb1RbUlJ6l8pDHIdYbkHhU8uqQHfmN6OLb8K8eBoKZ/BB2FuRcRfxgfGe3vCSU/ob6nOlZ48Znd60cwj9YTF1hzE/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DyXiHJ39; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DyXiHJ39"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22A07C4CEDD;
	Fri,  7 Feb 2025 00:35:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738888543;
	bh=O/WXDPFFzJgiadrkK901IXY0sEUM6zkrUhB7U50NAlc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DyXiHJ39b2O6msyD+iJ4yLCd7u1gtkgvI1IRJujiQRd2wVAIwnp0VEVpHyXwXP+Gt
	 cZEA/xupKQlyYpEO/DvN8fQHhhJQ/MIT/CsLoQzC4Ac65HJDvSDcCdha2uvzTHPh5H
	 wi8j7721R7BHU+HyfNz2DHBuA7PDUzriEk5V8/65YWe7E93PJ8TV/TwoT8QaLLkG09
	 yPU7cDTcoZFYiwLYVCodRNwoMiRJ3VFZcPL2qrEbtLNVlmyc7OoHN6J2yGufKrMTsV
	 CUAGJ+1I6m6OrSyG+aFZDJOKv0FCREFOg54n5GlFgTWVQQ3mTb/NNx9POsw1cx7caG
	 aljVR0Fdnrkyw==
Date: Fri, 7 Feb 2025 01:35:37 +0100
From: Danilo Krummrich <dakr@kernel.org>
To: Lyude Paul <lyude@redhat.com>
Cc: rust-for-linux@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	=?iso-8859-1?Q?Ma=EDra?= Canal <mairacanal@riseup.net>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Wedson Almeida Filho <wedsonaf@gmail.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Xiangfei Ding <dingxiangfei2009@gmail.com>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] rust/kernel: Add faux device bindings
Message-ID: <Z6VVWT_vqb9EGGqv@cassiopeiae>
References: <20250206210503.102061-2-lyude@redhat.com>
 <Z6U4APfuIEOgMzmd@cassiopeiae>
 <13397687a4490bc5410402c9e92a90959756e102.camel@redhat.com>
 <Z6VQ0D-L4Z0pxxsa@cassiopeiae>
 <bab25d10d69e1b6b135cee69ee71be270ed92586.camel@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bab25d10d69e1b6b135cee69ee71be270ed92586.camel@redhat.com>

On Thu, Feb 06, 2025 at 07:21:24PM -0500, Lyude Paul wrote:
> But yeah - I mean, faux::Registration::as_ref::<device::Device>() lets you get
> a device::Device which you can take a reference on using ARef. So you still
> can take a reference count to the device without us adding support for it
> explicitly was what I was getting at.

Yeah, that's true. But it would be nice to have a separate type faux::Device for
that, just like the C struct faux_device only exists to make this obvious given
that it's defined as follows.

struct faux_device {
	struct device dev;
};

But I don't think we need that right away. Having a faux::Registration with
as_raw() should be enough for now.
