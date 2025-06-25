Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77DB21E2834;
	Wed, 25 Jun 2025 05:15:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750828530; cv=none; b=l5YJ40aZfOxOhUAYZ5V8GC5LUaFw6f3OUsVqsSwTyyJ+2vW3JtKorSIubWhngyjjH9lhjgNArwHHrwaf5jn7fnUE4GaVxYaw9MRCG+2/TLYsDtKHGYq3B3b7a8YeMm1r1N/Ud6dd+9lYChPtH9WHZDiPbSsDu1Q3mX8CMfYRVg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750828530; c=relaxed/simple;
	bh=smxDLvsJze7SanW5jkLByGCvEyisY67nQWf9OhoWJVg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=dXswy7t/ahZaK9Hsy09oiG54m9n9PFYXhMLwdy0cnXAl5NZVwGTRInuhDp+wWcRhRXx5lpDLT8XqsyysR5as94Bt9X/KEtdsLyO/mMmloR0g4XWmrwgYHbCCT8C0bqz9kzd4VK1WDjTrdB9rOG00YFFxOZTXbMzaBqz1s2lceoc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IHe9YEGj; arc=none smtp.client-ip=209.85.222.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IHe9YEGj"
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-7cadd46ea9aso946663385a.1;
        Tue, 24 Jun 2025 22:15:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750828527; x=1751433327; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:feedback-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=+kICsOE0yg2BTiSdXOCgN6mz13mvo6la/kJ0XkefREQ=;
        b=IHe9YEGjGdVKtlBoGNV2rO6f1THz3g8uAkeKB1IRrDhtzhjhTA+nGHm0KJatWVYri2
         jOSlD7ICMrm3ofGWZ9AKhSHm6E4AIUNN4cIl2NilBE+I2M2gX7rQs5DmcoWxg7Oayvcv
         8g22OfAe7QgIZ82TE71YIhnFNPdyac4kOLBnAVJR4EV47a/U8d42HiOyTekXvIgj/sJH
         uEyz64im6TVPpa1KQpqD9CLyQNcM6XygQN41nPzOkQBP+N8JwT+arBWtYueOjuuNKQCj
         w/ItYZwd3/+G0dp2MVD/eH2mdBwW7ZqBQXkHHPX7yBesaRB36fsJ0jwikZE/PsTYbVby
         opwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750828527; x=1751433327;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:feedback-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+kICsOE0yg2BTiSdXOCgN6mz13mvo6la/kJ0XkefREQ=;
        b=mL7vfB4uZe5P+YbzcZHafq+PcWAn1tK+QGA5ewGE/IKRcE2MRRalLM/yvUkpGrQPLK
         hggUNswPfLH7QI/KBtvbuIcv8fIoyzDhb2Z2Xi01qf6lKYwQ5inoDdMn1blFGTS+3M4L
         7HMqKbYw7Ho3wflWQu3f7jLQrONA1bKRXKbmCgx438k2d+a0NcxfNApCOdu5PpTtIrLA
         MVB4UjkINdT/CGGfWx2Nd9r6BiopFltALcFydDdAQ9D9N0bTyj90SLcKYOZDQsacGUxo
         yWOOqXlJQ99/PEyuKbCKcEcXYqLgqcK36a3Bcgy+4zSCQbkSO55y8dp7uhATjzJllF1a
         9rPA==
X-Forwarded-Encrypted: i=1; AJvYcCUEIx2lITIseYZqPx7Q1oefFO308w84cDGuR0gQa+LBS6O2/0vSb7jaXIReJAQECcLPNq9DVTWQ2UJ+GJxI69g=@vger.kernel.org, AJvYcCXQAw4ymsVG1k8ooI4kkPo6dPcrEbswDgn6kbJfvSjytQOACLVPnD+ZZthkButqtkQ7rSN5gnVuS02F64o=@vger.kernel.org
X-Gm-Message-State: AOJu0YyKyE8e/2NNdGfwda1mmEyVvPR494Gz1D2BZh6MJ3qP6KreBqcS
	btqpD2HAzOtRByGLsVpd6slAhm0LdveHwFxVF/06HQSYMmKs/GA5zD3Y
X-Gm-Gg: ASbGncvv4VHfAzaimEDeIOl5gf5OUF4oURinDQfcf7pD2ImLCKCgvYQFW6fVdt3BH59
	XZJsUJSbDSd5sBHtDhwSfa36crjxZR639bUizZMd93y/SbrEHMDsSNJ3KXc8aKekdjDQ1tfUXH3
	4ya1Z7N66t8tj0X3mAzwt6LgQnhJEkAbRPimhz46lJvT4fCNULOj3T6JtDAj0WyRfsUykHi+c28
	AmxlW7s4q1EqrhMOHIklEpscIe7xGPVLd0DROLo+oun1SVUHgYQrzrtwViHW1wQ6Vh6gcZH55gg
	DLYWwghYTVB2AQ2199AS0DNWuPMKMRadWGBnGP1qXAnIXiosBJ3L2XNgIdV4mvAahqbXlXgpQtD
	dBTuW0xugmwmYFIYwNKd2q2ESPMcRYDIlNLfIwy1B23kAFaPD9/hJ
X-Google-Smtp-Source: AGHT+IF/eyqrfKOfuzaqpV3gyLsb6OnjZf7waUNYedNniJyI+yfxubomdyfc4MxIxfE5P6r1MYBDwA==
X-Received: by 2002:a05:620a:40c2:b0:7d3:f193:6328 with SMTP id af79cd13be357-7d429797054mr285299885a.54.1750828527153;
        Tue, 24 Jun 2025 22:15:27 -0700 (PDT)
Received: from fauth-a2-smtp.messagingengine.com (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d3f999c07bsm581667885a.4.2025.06.24.22.15.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 22:15:26 -0700 (PDT)
Received: from phl-compute-03.internal (phl-compute-03.phl.internal [10.202.2.43])
	by mailfauth.phl.internal (Postfix) with ESMTP id A3EC1F40066;
	Wed, 25 Jun 2025 01:15:25 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-03.internal (MEProxy); Wed, 25 Jun 2025 01:15:25 -0400
X-ME-Sender: <xms:7YVbaPbztAQS3G6CcHXLQPlUFNDIrUaMUpr3ZWaa5vQvOWlJPHqFTA>
    <xme:7YVbaOb_-Baqkav_Z06dDU1X4mIKWHXXiTLnKfdVqr3sqMnTcXMKEDAazRutRBSED
    4e-RSwusSk0fDXYcg>
X-ME-Received: <xmr:7YVbaB_xVdGWDFUXHv5RaywSnue0fdaluUPL1i2E3tkUy31D-Yaf4Xf0_g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddvgddvudeltdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeeuohhquhhnucfh
    vghnghcuoegsohhquhhnrdhfvghnghesghhmrghilhdrtghomheqnecuggftrfgrthhtvg
    hrnhepteejueeugeefiefhiefhtdeukeegvdekvdeufedvudehueegheelhfdvudeugeff
    necuffhomhgrihhnpehgihhthhhusgdrtghomhdpkhgvrhhnvghlrdhorhhgpdgtrghsth
    drrghsnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhep
    sghoqhhunhdomhgvshhmthhprghuthhhphgvrhhsohhnrghlihhthidqieelvdeghedtie
    egqddujeejkeehheehvddqsghoqhhunhdrfhgvnhhgpeepghhmrghilhdrtghomhesfhhi
    gihmvgdrnhgrmhgvpdhnsggprhgtphhtthhopeefjedpmhhouggvpehsmhhtphhouhhtpd
    hrtghpthhtohepmhhinhhgoheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepphgvthgv
    rhiisehinhhfrhgruggvrggurdhorhhgpdhrtghpthhtohepmhhinhhgohesrhgvughhrg
    htrdgtohhmpdhrtghpthhtohepjhhurhhirdhlvghllhhisehrvgguhhgrthdrtghomhdp
    rhgtphhtthhopehvihhntggvnhhtrdhguhhithhtohhtsehlihhnrghrohdrohhrghdprh
    gtphhtthhopeguihgvthhmrghrrdgvghhgvghmrghnnhesrghrmhdrtghomhdprhgtphht
    thhopehrohhsthgvughtsehgohhoughmihhsrdhorhhgpdhrtghpthhtohepsghsvghgrg
    hllhesghhoohhglhgvrdgtohhmpdhrtghpthhtohepmhhgohhrmhgrnhesshhushgvrdgu
    vg
X-ME-Proxy: <xmx:7YVbaFrwsMfvJuo08KFgwcz8RnsfBYYwIx2SaMvI9-3W_GimA_ABGQ>
    <xmx:7YVbaKr2gtme0UjoqZFNtrRVsdut9srBn2KvSeP63IJQuxD_8_zxxg>
    <xmx:7YVbaLRe_pfboeAIpdQHNs4roJ9NfP7JvWD9zG7crYSyNC-V8w0giw>
    <xmx:7YVbaCqc8RgWXyAACAL4S9Rz9CUCTZ044aWbr3hl8-Vvpo2zGfXgMw>
    <xmx:7YVbaL4Glhw4crWCS0Sl9biVVqaqtWIe8Kj7sgx9tDmMAjCjv1hTlFP8>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 25 Jun 2025 01:15:25 -0400 (EDT)
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
Subject: [PATCH v2 3/5] rust: task: Mark Task methods inline
Date: Tue, 24 Jun 2025 22:15:16 -0700
Message-Id: <20250625051518.15255-4-boqun.feng@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20250625051518.15255-1-boqun.feng@gmail.com>
References: <20250625051518.15255-1-boqun.feng@gmail.com>
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
 rust/kernel/task.rs | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/rust/kernel/task.rs b/rust/kernel/task.rs
index 927413d85484..834368313088 100644
--- a/rust/kernel/task.rs
+++ b/rust/kernel/task.rs
@@ -173,6 +173,7 @@ pub fn current_raw() -> *mut bindings::task_struct {
     /// Callers must ensure that the returned object is only used to access a [`CurrentTask`]
     /// within the task context that was active when this function was called. For more details,
     /// see the invariants section for [`CurrentTask`].
+    #[inline]
     pub unsafe fn current() -> impl Deref<Target = CurrentTask> {
         struct TaskRef {
             task: *const CurrentTask,
@@ -222,24 +223,28 @@ pub fn pid(&self) -> Pid {
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
@@ -255,6 +260,7 @@ pub fn get_pid_ns(&self) -> Option<ARef<PidNamespace>> {
 
     /// Returns the given task's pid in the provided pid namespace.
     #[doc(alias = "task_tgid_nr_ns")]
+    #[inline]
     pub fn tgid_nr_ns(&self, pidns: Option<&PidNamespace>) -> Pid {
         let pidns = match pidns {
             Some(pidns) => pidns.as_ptr(),
@@ -268,6 +274,7 @@ pub fn tgid_nr_ns(&self, pidns: Option<&PidNamespace>) -> Pid {
     }
 
     /// Wakes up the task.
+    #[inline]
     pub fn wake_up(&self) {
         // SAFETY: It's always safe to call `wake_up_process` on a valid task, even if the task
         // running.
@@ -341,11 +348,13 @@ pub fn active_pid_ns(&self) -> Option<&PidNamespace> {
 
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

