Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F40FF21D58F
	for <linux-kernel@vger.kernel.org>; Sat, 12 Apr 2025 21:03:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744491823; cv=none; b=sC0WUgSaMKfidxQOytG0qNpXTbEJJPvka3Uy2j8XX5ycrTCf8brdFBADELuwWucIBjNKkYjZ3cYAttG/8uqrsbMbGt9upNJMH4+YFzvSXkBtRNbff4C2YFYZxeQlPoisx2Rv32l4DSpqmh84UcFMJPJsDA9+Jf8YhswwmB1TgN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744491823; c=relaxed/simple;
	bh=Ck57P88/cufB2DmsK9iWuM8HKUfwVvvEim98nv6CAqk=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type; b=B+//k5AcNbYaWMA4CvNdFKGmbJmpc1KR5gkWnd38ZqJSsrYgLn8WMdpSEBYcneomCoHRWfTcmDq4FsOfrqKqCbMBQfrvcm/WGDI8+/rgWJEVPlQeyHJuLPE1fIjYbIXjcmOds/MuQSb+cxX06N1pE4PRA8VtGS97e7oUyig2240=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A151C4CEE5;
	Sat, 12 Apr 2025 21:03:42 +0000 (UTC)
Received: from rostedt by gandalf with local (Exim 4.98)
	(envelope-from <rostedt@goodmis.org>)
	id 1u3i2I-0000000AEDO-1r4L;
	Sat, 12 Apr 2025 17:05:10 -0400
Message-ID: <20250412210510.290174642@goodmis.org>
User-Agent: quilt/0.68
Date: Sat, 12 Apr 2025 17:04:47 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: linux-kernel@vger.kernel.org
Cc: Masami Hiramatsu <mhiramat@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Guenter Roeck <linux@roeck-us.net>
Subject: [for-linus][PATCH 1/7] tracing: Hide get_vm_area() from MMUless builds
References: <20250412210446.338481957@goodmis.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8

From: Steven Rostedt <rostedt@goodmis.org>

The function get_vm_area() is not defined for non-MMU builds and causes a
build error if it is used. Hide the map_pages() function around a:

 #ifdef CONFIG_MMU

to keep it from being compiled when CONFIG_MMU is not set.

Cc: Masami Hiramatsu <mhiramat@kernel.org>
Cc: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Link: https://lore.kernel.org/20250407120111.2ccc9319@gandalf.local.home
Reported-by: Guenter Roeck <linux@roeck-us.net>
Tested-by: Guenter Roeck <linux@roeck-us.net>
Closes: https://lore.kernel.org/all/4f8ece8b-8862-4f7c-8ede-febd28f8a9fe@roeck-us.net/
Fixes: 394f3f02de531 ("tracing: Use vmap_page_range() to map memmap ring buffer")
Signed-off-by: Steven Rostedt (Google) <rostedt@goodmis.org>
---
 kernel/trace/trace.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/kernel/trace/trace.c b/kernel/trace/trace.c
index b581e388a9d9..8ddf6b17215c 100644
--- a/kernel/trace/trace.c
+++ b/kernel/trace/trace.c
@@ -9806,6 +9806,7 @@ static int instance_mkdir(const char *name)
 	return ret;
 }
 
+#ifdef CONFIG_MMU
 static u64 map_pages(unsigned long start, unsigned long size)
 {
 	unsigned long vmap_start, vmap_end;
@@ -9828,6 +9829,12 @@ static u64 map_pages(unsigned long start, unsigned long size)
 
 	return (u64)vmap_start;
 }
+#else
+static inline u64 map_pages(unsigned long start, unsigned long size)
+{
+	return 0;
+}
+#endif
 
 /**
  * trace_array_get_by_name - Create/Lookup a trace array, given its name.
-- 
2.47.2


