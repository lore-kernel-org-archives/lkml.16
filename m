Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com [209.85.160.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63A5721C19F;
	Mon,  9 Jun 2025 18:47:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749494844; cv=none; b=AU7AWEVj7qjlBMzL/3RzBniIRAbBIei9/6i2o6wwo/IIcWeRXUhjrEVnG3h0BdIGeUCxdBuDY0oparhaJMTliv5nEOOGZxtyAkHN9kQtOf8OPMC/7KJnnqiNMEZJ2qyZFPKkyIVJZjBNQuB5XFm6K9GU8EdWbII9Ln6Ndwj0kn4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749494844; c=relaxed/simple;
	bh=QBX0wKas8hMg8UqxUJo8euFBcQTuFEJmE6HLDNOpMw0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ftIwTBlJiGAi4kv2xsKAGqocm+ev8aTA9zoSkYRVvfKTsoFhR5t4Jl5+Ue/APXzf6ABApF/mhrUM9tH8itt0WDib76lhwnM22Dzejml3aSQ9YpvTyab4eR4UmTrMzAQF4DWrOe6/nqSsdi4bac2aywkaFACiimS2i6cWeI9DGV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QeRfN+GH; arc=none smtp.client-ip=209.85.160.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QeRfN+GH"
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-2db2f23f174so2677415fac.2;
        Mon, 09 Jun 2025 11:47:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749494842; x=1750099642; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DDwrjOc2P0lgnjjq9Q/Gy/AuUSnuvG7kFTIq26PL/EI=;
        b=QeRfN+GHzOXOlXAnu1nVI2Pxjtg3Fvh07cSfvRFcqrtbaIPuSoM/7KpTwZrNRVx8dn
         2i5pNR4eYvE5sQmstLLzeAfHVTB3NzcRUNCWyJbzDRIQic/WKOYLozwCYInj8/HtZoKb
         cg8TRpTy6pUb+48oeCndFL8hgs3TgI6554t9pzYwAopx6LT5+S7YSanOgoo/PDw/RNna
         qB7QV6wOUwnANuByjcFyEgRvoWidol1shFdm9Gzqbov7EDfEq9zmPgJmYxUNAB7a9Aeo
         947gyDvekamFU8SbUVEGPTWzkirpKnuguT8J1AcRdszU0YKRJIq5aHafsQKSBVXaJZaI
         Mggw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749494842; x=1750099642;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DDwrjOc2P0lgnjjq9Q/Gy/AuUSnuvG7kFTIq26PL/EI=;
        b=iValcymXMC9s/WOoBbOESPb6/3dm9ndQtLbnQE4E5WDDJw9/+p5m7yIdsNv9zfhE+Z
         S8JDwlnPcMKdyahKyXFyJEmb5O8ZwyhSQNSkACsk3XfOLUOcrahPBRx6qrJgKKY9nkFd
         HWjC6fPS2eClx3sMqmDKBNbHk5ittEEelz0hX+0Wf2ZwoYrcF2RbxsINMocsNRtwi729
         PjNf6FJFJJUYYUbf0zL99uF0Sv8orH8jXEsIgfHKra170QMQJinh2011yZCDhI3vYCLe
         jRb7TQmeE+MvPbpO+qXVTda1jYtqU3zANotBHAmGxMHmwuamzy1W6pWzqUMi04kE/U8T
         4a0Q==
X-Forwarded-Encrypted: i=1; AJvYcCU73cvZDBCSlf9OYU2GsZIkRv/8om2tynNNEAKaG07Q8RhIrvr3C2vOVZaWm52vqNFQ4Es8YMKDkKUMGWIlTbVHcL4C@vger.kernel.org
X-Gm-Message-State: AOJu0YwESP6jKViqezb6IX/xcm5CPBt7zuYUQPl8pAkvWTet2GQhrX4Z
	jqvO0f4E19AW1xdBfekpfMaj6NOjxL7nl7cfPUEx0Oeomd2r38L7BRFShgItlg==
X-Gm-Gg: ASbGncttf3vqSDUXfCtWOeaYuLEAgFzvkjaCsUlIxN28PY9UR02V9ttD93IsF8TumVU
	Iz3l6jRXb/Ws89rNr3DkJsiI0oRHbeGj0WCn4tOY8HpbVMEYe9x9YriluJ9zUvUYz+CQ+SaxyhK
	76skKwOR4iOamqxyLX8kKFCO2Wrslu+cZJVU+0c3FQhNZoka0LWF2MnHK81M7JAc5BlVpM+rscj
	BGiQphVtiXiYqQQExWQfXHWNjX2tzyVn25Pg9eurl3J2znZBhMziOw8np6S5sXD/0Rz/axs3xjN
	rHEZNXbhy8/40yhkUkYJ/go6/kIkHbOnGeWQWMqSCSHLtUXcdvAWrrjGHgKVMrNt5nQGvO4Z7D4
	nonta6U4cK47QPmi5JQ==
X-Google-Smtp-Source: AGHT+IHpMFKjrAoLHyAokS1ybpSw77ZOAastSRyqcWmpTaoQn+3gbXFKypDR5+nK2z6vkOX5rzaz+w==
X-Received: by 2002:a05:6871:e806:b0:2c1:ae41:6b5e with SMTP id 586e51a60fabf-2ea008793b9mr8549297fac.16.1749494842300;
        Mon, 09 Jun 2025 11:47:22 -0700 (PDT)
Received: from localhost.localdomain.adc.delllabs.net ([143.166.81.254])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2ea072e4b5asm2035950fac.30.2025.06.09.11.47.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jun 2025 11:47:21 -0700 (PDT)
From: Stuart Hayes <stuart.w.hayes@gmail.com>
To: linux-kernel@vger.kernel.org,
	Hans de Goede <hdegoede@redhat.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	platform-driver-x86@vger.kernel.org
Cc: Stuart Hayes <stuart.w.hayes@gmail.com>
Subject: [PATCH v4 5/5] platform/x86: dell_rbu: Bump version
Date: Mon,  9 Jun 2025 13:46:59 -0500
Message-ID: <20250609184659.7210-6-stuart.w.hayes@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250609184659.7210-1-stuart.w.hayes@gmail.com>
References: <20250609184659.7210-1-stuart.w.hayes@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Bump the module version.

Signed-off-by: Stuart Hayes <stuart.w.hayes@gmail.com>
---
 drivers/platform/x86/dell/dell_rbu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/dell/dell_rbu.c b/drivers/platform/x86/dell/dell_rbu.c
index 7d5b26735a20..45c0a72e494a 100644
--- a/drivers/platform/x86/dell/dell_rbu.c
+++ b/drivers/platform/x86/dell/dell_rbu.c
@@ -45,7 +45,7 @@
 MODULE_AUTHOR("Abhay Salunke <abhay_salunke@dell.com>");
 MODULE_DESCRIPTION("Driver for updating BIOS image on DELL systems");
 MODULE_LICENSE("GPL");
-MODULE_VERSION("3.2");
+MODULE_VERSION("3.3");
 
 #define BIOS_SCAN_LIMIT 0xffffffff
 #define MAX_IMAGE_LENGTH 16
-- 
2.47.1

