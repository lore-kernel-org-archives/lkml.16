Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80B20261570
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 12:24:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744201443; cv=none; b=U/N6+rCLgOoBHTlhqEAqVhNMJkfFC+68nhSRdUpMSgm5U6JHIuzI4lRMGLr279aycju2sKHrlmTFYIwZMgBaL3Rc796t1SzrpwlCUcVXNJPe84bc+hCYrqbeS0TX7x60+fNTZOsQ+bKB48129OXGAKl5SaMyJNNBEOYUXjiLjW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744201443; c=relaxed/simple;
	bh=r5ivBWUsN0gdojc6IpXFmCdWOGZvmm0uKwfWW7f99Us=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=S0Q4ON26/DIOjyIoHvVn588irqsohkr8DfJ64m4aizzQ97e39rtBqoKwNPi4D22dn6AvxdSv9DcH0xWSdbe6sz1wYIfn5nUUN+I31TJUNfHDaOG4ga/xAZGPw8+/G2IsNdIpBs7Oo1NMlUCm/ttO8/Y7gKn3SnQnAMez0n3MgDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pd9rAyyt; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pd9rAyyt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9893BC4CEE3;
	Wed,  9 Apr 2025 12:24:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744201443;
	bh=r5ivBWUsN0gdojc6IpXFmCdWOGZvmm0uKwfWW7f99Us=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=pd9rAyytbMRRp8MrwzPNNE5Ehvutv2HUHE+10XzEZFQRC4465fGKB+/m5s7tFrUB1
	 3Vz7rktHi3aXFFPKeDVA9JhkeFhDl0M+z2MIMms63BlBt8LqHYYUPe7pwsMEYdT5DR
	 jwK69bVylH5W4JFe0sz8+4A25z/w1MAR29PKpN+WS+hzHNBft0UxqM0pNlwBA7vvTX
	 bZ/5+4UXEKPxaISvDuzOVMQ6aSeaVQnQCWicq29jHYxqU1NRqCzeceuvDmMnutFjnJ
	 pYPSKAbHCTLoy54S07wMcImi41VTgnlaa7jWDlh7+KZ87J+dayOpKrGjAi8tmkNnJn
	 lZ0Op5zp8D0dQ==
From: Arnd Bergmann <arnd@kernel.org>
To: Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Will Deacon <will@kernel.org>,
	Boqun Feng <boqun.feng@gmail.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Waiman Long <longman@redhat.com>,
	Carlos Llamas <cmllamas@google.com>,
	Ying Huang <huang.ying.caritas@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 06/10] [RESEND] lockdep: change 'static const' variables to enum values
Date: Wed,  9 Apr 2025 14:22:58 +0200
Message-Id: <20250409122314.2848028-6-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250409122314.2848028-1-arnd@kernel.org>
References: <20250409122131.2766719-1-arnd@kernel.org>
 <20250409122314.2848028-1-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

gcc warns about 'static const' variables even in headers when building
with -Wunused-const-variables enabled:

In file included from kernel/locking/lockdep_proc.c:25:
kernel/locking/lockdep_internals.h:69:28: error: 'LOCKF_USED_IN_IRQ_READ' defined but not used [-Werror=unused-const-variable=]
   69 | static const unsigned long LOCKF_USED_IN_IRQ_READ =
      |                            ^~~~~~~~~~~~~~~~~~~~~~
kernel/locking/lockdep_internals.h:63:28: error: 'LOCKF_ENABLED_IRQ_READ' defined but not used [-Werror=unused-const-variable=]
   63 | static const unsigned long LOCKF_ENABLED_IRQ_READ =
      |                            ^~~~~~~~~~~~~~~~~~~~~~
kernel/locking/lockdep_internals.h:57:28: error: 'LOCKF_USED_IN_IRQ' defined but not used [-Werror=unused-const-variable=]
   57 | static const unsigned long LOCKF_USED_IN_IRQ =
      |                            ^~~~~~~~~~~~~~~~~
kernel/locking/lockdep_internals.h:51:28: error: 'LOCKF_ENABLED_IRQ' defined but not used [-Werror=unused-const-variable=]
   51 | static const unsigned long LOCKF_ENABLED_IRQ =
      |                            ^~~~~~~~~~~~~~~~~

This one is easy to avoid by changing the generated constant definition
into an equivalent enum.

Tested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 kernel/locking/lockdep_internals.h | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/kernel/locking/lockdep_internals.h b/kernel/locking/lockdep_internals.h
index 20f9ef58d3d0..8b4cd6540e49 100644
--- a/kernel/locking/lockdep_internals.h
+++ b/kernel/locking/lockdep_internals.h
@@ -47,29 +47,31 @@ enum {
 	__LOCKF(USED_READ)
 };
 
+enum {
 #define LOCKDEP_STATE(__STATE)	LOCKF_ENABLED_##__STATE |
-static const unsigned long LOCKF_ENABLED_IRQ =
+	LOCKF_ENABLED_IRQ =
 #include "lockdep_states.h"
-	0;
+	0,
 #undef LOCKDEP_STATE
 
 #define LOCKDEP_STATE(__STATE)	LOCKF_USED_IN_##__STATE |
-static const unsigned long LOCKF_USED_IN_IRQ =
+	LOCKF_USED_IN_IRQ =
 #include "lockdep_states.h"
-	0;
+	0,
 #undef LOCKDEP_STATE
 
 #define LOCKDEP_STATE(__STATE)	LOCKF_ENABLED_##__STATE##_READ |
-static const unsigned long LOCKF_ENABLED_IRQ_READ =
+	LOCKF_ENABLED_IRQ_READ =
 #include "lockdep_states.h"
-	0;
+	0,
 #undef LOCKDEP_STATE
 
 #define LOCKDEP_STATE(__STATE)	LOCKF_USED_IN_##__STATE##_READ |
-static const unsigned long LOCKF_USED_IN_IRQ_READ =
+	LOCKF_USED_IN_IRQ_READ =
 #include "lockdep_states.h"
-	0;
+	0,
 #undef LOCKDEP_STATE
+};
 
 #define LOCKF_ENABLED_IRQ_ALL (LOCKF_ENABLED_IRQ | LOCKF_ENABLED_IRQ_READ)
 #define LOCKF_USED_IN_IRQ_ALL (LOCKF_USED_IN_IRQ | LOCKF_USED_IN_IRQ_READ)
-- 
2.39.5

