Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AA8F231C8D
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 05:38:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743572338; cv=none; b=pkydVAt/y2bXAh9iVAh5V8xZ8ujWw06qxPLYwGVarSHP/Ffva9fXzCgA/CrmArEE3AlSE1nWsqFabdwOCpS2oQtsgJBlsifRBHzzsFmPU3j3DNEEWH81sZTffhq9DXpp8CP7eZktejjPvraFAfLOPrVfWkygYCHvA5aM4AdEPpU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743572338; c=relaxed/simple;
	bh=Fi/SqJtJyUf1mHWGg3azbi4rP4riZdDLaioWwKzLB24=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Nr0DTMCZFroPP5p5uSWeypNtE4xqTbAZEUR+D3St2lgUh+z76qtEExx43SBdZTJZt8kJM+mUX0oi1ENjknfMQiuxCfy8msypWeUlBAwDBuSAsjVWFfojicyUs+8jsV5SvuvffkvVzrhhOi/KKaksvfTo0dUK8gyS83uWk3sHC+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Yzk3LWEG; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Yzk3LWEG"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2264aefc45dso2989385ad.0
        for <linux-kernel@vger.kernel.org>; Tue, 01 Apr 2025 22:38:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743572336; x=1744177136; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Vds3osu30LpJLxooKeQfecExvCs326fHSaN8YqB0VpY=;
        b=Yzk3LWEGUDSggbAeTGOF1JhoBYK6Y7NPpHAPN8WWyIskBNXUDipKIRdQW31epCahFE
         u2Rf31jvJFpeRQ2fkwAeZDeWv6mmpN2sd99PBDr7GEY3SUtQ7j9mNQawDKSjoyXajti3
         Bv3PZVHZOYnrdL/MSc0/1pEgRtY1NMCNaCt2UvAes5I4xDP1QeVZmvDASjsjOcJ732xP
         VcRIc5Supu5jfpaxOt6mpwUzWm4wvwP7hjoKc9XshASBNcsWhZe1Jx+D39O1q+ofafto
         BXb8CFpbmgdwSQGuE/UfafMLRcoJapSEiQLOhlXtgvmEpNGIONWTC9bdlIuli3LCNDrx
         dAOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743572336; x=1744177136;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Vds3osu30LpJLxooKeQfecExvCs326fHSaN8YqB0VpY=;
        b=ALeIgS7DUHxlRSJ1fu4IJFKhrkCHNgSsg/KXUC/CPN/TXRe2MfjdIhgjiuawmZSfDb
         0uD6q74fKMlF+GSZEyS1kZ6W2fl9efivU4rrrwezfVGCCM4QqHcR4Zla55TKSH3UE7il
         mhFkWKiehyaAgeSsZH8VPFX9wH2o/BfEOZ3Sr4YVpTFO1jD8ScHkppHihIoYbFCGKBwR
         mTSoC+HjEuNAT7mgMO36iRiaSwmGYcTj9S9B8Ub/CosKTTBnR2bW7M9sBYtQDTffTCJm
         KpiwC2LLGcKdyOVTzw/6gjHRLi892dMJ0OvEtsoyriHTEpxPVvkUo9LIFdeQjMc/3TsT
         rRPg==
X-Forwarded-Encrypted: i=1; AJvYcCUSqehCbb5/g25jY/1N8HOS2oO1cruqdHkhFtFgSYFpEMfOetV4VJHcexLPNuTtC3UTJYlDk/vzwYcSOkM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwYRIdNQ+zkgy4QcqyTkBYz2vRnSX0BVPwVK1m8QyWygCS81/Ab
	qLnPG641g2wSf0tF0EQOPycb6exLT2zao5MP2yvJOEgkCFEX7Sxw6N8BHJ32YBc=
X-Gm-Gg: ASbGncsMCMSLGLIpcg+pLoTvwuPzpH+R1uHgt0j9tyOzM9FDysI8/2GsZAWhmTnAKEy
	zyJPww2OBFimNtz7wKNUWZPhhwPPEsg41SY0/7OGz20AW8nIhCO26R8UUIN3vO9Q3U83jW0q74D
	7NmqdWGlLU5M2/IAwX/H8pdlLYuSPckgI+E8cnkYYlW2InKajPck2E7qElxkQK95yy5Oun+Rj6Q
	bO8VfY2Ef5fuhM9wW7rjhoqy9R+JIq+M9d365eLWmWzTnOYlKZl3lY3BUiPMAwZqeIDX9yGF2u6
	3+OwmTY0Sqj/My4FPftFMx0RihWpm/qtGKgsuSLxgJaDqw==
X-Google-Smtp-Source: AGHT+IFjTK/AkY3vAyWwEbnbqfQU+uFaUrIZm4GvtNApjNI1onAoRxSXqjrJ7Q6udqokIM5G8rb0Hg==
X-Received: by 2002:a17:902:ea03:b0:220:c813:dfcc with SMTP id d9443c01a7336-2292f9fa333mr265612385ad.40.1743572336371;
        Tue, 01 Apr 2025 22:38:56 -0700 (PDT)
Received: from localhost ([122.172.83.32])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2291eee0bfdsm99945695ad.72.2025.04.01.22.38.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Apr 2025 22:38:55 -0700 (PDT)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Yury Norov <yury.norov@gmail.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>
Cc: Viresh Kumar <viresh.kumar@linaro.org>,
	linux-kernel@vger.kernel.org,
	Danilo Krummrich <dakr@redhat.com>,
	rust-for-linux@vger.kernel.org,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Burak Emir <bqe@google.com>
Subject: [PATCH V4 2/2] MAINTAINERS: Add entry for Rust bitmap API
Date: Wed,  2 Apr 2025 11:08:43 +0530
Message-Id: <bf2d798034e5f2c6fd5fbc561a8bd19431e6a9cb.1743572195.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.31.1.272.g89b43f80a514
In-Reply-To: <cover.1743572195.git.viresh.kumar@linaro.org>
References: <cover.1743572195.git.viresh.kumar@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Update the MAINTAINERS file to include the Rust abstractions for bitmap
API.

Yury has indicated that he does not wish to maintain the Rust code but
would like to be listed as a reviewer.

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
Reviewed-by: Yury Norov <yury.norov@gmail.com>
---
 MAINTAINERS | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 315cff76df29..f67060f1b3e9 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -6113,6 +6113,12 @@ L:	linux-riscv@lists.infradead.org
 S:	Maintained
 F:	drivers/cpuidle/cpuidle-riscv-sbi.c
 
+CPUMASK API [RUST]
+M:	Viresh Kumar <viresh.kumar@linaro.org>
+R:	Yury Norov <yury.norov@gmail.com>
+S:	Maintained
+F:	rust/kernel/cpumask.rs
+
 CRAMFS FILESYSTEM
 M:	Nicolas Pitre <nico@fluxnic.net>
 S:	Maintained
-- 
2.31.1.272.g89b43f80a514

