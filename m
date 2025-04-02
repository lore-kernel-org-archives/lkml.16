Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 705D33C17
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 01:19:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743556766; cv=none; b=tVkbQrEB/LA5GMgyFjRCpKjgHcIXHzmcui/gySRxCSwo85OJEKvzIBRgKb47kul3Yge78c75zjzxI2kD5HwtkPTmOAQzwyYyV0jFMdKHp/bv7FyyB2a1WLthMfeKAOoba7fHsTO7sFs7nY4MwTjLPP63/wy+utNBwQweG9Cz6yw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743556766; c=relaxed/simple;
	bh=M7TKr9wjKvngh2YduQrvJoSY3xZAvga/VgTigfNNrTk=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=b/fDFDAPhNpwI5/kaPycy0XvL1rte/AdRTgaX/2lOjtsINLxPLGxAgmiFOPzu3IKNR0M2G3Zb/gepbH+4DfeA8T2dtdm0/2FI9R1DsH8MGGr2OF0yWi0ynGHyJzqFyJE4PUcQ384JrSIEwolZ5bYq/pRaGAHWKiSitGCkX1H30w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--yabinc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ZnArNfdu; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--yabinc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ZnArNfdu"
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-2240a960f9cso104765755ad.0
        for <linux-kernel@vger.kernel.org>; Tue, 01 Apr 2025 18:19:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743556765; x=1744161565; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=UPwvKPga+4YAgt5EQqAV6b2OdS+lrS5y9910tNFvgDA=;
        b=ZnArNfduZP8gVXqjMvZpRD4oRKRWHPGLHnPDQa+dMU/c9eowRp/2PE72sL4nRpO5HA
         dmJYc0Iw1zJDTLS7EUoBGVe0qSyE61BE7DflsdptTg3OGH5rc8bwXIyFC2Xkmxh/IkPI
         0KNrID8XKyrDrcRziFGPL5OLdA5BZ+887AidqYqspw/yOBdRHNThWoRu2qyNWixpYRiR
         LX+VuOZVpMZBRtpNJKORWuTLfGnlWP79x1PbmFdI17zGqi7ZbdISGUIzMNcIILxpcuTD
         EDiBgoqe80GI7IYY+4GkxsUU3Fz/saJRKTNY9VziiHgE/XCMzH8EWa2qH1xPaDYuwoG7
         vcjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743556765; x=1744161565;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UPwvKPga+4YAgt5EQqAV6b2OdS+lrS5y9910tNFvgDA=;
        b=P7Jsa/rTa3jsgRA5QO5IMDi/M1LDAxpOOl806tv2CLAUFIo6nQIjErj6VbxLwdivFg
         l9/k+i3PaZ+McqWIE5lpXRBPLrJth5U5lWwz6shTqLqtZnEFLqe/Q7g3avLMmZX3WM5U
         dUi/onwnztsoEPNFZq4OBG4/knqnyL13JJSevovMRt49wk92T1VXbNInHWORZt6y4cVz
         cN5GL+HkC3ZbcEF4FDxdgZHciHbHYasFM5FYCA+7kqEGyXHszW+VqdqAEriDNLihKpqQ
         jUUr5Yt1jvP6RHi0YbMagrDFSpgo8qirzStAiaSct6os4EGG/XkajUCKkGvNskgu1mJa
         +2bw==
X-Forwarded-Encrypted: i=1; AJvYcCUFP4kG0nIBBcWWJEl36yAghuZE0qDUQfbJRs3lqHutfm4JQp5QeVtpnmvubtY8q0OdUTkcukqt1HAcTvo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9nZv6AOCnMYXkIMlumdgxwfXNSQnPrSHCg5v7Dp37/lZzk9Aa
	tKOqYp3uXkK2b6XEHL7NDAtdjT9Vv/nCguc3B60x7YiKDsFFuet5PbqDGkxRU/5BRdcT7TfNc4v
	i
X-Google-Smtp-Source: AGHT+IFmbltUl6jqRWTrpUdS5JgvD4xgt7cXsuIH5MV1XRARYJnix9g8oSZjsewpNEuvhgzJthKxbl0V3lU=
X-Received: from pfbgs18.prod.google.com ([2002:a05:6a00:4d92:b0:736:5012:3564])
 (user=yabinc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:4f8d:b0:736:476b:fccf
 with SMTP id d2e1a72fcca58-739804397f9mr24081808b3a.18.1743556764708; Tue, 01
 Apr 2025 18:19:24 -0700 (PDT)
Date: Tue,  1 Apr 2025 18:18:29 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.49.0.472.ge94155a9ec-goog
Message-ID: <20250402011832.2970072-1-yabinc@google.com>
Subject: [PATCH v2 0/3] coresight: catu: Introduce refcount and spinlock for enabling/disabling
From: Yabin Cui <yabinc@google.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@linaro.org>, 
	James Clark <james.clark@linaro.org>, 
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

Changes since v1:
- Use raw_spinlock_t and guard().
- Add a patch to check enabled mode.
- Add a patch to disable helpers when fails to enable a device.

Yabin Cui (3):
  coresight: catu: Introduce refcount and spinlock for
    enabling/disabling
  coresight: catu: Prevent concurrent PERF and SYSFS mode enablement
  coresight: core: Disable helpers for devices that fail to enable

 drivers/hwtracing/coresight/coresight-catu.c | 33 ++++++++++++++------
 drivers/hwtracing/coresight/coresight-catu.h |  2 ++
 drivers/hwtracing/coresight/coresight-core.c | 12 +++----
 3 files changed, 30 insertions(+), 17 deletions(-)

-- 
2.49.0.472.ge94155a9ec-goog

