Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16AA278F44
	for <linux-kernel@vger.kernel.org>; Mon,  3 Feb 2025 03:12:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738552361; cv=none; b=QKo3rfn0IWfFHmjp5Q8Mc/5lANP3/I1Ok3gCKHwAqU1Cy1KmFqmFrrJMOrtZRz0GgXGmGOZc4fORNQ8XmyU2KmDHbcBJWNXeBNOJ6foouidQv+hM+SAmyLwm+dEQWv3r/Bc91ULI/T9PXXghJsYGVS/QGGhWuqyVDWvx/ER9moc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738552361; c=relaxed/simple;
	bh=y0YJLkVr4lVblj2gbRQrUKDMiSqBTtuSw0y0f3bXkyk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PGwoVOvpnnlhPEUnw7np88VmYmOaVrShUOjjD2MTjkc+4KxeVSiDAWFQSrW6Q0FDQGPgrEp8e2OO78fgBoaFbE5i0IZDjQqvyV+CwSz2qHL2awWDE8B9xW98dbprjDdXbFhRMkFjhXZmtXwbJc0AmIkny2mfBEInzaAcMYxQamU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=AfNfLCRI; arc=none smtp.client-ip=185.125.188.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="AfNfLCRI"
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 8F1A63F296
	for <linux-kernel@vger.kernel.org>; Mon,  3 Feb 2025 03:12:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1738552356;
	bh=qUPyy33QFnrdvY5sunjgPIPG/eZET6IBKhxsbizwt04=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version;
	b=AfNfLCRIkGhdoMnoFl+H4r1H++fFdHITd4BJa+ed+5plsiHCsQ5mCyB5FtU53ls1a
	 LC0pngP634bhaDIcFt4syWSg7waSHFJyIyYhRv3xuPW9EEHSWZeoSM9vS+0KvnQyWl
	 qdxqFjPW0/SWZwkjZ4ihNwr/eTFokFJryhbUrSsd8XgfDbCZiUCtdD7IWBCHqdY46h
	 kIrPdBKmvvn70Bo695vzDud94mVHkjC3ADKTAhQyzIMc3+V7VoknFZjoEkBdCErpHn
	 XTr6hjjMYHztEaSZCGSKsEzZ5T595qsPFzK6SfxUsr+k/SUc1mI2sNwb1UXlJbwN47
	 +VHFM1exnS9EQ==
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-2efa74481fdso7597749a91.1
        for <linux-kernel@vger.kernel.org>; Sun, 02 Feb 2025 19:12:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738552355; x=1739157155;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qUPyy33QFnrdvY5sunjgPIPG/eZET6IBKhxsbizwt04=;
        b=UJ3jB76I9wGgiZYHLs/L2yPKFWRMIIA8pDGSQ0kqSjW8QC8YaHkLV29SnRUnddPPb+
         O1MuSkFou9J/3B7rCI0PjLzd3u7MFKUrxGiUlORnTGWz0T53rCrm4YjN97SDlbrWnWyN
         BXn2VGoD7LUua1KU4GBTKbxakB4soSfWoZpVqisn0i0qWFVp6PJMW7cSA7iLq9tzdRJV
         HH5xC6x4D0I9TK6XEjBnCkyjeAt3RAfIbclfXor3oIvM12PLnedUVNtaArNJagVl4j0h
         iiapV9hJveojXh0wBI469AFsH3B/9L7nRdpp5y86u5l3lzXQ6cOQSrz5pN6Ign8eZ9KT
         5D0g==
X-Forwarded-Encrypted: i=1; AJvYcCXIu1LzbtFcu2tknpIXhgj5aCDgPeWBtAXseHrP3EAbiOw79L4mg/tpmac/fIwzwS2kpM6nnXhTJR40zOQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzM/RFRGCUQWXna/XVfSLQaVAoKUwG806dKV7meecYMSmdJa6za
	V/4AFpYdPdko6aZrgQwitz7cw5CMyXfA4/BykxJBR6n/G1ZgPBaCphqXyf0zi+6BrBLLtCjwcuc
	EnHkVv1ID7VXhs9fwsOHNI3j4ewyQqH87iieJCyFu/PnJHpyXIfaT4DVhTTI6stzF7GJosnqPsl
	91Ng==
X-Gm-Gg: ASbGncuhNSDorJFLyqQSnLwWdlPXkFvJGRNJ9esqEdRDroT8x7DYTO8clgwP68CU6cS
	om9j7Gen7pId6IjrQLhrnj/cY2zOIOJtX9YFXuLCG4O3FzlPe/l8do+RM3FxQRFkOodztqWA+dR
	q5k/vdlWll6KksirSkNOrj/9XTnmrsuMyasV5tJTpQAoAbJVaEKMpaMfPoHHo7WkEhQLUDnwvca
	4EZqCjYyTDHL44bW2DvTMfBY7nr0ghQcstTCqnjV2mTnjqtMPPOOL7XVQFQHKOzCVdnk3vp/neA
	qR6b
X-Received: by 2002:a17:90b:2b86:b0:2ea:aa56:499 with SMTP id 98e67ed59e1d1-2f83abb3548mr28072774a91.1.1738552354884;
        Sun, 02 Feb 2025 19:12:34 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG3pcG4hSigJFHaXRsDFTRJ6jhVQnd3BgFFQCwgFd5IgOQFhGQLmWOHFqimErndki3gBBYNTw==
X-Received: by 2002:a17:90b:2b86:b0:2ea:aa56:499 with SMTP id 98e67ed59e1d1-2f83abb3548mr28072747a91.1.1738552354219;
        Sun, 02 Feb 2025 19:12:34 -0800 (PST)
Received: from z790sl.. ([240f:74:7be:1:33e1:5e62:5b35:92b])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21de3300253sm65809075ad.162.2025.02.02.19.12.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Feb 2025 19:12:33 -0800 (PST)
From: Koichiro Den <koichiro.den@canonical.com>
To: linux-gpio@vger.kernel.org
Cc: brgl@bgdev.pl,
	geert+renesas@glider.be,
	linus.walleij@linaro.org,
	maciej.borzecki@canonical.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 02/10] gpio: aggregator: introduce basic configfs interface
Date: Mon,  3 Feb 2025 12:12:05 +0900
Message-ID: <20250203031213.399914-3-koichiro.den@canonical.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250203031213.399914-1-koichiro.den@canonical.com>
References: <20250203031213.399914-1-koichiro.den@canonical.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The existing sysfs 'new_device' interface has several limitations:
* No way to determine when GPIO aggregator creation is complete.
* No way to retrieve errors when creating a GPIO aggregator.
* No way to trace a GPIO line of an aggregator back to its
  corresponding physical device.
* The 'new_device' echo does not indicate which virtual gpiochip<N>
  was created.
* No way to assign names to GPIO lines exported through an aggregator.

Introduce the new configfs interface for gpio-aggregator to address
these limitations. It provides a more streamlined, modern, and
extensible configuration method. For backward compatibility, the
'new_device' interface and its behaviour is retained for now.

This commit implements minimal functionalities:

  /config/gpio-aggregator/<name-of-your-choice>/
  /config/gpio-aggregator/<name-of-your-choice>/live
  /config/gpio-aggregator/<name-of-your-choice>/<lineY>/
  /config/gpio-aggregator/<name-of-your-choice>/<lineY>/key
  /config/gpio-aggregator/<name-of-your-choice>/<lineY>/offset

Basic setup flow is:
1. Create a directory for a GPIO aggregator.
2. Create subdirectories for each line you want to instantiate.
3. In each line directory, configure the key and offset.
   The key/offset semantics are as follows:
   * If offset is >= 0:
     - key specifies the name of the chip this GPIO belongs to
     - offset specifies the line offset within that chip.
   * If offset is <0:
     - key needs to specify the GPIO line name.
4. Return to the aggregator's root directory and write '1' to the live
   attribute.

For example, the command in the existing kernel doc:

  echo 'e6052000.gpio 19 e6050000.gpio 20-21' > new_device

is equivalent to:

  mkdir /sys/kernel/config/gpio-aggregator/<custom-name>
  # Change <custom-name> to name of your choice (e.g. "aggr0")
  cd /sys/kernel/config/gpio-aggregator/<custom-name>
  mkdir line0 line1 line2  # Only "line<Y>" naming allowed.
  echo e6052000.gpio > line0/key
  echo 19            > line0/offset
  echo e6050000.gpio > line1/key
  echo 20            > line1/offset
  echo e6050000.gpio > line2/key
  echo 21            > line2/offset
  echo 1             > live

Signed-off-by: Koichiro Den <koichiro.den@canonical.com>
---
 drivers/gpio/gpio-aggregator.c | 549 ++++++++++++++++++++++++++++++++-
 1 file changed, 548 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-aggregator.c b/drivers/gpio/gpio-aggregator.c
index 570cd1ff8cc2..c63cf3067ce7 100644
--- a/drivers/gpio/gpio-aggregator.c
+++ b/drivers/gpio/gpio-aggregator.c
@@ -9,10 +9,14 @@
 
 #include <linux/bitmap.h>
 #include <linux/bitops.h>
+#include <linux/completion.h>
+#include <linux/configfs.h>
 #include <linux/ctype.h>
 #include <linux/delay.h>
 #include <linux/idr.h>
 #include <linux/kernel.h>
+#include <linux/list.h>
+#include <linux/lockdep.h>
 #include <linux/mod_devicetable.h>
 #include <linux/module.h>
 #include <linux/mutex.h>
@@ -34,11 +38,39 @@
  */
 
 struct gpio_aggregator {
+	struct config_group group;
 	struct gpiod_lookup_table *lookups;
 	struct platform_device *pdev;
+	struct mutex lock;
+	int id;
+
+	/* Synchronize with probe */
+	struct notifier_block bus_notifier;
+	struct completion probe_completion;
+	bool driver_bound;
+
+	/* List of gpio_aggregator_line. Always added in order */
+	struct list_head list_head;
+
 	char args[];
 };
 
+struct gpio_aggregator_line {
+	struct config_group group;
+	struct gpio_aggregator *parent;
+	struct list_head entry;
+
+	/* Line index within the aggregator device */
+	int idx;
+
+	/* GPIO chip label or line name */
+	char *key;
+	/* Can be negative to indicate lookup by line name */
+	int offset;
+
+	enum gpio_lookup_flags flags;
+};
+
 static DEFINE_MUTEX(gpio_aggregator_lock);	/* protects idr */
 static DEFINE_IDR(gpio_aggregator_idr);
 
@@ -61,6 +93,97 @@ static int aggr_add_gpio(struct gpio_aggregator *aggr, const char *key,
 	return 0;
 }
 
+static int aggr_notifier_call(struct notifier_block *nb, unsigned long action,
+			      void *data)
+{
+	struct gpio_aggregator *aggr;
+	struct device *dev = data;
+
+	aggr = container_of(nb, struct gpio_aggregator, bus_notifier);
+	if (!device_match_name(dev, aggr->lookups->dev_id))
+		return NOTIFY_DONE;
+
+	switch (action) {
+	case BUS_NOTIFY_BOUND_DRIVER:
+		aggr->driver_bound = true;
+		break;
+	case BUS_NOTIFY_DRIVER_NOT_BOUND:
+		aggr->driver_bound = false;
+		break;
+	default:
+		return NOTIFY_DONE;
+	}
+
+	complete(&aggr->probe_completion);
+	return NOTIFY_OK;
+}
+
+static bool aggr_is_active(struct gpio_aggregator *aggr)
+{
+	lockdep_assert_held(&aggr->lock);
+
+	return !!aggr->pdev && platform_get_drvdata(aggr->pdev);
+}
+
+static size_t aggr_count_lines(struct gpio_aggregator *aggr)
+{
+	lockdep_assert_held(&aggr->lock);
+
+	return list_count_nodes(&aggr->list_head);
+}
+
+static struct gpio_aggregator_line *aggr_line_alloc(
+		struct gpio_aggregator *parent, int idx, char *key, int offset)
+{
+	struct gpio_aggregator_line *line;
+
+	line = kzalloc(sizeof(*line), GFP_KERNEL);
+	if (!line)
+		return ERR_PTR(-ENOMEM);
+
+	if (key) {
+		line->key = kstrdup(key, GFP_KERNEL);
+		if (!line->key) {
+			kfree(line);
+			return ERR_PTR(-ENOMEM);
+		}
+	}
+
+	line->flags = GPIO_LOOKUP_FLAGS_DEFAULT;
+	line->parent = parent;
+	line->idx = idx;
+	line->offset = offset;
+	INIT_LIST_HEAD(&line->entry);
+
+	return line;
+}
+
+static void aggr_line_add(struct gpio_aggregator *aggr,
+			  struct gpio_aggregator_line *line)
+{
+	struct gpio_aggregator_line *tmp;
+
+	lockdep_assert_held(&aggr->lock);
+
+	list_for_each_entry(tmp, &aggr->list_head, entry) {
+		if (WARN_ON(tmp->idx == line->idx))
+			return;
+		if (tmp->idx > line->idx) {
+			list_add_tail(&line->entry, &tmp->entry);
+			return;
+		}
+	}
+	list_add_tail(&line->entry, &aggr->list_head);
+}
+
+static void aggr_line_del(struct gpio_aggregator *aggr,
+			  struct gpio_aggregator_line *line)
+{
+	lockdep_assert_held(&aggr->lock);
+
+	list_del(&line->entry);
+}
+
 
 /*
  *  GPIO Forwarder
@@ -385,6 +508,411 @@ static struct gpiochip_fwd *gpiochip_fwd_create(struct device *dev,
 }
 
 
+/*
+ * Configfs interface
+ */
+
+static struct gpio_aggregator *
+to_gpio_aggregator(struct config_item *item)
+{
+	struct config_group *group = to_config_group(item);
+
+	return container_of(group, struct gpio_aggregator, group);
+}
+
+static struct gpio_aggregator_line *
+to_gpio_aggregator_line(struct config_item *item)
+{
+	struct config_group *group = to_config_group(item);
+
+	return container_of(group, struct gpio_aggregator_line, group);
+}
+
+static int aggr_activate(struct gpio_aggregator *aggr)
+{
+	struct platform_device_info pdevinfo;
+	struct gpio_aggregator_line *line;
+	struct platform_device *pdev;
+	unsigned int n = 0;
+	int ret = 0;
+
+	if (aggr_count_lines(aggr) == 0)
+		return -EINVAL;
+
+	aggr->lookups = kzalloc(struct_size(aggr->lookups, table, 1),
+				GFP_KERNEL);
+	if (!aggr->lookups)
+		return -ENOMEM;
+
+	memset(&pdevinfo, 0, sizeof(pdevinfo));
+	pdevinfo.name = DRV_NAME;
+	pdevinfo.id = aggr->id;
+
+	/* The list is always sorted as new elements are inserted in order. */
+	list_for_each_entry(line, &aggr->list_head, entry) {
+		/*
+		 * - Either GPIO chip label or line name must be configured
+		 *   (i.e. line->key must be non-NULL)
+		 * - Line directories must be named with sequential numeric
+		 *   suffixes starting from 0. (i.e. ./line0, ./line1, ...)
+		 */
+		if (!line->key || line->idx != n) {
+			ret = -EINVAL;
+			goto err_remove_lookups;
+		}
+
+		if (line->offset < 0)
+			ret = aggr_add_gpio(aggr, line->key, U16_MAX, &n);
+		else
+			ret = aggr_add_gpio(aggr, line->key, line->offset, &n);
+		if (ret)
+			goto err_remove_lookups;
+	}
+
+	aggr->lookups->dev_id = kasprintf(GFP_KERNEL, "%s.%d", DRV_NAME, aggr->id);
+	if (!aggr->lookups->dev_id) {
+		ret = -ENOMEM;
+		goto err_remove_lookups;
+	}
+
+	gpiod_add_lookup_table(aggr->lookups);
+
+	reinit_completion(&aggr->probe_completion);
+	aggr->driver_bound = false;
+	aggr->bus_notifier.notifier_call = aggr_notifier_call;
+	bus_register_notifier(&platform_bus_type, &aggr->bus_notifier);
+
+	pdev = platform_device_register_full(&pdevinfo);
+	if (IS_ERR(pdev)) {
+		ret = PTR_ERR(pdev);
+		bus_unregister_notifier(&platform_bus_type, &aggr->bus_notifier);
+		goto err_remove_lookup_table;
+	}
+
+	wait_for_completion(&aggr->probe_completion);
+	bus_unregister_notifier(&platform_bus_type, &aggr->bus_notifier);
+
+	if (!aggr->driver_bound) {
+		ret = -ENXIO;
+		goto err_unregister_pdev;
+	}
+
+	aggr->pdev = pdev;
+	return 0;
+
+err_unregister_pdev:
+	platform_device_unregister(pdev);
+err_remove_lookup_table:
+	kfree(aggr->lookups->dev_id);
+	gpiod_remove_lookup_table(aggr->lookups);
+err_remove_lookups:
+	kfree(aggr->lookups);
+
+	return ret;
+}
+
+static void aggr_deactivate(struct gpio_aggregator *aggr)
+{
+	platform_device_unregister(aggr->pdev);
+	gpiod_remove_lookup_table(aggr->lookups);
+	kfree(aggr->lookups->dev_id);
+	kfree(aggr->lookups);
+	aggr->pdev = NULL;
+}
+
+static void aggr_lockup_configfs(struct gpio_aggregator *aggr, bool lock)
+{
+	struct configfs_subsystem *subsys = aggr->group.cg_subsys;
+	struct gpio_aggregator_line *line;
+
+	/*
+	 * The device only needs to depend on leaf lines. This is
+	 * sufficient to lock up all the configfs entries that the
+	 * instantiated, alive device depends on.
+	 */
+	list_for_each_entry(line, &aggr->list_head, entry) {
+		if (lock)
+			WARN_ON(configfs_depend_item_unlocked(
+					subsys, &line->group.cg_item));
+		else
+			configfs_undepend_item_unlocked(
+					&line->group.cg_item);
+	}
+}
+
+static ssize_t
+gpio_aggr_line_key_show(struct config_item *item, char *page)
+{
+	struct gpio_aggregator_line *line = to_gpio_aggregator_line(item);
+	struct gpio_aggregator *aggr = line->parent;
+
+	guard(mutex)(&aggr->lock);
+
+	return sprintf(page, "%s\n", line->key ?: "");
+}
+
+static ssize_t
+gpio_aggr_line_key_store(struct config_item *item, const char *page,
+			 size_t count)
+{
+	struct gpio_aggregator_line *line = to_gpio_aggregator_line(item);
+	struct gpio_aggregator *aggr = line->parent;
+
+	char *key __free(kfree) = kstrndup(skip_spaces(page), count,
+					   GFP_KERNEL);
+	if (!key)
+		return -ENOMEM;
+
+	strim(key);
+
+	guard(mutex)(&aggr->lock);
+
+	if (aggr_is_active(aggr))
+		return -EBUSY;
+
+	kfree(line->key);
+	line->key = no_free_ptr(key);
+
+	return count;
+}
+
+CONFIGFS_ATTR(gpio_aggr_line_, key);
+
+static ssize_t
+gpio_aggr_line_offset_show(struct config_item *item, char *page)
+{
+	struct gpio_aggregator_line *line = to_gpio_aggregator_line(item);
+	struct gpio_aggregator *aggr = line->parent;
+	unsigned int offset;
+
+	scoped_guard(mutex, &aggr->lock)
+		offset = line->offset;
+
+	return sprintf(page, "%d\n", offset);
+}
+
+static ssize_t
+gpio_aggr_line_offset_store(struct config_item *item, const char *page,
+			    size_t count)
+{
+	struct gpio_aggregator_line *line = to_gpio_aggregator_line(item);
+	struct gpio_aggregator *aggr = line->parent;
+	int offset, ret;
+
+	ret = kstrtoint(page, 0, &offset);
+	if (ret)
+		return ret;
+
+	/*
+	 * Negative number here means: 'key' represents a line name to lookup.
+	 * Non-negative means: 'key' represents the label of the chip with
+	 * the 'offset' value representing the line within that chip.
+	 *
+	 * GPIOLIB uses the U16_MAX value to indicate lookup by line name so
+	 * the greatest offset we can accept is (U16_MAX - 1).
+	 */
+	if (offset > (U16_MAX - 1))
+		return -EINVAL;
+
+	guard(mutex)(&aggr->lock);
+
+	if (aggr_is_active(aggr))
+		return -EBUSY;
+
+	line->offset = offset;
+
+	return count;
+}
+
+CONFIGFS_ATTR(gpio_aggr_line_, offset);
+
+static struct configfs_attribute *gpio_aggr_line_attrs[] = {
+	&gpio_aggr_line_attr_key,
+	&gpio_aggr_line_attr_offset,
+	NULL
+};
+
+static ssize_t
+gpio_aggr_device_live_show(struct config_item *item, char *page)
+{
+	struct gpio_aggregator *aggr = to_gpio_aggregator(item);
+	bool active;
+
+	scoped_guard(mutex, &aggr->lock)
+		active = aggr_is_active(aggr);
+
+	return sprintf(page, "%c\n", active ? '1' : '0');
+}
+
+static ssize_t
+gpio_aggr_device_live_store(struct config_item *item, const char *page,
+			    size_t count)
+{
+	struct gpio_aggregator *aggr = to_gpio_aggregator(item);
+	int ret = 0;
+	bool live;
+
+	ret = kstrtobool(page, &live);
+	if (ret)
+		return ret;
+
+	if (live)
+		aggr_lockup_configfs(aggr, true);
+
+	scoped_guard(mutex, &aggr->lock) {
+		if (live == aggr_is_active(aggr))
+			ret = -EPERM;
+		else if (live)
+			ret = aggr_activate(aggr);
+		else
+			aggr_deactivate(aggr);
+	}
+
+	/*
+	 * Undepend is required only if device disablement (live == 0)
+	 * succeeds or if device enablement (live == 1) fails.
+	 */
+	if (live == !!ret)
+		aggr_lockup_configfs(aggr, false);
+
+	return ret ?: count;
+}
+
+CONFIGFS_ATTR(gpio_aggr_device_, live);
+
+static struct configfs_attribute *gpio_aggr_device_attrs[] = {
+	&gpio_aggr_device_attr_live,
+	NULL
+};
+
+static void
+gpio_aggr_line_release(struct config_item *item)
+{
+	struct gpio_aggregator_line *line = to_gpio_aggregator_line(item);
+	struct gpio_aggregator *aggr = line->parent;
+
+	guard(mutex)(&aggr->lock);
+
+	aggr_line_del(aggr, line);
+	kfree(line->key);
+	kfree(line);
+}
+
+static struct configfs_item_operations gpio_aggr_line_item_ops = {
+	.release	= gpio_aggr_line_release,
+};
+
+static const struct config_item_type gpio_aggr_line_type = {
+	.ct_item_ops	= &gpio_aggr_line_item_ops,
+	.ct_attrs	= gpio_aggr_line_attrs,
+	.ct_owner	= THIS_MODULE,
+};
+
+static void gpio_aggr_device_release(struct config_item *item)
+{
+	struct gpio_aggregator *aggr = to_gpio_aggregator(item);
+
+	guard(mutex)(&aggr->lock);
+
+	if (aggr_is_active(aggr))
+		aggr_deactivate(aggr);
+
+	mutex_destroy(&aggr->lock);
+	idr_remove(&gpio_aggregator_idr, aggr->id);
+	kfree(aggr);
+}
+
+static struct configfs_item_operations gpio_aggr_device_item_ops = {
+	.release	= gpio_aggr_device_release,
+};
+
+static struct config_group *
+gpio_aggr_device_make_group(struct config_group *group, const char *name)
+{
+	struct gpio_aggregator *aggr = to_gpio_aggregator(&group->cg_item);
+	struct gpio_aggregator_line *line;
+	unsigned int idx;
+	int ret, nchar;
+
+	ret = sscanf(name, "line%u%n", &idx, &nchar);
+	if (ret != 1 || nchar != strlen(name))
+		return ERR_PTR(-EINVAL);
+
+	guard(mutex)(&aggr->lock);
+
+	if (aggr_is_active(aggr))
+		return ERR_PTR(-EBUSY);
+
+	list_for_each_entry(line, &aggr->list_head, entry)
+		if (line->idx == idx)
+			return ERR_PTR(-EINVAL);
+
+	line = aggr_line_alloc(aggr, idx, NULL, -1);
+	if (!line)
+		return ERR_PTR(-ENOMEM);
+
+	config_group_init_type_name(&line->group, name, &gpio_aggr_line_type);
+
+	aggr_line_add(aggr, line);
+
+	return &line->group;
+}
+
+static struct configfs_group_operations gpio_aggr_device_group_ops = {
+	.make_group	= gpio_aggr_device_make_group,
+};
+
+static const struct config_item_type gpio_aggr_device_type = {
+	.ct_group_ops	= &gpio_aggr_device_group_ops,
+	.ct_item_ops	= &gpio_aggr_device_item_ops,
+	.ct_attrs	= gpio_aggr_device_attrs,
+	.ct_owner	= THIS_MODULE,
+};
+
+static struct config_group *
+gpio_aggr_make_group(struct config_group *group, const char *name)
+{
+	/* arg space is unneeded */
+	struct gpio_aggregator *aggr = kzalloc(sizeof(*aggr), GFP_KERNEL);
+	if (!aggr)
+		return ERR_PTR(-ENOMEM);
+
+	mutex_lock(&gpio_aggregator_lock);
+	aggr->id = idr_alloc(&gpio_aggregator_idr, aggr, 0, 0, GFP_KERNEL);
+	mutex_unlock(&gpio_aggregator_lock);
+
+	if (aggr->id < 0) {
+		kfree(aggr);
+		return ERR_PTR(aggr->id);
+	}
+
+	INIT_LIST_HEAD(&aggr->list_head);
+	mutex_init(&aggr->lock);
+	config_group_init_type_name(&aggr->group, name, &gpio_aggr_device_type);
+	init_completion(&aggr->probe_completion);
+
+	return &aggr->group;
+}
+
+static struct configfs_group_operations gpio_aggr_group_ops = {
+	.make_group	= gpio_aggr_make_group,
+};
+
+static const struct config_item_type gpio_aggr_type = {
+	.ct_group_ops	= &gpio_aggr_group_ops,
+	.ct_owner	= THIS_MODULE,
+};
+
+static struct configfs_subsystem gpio_aggr_subsys = {
+	.su_group = {
+		.cg_item = {
+			.ci_namebuf	= DRV_NAME,
+			.ci_type	= &gpio_aggr_type,
+		},
+	},
+};
+
+
 /*
  * Sysfs interface
  */
@@ -622,12 +1150,31 @@ static void __exit gpio_aggregator_remove_all(void)
 
 static int __init gpio_aggregator_init(void)
 {
-	return platform_driver_register(&gpio_aggregator_driver);
+	int ret = 0;
+
+	ret = platform_driver_register(&gpio_aggregator_driver);
+	if (ret) {
+		pr_err("Failed to register the platform driver: %d\n", ret);
+		return ret;
+	}
+
+	config_group_init(&gpio_aggr_subsys.su_group);
+	mutex_init(&gpio_aggr_subsys.su_mutex);
+	ret = configfs_register_subsystem(&gpio_aggr_subsys);
+	if (ret) {
+		pr_err("Failed to register the '%s' configfs subsystem: %d\n",
+		       gpio_aggr_subsys.su_group.cg_item.ci_namebuf, ret);
+		mutex_destroy(&gpio_aggr_subsys.su_mutex);
+		platform_driver_unregister(&gpio_aggregator_driver);
+	}
+
+	return ret;
 }
 module_init(gpio_aggregator_init);
 
 static void __exit gpio_aggregator_exit(void)
 {
+	configfs_unregister_subsystem(&gpio_aggr_subsys);
 	gpio_aggregator_remove_all();
 	platform_driver_unregister(&gpio_aggregator_driver);
 }
-- 
2.45.2

