Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 687D829615C
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 08:50:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747299058; cv=none; b=Bj0/LT65SnNKEEjXb1PqJBsIhBlhXUGJqnnzID10EZ5FcKT+VQ3l4OKeCJ/HJ6lpOE6RcR4UL0E5YFEzetae12ak52qGB3nhApiNrzFljJ3LVpSWqww0d9gx6wqGATUITJphbeW43ZMQQ88gJm6xq8J6C3org9r9Mj1v9rGYyp0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747299058; c=relaxed/simple;
	bh=lYJ/o+eYx3AFY6l9ivqhg4tj8FWBMdEuTBwjzyp5C0A=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type; b=q4mHimpwWt20jN39oPl+/Did6xz2Fxs86A43H6IhRcwPNoilxi2yBUAp/NVWwzUvP8riknjKOJzSihdvXv6Nh6EcCKPE6eI2uXxv3dGY8jcqB5V+4R7AwFisxH+uhpzivJhcIbaYgpabwNkTSO/L9pBL/wmAJcVwI9ucPuiB+xU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF090C4CEE9;
	Thu, 15 May 2025 08:50:57 +0000 (UTC)
Received: from rostedt by gandalf with local (Exim 4.98.2)
	(envelope-from <rostedt@goodmis.org>)
	id 1uFUJL-00000005XaD-0fGd;
	Thu, 15 May 2025 04:51:27 -0400
Message-ID: <20250515085127.011811382@goodmis.org>
User-Agent: quilt/0.68
Date: Thu, 15 May 2025 04:51:10 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: linux-kernel@vger.kernel.org
Cc: Masami Hiramatsu <mhiramat@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Yury Norov <yury.norov@gmail.com>
Subject: [for-next][PATCH 1/4] tracing: Cleanup upper_empty() in pid_list
References: <20250515085109.352233527@goodmis.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8

From: Yury Norov <yury.norov@gmail.com>

Instead of find_first_bit() use the dedicated bitmap_empty(),
and make upper_empty() a nice one-liner.

While there, fix opencoded BITS_PER_TYPE().

Cc: Masami Hiramatsu <mhiramat@kernel.org>
Cc: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Link: https://lore.kernel.org/20250429195119.620204-1-yury.norov@gmail.com
Signed-off-by: Yury Norov <yury.norov@gmail.com>
Signed-off-by: Steven Rostedt (Google) <rostedt@goodmis.org>
---
 kernel/trace/pid_list.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/kernel/trace/pid_list.c b/kernel/trace/pid_list.c
index c62b9b3cfb3d..090bb5ea4a19 100644
--- a/kernel/trace/pid_list.c
+++ b/kernel/trace/pid_list.c
@@ -81,13 +81,9 @@ static inline bool upper_empty(union upper_chunk *chunk)
 {
 	/*
 	 * If chunk->data has no lower chunks, it will be the same
-	 * as a zeroed bitmask. Use find_first_bit() to test it
-	 * and if it doesn't find any bits set, then the array
-	 * is empty.
+	 * as a zeroed bitmask.
 	 */
-	int bit = find_first_bit((unsigned long *)chunk->data,
-				 sizeof(chunk->data) * 8);
-	return bit >= sizeof(chunk->data) * 8;
+	return bitmap_empty((unsigned long *)chunk->data, BITS_PER_TYPE(chunk->data));
 }
 
 static inline int pid_split(unsigned int pid, unsigned int *upper1,
-- 
2.47.2


