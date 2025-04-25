Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8607A23F40F
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 12:01:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745582513; cv=none; b=p6KKzLGZ5/kuQj+rYIX5fiNh0z0zgDVJ942tyPNmNGrpu+ZIFY7OgT27hBCwIeZd6oQPR7qLgKB6apbgiCcS87XDUA/JuzOwLezpH5QZjDRySfu0f1sb3MD5UyxO2UZlo0oevgkpOFf34lLyYcTXwK6gOW4P5jbPLNeodye6v3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745582513; c=relaxed/simple;
	bh=sr/L7P9NyVXmDhkhLTSKvMBxnt8Lbfe5lBo13+p5tO4=;
	h=From:Subject:To:Message-ID:Date:MIME-Version:Content-Type; b=UBnRPN+bJwHQF4uKX8DqcVUJhxUNmNxoValBlanUALSv/wts2ySABh5Bbv9P6St9kYTrW1rzObCWyGqN8+oWUmJaoOy/n+lkC3CdUUam4Gk6+7uPk8OEl7rHkv8MRuy/N8AWD+fUATOxR+NTuGFEVBFSYy941nxanYaa6yxMjoI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Epfbyc4R; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Epfbyc4R"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-b0db0b6a677so2066816a12.2
        for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 05:01:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745582512; x=1746187312; darn=vger.kernel.org;
        h=content-transfer-encoding:content-language:mime-version:user-agent
         :date:message-id:to:subject:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BrTueyvSv030EN4sYt0wA9U0PjYlqyc0AfIs6yiLAkI=;
        b=Epfbyc4RxlV0l/5zqB424NQ6JHaf32vm3vgVdQsmF+PVyHUg317zCZTyfPw3f2sf+F
         8HDuLS9i6allFpEFG3jbfPgb+8W0erx3qBBKw1WODZBece9O+oYEtj82BLxCvRwelF1r
         WDHJg8CxaDcsdYvHmidqVQui2nfi3l1Y9NmySAIQ/kCewhSyH2LnUdqwlijRoqTMfabD
         AskW8p0sd4C/bQKbt6zc6ieHIs0kBdroYSnv/fqUn3WoLgf988dW2w21KW6djbGydZMO
         s/opv5rsNhImOV/uBU25Ed2l0LlWfQEiO2JjjoIrOPfue4sFr4SABLPjPqqqRKfomPsm
         HdeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745582512; x=1746187312;
        h=content-transfer-encoding:content-language:mime-version:user-agent
         :date:message-id:to:subject:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BrTueyvSv030EN4sYt0wA9U0PjYlqyc0AfIs6yiLAkI=;
        b=lk0+6mYM7TO0f/9+lbgbq/EWV2jvJ3xEPveDgpSl3aT5r5YP+u+S04uYW1kRhKFEvi
         xwvFhqJy5wYNEu+jhmb39A0+CLk04FUYQn8JPyMUujXKc9aE0v2Deynm0Iw8cO2JYAp0
         sdzoEQcgeblJdCDy9C6Q121mnfq2G5bawA3pT2gcDx5hEWbvqGl7YjYfu09Pn85TrTOf
         pIbDv0tIwERv3JxuWgTMoBx5WDl4KX9Pr0T/IVIfpoqqTwOc3WN6KOjCwlBAzloXItJL
         moHYAoY7MPKZZT2s9ghr+JYyut81XfGZDwqvcz6Y7LFG98HU5duNkfch5gFvJn1j7tHh
         J1FQ==
X-Forwarded-Encrypted: i=1; AJvYcCUTrSjpDXzg+3Zb3LlyEXpmVilPmcIGnCSRjHHleV6CMmHAdullIbUZssObVDrQZz6Vd9staL0xPul4cFs=@vger.kernel.org
X-Gm-Message-State: AOJu0YxlnxirR7ORzg0meQCQFgH9nkcHsFLy8cyaywVcCWszbAtouSpc
	LtrduDpbj1pa+GDFSQ3cfdkd52aDl22wX71XbfDsPBsH7/bZU/jA
X-Gm-Gg: ASbGncv39jF2pdAwNoyaeptEAlgyZ/Ari/OnZNmYU3+CrQGWXIPZFSwKnF7zTNw3XQt
	SokYBmmDg96XTL/CJ6hyQ1nYCXFxXDrBfm8RaSyLHbiFHWV47RpLQ61YVMucYgA0+ykRU6wM9EZ
	B8LLANwvCCPwjNJod2PBZp78oT/QQV2pQREdvFLC4r9K0agjhtVPRPjlFhkjzmpXpU2PIbuwECS
	zwAajqPGesEYiNFC3KSyK1WPq6Vz/fVc346GA4oTNS/EVO07oAQffTFtezwD+e/v4wJUPP3UK6n
	TXakIc/H01vz60vVXAvOuhOy1LFvKQInQ3ffPs+8RNSldfU/3K22AKkvs0KwtbqH
X-Google-Smtp-Source: AGHT+IFA65zpC6I246Bhs6NDqqDCpEpSzSW86iFMSwfnyo2YHD7VdT33U3Mu3SHxOk5pVCgE/dfnAQ==
X-Received: by 2002:a17:90b:3a82:b0:2ea:7cd5:4ad6 with SMTP id 98e67ed59e1d1-309f7e9ee30mr2795131a91.32.1745582511610;
        Fri, 25 Apr 2025 05:01:51 -0700 (PDT)
Received: from [0.0.0.0] ([103.127.219.137])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db4d771a8sm30328495ad.22.2025.04.25.05.01.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Apr 2025 05:01:51 -0700 (PDT)
From: Linjun Bao <meljbao@gmail.com>
Subject: [PATCH] nvme: avoid missing db ring during reset
To: Keith Busch <kbusch@kernel.org>, Jens Axboe <axboe@fb.com>,
 Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>,
 linux-kernel@vger.kernel.org, linux-nvme@lists.infradead.org
Message-ID: <fa04f3d5-56ff-62bb-0afd-ad94e961ddee@gmail.com>
Date: Fri, 25 Apr 2025 20:01:45 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit

During nvme reset, there is a rare case, when user admin cmd such
as smart-log and nvme_admin_create_sq from nvme_setup_io_queues
happen to in the same blk_mq dispatch list, and the user cmd is
the last one. nvme_admin_create_sq is dispatched first in
nvme_queue_rq(), nvme_write_sq_db() is called but immediately
returns without writing the doorbell because it's not masked
"last". The subsequent smart-log ioctl fails fast hitting
nvme_fail_nonready_cmd(), skipping both nvme_sq_copy_cmd() and
nvme_write_sq_db(), so no doorbell write ever occurs. The
nvme_admin_create_sq fails timeout finally.

The proposal is that do not treat user admin cmd during
RECONNECTING as non-ready, through it to the drive, thus no
doorbell missing happens in case above.

Signed-off-by: Linjun Bao <meljbao@gmail.com>
---
 drivers/nvme/host/core.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/nvme/host/core.c b/drivers/nvme/host/core.c
index 3cc79817e4d7..fc550226ed77 100644
--- a/drivers/nvme/host/core.c
+++ b/drivers/nvme/host/core.c
@@ -750,7 +750,8 @@ bool __nvme_check_ready(struct nvme_ctrl *ctrl, struct request *rq,
 	 * sequence. until the controller will be LIVE, fail with
 	 * BLK_STS_RESOURCE so that they will be rescheduled.
 	 */
-	if (rq->q == ctrl->admin_q && (req->flags & NVME_REQ_USERCMD))
+	if (rq->q == ctrl->admin_q && (req->flags & NVME_REQ_USERCMD) &&
+	    (nvme_ctrl_state(ctrl) != NVME_CTRL_CONNECTING))
 		return false;
 
 	if (ctrl->ops->flags & NVME_F_FABRICS) {
-- 
2.25.1
