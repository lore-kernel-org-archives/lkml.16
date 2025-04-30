Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C4C6CA5A
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 01:05:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745975127; cv=none; b=o/9IJ+dUg5ST8R5OXValVCHV0t+RY7TPNeQnb4MvKCmNuR6KA9kXJedUBsGwrLOGmEj5spaF86B74yBM5drICkF3gnzLAD1m3Cy3pCRqFYzxq+SP6fIa+gWbJsXHnJvAWZ5IlLZQE6D4op84H0vlU0PJ+ipG4QeGOKyVLmpFAHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745975127; c=relaxed/simple;
	bh=pXpLtvkklfQw6NZrHmnRsqa8G0gH1/KimuwtRPQx/mI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=eby6CpvnWqYwyLp+r6BHans9eAT3p0YVPsfjvGw0SvtUmWglbBAgYDpfFpJBR3ffXpEmSzEkOCVM03JO42g6S9afk9UfGVB0slWtxjHLlIxdROmFjmbBfExWKGb/nv0M4CLg/E4yaHnrcNfTNwWl3gg4vLhpH5Bke/yw04j0Oeo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ED+XYwc7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ED+XYwc7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D331C4CEF7;
	Wed, 30 Apr 2025 01:05:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745975127;
	bh=pXpLtvkklfQw6NZrHmnRsqa8G0gH1/KimuwtRPQx/mI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ED+XYwc7kFJjCb1P6TrRUoiJ6MBC6KHV8pv1h+Pp2ZN0JY5lK+YQ7QRFjDObVuReN
	 fjZWBQ3Emxj/bBWD3gu+NaRsSzdsI/UDcyeaycQzbQ8qeMk3eS0kd3AhmGHxHNZ3hr
	 5nf7enlZOU57a5/M1Jxrb4NCdNcTHBO8cDyn1kPixlRh8iP3H+MgOA7pix5K5UIqO/
	 6FIjtXjKWw8mzvcAF3NV0LwaGuoAwbDhYVEqKhASfcqny/GIG0JMkuvioEQ80kV7Q1
	 ZFTGsQ4wkLDWnapIWyh1jDbe3Bbb+69ZBbJypLOiFO2mCAEOBNV55vWvybmhFmnAN/
	 Kz70Tpz9HYMAA==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id D11ADCE1160; Tue, 29 Apr 2025 18:05:25 -0700 (PDT)
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
Subject: [PATCH v4 15/20] ratelimit: Warn if ->interval or ->burst are negative
Date: Tue, 29 Apr 2025 18:05:19 -0700
Message-Id: <20250430010524.3614408-15-paulmck@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <b0883f20-c337-40bb-b564-c535a162bf54@paulmck-laptop>
References: <b0883f20-c337-40bb-b564-c535a162bf54@paulmck-laptop>
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
index ab8472edeb1d2..6a5cb05413013 100644
--- a/lib/ratelimit.c
+++ b/lib/ratelimit.c
@@ -40,6 +40,7 @@ int ___ratelimit(struct ratelimit_state *rs, const char *func)
 	 * says always limit.
 	 */
 	if (interval <= 0 || burst <= 0) {
+		WARN_ONCE(interval < 0 || burst < 0, "Negative interval (%d) or burst (%d): Uninitialized ratelimit_state structure?\n", interval, burst);
 		ret = interval == 0 || burst > 0;
 		if (!(READ_ONCE(rs->flags) & RATELIMIT_INITIALIZED) || (!interval && !burst) ||
 		    !raw_spin_trylock_irqsave(&rs->lock, flags)) {
-- 
2.40.1

