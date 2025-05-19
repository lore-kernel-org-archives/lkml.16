Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0756122069E;
	Mon, 19 May 2025 22:33:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747694037; cv=none; b=P//gQ9rITrM/IbPjf/948YaB0oVrtlSvFlEhWfZJkAYRsO0UXzIU7Nd1e5DzQ7WVb/NL2o13fuzbSTOWhpkTiBq1umgtIjFFIuZw6+aEtLUul7dlujsRKuyrIyefsM4SkzbmF1M07JcGdVhB6+vTC4ygSMBdmVIHVGz0dJ/cd2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747694037; c=relaxed/simple;
	bh=WfzqJeERjr6pRWJErFYqsjHoy0qW6jTKBvTVI2yMSqA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Qr+k+VGgoSd6oE83WirbUXLdl7bze98Kt5QhNzyiDFWaG2HIcbjrlQXUR7N1n8vrcrLR6ZZXEOo2+MhZbGCdLb+CooPXxeb3X7vBpH/Ho9w2DovxSvPwMrMdLSbq7cI2QXYJZMgzbWK2sfTZVOwySoQK17TqWlIYZFFHaN0gNIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nRqswrU2; arc=none smtp.client-ip=209.85.219.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nRqswrU2"
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-6ecfc2cb1aaso53976136d6.3;
        Mon, 19 May 2025 15:33:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747694035; x=1748298835; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LVAm0MhcUxfqy1/Jj47nVqzJXeFttO6qIrZiquv3thQ=;
        b=nRqswrU2X57g08m29dR7dJZpej40aIcVCNb0AKcDatcZ0vYovlTX/Ajt6l6+LTVRDS
         qlecqhPXZuX1Edkfupx7J3NIyqp3YstarHQtEJTBmv/fol7vxRkU3D98YTunAKkIIGZH
         wFKee7rPu4nHsleQ55CimnomjqUmaIDdHT1OYgmlurp6LHiQLtXq1xb1eNSeJ+ZMsRUL
         In+JrPVsi89PNlKjzxuE6sdQCopVZ3U1mbnICvLW4B+BXl4dTOug+XY8u7KCXaBJQmMh
         LfNaaR/Mv4YLR6j+uyZFofaebo8RTIIAJCGcoDLs0tHT5qX46QO/HRKVAuq87C3MweRm
         dvYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747694035; x=1748298835;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LVAm0MhcUxfqy1/Jj47nVqzJXeFttO6qIrZiquv3thQ=;
        b=r8WYP88+YB6zEN77t+4aISzT1EK+9zy7zCciEDq+6PN6L1w9U9IyuSrcpDBA94nQ7z
         pidrN8XfibA6GdDUxGXFhwJjZTnNzIfgvD2ev7vZfkUO6FFfYa8fMnMbaJeV6WXbAR3N
         yHhdNoUfb4MGFSSL48UMyKhKKzmAVXg5iY0jgzvlK0ylQyC+heDcgpcpBGf89vGrhsLO
         uD2BPfjkMKWvT4yBIr6eH27++oHv2qeFSzfyTABzzQcmFYDWSAfIUCC9gcXeH3IPl8UL
         fCcNm+MhXgrTHMKYosQpTG1z6wT6YlkIrWwbTP9LQWFAAi0koxH3eUZLAe6fTYsMcO6J
         xbCg==
X-Forwarded-Encrypted: i=1; AJvYcCU5lNTC+Q0GlISPOVVsXBNdexcluH7WqSDafl2N1Ov6/Rk8kioMza+VhAgDyNCTQVIW85Ykv/9Ut4g=@vger.kernel.org, AJvYcCXiJDvHcDIVrwvZhvsNp6nFNsnbeU9mnkrXy3p+AjbwtgfcqqTnKtmvC4sfVqyj6iKXbwrdG9meFmyItNzB@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+dyjhSjjHxY8LRVsYA1wso/SA9lKcCHovney9CZ7K8CcERyuZ
	TcRA0nodiJakSrIzaypvNDLMSfWZmNk5flP2BSYlmB4152Hu071KF018
X-Gm-Gg: ASbGncvwpLYd/8RLQRRzVI4eJwXaBbcdnNpmE2ZbdkOLqEEfcWdD1LLM4clLBW/1eYo
	tmSPWNdGyQEXImqgWLPreNVEF+6blIQkPBHvNOU2XaS5xfXlDzFMjR+4GXI192cJvOVGlTfvPgp
	q5Au0hA+sOsLvVtBtGAGIiEXkhfFGPboHTA5QQKcoDyRnSQTgZiOvGkId6HVr9J9+gNwr47QQFp
	QYXXTJv+BSW7tpnrhfEPyr7u5j+Zlkprnv5KCLGsij8tikhruiEXRpiPK03PIupngFzoQ4Hijft
	rawI2XiX92rdbJU7ZK2oOfDiFVzQNeLccre0KwLwlglvnmZTcs5q4jI8jVA=
X-Google-Smtp-Source: AGHT+IEHV6V/9vy/4d8ig5hkz88Eqqp79gFobxGRuxf58uObGKqhfceiqeMRNi1byTKwTMbz4yMfpQ==
X-Received: by 2002:ad4:4ee2:0:b0:6f5:106a:271e with SMTP id 6a1803df08f44-6f8b08edabcmr264699826d6.38.1747694034773;
        Mon, 19 May 2025 15:33:54 -0700 (PDT)
Received: from localhost ([2a03:2880:20ff:7::])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-494b4075860sm56213021cf.23.2025.05.19.15.33.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 15:33:54 -0700 (PDT)
From: Usama Arif <usamaarif642@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	david@redhat.com,
	linux-mm@kvack.org
Cc: hannes@cmpxchg.org,
	shakeel.butt@linux.dev,
	riel@surriel.com,
	ziy@nvidia.com,
	laoar.shao@gmail.com,
	baolin.wang@linux.alibaba.com,
	lorenzo.stoakes@oracle.com,
	Liam.Howlett@oracle.com,
	npache@redhat.com,
	ryan.roberts@arm.com,
	vbabka@suse.cz,
	jannh@google.com,
	Arnd Bergmann <arnd@arndb.de>,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	kernel-team@meta.com,
	Usama Arif <usamaarif642@gmail.com>
Subject: [PATCH v3 7/7] docs: transhuge: document process level THP controls
Date: Mon, 19 May 2025 23:29:59 +0100
Message-ID: <20250519223307.3601786-8-usamaarif642@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250519223307.3601786-1-usamaarif642@gmail.com>
References: <20250519223307.3601786-1-usamaarif642@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This includes the already existing PR_GET/SET_THP_DISABLE policy,
as well as the newly introduced PR_GET/SET_THP_POLICY.

Signed-off-by: Usama Arif <usamaarif642@gmail.com>
---
 Documentation/admin-guide/mm/transhuge.rst | 42 ++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/Documentation/admin-guide/mm/transhuge.rst b/Documentation/admin-guide/mm/transhuge.rst
index dff8d5985f0f..79983c20ae48 100644
--- a/Documentation/admin-guide/mm/transhuge.rst
+++ b/Documentation/admin-guide/mm/transhuge.rst
@@ -218,6 +218,48 @@ to "always" or "madvise"), and it'll be automatically shutdown when
 PMD-sized THP is disabled (when both the per-size anon control and the
 top-level control are "never")
 
+process THP controls
+--------------------
+
+Transparent Hugepage behaviour of a process can be modified/obtained by
+using the prctl system call. The following operations are supported:
+
+PR_SET_THP_DISABLE
+	This will set the MMF_DISABLE_THP process flag which will result
+	in no hugepages being faulted in or collapsed by khugepaged,
+	irrespective of global THP controls.
+
+PR_GET_THP_DISABLE
+	This will return the MMF_DISABLE_THP process flag, which will be
+	set if the process has previously been set with PR_SET_THP_DISABLE.
+
+PR_SET_THP_POLICY
+	This is used to change the behaviour of existing and future VMAs.
+	It has support for the following policies:
+
+	PR_DEFAULT_MADV_HUGEPAGE
+		This will set VM_HUGEPAGE and clear VM_NOHUGEPAGE for the default
+		VMA flags. It will also iterate through every VMA in the process
+		and call hugepage_madvise on it, with MADV_HUGEPAGE policy.
+		This effectively allows setting MADV_HUGEPAGE on the entire process.
+		The policy is inherited during fork+exec.
+
+	PR_DEFAULT_MADV_NOHUGEPAGE
+		This will set VM_NOHUGEPAGE and clear VM_HUGEPAGE for the default
+		VMA flags. It will also iterate through every VMA in the process
+		and call hugepage_madvise on it, with MADV_NOHUGEPAGE policy.
+		This effectively allows setting MADV_NOHUGEPAGE on the entire process.
+		The policy is inherited during fork+exec.
+
+	PR_THP_POLICY_SYSTEM
+		This will reset (clear) both VM_HUGEPAGE and VM_NOHUGEPAGE process
+		for the default flags.
+
+PR_SET_THP_POLICY
+	This will return the current THP policy of the process, i.e.
+	PR_DEFAULT_MADV_HUGEPAGE, PR_DEFAULT_MADV_NOHUGEPAGE or
+	PR_THP_POLICY_SYSTEM.
+
 Khugepaged controls
 -------------------
 
-- 
2.47.1

