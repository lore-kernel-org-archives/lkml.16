Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FD36233158
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 23:33:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746747217; cv=none; b=AxT7AEHxcbihFnPUXDmvll/NQ6cHjHPs/vYpydAAgaGkyaAfVs3N08RarN97uI8niG12WBnbmornkVS2NFK40kHDEDcuD7eKshQPL3TER/dXlMiGHlL7ClNfGnpHSsfXtQipy3AvddTakOmMGI0iBOURrnVRzV05b+eKGLQ/+EM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746747217; c=relaxed/simple;
	bh=QuXY/enqInz7nSkzplVvspsi9vNMNEEbLePY/x4Nq0g=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=esbqA+RE925Q8z+dx6fGvmS8QvMpOewblxStUK38Vk8A5zhLXWuXQsfKaS6nAw6X+zEdZDchqhUyA5dXMFY5cxJG24GWmMX9XkWHxKKlhfnH9lTDh6aOSpoX0rkuYgY+SFc3AcBR6yifx8xPbTj+XLwMoUP7U03JG2Rr7RleY6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=J+HkB5XS; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="J+HkB5XS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E263C4CEF9;
	Thu,  8 May 2025 23:33:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746747217;
	bh=QuXY/enqInz7nSkzplVvspsi9vNMNEEbLePY/x4Nq0g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=J+HkB5XSP3ZsLFie8L/79AzZaN7ErcgWppHIrYhFdTMrt1bKtvu8+0ldWo48wmakV
	 iBzkUVoSMGdyWtvBurI54PdGgQzn2lMb795+AJ8gKB3rM1ema5ZPOOIIZca/r2oWzu
	 4w66/7q/HNWDCMRHvWxnM6S3Xnll/xZrwhiuMv6jqVSKoF2l96sktcwC9S3+9Id8Qd
	 k/9Rd+W2FzZ80F4/OfNnD/YlZw7EStEZPfaIJh/PTNqY+a8orOgFjxuKMBJBMqMW7b
	 1/YS4aRf5GU15dJObVmKXfN9nPxjQlL6NhyI47LqzIo39l+Hs9Byzoac6z+JoOJj8a
	 df9mjktEn8xlw==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 9037ECE13FF; Thu,  8 May 2025 16:33:36 -0700 (PDT)
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
Subject: [PATCH v5 18/21] ratelimit: Use nolock_ret restructuring to collapse common case code
Date: Thu,  8 May 2025 16:33:32 -0700
Message-Id: <20250508233335.1996059-18-paulmck@kernel.org>
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

Now that unlock_ret releases the lock, then falls into nolock_ret, which
handles ->missed based on the value of ret, the common-case lock-held
code can be collapsed into a single "if" statement with a single-statement
"then" clause.

Yes, we could go further and just assign the "if" condition to ret,
but in the immortal words of MSDOS, "Are you sure?".

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
 lib/ratelimit.c | 13 +++----------
 1 file changed, 3 insertions(+), 10 deletions(-)

diff --git a/lib/ratelimit.c b/lib/ratelimit.c
index bcda7c61fc6ff..dcc063af195eb 100644
--- a/lib/ratelimit.c
+++ b/lib/ratelimit.c
@@ -88,17 +88,10 @@ int ___ratelimit(struct ratelimit_state *rs, const char *func)
 			}
 		}
 	}
-	if (burst) {
-		int n_left = atomic_read(&rs->rs_n_left);
 
-		/* The burst might have been taken by a parallel call. */
-
-		if (n_left > 0) {
-			n_left = atomic_dec_return(&rs->rs_n_left);
-			if (n_left >= 0)
-				ret = 1;
-		}
-	}
+	/* Note that the burst might be taken by a parallel call. */
+	if (burst && atomic_read(&rs->rs_n_left) > 0 && atomic_dec_return(&rs->rs_n_left) >= 0)
+		ret = 1;
 
 unlock_ret:
 	raw_spin_unlock_irqrestore(&rs->lock, flags);
-- 
2.40.1

