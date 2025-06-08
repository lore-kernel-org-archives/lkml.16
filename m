Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10AA4288DB;
	Sun,  8 Jun 2025 03:13:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749352407; cv=none; b=rAO6lj0OivVhzprEL3njQpx/Jvm2FrDQ9fDzHa5jr9vmWtFqu8C6Qe42XfwJzNQeIc5To3uo36PwykoGLJwwVT/WuEBPMFxiKubE6M2tsjCemsp95nA8Q1m5WrqC/3EkVkUYvWyeNYOAVdnGk1HUcHsU8Dki4Dd9IPWZJzfVoQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749352407; c=relaxed/simple;
	bh=TYODdiyfCp+6cwSvjbND8/BzIwt2BDLVJtYvRCTu2cI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=IM0CSJUWKWO3JjYP8Y7lsfVeORjE1hFqjVOvJTyy3Fv/iedTm9IFExh2tiFwcQoWTCNr80nZou2qdfpEb36eqjhfZQ2x1CiTgEMneDLO19WJY0XAPj5f1fFptD3ppbUGpgTGMTZREBh/CdgUa/wXaQtZvTzMXdLQE6BbDQe2rVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Cr0gN26p; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Cr0gN26p"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-745fe311741so3779832b3a.0;
        Sat, 07 Jun 2025 20:13:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749352405; x=1749957205; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SGETrZrDebTF2hD+QL2EvJvcBiHfC9APuPQ/9bx0IBc=;
        b=Cr0gN26p8PLf6NXtFzdtG/IlvXIBL08/jdVw19PkkqxGQ0q6xgJJZpjXfx1eeGFJrs
         i8MAyfbDsKR/tvzoQ9kuAhTwiVIIkgdCclo3ed3+E3TnBzpqLhhzVICL9XBs98qANpwE
         VYanpcUtGAI1jwjMJM2dabFHibPuf3qOK7yYAXLlqu8f1kSirTTntCJcOY3ZpzBdPJB/
         /a4VBQOFrPQYFc+EVeApxyHwUld0H0h9SzDYSthBLCEKlGqLikENCIfMrAQ943G6R17Y
         z5oNp0BbU/IdC53ZiVU9Y3621QK9nxBpXg0b2bn22+cxTBdZjOq55JMP8HQgQ1xao7iw
         mflw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749352405; x=1749957205;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SGETrZrDebTF2hD+QL2EvJvcBiHfC9APuPQ/9bx0IBc=;
        b=caWtOlq2WZKwRq0ffN5njVFk9SUiSnVCT5XLeo5lFznrDnezRWhzX4uPO20i7i8F0i
         jaOrpRNivqexqkN6uok7+b6sUt7drQGYS/Om+eJ2w3wgkMj6V1t9qDFdysEVH7pW+OK5
         nl9pFreSJWxA2CGjyRzzbnHcQACXSxvbx/M9dK9FbRh3+PeVIXjWjCG82KxyB+haaGVY
         p3SeZ8aqX+ga7VoYS/wHvNjSZN0wnqfvHjELWYao1VXJAqM5sLqY5S1TI/Rxh+YXtFWD
         Kof0yWj+2a6JwBcEkOUhb3BqGVMbIYGxs8fyRI0oGb5DBd/5diHfQfm9D75fsawmMU+4
         B1qg==
X-Forwarded-Encrypted: i=1; AJvYcCUhSgvuAFQvBP/X38ted5166YaDHVaszWwbuziZ8O/UE8oOqPnfnrGEJGkq5k5pmmLf/HQ7V72swek=@vger.kernel.org, AJvYcCXO+MmvTamJWVxWb5X2sQHxeiVM6QwyCqySh2EZGGwG9ixoZjaJfUJNIhLOIxpVe4D+xLqHe/q68fM9RsQg@vger.kernel.org
X-Gm-Message-State: AOJu0YxxDbFS9SrjTPEv2okZQfPAwuoC2Y04hdfz4348c+L6q2ydxgSd
	68/pjxJducP8/g0TSAqM8IlB0XmPOpYUFS7P4Epm7cwvaf1b6JwnC7Lk
X-Gm-Gg: ASbGncvQfjO1DOsg7iqY2Sj8S4jEL+bUTZEmX722BRIW/lNzLoWsf2NeXMdoJllPSFq
	CO3bIRTgzRWDu1QAFW2pvsjV9got2XjjIekBSi2YamhiLwJkBUIoJDNQV77gmyLTWLb7qQD6FFr
	vLArZhIqjBAZxHvuP7Bc9u2QwYJBiCegz/MYvQc/nJJc9fDvDqhK2ECWFVzg42NvktuuHCcPqJ6
	ld7A53DDA441zpVy4XTGcOOuw2nBr7zzw4ZvwZRrZgs09EMOHJbySmFWlncYE8nBXdI55K3npXg
	MfRIoOgpTysaUbvtSrkK6UEYWqNKe8zQdRE4Bzt54JNpBnjGgizb1yM=
X-Google-Smtp-Source: AGHT+IGp0x0juNmnx0pFx7PTOsaXi+i69oNKENxJ5yfyaUK9qiXBA/NZpGUco1ywMOmgTcIu4qwpZg==
X-Received: by 2002:a05:6a00:c8f:b0:736:6043:69f9 with SMTP id d2e1a72fcca58-74827f14a8bmr13418387b3a.19.1749352405188;
        Sat, 07 Jun 2025 20:13:25 -0700 (PDT)
Received: from fedora.. ([2601:646:8081:3770::f55])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7482b0bd815sm3531714b3a.109.2025.06.07.20.13.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Jun 2025 20:13:24 -0700 (PDT)
From: Collin Funk <collin.funk1@gmail.com>
To: corbet@lwn.net
Cc: workflows@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Collin Funk <collin.funk1@gmail.com>
Subject: [PATCH 1/2] ver_linux: Remove checks for reiserfsprogs.
Date: Sat,  7 Jun 2025 20:12:39 -0700
Message-ID: <4d9808b5e3a87eab41d5d0417d453800faad98b1.1749352106.git.collin.funk1@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The reiserfsprogs package is no longer needed since ReiserFS was removed
in Linux 6.13.

Signed-off-by: Collin Funk <collin.funk1@gmail.com>
---
 scripts/ver_linux | 2 --
 1 file changed, 2 deletions(-)

diff --git a/scripts/ver_linux b/scripts/ver_linux
index 1a8ee4ff0e32..d6f2362d3792 100755
--- a/scripts/ver_linux
+++ b/scripts/ver_linux
@@ -25,8 +25,6 @@ BEGIN {
 	printversion("Module-init-tools", version("depmod -V"))
 	printversion("E2fsprogs", version("tune2fs"))
 	printversion("Jfsutils", version("fsck.jfs -V"))
-	printversion("Reiserfsprogs", version("reiserfsck -V"))
-	printversion("Reiser4fsprogs", version("fsck.reiser4 -V"))
 	printversion("Xfsprogs", version("xfs_db -V"))
 	printversion("Pcmciautils", version("pccardctl -V"))
 	printversion("Pcmcia-cs", version("cardmgr -V"))
-- 
2.49.0

