Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 163AE1DB366
	for <linux-kernel@vger.kernel.org>; Tue,  3 Jun 2025 11:08:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748948940; cv=none; b=EzhTke9znq0i7bls+mDnsqRimu6ukcbTb0GhznTpHY6m2x/1xosyNff2Hq9vBz2NLjZrRAK+cYzX1WcM3/QVOjJ6DSrY22GKFrsgPlD0NJP3fF+0Ws1r6yStQyBYPzZcoohf53BSrpTsyZMco6gqvyWP6Lu2dPe34iQXRIc7eeQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748948940; c=relaxed/simple;
	bh=O3HTDh+42bV+H3Dzjm1GJePVyMtCLoISEbBZUvuTEyg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=LLe7+KgIvVO49vqDU+oaWHOZdJoMX2Vw5Ne2t9zxirTW0u/zspXV+KTo+LW+MX0XqWzjv1N/PMVRSG0JxAHm5Cs3DjlufyksRmYgVlQrme9Ua2C/hu2PALv7OCXdJ3lz+jk19IlGYIti8avhleMLd9AQsiQCTSgmewhg6Mlr/Ik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=L0AEwaiW; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="L0AEwaiW"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-311ef4fb549so4727213a91.2
        for <linux-kernel@vger.kernel.org>; Tue, 03 Jun 2025 04:08:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748948937; x=1749553737; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uvtiN0tbM+3eN1Cvhj0/6WPfMd2Td6+2qHM2Vin6Wcg=;
        b=L0AEwaiWNPXPcdgWgNJcvL42cRVsYvVj7QV1An5M+pI1XbK/mLnXHfpxgEzoQSva93
         ggfolCNHgm4cFftpnUrfgb2Uk11RcyHqS/QZTgVOIJn4Mvp3avFNIb9IwEgseSX3lWvp
         KZfU2dRKf9nLxtPrs9iW50gOkT/TR23DxKHXjqyusf4D0iqcmeWcPfX8UKW5LKPtuVxc
         Bgr5vPExUZCZoP4mSZgyKbWBL8BMF9iEycDP7usWl2BZaqEIHmM7v7qcEWl/ObjoPskt
         GraVAntHE2Y1AqWtQgf5yakQbWS0MVCXfbuo9B4ShNpGOU4ktpFMMhJDYCnhwL8iYZnq
         Nepw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748948937; x=1749553737;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uvtiN0tbM+3eN1Cvhj0/6WPfMd2Td6+2qHM2Vin6Wcg=;
        b=wH9CZk6JjxLBxCq3OqpPYGk1KeA6+E9JDF1CVjVFU73kr3Ul1dOSNTCBJ9r5og8BtR
         iJKcEr/oOzBuoga8i6L7w4+iT4HUR1N0Z+dQd6aQP5wCeb1HK1ZM+BpDT9cb6l67ze6M
         x9L27ebAoY7zCxKQ07teJygpyuhWmSLZ7tddI6XTMW0GUYyrtRxWVtPIDyyC+CgDwiDa
         r9l4LPdemhFh9q5zsMPp0v1WCZhSUWo8LXrPFZInLyX1QB8GoLOBo+YEFnlNB+A+PVJ7
         qmGKlGsN02rwJuwWu4DMENNehXEWArrWMVV4GWmlsUYU8bF1zlCd6mvuqXdnkb0eg18d
         GMuw==
X-Forwarded-Encrypted: i=1; AJvYcCVfHTrRisZ4V8kohx5aIRQpY4ykr4TKy9H76hcrjGLsuVuJs9o6lHtE14jkR/Z2fONtVC59BMQdZ3EZYQg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzQlGdpMp85/YHfcLorJ2Bhe6ifpd2/pBEjfI/3SuDahV30ceCW
	cReVmEhArwO6TawmfeMaOGtUN8Hq4ujSW/NaBQvz0bgwi8rKmHW8Dm9GgyU6NSe/hxVY7R7VcwR
	QrzHy
X-Gm-Gg: ASbGncsOQE9xYC+qFUohGh2ETNkHNRfMD22+SngZnCRUzsQKaycc9Gow8Z9oTbvaNoM
	jHlhNYk17olxcfVaN6/xqhNkCaEYNAQ7H++F7SXnrzCGl+5gESc2BM6Q3YIWtdr5qMamCtn68ng
	zfDtYuL6KoIxEZ5uWAhjjECyZunfAfksIyDpCkD67SW0bZPe0UIWJCrPWraokzWbcTZSuEXpC2z
	Q9Ie3PM/XF4taeXQX8y9hYCPakZFSqnTfgYBIsx98AOZRATR3gP2g7RrrwTm77XTaL2DbZjUW1i
	8Dan7AHrJM+czkSkWX72474bSpwQTAAym486ze1ctsk6bXQV2SN8++QpxbhnX2U=
X-Google-Smtp-Source: AGHT+IFblOX1jAMQR0CWt2YCrbWuUgRl61/iZF6tPw+JGmxffib5cDiamCUUtgpC/NfKV7uyyiuQPQ==
X-Received: by 2002:a17:90b:1343:b0:30e:8f60:b4c with SMTP id 98e67ed59e1d1-31241735a7dmr28100719a91.16.1748948937304;
        Tue, 03 Jun 2025 04:08:57 -0700 (PDT)
Received: from localhost ([122.172.81.72])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3124e29f865sm7003173a91.7.2025.06.03.04.08.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jun 2025 04:08:56 -0700 (PDT)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: Viresh Kumar <viresh.kumar@linaro.org>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Bill Mills <bill.mills@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] firmware: arm_ffa: Fix struct ffa_indirect_msg_hdr
Date: Tue,  3 Jun 2025 16:38:53 +0530
Message-Id: <28a624fbf416975de4fbe08cfbf7c2db89cb630e.1748948911.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.31.1.272.g89b43f80a514
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As per the spec, one 32 bit reserved entry is missing here, add it.

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 include/linux/arm_ffa.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/linux/arm_ffa.h b/include/linux/arm_ffa.h
index 5bded24dc24f..e1634897e159 100644
--- a/include/linux/arm_ffa.h
+++ b/include/linux/arm_ffa.h
@@ -283,6 +283,7 @@ struct ffa_indirect_msg_hdr {
 	u32 offset;
 	u32 send_recv_id;
 	u32 size;
+	u32 res1;
 	uuid_t uuid;
 };
 
-- 
2.31.1.272.g89b43f80a514

