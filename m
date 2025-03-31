Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 571312144C1
	for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 16:38:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743439128; cv=none; b=hR8yzCsQxFvvnDm+L3dBLFMZE5Zk9nmYq26zy5pgCSspjZoK7DK+wa4nWYiliSfGBfvJ+FHZf3B5Dlwk2sFYwcaJYNPrOdxfM/XL7z9w5//lzH4IryKKoXKM+apW/hC0lTYhRZGIsLI5bfLOrF6WcmlJ5YWra9Hbh8ZSKybKmfE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743439128; c=relaxed/simple;
	bh=Rz8niDCP/S5JHtYvlTHJaNeGsovQc9YWcOjL+l34xdc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mwVMecxy7mpwB6RPYsr24Ag6wR012NXkT2mAd0cn+O1nye0QJ5wV4Ad5HDnRr3tlMIXkXCwXQJRuBMSUecT5u//9v+FvRWLbiw4NNIaugdMeT8Wo97MfODYtH+YGIVBb4UJazlTSQKKN9gy+2B+HvyFh/kXdglhSoD5lMApetVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=MgIStzQW; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="MgIStzQW"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-54b1095625dso245084e87.0
        for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 09:38:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1743439124; x=1744043924; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sS86lAWptOcn7UzG4ho8/rTQhup+4bcETIY9n4NgIPI=;
        b=MgIStzQWObVFKalBHdOO12lg5yObw7rP6Ej2ynhnSMHMOjgIEk/HjXpmcDUoBJHany
         BLfDmaoXoiXIo1pis7/91qdlZuxwysYisyeLyeJSL3Eo2WE29jCQBF/BymSTQz2yd1wU
         JvN/rGhGiO3dw+NxcdZQvVJ1xG3DLb/EwT/c4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743439124; x=1744043924;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sS86lAWptOcn7UzG4ho8/rTQhup+4bcETIY9n4NgIPI=;
        b=HiM2kM8rNk3oqy1bkQnU9VFAINoI+QDIgUch0ggOG1YS2qn+mHEmGi0QEu49gKDsfa
         vOjF/i0aXSClVVw7qkuPb3pBVm+/qgHYUvvU0ih/lr0LeYtVQ+1qaZ3EygsHYFoX22V2
         Qlu3rZNiXXyCYP3XKXUZHEhoJcOlJM8SV12W2GMQ6449yYZnd0NTRVR01uFPVH+NwYL7
         c0dvaIyGSBkijTDrcaCpqYu0ZVZvdJu28CzfGCXKkm09TWlG+/vRajgTWue5XlDammAt
         J8nYEMsPxg+z/REaL7DzvfJGpoBgOPFoJpHk7AM05X0ttkRZVgZ6ZNw+a+0nobkNYmNK
         FHjg==
X-Forwarded-Encrypted: i=1; AJvYcCV46446f/UMx3skNgB2+IcSARFkJpgITJefJm3kkXbyglE5jueTCNMSAaJj6TBC0FTItiXbZdxqJTAhz3g=@vger.kernel.org
X-Gm-Message-State: AOJu0YxnpLnoE0YpHIWnltaD225pQMq86wUOSuhgCtengAerwF+ZHvaM
	YKQePSQkuZp9AZ2aYQdne0B3EgkKd0CWkyP+tJ0UfimaRJJfJbDetmOHsC7CdQ==
X-Gm-Gg: ASbGncv6WqvlPVn2L7NqA+KkQTQqWi7OX9NVegXEE7r20F1DeAzSgGCTrblwTyHpJl/
	qqxkSyk8hOB/xWaraaYLqIYxubViGpaLlmOMRBab9B9IXAIdG+EpPJ35JCmCqNbz1g2L3ZRfAkF
	zUXkaJd6R3gQbzlQxw21BR7rHZJeqn+Btg4V8Y9VtwzoYYdkUP8bLo6YIGRzcT7kXI5xcP7+E4s
	+u+Z07D2yXK3VRwE7czdRQrBhPRrEvnF8bYGGn6H+2e4mojA14sTMDyV5SefgtI0wzwh1R0405z
	iVqKmzVgablO7iLPHZlZMAAnKeT6x4AwucmW9kfdvr8P+KJbl7Vq7tWIJl3ba5fMTGa9Fz4kghh
	fIqs2jil7dQ5n6ojOPAqKJoIl
X-Google-Smtp-Source: AGHT+IHpyPMTl053/x1sB7ty7XO6/dSpV7J8c+JWgkb/ZJBprjEK8fsvW1T+8vB31EfEBwm4+jJmQQ==
X-Received: by 2002:a05:6512:3b14:b0:54a:cc76:1676 with SMTP id 2adb3069b0e04-54b1113d115mr2459354e87.44.1743439124261;
        Mon, 31 Mar 2025 09:38:44 -0700 (PDT)
Received: from ribalda.c.googlers.com (216.148.88.34.bc.googleusercontent.com. [34.88.148.216])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54b09590fd3sm1151796e87.188.2025.03.31.09.38.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Mar 2025 09:38:44 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 31 Mar 2025 16:38:42 +0000
Subject: [PATCH 1/2] media: cec: extron-da-hd-4k-plus: Fix
 Wformat-truncation
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250331-v614-v1-1-9bc69a873720@chromium.org>
References: <20250331-v614-v1-0-9bc69a873720@chromium.org>
In-Reply-To: <20250331-v614-v1-0-9bc69a873720@chromium.org>
To: Hans Verkuil <hverkuil@xs4all.nl>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Hans de Goede <hdegoede@redhat.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Andy Shevchenko <andy@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-staging@lists.linux.dev, Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.14.2

Convince gcc8 that the port, initiator and destination fits in a single
char, despite the fact that they are 4 bits wide.

drivers/media/cec/usb/extron-da-hd-4k-plus/extron-da-hd-4k-plus.c:1014:44: warning: 'DCEC' directive output may be truncated writing 4 bytes into a region of size between 0 and 53 [-Wformat-truncation=]

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/cec/usb/extron-da-hd-4k-plus/extron-da-hd-4k-plus.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/media/cec/usb/extron-da-hd-4k-plus/extron-da-hd-4k-plus.c b/drivers/media/cec/usb/extron-da-hd-4k-plus/extron-da-hd-4k-plus.c
index cfbfc4c1b2e67fec9434aa6852ab465ad8c11225..e1a2a676bcaf9c313041ce8074c85636cfe4b2da 100644
--- a/drivers/media/cec/usb/extron-da-hd-4k-plus/extron-da-hd-4k-plus.c
+++ b/drivers/media/cec/usb/extron-da-hd-4k-plus/extron-da-hd-4k-plus.c
@@ -1012,8 +1012,9 @@ static int extron_cec_adap_transmit(struct cec_adapter *adap, u8 attempts,
 	for (i = 0; i < msg->len - 1; i++)
 		sprintf(buf + i * 3, "%%%02X", msg->msg[i + 1]);
 	snprintf(cmd, sizeof(cmd), "W%c%u*%u*%u*%sDCEC",
-		 port->direction, port->port.port,
-		 cec_msg_initiator(msg), cec_msg_destination(msg), buf);
+		 port->direction, port->port.port % 10,
+		 cec_msg_initiator(msg) % 10, cec_msg_destination(msg) % 10,
+		 buf);
 	return extron_send_and_wait(port->extron, port, cmd, NULL);
 }
 

-- 
2.49.0.472.ge94155a9ec-goog

