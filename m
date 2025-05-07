Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 002A328B4FA;
	Wed,  7 May 2025 16:06:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746633970; cv=none; b=S88xN73JmaNSGsplEVRm2aOBiv+Kpz/R4fqu+S4IuVGdEqA/r4nvsfmK9ntcyvE54w0xkM4ayHv8Ns688c3CW43TKAo6OWDl/ZPTJFpDYov3CazX+jxr5OiJbPqdbuTv7a/TVoq+8NtB6+8ZDvgEBBBo7IfOGUwYfdNrt+y3zko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746633970; c=relaxed/simple;
	bh=2xem2TLdHrtRu37tVOHQqCW7STN+BbOiYqZH5ZCFdJ8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PRKD05p7W6ZBWGWvVDwtZgyHzuWSSIofTFUqyfxlqQlvYSYGyDCqLOwcBrt3eauPEDmhT+rQc26SQ/fjwAATGU4rgTDEwQRqYmzRvo7kAyUPPO8OBrb/fQZMgW0CvHM4LDe7hWctVaga/GAxzMx8Ly123MzuRXLGnZhGRdh7lNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=npwakx2n; arc=none smtp.client-ip=209.85.222.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="npwakx2n"
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-7c542ffec37so834714585a.2;
        Wed, 07 May 2025 09:06:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746633967; x=1747238767; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fqg/DMvTJ3yF8Zrfa2XRwnpBZ3gbgnJbnCJXz1tCEgQ=;
        b=npwakx2ndMYgqoKgXC08dy7AoYEPr2vH3Wj8YO1S7b48VOTHA/X7Jav9jlgNy+6dRS
         CyKFYKbOAIdE+BlTxtv3k71Ow+Q05qS9w6wqRSON/p47TWtoFQResjOSCnEu/blg8EMv
         xCvHV2sQV1nQPO/Q21XilOPlKiBErS1775/JwmfHcRYBjWl4VCJ22lH8BJg4+1wzhtGB
         tR83SGVZTC5+iKNa/mSVMFhg/8OAY0LOS3RMW9Dy22TYx68JBVzb5ACa7BaPr/pu27x1
         +49uC/zJuTs/1sjH/wpfocgBXdsNjg8U9OYLpWUMYV93wSY9VgWd2rJ85K208hCfj/sa
         A0/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746633967; x=1747238767;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fqg/DMvTJ3yF8Zrfa2XRwnpBZ3gbgnJbnCJXz1tCEgQ=;
        b=DTdPsGrxox2aSmnpweU6KoKLtf3mwo6G6WhwJAWzqDT4snOtFRQN/c+F5Mc4bE9HYP
         l/CFCGibE4HCsGNpykfLAr4ffXlZDHe3dSDXlyao1pf+Si4TY6WTBoGDDEyr2MfInZKM
         fU+uBX+rQFhadLH60yyR9EaEM+YJv0CqNUJqkXAn+xTOYE/+J3w9wCKLkWYzUa1I4grm
         9mas44eIB3eVBdIWIG54ENtaouP7Q3rsJiOuLBG+AWs2RSs6W2ol9dAHeP28cPHOqJoT
         tu252jpkFmrWA1WXx+/zGNAm+JQ3XSICdazBHOOWLOxWDyLr07+irfQFRe64yhEIK6kq
         58/Q==
X-Forwarded-Encrypted: i=1; AJvYcCV1MnHC04VtDk3HqbLF5liF//vZOx6xnk7Kl5V5i+KZkHv0C/qpY8Vv48a7+mKVmTbYUZhtJIQh2UxWDjg=@vger.kernel.org, AJvYcCXBmEIZPa6Ng00XEBtgft5ZMe7vzllGCm10zBhpKXt7kw0kH5Ofpz40C3pXq0lzIpuAP7/d9wcLmCPDSwrerZ0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5JuEeB/9pwMCZj1wYS3qyUu/Rf/G7340X0DJeXvExKuXQZTd5
	UFXnhbrp3boDy1KTVSgAMjNqLELMHm60oN1stAV+o7i2Mn/awXz9
X-Gm-Gg: ASbGncsEeYusXjIS9fk576p8pFZ5GsXZIeuwAtR/qxOPO2UUxuojHv0hzHq6tf+VmlW
	ZaMpAZ+9u/TMy4G3IexPyXzFPKU1om3hEbPe8mnPYlTel3oc6yMUqkBpRPEFRNsFy1gpNVUF8r/
	8oU/WyzcMD4Q3Uuochfi0c/1yXrpqIt4ddsGfkNckO+QuQp0LRFpP5eDN8ytsJBdTgZMkXFLxzH
	dWltEwKcH3mFi938R6bzZGy8EE1XR75nHOBrnUOGkYWryoT1L/e45mKXlX4Qs1r86/RRmoK7e6z
	AOyQ5b4dLzvbC5A07wiYTzjdQoWZ8w0GRpjKFoJGHamKQSW6gIzE681Vr1j2VctGuAd9sRuwADV
	zsAo2vyy3rmyxuDrJP59xJziAKlOXZOtCKb5MFUr/VQ==
X-Google-Smtp-Source: AGHT+IGcsX1tmiGKHaGNgXaeIoEWjNYbP3S+J4uJ44jJI+H84AA+OlTUihnOYWUHXCgFOaH2o75W2w==
X-Received: by 2002:a05:620a:d87:b0:7c5:d72b:1a00 with SMTP id af79cd13be357-7caf7386bdcmr480300285a.15.1746633966452;
        Wed, 07 May 2025 09:06:06 -0700 (PDT)
Received: from fauth-a1-smtp.messagingengine.com (fauth-a1-smtp.messagingengine.com. [103.168.172.200])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7caf75d9859sm166984385a.104.2025.05.07.09.06.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 09:06:05 -0700 (PDT)
Received: from phl-compute-01.internal (phl-compute-01.phl.internal [10.202.2.41])
	by mailfauth.phl.internal (Postfix) with ESMTP id 29799120007B;
	Wed,  7 May 2025 12:06:05 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-01.internal (MEProxy); Wed, 07 May 2025 12:06:05 -0400
X-ME-Sender: <xms:7YQbaA6RJxK72zcJWLcG6gykbA9Yuka3rlw1wfiNn9RDT5Dv0nLW3Q>
    <xme:7YQbaB5zCWwSa4Jeu6eBwNPs04sNdzcwdne4saefHHC2epPWzaA9BQsIJlrIN4k5v
    3DD-sDzvZVj8FHmJQ>
X-ME-Received: <xmr:7YQbaPdPe5gMjbHuUgcJWPPvIw0hU6qG8nbLYyVcPmzuI7Dq-O3H0UEO>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvkeejvdelucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesthdtredttddt
    vdenucfhrhhomhepuehoqhhunhcuhfgvnhhguceosghoqhhunhdrfhgvnhhgsehgmhgrih
    hlrdgtohhmqeenucggtffrrghtthgvrhhnpeeltefftdetgefhffejvdekgeekjeejudet
    heekfedtieevteehleffgedvhedufeenucffohhmrghinhepmhhmihhfmhhmrdhishdpkh
    gvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghi
    lhhfrhhomhepsghoqhhunhdomhgvshhmthhprghuthhhphgvrhhsohhnrghlihhthidqie
    elvdeghedtieegqddujeejkeehheehvddqsghoqhhunhdrfhgvnhhgpeepghhmrghilhdr
    tghomhesfhhigihmvgdrnhgrmhgvpdhnsggprhgtphhtthhopedvvddpmhhouggvpehsmh
    htphhouhhtpdhrtghpthhtoheprghlihgtvghrhihhlhesghhoohhglhgvrdgtohhmpdhr
    tghpthhtohepohhjvggurgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepfihilhhlhi
    esihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehlohhrvghniihordhsthhorghk
    vghssehorhgrtghlvgdrtghomhdprhgtphhtthhopehvsggrsghkrgesshhushgvrdgtii
    dprhgtphhtthhopehjhhhusggsrghrugesnhhvihguihgrrdgtohhmpdhrtghpthhtohep
    lhhirghmrdhhohiflhgvthhtsehorhgrtghlvgdrtghomhdprhgtphhtthhopegrkhhpmh
    eslhhinhhugidqfhhouhhnuggrthhiohhnrdhorhhgpdhrtghpthhtohepghhrvghgkhhh
    sehlihhnuhigfhhouhhnuggrthhiohhnrdhorhhg
X-ME-Proxy: <xmx:7YQbaFJi8OTtTMDYR7a3i_ZlqyzXTkci-TxIyksxX-X70zxzhFRBcw>
    <xmx:7YQbaEJNi24WWzcMl7zAI8O6scKOX5fD00cO0HKvlPtWxojwdlSCQQ>
    <xmx:7YQbaGzNdy4dHSoOqJGr76SljcDurigCWKYWe9iT8GOjDK1U2fLN_g>
    <xmx:7YQbaIIQv-Un1wliPUdFdPOp1N_V9y2nYSQNOEIl7BRlO6fQvQhqbg>
    <xmx:7YQbaDagt3czge5ftXkBEwddyEpAQjTRpfdty-PJkTXrgkAjS76kKjQI>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 7 May 2025 12:06:03 -0400 (EDT)
Date: Wed, 7 May 2025 09:06:01 -0700
From: Boqun Feng <boqun.feng@gmail.com>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Matthew Wilcox <willy@infradead.org>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	John Hubbard <jhubbard@nvidia.com>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Arnd Bergmann <arnd@arndb.de>, Jann Horn <jannh@google.com>,
	Suren Baghdasaryan <surenb@google.com>,
	Alex Gaynor <alex.gaynor@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v16 8/9] task: rust: rework how current is accessed
Message-ID: <aBuE6a4rXB8qwXfF@Mac.home>
References: <20250408-vma-v16-0-d8b446e885d9@google.com>
 <20250408-vma-v16-8-d8b446e885d9@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250408-vma-v16-8-d8b446e885d9@google.com>

On Tue, Apr 08, 2025 at 09:22:45AM +0000, Alice Ryhl wrote:
> Introduce a new type called `CurrentTask` that lets you perform various
> operations that are only safe on the `current` task. Use the new type to
> provide a way to access the current mm without incrementing its
> refcount.
> 
> With this change, you can write stuff such as
> 
> 	let vma = current!().mm().lock_vma_under_rcu(addr);
> 
> without incrementing any refcounts.
> 
> This replaces the existing abstractions for accessing the current pid
> namespace. With the old approach, every field access to current involves
> both a macro and a unsafe helper function. The new approach simplifies
> that to a single safe function on the `CurrentTask` type. This makes it
> less heavy-weight to add additional current accessors in the future.
> 
> That said, creating a `CurrentTask` type like the one in this patch
> requires that we are careful to ensure that it cannot escape the current
> task or otherwise access things after they are freed. To do this, I
> declared that it cannot escape the current "task context" where I
> defined a "task context" as essentially the region in which `current`
> remains unchanged. So e.g., release_task() or begin_new_exec() would
> leave the task context.
> 
> If a userspace thread returns to userspace and later makes another
> syscall, then I consider the two syscalls to be different task contexts.
> This allows values stored in that task to be modified between syscalls,
> even if they're guaranteed to be immutable during a syscall.
> 
> Ensuring correctness of `CurrentTask` is slightly tricky if we also want
> the ability to have a safe `kthread_use_mm()` implementation in Rust. To
> support that safely, there are two patterns we need to ensure are safe:
> 
> 	// Case 1: current!() called inside the scope.
> 	let mm;
> 	kthread_use_mm(some_mm, || {
> 	    mm = current!().mm();
> 	});
> 	drop(some_mm);
> 	mm.do_something(); // UAF
> 
> and:
> 
> 	// Case 2: current!() called before the scope.
> 	let mm;
> 	let task = current!();
> 	kthread_use_mm(some_mm, || {
> 	    mm = task.mm();
> 	});
> 	drop(some_mm);
> 	mm.do_something(); // UAF
> 
> The existing `current!()` abstraction already natively prevents the
> first case: The `&CurrentTask` would be tied to the inner scope, so the
> borrow-checker ensures that no reference derived from it can escape the
> scope.
> 
> Fixing the second case is a bit more tricky. The solution is to
> essentially pretend that the contents of the scope execute on an
> different thread, which means that only thread-safe types can cross the
> boundary. Since `CurrentTask` is marked `NotThreadSafe`, attempts to
> move it to another thread will fail, and this includes our fake pretend
> thread boundary.
> 
> This has the disadvantage that other types that aren't thread-safe for
> reasons unrelated to `current` also cannot be moved across the
> `kthread_use_mm()` boundary. I consider this an acceptable tradeoff.
> 
> Acked-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> Acked-by: Liam R. Howlett <Liam.Howlett@Oracle.com>
> Reviewed-by: Boqun Feng <boqun.feng@gmail.com>
> Reviewed-by: Andreas Hindborg <a.hindborg@kernel.org>
> Reviewed-by: Gary Guo <gary@garyguo.net>
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> ---
>  rust/kernel/task.rs | 247 +++++++++++++++++++++++++++-------------------------
>  1 file changed, 129 insertions(+), 118 deletions(-)
> 
> diff --git a/rust/kernel/task.rs b/rust/kernel/task.rs
> index 9e6f6854948d9ef9bb203a3548c9b082df8280e2..927413d854846477578cbaf06e27d1fc867d0682 100644
> --- a/rust/kernel/task.rs
> +++ b/rust/kernel/task.rs
> @@ -7,6 +7,7 @@
>  use crate::{
>      bindings,
>      ffi::{c_int, c_long, c_uint},
> +    mm::MmWithUser,
>      pid_namespace::PidNamespace,
>      types::{ARef, NotThreadSafe, Opaque},
>  };
> @@ -33,22 +34,20 @@
>  #[macro_export]
>  macro_rules! current {
>      () => {
> -        // SAFETY: Deref + addr-of below create a temporary `TaskRef` that cannot outlive the
> -        // caller.
> +        // SAFETY: This expression creates a temporary value that is dropped at the end of the
> +        // caller's scope. The following mechanisms ensure that the resulting `&CurrentTask` cannot
> +        // leave current task context:
> +        //
> +        // * To return to userspace, the caller must leave the current scope.
> +        // * Operations such as `begin_new_exec()` are necessarily unsafe and the caller of
> +        //   `begin_new_exec()` is responsible for safety.
> +        // * Rust abstractions for things such as a `kthread_use_mm()` scope must require the
> +        //   closure to be `Send`, so the `NotThreadSafe` field of `CurrentTask` ensures that the
> +        //   `&CurrentTask` cannot cross the scope in either direction.
>          unsafe { &*$crate::task::Task::current() }
>      };
>  }
>  
> -/// Returns the currently running task's pid namespace.
> -#[macro_export]
> -macro_rules! current_pid_ns {
> -    () => {
> -        // SAFETY: Deref + addr-of below create a temporary `PidNamespaceRef` that cannot outlive
> -        // the caller.
> -        unsafe { &*$crate::task::Task::current_pid_ns() }
> -    };
> -}
> -
>  /// Wraps the kernel's `struct task_struct`.
>  ///
>  /// # Invariants
> @@ -87,7 +86,7 @@ macro_rules! current_pid_ns {
>  /// impl State {
>  ///     fn new() -> Self {
>  ///         Self {
> -///             creator: current!().into(),
> +///             creator: ARef::from(&**current!()),
>  ///             index: 0,
>  ///         }
>  ///     }
> @@ -107,6 +106,44 @@ unsafe impl Send for Task {}
>  // synchronised by C code (e.g., `signal_pending`).
>  unsafe impl Sync for Task {}
>  
> +/// Represents the [`Task`] in the `current` global.
> +///
> +/// This type exists to provide more efficient operations that are only valid on the current task.
> +/// For example, to retrieve the pid-namespace of a task, you must use rcu protection unless it is
> +/// the current task.
> +///
> +/// # Invariants
> +///
> +/// Each value of this type must only be accessed from the task context it was created within.
> +///
> +/// Of course, every thread is in a different task context, but for the purposes of this invariant,
> +/// these operations also permanently leave the task context:
> +///
> +/// * Returning to userspace from system call context.
> +/// * Calling `release_task()`.
> +/// * Calling `begin_new_exec()` in a binary format loader.
> +///
> +/// Other operations temporarily create a new sub-context:
> +///
> +/// * Calling `kthread_use_mm()` creates a new context, and `kthread_unuse_mm()` returns to the
> +///   old context.
> +///
> +/// This means that a `CurrentTask` obtained before a `kthread_use_mm()` call may be used again
> +/// once `kthread_unuse_mm()` is called, but it must not be used between these two calls.
> +/// Conversely, a `CurrentTask` obtained between a `kthread_use_mm()`/`kthread_unuse_mm()` pair
> +/// must not be used after `kthread_unuse_mm()`.
> +#[repr(transparent)]
> +pub struct CurrentTask(Task, NotThreadSafe);
> +
> +// Make all `Task` methods available on `CurrentTask`.
> +impl Deref for CurrentTask {
> +    type Target = Task;
> +    #[inline]
> +    fn deref(&self) -> &Task {
> +        &self.0
> +    }
> +}
> +
>  /// The type of process identifiers (PIDs).
>  pub type Pid = bindings::pid_t;
>  
> @@ -133,119 +170,29 @@ pub fn current_raw() -> *mut bindings::task_struct {
>      ///
>      /// # Safety
>      ///
> -    /// Callers must ensure that the returned object doesn't outlive the current task/thread.
> -    pub unsafe fn current() -> impl Deref<Target = Task> {
> -        struct TaskRef<'a> {
> -            task: &'a Task,
> -            _not_send: NotThreadSafe,
> +    /// Callers must ensure that the returned object is only used to access a [`CurrentTask`]
> +    /// within the task context that was active when this function was called. For more details,
> +    /// see the invariants section for [`CurrentTask`].
> +    pub unsafe fn current() -> impl Deref<Target = CurrentTask> {
> +        struct TaskRef {
> +            task: *const CurrentTask,
>          }
>  
> -        impl Deref for TaskRef<'_> {
> -            type Target = Task;
> +        impl Deref for TaskRef {
> +            type Target = CurrentTask;
>  
>              fn deref(&self) -> &Self::Target {
> -                self.task
> +                // SAFETY: The returned reference borrows from this `TaskRef`, so it cannot outlive
> +                // the `TaskRef`, which the caller of `Task::current()` has promised will not
> +                // outlive the task/thread for which `self.task` is the `current` pointer. Thus, it
> +                // is okay to return a `CurrentTask` reference here.
> +                unsafe { &*self.task }
>              }
>          }
>  
> -        let current = Task::current_raw();
>          TaskRef {
> -            // SAFETY: If the current thread is still running, the current task is valid. Given
> -            // that `TaskRef` is not `Send`, we know it cannot be transferred to another thread
> -            // (where it could potentially outlive the caller).
> -            task: unsafe { &*current.cast() },
> -            _not_send: NotThreadSafe,
> -        }
> -    }
> -
> -    /// Returns a PidNamespace reference for the currently executing task's/thread's pid namespace.
> -    ///
> -    /// This function can be used to create an unbounded lifetime by e.g., storing the returned
> -    /// PidNamespace in a global variable which would be a bug. So the recommended way to get the
> -    /// current task's/thread's pid namespace is to use the [`current_pid_ns`] macro because it is
> -    /// safe.
> -    ///
> -    /// # Safety
> -    ///
> -    /// Callers must ensure that the returned object doesn't outlive the current task/thread.
> -    pub unsafe fn current_pid_ns() -> impl Deref<Target = PidNamespace> {
> -        struct PidNamespaceRef<'a> {
> -            task: &'a PidNamespace,
> -            _not_send: NotThreadSafe,
> -        }
> -
> -        impl Deref for PidNamespaceRef<'_> {
> -            type Target = PidNamespace;
> -
> -            fn deref(&self) -> &Self::Target {
> -                self.task
> -            }
> -        }
> -
> -        // The lifetime of `PidNamespace` is bound to `Task` and `struct pid`.
> -        //
> -        // The `PidNamespace` of a `Task` doesn't ever change once the `Task` is alive. A
> -        // `unshare(CLONE_NEWPID)` or `setns(fd_pidns/pidfd, CLONE_NEWPID)` will not have an effect
> -        // on the calling `Task`'s pid namespace. It will only effect the pid namespace of children
> -        // created by the calling `Task`. This invariant guarantees that after having acquired a
> -        // reference to a `Task`'s pid namespace it will remain unchanged.
> -        //
> -        // When a task has exited and been reaped `release_task()` will be called. This will set
> -        // the `PidNamespace` of the task to `NULL`. So retrieving the `PidNamespace` of a task
> -        // that is dead will return `NULL`. Note, that neither holding the RCU lock nor holding a
> -        // referencing count to
> -        // the `Task` will prevent `release_task()` being called.
> -        //
> -        // In order to retrieve the `PidNamespace` of a `Task` the `task_active_pid_ns()` function
> -        // can be used. There are two cases to consider:
> -        //
> -        // (1) retrieving the `PidNamespace` of the `current` task
> -        // (2) retrieving the `PidNamespace` of a non-`current` task
> -        //
> -        // From system call context retrieving the `PidNamespace` for case (1) is always safe and
> -        // requires neither RCU locking nor a reference count to be held. Retrieving the
> -        // `PidNamespace` after `release_task()` for current will return `NULL` but no codepath
> -        // like that is exposed to Rust.
> -        //
> -        // Retrieving the `PidNamespace` from system call context for (2) requires RCU protection.
> -        // Accessing `PidNamespace` outside of RCU protection requires a reference count that
> -        // must've been acquired while holding the RCU lock. Note that accessing a non-`current`
> -        // task means `NULL` can be returned as the non-`current` task could have already passed
> -        // through `release_task()`.
> -        //
> -        // To retrieve (1) the `current_pid_ns!()` macro should be used which ensure that the
> -        // returned `PidNamespace` cannot outlive the calling scope. The associated
> -        // `current_pid_ns()` function should not be called directly as it could be abused to
> -        // created an unbounded lifetime for `PidNamespace`. The `current_pid_ns!()` macro allows
> -        // Rust to handle the common case of accessing `current`'s `PidNamespace` without RCU
> -        // protection and without having to acquire a reference count.
> -        //
> -        // For (2) the `task_get_pid_ns()` method must be used. This will always acquire a
> -        // reference on `PidNamespace` and will return an `Option` to force the caller to
> -        // explicitly handle the case where `PidNamespace` is `None`, something that tends to be
> -        // forgotten when doing the equivalent operation in `C`. Missing RCU primitives make it
> -        // difficult to perform operations that are otherwise safe without holding a reference
> -        // count as long as RCU protection is guaranteed. But it is not important currently. But we
> -        // do want it in the future.
> -        //
> -        // Note for (2) the required RCU protection around calling `task_active_pid_ns()`
> -        // synchronizes against putting the last reference of the associated `struct pid` of
> -        // `task->thread_pid`. The `struct pid` stored in that field is used to retrieve the
> -        // `PidNamespace` of the caller. When `release_task()` is called `task->thread_pid` will be
> -        // `NULL`ed and `put_pid()` on said `struct pid` will be delayed in `free_pid()` via
> -        // `call_rcu()` allowing everyone with an RCU protected access to the `struct pid` acquired
> -        // from `task->thread_pid` to finish.
> -        //
> -        // SAFETY: The current task's pid namespace is valid as long as the current task is running.
> -        let pidns = unsafe { bindings::task_active_pid_ns(Task::current_raw()) };
> -        PidNamespaceRef {
> -            // SAFETY: If the current thread is still running, the current task and its associated
> -            // pid namespace are valid. `PidNamespaceRef` is not `Send`, so we know it cannot be
> -            // transferred to another thread (where it could potentially outlive the current
> -            // `Task`). The caller needs to ensure that the PidNamespaceRef doesn't outlive the
> -            // current task/thread.
> -            task: unsafe { PidNamespace::from_ptr(pidns) },
> -            _not_send: NotThreadSafe,
> +            // CAST: The layout of `struct task_struct` and `CurrentTask` is identical.
> +            task: Task::current_raw().cast(),
>          }
>      }
>  
> @@ -328,6 +275,70 @@ pub fn wake_up(&self) {
>      }
>  }
>  
> +impl CurrentTask {
> +    /// Access the address space of the current task.
> +    ///
> +    /// This function does not touch the refcount of the mm.
> +    #[inline]
> +    pub fn mm(&self) -> Option<&MmWithUser> {
> +        // SAFETY: The `mm` field of `current` is not modified from other threads, so reading it is
> +        // not a data race.
> +        let mm = unsafe { (*self.as_ptr()).mm };
> +
> +        if mm.is_null() {
> +            return None;
> +        }
> +
> +        // SAFETY: If `current->mm` is non-null, then it references a valid mm with a non-zero
> +        // value of `mm_users`. Furthermore, the returned `&MmWithUser` borrows from this
> +        // `CurrentTask`, so it cannot escape the scope in which the current pointer was obtained.
> +        //
> +        // This is safe even if `kthread_use_mm()`/`kthread_unuse_mm()` are used. There are two
> +        // relevant cases:
> +        // * If the `&CurrentTask` was created before `kthread_use_mm()`, then it cannot be
> +        //   accessed during the `kthread_use_mm()`/`kthread_unuse_mm()` scope due to the
> +        //   `NotThreadSafe` field of `CurrentTask`.
> +        // * If the `&CurrentTask` was created within a `kthread_use_mm()`/`kthread_unuse_mm()`
> +        //   scope, then the `&CurrentTask` cannot escape that scope, so the returned `&MmWithUser`
> +        //   also cannot escape that scope.
> +        // In either case, it's not possible to read `current->mm` and keep using it after the
> +        // scope is ended with `kthread_unuse_mm()`.
> +        Some(unsafe { MmWithUser::from_raw(mm) })
> +    }
> +

Due to this:

	https://lore.kernel.org/oe-kbuild-all/202505072116.eSYC8igT-lkp@intel.com/

, I think we should move this impl block into rust/kernel/mm.rs for now,
i.e. (in rust/kernel/mm.rs)

    impl crate::task::CurrentTask {
        pub fn mm(&self) -> Option<&MmWithUser> { ... }
    }

Thoughts?

Regards,
Boqun

> +    /// Access the pid namespace of the current task.
> +    ///
> +    /// This function does not touch the refcount of the namespace or use RCU protection.
> +    ///
> +    /// To access the pid namespace of another task, see [`Task::get_pid_ns`].
> +    #[doc(alias = "task_active_pid_ns")]
> +    #[inline]
> +    pub fn active_pid_ns(&self) -> Option<&PidNamespace> {
> +        // SAFETY: It is safe to call `task_active_pid_ns` without RCU protection when calling it
> +        // on the current task.
> +        let active_ns = unsafe { bindings::task_active_pid_ns(self.as_ptr()) };
> +
> +        if active_ns.is_null() {
> +            return None;
> +        }
> +
> +        // The lifetime of `PidNamespace` is bound to `Task` and `struct pid`.
> +        //
> +        // The `PidNamespace` of a `Task` doesn't ever change once the `Task` is alive.
> +        //
> +        // From system call context retrieving the `PidNamespace` for the current task is always
> +        // safe and requires neither RCU locking nor a reference count to be held. Retrieving the
> +        // `PidNamespace` after `release_task()` for current will return `NULL` but no codepath
> +        // like that is exposed to Rust.
> +        //
> +        // SAFETY: If `current`'s pid ns is non-null, then it references a valid pid ns.
> +        // Furthermore, the returned `&PidNamespace` borrows from this `CurrentTask`, so it cannot
> +        // escape the scope in which the current pointer was obtained, e.g. it cannot live past a
> +        // `release_task()` call.
> +        Some(unsafe { PidNamespace::from_ptr(active_ns) })
> +    }
> +}
> +
>  // SAFETY: The type invariants guarantee that `Task` is always refcounted.
>  unsafe impl crate::types::AlwaysRefCounted for Task {
>      fn inc_ref(&self) {
> 
> -- 
> 2.49.0.504.g3bcea36a83-goog
> 
