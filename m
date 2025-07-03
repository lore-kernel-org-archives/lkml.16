Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FF242571B2;
	Thu,  3 Jul 2025 12:45:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751546709; cv=none; b=p51RL089cG+42j6McoW4L8QXoFGwXcT64f3SdTl6b2HMEHBSUchDQ1tKM4gCho9mfwfi4iW1GEUyHdtDisahHwB69FvEY6X4wiThFjNzudV1Nq1p1QnT+yzzIybr6K9uEfdLOXgLwiweeM3EwbII+syYIMS0kRpJuR+PU5Dp1e4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751546709; c=relaxed/simple;
	bh=f3SdX+yI+BEn1CSE9MjjvM4/QtlA1wnpIQpB8iY2nsM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WfGV1gdW/3VD4uotPcZqChjW8XqwqY2Y6T5FfduAUkK6jeZ1qgUswv/eDglQQS3WlVmwyaTlQIHMFPsZuHx4XtMsuyH3zDpnIeGo2Fe0p9lcynKEcO2/cTUYbiEPjUZXPWCo2UqyiO/lWNIlBwRaseEj2Z3UmZB7C2uH2HtX9TQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=zHOTiZEy; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="zHOTiZEy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0CA47C4CEF5;
	Thu,  3 Jul 2025 12:45:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1751546708;
	bh=f3SdX+yI+BEn1CSE9MjjvM4/QtlA1wnpIQpB8iY2nsM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=zHOTiZEydjiTjTAe9MkYnLYQmd+U3dy3sSulljbKJ1mQV0rJH8TRlG7Eant3gSSPt
	 8yGKZ+gw+n9yATNvw0pxqNa4Fzwnfjl044MvIuKOef68wCf/dI8aVXWmcJDIlJofu/
	 Or2Hv0R6b1pVIztLCKBZFu2d58BYsPppTGkYfxQg=
Date: Thu, 3 Jul 2025 14:45:04 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Benno Lossin <lossin@kernel.org>
Cc: Alice Ryhl <aliceryhl@google.com>, Danilo Krummrich <dakr@kernel.org>,
	Matthew Maurer <mmaurer@google.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Sami Tolvanen <samitolvanen@google.com>,
	Timur Tabi <ttabi@nvidia.com>, linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	Dirk Behme <dirk.behme@de.bosch.com>
Subject: Re: [PATCH v8 4/6] rust: debugfs: Support arbitrary owned backing
 for File
Message-ID: <2025070320-annuity-earplugs-6eee@gregkh>
References: <aGLUl7ZtuQBPoCuv@pollux>
 <2025070131-icon-quarters-0c16@gregkh>
 <aGPtCBB6nWTNJuwK@pollux>
 <2025070137-tartar-juncture-fcd2@gregkh>
 <aGP6d2-jJy5rtjMK@pollux>
 <aGZVUqangIR-c4aW@google.com>
 <DB2COGYW20C5.2YN1TFXR87UTS@kernel.org>
 <CAH5fLgjaNzOHNxa+XY1c2V5A1H2RhWP9gHAAmHx=9LN9CbHq=Q@mail.gmail.com>
 <2025070349-tricky-arguable-5362@gregkh>
 <DB2F98GJQMTL.3UMZTA6FR7BA@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <DB2F98GJQMTL.3UMZTA6FR7BA@kernel.org>

On Thu, Jul 03, 2025 at 02:34:13PM +0200, Benno Lossin wrote:
> On Thu Jul 3, 2025 at 1:41 PM CEST, Greg Kroah-Hartman wrote:
> > On Thu, Jul 03, 2025 at 12:54:18PM +0200, Alice Ryhl wrote:
> >> On Thu, Jul 3, 2025 at 12:33 PM Benno Lossin <lossin@kernel.org> wrote:
> >> > How would your example look like with the current approach? IIUC, it
> >> > also wouldn't work, because the debugfs data can't be mutated?
> >> 
> >> I would store a bunch of `File<Arc<Process>>` instances somewhere.
> >> Each one has a closure that takes the spinlock and prints the
> >> appropriate value.
> 
> But you could also do that with the pin-init design?
> 
> > Ok, I think we need to see some "real" examples here of the api in use
> > before figuring it out further as I'm totally confused :)
> 
> Agreed :)
> 
> > Yes, we need to be able to have a debugfs file callback handle a mutable
> > structure in order to lock things correctly.
> 
> To me this seems orthogonal to storing the value in-place or in a
> `ForeignOwnable`.
> 
> > We also need to have it be mutable so that it can MODIFY the value
> > (everyone seems to forget that debugfs allows that...)
> 
> Well that changes things a lot IMO... How does the C side usually handle
> synchronization here? Does the driver decide that the structure exposed
> to debugfs is locked with eg a spinlock and then in the debugfs callback
> they just lock the same one?

It does whatever it feels like, so both are valid uses.

Sometimes a lock is involved, sometimes not.  Remember this is debugfs,
the only rule for it is "there are no rules except it requires root
permissions to access".

thanks,

greg k-h
