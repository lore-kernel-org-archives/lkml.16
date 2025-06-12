Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3BB1236A9F;
	Thu, 12 Jun 2025 10:47:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749725256; cv=none; b=Liz1L8eavsVmsxgwcTk17b6NCsv+KWMdnE2SVbhQj2mLBN5PEzokpOncSV351a9qMEW3822nIVgJC2jLUBOylWD6++CV+CkhjmD+aGjJo35LvBxqs2+RTtt1a1ILdNZ5eQ6ULhk/cOz3H+Qj0OBZFyVEmqH5bnj6i7Z4IfIwvd4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749725256; c=relaxed/simple;
	bh=cA/9g4df0rnYMna80cfWKquJ3DSe/MAYAo6HdSAPeK4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JcW+ILCnJ6BIL88UgH57hgFwN8pxpqVTOSKYI1Y85stRX+yru3HGZc+zKjw9LA43mMViLunskDULOkElBK0WnjaYM+dcP6pXTXE6MT4AksAD7SZjiaGyA3XUkDCv6dHg+iJt/ftoTXui/SaUZUoK5/rDycY8XZG/2Kv1FpKa4kg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UarOyjjv; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UarOyjjv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0F74C4CEEA;
	Thu, 12 Jun 2025 10:47:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749725256;
	bh=cA/9g4df0rnYMna80cfWKquJ3DSe/MAYAo6HdSAPeK4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UarOyjjvTQMBXR7aL+237IUKvnrSP6hZJed599hmZGjYhxOM68vUSjwXtfVYCkOgd
	 X/MGyBXxv5Asva4SlWXZEm8WzxFkpTYwdtG+pe5tNAL7Y114w+0b8blObd+TzHnhe1
	 R5kirTOySydU6E4q8eMH+lqwQKkShSH/vi+VfAMkbAWvR3mGbLSTXZIE6vzlQGKm/n
	 K2fqwP+9vFTjGxFitOWVRIspX4HlyDryVwxgsulSM4PvCZuo7Ia2fbD5dwtrAaPcIE
	 ctWku4I/Fs+imivXwpjkAx4LPOjr3O08hdnYZeg0bQXe9O+/goLC/oFP7VCC4MFo7c
	 h090qHFXDjdeQ==
Date: Thu, 12 Jun 2025 12:47:29 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: Benno Lossin <lossin@kernel.org>
Cc: gregkh@linuxfoundation.org, rafael@kernel.org, ojeda@kernel.org,
	alex.gaynor@gmail.com, boqun.feng@gmail.com, gary@garyguo.net,
	bjorn3_gh@protonmail.com, benno.lossin@proton.me,
	a.hindborg@kernel.org, aliceryhl@google.com, tmgross@umich.edu,
	chrisi.schrefl@gmail.com, rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org, Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>
Subject: Re: [PATCH 1/3] rust: completion: implement initial abstraction
Message-ID: <aEqwQYJdbVSNA7mr@pollux>
References: <20250603205416.49281-1-dakr@kernel.org>
 <20250603205416.49281-2-dakr@kernel.org>
 <DAKE8OYKXUWH.1NRVGV5IKW7I9@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DAKE8OYKXUWH.1NRVGV5IKW7I9@kernel.org>

On Thu, Jun 12, 2025 at 09:58:30AM +0200, Benno Lossin wrote:
> On Tue Jun 3, 2025 at 10:48 PM CEST, Danilo Krummrich wrote:
> > +/// # Examples
> > +///
> > +/// ```
> > +/// use kernel::sync::{Arc, Completion};
> > +/// use kernel::workqueue::{self, impl_has_work, new_work, Work, WorkItem};
> > +///
> > +/// #[pin_data]
> > +/// struct MyTask {
> > +///     #[pin]
> > +///     work: Work<MyTask>,
> 
> Can we maybe add a dummy value like `Mutex<i32>` here that the task
> changes, so we can print the value of it below (after waiting for the
> task)?

Sure, but I don't think it improves the example a lot. It adds more code that
may be more distracting than helpful.

> > +///     #[pin]
> > +///     done: Completion,
> > +/// }
> > +///
> > +/// impl_has_work! {
> > +///     impl HasWork<Self> for MyTask { self.work }
> > +/// }
> > +///
> > +/// impl MyTask {
> > +///     fn new() -> Result<Arc<Self>> {
> > +///         let this = Arc::pin_init(pin_init!(MyTask {
> > +///             work <- new_work!("MyTask::work"),
> > +///             done <- Completion::new(),
> > +///         }), GFP_KERNEL)?;
> > +///
> > +///         let _ = workqueue::system().enqueue(this.clone());
> > +///
> > +///         Ok(this)
> > +///     }
> > +///
> > +///     fn wait_for_completion(&self) {
> > +///         self.done.wait_for_completion();
> > +///
> > +///         pr_info!("Completion: task complete\n");
> > +///     }
> > +/// }
> > +///
> > +/// impl WorkItem for MyTask {
> > +///     type Pointer = Arc<MyTask>;
> > +///
> > +///     fn run(this: Arc<MyTask>) {
> > +///         // process this task
> > +///         this.done.complete_all();
> > +///     }
> > +/// }
> > +///
> > +/// let task = MyTask::new()?;
> > +/// task.wait_for_completion();
> > +/// # Ok::<(), Error>(())
> > +/// ```
> > +#[pin_data]
> > +pub struct Completion {
> > +    #[pin]
> > +    inner: Opaque<bindings::completion>,
> > +}
> > +
> > +impl Completion {
> > +    /// Create an initializer for a new [`Completion`].
> > +    pub fn new() -> impl PinInit<Self> {
> > +        pin_init!(Self {
> > +            inner <- Opaque::ffi_init(|slot: *mut bindings::completion| {
> > +                // SAFETY: `slot` is a valid pointer to an uninitialized `struct completion`.
> > +                unsafe { bindings::init_completion(slot) };
> > +            }),
> > +        })
> > +    }
> > +
> > +    fn as_raw(&self) -> *mut bindings::completion {
> > +        self.inner.get()
> > +    }
> > +
> > +    /// Signal all tasks waiting on this completion.
> > +    ///
> > +    /// This method wakes up all tasks waiting on this completion; after this operation the
> > +    /// completion is permanently done.
> > +    pub fn complete_all(&self) {
> > +        // SAFETY: `self.as_raw()` is a pointer to a valid `struct completion`.
> > +        unsafe { bindings::complete_all(self.as_raw()) };
> > +    }
> > +
> > +    /// Wait for completion of a task.
> > +    ///
> > +    /// This method waits for the completion of a task; it is not interruptible and there is no
> 
> I personally would write:
> 
> s/waits for/blocks on/
> 
> But if `wait` is the more common kernel term then let's go with your
> version instead.

I don't think either is more common in general, but the C code and the existing
documentation all use "wait for".
