Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E1DC1E5B90
	for <linux-kernel@vger.kernel.org>; Sat, 12 Apr 2025 15:01:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.122
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744470100; cv=none; b=vBYJRnLftJY9y+xDmM7LYHgmwdtg8jIqPSQgmzK9tc3/KTm9AvZkgcsXhZ/nyLnju5wZpt58mYpMXLYu7Svblul5htEBc2o0ps7I9AN9VQArIG0cI2K2jL9fOrT9YvhLqqYvAg2x4Ps7ujl0H5RWJGW7L62mhRzCQk4fPX0AO+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744470100; c=relaxed/simple;
	bh=QCQcBB5VFK0IPcWPaNZuPc349e+QqUYMSWvQeVjbWj0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=L8HphswQ+FqguRDCzObdtxf7R5yHY3AiCbBqs5Py3ZF7dkq9NQy1PP9cosFiwSaaXtjf5G3/cNuRDjwsx0NBgei1xX9buZ8Xm4jPsCwDAVc8vM7VJiWoVY1nKTWX4B/QLavGx44zfSdxVk+jMLV0VBdzB7ULiv0Bm7G2H1xzSpY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=hYsvtDBL; arc=none smtp.client-ip=185.125.188.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="hYsvtDBL"
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 098683FB7F
	for <linux-kernel@vger.kernel.org>; Sat, 12 Apr 2025 15:01:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1744470090;
	bh=rJslOADLoGpOIdP2afwJiiNrZskae/nRuT1W9FEresM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version;
	b=hYsvtDBLVg7V5HQVwNZjxn30ZD5RgQAdjXvatHJqae7lahXiVAJQfLz7piBLnIoTH
	 ggWCcFyItdvE1C4/quiDhT0frJv/FoKcLbvdVHNKlhLwFow+JJ4cYzw2nHg0Qt2lNT
	 6NHgv+HLIIby9QRLSI8nXgEW5RM1bvjsRpu7cFwVoazOWruNY0QjIFp/m8Xz8D4iZq
	 z2UYcHw5gB/0Q62971tSmwqiAsc1fRjHsDVE7mqrdgKVrF5L4L84XNvPnY5HCrU8kJ
	 BJmpnMnFt975LyXaxNyp8oK7monyoS+/5pRgJknANe1HAvLCespYhFx2CeZB1dlBSl
	 OSm/ZROlNuDhQ==
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-73009f59215so3387898b3a.1
        for <linux-kernel@vger.kernel.org>; Sat, 12 Apr 2025 08:01:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744470088; x=1745074888;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rJslOADLoGpOIdP2afwJiiNrZskae/nRuT1W9FEresM=;
        b=OuYPr4ngLtwgJFpqGG0aqT8BHZfQhXA5whD+9PJ/j3fftHSgofkb2n3pbV2rT/IECA
         qJbsCs/RloG9AaiydEGN7l4pGHjCZQn8rO8XbUgBf70LdUVqTu9kQV0fEvRC5ytzbkRi
         6luokmYvrSm9F9P8VLfqHtGXmoTmzBaNaJlwf++pd1SO6nBIRU+ggYkcvh6J8rXyZjyH
         aZ4uwsvaE7YAYbNrmDxGuk/DCFoaQpHIGazxgVBQIn5VCj4cUO+gpchXxv2UvwYR7JrM
         pmcyhsp/tLZPvna35BrYH4KNHoC2QINm3vp9K2d3EvGiUxo4jfU2WAAMEgWia1EZYkpw
         BQwQ==
X-Forwarded-Encrypted: i=1; AJvYcCUc+EDWCY4FVr7li321q7YS7bOcZ1WnookXhyWTczcDT9F9diilkYOiPmMX14viLEZwpb7fR8FmlV6V/Nw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwuRHHC20z767CjvVE4Z7YmOJlf+3om8fycWtzWUyyx4UH9QnWy
	CFgsCoaf6hm5GswtOcRMjDwMcov4CVkBFEyUFJ/qaM4elDzk1wP1WoItksC3yWCYVm8+9+PxOmH
	0Fx8zTzbZ8qQsdHfA0hKcSsnnidgvAbJ8/lJMwR4+kC8/bCs2z52JwijcUUk672XSr4i94RlEq1
	mgGg8QAuZKFg==
X-Gm-Gg: ASbGncu14e8p3f29DxPmaIoF0E3HY3s2BuhFn8zR6h5vzISonzIcCl0zSB4ZR5Pp7rq
	WaCzGn0sWnMiWPntfDomcwj3k6p/O3rM4tkl2nzDyuHUpPCNjxiy+iQaij31RmyOx6wcvgpi1vq
	hmtY1oufr1xTmrp3E4TryBqH/Xmo+h7fdNVkp1WlDAvZL7cdN/V2lHh5b6wjQU9+ktqsYSuRXkm
	/hAsScyBUO5zDgYA+KFPTMLHdTeCLv/Zlsj0UToDONoh3B9zjLPJhPJYmtqlFRBl39+GBUsz7Rg
	ErdDqmzcnZM=
X-Received: by 2002:a05:6a00:4644:b0:730:95a6:375f with SMTP id d2e1a72fcca58-73bd1199eaamr9676997b3a.3.1744470088080;
        Sat, 12 Apr 2025 08:01:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE8blR76lPWX5wm2vatH+K50azpOgn9gNFUMnrfRLcqy5g0JgIh6KXPB9NMmoGFETTpuJYHgw==
X-Received: by 2002:a05:6a00:4644:b0:730:95a6:375f with SMTP id d2e1a72fcca58-73bd1199eaamr9676936b3a.3.1744470087385;
        Sat, 12 Apr 2025 08:01:27 -0700 (PDT)
Received: from z790sl.. ([240f:74:7be:1:3a1:1528:8601:c20c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73bd21c62c3sm3612168b3a.52.2025.04.12.08.01.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Apr 2025 08:01:27 -0700 (PDT)
From: Koichiro Den <koichiro.den@canonical.com>
To: linux-gpio@vger.kernel.org
Cc: brgl@bgdev.pl,
	geert+renesas@glider.be,
	linus.walleij@linaro.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] selftests: gpio: gpio-aggregator: add a test case for _sysfs prefix reservation
Date: Sun, 13 Apr 2025 00:01:19 +0900
Message-ID: <20250412150119.1461023-1-koichiro.den@canonical.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The kernel doc for gpio-aggregator configfs interface, which was recently
added, states that users should not be able to create an aggregator with a
name prefixed by "_sysfs" via configfs. However, it was found that this
guard does not function as expected (thanks to Dan Carpenter for
identifying and fixing the issue).

Add a test case to verify the guard.

Signed-off-by: Koichiro Den <koichiro.den@canonical.com>
---
 tools/testing/selftests/gpio/gpio-aggregator.sh | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tools/testing/selftests/gpio/gpio-aggregator.sh b/tools/testing/selftests/gpio/gpio-aggregator.sh
index f1bab62c4cd2..9b6f80ad9f8a 100755
--- a/tools/testing/selftests/gpio/gpio-aggregator.sh
+++ b/tools/testing/selftests/gpio/gpio-aggregator.sh
@@ -335,6 +335,10 @@ test "$(cat "$CONFIGFS_AGG_DIR/agg0/live")" = 0 || \
 agg_remove_line   agg0 line0
 agg_remove_chip   agg0
 
+echo "1.1.6. Can't instantiate a chip with _sysfs prefix"
+mkdir "$CONFIGFS_AGG_DIR/_sysfs" 2> /dev/null && fail "chip _sysfs unexpectedly created"
+mkdir "$CONFIGFS_AGG_DIR/_sysfs.foo" 2> /dev/null && fail "chip _sysfs.foo unexpectedly created"
+
 echo "1.2. Creation/deletion via sysfs"
 
 echo "1.2.1. Minimum creation/deletion"
-- 
2.45.2

