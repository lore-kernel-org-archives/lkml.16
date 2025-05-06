Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6AFC28DF1D
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 04:20:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746505260; cv=none; b=fSyJFCkZr+kKJ+DOLscAcVAOsxVeX6KmOG1KdCsO852q1dObZRVVqRGTwOIorJH3P1v3WiyWkW01Qx5OpRHhqpriZKrON3v3G7wkojBj80Tn8hJFUjWff7RyQlxWAi+eecAhb0OZZphq/8UlH7xpTGUHOmwnRmv+DBRlw7mTFN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746505260; c=relaxed/simple;
	bh=OjFV6Qsb59I3KbtspfCnavQfUzQh5zYuzRLDx6Z+jRs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=OBxX1MGRFrbpNHKrKxbpPm8YdMUFWJJr1gskm5afUCdA0CvLKFaSKCOYxm5zOy6hT/4LzRxkbE7j74qFKjmPUrbC4Gn6E93q7zkP9nPt2BlPYfUlMUgYv3UKIYQuWPu7dp2g/3KKBfKt9IAj1PcGiykIHftSmJwNFiYbq3Ihnpw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mEB3yRVm; arc=none smtp.client-ip=209.85.222.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mEB3yRVm"
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-7c560c55bc1so619022085a.1
        for <linux-kernel@vger.kernel.org>; Mon, 05 May 2025 21:20:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746505258; x=1747110058; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:feedback-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=68A1DvCKfbj5qGdcrZsmfpxCEw5jDiTy2OdnPzX3KpQ=;
        b=mEB3yRVmEbedQVyGKglyek4/hUfd4YGK7CraAH2gGytG0TlLzzGy7oSY++tMoUSQsy
         nQPzENFoy1G6TIz9k1SAaE9neCfvuo0CkxPKj0rioAUpgGNfkrH3Jb52TDtc3ZemEZdW
         WF9AisXpEL1iDIvZhhVGhvPe0YJx5mqe+7GSDrMcQfE+AMja1EbQTPhjO5yOP0H1N07C
         jFc+RBFSzH8NPWv1CVOh6/Wdum01C/QFatq/WLW5s6UYLuiqkwck/jOSbTMe4fOk+XFk
         Exsz9Uk3tiJkTyW87CteVZF5eSH7e/+pMbpAuOpuTvvEnOPd7kTnOlllPZa+sV5tKQ71
         Cn6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746505258; x=1747110058;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:feedback-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=68A1DvCKfbj5qGdcrZsmfpxCEw5jDiTy2OdnPzX3KpQ=;
        b=E++yIAmi/c6FgI0TX/OffoXaUD/rS9VHlg9VyEgDpJ51rpXOvBf5SEsONL9VppDmGE
         rEeg5s2cxfOSezU9CMKmw9ZO6+i/1BrYPr0nEZco7qOyMGm79qhaDsarG3qkD/eZvfHM
         TDHFNzHEyN6E77ZXxFQ7sBNcN/t/aiCjLcFyan1mN/KKTrJEILQUdZNbjSjCQQ/bNJ4u
         ilPmsZZahO/BNILMcgrLNucTThj4unwD3d2qC9ZQiFYyz3mU1gUI0xbOG3A0x9Iel4L/
         G+mifepdpVfXE7hqPrBRt+E7MvLiPiFss/DXpHgwh3Sg7/418824lo7xe/LpB3Y0D//u
         Rnfg==
X-Forwarded-Encrypted: i=1; AJvYcCXKxaxwTFocGTLupGPlHdcTeBA/iIqeYVqj2RfSpf5BKFpFb4tC9DSdrbBR81LcmiK32/Gk3ZG9kbiuNe8=@vger.kernel.org
X-Gm-Message-State: AOJu0YycCYIr9bZOMdVdUqjrxf1L4UneZkotHGkS8YYqzLFcBe+8lEy6
	FNvuT57Dut416MQJMPVJTwFVMphKa/1We/h7ouVobhYqnW965mJX
X-Gm-Gg: ASbGncv3puzeaUDluPe4Gv/pTx3Kx5Ri9BnWC9EbLAbTnGyZxg9VabGlpnomNWMsoFb
	HE24X27a/KsyyQOGxPE9Zt5z59Cpb6vMvAzUnIBWDcq2KwctF7CL+LHcslcNy2fmShVD/+p3yPz
	3TMW/RZ+/hwARN99qbO0LaSscKyEWakh2OFLvhk2VKpFDTnSwY9iDfM+kjMPUPyQ+Z+eoRUDF1w
	DoXaxqEIyGTK1kaPf2GCXE1KqpXdbX7FhdhQEQZH2pWscc8hU6oR4Drj14EmIxPxFJxPmMDSuQP
	7uBnFQaKY/iK9HHwbPAPVNfp68uv67hUiTWUT7LM1wZus9HC5tJufyy1YGdZae+yyhg5EWeMJ6J
	AbES3tnWPyXSdje3Byc393uQSvMb0WSc=
X-Google-Smtp-Source: AGHT+IEZcY+uh9qsx9zwF/xV8hNs4hK/n9u73F/y243wNP/KJiyZnv89z4caFf0yK2KpPF7yv+rKJw==
X-Received: by 2002:a05:620a:4726:b0:7c9:5ec2:a82c with SMTP id af79cd13be357-7cad5ba3f6cmr2449586385a.53.1746505257872;
        Mon, 05 May 2025 21:20:57 -0700 (PDT)
Received: from fauth-a2-smtp.messagingengine.com (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7cad2441633sm655256585a.107.2025.05.05.21.20.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 May 2025 21:20:57 -0700 (PDT)
Received: from phl-compute-04.internal (phl-compute-04.phl.internal [10.202.2.44])
	by mailfauth.phl.internal (Postfix) with ESMTP id 053211200068;
	Tue,  6 May 2025 00:20:57 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-04.internal (MEProxy); Tue, 06 May 2025 00:20:57 -0400
X-ME-Sender: <xms:KI4ZaKEtaNkhkdU5gzmoNxyPgW2cAxlgoP5eWqCV54GnCnDiNRUDhg>
    <xme:KI4ZaLUvvCCb3t2A4wNSboOaHURCI_Vwvw_BMZuax6IcyPRuFOEcwwDmpAxn1nS9J
    kN6MECarG-zdndWKQ>
X-ME-Received: <xmr:KI4ZaEJGOesJFWenVwPpb5Ft2rIManwqkQoAI3wvwTIJKtDBterP6jbX>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvkeeftddtucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhephffvvefufffkofgjfhgggfestdekredtredt
    tdenucfhrhhomhepuehoqhhunhcuhfgvnhhguceosghoqhhunhdrfhgvnhhgsehgmhgrih
    hlrdgtohhmqeenucggtffrrghtthgvrhhnpefghfffvefhhfdvgfejgfekvdelgfekgeev
    ueehlefhiedvgeffjefgteeugfehieenucffohhmrghinhepkhgvrhhnvghlrdhorhhgne
    cuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepsghoqhhu
    nhdomhgvshhmthhprghuthhhphgvrhhsohhnrghlihhthidqieelvdeghedtieegqdduje
    ejkeehheehvddqsghoqhhunhdrfhgvnhhgpeepghhmrghilhdrtghomhesfhhigihmvgdr
    nhgrmhgvpdhnsggprhgtphhtthhopeduvddpmhhouggvpehsmhhtphhouhhtpdhrtghpth
    htohepmhhinhhgoheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepphgvthgvrhiisehi
    nhhfrhgruggvrggurdhorhhgpdhrtghpthhtohepmhhinhhgohesrhgvughhrghtrdgtoh
    hmpdhrtghpthhtohepfihilhhlsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegsohhq
    uhhnrdhfvghnghesghhmrghilhdrtghomhdprhgtphhtthhopehlohhnghhmrghnsehrvg
    guhhgrthdrtghomhdprhgtphhtthhopehnrghthhgrnheskhgvrhhnvghlrdhorhhgpdhr
    tghpthhtohepnhhitghkrdguvghsrghulhhnihgvrhhsodhlkhhmlhesghhmrghilhdrtg
    homhdprhgtphhtthhopehmohhrsghosehgohhoghhlvgdrtghomh
X-ME-Proxy: <xmx:KI4ZaEGiPeJ1x0oavr03cifIoFOFknnFPcAUAuxZWNnJ3x60f1IoJg>
    <xmx:KI4ZaAVANOKA5GutUnjMlphwfZ5NToWXzf2oGpoZKOMzsOPDwRSWyA>
    <xmx:KI4ZaHNcRh0I9Z1CB1R2gViFy9exNGoXikMXbWCaX1BSLqg0UMDfgQ>
    <xmx:KI4ZaH1AphQYu__QvEI5yzaunk-Lz5qIWiyMmLAqaLyvZJVRD-ts9Q>
    <xmx:KY4ZaBWQpgq25qhzwUWXrFcma86THOAtKtH-0rsU0F-dE6zVnXElJbuY>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 6 May 2025 00:20:56 -0400 (EDT)
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
Subject: [PATCH 2/3] locking/lockdep: Prevent abuse of lockdep subclass
Date: Mon,  5 May 2025 21:20:48 -0700
Message-Id: <20250506042049.50060-3-boqun.feng@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20250506042049.50060-1-boqun.feng@gmail.com>
References: <20250506042049.50060-1-boqun.feng@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Waiman Long <longman@redhat.com>

To catch the code trying to use a subclass value >=
MAX_LOCKDEP_SUBCLASSES (8), add a DEBUG_LOCKS_WARN_ON() statement to
notify the users that such a large value is not allowed.

[boqun: Reword the commit log with a more objective tone]

Signed-off-by: Waiman Long <longman@redhat.com>
Signed-off-by: Boqun Feng <boqun.feng@gmail.com>
Link: https://lore.kernel.org/r/20250409143751.2010391-1-longman@redhat.com
---
 kernel/locking/lockdep.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/kernel/locking/lockdep.c b/kernel/locking/lockdep.c
index ff2ce90a87bc..58883c8375d1 100644
--- a/kernel/locking/lockdep.c
+++ b/kernel/locking/lockdep.c
@@ -5101,6 +5101,9 @@ static int __lock_acquire(struct lockdep_map *lock, unsigned int subclass,
 		lockevent_inc(lockdep_nocheck);
 	}
 
+	if (DEBUG_LOCKS_WARN_ON(subclass >= MAX_LOCKDEP_SUBCLASSES))
+		return 0;
+
 	if (subclass < NR_LOCKDEP_CACHING_CLASSES)
 		class = lock->class_cache[subclass];
 	/*
-- 
2.39.5 (Apple Git-154)

