Received: from mail-il1-f226.google.com (mail-il1-f226.google.com [209.85.166.226])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D8381E4929
	for <linux-kernel@vger.kernel.org>; Sun, 27 Apr 2025 04:58:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.226
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745729895; cv=none; b=cm+9I007lNpav9tjofKBpKQU+0KAU+fCywYkswjMyT8aloM+BvoMMzwmPTa89DNSWXR/THMcS5ZNgfmGpH2W8kRtA0wXiKhhEI0gwMNRRFPY2ILTPL7FOuID0RkH1au7GBaPp9Lh51IUcnob/2Aw1OatkGDrTnkYupBy4zaoAiI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745729895; c=relaxed/simple;
	bh=EGjGvQiLy6/0dGH0rf4vi2XFjxP0Q7Nii+w2OPcP1UA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PTetJB1FhsWHSeguH78oxpdX/Z6/PsPRAW0Tnh7TK9KwCKpNGLEnpV206jV1fd1/EJR0gCTDdd4I4e/TxjxSggQrOSyHfCdBc+LjR9804VjThMFbIyq9Q32NL6HeUIJtjU44OZiJi12xCCFfhCad84Pa6hDcoIXNrjStQSXgY1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com; spf=fail smtp.mailfrom=purestorage.com; dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b=S83+vAxh; arc=none smtp.client-ip=209.85.166.226
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b="S83+vAxh"
Received: by mail-il1-f226.google.com with SMTP id e9e14a558f8ab-3d8081a2f4cso1014435ab.3
        for <linux-kernel@vger.kernel.org>; Sat, 26 Apr 2025 21:58:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1745729892; x=1746334692; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5jjGLpUlxlPMxngVK27jDZo+zNj8tC/Y3I19hk9qgLM=;
        b=S83+vAxhEMrtxrw8U2nZBPIUSR6RLn0G0sA5rs9rh0GAdn86PGtZA59OQcgm3/Jhd2
         P0Ei0cMUyzr9rc305IQ6gRAm5hUKlwF0raQRb8krjwU90TDI2wXYYb8JQoXC2Zn0U5fH
         xkzIwxR47syc0lNIbhxYWdVYdykpS/pp/04M9Eyt+eUSv4KIWYkNeavJ3dJCN51/XGIy
         QOF3EBgy3odIJhxM7XOU+0oq7HSPvt3WBIkUmuiIR0Hn3E96s+1e1TuxeiymBSavGku4
         zwUYFId/39r4cNK0CIDR/6bZh7JcXQ/3GxzJED5yk282vDXLsmVF8nMSkL5B9FaCykDo
         NFlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745729892; x=1746334692;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5jjGLpUlxlPMxngVK27jDZo+zNj8tC/Y3I19hk9qgLM=;
        b=Zu1bHLWgXvJ/5ymmA/69jbwB6qhWxxKC0zdCvR0gqD8cBQbHRSIBGbpbliXbpkV1wV
         a0LBKJdQyDzh6EIqpdR4LiaYGDryj2h/zhdCFfn8EBJ24dQiNrFyeZgUdG555C674oaH
         8UKat7m+MDPnyjMqprebwXFiIJCZxRU8kuREWoQeUSv2eJZjLhr2/6B1P0QFE1bLpt6k
         KhV8M7FpJvqZ4X5AgiFzLQeseRw7SU8TzbLk2M2TEBMqENyfXK3nlX0ZyJ9cvWawfpfI
         7X+ztH1WBPL7XRMFcAMP63kqU13hN0RnMAbpZyBMutTQ22Ud7Hy8fZsnWLc9LwPuJB+N
         EjCQ==
X-Forwarded-Encrypted: i=1; AJvYcCWh5UKLxS15TnWdDtAngVbWgj7Rpu2NCi3JWShohPm9FPwoImaMk6E1A357nsJc+QjW8/t5yi8JA66tHxc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxVmSjKeyvuSjxj4FnVeShexmPqJLM+wOnKM9gYwv8t0Lcbzrwe
	+hpvsXA7juVSLla/48rVQKqiriqrrxZgcZPUhnhovS3LuIeiaq5Yxpzd84O2H9IaZ4uxy8VNBKP
	aMteAfELNPSzEZX0omQmOakt+s48lfSvJ
X-Gm-Gg: ASbGncvlEE15LSuns8o9xCTmGpi6EgtG0Q+ZVOP5oOqYAPq8pW23rforIXI+EKw7Yw1
	SKNe7o0/rN6u5uyhGcT7HOWTalES78jVIqp8bSR/DU9tLPsxoWFEAPIqiKc2/Vi6xHmjo1VN9/o
	zVoIIjngfZ1WvZVWBxJh5/bGQvvE0lytFBFsqXdIJS4X8sIDYMflqOr5wmkkN/j9m5GsYSC8d0U
	H/uHt1mmtTFcSFgvzSpKd8XmIXlyYwykwdxNrWLfcAkaNQw06StcyimP/duo/IqciRBxGXXBpXP
	OC4UKlft2IWQfIZf0w8DzvF07sopT3hmaYcUiFWPOacP
X-Google-Smtp-Source: AGHT+IG2J65M6dtSAjI+IJQgRVi+gn8BXNStjIyp+ZYP3gMTx6RgPkWkqcYi/uYG2PVh0DIwISZ5NfUuzbB3
X-Received: by 2002:a05:6e02:2195:b0:3d6:cd13:8465 with SMTP id e9e14a558f8ab-3d93b3a7d1bmr15346875ab.1.1745729892592;
        Sat, 26 Apr 2025 21:58:12 -0700 (PDT)
Received: from c7-smtp-2023.dev.purestorage.com ([208.88.159.128])
        by smtp-relay.gmail.com with ESMTPS id e9e14a558f8ab-3d9314ffa58sm5643105ab.6.2025.04.26.21.58.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Apr 2025 21:58:12 -0700 (PDT)
X-Relaying-Domain: purestorage.com
Received: from dev-csander.dev.purestorage.com (unknown [IPv6:2620:125:9007:640:ffff::418a])
	by c7-smtp-2023.dev.purestorage.com (Postfix) with ESMTP id E6A2934031E;
	Sat, 26 Apr 2025 22:58:11 -0600 (MDT)
Received: by dev-csander.dev.purestorage.com (Postfix, from userid 1557716354)
	id DFF3CE40C3E; Sat, 26 Apr 2025 22:58:11 -0600 (MDT)
From: Caleb Sander Mateos <csander@purestorage.com>
To: Ming Lei <ming.lei@redhat.com>,
	Jens Axboe <axboe@kernel.dk>
Cc: Uday Shankar <ushankar@purestorage.com>,
	linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Caleb Sander Mateos <csander@purestorage.com>
Subject: [PATCH 0/8] ublk: simplify NEED_GET_DATA handling and request lookup
Date: Sat, 26 Apr 2025 22:57:55 -0600
Message-ID: <20250427045803.772972-1-csander@purestorage.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove accesses to ublk_io's cmd field after the I/O request is posted to the
ublk server. This allows the cmd field to be overlapped with a pointer to the
struct request, avoiding several blk_mq_tag_to_rq() lookups.

Fix a couple of typos noticed along the way.

Caleb Sander Mateos (7):
  ublk: fix "immepdately" typo in comment
  ublk: remove misleading "ubq" in "ubq_complete_io_cmd()"
  ublk: don't log uring_cmd cmd_op in ublk_dispatch_req()
  ublk: factor out ublk_start_io() helper
  ublk: don't call ublk_dispatch_req() for NEED_GET_DATA
  ublk: check UBLK_IO_FLAG_OWNED_BY_SRV in ublk_abort_queue()
  ublk: store request pointer in ublk_io

Uday Shankar (1):
  ublk: factor out ublk_commit_and_fetch

 drivers/block/ublk_drv.c | 234 ++++++++++++++++++++-------------------
 1 file changed, 120 insertions(+), 114 deletions(-)

-- 
2.45.2

