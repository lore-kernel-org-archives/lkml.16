Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F0A22918C9
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 13:12:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746796379; cv=none; b=UCHG9AQVvKsPhlPT/+SAKFze4uviicBEhyTSxdULI40bEEdLcxpPoEUgbWmTqX/W7u4WD1UP7wE3lKsMBQbQDpPdbPNU1RN8jiWbhF7Ye2HIC+y6UzW7KhfDEzttjKDvp5KOaqe/BibduufQXk+w3Z9U6+0MefOkhDDE/ADDxdE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746796379; c=relaxed/simple;
	bh=7em6pxWBPfhqwKqZ7y3TDw5C478HqI15eUEpPFij0Xs=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type; b=hJx/UF/V1rwHzhiPMbnBsOrAuD2RZRqBt1gGStivgVY01hYFYY+iTMxF6/P1idQC9nc+d09GdHQMqRkL+M6QEtqpPkVmINjNQt/8CQJXqWhkL2UnEf3LiTAbwgP0HZfHpAfWhqhOtzKOLlSHkESiUSnMfPtNDuRA7ynQnzZEE9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 145FDC4CEEE;
	Fri,  9 May 2025 13:12:59 +0000 (UTC)
Received: from rostedt by gandalf with local (Exim 4.98.2)
	(envelope-from <rostedt@goodmis.org>)
	id 1uDNXO-00000002bqk-2T8c;
	Fri, 09 May 2025 09:13:14 -0400
Message-ID: <20250509131314.441795527@goodmis.org>
User-Agent: quilt/0.68
Date: Fri, 09 May 2025 09:12:55 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: linux-kernel@vger.kernel.org
Cc: Masami Hiramatsu <mhiramat@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Kees Cook <keescook@chromium.org>,
 Tom Zanussi <zanussi@kernel.org>
Subject: [for-next][PATCH 06/31] tracing: Always use memcpy() in histogram add_to_key()
References: <20250509131249.340302366@goodmis.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8

From: Steven Rostedt <rostedt@goodmis.org>

The add_to_key() function tests if the key is a string or some data. If
it's a string it does some further calculations of the string size (still
truncating it to the max size it can be), and calls strncpy().

If the key isn't as string it calls memcpy(). The interesting point is
that both use the exact same parameters:

                strncpy(compound_key + key_field->offset, (char *)key, size);
        } else
                memcpy(compound_key + key_field->offset, key, size);

As strncpy() is being used simply as a memcpy() for a string, and since
strncpy() is deprecated, just call memcpy() for both memory and string
keys.

Cc: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Cc: Kees Cook <keescook@chromium.org>
Link: https://lore.kernel.org/20250403210637.1c477d4a@gandalf.local.home
Acked-by: Masami Hiramatsu (Google) <mhiramat@kernel.org>
Reviewed-by: Tom Zanussi <zanussi@kernel.org>
Signed-off-by: Steven Rostedt (Google) <rostedt@goodmis.org>
---
 kernel/trace/trace_events_hist.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/kernel/trace/trace_events_hist.c b/kernel/trace/trace_events_hist.c
index 1260c23cfa5f..e139b58c3a43 100644
--- a/kernel/trace/trace_events_hist.c
+++ b/kernel/trace/trace_events_hist.c
@@ -5224,10 +5224,8 @@ static inline void add_to_key(char *compound_key, void *key,
 		/* ensure NULL-termination */
 		if (size > key_field->size - 1)
 			size = key_field->size - 1;
-
-		strncpy(compound_key + key_field->offset, (char *)key, size);
-	} else
-		memcpy(compound_key + key_field->offset, key, size);
+	}
+	memcpy(compound_key + key_field->offset, key, size);
 }
 
 static void
-- 
2.47.2


