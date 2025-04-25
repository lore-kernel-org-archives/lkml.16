Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26470BE6C
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 00:28:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745540908; cv=none; b=TQ4BlEwPBxcgGyLvD9zvi2vadq6xzjNyJT60ii1/zH3RCl4ZfAOcqfg6URTXpxWWnJEmhi2eqxiajQUcUwMDiyynluUb0/T472U/htoJi9XxCBJ7VwhY6qPyeilBBX1MKe7zDwQKHd6ndhH/cy19mx5hW356Kl9yyoO9H/9nplA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745540908; c=relaxed/simple;
	bh=drIhZlz6qjJXl6CfFVToJFT9tX9Y5dyNfzQrE+P3u7o=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=BXwTIzYPzroSBBWJHJqiJ5c0Le81XonTu6jPw4+dMzv73wDECyeeQfa82VGb3kdCbryizEZKsaL9U1zgDW+xPpxktB8TLsvau4pCnp2PduENsPSJF/dzum2MjDn5Vx6epbVbjb1EjdXs7zNvDU+CtJZVfA6IrcJFVxP/9igTLYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D4Wn0dii; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D4Wn0dii"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7B7AC4CEF4;
	Fri, 25 Apr 2025 00:28:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745540907;
	bh=drIhZlz6qjJXl6CfFVToJFT9tX9Y5dyNfzQrE+P3u7o=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=D4Wn0dii5KVLnWXdJJTSUQ4hxBTfeJe9NgtvAMSyPv2bg7eyDwWAYADpV5BvoN5Ks
	 m7lB3wByXWr4MGdV4IAJSH/RZsxay/Nb8424B5sGj84cfOK/2x/1SjeYs6jGSlLhDJ
	 ht2TqejEAiMFZ6+DkyUihb+N4Bs9pgDNDnJTUR3XgOGCN0v6vdrmUzIrqfsNaN2OJ0
	 0tuIRmLVqeVIz0xCGoE+gaucDSphdgdBaXpBSbXaqVSTHfN/pCFJujzVP3JVdRSj6r
	 R4Gwcgzoh/Vfk7/Ncb5dnEGOXZhz1mqFekxRlrG3526oGydP+PXSfi8xi1+ZALD0bH
	 9U+YGDa1dGArA==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 340EACE1A02; Thu, 24 Apr 2025 17:28:27 -0700 (PDT)
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
Subject: [PATCH v3 07/20] ratelimit: Count misses due to lock contention
Date: Thu, 24 Apr 2025 17:28:13 -0700
Message-Id: <20250425002826.3431914-7-paulmck@kernel.org>
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

The ___ratelimit() function simply returns zero ("do ratelimiting")
if the trylock fails, but does not adjust the ->missed field.  This
means that the resulting dropped printk()s are dropped silently, which
could seriously confuse people trying to do console-log-based debugging.
Therefore, increment the ->missed field upon trylock failure.

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
index 18703f92d73e7..19ad3cdbd1711 100644
--- a/lib/ratelimit.c
+++ b/lib/ratelimit.c
@@ -44,8 +44,10 @@ int ___ratelimit(struct ratelimit_state *rs, const char *func)
 	 * in addition to the one that will be printed by
 	 * the entity that is holding the lock already:
 	 */
-	if (!raw_spin_trylock_irqsave(&rs->lock, flags))
+	if (!raw_spin_trylock_irqsave(&rs->lock, flags)) {
+		ratelimit_state_inc_miss(rs);
 		return 0;
+	}
 
 	if (!rs->begin)
 		rs->begin = jiffies;
-- 
2.40.1

