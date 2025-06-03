Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 272551C84CB
	for <linux-kernel@vger.kernel.org>; Tue,  3 Jun 2025 18:04:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748973866; cv=none; b=NMjCRWKzkC1NEoq3cP8S+DoFlESapsD/mh4SGri961R0MINtZf6QOB3s3UoUGkWYa5GxkEVc5JpCSkIm5F37laKEaeode7tDlwR7T4ldtcYScjRim7gpdknm7sZcNG3/OVpWHe24P/41l3pA6biPLX6TpmJJXq1F5+/S1pf0JZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748973866; c=relaxed/simple;
	bh=8FS4grgCBfFaDpBRnEs8PhpvZFsbnfZNEcOJcPe3WQg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=T8nPa+U+qocfUJ7m76eDy5VqBFYDNbcDRI4RC5zEQUz/WeR1Mft/9EIH+VPhvtNm6AgdEQehVnLCvr0oqZuAQLN61ghbOr1pNLzxm0uOyQvLSt4F4Uz3ZuMhv0KYR0TJcQ+P+11VosLtGGlrU6N8qlib/bkverGzoUak/XqzPjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z82t3Gu8; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z82t3Gu8"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3a3798794d3so4999202f8f.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Jun 2025 11:04:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748973863; x=1749578663; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UUV+ii5u6eXM/9z4t0zPuEnw9506tcp6lSpVIjqTuQM=;
        b=Z82t3Gu8uXVp+kWDia5MmI7dvy0VWkLS75y7OdtFZXR24oI/zwcDvpqWGkga+5VCVB
         wLDAmhCdiqTiK615WUflFp7r7iy5+ZSZ3K75R4s43KVpA3ITyRIBSiXndNHN4AaRwf+q
         QiaxNxV5gJYqzwen3CbpdcIMNt+pX/tzGbQ9IlDxIcmOxVXuXmT7bhpfIh8hzJsDMh6S
         GCJ9cCDxqlmL8fpOPk1dhbm8aHcaiEZKkNgOA8BN5QNDY/EpNkQKyRHaFIszjXijDnmi
         cwIY8TYAJG1OYjs59Fq9z326u6Pu5zdoRft9YRy0tRUo3PW66wdH8x8v64jwB5YHtO5E
         BdjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748973863; x=1749578663;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UUV+ii5u6eXM/9z4t0zPuEnw9506tcp6lSpVIjqTuQM=;
        b=slUANaAutcFxkFdLDUhQSf25f2I1BTGb56iUUtg820rx9WdsOtVeI8D7/2O/BHo/et
         rxvVME0pHuH9K+ugQJ3k5oEBqQw2yigt+efLsjUOOb3aj8uVck1Vk8ai8dvRBN94ewFp
         xzRGn81fEyL0Qeh5O5fTttLhDw0eCETXRpsVABGVWce9JgCaVNKAMlsrn1CeXmDHO5Bn
         AGg0QNex9iyXCaCHKWZPYBOit+UVB4/dL6dS5kNbtDnK5+mr89bICzvrvsWahMN3EEB/
         rPG2L/hZJOSUtdR8ZMmSWGMGDKU92CqN5FntQvSZeiL3dZj5QAnmz5A033d7P1ss8rMS
         bM3Q==
X-Forwarded-Encrypted: i=1; AJvYcCVhMTeAKqGIl/+zeQBzZDWNuS6s+p+uKfwohxo1R2slMzFA9bQ3yAn1rR0qvl8Yhrg9rx9+YA6AnpX6xC0=@vger.kernel.org
X-Gm-Message-State: AOJu0YycG9/FzVUzplHTnDTEwDU2Mi/eWJZU2AMF+GRllWoApepyZtj1
	6yHVqh3ot3K19+pyQ7nZaO8Ftawjc3peIkwBWHXPLROurrO2VMHfg6Ce
X-Gm-Gg: ASbGncsAn9qvsRgpfaVDdAIBmJ0hFWPa0ZisUqAvwknMbF6zStVED6ue1mg/+z/NL0Q
	YBhj6+IR3fm9TKH3r0evkPjmMHficyFfEkeRhrWAFNf066e7upGvywmffBOpZAshsz2HLZ8P86r
	N+ub9Pi8wov/f8EqkHm33KBY4NZjssjSk6sdiEd4AK02IJqJFaoJ0pDGe4PiFuD/l7U5whGsiJ4
	F1YTZ2ijThQKr9sYARLoPW8ZvHiO6g9kKpP5WZBXLQTR+iob4jqyX9SC2fm0xpCn9XnzeY6G7DL
	VrOxKqNrVWVwvvFbYNuqoiZ07yEIqugfmMetIIjOWOExQ5WvxfaZDSeVIVdRefY=
X-Google-Smtp-Source: AGHT+IFWDRZ5DMF8AWYghMojAC19CnsoSoHQTSNpwtp6Jv2nP6IRBRnbRL5Y916DRs9zZwsULYr8uQ==
X-Received: by 2002:a05:6000:18ad:b0:3a3:727d:10e8 with SMTP id ffacd0b85a97d-3a4fe3a6ac9mr9056440f8f.50.1748973863165;
        Tue, 03 Jun 2025 11:04:23 -0700 (PDT)
Received: from qasdev.Home ([2a02:c7c:6696:8300:397c:823b:f900:56d9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4efe5b887sm19468210f8f.18.2025.06.03.11.04.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jun 2025 11:04:22 -0700 (PDT)
From: Qasim Ijaz <qasdev00@gmail.com>
To: lucas.demarchi@intel.com,
	thomas.hellstrom@linux.intel.com,
	rodrigo.vivi@intel.com,
	airlied@gmail.com,
	simona@ffwll.ch
Cc: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] drm/xe/hwmon: fix uninitialised access in xe_hwmon_pcode_write_power_limit
Date: Tue,  3 Jun 2025 19:03:33 +0100
Message-Id: <20250603180333.32117-1-qasdev00@gmail.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=n
Content-Transfer-Encoding: 8bit

val0/val1 are not initialised and are passed to xe_pcode_read():

    xe_hwmon_pcode_write_power_limit()
      └─▶ xe_pcode_read()
            └─▶ pcode_mailbox_rw()
                  └─▶ __pcode_mailbox_rw()

If __pcode_mailbox_rw fails, val0/val1 could be left
uninitialised leading to xe_hwmon_pcode_write_power_limit()
to access them via drm_dbg. Or an uninitialised val0/val1
could be dereferenced inside __pcode_mailbox_rw.

To fix zero-initialise them to avoid potential UB and 
propagate error on failure.

Fixes: 7596d839f622 ("drm/xe/hwmon: Add support to manage power limits though mailbox")
Signed-off-by: Qasim Ijaz <qasdev00@gmail.com>
---
 drivers/gpu/drm/xe/xe_hwmon.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
index 0d32e977537c..04acb47488a0 100644
--- a/drivers/gpu/drm/xe/xe_hwmon.c
+++ b/drivers/gpu/drm/xe/xe_hwmon.c
@@ -179,7 +179,7 @@ static int xe_hwmon_pcode_write_power_limit(const struct xe_hwmon *hwmon, u32 at
 					    u32 uval)
 {
 	struct xe_tile *root_tile = xe_device_get_root_tile(hwmon->xe);
-	u32 val0, val1;
+	u32 val0 = 0, val1 = 0;
 	int ret = 0;
 
 	ret = xe_pcode_read(root_tile, PCODE_MBOX(PCODE_POWER_SETUP,
@@ -190,9 +190,11 @@ static int xe_hwmon_pcode_write_power_limit(const struct xe_hwmon *hwmon, u32 at
 						  READ_PL_FROM_PCODE : READ_PL_FROM_FW),
 						  &val0, &val1);
 
-	if (ret)
+	if (ret) {
 		drm_dbg(&hwmon->xe->drm, "read failed ch %d val0 0x%08x, val1 0x%08x, ret %d\n",
 			channel, val0, val1, ret);
+		return ret;
+	}
 
 	if (attr == PL1_HWMON_ATTR)
 		val0 = uval;
-- 
2.39.5

