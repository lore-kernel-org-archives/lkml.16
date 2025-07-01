Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6704D27702F
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 11:48:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751370491; cv=none; b=oH4xHnZh+vrIzA+4+CUlfNIWbZ8Tjq38YxbWN3/1WduQVpkubcGmIdmrlLQtPkKFECcpk5zDSjhwMjILuZpnB6u/iREBn/25I8D36gCU8Hkdxz1IGv6UeR9zTa26sGhf03xxjXaIm1RJMus7jWEmF/CFvDwt0c4SkYGllMmHySE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751370491; c=relaxed/simple;
	bh=Z7/Ii4peBn6utUvIuofOs8Xdnqo3YZdslRw7QFE6ddo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sW6ujrkwQxfl4iLJ1PXgwlhOB6frxVL2X+oaXgWyhY0+7XFZcWs6H5eSegwg25kGQIG5cyue5v2TSzPcdz4UwfXKeSTx2UGLu3dww0E03N9pD8Lh0qIP0uXYCor0EwRdp9ovHDLpi20LvWdEF0LNNFMnzcsJkz5USZczxn3x+oY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=B3m7vxFe; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="B3m7vxFe"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-553c31542b1so3663737e87.2
        for <linux-kernel@vger.kernel.org>; Tue, 01 Jul 2025 04:48:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751370487; x=1751975287; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2osz+FDlcrsw62TOPCgoVgngpNoshxMUDCHEG4J5fcg=;
        b=B3m7vxFep2uUvPE2505Hsns3v619IpOzFmKUByMMb4fskPBz2+dN+jjoNPt2CktUMN
         O5WetQxk/spd1xfHHhuLtt01SUrVAECdFNfAyLoEcxbynaJ7u3N3F0MfEe1A4Z2XB8rA
         dePCYQ8MEUZhO0d/v1nGccDhib7Y52+3c1AIBpcjRe4TOhedL2ZkFEVGbZ2io7/kLxKH
         lhsU9EVJYWY6lzfslPuwjQ8dqTLeq+dMNW4hLNqP21lKl7z9EA9W1yVNBeTyn7UMT8o0
         xqAueOEjqmSWNY40NaxpSpuoVOlIEeOKbND2cUdetlx8Ty6ZuNrdeG4776S6cAYV6/ri
         0b1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751370487; x=1751975287;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2osz+FDlcrsw62TOPCgoVgngpNoshxMUDCHEG4J5fcg=;
        b=oIUlDvW+f93hEVwQO690P1gwm16WXalj3KH5KZc7t4bkyaF/hw+2Ty7tJ0zzPgqPzH
         CF5xJr5/A6Bge8bx7yPoslgkzd91+xSdxmpZCBcn8+FKHNyelH2xvnpdW6pkATvi1Khf
         sI0tk2K/WGiZHyy/UJf3h1l6rCIZuh/EhcE6fRRyZpnCshYUNYbColOs97OeqZoy2nN6
         xSTjcvnEpvHPZmVHcCSG/kBY8n73ghsgdgjRl+WXXjJ+ePkl7aj8mIo31WIKg7YRAlfh
         yvUPiLwOEtsyj9OvaqzU5hsx84aSGQu+AcaGC6OOp6ntbrCngqPT4N3+MYUBQPc9H5OE
         XsRw==
X-Forwarded-Encrypted: i=1; AJvYcCWC5NKTTWwNG2WFubO3wS7FHtLrfbtoxVLwFgRlU+pDxHgK5miQk134X31ZdEYKPt2KRgt+mweAl8CighY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1jAgkBnxqoPsBhIsfBtIkujEuW1AfIyWFgDwDVnOqTZ7Fm4dw
	fFOUq05udDyUt9qnScpkhG6BmTN1/KjDhcikYBLoXYhXCzurtaVyU5iJf+dSvhYF5H0=
X-Gm-Gg: ASbGnctaKnCKc+sGr0T1BTxgc4LbmKZCj8wU6RQzBdrK2jDMOqsfmkhlGTGMz2jpceo
	dA59NM582FLtp0nCvpG15zp3LkM+VqEI7Q+dPCciIuziYaDN+2mFFPdbQwIxMEzGR+4pcKIHUzl
	pRQmleVU2M1ojtZBJNGbf6TdLR/5jOyIdWRQkwm70lPXdvHHD2/Uv1yBobbJpHy6DhwM5z8LK0Q
	By1PoU3MjiTwL8vfzoDtqeVMNEjt+RJtmH+3r/R+5BDiaCn38/Ik/LAxd+MuntuTZTofVWoKmWi
	sN8ILUrYgb54O7tAay+wV1eCzGl6Ym3mXtTI9gIHz1pSHO8P1vzN6QAqYAoc17jgIvNugsZQGbD
	9tNt3XdOYBv/Oa7Hje34dssSrFHdZbow4dSWu
X-Google-Smtp-Source: AGHT+IGlTarSt6qvH4lmgRN+oUq7xpGteKJYtvJDbrXapQ7Eb/KPRGsvT0Gsl8JnkqI6XMTfQaWnpg==
X-Received: by 2002:a05:6512:224b:b0:553:cf38:5ea1 with SMTP id 2adb3069b0e04-5550b87b62cmr5843364e87.15.1751370487436;
        Tue, 01 Jul 2025 04:48:07 -0700 (PDT)
Received: from uffe-tuxpro14.. (h-178-174-189-39.A498.priv.bahnhof.se. [178.174.189.39])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5550b2f162dsm1800592e87.248.2025.07.01.04.48.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 04:48:07 -0700 (PDT)
From: Ulf Hansson <ulf.hansson@linaro.org>
To: Saravana Kannan <saravanak@google.com>,
	Stephen Boyd <sboyd@kernel.org>,
	linux-pm@vger.kernel.org
Cc: "Rafael J . Wysocki" <rafael@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Michael Grzeschik <m.grzeschik@pengutronix.de>,
	Bjorn Andersson <andersson@kernel.org>,
	Abel Vesa <abel.vesa@linaro.org>,
	Peng Fan <peng.fan@oss.nxp.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Johan Hovold <johan@kernel.org>,
	Maulik Shah <maulik.shah@oss.qualcomm.com>,
	Michal Simek <michal.simek@amd.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Hiago De Franco <hiago.franco@toradex.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 17/24] driver core: Export get_dev_from_fwnode()
Date: Tue,  1 Jul 2025 13:47:19 +0200
Message-ID: <20250701114733.636510-18-ulf.hansson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250701114733.636510-1-ulf.hansson@linaro.org>
References: <20250701114733.636510-1-ulf.hansson@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

It has turned out get_dev_from_fwnode() is useful at a few other places
outside of the driver core, as in gpiolib.c for example. Therefore let's
make it available as a common helper function.

Suggested-by: Saravana Kannan <saravanak@google.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Tested-by: Hiago De Franco <hiago.franco@toradex.com> # Colibri iMX8X
Tested-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com> # TI AM62A,Xilinx ZynqMP ZCU106
Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
---
 drivers/base/core.c    | 8 ++++++--
 include/linux/device.h | 1 +
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/base/core.c b/drivers/base/core.c
index cbc0099d8ef2..6f91ece7c06a 100644
--- a/drivers/base/core.c
+++ b/drivers/base/core.c
@@ -1881,8 +1881,6 @@ static void fw_devlink_unblock_consumers(struct device *dev)
 	device_links_write_unlock();
 }
 
-#define get_dev_from_fwnode(fwnode)	get_device((fwnode)->dev)
-
 static bool fwnode_init_without_drv(struct fwnode_handle *fwnode)
 {
 	struct device *dev;
@@ -5281,6 +5279,12 @@ void device_set_node(struct device *dev, struct fwnode_handle *fwnode)
 }
 EXPORT_SYMBOL_GPL(device_set_node);
 
+struct device *get_dev_from_fwnode(struct fwnode_handle *fwnode)
+{
+	return get_device((fwnode)->dev);
+}
+EXPORT_SYMBOL_GPL(get_dev_from_fwnode);
+
 int device_match_name(struct device *dev, const void *name)
 {
 	return sysfs_streq(dev_name(dev), name);
diff --git a/include/linux/device.h b/include/linux/device.h
index 4940db137fff..315b00171335 100644
--- a/include/linux/device.h
+++ b/include/linux/device.h
@@ -1048,6 +1048,7 @@ void device_set_node(struct device *dev, struct fwnode_handle *fwnode);
 int device_add_of_node(struct device *dev, struct device_node *of_node);
 void device_remove_of_node(struct device *dev);
 void device_set_of_node_from_dev(struct device *dev, const struct device *dev2);
+struct device *get_dev_from_fwnode(struct fwnode_handle *fwnode);
 
 static inline struct device_node *dev_of_node(struct device *dev)
 {
-- 
2.43.0

