Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29A5342A94
	for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 22:18:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743459538; cv=none; b=sTo2kvEFegBLQqM43oyAk08JDg0xnC/L5xfolUYQdkeNnjPTmIzHYvEpE4HwZBANytAsmTwue4obgOA9fQNocga814CPPpY/3jjQYe+zSPtqLSP1m6XeyiN2C5+ZuuanLJztervJ2olg351IeKFNx/0wfviI+Gxs1J79a91G5eg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743459538; c=relaxed/simple;
	bh=Sq/lHqzKBJX9vUWqQixxyY+Nvpc95yRL5aiI8/D7+Js=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=OitppMBdclOr+pRczyP/oBSFcoD8TH5LgoVKJdJss6eelLa51ydn3YCUaks2OFVynvi6QupDcDqE6jNxxbrK8maU8cxJVAK3H7so9GfoBAw/ft2M4NhbNgcabJYplPATTKUH0U4p+UQmzWJF/RweFo0ybOzYiXhYEAvgffH5ftQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=WK1Lu5TX; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="WK1Lu5TX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743459536;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=iITEQ8m/+1n7Y9VKquwua3X7ZRDPpcptdjSbJeo6HRE=;
	b=WK1Lu5TXScKp6s3PMQBbdy+SHhhQUiuAuQOYhH/rUyZlW+eBlG1lzmDQj1M0RK/RLdaHVK
	h/x1eowIEw/z/GuQvEYJdRrexm8yeFTrGi65fjM6CkEtLZii697GeydlD5l6tKIy8lv3SS
	6ViJAIba7kCcgIQWXMMVH/Cpogln7MQ=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-423-R4k5jFvpNiu98D-pKLTfKw-1; Mon, 31 Mar 2025 18:18:54 -0400
X-MC-Unique: R4k5jFvpNiu98D-pKLTfKw-1
X-Mimecast-MFC-AGG-ID: R4k5jFvpNiu98D-pKLTfKw_1743459533
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-3913d8d7c3eso2559438f8f.0
        for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 15:18:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743459533; x=1744064333;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iITEQ8m/+1n7Y9VKquwua3X7ZRDPpcptdjSbJeo6HRE=;
        b=PiUs//dMmnEdH8waLmvt+ztTos939fpfetzl+Q96sCRbhm0aYMBn6JfWxXeNFwJOxT
         lxW2uk4vFQirb39MKQAriheQGm3oTu7E7OyHHfsowdpCMj400WKzvRVSUwIo/4/e0K3R
         aGOXNWJAypi6LjVHUKgSRmwu7gN0OOiU6JDcazpJR4AVn2gmNFvcR+nPaPSrQZJIsyAy
         2No/MArf/mSDKNjbv2RXPci7iP3irIXkY5fXNtRHamvxRWOdm82XCmvrL/O4h2YfludJ
         0ytC7eGtsXhZqU4KrUWv33LhARSeB1bGR/KmjZEjaxF0iGI5a2iSghAbbZXfbLZU025X
         rFUQ==
X-Gm-Message-State: AOJu0Yx+D3gDBP3pCehn2FAgRb/ZRzWdqfUmbbz9z1G21QTjiyidKYBh
	hqrGPRN7PEvjd+2RtEVf0VCP3d/OcTEArV9WV3VRCg/mY5zZfU7ueUIV/FLM55aiNm1AlCWJGLA
	FA03TqhuYVzXRyYkf8C4ZPrY8jLXuc/ywKQ1sBK028n4HO4oJWtIlJuQPvzTRLadqTssYKkpQzi
	vwtr/nF90DX3DkuhCGK8HTKpxBvI0MgDOOd8NkkeIPbLebQQ==
X-Gm-Gg: ASbGncsIIO+vINFfFPavr3TxKgXP/ZWNSvHU7LaKHRpzJPhW2vcOJFBdIXJg1Oa/4tg
	zLWnSSc4sCxPVEDj3lIReeea6YdNj8FUJuiyicdTDXxMhXhpTSGsHy0vEbQPKmV3lfiPPP2aYsl
	+cIHd0Z4EQZgaIq/8+n8LvUsjG3NU/SLNQ8jAXhDQ90J6mh7mSCeHk4HAzKD76Bp0zVK0q01fCm
	E7SqesK2IeN7z5PhxKkfrwcmKcCpkj/1Q3PTLhGtbvcmPQ7PeNuLg8guCqVPBg+pS7EP9SUhmYD
	Sr7Q2rX5KwvMHjEJjw==
X-Received: by 2002:a05:6000:2a2:b0:39b:fa24:94f5 with SMTP id ffacd0b85a97d-39c120cb51bmr7032569f8f.7.1743459532959;
        Mon, 31 Mar 2025 15:18:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG4S+/d4JTKy4IJo7qK99V5Xegqrsg28QeJcnUzqDCSkq1U4wV6u8m5ArteNUmEheoqOhZPEA==
X-Received: by 2002:a05:6000:2a2:b0:39b:fa24:94f5 with SMTP id ffacd0b85a97d-39c120cb51bmr7032555f8f.7.1743459532546;
        Mon, 31 Mar 2025 15:18:52 -0700 (PDT)
Received: from [192.168.10.48] ([151.95.105.0])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c0ddeecc9sm11183248f8f.83.2025.03.31.15.18.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Mar 2025 15:18:52 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org
Subject: [PATCH] selftests: kvm: bring list of exit reasons up to date
Date: Tue,  1 Apr 2025 00:18:51 +0200
Message-ID: <20250331221851.614582-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 tools/testing/selftests/kvm/lib/kvm_util.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/tools/testing/selftests/kvm/lib/kvm_util.c b/tools/testing/selftests/kvm/lib/kvm_util.c
index 279ad8946040..815bc45dd8dc 100644
--- a/tools/testing/selftests/kvm/lib/kvm_util.c
+++ b/tools/testing/selftests/kvm/lib/kvm_util.c
@@ -2019,9 +2019,8 @@ static struct exit_reason {
 	KVM_EXIT_STRING(RISCV_SBI),
 	KVM_EXIT_STRING(RISCV_CSR),
 	KVM_EXIT_STRING(NOTIFY),
-#ifdef KVM_EXIT_MEMORY_NOT_PRESENT
-	KVM_EXIT_STRING(MEMORY_NOT_PRESENT),
-#endif
+	KVM_EXIT_STRING(LOONGARCH_IOCSR),
+	KVM_EXIT_STRING(MEMORY_FAULT),
 };
 
 /*
-- 
2.49.0

