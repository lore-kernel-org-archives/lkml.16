Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 158AAEAE7
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 01:33:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744853587; cv=none; b=dPQ9AO10i9XaqPS7VMNUR9vG4n1pGfd6gCa8UR2/lN79++MGyDZ16hBg3w05AfKeXfJ6wtz1sG1m5++iJIFtxA46nL9AGJMu1H/xq3/fqiK1NfNZ8iTK22gWBWh26FlQyGWMMwHcJbbVSlTOhydcsOinoayVkVj9HWh70E8odPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744853587; c=relaxed/simple;
	bh=2xULYgcWmIJIehHFYM/bibVezPdaJmAJv90YTx9g74U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RQ5ZWVoodrbhzosjscbJgq00b+HNv21ZN5lIvLB294mjjlwlhrfeI7R080fhxws52kEriYiNvhWN7H0X/1LMAvB8OCl4mJLWQSGuIYnAszdfDQQ7WIxH/4vm+u55O54JVl0+00xyqyThfIotH1RT3mVULZcW5Mz1v1diPuK9pH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fastly.com; spf=pass smtp.mailfrom=fastly.com; dkim=pass (1024-bit key) header.d=fastly.com header.i=@fastly.com header.b=Niit9KmY; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fastly.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fastly.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=fastly.com header.i=@fastly.com header.b="Niit9KmY"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-223fb0f619dso3275155ad.1
        for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 18:33:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fastly.com; s=google; t=1744853585; x=1745458385; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Cl7lm0q1pdo1TJIdPWC7UtnUlQ76D/cDOJLKOcjE6io=;
        b=Niit9KmY+zeqZb+KOolZ0UPw8k+9oFE9HAUxH+EOggwLn0LbFnpTqB7MfJyHqc3jYz
         dskzprgL1yZRgw4itsd7cz188OasiYGAbtVbw2KnKTKziHlS2ZQy0dfkoMvQpkqANJss
         BP1B3dONTAbPh1auPbTt4EqMAVe9IuB6h1UEY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744853585; x=1745458385;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Cl7lm0q1pdo1TJIdPWC7UtnUlQ76D/cDOJLKOcjE6io=;
        b=SgGy9SzZ9F29ABIfb3Tbv0XcMK/t2TyQnRXmgJHa0cbdRilwNMU8hdmO8NtqhR2guK
         87M4b1XagCkcvhzyVtu0vKsxdc8Jq1w5rTX3Ln7ACAjQlkN4Y2FwSWGQuKQksUleBum2
         /ABkuVDXMZS7AU5ApxMDwl5KQcoTmvP82tWc5MEx6A1oiAH11rkkQWSuAt3+d39WzT8a
         yLs78l2+dNJyWNcmHl57tdoYyTjecNP4eEoVbpVEe2SjSjrv8+ByU7f0wUrZKH8lRhpH
         ricuyIgwSMBj0Xg9h7RxPYjHai6YCMP+audIuKzxn1hvQBTrkb+NKS6mYHpxh39sQL6h
         yEkg==
X-Forwarded-Encrypted: i=1; AJvYcCWk/wRRODmjBOGLebcWAXlWSa1bGYoFwp6RasNyiWf5IQ2OVQL/ekKm62rT6btyfyGv1wcmljyz3HJYFnQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YyHQ05Bfjs1IWBMGHrOOE6QdUpdveVlkfr1fpTg656XvNX9/weY
	QSRWI+/72H+wj/KogpQKeDDKJCYVwg6S/SbB01OkB8ophQixDnk+PadX8nbTAWg=
X-Gm-Gg: ASbGncsnXe2KY/kbTZcMEx7jBfEdrL2p2k+/kBZNbHxNu/AsppFRYgqBifHIipEAj2I
	WpsQQjDcsTzbQQJ8pDOk6wxfceXI094QqaL7TtwikEnPmWjBLOg54bNySA4eknE7FDE7pA0PEZb
	lMUYzPKIQKkiEkaD0vGDiwYdj2zhoQllI2fADyGFyiH5QzrmhFvcHqCrtC9XErb/XWAqYmjV5m5
	XbMQE65w1a1/uJhwx+cwWFFUv8cBUe4F74AD5pO6YnrBq3xPn7HAwVaQ9PiB3qHmbpVgBMvLyQf
	4PZ44Prg3PJ79hEDa02lV59kbux/74Da5OQyjjVIFs/GwhcsurCttNqbPfQ=
X-Google-Smtp-Source: AGHT+IEfKQ+r/gnTBZHe1EymGe3tKAmJ5TO38k1pfoylMUgPGDSds01vW9UdN7R4QlZfSpduWCIKYg==
X-Received: by 2002:a17:902:ea07:b0:223:5c77:7ef1 with SMTP id d9443c01a7336-22c358dae13mr58260805ad.21.1744853585258;
        Wed, 16 Apr 2025 18:33:05 -0700 (PDT)
Received: from localhost.localdomain ([2620:11a:c019:0:65e:3115:2f58:c5fd])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c33ef11c7sm21349505ad.37.2025.04.16.18.33.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 18:33:04 -0700 (PDT)
From: Joe Damato <jdamato@fastly.com>
To: netdev@vger.kernel.org
Cc: kuba@kernel.org,
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
	Paolo Abeni <pabeni@redhat.com>,
	Shuah Khan <shuah@kernel.org>,
	Simon Horman <horms@kernel.org>,
	Willem de Bruijn <willemb@google.com>,
	Xiao Liang <shaw.leon@gmail.com>
Subject: [PATCH net-next v2 0/4] Fix netdevim to correctly mark NAPI IDs
Date: Thu, 17 Apr 2025 01:32:38 +0000
Message-ID: <20250417013301.39228-1-jdamato@fastly.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Greetings:

Welcome to v2.

This series fixes netdevsim to correctly set the NAPI ID on the skb.
This is helpful for writing tests around features that use
SO_INCOMING_NAPI_ID.

In addition to the netdevsim fix in patch 1, patches 2-4 do some self
test refactoring and add a test for NAPI IDs. The test itself (patch 4)
introduces a C helper because apparently python doesn't have
socket.SO_INCOMING_NAPI_ID.

Thanks,
Joe

v2:
  - No longer an RFC
  - Minor whitespace change in patch 1 (no functional change).
  - Patches 2-4 new in v2

rfcv1: https://lore.kernel.org/netdev/20250329000030.39543-1-jdamato@fastly.com/

Joe Damato (4):
  netdevsim: Mark NAPI ID on skb in nsim_rcv
  selftests: drv-net: Factor out ksft C helpers
  selftests: net: Allow custom net ns paths
  selftests: drv-net: Test that NAPI ID is non-zero

 drivers/net/netdevsim/netdev.c                |  2 +
 .../testing/selftests/drivers/net/.gitignore  |  1 +
 tools/testing/selftests/drivers/net/Makefile  |  6 +-
 tools/testing/selftests/drivers/net/ksft.h    | 56 +++++++++++++
 .../testing/selftests/drivers/net/napi_id.py  | 24 ++++++
 .../selftests/drivers/net/napi_id_helper.c    | 83 +++++++++++++++++++
 .../selftests/drivers/net/xdp_helper.c        | 49 +----------
 tools/testing/selftests/net/lib/py/netns.py   |  4 +-
 8 files changed, 175 insertions(+), 50 deletions(-)
 create mode 100644 tools/testing/selftests/drivers/net/ksft.h
 create mode 100755 tools/testing/selftests/drivers/net/napi_id.py
 create mode 100644 tools/testing/selftests/drivers/net/napi_id_helper.c


base-commit: bbfc077d457272bcea4f14b3a28247ade99b196d
-- 
2.43.0

