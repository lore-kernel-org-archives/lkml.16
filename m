Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3241A20D514
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 12:44:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743079488; cv=none; b=Dx8bXYmoe+hXCcYphTELtNs9MLAUYRjzRTA94GfhxnFMeBkVo+dmHtKkQcwcFb8v7wX2GFj+EjHZnwkkAhz80NpR4oDfHkcrspPOPYaOzaCcfwl2KMy65gmB6II9lG6/mOhYfnlJ8Hl/KWCTN2nJ3Z4vX/V1783n/uvmzmWoFDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743079488; c=relaxed/simple;
	bh=i5JQm9DqrSRQ96Mfvrlb1RwHHX8YBXcxQ9y8zq+dgJg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cjWNL00mKT0ouP6sdo7qDc2eS6VUaLZm7q2JV9Fvx9W5oEstPgtP3/QEISCWuhOD0Jt+bQr6hpkJfvWpZ2au1ZoRPki0502ANWN50IBfAk2LZOrHzcNB2zl0Z2TByUftiB8BaAUZP06h7gpqAcufNuUTEiTkdq4tdNJGoS1AYPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Q5o3Trzf; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Q5o3Trzf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743079486;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=kfyheL9jEG9357hLbmic+IF7J8U9ykncYZ9iUVWBbFY=;
	b=Q5o3TrzfzgzscKq3hcqaB2MuUEMtIkT5EiT7ycJQs2Es6TJKOJ4vmg6ulW0p1Rv+j6LqMS
	BD5+NRZEig+FXZVKYJOLyqBf487bhCiDdP5wu2VDDRarMY21LJEKs0HUEjd7i1rH74NwBw
	ORF+2yZYiqFC9xqvFPx+fv4nKMTbOAg=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-372-qD18Y6PfO6eZs4FTz8R4fQ-1; Thu, 27 Mar 2025 08:44:45 -0400
X-MC-Unique: qD18Y6PfO6eZs4FTz8R4fQ-1
X-Mimecast-MFC-AGG-ID: qD18Y6PfO6eZs4FTz8R4fQ_1743079484
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-391425471ddso745282f8f.0
        for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 05:44:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743079484; x=1743684284;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kfyheL9jEG9357hLbmic+IF7J8U9ykncYZ9iUVWBbFY=;
        b=uGkNgPLtBCk8HZhWVxDccnvxDnGAwMnd6mU+7Ew9/k0HoUjQaiExWK3aTY+U00+a25
         vDSJCxSOoO3/ELJuPJOSboc/ws2e4nlxlZXwCaYm+qqhmTAcjGjigtzcGAhJbrLj+hZQ
         KTidODNYk9tqd2uOKJUyw5zhsJ/jwxGYXWMh51P2lKtLmceu2GSeWmiKzv44uvM5spoy
         3nMdT4Cdjlw9fKPdTQox12pvVutvFxaQ8Jz7IBunF/DmmPMebvsaxED5mVdPJdtSvUW+
         7esLi9PewGq96Bh9bYi4M3jsvEo/PNO94FhmTeDMYDLZfNkzxg7tg50P58W8YgIJ4qCK
         78Qw==
X-Forwarded-Encrypted: i=1; AJvYcCXfpW8q1SoqZEWlf1MB4v4zdbelFaME7DdkZ+DUC58lILO3aUPi8SVgSvR18J9mq1ggYaPvMO/zw+MUDqE=@vger.kernel.org
X-Gm-Message-State: AOJu0YyyfTJybsdYLa2D71Va3r5yVhapa3CrwO/05YdtVAWBrUrSKbxN
	79ypUhOo/3AdX+gHifydYZdKNP2QnCfuq9fuu6pFNxx3VDpjlUw/QxXL+j6L8ut4ElLLS+yjRuY
	HWE1CpUAy8pvVWOECzbMP1XMpVKuQwgINjM0m9DPHZfn+ObmYxS56Pd/EuvChsA==
X-Gm-Gg: ASbGncvqarQyEbMDtitT2VdFYOl6Glrin5pkrhRVesgxULHv8rY6IZyw8cCfH6BXCWE
	efaNZZuQMJk0clspX1sxdzQfImN3D3hPFNEmfFQKsO2IwW/N9/6BkVPi5ZxFVvPzHOktgVdbkpi
	znm27+GhxNCyjkUINyM7IeiIuvJeS2p0AbfZlI39GuHmvL8a+HBhYzm5U2/EKrcWaMQeK5VnbrV
	dx5E5DSpEalV9r8glQDTtm6I5cRPik0Dh4Imkjso9r1+LJYlP/Cojc7U9SUak8JnQljPtjeWNZE
	33Pk2Yv4cQG2+lvCSG2LkSQZaM7bVgxrDL8BefFC/9srzNlS61SCArt5McjSYizhHQ==
X-Received: by 2002:a5d:6c6c:0:b0:38c:2745:2df3 with SMTP id ffacd0b85a97d-39ad17845f7mr3077942f8f.37.1743079483838;
        Thu, 27 Mar 2025 05:44:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFlm4s0EdoS5CN0bcv1wS4l/Yn0TLs2QyE9bGxPtaa+Rs3z5qIUN6VRMhNwAZdWNibUqtu8qg==
X-Received: by 2002:a5d:6c6c:0:b0:38c:2745:2df3 with SMTP id ffacd0b85a97d-39ad17845f7mr3077908f8f.37.1743079483197;
        Thu, 27 Mar 2025 05:44:43 -0700 (PDT)
Received: from stex1.redhat.com (host-87-12-25-55.business.telecomitalia.it. [87.12.25.55])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3997f9a3f76sm19986612f8f.37.2025.03.27.05.44.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Mar 2025 05:44:42 -0700 (PDT)
From: Stefano Garzarella <sgarzare@redhat.com>
To: mst@redhat.com
Cc: Mike Christie <michael.christie@oracle.com>,
	netdev@vger.kernel.org,
	Keith Busch <kbusch@kernel.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>,
	kvm@vger.kernel.org,
	virtualization@lists.linux.dev,
	Jason Wang <jasowang@redhat.com>,
	linux-kernel@vger.kernel.org,
	Stefano Garzarella <sgarzare@redhat.com>
Subject: [PATCH] vhost_task: fix vhost_task_create() documentation
Date: Thu, 27 Mar 2025 13:44:35 +0100
Message-ID: <20250327124435.142831-1-sgarzare@redhat.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Garzarella <sgarzare@redhat.com>

Commit cb380909ae3b ("vhost: return task creation error instead of NULL")
changed the return value of vhost_task_create(), but did not update the
documentation.

Reflect the change in the documentation: on an error, vhost_task_create()
returns an ERR_PTR() and no longer NULL.

Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
---
 kernel/vhost_task.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/vhost_task.c b/kernel/vhost_task.c
index 2ef2e1b80091..2f844c279a3e 100644
--- a/kernel/vhost_task.c
+++ b/kernel/vhost_task.c
@@ -111,7 +111,7 @@ EXPORT_SYMBOL_GPL(vhost_task_stop);
  * @arg: data to be passed to fn and handled_kill
  * @name: the thread's name
  *
- * This returns a specialized task for use by the vhost layer or NULL on
+ * This returns a specialized task for use by the vhost layer or ERR_PTR() on
  * failure. The returned task is inactive, and the caller must fire it up
  * through vhost_task_start().
  */
-- 
2.49.0

