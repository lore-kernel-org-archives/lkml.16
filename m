Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com [209.85.219.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C42C61A38E3;
	Sat,  8 Feb 2025 05:17:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738991834; cv=none; b=PgK5SIY99L6uHM/s3d2BYRF5FVyMui7SBppUg7oTynR/tXKmyySWCksMp2COELqh0Bkr5+lWCQeEwtJMjxa4H25PGcQf4EPiYgFhRbM7NOZixnuTMCTkylpIOifYKSrr4PLLvf8J+bX/l5Pgg5Nt1XXYotg1FDJ1ac4xLJx1Xz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738991834; c=relaxed/simple;
	bh=6cgx9dWQkmB0bDgx/OJivmc3zhpAiNjIiuR80NuyyLs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LdmVZmElSCkbAyQDD3ZgyxBj+cKoNSwpZ5+SxoJYwqsV7yXwjCt0L4crQ7vPHVB5aB7PcQ/PGJDa7xTnuFI90BV2YcbIvMwe90DF4zm0Sj+zj5HH5EP457jB3qEh5q3D91X8T9c6N9SizMzWdcW7gzV6kjRJOa8JXL9FuWM2BpE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L9D3w8JM; arc=none smtp.client-ip=209.85.219.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L9D3w8JM"
Received: by mail-yb1-f181.google.com with SMTP id 3f1490d57ef6-e5b41ee3065so1876464276.2;
        Fri, 07 Feb 2025 21:17:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738991832; x=1739596632; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Pl7ZtWZq/gaplGMaiHSUCh/i0QfQVL8MTha2vS8e2cA=;
        b=L9D3w8JMWnTKMyKB+a0QMWr+JqizRYDF5LeTAFUMl7tx7d8Pzpz7BJdPeNGJvyZa6h
         1TVWrzOvLvXDuu6Pktj7elLjkv24f8QowAPwgsVH7MOWqdxOIsyWP0fSIWP6HwnXSJkB
         1J790ZhBrj6hlXky66ivo9r5nXZa9qFa5ENoNE6BG8YuR7dUp6ayJm40KQq+9BOPeNIj
         No5NY+NPgMJsSL8ahSER92CD7A7ubDBhuJnfsB20YbiePJC28pZfyUrSUJcDxo66EQ8q
         Q4NlCNKhT6Sf7evPENBiNYxALu0ul4UxQ0IAoH+HMy3ik10+v94ML6EnhurPb6kBIiSy
         LiZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738991832; x=1739596632;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Pl7ZtWZq/gaplGMaiHSUCh/i0QfQVL8MTha2vS8e2cA=;
        b=vYUtG3FO3ltzU0DouBvjOFfFUsmsvqGuGMq/Fdhp8emlrLIwicPJvx5IqzE8ZaoCTT
         uc0dlWn4opNL8Si8m4YS7XGiNHhutr47V8bKzu+3zXUZlpejtrHVzLehcZAudKpiZsYS
         ezOibLFnxckDfDxnFp1vquM9n2TEQ+r5r/RhJza4Aayj41LwosY/RupPCl7DxU3tTkAl
         zHynZQt/blSZAaXS4SJeOiSsG0pIL0pwSbVuxMg6iWwiQ1z8THZeT3WPyjDsDKDrg6ea
         vMpdiz9wYLwfLTQPYgkTlB354QSr/6oF667jh+AKYW1CWWHCuBeFfF6qnaYIY6ti7FiP
         ehGg==
X-Forwarded-Encrypted: i=1; AJvYcCXftKSzosR+6wg/ydDq/TkRyeKNo9yNSNzVjDiZSq7hNavMhGUtesRo48EdVLioAUScxbP+oVjDUyGdTAA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzhOYX2aDCq2GGtT+Jjvje69Hivo3704JgTdJ30adCT73RVKKyr
	xOOoI5/rPdKrgOCqnSwGziRdNsTNPOKhmIDdc1j6Y3Ntlfm4+SCd
X-Gm-Gg: ASbGncvOj8J6uriD3vDQ3elCqcARGly8qmQRK1qtRSvBOiyyr6aclXHoU2dWFfnedBU
	h1xdvzArHp6pXP9n8ZushkKLwK8QZXItA8uO6HZaiXdcQOb7lv8Zm6dnZ8szYAMzAkMlFv2VZq1
	iFmOs+3DeZ4w77EPEeQLOxgHIP32N5SdPjYl1V46JhMlh9PXGqEpk9nHHnmdC73AIvHAWB5yf3I
	1xDpnZ/LLYMAk7n2egSeBuYP9f0xb5TN2hesiqpYo3cyAqi3YE50p0sAJ7QL1PmzA6shM7cuBdN
	xathoXVpcERT7MdK8BKieaA=
X-Google-Smtp-Source: AGHT+IFDMQmh8Lyz8IkDl/MW45ahBUJiGj89ldN2sxztsCcvc8CJniJj/fN6MhgT9UaIT/WHRpR6zA==
X-Received: by 2002:a05:6902:1706:b0:e58:a25d:5696 with SMTP id 3f1490d57ef6-e5b4629db4bmr5825694276.45.1738991831801;
        Fri, 07 Feb 2025 21:17:11 -0800 (PST)
Received: from localhost.localdomain ([2800:bf0:82:3d2:4207:a956:ebad:2a64])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e5b3a1f00e0sm1207670276.2.2025.02.07.21.17.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2025 21:17:11 -0800 (PST)
From: Kurt Borja <kuurtb@gmail.com>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	"Armin Wolf" <W_Armin@gmx.de>
Cc: platform-driver-x86@vger.kernel.org,
	"Hans de Goede" <hdegoede@redhat.com>,
	Dell.Client.Kernel@dell.com,
	linux-kernel@vger.kernel.org,
	Kurt Borja <kuurtb@gmail.com>
Subject: [PATCH 09/10] platform/x86: alienware-wmi-wmax: Add a DebugFS interface
Date: Sat,  8 Feb 2025 00:16:13 -0500
Message-ID: <20250208051614.10644-10-kuurtb@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250208051614.10644-1-kuurtb@gmail.com>
References: <20250208051614.10644-1-kuurtb@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a debugfs interface which exposes thermal private data.

Signed-off-by: Kurt Borja <kuurtb@gmail.com>
---
 .../platform/x86/dell/alienware-wmi-wmax.c    | 92 +++++++++++++++++++
 1 file changed, 92 insertions(+)

diff --git a/drivers/platform/x86/dell/alienware-wmi-wmax.c b/drivers/platform/x86/dell/alienware-wmi-wmax.c
index 06d6f88ea54b..f20bd9a062a7 100644
--- a/drivers/platform/x86/dell/alienware-wmi-wmax.c
+++ b/drivers/platform/x86/dell/alienware-wmi-wmax.c
@@ -10,6 +10,7 @@
 
 #include <linux/bitfield.h>
 #include <linux/bits.h>
+#include <linux/debugfs.h>
 #include <linux/dmi.h>
 #include <linux/hwmon.h>
 #include <linux/jiffies.h>
@@ -18,6 +19,7 @@
 #include <linux/mutex.h>
 #include <linux/overflow.h>
 #include <linux/platform_profile.h>
+#include <linux/seq_file.h>
 #include <linux/units.h>
 #include <linux/wmi.h>
 #include "alienware-wmi.h"
@@ -1078,6 +1080,94 @@ static int awcc_platform_profile_init(struct wmi_device *wdev)
 	return PTR_ERR_OR_ZERO(priv->ppdev);
 }
 
+/*
+ * DebugFS
+ */
+static int awcc_debugfs_system_description_read(struct seq_file *seq, void *data)
+{
+	struct device *dev = seq->private;
+	struct awcc_priv *priv = dev_get_drvdata(dev);
+
+	seq_printf(seq, "0x%08x\n", priv->system_description);
+
+	return 0;
+}
+
+static int awcc_debugfs_hwmon_data_read(struct seq_file *seq, void *data)
+{
+	struct device *dev = seq->private;
+	struct awcc_priv *priv = dev_get_drvdata(dev);
+	struct awcc_fan_channel_data *fan_data;
+	struct awcc_temp_channel_data *temp_data;
+
+	seq_printf(seq, "Number of fans: %u\n", priv->fan_count);
+	seq_printf(seq, "Number of temperature sensors: %u\n\n", priv->temp_count);
+
+	for (u32 i = 0; i < priv->fan_count; i++) {
+		fan_data = &priv->fan_data[i];
+
+		seq_printf(seq, "Fan %u:\n", i);
+		seq_printf(seq, "  ID: 0x%02x\n", fan_data->id);
+		seq_printf(seq, "  Temperature sensor: 0x%02x\n", fan_data->temp_sensor);
+	}
+
+	seq_puts(seq, "\n");
+
+	for (u32 i = 0; i < priv->temp_count; i++) {
+		temp_data = &priv->temp_data[i];
+
+		seq_printf(seq, "Temperature sensor %u:\n", i);
+		seq_printf(seq, "  ID: 0x%02x\n", temp_data->id);
+	}
+
+	return 0;
+}
+
+static int awcc_debugfs_pprof_data_read(struct seq_file *seq, void *data)
+{
+	struct device *dev = seq->private;
+	struct awcc_priv *priv = dev_get_drvdata(dev);
+
+	seq_printf(seq, "Number of thermal profiles: %u\n\n", priv->profile_count);
+
+	for (u32 i = 0; i < PLATFORM_PROFILE_LAST; i++) {
+		if (!priv->supported_profiles[i])
+			continue;
+
+		seq_printf(seq, "Platform profile %u:\n", i);
+		seq_printf(seq, "  ID: 0x%02x\n", priv->supported_profiles[i]);
+	}
+
+	return 0;
+}
+
+static void awcc_debugfs_remove(void *data)
+{
+	struct dentry *root = data;
+
+	debugfs_remove(root);
+}
+
+static void awcc_debugfs_init(struct wmi_device *wdev)
+{
+	struct dentry *root;
+
+	root = debugfs_create_dir("alienware-wmi", NULL);
+
+	debugfs_create_devm_seqfile(&wdev->dev, "system_description", root,
+				    awcc_debugfs_system_description_read);
+
+	if (awcc->hwmon)
+		debugfs_create_devm_seqfile(&wdev->dev, "hwmon_data", root,
+					    awcc_debugfs_hwmon_data_read);
+
+	if (awcc->pprof)
+		debugfs_create_devm_seqfile(&wdev->dev, "pprof_data", root,
+					    awcc_debugfs_pprof_data_read);
+
+	devm_add_action_or_reset(&wdev->dev, awcc_debugfs_remove, root);
+}
+
 static int alienware_awcc_setup(struct wmi_device *wdev)
 {
 	struct awcc_priv *priv;
@@ -1117,6 +1207,8 @@ static int alienware_awcc_setup(struct wmi_device *wdev)
 			return ret;
 	}
 
+	awcc_debugfs_init(wdev);
+
 	return 0;
 }
 
-- 
2.48.1

