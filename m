Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 559D41E0DE6
	for <linux-kernel@vger.kernel.org>; Sun,  9 Feb 2025 18:10:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739124631; cv=none; b=JVcKGmhPXfxjJPZsnew7NlSjJN4YbPSCRTCBicVUMXtadQWMtX26fD2M5QyvbUcjo2kKRMKqGEStC2YA10qY7XPb/omVr5LkNbH9GO/v/HAqtp1SLy+UnQQU+BGxzV8tERpxnrstRUdLzfR+2VwDu9P5izVR3JxYg3mWQ3mHDcU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739124631; c=relaxed/simple;
	bh=vpslfhobZblFtU+rYmVLW2V7VQ13kOSLw1t1jtb+uhw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=psRoUhdl31KeW4Ppng04wsRF0KQqIIIyAomUDtoVN1dR+TlrRABizaWU2Q1T+OEjU/cViqAQ2Uf6BQjfYlTZwIKo/USjkALbeMGvE2AUpxdBA366TyLp8g3u64CD8hKv+1lr6Hxu8UYDUrm7yI6MpErR9Mk2UCDXhOKw1aBij1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OVgQqJl4; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OVgQqJl4"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-21f818a980cso7921385ad.3
        for <linux-kernel@vger.kernel.org>; Sun, 09 Feb 2025 10:10:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739124629; x=1739729429; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=F+77FD8P81ykNRaVPfDUHGz6zZBsaHHaAx8nKnPck4w=;
        b=OVgQqJl4fHYxSsqR3MkWsOOMMfklQhk/8LALW5nJJR04olyUQHKh8dNzzVjVXtKoSw
         HHJG/XqHoboJk482B8eIivBzjMt9aV5mK3GtBxgkYDdnVV+4ArbdvX59yTrXQpBijHFg
         drzMLrL2xAzBCs+/MwY0SS+lHTDixqeVpnazqsIMjtDsQDTcUB956FWAJ/s6J3HvX1VW
         yLasOwehenTaWN93W0Z6o6cOI/3c8ANfc1tJ1A1nGLUe7ycFKTtqOQCmX+4R4/efAe74
         zESSb6QMZgyeAYVKSAX/z+NFIwVF709rbmy0k/Jf1zgBjjlZmdIpgGuyoXC62KmJ5gpW
         pYrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739124629; x=1739729429;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=F+77FD8P81ykNRaVPfDUHGz6zZBsaHHaAx8nKnPck4w=;
        b=XatmeUU715cSV2RRBzREEYAAlczwD2pfSckXDpsQHnJf+LH+v6F//ThZejxlYqGd3T
         M7XoGAx/QDpjBdmSJaLbUUqq9Xef2pCveGkLfAio2CMGbMVRgHgv9GohMQgK6ee2UHd0
         VTs2DR86kzVFCr0uYkHlXu0qeJLJLXXnsWuXXmX+bQp6/2v08IVXOV9HueiHJLxyMh83
         V3+eppFzMROsOpcIp8aK38zCXrSbPSecSkIxzYQ2XKyVpSi0MbsKsT9nouorqlPkEsZ2
         xAE+4kKEWS5qMW6KNyvbLHI9PPNbhKyb3z0Q1PcImKCRx7I1BpNND8vmeHxAXZbnhP4r
         bnfg==
X-Forwarded-Encrypted: i=1; AJvYcCWsocoEy+xpWnVihwPy8VuGtf2xmOOMMVs9mZf88aiHi+zEUM59E0aIay6j88pYU0DjEfD5q9oP0mrTyUs=@vger.kernel.org
X-Gm-Message-State: AOJu0YwqGY3yncqHtslvS8jGXlZGUryerBZjjRRhdC78Xx/16QpWBfJa
	Hjf/6Pe3pNXpJtn6TtdddqRj83WWDS0eEDtadoDJ7fvWxhSd7JREOOE2pQwU
X-Gm-Gg: ASbGncv/nDq4XP/Tr6hueeRYKZcXNenQ0CBiBFl8MWo/p9bUm8PrLt4fnVBS++yLwjl
	s6MobssrIAv8svhQoUBPE0T0WRFNmBN+qON7OF0OOjjq+7K/rIRhb2PPhk964MchUWfCguaw78u
	FBXfg8XWGwjIGqBeBRn9KcG0YHNAzdi6lMRXcLurICi8foTPwW8y4xmOe4ZvhvuSgIAo0pJ5ah/
	VuI9gJUYG331mrgKy4/TB/gcJcVzScWtY7S7VPUwWFQO8AfIoS4FZgsUUZoa0Yb2bm7NdHCyaFZ
	lA1dd5YCnUwtTT/Itf3w7AHxjrNlDlu07QNWCVre9NOQ
X-Google-Smtp-Source: AGHT+IEIT0KWQjEhK/b6AA17ej6HYZtXTzm2w2ROEOXhXdHvOOgZ51En+jjiuB15nkZ1w6s1CaYEkQ==
X-Received: by 2002:a05:6a20:6f09:b0:1ea:ddd1:2fa7 with SMTP id adf61e73a8af0-1ee03b4181amr21427243637.28.1739124629477;
        Sun, 09 Feb 2025 10:10:29 -0800 (PST)
Received: from vaxr-ASUSPRO-D840MB-M840MB.. ([2001:288:7001:2703:7bd6:1a4:1a70:d836])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ad51aeb8d9bsm6074123a12.12.2025.02.09.10.10.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Feb 2025 10:10:28 -0800 (PST)
From: I Hsin Cheng <richard120310@gmail.com>
To: Liam.Howlett@oracle.com
Cc: akpm@linux-foundation.org,
	maple-tree@lists.infradead.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	jserv@ccns.ncku.edu.tw,
	skhan@linuxfoundation.org,
	I Hsin Cheng <richard120310@gmail.com>
Subject: [PATCH] maple_tree: Correct comment for mas_start()
Date: Mon, 10 Feb 2025 02:10:23 +0800
Message-ID: <20250209181023.228856-1-richard120310@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There's no mas->status of "mas_start", what the function is checking is
whether mas->status equals to "ma_start". Correct the comment for the
function.

Signed-off-by: I Hsin Cheng <richard120310@gmail.com>
---
 lib/maple_tree.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/maple_tree.c b/lib/maple_tree.c
index f7153ade1be5..42c65974a56c 100644
--- a/lib/maple_tree.c
+++ b/lib/maple_tree.c
@@ -1353,7 +1353,7 @@ static void mas_node_count(struct ma_state *mas, int count)
  * mas_start() - Sets up maple state for operations.
  * @mas: The maple state.
  *
- * If mas->status == mas_start, then set the min, max and depth to
+ * If mas->status == ma_start, then set the min, max and depth to
  * defaults.
  *
  * Return:
-- 
2.43.0

