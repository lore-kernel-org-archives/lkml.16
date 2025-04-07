Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 068D2229B1F
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 08:14:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744013684; cv=none; b=SR+2qHvadW8MnVw9UQNdM+D3yLz7RVmUp75RSiCKwQEtDrGVP4SzRbMk2c70BbIrvzDqstWl5vcynkBmw65BdLnAwL4vyVqIWqgsy8eeCcThUGbpaJ/eDPViU3SrqV49z2dZyicES6s7/5Nt3DF0iAxPPGOX4vdY/Ux7ndeoWJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744013684; c=relaxed/simple;
	bh=Qf5kJYjNJ5UjybP18Zj5zQoxTy3lvOqUtbeFwNnlolk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jSXh8yw+D9thgZDKdCQLoTHO3ViigLMeiGv/b/QPbvbcgeS2DcD1WziJog1hGzfQH5d1QfBoxLRv7yLt76KPXMeJtxYRcsvlc3ad8kijeZ4EkmeTIb2MIOosFJL93lBhkzGmZMTx1x0zuuAA6lLeK46GdgHr/RRU+lp9eJNj7y8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lsUsoCkN; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lsUsoCkN"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-43ede096d73so13156605e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 07 Apr 2025 01:14:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744013681; x=1744618481; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PcXSp8pgzSq8wNXoM27HycQqegwL//5YxnDgqXeVDvc=;
        b=lsUsoCkNIWw19NBig/+0QenHqx+CzZFzbvYdzILAXpQhDYPxeOZ50ZPH7q0yG0f062
         lBQeeB1Eun3nIYoVl7nVqiCYf5p06m+YekSShLwYo/jegMjX/6ES1iH2rOpGe01+resY
         3tgMmIYWW0M9mQCQ3MV+YK6iPlFRk4odWioUcpFXz3dwFFoo7VKBl1gHELOMdBFaoi1e
         AgiLvlmfXeJSqC7lb49WdGO2t5J9Be4/T5Eem2EnvZP51qeI0Vcuf8p70Anmi1CLFILx
         yP2OGwfVaGpCEkxUMjRTYsjAmCiLVPaYoXtgDwPpMtfeOjjixpSPN5GPUdQVorOGizRb
         QfcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744013681; x=1744618481;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PcXSp8pgzSq8wNXoM27HycQqegwL//5YxnDgqXeVDvc=;
        b=Lrzz1sSYVmxg5oA12IF0k6fGu6e97n5isSu9dIKJ3DSDde8vazBHQfMRPSUXCvOdKl
         BbgFTRjlOY1uR1ymMLvBomP8y58HJy1C4XO9HZQ8NlaiGPQ3dHEgRNqR9+gQ7sFTpau8
         AoJLMCrDZPtl+H5ug9fvnvPMnVE+1mD3pRaoWZgiT5w8eQNN220a3ZRiwRDgicjjvoP+
         z8eJvbq9noK7/wTFLc8vM+wUfIY94go+ZgXSIlGDrhXbqdvP6jQvIsQzUlstA4/8GQ+C
         E+Q8Sxmd5sdCWw1M1wKFgh1W3Cjwp61c0HkPlPOS+Pwr8Jp1CiKt0tcr8wAKiHbyKeED
         KYXQ==
X-Forwarded-Encrypted: i=1; AJvYcCWWDYCITcyTSfheRI9k1B8lrHcIhUWZB5RGt63KVbWNCoEW3IDvgLQdAvOHk83KmK9CALE4SZ5R5cmu1P8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzP9NDVr1xo3tWFZsILG5/FCDpCGxuBKSNHhEJkXlgcanJ3mTcL
	cA8ZrnWmq4JBnp0L1cDUgTef4f0rgf3KhpAHchA/P5jaMra0nzjDuEdZOQ==
X-Gm-Gg: ASbGncv9a+93+5Fn9MNsvGEI7vl4i94A2cFPoj17CevA6TlT9+FY+gPP+6tq0mKmLLO
	5U719EM+PE1JJ6vx4vK3GBXBy49frqmI72qTCmS5bu5tfYzrGDItHnujEgyzX9J23R6MOcWOPOC
	if/YCoQAxJrPO8pz67G8wv5ptR3ObqV4Ge5mOcEPBVwTgjIWyPX5sBfLdDN8HDTLnaSnUq/Hb0e
	zpVau/i6UeNk1c19y3zyvhLF38/Cho8w1JCijc6DfxTKM1hT90CqUx91asPt0/9b47dqksOcL4E
	5xf7SRhAXgGMtGhLWEL4Ew9CSVZxMQPA6BeBh58TcKKL
X-Google-Smtp-Source: AGHT+IEOvcCjqwHYmHo/+QnfasqodtrBtlPdfu1XAaFA0hX44c5bBU1IaftsHeJH9DXHtC+DkVS0zw==
X-Received: by 2002:a05:600c:3484:b0:43e:afca:808f with SMTP id 5b1f17b1804b1-43ed0db4006mr115955245e9.31.1744013681104;
        Mon, 07 Apr 2025 01:14:41 -0700 (PDT)
Received: from fedora.. ([94.73.34.87])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec16a3aefsm125473445e9.21.2025.04.07.01.14.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 01:14:40 -0700 (PDT)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: louis.chauvet@bootlin.com
Cc: hamohammed.sa@gmail.com,
	simona@ffwll.ch,
	melissa.srw@gmail.com,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [PATCH v4 06/16] drm/vkms: Allow to configure CRTC writeback support via configfs
Date: Mon,  7 Apr 2025 10:14:15 +0200
Message-ID: <20250407081425.6420-7-jose.exposito89@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250407081425.6420-1-jose.exposito89@gmail.com>
References: <20250407081425.6420-1-jose.exposito89@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Louis Chauvet <louis.chauvet@bootlin.com>

When a CRTC is created, add a `writeback` file to allow to enable or
disable writeback connector support

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
Co-developed-by: José Expósito <jose.exposito89@gmail.com>
Signed-off-by: José Expósito <jose.exposito89@gmail.com>
---
 Documentation/gpu/vkms.rst           |  4 +++
 drivers/gpu/drm/vkms/vkms_configfs.c | 42 ++++++++++++++++++++++++++++
 2 files changed, 46 insertions(+)

diff --git a/Documentation/gpu/vkms.rst b/Documentation/gpu/vkms.rst
index e0699603ef53..abe7a0f5a4ab 100644
--- a/Documentation/gpu/vkms.rst
+++ b/Documentation/gpu/vkms.rst
@@ -94,6 +94,10 @@ Continue by creating one or more CRTCs::
 
   sudo mkdir /config/vkms/my-vkms/crtcs/crtc0
 
+CRTCs have 1 configurable attribute:
+
+- writeback: Enable or disable writeback connector support by writing 1 or 0
+
 Once you are done configuring the VKMS instance, enable it::
 
   echo "1" | sudo tee /config/vkms/my-vkms/enabled
diff --git a/drivers/gpu/drm/vkms/vkms_configfs.c b/drivers/gpu/drm/vkms/vkms_configfs.c
index 62a82366791d..e9f445043268 100644
--- a/drivers/gpu/drm/vkms/vkms_configfs.c
+++ b/drivers/gpu/drm/vkms/vkms_configfs.c
@@ -74,6 +74,47 @@ struct vkms_configfs_crtc {
 #define crtc_item_to_vkms_configfs_crtc(item) \
 	container_of(to_config_group((item)), struct vkms_configfs_crtc, group)
 
+static ssize_t crtc_writeback_show(struct config_item *item, char *page)
+{
+	struct vkms_configfs_crtc *crtc;
+	bool writeback;
+
+	crtc = crtc_item_to_vkms_configfs_crtc(item);
+
+	scoped_guard(mutex, &crtc->dev->lock)
+		writeback = vkms_config_crtc_get_writeback(crtc->config);
+
+	return sprintf(page, "%d\n", writeback);
+}
+
+static ssize_t crtc_writeback_store(struct config_item *item, const char *page,
+				    size_t count)
+{
+	struct vkms_configfs_crtc *crtc;
+	bool writeback;
+
+	crtc = crtc_item_to_vkms_configfs_crtc(item);
+
+	if (kstrtobool(page, &writeback))
+		return -EINVAL;
+
+	scoped_guard(mutex, &crtc->dev->lock) {
+		if (crtc->dev->enabled)
+			return -EBUSY;
+
+		vkms_config_crtc_set_writeback(crtc->config, writeback);
+	}
+
+	return (ssize_t)count;
+}
+
+CONFIGFS_ATTR(crtc_, writeback);
+
+static struct configfs_attribute *crtc_item_attrs[] = {
+	&crtc_attr_writeback,
+	NULL,
+};
+
 static void crtc_release(struct config_item *item)
 {
 	struct vkms_configfs_crtc *crtc;
@@ -93,6 +134,7 @@ static struct configfs_item_operations crtc_item_operations = {
 };
 
 static const struct config_item_type crtc_item_type = {
+	.ct_attrs	= crtc_item_attrs,
 	.ct_item_ops	= &crtc_item_operations,
 	.ct_owner	= THIS_MODULE,
 };
-- 
2.48.1

