Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 671EA1AAA29
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 08:44:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743583461; cv=none; b=pRmb0orWbuu1IlAyL2HIfbj4A6BTX2bnIWTIk8N8oXuAibIJ6NOjCtTUb6txgVMrr7FiKgDL0ByQFH91NXsyQSISC+FUGjIJUTVxQE9XQ3TNu6SfFrlmKpuaEaE8UkqQh4YRp7J4iVAHGzXeHdP1Xn4eQe2HSOZlRRWGZ5Lfjtw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743583461; c=relaxed/simple;
	bh=GK0cE3xz50/nbORy/xXM8huvYEH0V94OY8UWdC/2KO0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YnEzClFBHM4dMbGWg1WyEDx57kOnkA9S1KtUoXZN4H3onlME182x4gEkNSMSIgB1uzMfRse1GQP/a7WaRoyeHHRSTwuSCVLrcJvh34xw9wBWe37TZIBE1vZ1pgLMZ4SYTCKDlBqK44hio7wCNbEdR8L68Q/Dsym6kcS1z81Iqb0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=cc4kd8sc; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="cc4kd8sc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743583457;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=RQ9F23d/E9HJNDDDljLarJECPDlSPcnwq/hZlSgkDp4=;
	b=cc4kd8scL2+Xpu5IHwau9qxxo3oK4wESHPxsdipsC0jr2PPUl2Vu4eXS6Qq7NbutUtCuo+
	XrsbNTJc8WvhDixhc6RQCOhICfd9dyU7809uwGt/UGjMlA3wA4nJJMyZEL0Kift2wabIZZ
	ErxjohAdrmlSizyhJc9tr6DdYKtRIJk=
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-492-0vJptXONPjyk0qntxp4IHQ-1; Wed, 02 Apr 2025 04:44:13 -0400
X-MC-Unique: 0vJptXONPjyk0qntxp4IHQ-1
X-Mimecast-MFC-AGG-ID: 0vJptXONPjyk0qntxp4IHQ_1743583453
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-227e2faab6dso103737615ad.1
        for <linux-kernel@vger.kernel.org>; Wed, 02 Apr 2025 01:44:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743583453; x=1744188253;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RQ9F23d/E9HJNDDDljLarJECPDlSPcnwq/hZlSgkDp4=;
        b=iW2UEa4l3iRMdDk+3V1GIaEv6jI2ZU9eBbgGgpX97sck6Kg9doQBvG04ldpgqBVWsf
         T23dhgt++pmi3wVzZipBmDFCNYO/DLrEAB4YLzhUWCzJW+MhH6BHsGXbj9dTWS5UbsZj
         igKaW1rZL70Iy5a6XBF5PdcZu74T7Gt/HgcjGK5G+s36xcT/5CERfCU7PqRsBOj3wfQI
         P1EaKy4/jFpy240v45o/MKK2M2W3NKz5AvxE3yAHg8v5QLPmx8b21trp/bkx0F70HdpR
         UYGCfuuIInVO/rfJowoKouVnRy+syQzFTQqShJRHZb/X04jmEecEUgsEhNtvj128ebP/
         LyWg==
X-Forwarded-Encrypted: i=1; AJvYcCWhdJyk6xYEneR/R3GrZRqjMXBoKgC2A0xtz5UZNyHf1Br2DXXpkOs7mSvWJ+QSa4H2PYvAf9+r6ZuVVV4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxpxjAsCufKtiohUB2MsTA0RsNtpRU+Ngf5N/Gzv+p9ai0TNLPy
	m8+4nnCj7/xc4JRB+udJuFip4Zs03YlhS3ZczA2caFLlhXDvgVSh3oVThIENLW15ajhhrnvczcz
	bHLIIhQ+yH8LbiVE2I6l9+ZRz2cxkEVMUrFQrnuGTFh9Z5BepSWjTsogYOznEdA==
X-Gm-Gg: ASbGncvy4eXQjTw/jkA7HDlqXyynOnKzFxMY/pQI6mtjZ4U7zMumGMpRlfYIoUw/Ofk
	F4C9DcdBEX+xHXCay6RyrzESzg7D2tVdFz9shZqngyS45LWthyp0NS2qGfxJT5TuM44S89QPF61
	X6Vab8IcP8/8X37yYic+jrrbzU1orzeau33iAzw6Uf+7WaVWHn+mYTVGnp6Qfs152APn3u57EBi
	UBQQ7U8F/hHVREPYbrvo+96ovg5bPxRnfn6WtFwnL+ESJgoB3PgElUWlZPGxvmY7t1DLsScHDuA
	3sGIfuuU5oHXLmby
X-Received: by 2002:a17:902:d2cc:b0:21f:2ded:76ea with SMTP id d9443c01a7336-2292f9d4e12mr213521435ad.36.1743583452649;
        Wed, 02 Apr 2025 01:44:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF6cYnX2gSNL4YcbMp3FSSrc8XCOSZrJOBdqY+cHTmSYJDx7efPUiNv5+ClDhwWFeSdIiQTdQ==
X-Received: by 2002:a17:902:d2cc:b0:21f:2ded:76ea with SMTP id d9443c01a7336-2292f9d4e12mr213521185ad.36.1743583452281;
        Wed, 02 Apr 2025 01:44:12 -0700 (PDT)
Received: from zeus.elecom ([240b:10:83a2:bd00:6e35:f2f5:2e21:ae3a])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2291f1f7394sm102202645ad.225.2025.04.02.01.44.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 01:44:11 -0700 (PDT)
From: Ryosuke Yasuoka <ryasuoka@redhat.com>
To: maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	drawat.floss@gmail.com,
	jfalempe@redhat.com
Cc: Ryosuke Yasuoka <ryasuoka@redhat.com>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	linux-hyperv@vger.kernel.org
Subject: [PATCH RFC drm-next 0/1] Add support for drm_panic
Date: Wed,  2 Apr 2025 17:43:48 +0900
Message-ID: <20250402084351.1545536-1-ryasuoka@redhat.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch adds drm_panic support for hyperv-drm driver. This function
works but it's still needed to brush up. Let me hear your opinions.

Once kernel panic occurs we expect to see a panic screen. However, to
see the screen, I need to close/re-open the graphic console client
window. As the panic screen shows correctly in the small preview
window in Hyper-V manager and debugfs API for drm_panic works correctly,
I think kernel needs to send signal to Hyper-V host that the console
client refreshes, but I have no idea what kind of signal is needed.

This patch is tested on Hyper-V 2022.

Ryosuke Yasuoka (1):
  drm/hyperv: Add support for drm_panic

 drivers/gpu/drm/drm_simple_kms_helper.c     | 26 +++++++++++++
 drivers/gpu/drm/hyperv/hyperv_drm_modeset.c | 42 +++++++++++++++++++++
 include/drm/drm_simple_kms_helper.h         | 22 +++++++++++
 3 files changed, 90 insertions(+)


base-commit: cf05922d63e2ae6a9b1b52ff5236a44c3b29f78c
-- 
2.48.1

