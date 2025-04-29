Received: from mail-il1-f226.google.com (mail-il1-f226.google.com [209.85.166.226])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F5172777EC
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 22:41:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.226
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745966474; cv=none; b=f4Km0mv5a6MFcqX/M11SfMD4Dr895EXtXjutBH7BejwWMHw0VqIAfwbF+qqgfyjCZcN/iB72SJEEptqe8O1sGNCYcRg+xFyG91VCCcH9WucP9qNXZn9Cg92DmxHuvT5admEOk9EE04H+xBndTaB3IQmn6iyY3Q8e72hbe9+Ak78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745966474; c=relaxed/simple;
	bh=9WWclwrCg2TvbbTylHUPNf0AHpKWev2f2XnfjrSo0dg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=dYHBvC4/QaUQiIRY41iBQLMon1ZYvGk309atNE3BBAVO9XDY4Apr7M1QD96qZNLazwdAx97ISVeDeSh2R1pTALNXKQmXnYW8FoJaaoleeGxFZ7q7KOn9tFjPsibI6jzXQp4BlfbB6VWn2MdTSZsRvtXq/p8bTdjgdkwTfGcvEsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com; spf=fail smtp.mailfrom=purestorage.com; dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b=e4efcvoR; arc=none smtp.client-ip=209.85.166.226
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b="e4efcvoR"
Received: by mail-il1-f226.google.com with SMTP id e9e14a558f8ab-3d9189e9a06so22636845ab.2
        for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 15:41:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1745966470; x=1746571270; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zfQT2w7zXD5LlB+aHplKgN57RpOC1FTB5zWyhqieJWc=;
        b=e4efcvoR2C8bHWQtUEfzSUSTjBRt/bvr01PClQ13GPLnOvn9YIK+GF4Yiz7ReyOA0Q
         qCmXJDoeCyZwtF2ubcZRYqJg8m+E/pVBUPmzJPlLidwJeDHbOY8y2IdoUm1BOmLmRlrU
         BrCLoTUGpQcqiFHvN9hPcQQ3F4W+a6wKSBH6GBalhE6SwdtO/aLTrLDZF6Z564JhYp1A
         2wAB/IPjKC3Iv63nkIV05vijAgtm/FTRYNuYDcRUamhRmRqeWZFd7a8Q8H2qzxOwqaGR
         WdtKetcFO18I1yk/PJImRLi+VieV1Jx/yClhVWhuJx9TSnmcYcjN3+bS4VPrTBjtvV7D
         Ejrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745966470; x=1746571270;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zfQT2w7zXD5LlB+aHplKgN57RpOC1FTB5zWyhqieJWc=;
        b=nnGdkP7y5qZAt4S+Y9cmcI7Y+XpDdtB+4DT+FJ6laLCceFLoCxBOKatCS48p7xAph3
         jo9o2kr845/LY3toXS54CaRHlfdoMtlDggNSZR++jep3m9bbF2UlwHeOzFjNl3xmK5nU
         Arz4QivY2acisfGPog0pxixQGaivehK3cF2l070OC8YiHIqH9ug1rRsWCGc/WngsMsTX
         oYza6K40t1vEQOPGyKxbnf/r7Pe/wIhWRxSdWmmQ/v+e7mc6PDkfO5pMOA7qiEWC1IGn
         Zt/6tz0IyIOXycabnpQ0Bg9TwUFlWg3IHlXBx2ljq6SvQYZVK5aRIhjilFukwkcQQvuy
         L7nw==
X-Forwarded-Encrypted: i=1; AJvYcCWQYGbJJfIoPBsJbbZs6d2QdE2372ZiObr9gYnhoaWFUHY/QBOthoccbX3x9EA9OQBHbBr4OXFCaJnG5G0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzT86a8CxNiT++vFzCFx2Xk+gOhLIJwGiaCkvIi1BqzLfmGVBlS
	F1cQO0NQe26p25PHiYC3EZtada8nHf7VODpvBmu4DJR7c5ncm5z91SEOjof4MAV6ayCuP9HINrT
	xBchJf5KmZVkrUNKs+G0v/YAJL3KMpRPq
X-Gm-Gg: ASbGncveC7zicmA1x6RGMGd5oYjIRHYFPKFOCjCMH4UKFyDg35cfe+0RqvmK+EmNALk
	qwgl9TkG9KVou247UtQUN6OxLdVfY+7l0HJoLRV1etsLnlw8rXbyGQvZtdzbmSyBxTU8r7Wn7QP
	sw/U7NzPIzaNt/YqX/zCaJ6y5mEAcdVKa4C1Q2+dWfBu+7WkXAWv0ECgvWk/ChIFaOgLHn3+a2h
	GxzRDJj134JBup/3SVF9/ohP/zAhgNmBdC+Z368TOB/R5Qg4gscdOfvcGeaxxBvcDSRsNJICZQw
	fEdQcvAE8axM6Yo1U8/1T9zYf7gsAvCXuFUn8RVZr7eqPw==
X-Google-Smtp-Source: AGHT+IHLrjPX8uIJEDj5oQlazw0ZvIAp6m9XfLG15y+LyDl9K6XmhE298LlPMgUlZIHAr8kwO+8SDz8hGUv0
X-Received: by 2002:a05:6602:6a47:b0:85b:476e:ede2 with SMTP id ca18e2360f4ac-8649805ea02mr5457739f.13.1745966470122;
        Tue, 29 Apr 2025 15:41:10 -0700 (PDT)
Received: from c7-smtp-2023.dev.purestorage.com ([208.88.159.128])
        by smtp-relay.gmail.com with ESMTPS id ca18e2360f4ac-8648bf34e49sm19972639f.7.2025.04.29.15.41.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 15:41:10 -0700 (PDT)
X-Relaying-Domain: purestorage.com
Received: from dev-ushankar.dev.purestorage.com (dev-ushankar.dev.purestorage.com [10.7.70.36])
	by c7-smtp-2023.dev.purestorage.com (Postfix) with ESMTP id EC0BD3400C9;
	Tue, 29 Apr 2025 16:41:08 -0600 (MDT)
Received: by dev-ushankar.dev.purestorage.com (Postfix, from userid 1557716368)
	id DE629E40ECE; Tue, 29 Apr 2025 16:41:08 -0600 (MDT)
From: Uday Shankar <ushankar@purestorage.com>
Subject: [PATCH v2 0/3] selftests: ublk: more misc fixes
Date: Tue, 29 Apr 2025 16:41:02 -0600
Message-Id: <20250429-ublk_selftests-v2-0-e970b6d9e4f4@purestorage.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAH5VEWgC/3WMQQ6DIBAAv2L2XBoEidpT/9GYBnFVUiuGVdLG8
 Pei9x5nkpkdCL1Fglu2g8dgybo5gbhkYEY9D8hslxgEF4oXomJbO72ehFO/Iq3E6kqKgndSS6E
 gRYvH3n7O4aNJPFpanf+e/5Af9u8q5IwzVdaqL1vOTafvy+bxyPWAV+Pe0MQYf5wyVKCyAAAA
X-Change-ID: 20250428-ublk_selftests-983240d3a325
To: Ming Lei <ming.lei@redhat.com>, Shuah Khan <shuah@kernel.org>
Cc: linux-block@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Uday Shankar <ushankar@purestorage.com>, 
 Caleb Sander Mateos <csander@purestorage.com>
X-Mailer: b4 0.14.2

Fix some more minor issues in ublk selftests.

The first patch is from
https://lore.kernel.org/linux-block/20250423-ublk_selftests-v1-0-7d060e260e76@purestorage.com/
with a modification requested by Jens. The others are new.

Signed-off-by: Uday Shankar <ushankar@purestorage.com>
---
Changes in v2:
- Use a test-specific WERROR flag instead of reusing CONFIG_WERROR from
  the kernel build for deciding whether or not to use -Werror for the
  kublk build. The default behavior is to use -Werror (Ming Lei)
- Link to v1: https://lore.kernel.org/r/20250428-ublk_selftests-v1-0-5795f7b00cda@purestorage.com

---
Uday Shankar (3):
      selftests: ublk: kublk: build with -Werror iff WERROR!=0
      selftests: ublk: make test_generic_06 silent on success
      selftests: ublk: kublk: fix include path

 tools/testing/selftests/ublk/Makefile           | 6 +++++-
 tools/testing/selftests/ublk/kublk.h            | 1 -
 tools/testing/selftests/ublk/test_generic_06.sh | 2 +-
 3 files changed, 6 insertions(+), 3 deletions(-)
---
base-commit: 53ec1abce79c986dc59e59d0c60d00088bcdf32a
change-id: 20250428-ublk_selftests-983240d3a325

Best regards,
-- 
Uday Shankar <ushankar@purestorage.com>

