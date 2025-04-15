Received: from mail-pf1-f201.google.com (mail-pf1-f201.google.com [209.85.210.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DEBD22DFF3
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 18:46:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744742815; cv=none; b=kIcT8u1k2mSXBMIB+i9U8Om5UAThewbqV46mpDPwupz+6/IKOUrqXAb80HppBWJhMGc2apzHSZhGiLulAokjpxnvyY6XMCsLuLyfmzybwsKjUP9tpzjjzt4hTDKgDkfaMw1Wt6iqMt7fQmZXIX43k/UV3KnUro48FUZQPFUjbhI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744742815; c=relaxed/simple;
	bh=P8hHOb0Jh6yJ/b+wpAKCsv1jV2688SK/IMaAGOO/U+s=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=JiN08QmpmGEC7KCArB4U3rBRc6qA8SbR7yWwE2BOaisILA/I5ALSIVpLvj3nTWrW9/GPqaIusHjTqGSRgndD03wfK5gofmdL0aV5Tojs1gzTtJkOhfFVdH3g2GJXp/+cc1CrDnvkRy95S6zZa95gJOoCck8lpmUjH3lzk8ysvwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--yabinc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=JY9tNClY; arc=none smtp.client-ip=209.85.210.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--yabinc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="JY9tNClY"
Received: by mail-pf1-f201.google.com with SMTP id d2e1a72fcca58-736fff82264so4431823b3a.1
        for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 11:46:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744742813; x=1745347613; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=fgz6+kp7zmkPoRijrNzRHRYa9N8E/CF3R4uqgGXI6Oo=;
        b=JY9tNClYdnm/ftOe6PO3mSV2PDPsyuM498MtUYMBTO2awkaBlGwXOCtSNYaU+THj0A
         CUffcAwlGThsnSJD9Fgr3Rlamqe/OqqX/CMDWSNFrX0cywsXu4DWsl9cEYN5/BpwOU/5
         EOIeFOclRGrM+Y5Nh9nD3CS0yLL5Lxtyr1QnpjC9oN+Nwf/6E4Q6PnOptgbEBtqWM95v
         R6Nfylzvr9CaJuEAi8zhUMOPRtAUFaDOIPnlA4em9AAfL8bY3f5u7HP+3KFBEt4cnxUa
         oVLBuQ3J0xDRzP3ZMj8KgbDLx3PpWUWZmw9SN3xvJWv1WkVyqvjrJqy/PuJHUFrPm8/G
         nOlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744742813; x=1745347613;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fgz6+kp7zmkPoRijrNzRHRYa9N8E/CF3R4uqgGXI6Oo=;
        b=ddTHn/W5IeJihu8qEo6VWuXQr3bk+3C/mRIOHfqlHVEUJ0q0Mnma2+QZ/XK0JRkn4y
         2vN3hWRxARMIQNWdXTtLBvaDzbR4quT8q7W22wo4K1onvUu0yPAOMinXBT6XrHb7gvbj
         QnyuMQNSQFs0mwgwA6SjCDAhFHTXqG6W6fRrU24KFgjHhXIlgevjTfUbHheoGBE+Aom0
         +vPluiNqdUR5hUZviH2fnJFUhVtyHhM7ihXRY/i6KAkYhw0Fycxs9Irw5mD2aviEAtDX
         Bf+N+nqtahdq4lh8vhmMX4sNr8A8+E8S8MU+zZ53I7Hpf/TYOELMsCKAmOqPBIoxr7hz
         lmRQ==
X-Forwarded-Encrypted: i=1; AJvYcCW77USmLVZnA4BYQW1PpFqCCZOuNo3I3+GZwPTH/jsJBRY2WW9F7ZdA/lyl5twh+WcVkdebuBdd0gNVGfw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwBaacHc7fKbLC7WlR0Khca1oLrEWAUYdtOGR8eUaMGX/m6NWDD
	8TEQg+0cj+gYr0nhtkDHcIIdFIW0ooVAVJHDwVYBE/++oK38MZx6iMpyMYxuKINnPfOJVVy67md
	P
X-Google-Smtp-Source: AGHT+IGx2Sd7l0abLi4M5LJHhB/6edJNncexmpdJ3vQ/ErAmhZ56SDxQzSgIYjGBmp0jsI4y+fZ2tJEj3Dc=
X-Received: from pfcf21.prod.google.com ([2002:a05:6a00:2395:b0:737:30c9:fe46])
 (user=yabinc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:4b16:b0:728:f21b:ce4c
 with SMTP id d2e1a72fcca58-73c1f92f43dmr1026521b3a.5.1744742813607; Tue, 15
 Apr 2025 11:46:53 -0700 (PDT)
Date: Tue, 15 Apr 2025 11:46:47 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.49.0.604.gff1f9ca942-goog
Message-ID: <20250415184649.356683-1-yabinc@google.com>
Subject: [PATCH v4 0/2] coresight: catu: Introduce refcount and spinlock for enabling/disabling
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
 drivers/hwtracing/coresight/coresight-core.c | 10 +++++---
 3 files changed, 25 insertions(+), 11 deletions(-)

-- 
2.49.0.604.gff1f9ca942-goog

