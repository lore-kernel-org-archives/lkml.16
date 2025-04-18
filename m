Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27DDF21ADC3
	for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 17:14:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744996443; cv=none; b=Ts/b1fGufctX2vzKzaZueqpKHZChAvY1QnWFlUMJMR9xxw0pCr65fLbA5YNTkYiy/ZvH2wpMkjw37dc/eK6dfxTq+1MCwNU575wheZrIVRz9ac36ZtwdJ52VYCImMlugH2T/qhBdKZ1ccsM7+olKF0jUHCfNUcnCd+DK/cgBW6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744996443; c=relaxed/simple;
	bh=0+YOoQ46SqJjJGj2qP1jhZH6G1E2lAoQ0U8B/8NaiLU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=GmQpuPta1iRe4Qj5GQuDDfrIZ2DeN8BoUi6zEKhmSeHZUdvaadOcbTb6F2m64jFbRtooYGiDDuqoMGk5S849OjcFfWlEcnBfZURYAwOS/LNiqZbNidsi2YiR4lwIpqTxIKWk9XmaFzljuNR8MpIGxECssS3vEP1r41xrS4Ft5N4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Kb5/y+AG; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Kb5/y+AG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2B53C4CEF9;
	Fri, 18 Apr 2025 17:14:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744996442;
	bh=0+YOoQ46SqJjJGj2qP1jhZH6G1E2lAoQ0U8B/8NaiLU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Kb5/y+AGygrfeB7o9Jtr7zD/DcsXbKdEwVTekEyTa8LEjSbedVrKQvV6s3wmtBvw/
	 iMa8R04ZSD9rgw2PY1g9toh0m1ZytTGbfQznw16ljmQEsUd/Nzi1qDjuca8bVIN9sD
	 oZ34w0yA12su8q743xLbv98je27pd4IEMqP/9WmJAtss9rsoSg3MJOsX3Z71pKmwxn
	 3QsHijYQ/QlZUHy/pigxPrpj5Ywvfs27tUbAJC/XCFaBuQRL6urI86XhV/BWCGzeju
	 eWbohRw5pHjqUYGQjft8+xc1zBuFm/NtVzDFnLrxXesdEeVjRded2qzFDkqZHDauaV
	 X41GDLfj3kckA==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 086F6CE18B2; Fri, 18 Apr 2025 10:14:02 -0700 (PDT)
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
Subject: [PATCH v2 ratelimit 14/14] ratelimit: Avoid atomic decrement under lock if already rate-limited
Date: Fri, 18 Apr 2025 10:13:59 -0700
Message-Id: <20250418171359.1187719-14-paulmck@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <4edcefb0-cdbd-4422-8a08-ffc091de158e@paulmck-laptop>
References: <4edcefb0-cdbd-4422-8a08-ffc091de158e@paulmck-laptop>
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

Signed-off-by: Paul E. McKenney <paulmck@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Kuniyuki Iwashima <kuniyu@amazon.com>
Cc: Mateusz Guzik <mjguzik@gmail.com>
Cc: Petr Mladek <pmladek@suse.com>
Cc: Steven Rostedt <rostedt@goodmis.org>
Cc: John Ogness <john.ogness@linutronix.de>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>
---
 lib/ratelimit.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/lib/ratelimit.c b/lib/ratelimit.c
index 2048f20561f31..0603b2ecd63f3 100644
--- a/lib/ratelimit.c
+++ b/lib/ratelimit.c
@@ -98,13 +98,16 @@ int ___ratelimit(struct ratelimit_state *rs, const char *func)
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

