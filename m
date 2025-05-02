Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1B821EB19B
	for <linux-kernel@vger.kernel.org>; Fri,  2 May 2025 07:21:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746170517; cv=none; b=JkCsFRm389QkbN59hA25CQQkl7eFoWgr5WoxW5vqPRHaBUowJWn2RoMD8Ws/1NYV0uuN9INqdH9Pc4UaS8BnhS3DVgWxMFVbn9nIyOU1EISh3w0Fp+haKdmx7gOWPByL29xTdO6bUnGofU8gmbGCuBeRwzoJMVYEwt5s0TvBPxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746170517; c=relaxed/simple;
	bh=3K7oSqaXuvyTA2yowqiZmKdrO5bd52q2Gb1kS8oNDUA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=e+hQtEEbhN+w89cK9hEt89hikIddtxpYsQy7lOqFLPIDCwNYa5ZSpl3IDMWePeppzkl9zgf4QCj6wipydttN6Vj9Co7tOktPPlcxqNILhCyb70V38MRDiWOHnl2kTbvwcPfuh/5Jfzfo1uKWMKJjAy8nMUzIoMcyuZE16GgF/WU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eBZy4kfq; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eBZy4kfq"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-ac2aeada833so328788066b.0
        for <linux-kernel@vger.kernel.org>; Fri, 02 May 2025 00:21:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746170514; x=1746775314; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZokquM6szUgmie/bqDbWMtr1zduLgqL6RmxwvXM1bHk=;
        b=eBZy4kfqBLNLuO408uD7w1CO6ZHHLJY0VAxM6XRhmXMKsdGqmvLlqURW9VOjwMCcQv
         MTuKgH2I/GVrRNdB+nuLAwp8++HbELVxuf4YKfS4vq9x3yEuen6SnJ6F2D9oCTvvAIqA
         NnZMI6WXOmLOoHcwyCALJZFFwGQfLVnn5mVDaua1LyFL7kna3qk0WQ6OPXbIg/dB4le9
         ENsqLUpPdPfXO1qXRlcFO+KVRQAb8BeTM51BdWB0zTmX1FoLF4ZVlvqYBKi0+TCGeGCd
         rDEz+GX26/wLVP0e+PIu4pMYrKnoM0YYTkaNDSVynXICf7ri7k13E4k0yDTeXndMexA9
         NZ6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746170514; x=1746775314;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZokquM6szUgmie/bqDbWMtr1zduLgqL6RmxwvXM1bHk=;
        b=f8Ee53xL7i0BjLvkz5ALu3tSnkxwW8/T70RyV8doQhmGjhyiHLOc0D23p9jArpIkgb
         Jjx+MAtRLVjiwUAHksrMdzpTCxumLuSVq5wEeFnqSmf4hmmrUf63ZiRWKSJw7fc5WA3a
         ykpxMxKxpSm0WQZu6De1oKLMF24z6o/75f8fi2fZF3olu822gvlmIRS2/cXanlwfzTWm
         c8GrpFnf9jUBjPgCy6QdsATkky6GJKFuloY+o1W/OmcmFwssMhamYFFKBpUVh3KuSM1C
         P9LWGqFWk6cBC3js7AKN6qvU7CIi6XlKIQ7a7qBSOTLXk+1duWgk0a2CeugWY8M5hfpR
         yw3g==
X-Forwarded-Encrypted: i=1; AJvYcCXMCZ1/seJCup2D5rbRqg50/BfOSxChe1ZE4IPCYDNZJJOIeEJ/gB9qDk3xzBvJw0DIrARvLFk4+VQIwK4=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywe0xKR/A2bF7y9mHALmg2a9OM0jo7ZxGkmfYrvqDuk8VOzCiPN
	CByuDWXibeEWYdHmG+whGy2iQvmivFk0FLYnn8mP7KDw3148Zzqk
X-Gm-Gg: ASbGncu0/OaQheREp/PQmgfV3iL0hKr5/0bhlnkzASIvvg6Gns7La/meR74OZEEwZEf
	BSxOBNFHOqmDLJMeXWDOlWuI/Fgf03Qie4W9grBbTkeeb7kxyQhuzu8QMDt7D88MBpmjt1DeDVa
	tM97Q12tR5SH9GBggzM5jmvZhb0WxRSHDkIDZkdizqFcKBrraB8mR4tWhtbs4LIPSbBxt49S63d
	ApDLYEngtgUuBkBmtLM0aDttrlm9Aeq5/PBE/CBIWPIfBOaABqmzyomA7eCE8W58i4DUyKv/euG
	+wwPhA4lBpgAT8wNKl5GkonH9zIM+aP2MacOeKR90Sl2qCw3ucs=
X-Google-Smtp-Source: AGHT+IE9MAWXEMZMpEl4Rg7v0cakakCngPqaYCfrzUhTRD7ZohLrmT/FUFCrVSPmO0ixvT23uAzxyw==
X-Received: by 2002:a17:907:7d8c:b0:acb:1165:9a93 with SMTP id a640c23a62f3a-acefed30b3fmr462768466b.3.1746170514026;
        Fri, 02 May 2025 00:21:54 -0700 (PDT)
Received: from localhost.localdomain ([178.25.124.12])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad1891f3c6bsm5691966b.82.2025.05.02.00.21.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 May 2025 00:21:53 -0700 (PDT)
From: Dave Penkler <dpenkler@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: dan.carpenter@linaro.org,
	Dave Penkler <dpenkler@gmail.com>
Subject: [PATCH 0/3 V2] staging: gpib: ines driver fix and cleanup
Date: Fri,  2 May 2025 09:21:47 +0200
Message-ID: <20250502072150.32714-1-dpenkler@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

These patches address some outstanding issues with the ines driver.

The issue addressed by patch 1 was exposed after the entry points
were declared static  (patch 2).

Patch 1: Fixes an invalid ifdef config identifier
Patch 2: Changes the driver entry points as static
Patch 3: Corrects an unused variable warning

Dave Penkler (3):
  staging: gpib: Fix PCMCIA config identifier
  staging: gpib: Declare driver entry points static
  staging: gpib: Avoid unused variable warning

 drivers/staging/gpib/ines/ines.h      | 44 -------------
 drivers/staging/gpib/ines/ines_gpib.c | 95 ++++++++++++++-------------
 2 files changed, 48 insertions(+), 91 deletions(-)

--
Changes V1 => V2
  Patch 3 did not remove the initialization of the unused variable.
  Remove the asignmenst and say so in the commit message.
2.49.0

