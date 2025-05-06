Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2853A7262B;
	Tue,  6 May 2025 04:58:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746507532; cv=none; b=MiXy0FJiaj6ptmKKh8rZlxe79JGWMqsnVSpnN2KgTexMGtPO0qiHnwg8mBjRmJM4JOzIN6oJS2EEIsMkoo6frrMspvk3AwjGODe6cAD16rov9TvszKlVp1cAnl9e1oV4l3LmoLWqxnm9x0NU41YbrGJ/aiu4auQ1GRqe3nyBWGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746507532; c=relaxed/simple;
	bh=iaNVSgDCQj15CHSQ2v2yVRpMKdCiSOhrKe5fSMNYPi4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=OPds68YM+IXLUU6KZbqys5OhYsWveyIHWBB+IWql1UxA0jpAPbL12rkVGeaEU90y9A+VEDQZ0Srhijm8lwoudQ6iS2qEFeu9yhcrtxD8td/LAmWVpPyF2zF+Y4/IFsTJTLqKrQmVYFux8fqkSmNwcqP+ZjPHaFleE/zR6+aEIu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CZjxNz+n; arc=none smtp.client-ip=209.85.219.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CZjxNz+n"
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-6f0c30a1cb6so38397326d6.2;
        Mon, 05 May 2025 21:58:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746507530; x=1747112330; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:feedback-id:from:to:cc:subject:date:message-id:reply-to;
        bh=3Gjy7wHD2gdMjWH59c+YHYGV73Erg1xjJd+iSiyjF5g=;
        b=CZjxNz+n4RqmAsUY8vTql5RHLsOMEoqJnYGnK8fte4kOFANkerE5ZP0dinzWB+tqmy
         dzemXB2/Qeh451Orq0wHRNSef8smjDcBvWhdPeslPv23h8FLHarXqp8rCnxi803Nxk4i
         ZZ7iq2PDY4z69CMuYkWgvJZjkd6436NlTXPMHWeIuUOBsbZSgJ4mGtqAT4FOfHpoI6bb
         Z0FOh3+rRbhWvT3zdPXwbpflaEys817gsADhxoA1wBsEA3cIjsAYomJoNt9RxrffvaJT
         TH+LW3F2RhUsNs2dpeGEAl2cgq+jTg05FV2jrp5LSfWIwpk9Vc6M9x2d79X2wK2pFnub
         Fmuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746507530; x=1747112330;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:feedback-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3Gjy7wHD2gdMjWH59c+YHYGV73Erg1xjJd+iSiyjF5g=;
        b=O7oP1LvbIuN1eJvkVov7DwNfFJH5Ieuvhg7JhPf9MDf/HLmkbdhI0gzt2PPMQeMxvX
         ebSqPlyU4TAs6T1AUE85MYuQTvW3qVAv9NdGFCsC/1X1Gie5aUIUR8fcCVj+L0+E0K4A
         vvhLo5PFzejNnaxOVvDYnDu51pcwq9Jakw5wN2lLIOvuZg3vHV2E5bM8iT/tKNcthqDl
         bsUNXKbVU4wFe3YQc45Lb3C4aBdUGcHeJF7m/01f27y4utt/N4OvPtWww5tEL+wS4zzR
         qpdc72KAPki3rJncSFGmVLvTZ+MwQ8FbITkr/xz2lulAG1cCnVGA6dm2/nJfiLW1+bpc
         mdGw==
X-Forwarded-Encrypted: i=1; AJvYcCWL58RQsIPzJROAfs4NAW3on72fqvJb/hu695H7rsfH2K6K+y02zLWwJuQS9zPgdG7aCz2+/AQBl7TBUQs=@vger.kernel.org, AJvYcCX4NBv5EcB4uF9deeQqzk0PP5wPVnp/FkyHn+r+ZYqiPesynDGrDKhFHjwJhIkhlKvtzCjoJVq0Kn0XG9LL6RY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxWisXLcPyY01K+rJcDMO3zF5/Uc6NGlHBrmrrrECajGuSO3fxe
	tpFFu32iVIdcsmJEpMKFGDa7F4w0uoqrsrkgvjlEil7kAt3ysxxn
X-Gm-Gg: ASbGncuQAlgLmm8v0tZJYOd36LcGsi2RJ5tdzSyhqR2ar+V5cBEg1eQ1b2V4QXY0K7b
	ltZX2qCD3qkRmY1SgpKTS22oe8UQmFf0ZNV5HnljmIICfg5QpVIfWbJfaSAWBOgoPB8yk7VtVO4
	g5hT4vYFvF1fBMGwsvzypwce2Pqm8/2EG6SWuEAf76LMieAmkdKQ9xFSXmrTfaEkPHKbguO3ZV/
	LW7Qh3iYHNDDR5N3fr1qiQ34GyAHiJnVGWcgvHvsOoem+mpap92lPgyMab0wM858PONd/x7Pted
	e4XGeBNoNrJ3Ft8ztasuxx0r+3QM7HhJx0Nyr0PqiFwHp1N9ozPHwx9zXLurv08DJTpBACgS92X
	YhW/od2umfY0dHWc9Ff1jyCwpWpRRHsg=
X-Google-Smtp-Source: AGHT+IHmqmyhFPsYZOGGgZ+qmzjAMvLVm3KY6FwdbAELaUAP0rH9KHOuC2xx39O3u7L8PVLff4IqrQ==
X-Received: by 2002:a05:6214:252f:b0:6d8:9d81:2107 with SMTP id 6a1803df08f44-6f528c7968cmr149742266d6.20.1746507529777;
        Mon, 05 May 2025 21:58:49 -0700 (PDT)
Received: from fauth-a2-smtp.messagingengine.com (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f50f44f4c5sm64768586d6.93.2025.05.05.21.58.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 May 2025 21:58:49 -0700 (PDT)
Received: from phl-compute-01.internal (phl-compute-01.phl.internal [10.202.2.41])
	by mailfauth.phl.internal (Postfix) with ESMTP id 6BB431200043;
	Tue,  6 May 2025 00:58:48 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-01.internal (MEProxy); Tue, 06 May 2025 00:58:48 -0400
X-ME-Sender: <xms:CJcZaHwD2LPWqQQMMaxwUGgQM4qy9vfaZIua6xIjzdZNCZavxGFJKw>
    <xme:CJcZaPT_YKxWUqV8zzS84VISVmvKUdKqC-EP6ecOhy1jazm-tAAk6MS97WggfZOjm
    Samv2Z7kasZp5-raw>
X-ME-Received: <xmr:CJcZaBWLkg9WDAM5IH3nP5LiuIlCBEp90JYRDeFyhL41zG_KnG8IBuGn>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvkeeftdekucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhephffvvefufffkofgggfestdekredtredttden
    ucfhrhhomhepuehoqhhunhcuhfgvnhhguceosghoqhhunhdrfhgvnhhgsehgmhgrihhlrd
    gtohhmqeenucggtffrrghtthgvrhhnpeeggeeukeeghfevudektdevjeehhfekffevueef
    udeivdelteeltdekheejgfeiveenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuve
    hluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepsghoqhhunhdo
    mhgvshhmthhprghuthhhphgvrhhsohhnrghlihhthidqieelvdeghedtieegqddujeejke
    ehheehvddqsghoqhhunhdrfhgvnhhgpeepghhmrghilhdrtghomhesfhhigihmvgdrnhgr
    mhgvpdhnsggprhgtphhtthhopeefhedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoh
    epmhhinhhgoheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepphgvthgvrhiisehinhhf
    rhgruggvrggurdhorhhgpdhrtghpthhtohepmhhinhhgohesrhgvughhrghtrdgtohhmpd
    hrtghpthhtohepjhhurhhirdhlvghllhhisehrvgguhhgrthdrtghomhdprhgtphhtthho
    pehvihhntggvnhhtrdhguhhithhtohhtsehlihhnrghrohdrohhrghdprhgtphhtthhope
    guihgvthhmrghrrdgvghhgvghmrghnnhesrghrmhdrtghomhdprhgtphhtthhopehrohhs
    thgvughtsehgohhoughmihhsrdhorhhgpdhrtghpthhtohepsghsvghgrghllhesghhooh
    hglhgvrdgtohhmpdhrtghpthhtohepmhhgohhrmhgrnhesshhushgvrdguvg
X-ME-Proxy: <xmx:CJcZaBiCmfy30MmopBUmb_RLYPzUzMMYeBsbVhtciL5JCPIPH0x1rw>
    <xmx:CJcZaJC4oXJgoooMMB-BpAnBzo2hyyqP9GQi2vF8cQznLjNjf9V7mA>
    <xmx:CJcZaKKRU6AXGFM6LIdlteYgXdw0ssY_VsDFN8S926lwegxSk4zuYQ>
    <xmx:CJcZaIAfYogi2PNCNYMZhd14u-NfH3TgEH82Ik9h4JkGhmOrkHVEMg>
    <xmx:CJcZaFw2xUwRAZjywJH6D-xaLER3YXIVSkDdSljhimLoYjqdWAdX7lJt>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 6 May 2025 00:58:47 -0400 (EDT)
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
	rust-for-linux@vger.kernel.org,	llvm@lists.linux.dev
Subject: [GIT PULL] [PATCH 0/5] rust: Task & schedule related changes for v6.16
Date: Mon,  5 May 2025 21:58:38 -0700
Message-Id: <20250506045843.51258-1-boqun.feng@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Ingo & Peter,

Here are the Rust changes related to task and schedule, I figure the
best route would be via tip/sched/core hence I send this pull request.
Let me know if you want to do this differently.

Same as lockdep changes, I send this pull request in the format of
patchset, but here are also the tag and pull-request message.

Regards,
Boqun

The following changes since commit c70fc32f44431bb30f9025ce753ba8be25acbba3:

  sched/fair: Adhere to place_entity() constraints (2025-04-16 21:09:12 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/boqun/linux.git tags/rust-sched.2025.05.05

for you to fetch changes up to d131cde69445b8a9a01ef1cbeed7232e171d4bd0:

  rust: task: Add Rust version of might_sleep() (2025-05-04 20:12:12 -0700)

----------------------------------------------------------------
Rust task & schedule changes for v6.16:

- Make Task, CondVar and PollCondVar methods inline to avoid unnecessary
  function calls

- Add might_sleep() support for Rust code: Rust's "#[track_caller]"
  mechanism is used so that Rust's might_sleep() doesn't need to be
  defined as a macro.

----------------------------------------------------------------
FUJITA Tomonori (2):
  sched/core: Add __might_sleep_precision()
  rust: task: Add Rust version of might_sleep()

Kunwu Chan (2):
  rust: sync: Mark CondVar::notify_*() inline
  rust: sync: Mark PollCondVar::drop() inline

Panagiotis Foliadis (1):
  rust: task: Mark Task methods inline

 include/linux/kernel.h      |  2 ++
 kernel/sched/core.c         | 62 ++++++++++++++++++++++++-------------
 rust/helpers/task.c         |  6 ++++
 rust/kernel/sync/condvar.rs |  3 ++
 rust/kernel/sync/poll.rs    |  1 +
 rust/kernel/task.rs         | 38 +++++++++++++++++++++++
 6 files changed, 91 insertions(+), 21 deletions(-)

-- 
2.39.5 (Apple Git-154)

