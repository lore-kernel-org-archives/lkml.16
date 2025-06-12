Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D178F221F06;
	Thu, 12 Jun 2025 07:58:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749715119; cv=none; b=S07VwD3DuqAj1MOobR/2Bpc092jCkI1GD0WVBoQReGirbHwvnnY1MVGuzSFrc+l/qhotuVB3NLD5KxIW4gQPYP2WzRjKkpWyvQuIcUz1bI4SYJVjRN4nCqf0o1Y0xzwRBMvorXqrr9GrUvynhbWdK7UZj33irdE6A9BZipkj1aY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749715119; c=relaxed/simple;
	bh=Q/fYqZCvH9dT1Qvc5roNWpHv8H4YBjizUbKKbXxx11I=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=DnIl9bgroFP3diB8NpFrCYp7OcLNacwsiFQjhn0t+UDWxabTyJe+JxkitD78sBZFyypFc2B6oeP8PQCz7mF15vXrLs5pVGh9iQW9p8TBazX+uI/j47zctoRNrFcH0JnJnYGVpMZS2m+lEJ030uBzzIGpk/27lyjZXQkWosnwmHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QTsLG0eZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QTsLG0eZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1DB0C4CEEA;
	Thu, 12 Jun 2025 07:58:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749715116;
	bh=Q/fYqZCvH9dT1Qvc5roNWpHv8H4YBjizUbKKbXxx11I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QTsLG0eZARQyzjAzzffX1z6L/BruEuDhao1qMkFTSqh5eJ6sHgGMNhdPdsdyn8hT4
	 J+k2FSKs8qu9S+fJfVzbpkCrYHvKmKNUKnO8kj00OsW16PRZthqRgT6Z7ISJcMH8yS
	 bigENnkvXEEZp+iYcYQXhwSplS5tMEFDYwlLu6XzSc/IZEkmgv8VVYw5y14qTe/X5/
	 kAAstWdrzMP1q8o0YCxOZzdsI1Zq3kBlSh+sdUa1NOjjEwsPejj6mzuETPw1/E9nzr
	 fExfmoBgtBTSwFvyqa9ifnGlLQ1Lc0xGEKVvhiUKCAa5NpWscRN8ec+9xjTZvOXf4W
	 aTSpumwlDDyoA==
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 12 Jun 2025 09:58:30 +0200
Message-Id: <DAKE8OYKXUWH.1NRVGV5IKW7I9@kernel.org>
From: "Benno Lossin" <lossin@kernel.org>
To: "Danilo Krummrich" <dakr@kernel.org>, <gregkh@linuxfoundation.org>,
 <rafael@kernel.org>, <ojeda@kernel.org>, <alex.gaynor@gmail.com>,
 <boqun.feng@gmail.com>, <gary@garyguo.net>, <bjorn3_gh@protonmail.com>,
 <benno.lossin@proton.me>, <a.hindborg@kernel.org>, <aliceryhl@google.com>,
 <tmgross@umich.edu>, <chrisi.schrefl@gmail.com>
Cc: <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Ingo
 Molnar" <mingo@redhat.com>, "Peter Zijlstra" <peterz@infradead.org>, "Juri
 Lelli" <juri.lelli@redhat.com>, "Vincent Guittot"
 <vincent.guittot@linaro.org>, "Dietmar Eggemann"
 <dietmar.eggemann@arm.com>, "Steven Rostedt" <rostedt@goodmis.org>, "Ben
 Segall" <bsegall@google.com>, "Mel Gorman" <mgorman@suse.de>, "Valentin
 Schneider" <vschneid@redhat.com>
Subject: Re: [PATCH 1/3] rust: completion: implement initial abstraction
X-Mailer: aerc 0.20.1
References: <20250603205416.49281-1-dakr@kernel.org>
 <20250603205416.49281-2-dakr@kernel.org>
In-Reply-To: <20250603205416.49281-2-dakr@kernel.org>

On Tue Jun 3, 2025 at 10:48 PM CEST, Danilo Krummrich wrote:
> Implement a minimal abstraction for the completion synchronization
> primitive.
>
> This initial abstraction only adds complete_all() and
> wait_for_completion(), since that is what is required for the subsequent
> Devres patch.
>
> Cc: Ingo Molnar <mingo@redhat.com>
> Cc: Peter Zijlstra <peterz@infradead.org>
> Cc: Juri Lelli <juri.lelli@redhat.com>
> Cc: Vincent Guittot <vincent.guittot@linaro.org>
> Cc: Dietmar Eggemann <dietmar.eggemann@arm.com>
> Cc: Steven Rostedt <rostedt@goodmis.org>
> Cc: Ben Segall <bsegall@google.com>
> Cc: Mel Gorman <mgorman@suse.de>
> Cc: Valentin Schneider <vschneid@redhat.com>
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>

I have a couple comments on the documentation, but the rest seems good.
So with those fixed:

Reviewed-by: Benno Lossin <lossin@kernel.org>

> ---
>  rust/bindings/bindings_helper.h |   1 +
>  rust/helpers/completion.c       |   8 +++
>  rust/helpers/helpers.c          |   1 +
>  rust/kernel/sync.rs             |   2 +
>  rust/kernel/sync/completion.rs  | 111 ++++++++++++++++++++++++++++++++
>  5 files changed, 123 insertions(+)
>  create mode 100644 rust/helpers/completion.c
>  create mode 100644 rust/kernel/sync/completion.rs
>
> diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_hel=
per.h
> index a5a6fb45d405..9da3fe89295c 100644
> --- a/rust/bindings/bindings_helper.h
> +++ b/rust/bindings/bindings_helper.h
> @@ -17,6 +17,7 @@
>  #include <linux/blk_types.h>
>  #include <linux/blkdev.h>
>  #include <linux/clk.h>
> +#include <linux/completion.h>
>  #include <linux/configfs.h>
>  #include <linux/cpu.h>
>  #include <linux/cpufreq.h>
> diff --git a/rust/helpers/completion.c b/rust/helpers/completion.c
> new file mode 100644
> index 000000000000..b2443262a2ae
> --- /dev/null
> +++ b/rust/helpers/completion.c
> @@ -0,0 +1,8 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +#include <linux/completion.h>
> +
> +void rust_helper_init_completion(struct completion *x)
> +{
> +	init_completion(x);
> +}
> diff --git a/rust/helpers/helpers.c b/rust/helpers/helpers.c
> index 805307018f0e..7a5c520be8cb 100644
> --- a/rust/helpers/helpers.c
> +++ b/rust/helpers/helpers.c
> @@ -13,6 +13,7 @@
>  #include "build_assert.c"
>  #include "build_bug.c"
>  #include "clk.c"
> +#include "completion.c"
>  #include "cpufreq.c"
>  #include "cpumask.c"
>  #include "cred.c"
> diff --git a/rust/kernel/sync.rs b/rust/kernel/sync.rs
> index 36a719015583..c23a12639924 100644
> --- a/rust/kernel/sync.rs
> +++ b/rust/kernel/sync.rs
> @@ -10,6 +10,7 @@
>  use pin_init;
> =20
>  mod arc;
> +pub mod completion;
>  mod condvar;
>  pub mod lock;
>  mod locked_by;
> @@ -17,6 +18,7 @@
>  pub mod rcu;
> =20
>  pub use arc::{Arc, ArcBorrow, UniqueArc};
> +pub use completion::Completion;
>  pub use condvar::{new_condvar, CondVar, CondVarTimeoutResult};
>  pub use lock::global::{global_lock, GlobalGuard, GlobalLock, GlobalLockB=
ackend, GlobalLockedBy};
>  pub use lock::mutex::{new_mutex, Mutex, MutexGuard};
> diff --git a/rust/kernel/sync/completion.rs b/rust/kernel/sync/completion=
.rs
> new file mode 100644
> index 000000000000..4ec4c2aa73a5
> --- /dev/null
> +++ b/rust/kernel/sync/completion.rs
> @@ -0,0 +1,111 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +//! Completion support.
> +//!
> +//! Reference: <https://docs.kernel.org/scheduler/completion.html>
> +//!
> +//! C header: [`include/linux/completion.h`](srctree/include/linux/compl=
etion.h)
> +
> +use crate::{bindings, prelude::*, types::Opaque};
> +
> +/// Synchronization primitive to signal when a certain task has been com=
pleted.
> +///
> +/// The [`Completion`] synchronization primitive signales when a certain=
 task has been completed by
> +/// waking up other tasks that can queue themselves up to wait for the [=
`Completion`] to be

s/can queue themselves/have been queued/

> +/// completed.
> +///
> +/// # Examples
> +///
> +/// ```
> +/// use kernel::sync::{Arc, Completion};
> +/// use kernel::workqueue::{self, impl_has_work, new_work, Work, WorkIte=
m};
> +///
> +/// #[pin_data]
> +/// struct MyTask {
> +///     #[pin]
> +///     work: Work<MyTask>,

Can we maybe add a dummy value like `Mutex<i32>` here that the task
changes, so we can print the value of it below (after waiting for the
task)?

> +///     #[pin]
> +///     done: Completion,
> +/// }
> +///
> +/// impl_has_work! {
> +///     impl HasWork<Self> for MyTask { self.work }
> +/// }
> +///
> +/// impl MyTask {
> +///     fn new() -> Result<Arc<Self>> {
> +///         let this =3D Arc::pin_init(pin_init!(MyTask {
> +///             work <- new_work!("MyTask::work"),
> +///             done <- Completion::new(),
> +///         }), GFP_KERNEL)?;
> +///
> +///         let _ =3D workqueue::system().enqueue(this.clone());
> +///
> +///         Ok(this)
> +///     }
> +///
> +///     fn wait_for_completion(&self) {
> +///         self.done.wait_for_completion();
> +///
> +///         pr_info!("Completion: task complete\n");
> +///     }
> +/// }
> +///
> +/// impl WorkItem for MyTask {
> +///     type Pointer =3D Arc<MyTask>;
> +///
> +///     fn run(this: Arc<MyTask>) {
> +///         // process this task
> +///         this.done.complete_all();
> +///     }
> +/// }
> +///
> +/// let task =3D MyTask::new()?;
> +/// task.wait_for_completion();
> +/// # Ok::<(), Error>(())
> +/// ```
> +#[pin_data]
> +pub struct Completion {
> +    #[pin]
> +    inner: Opaque<bindings::completion>,
> +}
> +
> +impl Completion {
> +    /// Create an initializer for a new [`Completion`].
> +    pub fn new() -> impl PinInit<Self> {
> +        pin_init!(Self {
> +            inner <- Opaque::ffi_init(|slot: *mut bindings::completion| =
{
> +                // SAFETY: `slot` is a valid pointer to an uninitialized=
 `struct completion`.
> +                unsafe { bindings::init_completion(slot) };
> +            }),
> +        })
> +    }
> +
> +    fn as_raw(&self) -> *mut bindings::completion {
> +        self.inner.get()
> +    }
> +
> +    /// Signal all tasks waiting on this completion.
> +    ///
> +    /// This method wakes up all tasks waiting on this completion; after=
 this operation the
> +    /// completion is permanently done.
> +    pub fn complete_all(&self) {
> +        // SAFETY: `self.as_raw()` is a pointer to a valid `struct compl=
etion`.
> +        unsafe { bindings::complete_all(self.as_raw()) };
> +    }
> +
> +    /// Wait for completion of a task.
> +    ///
> +    /// This method waits for the completion of a task; it is not interr=
uptible and there is no

I personally would write:

s/waits for/blocks on/

But if `wait` is the more common kernel term then let's go with your
version instead.

> +    /// timeout.

I would mention the `complete_all` method above.

> +    pub fn wait_for_completion(&self) {
> +        // SAFETY: `self.as_raw()` is a pointer to a valid `struct compl=
etion`.
> +        unsafe { bindings::wait_for_completion(self.as_raw()) };
> +    }
> +}
> +
> +// SAFETY: `Completion` is safe to be send to any task.
> +unsafe impl Send for Completion {}
> +
> +// SAFETY: `Completion` is safe to be accessed concurrently.
> +unsafe impl Sync for Completion {}

Please move these to the struct definition, that way one can more easily
see them when looking at the code.

---
Cheers,
Benno
