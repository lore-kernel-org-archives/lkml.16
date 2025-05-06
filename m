Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61C6C290D90
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 04:20:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746505258; cv=none; b=A2c7fgnI56u4zBX3XiwAw8nqa8aYdiOEFIb04Oc0SPYzE1wtJmyjaQOv9izJWW0KvnY3SQovY7/bhJaAljtJNDSJe4ZcxeGjMlEbvMR09oii7xALs1/8NVtC9Sg+q6OOgTspGzISbsyDAbTyBLe33aVnASgfXm1gAVFp7k8sMCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746505258; c=relaxed/simple;
	bh=pVQZNl61BvTNMC1esM6gOKyNfzv4TGbo0558he8/HRg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=kdB7T1UCtU1SUdyEFj7FOXORPDNW2r9gGBAvaTfxsCSQtAx+WoL3iLnpySjwtdVGVjXFwVyenD1Vp752cSb5Ig4eCrm89fCpxXz7/tIMOIqNVCFIPZphsk8DqWy4yKN1HpfLzQtuRLp/TRHkAS9er4O5rDR0UG4fYDbzXPJ/f3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RjJaFdt7; arc=none smtp.client-ip=209.85.222.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RjJaFdt7"
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-7c542ffec37so631937485a.2
        for <linux-kernel@vger.kernel.org>; Mon, 05 May 2025 21:20:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746505255; x=1747110055; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:feedback-id:from:to:cc:subject:date:message-id:reply-to;
        bh=2vwoI4ctvg3OUvLdvQxgV4/ndZjYjci/lNS6bduvXMU=;
        b=RjJaFdt7I/PcWDTtcVrk37nfg1Yn+eUF/RY1V8dgf/oSrc0lKmUF//89u0I4FP0T5a
         EBMRAJfTjXrHaWGaxWkN1KTIQcZAZlFR+NO4LzXWdPRz2vXngtah2wwo7Hkzxdq+Fe6T
         LtJMyCqk1CfmG01/bDTr02bEiKcH7qRtVQi7QbHEOOixgTjYOv5OCgwmr0paj4ne80ee
         eDy8Pk9vmmCEWpv26lCCDRSvDYxfHzs/HkyevseK6oc69MS4RkSJ0eGrvXvFcyAxSJSK
         9HoQ/8m1n+U+F+1NJt5Kbz29qU8EzHjAtgousA52IjlcQiLpA4nGrhjFF+qvUgKEhAbl
         ZmTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746505255; x=1747110055;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:feedback-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2vwoI4ctvg3OUvLdvQxgV4/ndZjYjci/lNS6bduvXMU=;
        b=Q4eRAQXayfSKzIgq1fLZaEBuzX7uEU6NR9nsI0JSKg0DRH+5RBMZKJGD+dVDMkPnWm
         JPGBv7uFury9WdFONrxmVkkp8EthLuC9eYkamfSNwIvupQ7P0+lDYgAvjd6GpxLHk7iC
         kalY7FjoAkPSVXoOApEQnz0YhO6AdfYQIUWzP13mfWFIUG1Whf4JS+aCMs1Lutnp7nYO
         qPSiiJzS4iBGxjLdxQWlFR8HDuzazbL2lOWgi/wO+RDS98QQdAXYE33CZr/pCh6qjhIx
         HgCuKwjSRdQ7hXxN4liMZGmRgpmpa9GY/TjClVs9eA2DEA2ATQvRJ81H1xmPuu/OY1q5
         qaaQ==
X-Forwarded-Encrypted: i=1; AJvYcCVI1TMFUx/79rqIRx0sESpTLXXBJatMhYCx/eyhr3576toY88m6b6oDs2QQkVLcCDGdydfWL3yR7wQEqgA=@vger.kernel.org
X-Gm-Message-State: AOJu0YyG8dOPQgV73GWJ2HDWpr00wqVm4S+XC56FxxuNPdPo72a/YmBM
	f3Un/exDwKTXxCfjRmhjBPrEcx5iRRPKJjueLXhqR1ArAp4sIypv
X-Gm-Gg: ASbGncv/GjPGFN1MXNz75hGfXEwk4Xc6ciT8/XBG8iz/ffcLe1w+VPY+kCCYFr9E6rE
	bQaDEWlWzRmnqY6p+E6sUmiHguuu2PhSFbp509mfYF88G/HtTILvHM1KT3fSEaUIAmB0WjevKbg
	/i3vtcxXV/qQgdHL6jg9C2ZfCL6nKM+xuzLp1OH0kw8KPHXkn+mqgEqYFHXQePkfdeBhgXJxB8x
	/grduG9KQHhf5f70zE3AMhXmjNR04Ya8CJP7MHmbnLAtxhvxmUEtXXXYVeo/+pOOiBkWi/Tj2uU
	hX5m8XREelzeuTRxv7baxJMMgUR3kNIhrAvBFyCizCQnL8jz6Lq53JKzQ9+nuQFJ5lNSwTcOMWN
	qDj4jXo0peN32oiLCLnCMxKmDT9BWy+0tA3TUIKgOug==
X-Google-Smtp-Source: AGHT+IGwl87cjwXD/cO79soYsrh6cmHduAmn7pJJ5ISqhoSUJea19smragW3V2V7XhCUgTzGmZcZeQ==
X-Received: by 2002:a05:620a:25d2:b0:7c7:9349:e468 with SMTP id af79cd13be357-7caf110ca55mr187986485a.12.1746505255050;
        Mon, 05 May 2025 21:20:55 -0700 (PDT)
Received: from fauth-a2-smtp.messagingengine.com (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7cad242b587sm658820885a.77.2025.05.05.21.20.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 May 2025 21:20:54 -0700 (PDT)
Received: from phl-compute-11.internal (phl-compute-11.phl.internal [10.202.2.51])
	by mailfauth.phl.internal (Postfix) with ESMTP id 118361200068;
	Tue,  6 May 2025 00:20:54 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-11.internal (MEProxy); Tue, 06 May 2025 00:20:54 -0400
X-ME-Sender: <xms:JY4ZaOEwSHx5BzvoujiuLvZIzlAaqKAsSVAlbHAMSIdoLuSRwh7TTw>
    <xme:JY4ZaPURCTxeM3nKhYV-JlEIgxly0z0PI9QIc7VXz_iC8C8pvJMhKu2PjJywXw5K8
    d0CpsF3fGqIgSSb3w>
X-ME-Received: <xmr:JY4ZaIIbO7HEM7u4QS25CSrBGkjcd4AjVpFWiNPAsKaE7yDw4dEoeg2y>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvkeeftddtucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhephffvvefufffkofgggfestdekredtredttden
    ucfhrhhomhepuehoqhhunhcuhfgvnhhguceosghoqhhunhdrfhgvnhhgsehgmhgrihhlrd
    gtohhmqeenucggtffrrghtthgvrhhnpefgteffhfehjeegtdduieffudetfeehgfegudej
    udfhieefgfeigfevueduleduffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmh
    epmhgrihhlfhhrohhmpegsohhquhhnodhmvghsmhhtphgruhhthhhpvghrshhonhgrlhhi
    thihqdeiledvgeehtdeigedqudejjeekheehhedvqdgsohhquhhnrdhfvghngheppehgmh
    grihhlrdgtohhmsehfihigmhgvrdhnrghmvgdpnhgspghrtghpthhtohepuddvpdhmohgu
    vgepshhmthhpohhuthdprhgtphhtthhopehmihhnghhosehkvghrnhgvlhdrohhrghdprh
    gtphhtthhopehpvghtvghriiesihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehm
    ihhnghhosehrvgguhhgrthdrtghomhdprhgtphhtthhopeifihhllheskhgvrhhnvghlrd
    horhhgpdhrtghpthhtohepsghoqhhunhdrfhgvnhhgsehgmhgrihhlrdgtohhmpdhrtghp
    thhtoheplhhonhhgmhgrnhesrhgvughhrghtrdgtohhmpdhrtghpthhtohepnhgrthhhrg
    hnsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehnihgtkhdruggvshgruhhlnhhivghr
    shdolhhkmhhlsehgmhgrihhlrdgtohhmpdhrtghpthhtohepmhhorhgsohesghhoohhglh
    gvrdgtohhm
X-ME-Proxy: <xmx:JY4ZaIHunO3AWp01r831dn7NLQVL2JQ743CjUNKljkIz3ZyIeUym1Q>
    <xmx:JY4ZaEU3SSNY04NUqooPMUWj6HRy6AChETyoXldGl7jFr4QuaIlXXA>
    <xmx:JY4ZaLMiVxgdRGlXkXKIzt3MCg2_02Y5jlVS82XAuhsGFqMYrruHYA>
    <xmx:JY4ZaL0p6E89xHG_ZshofMEL1-vKjtyhfXI4qp8xmHC8eEFDdM4jbQ>
    <xmx:Jo4ZaFVgRgQqthH0Byfbph5VmnpB2oEtIraNAEhdqFaTjlrHopDlwO6_>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 6 May 2025 00:20:53 -0400 (EDT)
From: Boqun Feng <boqun.feng@gmail.com>
To: Ingo Molnar <mingo@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>
Cc: Ingo Molnar <mingo@redhat.com>,
	Will Deacon <will@kernel.org>,
	Boqun Feng <boqun.feng@gmail.com>,
	Waiman Long <longman@redhat.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [GIT PULL] [PATCH 0/3] LOCKDEP changes for v6.16
Date: Mon,  5 May 2025 21:20:46 -0700
Message-Id: <20250506042049.50060-1-boqun.feng@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Ingo & Peter,

Please pull the lockdep changes for v6.16 into tip. I'm sending the
changes in patchset, but I also created a tag and the pull-request
message in case you want to directly pull. Thanks!

Regards,
Boqun

The following changes since commit 35e6b537af85d97e0aafd8f2829dfa884a22df20:

  lockdep: Remove disable_irq_lockdep() (2025-03-14 21:13:20 +0100)

are available in the Git repository at:

  git@gitolite.kernel.org:pub/scm/linux/kernel/git/boqun/linux tags/lockdep-for-tip.2025.05.05

for you to fetch changes up to b3eec4e26ada8a71c40147b45026d2345f3b6ae3:

  locking/lockdep: Add # of dynamic keys stat to /proc/lockdep_stats (2025-05-04 11:03:02 -0700)

----------------------------------------------------------------
Lockdep changes for v6.16:

- Move hlock_equal() only under CONFIG_LOCKDEP_SMALL=y
- Prevent abuse of lockdep subclass in __lock_acquire()
- Add # of dynamic keys stat to /proc/lockdep_stats

----------------------------------------------------------------
Andy Shevchenko (1):
      lockdep: Move hlock_equal() to the respective ifdeffery

Waiman Long (2):
      locking/lockdep: Prevent abuse of lockdep subclass
      locking/lockdep: Add # of dynamic keys stat to /proc/lockdep_stats

 kernel/locking/lockdep.c           | 76 ++++++++++++++++++++------------------
 kernel/locking/lockdep_internals.h |  1 +
 kernel/locking/lockdep_proc.c      |  2 +
 3 files changed, 44 insertions(+), 35 deletions(-)

-- 
2.39.5 (Apple Git-154)

