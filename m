Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C0E0221FD5;
	Tue,  6 May 2025 04:58:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746507537; cv=none; b=QZbJvqwXtIEQCqzZsUCOyAonbDtOd+GYz1uOFv6/ZaWx5rpvU2q/LvUYRjdXtVqC+5WPxjGjqGUgtNq8Vp8NbeZxfUxTyoaRJRAnyn83gc/9kaNuF0Bb33YILArQ0IhUVUmebn8007Tf+ESdf0YdM/YlRXuokUbpfxlzMZZNXTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746507537; c=relaxed/simple;
	bh=36Nh2klYydSaF1etucQ5T7fKCi92RTp8ELWrFJG81Ks=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=eD9Q3seDnw0nNxKOrOdMtXBsQ842tCYab7VAimLqIlM9sY8WBhGH/owC43DeONMBaJywVdpeLiR0gpwbfm8y/RRNhiEJhSqv8c2bA1o/ByIGBm5twQBNHkSAcWevhfbzJTY3X1K5vDHgOAo+cgtF+XQ4yLK9HmKFN0YWENDUfoU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h9XdHaFE; arc=none smtp.client-ip=209.85.222.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h9XdHaFE"
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-7c559b3eb0bso317920085a.1;
        Mon, 05 May 2025 21:58:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746507534; x=1747112334; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:feedback-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=W1AOmIGSmcpEzj8NNVdx1CCoiyiTrBHzIt96cBaZ5Jw=;
        b=h9XdHaFEWRvEdWwDQnNdy2b2JSrE7EdG+b/bglWxLNqQsC8fsDogNqthoubLdwbBU1
         pbRk7jnTJZWBxcMq3WWB252tPZYpi/8QOwBlDqeDf+Q1O6NHDW05VoUCd8GF/pdWn8gO
         osio/9w9t3R6MsuOSChQiSragjGiNT09fYScPY3AWQqEv2jBoxwO1b/lM/wmj47OHtik
         jNLb8PltnbVqI0rbRPMXG6ObVHiFWxqxE/3PDtMTwaGwO8ksEnKUkVGWGGpZFeehnUap
         6Ha2u2OOpXZ2CCDN7p+tggej/kG0QnC9E9Nc4rFktabYDk3o1OfceH5nr70VbFJsUdQE
         be0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746507534; x=1747112334;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:feedback-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=W1AOmIGSmcpEzj8NNVdx1CCoiyiTrBHzIt96cBaZ5Jw=;
        b=LM4Lw2YXOlkVhbjChwqhd1gY1VO6sof1hm2luFesmGWywHZ7L7XadKU0ydp0xVbLNc
         oi7eukQz+/S9QpIIZAQXKLJxSkx4Mb1sErPlPtwQgneueHEdSkA9tavnU0mOTIoHly0S
         oKkP7NBoLTplxjWuRnBok4/H6fpWi63kBCoHoillKYNY/4RJRCmja6uPCUcnRevtKvCN
         wMk2IralA020BHCeqwiBVA1VUIBsMxEd2ICtkoK2Aj2T5FGVYJ4JsEiBmPzql07RjgnO
         DhPhWFkNo4ISesLTtY81dX3PxufcLciaqh5AsI52hmmu23aMTLdpKE9QIrdUW26kueur
         Y26Q==
X-Forwarded-Encrypted: i=1; AJvYcCV4kT+0dsUhREiguMvcE4QyG+e04cZdAIOHk/WiwC2+P7onYE5IZU2bkAHALX4YjscKECMc62he64nbXfw=@vger.kernel.org, AJvYcCWl2QazbH8zQsYaaCT1F//WKecHLNZczOtZBkvlRD2AZeKwglMaqSfLSlDLPOdbZn7Sl2pswQVA4xn1Oe2KL28=@vger.kernel.org
X-Gm-Message-State: AOJu0YznVbdgcZeniDUEIBhfDzyH/1JGwbxXBp/Muw1mA0RRxWRZcqi9
	1mA9uAs0BU3eqsCxZDxuqVm48tC0E2zxfw5CxHKQdBCFBzFsSNdC
X-Gm-Gg: ASbGncthRR4eQx0FuS7FnAprOvdfaAe+ULG3n5TBqQS8ZhVtVXmIvbHLuN9+XKp/Wye
	KX4lLiBO5Y2OvfxRvQ9mZlStwA4qh6gsv1KwBJdC3o8AzJwmbk5yTLTXe/xbUvk3Q5DkGskAS9O
	XYH0oFh/aK5pd3GlqKxdWyFprrSH8XOHyMm4k1SHS4G2XwLU/2cMHWoCMynG3mFGMEfl8d5smhi
	PhZM7rjnHfOoYoZMzGZQPVkDLiNxY61DLQNHibTc58XKUmjCreunD7rocfmmDV+dD1acCZWTOPs
	rqstkXM2SSIM+f5OkEq89tNAPUNo7cHw9SLg4iJgqnQVw6JyTU5gSsjMsVjoy5ncZBgJMB/YZPz
	OvuzarBJWTtsnlSIpozooYFbhQeh4hbU=
X-Google-Smtp-Source: AGHT+IFiAI5riZ5rOB1hBWWRNaW43PgfIcr0N4slt18rdztpZEgQos+K1pQsIKNodZQQdE44hEQ30w==
X-Received: by 2002:a05:620a:800b:b0:7ca:cd16:8f52 with SMTP id af79cd13be357-7cae3a88450mr1410067785a.12.1746507533966;
        Mon, 05 May 2025 21:58:53 -0700 (PDT)
Received: from fauth-a2-smtp.messagingengine.com (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7cad23c48ffsm658912085a.45.2025.05.05.21.58.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 May 2025 21:58:53 -0700 (PDT)
Received: from phl-compute-08.internal (phl-compute-08.phl.internal [10.202.2.48])
	by mailfauth.phl.internal (Postfix) with ESMTP id BCE711200066;
	Tue,  6 May 2025 00:58:52 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-08.internal (MEProxy); Tue, 06 May 2025 00:58:52 -0400
X-ME-Sender: <xms:DJcZaBTz2QIJA4pudix58YgHht3bXfnjpFxXzrf7yt1vgVKlR3Z7Qg>
    <xme:DJcZaKyTlr0Hwpnk7vtu3UzYYz23upWDKAonxi__dZsbUyLAwPGdhDHynrTieUQUO
    Z0ZQFFwYCyTWrxNvA>
X-ME-Received: <xmr:DJcZaG3AuUM9pJkwLEYgKWG9_PTp__5DcqvXX2bFS9lEKpPlpvMcY6s8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvkeeftdekucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhephffvvefufffkofgjfhgggfestdekredtredt
    tdenucfhrhhomhepuehoqhhunhcuhfgvnhhguceosghoqhhunhdrfhgvnhhgsehgmhgrih
    hlrdgtohhmqeenucggtffrrghtthgvrhhnpeetjeeuueegfeeihfeihfdtueekgedvkedv
    ueefvdduheeugeehlefhvdduueegffenucffohhmrghinhepghhithhhuhgsrdgtohhmpd
    hkvghrnhgvlhdrohhrghdptggrshhtrdgrshenucevlhhushhtvghrufhiiigvpedtnecu
    rfgrrhgrmhepmhgrihhlfhhrohhmpegsohhquhhnodhmvghsmhhtphgruhhthhhpvghrsh
    honhgrlhhithihqdeiledvgeehtdeigedqudejjeekheehhedvqdgsohhquhhnrdhfvghn
    gheppehgmhgrihhlrdgtohhmsehfihigmhgvrdhnrghmvgdpnhgspghrtghpthhtohepfe
    ejpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehmihhnghhosehkvghrnhgvlhdr
    ohhrghdprhgtphhtthhopehpvghtvghriiesihhnfhhrrgguvggrugdrohhrghdprhgtph
    htthhopehmihhnghhosehrvgguhhgrthdrtghomhdprhgtphhtthhopehjuhhrihdrlhgv
    lhhlihesrhgvughhrghtrdgtohhmpdhrtghpthhtohepvhhinhgtvghnthdrghhuihhtth
    hotheslhhinhgrrhhordhorhhgpdhrtghpthhtohepughivghtmhgrrhdrvghgghgvmhgr
    nhhnsegrrhhmrdgtohhmpdhrtghpthhtoheprhhoshhtvgguthesghhoohgumhhishdroh
    hrghdprhgtphhtthhopegsshgvghgrlhhlsehgohhoghhlvgdrtghomhdprhgtphhtthho
    pehmghhorhhmrghnsehsuhhsvgdruggv
X-ME-Proxy: <xmx:DJcZaJBIWOgEhjKo3CKuCuAGgEt6lAMjVuCMW0DVz9Xe5GY1tsh6KQ>
    <xmx:DJcZaKgJzD_oyx_cwlVJTKIG7hQF-5FTVPyHtjgRn7_YmsAJU-g8GQ>
    <xmx:DJcZaNqoU5I4w9plrd3xOwqjWLPCUMArHb-8BkJeCGMh1jSX7QSbGw>
    <xmx:DJcZaFhS6J5tmR2C_MnAChk2JdZZ3I2eB33aRVJlNlxKeYgfIs5n9A>
    <xmx:DJcZaFTstqR0Ld12x1sqnLwQPwXUaZY6oEKqVLdUq_jBvr7I4w83NLYl>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 6 May 2025 00:58:52 -0400 (EDT)
From: Boqun Feng <boqun.feng@gmail.com>
To: Ingo Molnar <mingo@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>
Cc: Ingo Molnar <mingo@redhat.com>,	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,	Ben Segall <bsegall@google.com>,
	Mel Gorman <mgorman@suse.de>,	Valentin Schneider <vschneid@redhat.com>,
	Miguel Ojeda <ojeda@kernel.org>,	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>,	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,	Justin Stitt <justinstitt@google.com>,
	FUJITA Tomonori <fujita.tomonori@gmail.com>,
	Tamir Duberstein <tamird@gmail.com>,	Kunwu Chan <kunwu.chan@hotmail.com>,
	Mitchell Levy <levymitchell0@gmail.com>,
	Martin Rodriguez Reboredo <yakoyoku@gmail.com>,
	Borys Tyran <borys.tyran@protonmail.com>,
	Christian Brauner <brauner@kernel.org>,
	Panagiotis Foliadis <pfoliadis@posteo.net>,	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,	llvm@lists.linux.dev,
	Christian Schrefl <chrisi.schrefl@gmail.com>,
	Charalampos Mitrodimas <charmitro@posteo.net>
Subject: [PATCH 3/5] rust: task: Mark Task methods inline
Date: Mon,  5 May 2025 21:58:41 -0700
Message-Id: <20250506045843.51258-4-boqun.feng@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20250506045843.51258-1-boqun.feng@gmail.com>
References: <20250506045843.51258-1-boqun.feng@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Panagiotis Foliadis <pfoliadis@posteo.net>

When building the kernel using the llvm-18.1.3-rust-1.85.0-x86_64
toolchain provided by kernel.org, the following symbols are generated:

$ nm vmlinux | grep ' _R'.*Task | rustfilt
... T <kernel::task::Task>::get_pid_ns
... T <kernel::task::Task>::tgid_nr_ns
... T <kernel::task::Task>::current_pid_ns
... T <kernel::task::Task>::signal_pending
... T <kernel::task::Task>::uid
... T <kernel::task::Task>::euid
... T <kernel::task::Task>::current
... T <kernel::task::Task>::wake_up
... T <kernel::task::Task as kernel::types::AlwaysRefCounted>::dec_ref
... T <kernel::task::Task as kernel::types::AlwaysRefCounted>::inc_ref

These Rust symbols are trivial wrappers around the C functions. It
doesn't make sense to go through a trivial wrapper for these functions,
so mark them inline.

[boqun: Capitalize the title, reword a bit to avoid listing all the C
functions as the code already shows them and remove the addresses of the
symbols in the commit log as they are different from build to build.]

Link: https://github.com/Rust-for-Linux/linux/issues/1145
Reviewed-by: Benno Lossin <benno.lossin@proton.me>
Reviewed-by: Christian Schrefl <chrisi.schrefl@gmail.com>
Reviewed-by: Charalampos Mitrodimas <charmitro@posteo.net>
Reviewed-by: Alice Ryhl <aliceryhl@google.com>
Signed-off-by: Panagiotis Foliadis <pfoliadis@posteo.net>
Signed-off-by: Boqun Feng <boqun.feng@gmail.com>
Link: https://lore.kernel.org/r/20250315-inline-c-wrappers-v3-1-048e43fcef7d@posteo.net
---
 rust/kernel/task.rs | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/rust/kernel/task.rs b/rust/kernel/task.rs
index 9e6f6854948d..0bf5fdf75c37 100644
--- a/rust/kernel/task.rs
+++ b/rust/kernel/task.rs
@@ -134,6 +134,7 @@ pub fn current_raw() -> *mut bindings::task_struct {
     /// # Safety
     ///
     /// Callers must ensure that the returned object doesn't outlive the current task/thread.
+    #[inline]
     pub unsafe fn current() -> impl Deref<Target = Task> {
         struct TaskRef<'a> {
             task: &'a Task,
@@ -168,6 +169,7 @@ fn deref(&self) -> &Self::Target {
     /// # Safety
     ///
     /// Callers must ensure that the returned object doesn't outlive the current task/thread.
+    #[inline]
     pub unsafe fn current_pid_ns() -> impl Deref<Target = PidNamespace> {
         struct PidNamespaceRef<'a> {
             task: &'a PidNamespace,
@@ -275,24 +277,28 @@ pub fn pid(&self) -> Pid {
     }
 
     /// Returns the UID of the given task.
+    #[inline]
     pub fn uid(&self) -> Kuid {
         // SAFETY: It's always safe to call `task_uid` on a valid task.
         Kuid::from_raw(unsafe { bindings::task_uid(self.as_ptr()) })
     }
 
     /// Returns the effective UID of the given task.
+    #[inline]
     pub fn euid(&self) -> Kuid {
         // SAFETY: It's always safe to call `task_euid` on a valid task.
         Kuid::from_raw(unsafe { bindings::task_euid(self.as_ptr()) })
     }
 
     /// Determines whether the given task has pending signals.
+    #[inline]
     pub fn signal_pending(&self) -> bool {
         // SAFETY: It's always safe to call `signal_pending` on a valid task.
         unsafe { bindings::signal_pending(self.as_ptr()) != 0 }
     }
 
     /// Returns task's pid namespace with elevated reference count
+    #[inline]
     pub fn get_pid_ns(&self) -> Option<ARef<PidNamespace>> {
         // SAFETY: By the type invariant, we know that `self.0` is valid.
         let ptr = unsafe { bindings::task_get_pid_ns(self.as_ptr()) };
@@ -308,6 +314,7 @@ pub fn get_pid_ns(&self) -> Option<ARef<PidNamespace>> {
 
     /// Returns the given task's pid in the provided pid namespace.
     #[doc(alias = "task_tgid_nr_ns")]
+    #[inline]
     pub fn tgid_nr_ns(&self, pidns: Option<&PidNamespace>) -> Pid {
         let pidns = match pidns {
             Some(pidns) => pidns.as_ptr(),
@@ -321,6 +328,7 @@ pub fn tgid_nr_ns(&self, pidns: Option<&PidNamespace>) -> Pid {
     }
 
     /// Wakes up the task.
+    #[inline]
     pub fn wake_up(&self) {
         // SAFETY: It's always safe to call `wake_up_process` on a valid task, even if the task
         // running.
@@ -330,11 +338,13 @@ pub fn wake_up(&self) {
 
 // SAFETY: The type invariants guarantee that `Task` is always refcounted.
 unsafe impl crate::types::AlwaysRefCounted for Task {
+    #[inline]
     fn inc_ref(&self) {
         // SAFETY: The existence of a shared reference means that the refcount is nonzero.
         unsafe { bindings::get_task_struct(self.as_ptr()) };
     }
 
+    #[inline]
     unsafe fn dec_ref(obj: ptr::NonNull<Self>) {
         // SAFETY: The safety requirements guarantee that the refcount is nonzero.
         unsafe { bindings::put_task_struct(obj.cast().as_ptr()) }
-- 
2.39.5 (Apple Git-154)

