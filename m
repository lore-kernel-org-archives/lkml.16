Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1B7E221557;
	Sun, 29 Jun 2025 15:26:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751210765; cv=none; b=FtgUGnfwdHSHV+poD53JXU2y8u3dEHKr4xlfL6/417R5MI0KpYukFQPivVLSnIepRYIdJA/TUJp/EWWN2E8dr5mYVyaD0ZK+2kltpqWTB20rnprgjuKCR3a4wstGpbJjQtH/CibK1M18ukMh+/pMggih0wfejncJ9mhL9DEKA+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751210765; c=relaxed/simple;
	bh=jYa4yy1eUTCEHK+GRIuumkOOMyvuL1Ia6Fuqs5Z6JDY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Vxn+by7TLOTn6Hp6TCkclRFmXXbpCKT2nyPAoxnKNb6UR2NIJd0sDecq9h1dfNTNxi+f/IOqAv0+DsZpG2vLDXDqayLwfTQ8neOdV2tlsDn+KZN3RJRZE/kK+btrMsJ+HugaUoqdk7eD/c24L/aPdoFR/gLbJV4lRWyMjxAVae4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Pf7rvEyw; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Pf7rvEyw"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-b26f5f47ba1so1164817a12.1;
        Sun, 29 Jun 2025 08:26:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751210763; x=1751815563; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JwVeA+WOAMtyYWZDoZNMNb7IdTNR0sVbUz49bS6Ix/c=;
        b=Pf7rvEywicqMC3/tO+mBiYhoY/rD7W+cessP3exG2PLlarcgb6szSXgbG0drlM4hls
         60goTq3r4AqX7PBVG2DcZgMZVBdK49e9qKgppcJwQF9fsGg9c2s41I5GIZ2dINlsoRkS
         RHRkcauhxQKg0apa//PfTDOFf4WZwo9QH1gW9ZyDSZOgvsbPIeAsI/hBlAmeNTfO6ifz
         O+g55BTQLMpuqnHeHmc0U4Wf/q7EcopU0VSF9WgzIRzhrz9M2xeKj3cwfZUFW26VyL8M
         z1cg/plImiHUa8kjaKc/3mpCRz+5Ke0yUfOrQfRIhA29Htj7Z8CzI93hqWEVuWtt27Jn
         T2fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751210763; x=1751815563;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JwVeA+WOAMtyYWZDoZNMNb7IdTNR0sVbUz49bS6Ix/c=;
        b=mt4MwImesAYS2lPRzAOFX/Y6HUIe8NNja95mftysoGEU52zNhvWlbmu/g57zzyvlMO
         42ufyt8yGBMGMtY8hho8M6ZvaLqAhBeM/wsz+q108WYNIDvaLrGqauodAlL1CnJYtLbk
         VMUc5HkfhzLVGFtvf37G7PVJ1vLsB2jxb20ZZzvn8drEmlogDZ9qouW/fBFxTDparEUW
         gzXn0c1s6mnBS+oT1rchqsazTZttQqR219f22a+c37SOnKSSoXSFGI0/Fclky7yEuzpQ
         CIn9dsD5tn/wiEmeJy3TCJftMBRMJNNdYeV2ayaAOXQPuXQic+FOBDHlVhmxYDDhDqkE
         UI7g==
X-Forwarded-Encrypted: i=1; AJvYcCVNMxS7WDzFyS51dnOZdSlfxZ8TQ+DC2izIfyt4iOxDGWAizdjrsK2egJJDBuuBG+A73A/EAm0lGbhQjjk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxvrbxSerZzDJ9v6XY9hoPavx9NGHQS/3KBm4lUxdsne1FulrOm
	IdlooPLOvAECqeUzDCJdBTn6OHseKNOXs9i8DE2vYpsFARrBxRO674RBB83Agu5vLsk=
X-Gm-Gg: ASbGncvY3hoLrJJ+0gIRtx/nekJ9Qx5soL7soz+bAOhFodLc8OvKgm4/+wQkC3945nm
	kfEq/W5uwkpwIqmK3uEbSYp6dVWDvzrNX6H/mB5JB8NJcoPGr1LMP7gcqM0KM5buyDgC9egesDc
	wxtqPfYmK25Go61HX4gYI005BHpjy2m1nw6fVD/ejIQOssT4r8fmOYerDJ9ehE2kUrOMMmiOeMb
	jvZ2nInrkTF550P6UGmu2jFmzvrbLh3R65Ni06Y+bDImmCf4kOPrNUWDTCFT9zP8KX/atILWcux
	6IgZwY556rspJc6y44mGu2uCTX+7V4jojC4teT6N9OyYqcp3S977nqqz59ePhMz2Yv4PzBRtNFl
	vslDyRYuBFXTT
X-Google-Smtp-Source: AGHT+IFzILUQACTSX0RbTW9sMaapyjWR95QdQwhCbdI7QXSq7EpHHxoEpA42J2Bqs/ZeZVLVk+jqgA==
X-Received: by 2002:a17:90a:d2ce:b0:312:1ae9:1533 with SMTP id 98e67ed59e1d1-318c911beaamr12417476a91.1.1751210762595;
        Sun, 29 Jun 2025 08:26:02 -0700 (PDT)
Received: from localhost.localdomain ([2409:40d0:13a3:7a93:1d81:fc79:cbf8:87bb])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-318c1392233sm6877293a91.6.2025.06.29.08.25.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Jun 2025 08:26:02 -0700 (PDT)
From: Krishna Ketan Rai <prafulrai522@gmail.com>
To: rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: ojeda@kernel.org,
	alex.gaynor@gmail.com,
	boqun.feng@gmail.com,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	lossin@kernel.org,
	a.hindborg@kernel.org,
	aliceryhl@google.com,
	tmgross@umich.edu,
	dakr@kernel.org,
	Krishna Ketan Rai <prafulrai522@gmail.com>
Subject: [PATCH] rust: helpers: sort includes alphabetically
Date: Sun, 29 Jun 2025 20:55:32 +0530
Message-ID: <20250629152533.889-1-prafulrai522@gmail.com>
X-Mailer: git-send-email 2.41.0.windows.3
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The helper includes should be sorted alphabetically as indicated by the
comment at the top of the file, but they were not. Sort them properly.

Suggested-by: Alice Ryhl <aliceryhl@google.com>
Link: https://github.com/Rust-for-Linux/linux/issues/1174
Signed-off-by: Krishna Ketan Rai <prafulrai522@gmail.com>
---
 rust/helpers/helpers.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/rust/helpers/helpers.c b/rust/helpers/helpers.c
index b15b3cddad4e..d3867d09e356 100644
--- a/rust/helpers/helpers.c
+++ b/rust/helpers/helpers.c
@@ -29,9 +29,9 @@
 #include "mm.c"
 #include "mutex.c"
 #include "page.c"
-#include "platform.c"
 #include "pci.c"
 #include "pid_namespace.c"
+#include "platform.c"
 #include "rbtree.c"
 #include "rcu.c"
 #include "refcount.c"
-- 
2.41.0.windows.3

