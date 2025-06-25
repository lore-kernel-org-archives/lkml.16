Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFD5186340;
	Wed, 25 Jun 2025 05:15:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750828527; cv=none; b=DVTiL+r/oNZFs20GMbEEWY4L93oW25UjESx5l9TPZdtNIVUCcptOxHF/0afCgHWwouTxTeAfvu5c1aYXGK5+qxNTbELO6ZcIG4bp1zAVCEcmA8c9a0GGta4yqKs1YxbJnBhmgEd0hi2b+Utxhk/QuHrLGnmD/4NLnz2JqlefUEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750828527; c=relaxed/simple;
	bh=lEdzcKED8dxibbdj4USCma8xOMOqMEjtizIV39k44XQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=hxrIXhY6UYbev9xYwN6cnGIye+fR5i55UVNebbcVLffNvbGifxTsWjiPJKWi+V0ZrLUYEuC9T01lMpq2hiQ0HWlu92TEQ+zMhDld6jd3DLE5DtgBXLH6tkkLecDt3WmV6Xjxk1MdMSSCQTMquQ6SBPTR8QVqzsKW7ZYRdssIktM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gUSZZ3vK; arc=none smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gUSZZ3vK"
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-4a6f0bcdf45so74120041cf.0;
        Tue, 24 Jun 2025 22:15:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750828525; x=1751433325; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:feedback-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=7bZLeeq5Dz3WES+/TzaEncqzq5j376rFHhQoBFa1jdI=;
        b=gUSZZ3vKDiSvcKGamR4iZ1wC9172oJrUgnpROIoETUoY9SiM8YFJKZB/b9mWko/QgV
         j+k4SIrtD0tHKUWU47Sau7JvzIIDSHYYmHsEP+jnAKolHtgsRBjRAj0HsEJq9txMGnHz
         hpwITncNsT/Cg5/gCMKTwPrOLnIhFfTELx8MQKFinQOO7fXKWgUrG0oLSXxCLC8U27QF
         XE/Uwj11vt5ghQ51Fg5mborJ3a36LjHU7PKlzsvLQMKA6Qg4unLIotXVxb+8frl5XQ5j
         xOaJgPvcZLySjvHX0zPDCgGSpMcGyzTI+zoDWWj5OMS9YlGa9yKxHCmKSUvY6tGbRu5d
         4JCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750828525; x=1751433325;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:feedback-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7bZLeeq5Dz3WES+/TzaEncqzq5j376rFHhQoBFa1jdI=;
        b=KT2huSjyLuSkeyciEpVH1Xh7a1uPwdm99J0RS5/ixIzaFaNxE5yuZYMONPDiOjhNog
         xhWZvKEQBCOCnhjyc4rfeyUb97ECmrO6oLJ47uD58ciWpkqhLFzaR0I50Qy7fXN8lWp5
         TA1v+esHAXJ2K8cOfDf+5uRSHHjuhFFDXdu84jSoJelB6ZQ25ZHw3+fyc7muYf4eZZlF
         dxTeblskW6kInMjrlYk/RrG4z+XvMLSyfdbtI5OclKc0asSz8PaGyh4nW97sb2u9PlkW
         Tyg4g5nCocnZDUJPTEVJdxI4WB87y9FvlGITnIlG+e+HtiICIcucY8fyhgH7U0VYme1t
         4VcQ==
X-Forwarded-Encrypted: i=1; AJvYcCVgTqi8px1r0OOSy/uuEkWjsjYCURi4i1rnS3wqWn8FPrNGGMbXoAhhfzZhQ1nNObfhz6MJA6irt0/acaBs2FI=@vger.kernel.org, AJvYcCXtBp9CsPhvBqdNywhQp7wPvpAwmNBKy48nk+LU5e1UfejSr3ymHj7LjDl6wbn5stIm6E4AflLNoVC43pY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzm0+mALRZpSicHgoDORwuyseCUCXrzEBAraC775GZsFhYjxh/k
	Uv/sa3C4t/bpaZxbPOEpIK/MftHECGN/cMgKSnlgYlB7xgIbwSrFlXVx
X-Gm-Gg: ASbGncs2ADCVMCrIOFldGxNioftkjo3XwiL5LHo7iCQyGxassYJTfkrr8HWxiOS34I3
	2J1089CFcjI6Y5w9+Rff/n9Y2Sr05DC6+YjH1ITdoMAO9UIbIJzr/Vp+p5ymY1fJ8FI2tKxwN4h
	mDJk09J+YlbRONahEb01nKuhgVUcBugWaMUYUpxE8Qzst9+FTLnnd5Mk7b6GkTdvomInog2rb50
	4nNfOvQc7p5UhYAcuRCJpy3mSEVmiuseXih7m0wgPy0QfcX9bysFChvcmK7ejuACGz375ma2KmX
	Fvac/ZSyo5o8177rnYL0YoTvjxpHfTrGEDhOCC0vmC9Ec/ptDbTYyoZ9PorN45pDffOUTEj2Eh3
	C24OR3Y0r9zN7t4cGZUjdyegYHWRiPw8ZJecWXBQANoNqHoHej85i
X-Google-Smtp-Source: AGHT+IE2SfyLvxx5vwTElEiNwcIFf2JWsRpHU1DfZP76EL4jxeoF0N+a/gMV3qVAhjt9uTcdmO/yfQ==
X-Received: by 2002:ac8:5ac9:0:b0:490:8ffd:8f02 with SMTP id d75a77b69052e-4a7c088b839mr29342211cf.37.1750828524322;
        Tue, 24 Jun 2025 22:15:24 -0700 (PDT)
Received: from fauth-a2-smtp.messagingengine.com (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4a779e910c8sm56018511cf.71.2025.06.24.22.15.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 22:15:23 -0700 (PDT)
Received: from phl-compute-06.internal (phl-compute-06.phl.internal [10.202.2.46])
	by mailfauth.phl.internal (Postfix) with ESMTP id 0020AF40067;
	Wed, 25 Jun 2025 01:15:23 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-06.internal (MEProxy); Wed, 25 Jun 2025 01:15:23 -0400
X-ME-Sender: <xms:6oVbaLBW9vr1AiJF43xvygKBNooMag5P0I7YsTbWMMu0xgE9DMLB0w>
    <xme:6oVbaBgl-_7ZHaeMLnfyP4nMkAqANMw4Cn9Ar2lgbLM56hFXfsDkunKYBDUSIJ-sG
    tL-zIeZq4RsUtdiaA>
X-ME-Received: <xmr:6oVbaGmzwi16tcT0BZc4I6YFdTp94yaRxSyoeLaGs3RgXZQoOKYitMS8Rw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddvgddvudeludcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeeuohhquhhnucfh
    vghnghcuoegsohhquhhnrdhfvghnghesghhmrghilhdrtghomheqnecuggftrfgrthhtvg
    hrnhepkeetteejgeduieekudejfedvvddtiefgieffffeljeefieehiefffedvfeffgfet
    necuffhomhgrihhnpehgihhthhhusgdrtghomhdpkhgvrhhnvghlrdhorhhgnecuvehluh
    hsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepsghoqhhunhdomhgv
    shhmthhprghuthhhphgvrhhsohhnrghlihhthidqieelvdeghedtieegqddujeejkeehhe
    ehvddqsghoqhhunhdrfhgvnhhgpeepghhmrghilhdrtghomhesfhhigihmvgdrnhgrmhgv
    pdhnsggprhgtphhtthhopeefiedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepmh
    hinhhgoheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepphgvthgvrhiisehinhhfrhgr
    uggvrggurdhorhhgpdhrtghpthhtohepmhhinhhgohesrhgvughhrghtrdgtohhmpdhrtg
    hpthhtohepjhhurhhirdhlvghllhhisehrvgguhhgrthdrtghomhdprhgtphhtthhopehv
    ihhntggvnhhtrdhguhhithhtohhtsehlihhnrghrohdrohhrghdprhgtphhtthhopeguih
    gvthhmrghrrdgvghhgvghmrghnnhesrghrmhdrtghomhdprhgtphhtthhopehrohhsthgv
    ughtsehgohhoughmihhsrdhorhhgpdhrtghpthhtohepsghsvghgrghllhesghhoohhglh
    gvrdgtohhmpdhrtghpthhtohepmhhgohhrmhgrnhesshhushgvrdguvg
X-ME-Proxy: <xmx:6oVbaNwlxiA3e109ZKzf7VXozS8kbUjZSekljxJ2vmO_GUUTjkY3Ww>
    <xmx:6oVbaASLdeV16iYtImGS3JVLTbtzQXYg6lKoPUAEexpSFSSG9dGgmg>
    <xmx:6oVbaAZliG46lVdVZzxFIKr2c9AH5CCFZi9NXQKm8Gq_lei439V62g>
    <xmx:6oVbaBT5-2KzGicGkQ6i9AAVdejY9453Wq1LP2JQJfw4ZYAwJERoiw>
    <xmx:6oVbaGDSMYbleIxZ_zmk9prxOh-a3y1KIpoCTehORRFChIIArslFrSCA>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 25 Jun 2025 01:15:22 -0400 (EDT)
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
Subject: [PATCH v2 1/5] rust: sync: Mark CondVar::notify_*() inline
Date: Tue, 24 Jun 2025 22:15:14 -0700
Message-Id: <20250625051518.15255-2-boqun.feng@gmail.com>
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

