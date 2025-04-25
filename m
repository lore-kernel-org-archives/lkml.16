Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6327217C98
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 00:28:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745540908; cv=none; b=JeZOzL7woBQM06CfL9rUQOFJO7zQhVm7FEWg8rOT1eLtQWLGTFPeqKAAUrHN02Qux34YsNHYpw9kLTCLy+Hu+TO8XjwGiUgPo6W90SC5/JQ6bXYEuCtVlymt0ZXgnkzwZKKJePb1V4yUdlXLl5/RiDIvRd4/50XQDnPKRXnjDEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745540908; c=relaxed/simple;
	bh=XP3uIOiK7FGxmPJRZtUpW4IH4ojMDqMUq3WOoYs/qyc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=J/ej2WbpPbg4+e5XBMUyMSBdRBeTD2MBrjjCDGa7bXApgWZUTdlKZYutqeMfVokhQBmQX+gQH+oi3Fif8z8IgZQ9ZCvIGhMZgHvCdASO+KHe4w6/6/LhlqoYsStdPRq0z3HF5MzJ0jbVRC1yVWnk3AoWa9NrYrQOm+twfKrwAac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hL0ko1sa; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hL0ko1sa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C6F7C4CEFA;
	Fri, 25 Apr 2025 00:28:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745540908;
	bh=XP3uIOiK7FGxmPJRZtUpW4IH4ojMDqMUq3WOoYs/qyc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=hL0ko1saRwwkgS15whSKWR4G48lbDuUPaYHqoKhf2ZyKfTEokxlQ4miRToJO18aDK
	 HqhQ2ArSvTmI/b9ElcX3WcEE8Kpw2wdlPFfoEKsCKuH2XfU/oXawiKBLp6JWyC//m5
	 4yqVxC74pUsfWRs1hGfTZ5fFetRrI0SbZXfG4EiXu21SrZpWAi6XP/YbcASeFk+3pw
	 H2fjTCITqjl9DmT0OYt4QkegjlVbRg3+2haZ/YRZGs7iRLrCZtzwKc4+qOT0ak4cTO
	 MxCoJi+UVDf4qebg0L+1bES/VJIxNoCHIKAQqGZCWYnbjy4kA70qAyU0RA786pyy5Y
	 w8zrGcY4PKNJA==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 4A286CE1DBF; Thu, 24 Apr 2025 17:28:27 -0700 (PDT)
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
	"Paul E . McKenney" <paulmck@kernel.org>
Subject: [PATCH v3 15/20] ratelimit: Warn if ->interval or ->burst are negative
Date: Thu, 24 Apr 2025 17:28:21 -0700
Message-Id: <20250425002826.3431914-15-paulmck@kernel.org>
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

From: Petr Mladek <pmladek@suse.com>

Currently, ___ratelimit() treats a negative ->interval or ->burst as
if it was zero, but this is an accident of the current implementation.
Therefore, splat in this case, which might have the benefit of detecting
use of uninitialized ratelimit_state structures on the one hand or easing
addition of new features on the other.

Link: https://lore.kernel.org/all/fbe93a52-365e-47fe-93a4-44a44547d601@paulmck-laptop/
Link: https://lore.kernel.org/all/20250423115409.3425-1-spasswolf@web.de/
Signed-off-by: Petr Mladek <pmladek@suse.com>
Signed-off-by: Paul E. McKenney <paulmck@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Kuniyuki Iwashima <kuniyu@amazon.com>
Cc: Mateusz Guzik <mjguzik@gmail.com>
Cc: Steven Rostedt <rostedt@goodmis.org>
Cc: John Ogness <john.ogness@linutronix.de>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>
---
 lib/ratelimit.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/lib/ratelimit.c b/lib/ratelimit.c
index 4f5d8fb6919f7..63efb1191d71a 100644
--- a/lib/ratelimit.c
+++ b/lib/ratelimit.c
@@ -40,6 +40,7 @@ int ___ratelimit(struct ratelimit_state *rs, const char *func)
 	 * says always limit.
 	 */
 	if (interval <= 0 || burst <= 0) {
+		WARN_ONCE(interval < 0 || burst < 0, "Negative interval (%d) or burst (%d): Uninitialized ratelimit_state structure?\n", interval, burst);
 		ret = interval == 0 || burst > 0;
 		if (!(READ_ONCE(rs->flags) & RATELIMIT_INITIALIZED) ||
 		    !raw_spin_trylock_irqsave(&rs->lock, flags)) {
-- 
2.40.1

