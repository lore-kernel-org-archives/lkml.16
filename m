Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48DDF21D001
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 23:13:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745968394; cv=none; b=R7ijKF6mtfl9iSeZlNgnCJ8cJ9bKFzEAnHoLngkScHSAemQnZkMnWHcsk8mNwpaFwKATrJfLhxZ6xz+PTtJwV/MohTYqgXib+/qaf2bHapVRdGOG2t5TakSjNp2iknQRfsy5f7+utGYuuTRcfk/qwP9FpBxExj33HkYiu6AlTtc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745968394; c=relaxed/simple;
	bh=Y/Uk8kXld8q3okBAylkh2IdKy3oSKEv3ckTsou7Zp/s=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=QRmbkx7JFL+HlMUssXgFFkK3el1hhCs2H8FdanR8fHW1VQRDWhuJsUt/ge5VbvUufgKcGYs0t3/LmGhQVlrhRGg7IeqZtPP7ws3nLX74g0+1P/kxoyxFarQFtEu2DueLhFKvQqQGpAlrZXhwRoQ+dWwWs+q8RjxVy00dbN41JtY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--yabinc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=zprWBBU6; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--yabinc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="zprWBBU6"
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-2ff854a2541so5727086a91.0
        for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 16:13:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745968392; x=1746573192; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=XFiXDTG7h4NZVTZjiToE3/K4nhdKRi+EC25+HGPBRMs=;
        b=zprWBBU6dF2CrN84KPGO/Yxw4HPZAKiwpl0HgSsJ99pLGzu0ZEXzWfgFUwuhsumVxA
         a/bxAws1gc6NWhZefqp75XoFlHAlVEnWfIn35p9cANjPdqXN7vD/Z8C1OeWHg1bhjD3O
         fknfVWPQAKDUw4Ib2ZF6PhnISOvwg9rNa/u3A5x6XEDTm1BNWOLsfLwp1q3S0s2U0E2n
         YvhwVx0ZARf8QIf1xLkzTKJTG7egYJK9nDMbJkkcLBwUCLjuUg2Nw+/vMs/DLjhw3AVI
         iClKwboGGe51p3I+iLDRaqO87UzsP8uNLoplbgWae5iR4T/ShNL4SPGXdpnRI253dAtL
         Qo7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745968392; x=1746573192;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XFiXDTG7h4NZVTZjiToE3/K4nhdKRi+EC25+HGPBRMs=;
        b=jjObBt3y1fxH2BEbbs736szc7ne7RwXXfjKXCeU/HTObgPsyskwhpKbsHKoZsDYGhZ
         rVysUhRTUYUqoyPDlz7A8ymDzpJfaDMKxz+KdMMoR7tfzFyp5J60pefL6GLQa8iZY/s4
         RcOKj4jJjEGGhpANgyRONlKqEYwhen+qe90sGqH/FoouG8C0kwre/WHD3U8ddOwX5AKn
         Wc3NSP6J7daSlEOSzrSZSzZt7BsM8mAFfaP8uTvE9G+D/+y9eRP5JCV4bx8vKa/bXxbF
         EP7yj/cP2O+wcJcl/PQBu1t5Gx8HM+qlW7piRRAMPyMrKjR10s+t79PNw/F9H0QSP7Eb
         LQLw==
X-Forwarded-Encrypted: i=1; AJvYcCU/385u3cEthBU3tiv4r21u40v+cXa82Nn2/Rdzigo7g7Gk3fvf7azTp/3o0uYTBGHHf2SuSCxu8bYtODs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6ZngAhSbPlAzN7X6BcB9MCxTSnJhH+dnKMVvEJ4mgrAxMVyIo
	o2HIVflssKrwdvu/GV8rqP8N+lzsxbHwsoyTB4dh8wfmd8B8l8jOf/L7GV5tBdPWxtgFmQ3IB+r
	P
X-Google-Smtp-Source: AGHT+IGfB+xOaI+3DToObDK7cBzH7hVJ+FZ/zmtg7PUwy736+JMV/d1hOAVjp8W47jHU/BhIDznpGvFMUtY=
X-Received: from pjc13.prod.google.com ([2002:a17:90b:2f4d:b0:2e0:915d:d594])
 (user=yabinc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:2e50:b0:2f1:3355:4a8f
 with SMTP id 98e67ed59e1d1-30a343e4035mr681093a91.4.1745968392557; Tue, 29
 Apr 2025 16:13:12 -0700 (PDT)
Date: Tue, 29 Apr 2025 16:12:58 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.49.0.967.g6a0df3ecc3-goog
Message-ID: <20250429231301.1952246-1-yabinc@google.com>
Subject: [PATCH v5 0/2] coresight: catu: Introduce refcount and spinlock for enabling/disabling
From: Yabin Cui <yabinc@google.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@linaro.org>, 
	James Clark <james.clark@linaro.org>, Leo Yan <leo.yan@arm.com>, 
	Jie Gan <quic_jiegan@quicinc.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Yabin Cui <yabinc@google.com>
Content-Type: text/plain; charset="UTF-8"

Hi Coresight maintainers,

When tracing ETM data on multiple CPUs concurrently via the
perf interface, the CATU device is shared across different CPU
paths. This can lead to race conditions when multiple CPUs attempt
to enable or disable the CATU device simultaneously. This patchset
is to fix race conditions when enabling/disabling a CATU device.

Changes since v4:
 - Collect Review-by tags.
 - return -EINVAL for unknown types in coresight_enable_path.

Changes since v3:
 - Add newlines between variable definition and guard().
 - Add path parameter when calling coresight_disable_helpers.
 - Use "goto err_disable_helpers" in coresight_enable_path().

Changes since v2:
- In catu_disable(), return 0 when refcnt > 0.
- Remove the patch checking enabled mode.
- Disable helpers at the places where a coresight device fails to
  enable.

Changes since v1:
- Use raw_spinlock_t and guard().
- Add a patch to check enabled mode.
- Add a patch to disable helpers when fails to enable a device.

Yabin Cui (2):
  coresight: catu: Introduce refcount and spinlock for
    enabling/disabling
  coresight: core: Disable helpers for devices that fail to enable

 drivers/hwtracing/coresight/coresight-catu.c | 25 +++++++++++++-------
 drivers/hwtracing/coresight/coresight-catu.h |  1 +
 drivers/hwtracing/coresight/coresight-core.c | 11 ++++++---
 3 files changed, 26 insertions(+), 11 deletions(-)

-- 
2.49.0.967.g6a0df3ecc3-goog

