Received: from mail-pl1-f227.google.com (mail-pl1-f227.google.com [209.85.214.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85A93239562
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 21:29:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.227
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745443748; cv=none; b=RaYnji8M86zcCt+jN1OcNjsVQ7Mz9cWGprczDI4K51EOQ1Y1TeWf5Zhy/TWohEagB6utqm7GCclwuxV88NzQlafbwWs61fXmdrWnSCYIH72qyfnSeKDuXADkfN1LWlJqofSBRwN8KsvTjZbVwLMsFIpYIOtzTtbEh3ZnQzGeDA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745443748; c=relaxed/simple;
	bh=D9ftuTBIipMMMb+INoV/N9oBXuVjGGG57prHPs3PuGM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YV07x5M3L232P4UpHj9ebdMYV3ZWRlj2EjquR5Ov+h9cWVjRI206CeB/5VY7YmF+f+SqDSUa7FPFW/cBIvms/v+qnkktJUmGRGIUi07eG7c6rHjZHVlXTtA1wlcLRFD5B+Ie+ot6+7NY8YdPhp1TpNOYramUGsHozxDou6nLjLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com; spf=fail smtp.mailfrom=purestorage.com; dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b=fR++VZPQ; arc=none smtp.client-ip=209.85.214.227
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b="fR++VZPQ"
Received: by mail-pl1-f227.google.com with SMTP id d9443c01a7336-2240b4de12bso4390595ad.2
        for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 14:29:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1745443745; x=1746048545; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6FfkdId7QoskoICSJ3Xv6KLiuYz8Ht/aFE5W2Si3esE=;
        b=fR++VZPQK2WtODPxiZttcKwzUqpd92FEr/+qEtOTiKZkS6E37yiQMW0q7glp+0nHAF
         NcwA8GlP9r6Zr9YY2yDqRLGHV2TownrkvlRVn1+vGqeteT73s+V0jWZPCz0/tSz9O4wv
         myMYUSkMuE0jnH66Fzn/KVYEa6u5+e0a44rOAiB1P+0ZF02al48O6fv9+FDTHV9qaEMe
         Gi5rQars3hPUd54q/massO9V78dN+26ZRYcwb49p3scAacK8FFcAhHHahhdbi3MrRcZM
         J8ldIFvyxvR9K8G0bd80SqXzXdf6udzKgMUcdtjvxLsjxSpLC916njdiEdS5BX8MIsdW
         JDeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745443745; x=1746048545;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6FfkdId7QoskoICSJ3Xv6KLiuYz8Ht/aFE5W2Si3esE=;
        b=Cfd9pjAxJac+s23VURzBowdQnQ9X/Xv95eoP2QPwfLWVLtwZdVs+gqwEMdImUGnGZg
         67mR4x55xj1o8I9kFTtQFHDvSWs8lirvlNUOXmtysEr1fQqvvCzpp/I6Qp/hYbTdI0ZA
         1BbFa2ZadnLAIK8IuC1r6FgrhHAb/8306Upe8ZTQyaMqklB7NJnzorFpxhgpTjBvOtav
         PMwIBRKBu8xQQ9332r16E5D9kTQ9n9xdE1Ftb3CLQm9yF3LomoE5zs7ZjoiKBZH97zeN
         WF4EC3HWxChd66kKVpEAaFPc1gLfx9iuBC5fwQ/mlYgacShiE34QMyZGfb2ZUZAjr8Lf
         +JUQ==
X-Forwarded-Encrypted: i=1; AJvYcCUG+qdoN+Ce3hy5S4I5Ke+q/ISWOlGIyLr5Xd6Qt6Ga+u6v337PYBtOAdXhBp6Kx8yLZKZTBNcYj/K9evM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwBGUYsexiOFY7+1jQ5NBBwTm1eilrCMaQKVBROriMV2eN+ahU1
	kK3uWNAWLgI0WQdbv8kh6I+xNEMkhipuXYhjm2lD+gUAdv3cJVwPw/X72Sde9K6r9EPUYCGQe8p
	IbIC8f5udsl6d2iFVuaOIVncBHuTNU3volX06cLGYSAmdA1Ne
X-Gm-Gg: ASbGncvxSk12dWa+jSjYiW93j7t7JnO9RXxwNxTN3XPpC2usGfHDcABTkB6ku2XWRgf
	yX1lKTExb0oulu135i38f1HXES/iKJHsM0ja1eM47WQwbeIMK2lvM3PtkNMm/tbN/JjUN3z8Vkl
	/O8sZHp1RCE+E+5VH8Y0KJLNQ5lv9ExG3/ICke1Y8w1evOe/rJ8lDMDfzBFAc9LvIVhQLtSg0ib
	SvCz0FLgWxcJ2hA7wlJLPACFUl8RkX/CM41hTQnRbuQi7lxZRheSzGdXWMboM9vKdon48NDEAlC
	uHEjLXGb8bTCETmuQ4VeECXEh+geJ7I=
X-Google-Smtp-Source: AGHT+IGAMoZZFngPD9ZZ3v3uIDuQwCl93Fgjflm9tE0fW/Q3qQPIK/rfA5ej5yiEulIgWPS4pv9hVx43DNB+
X-Received: by 2002:a17:902:da8a:b0:224:191d:8a79 with SMTP id d9443c01a7336-22db3c0bf2amr834295ad.27.1745443744799;
        Wed, 23 Apr 2025 14:29:04 -0700 (PDT)
Received: from c7-smtp-2023.dev.purestorage.com ([2620:125:9017:12:36:3:5:0])
        by smtp-relay.gmail.com with ESMTPS id d9443c01a7336-22c50d88a78sm6232705ad.100.2025.04.23.14.29.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 14:29:04 -0700 (PDT)
X-Relaying-Domain: purestorage.com
Received: from dev-ushankar.dev.purestorage.com (dev-ushankar.dev.purestorage.com [10.7.70.36])
	by c7-smtp-2023.dev.purestorage.com (Postfix) with ESMTP id F22C134058D;
	Wed, 23 Apr 2025 15:29:03 -0600 (MDT)
Received: by dev-ushankar.dev.purestorage.com (Postfix, from userid 1557716368)
	id E5B66E4031E; Wed, 23 Apr 2025 15:29:03 -0600 (MDT)
From: Uday Shankar <ushankar@purestorage.com>
Date: Wed, 23 Apr 2025 15:29:02 -0600
Subject: [PATCH 1/2] selftests: ublk: kublk: build with -Werror
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250423-ublk_selftests-v1-1-7d060e260e76@purestorage.com>
References: <20250423-ublk_selftests-v1-0-7d060e260e76@purestorage.com>
In-Reply-To: <20250423-ublk_selftests-v1-0-7d060e260e76@purestorage.com>
To: Ming Lei <ming.lei@redhat.com>, Shuah Khan <shuah@kernel.org>
Cc: linux-block@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Uday Shankar <ushankar@purestorage.com>
X-Mailer: b4 0.14.2

Heeding compiler warnings is generally a good idea, and is easy to do
for kublk since there is not much source code. Turn warnings into errors
so that anyone making changes is forced to heed them.

Signed-off-by: Uday Shankar <ushankar@purestorage.com>
---
 tools/testing/selftests/ublk/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/ublk/Makefile b/tools/testing/selftests/ublk/Makefile
index ec4624a283bce2ebeed80509be6573c1b7a3623d..57e580253a68bc497b4292d07ab94d21f4feafdd 100644
--- a/tools/testing/selftests/ublk/Makefile
+++ b/tools/testing/selftests/ublk/Makefile
@@ -1,6 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0
 
-CFLAGS += -O3 -Wl,-no-as-needed -Wall -I $(top_srcdir)
+CFLAGS += -O3 -Wl,-no-as-needed -Wall -Werror -I $(top_srcdir)
 LDLIBS += -lpthread -lm -luring
 
 TEST_PROGS := test_generic_01.sh

-- 
2.34.1

