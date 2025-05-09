Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7035B211491
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 13:40:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746798040; cv=none; b=fhAgjdTdqBIilwBZegVJeCvQzh4w6Qo0YqIYEVqY3ivzdcpQJbnsx1xeWVTy23LSRYqMFDZVu1yhUqf8m3eoExOZNRy7T6HR2EJ12iC854zWZHRFgHpRLfDcOg/QK4dIlCxrsFXjMH7fyQxs1oD4c1Hmnsvp6UCdd2rVNkQr7Rs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746798040; c=relaxed/simple;
	bh=6kh1EmvyaIMEv6qY2bKAXfovW6AsqQRIY19O2CY38EA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DryGAWgV6bENtYC/2USSOMCG09Q/kiTOZ9NXMGmoW+gWWmevMdESLAWLHaWg+FAKMh0KbUmV3bjnxFcOJjkXx7RSfVAQdXIvt3yJiW1ZYQDG/Uc5KKLN4NMZSeOQSx3K7NM0dpumgSgZANwgS8AcyY9gFOw+sCTd+zqhYf6Xylo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=gjNkB4nJ; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="gjNkB4nJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746798037;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=rbU/Ik2HFCaYPRnGL3BpFYVtUHthaf34xL/8Qjh8JzE=;
	b=gjNkB4nJYMgojcVibeQ5SGVZ8XeO4Xc0u1A3bEjCmCMCsB/jahcrgxlSKIO1HqnvRWdOug
	dHM2xtN3JdH8gXsXNc59/d/jfN/MX94O6rZ8i78gfR1GxORlGKe+u3skihmFxLTnyC3rkm
	ziVS+MpIgrJK3WdI+ow0q6NGU+G195E=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-42-tvwojjusND66ZHZCNAvMxw-1; Fri, 09 May 2025 09:40:36 -0400
X-MC-Unique: tvwojjusND66ZHZCNAvMxw-1
X-Mimecast-MFC-AGG-ID: tvwojjusND66ZHZCNAvMxw_1746798035
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-43d734da1a3so10173385e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 09 May 2025 06:40:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746798035; x=1747402835;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rbU/Ik2HFCaYPRnGL3BpFYVtUHthaf34xL/8Qjh8JzE=;
        b=cUqPXoR1K8M65VfiXnJJPuZXscZQKuOncXH+rMjBCN1U4jDEt1ggkCjlRga7z3ribi
         g9xbKPoGp6S1kpdahOKZWH8TJAI/VnXE3boNVX2FDYr3OBXLq1i7qFFS1tFTJ6UpDWLs
         Cvxh8M8kEsoBPbph1lc5+9VnD/GGLp+qnTTGgUFKeIOTG45H5yB6P+Qb1uKNW/8byurX
         0aBk/m4CBh8D1uhT9i3EO/omZVPnonDsWL6Ku4NvbCxUb1dLwsVo5/+Ui0yhiJrGnIa3
         +CtShPGUUL+pZKOaaUGf8SJXf6YOjZ4DcW/qVBbsASTJ+Tf29Jk4iaQyhT9POcFOz1kP
         FsEA==
X-Forwarded-Encrypted: i=1; AJvYcCV5SJTvSVvUWsnVd/WZa+LfbOVA75dV6ajuh2Qn+tdAE0mvtzlckOFBZjjVWZZJpviORsy/dgpjegfVar0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxyWnee2sCumZScw5HuRi83yqj2VbeGSXFfwxLma76o/A01lcJn
	Wb6uNyxlJXQDtU1s3XE3NBKpo0TIP0nojvxO6LlhYSCvj6OjiZaWpMqZuG8IXj/yjsRHp+YpmDG
	IKIT0zKGPpTYL0XWZvu5MnbaMGTDIVvEwG17OV2AIJe+i/KCkZa+0liF9o3vv0Q==
X-Gm-Gg: ASbGnctDwcuPX9m/9PEnoIEysDmWA09VYomMcVLbVFq+SufPO1THzVNVNKU85itN7Uu
	pYaEybhNwwNAesUU2QOQi3PS+ZLUsyEPAokwXCHrOB88wY08xZUKW0kqhcCekMtNAJMpKFPb05u
	/dh2vWfGnFcaTa8Q2r8sP3+Tug7cB+W+Z13ka8war3XMMqkM5fM32+2j/jZGT5TIBASsP0Ey7rE
	FEpMT5zKnuGfqRjhXfYzckdqSmZJyVnBYde5JeFqirupwEifRYQo3Ejika/KZOWbe7NmLWmXqRy
	oHrEZO7O8gVHLD0gr28auWBuWFyfIEEvwxEtbUcYKzdf+7HADCvZKmAnkg==
X-Received: by 2002:a05:600c:6819:b0:43d:649:4e50 with SMTP id 5b1f17b1804b1-442d6d44db5mr30308875e9.13.1746798034806;
        Fri, 09 May 2025 06:40:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH8Kxh1nPeuAUwUqlxdH6k97wyjBuBL7pw2aJhhUSJalMBvgbkpXFDayp+M9yqixrKB3tLmdA==
X-Received: by 2002:a05:600c:6819:b0:43d:649:4e50 with SMTP id 5b1f17b1804b1-442d6d44db5mr30308675e9.13.1746798034415;
        Fri, 09 May 2025 06:40:34 -0700 (PDT)
Received: from lbulwahn-thinkpadx1carbongen9.rmtde.csb ([2a02:810d:7e01:ef00:b52:2ad9:f357:f709])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442cd3b7dc1sm71403735e9.34.2025.05.09.06.40.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 May 2025 06:40:33 -0700 (PDT)
From: Lukas Bulwahn <lbulwahn@redhat.com>
X-Google-Original-From: Lukas Bulwahn <lukas.bulwahn@redhat.com>
To: Dan Williams <dan.j.williams@intel.com>,
	linux-coco@lists.linux.dev
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lukas Bulwahn <lukas.bulwahn@redhat.com>
Subject: [PATCH] MAINTAINERS: rectify file entries in TRUSTED SECURITY MODULE (TSM) INFRASTRUCTURE
Date: Fri,  9 May 2025 15:40:31 +0200
Message-ID: <20250509134031.70559-1-lukas.bulwahn@redhat.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lukas Bulwahn <lukas.bulwahn@redhat.com>

Commit 7515f45c1652 ("coco/guest: Move shared guest CC infrastructure to
drivers/virt/coco/guest/") moves drivers/virt/coco/tsm.c to
drivers/virt/coco/guest/report.c, and adjusts the file entry in TRUSTED
SECURITY MODULE (TSM) INFRASTRUCTURE.

However, commit b9e22b35d459 ("tsm-mr: Add TVM Measurement Register
support") also touches that section, leading to some unintended state with
the two concurrent changes of these two commits, i.e., entry
drivers/virt/coco/tsm*.c is still in place, where it should have been
deleted. Note that the existing file entry drivers/virt/coco/tsm*.c is not
needed, as the files are after their renaming in drivers/virt/coco/guest/,
and there is already a file entry in this section for that directory.

Rectify this section appropriately.

Further, commit f6953f1f9ec4 ("tsm-mr: Add tsm-mr sample code") adds
example code to samples/tsm-mr/, but in the MAINTAINERS section, it refers
to the non-existing directory samples/tsm/. So, rectify that file entry to
the existing intended location as well.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@redhat.com>
---
 MAINTAINERS | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 6dbdf02d6b0c..e8a21d6f89f8 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -24991,9 +24991,8 @@ S:	Maintained
 F:	Documentation/ABI/testing/configfs-tsm-report
 F:	Documentation/driver-api/coco/
 F:	drivers/virt/coco/guest/
-F:	drivers/virt/coco/tsm*.c
 F:	include/linux/tsm*.h
-F:	samples/tsm/
+F:	samples/tsm-mr/
 
 TRUSTED SERVICES TEE DRIVER
 M:	Balint Dobszay <balint.dobszay@arm.com>
-- 
2.49.0

