Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44C27136988
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 19:25:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750447559; cv=none; b=rzbG7M0ZPRn5sh9TUC+hzBt9kpf4SqOljOgYNaPHx8OmmSBW4NfbTw+2lP/5iie6QvzT0923R7EXZLUKaPIAaxVsX7cCC63hBDNbMSwZuUtS5xXGyKBGmM+ZsMAKWzm0Q16gDaYKeCzfqOcQ7AHyu6/yDRo1EnGGg7C/E/J7POk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750447559; c=relaxed/simple;
	bh=Vj0GIqZscD75l1pATS56mRe3UwfmZ8krWCaght3Y64s=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=MNDdwGj/xxGFXVnFMU2ZnwlT4uEhSRO838StX1/Q688wTgKSTRM3UXulVhnbLOQD8np51E7TxPfp6MDnIigSvNWSQCsO/BGkBLwrVTNGYlTtuV4uP5a+KjARIQ8GNIZMjlaEZ5abmJnDDP//dSzlsWHgpP8WaX9h74Vokkz6cDg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=r72Pj8pU; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="r72Pj8pU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A56A1C4CEED;
	Fri, 20 Jun 2025 19:25:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750447559;
	bh=Vj0GIqZscD75l1pATS56mRe3UwfmZ8krWCaght3Y64s=;
	h=From:To:Cc:Subject:Date:From;
	b=r72Pj8pUfYeTqUpnaqr4gOJTlIkSjqyObECAH6zGbDomQXXa6GQeCSMSri1aUMV+q
	 hHf8xJZqSMXM6Q0tbyjjNo3KXHmXH9UDYPLBVyFUjn2w7xkwcwRTL6mUot6KMlbgji
	 BZaM/BpGUF6viFNV6Gy/YpOs2iFtVh43rGNwbBkyuEN0HKDZwK1YCDLRlykSFUeG2u
	 9LKzuWzlEQLfeE5XLlrPMEKEHDtB7BuHBKx2MdhBqevypDh8KFy88GBT5bqJPKfjIr
	 3K5fafX2a6pBj1DH5FCYZI+LA2ZrXhqZHsDERVvpCDBKdYFtan2Vgn4SXVn/xxY9pE
	 pO0cbgwSTDyOw==
From: Arnd Bergmann <arnd@kernel.org>
To: Petr Mladek <pmladek@suse.com>,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
	John Ogness <john.ogness@linutronix.de>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Steven Rostedt <rostedt@goodmis.org>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH] printk: kunit: support offstack cpumask
Date: Fri, 20 Jun 2025 21:25:20 +0200
Message-Id: <20250620192554.2234184-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

For large values of CONFIG_NR_CPUS, the newly added kunit test fails
to build:

kernel/printk/printk_ringbuffer_kunit_test.c: In function 'test_readerwriter':
kernel/printk/printk_ringbuffer_kunit_test.c:279:1: error: the frame size of 1432 bytes is larger than 1280 bytes [-Werror=frame-larger-than=]

Change this to use cpumask_var_t and allocate it dynamically when
CONFIG_CPUMASK_OFFSTACK is set.

Fixes: 5ea2bcdfbf46 ("printk: ringbuffer: Add KUnit test")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 kernel/printk/printk_ringbuffer_kunit_test.c | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/kernel/printk/printk_ringbuffer_kunit_test.c b/kernel/printk/printk_ringbuffer_kunit_test.c
index 4081ae051d8e..9f79bc91246e 100644
--- a/kernel/printk/printk_ringbuffer_kunit_test.c
+++ b/kernel/printk/printk_ringbuffer_kunit_test.c
@@ -227,9 +227,12 @@ static void test_readerwriter(struct kunit *test)
 	struct prbtest_thread_data *thread_data;
 	struct prbtest_data *test_data;
 	struct task_struct *thread;
-	cpumask_t test_cpus;
+	cpumask_var_t test_cpus;
 	int cpu, reader_cpu;
 
+	if (alloc_cpumask_var(&test_cpus, GFP_KERNEL))
+		return;
+
 	cpus_read_lock();
 	/*
 	 * Failure of KUNIT_ASSERT() kills the current task
@@ -237,15 +240,15 @@ static void test_readerwriter(struct kunit *test)
 	 * Instead use a snapshot of the online CPUs.
 	 * If they change during test execution it is unfortunate but not a grave error.
 	 */
-	cpumask_copy(&test_cpus, cpu_online_mask);
+	cpumask_copy(test_cpus, cpu_online_mask);
 	cpus_read_unlock();
 
 	/* One CPU is for the reader, all others are writers */
-	reader_cpu = cpumask_first(&test_cpus);
-	if (cpumask_weight(&test_cpus) == 1)
+	reader_cpu = cpumask_first(test_cpus);
+	if (cpumask_weight(test_cpus) == 1)
 		kunit_warn(test, "more than one CPU is recommended");
 	else
-		cpumask_clear_cpu(reader_cpu, &test_cpus);
+		cpumask_clear_cpu(reader_cpu, test_cpus);
 
 	/* KUnit test can get restarted more times. */
 	prbtest_prb_reinit(&test_rb);
@@ -258,7 +261,7 @@ static void test_readerwriter(struct kunit *test)
 
 	kunit_info(test, "running for %lu ms\n", runtime_ms);
 
-	for_each_cpu(cpu, &test_cpus) {
+	for_each_cpu(cpu, test_cpus) {
 		thread_data = kunit_kmalloc(test, sizeof(*thread_data), GFP_KERNEL);
 		KUNIT_ASSERT_NOT_NULL(test, thread_data);
 		thread_data->test_data = test_data;
@@ -276,6 +279,8 @@ static void test_readerwriter(struct kunit *test)
 	prbtest_reader(test_data, runtime_ms);
 
 	kunit_info(test, "completed test\n");
+
+	free_cpumask_var(test_cpus);
 }
 
 static struct kunit_case prb_test_cases[] = {
-- 
2.39.5

