Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63AB02E266C;
	Thu,  3 Jul 2025 12:29:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751545779; cv=none; b=GyKXfakRIDQiom5chWR/APTixXIo1zizymBJU/oOGY0+DFQB7VuqlJgR3o8FbuYuE2yTjIGtlOtI/4cvpv3gs/RTeapBryFIw57DM/Haww/IjBRcL2KMhldyc9kJeDJTd85tmwxHjIqaUFRlKFvRbcLWG8SjaYDXQhaq9ibYG0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751545779; c=relaxed/simple;
	bh=eMLR8B6UQwPnHJW42gS8dT/DQ5cRY3n6VOIcIfPOHuc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JETbRatbyRltRyqa8SKioV8t53zDjISVVEoGmkLWba8p2stqvWJSvdSbGS1oP/+iEO0n+roFoZU/qTXnMIHWNuEPczm7Dhmbpm7FxoF+LQ5CEm0jWYC7kX0OmGJ6IWphVNZeTmbMI1xQp+7cyf/9ks/AHrXv0GFBs6cGgAC08Cs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HimfUY+v; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HimfUY+v"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69E20C4CEED;
	Thu,  3 Jul 2025 12:29:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751545777;
	bh=eMLR8B6UQwPnHJW42gS8dT/DQ5cRY3n6VOIcIfPOHuc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HimfUY+vsDfOvlO4a+IKxQN9gBS+R7/bJJEsr+WGXLVbu94TJmjW5GUj+WTP5Ejc0
	 17cFZio6VpvyAbnPqdDjouytHQJfZ2nIeUsUZD+G+UEtAAb+dww3Qeg3xER7azhwvB
	 mSGWgbFwz2e9ReQ4kUz3jusg7XiWtEP2BeJAzvpYMtInuB1eSL0dDGbv6ckwdQPFlb
	 eiPRZn7lKGEGomOK3BQqnUq5KzSFW7TiL++55JF6R+j5Z1+kF3QGy4qQqYFsujBatv
	 uvU3oLcGvhezEto0UQ04MRSpcYwxFOAKTKG2q6g/XS9o/vp2uyX5EICM3ldfoQ/Fyv
	 q2Kll0zsi/JHw==
Date: Thu, 3 Jul 2025 14:29:31 +0200
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
Message-ID: <aGZ3q0PEmZ7lV4I-@pollux>
References: <CAGSQo02hyJncD1oTpUMgiSZeX5UYYY2p-WZTyroQJJ6fMnOrCQ@mail.gmail.com>
 <aGLUl7ZtuQBPoCuv@pollux>
 <2025070131-icon-quarters-0c16@gregkh>
 <aGPtCBB6nWTNJuwK@pollux>
 <2025070137-tartar-juncture-fcd2@gregkh>
 <aGP6d2-jJy5rtjMK@pollux>
 <aGZVUqangIR-c4aW@google.com>
 <DB2COGYW20C5.2YN1TFXR87UTS@kernel.org>
 <CAH5fLgjaNzOHNxa+XY1c2V5A1H2RhWP9gHAAmHx=9LN9CbHq=Q@mail.gmail.com>
 <2025070349-tricky-arguable-5362@gregkh>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2025070349-tricky-arguable-5362@gregkh>

On Thu, Jul 03, 2025 at 01:41:53PM +0200, Greg Kroah-Hartman wrote:
> Yes, we need to be able to have a debugfs file callback handle a mutable
> structure in order to lock things correctly.  We also need to have it be
> mutable so that it can MODIFY the value (everyone seems to forget that
> debugfs allows that...)

Well, that's possible with both approaches. Data behind a lock becomes mutable
once you grabbed the lock. That's the same in both cases.

The difference is that with the pin-init approach I propose you can't have what
Alice sketched up. And I think it's even desirable that you can't do it.

Let's me explain the difference on a simplified example, based on Alice'
example.

ForeignOwnable API
------------------

	#[pin_data]
	struct Process {
	    task: ARef<Task>,
	    #[pin]
	    inner: SpinLock<ProcessInner>,
	}
	
	pub(crate) struct ProcessInner {
	    threads: RBTree<i32, Arc<Thread>>,
	    max_threads: u32,
	}

Here we have to create an Arc<Process> (let's call it process) and create files
from it.

	let file_threads = dir.create_file("threads", process);
	let file_max_threads = dir.create_file("max_threads", process);

In the file system callback of both of these, we now have an Arc<Process>, hence
we can access:

	let guard = process.inner.lock();

	read_or_write(guard.max_threads);

and in the other file:

	let guard = process.inner.lock();

	read_or_write(guard.max_threads);

Pin-Init API
------------

	#[pin_data]
	struct Process {
	    task: ARef<Task>,
	    #[pin]
	    inner: File<SpinLock<ProcessInner>>,
	}
	
	pub(crate) struct ProcessInner {
	    threads: RBTree<i32, Arc<Thread>>,
	    max_threads: u32,
	}

Here Process does not need to be within an Arc and no separate file instances
need to be kept around, that happens already within the constructor of Process:

	pin_init!(Process {
	   inner <- dir.create_file("process_inner", ...),
	   [...]
	})

The file itself has a reference to SpinLock<ProcessInner>, hence we can access:

	let guard = inner.lock();

	read_or_write(guard.threads)
	read_or_write(guard.max_threads)

The difference is that with the ForeignOwnable API it was possible to have
separate files for threads and max_threads.

While with the pin-init one we either have to have a single file exposing
ProcessInner (which is what I did above) or protect threads and max_threads
with separate locks (of course max_threads could also just be an atomic).

(If you like I can sketch up this case as well.)

At a first glance this seems like an undesirable limitation, but I argue that
this is a good thing.

The reason I think so is what I also explained in [1], but let me adjust it a
bit for this reply:

threads and max_threads being protected by the same lock means that they are in
a certain relationship to each other. Meaning that they only really make sense
looking at them atomically.

So I argue it does not make sense to expose those values to userspace through
separate files.

For instance:

	$ cat max_threads && cat threads
	$ 5
	$ 10

This way you may read 5 max_threads, but 10 actual threads, because things may
have changed in between the two cat commands.

However, if instead, they are exposed through a single file, we get an atomic
view of them, such that the semantic relationship between them is preserved.

For instance:

	$ cat process_info
	$ threads: 2
	$ max_threads: 10

So, what I'm trying to say is, I think it's a good thing if fields that are
protected by the same lock can't be exposed through separate files, because it
means that the fields only make sense in the context of each other.

Or saying it the other way around, if it makes sense to expose fields through
separate files, it means they're unrelated to each other and hence should be
protected with separate locks, rather than a common one.

IMHO it's even a good thing beyond the scope of debugfs, because it forces
developers to really think about organizing structures properly, e.g. in a way
that only fields that really belong behind a certain lock are placed behind this
lock.

> So how about a platform driver that exposes values read from a platform
> device (i.e. a soc info driver), that also includes a
> local-to-the-device data structure that can be locked and modified?
> That should cover all the use cases that I can think of at the moment.

Yes, I also really like to have that.

But, again, both approaches can do this. It's just that I really discourage the
one that forces us to have an Arc instance on structures exposed through
debugfs, since this messes with the driver's lifetime and ownership
architecture in a bad way.
