Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83F0722C32D
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 10:25:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738751140; cv=none; b=dE5hr5goKRV7pZ7zxy570QiqkbRdW4WBVVdbq0BrG2dU7jIR+Z/XTh2vZIU0ETGFmye7ZLDvKfIKvvsIX+dSDDZjxrSDqQnix4OCXsuzHxQusw1uMX/b8cjyFVHPhoIgAPzszZrsNNO+z1OlnPUrh749D8pE7B9HKtwGPpe/c2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738751140; c=relaxed/simple;
	bh=ejCK5vxQbMv7jatQ4Hem5aLISpgvatcVYDYPSTmRmrA=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type; b=IjoHcy9UEe0H9vz43UYQpKvMTr7SWAovEVdeMVSQcY3/eIybKeBA/N6X2cNM2Uj4cWzbELdDAN68axIUhVuzQxbVdQl4WZg0Ah5e/gSY3B6uIru2St2Fch6YAmem59c+GwqYOQHSIV02TQT+mtNDIWWgnxK9Lq6KSzKgBH0az9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=HL+TPPiP; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="HL+TPPiP"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Type:MIME-Version:References:
	Subject:Cc:To:From:Date:Message-ID:Sender:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:In-Reply-To;
	bh=tN2WqQdsW+7vvSTtR2P1++oVZtUzPhTpdLXdVmnWZ8A=; b=HL+TPPiP0w1pEuRLpID87rC5gr
	sO/toELS3ke0IW2IsXEmrw1Bp8MjIeDxUjcyjwnsqR0EuxImPER+Fkt2vCaOUJ7+eLTjP31uzzwon
	ACetxHE9QMf1uk/XkVu7mGiOq9VAnaKnvxYyIzqhKMChPF8LFCTNiEdfkfbshkEDYw8VTMAnsHpuy
	n7edfUceu1nwpjpRWEhgYb1I+F9E99ubFojr7SVOIo4IUb4hEJogabcB9dEgd7Bv96pS2cg0ICLh5
	7t0BtfGA0OQN4t4FK/c3RjYXetxZ/oQsh6teN6Mj3I1w8xD8eOzAt9CP52BSFYJ7VM+9Wm5fSFm8q
	7v4cKF8g==;
Received: from 77-249-17-89.cable.dynamic.v4.ziggo.nl ([77.249.17.89] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
	id 1tfcb2-00000004GPS-2hZU;
	Wed, 05 Feb 2025 10:25:28 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 0)
	id B55D530050D; Wed,  5 Feb 2025 11:25:27 +0100 (CET)
Message-ID: <20250205102448.458857702@infradead.org>
User-Agent: quilt/0.66
Date: Wed, 05 Feb 2025 11:21:22 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: mingo@kernel.org,
 ravi.bangoria@amd.com,
 lucas.demarchi@intel.com
Cc: linux-kernel@vger.kernel.org,
 peterz@infradead.org,
 willy@infradead.org,
 acme@kernel.org,
 namhyung@kernel.org,
 mark.rutland@arm.com,
 alexander.shishkin@linux.intel.com,
 jolsa@kernel.org,
 irogers@google.com,
 adrian.hunter@intel.com,
 kan.liang@linux.intel.com
Subject: [PATCH v2 02/24] perf: Ensure bpf_perf_link path is properly serialized
References: <20250205102120.531585416@infradead.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8

Ravi reported that the bpf_perf_link_attach() usage of
perf_event_set_bpf_prog() is not serialized by ctx->mutex, unlike the
PERF_EVENT_IOC_SET_BPF case.

Reported-by: Ravi Bangoria <ravi.bangoria@amd.com>
Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
---
 kernel/events/core.c |   34 ++++++++++++++++++++++++++++++----
 1 file changed, 30 insertions(+), 4 deletions(-)

--- a/kernel/events/core.c
+++ b/kernel/events/core.c
@@ -6001,6 +6001,9 @@ static int perf_event_set_output(struct
 static int perf_event_set_filter(struct perf_event *event, void __user *arg);
 static int perf_copy_attr(struct perf_event_attr __user *uattr,
 			  struct perf_event_attr *attr);
+static int __perf_event_set_bpf_prog(struct perf_event *event,
+				     struct bpf_prog *prog,
+				     u64 bpf_cookie);
 
 static long _perf_ioctl(struct perf_event *event, unsigned int cmd, unsigned long arg)
 {
@@ -6063,7 +6066,7 @@ static long _perf_ioctl(struct perf_even
 		if (IS_ERR(prog))
 			return PTR_ERR(prog);
 
-		err = perf_event_set_bpf_prog(event, prog, 0);
+		err = __perf_event_set_bpf_prog(event, prog, 0);
 		if (err) {
 			bpf_prog_put(prog);
 			return err;
@@ -10790,8 +10793,9 @@ static inline bool perf_event_is_tracing
 	return false;
 }
 
-int perf_event_set_bpf_prog(struct perf_event *event, struct bpf_prog *prog,
-			    u64 bpf_cookie)
+static int __perf_event_set_bpf_prog(struct perf_event *event,
+				     struct bpf_prog *prog,
+				     u64 bpf_cookie)
 {
 	bool is_kprobe, is_uprobe, is_tracepoint, is_syscall_tp;
 
@@ -10829,6 +10833,20 @@ int perf_event_set_bpf_prog(struct perf_
 	return perf_event_attach_bpf_prog(event, prog, bpf_cookie);
 }
 
+int perf_event_set_bpf_prog(struct perf_event *event,
+			    struct bpf_prog *prog,
+			    u64 bpf_cookie)
+{
+	struct perf_event_context *ctx;
+	int ret;
+
+	ctx = perf_event_ctx_lock(event);
+	ret = __perf_event_set_bpf_prog(event, prog, bpf_cookie);
+	perf_event_ctx_unlock(event, ctx);
+
+	return ret;
+}
+
 void perf_event_free_bpf_prog(struct perf_event *event)
 {
 	if (!perf_event_is_tracing(event)) {
@@ -10848,7 +10866,15 @@ static void perf_event_free_filter(struc
 {
 }
 
-int perf_event_set_bpf_prog(struct perf_event *event, struct bpf_prog *prog,
+static int __perf_event_set_bpf_prog(struct perf_event *event,
+				     struct bpf_prog *prog,
+				     u64 bpf_cookie)
+{
+	return -ENOENT;
+}
+
+int perf_event_set_bpf_prog(struct perf_event *event,
+			    struct bpf_prog *prog,
 			    u64 bpf_cookie)
 {
 	return -ENOENT;


