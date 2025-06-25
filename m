Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26712199FBA;
	Wed, 25 Jun 2025 05:15:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750828528; cv=none; b=CHve6kIlTzFbGbKchsslXJI435P7XAtm+LLqYcFP7L1LSDpXrbD0btR9MJBusGm8s5dtiFOMSOGrZpY1SwDp9ukajW64mBnZF26djxWNkvqz0xuoL8Ro4U/jH2qPHVJlyREyWNW7vnX81+786Vz1g/nK8ARjx0ZDjtjPm0c7we8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750828528; c=relaxed/simple;
	bh=DZPx48zTDYNX5AKa48yQp9oTWkNFvmRP5adzWyGYmmQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=rOb2T7lhzsrVjsPAmhdSdXdoDsWnGhm68z4/yProq2ZhUouOymHPsBj+IecuSUt4Y578NJVHWUdL5yNsYjdx5eu4Sel0YzRLPWO/+bSg5gHAEe/BVmgeQe6U6m4hTp/ZFfDCEOfIhlWieHgjQbjaBRmQb7fr0zY34mqMWTt8Qhk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TAzrOTxh; arc=none smtp.client-ip=209.85.219.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TAzrOTxh"
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-6fada2dd785so78103986d6.2;
        Tue, 24 Jun 2025 22:15:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750828526; x=1751433326; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:feedback-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=x0uhFJxbTknYVv8H2dzluonrWfElV8YvZk9w6Cc8W4w=;
        b=TAzrOTxhgWnF/AfbJfZFwomT9ljcmf+vkf2TR9kjUxvjOUIWopjWJZEPuVNUgnZ0HS
         sRSFaMfHaWPztxJnWDtbzQ62Mv7u5/Ht3pdYmvCAfWJsGUzE7XuGqiCuFwbt3LdvTz6a
         4E9uF+UfpAzD/v3h3CI2VNmSaSbUZFzhNSc0PqR6z3epOhdBSSAxSWHGPlgyDhepwgXl
         5cWcCJ+OnO1KYOhGid+Do9WLL4wH42RI/ZjSllWfdaRm0gRXkpr1Q/IwG7Ng6Lls3I55
         2fs0TPACheps1c6b9k+/miAOF0BWjhZq71vLgOh3Q0cvKVWSFqkBlVVCPrjLvNsLQ9/F
         8bYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750828526; x=1751433326;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:feedback-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=x0uhFJxbTknYVv8H2dzluonrWfElV8YvZk9w6Cc8W4w=;
        b=wkSyEYSIfIrUJDlt335gH8E1DC6c4hOI50vhWtvlPW0bDJETB461/CzT75J8hpw/TB
         g7g1oQMCfZLYroqH3Ehq8Zy2LtbxsKsEu6Y/iJF5awlZPfQw9OB9yjxgc8jSjOCTCGXm
         bqrJqmLwi8q01kBz1kCFxRuuJCNJOvouc31URrLu/duIDW/BYW/VvioADM85S73p09Di
         F/i8BA+mvSPM8QjjH2yTf/1G1UBmQenVH0kD2Ly6nnqWbhqoRjz20SfAcXJGz2wpEODK
         eQu0vOYK7iK9MtLwEQrMpYFIb1XIJTpm7Z6Br3XGWa0T7pGjvzLfkP8aEZh0PmEn0+bR
         lYKA==
X-Forwarded-Encrypted: i=1; AJvYcCVOz9wn1O5yhm92NJdJ2babGvHSOZtuY38vqTPq5cQqaC2bKRpZy1uwBjNCFOfa1ryfYSM4FzQHAW8iCP8=@vger.kernel.org, AJvYcCXgy61Fw2J67BW9OlelTz1ChPC/Z3VITG6UaYoCVJKXPT9zhHekBS8L8V8EbrEfQ+JeKK/4V5gRQg5FrDKgywE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4LnLLu7cfaPFQSzFopbmTxcd2EYlyP059K5Lxo/YAE/A9A+zh
	XUW7S0QDOD2gDapsOoljF+UEmoDt+GP0bNiCFMq2wip/jbbUPsGfQBYp
X-Gm-Gg: ASbGncts6f3C2y2kV+rsxGgv+hDNteAyFwDFv3SBJbXbq06M1lz/ejHY4rnTGLHv8VD
	9h/m9EJfo1llDedmr+guZUC+69NM+5JF5l9/FjYLvps6ZHfF8yPBapCt3kRb9i1VY75DSX/IA8z
	C2p/x0wrgtCObK3Gh0TKz74Q6bGzy913zNR6TGnWMqWWPgN3gSVwG2lh2te5pGh9M4VzuA8ePgh
	9t7HTLyH0/zriDi1GREsz+8A+P7dOrKXqsQKsVTIuYvlvFj/eW7ycicxUeJEmfTN74mz9lm05+V
	rW9wOUdj/gC3f86RheLhQDpsjoNmh7kaI4ldR3Wo35Go+UTGXnsxF2DG46FJZntNNavuvVc6nYs
	fnufqR6j4YBZ3KGBTEbpJ2kX+9XalYL7KPZvRUaaTxx86ojYv/hQ9
X-Google-Smtp-Source: AGHT+IEFTnqbuvaJX0Csg9cjWCqwK8O2gHdOMg3CTJHOajGqnck4hYJwCK/rV9J0qs08iUEap5Q+iA==
X-Received: by 2002:a05:6214:570a:b0:6fa:cb72:955a with SMTP id 6a1803df08f44-6fd5ef2fccemr23474106d6.4.1750828525731;
        Tue, 24 Jun 2025 22:15:25 -0700 (PDT)
Received: from fauth-a2-smtp.messagingengine.com (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fd09576766sm64178956d6.81.2025.06.24.22.15.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 22:15:25 -0700 (PDT)
Received: from phl-compute-10.internal (phl-compute-10.phl.internal [10.202.2.50])
	by mailfauth.phl.internal (Postfix) with ESMTP id 502DCF40068;
	Wed, 25 Jun 2025 01:15:24 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-10.internal (MEProxy); Wed, 25 Jun 2025 01:15:24 -0400
X-ME-Sender: <xms:7IVbaO65iOjAAcyq6uDY70GEyAz7ZmCw0IFt_YA3rPkDFY8ICTYgAA>
    <xme:7IVbaH4aoewC9nG8q_JKYC7I9DRKqI5BsHvfosPTtJYMRMKvHVMxQIZssq9e4AGlC
    V-0e0jLaAubOq3G2Q>
X-ME-Received: <xmr:7IVbaNfT7SXJKb5cxV1jewqHkLszL2nkZaRzCwsTYU2ZeVn2ZL3Hc1G8vg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddvgddvudeltdcutefuodetggdotefrod
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
X-ME-Proxy: <xmx:7IVbaLLIrdM5e8NfhE8ob0ydD0rqWvN4n3StGN8HBmQQznQGV0PNuw>
    <xmx:7IVbaCIkqt-v5d23uFNcQBTgQ9UvWGBSEQiCvjyi3sMleKg8NU4GKQ>
    <xmx:7IVbaMyKJmSqPjFR1hQxJsUr6-EpIcMEwr4yWtvWW2PAyExY4G27yA>
    <xmx:7IVbaGLyyZO1v4-PQkAHRRbWlWAxbUWX5gIS74GPpXWMim1MiESKfA>
    <xmx:7IVbaJYMydMHJHFbDIOVbXtUTBksE4vhfb1sxu-Qgr9NUJjmCEjIN5fN>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 25 Jun 2025 01:15:23 -0400 (EDT)
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
Subject: [PATCH v2 2/5] rust: sync: Mark PollCondVar::drop() inline
Date: Tue, 24 Jun 2025 22:15:15 -0700
Message-Id: <20250625051518.15255-3-boqun.feng@gmail.com>
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

When building the kernel using the llvm-18.1.3-rust-1.85.0-x86_64
with ARCH=arm64, the following symbols are generated:

$nm vmlinux | grep ' _R'.*PollCondVar  | rustfilt
... T <kernel::sync::poll::PollCondVar as kernel::init::PinnedDrop>::drop
...

This Rust symbol is trivial wrappers around the C functions
__wake_up_pollfree() and synchronize_rcu(). It doesn't make sense to go
through a trivial wrapper for its functions, so mark it inline.

[boqun: Reword the commit title and re-format the commit log per tip
tree's requirement, remove unnecessary information from "nm vmlinux"
result.]

Link: https://github.com/Rust-for-Linux/linux/issues/1145
Suggested-by: Alice Ryhl <aliceryhl@google.com>
Co-developed-by: Grace Deng <Grace.Deng006@Gmail.com>
Signed-off-by: Grace Deng <Grace.Deng006@Gmail.com>
Signed-off-by: Kunwu Chan <kunwu.chan@hotmail.com>
Reviewed-by: Alice Ryhl <aliceryhl@google.com>
Reviewed-by: Benno Lossin <benno.lossin@proton.me>
Signed-off-by: Boqun Feng <boqun.feng@gmail.com>
Link: https://lore.kernel.org/r/20250317025205.2366518-1-kunwu.chan@linux.dev
---
 rust/kernel/sync/poll.rs | 1 +
 1 file changed, 1 insertion(+)

diff --git a/rust/kernel/sync/poll.rs b/rust/kernel/sync/poll.rs
index d7e6e59e124b..7b973d72229b 100644
--- a/rust/kernel/sync/poll.rs
+++ b/rust/kernel/sync/poll.rs
@@ -107,6 +107,7 @@ fn deref(&self) -> &CondVar {
 
 #[pinned_drop]
 impl PinnedDrop for PollCondVar {
+    #[inline]
     fn drop(self: Pin<&mut Self>) {
         // Clear anything registered using `register_wait`.
         //
-- 
2.39.5 (Apple Git-154)

