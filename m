Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78F3B18EB0
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 00:28:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745454495; cv=none; b=QaKQLMFTLfKjAY7Nl+ciy5SCDMgvzcORzqEcGmbRP0OXvN9xUvMLnZ77Y27LajUN7PfnYCQOfolZUTWtobrmlJHwD2qwnjaMdjjwYXe+jVtUFRWuU1J18Z+2kx3vf4xQRnnrts8Vs8aaBg9NLjJfz2Okd/1hmmcSLKFbLuTXCvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745454495; c=relaxed/simple;
	bh=h8wAY7qtIy5UrHIDhwmDC5fKfwUd64U5Lep9H+J6vLU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=eIDwFVJi3mu4+/7/wZA2GOiJQ98+/9PY/wvsvUhC28ZrX8a99n1K0XTL8j+4fXbx5lcCoSIXAdaDVyPR33VeOe8S7Ph9rOcioh0HyziEe9X8y9/jhHSWyTuHFPI/Mata4OZvczQkWq5gYBeW39lKUeGz+A/VjvTk7+ixbqbCvgk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fastly.com; spf=pass smtp.mailfrom=fastly.com; dkim=pass (1024-bit key) header.d=fastly.com header.i=@fastly.com header.b=Irk3iess; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fastly.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fastly.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=fastly.com header.i=@fastly.com header.b="Irk3iess"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-30332dfc820so522690a91.2
        for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 17:28:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fastly.com; s=google; t=1745454493; x=1746059293; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KIHmcKmXhg69DmaElnA5LLW3gaVd1eMpD/hTU28A/HE=;
        b=Irk3iess1ZWp76vpIqY5KPFENe546uefn8gu0FUv4zFwws9WeEWpYwLJhVFzmtGIJ/
         9NymRvz3kZ2/UGxkxTyOq7NsHOel9Bexar/PuFA6mjIMCKul9TJzb8r7CaSm5jS0HWOl
         sa8u4cOsXO8vdoSuPh/cq2Izhdy+ZBT2rXb+o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745454493; x=1746059293;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KIHmcKmXhg69DmaElnA5LLW3gaVd1eMpD/hTU28A/HE=;
        b=pCMs6wkVVFeNRF/brQUduQKCB8vNDp0Bj5WGvl74reBVXbuN5LKnvC8BrIPlR37ssx
         jnXVvDZ3ggc9Zi4zUrzA5g66DFe4Htb/MG0Gjy5mTc+0FhwUlZr/+efKU9LLS3hrnTol
         oFJ/mJSI6/kzNgkcWKf5YtvjoAiEOHoQr+k75wpLOwTPSUH34Uv5aRfDrgEtjKpejUuu
         bYS6YhG+t4IE5MmxFuToo8A7YKKIWDF5d2oQy/DO8EXro8wuYTaoMiYAosrhL9P7w1kF
         LMAK54yYSSPuneW/I5ToxLwvuxhM79u8fiEEK42iTQoS182rqAQQ79fzDJcrm9+ie5ye
         qr/A==
X-Forwarded-Encrypted: i=1; AJvYcCWFbODiZUZGekjJUPo5dxKbWuflDSOS+QHlVoM9BF3mAn1n0DgDvBFFB4IaL44lX8bIRMFMYSygDJIz6mU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5MY7rSh1uNnwrqLjcj93zZruGvrD9Rv43VpJ3QR65YFKcAElb
	Xn1nOrwXP5RZ2NSB1oiBsmZElSvilo/NFW6gvA6cw3jY4zWc3v25rN+ltaWxSG4=
X-Gm-Gg: ASbGncv+vt+3Z1bc5v7SN+gHdZYwn0Y6TRQ6e6c0+YhYDy6E70m+LczWCksDrHKJ44a
	kdciK6vyVsa1AeehL/QwSYemJxMzDo5NPy5n+bvkmGkIvIpcO2MZWxQKl+j/SdGBveuMVzAdowx
	02mAz/YCvnzOvsBH2DWsSxBo2XPfkAC4HZvDs/fS2hSlBl3xDAhfzXCqA3B9yNDK6G0wBJd0dy8
	vlTbRwHQ3UWvFduRGhB4nx6NNSf+NEG/LBoSmmRHfgAV3OLjJNhadGolow3cBcKYbb0gbt62NkF
	tIeYleU/9FmnPbhbtZspytYcozgNxUrSleLNH9f+yCCGwexa
X-Google-Smtp-Source: AGHT+IETblWxuoSuSV8+WUwaLohHsvmGk7SHFO08yaKEGr+w9ecMqwtPnCysdbaJTuia4bAV484exQ==
X-Received: by 2002:a17:90b:584c:b0:2ff:53ad:a0ec with SMTP id 98e67ed59e1d1-309ed2821damr1082565a91.21.1745454492678;
        Wed, 23 Apr 2025 17:28:12 -0700 (PDT)
Received: from localhost.localdomain ([2620:11a:c019:0:65e:3115:2f58:c5fd])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-309ee7c4054sm83013a91.23.2025.04.23.17.28.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 17:28:12 -0700 (PDT)
From: Joe Damato <jdamato@fastly.com>
To: netdev@vger.kernel.org
Cc: kuba@kernel.org,
	shaw.leon@gmail.com,
	pabeni@redhat.com,
	Joe Damato <jdamato@fastly.com>,
	Alexei Starovoitov <ast@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	bpf@vger.kernel.org (open list:XDP (eXpress Data Path):Keyword:(?:\b|_)xdp(?:\b|_)),
	Daniel Borkmann <daniel@iogearbox.net>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jesper Dangaard Brouer <hawk@kernel.org>,
	John Fastabend <john.fastabend@gmail.com>,
	linux-kernel@vger.kernel.org (open list),
	linux-kselftest@vger.kernel.org (open list:KERNEL SELFTEST FRAMEWORK),
	Shuah Khan <shuah@kernel.org>
Subject: [PATCH net-next v4 0/3] Fix netdevim to correctly mark NAPI IDs
Date: Thu, 24 Apr 2025 00:27:30 +0000
Message-ID: <20250424002746.16891-1-jdamato@fastly.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Greetings:

Welcome to v4.

This series fixes netdevsim to correctly set the NAPI ID on the skb.
This is helpful for writing tests around features that use
SO_INCOMING_NAPI_ID.

In addition to the netdevsim fix in patch 1, patches 2 & 3 do some self
test refactoring and add a test for NAPI IDs. The test itself (patch 3)
introduces a C helper because apparently python doesn't have
socket.SO_INCOMING_NAPI_ID.

Thanks,
Joe

v4:
  - Updated the macro guard in patch 2
  - Removed the remote deploy from patch 3

v3: https://lore.kernel.org/netdev/20250418013719.12094-1-jdamato@fastly.com/
  - Dropped patch 3 from v2 as it is no longer necessary.
  - Patch 3 from this series (which was patch 4 in the v2)
    - Sorted .gitignore alphabetically
    - added cfg.remote_deploy so the test supports real remote machines
    - Dropped the NetNSEnter as it is unnecessary
    - Fixed a string interpolation issue that Paolo hit with his Python
      version

v2: https://lore.kernel.org/netdev/20250417013301.39228-1-jdamato@fastly.com/
  - No longer an RFC
  - Minor whitespace change in patch 1 (no functional change).
  - Patches 2-4 new in v2

rfcv1: https://lore.kernel.org/netdev/20250329000030.39543-1-jdamato@fastly.com/


Joe Damato (3):
  netdevsim: Mark NAPI ID on skb in nsim_rcv
  selftests: drv-net: Factor out ksft C helpers
  selftests: drv-net: Test that NAPI ID is non-zero

 drivers/net/netdevsim/netdev.c                |  2 +
 .../testing/selftests/drivers/net/.gitignore  |  1 +
 tools/testing/selftests/drivers/net/Makefile  |  6 +-
 tools/testing/selftests/drivers/net/ksft.h    | 56 +++++++++++++
 .../testing/selftests/drivers/net/napi_id.py  | 23 +++++
 .../selftests/drivers/net/napi_id_helper.c    | 83 +++++++++++++++++++
 .../selftests/drivers/net/xdp_helper.c        | 49 +----------
 7 files changed, 172 insertions(+), 48 deletions(-)
 create mode 100644 tools/testing/selftests/drivers/net/ksft.h
 create mode 100755 tools/testing/selftests/drivers/net/napi_id.py
 create mode 100644 tools/testing/selftests/drivers/net/napi_id_helper.c


base-commit: cd7276ecac9c64c80433fbcff2e35aceaea6f477
-- 
2.43.0

