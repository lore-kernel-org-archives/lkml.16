Received: from mail-ot1-f74.google.com (mail-ot1-f74.google.com [209.85.210.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E4911D63C4
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 19:59:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744142391; cv=none; b=LbsTphl5pgHC8d7vlagexIigCMhyxWp0i5ydm3dDI6bAQR4O32TTSqG50LtcIM7eGxFT1sz5w3qRGl2EE/1Fhkllcf6nlQCzewSsi5XHnmCFLiKpMceir5M1Ow/fKMLU5EWI+v0WVme+btotvwBzvso2sX1Ikyf9D0N5wlzLTnA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744142391; c=relaxed/simple;
	bh=ETde75bguhThJB57E8xs/UC0Iq+oenLpny1pSN2LQg4=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=ORuGyHjV9kLPlveqt4WCE4U6ZK8VRy8Qb7AQiFiDBlCrg88p/nkSzTXotjI3Qhutf6JAClU0cxAv1rLAO33PUbvrMzPea9X/f9Elc1F5a7znwKFYYLZz2qmwf3jGgKQgdOzbZ8CYg/cGluS0wwygFd82jwcvPgMnCyTy2yp2kSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--yabinc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=nXAQPW5q; arc=none smtp.client-ip=209.85.210.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--yabinc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="nXAQPW5q"
Received: by mail-ot1-f74.google.com with SMTP id 46e09a7af769-72b8ee50fbeso6073300a34.0
        for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 12:59:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744142388; x=1744747188; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=g0y0MORjjtTJ4R3KpCgJxXhzp3sN9CDldjtO16QVgEc=;
        b=nXAQPW5qE6x212E9GHXdwhXfOusXp4dX13P02jKycDidDjynYkVj24uYQTl/mwr/vW
         EaYhey6hH5JWhjfZRarSoWjRiHwkfSwt+9bMpXkC2/viKzaZEOdnbqAdlxoqYw5gLq3V
         7BNc+TOpkyb+vUW2yx723oGZKXydPHQwf+dL+WgGg3oRnnLVV8jssSpOVQ2Tl+lp4oBh
         Pve82jn5QzUmft5sc+M01/ACe7fpYvUdzC/f2JYxPfhKFy3yAQ6eryek24ar05ejewA8
         HB2lp/WkCt7xRnACSv75gESH7vtHvAcD88Wy3At7/LrTDJPhC/r7CzBStYiKZYz2GOub
         9aog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744142388; x=1744747188;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=g0y0MORjjtTJ4R3KpCgJxXhzp3sN9CDldjtO16QVgEc=;
        b=To9Pcd3WUnJPqtLyuXPbmikXXqjCw5DrHmD9UT6GzjDn7tNiZBDXVrrUM5yAwutVyX
         WUv3PMwEvMgQejt7cc8MmLnhz4gjzEMbqRU9C2g6p1nOaGYMwv5a/3MLCw9pfLD3O+Lg
         NW40eGUDS7KQRUrAE4zn6dHMnu0jwfZyMrlcYxFEPxaxV2lVki0uOiMXFd2dLrf0hDQz
         gTZQJcpVF8pvP7yOna2UQXgnpA/LeB2Z5Bxq5AdKFt3fz7Zo6et/FVxlcJ3LrxkPSqp/
         HwneDljffS3yN8mEuM1UKtuxfpnDxQpMZTSLI72B1sFtXpz0zCZdgEd76yK+BuVdIiWz
         Knpw==
X-Forwarded-Encrypted: i=1; AJvYcCW5GmPTij+hbZ1eZ6oRheF6kZ3tnE37Hr8SoUYd2IBcsb6h2V3Iq7HU17/Xj5UEj+WT++pJsHRt+NfR1EE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzDc1BElwb44ejSVwmRN8ihl1GvsVMO78SUgUsqg8qbKMKKgiUR
	LaQ0eUl/f3IS+YHF+LtJmYYTFRk05ekf1HsZEmM5JBDeUfQBZkx/9fRIR8HZ7KVduA8MzIEFWQP
	H
X-Google-Smtp-Source: AGHT+IHtnt5zN6OyJvv673+ynstNvQUf43BeN6J0WtU8LzaOOlcLNTKLOFI6eZdKvbTOSGjsZBpwHfH0Ns4=
X-Received: from oabwd7.prod.google.com ([2002:a05:6871:a587:b0:288:7c1b:bc])
 (user=yabinc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6830:3981:b0:72b:8a8b:e02d
 with SMTP id 46e09a7af769-72e7097ee43mr304697a34.5.1744142388625; Tue, 08 Apr
 2025 12:59:48 -0700 (PDT)
Date: Tue,  8 Apr 2025 12:59:20 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.49.0.504.g3bcea36a83-goog
Message-ID: <20250408195922.770377-1-yabinc@google.com>
Subject: [PATCH v3 0/2] coresight: catu: Introduce refcount and spinlock for enabling/disabling
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
 drivers/hwtracing/coresight/coresight-core.c |  9 +++++--
 3 files changed, 25 insertions(+), 10 deletions(-)

-- 
2.49.0.504.g3bcea36a83-goog

