Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB5401EDA1E;
	Sun, 29 Jun 2025 15:12:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751209924; cv=none; b=Kpm91lRu7Vcq6jUOjAx9uuZo8014I4s4/OvNRaj51CbLJOYJFm7e7KwvUBHuiksXzZKgP85hM2bijC1DT1Pa7Rxve5BLtV4CWVMw83TTKU6E23rUey2HfFbpE2wj+F2hGi5Br20FuuI395soJRhVdec79XJ0oZprP/TNc5qV7Tk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751209924; c=relaxed/simple;
	bh=DQE4DrUtiQr80ln5kifnA9R4saKL6OMi+bAy//E728U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VC1MHLBC+Yd2h/FVAO/3VRDuS3fnLrRxFsXgduShvf3eDWSR3ZvN0Ur54QrytLohlMZRLByM1jdRwzYV73PlxeKsBd2G0636h1zAsJedi/Mzfn6o3hlAR9Hpaufk+UIXt/UON2QV0VcjwyWDcK9V+nwkY5FjmgGGM8Nt/b2a7dc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gPIR6SnG; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gPIR6SnG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CBFF3C4CEEB;
	Sun, 29 Jun 2025 15:12:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751209924;
	bh=DQE4DrUtiQr80ln5kifnA9R4saKL6OMi+bAy//E728U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gPIR6SnGRhG5BL+LMS41+enMzO8n6mJP2pvVRbOlM9oi5VLItx4P31BzACLjXMMDs
	 dC8S95KqGjUJMY/eWOnGXJOZoEjLqi5C1hlTW9L9Wd+rGsNwZEgRcWsVeTPSXmQkIq
	 laH/RMs3DAdIQs5s5Ub+Vy58motCBXbMoMYB1w88x5pIjjeEPDfroD+M99r30/4yCF
	 JxWcFx4Zv2/V6i39j/XvfjB5N+iA2cwB6FYUGWG0xcs9X1+Q7veWUGReljwN34ZjyR
	 RgKTWHbV/Jr4HqbYd9GDpuYvym5M1GT1aOJYRqeG2H3IUBV128WzuooYZ6MCjnbEWM
	 llm4H9Ieo/JZw==
Date: Sun, 29 Jun 2025 17:11:58 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: Christian Schrefl <chrisi.schrefl@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Lee Jones <lee@kernel.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Benno Lossin <lossin@kernel.org>,
	Gerald =?iso-8859-1?Q?Wisb=F6ck?= <gerald.wisboeck@feather.ink>,
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 1/3] rust: implement `Wrapper<T>` for `Opaque<T>`
Message-ID: <aGFXvt2GistXZMmE@pollux>
References: <20250610-b4-rust_miscdevice_registrationdata-v6-0-b03f5dfce998@gmail.com>
 <20250610-b4-rust_miscdevice_registrationdata-v6-1-b03f5dfce998@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250610-b4-rust_miscdevice_registrationdata-v6-1-b03f5dfce998@gmail.com>

On Tue, Jun 10, 2025 at 10:27:55PM +0200, Christian Schrefl wrote:
> Moves the implementation for `pin-init` from an associated function
> to the trait function of the `Wrapper` trait and extends the
> implementation to support pin-initializers with error types.
> 
> Adds a use for the `Wrapper` trait in `revocable.rs`, to use the new
> `pin-init` function. This is currently the only usage in the kernel.
> 
> Reviewed-by: Danilo Krummrich <dakr@kernel.org>
> Reviewed-by: Gerald Wisböck <gerald.wisboeck@feather.ink>
> Reviewed-by: Alice Ryhl <aliceryhl@google.com>
> Reviewed-by: Benno Lossin <lossin@kernel.org>
> Signed-off-by: Christian Schrefl <chrisi.schrefl@gmail.com>

Applied to driver-core-testing, thanks!
