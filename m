Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CAE9227BB9;
	Wed, 16 Apr 2025 20:14:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744834475; cv=none; b=LQG5vyirRZYIvhhLT4FF/ze2Z8Gp4zZW/YopMSXhaudsYdtSeU3BRZe1NbhIptFg75sbEFq3nJYUn33QDbr73ay0cmLALvcqxy9ge5gC3p7miaQoRKFK/kTv4yGXeFzjPtPtjq1WiYHnC6bdIEsHveCM7rOaO1MPXJL3ppCMobM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744834475; c=relaxed/simple;
	bh=0mKPx6/Qe9FcMAKRK8WCVbNE7K42UNRQgpWxraLuHO0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oju5vmInWCrLSZIbSQRa2WrOARiEqxYHcznur90sVLIY7aVXgV54mdhkAPCx2Hc3VZuojwnjhAkMKyfeSBL8IqtzXQy7nf29YN9mY3DQJrc9jkqVobwYqEv7NYkK/gouHT622kee+HHdcE8A7IWv/5U10ygByYLz2+IPVuQ3pss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qPv7M7y7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qPv7M7y7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02083C4CEEE;
	Wed, 16 Apr 2025 20:14:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744834475;
	bh=0mKPx6/Qe9FcMAKRK8WCVbNE7K42UNRQgpWxraLuHO0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qPv7M7y72wDKRFeYcesOxWlUwqRFJhBySTA60q8guzqd5HydzgfyhOA5v7ziQAbXm
	 Je9ZLPLJRIj4Gs6vs5kcI4tUQ4ms1yYql/KzFj0e/rSXtMQYNmbXTySKtXmJE+eJ1c
	 7MUPiaRD1b6fXATcut4Q5h1n/WqY5C+s+x07Q1RwBONj/a3ACShRRVi7lYJHWvkLwB
	 pTOra1O0HQH8q/tE4tHCu8rzEAiNNtNNlBs9Apb3fZMSOH/2XQnenD2/XezuWC/b/C
	 S5cPSXKSU0RPeUcUYs6JyjiP0wNYtNfwa0dE4xByYpwrCExwaM8zOj7BFhOWsbYoPD
	 oliGhrBLj2OCw==
Date: Wed, 16 Apr 2025 10:14:34 -1000
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
Message-ID: <aAAPqtC_8k0lER62@slm.duckdns.org>
References: <20250411-create-workqueue-v1-1-f7dbe7f1e05f@google.com>
 <Z_1QzTdV8mHJYdQ6@cassiopeiae>
 <Z_4gb8ZAlbfhobgW@google.com>
 <Z_45kDv_wAHIBNpI@cassiopeiae>
 <Z_-f7Bgjw35iXkui@google.com>
 <aAAKwTj9egoFdq6G@slm.duckdns.org>
 <CAH5fLgjvk6841Tn+C64AT6nx3HeZ7EMzruoJPmvT2KNF2Trmng@mail.gmail.com>
 <aAAOwfmi-RcCtA6W@slm.duckdns.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aAAOwfmi-RcCtA6W@slm.duckdns.org>

On Wed, Apr 16, 2025 at 10:10:41AM -1000, Tejun Heo wrote:
> On Wed, Apr 16, 2025 at 10:08:35PM +0200, Alice Ryhl wrote:
> ...
> > > This should be pretty cheap and we can probably enable this for everyone,
> > > but if the overhead is noticeable, this can be an optional behavior
> > > depending on a workqueue flag.
> > 
> > My only concern is that we're executing work items *before* the
> > deadline they specified. There could be work items that assume this
> > doesn't happen? But maybe it's okay. Otherwise, what you suggest seems
> > reasonable enough to me.
> 
> That's already what flush_delayed_work() does, so I don't think it'd be too
> surprising. Alternatively, we can go for canceling on draining/destruction
> but that'd be more surprising I think. As long as the behavior is documented
> clearly, I don't see problems with running and flushing them.

Also, note that self-requeueing work items may still be pending after
draining a workqueue as the draining is best effort. This is considered a
bug in the caller and, we trigger a warn and just skip freeing the
workqueue. This is again not great but may be acceptable for rust too. If
one wants to improve this, now that we have disable_work(), we can probably
trigger warn after X retries and then switch to disabling & flushing
afterwards.

Thanks.

-- 
tejun
