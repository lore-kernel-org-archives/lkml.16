Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60FE517BBF
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 00:28:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745540908; cv=none; b=mW5yygrS5z36DPMnmVF8GJggGWNXf7XT89u8747CgK9h7PtkOHjRNzSDAEIbve4gE5JhlLSJ6SffDmMhQ/i3cdFfcWGZawMG00CllMuEwwI7h8AuDIf23fiHdvaiCchMxmXoRxVigkdEb765kGLw+TS1azy7QetgWaJouxRWxiA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745540908; c=relaxed/simple;
	bh=IavtoLTEqylcAJIOJAI3tHTLtZaSkUpnyEek0/bb900=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=qd4wCNI2LVkMAZpWmi6ZczJ24y1Ub39OotL7L41NwQMKb04DNovgFlsO8NEvsGQZqQ+7NZ5x9SCj5C0M8f8vfAO59E6LzXedZocOlMiV6sQZWDcXP6vFJw76SrkQjN9/BUDxIxv3yXOhJmUvzHGQrQXnwjNO7GRhUHkXUGrJvmc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iTZXKsRp; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iTZXKsRp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F21CCC4CEEF;
	Fri, 25 Apr 2025 00:28:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745540908;
	bh=IavtoLTEqylcAJIOJAI3tHTLtZaSkUpnyEek0/bb900=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=iTZXKsRpqvEkrU8ngZBfV4bm3z9v2BAwKLUz1bmwEe8xq92NkAWDA5gLAE2+0of86
	 aI9b2AwhkyqKqjbaBSXJYlA1rcpZPv59OKLLndFYM6nSHi1IxtUr/8ImlykqbL9A7X
	 FgWRCUFIpl24uzcC0a+lXaFJBkksYAvsSmMYaL3uhY8zNTPXghLIu6F/MdWakihx13
	 BVgkUpuT9N7PGhfd7HbqnDwodfzrkaoER2XxKPoX56Lt8iVn/wOQ4EOk+DG9BttVXX
	 RVmLEQnt5DGQacaBdntIUEu0ojbyNM+nXNws2D3oteaFvfxd63ERb5Nd+80/Ek6SHB
	 XtyXUBW8Yf4GQ==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 44456CE1D13; Thu, 24 Apr 2025 17:28:27 -0700 (PDT)
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
Subject: [PATCH v3 13/20] ratelimit: Avoid atomic decrement if already rate-limited
Date: Thu, 24 Apr 2025 17:28:19 -0700
Message-Id: <20250425002826.3431914-13-paulmck@kernel.org>
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

Currently, if the lock could not be acquired, the code unconditionally
does an atomic decrement on ->rs_n_left, even if that atomic operation
is guaranteed to return a limit-rate verdict.  This incurs needless
overhead and also raises the spectre of counter wrap.

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
 lib/ratelimit.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/lib/ratelimit.c b/lib/ratelimit.c
index ebffcfb049949..747a5a7787705 100644
--- a/lib/ratelimit.c
+++ b/lib/ratelimit.c
@@ -65,8 +65,10 @@ int ___ratelimit(struct ratelimit_state *rs, const char *func)
 		unsigned int rs_flags = READ_ONCE(rs->flags);
 
 		if (rs_flags & RATELIMIT_INITIALIZED && burst) {
-			int n_left;
+			int n_left = atomic_read(&rs->rs_n_left);
 
+			if (n_left <= 0)
+				return 0;
 			n_left = atomic_dec_return(&rs->rs_n_left);
 			if (n_left >= 0)
 				return 1;
-- 
2.40.1

