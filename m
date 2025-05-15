Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D7C9268C6B
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 18:23:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747333430; cv=none; b=mtwu48aKTVs+5ai9w3/gmz3FaMVdf+qaqAp9aGXAvRzzjvmj9vPeWdPMbU+NFgNFGSXgMkGxndnk0bSCQ65bZnwPacTBAQaZXtaWXcrmu8Nq4LLetWpGP49ets0N9OCel933Hn2/tTB7hW3qFSnDU3WyXeq4f4NGaRV+u+QWIJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747333430; c=relaxed/simple;
	bh=e4Bwg9sSIKzn/lkP2knt8ta1KGa8xV4kwB0HY1L9R14=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KOdCa+EolSDqBNtl/aYdGtOZGMqCGOWgvd4DFL2L5daClhR/kCHXGe71X/js8dxoOOWHvfBEz4QGKeSKb5L0FeMaefTmQy4RBHEuylQHEFILXmHYJW8yr5k5+VBndaqjMq9zSeadNaf+saMqYiLj9RK9A6hc+Xq32V1hKlOmfuQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen-com.20230601.gappssmtp.com header.i=@soleen-com.20230601.gappssmtp.com header.b=je/w6cCD; arc=none smtp.client-ip=209.85.222.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen-com.20230601.gappssmtp.com header.i=@soleen-com.20230601.gappssmtp.com header.b="je/w6cCD"
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-7c597760323so130476685a.3
        for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 11:23:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen-com.20230601.gappssmtp.com; s=20230601; t=1747333427; x=1747938227; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OgbqJ8uAFqaQzUPM6Yfuc1QdySf2ZJmkbP3YXxkM1A8=;
        b=je/w6cCDZnzaRU8t9hz7F5XPYe1b6Ponu/25FoV43HYxxgBIUH6e4cYr+/AcxDxita
         GXfFYDrIveinvrOYccHqxXWAWdneE+1h++jAADH2PTaXAK4INaIcGst14oAFaRBRqlco
         IXj+AhBgYVX3nN5YHMZ2DmL0O1rWOYq+kb1W230Tukq+6CeufVrtDWg+oBtR9zca3S54
         5+X2besUdNh9bl7ANqQUNy3bqPve2pRrmOSSDSECAQNxoGEzqMXIiAGMGKChqWBWGiil
         n5d0feorzjlV0fgJ3C0qPDNtwWDUCyKM3Awwfu1qm4UE0EhPMHauxppONOBWFV1kLWG/
         q4SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747333427; x=1747938227;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OgbqJ8uAFqaQzUPM6Yfuc1QdySf2ZJmkbP3YXxkM1A8=;
        b=qhQXVPU0TJQUOixqo4WrT0oMOT6PM+jscLgyM2yIbABOUWojPeuk1cMp32s6Er/98E
         LCoZcP7bcbtEmuoUtHAwkCVviiIVm48l6vfH3WSuoPCuVPwvcL5Rc0jz80gOPoaUdh+0
         PCYCZG6Qou156ATdUcMi963X/yJEZmIMyMBs7IG97Mmbd/Yb5GkwdesxBuTxf5kf5UT3
         GT0s6MrEelTlBVsy2QB0ZIzwMn2TKtru54lE+VAfSGw+OPYX1btV99t2Vrdlp4R2AxEt
         C8i4qwB4edjr+kIPrQU7/B0BE2iVY3NFfMiNqPjTKJf53NXEiY7u+t0fkMNwPjji+aGJ
         YngA==
X-Forwarded-Encrypted: i=1; AJvYcCWlbuv1zhJROyKllrJbx/VlNaF4kFbkhkmLRHF+JVW6W8oSIrKJDaOFzLMxYhIuMJIoPUJcDu1S6DFquDk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwZYXZ99MS1Zm3gb6RcAuC/H8NtVoIfmzSGmr2+1FSVMrKi2+zG
	peMgAXxtgevopEGZX2Yk1noLggdKg72sSU7js48E3UtB+uOWxIKBUd6z4OA9rJCWZ2g=
X-Gm-Gg: ASbGncvVPiSmIU9EaJfJoDSWgsDrl101H+kDhKTPdNGrFTFkO1kWuN7wArLB7vogYBo
	tIr4bnIkEzAU+DNgxRQ8DhEesRm1TNh5k2R6YcaOtC3Vn7eBG7TkBRl8+GU5K2leBkgnVkaApRC
	xbxUr4DMzXBfx/bDrVoex0R4VS4HMQAfIPbyDlSku3vCHbTilcoD6yrDCa34bo4s8Lu5JDPDKmI
	qN3pOwmJ9FMBVF0JruKfWJROI1BjBdzR2UGo8XI0FzSfRsCGoAJUsUY/pRCqVyHcQAvaaOzVlam
	j5tF/two3pchuHJ0tqftZkuqbhVDW4oadaYX7s7QS6epaEc7c3KIJqZERtLVBa4V5pVL0g1xFdv
	Xh7F0tAwV+Ir/ASd5eQWrj1lMLphFVkxbH/m7GqdjLMRQ
X-Google-Smtp-Source: AGHT+IHbo0BqjSV7553DLTOcjGLoeCOmefHo9uBHE4Z501wh+amUmwMVZNZST76DsyUEX0+3rFyCYg==
X-Received: by 2002:a05:620a:2886:b0:7c5:562d:ccf8 with SMTP id af79cd13be357-7cd46707fe4mr91925285a.8.1747333426761;
        Thu, 15 May 2025 11:23:46 -0700 (PDT)
Received: from soleen.c.googlers.com.com (138.200.150.34.bc.googleusercontent.com. [34.150.200.138])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7cd466fc2afsm18218685a.0.2025.05.15.11.23.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 May 2025 11:23:46 -0700 (PDT)
From: Pasha Tatashin <pasha.tatashin@soleen.com>
To: pratyush@kernel.org,
	jasonmiu@google.com,
	graf@amazon.com,
	changyuanl@google.com,
	pasha.tatashin@soleen.com,
	rppt@kernel.org,
	dmatlack@google.com,
	rientjes@google.com,
	corbet@lwn.net,
	rdunlap@infradead.org,
	ilpo.jarvinen@linux.intel.com,
	kanie@linux.alibaba.com,
	ojeda@kernel.org,
	aliceryhl@google.com,
	masahiroy@kernel.org,
	akpm@linux-foundation.org,
	tj@kernel.org,
	yoann.congal@smile.fr,
	mmaurer@google.com,
	roman.gushchin@linux.dev,
	chenridong@huawei.com,
	axboe@kernel.dk,
	mark.rutland@arm.com,
	jannh@google.com,
	vincent.guittot@linaro.org,
	hannes@cmpxchg.org,
	dan.j.williams@intel.com,
	david@redhat.com,
	joel.granados@kernel.org,
	rostedt@goodmis.org,
	anna.schumaker@oracle.com,
	song@kernel.org,
	zhangguopeng@kylinos.cn,
	linux@weissschuh.net,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-mm@kvack.org,
	gregkh@linuxfoundation.org,
	tglx@linutronix.de,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	x86@kernel.org,
	hpa@zytor.com,
	rafael@kernel.org,
	dakr@kernel.org,
	bartosz.golaszewski@linaro.org,
	cw00.choi@samsung.com,
	myungjoo.ham@samsung.com,
	yesanishhere@gmail.com,
	Jonathan.Cameron@huawei.com,
	quic_zijuhu@quicinc.com,
	aleksander.lobakin@intel.com,
	ira.weiny@intel.com,
	andriy.shevchenko@linux.intel.com,
	leon@kernel.org,
	lukas@wunner.de,
	bhelgaas@google.com,
	wagi@kernel.org,
	djeffery@redhat.com,
	stuart.w.hayes@gmail.com,
	ptyadav@amazon.de
Subject: [RFC v2 14/16] selftests/liveupdate: add subsystem/state tests
Date: Thu, 15 May 2025 18:23:18 +0000
Message-ID: <20250515182322.117840-15-pasha.tatashin@soleen.com>
X-Mailer: git-send-email 2.49.0.1101.gccaa498523-goog
In-Reply-To: <20250515182322.117840-1-pasha.tatashin@soleen.com>
References: <20250515182322.117840-1-pasha.tatashin@soleen.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Introduces a new set of userspace selftests for the LUO. These tests
verify the functionality LUO by using the kernel-side selftest ioctls
provided by the LUO module, primarily focusing on subsystem management
and basic LUO state transitions.

Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
---
 tools/testing/selftests/Makefile              |   1 +
 tools/testing/selftests/liveupdate/.gitignore |   1 +
 tools/testing/selftests/liveupdate/Makefile   |   7 +
 tools/testing/selftests/liveupdate/config     |   6 +
 .../testing/selftests/liveupdate/liveupdate.c | 440 ++++++++++++++++++
 5 files changed, 455 insertions(+)
 create mode 100644 tools/testing/selftests/liveupdate/.gitignore
 create mode 100644 tools/testing/selftests/liveupdate/Makefile
 create mode 100644 tools/testing/selftests/liveupdate/config
 create mode 100644 tools/testing/selftests/liveupdate/liveupdate.c

diff --git a/tools/testing/selftests/Makefile b/tools/testing/selftests/Makefile
index 80fb84fa3cfc..1a96e806a5dd 100644
--- a/tools/testing/selftests/Makefile
+++ b/tools/testing/selftests/Makefile
@@ -52,6 +52,7 @@ TARGETS += kvm
 TARGETS += landlock
 TARGETS += lib
 TARGETS += livepatch
+TARGETS += liveupdate
 TARGETS += lkdtm
 TARGETS += lsm
 TARGETS += membarrier
diff --git a/tools/testing/selftests/liveupdate/.gitignore b/tools/testing/selftests/liveupdate/.gitignore
new file mode 100644
index 000000000000..af6e773cf98f
--- /dev/null
+++ b/tools/testing/selftests/liveupdate/.gitignore
@@ -0,0 +1 @@
+/liveupdate
diff --git a/tools/testing/selftests/liveupdate/Makefile b/tools/testing/selftests/liveupdate/Makefile
new file mode 100644
index 000000000000..2a573c36016e
--- /dev/null
+++ b/tools/testing/selftests/liveupdate/Makefile
@@ -0,0 +1,7 @@
+# SPDX-License-Identifier: GPL-2.0-only
+CFLAGS += -Wall -O2 -Wno-unused-function
+CFLAGS += $(KHDR_INCLUDES)
+
+TEST_GEN_PROGS += liveupdate
+
+include ../lib.mk
diff --git a/tools/testing/selftests/liveupdate/config b/tools/testing/selftests/liveupdate/config
new file mode 100644
index 000000000000..382c85b89570
--- /dev/null
+++ b/tools/testing/selftests/liveupdate/config
@@ -0,0 +1,6 @@
+CONFIG_KEXEC_FILE=y
+CONFIG_KEXEC_HANDOVER=y
+CONFIG_KEXEC_HANDOVER_DEBUG=y
+CONFIG_LIVEUPDATE=y
+CONFIG_LIVEUPDATE_SYSFS_API=y
+CONFIG_LIVEUPDATE_SELFTESTS=y
diff --git a/tools/testing/selftests/liveupdate/liveupdate.c b/tools/testing/selftests/liveupdate/liveupdate.c
new file mode 100644
index 000000000000..0007085e2b96
--- /dev/null
+++ b/tools/testing/selftests/liveupdate/liveupdate.c
@@ -0,0 +1,440 @@
+// SPDX-License-Identifier: GPL-2.0-only
+
+/*
+ * Copyright (c) 2025, Google LLC.
+ * Pasha Tatashin <pasha.tatashin@soleen.com>
+ */
+
+#include <errno.h>
+#include <fcntl.h>
+#include <stdbool.h>
+#include <stdio.h>
+#include <stdlib.h>
+#include <string.h>
+#include <unistd.h>
+
+#include <sys/ioctl.h>
+#include <sys/mman.h>
+
+#include <linux/liveupdate.h>
+
+#include "../kselftest.h"
+#include "../kselftest_harness.h"
+#include "../../../../drivers/misc/liveupdate/luo_selftests.h"
+
+struct subsystem_info {
+	void *data_page;
+	void *verify_page;
+	char test_name[LUO_NAME_LENGTH];
+	bool registered;
+};
+
+FIXTURE(subsystem) {
+	enum liveupdate_state state;
+	int fd;
+	struct subsystem_info si[LUO_MAX_SUBSYSTEMS];
+};
+
+FIXTURE(state) {
+	enum liveupdate_state state;
+	int fd;
+};
+
+#define LUO_DEVICE	"/dev/liveupdate"
+#define LUO_SYSFS_STATE	"/sys/kernel/liveupdate/state"
+static size_t page_size;
+
+const char *const luo_state_str[] = {
+	[LIVEUPDATE_STATE_NORMAL]   = "normal",
+	[LIVEUPDATE_STATE_PREPARED] = "prepared",
+	[LIVEUPDATE_STATE_FROZEN]   = "frozen",
+	[LIVEUPDATE_STATE_UPDATED]  = "updated",
+};
+
+static int run_luo_selftest_cmd(int fd, __u64 cmd_code,
+				struct luo_arg_subsystem *subsys_arg)
+{
+	struct liveupdate_selftest k_arg;
+
+	if (fd < 0) {
+		errno = EBADF;
+		return -1;
+	}
+
+	k_arg.cmd = cmd_code;
+	k_arg.arg = (__u64)(unsigned long)subsys_arg;
+
+	return ioctl(fd, LIVEUPDATE_IOCTL_SELFTESTS, &k_arg);
+}
+
+static int __register_subsystem(int fd, char *name, void *data_page)
+{
+	struct luo_arg_subsystem subsys_arg;
+
+	memset(&subsys_arg, 0, sizeof(subsys_arg));
+	snprintf(subsys_arg.name, LUO_NAME_LENGTH, "%s", name);
+	subsys_arg.data_page = data_page;
+
+	return run_luo_selftest_cmd(fd, LUO_CMD_SUBSYSTEM_REGISTER,
+				    &subsys_arg);
+}
+
+static int __unregister_subsystem(int fd, char *name)
+{
+	struct luo_arg_subsystem subsys_arg;
+
+	memset(&subsys_arg, 0, sizeof(subsys_arg));
+	snprintf(subsys_arg.name, LUO_NAME_LENGTH, "%s", name);
+
+	return run_luo_selftest_cmd(fd, LUO_CMD_SUBSYSTEM_UNREGISTER,
+				    &subsys_arg);
+}
+
+static int get_sysfs_state(void)
+{
+	char buf[64];
+	ssize_t len;
+	int fd, i;
+
+	fd = open(LUO_SYSFS_STATE, O_RDONLY);
+	if (fd < 0) {
+		ksft_print_msg("Failed to open sysfs state file '%s': %s\n",
+			       LUO_SYSFS_STATE, strerror(errno));
+		return -errno;
+	}
+
+	len = read(fd, buf, sizeof(buf) - 1);
+	close(fd);
+
+	if (len <= 0) {
+		ksft_print_msg("Failed to read sysfs state file '%s': %s\n",
+			       LUO_SYSFS_STATE, strerror(errno));
+		return -errno;
+	}
+	if (buf[len - 1] == '\n')
+		buf[len - 1] = '\0';
+	else
+		buf[len] = '\0';
+
+	for (i = 0; i < ARRAY_SIZE(luo_state_str); i++) {
+		if (!strcmp(buf, luo_state_str[i]))
+			return i;
+	}
+
+	return -EIO;
+}
+
+FIXTURE_SETUP(state)
+{
+	page_size = sysconf(_SC_PAGE_SIZE);
+	self->fd = open(LUO_DEVICE, O_RDWR);
+	if (self->fd < 0) {
+		ksft_exit_skip("Setup: Cannot open %s (errno %d).\n",
+			       LUO_DEVICE, errno);
+	}
+	self->state = LIVEUPDATE_STATE_NORMAL;
+}
+
+FIXTURE_TEARDOWN(state)
+{
+	page_size = sysconf(_SC_PAGE_SIZE);
+	if (self->state != LIVEUPDATE_STATE_NORMAL)
+		ioctl(self->fd, LIVEUPDATE_IOCTL_EVENT_CANCEL, NULL);
+	close(self->fd);
+}
+
+FIXTURE_SETUP(subsystem)
+{
+	int i;
+
+	page_size = sysconf(_SC_PAGE_SIZE);
+	memset(&self->si, 0, sizeof(self->si));
+	self->fd = open(LUO_DEVICE, O_RDWR);
+	if (self->fd < 0) {
+		ksft_exit_skip("Setup: Cannot open %s (errno %d).\n",
+			       LUO_DEVICE, errno);
+	}
+	self->state = LIVEUPDATE_STATE_NORMAL;
+
+	for (i = 0; i < LUO_MAX_SUBSYSTEMS; i++) {
+		snprintf(self->si[i].test_name, LUO_NAME_LENGTH,
+			 "ksft_luo_%d.%d", getpid(), i);
+
+		self->si[i].data_page = mmap(NULL, page_size,
+					     PROT_READ | PROT_WRITE,
+					     MAP_PRIVATE | MAP_ANONYMOUS,
+					     -1, 0);
+
+		if (self->si[i].data_page == MAP_FAILED) {
+			ksft_print_msg("Setup: mmap data_page failed\n");
+			goto exit_fail;
+		}
+		memset(self->si[i].data_page, 'A' + i, page_size);
+
+		self->si[i].verify_page = mmap(NULL, page_size,
+					       PROT_READ | PROT_WRITE,
+					       MAP_PRIVATE | MAP_ANONYMOUS,
+					       -1, 0);
+		if (self->si[i].verify_page == MAP_FAILED) {
+			ksft_print_msg("Setup: mmap verify_page failed\n");
+			goto exit_fail;
+		}
+		memset(self->si[i].verify_page, 0, page_size);
+	}
+
+	return;
+exit_fail:
+	close(self->fd);
+
+	for (i = 0; i < LUO_MAX_SUBSYSTEMS; i++) {
+		void *page;
+
+		page = self->si[i].data_page;
+		if (page && page != MAP_FAILED)
+			munmap(page, page_size);
+
+		page = self->si[i].verify_page;
+		if (page && page != MAP_FAILED)
+			munmap(page, page_size);
+	}
+	ksft_exit_fail();
+}
+
+FIXTURE_TEARDOWN(subsystem)
+{
+	int i;
+
+	if (self->state != LIVEUPDATE_STATE_NORMAL)
+		ioctl(self->fd, LIVEUPDATE_IOCTL_EVENT_CANCEL, NULL);
+
+	for (i = 0; i < LUO_MAX_SUBSYSTEMS; i++) {
+		if (self->si[i].registered) {
+			struct luo_arg_subsystem subsys_arg;
+
+			memset(&subsys_arg, 0, sizeof(subsys_arg));
+			snprintf(subsys_arg.name, LUO_NAME_LENGTH, "%s",
+				 self->si[i].test_name);
+			subsys_arg.data_page = NULL;
+			run_luo_selftest_cmd(self->fd, LUO_CMD_SUBSYSTEM_UNREGISTER,
+					     &subsys_arg);
+		}
+		munmap(self->si[i].data_page, page_size);
+		munmap(self->si[i].verify_page, page_size);
+	}
+
+	close(self->fd);
+}
+
+TEST_F(state, normal)
+{
+	enum liveupdate_state state;
+	int ret;
+
+	ret = ioctl(self->fd, LIVEUPDATE_IOCTL_GET_STATE, &state);
+	ASSERT_EQ(0, ret);
+	ASSERT_EQ(state, LIVEUPDATE_STATE_NORMAL);
+}
+
+TEST_F(state, prepared)
+{
+	enum liveupdate_state state;
+	int ret;
+
+	ret = ioctl(self->fd, LIVEUPDATE_IOCTL_EVENT_PREPARE, NULL);
+	ASSERT_EQ(0, ret);
+	self->state = LIVEUPDATE_STATE_PREPARED;
+
+	ret = ioctl(self->fd, LIVEUPDATE_IOCTL_GET_STATE, &state);
+	ASSERT_EQ(0, ret);
+	ASSERT_EQ(state, LIVEUPDATE_STATE_PREPARED);
+
+	ret = ioctl(self->fd, LIVEUPDATE_IOCTL_EVENT_CANCEL, NULL);
+	ASSERT_EQ(0, ret);
+	self->state = LIVEUPDATE_STATE_NORMAL;
+
+	ret = ioctl(self->fd, LIVEUPDATE_IOCTL_GET_STATE, &state);
+	ASSERT_EQ(0, ret);
+	ASSERT_EQ(state, LIVEUPDATE_STATE_NORMAL);
+}
+
+TEST_F(state, sysfs_normal)
+{
+	int state = get_sysfs_state();
+
+	if (state < 0) {
+		if (state == -ENOENT || state == -EACCES) {
+			ksft_test_result_skip("Sysfs state file not accessible (%d)\n",
+					      state);
+			return;
+		}
+	}
+
+	ASSERT_EQ(LIVEUPDATE_STATE_NORMAL, state);
+}
+
+TEST_F(state, sysfs_prepared)
+{
+	int ret, state;
+
+	ret = ioctl(self->fd, LIVEUPDATE_IOCTL_EVENT_PREPARE, NULL);
+	ASSERT_EQ(0, ret);
+	self->state = LIVEUPDATE_STATE_PREPARED;
+
+	state = get_sysfs_state();
+	if (state < 0) {
+		if (state == -ENOENT || state == -EACCES) {
+			ksft_test_result_skip("Sysfs state file not accessible (%d)\n",
+					      state);
+			ioctl(self->fd, LIVEUPDATE_IOCTL_EVENT_CANCEL, NULL);
+			self->state = LIVEUPDATE_STATE_NORMAL;
+			return;
+		}
+	}
+	ASSERT_EQ(LIVEUPDATE_STATE_PREPARED, state);
+
+	ret = ioctl(self->fd, LIVEUPDATE_IOCTL_EVENT_CANCEL, NULL);
+	ASSERT_EQ(0, ret);
+	self->state = LIVEUPDATE_STATE_NORMAL;
+	state = get_sysfs_state();
+	ASSERT_EQ(LIVEUPDATE_STATE_NORMAL, state);
+}
+
+TEST_F(state, sysfs_frozen)
+{
+	int ret, state;
+
+	ret = ioctl(self->fd, LIVEUPDATE_IOCTL_EVENT_PREPARE, NULL);
+	ASSERT_EQ(0, ret);
+	self->state = LIVEUPDATE_STATE_PREPARED;
+
+	state = get_sysfs_state();
+	if (state < 0) {
+		if (state == -ENOENT || state == -EACCES) {
+			ksft_test_result_skip("Sysfs state file not accessible (%d)\n", state);
+			ioctl(self->fd, LIVEUPDATE_IOCTL_EVENT_CANCEL, NULL);
+			self->state = LIVEUPDATE_STATE_NORMAL;
+			return;
+		}
+	}
+	ASSERT_EQ(LIVEUPDATE_STATE_PREPARED, state);
+
+	ret = ioctl(self->fd, LIVEUPDATE_IOCTL_EVENT_FREEZE, NULL);
+	ASSERT_EQ(0, ret);
+	self->state = LIVEUPDATE_STATE_FROZEN;
+	state = get_sysfs_state();
+	ASSERT_EQ(LIVEUPDATE_STATE_FROZEN, state);
+
+	ret = ioctl(self->fd, LIVEUPDATE_IOCTL_EVENT_CANCEL, NULL);
+	ASSERT_EQ(0, ret);
+	self->state = LIVEUPDATE_STATE_NORMAL;
+	state = get_sysfs_state();
+	ASSERT_EQ(LIVEUPDATE_STATE_NORMAL, state);
+}
+
+TEST_F(subsystem, register_unregister)
+{
+	int ret;
+
+	ret = __register_subsystem(self->fd, self->si[0].test_name,
+				   self->si[0].data_page);
+	ASSERT_EQ(0, ret);
+	self->si[0].registered = true;
+
+	ret = __unregister_subsystem(self->fd, self->si[0].test_name);
+	ASSERT_EQ(0, ret);
+	self->si[0].registered = false;
+}
+
+TEST_F(subsystem, double_unregister)
+{
+	int ret;
+
+	ret = __register_subsystem(self->fd, self->si[0].test_name,
+				   self->si[0].data_page);
+	ASSERT_EQ(0, ret);
+	self->si[0].registered = true;
+
+	ret = __unregister_subsystem(self->fd, self->si[0].test_name);
+	ASSERT_EQ(0, ret);
+	self->si[0].registered = false;
+
+	ret = __unregister_subsystem(self->fd, self->si[0].test_name);
+	EXPECT_NE(0, ret);
+	EXPECT_TRUE(errno == EINVAL || errno == ENOENT);
+	self->si[0].registered = false;
+}
+
+TEST_F(subsystem, register_unregister_many)
+{
+	int ret;
+	int i;
+
+	for (i = 0; i < LUO_MAX_SUBSYSTEMS; i++) {
+		ret = __register_subsystem(self->fd, self->si[i].test_name,
+					   self->si[i].data_page);
+		ASSERT_EQ(0, ret);
+		self->si[i].registered = true;
+	}
+
+	for (i = 0; i < LUO_MAX_SUBSYSTEMS; i++) {
+		ret = __unregister_subsystem(self->fd, self->si[i].test_name);
+		ASSERT_EQ(0, ret);
+		self->si[i].registered = false;
+	}
+
+}
+
+TEST_F(subsystem, getdata_verify)
+{
+	enum liveupdate_state state;
+	int ret;
+	int i;
+
+	for (i = 0; i < LUO_MAX_SUBSYSTEMS; i++) {
+		ret = __register_subsystem(self->fd, self->si[i].test_name,
+					   self->si[i].data_page);
+		ASSERT_EQ(0, ret);
+		self->si[i].registered = true;
+	}
+
+	ret = ioctl(self->fd, LIVEUPDATE_IOCTL_EVENT_PREPARE, NULL);
+	ASSERT_EQ(0, ret);
+	self->state = LIVEUPDATE_STATE_PREPARED;
+
+	ret = ioctl(self->fd, LIVEUPDATE_IOCTL_GET_STATE, &state);
+	ASSERT_EQ(0, ret);
+	ASSERT_EQ(state, LIVEUPDATE_STATE_PREPARED);
+
+	for (i = 0; i < LUO_MAX_SUBSYSTEMS; i++) {
+		struct luo_arg_subsystem subsys_arg;
+
+		memset(&subsys_arg, 0, sizeof(subsys_arg));
+		snprintf(subsys_arg.name, LUO_NAME_LENGTH, "%s",
+			 self->si[i].test_name);
+		subsys_arg.data_page = self->si[i].verify_page;
+
+		ret = run_luo_selftest_cmd(self->fd, LUO_CMD_SUBSYSTEM_GETDATA,
+					   &subsys_arg);
+
+		ASSERT_EQ(0, ret);
+		ASSERT_EQ(0, memcmp(self->si[i].data_page,
+				    self->si[i].verify_page,
+				    page_size));
+	}
+
+	ret = ioctl(self->fd, LIVEUPDATE_IOCTL_EVENT_CANCEL, NULL);
+	ASSERT_EQ(0, ret);
+	self->state = LIVEUPDATE_STATE_NORMAL;
+
+	ret = ioctl(self->fd, LIVEUPDATE_IOCTL_GET_STATE, &state);
+	ASSERT_EQ(0, ret);
+	ASSERT_EQ(state, LIVEUPDATE_STATE_NORMAL);
+
+	for (i = 0; i < LUO_MAX_SUBSYSTEMS; i++) {
+		ret = __unregister_subsystem(self->fd, self->si[i].test_name);
+		ASSERT_EQ(0, ret);
+		self->si[i].registered = false;
+	}
+}
+
+TEST_HARNESS_MAIN
-- 
2.49.0.1101.gccaa498523-goog

