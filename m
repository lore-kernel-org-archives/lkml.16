Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25B251E1C29;
	Wed, 16 Apr 2025 20:10:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744834243; cv=none; b=JmuRNP/VRiwnAprEa5ANN74DOYACq4/SSl0p4OmDHPnnl/p2ihYWAPwUfWALRU2+NWVX11zhwNV02kvsWXYPH9swDKAXkWO0VUZSEMb5d4YCK+CrNZGu053IZlazp5daoh7yTeYm90gVeBecmxAP5KrIwswwQTZ3kjRZ0T6sOLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744834243; c=relaxed/simple;
	bh=uNSknGRTypmLLgbZkT44oRKzJGwL6ZsiONV7p8bwBiE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G3oWC0T2TuCts7F4A/Ks+0W3r37jQVqfPQmkfL8jUOZ1UYKsMEe1hIPflzn02u5GvxqVOnfhNS5f2o742saskiy0SE7XU5H7t6zgXc4b+SssD+uyBZVXTfcJlddXP4dI+nOQl0fEf9g0k/0xlq0zwilEUsvVkJa2kFb+YaBVaQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=R2x55AHb; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="R2x55AHb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7761AC4CEE2;
	Wed, 16 Apr 2025 20:10:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744834242;
	bh=uNSknGRTypmLLgbZkT44oRKzJGwL6ZsiONV7p8bwBiE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=R2x55AHbiX6rlTH+b6QgJlRnKDtovu0rGMFse5B4SxXDqpMjEfQYv1HcXUSfJz7kp
	 rqw/vBiAw8M6iCWwFuujcMIRc32ere50JmZZWhtalUQ8OANxCD2bZXOadhmHMdJCfc
	 RBJuYuX34SBkb4Fv8FBuoifmqrOekggJjLqdamqjsPAUTeAjmYX05amte/voZXtJU0
	 XxQIWA+xdPWB+5L3Usqi9G99NvRhe5MbB7pv4S08nXjXOPYpplKjsL8Osfe3gmsWED
	 xPcieYQtI8J6UUVUo9s6WZKzmnrhAHBoZXJlXhFC4v7wT1zzkWiLZ/kDHQiZEiNGJE
	 dTWJykQRrZhxQ==
Date: Wed, 16 Apr 2025 10:10:41 -1000
From: Tejun Heo <tj@kernel.org>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Danilo Krummrich <dakr@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
	Lai Jiangshan <jiangshanlai@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Tamir Duberstein <tamird@gmail.com>, rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] workqueue: rust: add creation of workqueues
Message-ID: <aAAOwfmi-RcCtA6W@slm.duckdns.org>
References: <20250411-create-workqueue-v1-1-f7dbe7f1e05f@google.com>
 <Z_1QzTdV8mHJYdQ6@cassiopeiae>
 <Z_4gb8ZAlbfhobgW@google.com>
 <Z_45kDv_wAHIBNpI@cassiopeiae>
 <Z_-f7Bgjw35iXkui@google.com>
 <aAAKwTj9egoFdq6G@slm.duckdns.org>
 <CAH5fLgjvk6841Tn+C64AT6nx3HeZ7EMzruoJPmvT2KNF2Trmng@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAH5fLgjvk6841Tn+C64AT6nx3HeZ7EMzruoJPmvT2KNF2Trmng@mail.gmail.com>

On Wed, Apr 16, 2025 at 10:08:35PM +0200, Alice Ryhl wrote:
...
> > This should be pretty cheap and we can probably enable this for everyone,
> > but if the overhead is noticeable, this can be an optional behavior
> > depending on a workqueue flag.
> 
> My only concern is that we're executing work items *before* the
> deadline they specified. There could be work items that assume this
> doesn't happen? But maybe it's okay. Otherwise, what you suggest seems
> reasonable enough to me.

That's already what flush_delayed_work() does, so I don't think it'd be too
surprising. Alternatively, we can go for canceling on draining/destruction
but that'd be more surprising I think. As long as the behavior is documented
clearly, I don't see problems with running and flushing them.

Thanks.

-- 
tejun
