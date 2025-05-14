Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C42F194A44
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 14:19:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747232385; cv=none; b=LP6AvGGW/N423n54Uy9kECopBzh2JbZqCkXePHtLFz3+2sjTQeK1X3Y+CS6tMx4QbYnj4BQzJ+8E2t+pP7mEtA2Eqn7iDOng9eSMRcyR48y+yXB/EzHyNg7tBiuO5S8vWb8I3zwzLJ3ETC8EIY59Tu00eNyZEx47zf9bY5OKacY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747232385; c=relaxed/simple;
	bh=MDkS8ldGXScRZONUBL673Asf/ksz7j4BMNcyHSf2rFk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=phvRAD5DRJ56tqcuWrecyo4S4v21ZbBA1kGDUVxOPMSfrvTkKunrAbRzGsuff+/CHcsldFSaB0E37kMU5pgaGZ2F0/TV4LSh++ZBm5O4go5KtNBNVmYR5ogkkexG63p5dFhpgju4CvNVElW7YmqK7FKF70T30WwMUyWBNrq/yWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=R3OWbae2; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="R3OWbae2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747232380;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yRSwjGEuphQPWi9/jNcoY4twWfTF60gioe70+GQBSH4=;
	b=R3OWbae2LoAK8JO4Ic/bOwgdU9h90moWljVL0KJdDFoOuQUxRh7sjlDBsnGmJR78S920ed
	+iTMinSdRSJCfCzpr//XRKCglcojsOW76jeOYDD0IhVehnKzbZQzrbQ3TTM3Z308MqOd4c
	zQ0PSFyr5yMrVqAgF4ubv2YpMDn4xis=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-692-4g1STkMcN-GG5ryMUUJfXQ-1; Wed, 14 May 2025 10:19:39 -0400
X-MC-Unique: 4g1STkMcN-GG5ryMUUJfXQ-1
X-Mimecast-MFC-AGG-ID: 4g1STkMcN-GG5ryMUUJfXQ_1747232378
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-442f4a3851fso6456345e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 07:19:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747232378; x=1747837178;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yRSwjGEuphQPWi9/jNcoY4twWfTF60gioe70+GQBSH4=;
        b=slcowoRMMFt55Q0eqTGWFwi4Rkq67goy2XWWM9pBVwCXlj8mapkWK09trX6h13Ow59
         gRnwXn7tbkx+NUYCFVGZ8BAkreroYj1JeEUroLBoM48uzd3zM6iZn/cw7CMZHNFY/WSV
         j06uVgAixqZCU5Rv+snWcUOMrZp0LGnM+M0R8j1x++/KIiikD64DwSbuRIrZZO3l3m2G
         WGJUDKHckTHrPI9E+qVV0TSuHacvmZnm8cCZKvaSIdyzdnLWl8hwx5iNFF9LdeVEX1ss
         jZKhqGVPKCqwTpvjb2MdyF40K/4DmP/qCKoGRh87q5LpK+Hla6+xk/iWYFDukYaRHDea
         T9Lg==
X-Forwarded-Encrypted: i=1; AJvYcCWjSKmt9UkaFeSrJXZFgBYV8blMjaUoCvh9Hv+uJfw7SIqioxer5Im+KhKxgAZbhrWx8j8uZB9TTxVcis8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxfY5qDAnjp56n47MTxdhbGODdm0sIrVO8pR5wp7tpqU8JESF8s
	ko/oNppt9H3LdLwSBuYWQu+NM0CTakanfnKcuMCBhQ2/zLCLGg/KQkkmVuxqs36Wl8Adz32aFwd
	/HK9fzSh/tktOJYws2RsJTQ90QfpwpYKxM6z7sLMTuEiNqz/fBdCkzKER4JN0lw==
X-Gm-Gg: ASbGncsmkWUqrqJhaSLjktyRbTysmG6dIjkdQGQ5CS3uAMrR4VN7EJAyWajChgphfMd
	VGAZw/i9+fnlNNAItEdAcfVa/1PiJWkAFU9wdvNkfl41t1P/MiFgCuZz5KMvLEWrwTrcKqGcfIT
	nKVNCgWrZIO7dzo4uqoxPi9cgKarsDWLCk6JzHHOWXGwzRY0L2jC8pEuzoKeZi5kCJXS40onFPh
	yMV545eJL/rTMkxE/4pVmq4Krpi6i+uTfzmnFEPhKPoBLhw1Zfu4Q6SHZo4HDboZCqmZOmrbWzk
	q6/CUkE50j7rKoSmtw==
X-Received: by 2002:a05:600c:3494:b0:43d:45a:8fc1 with SMTP id 5b1f17b1804b1-442f20b9b46mr35323505e9.4.1747232378284;
        Wed, 14 May 2025 07:19:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFEF2R2tDjrWwT+L3uOaPxQKRvbLVHWMJVYv5KC6EA6jIX0QqXFdhjGQEIvk4sDMFBkXNW9ig==
X-Received: by 2002:a05:600c:3494:b0:43d:45a:8fc1 with SMTP id 5b1f17b1804b1-442f20b9b46mr35323015e9.4.1747232377726;
        Wed, 14 May 2025 07:19:37 -0700 (PDT)
Received: from stex1.redhat.com ([193.207.203.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442f39e8578sm33288515e9.29.2025.05.14.07.19.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 May 2025 07:19:37 -0700 (PDT)
From: Stefano Garzarella <sgarzare@redhat.com>
To: netdev@vger.kernel.org
Cc: virtualization@lists.linux.dev,
	Stefano Garzarella <sgarzare@redhat.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next v2 1/3] vsock/test: add timeout_usleep() to allow sleeping in timeout sections
Date: Wed, 14 May 2025 16:19:25 +0200
Message-ID: <20250514141927.159456-2-sgarzare@redhat.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250514141927.159456-1-sgarzare@redhat.com>
References: <20250514141927.159456-1-sgarzare@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Garzarella <sgarzare@redhat.com>

The timeout API uses signals, so we have documented not to use sleep(),
but we can use nanosleep(2) since POSIX.1 explicitly specifies that it
does not interact with signals.

Let's provide timeout_usleep() for that.

Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
---
 tools/testing/vsock/timeout.h |  1 +
 tools/testing/vsock/timeout.c | 18 ++++++++++++++++++
 2 files changed, 19 insertions(+)

diff --git a/tools/testing/vsock/timeout.h b/tools/testing/vsock/timeout.h
index ecb7c840e65a..1c3fcad87a49 100644
--- a/tools/testing/vsock/timeout.h
+++ b/tools/testing/vsock/timeout.h
@@ -11,5 +11,6 @@ void sigalrm(int signo);
 void timeout_begin(unsigned int seconds);
 void timeout_check(const char *operation);
 void timeout_end(void);
+int timeout_usleep(useconds_t usec);
 
 #endif /* TIMEOUT_H */
diff --git a/tools/testing/vsock/timeout.c b/tools/testing/vsock/timeout.c
index 44aee49b6cee..1453d38e08bb 100644
--- a/tools/testing/vsock/timeout.c
+++ b/tools/testing/vsock/timeout.c
@@ -21,6 +21,7 @@
 #include <stdbool.h>
 #include <unistd.h>
 #include <stdio.h>
+#include <time.h>
 #include "timeout.h"
 
 static volatile bool timeout;
@@ -28,6 +29,8 @@ static volatile bool timeout;
 /* SIGALRM handler function.  Do not use sleep(2), alarm(2), or
  * setitimer(2) while using this API - they may interfere with each
  * other.
+ *
+ * If you need to sleep, please use timeout_sleep() provided by this API.
  */
 void sigalrm(int signo)
 {
@@ -58,3 +61,18 @@ void timeout_end(void)
 	alarm(0);
 	timeout = false;
 }
+
+/* Sleep in a timeout section.
+ *
+ * nanosleep(2) can be used with this API since POSIX.1 explicitly
+ * specifies that it does not interact with signals.
+ */
+int timeout_usleep(useconds_t usec)
+{
+	struct timespec ts = {
+		.tv_sec = usec / 1000000,
+		.tv_nsec = (usec % 1000000) * 1000,
+	};
+
+	return nanosleep(&ts, NULL);
+}
-- 
2.49.0

