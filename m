Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F0BC2F2E;
	Mon, 10 Feb 2025 06:09:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739167749; cv=none; b=YLNXfwovZ8xEi29CG89nG5geOma8k2K5+paRYGSKHo/4dIoaMix5Wmzph+LmpDxWqBZ6gQ+HO/N36ymfGrZtpZc8GdXxpBfjnupuxVsV+jfextL0EznQeAwfTyv2XPhPXfRWzqbloywAG2HivBbcrtUDHMwtoOkEfIYSRpSTZSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739167749; c=relaxed/simple;
	bh=GHhEz7KekUZhqj1NE8GNf8fisUtvXl+f+6/xeJmfw5w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lImnFMYPRFABjgztNgcnCG6RY3AzeERUthIlZCx3S/Ffu0lgr0Y+gy8nYbcX1weXVCohFeWjdHCoyWZqo/ZOxSHAbsXWLa03iyb8oS8tjVO9ikEh4mTfeblJ4SBAGKyu1+xaJncWFa739I5avpn+glCiA+zkoXqAlxKrTZ15xJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RWsisHhl; arc=none smtp.client-ip=209.85.219.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RWsisHhl"
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-6e440e64249so44078456d6.3;
        Sun, 09 Feb 2025 22:09:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739167746; x=1739772546; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K5/9PqjEvYkQFd5yNKv2xYvNMa4Akp79ubfmMPlIv04=;
        b=RWsisHhlasT4yQlY0nHFbF/3p76CtFR7tbMyl5cFAZY8QsuDMmpGqD+3UphzeSh0gL
         tDwiWZ8wM7q2KhrpzUtVyU/L1qP//UwuG+f+8im3riY0hKeILvS7PJhYRJyTquf3V+mS
         5ZTe25O+SbHVafaIk/hAWxN7gn1EPvaRu001VVmoH8fyoVCMz+bSp6jrVOR55ZB/ghC9
         lZCuQU7b402YqrszDy17DqiUL5JNmQG2nhrmpmGCvWVhjja49x6fXQg3W5m60O7hpTGY
         1NqAk6zBcvP5eEdwYjeJsSw/4WcN++2xFl09A3d17T9Ty+xExRMcSnt+7kwxrtpnsdGW
         uwYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739167746; x=1739772546;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K5/9PqjEvYkQFd5yNKv2xYvNMa4Akp79ubfmMPlIv04=;
        b=k0JEk8YyJ8VP9kNRqBLJdEVM2FoeF5u73/w59JEwZpbG2XS4UN8al0zB8ZTF+Exr+3
         DutbysV+HxMkMvjMKcl8XR/RX6vh45ziPtPx9oikzrmXqVoUVKWYwY2AlpCvLUuTfH2e
         pHjW2rBLoTt/qjpGdrFDmKq6b35SmPDHukspW4QoP/6bgbXRBg3tfJn3GxyWPAh4etSD
         k+D2gVp9NCj0BO1M7MDf42bFXs3ub5H+h7tbS8pWEHpfvDv8snw+oA/ORam8x/B0ekW8
         YS9Ghac1mbSk60N5ektggEOgfNMQK9d2fhi7dge13BiB9p86lEy8ZK+LUKvGbKzb8WHP
         q5bg==
X-Forwarded-Encrypted: i=1; AJvYcCVoO0xHhfdn0yye21TCWIdge0NZtLNGsUEZrRkwz/SwuJljOIEdYQwGzhBbwJrGDVUjQ5rgGEXCTchSNdw=@vger.kernel.org, AJvYcCVr6pXuq56GX1l+we3K0RhOssEqGrmCGB9D6GNww846rFGSULCrslG7+VmBSEZPSjEFAeXvnlpyqtWV+2AMdTA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwTTSr/O84ffHSN+zQS9evdtJz/bCFTxlj2TYtqinnmiE1dI0sQ
	TblpHrQ/Hd6T9SoKC++X93XSGQcOzf8B6GKJpRHzuY2NsYHDGm8U
X-Gm-Gg: ASbGnctgpNmbvYbS4lDhfuMk8dEQzXQzOGXNjjBijMGYt1CHVE0fgol6E1v4maPZbs9
	/0mQGvxLYYvQWJQ1Z3G8HN4vchwPmtogRo4lhwwzFTdv3u+P3pLejON6pqwOJkfatwPvuyIBigO
	hfzS8qXBrLnuyE+98xQqd00oiXRvs592h3ORMbpu6yOwDCTuJw52vuiVnOnNt/IHVHWyO4wJ8Ji
	Fw3j7ZyQ50g1nbwFwygwBsFEU8sq9cyuC6+16RHee8Q0bjwysCvwFEgOphl68hxx8h2pNERz7CH
	pAYJTEugw2U/6IX4BRlcisPq04AP853R7RiBKvBkS3lceg8LF0WSBgUNVz8+AOkn/cKTsM9YZf9
	KkLXjKw==
X-Google-Smtp-Source: AGHT+IHTYjwgC6qS2wN2jYs6JjD4NiN18ZaeObf5dB9OD+vBRDFGbOJLoczEYVbbx2fjr4RUAeHopw==
X-Received: by 2002:a05:6214:dc7:b0:6e2:4940:400b with SMTP id 6a1803df08f44-6e4455f5b0fmr221946346d6.16.1739167746086;
        Sun, 09 Feb 2025 22:09:06 -0800 (PST)
Received: from fauth-a1-smtp.messagingengine.com (fauth-a1-smtp.messagingengine.com. [103.168.172.200])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6e43baacee1sm43614426d6.84.2025.02.09.22.09.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Feb 2025 22:09:05 -0800 (PST)
Received: from phl-compute-12.internal (phl-compute-12.phl.internal [10.202.2.52])
	by mailfauth.phl.internal (Postfix) with ESMTP id 361211200043;
	Mon, 10 Feb 2025 01:09:05 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-12.internal (MEProxy); Mon, 10 Feb 2025 01:09:05 -0500
X-ME-Sender: <xms:AZipZ-d-ol4i5vfli2_OEF6Kj6KrW0TjoW1ExeaFB7-ghloUgXWdpw>
    <xme:AZipZ4OuHeAnD8srvhURb6BF2IpgdrikM9TP_JDpqHzreA2o6hevjrlU0PeAjxXMl
    xd2nO1g0BXklU-cMA>
X-ME-Received: <xmr:AZipZ_hXkYmN1-uVK7EZ1awYrRRgKdvYBxcco2Vt4PLIzZXD2--WVQ0oYA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdefjedvlecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfhfgggtuggjsehttdertddttddv
    necuhfhrohhmpeeuohhquhhnucfhvghnghcuoegsohhquhhnrdhfvghnghesghhmrghilh
    drtghomheqnecuggftrfgrthhtvghrnhephfetvdfgtdeukedvkeeiteeiteejieehvdet
    heduudejvdektdekfeegvddvhedtnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenuc
    evlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegsohhquhhn
    odhmvghsmhhtphgruhhthhhpvghrshhonhgrlhhithihqdeiledvgeehtdeigedqudejje
    ekheehhedvqdgsohhquhhnrdhfvghngheppehgmhgrihhlrdgtohhmsehfihigmhgvrdhn
    rghmvgdpnhgspghrtghpthhtohepudegpdhmohguvgepshhmthhpohhuthdprhgtphhtth
    hopegrlhhitggvrhihhhhlsehgohhoghhlvgdrtghomhdprhgtphhtthhopehojhgvuggr
    sehkvghrnhgvlhdrohhrghdprhgtphhtthhopehgrghrhiesghgrrhihghhuohdrnhgvth
    dprhgtphhtthhopegsjhhorhhnfegpghhhsehprhhothhonhhmrghilhdrtghomhdprhgt
    phhtthhopegsvghnnhhordhlohhsshhinhesphhrohhtohhnrdhmvgdprhgtphhtthhope
    grrdhhihhnuggsohhrgheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepthhmghhrohhs
    shesuhhmihgthhdrvgguuhdprhgtphhtthhopehpvghtvghriiesihhnfhhrrgguvggrug
    drohhrghdprhgtphhtthhopehmihhnghhosehrvgguhhgrthdrtghomh
X-ME-Proxy: <xmx:AZipZ7-wbpV-bZvFG4RUVs7SF_tP9Y6qT8fXMA0Fs5_sPez6wmhMhQ>
    <xmx:AZipZ6ufROFz-Umx_wKzBF3vvDoWX4brOGjwYjqA9RYl5rRBNLG-8Q>
    <xmx:AZipZyE6No6frdqFXfpD_B3BacWz4EFOqJrN6SGcX3hZ7mFslKlf6Q>
    <xmx:AZipZ5P3WeyOlYY_nE5fvM67QYidNoX-ksCDh1E9ClBXZvDwkaeISQ>
    <xmx:AZipZ3NI8TQNzvDGrAszn4XOvxLTWhZrvNSpHs4GQdtxLgB4Zb16emE7>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 10 Feb 2025 01:09:04 -0500 (EST)
Date: Sun, 9 Feb 2025 22:09:03 -0800
From: Boqun Feng <boqun.feng@gmail.com>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>,
	Waiman Long <longman@redhat.com>, rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] rust: sync: add wait_interruptible_freezable
Message-ID: <Z6mX_29mUYcX0CFS@Mac.home>
References: <20250204-condvar-freeze-v2-1-804483096260@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250204-condvar-freeze-v2-1-804483096260@google.com>

Hi,

On Tue, Feb 04, 2025 at 01:43:25PM +0000, Alice Ryhl wrote:
> Binder allows you to freeze a process where some of its threads are
> blocked on the Binder driver. To make this work, we need to pass
> TASK_FREEZABLE when going to sleep in the appropriate places. Thus, add
> a new method wait_interruptible_freezable for the condition variable so
> that sleeps where this is supported can be marked as such.
> 
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> ---
> Changes in v2:
> - Document that you must not hold locks when you call the method.
> - Link to v1: https://lore.kernel.org/r/20250130-condvar-freeze-v1-1-a91d5661d505@google.com
> ---
>  rust/kernel/sync/condvar.rs | 23 ++++++++++++++++++++++-
>  rust/kernel/task.rs         |  2 ++
>  2 files changed, 24 insertions(+), 1 deletion(-)
> 
> diff --git a/rust/kernel/sync/condvar.rs b/rust/kernel/sync/condvar.rs
> index 7df565038d7d..1859e011e322 100644
> --- a/rust/kernel/sync/condvar.rs
> +++ b/rust/kernel/sync/condvar.rs
> @@ -11,7 +11,9 @@
>      init::PinInit,
>      pin_init,
>      str::CStr,
> -    task::{MAX_SCHEDULE_TIMEOUT, TASK_INTERRUPTIBLE, TASK_NORMAL, TASK_UNINTERRUPTIBLE},
> +    task::{
> +        MAX_SCHEDULE_TIMEOUT, TASK_FREEZABLE, TASK_INTERRUPTIBLE, TASK_NORMAL, TASK_UNINTERRUPTIBLE,
> +    },
>      time::Jiffies,
>      types::Opaque,
>  };
> @@ -159,6 +161,25 @@ pub fn wait_interruptible<T: ?Sized, B: Backend>(&self, guard: &mut Guard<'_, T,
>          crate::current!().signal_pending()
>      }
>  
> +    /// Releases the lock and waits for a notification in interruptible and freezable mode.
> +    ///
> +    /// The process is allowed to be frozen during this sleep. You must not hold any locks while
> +    /// this operation is ongoing, and there is a lockdep assertion for this. Freezing a task that
> +    /// holds a lock can trivially deadlock vs another task that needs that lock to complete before
> +    /// it too can hit freezable.
> +    #[must_use = "wait returns if a signal is pending, so the caller must check the return value"]
> +    pub fn wait_interruptible_freezable<T: ?Sized, B: Backend>(
> +        &self,
> +        guard: &mut Guard<'_, T, B>,
> +    ) -> bool {
> +        self.wait_internal(
> +            TASK_INTERRUPTIBLE | TASK_FREEZABLE,
> +            guard,
> +            MAX_SCHEDULE_TIMEOUT,
> +        );
> +        crate::current!().signal_pending()
> +    }
> +
>      /// Releases the lock and waits for a notification in interruptible mode.
>      ///
>      /// Atomically releases the given lock (whose ownership is proven by the guard) and puts the
> diff --git a/rust/kernel/task.rs b/rust/kernel/task.rs
> index 07bc22a7645c..ea43a3b8d9c5 100644
> --- a/rust/kernel/task.rs
> +++ b/rust/kernel/task.rs
> @@ -23,6 +23,8 @@
>  pub const TASK_INTERRUPTIBLE: c_int = bindings::TASK_INTERRUPTIBLE as c_int;
>  /// Bitmask for tasks that are sleeping in an uninterruptible state.
>  pub const TASK_UNINTERRUPTIBLE: c_int = bindings::TASK_UNINTERRUPTIBLE as c_int;
> +/// Bitmask for tasks that are sleeping in a freezable state.
> +pub const TASK_FREEZABLE: c_int = bindings::TASK_FREEZABLE as c_int;
>  /// Convenience constant for waking up tasks regardless of whether they are in interruptible or
>  /// uninterruptible sleep.
>  pub const TASK_NORMAL: c_uint = bindings::TASK_NORMAL as c_uint;
> 
> ---
> base-commit: 2014c95afecee3e76ca4a56956a936e23283f05b
> change-id: 20250130-condvar-freeze-f2ea5b308405
> 
> Best regards,
> -- 
> Alice Ryhl <aliceryhl@google.com>
> 

I queued this in my locking branch for upcoming PR to tip tree, since
it's relatively small and it belongs to the scope of tip, if all goes
well, it'll be in 6.15. I did some commit log changes while I'm at it,
please see below. Thanks.

Regards,
Boqun

------------->8
Subject: [PATCH] rust: sync: condvar: Add wait_interruptible_freezable()

To support waiting for a `CondVar` as a freezable process, add a
wait_interruptible_freezable() function.

Binder needs this function in the appropriate places to freeze a process
where some of its threads are blocked on the Binder driver.

[Boqun: Capitalize the title and reword the commit log]

Signed-off-by: Alice Ryhl <aliceryhl@google.com>
Signed-off-by: Boqun Feng <boqun.feng@gmail.com>
Link: https://lore.kernel.org/r/20250204-condvar-freeze-v2-1-804483096260@google.com
---
 rust/kernel/sync/condvar.rs | 23 ++++++++++++++++++++++-
 rust/kernel/task.rs         |  2 ++
 2 files changed, 24 insertions(+), 1 deletion(-)

diff --git a/rust/kernel/sync/condvar.rs b/rust/kernel/sync/condvar.rs
index 7df565038d7d..1859e011e322 100644
--- a/rust/kernel/sync/condvar.rs
+++ b/rust/kernel/sync/condvar.rs
@@ -11,7 +11,9 @@
     init::PinInit,
     pin_init,
     str::CStr,
-    task::{MAX_SCHEDULE_TIMEOUT, TASK_INTERRUPTIBLE, TASK_NORMAL, TASK_UNINTERRUPTIBLE},
+    task::{
+        MAX_SCHEDULE_TIMEOUT, TASK_FREEZABLE, TASK_INTERRUPTIBLE, TASK_NORMAL, TASK_UNINTERRUPTIBLE,
+    },
     time::Jiffies,
     types::Opaque,
 };
@@ -159,6 +161,25 @@ pub fn wait_interruptible<T: ?Sized, B: Backend>(&self, guard: &mut Guard<'_, T,
         crate::current!().signal_pending()
     }
 
+    /// Releases the lock and waits for a notification in interruptible and freezable mode.
+    ///
+    /// The process is allowed to be frozen during this sleep. You must not hold any locks while
+    /// this operation is ongoing, and there is a lockdep assertion for this. Freezing a task that
+    /// holds a lock can trivially deadlock vs another task that needs that lock to complete before
+    /// it too can hit freezable.
+    #[must_use = "wait returns if a signal is pending, so the caller must check the return value"]
+    pub fn wait_interruptible_freezable<T: ?Sized, B: Backend>(
+        &self,
+        guard: &mut Guard<'_, T, B>,
+    ) -> bool {
+        self.wait_internal(
+            TASK_INTERRUPTIBLE | TASK_FREEZABLE,
+            guard,
+            MAX_SCHEDULE_TIMEOUT,
+        );
+        crate::current!().signal_pending()
+    }
+
     /// Releases the lock and waits for a notification in interruptible mode.
     ///
     /// Atomically releases the given lock (whose ownership is proven by the guard) and puts the
diff --git a/rust/kernel/task.rs b/rust/kernel/task.rs
index 07bc22a7645c..ea43a3b8d9c5 100644
--- a/rust/kernel/task.rs
+++ b/rust/kernel/task.rs
@@ -23,6 +23,8 @@
 pub const TASK_INTERRUPTIBLE: c_int = bindings::TASK_INTERRUPTIBLE as c_int;
 /// Bitmask for tasks that are sleeping in an uninterruptible state.
 pub const TASK_UNINTERRUPTIBLE: c_int = bindings::TASK_UNINTERRUPTIBLE as c_int;
+/// Bitmask for tasks that are sleeping in a freezable state.
+pub const TASK_FREEZABLE: c_int = bindings::TASK_FREEZABLE as c_int;
 /// Convenience constant for waking up tasks regardless of whether they are in interruptible or
 /// uninterruptible sleep.
 pub const TASK_NORMAL: c_uint = bindings::TASK_NORMAL as c_uint;
-- 
