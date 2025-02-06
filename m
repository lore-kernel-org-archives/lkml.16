Received: from mail-ed1-f99.google.com (mail-ed1-f99.google.com [209.85.208.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D53D222587
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 05:21:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738819297; cv=none; b=k50C9YO6HjEsgP55YOgkhkzBIV1AsYnon0Cc9JgP6QVYhQEH9/rqqTlBj2B2QCK5ktf9fh2U2z9uSteUc5Vljm137JYeHmknzvT71j+LXa5uZWLfPrBsUxPwusuZpeNyZ+WtJQFBRg6RnjBtFa31G5LjjfVBoq2jU4fj6hitMkY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738819297; c=relaxed/simple;
	bh=tD0jPSjeireGMUVJpEk191Ij0UrSQYkMyCej9+UGqCM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=YGARFE+N47gQWQgHi8D4FVkHwSoEggLE1uIioM1YvPI5MlrAaMsyHi/Y2cgJi0JbqHVYazf1GDiX396zX1oCs+EZGS9g42zbWRYCBkb6Gjh7gQ6HzEks9ntn1cUYj8Gtqs2GK0FllcGcCLZ4sHg/giiz5vnSOYj/EaiW8FzYJ88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com; spf=fail smtp.mailfrom=purestorage.com; dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b=L1RYws3h; arc=none smtp.client-ip=209.85.208.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b="L1RYws3h"
Received: by mail-ed1-f99.google.com with SMTP id 4fb4d7f45d1cf-5dce3adbc31so914854a12.2
        for <linux-kernel@vger.kernel.org>; Wed, 05 Feb 2025 21:21:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1738819293; x=1739424093; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4i5yioVGSNjOB6nllSMZrYXzyChtuKnMnYZxXLntPc8=;
        b=L1RYws3hRPx51SRfPn2cH8Tzfprkeuk7fBBr5oCfKg30XRgSQJBHT94hSUZ9wYyPhj
         5c+flXqZJQaIbcmdyMlMEHt/UOueb4czqOW2WOkfcbQuDiQj02yGuBDyj4T4l44E/E4m
         iumIU1H00YboPDELRolwlGfd3NucctDhdjqer+ugbQx6wQHKonJCejenG5JWuYwwv3/p
         P60QU4V9WT90TzWMFwfgyGIm3aw97fHFuv+eQgns8p0dbSE7Nk8CsjhHs6PzwyQAS26U
         L3Zzrh1i73zTCgsV3N4Nu+ZBNA8Zs2PmZX8bUh382n8YI2RSrw5Tfa7sCFKvr4eSboDm
         IsbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738819293; x=1739424093;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4i5yioVGSNjOB6nllSMZrYXzyChtuKnMnYZxXLntPc8=;
        b=bZ7FJIA+vYncR7GD6oADbkEHJMY/m9JGxvRUDKi1DK2CtGfI6/FFuqV+QQVKqgzs8l
         Hhy4za4GfnfG7v3p/Hmna+fedJLWyBL3ZWuYJAcw+5Wte3QWhE2PuBhJ9AHpmYbJbL/N
         Tqf0Unw8NivDiBmAKQKqqrGXK8EzD6DR5TA6vYysvDoUa6L0jkdfK6aeFVLXPL+uTLPO
         1HvQZmjFQbbABH9MICWoUp+aP5QadTNLBz2GpYt2RTMxHlsYQZPLT37rpr+gC4SZTDV0
         szn2gFZkaSj5OikcCACJqT+zfRtq9Hf3PZMOi3j7sFHFwrtFeTjoTTfvai9Sezic8CZB
         KclQ==
X-Forwarded-Encrypted: i=1; AJvYcCUhh/u6+hKWOHX5pXMw1NDQJIkCfuV8atMwtqGCuNsgPjUEOFRdmWejOrQ6ppbQX5y66WKHcTNtQgrscK8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzwdRoX62Jrsd+G6xXZYGMaqN/lWyYb1DycxKP18ewf/tUlpgAZ
	IUa+7c8USDIImxOewGbPvSdSb+Bmf2dm4kBvUe6uz9/zGWr9WahEziZKVL6YwVyQf8DRo6/pYZg
	9avv13h0yeyxzvTu5Bpnz8rCIm5p32NH8a2ZUVRv0Bgbn3Eg6
X-Gm-Gg: ASbGncsSE4ni5cgUa1PJr7qYF5uiiMscvK9rYjauuNkghvhAvZdzFS7mkQ6pP+X1Gon
	/9f3aehiinGyni01Kb1MQPCn6I8iDaOkXQZtVy/M51IZXWXw3vnuKX6xGCM9RL53SN082qiuT2t
	dEF9qvBpJ2VuIRmlpn0mX5ru9X9ZQlbap22JcUS51KwYdSgb1i17ozcZdHlBg2/jRk3BELsksOJ
	/2F4jytfS9P3NYjhrlN4m1onz82NU7WVtRgngdVt0LixCbGsFpY28fyAn+uGNWS6D+W4djCg+xP
	hxqerA+BIuKS4GTF1leDJiRw
X-Google-Smtp-Source: AGHT+IFOIG/YV363yDXzTKiSu5f4bXzuXXAiuDbR1hZzAdQ19I1MKpWy4urmJ0wIV6IAB/oXbPlTS9cEifIH
X-Received: by 2002:a05:6402:234e:b0:5dc:7374:261d with SMTP id 4fb4d7f45d1cf-5dcdb6f9f81mr13341977a12.7.1738819292518;
        Wed, 05 Feb 2025 21:21:32 -0800 (PST)
Received: from c7-smtp-2023.dev.purestorage.com ([2620:125:9017:12:36:3:5:0])
        by smtp-relay.gmail.com with ESMTPS id a640c23a62f3a-ab7732e281dsm1194966b.130.2025.02.05.21.21.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Feb 2025 21:21:32 -0800 (PST)
X-Relaying-Domain: purestorage.com
Received: from dev-ushankar.dev.purestorage.com (dev-ushankar.dev.purestorage.com [10.7.70.36])
	by c7-smtp-2023.dev.purestorage.com (Postfix) with ESMTP id 3D3793401E5;
	Wed,  5 Feb 2025 22:21:31 -0700 (MST)
Received: by dev-ushankar.dev.purestorage.com (Postfix, from userid 1557716368)
	id 30E27E55F4E; Wed,  5 Feb 2025 22:21:31 -0700 (MST)
From: Uday Shankar <ushankar@purestorage.com>
Subject: [PATCH v3 0/2] netconsole: allow selection of egress interface via
 MAC address
Date: Wed, 05 Feb 2025 22:21:29 -0700
Message-Id: <20250205-netconsole-v3-0-132a31f17199@purestorage.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANlGpGcC/22MQQ6CMBAAv0L2bM2y0mo88Q/DAesWNtGWtNhoC
 H+3cPY4k8wskDgKJ7hWC0TOkiT4AqdDBXbs/cBKHoWBkDQSNsrzbINP4cmqsaZGJnc51xZKMEV
 28tlnt67wKGkO8bu/M2327yaTQqXZab5rZ1CbdnpH3tJ+4KMNL+jWdf0B5YeS/aoAAAA=
X-Change-ID: 20250204-netconsole-4c610e2f871c
To: Breno Leitao <leitao@debian.org>, Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>, 
 Simon Horman <horms@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
 Johannes Berg <johannes@sipsolutions.net>, Jonathan Corbet <corbet@lwn.net>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-wireless@vger.kernel.org, linux-doc@vger.kernel.org, 
 Uday Shankar <ushankar@purestorage.com>
X-Mailer: b4 0.14.2

This series adds support for selecting a netconsole egress interface by
specifying the MAC address (in place of the interface name) in the
boot/module parameter.

Signed-off-by: Uday Shankar <ushankar@purestorage.com>
---
Changes in v3:
- Rename MAC_ADDR_LEN to MAC_ADDR_STR_LEN (Johannes Berg)
- Link to v2: https://lore.kernel.org/r/20250204-netconsole-v2-0-5ef5eb5f6056@purestorage.com

---
Uday Shankar (2):
      net, treewide: define and use MAC_ADDR_STR_LEN
      netconsole: allow selection of egress interface via MAC address

 Documentation/networking/netconsole.rst |  6 +++-
 drivers/net/netconsole.c                |  2 +-
 drivers/nvmem/brcm_nvram.c              |  2 +-
 drivers/nvmem/layouts/u-boot-env.c      |  2 +-
 include/linux/if_ether.h                |  3 ++
 include/linux/netpoll.h                 |  6 ++++
 lib/net_utils.c                         |  4 +--
 net/core/netpoll.c                      | 51 +++++++++++++++++++++++++--------
 net/mac80211/debugfs_sta.c              |  5 ++--
 9 files changed, 60 insertions(+), 21 deletions(-)
---
base-commit: 3924fa995cdf3752f2f89f8de72834c4638c5ebf
change-id: 20250204-netconsole-4c610e2f871c

Best regards,
-- 
Uday Shankar <ushankar@purestorage.com>

