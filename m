Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51FBB22E3EB;
	Thu,  6 Feb 2025 14:19:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738851591; cv=none; b=KwiuEbzA+QVqVoeQJiCt8OoRZ9ufj83ggKtflCTyJ1s5OBZo4LszrRsQ+59dqSkUWDULMLqmdWM1NIXo4D5PYIabJQ94P1JjmYI0E0QCvVR6GTiEGuCWgkGinImc+G3OO7eJC80vJ6YDzndNGkR1gV2VvEL+t0OFXgtGetBm2Y4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738851591; c=relaxed/simple;
	bh=/InIhb094CNnM8lX5BoOag/CFigHkpdhYu7QBebXBU0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GvEtPSVsHIU4bmwoD/ULjVNkvvZGZgR6arIhtxpVr6Ks4Wg3+eigqP1asX+j/V33Owc2qoCCerWTjXAyNs11p0A5azudQmZ3x5UhGJwBlatqco2ItGomrBdBED4RG+KhgCrD35fGaKrDBu5BNqi9oSlJY8FB7sXOMh6TuGBxb4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=S1+/G1AC; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="S1+/G1AC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738851589; x=1770387589;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=/InIhb094CNnM8lX5BoOag/CFigHkpdhYu7QBebXBU0=;
  b=S1+/G1AClCJenmeJ3df597qvPJxnEs4MmpxkSyohGtAuC4ySFWfdnK2/
   6/ZppLe+jyRDof+V+PMjgW6SI6B2SPayXXeeO0C5lEK3OIbLVPbLUjUG7
   uT4jpY2Jwdv3Iz2NmcY25IxUnw8ugg1mSJdUgj1HI8+Jw/fD46YpePcGl
   kGh14bx0aXo1ntYnOUWL5rl+d0rwB60SBrqndSwQ/q7ogNVno+oaVixbB
   yIa63Rg/wrK/fbJsApBnyjSm2aLqiBz0D9BwiRXbWRWEFAm0XPDmNeSa3
   PnCrl+D6S/YSHZe0VFSL6B7FumXB2Kjhpgp6iZ4VNZDnHCDDx+CzbTUY3
   g==;
X-CSE-ConnectionGUID: MPg2pee0Q1mGTao1JovZ3w==
X-CSE-MsgGUID: BBzPeouJRmGQP1q/JGpt0w==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="27056907"
X-IronPort-AV: E=Sophos;i="6.13,264,1732608000"; 
   d="scan'208";a="27056907"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2025 06:19:49 -0800
X-CSE-ConnectionGUID: moSdpfqdRjupldjPrke4+A==
X-CSE-MsgGUID: QHIQEs7OT1urN+UOWNj0ow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="142118107"
Received: from black.fi.intel.com (HELO black.fi.intel.com.) ([10.237.72.28])
  by fmviesa001.fm.intel.com with ESMTP; 06 Feb 2025 06:19:45 -0800
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: =?UTF-8?q?=C5=81ukasz=20Bartosik?= <ukaszb@chromium.org>
Cc: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
	Benson Leung <bleung@chromium.org>,
	Pavan Holla <pholla@chromium.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	"Christian A. Ehrhardt" <lk@c--e.de>,
	Jameson Thies <jthies@google.com>,
	"Katiyar, Pooja" <pooja.katiyar@intel.com>,
	"Pathak, Asutosh" <asutosh.pathak@intel.com>,
	"Jayaraman, Venkat" <venkat.jayaraman@intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 2/2] tools: usb: UCSI command testing tool
Date: Thu,  6 Feb 2025 16:19:32 +0200
Message-ID: <20250206141936.1117222-3-heikki.krogerus@linux.intel.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250206141936.1117222-1-heikki.krogerus@linux.intel.com>
References: <20250206141936.1117222-1-heikki.krogerus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A tool that can be used to send UCSI commands to UCSI
mailboxes. The tool outputs the contents of the mailbox that
result from the command execution.

On most systems there will be only one UCSI interface, but
if the system has for example discrete GPUs with USB Type-C
connectors, each GPU card may expose its own UCSI. All
detected UCSI interfaces can be listed with -l option.

The UCSI interface that the command is meant for can be
optionally specified with -d option. By default, when the
interface is not specified, the first found will used.

Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
---
 tools/usb/.gitignore |   1 +
 tools/usb/Build      |   1 +
 tools/usb/Makefile   |   8 +-
 tools/usb/ucsi.c     | 250 +++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 259 insertions(+), 1 deletion(-)
 create mode 100644 tools/usb/ucsi.c

diff --git a/tools/usb/.gitignore b/tools/usb/.gitignore
index fce1ef5a9267..4645c8a1ca15 100644
--- a/tools/usb/.gitignore
+++ b/tools/usb/.gitignore
@@ -1,3 +1,4 @@
 # SPDX-License-Identifier: GPL-2.0-only
 ffs-test
 testusb
+ucsi
diff --git a/tools/usb/Build b/tools/usb/Build
index 2ad6f9745816..f77e2ed05a63 100644
--- a/tools/usb/Build
+++ b/tools/usb/Build
@@ -1,2 +1,3 @@
 testusb-y += testusb.o
 ffs-test-y += ffs-test.o
+ucsi-y += ucsi.o
diff --git a/tools/usb/Makefile b/tools/usb/Makefile
index c6235667dd46..1670892a6d5a 100644
--- a/tools/usb/Makefile
+++ b/tools/usb/Makefile
@@ -16,7 +16,7 @@ MAKEFLAGS += -r
 override CFLAGS += -O2 -Wall -Wextra -g -D_GNU_SOURCE -I$(OUTPUT)include -I$(srctree)/tools/include
 override LDFLAGS += -lpthread
 
-ALL_TARGETS := testusb ffs-test
+ALL_TARGETS := testusb ffs-test ucsi
 ALL_PROGRAMS := $(patsubst %,$(OUTPUT)%,$(ALL_TARGETS))
 
 all: $(ALL_PROGRAMS)
@@ -36,6 +36,12 @@ $(FFS_TEST_IN): FORCE
 $(OUTPUT)ffs-test: $(FFS_TEST_IN)
 	$(QUIET_LINK)$(CC) $(CFLAGS) $< -o $@ $(LDFLAGS)
 
+UCSI_IN := $(OUTPUT)ucsi-in.o
+$(UCSI_IN): FORCE
+	$(Q)$(MAKE) $(build)=ucsi
+$(OUTPUT)ucsi: $(UCSI_IN)
+	$(QUIET_LINK)$(CC) $(CFLAGS) $< -o $@ $(LDFLAGS)
+
 clean:
 	rm -f $(ALL_PROGRAMS)
 	find $(or $(OUTPUT),.) -name '*.o' -delete -o -name '\.*.d' -delete -o -name '\.*.o.cmd' -delete
diff --git a/tools/usb/ucsi.c b/tools/usb/ucsi.c
new file mode 100644
index 000000000000..4649f3a80d62
--- /dev/null
+++ b/tools/usb/ucsi.c
@@ -0,0 +1,250 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * UCSI command testing tool
+ *
+ * Copyright (C) 2025, Intel Corporation
+ */
+
+#include <dirent.h>
+#include <errno.h>
+#include <fcntl.h>
+#include <stdio.h>
+#include <stdlib.h>
+#include <string.h>
+#include <unistd.h>
+#include <linux/types.h>
+
+/* UCSI data structure field offsets */
+#define UCSI_VERSION			0
+#define UCSI_CCI			4
+#define UCSI_CONTROL			8
+#define UCSI_MESSAGE_IN			16
+
+#define CCI_DATA_LENGTH(cci)		(((cci) >> 8) & 0xff)
+
+static const char *class = "/sys/class/typec";
+static char path[PATH_MAX];
+
+#define MAX_INTERFACES			10
+
+static const char *find_dev(const char *dev, char **arr, size_t arr_size)
+{
+	size_t i;
+
+	for (i = 0; i < arr_size; i++)
+		if (!strcmp(dev, arr[i]))
+			return arr[i];
+	return NULL;
+}
+
+static int ucsi_match(const struct dirent *entry)
+{
+	snprintf(path, sizeof(path), "%s/%s/device/ucsi", class, entry->d_name);
+
+	return !access(path, F_OK);
+}
+
+static int find_devices(char **devs)
+{
+	struct dirent **dirs;
+	int ndevs = 0;
+	char *rpath;
+	int n;
+
+	n = scandir(class, &dirs, ucsi_match, alphasort);
+	if (n <= 0)
+		return 0;
+
+	while (n--) {
+		snprintf(path, sizeof(path), "%s/%s/device",
+			 class, dirs[n]->d_name);
+
+		rpath = realpath(path, NULL);
+
+		if (find_dev(rpath, devs, ndevs)) {
+			free(rpath);
+			continue;
+		}
+
+		devs[ndevs++] = rpath;
+
+		if (ndevs == MAX_INTERFACES) {
+			fprintf(stderr, "maximum number of interfaces reached\n");
+			break;
+		}
+	}
+
+	free(dirs);
+
+	return ndevs;
+}
+
+static int run_command(const char *mb, __u64 command)
+{
+	__u8 data[256] = { };
+	__u32 cci;
+	int ret;
+	int fd;
+	__u8 i;
+
+	snprintf(path, sizeof(path), "%s/ucsi", mb);
+
+	fd = open(path, O_RDWR);
+	if (fd < 0) {
+		fprintf(stderr, "failed to open \'%s\'\n", path);
+		return 1;
+	}
+
+	ret = pwrite(fd, &command, sizeof(command), UCSI_CONTROL);
+	if (ret < 0) {
+		fprintf(stderr, "Failed to send command (%d)\n", ret);
+		goto err;
+	}
+
+	ret = pread(fd, &cci, sizeof(cci), UCSI_CCI);
+	if (ret <= 0) {
+		fprintf(stderr, "failed to read CCI\n");
+		goto err;
+	}
+
+	if (CCI_DATA_LENGTH(cci)) {
+		ret = pread(fd, data, CCI_DATA_LENGTH(cci), UCSI_MESSAGE_IN);
+		if (ret <= 0) {
+			fprintf(stderr, "failed to read MESSAGE_IN (%d)\n", ret);
+			goto err;
+		}
+	}
+
+	/* Print everything. */
+
+	printf("\nCONTROL:\t0x%016llx\n", command);
+	printf("CCI:\t\t0x%08x\n", cci);
+
+	if (CCI_DATA_LENGTH(cci)) {
+		printf("MESSAGE_IN");
+		for (i = 0; i < CCI_DATA_LENGTH(cci); i++) {
+			if (!(i % 8)) {
+				if (i % 16)
+					printf(" ");
+				else
+					printf("\n%08d\t", i ? 10 * 16 / i : 0);
+			}
+			printf("%02x ", data[i]);
+		}
+		printf("\n");
+	}
+err:
+	close(fd);
+	return ret < 0 ? ret : 0;
+}
+
+static int print_version(const char *mb)
+{
+	__u16 version = 0;
+	int ret;
+	int fd;
+
+	snprintf(path, sizeof(path), "%s/ucsi", mb);
+
+	fd = open(path, O_RDONLY);
+	if (fd < 0) {
+		fprintf(stderr, "failed to open \'%s\'\n", path);
+		return fd;
+	}
+	ret = pread(fd, &version, sizeof(version), UCSI_VERSION);
+	close(fd);
+
+	if (ret <= 0) {
+		fprintf(stderr, "\'%s\' -- failed to read version (%d)\n", mb, ret);
+		return ret;
+	}
+
+	printf("%s - UCSI v%u.%u\n", mb,
+	       version >> 8 & 0xff, /* Major */
+	       version >> 4 & 0xf); /* Minor */
+	return 0;
+}
+
+static void usage(const char *name)
+{
+	fprintf(stderr,
+		"Usage: %s -l | [-d INTERFACE] COMMAND\n"
+		"Execute UCSI commands\n\n"
+		"  -l\tlist interfaces (devices)\n"
+		"  -d\tselect interface\n"
+		"  -h\tdisplay this help and exit\n"
+		"\nIf no interface is supplied, the first found is used.\n",
+		name);
+	fprintf(stderr, "Examples:\n"
+		"  %s 0x6      (GET_CAPABILITY)\n"
+		"  %s 0x10007  (GET_CONNECTOR_CAPABILITY)\n",
+		name, name);
+}
+
+int main(int argc, char *argv[])
+{
+	char *devs[MAX_INTERFACES];
+	const char *mb = NULL;
+	__u64 command = 0;
+	int ret = -EINVAL;
+	int n = 0;
+	char *end;
+	int opt;
+	int i;
+
+	n = find_devices(devs);
+
+	while ((opt = getopt(argc, argv, "d:hl")) != -1) {
+		switch (opt) {
+		case 'h':
+			usage(argv[0]);
+			goto out_free;
+		case 'l':
+			for (i = 0; i < n; i++) {
+				print_version(devs[i]);
+				free(devs[i]);
+			}
+			return 0;
+		case 'd':
+			mb = optarg;
+			if (!find_dev(mb, devs, n)) {
+				fprintf(stderr, "\'%s\' is not UCSI\n", mb);
+				goto out_free;
+			}
+			break;
+		default:
+			usage(argv[0]);
+			goto out_free;
+		}
+	}
+
+	if (!n) {
+		fprintf(stderr, "No UCSI found\n");
+		return 1;
+	}
+
+	if (optind >= argc) {
+		usage(argv[0]);
+		goto out_free;
+	}
+
+	command = strtoll(argv[optind], &end, 16);
+	if (errno == ERANGE || end == argv[optind] || *end != '\0') {
+		fprintf(stderr, "invalid command -- \'%s\'\n", argv[optind]);
+		goto out_free;
+	}
+
+	if (!mb)
+		mb = devs[0];
+
+	ret = print_version(mb);
+	if (ret)
+		goto out_free;
+
+	ret = run_command(mb, command);
+out_free:
+	for (i = 0; i < n; i++)
+		free(devs[i]);
+
+	return !!ret;
+}
-- 
2.47.2

