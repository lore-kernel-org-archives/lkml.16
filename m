Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BF96223DF8;
	Tue,  6 May 2025 04:58:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746507535; cv=none; b=fB9pLthdYaffh/ot68NECLyYhFhPb8ccJH2cNNDBaq3dOT6XCAnve/VjSz9kwOEdqHumPUbDz4eavDCEDrEesau+J/HdcDu4E2/PucrjwnTHajfCxPm9rjoVF4rEEbh0s5r+GEa03IAQ2ZKhEi2IXPsJfZdRotiUosH2zAH7bzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746507535; c=relaxed/simple;
	bh=DZPx48zTDYNX5AKa48yQp9oTWkNFvmRP5adzWyGYmmQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=de0Cd2TVSwXS/OvZ+u1CAPzEEt+P/pm6PBq7pUp3Fpp3tlkmx8IH3d3brL6awTLeUagjRAx1SDUPNYUACVLLoOWQfYOJMPzt2v6vqLpVl6cfa0azLFWWsenCzFNFOEXL4F/yYMKy+Id8cyN9w2On+BHwIGyFQn8N7U1DxCVvuaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ET++4/El; arc=none smtp.client-ip=209.85.222.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ET++4/El"
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-7c9376c4bddso658810485a.3;
        Mon, 05 May 2025 21:58:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746507533; x=1747112333; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:feedback-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=x0uhFJxbTknYVv8H2dzluonrWfElV8YvZk9w6Cc8W4w=;
        b=ET++4/ElitJnpwQQUDzIrIeTzZO5cTAAeq5RZfOFq9rEJ2tR0aDuo0mZgetH75a6uz
         GSYGVq282SHWF357aZhsNQf4HcCls0PjDZGrAbaSm8R3aTx82yscV/tzv3sklFdnqcbs
         u+bJdY9Xs8zy4kTulkqgovK3JpcY3E8UINMoQAUXKGK02AKauGpl/GfHk5An+FG3YdmX
         YCAvuGCRV5IcgLwoMLXdymO16ecppneXgvotL1t4JquVpz8XwB1XuGhbLr0ZWsjDbVNx
         pkofT7ET+OAyelPgDHtvhcpq8YvYeYqwt7ShtDeNBM+PYkkaQIsth16GcqqQEi1c5I6y
         H0kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746507533; x=1747112333;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:feedback-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=x0uhFJxbTknYVv8H2dzluonrWfElV8YvZk9w6Cc8W4w=;
        b=kfK2KWhBQZVmxcrGMUzLhgI20wncnPffH1ZUZhoNzTVxJW9WI1v+k4JCd1XeLCHkjP
         Iuxch9LKy/sVsoMFc5S+Vcz3i2bBnRSYDxbEAS8NL5Zm2+m0k6fNS6J+6BxceG7Fg/fN
         dyigSYg5gE+Y7n1Vi8YTnQEQigZhgDnVbznBqOZ1MeIGwPa+luQrenmVerZf5+agWNlR
         OthffKWsPDtpW9ythVSQ5H6zDtEjZJ1Pu9UZcBQn6sT7yBaemwC4Zoy3HtrwD+ym7+ab
         bZVLRSblmcJ0LIYwas8aPZFKtzgtBfbT+4hYXBPSaE8Y8++3atzT4gRs2gr1LmBYxjnR
         yOZg==
X-Forwarded-Encrypted: i=1; AJvYcCVJQP0EOfjaB2HY4oAHcHioQG6EC3f8r4+/1hA+yco7gXFupOumkCjt8RWQ8RvrPuF/S5kRsHuzySILOMI=@vger.kernel.org, AJvYcCW03cB1l990Z+grdA5j2N/XmUid1m2RUaO6QR2ve8bh2vkcZyi7RlksNgFtSY/M92pYYFgWqbUmqnPGsNBIqYw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzcZxjUXOiWpTtdsFOQ7bBj+S11SFm6eW6Cl+1DngHWBBxALnuj
	vJXENCcU2GNuPpbEEOiGpUGX+uV0LvJx26H6NbdsQ8EkZHqUpchm
X-Gm-Gg: ASbGncvav558hLwFIDKwJQHu9Y3GKAOzMF/ZgdcPZu7S8/tHEOJio/hoytpFRFCfnKP
	Qg+3kR+CBif4O9F9e5Ckx0tJt49O1cb0bq5wEflJWZ6vPV15siZQTJ21Id6eP7q4J4G+jSfA/gv
	OjzJAqNHTS4hZF1mYLuR1JjsCq5RfUMBnbcGk/JwRnn0YTOYizP8H7FKD18I3Q1icJy0YzjdPvh
	fcd00r6UjJKaHtuW4BDdWTzwlaco+dFzIH/P3t8IR+ZrR7xPIJbsnArjTI3TTEABQh3ACJBxxVJ
	pYtaxIZz3G5zRfxYThrtpQJkkBvCvGHZR7QzA5ab0/ecSor3Lx6wC9HYOvU70VzRjlpVoFdU9a3
	4yoRCnNlA1VzkyYg4v5EjdMCPBZnXZYc=
X-Google-Smtp-Source: AGHT+IGN3zEftKt67K/xoaMzkYgh96JRnQbI7cLMPphRjpCglGYRvDGswaB/FJEuaLY1BuA6/neAmg==
X-Received: by 2002:a05:620a:400c:b0:7c5:6410:3a6 with SMTP id af79cd13be357-7cae3ab386bmr1512267585a.27.1746507532781;
        Mon, 05 May 2025 21:58:52 -0700 (PDT)
Received: from fauth-a2-smtp.messagingengine.com (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7cad243f46bsm661511285a.91.2025.05.05.21.58.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 May 2025 21:58:52 -0700 (PDT)
Received: from phl-compute-02.internal (phl-compute-02.phl.internal [10.202.2.42])
	by mailfauth.phl.internal (Postfix) with ESMTP id 472A11200043;
	Tue,  6 May 2025 00:58:51 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-02.internal (MEProxy); Tue, 06 May 2025 00:58:51 -0400
X-ME-Sender: <xms:C5cZaKWk_-S0RPi1FpaUvgrPoDRn5XqxOGmi_g9orw6iHOLMq5TG9w>
    <xme:C5cZaGl011T8YBoUeSpj3A4NbgDvF0X87jv-eC_0e9CBILXLP8cYwQlk3BQW8xAWn
    lIL0TjtUF1J-CmlQQ>
X-ME-Received: <xmr:C5cZaOY-fwjOfb_BeH8-GvXC7jke3n9UwgWEyEN2YwI1HUOdB00Z9sdX>
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
X-ME-Proxy: <xmx:C5cZaBXYm6Wv8qxnM7-ECRh-u5QSgVGsggkz9ktiFy5GkOsKG3ygSg>
    <xmx:C5cZaEmjHS3cGZl9yy2pILovn8Oj4g4GJH48McYWr-vCbfWiguMMYA>
    <xmx:C5cZaGe4hCwOG1awbKmZWLzkvFffrYeL7aHXxTsQ3ceOEREPlLpGTw>
    <xmx:C5cZaGGfwPV8A3kRxhrjVqFQcwLHdu5cIbJDI18H2bLyM7naGi8yfg>
    <xmx:C5cZaCnPUcbgLXZVDLmLfxlPFmeSpds-Myln6o8WbfEEPPKgYi7AOgg5>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 6 May 2025 00:58:50 -0400 (EDT)
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
Subject: [PATCH 2/5] rust: sync: Mark PollCondVar::drop() inline
Date: Mon,  5 May 2025 21:58:40 -0700
Message-Id: <20250506045843.51258-3-boqun.feng@gmail.com>
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

