Received: from mail-il1-f225.google.com (mail-il1-f225.google.com [209.85.166.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 350F3218EBA
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 23:01:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.225
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748386904; cv=none; b=MufaEmt90N+6EGgBlsbRQMs597QbFcL8U8nq8Lv3I4sXpj9iR0JepAaT0lgYBpV9AcKkocPZ3R0veHJU/6OUK66e4aeojXlb+DMn9dI8YrBSA4tp0TJ8dTWwo0pG0c+2pIKyeKVkX3IxxnZIbPwo+fAdi69srVP2g2BvltE6/aE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748386904; c=relaxed/simple;
	bh=Dig0OUZkUl5vE5F40iqhcNPgmSU4xHuO/wqfXO7v978=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PVfXbYoTOSviYtCuEhrxOUH3oA+Sg3nCth+77XtidIds8x07poalg/XvvW+rhARoaqjY+w61iQp2XNmJP2rpkQrtQ0de9cIbVOPUjOD+JtrgcD+6S+eysjsq1Qy75/mpbuoWPxMYjf3lHKLRbQynTnKRkaXmT05oreWnoQfWIPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com; spf=fail smtp.mailfrom=purestorage.com; dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b=RG+F30VA; arc=none smtp.client-ip=209.85.166.225
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b="RG+F30VA"
Received: by mail-il1-f225.google.com with SMTP id e9e14a558f8ab-3dd87b83302so2655615ab.0
        for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 16:01:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1748386899; x=1748991699; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jAsa4vGSGhbQUBqDQbGCceYtmCgXKGpcXMsuwinXv+c=;
        b=RG+F30VAatBu/8eE88aSq5TpDRdxCCzMxv7scGodzzWQ4VByWThwwEAj2lxtP1EOdG
         WpA0NA66TlMleGd4yAoTBhzIiqY75bTkoNzovQdnqNdPew7JzeSJWR6w4dcipV+cuyzy
         VH+NiV2E0z8Zl7mpnDLT/kcyiJF3qm0C4sOXf50gW6Q6DlHfqEJ8/y9bBx1l7W7yB+Cw
         UicjU0wk73EJz6QHP9OGF9VlrEIByXeqgOHbQbtZWwyIOvTQxGcyWHdVgz0aKe3drCBl
         kMQdhXY93gG8GsmXTwOw+h3ZqTx7idpHu9GPD05GxQlZYSnVZTW/28Ql1CwNXtqsi2kY
         VPtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748386899; x=1748991699;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jAsa4vGSGhbQUBqDQbGCceYtmCgXKGpcXMsuwinXv+c=;
        b=jbluqLZzmA2dMycG7IxZX0eTsnFHzMstiB5tWc5Vyw+mNS1rTAnpUK0k7nVPgZTg0g
         tF4u2Smd81fIEvV8Cf+EYlzhxfjWoYAjXk3qd8YoKQsypFyxQhntpY6Zcot1hTyITvAB
         WqWlVoXrbbeL86ZKx1hZ0ixXERSICoNnxXb+9hCcoYas+j0OoNxETEgzQnfhxBRsV6JM
         1EExNbHADPw7N3fDU+pTQUNyrXyJ+2gQ6HKuIcW8hx5ZknPV9ehVq8cnzfXfYUs+68E0
         rbfhA22L4Om+NJs0mttybblQpu6VY21l7uYwlOOVLGN/DCuSW3qxwPpm6sjQV4vxXm2w
         FC6Q==
X-Forwarded-Encrypted: i=1; AJvYcCX9SMTjdCvuiUGkXiUqtWuyYkkneyD6g2SyEBn9QT1i0LYJqVUkA/KuryQ1zpGIGcbhmuzjHAM2+5IHyL4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4392iPnMHJeCocPHzh3xpFzBjCUBHBlqtZIX8/XGj2x1KGQpc
	3gSFr75cgSA0m3f2Q9w0iEu05k2NJEGYihFEqDa52TToQugBu/FGvahuTfUbLsUwe2knhHpTMQE
	RNPPpxI8/yogkaLRPWKBP/eMQU/2pdqWxAo47
X-Gm-Gg: ASbGncu88YD2cuRqW9Z3D1zQ5vCkK3lPgGprcQ3MhG24PS+LTo00InBSlobjqqexfYI
	RxJkeDW7Jd3eaMronI+zO9mlLBsNdJGs2HxQSJNtrfVek6OnSlCs77mw05Vhwahu+sbPqsLRJPk
	OML8IxGgnvAT3jhMPv2NRg3jt+ugpdHo3kWoh9vLG4QFV+shU/BM2VfHt0vsmS5HhLk6DfH1eel
	pWwVkA5C2zUVTV38hyaRnYyECN4Y4y1Fbac7vM5OqpoSRiv5W27lxH6v1TSPGciD9rnVkfGOSh+
	6fzr5tIalypxpuzGz2+5wOzCgdayk4KFOGR075xngHnP7Q==
X-Google-Smtp-Source: AGHT+IHAa3L6pqwarpZSZxaEtNuL9OzSbgUval9F/ufullU3Up5cwONiGk6mYEcbpNd8+wa8Usva18dxIi1/
X-Received: by 2002:a05:6e02:1709:b0:3d9:34c8:54ce with SMTP id e9e14a558f8ab-3dc9b705b34mr154783995ab.18.1748386898746;
        Tue, 27 May 2025 16:01:38 -0700 (PDT)
Received: from c7-smtp-2023.dev.purestorage.com ([208.88.159.129])
        by smtp-relay.gmail.com with ESMTPS id e9e14a558f8ab-3dd89c0e368sm158675ab.69.2025.05.27.16.01.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 May 2025 16:01:38 -0700 (PDT)
X-Relaying-Domain: purestorage.com
Received: from dev-ushankar.dev.purestorage.com (dev-ushankar.dev.purestorage.com [IPv6:2620:125:9007:640:7:70:36:0])
	by c7-smtp-2023.dev.purestorage.com (Postfix) with ESMTP id 4C62E340A4D;
	Tue, 27 May 2025 17:01:36 -0600 (MDT)
Received: by dev-ushankar.dev.purestorage.com (Postfix, from userid 1557716368)
	id 4A532E539B9; Tue, 27 May 2025 17:01:36 -0600 (MDT)
From: Uday Shankar <ushankar@purestorage.com>
Date: Tue, 27 May 2025 17:01:31 -0600
Subject: [PATCH v7 8/8] Documentation: ublk: document UBLK_F_PER_IO_DAEMON
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250527-ublk_task_per_io-v7-8-cbdbaf283baa@purestorage.com>
References: <20250527-ublk_task_per_io-v7-0-cbdbaf283baa@purestorage.com>
In-Reply-To: <20250527-ublk_task_per_io-v7-0-cbdbaf283baa@purestorage.com>
To: Ming Lei <ming.lei@redhat.com>, Jens Axboe <axboe@kernel.dk>, 
 Caleb Sander Mateos <csander@purestorage.com>, 
 Andrew Morton <akpm@linux-foundation.org>, Shuah Khan <shuah@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>
Cc: linux-block@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, linux-doc@vger.kernel.org, 
 Uday Shankar <ushankar@purestorage.com>
X-Mailer: b4 0.14.2

Explain the restrictions imposed on ublk servers in two cases:
1. When UBLK_F_PER_IO_DAEMON is set (current ublk_drv)
2. When UBLK_F_PER_IO_DAEMON is not set (legacy)

Remove most references to per-queue daemons, as the new
UBLK_F_PER_IO_DAEMON feature renders that concept obsolete.

Signed-off-by: Uday Shankar <ushankar@purestorage.com>
---
 Documentation/block/ublk.rst | 35 ++++++++++++++++++++++++-----------
 1 file changed, 24 insertions(+), 11 deletions(-)

diff --git a/Documentation/block/ublk.rst b/Documentation/block/ublk.rst
index 854f823b46c2add01d0b65ba36aecd26c45bb65d..c368e1081b4111c581567058f87ecb52db08758b 100644
--- a/Documentation/block/ublk.rst
+++ b/Documentation/block/ublk.rst
@@ -115,15 +115,15 @@ managing and controlling ublk devices with help of several control commands:
 
 - ``UBLK_CMD_START_DEV``
 
-  After the server prepares userspace resources (such as creating per-queue
-  pthread & io_uring for handling ublk IO), this command is sent to the
+  After the server prepares userspace resources (such as creating I/O handler
+  threads & io_uring for handling ublk IO), this command is sent to the
   driver for allocating & exposing ``/dev/ublkb*``. Parameters set via
   ``UBLK_CMD_SET_PARAMS`` are applied for creating the device.
 
 - ``UBLK_CMD_STOP_DEV``
 
   Halt IO on ``/dev/ublkb*`` and remove the device. When this command returns,
-  ublk server will release resources (such as destroying per-queue pthread &
+  ublk server will release resources (such as destroying I/O handler threads &
   io_uring).
 
 - ``UBLK_CMD_DEL_DEV``
@@ -208,15 +208,15 @@ managing and controlling ublk devices with help of several control commands:
   modify how I/O is handled while the ublk server is dying/dead (this is called
   the ``nosrv`` case in the driver code).
 
-  With just ``UBLK_F_USER_RECOVERY`` set, after one ubq_daemon(ublk server's io
-  handler) is dying, ublk does not delete ``/dev/ublkb*`` during the whole
+  With just ``UBLK_F_USER_RECOVERY`` set, after the ublk server exits,
+  ublk does not delete ``/dev/ublkb*`` during the whole
   recovery stage and ublk device ID is kept. It is ublk server's
   responsibility to recover the device context by its own knowledge.
   Requests which have not been issued to userspace are requeued. Requests
   which have been issued to userspace are aborted.
 
-  With ``UBLK_F_USER_RECOVERY_REISSUE`` additionally set, after one ubq_daemon
-  (ublk server's io handler) is dying, contrary to ``UBLK_F_USER_RECOVERY``,
+  With ``UBLK_F_USER_RECOVERY_REISSUE`` additionally set, after the ublk server
+  exits, contrary to ``UBLK_F_USER_RECOVERY``,
   requests which have been issued to userspace are requeued and will be
   re-issued to the new process after handling ``UBLK_CMD_END_USER_RECOVERY``.
   ``UBLK_F_USER_RECOVERY_REISSUE`` is designed for backends who tolerate
@@ -241,10 +241,11 @@ can be controlled/accessed just inside this container.
 Data plane
 ----------
 
-ublk server needs to create per-queue IO pthread & io_uring for handling IO
-commands via io_uring passthrough. The per-queue IO pthread
-focuses on IO handling and shouldn't handle any control & management
-tasks.
+The ublk server should create dedicated threads for handling I/O. Each
+thread should have its own io_uring through which it is notified of new
+I/O, and through which it can complete I/O. These dedicated threads
+should focus on IO handling and shouldn't handle any control &
+management tasks.
 
 The's IO is assigned by a unique tag, which is 1:1 mapping with IO
 request of ``/dev/ublkb*``.
@@ -265,6 +266,18 @@ with specified IO tag in the command data:
   destined to ``/dev/ublkb*``. This command is sent only once from the server
   IO pthread for ublk driver to setup IO forward environment.
 
+  Once a thread issues this command against a given (qid,tag) pair, the thread
+  registers itself as that I/O's daemon. In the future, only that I/O's daemon
+  is allowed to issue commands against the I/O. If any other thread attempts
+  to issue a command against a (qid,tag) pair for which the thread is not the
+  daemon, the command will fail. Daemons can be reset only be going through
+  recovery.
+
+  The ability for every (qid,tag) pair to have its own independent daemon task
+  is indicated by the ``UBLK_F_PER_IO_DAEMON`` feature. If this feature is not
+  supported by the driver, daemons must be per-queue instead - i.e. all I/Os
+  associated to a single qid must be handled by the same task.
+
 - ``UBLK_IO_COMMIT_AND_FETCH_REQ``
 
   When an IO request is destined to ``/dev/ublkb*``, the driver stores

-- 
2.34.1

