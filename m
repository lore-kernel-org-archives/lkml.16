Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E540179A3
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 00:28:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745540908; cv=none; b=EmC4Lhxk2MRxxy5Ql88cur/H7X3De9km/3G1bmoXOWUn/Fgfdbu8UQskLfJbbDccV0xgz+kISYlPLJQr50X2IRRoRTijS50i2PbYA1LRmgcyf+zoP/0vntTrUZYCjM40xSHiT//5FisWsHE6/qjH8ZLaZeD2wV17JlC5bjK3+DQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745540908; c=relaxed/simple;
	bh=hxvXe8hV2Tp8KyT+bQWlj0uqDr5+dp1bWnKtAGKy8eU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=DI+M8LSJX+k62kWgcok59t4fvnvwlUICNyqKQmcjJQKNTRmc7C9F9Fvjg+I4vcmBSyVDfSK7FPrpNer1ljEci3HdnbSrA1+aCXghJ0A0UynOlkK433cXANhpc8byIkaxD/ASXdvrlurz/ubdUhWaRaWmygMHQZWwgkpFzk2Z0kU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ejafpIfp; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ejafpIfp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F18B2C4CEE8;
	Fri, 25 Apr 2025 00:28:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745540908;
	bh=hxvXe8hV2Tp8KyT+bQWlj0uqDr5+dp1bWnKtAGKy8eU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ejafpIfpPt8ORciKFhCWWG0FNRDdFICNuTrrFHn3Egwha8baV1Y4NzLoW5cH4oBRn
	 hgVM835jgpGMCg11yM0fcxJtaqAaO1+QykiIlaAVdQydIzjd33HBjWWeatnCmpZy8/
	 +clyKWEoRhh3I4m/8QWioobSfiud9GT7Frl9XIg2ZrCG/TpgCjNOm8g283IowJKFRh
	 3vDcDsim0AgiQyiRDBWiJYsvo9U21v59sgK3x5VFernoqOsESSFoebOiAduSbOcfQ2
	 dyhtPiu+PuIM2Hgof7wwsxXdAimU2iAVdE3BXANIRNmOatNPy88h38X9GDLKbgPnZN
	 ndZKvhpsBeBaA==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 47281CE1DBC; Thu, 24 Apr 2025 17:28:27 -0700 (PDT)
From: "Paul E. McKenney" <paulmck@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: kernel-team@meta.com,
	Andrew Morton <akpm@linux-foundation.org>,
	Kuniyuki Iwashima <kuniyu@amazon.com>,
	Mateusz Guzik <mjguzik@gmail.com>,
	Petr Mladek <pmladek@suse.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	John Ogness <john.ogness@linutronix.de>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Jon Pan-Doh <pandoh@google.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Karolina Stolarek <karolina.stolarek@oracle.com>,
	"Paul E. McKenney" <paulmck@kernel.org>
Subject: [PATCH v3 14/20] ratelimit: Avoid atomic decrement under lock if already rate-limited
Date: Thu, 24 Apr 2025 17:28:20 -0700
Message-Id: <20250425002826.3431914-14-paulmck@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <72ee57b8-9e2a-4cad-aaa0-1e3353d146d8@paulmck-laptop>
References: <72ee57b8-9e2a-4cad-aaa0-1e3353d146d8@paulmck-laptop>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently, if the lock is acquired, the code unconditionally does
an atomic decrement on ->rs_n_left, even if that atomic operation is
guaranteed to return a limit-rate verdict.  A limit-rate verdict will
in fact be the common case when something is spewing into a rate limit.
This unconditional atomic operation incurs needless overhead and also
raises the spectre of counter wrap.

Therefore, do the atomic decrement only if there is some chance that
rates won't be limited.

Link: https://lore.kernel.org/all/fbe93a52-365e-47fe-93a4-44a44547d601@paulmck-laptop/
Link: https://lore.kernel.org/all/20250423115409.3425-1-spasswolf@web.de/
Signed-off-by: Paul E. McKenney <paulmck@kernel.org>
Reviewed-by: Petr Mladek <pmladek@suse.com>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Kuniyuki Iwashima <kuniyu@amazon.com>
Cc: Mateusz Guzik <mjguzik@gmail.com>
Cc: Steven Rostedt <rostedt@goodmis.org>
Cc: John Ogness <john.ogness@linutronix.de>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>
---
 lib/ratelimit.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/lib/ratelimit.c b/lib/ratelimit.c
index 747a5a7787705..4f5d8fb6919f7 100644
--- a/lib/ratelimit.c
+++ b/lib/ratelimit.c
@@ -103,13 +103,16 @@ int ___ratelimit(struct ratelimit_state *rs, const char *func)
 		}
 	}
 	if (burst) {
-		int n_left;
+		int n_left = atomic_read(&rs->rs_n_left);
 
 		/* The burst might have been taken by a parallel call. */
-		n_left = atomic_dec_return(&rs->rs_n_left);
-		if (n_left >= 0) {
-			ret = 1;
-			goto unlock_ret;
+
+		if (n_left > 0) {
+			n_left = atomic_dec_return(&rs->rs_n_left);
+			if (n_left >= 0) {
+				ret = 1;
+				goto unlock_ret;
+			}
 		}
 	}
 
-- 
2.40.1

