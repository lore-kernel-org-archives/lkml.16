Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37F64219E8
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 08:14:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750234444; cv=none; b=bsryMMiBZFXy7VzAkwWXCRwUK6YAyGrqE1iqZOvMUYNJPGNVd2xEwTWekXI3tU4e/4VRMG7mRQahcko8Z5rMELbH0f+1WivlvJAgNfRA6htd3b8RUdZdEa6LPRBnsih/CAxajYEZUtUW8irBXetM006qincwMrk4UvElSmKEbnQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750234444; c=relaxed/simple;
	bh=mtsVSt0IzdX5tLQJXmCaa6Z5jtb0ezGaOSsG0EvOrhc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TTOJzGEYxIT72MG8wjrz6tNcSXMRraHRmObR4Q+OdZTxb5/sHsMllNemWYPgh1DP3A9CqSrP1BaRRBX0BqJe2kvXkjZ60ysTclBgNIblgLnuDmwsqfyWJFXzqt+UE9anVIpWGU7jbfI7F95T6ECHCglyX5WhxN/SdNesEtXFrrA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EYld6EDb; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EYld6EDb"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-606b58241c9so11275961a12.3
        for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 01:14:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750234441; x=1750839241; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6pb+HWu2OCHXrKShSkh3Mma2i4SjUsrFyP5rDVgtJMA=;
        b=EYld6EDbRh8hzcnX1ecz6Axd+fjSydQDVnOo0cHEi0j4r+OHt+Tc4ZaMusRfERmA4m
         R5nogQ4didHlVSaoHBiZX49kwHuTDMp73ensM1nWca1Eo/MEzUq3DPpGV7fwUrbyE4r0
         IE0srSUwWn9fK6eGthv84KFRV8lXemr0zzuS9WRz+iNR5eJ5WZe58V0loFnGcImdkb/1
         ubNIWGujuIlBQm5Q6PHxyzxWeKqT7owZGne50WkEf6afnM9qaKhgprAgXqxwYhtw91sS
         mBUZ32ftA91vDo3wAebj1RMVnIT4FaF8aa6DCmeP5CyypwKZZtue+EHRZIPnMHvWspUc
         qwGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750234441; x=1750839241;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6pb+HWu2OCHXrKShSkh3Mma2i4SjUsrFyP5rDVgtJMA=;
        b=M7LsPKrezDWEjCISVO2/WcnF/nDRtIv13lvljvJIsXq9tG2XjpBENY6aXLGQ0wK4A3
         8hI31dZpjvlJGwaODxL5zrdELYg5Eq4lZTK8gdN38y1Z3ao1kkdVUfcwJkpUmTZX8+go
         jXjh6v0S5EtWf9Ro1PxSd/pTjgojuwe/ae9k1ykXHhdedUkBEmO1bsymL0iigjkPbCgs
         xhbO7VZrpJ9KMCWRVKAy96IFkrfPpNEjOijOpyatQh/zjJ+DtV2UDiKFMH1Yl5qt+VTF
         K1J6BuTC7DN+c5xhsPMaU1wNtUoVt05xrHkCINVR8yCkP9U0JcJ+biH8cH0TvFBkrDi/
         LZVA==
X-Gm-Message-State: AOJu0YwaFnYccxQXTAXV6ZLIdD25+/y9SDx3WNalnqlrC0v/WfU3lXwe
	d7KnrLkMpmXtsEjw0Er+5pVp3Tba/hupcPRoGRoC7d4KGtrG38l4+BVy
X-Gm-Gg: ASbGncvT65rYrYsu/2P+BZchXVyZUd7GU9FL4g8Kgh9/wp/zM6Kt6vRqKTf/BuxDTMW
	kJicEF1E9A+aT7ldStJ7yVTFEDfx02LsqALCU6ojOKB89oEUUEFNr02tRjbLL3dn6NvozLerkNL
	VLA1dZFOhVo+3sLwgcnvLnj1dDVnUdIRytcMr2ule7jHclTafizMSqe3RBVbLCrIEU8NR/oWGMV
	6yoR8oU+/1oJPKk73UyqlrRFOz5sMxnLXM8PMV+8RZYJZ2c5AkuCaya5U79IU3DLSZ3HuUB87s3
	kVRAhM4dTdm0I8RCgcd8scU2XaK9k73QfT2NnaJbFCd1KQo+dUsGY6rivZvaWUsEBmOCF/mGDYi
	q
X-Google-Smtp-Source: AGHT+IEq/zc2AYk2AVF/I2Co8G9J+xprJofIWZ5/DX9uDcca5x3+/uQeUufvMbmWl2oTi5WZpPg7QA==
X-Received: by 2002:a17:906:c145:b0:ade:3bec:ea30 with SMTP id a640c23a62f3a-adfad29cf6emr1668689066b.1.1750234441195;
        Wed, 18 Jun 2025 01:14:01 -0700 (PDT)
Received: from localhost.localdomain ([41.79.198.22])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-adec8156ed7sm1013823766b.37.2025.06.18.01.14.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 01:14:00 -0700 (PDT)
From: Khalid Ali <khaliidcaliy@gmail.com>
X-Google-Original-From: Khalid Ali <khaliidcaliy@gmail.com
To: tglx@linutronix.de,
	peterz@infradead.org,
	luto@kernel.org
Cc: linux-kernel@vger.kernel.org,
	Khalid Ali <khaliidcaliy@gmail.com>
Subject: [PATCH v2] entry: Update outdated comment in entry_common.h
Date: Wed, 18 Jun 2025 08:12:46 +0000
Message-ID: <20250618081305.1060-1-khaliidcaliy@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Khalid Ali <khaliidcaliy@gmail.com>

The comment above syscall_enter_from_user_mode() refers to
syscall_enter_from_user_mode_prepare(), which is no longer used. This can
mislead readers trying to follow the entry path.

Update the comment to reflect the current implementation by replacing
syscall_enter_from_user_mode_prepare() with enter_from_user_mode().

Signed-off-by: Khalid Ali <khaliidcaliy@gmail.com>
---
 include/linux/entry-common.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/entry-common.h b/include/linux/entry-common.h
index dad1f257e3dd..49f5d99b254c 100644
--- a/include/linux/entry-common.h
+++ b/include/linux/entry-common.h
@@ -146,7 +146,7 @@ long syscall_trace_enter(struct pt_regs *regs, long syscall,
  * @syscall:	The syscall number
  *
  * Invoked from architecture specific syscall entry code with interrupts
- * enabled after invoking syscall_enter_from_user_mode_prepare() and extra
+ * enabled after invoking enter_from_user_mode() and extra
  * architecture specific work.
  *
  * Returns: The original or a modified syscall number
-- 
2.49.0

