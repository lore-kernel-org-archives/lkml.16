Received: from mail-pl1-f226.google.com (mail-pl1-f226.google.com [209.85.214.226])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 368F6203716
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 23:10:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.226
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745881845; cv=none; b=LDM1h+WzpTbonuT7YprnFzf/EiEbyiLhk8dTNQgPuc3EPzpFpOkV7/VT90bR/OJ2nRscGvU0ZvFKIYO0Z7cx8Db4+GU/WZi4SBDd0BfYQ3HNA/AIOZUPBnb9HiMAwhAukR6/68ePnB42IH77pqVTXIZDZH5iWUPx37Sik7mgIt0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745881845; c=relaxed/simple;
	bh=5R1ihXWNblpTcigqrOrVvxreW0nOHeJ3fH4HtMTNR2o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FFa2YS25SnJoDxn3H8ivIAi6uGc3f+ohKXbuEFFhrSrkrM3WCizV+P6Nac4AYUXLih4gWSbAaKy/Gb+Jq1LrIu2UN8vbBpYTTnzRsjE8SPfUegrQJ91hBX54N7cIL91XI5OyOT+km8m1MBcL9ubGAIlUKPvKUJw6RbQK53aeocY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com; spf=fail smtp.mailfrom=purestorage.com; dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b=AD1oepuu; arc=none smtp.client-ip=209.85.214.226
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b="AD1oepuu"
Received: by mail-pl1-f226.google.com with SMTP id d9443c01a7336-22d95f0dda4so79679255ad.2
        for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 16:10:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1745881842; x=1746486642; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yN6X8qy6iIXBeRkDCjdD0w88qJ6dcCiPtrqiszUMgAY=;
        b=AD1oepuu0paRzg6wueEwG+FWx0b0H/PPA7MRK5MOvWF+apvUqAxkD0pj40F5oWvqIk
         FgPL4hxJI5cOMfO4a4wcEga+8JC7uWbCksIknxRel7aTj39VA4A+xk5pQGFMHjp52aD2
         4DoMArpUz1+OtD7HEwvHqShjvo5B4T2u/q5FBthbQsrwDVALlzWiHLQ3VFGxe5DbHSFQ
         Bo01dyN/fQViqn34hPG2T/wLsO2BgRJIynTwO84LAIzFyvrLKVjXSimdKgypGsJvCQKN
         gtK8sA1QB2Sw7n2HmIJtO/FphR3xVNrbdT2TuuJFUQbgabzPr6LkCpXVaCnsH5uz+Nsy
         8DQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745881842; x=1746486642;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yN6X8qy6iIXBeRkDCjdD0w88qJ6dcCiPtrqiszUMgAY=;
        b=Q9OY+p8DsUyDohX2Fwc7ph3CDODNajMuImQ9kPW2CM7pPlGWxHQrM4em5yfopMKjGP
         ndLauhPX44slQIU3HuUsBv5FNKalQfEljvX/eM/weDfjJTDiBvTOpPqUF/lrgBak1+R5
         xIrsdXHEAx5bmKx5wI3nMtItHWoJ9TW8/xzIv2YMldNgbofk0hDPpXKbWBJaJtVRPPI7
         gMGAXOoSpk6zJDDrlchOiGBe4y/sqCpjNMdoyuI0eGHUyffVhdpq0zVCZK6Jb7+1Z+MM
         fK6AwQSVxZXGJDQu9Zzt3kQkFyCECjorOTB+TgoveIBJti9mTppnfk9HmUNAWmEo4DEV
         U9Rg==
X-Forwarded-Encrypted: i=1; AJvYcCU8NLVIMb6jvJYuymGczp8BEEjAk46Oaw30Q2Q+UDoSUM9NliuqmBogDEbnrkXhdnd7VaKFzI98M2bJbi4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxH9OL0t7nBmCGz5lg8SnaZVHrzeEsSnFcxjJybEmXWmATpF1kg
	2BoKmP2xHVhZH6T37hwuv1E87EXS4P7hIUKAtLTfXRIWNyw/45kLJ/cpmOTWok41g79tdWwsZyQ
	BXm0UPoCeyGk9DwkuoYlOHH3fCdLQTwfyT+KNn5N33Mq0RtmM
X-Gm-Gg: ASbGncuwMnGKM7zbMckew87JwuvJQxxkgeBkkWRPY3faipvh8fseBk6p3i5cZqZZ6M0
	OvUkr5UYQc3WtJA1JKeeQeqZiC+7YXJjjef5zG8KVAUAczJgjN79zxM8UeMbqM5IGk4cCqbynGm
	jJNqLKF/fyOI68Wz4COFBQ2bPHmc6RNv7mcWc5alKF7xWjg56HedVxiUu3yyoFArGdcH3ijWmqu
	5adfBXbo62uUUn5zl65gaDNkWZ29rS/yP5u0bdmxgZQitEW8B4M9FDn8wQJ8pRRSPG025bvv/0Q
	hMfjfnBh6LL4acVnsIM0CrRbGImrApk=
X-Google-Smtp-Source: AGHT+IGLl7TOqKFNXF5fmwjy9nOE7m0hNA10OLnBEeDkYFZQHcoN4UwcAMLHuXqjIk6lJT7AmRIwF17PnTRk
X-Received: by 2002:a17:903:2284:b0:216:3d72:1712 with SMTP id d9443c01a7336-22de7024ab6mr13691355ad.48.1745881842017;
        Mon, 28 Apr 2025 16:10:42 -0700 (PDT)
Received: from c7-smtp-2023.dev.purestorage.com ([2620:125:9017:12:36:3:5:0])
        by smtp-relay.gmail.com with ESMTPS id d9443c01a7336-22db4de9303sm12508135ad.45.2025.04.28.16.10.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 16:10:42 -0700 (PDT)
X-Relaying-Domain: purestorage.com
Received: from dev-ushankar.dev.purestorage.com (dev-ushankar.dev.purestorage.com [10.7.70.36])
	by c7-smtp-2023.dev.purestorage.com (Postfix) with ESMTP id 4008734065D;
	Mon, 28 Apr 2025 17:10:41 -0600 (MDT)
Received: by dev-ushankar.dev.purestorage.com (Postfix, from userid 1557716368)
	id 35C66E40B9B; Mon, 28 Apr 2025 17:10:41 -0600 (MDT)
From: Uday Shankar <ushankar@purestorage.com>
Date: Mon, 28 Apr 2025 17:10:20 -0600
Subject: [PATCH 1/3] selftests: ublk: kublk: build with -Werror iff
 CONFIG_WERROR=y
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250428-ublk_selftests-v1-1-5795f7b00cda@purestorage.com>
References: <20250428-ublk_selftests-v1-0-5795f7b00cda@purestorage.com>
In-Reply-To: <20250428-ublk_selftests-v1-0-5795f7b00cda@purestorage.com>
To: Ming Lei <ming.lei@redhat.com>, Shuah Khan <shuah@kernel.org>
Cc: linux-block@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Uday Shankar <ushankar@purestorage.com>
X-Mailer: b4 0.14.2

Compiler warnings can catch bugs at compile time. They can also produce
annoying false positives. Due to this duality, the kernel provides
CONFIG_WERROR so that the developer can choose whether or not they want
compiler warnings to fail the build. Use this same config options to
control whether or not warnings in building kublk fail its build.

Signed-off-by: Uday Shankar <ushankar@purestorage.com>
---
 tools/testing/selftests/ublk/Makefile | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/ublk/Makefile b/tools/testing/selftests/ublk/Makefile
index ec4624a283bce2ebeed80509be6573c1b7a3623d..86474cfe8d03b2df3f8c9bc1a5902701a0f72f58 100644
--- a/tools/testing/selftests/ublk/Makefile
+++ b/tools/testing/selftests/ublk/Makefile
@@ -1,6 +1,8 @@
 # SPDX-License-Identifier: GPL-2.0
 
-CFLAGS += -O3 -Wl,-no-as-needed -Wall -I $(top_srcdir)
+CONFIG = $(top_srcdir)/include/config/auto.conf
+WERROR = $(if $(shell grep CONFIG_WERROR=y ${CONFIG}),-Werror,)
+CFLAGS += -O3 -Wl,-no-as-needed -Wall ${WERROR} -I $(top_srcdir)
 LDLIBS += -lpthread -lm -luring
 
 TEST_PROGS := test_generic_01.sh

-- 
2.34.1

