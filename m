Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 830C928C2BC
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 14:12:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751292776; cv=none; b=fo+N1AcKNrnWiYXwDTftckMHxQznFyOI2TT41JcB3B9b2m3nKr/JI4+1l4snq1bPv2LmLGbr549j1dyHSdoBfByVSmjExxP/F+r0WzbxcpTt3Lv48urOekI9XwQAvXL4pePz+b/hgZgo3ofBqF5Pmf9UFK/eQ+G1vHRM7nkwqB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751292776; c=relaxed/simple;
	bh=LNKB7M4XGZD1wvMm18MmkB/SXjyMDrkXYtnipJUgGD4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uzn10QiTy1bHbC4cheepXeA2HZYpJDTaFpnD/DgvzlFZD1YEZj6nvKnQy38SW5n9ev2Sovctc7YbAYLwZ2TLSeVLk4xK54LfMvz0unagT5P3UnkhexzeKTaLU8k09bpK4YN514pz8yWIXZaSzsQhxPGKB7yvVOGKJWhZhD/GiVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Y8n+/Cud; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Y8n+/Cud"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-ae0bc7aa21bso476276066b.2
        for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 07:12:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1751292773; x=1751897573; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7KBYhaaZ6zyK1v99fMMJLyWKmWrudMkEEsbHwWdxmU4=;
        b=Y8n+/CudVs1P+ZoiEKWB4SLwaZ/FJAQ9fMnvz9GF1Wncl/nBfn7WvX+p4umrPfrTQR
         oCeUW1gVzarvUfyWje43hFPhjtmxw1a1ywX8yUHbiDYJZVVVcgnGD/PtYBDY5rwxugcz
         2cQcB4UFEbefwiqXCWcCPBMrkOPdQS9I+Uu2s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751292773; x=1751897573;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7KBYhaaZ6zyK1v99fMMJLyWKmWrudMkEEsbHwWdxmU4=;
        b=fZBZ3dBGba5k/ePORfozLXwL/oB4r6kRlxoEucblurGzWDXSvC1fL+WYZof+fHADSv
         6zBnwDp8ngmQC7lkzph9gLhLPm5csbdWqwCZStGdd7U02bcAJABbOO0FvN5wjcRuKhYH
         tY0pXD24wg/3TUy3ED3qx5xQP8ckR8B+0kYGEEdszVz6MpjZpRZHrqeLQdGPIlZ2wZYY
         hNGJVO+/IAVpKGOTJ5WfXoONfdxjfGBb4rUMFgaZjahLbMf3zn4p2wwuRnBAEGCvPU32
         MS7ibaG1Oxts2EdEVgqC43xh635bV148b59RGpe1kw+/IWBwRBS1CnwTd8JhFQC/mrWG
         Wv6Q==
X-Forwarded-Encrypted: i=1; AJvYcCXG+rN3mBBzFxOLKShao1cUdspxRMYZLYsYVqzc0jFxxvBPs6lbfWa+NYtEzuqiEnumEjM1XEl6zPq3rZM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/py0Ucsz4GTns2LtMe9JUUndEtkuesqVSdatyqas2KX+279Es
	qQODRitmG/YRSV9AET1e+tPE/ge5aiwTEzBr9HQwnDC5u/zqeVJC2Qh/x5ZQYYcz7Q==
X-Gm-Gg: ASbGnctayWabVjVXkAA9NB++QxhlNP+yJFS8bcjwFAVLrX8J5+GOHdhJzXKwQ6urN2Y
	VedZZDXQ2ZiNwc5f8dSZeu4AalIbwfPSWH2eRmZXSU1n7TfUeOd6DHVN/XTUAS1c7O1b9vdeYL+
	pUq9Lf+uD8muq6IEFwPPA1vNOq3aYafEC//jboiV++x0xQ5xAE5LNVNyBhlFo6o+NrV8m4g0bUa
	4ulk3Bo+PWUww8M0Eo3UmrER9PTtKxeuK9EnYE8HtNpj+70KteFi3uLa3re+WCxlpWaVHg4AQUo
	S0J+3olyLO9UreTjCAlDxjG/oH7HGFNZtwMDIWhTv6fv0avzoQ0vObyye29lYOYTv4F9VuRgHcv
	41f1/ir+ww7P4DrVqEvomSxeqKYaoMkkcKn08cmFflt/l+t4/SYGP
X-Google-Smtp-Source: AGHT+IHGJggqCDNtOOZaIaGa+EEv/ilhZRgs8ngdME1C5KWNG1YEyP/nwbdR5Tfg1rSmkUT0/Gm90g==
X-Received: by 2002:a17:907:2954:b0:ae0:ded9:7f31 with SMTP id a640c23a62f3a-ae34fd88f19mr862849766b.20.1751292772639;
        Mon, 30 Jun 2025 07:12:52 -0700 (PDT)
Received: from akuchynski.c.googlers.com.com (72.144.91.34.bc.googleusercontent.com. [34.91.144.72])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae35363b416sm670643866b.28.2025.06.30.07.12.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jun 2025 07:12:51 -0700 (PDT)
From: Andrei Kuchynski <akuchynski@chromium.org>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
	Benson Leung <bleung@chromium.org>,
	Jameson Thies <jthies@google.com>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	linux-usb@vger.kernel.org,
	chrome-platform@lists.linux.dev
Cc: Guenter Roeck <groeck@chromium.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dmitry Baryshkov <lumag@kernel.org>,
	"Christian A. Ehrhardt" <lk@c--e.de>,
	linux-kernel@vger.kernel.org,
	Andrei Kuchynski <akuchynski@chromium.org>
Subject: [PATCH v2 02/10] platform/chrome: cros_ec_typec: Set alt_mode_override flag
Date: Mon, 30 Jun 2025 14:12:31 +0000
Message-ID: <20250630141239.3174390-3-akuchynski@chromium.org>
X-Mailer: git-send-email 2.50.0.727.gbf7dc18ff4-goog
In-Reply-To: <20250630141239.3174390-1-akuchynski@chromium.org>
References: <20250630141239.3174390-1-akuchynski@chromium.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This flag specifies that the Embedded Controller (EC) must receive explicit
approval from the Application Processor (AP) before initiating Type-C
alternate modes or USB4 mode.

Signed-off-by: Andrei Kuchynski <akuchynski@chromium.org>
---
 drivers/platform/chrome/cros_ec_typec.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/platform/chrome/cros_ec_typec.c b/drivers/platform/chrome/cros_ec_typec.c
index 7678e3d05fd3..3aed429fde03 100644
--- a/drivers/platform/chrome/cros_ec_typec.c
+++ b/drivers/platform/chrome/cros_ec_typec.c
@@ -408,6 +408,7 @@ static int cros_typec_init_ports(struct cros_typec_data *typec)
 
 		cap->driver_data = cros_port;
 		cap->ops = &cros_typec_usb_mode_ops;
+		cap->alt_mode_override = typec->ap_driven_altmode;
 
 		cros_port->port = typec_register_port(dev, cap);
 		if (IS_ERR(cros_port->port)) {
-- 
2.50.0.727.gbf7dc18ff4-goog

