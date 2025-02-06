Received: from 009.lax.mailroute.net (009.lax.mailroute.net [199.89.1.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D590A199935
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 17:51:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=199.89.1.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738864321; cv=none; b=Pf681P/rIisZzp0SldgePUsnMOpjPpXQytymDjx+ds7IVhJiGGwsndMJ+bTrF26rbgJPjPjH6CXP/TES74O1h/3yzcTuyIUTr7S9irr0TJwItSTiS65wWvNzbszVETB3vyb7C6U4YqAfEnTEVsSUFicM1ZSxDYI2HFNjs43bMkM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738864321; c=relaxed/simple;
	bh=QeOk9yHXiwSIA/iBDYgqLLHHN26/mJHHIExfPOrZ0nM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CvkXfXY8070PsexOQpf8Pan7BVaaD9bE9WICCWZwoxxLPlhUhqnNCcRzXLtCzClWP8It2FQneP6o8rxMvk46EljIx5FR2dRlN0CmSlJeMJLRDdntVyOeEllOm2RqY6FyqiCbeL0kUYN/WGkGxWymolmRcOK/w8TIRPLus8NKA0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org; spf=pass smtp.mailfrom=acm.org; dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b=dcJv19Gi; arc=none smtp.client-ip=199.89.1.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=acm.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b="dcJv19Gi"
Received: from localhost (localhost [127.0.0.1])
	by 009.lax.mailroute.net (Postfix) with ESMTP id 4Ypl6R2JshzlgTwl;
	Thu,  6 Feb 2025 17:51:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:mime-version:references:in-reply-to
	:x-mailer:message-id:date:date:subject:subject:from:from
	:received:received; s=mr01; t=1738864314; x=1741456315; bh=nTDwq
	5xSfTWMWsTuAPgE3sXZS5cTqu+FlcwQQuHZ9Ks=; b=dcJv19GiFf4ccBsENPo6q
	H2uFvjDlch3EVhO7qXz9i4ovwIV4tcVO51YkE5npHOabQwmI3W0PEcO+m259X0mC
	PEuw6qSkVtc9dn6NVc8bdv2xbhlSFkfmxtQ2KyTZEVQKqQ64V7S+ANC/8BULYTBQ
	orkqyJ1ZtgqxO3qbrW5Ki+tG73zBbac4P3J5+jFnsGYvGOoFhfDF9upBcDSrjGzy
	FJucVgobDNJsyG44RcPEFwpk3F+4ruG5pTYv1eQT0eMlrNmsvvVIvI0Rv2vgi3A0
	B/Oh9WrPTGxCIRPInRbfVaQkn6bOGXLX7iXBbq4utpHSJq8ozm3KqSKnP+TcWf0L
	A==
X-Virus-Scanned: by MailRoute
Received: from 009.lax.mailroute.net ([127.0.0.1])
 by localhost (009.lax [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id pXOx5xWbxiuO; Thu,  6 Feb 2025 17:51:54 +0000 (UTC)
Received: from bvanassche.mtv.corp.google.com (unknown [104.135.204.82])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 009.lax.mailroute.net (Postfix) with ESMTPSA id 4Ypl615JyrzlgTxw;
	Thu,  6 Feb 2025 17:51:37 +0000 (UTC)
From: Bart Van Assche <bvanassche@acm.org>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Will Deacon <will@kernel.org>,
	Christoph Hellwig <hch@lst.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Marco Elver <elver@google.com>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Kees Cook <kees@kernel.org>,
	Jann Horn <jannh@google.com>,
	linux-kernel@vger.kernel.org,
	Bart Van Assche <bvanassche@acm.org>
Subject: [PATCH RFC 07/33] driver core: Annotate locking functions in <linux/device.h>
Date: Thu,  6 Feb 2025 09:50:48 -0800
Message-ID: <20250206175114.1974171-8-bvanassche@acm.org>
X-Mailer: git-send-email 2.48.1.502.g6dc24dfdaf-goog
In-Reply-To: <20250206175114.1974171-1-bvanassche@acm.org>
References: <20250206175114.1974171-1-bvanassche@acm.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Annotate the locking functions in <linux/device.h> with thread-safety
attributes.

Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Bart Van Assche <bvanassche@acm.org>
---
 include/linux/device.h | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/include/linux/device.h b/include/linux/device.h
index 80a5b3268986..125b89fda3af 100644
--- a/include/linux/device.h
+++ b/include/linux/device.h
@@ -31,6 +31,7 @@
 #include <linux/device/class.h>
 #include <linux/device/driver.h>
 #include <linux/cleanup.h>
+#include <linux/thread_safety.h>
 #include <asm/device.h>
=20
 struct device;
@@ -1026,21 +1027,25 @@ static inline bool dev_pm_test_driver_flags(struc=
t device *dev, u32 flags)
 }
=20
 static inline void device_lock(struct device *dev)
+	ACQUIRE(dev->mutex)
 {
 	mutex_lock(&dev->mutex);
 }
=20
 static inline int device_lock_interruptible(struct device *dev)
+	TRY_ACQUIRE(0, dev->mutex)
 {
 	return mutex_lock_interruptible(&dev->mutex);
 }
=20
 static inline int device_trylock(struct device *dev)
+	TRY_ACQUIRE(1, dev->mutex)
 {
 	return mutex_trylock(&dev->mutex);
 }
=20
 static inline void device_unlock(struct device *dev)
+	RELEASE(dev->mutex)
 {
 	mutex_unlock(&dev->mutex);
 }
@@ -1182,9 +1187,11 @@ do { \
 				  _THIS_IP_);                          \
 } while (0)
=20
-void lock_device_hotplug(void);
-void unlock_device_hotplug(void);
-int lock_device_hotplug_sysfs(void);
+DEFINE_CAPABILITY(device_hotplug_capability);
+
+void lock_device_hotplug(void) ACQUIRE(device_hotplug_capability);
+void unlock_device_hotplug(void) RELEASE(device_hotplug_capability);
+int lock_device_hotplug_sysfs(void) TRY_ACQUIRE(0, device_hotplug_capabi=
lity);
 int device_offline(struct device *dev);
 int device_online(struct device *dev);
=20
