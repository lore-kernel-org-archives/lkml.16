Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51A61134A8
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 00:28:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745540908; cv=none; b=ALxuqzRZ4uthutMTbc00TR6NzVRWtQUMfrrivNCZvPSigdJHqOJq7E2BG0P4PeiDGJrACy59IOSKP2xOL0zK9NpQTie9ZwamsZEDwn4vP/9XGn8Pn2ln+5QA8xK9g3lzM5qHtW0T1mOa+HTexp05n4mO25ttl6Tteijda6EkFb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745540908; c=relaxed/simple;
	bh=ZtcHDitNfhhXVZcb6Kn1FywCOZHri6/itAqlD+v1+jI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=BBmb31MLFavOw+qcaxTCpGOU4hf49lnxrZXoV7w0SaA4T1vu23JIp23+0vkUTnQJg03hBIGtVYZ5OzCbP00tOcriUj+FZhYlso+4Gl0DvVTJ55BLdshD0JBY03uY8NU1ftS1MJk0Vd1tF9/D5X7tyUlSZfjeopzxLFUuPnxwauc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Vu20JjSZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Vu20JjSZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 363A8C4CEEB;
	Fri, 25 Apr 2025 00:28:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745540908;
	bh=ZtcHDitNfhhXVZcb6Kn1FywCOZHri6/itAqlD+v1+jI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Vu20JjSZY9qxGH+dVWuvzZ7aXlyopo2r2R+My1nOVeWM2boG5bCXgYMuhEks+U7ep
	 Rw3EhwYjyBZIy5qNzgLGwlmN8MHaVGdwtm+5/Xv3Q3suWLpUi3K/gHCBWMsdaZs9GK
	 X+iL6VV74u2qKDxW4kHB6z6juFJweuuwNByUCQb3M/y91WGlU+3ev+jqLN8nmVDCdz
	 Z79g1rFgsbcGr5//VS8b9sRVI0OVdTP0QfB51Z62EVNkbGdayiXpWjnmTaVuHdN16z
	 TlcaQGtfCvn0cFXipwPkD8n9D9jr6gi59Z8krXeO6O6T5TYdRtGVfOLJXCZq1o9Hi/
	 TI87YCVC9AnLw==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 50911CE1DCB; Thu, 24 Apr 2025 17:28:27 -0700 (PDT)
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
Subject: [PATCH v3 17/20] ratelimit: Use nolock_ret label to save a couple of lines of code
Date: Thu, 24 Apr 2025 17:28:23 -0700
Message-Id: <20250425002826.3431914-17-paulmck@kernel.org>
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

Create a nolock_ret label in order to start consolidating the unlocked
return paths that separately invoke ratelimit_state_inc_miss() or not.

Link: https://lore.kernel.org/all/fbe93a52-365e-47fe-93a4-44a44547d601@paulmck-laptop/
Link: https://lore.kernel.org/all/20250423115409.3425-1-spasswolf@web.de/
Signed-off-by: Paul E. McKenney <paulmck@kernel.org>
Cc: Petr Mladek <pmladek@suse.com>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Kuniyuki Iwashima <kuniyu@amazon.com>
Cc: Mateusz Guzik <mjguzik@gmail.com>
Cc: Steven Rostedt <rostedt@goodmis.org>
Cc: John Ogness <john.ogness@linutronix.de>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>
---
 lib/ratelimit.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/lib/ratelimit.c b/lib/ratelimit.c
index 7511f737dc1e2..7b075654e23ac 100644
--- a/lib/ratelimit.c
+++ b/lib/ratelimit.c
@@ -43,11 +43,8 @@ int ___ratelimit(struct ratelimit_state *rs, const char *func)
 		WARN_ONCE(interval < 0 || burst < 0, "Negative interval (%d) or burst (%d): Uninitialized ratelimit_state structure?\n", interval, burst);
 		ret = interval == 0 || burst > 0;
 		if (!(READ_ONCE(rs->flags) & RATELIMIT_INITIALIZED) ||
-		    !raw_spin_trylock_irqsave(&rs->lock, flags)) {
-			if (!ret)
-				ratelimit_state_inc_miss(rs);
-			return ret;
-		}
+		    !raw_spin_trylock_irqsave(&rs->lock, flags))
+			goto nolock_ret;
 
 		/* Force re-initialization once re-enabled. */
 		rs->flags &= ~RATELIMIT_INITIALIZED;
@@ -116,6 +113,7 @@ int ___ratelimit(struct ratelimit_state *rs, const char *func)
 unlock_ret:
 	raw_spin_unlock_irqrestore(&rs->lock, flags);
 
+nolock_ret:
 	if (!ret)
 		ratelimit_state_inc_miss(rs);
 
-- 
2.40.1

