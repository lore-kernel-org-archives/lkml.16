Received: from mail-io1-f46.google.com (mail-io1-f46.google.com [209.85.166.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B1FA258CC4
	for <linux-kernel@vger.kernel.org>; Fri,  2 May 2025 15:25:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746199534; cv=none; b=TVXy8vNKQ5De/v5yOm9itJzDjILrzyuqiea7r+30CqCpdlxzz7pt/AIP2yG6G0NXuxgvGSh74Y5ESXQk/GVAKrtSrTz5S0k2WX/sBT32AHzJIs+XfQOPrxzJL0y70o5QP7uF/bo7q0EiXvmqS2a0CyJs2ex5a8a6wFrtPT14fcE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746199534; c=relaxed/simple;
	bh=QEVaQ8hifIZFBz0rVFqoScpf42YWpaUx83D/o0Kkscs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=KQh/H3gAk/jILpTozom7D7ZJZxiMCWwZPhxTUgr27AsS7f/MKHp/hW4L0VkrDCs/sL57pxIWX4n42dHCF/qSQ/XjNuPoBcSID400hVEkWZJnTogSi40bO1XdMONnYhglK1SU5vHC5N8g7ULBfNXISSTfl1c1RC3ZJpi4Tcn/eIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=kMUVTIyt; arc=none smtp.client-ip=209.85.166.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="kMUVTIyt"
Received: by mail-io1-f46.google.com with SMTP id ca18e2360f4ac-85b3f92c8f8so254974839f.1
        for <linux-kernel@vger.kernel.org>; Fri, 02 May 2025 08:25:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1746199530; x=1746804330; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ht0Wss9NyJF6H00dXB/7b2Zl66sjzwkYRly7lnLnnR4=;
        b=kMUVTIytm+WxaUFkbmlA3/wPY1/PsP6RvJyjTiZYBvRqtOhr2A9/QnJQWXApmSbPAh
         H7pK6Jpib3EuJQpOwMRf/Ti6RTrVaXmKy0gBtw1h/PZXOeqFx0Y6I4G593SxTrbG02v5
         GucdolxUCYJaKDSjLbfmoIer8cAceJA7SH/Izbwh5Q6fKLTroQZat30j+XH8qyV7xhJf
         vro2rPCaiN7wGCGyhttnEH5C7IZTUEZ5KeHfvhv6VMP1/7t90oxZti+ctuABzKuUK6EQ
         onvJJAOfXOYdD/9e1fWVHzN0Yke7w7SudPF0Qzmkxf4CIfty3dGVF3IGmiVi0mAqaAgW
         d14w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746199530; x=1746804330;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ht0Wss9NyJF6H00dXB/7b2Zl66sjzwkYRly7lnLnnR4=;
        b=ulBMs1clE7TXsWOQmD5r0gKgiHqvOKzp+vZcnaQRsX2TJ01jsjXhx6KL2bX9D+OJEs
         NTVyv+k++M8LapkM44TVM7A8vDQtHK7doq2w+gcrTTKgxWNpPyh4NPG8qMj4Kmi8nh3F
         LERPpyVLtUz/9AFDtO4O1Knho6gTnKlCWC81DklWwj0Fpd96HQMka+eFcligw2VTYhyv
         kspwzQnC7BVmpbRK2jy9GwDXcR/p4aOaENkqUowyl9klGUJvI5CelkH1P+s/+BSLyw6O
         0gtYUzN3whq+He2Zed8jOOEd5Cef7ZA7AKXgHsEsEaPeydGVy/2aF9GjT9rPNTITVv/k
         AV/Q==
X-Forwarded-Encrypted: i=1; AJvYcCU/k3+oxLBMbFABZEkocU0NKa/KoQWYzlDDmh7iB0IZ7D2gdxLDc716j06gi26bB7xBT/Oe9xpAuhuJE2s=@vger.kernel.org
X-Gm-Message-State: AOJu0YyXnvMbZXJeyxVDkXuxTA570k7DMYEhsXOfUR6/kk99j+hWV+Ob
	T3baRDifHJzyopqTx19FaEe9iy/dnaprRR2XOmP41Mtp7ZslcmiDdDyZNU3CGIw=
X-Gm-Gg: ASbGncvuv+cZbUJztSdoIIaJLKqozRLIjaucN0n4SO3vd7x4xXUMW7kXW9cjPxPzfAE
	hqDojgka8r9VkXv4VglsSiMscjZNG4KdlVNitfOGvy3IKV+g45Y3cAjWqgtDrpPhT4O8/x2PHcn
	j3KNstFYXrud4ZTe0M4Rv3D2zZ0yBHJI+kjzFSB1xgG9N7bcRgvLXukgbqVZCQqBeR7bYko1MEq
	CdV4ZLH/04V7fUGrAw33C45W6XLK9t6KGdXKKeoXUsLukuNoqgRcqnhit7xv+LfkQds9kKwdK8D
	ANsF81jtvnit75EwVmumjVM3u3/5RqTQFR2+fBDAeA==
X-Google-Smtp-Source: AGHT+IGmGtJrlkTYA0am4TJuLz3eEpTp071t/1y4MtVFt5gMTy2hRkI4Kbwl9Q1I2GzWXhnL6/B14Q==
X-Received: by 2002:a05:6602:3687:b0:864:a3d0:ddef with SMTP id ca18e2360f4ac-866b343cd04mr445080939f.6.1746199530264;
        Fri, 02 May 2025 08:25:30 -0700 (PDT)
Received: from [127.0.0.1] ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4f88aa8e1f7sm429300173.121.2025.05.02.08.25.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 May 2025 08:25:29 -0700 (PDT)
From: Jens Axboe <axboe@kernel.dk>
To: Caleb Sander Mateos <csander@purestorage.com>
Cc: Christoph Hellwig <hch@infradead.org>, linux-block@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20250426011728.4189119-1-csander@purestorage.com>
References: <20250426011728.4189119-1-csander@purestorage.com>
Subject: Re: [PATCH v2 0/3] block: avoid hctx spinlock for plug with
 multiple queues
Message-Id: <174619952950.748556.3719586120129055173.b4-ty@kernel.dk>
Date: Fri, 02 May 2025 09:25:29 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3-dev-7b9b9


On Fri, 25 Apr 2025 19:17:25 -0600, Caleb Sander Mateos wrote:
> blk_mq_flush_plug_list() has a fast path if all requests in the plug
> are destined for the same request_queue. It calls ->queue_rqs() with the
> whole batch of requests, falling back on ->queue_rq() for any requests
> not handled by ->queue_rqs(). However, if the requests are destined for
> multiple queues, blk_mq_flush_plug_list() has a slow path that calls
> blk_mq_dispatch_list() repeatedly to filter the requests by ctx/hctx.
> Each queue's requests are inserted into the hctx's dispatch list under a
> spinlock, then __blk_mq_sched_dispatch_requests() takes them out of the
> dispatch list (taking the spinlock again), and finally
> blk_mq_dispatch_rq_list() calls ->queue_rq() on each request.
> 
> [...]

Applied, thanks!

[1/3] block: take rq_list instead of plug in dispatch functions
      commit: 0aeb7ebfc7e3d4bef3542aadd33505452d2f9b82
[2/3] block: factor out blk_mq_dispatch_queue_requests() helper
      commit: a5728a1d1ef2d927c67e73fda94946c2c15106df
[3/3] block: avoid hctx spinlock for plug with multiple queues
      commit: 9712c57ec1117d6b5fe1cc8ad420049171140b26

Best regards,
-- 
Jens Axboe



