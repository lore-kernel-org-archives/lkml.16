Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B21820A5E1
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 16:54:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749833669; cv=none; b=ekOBACHxv1yr/257GXVc9BypMGPBi49vvasIrQmwk9+y1Z/6WKUjiLwrBmeznG7jqrr0jZ6dB6vnouSMfRJYGhI9vQO77m8ncmhp1XyDpndzR0DaFSciFOtqozfqM+lQm6ugCQ6Xa1QFSQjWtiFsQlFaGJZUjUV2o5SsBm254P8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749833669; c=relaxed/simple;
	bh=iZGzCmHYrSZzhnDo4cKANmeZWbqdpurZQTN3/p8RwpE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DoXZMqGQ8ZHtojOk6soOH1XjahaSFVvYEh2/tVYemlTaAb8aP9KmF6w7GmV8qg18brbezc4wj/FnWOzm/x6dQ1qxyJojKLrFHTHlOpuPuKTixUlyY6O3CrEvYzboAzlwTB86sInSRxytwWU5wbzB/Y3mLbSENrasWwQNAkDIDB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wbinvd.org; spf=pass smtp.mailfrom=wbinvd.org; dkim=pass (2048-bit key) header.d=wbinvd.org header.i=@wbinvd.org header.b=J/m6YGuw; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wbinvd.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wbinvd.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wbinvd.org header.i=@wbinvd.org header.b="J/m6YGuw"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2353a2bc210so22457475ad.2
        for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 09:54:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=wbinvd.org; s=wbinvd; t=1749833667; x=1750438467; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7WKF8glCmh5nzU1eT20mMxDjanpqM8jk1hyVO7UuIA8=;
        b=J/m6YGuwdUEBqtUPf7vx0ucpY2OSvU/f3MuclUixJCtz7lyn1QF1NnQ+mOyaf50d4d
         cxYGeSdnVEWAbC99b2M3Ye+TWLdNEsln3Zc3us5I3TRS+JusJ4a6D/fcGbvpSgoeUnro
         qdcDvGpGh/I0wEf9+5v0spWosCXWsw/cyO61MjP3q2CjvBBLGauh4fdeZB2mFYMuV2pC
         oey9fj9UtJjO4qRXl9WXbS7l11PwT/TTjxfpy0de8upyCif0AXvlqjPHOJELVcK8gNvx
         6GGT4fMASDRUUikCTMDYXeZA+gB9dbDCnaRxIo1oKuVJioQd0fo+f9iXYKkj6kE/fb2M
         tlZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749833667; x=1750438467;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7WKF8glCmh5nzU1eT20mMxDjanpqM8jk1hyVO7UuIA8=;
        b=KNThKcPX5/1xwguw7zSKJUgxuis5tERC44JIj3FmJ1FVyMsjo62d6TIPd6OTSzQgKr
         U3ythXgS85IiHiIu4GTL01Ni7Yytre6MVWK3GEqqj/8vzutqDFY9G+FrHoKZF6RzbMkF
         3LmG+eEM92cv8U+EgRftTHb+nT97PU+mF5/C0RMDhgLtl4YMY1gU2qeX3Y8nxiVCUKBn
         pWqKxFZSa9wmlSF79/tzhAvHlQxqdpTN+wkDH3eev0bSEVyzx4zkdGcxgbjQITCue5TW
         Owtfrw1NiFyrJmLSHeZiEgxLAPVtVK6s+DCs0pFH2FUJs1fEGMqG3rmmKoabgoGHwyw+
         mJHg==
X-Gm-Message-State: AOJu0Ywws1a1qymKygMQwGjDx7lycuJwOivNkkK+8kdnFkAD77J/wo6r
	TnvGR4/NV4+BOdaRLQIAI2oM2HntwvrbfNZOZ+MVMXyvnL3GlgoBBzBour+v96vES3UFfVyaif0
	1ruZC
X-Gm-Gg: ASbGnct58V+QpmV9fmYLFt44iKW3zdjCyfkonOz8uElj39ujCWpwOUhdTuFOs04cTS7
	IEScm/U4Av0mf42eayZXXq6Xe/Or+PQq+gEyJzJ1zkF1W2v5fNZI8QMQe+KdFUB9lRkIrVq1T8z
	ZEaLdXD2rPp/tTajzd1cuRKHR6y0DyNudE+8nQprllT1HqOpd4Lkx7zztT5iz9dw2HyhiPjfzuB
	ylEswm54gjb2oMlcAh38vbkCLRGRs2aoeQzdwyhCPzuoOnpuf2xzQi0I6zCGpjEfpvxztqOYqTp
	uulOEDmTrNeV+Ioop/XLEQ7guDBOVqW7LgoJGhhQdg+rG4Z3hOv0iQU50m3F3VG7J2Kx2eZ/Vki
	7OB6BEwNfT86exvf/vbiLcFBJDuPc+AgURYRrzKXGCA==
X-Google-Smtp-Source: AGHT+IFRM7HlvEUor2jbTS1VnT+o6aaNJW/BhmRTrRrnp52YltaanLYbOkxjDiCArSzSD2Li0Nby5Q==
X-Received: by 2002:a17:902:e881:b0:234:bca7:2926 with SMTP id d9443c01a7336-2366b3c5a98mr2626835ad.27.1749833667526;
        Fri, 13 Jun 2025 09:54:27 -0700 (PDT)
Received: from mozart.vkv.me (192-184-162-253.fiber.dynamic.sonic.net. [192.184.162.253])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b2fe163a498sm1684088a12.15.2025.06.13.09.54.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jun 2025 09:54:27 -0700 (PDT)
From: Calvin Owens <calvin@wbinvd.org>
To: linux-kernel@vger.kernel.org
Cc: linux-pm@vger.kernel.org,
	Len Brown <lenb@kernel.org>
Subject: [PATCH] tools/power turbostat: Fix build with musl
Date: Fri, 13 Jun 2025 09:54:23 -0700
Message-ID: <7edd4c688111a697cfe913c73d074738b3d1dffb.1749833196.git.calvin@wbinvd.org>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

    turbostat.c: In function 'parse_int_file':
    turbostat.c:5567:19: error: 'PATH_MAX' undeclared (first use in this function)
     5567 |         char path[PATH_MAX];
          |                   ^~~~~~~~

    turbostat.c: In function 'probe_graphics':
    turbostat.c:6787:19: error: 'PATH_MAX' undeclared (first use in this function)
     6787 |         char path[PATH_MAX];
          |                   ^~~~~~~~

Signed-off-by: Calvin Owens <calvin@wbinvd.org>
---
 tools/power/x86/turbostat/turbostat.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tools/power/x86/turbostat/turbostat.c b/tools/power/x86/turbostat/turbostat.c
index 0170d3cc6819..925556b90770 100644
--- a/tools/power/x86/turbostat/turbostat.c
+++ b/tools/power/x86/turbostat/turbostat.c
@@ -67,6 +67,7 @@
 #include <stdbool.h>
 #include <assert.h>
 #include <linux/kernel.h>
+#include <limits.h>
 
 #define UNUSED(x) (void)(x)
 
-- 
2.47.2

