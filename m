Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBB491E0B9C
	for <linux-kernel@vger.kernel.org>; Mon,  3 Feb 2025 21:44:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738619055; cv=none; b=ZHra+8UcTdhNtmXTxZ16BYRZZkE32pdKWlaNjWk1DELm0yXoZ0elbspkU7iJoAZDh18OBFxLpDNXMMydSPyh6xPPnGyLwC+57kTCsLZda6VzRa28oAna6H9atvDynf12hZVoMPi04dPwgYyxtxujTaYE2CLWv4sFLTjman8MPYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738619055; c=relaxed/simple;
	bh=PQwwraM3QB20MC6x4p7Skc0DjEC9F4A4FGDortcs2u0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WTEjKDfLlh7NRQTZFwwBL/CPox/+JHRaJkzUiD7GeugE5DH/qZsgXiLlJlWUd4kUlczcnMkFKC1vVzZvF08yzDn9XdVHBY8uqt0ORIZhnublrEQfRjGpWPeT1bMOz/XLm/sbcS03cSDRQFACc4FmCguU0ayS42c5c5Cgpq7eA70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BudrSVLp; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BudrSVLp"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-2f78a4ca5deso6282050a91.0;
        Mon, 03 Feb 2025 13:44:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738619052; x=1739223852; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gfrcdPBB75X7eFNW+7bwAzlWHqYkPntkHIs94tFXxuA=;
        b=BudrSVLpZlFJNHI/93NAFc3B/VZC7ZWWs3I2cTEkDse132Pg6wtN+rXf3ctSSR4xyH
         0fIV0MJA/ziwt1723lOiQP0/0kObdmyomHWzwdIQwrAApfTKjgTH9Ho4cx0faHcOEwJJ
         6yDlAFiyx6l7fCKtrw9YHo82MmZ27HUPqGgSFnfW1i9gz6mY5dBvJOTjsoprg8VJTV4e
         ZEZpJin67RKM0fYZznRBtRm7JRiA6cwIi0Ls6ztZzYc9saveCKNyTfcRHX54JAPVETLa
         SUWJdxrn7HR6nXGSAIdVZCDviT4NBLcMq9crktPAXR6voCOJJrLDHzoWYkD3i/U7iYmO
         eY0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738619052; x=1739223852;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gfrcdPBB75X7eFNW+7bwAzlWHqYkPntkHIs94tFXxuA=;
        b=EQ2CGNUa9/Vd68CCFNgm6sFTbFPBQuDvX5+unyT6EiBNYDtqz3Wp2wph+8VWPp2ohG
         57GpSLjwnQGHQaxbZ8tznvrZf13SlXZNvnc1OYJWj6wtaghnqnQFbvsoPKCnUzfnNuWO
         4JY3xZZJXLIKewQLy1ZKrdO9jvE336QNUUegzJUpBtdsSFiKF5gpCfJruD3qwkwMP744
         rY0HDka4zzmaDRkEOQQ7EWW0Voh4CKbaLyVXSx2qnW4CsObpNweaeRYyaGzJydvsmu2a
         hZ4KeuIqdNiN42RAuqj7fsmVtx6BQuiuw2ibm8YWOUJtG/CaqcX8KmtPn4vTqOs1FoIl
         VixA==
X-Forwarded-Encrypted: i=1; AJvYcCWqJ4fhKkTwLFOhqejWlt7LOd3Opy1AB1Z/3kcTOTIW4bnU4DwVaM5nH+yFn2uSSmG0SqyUNDDJiO5Cljw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwvKsZ3ZqiZPrF4S3tJ4XpfrU30AiTNRCi+17cU4U59mDHy7m/b
	eI93rGmDVlqeF6IVvvfRC90dA0thczeJ5rlB1iocgbtCHIgZcXUdfvftKpay7Q8=
X-Gm-Gg: ASbGncusulJNG0rEKt9sK2YbUA6mRoXUchnTNzT6m4DPOMYAax0b3h8kRF8dUHCjLJc
	pLKitFA542DNbnFEdPInj+vA1x22Rl3/FZOeHSs6v/Hn5yy7fVE0EkeOfftoCUF4mo0aCX+OdnF
	DyD3tecwsv85gIIq7mQHC1B3QFjxDjR8EENbqzh2mt2Iojd4OqyKR9pVZB9D+7hbDzwSwem8l9S
	m0hrYQN01qU1VzYoE/h7gb7QNgJQm6D3u3zY4HS2+iGTZyiuKH4coRQATk1dNC7Twiaq88xgyC0
	Nvw4K3Q/iertMUgsmjHsdlErBZjb20Pmy465
X-Google-Smtp-Source: AGHT+IGy/jExdpHjb9xIFzwksuQMzaMGNBM9rFDicsgTr0DUMFMl0HGMjj9LGRQPBnRwojpvHyXmEw==
X-Received: by 2002:a17:90b:4ecb:b0:2ee:a04b:92ce with SMTP id 98e67ed59e1d1-2f83ac8abe0mr30056486a91.32.1738619052433;
        Mon, 03 Feb 2025 13:44:12 -0800 (PST)
Received: from localhost.localdomain ([14.139.69.34])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21de31ee6bdsm82173605ad.21.2025.02.03.13.44.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 13:44:11 -0800 (PST)
From: Bharadwaj Raju <bharadwaj.raju777@gmail.com>
To: linux-kernel-mentees@vger.kernel.org,
	skhan@linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	maarten.lankhorst@linux.intel.com
Cc: Bharadwaj Raju <bharadwaj.raju777@gmail.com>
Subject: [PATCH] include/drm/drm_mm.h: fix spelling of "suitability"
Date: Tue,  4 Feb 2025 03:13:32 +0530
Message-ID: <20250203214351.1049358-1-bharadwaj.raju777@gmail.com>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix spelling, "suitablity" -> "suitability"

Signed-off-by: Bharadwaj Raju <bharadwaj.raju777@gmail.com>
---
 include/drm/drm_mm.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/drm/drm_mm.h b/include/drm/drm_mm.h
index f654874c4ce6..1f99e69d2300 100644
--- a/include/drm/drm_mm.h
+++ b/include/drm/drm_mm.h
@@ -115,7 +115,7 @@ enum drm_mm_insert_mode {
 	/**
 	 * @DRM_MM_INSERT_ONCE:
 	 *
-	 * Only check the first hole for suitablity and report -ENOSPC
+	 * Only check the first hole for suitability and report -ENOSPC
 	 * immediately otherwise, rather than check every hole until a
 	 * suitable one is found. Can only be used in conjunction with another
 	 * search method such as DRM_MM_INSERT_HIGH or DRM_MM_INSERT_LOW.
-- 
2.47.1

