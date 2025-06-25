Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com [209.85.167.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB24D2D8794
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 20:19:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750882752; cv=none; b=o+jp2w38Jv3sOCyCsa2taLbTcdNK8mxwZEzSlWCsxEAWrKHJ5rMP3NsBsZnPkgmBjDeF2Xhbc30lv5h1zzOaQDXz7rUw18zlbQaGufV3dNA4xS9N0ANIr/F5xq2WJ+GGz/mSLhSq3/qXq1g8YrGaN9h3jj+ZTATXJtLv+vg7Djg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750882752; c=relaxed/simple;
	bh=zCwnFT6YvpOnBXES6Ar8fdc609/zgYWwY3IzSAw9dtM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=MS2Ug+c/hf6fssoGv6E9WcuUFt76Cm5POleOlLe+AGN6OClb4w12bUrAC+YiLqkLEm40AAD+M5GHxZh5mi+2wwSmCopiKnNOkA6BjUnXrtrW/3ehbAcyXkU6Gm6BiiJYyIBSNJK6b8eUDX8M5t9nCWn2Wl0/kQwLtm2JBQ5O+yE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jsTJBsug; arc=none smtp.client-ip=209.85.167.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jsTJBsug"
Received: by mail-oi1-f172.google.com with SMTP id 5614622812f47-4080548891fso144777b6e.3
        for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 13:19:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750882750; x=1751487550; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ii7F3KTd50OP4ELYVVkfKIFESVbr68GqYZUwUTPpVR4=;
        b=jsTJBsugYFdJ17Aawxfq727ghHg0g6TcjXxAeugya96z1hV84YogPa2UsrJz1c93DY
         dWXkvjSfNqB1iexv5dbRfQpRlZw7abc8t+QRMtfyNvV6dS3dzQt7dimKM/yNdF5ucUnu
         ZesP8RHNoCmF9PRQ+OUTRuVy+1R0wT8oq1N4LFWAeEDwtgVyExNMFtvknR5Nd6liv0Xv
         gLnIBNUBDqEfOylCSmNrIx1yqRYt8aZYOnzeiEQa+0jdZrpXS9vywYCW/z806H40aqFD
         72C5YqJrBkV2YBZX3ITqHIq4wxXxSs/7tjjOBzeg1bz1ZZ3iKoShGt+VuAq59nVuucga
         DLsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750882750; x=1751487550;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ii7F3KTd50OP4ELYVVkfKIFESVbr68GqYZUwUTPpVR4=;
        b=fhnm1Wh95ej5uctsvXIlQcDPwfcboOu7/N2Ps2xa4qtywzAiXiAC3YsjgPqFyaiSG5
         BeFzuXzCTkXc+8/V2a7FM6Ty+duB4gpDUhuynCA6/wFJWaxHZrZNzaRVZF3G3KBabGNu
         pjeB9JX8/9nVXgZYRKzY5Q/lJTGSkzSYD0c+fhDXFdhDAXal8NBnGk4To+1c5VuwrlHn
         h4Dq7ioAxthpSAdn0eWo5h6oB+y3KXxr6IG/QfW2sv1jj78DSEkIdjBvIpnbIqfT4xrS
         Tx2hTNhZPQtGk/ZIY66P9FTedWBHxoL//JVatY9dH5BjOe+hkynQ7NedtwqfwVz4d1OG
         lM+g==
X-Gm-Message-State: AOJu0Yy76JtOJyRsBFBzIXRjagKGLJWBc0RZXSYCp7IDuE1Z/Z1eLafB
	a4lR8rIPY31xUoeZLOkj8/7aUwkL+r+zKilXawyLc3MCEZiMQ5soasTCBmj7s/7W
X-Gm-Gg: ASbGncs8UO37NIDmnRFxYmrFY2YNANtF7kIqdxPaUrJe9Zj+pqoEAgHDwDxPiCdiPb0
	4qL7FKQ6XGHCOM+oHNZS37Oau1YYPIDOT7OTkLVJBfEshq8wwQe0IhVKwMtNn59eAFZGBVKmRMD
	EFhmmDWG4js+78FsVTRKeM9EPln+T7H3EV/IkJAocdWygqENjH04ypCPita+EcDqKeynRdWzM/+
	Tvjo2bgqYQhodTIF3pVYIii9ll/TBqBD2bNx/wWyzcATAxHJ452CrWCIJ0fYc54u05tbZLTNJNi
	EZ5zCEgT4jptRzZgijpOh0DtWS+Vpv/3t2/qLm6KY3EP2XiDEnrE2/5a3ye1sBwl1kg6SCNHF22
	KrS66dm8=
X-Google-Smtp-Source: AGHT+IGEZJwCIISdIXRvS1gnBkGMKpKYrYU/Oz1NxYRz4ecK56zRfo/tvDDixdQKK2GCSXYcSwb2ng==
X-Received: by 2002:a05:6808:2001:b0:408:e68d:975a with SMTP id 5614622812f47-40b05a11227mr3693289b6e.39.1750882749745;
        Wed, 25 Jun 2025 13:19:09 -0700 (PDT)
Received: from localhost.localdomain ([143.166.81.254])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-40ac6d22c23sm2319188b6e.42.2025.06.25.13.19.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 13:19:09 -0700 (PDT)
From: Stuart Hayes <stuart.w.hayes@gmail.com>
To: linux-kernel@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Martin Belanger <Martin.Belanger@dell.com>,
	Oliver O'Halloran <oohall@gmail.com>,
	Daniel Wagner <dwagner@suse.de>,
	Keith Busch <kbusch@kernel.org>,
	Lukas Wunner <lukas@wunner.de>,
	David Jeffery <djeffery@redhat.com>,
	Jeremy Allison <jallison@ciq.com>,
	Jens Axboe <axboe@fb.com>,
	Christoph Hellwig <hch@lst.de>,
	Sagi Grimberg <sagi@grimberg.me>,
	linux-nvme@lists.infradead.org,
	Nathan Chancellor <nathan@kernel.org>,
	Jan Kiszka <jan.kiszka@seimens.com>,
	Bert Karwatzki <spasswolf@web.de>
Cc: Stuart Hayes <stuart.w.hayes@gmail.com>
Subject: [PATCH v10 1/5] kernel/async: streamline cookie synchronization
Date: Wed, 25 Jun 2025 15:18:49 -0500
Message-Id: <20250625201853.84062-2-stuart.w.hayes@gmail.com>
X-Mailer: git-send-email 2.39.3
In-Reply-To: <20250625201853.84062-1-stuart.w.hayes@gmail.com>
References: <20250625201853.84062-1-stuart.w.hayes@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: David Jeffery <djeffery@redhat.com>

To prevent a thundering herd effect, implement a custom wake function for
the async shubsystem which will only wake waiters which have all their
dependencies completed.

The async subsystem currently wakes all waiters on async_done when an async
task completes. When there are many tasks trying to synchronize on differnt
async values, this can create a thundering herd problem when an async task
wakes up all waiters, most of whom go back to waiting after causing
lock contention and wasting CPU.

Signed-off-by: David Jeffery <djeffery@redhat.com>
Signed-off-by: Stuart Hayes <stuart.w.hayes@gmail.com>
---
 kernel/async.c | 42 +++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 41 insertions(+), 1 deletion(-)

diff --git a/kernel/async.c b/kernel/async.c
index 4c3e6a44595f..ae327f29bac9 100644
--- a/kernel/async.c
+++ b/kernel/async.c
@@ -76,6 +76,12 @@ struct async_entry {
 	struct async_domain	*domain;
 };
 
+struct async_wait_entry {
+	wait_queue_entry_t wait;
+	async_cookie_t cookie;
+	struct async_domain *domain;
+};
+
 static DECLARE_WAIT_QUEUE_HEAD(async_done);
 
 static atomic_t entry_count;
@@ -298,6 +304,24 @@ void async_synchronize_full_domain(struct async_domain *domain)
 }
 EXPORT_SYMBOL_GPL(async_synchronize_full_domain);
 
+/**
+ * async_domain_wake_function - wait function for cooking synchronization
+ *
+ * Custom wait function for async_synchronize_cookie_domain to check cookie
+ * value.  This prevents waking up waiting threads unnecessarily.
+ */
+static int async_domain_wake_function(struct wait_queue_entry *wait,
+				      unsigned int mode, int sync, void *key)
+{
+	struct async_wait_entry *await =
+		container_of(wait, struct async_wait_entry, wait);
+
+	if (lowest_in_progress(await->domain) < await->cookie)
+		return 0;
+
+	return autoremove_wake_function(wait, mode, sync, key);
+}
+
 /**
  * async_synchronize_cookie_domain - synchronize asynchronous function calls within a certain domain with cookie checkpointing
  * @cookie: async_cookie_t to use as checkpoint
@@ -310,11 +334,27 @@ EXPORT_SYMBOL_GPL(async_synchronize_full_domain);
 void async_synchronize_cookie_domain(async_cookie_t cookie, struct async_domain *domain)
 {
 	ktime_t starttime;
+	struct async_wait_entry await = {
+		.cookie = cookie,
+		.domain = domain,
+		.wait = {
+			.func = async_domain_wake_function,
+			.private = current,
+			.flags = 0,
+			.entry = LIST_HEAD_INIT(await.wait.entry),
+		}};
 
 	pr_debug("async_waiting @ %i\n", task_pid_nr(current));
 	starttime = ktime_get();
 
-	wait_event(async_done, lowest_in_progress(domain) >= cookie);
+	for (;;) {
+		prepare_to_wait(&async_done, &await.wait, TASK_UNINTERRUPTIBLE);
+
+		if (lowest_in_progress(domain) >= cookie)
+			break;
+		schedule();
+	}
+	finish_wait(&async_done, &await.wait);
 
 	pr_debug("async_continuing @ %i after %lli usec\n", task_pid_nr(current),
 		 microseconds_since(starttime));
-- 
2.39.3

