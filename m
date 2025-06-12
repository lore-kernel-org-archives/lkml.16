Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 987EE19CC39
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 17:32:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749749577; cv=none; b=UxYXQqIS+0PTAFKLkniacGZnDSyZ4lL3R0Zs36lBqQUwYGk2k5JBCUJ41b7Q5Rzq5InJXpv6x+5q6Av/DbLG1ct6pK1g8eoVyuTepCOvC7AFiwqPtAgwzLEXR3r/ZAJKJhD12dCYVJALifatnj1H0oUGn3AcsqoMAODWNufH+l8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749749577; c=relaxed/simple;
	bh=UDpRfUl3MwejzZ5ash0tiqc+HPCvauFyWqDaeHqQXmQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=jb6HNHJc9WYQc0InUpIX+25p7z0f42RJDqqJGxTk8dHLV6/73zwccwh9ahK5N0vVy7PULgH0SgSZ3EB/fsp2S2+4th9nJF8FFjhX5RKs8ZeSja6S/HCiSG2AaljwfffIFTLP5+wQA7d5qxDGC1KxGN3IE6s2r9ThsuUCKo8fW84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=A41u1T8R; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="A41u1T8R"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Cc:To:Message-Id:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Subject:Date:From:Sender:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=gJac8DtxuSesbpe3l9bUUezqEv8vHO5T3I22WxZ+Vd8=; b=A41u1T8RPLdRsQDhsqaFaSFq6G
	1HhwdUZqfrLmEi3l3DmAin3IEWSXvdcQ/pWgaLeaKWDcx3k0ISoTGzWlFGW4ym2STnzb4luQhAazg
	n/DgEpDiJ1r06yA+vqRl8zTeAJDIKqDE/YnDnpiisvt+ttfslxOB25ZSQpclv/lciWA0Pao/LmfBC
	dBbwsIun+4ggzaNqSX7wl3M/zSEK4uWis+K+Ybx4shHPES/YxQ13+T+PgoarMD/Rb5oJ83qneKJQO
	ld9KSk5GKZYZY8VC8jnuZkPoe4twJgyAHYPeT3ptRwa3xxloXhBBXrYFThBA3gBeqj+XPA9WpkxXT
	93fhDJ7A==;
Received: from 179-125-79-252-dinamico.pombonet.net.br ([179.125.79.252] helo=[127.0.0.1])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1uPln8-002iro-DS; Thu, 12 Jun 2025 19:32:43 +0200
From: Thadeu Lima de Souza Cascardo <cascardo@igalia.com>
Date: Thu, 12 Jun 2025 14:32:20 -0300
Subject: [PATCH v5] char: misc: add test cases
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250612-misc-dynrange-v5-1-6f35048f7273@igalia.com>
X-B4-Tracking: v=1; b=H4sIACMPS2gC/3XQTY7CMAwF4KtUWRNInKSlrOYeo1mkqQuWaAtJq
 QYh7o4pEr9ilxfre5J9EgkjYRKr7CQijpSo7zi4WSbCxndrlFRzFqDAKaMK2VIKsj52cRrWzoY
 SvEOjS8FmF7Gh/6nv94/zhtLQx+NUP8L191vTCFLJvEFdKgPYFPkPrf2W/Dz0rbhWjeaJ6+U7N
 8xdyJ0qQhUA4YPbB7dg3rllro2pnEcbvF6+8PNts4j7Ax9ouK0nKp9Q8rylYZXxseLUubi/5Ja
 6Q2J9vgDRGhJTZgEAAA==
X-Change-ID: 20250307-misc-dynrange-d54c92a5e319
To: Arnd Bergmann <arnd@arndb.de>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
 Dirk VanDerMerwe <dirk.vandermerwe@sophos.com>, 
 Vimal Agrawal <vimal.agrawal@sophos.com>, linux-kernel@vger.kernel.org, 
 kernel-dev@igalia.com, Thadeu Lima de Souza Cascardo <cascardo@igalia.com>
X-Mailer: b4 0.14.2

Add test cases for static and dynamic minor number allocation and
deallocation.

While at it, improve description and test suite name.

Some of the cases include:

- that static and dynamic allocation reserved the expected minors.

- that registering duplicate minors or duplicate names will fail.

- that failing to create a sysfs file (due to duplicate names) will
  deallocate the dynamic minor correctly.

- that dynamic allocation does not allocate a minor number in the static
  range.

- that there are no collisions when mixing dynamic and static allocations.

- that opening devices with various minor device numbers work.

- that registering a static number in the dynamic range won't conflict with
  a dynamic allocation.

This last test verifies the bug fixed by commit 6d04d2b554b1 ("misc:
misc_minor_alloc to use ida for all dynamic/misc dynamic minors") has not
regressed.

Signed-off-by: Thadeu Lima de Souza Cascardo <cascardo@igalia.com>
---
This improves the miscdevice KUnit test, including a lot of corner cases,
specially ones that would fail before past fixes.

This has been built and tested with different architectures, including
ppc64 (built using its defconfig), riscv, m68k, arm64 and x86_64.
---
Changes in v5:
- Make miscdevice unit test built-in only
- Make unit test require CONFIG_KUNIT=y
- Link to v4: https://lore.kernel.org/r/20250423-misc-dynrange-v4-0-133b5ae4ca18@igalia.com

Changes in v4:
- mark some tests as init-only, since they use init-only symbols
- Link to v3: https://lore.kernel.org/r/20250318-misc-dynrange-v3-0-5c6507cbc2e2@igalia.com

Changes in v3:
- remove code around DYNAMIC_MINORS and the backwards allocation
- try to open devices in tests by using init_mknod plus filp_open
- Link to v2: https://lore.kernel.org/r/20250307-misc-dynrange-v2-0-6fe19032ef76@igalia.com
---
 drivers/misc/misc_minor_kunit.c | 589 +++++++++++++++++++++++++++++++++++++++-
 lib/Kconfig.debug               |   4 +-
 2 files changed, 589 insertions(+), 4 deletions(-)

diff --git a/drivers/misc/misc_minor_kunit.c b/drivers/misc/misc_minor_kunit.c
index 293e0fb7e43edc330842722e1132d16cd23e3aa8..30eceac5f1b6402b0f918af6f56602ed1a6c14ec 100644
--- a/drivers/misc/misc_minor_kunit.c
+++ b/drivers/misc/misc_minor_kunit.c
@@ -3,6 +3,9 @@
 #include <kunit/test-bug.h>
 #include <linux/module.h>
 #include <linux/miscdevice.h>
+#include <linux/fs.h>
+#include <linux/file.h>
+#include <linux/init_syscalls.h>
 
 /* dynamic minor (2) */
 static struct miscdevice dev_dynamic_minor = {
@@ -51,19 +54,601 @@ static void kunit_misc_dynamic_minor(struct kunit *test)
 	misc_deregister(&dev_misc_dynamic_minor);
 }
 
+struct miscdev_test_case {
+	const char *str;
+	int minor;
+};
+
+static struct miscdev_test_case miscdev_test_ranges[] = {
+	{
+		.str = "lower static range, top",
+		.minor = 15,
+	},
+	{
+		.str = "upper static range, bottom",
+		.minor = 130,
+	},
+	{
+		.str = "lower static range, bottom",
+		.minor = 0,
+	},
+	{
+		.str = "upper static range, top",
+		.minor = MISC_DYNAMIC_MINOR - 1,
+	},
+};
+
+KUNIT_ARRAY_PARAM_DESC(miscdev, miscdev_test_ranges, str);
+
+static int miscdev_find_minors(struct kunit_suite *suite)
+{
+	int ret;
+	struct miscdevice miscstat = {
+		.name = "miscstat",
+	};
+	int i;
+
+	for (i = 15; i >= 0; i--) {
+		miscstat.minor = i;
+		ret = misc_register(&miscstat);
+		if (ret == 0)
+			break;
+	}
+
+	if (ret == 0) {
+		kunit_info(suite, "found misc device minor %d available\n",
+				miscstat.minor);
+		miscdev_test_ranges[0].minor = miscstat.minor;
+		misc_deregister(&miscstat);
+	} else {
+		return ret;
+	}
+
+	for (i = 128; i < MISC_DYNAMIC_MINOR; i++) {
+		miscstat.minor = i;
+		ret = misc_register(&miscstat);
+		if (ret == 0)
+			break;
+	}
+
+	if (ret == 0) {
+		kunit_info(suite, "found misc device minor %d available\n",
+				miscstat.minor);
+		miscdev_test_ranges[1].minor = miscstat.minor;
+		misc_deregister(&miscstat);
+	} else {
+		return ret;
+	}
+
+	for (i = 0; i < miscdev_test_ranges[0].minor; i++) {
+		miscstat.minor = i;
+		ret = misc_register(&miscstat);
+		if (ret == 0)
+			break;
+	}
+
+	if (ret == 0) {
+		kunit_info(suite, "found misc device minor %d available\n",
+			miscstat.minor);
+		miscdev_test_ranges[2].minor = miscstat.minor;
+		misc_deregister(&miscstat);
+	} else {
+		return ret;
+	}
+
+	for (i = MISC_DYNAMIC_MINOR - 1; i > miscdev_test_ranges[1].minor; i--) {
+		miscstat.minor = i;
+		ret = misc_register(&miscstat);
+		if (ret == 0)
+			break;
+	}
+
+	if (ret == 0) {
+		kunit_info(suite, "found misc device minor %d available\n",
+			miscstat.minor);
+		miscdev_test_ranges[3].minor = miscstat.minor;
+		misc_deregister(&miscstat);
+	}
+
+	return ret;
+}
+
+static bool is_valid_dynamic_minor(int minor)
+{
+	if (minor < 0)
+		return false;
+	if (minor == MISC_DYNAMIC_MINOR)
+		return false;
+	if (minor >= 0 && minor <= 15)
+		return false;
+	if (minor >= 128 && minor < MISC_DYNAMIC_MINOR)
+		return false;
+	return true;
+}
+
+static int miscdev_test_open(struct inode *inode, struct file *file)
+{
+	return 0;
+}
+
+static const struct file_operations miscdev_test_fops = {
+	.open	= miscdev_test_open,
+};
+
+static void __init miscdev_test_can_open(struct kunit *test, struct miscdevice *misc)
+{
+	int ret;
+	struct file *filp;
+	char *devname;
+
+	devname = kasprintf(GFP_KERNEL, "/dev/%s", misc->name);
+	ret = init_mknod(devname, S_IFCHR | 0600,
+			 new_encode_dev(MKDEV(MISC_MAJOR, misc->minor)));
+	if (ret != 0)
+		KUNIT_FAIL(test, "failed to create node\n");
+
+	filp = filp_open(devname, O_RDONLY, 0);
+	if (IS_ERR_OR_NULL(filp))
+		KUNIT_FAIL(test, "failed to open misc device: %ld\n", PTR_ERR(filp));
+	else
+		fput(filp);
+
+	init_unlink(devname);
+	kfree(devname);
+}
+
+static void __init miscdev_test_static_basic(struct kunit *test)
+{
+	struct miscdevice misc_test = {
+		.name = "misc_test",
+		.fops = &miscdev_test_fops,
+	};
+	int ret;
+	const struct miscdev_test_case *params = test->param_value;
+
+	misc_test.minor = params->minor;
+
+	ret = misc_register(&misc_test);
+	KUNIT_EXPECT_EQ(test, ret, 0);
+	KUNIT_EXPECT_EQ(test, misc_test.minor, params->minor);
+
+	if (ret == 0) {
+		miscdev_test_can_open(test, &misc_test);
+		misc_deregister(&misc_test);
+	}
+}
+
+static void __init miscdev_test_dynamic_basic(struct kunit *test)
+{
+	struct miscdevice misc_test = {
+		.minor = MISC_DYNAMIC_MINOR,
+		.name = "misc_test",
+		.fops = &miscdev_test_fops,
+	};
+	int ret;
+
+	ret = misc_register(&misc_test);
+	KUNIT_EXPECT_EQ(test, ret, 0);
+	KUNIT_EXPECT_TRUE(test, is_valid_dynamic_minor(misc_test.minor));
+
+	if (ret == 0) {
+		miscdev_test_can_open(test, &misc_test);
+		misc_deregister(&misc_test);
+	}
+}
+
+static void miscdev_test_twice(struct kunit *test)
+{
+	struct miscdevice misc_test = {
+		.name = "misc_test",
+		.fops = &miscdev_test_fops,
+	};
+	int ret;
+	const struct miscdev_test_case *params = test->param_value;
+
+	misc_test.minor = params->minor;
+
+	ret = misc_register(&misc_test);
+	KUNIT_EXPECT_EQ(test, ret, 0);
+	KUNIT_EXPECT_EQ(test, misc_test.minor, params->minor);
+	if (ret == 0)
+		misc_deregister(&misc_test);
+
+	ret = misc_register(&misc_test);
+	KUNIT_EXPECT_EQ(test, ret, 0);
+	KUNIT_EXPECT_EQ(test, misc_test.minor, params->minor);
+	if (ret == 0)
+		misc_deregister(&misc_test);
+}
+
+static void miscdev_test_duplicate_minor(struct kunit *test)
+{
+	struct miscdevice misc1 = {
+		.name = "misc1",
+		.fops = &miscdev_test_fops,
+	};
+	struct miscdevice misc2 = {
+		.name = "misc2",
+		.fops = &miscdev_test_fops,
+	};
+	int ret;
+	const struct miscdev_test_case *params = test->param_value;
+
+	misc1.minor = params->minor;
+	misc2.minor = params->minor;
+
+	ret = misc_register(&misc1);
+	KUNIT_EXPECT_EQ(test, ret, 0);
+	KUNIT_EXPECT_EQ(test, misc1.minor, params->minor);
+
+	ret = misc_register(&misc2);
+	KUNIT_EXPECT_EQ(test, ret, -EBUSY);
+	if (ret == 0)
+		misc_deregister(&misc2);
+
+	misc_deregister(&misc1);
+}
+
+static void miscdev_test_duplicate_name(struct kunit *test)
+{
+	struct miscdevice misc1 = {
+		.minor = MISC_DYNAMIC_MINOR,
+		.name = "misc1",
+		.fops = &miscdev_test_fops,
+	};
+	struct miscdevice misc2 = {
+		.minor = MISC_DYNAMIC_MINOR,
+		.name = "misc1",
+		.fops = &miscdev_test_fops,
+	};
+	int ret;
+
+	ret = misc_register(&misc1);
+	KUNIT_EXPECT_EQ(test, ret, 0);
+	KUNIT_EXPECT_TRUE(test, is_valid_dynamic_minor(misc1.minor));
+
+	ret = misc_register(&misc2);
+	KUNIT_EXPECT_EQ(test, ret, -EEXIST);
+	if (ret == 0)
+		misc_deregister(&misc2);
+
+	misc_deregister(&misc1);
+}
+
+/*
+ * Test that after a duplicate name failure, the reserved minor number is
+ * freed to be allocated next.
+ */
+static void miscdev_test_duplicate_name_leak(struct kunit *test)
+{
+	struct miscdevice misc1 = {
+		.minor = MISC_DYNAMIC_MINOR,
+		.name = "misc1",
+		.fops = &miscdev_test_fops,
+	};
+	struct miscdevice misc2 = {
+		.minor = MISC_DYNAMIC_MINOR,
+		.name = "misc1",
+		.fops = &miscdev_test_fops,
+	};
+	struct miscdevice misc3 = {
+		.minor = MISC_DYNAMIC_MINOR,
+		.name = "misc3",
+		.fops = &miscdev_test_fops,
+	};
+	int ret;
+	int dyn_minor;
+
+	ret = misc_register(&misc1);
+	KUNIT_EXPECT_EQ(test, ret, 0);
+	KUNIT_EXPECT_TRUE(test, is_valid_dynamic_minor(misc1.minor));
+
+	/*
+	 * Find out what is the next minor number available.
+	 */
+	ret = misc_register(&misc3);
+	KUNIT_EXPECT_EQ(test, ret, 0);
+	KUNIT_EXPECT_TRUE(test, is_valid_dynamic_minor(misc3.minor));
+	dyn_minor = misc3.minor;
+	misc_deregister(&misc3);
+	misc3.minor = MISC_DYNAMIC_MINOR;
+
+	ret = misc_register(&misc2);
+	KUNIT_EXPECT_EQ(test, ret, -EEXIST);
+	if (ret == 0)
+		misc_deregister(&misc2);
+
+	/*
+	 * Now check that we can still get the same minor we found before.
+	 */
+	ret = misc_register(&misc3);
+	KUNIT_EXPECT_EQ(test, ret, 0);
+	KUNIT_EXPECT_TRUE(test, is_valid_dynamic_minor(misc3.minor));
+	KUNIT_EXPECT_EQ(test, misc3.minor, dyn_minor);
+	misc_deregister(&misc3);
+
+	misc_deregister(&misc1);
+}
+
+/*
+ * Try to register a static minor with a duplicate name. That might not
+ * deallocate the minor, preventing it from being used again.
+ */
+static void miscdev_test_duplicate_error(struct kunit *test)
+{
+	struct miscdevice miscdyn = {
+		.minor = MISC_DYNAMIC_MINOR,
+		.name = "name1",
+		.fops = &miscdev_test_fops,
+	};
+	struct miscdevice miscstat = {
+		.name = "name1",
+		.fops = &miscdev_test_fops,
+	};
+	struct miscdevice miscnew = {
+		.name = "name2",
+		.fops = &miscdev_test_fops,
+	};
+	int ret;
+	const struct miscdev_test_case *params = test->param_value;
+
+	miscstat.minor = params->minor;
+	miscnew.minor = params->minor;
+
+	ret = misc_register(&miscdyn);
+	KUNIT_EXPECT_EQ(test, ret, 0);
+	KUNIT_EXPECT_TRUE(test, is_valid_dynamic_minor(miscdyn.minor));
+
+	ret = misc_register(&miscstat);
+	KUNIT_EXPECT_EQ(test, ret, -EEXIST);
+	if (ret == 0)
+		misc_deregister(&miscstat);
+
+	ret = misc_register(&miscnew);
+	KUNIT_EXPECT_EQ(test, ret, 0);
+	KUNIT_EXPECT_EQ(test, miscnew.minor, params->minor);
+	if (ret == 0)
+		misc_deregister(&miscnew);
+
+	misc_deregister(&miscdyn);
+}
+
+static void __init miscdev_test_dynamic_only_range(struct kunit *test)
+{
+	int ret;
+	struct miscdevice *miscdev;
+	const int dynamic_minors = 256;
+	int i;
+
+	miscdev = kunit_kmalloc_array(test, dynamic_minors,
+					sizeof(struct miscdevice),
+					GFP_KERNEL | __GFP_ZERO);
+
+	for (i = 0; i < dynamic_minors; i++) {
+		miscdev[i].minor = MISC_DYNAMIC_MINOR;
+		miscdev[i].name = kasprintf(GFP_KERNEL, "misc_test%d", i);
+		miscdev[i].fops = &miscdev_test_fops;
+		ret = misc_register(&miscdev[i]);
+		if (ret != 0)
+			break;
+		/*
+		 * This is the bug we are looking for!
+		 * We asked for a dynamic minor and got a minor in the static range space.
+		 */
+		if (miscdev[i].minor >= 0 && miscdev[i].minor <= 15) {
+			KUNIT_FAIL(test, "misc_register allocated minor %d\n", miscdev[i].minor);
+			i++;
+			break;
+		}
+		KUNIT_EXPECT_TRUE(test, is_valid_dynamic_minor(miscdev[i].minor));
+	}
+
+	for (i--; i >= 0; i--) {
+		miscdev_test_can_open(test, &miscdev[i]);
+		misc_deregister(&miscdev[i]);
+		kfree_const(miscdev[i].name);
+	}
+
+	KUNIT_EXPECT_EQ(test, ret, 0);
+}
+
+static void __init miscdev_test_collision(struct kunit *test)
+{
+	int ret;
+	struct miscdevice *miscdev;
+	struct miscdevice miscstat = {
+		.name = "miscstat",
+		.fops = &miscdev_test_fops,
+	};
+	const int dynamic_minors = 256;
+	int i;
+
+	miscdev = kunit_kmalloc_array(test, dynamic_minors,
+					sizeof(struct miscdevice),
+					GFP_KERNEL | __GFP_ZERO);
+
+	miscstat.minor = miscdev_test_ranges[0].minor;
+	ret = misc_register(&miscstat);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+	KUNIT_EXPECT_EQ(test, miscstat.minor, miscdev_test_ranges[0].minor);
+
+	for (i = 0; i < dynamic_minors; i++) {
+		miscdev[i].minor = MISC_DYNAMIC_MINOR;
+		miscdev[i].name = kasprintf(GFP_KERNEL, "misc_test%d", i);
+		miscdev[i].fops = &miscdev_test_fops;
+		ret = misc_register(&miscdev[i]);
+		if (ret != 0)
+			break;
+		KUNIT_EXPECT_TRUE(test, is_valid_dynamic_minor(miscdev[i].minor));
+	}
+
+	for (i--; i >= 0; i--) {
+		miscdev_test_can_open(test, &miscdev[i]);
+		misc_deregister(&miscdev[i]);
+		kfree_const(miscdev[i].name);
+	}
+
+	misc_deregister(&miscstat);
+
+	KUNIT_EXPECT_EQ(test, ret, 0);
+}
+
+static void __init miscdev_test_collision_reverse(struct kunit *test)
+{
+	int ret;
+	struct miscdevice *miscdev;
+	struct miscdevice miscstat = {
+		.name = "miscstat",
+		.fops = &miscdev_test_fops,
+	};
+	const int dynamic_minors = 256;
+	int i;
+
+	miscdev = kunit_kmalloc_array(test, dynamic_minors,
+					sizeof(struct miscdevice),
+					GFP_KERNEL | __GFP_ZERO);
+
+	for (i = 0; i < dynamic_minors; i++) {
+		miscdev[i].minor = MISC_DYNAMIC_MINOR;
+		miscdev[i].name = kasprintf(GFP_KERNEL, "misc_test%d", i);
+		miscdev[i].fops = &miscdev_test_fops;
+		ret = misc_register(&miscdev[i]);
+		if (ret != 0)
+			break;
+		KUNIT_EXPECT_TRUE(test, is_valid_dynamic_minor(miscdev[i].minor));
+	}
+
+	KUNIT_EXPECT_EQ(test, ret, 0);
+
+	miscstat.minor = miscdev_test_ranges[0].minor;
+	ret = misc_register(&miscstat);
+	KUNIT_EXPECT_EQ(test, ret, 0);
+	KUNIT_EXPECT_EQ(test, miscstat.minor, miscdev_test_ranges[0].minor);
+	if (ret == 0)
+		misc_deregister(&miscstat);
+
+	for (i--; i >= 0; i--) {
+		miscdev_test_can_open(test, &miscdev[i]);
+		misc_deregister(&miscdev[i]);
+		kfree_const(miscdev[i].name);
+	}
+}
+
+static void __init miscdev_test_conflict(struct kunit *test)
+{
+	int ret;
+	struct miscdevice miscdyn = {
+		.name = "miscdyn",
+		.minor = MISC_DYNAMIC_MINOR,
+		.fops = &miscdev_test_fops,
+	};
+	struct miscdevice miscstat = {
+		.name = "miscstat",
+		.fops = &miscdev_test_fops,
+	};
+
+	ret = misc_register(&miscdyn);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+	KUNIT_EXPECT_TRUE(test, is_valid_dynamic_minor(miscdyn.minor));
+
+	/*
+	 * Try to register a static minor with the same minor as the
+	 * dynamic one.
+	 */
+	miscstat.minor = miscdyn.minor;
+	ret = misc_register(&miscstat);
+	KUNIT_EXPECT_EQ(test, ret, -EBUSY);
+	if (ret == 0)
+		misc_deregister(&miscstat);
+
+	miscdev_test_can_open(test, &miscdyn);
+
+	misc_deregister(&miscdyn);
+}
+
+static void __init miscdev_test_conflict_reverse(struct kunit *test)
+{
+	int ret;
+	struct miscdevice miscdyn = {
+		.name = "miscdyn",
+		.minor = MISC_DYNAMIC_MINOR,
+		.fops = &miscdev_test_fops,
+	};
+	struct miscdevice miscstat = {
+		.name = "miscstat",
+		.fops = &miscdev_test_fops,
+	};
+
+	/*
+	 * Find the first available dynamic minor to use it as a static
+	 * minor later on.
+	 */
+	ret = misc_register(&miscdyn);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+	KUNIT_EXPECT_TRUE(test, is_valid_dynamic_minor(miscdyn.minor));
+	miscstat.minor = miscdyn.minor;
+	misc_deregister(&miscdyn);
+
+	ret = misc_register(&miscstat);
+	KUNIT_EXPECT_EQ(test, ret, 0);
+	KUNIT_EXPECT_EQ(test, miscstat.minor, miscdyn.minor);
+
+	/*
+	 * Try to register a dynamic minor after registering a static minor
+	 * within the dynamic range. It should work but get a different
+	 * minor.
+	 */
+	miscdyn.minor = MISC_DYNAMIC_MINOR;
+	ret = misc_register(&miscdyn);
+	KUNIT_EXPECT_EQ(test, ret, 0);
+	KUNIT_EXPECT_NE(test, miscdyn.minor, miscstat.minor);
+	KUNIT_EXPECT_TRUE(test, is_valid_dynamic_minor(miscdyn.minor));
+	if (ret == 0)
+		misc_deregister(&miscdyn);
+
+	miscdev_test_can_open(test, &miscstat);
+
+	misc_deregister(&miscstat);
+}
+
 static struct kunit_case test_cases[] = {
 	KUNIT_CASE(kunit_dynamic_minor),
 	KUNIT_CASE(kunit_static_minor),
 	KUNIT_CASE(kunit_misc_dynamic_minor),
+	KUNIT_CASE_PARAM(miscdev_test_twice, miscdev_gen_params),
+	KUNIT_CASE_PARAM(miscdev_test_duplicate_minor, miscdev_gen_params),
+	KUNIT_CASE(miscdev_test_duplicate_name),
+	KUNIT_CASE(miscdev_test_duplicate_name_leak),
+	KUNIT_CASE_PARAM(miscdev_test_duplicate_error, miscdev_gen_params),
 	{}
 };
 
 static struct kunit_suite test_suite = {
-	.name = "misc_minor_test",
+	.name = "miscdev",
+	.suite_init = miscdev_find_minors,
 	.test_cases = test_cases,
 };
 kunit_test_suite(test_suite);
 
+static struct kunit_case __refdata test_init_cases[] = {
+	KUNIT_CASE_PARAM(miscdev_test_static_basic, miscdev_gen_params),
+	KUNIT_CASE(miscdev_test_dynamic_basic),
+	KUNIT_CASE(miscdev_test_dynamic_only_range),
+	KUNIT_CASE(miscdev_test_collision),
+	KUNIT_CASE(miscdev_test_collision_reverse),
+	KUNIT_CASE(miscdev_test_conflict),
+	KUNIT_CASE(miscdev_test_conflict_reverse),
+	{}
+};
+
+static struct kunit_suite test_init_suite = {
+	.name = "miscdev_init",
+	.suite_init = miscdev_find_minors,
+	.test_cases = test_init_cases,
+};
+kunit_test_init_section_suite(test_init_suite);
+
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Vimal Agrawal");
-MODULE_DESCRIPTION("misc minor testing");
+MODULE_AUTHOR("Thadeu Lima de Souza Cascardo <cascardo@igalia.com>");
+MODULE_DESCRIPTION("Test module for misc character devices");
diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
index ebe33181b6e6e0fb4243b400e9187881707efe23..03c0eef3753760eca21a5fb0d0a457f6c2b76b5d 100644
--- a/lib/Kconfig.debug
+++ b/lib/Kconfig.debug
@@ -2506,8 +2506,8 @@ config TEST_IDA
 	tristate "Perform selftest on IDA functions"
 
 config TEST_MISC_MINOR
-	tristate "miscdevice KUnit test" if !KUNIT_ALL_TESTS
-	depends on KUNIT
+	bool "miscdevice KUnit test" if !KUNIT_ALL_TESTS
+	depends on KUNIT=y
 	default KUNIT_ALL_TESTS
 	help
 	  Kunit test for miscdevice API, specially its behavior in respect to

---
base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
change-id: 20250307-misc-dynrange-d54c92a5e319

Best regards,
-- 
Thadeu Lima de Souza Cascardo <cascardo@igalia.com>

