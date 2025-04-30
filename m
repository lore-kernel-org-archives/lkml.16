Received: from mail-io1-f47.google.com (mail-io1-f47.google.com [209.85.166.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0452C17BA9
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 01:02:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745974955; cv=none; b=Wj1DMgmpbfa+m6GTYVhjOddWW+0EQYybt8N9XQ8bwRH+V2xASTx1d8hqWqKXFn7jdACQiGPxJb/f/g0+S2495tQBMQe1tup5nydOznwb1Rq20HKhCZZGCOyjws86ew/YizWHE4IplOGqdlYyd/6wUgLOgbHOYuRzGacGaHzqJ8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745974955; c=relaxed/simple;
	bh=cFKHexItRUd11v3EwM4TzQ+ON7gZ+4ewPo7g1jCunOA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PYQSbnHKgapMFY66CvDsZRCJaWMyFgX/wFftHuECZgHe0YfeEHO1pcoQGgHHsmiG75HrI4AIQ7z0lmK1hdRQ6H7a9ZDtPJWAnV1dcSU62P4rdckGIYJGmKAl695+PVKs9DQk3OkyWfBShAP6NBR0PknhUV/LJsJP+0RKkPilCmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EMDl5X4v; arc=none smtp.client-ip=209.85.166.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EMDl5X4v"
Received: by mail-io1-f47.google.com with SMTP id ca18e2360f4ac-85d9a87660fso631541339f.1
        for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 18:02:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745974953; x=1746579753; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HEffTazbstEq63EcUWxMjykvS/dnXa/9/VAWZDoyWgA=;
        b=EMDl5X4vSo8z5mAK7n2fJmccE/5EcXehlS7we/Nadyk1JXvdHQnNYv489bNGK7rwPW
         AFJTK+5P+cC9AoCUgKoSQTygIq0zdgK4c5T4b2Tl0E+AuOjSMcs3WhJX1yraFJC3rrle
         V4MnVQyp5WQv1sjVVgDbew9kYZF1zCFWktuyAtV+bcR+ZvjHK16eA0eeuu46rZTR4QmT
         LTyJKNYJwyLHV21dOOTomGiuKRwNq0zp5HHG0hOyE+bMr8leRXX57a8xTn5mctfjHLSd
         aOSbnU82C30RYLobj3WClp25SxvY60VdRR1UshIMBdNo7wyfuc7XyQ1te5oR0XCoTXy/
         7nUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745974953; x=1746579753;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HEffTazbstEq63EcUWxMjykvS/dnXa/9/VAWZDoyWgA=;
        b=YuZlQu+G8N58FKn4IfwHlKkR3J7gR2YZ7NYW6O3oGc0uwLzkdCiQqpWqL9zTvBeoPk
         UgvdQs7/jg9Gl6p9nqpvu7I2s1TDcVoRxAMTeILLE98Ge/vBvYrnHiz+l7ZXg3zO6v4z
         6aImUt5Tuvf2oRZ99Kr/2TLl6voxqrSGeYK6Nxm5d6QuM2aAs17Y3VhRVcjmTmSEdk/V
         Ial0hIvRL514D8aLf41MhiSo1zlucPhXe/ZT8yYDBQO8x85PXRcqJTgmbQroiJ9wwqYV
         GCv4SKjn9DNP+UQuvV+/qmoas3rFTPTwEXlccAbszbv2FOVOI6ozuZtLZQrIyVLFNJlI
         l49Q==
X-Gm-Message-State: AOJu0YzfCaiNS0d4a0h7YINLQDVI6ebNbqjyFnB7Zk397aMh+WkxQbIR
	GrMCgBBslh606/puiY37ypzVk9klLrsFpyZtpJBBfRibuCxZisgh
X-Gm-Gg: ASbGncsxSK4+FfSFr0yIvfiTDDbT0TTq+5pURq7bwScM9oFs2L+8aWahyiU3XReHkZh
	h+SLwnPdsdltbx05KTCDL6uuItx9Qxw2Nn3E43qZOmgEf2tM5CJrA6kr1YTayh3bAg8BKKaKVj9
	lKQmO5b5ik0h/+o25sk0MZd/Vf6iemG+9AWbgkfNv305LsAnDH1S9uOIPJs88wJHHkeE2zrv0fD
	mCbcC1ESPLhmMdlaIJzcGlKYUbivIS+XcsZz/8KJXIY+rh31d5G6rQJk8MXbYRJLNsvnbO9b4dT
	sfPKoYg+HU0UX+bipECINOomDfftOJn/AkJJ6g+BLjRXAjN1wxV5KrqNSRz9N978H8DHCsQe4az
	AFA==
X-Google-Smtp-Source: AGHT+IHBXrhBwSFPNqBXwz+rbE5AHgGO94CA5PrzG9oTUm7O1545hwKGAT9SiJ/stkuj77kVq89pbQ==
X-Received: by 2002:a05:6602:6cc2:b0:864:4a07:1a8e with SMTP id ca18e2360f4ac-86497e28dcemr53001639f.0.1745974953063;
        Tue, 29 Apr 2025 18:02:33 -0700 (PDT)
Received: from fedora.. (c-24-8-12-5.hsd1.co.comcast.net. [24.8.12.5])
        by smtp.googlemail.com with ESMTPSA id 8926c6da1cb9f-4f862e0f4c0sm534818173.4.2025.04.29.18.02.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 18:02:31 -0700 (PDT)
From: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>
To: linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org,
	Vivek Kasireddy <vivek.kasireddy@intel.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	"Vishal Moola (Oracle)" <vishal.moola@gmail.com>
Subject: [PATCH 2/2] mm/gup: Remove page_folio() in memfd_pin_folios()
Date: Tue, 29 Apr 2025 18:00:59 -0700
Message-ID: <20250430010059.892632-3-vishal.moola@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250430010059.892632-1-vishal.moola@gmail.com>
References: <20250430010059.892632-1-vishal.moola@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

We can get the folio directly from the folio batch, so remove the
unnecessary page_folio() call.

Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
---
 mm/gup.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/mm/gup.c b/mm/gup.c
index 1fb8f3b9a493..795fd94f379d 100644
--- a/mm/gup.c
+++ b/mm/gup.c
@@ -3640,7 +3640,7 @@ long memfd_pin_folios(struct file *memfd, loff_t start, loff_t end,
 			}
 
 			for (i = 0; i < nr_found; i++) {
-				folio = page_folio(&fbatch.folios[i]->page);
+				folio = fbatch.folios[i];
 
 				if (try_grab_folio(folio, 1, FOLL_PIN)) {
 					folio_batch_release(&fbatch);
-- 
2.49.0

