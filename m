Received: from out-171.mta1.migadu.com (out-171.mta1.migadu.com [95.215.58.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 415EB1DF733
	for <linux-kernel@vger.kernel.org>; Sun,  9 Feb 2025 16:00:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739116823; cv=none; b=j4i2Hg+ntZVKN6UPcAco+Bd5YVKAHmk2sWWjp54DUPfIQLB/A/t8dkAv1A2NqGXzM/a73OUYmbK3NWyCWafG2JoGfhNPWqyswpFxD77voeuiR/a0dLVtiyssoasVK8J6A2qTDK8aMWPlXSDmkv+oVAJAkTePSsU3gGOCEvU08Ts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739116823; c=relaxed/simple;
	bh=UDnxwVq6Dye081rKerjJW9pqZ7LWi0qgUZNCzQNN81M=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=YuOh4FQzyenBiQ0gwpETKOhyhOQFOvP8OTcQGqn0gWpIqfY5e32P6SmSAChm5Y2DhBVofZgJX53tPkf+39aFYwSspqGV2bxECKdaittUvbK7YUHKilfouf36RhE/taKk1ITo/cl9YFltUk0egQIxSbY/Pj/KKTM7//l5D8KQY64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=WtMeLbHK; arc=none smtp.client-ip=95.215.58.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="WtMeLbHK"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1739116819;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=185pKD1tTovZhp7hwS46AH4uWT2/AwtNcxiuhT9N49U=;
	b=WtMeLbHK0inVSpYW7o7qhl7xKsw+RFo2zvOMRyMBLg8/n3pCO1mFxHteaGfYKlRviDJ0Bm
	O7/xV4s+Nmt7Wc0rxNulFKg5CRkgEp9c2tnM3gq+e6dXV9gfvrH/NUG0h8o6+9ZUdanxEA
	acpA7qpQWyMY+itd5JnpimJ+SkZCnys=
From: Wen Yang <wen.yang@linux.dev>
To: Joel Granados <j.granados@samsung.com>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Kees Cook <keescook@chromium.org>
Cc: "Eric W . Biederman" <ebiederm@xmission.com>,
	Dave Young <dyoung@redhat.com>,
	Christian Brauner <brauner@kernel.org>,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <thomas@t-8ch.de>,
	linux-kernel@vger.kernel.org,
	Wen Yang <wen.yang@linux.dev>
Subject: [PATCH v5 5/5] sysctl: delete six_hundred_forty_kb to save 4 bytes
Date: Sun,  9 Feb 2025 23:58:13 +0800
Message-Id: <0432e1fecb00721113c93b3d4d908b452c90f71b.1739115369.git.wen.yang@linux.dev>
In-Reply-To: <cover.1739115369.git.wen.yang@linux.dev>
References: <cover.1739115369.git.wen.yang@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

By directly encoding specific numbers into the min/max field,
unnecessary global variable six_hundred_forty_kb can be removed,
saving 4 bytes

Signed-off-by: Wen Yang <wen.yang@linux.dev>
Cc: Luis Chamberlain <mcgrof@kernel.org>
Cc: Kees Cook <keescook@chromium.org>
Cc: Joel Granados <j.granados@samsung.com>
Cc: Eric W. Biederman <ebiederm@xmission.com>
Cc: Christian Brauner <brauner@kernel.org>
Cc: Dave Young <dyoung@redhat.com>
Cc: linux-kernel@vger.kernel.org
---
 kernel/sysctl.c | 13 +++----------
 1 file changed, 3 insertions(+), 10 deletions(-)

diff --git a/kernel/sysctl.c b/kernel/sysctl.c
index b745445cbfbf..a9ef3b4d736c 100644
--- a/kernel/sysctl.c
+++ b/kernel/sysctl.c
@@ -81,13 +81,6 @@ EXPORT_SYMBOL_GPL(sysctl_long_vals);
 
 #if defined(CONFIG_SYSCTL)
 
-/* Constants used for minimum and maximum */
-
-#ifdef CONFIG_PERF_EVENTS
-static const int six_hundred_forty_kb = 640 * 1024;
-#endif
-
-
 static const int ngroups_max = NGROUPS_MAX;
 static const int cap_last_cap = CAP_LAST_CAP;
 
@@ -1915,10 +1908,10 @@ static struct ctl_table kern_table[] = {
 		.procname	= "perf_event_max_stack",
 		.data		= &sysctl_perf_event_max_stack,
 		.maxlen		= sizeof(sysctl_perf_event_max_stack),
-		.mode		= 0644,
+		.mode		= 0644 | SYSCTL_FLAG_MIN | SYSCTL_FLAG_MAX,
 		.proc_handler	= perf_event_max_stack_handler,
-		.extra1		= SYSCTL_ZERO,
-		.extra2		= (void *)&six_hundred_forty_kb,
+		.min		= 0,
+		.max		= 640 * 1024,
 	},
 	{
 		.procname	= "perf_event_max_contexts_per_stack",
-- 
2.25.1

