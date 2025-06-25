Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com [209.85.219.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 673DF30AAD7
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 23:19:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750893581; cv=none; b=NHqQNHAMxbzJPoMR9BH5XFYl3qH2uhi2OGhvUVhPwb49/hdJ9nR/4Ne2fa3cAFNmE4z4zAuw/LKWb2egiK5OZE+6QQTKL8aHin7ysD6pCv2zEBFMLUlJ3KXs9rVGObjnOqrrrhdgKqOLHHEVhPXTBAPjiNwDykumrsPk6HDY5es=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750893581; c=relaxed/simple;
	bh=kV/i7WzK++AoKinYUIyGUJOx4XSzNlPUkIXf9Vx78zI=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DGrq7SUl67VxYxoMR7+TlBjqh6JeJeRRvlUmM37S7hV5T0mTiBVPXisC9P7t2KhHwQZDKvbRnRVwWfXdAo1wqUcH3dFO7hWPzRd6YtlGrVr5POnYneC9VVrZQPp+HgjvJxHFOdF/EO1Dz1SZEdUzdwNFuDYb48tPumXMJB2GKjU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen-com.20230601.gappssmtp.com header.i=@soleen-com.20230601.gappssmtp.com header.b=3eNaawZU; arc=none smtp.client-ip=209.85.219.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen-com.20230601.gappssmtp.com header.i=@soleen-com.20230601.gappssmtp.com header.b="3eNaawZU"
Received: by mail-yb1-f179.google.com with SMTP id 3f1490d57ef6-e8600a33792so275635276.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 16:19:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen-com.20230601.gappssmtp.com; s=20230601; t=1750893578; x=1751498378; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hShlI4m6hw+YtxzJd2p960yByHj9Zxa7UX6hlMU7/TY=;
        b=3eNaawZUF+8+5E3roVGA90gE7+yciavql4ETnD9sNyPhsvJicbxHUMo4O1EVAVaysG
         pktjuhw5GVvoLJKoEXObkXFw8ejbC+AWCiAEEvIlAEQgoVFeq7SD4a/qarXrLcvQa+/L
         CSAE0F3yBWRy4oJ8ALJ3ikSTiODg+NkdYJYzc7L/UgC1pEGKjbdafamsUQQfd78mDc8O
         j/Oy+w0KIORdrvVz/aObPq8JIUQMJ6FshkC0lrGdjzfmyLw8hPOEmVcYLQ/cD0JAnwlC
         6/7tNCzYKw/pegg6FBEaOO95r2MXM6Khpg7uqaTkOCT5MeePmlk54Xq4+rPj2owOvVf8
         9XNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750893578; x=1751498378;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hShlI4m6hw+YtxzJd2p960yByHj9Zxa7UX6hlMU7/TY=;
        b=X3IfpnrAaMl9D3uTtrti4nKtp/wdVeMYeAlALuB8ut5DXmRsGI7MIjLm5cWs6I9GlK
         5iw/TBhS2D5zM4u8jfRfykiQmAdGnz+pj6hQ24cBa3Yr3R+Bu2w2Bm02CZU0MZkw+sU+
         eSpvxcdThugTqpeh8cmZ1qFNYHrRmgBCrORaHwKGBEbOzq6lB748rQg/BObosULP+A8Q
         wFvQaP0Svc/eEGlBCr5U2rSDg0q5dO+iO2xCVWRu5YKKhdXrPN+DNUhTDmN/X0WzcAly
         GdhRJOvxBz08BeEPK0adee/qjxO+M3Q2bP/mAJOXyuiLV6WlzzQK42KeNwr/4LbeWEjv
         Usjw==
X-Forwarded-Encrypted: i=1; AJvYcCXr1PLgO4jKmfPpOSEmfUAA3HPeo7CEcXb1CtufNjpU24gWhK44F4Kl47dHBYUxbDxAgNtchGIGbJb/I80=@vger.kernel.org
X-Gm-Message-State: AOJu0YxEV4OQJNaFLrAy0Kp57nfYTWavZa8aY9Mlu42jVwhFn242wV5o
	RNjYf5ZKdlrZFdV5gKdoCqL9iDR8KLL16LMzfB5kCmhNHlYaf4SOS9/9CLczkJUa9IT4MHXTkfR
	phf4qUXA=
X-Gm-Gg: ASbGnctLz49m6Pep8mHiwuFkt4dVRLZSIu741ODq8besZuWDQfFFS5odvfX1rjRm5oC
	gFc5r4WrEk8pvQsAa1DauIWDw9rbPouN97rcfzJxMK7dhLKU+oElymXDY1f+b4K3Kh4zQnkZwab
	UQ8wPIVdURKeMFQqYa7UKuG/U9ORPP+SV6DHrsbbBwioS75j7JxQ+1HXX05QGAkrgrI9jryHR6W
	KWZ4oHayQhvorn5RSNX/taVsJtaJm4qNjWMwJq30trDPvaURmGpAlWXdM/AyFXPvG7U31q9adn7
	Sv9i1D2nrlHV5Eqy4PLx57H7sXq73cVGxB+Ai+eImWCmyhI53XmV0ah1V2OxgjHVsrPzPXkLVd7
	HuUlWRe2n4NKQo4+qgABTSRNybbotBtseBlRvGpg6gJlFEBoU7ugl
X-Google-Smtp-Source: AGHT+IFoGRO0KaLEBii9PY7cTsqu44dj7Ui8YGBIE2T43tz6yuSs4Jx3CDRngKDNI69FsnW2ifBMIg==
X-Received: by 2002:a05:6902:1502:b0:e82:2f98:fbd3 with SMTP id 3f1490d57ef6-e8601776a97mr5709362276.32.1750893578134;
        Wed, 25 Jun 2025 16:19:38 -0700 (PDT)
Received: from soleen.c.googlers.com.com (64.167.245.35.bc.googleusercontent.com. [35.245.167.64])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e842ac5c538sm3942684276.33.2025.06.25.16.19.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 16:19:36 -0700 (PDT)
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
	ptyadav@amazon.de,
	lennart@poettering.net,
	brauner@kernel.org,
	linux-api@vger.kernel.org,
	linux-fsdevel@vger.kernel.org
Subject: [RFC v1 31/32] libluo: introduce luoctl
Date: Wed, 25 Jun 2025 23:18:18 +0000
Message-ID: <20250625231838.1897085-32-pasha.tatashin@soleen.com>
X-Mailer: git-send-email 2.50.0.727.gbf7dc18ff4-goog
In-Reply-To: <20250625231838.1897085-1-pasha.tatashin@soleen.com>
References: <20250625231838.1897085-1-pasha.tatashin@soleen.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Pratyush Yadav <ptyadav@amazon.de>

luoctl is a utility to interact with the LUO state machine. It currently
supports viewing and change the current state of LUO. This can be used
by scripts, tools, or developers to control LUO state during the live
update process.

Example usage:

    $ luoctl state
    normal
    $ luoctl prepare
    $ luoctl state
    prepared
    $ luoctl cancel
    $ luoctl state
    normal

Signed-off-by: Pratyush Yadav <ptyadav@amazon.de>
Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
---
 tools/lib/luo/Makefile       |   6 +-
 tools/lib/luo/cli/.gitignore |   1 +
 tools/lib/luo/cli/Makefile   |  18 ++++
 tools/lib/luo/cli/luoctl.c   | 178 +++++++++++++++++++++++++++++++++++
 4 files changed, 202 insertions(+), 1 deletion(-)
 create mode 100644 tools/lib/luo/cli/.gitignore
 create mode 100644 tools/lib/luo/cli/Makefile
 create mode 100644 tools/lib/luo/cli/luoctl.c

diff --git a/tools/lib/luo/Makefile b/tools/lib/luo/Makefile
index e851c37d3d0a..e8f6bd3b9e85 100644
--- a/tools/lib/luo/Makefile
+++ b/tools/lib/luo/Makefile
@@ -13,7 +13,7 @@ LIB_NAME = libluo
 STATIC_LIB = $(LIB_NAME).a
 SHARED_LIB = $(LIB_NAME).so
 
-.PHONY: all clean install
+.PHONY: all clean install cli
 
 all: $(STATIC_LIB) $(SHARED_LIB)
 
@@ -26,8 +26,12 @@ $(SHARED_LIB): $(OBJS)
 %.o: %.c $(HEADERS)
 	$(CC) $(CFLAGS) -c $< -o $@
 
+cli: $(STATIC_LIB)
+	$(MAKE) -C cli
+
 clean:
 	rm -f $(OBJS) $(STATIC_LIB) $(SHARED_LIB)
+	$(MAKE) -C cli clean
 
 install: all
 	install -d $(DESTDIR)/usr/local/lib
diff --git a/tools/lib/luo/cli/.gitignore b/tools/lib/luo/cli/.gitignore
new file mode 100644
index 000000000000..3a5e2d287f60
--- /dev/null
+++ b/tools/lib/luo/cli/.gitignore
@@ -0,0 +1 @@
+/luoctl
diff --git a/tools/lib/luo/cli/Makefile b/tools/lib/luo/cli/Makefile
new file mode 100644
index 000000000000..6c0cbf92a420
--- /dev/null
+++ b/tools/lib/luo/cli/Makefile
@@ -0,0 +1,18 @@
+# SPDX-License-Identifier: LGPL-3.0-or-later
+LUOCTL = luoctl
+INCLUDE_DIR = ../include
+HEADERS = $(wildcard $(INCLUDE_DIR)/*.h)
+
+CC = gcc
+CFLAGS = -Wall -Wextra -O2 -g -I$(INCLUDE_DIR)
+LDFLAGS = -L.. -l:libluo.a
+
+.PHONY: all clean
+
+all: $(LUOCTL)
+
+luoctl: luoctl.c ../libluo.a $(HEADERS)
+	$(CC) $(CFLAGS) -o $@ $< $(LDFLAGS)
+
+clean:
+	rm -f $(LUOCTL)
diff --git a/tools/lib/luo/cli/luoctl.c b/tools/lib/luo/cli/luoctl.c
new file mode 100644
index 000000000000..39ba0bdd44f0
--- /dev/null
+++ b/tools/lib/luo/cli/luoctl.c
@@ -0,0 +1,178 @@
+// SPDX-License-Identifier: LGPL-3.0-or-later
+/**
+ * @file luoctl.c
+ * @brief Simple utility to interact with LUO
+ *
+ * This utility allows viewing and controlling LUO state.
+ *
+ * Copyright (C) 2025 Amazon.com Inc. or its affiliates.
+ * Author: Pratyush Yadav <ptyadav@amazon.de>
+ */
+
+#include <libluo.h>
+#include <stdio.h>
+#include <stdlib.h>
+#include <fcntl.h>
+#include <unistd.h>
+#include <string.h>
+#include <errno.h>
+#include <getopt.h>
+
+#define fatal(fmt, ...)					\
+	do {						\
+		fprintf(stderr, "Error: " fmt, ##__VA_ARGS__);	\
+		exit(1);				\
+	} while (0)
+
+struct command {
+	char *name;
+	int (*handler)(void);
+};
+
+static void usage(const char *prog_name)
+{
+	printf("Usage: %s [command]\n\n", prog_name);
+	printf("Commands:\n");
+	printf("  state         - Show current LUO state\n");
+	printf("  prepare       - Prepare for live update\n");
+	printf("  cancel        - Cancel live update preparation\n");
+	printf("  finish        - Signal completion of restoration\n");
+}
+
+static enum liveupdate_state get_state(void)
+{
+	enum liveupdate_state state;
+	int ret;
+
+	ret = luo_get_state(&state);
+	if (ret)
+		fatal("failed to get LUO state: %s\n", strerror(-ret));
+
+	return state;
+}
+
+static int show_state(void)
+{
+	enum liveupdate_state state;
+
+	state = get_state();
+	printf("%s\n", luo_state_to_string(state));
+	return 0;
+}
+
+static int do_prepare(void)
+{
+	enum liveupdate_state state;
+	int ret;
+
+	state = get_state();
+	if (state != LIVEUPDATE_STATE_NORMAL)
+		fatal("can only switch to prepared state from normal state. Current state: %s\n",
+		      luo_state_to_string(state));
+
+	ret = luo_prepare();
+	if (ret)
+		fatal("failed to prepare for live update: %s\n", strerror(-ret));
+
+	return 0;
+}
+
+static int do_cancel(void)
+{
+	enum liveupdate_state state;
+	int ret;
+
+	state = get_state();
+	if (state != LIVEUPDATE_STATE_PREPARED)
+		fatal("can only cancel from normal state. Current state: %s\n",
+		      luo_state_to_string(state));
+
+	ret = luo_cancel();
+	if (ret)
+		fatal("failed to cancel live update: %s\n", strerror(-ret));
+
+	return 0;
+}
+
+static int do_finish(void)
+{
+	enum liveupdate_state state;
+	int ret;
+
+	state = get_state();
+	if (state != LIVEUPDATE_STATE_UPDATED)
+		fatal("can only finish from updated state. Current state: %s\n",
+		      luo_state_to_string(state));
+
+	ret = luo_finish();
+	if (ret)
+		fatal("failed to finish live update: %s\n", strerror(-ret));
+
+	return 0;
+}
+
+static struct command commands[] = {
+	{"state", show_state},
+	{"prepare", do_prepare},
+	{"cancel", do_cancel},
+	{"finish", do_finish},
+	{NULL, NULL},
+};
+
+int main(int argc, char *argv[])
+{
+	struct option long_options[] = {
+		{"help", no_argument, 0, 'h'},
+		{0, 0, 0, 0}
+	};
+	struct command *command;
+	int ret = -EINVAL, opt;
+	char *cmd;
+
+	if (!luo_is_available()) {
+		fprintf(stderr, "LUO is not available on this system\n");
+		return 1;
+	}
+
+	while ((opt = getopt_long(argc, argv, "ht:e:", long_options, NULL)) != -1) {
+		switch (opt) {
+		case 'h':
+			usage(argv[0]);
+			return 0;
+		default:
+			fprintf(stderr, "Try '%s --help' for more information.\n", argv[0]);
+			return 1;
+		}
+	}
+
+	if (argc - optind != 1) {
+		usage(argv[0]);
+		return 1;
+	}
+
+	cmd = argv[optind];
+
+	ret = luo_init();
+	if (ret < 0) {
+		fprintf(stderr, "Failed to initialize LibLUO: %s\n", strerror(-ret));
+		return 1;
+	}
+
+	command = &commands[0];
+	while (command->name) {
+		if (!strcmp(cmd, command->name)) {
+			ret = command->handler();
+			break;
+		}
+		command++;
+	}
+
+	if (!command->name) {
+		fprintf(stderr, "Unknown command %s. Try '%s --help' for more information\n",
+			cmd, argv[0]);
+		ret = -EINVAL;
+	}
+
+	luo_cleanup();
+	return (ret < 0) ? 1 : 0;
+}
-- 
2.50.0.727.gbf7dc18ff4-goog

