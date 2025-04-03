Received: from mail-pg1-f202.google.com (mail-pg1-f202.google.com [209.85.215.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7115AA2D
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 00:08:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743638918; cv=none; b=tFuawkU1G3HSlqFg4Cp+BJIVr+cyYsiwcprnvc/KhLW80/nRQYHkOVWXLo09O2qMxT26bCR3JB4vleNnzSblmLYqrAnpEJa6/e5J+4zm3fg8pEYkQmBJt+eNiaEM+pdm9oipHuXAZatYBLniMVVihzU0jMZGbCbepTiGZEldaEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743638918; c=relaxed/simple;
	bh=hTAzDrPsZKafbecdYqshErtWX+i2KvAc7ypCbGygK2o=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=i2Vv8C+mjj4yx95t7UejOc/Wy8AFGLui4N/e4QMpA7KFT3tWmDFyEkvIqw6Z9XPTwiOehiaDPB+h+ui5/xfs8GgqYeHdeBwfUWuJ/qGc4DEF1e+U33HN5tk8/BquR2e0eoEMROHNSZe0Kpji5pVSe4WjgaG1r2g8+7jGfrPWNdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--pcc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=rA2LcBhH; arc=none smtp.client-ip=209.85.215.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--pcc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="rA2LcBhH"
Received: by mail-pg1-f202.google.com with SMTP id 41be03b00d2f7-af570998077so295099a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 02 Apr 2025 17:08:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743638917; x=1744243717; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=D5lR/rBMuVOIoUwLH4/co+le8IOHRMi1RqbQlc2/Z8Y=;
        b=rA2LcBhHshk/J3K/0DDG1sWrivwtO8jN1BdI0Xbe7lUnSSV9tmYamXFGFrr9Mcb76k
         RfNjSJIImgwgoHRcvq9Yct88cHdTVclYes9rgzhHgU+7mJtwdqYOSCzLmposHtFumDHu
         NOVsZJz/g2Bl2qfCk/voagVlJpo+iE4PliQudJCUef0igSxAYZt3lzHNLqYKYxiVYWGK
         yA7ywRZ/pAMDvTu2U7cha+JFhy8ApRU30pCn3Leind0YEwp2M82JY6XKQqun7ZRrfbpg
         RhlSBRaOWT0ltu0V06+QiB39yop5l4IuHArjuTulZTVZrK1Tq50f0grQpq84eAT8+geM
         Nbhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743638917; x=1744243717;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=D5lR/rBMuVOIoUwLH4/co+le8IOHRMi1RqbQlc2/Z8Y=;
        b=uc4rFR8a0uTjfj6xeeyErLfHTew8rI/+90nLErjDK9DMaBjw6cDCmSSNKBXY6vfU37
         ugVhviGO85ARMZGUvFJo4alO2eKLGqm9KNDP5Cx18hlM+gUqsAlGb3DYgQGPa+fyChfg
         GoxAkqlpn/3LK7gANBb27ztqGSEiTV7llIahFo3Se/rI5BQo7EiNpPC6n8Td1Z+KE3nj
         cvcG9UYAsk+wXkWyCt/HYn0j76FaVKMNCTsiQixJbLx/jcZZ4IAicyqpYzqy5Da9B65F
         8zYmweBbEoNM95HsqbrceQ9/jU7srNi8vfJfZu3mLB6Pftg62d34BUXrBMH+YXu0OWFe
         sznQ==
X-Forwarded-Encrypted: i=1; AJvYcCUDe0vIPeha8DPPTCFX+EQQBj/OHiV4psRt7fNyKOmgyqcmjZpwd6/8PG2JvY9ki/0lmZkuuMRXwFKGAJM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzIL0QWefAowRkvJXUrqXMMdPyw+PVi2fXLxQB32Hx3bmlPcTOS
	AqnvnoGLo1WYUu28Us8nW/XQKLi5cr8dBYPyTc0WMMXjoXc2I8qhXZ3W12x24KhFtg==
X-Google-Smtp-Source: AGHT+IHuAOxtXzCgPBrdp5bAmlVDtunUBAbbk6Zek1hc3Rqn5Vy7UfRbt6b5OUG2vQgJn7Pm/udst/k=
X-Received: from pjbsi7.prod.google.com ([2002:a17:90b:5287:b0:2fc:2e92:6cf])
 (user=pcc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:3b50:b0:301:1bce:c258
 with SMTP id 98e67ed59e1d1-3053215e7femr21514740a91.22.1743638916776; Wed, 02
 Apr 2025 17:08:36 -0700 (PDT)
Date: Wed,  2 Apr 2025 17:06:58 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.49.0.472.ge94155a9ec-goog
Message-ID: <20250403000703.2584581-1-pcc@google.com>
Subject: [PATCH v5 0/2] string: Add load_unaligned_zeropad() code path to sized_strscpy()
From: Peter Collingbourne <pcc@google.com>
To: Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, 
	Andrew Morton <akpm@linux-foundation.org>, Kees Cook <kees@kernel.org>, 
	Andy Shevchenko <andy@kernel.org>, Andrey Konovalov <andreyknvl@gmail.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Mark Rutland <mark.rutland@arm.com>
Cc: Peter Collingbourne <pcc@google.com>, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

This series fixes an issue where strscpy() would sometimes trigger
a false positive KASAN report with MTE.

v5:
- add test for unreadable first byte of strscpy() source

v4:
- clarify commit message
- improve comment

v3:
- simplify test case

Peter Collingbourne (1):
  string: Add load_unaligned_zeropad() code path to sized_strscpy()

Vincenzo Frascino (1):
  kasan: Add strscpy() test to trigger tag fault on arm64

 lib/string.c            | 13 ++++++++++---
 mm/kasan/kasan_test_c.c | 20 ++++++++++++++++++++
 2 files changed, 30 insertions(+), 3 deletions(-)

-- 
2.49.0.472.ge94155a9ec-goog

