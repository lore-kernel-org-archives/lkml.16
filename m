Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F27371DE3AA;
	Sat, 29 Mar 2025 07:33:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743233601; cv=none; b=BJEfpB0WgIM8aajVK1ASjf4ePZ5/V8igQQ1TDLc0Cxg1kxPMk/w0p6LwpiRixAClyUQmK1hR815dNqQk6gOE23jT9evdgS9iB6XWL7N8qKZOhRrpJmM1OYfp6GAprLuS9e+Dhh8D7Dtokg+PdawndjYfJMbxMSUpEC832yxim40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743233601; c=relaxed/simple;
	bh=ggUHYZAQ/F2EB/vDjA3YNXT/j4PnfZVt5E4Sr0rzvrk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rjjVhceCFTlrYnAMZwTybM3KRBDl5MRVx5awKASpGFxeIXgxsOLCYa26bYnoG7FoC/ihfbn0Ho/x6y9rG5TOrksK9cbOX+dzlxWZJ9RctCMexOcrFZDRMQwuhTJxw+IfGlHW/zbhEdFPNPgQgEp/wsqxV0/17uaPugbmK4kigU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XuM9GjPE; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XuM9GjPE"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-224019ad9edso23694415ad.1;
        Sat, 29 Mar 2025 00:33:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743233599; x=1743838399; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JWhFsh+9qCiKGqocw+5Jw++txcRn+H2RuV9iB960vv0=;
        b=XuM9GjPEB3s7TYK1qYK417nszbomgo0RlJhVrwCY7jjIwhUSSo/s3ceKo2AN86Em9n
         SzHRBHPEcrPU6vWtIEYMmdh5bFKeqC/5w0ZEZa5/yUbO2BfY85lAURJbOACx4runlf/r
         K8/6lsx4yCXZzrw0hi3nEHR4qM46/PD17GNetAQWMCLh/HYsH6RLSIQHIHDKjSuwIuLa
         rQlgYiaxoodyAvT4+rLWGUtvVypmYv38a1Q5OOMcGWxQYsok0r3bQB3J3XBH7WmsOWPE
         DsPamwf6CrDmPzrXe85k1rBGTPpc7HWWh6k8G81K7deFjpRpYyO1/6N0k/V6X+WaUuJk
         Tx0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743233599; x=1743838399;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JWhFsh+9qCiKGqocw+5Jw++txcRn+H2RuV9iB960vv0=;
        b=ILAz7TRpcPEmCuj7hFb5d02eOxVlwxqcugK7wt8uIOBCWo1mTYYWowEeeg097yexvg
         qCwWD8IF9iwEhaJ2sY+OjGqbp4ZRj2qiFtjx0yRaEQEe0AF42WwxkumrGArf4fS9vLnF
         RlbD+lqzBKCaTaHq+Kh6WIM8TSo1Q9/edX9Bp9twwp7TcXckOwn2giO9SiO2naHZMgXV
         mbaKR/VEoNLvnxE+G1u2HfPwjwyFgPNm5pqINEb+cHx96gYHksCsI9RHjRh7ejrTzGOF
         LbORib+RRrpuioXAHiO7HjEoH4yibg6mX2k6eCMh/8n28ygFe1VILkNNQyYmmAZx+rRk
         z+qg==
X-Forwarded-Encrypted: i=1; AJvYcCUdIAVHL7N4v8PfNu3YclrO5hZgwAR52uXfDyZft8x/4yJyuJs1cOf6MxxONwdNONwOfzJfE2IjZfrbYi8=@vger.kernel.org, AJvYcCWV5zqWPThehxwwIFOz0S12Ve5kK/ODapnwMVw4G4VEfUR3sc0qOJkrmJeJdnsbqow13oe3fEuDUXo5SE9OaoxcLfYCxQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YygQx1xAdzoTr6sTTNtdkL1H3U7Ekc/YEdkk8ONRRddpwSKLqPa
	wnf2k002OVSH2ftku99vEmTT59BNqYsi1rrWmrTaCIRJBIGyEZaw
X-Gm-Gg: ASbGncuZbLUecvE+JjeU+Ehr3H/NBww1gDoBfESgdmzeI5zOl4HHfZqwFCcFOVrh14w
	4j/8kH2MA3X5hQK6nE3J8nfcvXoo14hjJlkjTrbGcM1TXJCkO6n5tRPoT7AfcvbqszX5jXMso/r
	qfpX9rjCsOvuPp0admd6F5KvcqHc91WJpzmuim1ilEE/8wwaR6O+lXAJAHEdxHFsHfuobs6gnh6
	WKiftGWklvMQM8hfpjlYz2Fculr6XGJcQVfMdEB21zPOhmyUCdSLGZTmyBb6m+8Dwo93jOTO++p
	mfX+ynYPfI1ia/cXeBNTKoiQpoyCL9iVHjRp7p3toYcXuQqGZmKYmaU=
X-Google-Smtp-Source: AGHT+IFfgjZDYwZLLYvjQ8WtIUjPjJxfnwr5GJ9xJamdaHy4Qj9ulq8T43yUy++SigKOp6SdsIj2Bw==
X-Received: by 2002:a17:902:f709:b0:224:7a4:b2a with SMTP id d9443c01a7336-2292f942aa8mr36389425ad.11.1743233598871;
        Sat, 29 Mar 2025 00:33:18 -0700 (PDT)
Received: from [192.168.1.26] ([181.91.133.137])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2291eedea62sm30257645ad.55.2025.03.29.00.33.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Mar 2025 00:33:18 -0700 (PDT)
From: Kurt Borja <kuurtb@gmail.com>
Date: Sat, 29 Mar 2025 04:32:26 -0300
Subject: [PATCH v7 09/12] platform/x86: alienware-wmi-wmax: Add a DebugFS
 interface
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250329-hwm-v7-9-a14ea39d8a94@gmail.com>
References: <20250329-hwm-v7-0-a14ea39d8a94@gmail.com>
In-Reply-To: <20250329-hwm-v7-0-a14ea39d8a94@gmail.com>
To: =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Armin Wolf <W_Armin@gmx.de>
Cc: Kurt Borja <kuurtb@gmail.com>, Hans de Goede <hdegoede@redhat.com>, 
 platform-driver-x86@vger.kernel.org, Dell.Client.Kernel@dell.com, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2

Add a debugfs interface which exposes thermal private data.

Reviewed-by: Armin Wolf <W_Armin@gmx.de>
Signed-off-by: Kurt Borja <kuurtb@gmail.com>
---
 drivers/platform/x86/dell/alienware-wmi-wmax.c | 90 ++++++++++++++++++++++++++
 1 file changed, 90 insertions(+)

diff --git a/drivers/platform/x86/dell/alienware-wmi-wmax.c b/drivers/platform/x86/dell/alienware-wmi-wmax.c
index 6caf3470d7e15e87540b7d933ad74e9877d6ebab..faeddfe3b79e0aa51e7c8c6b23aa4ac5c7218706 100644
--- a/drivers/platform/x86/dell/alienware-wmi-wmax.c
+++ b/drivers/platform/x86/dell/alienware-wmi-wmax.c
@@ -12,6 +12,7 @@
 #include <linux/bitfield.h>
 #include <linux/bitmap.h>
 #include <linux/bits.h>
+#include <linux/debugfs.h>
 #include <linux/dmi.h>
 #include <linux/hwmon.h>
 #include <linux/hwmon-sysfs.h>
@@ -20,6 +21,7 @@
 #include <linux/moduleparam.h>
 #include <linux/platform_profile.h>
 #include <linux/pm.h>
+#include <linux/seq_file.h>
 #include <linux/units.h>
 #include <linux/wmi.h>
 #include "alienware-wmi.h"
@@ -1259,6 +1261,92 @@ static int awcc_platform_profile_init(struct wmi_device *wdev)
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
+	const struct awcc_fan_data *fan;
+	unsigned int bit;
+
+	seq_printf(seq, "Number of fans: %u\n", priv->fan_count);
+	seq_printf(seq, "Number of temperature sensors: %u\n\n", priv->temp_count);
+
+	for (u32 i = 0; i < priv->fan_count; i++) {
+		fan = priv->fan_data[i];
+
+		seq_printf(seq, "Fan %u:\n", i);
+		seq_printf(seq, "  ID: 0x%02x\n", fan->id);
+		seq_printf(seq, "  Related temperature sensors bitmap: %lu\n",
+			   fan->auto_channels_temp);
+	}
+
+	seq_puts(seq, "\nTemperature sensor IDs:\n");
+	for_each_set_bit(bit, priv->temp_sensors, AWCC_ID_BITMAP_SIZE)
+		seq_printf(seq, "  0x%02x\n", bit);
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
+	char name[64];
+
+	scnprintf(name, sizeof(name), "%s-%s", "alienware-wmi", dev_name(&wdev->dev));
+	root = debugfs_create_dir(name, NULL);
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
@@ -1297,6 +1385,8 @@ static int alienware_awcc_setup(struct wmi_device *wdev)
 			return ret;
 	}
 
+	awcc_debugfs_init(wdev);
+
 	return 0;
 }
 

-- 
2.49.0

