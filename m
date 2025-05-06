Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7802B2248BF;
	Tue,  6 May 2025 04:58:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746507534; cv=none; b=sWfSwewwNFnIIwf7BcuTxEXPfve3O1Z0xPnjEzb7k8/p3jIvksPZdETu+/CRLoNAOq0YySkJMWAhuDrZhY7kW9bq2bGn/QkpaM6gcdBsVzJj0TvNHLdnYjdYk3qf3xHAiQqNNrDMUDv6Ucn6mXg+7sZ1AclqI/0S+feJWJQ3RnQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746507534; c=relaxed/simple;
	bh=lEdzcKED8dxibbdj4USCma8xOMOqMEjtizIV39k44XQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=NbSEyhuToavrgkDKMuaIjN8IY02yFgSiDmlUi6d8wlIxkvtknA013rCm3VIxR9bfs5JldEv4Y/KQC2nU7CDd6GBxmEvqxXKg+r/qAIefHFF0AqO14fOI2TbhXGTUfpBNFkLLKBwVekGMldsRkSR647hb+dhyxsX1KseZgC728AE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KWv6kmB5; arc=none smtp.client-ip=209.85.219.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KWv6kmB5"
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-6f53c54df75so1653796d6.3;
        Mon, 05 May 2025 21:58:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746507531; x=1747112331; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:feedback-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=7bZLeeq5Dz3WES+/TzaEncqzq5j376rFHhQoBFa1jdI=;
        b=KWv6kmB5TKXYUDHPkoyzZDajpyk/rsL1aFCf3HRqoT/X+Htq49ha5HZ0EitmCIhNgi
         Wpxw3wXDZtDZE1EWWl4thHmfZsH5EfQNuiJU+ZMs6iJpr1yA9FZAecUHt9Z0bn81f1sS
         T1osgvhEWXJj1qBHi2OCeH78dpYBjQFq+uiulAgS1fevvwvPJ0P16UCGmWbh571X9UH6
         T0zpwg1kcIcFx7rLalAEtrvAyZJELvntlELwyjn4QTtJCA+Zb4zokz9aqEKZkUrPgtVT
         SyypqZ0V4qsoMV2EQSG4M0AwUfznWXPKazZNPJAKPupdZKbQKbh3TOLWP8qGN+B3GYxg
         i/5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746507531; x=1747112331;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:feedback-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7bZLeeq5Dz3WES+/TzaEncqzq5j376rFHhQoBFa1jdI=;
        b=kQctaKkG0auCtLFvaF8a90uYQSEJotvCIo/KH+TwNfoTcWkH5cU2vK1ivOvLXVP0Z2
         l4rMkf635PiNYkp6QFzHSYx3SCvpom+YjUWA/HWjDHVVleF2BKYh8bhyONJJtG1BrdKw
         BUI6J6WRjBqijiFIghNsPAbAJoIfQdPhVyMjA23XfQ0C5yaqk7naGX2lmXVb0kk3CHKy
         7+JRuQojB8hadOL5cTtZOkEcSTEWjdsaF3s5CYeYbotIlGhTH434P+JVj5SqgINp9Dh5
         cOE3GzIAxIO2ex5spEcBTkraZ8qZNInvum3xOOUdSFOZvDj83yLQKCZbOtgC3OrLfShd
         /lHQ==
X-Forwarded-Encrypted: i=1; AJvYcCVDcGTaTzTYcPZ26ejujFOuVW2SWFZ3GDOPkpZ339D0g/kiv1/gPpTEwDNnlgx8UOEHUmHUbNgr/yM8maI=@vger.kernel.org, AJvYcCWg+y6KCfLNkCldQhRZ3aEHg6qgYQF18rQKpaWkteZ5PlvyEviO5q0prUzU/mdfntwCGO/aEwYfMBjlhmz8feE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4RSeyrr1bwn9W7McDRlvo92Vv7UlNxz+mZtC1dKhlbb9Qp83y
	hSj/zmBNLLN6JTUoUnWDjdn/8613q4dJ1MV2yKSjK3oufGTFy454
X-Gm-Gg: ASbGncsKHvBKXsdhmbHnyRo5kxE4I5JiAG53LSInK9ySfSzCfZELNHXZ+9JQsiBWM8b
	tiQfQTj7qc69J2TgCXoOu7IzKts4qC+Kj9sKd19ZuFfek81plTkRil/inQMHvgXcVi6itXS4/BC
	nJ2FdRlYCWhx8zjhFgqYM0U778V0nOymfwAynoXw2xvuOyxYxPRXs2Ih9twLNdcZ76gVKQQS8tD
	aiSkstdoE178qam2x1ytF4TDL1C85fg2BeX9agNDJ1CwvwDGP42l/f6Xz5EXxsY/DPPnIJ10WOi
	EMIuCuu3+NFlxSKv/prCuSx4YX/oQkAK4pqJfKQpek7Ersomw0gNACTTtZekaM7EZJ5zRII9e8g
	FPdZksNYV3ZXZyYnbi9jUPsVQXKE+fAM=
X-Google-Smtp-Source: AGHT+IEjhbTiYOsmtBCisQyZq1Vbn3IcdJP3tHhEgzvRz0gIG9zkwjhO/vqY8tx/UqKV8YNaJ3sFqA==
X-Received: by 2002:a05:6214:5016:b0:6e8:f3ec:5406 with SMTP id 6a1803df08f44-6f5353e889fmr43075446d6.19.1746507531269;
        Mon, 05 May 2025 21:58:51 -0700 (PDT)
Received: from fauth-a2-smtp.messagingengine.com (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f50f49c965sm65061526d6.119.2025.05.05.21.58.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 May 2025 21:58:50 -0700 (PDT)
Received: from phl-compute-01.internal (phl-compute-01.phl.internal [10.202.2.41])
	by mailfauth.phl.internal (Postfix) with ESMTP id E5A421200066;
	Tue,  6 May 2025 00:58:49 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-01.internal (MEProxy); Tue, 06 May 2025 00:58:49 -0400
X-ME-Sender: <xms:CZcZaOguny9nVYGEMGa7FXE0Skd2X3TJr_o0sKj-iui70fpXdp_zeA>
    <xme:CZcZaPCEwQDNOrRRFOpALgEirAZdKt_503Ga66b1P_5HUGqIQWrSZxg94DAMbdKGN
    3iMZXzXKa11ZcIoFg>
X-ME-Received: <xmr:CZcZaGGSddR5uvtczkiy25LYMNYPajONi7alx-ClRSalWjlEcBJbtLV0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvkeeftdekucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhephffvvefufffkofgjfhgggfestdekredtredt
    tdenucfhrhhomhepuehoqhhunhcuhfgvnhhguceosghoqhhunhdrfhgvnhhgsehgmhgrih
    hlrdgtohhmqeenucggtffrrghtthgvrhhnpeekteetjeegudeikedujeefvddvtdeigfei
    ffffleejfeeiheeiffefvdeffffgteenucffohhmrghinhepghhithhhuhgsrdgtohhmpd
    hkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgr
    ihhlfhhrohhmpegsohhquhhnodhmvghsmhhtphgruhhthhhpvghrshhonhgrlhhithihqd
    eiledvgeehtdeigedqudejjeekheehhedvqdgsohhquhhnrdhfvghngheppehgmhgrihhl
    rdgtohhmsehfihigmhgvrdhnrghmvgdpnhgspghrtghpthhtohepfeeipdhmohguvgepsh
    hmthhpohhuthdprhgtphhtthhopehmihhnghhosehkvghrnhgvlhdrohhrghdprhgtphht
    thhopehpvghtvghriiesihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehmihhngh
    hosehrvgguhhgrthdrtghomhdprhgtphhtthhopehjuhhrihdrlhgvlhhlihesrhgvughh
    rghtrdgtohhmpdhrtghpthhtohepvhhinhgtvghnthdrghhuihhtthhotheslhhinhgrrh
    hordhorhhgpdhrtghpthhtohepughivghtmhgrrhdrvghgghgvmhgrnhhnsegrrhhmrdgt
    ohhmpdhrtghpthhtoheprhhoshhtvgguthesghhoohgumhhishdrohhrghdprhgtphhtth
    hopegsshgvghgrlhhlsehgohhoghhlvgdrtghomhdprhgtphhtthhopehmghhorhhmrghn
    sehsuhhsvgdruggv
X-ME-Proxy: <xmx:CZcZaHTl4Wt2ZKl7kEEMllRDGUf8YqIemOwCWV-qQbCYmm-0NnJP-A>
    <xmx:CZcZaLyuiD71sLGEdptBCHr22yWC8oWn2gXM5itPxZ2d0gQACumX2w>
    <xmx:CZcZaF7qZQux7YK0flQfvRVke3hoXrJ0Nw5q40UUpcpoFQAW4_gQNQ>
    <xmx:CZcZaIzPOnAuxMkBx9eMueBJ8YyAQ705WQRkYg146alY0fwHdu439g>
    <xmx:CZcZaHjzQmUdY0Z680tReLJoZ4rKWmwV_cgkL8vLADzcf7TaYs2hHYTY>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 6 May 2025 00:58:49 -0400 (EDT)
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
	Grace Deng <Grace.Deng006@Gmail.com>
Subject: [PATCH 1/5] rust: sync: Mark CondVar::notify_*() inline
Date: Mon,  5 May 2025 21:58:39 -0700
Message-Id: <20250506045843.51258-2-boqun.feng@gmail.com>
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

From: Kunwu Chan <kunwu.chan@hotmail.com>

When build the kernel using the llvm-18.1.3-rust-1.85.0-x86_64
with ARCH=arm64, the following symbols are generated:

$nm vmlinux | grep ' _R'.*CondVar | rustfilt
... T <kernel::sync::condvar::CondVar>::notify_all
... T <kernel::sync::condvar::CondVar>::notify_one
... T <kernel::sync::condvar::CondVar>::notify_sync
...

These notify_*() symbols are trivial wrappers around the C functions
__wake_up() and __wake_up_sync(). It doesn't make sense to go through
a trivial wrapper for these functions, so mark them inline.

[boqun: Reword the commit title for consistency and reformat the commit
log.]

Suggested-by: Alice Ryhl <aliceryhl@google.com>
Link: https://github.com/Rust-for-Linux/linux/issues/1145
Co-developed-by: Grace Deng <Grace.Deng006@Gmail.com>
Signed-off-by: Grace Deng <Grace.Deng006@Gmail.com>
Signed-off-by: Kunwu Chan <kunwu.chan@hotmail.com>
Reviewed-by: Benno Lossin <benno.lossin@proton.me>
Reviewed-by: Alice Ryhl <aliceryhl@google.com>
Signed-off-by: Boqun Feng <boqun.feng@gmail.com>
Link: https://lore.kernel.org/r/20250324061835.1693125-1-kunwu.chan@linux.dev
---
 rust/kernel/sync/condvar.rs | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/rust/kernel/sync/condvar.rs b/rust/kernel/sync/condvar.rs
index caebf03f553b..c6ec64295c9f 100644
--- a/rust/kernel/sync/condvar.rs
+++ b/rust/kernel/sync/condvar.rs
@@ -216,6 +216,7 @@ fn notify(&self, count: c_int) {
     /// This method behaves like `notify_one`, except that it hints to the scheduler that the
     /// current thread is about to go to sleep, so it should schedule the target thread on the same
     /// CPU.
+    #[inline]
     pub fn notify_sync(&self) {
         // SAFETY: `wait_queue_head` points to valid memory.
         unsafe { bindings::__wake_up_sync(self.wait_queue_head.get(), TASK_NORMAL) };
@@ -225,6 +226,7 @@ pub fn notify_sync(&self) {
     ///
     /// This is not 'sticky' in the sense that if no thread is waiting, the notification is lost
     /// completely (as opposed to automatically waking up the next waiter).
+    #[inline]
     pub fn notify_one(&self) {
         self.notify(1);
     }
@@ -233,6 +235,7 @@ pub fn notify_one(&self) {
     ///
     /// This is not 'sticky' in the sense that if no thread is waiting, the notification is lost
     /// completely (as opposed to automatically waking up the next waiter).
+    #[inline]
     pub fn notify_all(&self) {
         self.notify(0);
     }
-- 
2.39.5 (Apple Git-154)

