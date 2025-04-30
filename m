Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA6D521B9E7
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 15:32:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746027178; cv=none; b=r+bMFqYsiOxaVr/cCgYiJRLfP5IV+OgBNI8ek9uFrxkV37qpImr2iLA4T5JlUA5lF7jowQhDmMw4Ft5FtSHPzTnfY+l4hNdKgUYMmLkAaqWO7z1CYjKH6MLCCdPgKjQDH5wDNQ/sUVepfUekiT2X1d2/pHg/xiOGSaH+7FZzayE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746027178; c=relaxed/simple;
	bh=/JDey4FU4P0QUZ3U1QjVg4P2FtVicPr9lHY9lypG6dI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=oru7eFjBZVWi8vtNUb6/rDkeUOHpYr6WFCHOgpDFZyG0NsI+xRPxYm/WzbOTv1v8B+1BaazsPF70MA18GFIfT4cg1z3EiYtKsEIYHgGKGNQBETojJAqVMJO6MAc7DcuMNSDDjZrV/kovFE16/4BC8EFdq5m4gUyteLKpeSKGzak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=simulevski.at; spf=pass smtp.mailfrom=simulevski.at; dkim=pass (2048-bit key) header.d=simulevski.at header.i=@simulevski.at header.b=Cyq7OFlq; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=simulevski.at
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=simulevski.at
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=simulevski.at header.i=@simulevski.at header.b="Cyq7OFlq"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-5e61d91a087so21463a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 08:32:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=simulevski.at; s=google; t=1746027175; x=1746631975; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2yW4IzDdMLC+ISL10lrfjeXQ0u1JQS4Zd6C+Vb5vP0E=;
        b=Cyq7OFlq8yzdAPhZaMoB+mLZim1kjxQuWd0YTzb6V5i+td+yhqkAu0F7yGr/keF/0u
         hF9AoBz0Mny9s9YzLsIx5bh0iQKb7qpAQG1LyC3t3GYJhdDj+fd9i3wsssmGz7hS9nbD
         nW4cKLyFWNLMYvuTuaTHi7DM/4bXnwTf29yxYr9HQZJq7vZfLjti4KiJvP8ovYPmrvdG
         i/VoPTWee181TA/ZmlQXyisZ2E2rtT6MuwYso72dweeIAQ6SBD0Oglq3pE5O+sbRiOBl
         FpYPlu+575eU/oAqcS8A6p0DmB26rrpGzsBXToS5KtL1k6/3vpPvg1uiOjJDXU5pHOTj
         1NPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746027175; x=1746631975;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2yW4IzDdMLC+ISL10lrfjeXQ0u1JQS4Zd6C+Vb5vP0E=;
        b=CY8sQkzcaq3gELUVWz2zHn9fAh+OSzgVRcFdMzU7pSp8fiS+HrcMZ0fWu4bVweSchM
         VhJHc9cQel48a6Xtk57FkVwvYLIulsedrlVDh5o452c/IInOSpLyD8WqYktvTVIJyXm1
         K8uv4ksQVzV//UN8LFLCtkaj7ujO795UWqAWtF42n+pxLJ0xYZEIN16rJ1yr/hD6pEg3
         25kEfjHWhxE0qkVAJ5RFZ5bMPNTfrLAqVaQHAXm7IMLZnVCHwLf4NWga7WpO6Nhr9cqj
         hICvkFmlCVQTtCXGV8f5R1RFWeUt9fyfdeB6N9UIUNOBOU5s4HB3ISd7lUq05It2WAuM
         OfoA==
X-Forwarded-Encrypted: i=1; AJvYcCUNFrbQhzFmo7Kw4NovDpyhxADqqypQbYqz26byfD0YFjb0E6QYZfu/SQZFyAFVui4rJ70eb19J32RWMxY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxOv93H7tn3d4QOzsoMb4IYjZhglpWxNYlbvpJO567DVer/WTdb
	2dOP93NsRq2U+X9gXv4N+9LpidEMX0X9eEnlGwnxEPvEkDRf3UovjzfnCc5v8dQtSIg5MAQgknl
	U1BQ=
X-Gm-Gg: ASbGnctz+EuJPnnoN6Tl1OOhz0WqCgGsLO+XzpjJ6nwuArRM7b7PAJGYMLWmZUtW71b
	33FYkrcuFOmJVQ2Ord+oh4ikTqw13LRpa6ECrEunnCUJ4HhQahow5N250AS3nckniiRMg+jvObD
	hna2E4722w6BHjDhqWnsWEiGTVQ9/f+1q0y7sxJ9Du+MOKOBawx4Dv8bV9X7SwMWmZ89i08kUkj
	mMYvAgV6uNGCWdvK8GT4uEIrBrOxivdqqNwgPEi+Mhs2u07ZhDX/VVeuFPoh9l+wIQu1qM64DnL
	Aaa11vwjfWrxkLs+it+eDcl68z+Z8CnXqHPKP5xNs38NPaZ8nGqQJOHq
X-Google-Smtp-Source: AGHT+IEL5/+RsQSF7TYc17i2auHKOvrGNCSMLsnS0CnF7H7Qhjv7jm1RqolFT3S6nwkdOoxrpFsV2Q==
X-Received: by 2002:a05:6402:240a:b0:5f8:e853:1f8 with SMTP id 4fb4d7f45d1cf-5f8e853020bmr1076156a12.17.1746027174936;
        Wed, 30 Apr 2025 08:32:54 -0700 (PDT)
Received: from fedora.home.simulevski.at ([91.65.134.65])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f701106bcbsm8670914a12.10.2025.04.30.08.32.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 08:32:54 -0700 (PDT)
From: Ariel Simulevski <ariel@simulevski.at>
To: andy@kernel.org
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ariel Simulevski <ariel@simulevski.at>,
	Guido Trentalancia <guido2022@trentalancia.com>
Subject: [PATCH] pinctrl: tigerlake: Document supported platforms in Kconfig help
Date: Wed, 30 Apr 2025 17:32:39 +0200
Message-ID: <20250430153239.7137-1-ariel@simulevski.at>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Tiger Lake pinctrl driver is also used by some Alder Lake platforms
that reuse the same GPIO IP blocks.

Update the Kconfig help texts for both drivers to document supported
platforms and clarify when CONFIG_PINCTRL_TIGERLAKE may be required.

Supported platforms:
  - Tiger Lake (all variants)
  - Alder Lake-P

Reported-by: Guido Trentalancia <guido2022@trentalancia.com>
Link: https://bugzilla.kernel.org/show_bug.cgi?id=220056
Signed-off-by: Ariel Simulevski <ariel@simulevski.at>
---
 drivers/pinctrl/intel/Kconfig | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/pinctrl/intel/Kconfig b/drivers/pinctrl/intel/Kconfig
index 248c2e558ff3..f1114828457d 100644
--- a/drivers/pinctrl/intel/Kconfig
+++ b/drivers/pinctrl/intel/Kconfig
@@ -54,6 +54,9 @@ config PINCTRL_ALDERLAKE
 	  This pinctrl driver provides an interface that allows configuring
 	  of Intel Alder Lake PCH pins and using them as GPIOs.
 
+	  Some platforms may reuse GPIO IP blocks from earlier generations
+	  and require CONFIG_PINCTRL_TIGERLAKE instead.
+
 config PINCTRL_BROXTON
 	tristate "Intel Broxton pinctrl and GPIO driver"
 	select PINCTRL_INTEL
@@ -161,5 +164,11 @@ config PINCTRL_TIGERLAKE
 	  This pinctrl driver provides an interface that allows configuring
 	  of Intel Tiger Lake PCH pins and using them as GPIOs.
 
+	  Also used on some Alder Lake platforms that share compatible GPIO IP.
+
+	  Supported platforms:
+	    - Tiger Lake (all variants)
+	    - Alder Lake-P
+
 source "drivers/pinctrl/intel/Kconfig.tng"
 endmenu
-- 
2.49.0

