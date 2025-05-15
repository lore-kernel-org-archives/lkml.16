Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A55C428DEE6;
	Thu, 15 May 2025 11:44:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747309497; cv=none; b=Mqyeb4EmRVspcURZ6l/S14YYWYaQWZxjfaLZDz45SWStVZ4fGqf7Ualf20HKRtg/FFzxY32JpRL31r5Y5J+SglRNdUKKziqkJb9sNLlMN18YQ6G1okBvfXQLhjoB32RNXg0DhTwH/GjAGBw8uUlTLOgIoXiUzib59ruKbxsHOgk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747309497; c=relaxed/simple;
	bh=9L1IyfyzQObJzbaVGvEPZrNbRGkTUP7BBjXPMB7XoiU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eVH7apNf7AiL1QTEZpGD0mD1FIFThfztaAFERLvzSzgMc7SAJ1EOqVaMHGXQ8hfW6NLm2aG8aSB8GpUTl63Uvp9tBYxzBAWSuMm3BtwTK4KEUaWb9voiaGX8sEuFPgCbzsL5/0B2WKO2zzWxBHm0IIhOYggfNFuYeqE5dFIup6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=0FpzRxTF; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="0FpzRxTF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA271C4CEED;
	Thu, 15 May 2025 11:44:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1747309497;
	bh=9L1IyfyzQObJzbaVGvEPZrNbRGkTUP7BBjXPMB7XoiU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=0FpzRxTFUsa9HxV6CXrpFGp2bV4BtdySujaFJyCtIqWXoTIPVZM+s82/v1ggGc/ct
	 JwpUZ889TWiSgw7hA59a5J+/ti3J2dOpXmme8ucvgXNUrJMgRUQ1TLawj9EMHwanZ4
	 5/nzvO8qoLqnRhTrq7/3JgOQvtwzafeSaYbcFmG0=
Date: Thu, 15 May 2025 13:43:09 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Benno Lossin <lossin@kernel.org>
Cc: Matthew Maurer <mmaurer@google.com>, Danilo Krummrich <dakr@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Sami Tolvanen <samitolvanen@google.com>,
	Timur Tabi <ttabi@nvidia.com>, linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v5 4/4] rust: samples: Add debugfs sample
Message-ID: <2025051524-festival-afterglow-8483@gregkh>
References: <20250505-debugfs-rust-v5-0-3e93ce7bb76e@google.com>
 <20250505-debugfs-rust-v5-4-3e93ce7bb76e@google.com>
 <D9VPA1M45WBK.1TB4KOUXD24BD@kernel.org>
 <aCRdNJ2oq-REBotd@pollux>
 <CAGSQo0204_Dz65G33pAN3_iY=ejPXJRdAiB4ioM-nvMkAh0YXQ@mail.gmail.com>
 <D9WM0BP5446N.1NVNDCZ4Y2QN1@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <D9WM0BP5446N.1NVNDCZ4Y2QN1@kernel.org>

On Thu, May 15, 2025 at 10:59:44AM +0200, Benno Lossin wrote:
> On Wed May 14, 2025 at 11:55 PM CEST, Matthew Maurer wrote:
> > On Wed, May 14, 2025 at 2:07 AM Danilo Krummrich <dakr@kernel.org> wrote:
> >> However, I really think we should keep the code as it is in this version and
> >> just don't provide an example that utilizes ManuallyDrop and forget().
> >>
> >> I don't see how the idea of "manually dropping" (sub-)directories and files
> >> provides any real value compared to just storing their instance in a driver
> >> structure as long as they should stay alive, which is much more intuitive
> >> anyways.
> >
> > We can't easily do this, because dropping a root directory recursively
> > drops everything underneath it. This means that if I have
> >
> > foo/
> >   - bar/
> >   - baz/
> >
> > Then my directory handle for `bar` have to be guaranteed to outlive my
> > directory handle for `foo` so that I know it's didn't get deleted
> > under me. This is why they have a borrow onto their parent directory.
> > This borrow means that you can't (without `unsafe`, or something like
> > `yoke`) keep handles to `foo` and `bar` in the same struct.
> 
> Is there no refcount that we can use instead of borrowing? I guess not,
> since one can call `debugfs_remove`. What about a refcount on the rust
> side? or is debugfs not used for "debugging" and needs to have the
> performance of no refcount?

debugfs should never have any performance issues (i.e. you don't use it
for performant things.)

So refcount away!  That should never be an issue.

thanks,

greg k-h
