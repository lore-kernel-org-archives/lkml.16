Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AC401D63CF
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 09:19:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745572773; cv=none; b=AVxQ9Ycjce9y8NvMDOVtCh7hA7Wb6OoOYloEZ+uHFrxg3uUcIV6h4NcaIUPElPwftWGWvbUDT+79YIaiRZcvuH1H1duAtp2R0TGFt1uPo19n8bsnM5mbmYxpcSNuEQNM3/Da8Xc1wuGmyiXyuGVURcvbmT5Uvb4yzmDRyiq6Fyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745572773; c=relaxed/simple;
	bh=dTahdSR8SPsgQYw4kLVdrwQTJk9QEAfvhtdVTIYsStk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XutQ1iWG82JMDLShuMs0gx4RIEitWmzhMPriqQr/QQ/1eSibvUgSgVWqeKyKM1HVuZBIKRv/KfJvxdlFxdEF5Sr6HgGaVhyXdOmucJ6qUzDTd6w75NJzHk1idWyM9KWZwWQ5d49xN3Gda7O7sUdzYQ25TidBxu4EFcJJqeE6atQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=hWUykK75; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="hWUykK75"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745572770;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=qYO6uwpJSCSAVFzr4GnKDXsdqC4xWSXl2N62RVS1B5M=;
	b=hWUykK75+FLiKNsgyvbRkqqrh4kzormC0v+F6CnFG3Jo7JVfO3jQIdmYz1APqXy9FnKCBf
	boXpHyQvRY17JGfzfcGc4j+nelEyboOzQ1eROHMiguUvWRl+eZHvSPJa4mQf1RFn4Qppsv
	TO/gEWdM6/NZHi9cLo/eb6eUQ0v8dGc=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-212-QVD1HgshMHKZXZt688xphg-1; Fri,
 25 Apr 2025 05:19:25 -0400
X-MC-Unique: QVD1HgshMHKZXZt688xphg-1
X-Mimecast-MFC-AGG-ID: QVD1HgshMHKZXZt688xphg_1745572763
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 90F1A1956078;
	Fri, 25 Apr 2025 09:19:23 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.45.224.162])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 23E7E19560A3;
	Fri, 25 Apr 2025 09:19:20 +0000 (UTC)
From: Tomas Glozar <tglozar@redhat.com>
To: Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Cc: linux-trace-kernel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Tomas Glozar <tglozar@redhat.com>
Subject: [PATCH] tracing/osnoise: Allow arbitrarily long CPU string
Date: Fri, 25 Apr 2025 11:18:39 +0200
Message-ID: <20250425091839.343289-1-tglozar@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12

Allocate kernel memory for processing CPU string
(/sys/kernel/tracing/osnoise/cpus) also in osnoise_cpus_write to allow
the writing of a CPU string of an arbitrary length.

This replaces the 256-byte buffer, which is insufficient with the rising
number of CPUs. For example, if I wanted to measure on every even CPU
on a system with 256 CPUs, the string would be 456 characters long.

Signed-off-by: Tomas Glozar <tglozar@redhat.com>
---
 kernel/trace/trace_osnoise.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/kernel/trace/trace_osnoise.c b/kernel/trace/trace_osnoise.c
index e732c9e37e14..6819b93309ce 100644
--- a/kernel/trace/trace_osnoise.c
+++ b/kernel/trace/trace_osnoise.c
@@ -2302,7 +2302,7 @@ osnoise_cpus_read(struct file *filp, char __user *ubuf, size_t count,
  * osnoise_cpus_write - Write function for "cpus" entry
  * @filp: The active open file structure
  * @ubuf: The user buffer that contains the value to write
- * @cnt: The maximum number of bytes to write to "file"
+ * @count: The maximum number of bytes to write to "file"
  * @ppos: The current position in @file
  *
  * This function provides a write implementation for the "cpus"
@@ -2320,10 +2320,11 @@ osnoise_cpus_write(struct file *filp, const char __user *ubuf, size_t count,
 {
 	cpumask_var_t osnoise_cpumask_new;
 	int running, err;
-	char buf[256];
+	char *buf __free(kfree) = NULL;
 
-	if (count >= 256)
-		return -EINVAL;
+	buf = kmalloc(count, GFP_KERNEL);
+	if (!buf)
+		return -ENOMEM;
 
 	if (copy_from_user(buf, ubuf, count))
 		return -EFAULT;
-- 
2.49.0

