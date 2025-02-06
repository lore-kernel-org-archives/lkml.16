Received: from 009.lax.mailroute.net (009.lax.mailroute.net [199.89.1.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4431119C553
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 17:52:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=199.89.1.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738864381; cv=none; b=PdCjGEtwAMbGhs4PxPn1e/0dvv9fvr8kcDSY2vI/Qpn6zacZ2VcVGzNHzdR/EN/EXbCQB3/QmOpi/dxivV+LKEbneyBmt/VBs9682QhnLseLoi8Jk80Jm2bgEMmEhZn4L06l1vbcedWh5Qez+oARwBtZlMixKE6ch3lgkdwTWfk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738864381; c=relaxed/simple;
	bh=VTS1Xqm6xOD646+JjW+PwAhdk794DP9lC6s0EyNlT3E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OgyZCBULeQmioF+z4iyyDBQrLDAyFdxQ3R/f+rtfd17BltPAhk6vT5fBgwSSmxl+WExlujOUyhDopuI2NHPyeiW3hCTL2EaBNBOHvlOFO8kONXixNvZVEGleVvsHSq6kyEVlnU/uwfG3IzOan58g/i9YTTML4TKrVy/CD7+YPvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org; spf=pass smtp.mailfrom=acm.org; dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b=JFKACATQ; arc=none smtp.client-ip=199.89.1.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=acm.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b="JFKACATQ"
Received: from localhost (localhost [127.0.0.1])
	by 009.lax.mailroute.net (Postfix) with ESMTP id 4Ypl7b5XbNzlgTxg;
	Thu,  6 Feb 2025 17:52:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:mime-version:references:in-reply-to
	:x-mailer:message-id:date:date:subject:subject:from:from
	:received:received; s=mr01; t=1738864374; x=1741456375; bh=d6n+k
	LpRjFHnf0pZY+IpQVKiY3FWXhXDHuKsIqw3PBQ=; b=JFKACATQfmZMQsc6DfZhJ
	U6A/Btrjj+X318E8zzYpjRZJVHSHPsMAz+jJE7fh4CIHl183o9xRjuXpyByrp9QM
	VHJFpQF4H4SNvZPqyJXgQxUdPmYtgMlq6/Pd6ea8hW/qecAurUksbb5agcX8yquR
	Qf0VEw4k9YIAtcqZfF5jHCZIWUc+2PbbjNOu6cQr9LCDgW8Ahisw7+pY3WUowj9y
	HY8Kg5nne4p+L0T1EqmgdUG4tz87FpMfnXLR152Qe9Jch+6i0C66pl2udTD/VJvZ
	PF5T4uPG8rs6emqU+2AbTD7qy3JorZ7Qgvxt1Ng4NzsPOcjuxQx809SWN5GB0t7o
	A==
X-Virus-Scanned: by MailRoute
Received: from 009.lax.mailroute.net ([127.0.0.1])
 by localhost (009.lax [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id 6zEzgGXtcD3a; Thu,  6 Feb 2025 17:52:54 +0000 (UTC)
Received: from bvanassche.mtv.corp.google.com (unknown [104.135.204.82])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 009.lax.mailroute.net (Postfix) with ESMTPSA id 4Ypl7R397fzlgTy5;
	Thu,  6 Feb 2025 17:52:51 +0000 (UTC)
From: Bart Van Assche <bvanassche@acm.org>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Will Deacon <will@kernel.org>,
	Christoph Hellwig <hch@lst.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Marco Elver <elver@google.com>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Kees Cook <kees@kernel.org>,
	Jann Horn <jannh@google.com>,
	linux-kernel@vger.kernel.org,
	Bart Van Assche <bvanassche@acm.org>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>
Subject: [PATCH RFC 33/33] kbuild: clang: Unconditionally enable thread-safety checking
Date: Thu,  6 Feb 2025 09:51:14 -0800
Message-ID: <20250206175114.1974171-34-bvanassche@acm.org>
X-Mailer: git-send-email 2.48.1.502.g6dc24dfdaf-goog
In-Reply-To: <20250206175114.1974171-1-bvanassche@acm.org>
References: <20250206175114.1974171-1-bvanassche@acm.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Enable thread-safety checks for arm64 and x86. Do not enable it for other
architectures yet - this will be done later. Disable thread-safety checki=
ng
for staging drivers. Fixing thread-safety bugs in staging drivers will ha=
ve
to be done when these drivers come out of staging.

Cc: Nathan Chancellor <nathan@kernel.org>
Cc: Nick Desaulniers <ndesaulniers@google.com>
Cc: Bill Wendling <morbo@google.com>
Cc: Justin Stitt <justinstitt@google.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Bart Van Assche <bvanassche@acm.org>
---
 drivers/staging/Makefile | 2 ++
 scripts/Makefile.clang   | 3 +++
 2 files changed, 5 insertions(+)

diff --git a/drivers/staging/Makefile b/drivers/staging/Makefile
index e681e403509c..4eafda5b95eb 100644
--- a/drivers/staging/Makefile
+++ b/drivers/staging/Makefile
@@ -1,6 +1,8 @@
 # SPDX-License-Identifier: GPL-2.0
 # Makefile for staging directory
=20
+KBUILD_CFLAGS +=3D -Wno-thread-safety
+
 obj-y				+=3D media/
 obj-$(CONFIG_RTL8723BS)		+=3D rtl8723bs/
 obj-$(CONFIG_OCTEON_ETHERNET)	+=3D octeon/
diff --git a/scripts/Makefile.clang b/scripts/Makefile.clang
index 2435efae67f5..d27688bddd95 100644
--- a/scripts/Makefile.clang
+++ b/scripts/Makefile.clang
@@ -36,5 +36,8 @@ CLANG_FLAGS	+=3D -Werror=3Dunknown-warning-option
 CLANG_FLAGS	+=3D -Werror=3Dignored-optimization-argument
 CLANG_FLAGS	+=3D -Werror=3Doption-ignored
 CLANG_FLAGS	+=3D -Werror=3Dunused-command-line-argument
+
+CLANG_FLAGS	+=3D -Wthread-safety
+
 KBUILD_CPPFLAGS	+=3D $(CLANG_FLAGS)
 export CLANG_FLAGS
