Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8EB12586E0
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 22:21:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744150864; cv=none; b=U/senPBVr0qfVmP8sXA4StJGODqLPZ8Ali3dxa+/mVK+rSuWiILNvbuWr9+lyDMOVxyiJq/7Lh22DMZiRXyu9l0M9taVpU6iuoWry20h6KcMlGrEa0hya8lUB8/3rTqmXpFw7Oh6X6LEoo+/vQ541bLsiuOljzyIRD6sKu6BFy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744150864; c=relaxed/simple;
	bh=0GHjXg9oA+3dug+C11O84G6bQD9WN8uapAig/tew87A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nVc0KPJmTBl0g6DSrFDys/HyR4CzunSrJUQk8Od7siuWtcCXdclEBBEehIvP4zFtEUnOLPGqbMKqEfF5pzg1gvcCbB3rIA1xi+K67KghxUPsJltbMF5l+oo5G4sZalxm7lyE0JwCl0Ts4m+CMkLRi6nV23mHRUntDHL+jkm6gFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org; spf=pass smtp.mailfrom=neverthere.org; dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b=YSCP3iAs; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=neverthere.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b="YSCP3iAs"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-7398d65476eso108845b3a.1
        for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 15:21:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=neverthere.org; s=google; t=1744150861; x=1744755661; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uUHiuFyPdBXiOlFTx9RUxiDTC3xrN1hTq7r3n53RdSE=;
        b=YSCP3iAsh9fPWcOeQ460mOoiNwEVsRgDNgUGEa7npbsqSdnUxTQf/5xuxXVi3/2Nmv
         N6/LBTXQ0ih3HYJqmEeg3TrcEZDtLNJ8DTdGm2JpoZMjIch08Z0IFtCg9Z+YEA6oWR4z
         mP8BW2Oq6RI2BoWB74BvmJSPrhyaMZ0pluwtWCiOwporeqOgEDFj89jpuUIYPnyc1/i7
         hf4ChALVgwXI8C9RaKTYrJtpkn3+CVsfM9gGBZnFLuqPVT5Ws0cr5DqxMFZJkm7wZtTB
         ZFraQpg0acnqRpfZF/vRdYWHbRMP4+XtHuohspTK4kNfh3SjFOI3nCrwVfY+Su/iaC6A
         JHzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744150861; x=1744755661;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uUHiuFyPdBXiOlFTx9RUxiDTC3xrN1hTq7r3n53RdSE=;
        b=TbCjyWqvejFF1vOS34Gudz9UXk6VstuYLCzR6q8B4fKUhAWe+QzwTv0ZU2LHPZlsSf
         6iiHW+t5mQKp1pSsDDbWMxnmPqiYfXp7jyDqs7WNKLg0fBV0JpMBTnen8vymMI5E27Kz
         tH1x3XoT5zz0EPnN6pnfz+75USXrSVNMjgpz3ifKbi0BDF5oHIO8N6FRLeqHF3cQTfA5
         aSTQtd/T2lQQQW+lu7H+DRwFq9Ok6Y/xHbJeSrHbU4ajZeh7GKwbJz1gS+MVqHFnu5Wo
         Sf953yiiiZSmSEs338ByC4bvz/ldWy4ddaNgxZIuHw4gFJlYKDtRUoks4/pc9qUvi8yV
         CDqQ==
X-Forwarded-Encrypted: i=1; AJvYcCVnw6O0xPa4peNkl1uYpXCVz15wJ1lSyIeTYeAuoQXuMjZbVFdZ6BFAmTBxaJW37MEwj4SawUMZ0aTB4eY=@vger.kernel.org
X-Gm-Message-State: AOJu0YyPjpEpi5hbim7KFJStgK9XH1wcacPVrT2IVI1SkeYUAJrna4i+
	4dDsMYrKWM5IsHxsdKbTctWit8lrxU4t81un6JxarVjJCg6+eiAGwFcEtXttbQ==
X-Gm-Gg: ASbGnctC9Y7USXltz5w01I1dCKDYp8ouvCmsYN1XkDBajqQ0qgXcqBCGyVxZRVoa3ed
	6Q+lx8+wyrx/2MsVNDQktDD20gaF7KrqO72OytxOyzSMI+wyOR9eQ2nLIgTNeSC1DfujqpsChwb
	6w5ohecwMaabwVlaU+gg1i9jaHV3p0UeL5RGELzojxX7eR+ekc7h1B+A6PdCiawPwDAv70PxBm1
	H/2XcwhiF2WLqDVJF7fVSNszwM6CypzhzvSKmzH8DuFOv7+VzEqXs2QHWVyv2x6r5hTo5QKqFqO
	hIgn0iyrZ+5jYj93Ye0PFszZfQFhywARB01rb0adzxtBk7mLOihRRx4ciWGjyLYIIAemFRrBYeV
	BliG0ByZ5DQ==
X-Google-Smtp-Source: AGHT+IGwkZAbeNFJSC3+qEazzhQmoUaLB+22REfYnqNDjZaYsDfkqsut5Iv+kYGcEmAtzr1UbG5x1w==
X-Received: by 2002:a05:6a00:7418:b0:725:4a1b:38ec with SMTP id d2e1a72fcca58-73b9d2e3a0dmr6065958b3a.3.1744150861176;
        Tue, 08 Apr 2025 15:21:01 -0700 (PDT)
Received: from tiamat (c-69-181-214-135.hsd1.ca.comcast.net. [69.181.214.135])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-739d9ea079esm11492531b3a.95.2025.04.08.15.21.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 15:21:00 -0700 (PDT)
From: Michael Rubin <matchstick@neverthere.org>
To: gregkh@linuxfoundation.org,
	dpenkler@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Michael Rubin <matchstick@neverthere.org>
Subject: [PATCH v1 14/14] staging: gpib: tms9914: Fix Improper SPDX comment.
Date: Tue,  8 Apr 2025 22:20:40 +0000
Message-ID: <20250408222040.186881-15-matchstick@neverthere.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250408222040.186881-1-matchstick@neverthere.org>
References: <20250408222040.186881-1-matchstick@neverthere.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Correct Improper SPDX comment style.

Adhere to Linux kernel coding style.

Reported by checkpatch

WARNING: Improper SPDX comment style .../tms9914.h', please use '/*' instead

Signed-off-by: Michael Rubin <matchstick@neverthere.org>
---
 drivers/staging/gpib/include/tms9914.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/gpib/include/tms9914.h b/drivers/staging/gpib/include/tms9914.h
index 6cbaf5a041e0..08a40d84825f 100644
--- a/drivers/staging/gpib/include/tms9914.h
+++ b/drivers/staging/gpib/include/tms9914.h
@@ -1,4 +1,4 @@
-//* SPDX-License-Identifier: GPL-2.0 */
+/* SPDX-License-Identifier: GPL-2.0 */
 
 /***************************************************************************
  *    copyright            : (C) 2002 by Frank Mori Hess
-- 
2.43.0

