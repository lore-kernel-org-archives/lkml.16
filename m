Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FA7B17BA5
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 00:28:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745540908; cv=none; b=sZ6h0e2HVLnXbMPuveQ33I/NV5jtcYhHvVFiFnQ0pzfVYgCCHxdAlmwn6rYDxGxx57tyh3COF62Cn9rsW0X7/EfZYOONo2Zdr1+PoWo/ZWjumgX2iqwqyid6BspRT2Oved33XmwO+16nBnrtBsC3AQF1I/6NDUa906mEVrJMhwI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745540908; c=relaxed/simple;
	bh=wMrJmTqUdSdWoAhO2BgF6We83bz1qUsQFHZOCTyxtgQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=em24kwVF85+U3Kxovqgv7iIz8uDUN8U5JHfyvxnijSljjHxvj4+eW2qSjBU7vBkEXOECXzuLIMHpEWLZsbPe+gdgbN4nHaoryTqssZDHXu0mFJV+oMCpCCItkUBu8zroWTePIjFQG0v2VCb3Lj0exIaRktnS59rC7WXOrMtuDUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RTjCSuak; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RTjCSuak"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8B6BC4CEF9;
	Fri, 25 Apr 2025 00:28:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745540908;
	bh=wMrJmTqUdSdWoAhO2BgF6We83bz1qUsQFHZOCTyxtgQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=RTjCSuakw5EFduODl6x4+jc+oaU+YuA7RcmYMojYxGb1Le3aQwtXFKgTXhhQLc+5C
	 GK4CQo7O3+r4RjurL/qqujRbmnRgAnQYUWIeLO+ccyrXzPUnsOgbfwvsOnWGT7va8q
	 NkNEeP3nRMalmE9xvePKds8qHShPQBONo4JYkK2nysgwPCYjlm1EeAVFhXoxE5r5vs
	 abTTFO9HLbT0UmAVu6OXp2kj2vUIvn2EUdDpSr+vBC/DWbMr1xaX5WkEIQOlfGM5fJ
	 D1umM/9rx9yyaQyGlIDJBd40CEAJSinWhlhbgxods8DesOnyg97uKIfvNuHvj0GMN5
	 /WMspIK64m7ig==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 41D01CE1D0F; Thu, 24 Apr 2025 17:28:27 -0700 (PDT)
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
Subject: [PATCH v3 12/20] ratelimit: Don't flush misses counter if RATELIMIT_MSG_ON_RELEASE
Date: Thu, 24 Apr 2025 17:28:18 -0700
Message-Id: <20250425002826.3431914-12-paulmck@kernel.org>
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

Restore the previous semantics where the misses counter is unchanged if
the RATELIMIT_MSG_ON_RELEASE flag is set.

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
 lib/ratelimit.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/lib/ratelimit.c b/lib/ratelimit.c
index 52aab9229ca50..ebffcfb049949 100644
--- a/lib/ratelimit.c
+++ b/lib/ratelimit.c
@@ -92,9 +92,9 @@ int ___ratelimit(struct ratelimit_state *rs, const char *func)
 		atomic_set(&rs->rs_n_left, rs->burst);
 		rs->begin = jiffies;
 
-		m = ratelimit_state_reset_miss(rs);
-		if (m) {
-			if (!(rs->flags & RATELIMIT_MSG_ON_RELEASE)) {
+		if (!(rs->flags & RATELIMIT_MSG_ON_RELEASE)) {
+			m = ratelimit_state_reset_miss(rs);
+			if (m) {
 				printk_deferred(KERN_WARNING
 						"%s: %d callbacks suppressed\n", func, m);
 			}
-- 
2.40.1

