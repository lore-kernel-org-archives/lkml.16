Received: from mail-io1-f98.google.com (mail-io1-f98.google.com [209.85.166.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B79820468D
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 19:46:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744832781; cv=none; b=joQYzWEBHzzYViNJGtxhMTzuTqHlJKCtaxh1Mecqab0Kb4yMTy8QRxTS2XDCdI3V6EskMlP617jb6dEoR6Ky4sIbzohz+0PSrNq8aU3f5hepP2TglANN9XsTIQcfd9DZ2RbeE1sf1s08Z0IFTcGk/BSJGTwKU8mMgk7rioUTNAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744832781; c=relaxed/simple;
	bh=gga0MbQ1Hl4K6CTAjakegceyy0H6RjvB7HaC+uLoafM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=uCi6mHptYBI+aY3ClafZXjg+p+kDmvNIJZNDbCVZgi3jSzn5X6i4Cqow7M28/r7h36CzJN+dvJI1DFAZEywEMxXHgauUlhsbEZ/UHFQxFmXctFlVxv67bi8gRAtGEDJgS5BMxF26IKTrQesODZ0o5CxZw+1naw0+YvCOOVZOxUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com; spf=fail smtp.mailfrom=purestorage.com; dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b=bEqmu1wc; arc=none smtp.client-ip=209.85.166.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b="bEqmu1wc"
Received: by mail-io1-f98.google.com with SMTP id ca18e2360f4ac-86142446f3fso21439f.2
        for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 12:46:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1744832778; x=1745437578; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=53p1BwOELVOFcxvuRiM3Mb9M9qJv+fUwivLfHTNYqH0=;
        b=bEqmu1wcO8z4LVGzWcFYPjBsr0QrtwQ1N87MqpLtmDcRGZvytw63REVf1DiHAWh57Y
         K/VyDVZEqd3NCK2umwQsbGSWMMIrT5Suuwb8sg6eOfy3BFjtTR92R+YCAHO35DZdJ+PA
         D6W4VvrXg69p6fnYzawdOIOAg4K7Lln5KfxFp0VcEnVRuUcT5JzcmfYc6wVy5ZOKgB7R
         nr7DK8Dm8Q68T8XdZrtTNWNb7788FeeWi+YulZYXVJwEPQxAilwlCawm05Fxh3Gjzxyf
         3OmU3vfPV78xILa06O62e1vmN4bvKCTkZvQdt7ZDRuM2FdyJ1olA9Yzw3VuB82X6R5r0
         +A7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744832778; x=1745437578;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=53p1BwOELVOFcxvuRiM3Mb9M9qJv+fUwivLfHTNYqH0=;
        b=khgb4xVi2jE2CRtDy9RKOKF4QPau9J/nKvLKGVSR+RvIE+edn+6bjsh+itLRqrTNXi
         RpktbF7qiwFMWhBjk0oGIoLiliLedf5NNAAZ3QZVS2hvGF2z0lsmtGUmak3GVp8yTcqo
         Yxb9Ro3gj+IbDT9X7ysJ/1ozPZ4OghPAbnyczkuIEPuj42Lxl8OyoWYVLB6zzCLDXPvN
         Wzhtr3iWSJkS3sDjGbBT1VsmIsOhylCb5tcuJ2ZKboaxymQs2jSAnCIPR43nTbOJPuDK
         2BLxFNjfF1Zdj12iStKeMssoZBUtiJJrnw31hCzIJja6vhpb2HVDI5XnEx2Gqjd5TTeU
         aX0Q==
X-Forwarded-Encrypted: i=1; AJvYcCUtYWb96VHYTyh3abE9c/DGacixpqJfORPVtk7UvZ8WBN85QgTUGDPn0cmAvjc0lP+InV3W73aIYks5cMQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy24S02t74A+Ihl5r/v5wRpWfUE7hmFcCXBPOad7omrRpAUMgxA
	Xv7vNWLl75uhxJz85HuICIKPavzU5O8sVBJcvL6nEFX+nrMxTeRz1RvBBN0JnvMQjJ0BJ+kDcHt
	/OiNH1qCqAWgDpYGbaSviNpl4N5GVHtY0Vf5ZVCVae7fagrMv
X-Gm-Gg: ASbGncvog++PCkuQotgIUwUpZMzMzAWbnIGHtg/xs+C/5j7vKdcOZI1Me4QHnpoak2+
	40MSaN6pRfQEpj/v1flbKFQ2yyjN4t+0TdqRvnP7tcfsgXdffzQe67bVC00WYRgqQ9bYp4YxlWt
	cOL507gYTyo0Z2NZVSR7A183TdZ8eSSs0G3DJnO9LeaYprUfNpsqxIYLpscBDpZreTEU+KQZD+y
	adr+ax0tEmG0bG39XKurembAGvOEBoD3iYdROy/oDRJpHtRl6K9cUJOzrVAUs89T+btp6HuhP4C
	OvRd8xiyiYHlSdchFNfT0do1bRzzdUA=
X-Google-Smtp-Source: AGHT+IFRK+SWNGDbSYaodhLievdDAeUAC28Cwhp2NaeiPcDnju3mmg8V9zOSHK/TTBEojw4gVHAQVKPP+NGm
X-Received: by 2002:a05:6602:4017:b0:85b:4afc:11d1 with SMTP id ca18e2360f4ac-861c50948fbmr388496939f.5.1744832778346;
        Wed, 16 Apr 2025 12:46:18 -0700 (PDT)
Received: from c7-smtp-2023.dev.purestorage.com ([2620:125:9017:12:36:3:5:0])
        by smtp-relay.gmail.com with ESMTPS id ca18e2360f4ac-86165428d68sm57998839f.11.2025.04.16.12.46.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 12:46:18 -0700 (PDT)
X-Relaying-Domain: purestorage.com
Received: from dev-ushankar.dev.purestorage.com (dev-ushankar.dev.purestorage.com [10.7.70.36])
	by c7-smtp-2023.dev.purestorage.com (Postfix) with ESMTP id 86D9934035E;
	Wed, 16 Apr 2025 13:46:16 -0600 (MDT)
Received: by dev-ushankar.dev.purestorage.com (Postfix, from userid 1557716368)
	id 7D201E407EC; Wed, 16 Apr 2025 13:46:16 -0600 (MDT)
From: Uday Shankar <ushankar@purestorage.com>
Subject: [PATCH v5 0/4] ublk: decouple server threads from hctxs
Date: Wed, 16 Apr 2025 13:46:04 -0600
Message-Id: <20250416-ublk_task_per_io-v5-0-9261ad7bff20@purestorage.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPwIAGgC/3XO0YrDIBAF0F8pPq9l1DGaPvU/liWYZGwl2yZoE
 3Yp+fdqoVDY7OMduOfOnSWKgRI77O4s0hJSGK856I8d687ueiIe+pyZBKkBwfK5/R6am0tDM1F
 swsi7qladr8D2xrFcmyL58PMkP79yPod0G+Pvc2ER5VowFABSSkRl9gqsra3ggs8pbw4uHqc5U
 qm5E+278cIKtMhX+Z9PFsmBt7WxxlDlew3bjHpjBGwwqjBWCLIetUa3zeA7ozcYzIxGKaCthcP
 K/2XWdX0Aj2fQNoEBAAA=
X-Change-ID: 20250408-ublk_task_per_io-c693cf608d7a
To: Ming Lei <ming.lei@redhat.com>, Jens Axboe <axboe@kernel.dk>, 
 Caleb Sander Mateos <csander@purestorage.com>
Cc: linux-block@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Uday Shankar <ushankar@purestorage.com>
X-Mailer: b4 0.14.2

This patch set aims to allow ublk server threads to better balance load
amongst themselves by decoupling server threads from ublk queues/hctxs,
so that multiple threads can service I/Os from a single hctx.

Signed-off-by: Uday Shankar <ushankar@purestorage.com>
---
Changes in v5:
- Set io->task before ublk_mark_io_ready (Caleb Sander Mateos)
- Set io->task atomically, read it atomically when needed
- Return 0 on success from command-specific helpers in
  __ublk_ch_uring_cmd (Caleb Sander Mateos)
- Rename ublk_handle_need_get_data to ublk_get_data (Caleb Sander
  Mateos)
- Link to v4: https://lore.kernel.org/r/20250415-ublk_task_per_io-v4-0-54210b91a46f@purestorage.com

Changes in v4:
- Drop "ublk: properly serialize all FETCH_REQs" since Ming is taking it
  in another set
- Prevent data races by marking data structures which should be
  read-only in the I/O path as const (Ming Lei)
- Link to v3: https://lore.kernel.org/r/20250410-ublk_task_per_io-v3-0-b811e8f4554a@purestorage.com

Changes in v3:
- Check for UBLK_IO_FLAG_ACTIVE on I/O again after taking lock to ensure
  that two concurrent FETCH_REQs on the same I/O can't succeed (Caleb
  Sander Mateos)
- Link to v2: https://lore.kernel.org/r/20250408-ublk_task_per_io-v2-0-b97877e6fd50@purestorage.com

Changes in v2:
- Remove changes split into other patches
- To ease error handling/synchronization, associate each I/O (instead of
  each queue) to the last task that issues a FETCH_REQ against it. Only
  that task is allowed to operate on the I/O.
- Link to v1: https://lore.kernel.org/r/20241002224437.3088981-1-ushankar@purestorage.com

---
Uday Shankar (4):
      ublk: require unique task per io instead of unique task per hctx
      ublk: mark ublk_queue as const for ublk_commit_and_fetch
      ublk: mark ublk_queue as const for ublk_register_io_buf
      ublk: mark ublk_queue as const for ublk_handle_need_get_data

 drivers/block/ublk_drv.c | 205 +++++++++++++++++++++++------------------------
 1 file changed, 100 insertions(+), 105 deletions(-)
---
base-commit: d3b4b25e363e4ce193e6103e64f7de12b96668b9
change-id: 20250408-ublk_task_per_io-c693cf608d7a

Best regards,
-- 
Uday Shankar <ushankar@purestorage.com>

