Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A73121990CD
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 22:56:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744152995; cv=none; b=oVb0lYe0vZAwE2ScWFc/VMF6KvyGPuu2aX9Pk/nKpM56U4ENBwzxZ/sPMK3cund7wQjCOxR4+T90awcBqrCx+v/YAOOtUOzgQa27t3xOHpQGk6PbSb2G3sXJvEB8JE7kjDolpZePNbVZRhDBWecSmFifuLga1AQFbX0LkFtgRaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744152995; c=relaxed/simple;
	bh=TRBpCxpPErvC9vf6r1KxqZGgSpiio7AvdNhVlYpOejM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=D5aQ0YCN0vvQZyWxTQaGEfRadVxCyjMy3BYiFGMh/g6KvqHsQafvI88Y/O5xD5eq07NNKh148LPn+dd/EGkRelVAaHYYiFzXcVd+pB0rtZDHVnB0+hnecuZh+QOGgW3H76ZIJZHnCRXrrBwovNk9SdBmd/9LZykLcBxodkivCQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org; spf=pass smtp.mailfrom=neverthere.org; dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b=AFEHtLDt; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=neverthere.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b="AFEHtLDt"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-22928d629faso62603895ad.3
        for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 15:56:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=neverthere.org; s=google; t=1744152993; x=1744757793; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LRSE/FByM16FtEVw5mNrSLD9YZcn125jpwvzMuX+IFM=;
        b=AFEHtLDt9CO8gkQ+r/8yQkcmTiPRm55dJJ2cKGOeYBi993kubTY5vu4a9oR7nVvtRX
         AruWJTvqyxz6C4jd+xaPUU89AzGKr5LZJryin6IwJGbgRxw010PpChnfpCwjKaQcYj2U
         uaGycdpVZwjpPD7+SgkRT/p/spaxeQv6hxHxAYikoOAgbJV7A2Tz7zPzngZgSubUGGRA
         x3mgK/tei0LRxtS5TrBaCb2bdxYOK9V7vnn4B+xSoR2blVsdqC9Sttl0A+XuEpLcNWgg
         Cd1j5Fk6E2+O1f3iKQlDNftWCs6PHrWxmaIrTl4dvkzaExBjKMtxW+t0c1wlZDssWBLk
         +jtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744152993; x=1744757793;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LRSE/FByM16FtEVw5mNrSLD9YZcn125jpwvzMuX+IFM=;
        b=DOaAlp2qOFyyEhhmN3JN3u30sMnbiNKaN3XeadoqH91It0g6H3hOtLzGoIDeZuxnpY
         yV3MOXP1utDUGV02/Vm6eEERoSRzFphbsLt2Sq/BE9rNweS8NcSQ+uJd1MkJmgJqde+a
         pWLECVXKwkz4lNGLytNJnKMQqfSBGT+PFugF+lerj5eMRVhizvySsec3dY8ZF6eyzj+y
         N6kdckDos7E2muHZy04hetneLf0s8Pp8jgNWFSLVdWoGkO3MspWhOy7nHhS1DVyDGGfi
         8FfLtyDeMQB7xzmBL3JetDLk9ENbqhyk/sBM++CSkmpq3VIZimv9EdETLobEJgGuhxAp
         DjMw==
X-Forwarded-Encrypted: i=1; AJvYcCVB27pB0f8v/WMozBfFjGFoRSxHGCApVmGP5YvMuW7h3tUfavUbB/Y3N2uVvTUd50+DpTghQpj3QoLWuwU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8o4QsSLEERUJz8F5MpGusT2cBzz9NZOmkYBT1uep8Gmm47gcA
	pbX/AqP2c4z2NJBEKRfuj9qyUDm0i+cMlm32Dwox/T1XEaq8/UuuvnGMe/HJUw==
X-Gm-Gg: ASbGnctb1iW4/5x17VEN81C6vKijn6LnGJu0cVpqvqcazH7AklU5rNPUAOFsy8mApQh
	rCm2u0FY5b3gwTqoQoE31FV8vmfNRgf4yWfpK+kfDECVLqZuZQ25XmGeLPZDG+WW+Yndkz2ZgQI
	VHE4dc8xfHcA/Lr4lH30tfwV4+a94Jcxe2vLk6l3FYzkzQ/sT/igxVlJQevndln7MUOouSOBC7j
	Nj0x6jFnSIfOYyhmBlCIqfH6a05fYNty3Wl4bwmRuivpHUZBpwLtI2PS9XFOawY85Mhp425rFbf
	lq7VC/O2xviuyrJ0R0+fhvSCwr6x4Nn7kkeAROPCoUtICpOxNEGYuHvRqCgg7eVBGLDYRyIrf3p
	tAPhgFra9mw==
X-Google-Smtp-Source: AGHT+IEiHHZ+CcgBSLU7e4/EiMGdNliHUboV+VfHVh+QDf6U1U2JWX5TembEMbDPUlN1UKwXkKLQAQ==
X-Received: by 2002:a17:902:ccc8:b0:220:c4e8:3b9d with SMTP id d9443c01a7336-22ac2a1a5f0mr13284915ad.37.1744152993014;
        Tue, 08 Apr 2025 15:56:33 -0700 (PDT)
Received: from tiamat (c-69-181-214-135.hsd1.ca.comcast.net. [69.181.214.135])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2297877288csm106456005ad.232.2025.04.08.15.56.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 15:56:32 -0700 (PDT)
From: Michael Rubin <matchstick@neverthere.org>
To: gregkh@linuxfoundation.org,
	dpenkler@gmail.com
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Rubin <matchstick@neverthere.org>
Subject: [Patch v1 0/1] staging: gpib: agilent_82357a uses completion
Date: Tue,  8 Apr 2025 22:56:27 +0000
Message-ID: <20250408225628.187316-1-matchstick@neverthere.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

agilent_82357a_send_bulk_msg is a oneshot event where a semphore is meant for
synchronizing over counting events.

Recommendation is to use a completion instead.

Reported by checkpatch.

WARNING: consider using a completion

* Patch 1: use the completion instead of a semaphore

Michael Rubin (1):
  staging: gpib: agilent_82357a uses completion

 drivers/staging/gpib/agilent_82357a/agilent_82357a.c | 12 ++++++------
 drivers/staging/gpib/agilent_82357a/agilent_82357a.h |  4 ++--
 2 files changed, 8 insertions(+), 8 deletions(-)

-- 
2.43.0

