Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90CE2231C87
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 23:33:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746747217; cv=none; b=loCyZdN0eT5uKJTBIiiTRjeMzxB5ljg1QSs5guwAH6LJ37IUgsxx1RndAGwXbkiBBKKx2A5dcQ5rQWsBtuHlu6nJyZSq7jSp5FEgnEhya1wXjj0eU4dWxlZc6PGbnIZLJDCqP5kVH1uoEGPTBnSkPNLendS5UFB4p6zSt2xM4sQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746747217; c=relaxed/simple;
	bh=feyMWlvQ3IMm4wSDJau8dg3L1bsITx2hZGbyD38McFU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=O7/HHT3BC4CjR4ml1RBXohAOGgcHoNE/tWQ3tFUbNDYpVE3WwdR7CzpwmFQWcofVCHzGIB25SxxmQ1CU7OiEnKhC/D7jq6EdRXBh/00N8Sb+YuJbsMz8LR+4JFQo/enzzrTgfNxCpbaWpudv8qm549HBK8C/Hyw6d4gZkhbMWmk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jdhlkYsU; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jdhlkYsU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75DACC4CEED;
	Thu,  8 May 2025 23:33:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746747217;
	bh=feyMWlvQ3IMm4wSDJau8dg3L1bsITx2hZGbyD38McFU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=jdhlkYsUcbzgkgtyNuejBiUiIVqPihovc97rpKzmJUbjBBYrTXD1FO0q0bicHtIuV
	 SZEu8jTeVDP/1NwvNkX6m2K66m26QSLgpnMuI4PByXYo3qoCMPxKBikF9RbUcLDEoI
	 yxzGYOkftCJKqF0Pz3uo4pl1IApGHmN28IipKmp0BMV73oiveXUeejyhFGajVOT25D
	 79bb3/aF+MyzkmKMAuOD2Aea6z6JOhPRZN+nVF4nA6qy1nzBTiFpG2Oj7329if7Us7
	 myjrwMe2mNo9O6CCVXwomzOSfk+wJbsYYqEO8YXnhyi+3D2jrGDRYhksc4oJYN7N+U
	 jYK0q5EP+O6dQ==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 8A58ECE13CE; Thu,  8 May 2025 16:33:36 -0700 (PDT)
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
Subject: [PATCH v5 16/21] ratelimit: Use nolock_ret label to save a couple of lines of code
Date: Thu,  8 May 2025 16:33:30 -0700
Message-Id: <20250508233335.1996059-16-paulmck@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <1bcf7d5e-b89c-4118-b872-c8896bdbdc19@paulmck-laptop>
References: <1bcf7d5e-b89c-4118-b872-c8896bdbdc19@paulmck-laptop>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Create a nolock_ret label in order to start consolidating the unlocked
return paths that conditionally invoke ratelimit_state_inc_miss().

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
 lib/ratelimit.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/lib/ratelimit.c b/lib/ratelimit.c
index 7c6e864306db2..e7101a79c6973 100644
--- a/lib/ratelimit.c
+++ b/lib/ratelimit.c
@@ -43,11 +43,8 @@ int ___ratelimit(struct ratelimit_state *rs, const char *func)
 		WARN_ONCE(interval < 0 || burst < 0, "Negative interval (%d) or burst (%d): Uninitialized ratelimit_state structure?\n", interval, burst);
 		ret = interval == 0 || burst > 0;
 		if (!(READ_ONCE(rs->flags) & RATELIMIT_INITIALIZED) || (!interval && !burst) ||
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

