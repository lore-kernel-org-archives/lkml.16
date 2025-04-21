Received: from mail-pg1-f230.google.com (mail-pg1-f230.google.com [209.85.215.230])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8931E22D798
	for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 23:46:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.230
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745279206; cv=none; b=ZMEeB0vSAyCHiQ5p1CBpPR3W0ezS4F/9TcOAd35ewgr2eRamz9/8j1a4ESkXMg+KIXFvZaBS4IDrx1ddBjNmMUjjXU6uxym5IbQ1qhZ3DoeQqUqIdqV+HSusU2bhTM+l3Jl6IR/2Pl7E4FcZHvDYC6Db6+pP6ZoBp2+lGtdxsZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745279206; c=relaxed/simple;
	bh=MgZlolvtjiXQgwF7T8ugwhe+ecGe6HjkZ/Z4cLljf0U=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=LIN5k1oo3f4dbQv00+J5Gd6r7AT8ctdS4rG1zY1FwWNMrtZSkyWCQLGIcDJHxrTX0DWxkfZqAVBmVRrupvPlEPPHmOwWkUXuekpXieviYwtods4Es1s59fpIgvwekNK+FnfjQTX7rYxhyY+88s4EKNhvFNu7rmcrZ84DJOFaArc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com; spf=fail smtp.mailfrom=purestorage.com; dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b=dmE+0fG8; arc=none smtp.client-ip=209.85.215.230
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b="dmE+0fG8"
Received: by mail-pg1-f230.google.com with SMTP id 41be03b00d2f7-af52a624283so3787109a12.0
        for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 16:46:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1745279202; x=1745884002; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KTxwRN46KxmBWYrElcrYvw4CJWFiySXxgp0fC8wvHYQ=;
        b=dmE+0fG8Umu7oOMaqaDc+fhyyrd6/CxYzo76k4ezgdrPx8HX4zniM6EFiSuZIOrUvM
         kn7flimx8cV5i/QJEutxqh4nCTFxZy5erG5ffYqgi07XfmU6bob4/BWhIUrtd358KWhm
         QpkCjC8Q+HxeveRqjq0KBGolcq8kwHi13OwcyXUXeVYrBh2ADOhfeDwDBQ96TphiqV2j
         iqIgL5FhLIwubUqRCyJDpQSa7TJxhylOKEAzrmVEq5AozkJja3i3Xbu3Tjs8RZ77Q4P7
         mvSwyHw43UfnbIzua9ibzLx5HFMEg40xpRQUmqlqqJe1k4xOeARgmgOEXXZNioOUXFI9
         Qfbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745279202; x=1745884002;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KTxwRN46KxmBWYrElcrYvw4CJWFiySXxgp0fC8wvHYQ=;
        b=Or4iH/DGdWG5bFfuTEm7wl79hYV6fOS9i7oUNixUjpRNdafTdiJR47PJPRF4QzMaSG
         aoBZLK71CI0dvB7ahQHVa0PnMT81W1euOTCox2ZxQTin8oLk0k5P41+0gDIr7Q9FWZns
         HYOyw2R/Ahj9zLUG4cGcPWRLUan9fyeKqaC9xNdyAwUxEPJu5VF2YxN0YBpeTJx108uG
         Ur0gGe4cHscsWqTyIdDIiDSaA+4S6bup3Av2JB1zmriF3AXnrMFAQjUrTALYISSfeMMt
         E2Mzh5iQnoQeBHlPinclUShMGU5ZAGeL8jfOQvDWD/dLyE0mLe19pWxsOXIwM0x3EidF
         oq+g==
X-Forwarded-Encrypted: i=1; AJvYcCXeB7ZJCcBtBNWWwpKkKKzzFqwKFYjPHwSB4iuvWMsR8Dccv1CX3V5VF2oyWP2VXL5VYxJLFpiUMCfNx0Y=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8XM1tzlCtyrwbsvWVUrEIXJ3p9Y7W797kL13sriPXZ/Djakq0
	ghIyLlUb0U8mXi4xwkVpkb8OXaVr5rOJpBv0VRou/IINlGoxz7Hth1aR7yDv4DjNaIkILQlzsoN
	eLOeekcDfuSB2g5SHtqLp7+5WClwaveL6PIrxGC2lSEJAX+Hn
X-Gm-Gg: ASbGnctKgOToh5CxqBu/1xy0IM09d8VFqCi8PDDO5xXCXb+Ag+mMqILmh8YyQ6G0l1V
	pWlgm5QlrKAcIx82BhPr5jJe+NL9aWsrPKd5rPpF8Hnryff5qaOgO+WaFiVrrb4hrX7uTEbQbfq
	FKP9lWpnATd99peO5ARq7Ed6v04vWpwtvDhRbLuWBOlHOZzyVAIN1DaxFKd65nHdLnS0QPndCGN
	OhYeZHVu43QnsRQH+4fGwbdJZOcFnEnY70P2cQX1P6yQrlRgRZ5af2YAh0oPeQr+t+OMsMv
X-Google-Smtp-Source: AGHT+IG5VlJ1RIxmxTNJQSsKgUu08tRnQu4AxwH+uNxOrySYInQwR2aUQ0baLfIWdUvV8P/PJ+ZEdv6C/VZb
X-Received: by 2002:a17:90b:2705:b0:2ee:8cbb:de28 with SMTP id 98e67ed59e1d1-3087c2ca65fmr21290540a91.8.1745279201745;
        Mon, 21 Apr 2025 16:46:41 -0700 (PDT)
Received: from c7-smtp-2023.dev.purestorage.com ([2620:125:9017:12:36:3:5:0])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3087e05ee89sm512928a91.15.2025.04.21.16.46.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Apr 2025 16:46:41 -0700 (PDT)
X-Relaying-Domain: purestorage.com
Received: from dev-ushankar.dev.purestorage.com (dev-ushankar.dev.purestorage.com [IPv6:2620:125:9007:640:7:70:36:0])
	by c7-smtp-2023.dev.purestorage.com (Postfix) with ESMTP id E2FEC3403C6;
	Mon, 21 Apr 2025 17:46:40 -0600 (MDT)
Received: by dev-ushankar.dev.purestorage.com (Postfix, from userid 1557716368)
	id D7462E4055F; Mon, 21 Apr 2025 17:46:40 -0600 (MDT)
From: Uday Shankar <ushankar@purestorage.com>
Subject: [PATCH 0/4] ublk: refactor __ublk_ch_uring_cmd
Date: Mon, 21 Apr 2025 17:46:39 -0600
Message-Id: <20250421-ublk_constify-v1-0-3371f9e9f73c@purestorage.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAN/YBmgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDEyND3dKknOz45Py84pLMtEpdY+PUVMNEMxMLs8RkJaCegqLUtMwKsHn
 RsbW1AA0uycxfAAAA
X-Change-ID: 20250421-ublk_constify-33ee1a6486ac
To: Ming Lei <ming.lei@redhat.com>, Jens Axboe <axboe@kernel.dk>
Cc: linux-block@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Uday Shankar <ushankar@purestorage.com>, 
 Caleb Sander Mateos <csander@purestorage.com>
X-Mailer: b4 0.14.2

Refactor __ublk_ch_uring_cmd to:

- Have one function per operation instead of handling operations
  directly in the switch statement.
- Mark most ublk_queue pointers as const. Given efforts to allow
  concurrent operations on one ublk_queue [1], it is important that
  ublk_queue be read-only (or accesses to it be properly synchronized)
  to avoid data races.

This series is split off from [1]. No functional changes are expected.

[1] https://lore.kernel.org/linux-block/20250416-ublk_task_per_io-v5-0-9261ad7bff20@purestorage.com/

Signed-off-by: Uday Shankar <ushankar@purestorage.com>
---
Uday Shankar (4):
      ublk: factor out ublk_commit_and_fetch
      ublk: mark ublk_queue as const for ublk_register_io_buf
      ublk: factor out ublk_get_data
      ublk: factor out error handling in __ublk_ch_uring_cmd

 drivers/block/ublk_drv.c | 133 +++++++++++++++++++++++------------------------
 1 file changed, 65 insertions(+), 68 deletions(-)
---
base-commit: edbaa72ba1bd21040df81f7c63851093264c7955
change-id: 20250421-ublk_constify-33ee1a6486ac

Best regards,
-- 
Uday Shankar <ushankar@purestorage.com>

