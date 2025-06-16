Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1542E156237
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 13:33:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750080793; cv=none; b=eMPYJLIYAL9CX5rDhxqw8Yfkk/mcSx/CKKH/gaiDQDjoNwUvwAf/eYcZMWHzFbbuBBor7n/1IGty9Pgufo1jbnjohjUYzdrHTR5hE30KAjDbXj9zlVLiAyBgETX4xP6c5HW7CPSk2PyB0xFF7VEY7iKccajBYLPSNIGiNEuSVu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750080793; c=relaxed/simple;
	bh=DfWtOSkx84l5KOCfEGNRyyvx2K3TB+JWEySzWnCGZMk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Fsdra/FvgDbWD8B3SecmPsMGm62qijMLpHXLjWSfRZFwAbyzXD4Jgin5H1q6bI0se43bakkvpViFVnikeoHKESO8XS1ecnxRCdk8FOZsL0nN3R6xAc0KxjPLYBL5Pk3Hd8NWgBG5lGRbNDFc2iuOdLIowoqDseomi8Ye5XjlQP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Nq9sAS0t; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Nq9sAS0t"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-60727e46168so7726096a12.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 06:33:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1750080790; x=1750685590; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CrvRU9dPA3iyQCatW33yYrWOV+Y1tKJvNMOa8l/wSkM=;
        b=Nq9sAS0tjhVHWqo34HkdDipyx7QRBX9Hh/Sb7V/3SBXdKJMbruVPEdw74m2LoGf8FR
         ubj2QJk8x29w4zmu3rmm57sI28gMt9Bj3avvsFW0saXxNnMpbd8+p5pOPRkNLMo5Pag/
         tPAI+BHjBpx4GbZIIxxquu1TUTGRDk6nqehNc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750080790; x=1750685590;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CrvRU9dPA3iyQCatW33yYrWOV+Y1tKJvNMOa8l/wSkM=;
        b=qcC93ARMx7tWkXYUQq6eLZXJEOj9B+nedOJIJPrFzMzyG3gJFGOwf83gxkOAuUxJk2
         eBKrFdWVHg7AGSTiYLe4r5p6/eZrV6gfBnqRwmsOvK2BMXxJlOB89iIJ78CAnso+Qd3B
         ggnST7TU//3+aA2me4m40xXzneQVVqKQlIwZ/LWo8FgVhFUWSWdDdaueX9hwzik7EzgZ
         9hny3B/o/c01SFHMq5gQspqZEiF8ButcdVUCUVmesBlOu47+vaUdRvRAUAFlXh3gvmkx
         C7fnOkWufuPVx7bVgf3kDufvYX2+c//PVcTz0zzbxPLvqoSD1L6SUDfk6zbEHHkrr6WE
         oung==
X-Forwarded-Encrypted: i=1; AJvYcCX0sQpuNYMaopnVKB6MF69tu2MKjXwIKpxwPf+8xtKUE9lqbY5dgbtZapvtqOpvGQJj9CzW5ISPJJU5TFk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzTKOI2DbNwnu1cFj7U81d6u11qHmoOH7juRq972wqcNMh7AIwL
	1TO4OUy79/SoG0Bx9TMlTiEK7RdN7FQxfcSCF3zGhoY8y1IzmDM84cah8ayjgNUeYQ==
X-Gm-Gg: ASbGnct1JQoXz4bsjVKjcVLk1DUVGQUGhFasNXhBXEq+YWoWcXOQzdXRWLmI5NczoHK
	OqsQs0WUmPfSZyXnkqp8BvA/Iw3MpRCM23HAngtFjBfMapLzpIeqvdTazcVUQjTzXbdBQeDRcAt
	dAR7Yl0Z7bJzoncYn5fpgZW8SEkm+aOExmJIdgxNsEUEF/graNlGpS2oSMwE5kRJem+h87UU5WQ
	wCCGVayNg+V8yqW+qRVCVtSV3jpFo/Jhs6CJa0vbkYn0VCZERQICbd2EiVB7ICE9ITilJae0ECU
	nZaCSmCQ1+naMLxZ+X0tW7mlexjKe6cwC1VVIhjZhs3/MiFDg341zuIwLIPBNh0xahlHP2MVHYJ
	9QkOlMLnDxPURqFS1g/VH/88X8ws+mbCmcCF/TZHVDRvyh3sTqw8c0Dvi+w==
X-Google-Smtp-Source: AGHT+IHbDTcXrvlPhvHImcuxrvjv5KF3hnVki+pNJuztPFo+tXtICwF+2GhVHRAJEkGScMRhGJ4DLw==
X-Received: by 2002:a17:906:794a:b0:ad4:fd7f:a4 with SMTP id a640c23a62f3a-adfad4f42eemr816606366b.47.1750080790329;
        Mon, 16 Jun 2025 06:33:10 -0700 (PDT)
Received: from akuchynski.c.googlers.com.com (244.175.141.34.bc.googleusercontent.com. [34.141.175.244])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-608b4a94ce7sm6036664a12.58.2025.06.16.06.33.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 06:33:09 -0700 (PDT)
From: Andrei Kuchynski <akuchynski@chromium.org>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
	Jameson Thies <jthies@google.com>,
	Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Guenter Roeck <groeck@chromium.org>,
	Pooja Katiyar <pooja.katiyar@intel.com>,
	Badhri Jagan Sridharan <badhri@google.com>,
	RD Babiera <rdbabiera@google.com>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	chrome-platform@lists.linux.dev,
	Andrei Kuchynski <akuchynski@chromium.org>
Subject: [PATCH 01/10] usb: typec: Add alt_mode_override field to port property
Date: Mon, 16 Jun 2025 13:31:38 +0000
Message-ID: <20250616133147.1835939-2-akuchynski@chromium.org>
X-Mailer: git-send-email 2.50.0.rc1.591.g9c95f17f64-goog
In-Reply-To: <20250616133147.1835939-1-akuchynski@chromium.org>
References: <20250616133147.1835939-1-akuchynski@chromium.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This new field in the port properties dictates whether the Platform Policy
Manager (PPM) allows the OS Policy Manager (OPM) to change the currently
active, negotiated alternate mode.

Signed-off-by: Andrei Kuchynski <akuchynski@chromium.org>
---
 drivers/usb/typec/class.c | 14 +++++++++++---
 drivers/usb/typec/class.h |  2 ++
 include/linux/usb/typec.h |  1 +
 3 files changed, 14 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/typec/class.c b/drivers/usb/typec/class.c
index 67a533e35150..a72325ff099a 100644
--- a/drivers/usb/typec/class.c
+++ b/drivers/usb/typec/class.c
@@ -459,9 +459,16 @@ static umode_t typec_altmode_attr_is_visible(struct kobject *kobj,
 	struct typec_altmode *adev = to_typec_altmode(kobj_to_dev(kobj));
 
 	if (attr == &dev_attr_active.attr)
-		if (!is_typec_port(adev->dev.parent) &&
-		    (!adev->ops || !adev->ops->activate))
-			return 0444;
+		if (!is_typec_port(adev->dev.parent)) {
+			struct typec_partner *partner =
+				to_typec_partner(adev->dev.parent);
+			struct typec_port *port =
+				to_typec_port(partner->dev.parent);
+
+			if (!port->alt_mode_override || !adev->ops ||
+				!adev->ops->activate)
+				return 0444;
+		}
 
 	return attr->mode;
 }
@@ -2681,6 +2688,7 @@ struct typec_port *typec_register_port(struct device *parent,
 	}
 
 	port->pd = cap->pd;
+	port->alt_mode_override = cap->alt_mode_override;
 
 	ret = device_add(&port->dev);
 	if (ret) {
diff --git a/drivers/usb/typec/class.h b/drivers/usb/typec/class.h
index db2fe96c48ff..f05d9201c233 100644
--- a/drivers/usb/typec/class.h
+++ b/drivers/usb/typec/class.h
@@ -80,6 +80,8 @@ struct typec_port {
 	 */
 	struct device			*usb2_dev;
 	struct device			*usb3_dev;
+
+	bool				alt_mode_override;
 };
 
 #define to_typec_port(_dev_) container_of(_dev_, struct typec_port, dev)
diff --git a/include/linux/usb/typec.h b/include/linux/usb/typec.h
index 252af3f77039..6e09e68788dd 100644
--- a/include/linux/usb/typec.h
+++ b/include/linux/usb/typec.h
@@ -304,6 +304,7 @@ struct typec_capability {
 	enum typec_accessory	accessory[TYPEC_MAX_ACCESSORY];
 	unsigned int		orientation_aware:1;
 	u8			usb_capability;
+	bool			alt_mode_override;
 
 	struct fwnode_handle	*fwnode;
 	void			*driver_data;
-- 
2.50.0.rc1.591.g9c95f17f64-goog

