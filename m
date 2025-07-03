Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78FBD19CC02;
	Thu,  3 Jul 2025 14:00:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751551208; cv=none; b=m0YLs5pNUViLszfF5B9aJkH1bb1Ftn0MYQ4Dm8dTtE446ITpFwTdjRoOVan+TnPHH9eakmfetGTW6VBof91EMEochmsgWNVCPro1BbMHDOAiiNk31R7PGD7XjyvG3RrGhLWfQl5KIToSmbHeqSaHbvLTVuXVp1KbD0kzsrIdxcI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751551208; c=relaxed/simple;
	bh=z0l6M7k+mVMvCnBAZwqXfugO18tiGOdTLo/OevwD0aY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aIOWTa2mxoGFiIH1nww90IBN3EtMzdhhvj1CryrIGwPG+TbzYzlcTFEXxr95mpKJoPMvKtnJFCeB3gEuA7GBsdjboAfbPrRcKk7Vtbak5VKu6Z6gqiePAnmfxaPvSTWNIslKrGgpxunSGt0221X1VyyeU9qWx2x91oNCSrTxuz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MDbJ1y5q; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MDbJ1y5q"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84DDFC4CEE3;
	Thu,  3 Jul 2025 14:00:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751551208;
	bh=z0l6M7k+mVMvCnBAZwqXfugO18tiGOdTLo/OevwD0aY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MDbJ1y5qEUPALM1ov6+fuGqISP3tniHLUWs4yzprIqTIEPcmSyg80c/xMDBiKErMR
	 HHFm8ZwyCfqn5TGHBURkg70oRWVkc5aET/3/Iac5W1mEYPk7nvyD2Z/ZvlHeEpGG7p
	 jm1XbzoYrskrAtNpy1p4HPvN93vOw1eBEb4nWw/egIYpeQtNsFK/b+efKRmdjNdsAd
	 R4ngawcmv1LRSklqjYMFZjR9c0EK2i3fRmVN3NdWSeELzmXyECbS6jxNZ353FWbKtp
	 sOCCkyTZrH5tsKBz/4Midmkd939lmldw1HVhPCHXgoUADypGvxlZdQcTPZI2tzeJzA
	 2fIFigYi+7K5A==
Date: Thu, 3 Jul 2025 16:00:01 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Alice Ryhl <aliceryhl@google.com>, Benno Lossin <lossin@kernel.org>,
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
Message-ID: <aGaM4YflAJF-PXuH@pollux>
References: <2025070131-icon-quarters-0c16@gregkh>
 <aGPtCBB6nWTNJuwK@pollux>
 <2025070137-tartar-juncture-fcd2@gregkh>
 <aGP6d2-jJy5rtjMK@pollux>
 <aGZVUqangIR-c4aW@google.com>
 <DB2COGYW20C5.2YN1TFXR87UTS@kernel.org>
 <CAH5fLgjaNzOHNxa+XY1c2V5A1H2RhWP9gHAAmHx=9LN9CbHq=Q@mail.gmail.com>
 <2025070349-tricky-arguable-5362@gregkh>
 <aGZ3q0PEmZ7lV4I-@pollux>
 <2025070353-algebra-exhume-1f21@gregkh>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2025070353-algebra-exhume-1f21@gregkh>

On Thu, Jul 03, 2025 at 02:50:48PM +0200, Greg Kroah-Hartman wrote:
> On Thu, Jul 03, 2025 at 02:29:31PM +0200, Danilo Krummrich wrote:
> > On Thu, Jul 03, 2025 at 01:41:53PM +0200, Greg Kroah-Hartman wrote:
> > > Yes, we need to be able to have a debugfs file callback handle a mutable
> > > structure in order to lock things correctly.  We also need to have it be
> > > mutable so that it can MODIFY the value (everyone seems to forget that
> > > debugfs allows that...)
> > 
> > Well, that's possible with both approaches. Data behind a lock becomes mutable
> > once you grabbed the lock. That's the same in both cases.
> > 
> > The difference is that with the pin-init approach I propose you can't have what
> > Alice sketched up. And I think it's even desirable that you can't do it.
> > 
> > Let's me explain the difference on a simplified example, based on Alice'
> > example.
> > 
> > ForeignOwnable API
> > ------------------
> > 
> > 	#[pin_data]
> > 	struct Process {
> > 	    task: ARef<Task>,
> > 	    #[pin]
> > 	    inner: SpinLock<ProcessInner>,
> > 	}
> > 	
> > 	pub(crate) struct ProcessInner {
> > 	    threads: RBTree<i32, Arc<Thread>>,
> > 	    max_threads: u32,
> > 	}
> > 
> > Here we have to create an Arc<Process> (let's call it process) and create files
> > from it.
> > 
> > 	let file_threads = dir.create_file("threads", process);
> > 	let file_max_threads = dir.create_file("max_threads", process);
> > 
> > In the file system callback of both of these, we now have an Arc<Process>, hence
> > we can access:
> > 
> > 	let guard = process.inner.lock();
> > 
> > 	read_or_write(guard.max_threads);
> > 
> > and in the other file:
> > 
> > 	let guard = process.inner.lock();
> > 
> > 	read_or_write(guard.max_threads);
> > 
> > Pin-Init API
> > ------------
> > 
> > 	#[pin_data]
> > 	struct Process {
> > 	    task: ARef<Task>,
> > 	    #[pin]
> > 	    inner: File<SpinLock<ProcessInner>>,
> > 	}
> > 	
> > 	pub(crate) struct ProcessInner {
> > 	    threads: RBTree<i32, Arc<Thread>>,
> > 	    max_threads: u32,
> > 	}
> > 
> > Here Process does not need to be within an Arc and no separate file instances
> > need to be kept around, that happens already within the constructor of Process:
> > 
> > 	pin_init!(Process {
> > 	   inner <- dir.create_file("process_inner", ...),
> > 	   [...]
> > 	})
> > 
> > The file itself has a reference to SpinLock<ProcessInner>, hence we can access:
> > 
> > 	let guard = inner.lock();
> > 
> > 	read_or_write(guard.threads)
> > 	read_or_write(guard.max_threads)
> > 
> > The difference is that with the ForeignOwnable API it was possible to have
> > separate files for threads and max_threads.
> > 
> > While with the pin-init one we either have to have a single file exposing
> > ProcessInner (which is what I did above) or protect threads and max_threads
> > with separate locks (of course max_threads could also just be an atomic).
> > 
> > (If you like I can sketch up this case as well.)
> > 
> > At a first glance this seems like an undesirable limitation, but I argue that
> > this is a good thing.
> > 
> > The reason I think so is what I also explained in [1], but let me adjust it a
> > bit for this reply:
> > 
> > threads and max_threads being protected by the same lock means that they are in
> > a certain relationship to each other. Meaning that they only really make sense
> > looking at them atomically.
> > 
> > So I argue it does not make sense to expose those values to userspace through
> > separate files.
> > 
> > For instance:
> > 
> > 	$ cat max_threads && cat threads
> > 	$ 5
> > 	$ 10
> > 
> > This way you may read 5 max_threads, but 10 actual threads, because things may
> > have changed in between the two cat commands.
> > 
> > However, if instead, they are exposed through a single file, we get an atomic
> > view of them, such that the semantic relationship between them is preserved.
> > 
> > For instance:
> > 
> > 	$ cat process_info
> > 	$ threads: 2
> > 	$ max_threads: 10
> 
> I think you mean to write:
>  	$ cat process_info
>  	threads: 2
>  	max_threads: 10
> 
> right?

Yes, indeed. :)
