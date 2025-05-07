Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36092221FD8
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 07:52:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746604345; cv=none; b=anajEeGVex5L1xuB+9kCnRc56iFS/Fq1r3nL7e74aSLX4qeCu3PxQl5GVKgXPEEHa6HiC8VcXzGArWmNyCc77e8jbPVk9uRk9ChxOwajg/QeFh8vo2yJcLQUft+xsdJHXM9GrcPtUjBwkvKmYPfP250uusWdwSLYsSRBbePQa4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746604345; c=relaxed/simple;
	bh=Si1QvVZW2cyZhFItNCPhnZgDqOaPxdjxwEHoeO/uyhQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Ep986k/x/yr0Vb+vYQjhQaIemKwz6LRl8uXAjVBLMfKPxRke3YUllSO65QO4TiOJ1VRPvH3T4/24B0g4+wOFh1d+Fhq75mBo88ZX18B24/omTVJbNVtoFMrCblFzoBYC0hjlH6VJdKrqBQczOxIiD0N3VVD9q8DqP73zwtKwpp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=gO1ho51U; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="gO1ho51U"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746604342;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=lRVyImEnQpTkFTjBNjAdsm9T3PFY6JNS8zC6D6rKBZg=;
	b=gO1ho51UEIFMxQhxlMSEuGOGwOzDdpyDlHrpQdEfCiySw4ApqvxoSViHOxaxZWYMAyTr4S
	aoRMDTy9yQ3SytlGo8UgUP8Vc4vCVWi6kWHCdkdqFhgPpSlTdfPqgwe6rDD95qydsDgc0g
	QGYXll1lvhfy11QAbgBBAvN3STYbYQU=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-440-8idlgT8EPBWM-RQaBj7EPg-1; Wed, 07 May 2025 03:52:20 -0400
X-MC-Unique: 8idlgT8EPBWM-RQaBj7EPg-1
X-Mimecast-MFC-AGG-ID: 8idlgT8EPBWM-RQaBj7EPg_1746604340
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-43d0830c3f7so47998545e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 07 May 2025 00:52:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746604339; x=1747209139;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lRVyImEnQpTkFTjBNjAdsm9T3PFY6JNS8zC6D6rKBZg=;
        b=sg0Lb21Jki1gKmIUNIRr3RkfoVI50RDvb7jZKAQ0RJCwhBrI1NXMl7REYLmDvZhQNI
         5mPJ5hlp+PZdHPohClPQlQXbAZogIwYDZAUYmKS5eTz0BqIfxpOlg8qN3We7vCsgoC69
         tWH6OphfEPU7uADjW6XCJFwdUHzWuIJL6m7293C08nby/1J2lNXO7uWkw6D1r3k03XYP
         u0ptaiTCVNs3Exi8ZqperReqbEIbJKUIuiFfw/bnyhqo4T13ouhRWnrZV8tGSekW9nbh
         R61J4J5uEOM5akzH8A2NgMyr6dXEo7EO4Jh8eSp9wA/IV+e2SRZFAPI4PA5e3ZaXKAnW
         z3Rw==
X-Forwarded-Encrypted: i=1; AJvYcCVUcPq/Y1hdtk+uyM9CkgAEM3aa3CO8i0QfBOI8hjXLmhyqhzXk7O2S8/1ljuAmeu7N2dwmrc14wX9qpoE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwcA/RvB+yJSv0kFnm38Tm2CyyiuXumyH8wd3E8N1Q6ZRBdh3wn
	oCSoWBa0YXLmHhM4xRR77Aw7BDREly8rGRMy3U/coRPTfcdFBjoUPCmAb0QzK5Fh4m0UvtIWL7J
	JIMuy7cfVUxkauha8l2qOjWz7K14wghzdXF1EwJ0XYqR7qNQAIhjhpM+zusa845FauMmB5w==
X-Gm-Gg: ASbGncudd7MWI5+AkMcZMq5x4P+J/MTmABAjyDw3RLT1NDtUkmSbVMBa5DKTu03N27J
	ggy0n5c1scZeeIOpXn1p9KQSsBIJM51pgt2pawXsNxLozAbrXvzRWf9/p0sWPy7pkyFjp3o9Q5p
	CYUc4FC2A2kRqu5ZOxUdlpxdstfT72795Bh5WXzu/iCh6qnX1sdRVfvaBuffRYTE9BlLvZdTX4B
	1ecU9bihsa2yuh7HqeHj44Q8tOjHYkhNtZWUBjO+uwdnzhKZuLbFndTL92ywExNnCYpSepybQaT
	iZnClysdgUsw55PcTmLUwdkAF8nplCegLnPtFnB2OR9XZSlDaa7HdbX6pw==
X-Received: by 2002:a05:600c:4f12:b0:43c:fe5e:f03b with SMTP id 5b1f17b1804b1-441d44e0919mr17543315e9.30.1746604339058;
        Wed, 07 May 2025 00:52:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH6bbFfoJUlE32ZpjhY8SNYfXA9NoideZRSClq3CU4H3TaCkDCmJ5dagaVohFcNt3ifY5S59g==
X-Received: by 2002:a05:600c:4f12:b0:43c:fe5e:f03b with SMTP id 5b1f17b1804b1-441d44e0919mr17543005e9.30.1746604338689;
        Wed, 07 May 2025 00:52:18 -0700 (PDT)
Received: from lbulwahn-thinkpadx1carbongen9.rmtde.csb ([2a02:810d:7e01:ef00:b52:2ad9:f357:f709])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-441d43a802csm21562885e9.39.2025.05.07.00.52.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 00:52:18 -0700 (PDT)
From: Lukas Bulwahn <lbulwahn@redhat.com>
X-Google-Original-From: Lukas Bulwahn <lukas.bulwahn@redhat.com>
To: =?UTF-8?q?Micha=C5=82=20Kope=C4=87?= <michal.kopec@3mdeb.com>,
	Hans de Goede <hdegoede@redhat.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	platform-driver-x86@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lukas Bulwahn <lukas.bulwahn@redhat.com>
Subject: [PATCH] MAINTAINERS: rectify file entry in DASHARO ACPI PLATFORM DRIVER
Date: Wed,  7 May 2025 09:52:05 +0200
Message-ID: <20250507075214.36729-1-lukas.bulwahn@redhat.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Lukas Bulwahn <lukas.bulwahn@redhat.com>

Commit 2dd40523b7e2 ("platform/x86: Introduce dasharo-acpi platform
driver") adds the platform driver drivers/platform/x86/dasharo-acpi.c and
a new file entry referring to the non-existent file
drivers/platform/x86/dasharo_acpi.c in section DASHARO ACPI PLATFORM DRIVER
rather than referring to the file added with this commit.

Adjust the file reference to the intended file.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@redhat.com>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 34a55e3ff863..82e7b053ea76 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -6576,7 +6576,7 @@ DASHARO ACPI PLATFORM DRIVER
 M:	Michał Kopeć <michal.kopec@3mdeb.com>
 S:	Maintained
 W:	https://docs.dasharo.com/
-F:	drivers/platform/x86/dasharo_acpi.c
+F:	drivers/platform/x86/dasharo-acpi.c
 
 DATA ACCESS MONITOR
 M:	SeongJae Park <sj@kernel.org>
-- 
2.49.0

