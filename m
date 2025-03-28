Received: from mail-yw1-f193.google.com (mail-yw1-f193.google.com [209.85.128.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 233EC4A05
	for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 07:38:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743147489; cv=none; b=WaxUDEexbWgNJ42RTQVDnzhTYthg7YK/Tuxjgna5Y6+li4XWjgUKWGxMnHVjb+EVe5GQfq++XLbU6uE0ztTMO4gPwi9eYYFoAr+eY7PqJQOngBvkFLMY4iB525WVHEcsw2WmenRrmKgihjS2KpxInwJ1FR1ATpeV1+TVm0f6mZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743147489; c=relaxed/simple;
	bh=dXErliaRI+EMWEPfbgtH2HXT42GehobJ4fwY5lT6a7M=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=pp7rHEVKCOL5RDcmLlZE02tH/jUOWLdNH1y8/5p9YgcZ0krawXnXuconCLb3GejyoalkvpOMlqCDQDWjks+PdqPrPTqgKZdj1QsgCU5IBvCN8CnVQno5U3jV1xB9W/VXMDEg+7gAMwq7dkA7PJ/3I/CUjXGSRUiU2YSZf4I9KqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TXZkTRSi; arc=none smtp.client-ip=209.85.128.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TXZkTRSi"
Received: by mail-yw1-f193.google.com with SMTP id 00721157ae682-6f7031ea11cso19015167b3.2
        for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 00:38:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743147487; x=1743752287; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Gj26yskeh2tjWK5SXJciubeRsbS53+ypDO00BmmM6/o=;
        b=TXZkTRSi9zH4QK5dCnGAUqlMuzyc8KsXP61khRMso/NGZvfk70gZIhrkIQF+RgIEsB
         llxblqAe0xgaSZ6fDtw3J0dQGgMyxulJZR+0xgdL2btBZM73JAj96W4seEhoq3x8WDm6
         dmhUBk32AIkX6fGtINbymBQS+Ev+O3S0PKku4RP9JyYViF6fXHjWplQRqXUmpNehrTYq
         vqwtBxTxglXq9GkWGISRFeO7alxSetih/GBA9RPJINZPktMOI6i1R5TXbGRwET4qKe3W
         QU/tAfCyrE/pJ4XGYNl3l6yL1yagiu0Njjx49cyBKjR/7YSWftgr9gGuijaD6Du/yoct
         P6Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743147487; x=1743752287;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Gj26yskeh2tjWK5SXJciubeRsbS53+ypDO00BmmM6/o=;
        b=WVtvqBSU051cWl2ImyfmCdIHCVC6Dnw86/gg2AITdco2n4zN/6wUK3jIR1j380k44m
         rzR9yr4L4KpiXJlChiK8Z9+nKN7mWfSTc2D2cKFpX9OA8F54R8NVHIbMKIesY9VvLnOh
         r7bH1vauD5agQbspde5u3ZWw0Al2tPmOZCtyvxSGAXFhxeEcfhUkoYru1wdWqAg0VRXG
         lIWbn/sTUoVNNqO/Uipxn/xh7SqW04BbzBVs5l+cmIuy+fWH54Wt0e2ggv/IJfK99YCk
         9fuY19vVBk8T3C6JZDq+2KXb1Le8TFvH4M5BJveYDY285BspRwwthcfn+MTmPK1JDAL9
         qQAg==
X-Gm-Message-State: AOJu0YwkJvs12JXSqNYdZrq1dI4RZWmeTjAr78ofgBvjoCTz6DuyyGmi
	T6r1ppN3vWPYeaCAw40dC/tzL0iXVr8L4cnZuou12Zp++8YvkSIQ
X-Gm-Gg: ASbGncuqm+IC3ICebg2h2AjS/ovfcj+7el0IIs7jmFyiLmliJYz/XTMAzeJiPCRnDcB
	ZkrJYUD1FW4kNax73CUocKVCdJWHFZcG5FgxLPDqYmlDQC2Z0dyg7U0QN8KWeDnErTopOzHOihY
	SETRTQyAddfcss8GGo+Ob+cHfxP1+Ifi/rUJzgAgPxKhlF1FQ/XMQHgX+851xaVEgzuK1TH8AAu
	2r3SwB6LxGmvLtuXp+fmU32r+b1jD7XlEvNac4rG+mCCB6zIMJIBesbc0SSvjPPIg22Bx00GQ2e
	cHgua/l8uLCYAn1URXw3IxkOdWvcwCcatBYe8spGMS9JKLlofshdMakXt0qxh7He4r5Xd9qrtVT
	5
X-Google-Smtp-Source: AGHT+IF+sLJvXEsN/BMj8PzD7+ryW5HQ6C7Ev1ZbNL2b1gDZdOy97qZSNyrPzq+7J/Tkq+ZXA/H4+A==
X-Received: by 2002:a05:690c:c14:b0:6fd:44a5:5b68 with SMTP id 00721157ae682-702250e9fdcmr88966257b3.35.1743147486674;
        Fri, 28 Mar 2025 00:38:06 -0700 (PDT)
Received: from localhost (66.112.216.249.16clouds.com. [66.112.216.249])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7023a3be5e5sm5152407b3.44.2025.03.28.00.38.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Mar 2025 00:38:05 -0700 (PDT)
From: John Wang <wangzq.jn@gmail.com>
To: wangzhiqiang02@ieisystem.com,
	Josh Poimboeuf <jpoimboe@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH] scripts/faddr2line: Set LANG=C to enforce ASCII output
Date: Fri, 28 Mar 2025 15:38:02 +0800
Message-Id: <20250328073802.3391960-1-wangzq.jn@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Force tools like readelf to use the POSIX/C locale by exporting LANG=C
This ensures ASCII-only output and avoids locale-specific
characters(e.g., UTF-8 symbols or translated strings), which could
break text processing utilities like sed in the script

Signed-off-by: John Wang <wangzq.jn@gmail.com>
---
 scripts/faddr2line | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/scripts/faddr2line b/scripts/faddr2line
index 1fa6beef9f97..1f364fbb0cd8 100755
--- a/scripts/faddr2line
+++ b/scripts/faddr2line
@@ -76,6 +76,10 @@ ADDR2LINE="${UTIL_PREFIX}addr2line${UTIL_SUFFIX}"
 AWK="awk"
 GREP="grep"
 
+# Enforce ASCII-only output from tools like readelf
+# ensuring sed processes strings correctly.
+export LANG=C
+
 command -v ${AWK} >/dev/null 2>&1 || die "${AWK} isn't installed"
 command -v ${READELF} >/dev/null 2>&1 || die "${READELF} isn't installed"
 command -v ${ADDR2LINE} >/dev/null 2>&1 || die "${ADDR2LINE} isn't installed"
-- 
2.34.1

