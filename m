Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97A6125D53C;
	Tue,  1 Jul 2025 20:16:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751401018; cv=none; b=H66z7HGA8gpPXJHkuzOXAg0/Ai2bcnNlvVk2HN4IaEf/yOjq2MQgR2uMekqxeljbqq4la7o7jCcPAbhPmTM6c2fiwo5mnS8MHvr/VH4zC8TLxKyhdYpb+dRdwm6YMSgFned42roRtauCsnXbcg0uoDVuUseacrHQzqdNTzDUP/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751401018; c=relaxed/simple;
	bh=uQ0iJKDAhEGdn0ddItDR1dQ8NW4FG3aqRSr3W+jd0CI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BQ4lDbCsYDksF3NVW+TMUW/FNF9rWR6FSa+R+PbgptNtpIA+SVGtWIFmq2nDKL6tuGqVbr2sawFFtgUSlCef1iMeHOkG0G/f/w4uxtRQ06PrIMs+RgBWcUVuENVUn1d6AcS2LvM5T16waPVOdFQaR5tlKvbbYxcR0fWIBsMumOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VssRePWb; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VssRePWb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD2F8C4CEEB;
	Tue,  1 Jul 2025 20:16:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751401018;
	bh=uQ0iJKDAhEGdn0ddItDR1dQ8NW4FG3aqRSr3W+jd0CI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VssRePWb/qHNJPZ2Mz+uZv0sI9fsMaeoWoNZVVuYzBEItA/fnJ00QWc92ay0Tj+Ew
	 bNAUiiP1QFHRWH1y4PRwbPJgkkHIRsM+i3+UyXrru1D1gvM/9RHWmXPFavyuULQfZ7
	 aMubAxFQd6UX89rUbI7b6IyLNxqD7TYzc9KaquDvoTBKTf32KDasvzaAnSDOeDMVkP
	 T9x9cJV+kDdTgFmJicbYwb9+OpG3WnhoANKRwLFhrJpMSfDGwJUtwjEkPrerDKUoeS
	 8vLj5A2UK7Q+U8pn8eRP1EEIgk1IvZ4yULLnZ2qZN5mMCbPm4v7zneqAm9N8hDfc7Z
	 333NF4wEqKUxA==
Date: Tue, 1 Jul 2025 22:16:51 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: Benno Lossin <lossin@kernel.org>
Cc: Matthew Maurer <mmaurer@google.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Sami Tolvanen <samitolvanen@google.com>,
	Timur Tabi <ttabi@nvidia.com>, linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	Dirk Behme <dirk.behme@de.bosch.com>
Subject: Re: [PATCH v8 4/6] rust: debugfs: Support arbitrary owned backing
 for File
Message-ID: <aGRCM1VRHI8EvZmd@pollux>
References: <2025070131-icon-quarters-0c16@gregkh>
 <aGPtCBB6nWTNJuwK@pollux>
 <2025070137-tartar-juncture-fcd2@gregkh>
 <aGP6d2-jJy5rtjMK@pollux>
 <CAGSQo00eG5oRdN_xORLUyUauLi_vzypU-gz6DSU_FzaAbHRLng@mail.gmail.com>
 <aGQ1VsnFaxBo9zaM@pollux>
 <DB0Z71SF488V.3QURUHHELOY84@kernel.org>
 <3c928a0e-ccd4-4ba0-9f42-9f2bb0203e75@kernel.org>
 <DB0ZJVL0682F.ZNNOXEIDL5NN@kernel.org>
 <DB0ZOHPFJR7T.1W3OF32GDL55O@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DB0ZOHPFJR7T.1W3OF32GDL55O@kernel.org>

On Tue, Jul 01, 2025 at 10:09:10PM +0200, Benno Lossin wrote:
> On Tue Jul 1, 2025 at 10:03 PM CEST, Benno Lossin wrote:
> > On Tue Jul 1, 2025 at 9:58 PM CEST, Danilo Krummrich wrote:
> >> On 7/1/25 9:46 PM, Benno Lossin wrote:
> >>> On Tue Jul 1, 2025 at 9:21 PM CEST, Danilo Krummrich wrote:
> >>>> On Tue, Jul 01, 2025 at 11:11:13AM -0700, Matthew Maurer wrote:
> >>>>> If we implement *only* pinned files, we run into an additional problem
> >>>>> - you can't easily extend a pinned vector. This means that you cannot
> >>>>> have dynamically created devices unless you're willing to put every
> >>>>> new `File` into its own `Box`, because you aren't allowed to move any
> >>>>> of the previously allocated `File`s for a resize.
> >>>>>
> >>>>> Where previously you would have had
> >>>>>
> >>>>> ```
> >>>>> debug_files: Vec<File>
> >>>>> ```
> >>>>>
> >>>>> you would now have
> >>>>>
> >>>>> ```
> >>>>> debug_files: Vec<PinBox<File<T>>>
> >>>>> ```
> >>>>
> >>>> Stuffing single File instances into a Vec seems like the wrong thing to do.
> >>>>
> >>>> Instead you may have instances of some data structure that is created
> >>>> dynamically in your driver that you want to expose through debugfs.
> >>>>
> >>>> Let's say you have (userspace) clients that can be registered arbitrarily, then
> >>>> you want a Vec<Client>, which contains the client instances. In order to provide
> >>>> information about the Client in debugfs you then have the client embed things as
> >>>> discussed above.
> >>>>
> >>>> 	struct Client {
> >>>> 	   id: File<ClientId>,
> >>>> 	   data: File<ClientData>,
> >>>> 	   ...
> >>>> 	}
> >>>>
> >>>> I think that makes much more sense than keeping a Vec<Arc<Client>> *and* a
> >>>> Vec<File> separately. Also, note that with the above, your Client instances
> >>>> don't need to be reference counted anymore.
> >>>>
> >>>> I think this addresses the concerns below.
> >>> 
> >>> You still have the issue that `Client` now needs to be pinned and the
> >>> vector can't be resized. But if you know that it's bounded, then we
> >>> could just make `Pin<Vec<T>>` work as expected (not relocating the
> >>> underlying allocation by not exposing `push`, only
> >>> `push_within_capacity`).
> >>> 
> >>> We also could have a `SegmentedVec<T>` that doesn't move elements.
> >>> Essentially it is
> >>>      
> >>>      enum SegmentedVec<T> {
> >>>          Cons(Segment<T>, KBox<SegmentedVec<T>>)
> >>>          Nul,
> >>>      }
> >>> 
> >>>      struct Segment<T> {
> >>>          elements: [T; 16]
> >>>      }
> >>> 
> >>> or make the segments variable-sized and grow them accordingly.
> >>
> >> That sounds a lot like the perfect application for XArray. :)
> >
> > Haha I didn't know this already existed in the kernel :) Yeah then we
> > should make XArray work for this use-case.
> 
> Ah wait, I meant for `SegmentedVec<T>` to store multiple `T` in the same
> allocation, so it would only grow sometimes and amortize the allocations
> just like `Vec`. It seems to me that XArray only stores pointers, so you
> have to box everything (which we're trying to avoid IIUC).

Yes, that sounds good. And if the potential number of Client instances can get
pretty large Vec isn't a good choice anyways. If we really get a ton of clients,
they should be allocated with a kmem_cache and stored in an XArray, maple tree,
etc.
