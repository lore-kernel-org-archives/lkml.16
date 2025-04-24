Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB969285401
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 21:57:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745531861; cv=none; b=eKd/gIHJY6NQkehqzqcMCXdKbfSSHc5J2POQdrEXxcopUDBIfCn+bdgMqX77tplU5lz+ahE+1U/dFhvSKryOX9Uw1yiHQecKQla4qXVn9f9AcmrEi52f3igJy8EGmDvCguVCAJAe0914cE0QPmic6HbFSbJ4ioO+fDEmhRNZEy8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745531861; c=relaxed/simple;
	bh=vuURytbWcSGvIaiG5GbcD6TA01ZKJHRuYrFn7INzzmg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WrVx4hXJhnlp+pQvmKkVa6zr3Pt8vw65AQ2+YB+gHt4DYX1MmeqTA3cng9KhbENO0RxokHggffp1F7vzOsrzj/C2W3x2wvaATX7gM2Lm4K9TvGdySojStDLL9F4XnvLE0DwfviOzM9VhdUpRgz8X9TFUAL4OFaAlgGWSruJNFKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=H7XIN+6x; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="H7XIN+6x"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745531858;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iJVQONz8RalzktWn+rmlputUFr7g2nVHb4F9h9nA5CU=;
	b=H7XIN+6x7fxD70/5tWQNmU6an8LRNtCTr4yzP9hHmW5itaX4FN0R4wjmtNf4fzORq26RkV
	lfawdEIqJ1EEEJPoceKEIpSw8V02LaxeX/YOwNLn4AnJrFcMvM8rx3WZDWCCG+cb2xaU4r
	Rxkbc11dsO1+Yzo2kXgp2QIib1Yc/M0=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-354-uZAVZ4GyOM-heC9XKq1jTw-1; Thu, 24 Apr 2025 17:57:37 -0400
X-MC-Unique: uZAVZ4GyOM-heC9XKq1jTw-1
X-Mimecast-MFC-AGG-ID: uZAVZ4GyOM-heC9XKq1jTw_1745531857
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c0c1025adbso327189185a.1
        for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 14:57:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745531856; x=1746136656;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iJVQONz8RalzktWn+rmlputUFr7g2nVHb4F9h9nA5CU=;
        b=mdYKNdsiMlFk524V9rTXKe4g4AJN/xrf/neAp6OKde4KBVW+0bx47yAhC+XiF7shC/
         WmF0UXYO2cI/282OrVWQevirqGiarekIBQlPHrD/hjsTP9KRQ+VEmZHRQXJ4x4Rgp2s+
         MmOm/LOl0Lx5dIfQslfymvtf3dnphw8Iu07hG8q4ZH5vHu+SL5YaF5rt7O97hVDmabhA
         ukNzz1enqSkfx2Ob18UwnsQ5cCWFSVvc5YyAOLsbVCD79kH5ORlqRbHaGydiIGOYSd9b
         1+GrMLAHpqNfnuvm8N/TZ1gb6hkUiruTj4xqcchdyDFLtC/113Y+fdXki0cHSrzL/2ML
         NVUQ==
X-Gm-Message-State: AOJu0YzuMolFTKYnrebT3ni7XTlANgS2npb1XfiUgwWPyEk/g7IaJuN1
	w7ogKt+yeTApFi39udxpUGsASh4njrRBlFKj4gqpYWuAgr7vH7WF9svmDqQgZgh8dk10boiM6dE
	PMI7gs2xHaNo0AtX1FopuDisAxQF5dMNNMOnj12lv2tNSth0MWhDvRi769RyHzYR+mZgOhJ0071
	AMZSMNuql3veeA8lk1oocUZX6uqbeoRv7PKOysWKIYLjQ=
X-Gm-Gg: ASbGncsHWTQUK8NWSZuN6qGmy0TgUdBDxWgFNQQgs6uGVPwl1cZK3bHU7pCN3KTyp28
	d6NG9ND+LlA5dxsbfPrNDAZUwHSaYNUaG+mLx30+X8F+N+BuIWSWTbF5mteiE3svCQFT+cIvlSi
	wFsdFW8oKb/dM7rw5R9ChyCmaf++rPzU6+vD2bq0gC3hMxWQKkpDWmFwqp5NqP3NhMl0d0Kk5Kd
	CuXyfrrP3PPRIYCCjc0aZgGCZSgf0+gSAcnY/pGhVkvXV8Kl0vL4pyowmEXA2wanoT2AQ2TgINg
X-Received: by 2002:a05:620a:c4c:b0:7c5:3c0a:ab77 with SMTP id af79cd13be357-7c9606a4affmr28582785a.4.1745531856242;
        Thu, 24 Apr 2025 14:57:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG2Y9XhFTnDyTbHiC5mLGsvkfzojqkj8TFGkaG5R4n7ccDP3PjSRu3wEBOL6ANA7kOXImrsxw==
X-Received: by 2002:a05:620a:c4c:b0:7c5:3c0a:ab77 with SMTP id af79cd13be357-7c9606a4affmr28577685a.4.1745531855658;
        Thu, 24 Apr 2025 14:57:35 -0700 (PDT)
Received: from x1.com ([85.131.185.92])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c958ea2a6dsm138737085a.106.2025.04.24.14.57.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 14:57:34 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Cc: Mike Rapoport <rppt@kernel.org>,
	James Houghton <jthoughton@google.com>,
	David Hildenbrand <david@redhat.com>,
	Suren Baghdasaryan <surenb@google.com>,
	Axel Rasmussen <axelrasmussen@google.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	peterx@redhat.com
Subject: [PATCH 2/2] mm/selftests: Add a test to verify mmap_changing race with -EAGAIN
Date: Thu, 24 Apr 2025 17:57:29 -0400
Message-ID: <20250424215729.194656-3-peterx@redhat.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250424215729.194656-1-peterx@redhat.com>
References: <20250424215729.194656-1-peterx@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add an unit test to verify the recent mmap_changing ABI breakage.

Note that I used some tricks here and there to make the test simple, e.g. I
abused UFFDIO_MOVE on top of shmem with the fact that I know what I want to
test will be even earlier than the vma type check.  Rich comments were
added to explain trivial details.

Before that fix, -EAGAIN would have been written to the copy field most of
the time but not always; the test should be able to reliably trigger the
outlier case. After the fix, it's written always, the test verifies that
making sure corresponding field (e.g. copy.copy for UFFDIO_COPY) is updated.

Signed-off-by: Peter Xu <peterx@redhat.com>
---
 tools/testing/selftests/mm/uffd-unit-tests.c | 203 +++++++++++++++++++
 1 file changed, 203 insertions(+)

diff --git a/tools/testing/selftests/mm/uffd-unit-tests.c b/tools/testing/selftests/mm/uffd-unit-tests.c
index e8fd9011c2a3..e3b5046d02d8 100644
--- a/tools/testing/selftests/mm/uffd-unit-tests.c
+++ b/tools/testing/selftests/mm/uffd-unit-tests.c
@@ -1231,6 +1231,183 @@ static void uffd_move_pmd_split_test(uffd_test_args_t *targs)
 			      uffd_move_pmd_handle_fault);
 }
 
+static bool
+uffdio_verify_results(const char *name, int ret, int error, long result)
+{
+	/*
+	 * Should always return -1 with errno=EAGAIN, with corresponding
+	 * result field updated in ioctl() args to be -EAGAIN too
+	 * (e.g. copy.copy field for UFFDIO_COPY).
+	 */
+	if (ret != -1) {
+		uffd_test_fail("%s should have returned -1", name);
+		return false;
+	}
+
+	if (error != EAGAIN) {
+		uffd_test_fail("%s should have errno==EAGAIN", name);
+		return false;
+	}
+
+	if (result != -EAGAIN) {
+		uffd_test_fail("%s should have been updated for -EAGAIN",
+			       name);
+		return false;
+	}
+
+	return true;
+}
+
+/*
+ * This defines a function to test one ioctl.  Note that here "field" can
+ * be 1 or anything not -EAGAIN.  With that initial value set, we can
+ * verify later that it should be updated by kernel (when -EAGAIN
+ * returned), by checking whether it is also updated to -EAGAIN.
+ */
+#define DEFINE_MMAP_CHANGING_TEST(name, ioctl_name, field)		\
+	static bool uffdio_mmap_changing_test_##name(int fd)		\
+	{								\
+		int ret;						\
+		struct uffdio_##name args = {				\
+			.field = 1,					\
+		};							\
+		ret = ioctl(fd, ioctl_name, &args);			\
+		return uffdio_verify_results(#ioctl_name, ret, errno, args.field); \
+	}
+
+DEFINE_MMAP_CHANGING_TEST(zeropage, UFFDIO_ZEROPAGE, zeropage)
+DEFINE_MMAP_CHANGING_TEST(copy, UFFDIO_COPY, copy)
+DEFINE_MMAP_CHANGING_TEST(move, UFFDIO_MOVE, move)
+DEFINE_MMAP_CHANGING_TEST(poison, UFFDIO_POISON, updated)
+DEFINE_MMAP_CHANGING_TEST(continue, UFFDIO_CONTINUE, mapped)
+
+typedef enum {
+	/* We actually do not care about any state except UNINTERRUPTIBLE.. */
+	THR_STATE_UNKNOWN = 0,
+	THR_STATE_UNINTERRUPTIBLE,
+} thread_state;
+
+static void sleep_short(void)
+{
+	usleep(1000);
+}
+
+static thread_state thread_state_get(pid_t tid)
+{
+	const char *header = "State:\t";
+	char tmp[256], *p, c;
+	FILE *fp;
+
+	snprintf(tmp, sizeof(tmp), "/proc/%d/status", tid);
+	fp = fopen(tmp, "r");
+
+	if (!fp) {
+		return THR_STATE_UNKNOWN;
+	}
+
+	while (fgets(tmp, sizeof(tmp), fp)) {
+		p = strstr(tmp, header);
+		if (p) {
+			/* For example, "State:\tD (disk sleep)" */
+			c = *(p + sizeof(header) - 1);
+			return c == 'D' ?
+			    THR_STATE_UNINTERRUPTIBLE : THR_STATE_UNKNOWN;
+		}
+	}
+
+	return THR_STATE_UNKNOWN;
+}
+
+static void thread_state_until(pid_t tid, thread_state state)
+{
+	thread_state s;
+
+	do {
+		s = thread_state_get(tid);
+		sleep_short();
+	} while (s != state);
+}
+
+static void *uffd_mmap_changing_thread(void *opaque)
+{
+	volatile pid_t *pid = opaque;
+	int ret;
+
+	/* Unfortunately, it's only fetch-able from the thread itself.. */
+	assert(*pid == 0);
+	*pid = syscall(SYS_gettid);
+
+	/* Inject an event, this will hang solid until the event read */
+	ret = madvise(area_dst, page_size, MADV_REMOVE);
+	if (ret)
+		err("madvise(MADV_REMOVE) failed");
+
+	return NULL;
+}
+
+static void uffd_consume_message(int fd)
+{
+	struct uffd_msg msg = { 0 };
+
+	while (uffd_read_msg(fd, &msg));
+}
+
+static void uffd_mmap_changing_test(uffd_test_args_t *targs)
+{
+	/*
+	 * This stores the real PID (which can be different from how tid is
+	 * defined..) for the child thread, 0 means not initialized.
+	 */
+	pid_t pid = 0;
+	pthread_t tid;
+	int ret;
+
+	if (uffd_register(uffd, area_dst, nr_pages * page_size,
+			  true, false, false))
+		err("uffd_register() failed");
+
+	/* Create a thread to generate the racy event */
+	ret = pthread_create(&tid, NULL, uffd_mmap_changing_thread, &pid);
+	if (ret)
+		err("pthread_create() failed");
+
+	/*
+	 * Wait until the thread setup the pid.  Use volatile to make sure
+	 * it reads from RAM not regs.
+	 */
+	while (!(volatile pid_t)pid)
+		sleep_short();
+
+	/* Wait until the thread hangs at REMOVE event */
+	thread_state_until(pid, THR_STATE_UNINTERRUPTIBLE);
+
+	if (!uffdio_mmap_changing_test_copy(uffd))
+		return;
+
+	if (!uffdio_mmap_changing_test_zeropage(uffd))
+		return;
+
+	if (!uffdio_mmap_changing_test_move(uffd))
+		return;
+
+	if (!uffdio_mmap_changing_test_poison(uffd))
+		return;
+
+	if (!uffdio_mmap_changing_test_continue(uffd))
+		return;
+
+	/*
+	 * All succeeded above!  Recycle everything.  Start by reading the
+	 * event so as to kick the thread roll again..
+	 */
+	uffd_consume_message(uffd);
+
+	ret = pthread_join(tid, NULL);
+	assert(ret == 0);
+
+	uffd_test_pass();
+}
+
 static int prevent_hugepages(const char **errmsg)
 {
 	/* This should be done before source area is populated */
@@ -1470,6 +1647,32 @@ uffd_test_case_t uffd_tests[] = {
 		.mem_targets = MEM_ALL,
 		.uffd_feature_required = UFFD_FEATURE_POISON,
 	},
+	{
+		.name = "mmap-changing",
+		.uffd_fn = uffd_mmap_changing_test,
+		/*
+		 * There's no point running this test over all mem types as
+		 * they share the same code paths.
+		 *
+		 * Choose shmem for simplicity, because (1) shmem supports
+		 * MINOR mode to cover UFFDIO_CONTINUE, and (2) shmem is
+		 * almost always available (unlike hugetlb).  Here we
+		 * abused SHMEM for UFFDIO_MOVE, but the test we want to
+		 * cover doesn't yet need the correct memory type..
+		 */
+		.mem_targets = MEM_SHMEM,
+		/*
+		 * Any UFFD_FEATURE_EVENT_* should work to trigger the
+		 * race logically, but choose the simplest (REMOVE).
+		 *
+		 * Meanwhile, since we'll cover quite a few new ioctl()s
+		 * (CONTINUE, POISON, MOVE), skip this test for old kernels
+		 * by choosing all of them.
+		 */
+		.uffd_feature_required = UFFD_FEATURE_EVENT_REMOVE |
+		UFFD_FEATURE_MOVE | UFFD_FEATURE_POISON |
+		UFFD_FEATURE_MINOR_SHMEM,
+	},
 };
 
 static void usage(const char *prog)
-- 
2.48.1

