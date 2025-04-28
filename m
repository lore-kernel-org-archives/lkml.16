Received: from mail-vk1-f226.google.com (mail-vk1-f226.google.com [209.85.221.226])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37D8A212FBC
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 23:10:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.226
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745881846; cv=none; b=miMZ+3MQ3LEVQVS5ixfpask0MpEvJrNUVzK7dhpo7QrUWzu3ur43DLJ1EgBp3dfh2+iYx3cctpfbHCbwgjw8Y8iHWlcJG0n1QVnyN6UcurXLu+h3A90hTq3Z/3ut103nB0A8ET1GP02UYPoZ9nDaPi/ntcMlF9Chj/zHQ5bxm+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745881846; c=relaxed/simple;
	bh=7qGhW0lObjamK2vkejF8Y9mV1B303QKOHDtBCxKSc/k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cssfx9/OmY+/ZqqmYLv253LW44qE8HE1wfJ719eE1cZQztwdD/gO50fx47Cb+oi6O517QOXuLcoT4HuEYKNmW6p1STH2TE751Fvr6uOTP5MQNLXW4R2TopEKoY5x0Pi4Ve2QYI1w4EvJW7Z//ItbrE0h+VHlAmi8M+mZwFl4bNg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com; spf=fail smtp.mailfrom=purestorage.com; dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b=Qwg3d+sz; arc=none smtp.client-ip=209.85.221.226
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b="Qwg3d+sz"
Received: by mail-vk1-f226.google.com with SMTP id 71dfb90a1353d-52446b21cfdso2192718e0c.1
        for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 16:10:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1745881842; x=1746486642; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Bmz20arlb8RcX2p20KSIo8CkAzDOxhHq99zIjNZrVW8=;
        b=Qwg3d+szDdvNKGHasY0mJtoELugv8k19HwrB4bG+7fHmF6w/ZdO3bEr2mePCzJtFld
         1ZmMqiHlU4FgFJXt0j438mbMt/ujwSl6zN5Barz8N2dCmbe6lCAQjo7JCF0CU5AuNrFg
         qsyJJdjUCc6JW+5529Q3piA1teaADBVRoIsMe45tCPzTzpW6pmeaMAHlv4b1sLBSWxh9
         8Ivybg2vQw6TXY4HifMoefoZrVcf1/nMwjuYjO6i3HyVPow4WW5OBYDhlt5VM2r7ybOn
         keEZYpueQUFdr4VfY8GB4btyHA9VCwFUZgD10GHBTXWVf6fOsj8mCIdTmZIwk9ziLhIs
         p1bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745881842; x=1746486642;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Bmz20arlb8RcX2p20KSIo8CkAzDOxhHq99zIjNZrVW8=;
        b=Rc3R9ZQdoYN00wHgfnoc9+qZ7Kw71O8fOV/tgRhiak6GxtaX9o1yoc7ikr20QDcBe1
         m1qKP+SfbrcqmdIHwmINY3OiRpz+ZguV8v6lI0UBFq3r2BQlTVxO1rdW1/fRHZXtMMCf
         A2d4vvh+I1Yviyp8YwPMBFNSKSGKdppAQOqDAyM/s4KgMnx33byG0xOzHeRG9Bt3PgTk
         t4TG/GcJBPTtaevFLFtpIUIvlsAElBkHtVHagXQJh0uRg56Y6uXbFCnH7kkD/8v52VOz
         XAypX8bnlBBm4AIF6OEHL/jO9GB0smkWDTNnhHQYjjxCQFtxvV5cYr7aEF69tL2tsFvc
         mNrQ==
X-Forwarded-Encrypted: i=1; AJvYcCV//Ma+a9cP0X475NaZfuoJsgd8Wwee/sphep2IQ1i/AmWMJCXkkkNZx1mTVDJaEK9Rp4h3QC7cCODtdp4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyOYtbjAUh4DX1W9b6r1ZcgEJ10XVKvWn+9pOpO3Gr08o8BBXDm
	wf1RZP9ZvBj8MS0b+NRbpPTYiZLzIehqjK67/7h/afz4/qNvMTG8dnULaOibWfBQAgJJb0iA/+7
	zbquslvzjDo/Jd/yzw0grdMulCcvX0N7t
X-Gm-Gg: ASbGncv6S6uk3I+JOf+0GxMMIp8vOrTpoChpJtJo2mq8+6mxMfAJGNEwqQfdbcVj5Wt
	0I42FcKD46zgQlCnxkH3owBM8XHMmBhWPtFlxX+ZxbYVt/hVgx9N0sxbPL+t9CYaU12fNDWbdKL
	sFJf/74iYH7F8GLToIYzX5U952WelHecyXcS6IdI259EfYDvj7gi68Qe/tKd3aM3wlGl/WZJeLp
	O1xiLjxZ9Jnx3IGfPouP28QIYFTwCFbcdm0H2V6zQnjXVBU3eJRgsb2ASyvSodui3v89gDWcezz
	ktWZoJxt5KesWs86xDxFYHe9Zr9IHgYzZd8SScf4HpOR3g==
X-Google-Smtp-Source: AGHT+IGM4smmOhtgP/4+Uo/a8IWC8EW5NjjaSX4wyDUOukBYYBtb2f/7+HWxfvUz6i44U/GswKTrYMpTZVq1
X-Received: by 2002:a05:6122:d04:b0:529:b2:ea5e with SMTP id 71dfb90a1353d-52abf0421e8mr1039622e0c.2.1745881842049;
        Mon, 28 Apr 2025 16:10:42 -0700 (PDT)
Received: from c7-smtp-2023.dev.purestorage.com ([208.88.159.128])
        by smtp-relay.gmail.com with ESMTPS id 71dfb90a1353d-52a993a2955sm790539e0c.10.2025.04.28.16.10.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 16:10:42 -0700 (PDT)
X-Relaying-Domain: purestorage.com
Received: from dev-ushankar.dev.purestorage.com (dev-ushankar.dev.purestorage.com [10.7.70.36])
	by c7-smtp-2023.dev.purestorage.com (Postfix) with ESMTP id 49A673418B8;
	Mon, 28 Apr 2025 17:10:41 -0600 (MDT)
Received: by dev-ushankar.dev.purestorage.com (Postfix, from userid 1557716368)
	id 3B199E4191F; Mon, 28 Apr 2025 17:10:41 -0600 (MDT)
From: Uday Shankar <ushankar@purestorage.com>
Date: Mon, 28 Apr 2025 17:10:21 -0600
Subject: [PATCH 2/3] selftests: ublk: make test_generic_06 silent on
 success
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250428-ublk_selftests-v1-2-5795f7b00cda@purestorage.com>
References: <20250428-ublk_selftests-v1-0-5795f7b00cda@purestorage.com>
In-Reply-To: <20250428-ublk_selftests-v1-0-5795f7b00cda@purestorage.com>
To: Ming Lei <ming.lei@redhat.com>, Shuah Khan <shuah@kernel.org>
Cc: linux-block@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Uday Shankar <ushankar@purestorage.com>
X-Mailer: b4 0.14.2

Convention dictates that tests should not log anything on success. Make
test_generic_06 follow this convention.

Signed-off-by: Uday Shankar <ushankar@purestorage.com>
---
 tools/testing/selftests/ublk/test_generic_06.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/ublk/test_generic_06.sh b/tools/testing/selftests/ublk/test_generic_06.sh
index b67230c42c847c71b0bbe82ad9de1a737ea3cb75..fd42062b7b76b0b3dfae95a39aba6ae28facc185 100755
--- a/tools/testing/selftests/ublk/test_generic_06.sh
+++ b/tools/testing/selftests/ublk/test_generic_06.sh
@@ -17,7 +17,7 @@ STARTTIME=${SECONDS}
 dd if=/dev/urandom of=/dev/ublkb${dev_id} oflag=direct bs=4k count=1 status=none > /dev/null 2>&1 &
 dd_pid=$!
 
-__ublk_kill_daemon ${dev_id} "DEAD"
+__ublk_kill_daemon ${dev_id} "DEAD" >/dev/null
 
 wait $dd_pid
 dd_exitcode=$?

-- 
2.34.1

