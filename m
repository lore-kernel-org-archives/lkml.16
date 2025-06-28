Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4732F21B908;
	Sat, 28 Jun 2025 06:07:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751090831; cv=none; b=M11+BeiNl06fzP1cEavZAa7y7q80t/UDK9Hfr91d4NI1RSsYjzL+72zb1tVeY5BKGeKdYGZKAdS+XrBhTeJLAy/Y+dQR+U9jC1Xb0BgbCMcClLfln/Za7dP82zI4guydOfgST9gxtgofpYvDZQnkCH6tm+TvzF6mLQRfE2wng1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751090831; c=relaxed/simple;
	bh=Y0PXibu2f19mL5vdcjnS1NWRqhdzASHsimXfJ/bC+bg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZVVIBVrUSBbvlBkO7KxntmkCletyXj+QC9JNglLL8YwvcjAmnhjf+MOXr/YK1BkpXTdFTbiVKHylkPP1OOR/5yCoxzL76xfx+bLIgxqYE2teR23uVO8TaCxD0WEkvfalvQqYv0bl4iZHSdl6X1Gw1i3EHZL8tYvrWfYnDETLtbY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=A5NuPVG5; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="A5NuPVG5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92C83C4CEEA;
	Sat, 28 Jun 2025 06:07:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1751090831;
	bh=Y0PXibu2f19mL5vdcjnS1NWRqhdzASHsimXfJ/bC+bg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=A5NuPVG5tq5OtbcW/liipylp/cMMHVXHM3iLTFSdSf3+SQekUwNZQLKtInhoNK7KD
	 td/pHsVRBHU2s1Oh4UK0I/H1DVRopMdNjvQl4jMZ0fg/NzlvAfjcdtzh42By6TcYFm
	 mvjBZduMQ0LhYTrv05PVgOnC1Iv11UhMQXt3LR+M=
Date: Sat, 28 Jun 2025 07:07:08 +0100
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
Message-ID: <2025062845-periscope-crayfish-e69a@gregkh>
References: <20250627-linux-miscident-v1-1-d37c870550ef@google.com>
 <CAGSQo03_FTLyYpvLRO8pFzZ1_aCu+i2-Xp5GVYVDzEg5MKGyPQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAGSQo03_FTLyYpvLRO8pFzZ1_aCu+i2-Xp5GVYVDzEg5MKGyPQ@mail.gmail.com>

On Fri, Jun 27, 2025 at 04:46:04PM -0700, Matthew Maurer wrote:
> On Fri, Jun 27, 2025 at 4:42 PM Matthew Maurer <mmaurer@google.com> wrote:
> >
> > A common pattern in the kernel is to test whether a file belongs to a
> > particular driver by checking its `f_op` struct against an expected
> > value. This provides a safe way to perform that test for `MiscDevice`
> > implementations without needing to directly expose the vtable.
> >
> > Signed-off-by: Matthew Maurer <mmaurer@google.com>
> 
> Additionally, we have a sample user[1] of this in the Android ashmem
> wrapper. They're currently working around it by grabbing the vtable
> out of the registration and testing manually.
> 
> [1]: https://android-review.git.corp.google.com/c/kernel/common/+/3477511

As ashmem isn't going to be upstream, it's hard for us to treat this as
a real user :)

