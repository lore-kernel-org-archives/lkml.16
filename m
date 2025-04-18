Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6698E226D0C
	for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 18:33:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745001227; cv=none; b=t0Qfc+g2tSqfNSUXg5mrE60RXy7cfG4DsMEhiI4cShW+AXmpvoyno9tuOtk75WyVCXCBGWM9evnKly09jC6TiF7CgNzrgIMJKDD2iy9EkztB9yanqgJbpLf9ni6QnpG6nwr/Ai8RN5Vxrir5LE3YxiEVQixhl9vatYOcGz4nZGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745001227; c=relaxed/simple;
	bh=OKDiqgB2pHuTCBxmEQy3/PZJ7f0jyGYq49naXeGmkh4=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type; b=eDq2Ru5m+37M/78N3uTLM/eaRGs+qPZEjdfClU7EablJK1+6soOtVrCbjFnhxuRIYOQoMNitfu7V0Fn9RMhW2EvC8dKArc/wwhczFE5vgayOpZoLZTQLEY6EyasWrd0C5vu0xUzykjKU1T7OLnY8PJaGCbwmpLTWOD/kyeLwTqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4DFF7C4CEEC;
	Fri, 18 Apr 2025 18:33:47 +0000 (UTC)
Received: from rostedt by gandalf with local (Exim 4.98)
	(envelope-from <rostedt@goodmis.org>)
	id 1u5qYj-0000000DbA9-1Jes;
	Fri, 18 Apr 2025 14:35:29 -0400
Message-ID: <20250418183529.162957172@goodmis.org>
User-Agent: quilt/0.68
Date: Fri, 18 Apr 2025 14:34:53 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: linux-kernel@vger.kernel.org
Cc: Masami Hiramatsu <mhiramat@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Shuah Khan <skhan@linuxfoundation.org>
Subject: [for-linus][PATCH 7/7] tracing: selftests: Add testing a user string to filters
References: <20250418183446.383784216@goodmis.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8

From: Steven Rostedt <rostedt@goodmis.org>

Running the following commands was broken:

  # cd /sys/kernel/tracing
  # echo "filename.ustring ~ \"/proc*\"" > events/syscalls/sys_enter_openat/filter
  # echo 1 > events/syscalls/sys_enter_openat/enable
  # ls /proc/$$/maps
  # cat trace

And would produce nothing when it should have produced something like:

      ls-1192    [007] .....  8169.828333: sys_openat(dfd: ffffffffffffff9c, filename: 7efc18359904, flags: 80000, mode: 0)

Add a test to check this case so that it will be caught if it breaks
again.

Link: https://lore.kernel.org/linux-trace-kernel/20250417183003.505835fb@gandalf.local.home/

Cc: Masami Hiramatsu <mhiramat@kernel.org>
Cc: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Shuah Khan <skhan@linuxfoundation.org>
Link: https://lore.kernel.org/20250418101208.38dc81f5@gandalf.local.home
Signed-off-by: Steven Rostedt (Google) <rostedt@goodmis.org>
---
 .../test.d/filter/event-filter-function.tc    | 20 +++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/tools/testing/selftests/ftrace/test.d/filter/event-filter-function.tc b/tools/testing/selftests/ftrace/test.d/filter/event-filter-function.tc
index 118247b8dd84..c62165fabd0c 100644
--- a/tools/testing/selftests/ftrace/test.d/filter/event-filter-function.tc
+++ b/tools/testing/selftests/ftrace/test.d/filter/event-filter-function.tc
@@ -80,6 +80,26 @@ if [ $misscnt -gt 0 ]; then
 	exit_fail
 fi
 
+# Check strings too
+if [ -f events/syscalls/sys_enter_openat/filter ]; then
+	DIRNAME=`basename $TMPDIR`
+	echo "filename.ustring ~ \"*$DIRNAME*\"" > events/syscalls/sys_enter_openat/filter
+	echo 1 > events/syscalls/sys_enter_openat/enable
+	echo 1 > tracing_on
+	ls /bin/sh
+	nocnt=`grep openat trace | wc -l`
+	ls $TMPDIR
+	echo 0 > tracing_on
+	hitcnt=`grep openat trace | wc -l`;
+	echo 0 > events/syscalls/sys_enter_openat/enable
+	if [ $nocnt -gt 0 ]; then
+		exit_fail
+	fi
+	if [ $hitcnt -eq 0 ]; then
+		exit_fail
+	fi
+fi
+
 reset_events_filter
 
 exit 0
-- 
2.47.2


