Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45FB8233127;
	Thu,  3 Jul 2025 12:50:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751547053; cv=none; b=JdJ2hZyJB7Mad5zs6nPYCkUh8c2MxkR9dySco9LHoXjgi/CHmmuw5e09l2Kd+qhPrkaedvhnGlMY/w7Hqj+1XM+eTWbVzuQKjShSdfaZP8LbvkVCrTz8AcR4ASfJjspm59T5YzsFiRrHdnJ4e4D95RFmHztkF2skRS96X7ORKXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751547053; c=relaxed/simple;
	bh=RUtbH0FKvFEZ9xAEl4E1iiZ0teKFnEEvUjve+lHqvEY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LuAlTmN17vZDmHZ/0t07gcoBQkjfYFuxyu1cTvSeDjLJ/xR9J98AFRjSQD4HansljEEfsqHBvwoWT6qNyreapIU7XjwFY8wb2i4m5jUH0cg2zSCSM03L4F/WADp3h18ZmxbUjbIfsvQ5WNAx5ArBDyYVCTy+LuR5ubNWazgLrSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=SWvE5RKE; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="SWvE5RKE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5ED63C4CEE3;
	Thu,  3 Jul 2025 12:50:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1751547053;
	bh=RUtbH0FKvFEZ9xAEl4E1iiZ0teKFnEEvUjve+lHqvEY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SWvE5RKE62wnCSZHCqbLlsbjze6jvLQd0XxrOHq3OKeKu/y3rdLg3XgSGmDOM+Aum
	 40A5DMWH2MRWCQap9DvsM75Znj3zy9FEd7vShfa/i1vWLbAuSdOiwsG+lDgzBs3Rxv
	 9SJqnZidFyH6WSRk8pt7qHVBxMD3bMCH/xNEid7c=
Date: Thu, 3 Jul 2025 14:50:48 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Danilo Krummrich <dakr@kernel.org>
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
Message-ID: <2025070353-algebra-exhume-1f21@gregkh>
References: <aGLUl7ZtuQBPoCuv@pollux>
 <2025070131-icon-quarters-0c16@gregkh>
 <aGPtCBB6nWTNJuwK@pollux>
 <2025070137-tartar-juncture-fcd2@gregkh>
 <aGP6d2-jJy5rtjMK@pollux>
 <aGZVUqangIR-c4aW@google.com>
 <DB2COGYW20C5.2YN1TFXR87UTS@kernel.org>
 <CAH5fLgjaNzOHNxa+XY1c2V5A1H2RhWP9gHAAmHx=9LN9CbHq=Q@mail.gmail.com>
 <2025070349-tricky-arguable-5362@gregkh>
 <aGZ3q0PEmZ7lV4I-@pollux>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aGZ3q0PEmZ7lV4I-@pollux>

On Thu, Jul 03, 2025 at 02:29:31PM +0200, Danilo Krummrich wrote:
> On Thu, Jul 03, 2025 at 01:41:53PM +0200, Greg Kroah-Hartman wrote:
> > Yes, we need to be able to have a debugfs file callback handle a mutable
> > structure in order to lock things correctly.  We also need to have it be
> > mutable so that it can MODIFY the value (everyone seems to forget that
> > debugfs allows that...)
> 
> Well, that's possible with both approaches. Data behind a lock becomes mutable
> once you grabbed the lock. That's the same in both cases.
> 
> The difference is that with the pin-init approach I propose you can't have what
> Alice sketched up. And I think it's even desirable that you can't do it.
> 
> Let's me explain the difference on a simplified example, based on Alice'
> example.
> 
> ForeignOwnable API
> ------------------
> 
> 	#[pin_data]
> 	struct Process {
> 	    task: ARef<Task>,
> 	    #[pin]
> 	    inner: SpinLock<ProcessInner>,
> 	}
> 	
> 	pub(crate) struct ProcessInner {
> 	    threads: RBTree<i32, Arc<Thread>>,
> 	    max_threads: u32,
> 	}
> 
> Here we have to create an Arc<Process> (let's call it process) and create files
> from it.
> 
> 	let file_threads = dir.create_file("threads", process);
> 	let file_max_threads = dir.create_file("max_threads", process);
> 
> In the file system callback of both of these, we now have an Arc<Process>, hence
> we can access:
> 
> 	let guard = process.inner.lock();
> 
> 	read_or_write(guard.max_threads);
> 
> and in the other file:
> 
> 	let guard = process.inner.lock();
> 
> 	read_or_write(guard.max_threads);
> 
> Pin-Init API
> ------------
> 
> 	#[pin_data]
> 	struct Process {
> 	    task: ARef<Task>,
> 	    #[pin]
> 	    inner: File<SpinLock<ProcessInner>>,
> 	}
> 	
> 	pub(crate) struct ProcessInner {
> 	    threads: RBTree<i32, Arc<Thread>>,
> 	    max_threads: u32,
> 	}
> 
> Here Process does not need to be within an Arc and no separate file instances
> need to be kept around, that happens already within the constructor of Process:
> 
> 	pin_init!(Process {
> 	   inner <- dir.create_file("process_inner", ...),
> 	   [...]
> 	})
> 
> The file itself has a reference to SpinLock<ProcessInner>, hence we can access:
> 
> 	let guard = inner.lock();
> 
> 	read_or_write(guard.threads)
> 	read_or_write(guard.max_threads)
> 
> The difference is that with the ForeignOwnable API it was possible to have
> separate files for threads and max_threads.
> 
> While with the pin-init one we either have to have a single file exposing
> ProcessInner (which is what I did above) or protect threads and max_threads
> with separate locks (of course max_threads could also just be an atomic).
> 
> (If you like I can sketch up this case as well.)
> 
> At a first glance this seems like an undesirable limitation, but I argue that
> this is a good thing.
> 
> The reason I think so is what I also explained in [1], but let me adjust it a
> bit for this reply:
> 
> threads and max_threads being protected by the same lock means that they are in
> a certain relationship to each other. Meaning that they only really make sense
> looking at them atomically.
> 
> So I argue it does not make sense to expose those values to userspace through
> separate files.
> 
> For instance:
> 
> 	$ cat max_threads && cat threads
> 	$ 5
> 	$ 10
> 
> This way you may read 5 max_threads, but 10 actual threads, because things may
> have changed in between the two cat commands.
> 
> However, if instead, they are exposed through a single file, we get an atomic
> view of them, such that the semantic relationship between them is preserved.
> 
> For instance:
> 
> 	$ cat process_info
> 	$ threads: 2
> 	$ max_threads: 10

I think you mean to write:
 	$ cat process_info
 	threads: 2
 	max_threads: 10

right?

> So, what I'm trying to say is, I think it's a good thing if fields that are
> protected by the same lock can't be exposed through separate files, because it
> means that the fields only make sense in the context of each other.
> 
> Or saying it the other way around, if it makes sense to expose fields through
> separate files, it means they're unrelated to each other and hence should be
> protected with separate locks, rather than a common one.
> 
> IMHO it's even a good thing beyond the scope of debugfs, because it forces
> developers to really think about organizing structures properly, e.g. in a way
> that only fields that really belong behind a certain lock are placed behind this
> lock.
> 
> > So how about a platform driver that exposes values read from a platform
> > device (i.e. a soc info driver), that also includes a
> > local-to-the-device data structure that can be locked and modified?
> > That should cover all the use cases that I can think of at the moment.
> 
> Yes, I also really like to have that.
> 
> But, again, both approaches can do this. It's just that I really discourage the
> one that forces us to have an Arc instance on structures exposed through
> debugfs, since this messes with the driver's lifetime and ownership
> architecture in a bad way.
> 

Thanks for the long descriptions, that's great to help out here.  I'll
wait for the next patch series with a real example to show my ignorance
of rust some more :)

thanks,

greg k-h
