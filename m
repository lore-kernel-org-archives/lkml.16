Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1FEC1D79BE
	for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 01:37:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744940266; cv=none; b=bPJ5opzKC6q5MOjW53nZ1A9jHYIWnvquXtWf5gIKLXCuBLPkhZrRZtI/OYH6/AdS7DzPBxByY9NhiEPCNjmERfg3mXy6L5hLM3O9N/HKld7+rptfh6fhgTU0vhCiFPMyqnB0S44dJAEichd9V99Nk95oDbf0JXzBFCGmmFnxm5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744940266; c=relaxed/simple;
	bh=83ine0mrSdz+4LSvDN5s7gcTAppP0Ss3rM2gY/WezSY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bmf5B4gCXl9Aac+29shJp+bs+FVajFfwwBrfZfIi+XBGfJw0iQLN+qntZE7qPS8uRR7NMldHKernz+D3chMrMt+qKAVTEiFJj2gsKHaYjmZE+3AsQEDmnFGDZ225ffigyZV8Hc2uzjj9UnJuv9pN4c5GNNv929BzoGmriZQg3X4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fastly.com; spf=pass smtp.mailfrom=fastly.com; dkim=pass (1024-bit key) header.d=fastly.com header.i=@fastly.com header.b=KBwZwn04; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fastly.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fastly.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=fastly.com header.i=@fastly.com header.b="KBwZwn04"
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-af5139ad9a2so928670a12.1
        for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 18:37:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fastly.com; s=google; t=1744940262; x=1745545062; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7I8NgF9RlR8FwCsr9V1VCpYsrKioxWgjmoDan09dvi8=;
        b=KBwZwn04q/Az4CTzRDbtKoSU00TO9Z/xrWcUsw7FM+2ozNDJiRe3Ps777sLenVxfv0
         Hs+fzwD/qoGgS/vO0s0GfFXJqE/JEl3pNsiPxu0NViu5v6gqgmhkb+VfggCFol6FVNDP
         np2CMOiGNp+thzOhK4wZrb/c+aflqjbvFCrWk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744940262; x=1745545062;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7I8NgF9RlR8FwCsr9V1VCpYsrKioxWgjmoDan09dvi8=;
        b=i64OcmodUjIpDC5EJ7VzDkvfpXxJpCpuZApF2YUWrC4YRIJjcx733BKx3jFc28IYgb
         kOGu2z6icfdJD/7voouMRxtw/Mez0l1svTRe+V/5siHi3hB+6VyE+75mwwhLxntckoWS
         IZjqO4GTM93UKEEcxgKlcSmLcxNAmRGNab1TR1tDvMhnZhFrFy4IQjCEj77C8uth6F+n
         VaJ/8kmZxuw+kEU0EqsCnnSPcTIKCn2nMHtzCuXsANGnsQ500LYYrhfT4JsxaGiyXLKV
         odjiC2E4A4YXFdi4vCeghFTnCAog7T4oiCAQb3f9V4nV99vdny58MjxSA3I+Pcl8uxkS
         sETQ==
X-Forwarded-Encrypted: i=1; AJvYcCWXG106hvWcjup9B+mqVL+btBwjbw/YjMMDYLTWUcFwSXCTVmfpffFDvECeF6W1oqH5LkSRNzqepQc5T9I=@vger.kernel.org
X-Gm-Message-State: AOJu0YzDKXcYZsi8Fr1WSxzaRvAzWk6mRSzGWYqXSYg3DkCyXczHNNCo
	o8uW//9fwpiWy9kEEEODNAnoDYv1PUQMjb9FCQ1eeEoR5xTprrs/jF1gg/PhPK8=
X-Gm-Gg: ASbGncscUZhBRAmbzsLLJNTSw4sNH0mTMAPPY92yXOuXLEy5jp1XNT7Zb8p2CbQvVwk
	EMDFrW2iGPgnJhEl6sSkz4Io4v9ceNqJKYuotFFhilVU3ZUp/01JcvUKEDCOkkeHtx9nKKeDlDU
	uTTl5TxbucPhqDe1CMIkQQXWqoBkzvVcPYfy0Zwi6cQMRGnROEEAR1gLznfLT5SKhrvut1AGCja
	jhycVy/u6SM2ZD+IuQrwcVfHe2dZBCt9xDfzN2YZqvDSrMfIrAoctZm4eAsgK19ZcpSbFB0/iXZ
	vcPL3G8TWRjvllXCQ6ZQ7VuDO34hUF/y1mEnn1Ybn2tnckkT
X-Google-Smtp-Source: AGHT+IE6KmDOqTadvPBOoP6NCbep8sj/+WD00V+zMFXa6ok1PnWjm2kVgaHVjOv1izpghACtKB8Bjw==
X-Received: by 2002:a17:90b:568b:b0:2ef:67c2:4030 with SMTP id 98e67ed59e1d1-3087bbc4d52mr1273243a91.27.1744940261993;
        Thu, 17 Apr 2025 18:37:41 -0700 (PDT)
Received: from localhost.localdomain ([2620:11a:c019:0:65e:3115:2f58:c5fd])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3087df21278sm131772a91.29.2025.04.17.18.37.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Apr 2025 18:37:41 -0700 (PDT)
From: Joe Damato <jdamato@fastly.com>
To: netdev@vger.kernel.org
Cc: kuba@kernel.org,
	pabeni@redhat.com,
	shaw.leon@gmail.com,
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
Subject: [PATCH net-next v3 0/3] Fix netdevim to correctly mark NAPI IDs
Date: Fri, 18 Apr 2025 01:37:02 +0000
Message-ID: <20250418013719.12094-1-jdamato@fastly.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Greetings:

Welcome to v3.

This series fixes netdevsim to correctly set the NAPI ID on the skb.
This is helpful for writing tests around features that use
SO_INCOMING_NAPI_ID.

In addition to the netdevsim fix in patch 1, patches 2 & 3 do some self
test refactoring and add a test for NAPI IDs. The test itself (patch 4)
introduces a C helper because apparently python doesn't have
socket.SO_INCOMING_NAPI_ID.

Thanks,
Joe

v3:
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
 .../testing/selftests/drivers/net/napi_id.py  | 24 ++++++
 .../selftests/drivers/net/napi_id_helper.c    | 83 +++++++++++++++++++
 .../selftests/drivers/net/xdp_helper.c        | 49 +----------
 7 files changed, 173 insertions(+), 48 deletions(-)
 create mode 100644 tools/testing/selftests/drivers/net/ksft.h
 create mode 100755 tools/testing/selftests/drivers/net/napi_id.py
 create mode 100644 tools/testing/selftests/drivers/net/napi_id_helper.c


base-commit: 22ab6b9467c1822291a1175a0eb825b7ec057ef9
-- 
2.43.0

