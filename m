Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4606A1519AC
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 14:01:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750082483; cv=none; b=MKx8NrfKpGAQ80JnLIxhOaIph2I3XQ24jySQ8bsMyopzpZLnHtmqtjktWPkTbniMloIEyZLzojWn3hBxriLwYvylu7mtkci7cn7rmxC/LQWazKpcTM+TmojqRdP5Y2brgZKdYl0sHhAtaYtmEoaoI/14zodJZa9g5IyMBEsYiv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750082483; c=relaxed/simple;
	bh=P+zPwJ+MHYBw3JSkhg0euCx0pEPKmCfHyo9z2ynCm3Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Vbz/4Mss5XWFvUUuOusnKe/I4TI8CL8pOI0Cah/B7h9VD/976SjRCHAxgIX8RDHx+VpuYhRDFX0XRdtpJSDKYPnDYJsDNMvzXCgUefYY7rZ63T1vfv2ZieZs8pg6XN0vPbYJKkZs54A9z8AKVZ/Hir7ElpFltGOckvw9irqLmhE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=SA96jLrE; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="SA96jLrE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750082480;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=yCjumndBh/FcztSBAz8+g2GXo44t1fb+ZLhKBRZrEb0=;
	b=SA96jLrEjwm1i+fNiwicTm7J7tH8O/8d4pBpzdDgClRHPN0310s9qWejneQyv7B4d2Z/+g
	YEKWbPGOLnXUJu1Jjo3jo13ZVA63ukCie5wuR8nQDxarOBunRcKtdKjLjeIYMywyCZgyLJ
	dW8vfcujP3cMyQKaWw+DEPpSBjDUKig=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-540-D-oKni90N92lvVhNW9gCNA-1; Mon, 16 Jun 2025 10:01:18 -0400
X-MC-Unique: D-oKni90N92lvVhNW9gCNA-1
X-Mimecast-MFC-AGG-ID: D-oKni90N92lvVhNW9gCNA_1750082477
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-450d244bfabso36765285e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 07:01:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750082477; x=1750687277;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yCjumndBh/FcztSBAz8+g2GXo44t1fb+ZLhKBRZrEb0=;
        b=hScfhQEmENur9hrJe3lmn28Xnp2FcD3wyz0qcwfk6MNTc1bHUU8uQt7ghgonFAtgBM
         WpG1hcZuSG4W9la8rQlm1jfrq8c1rOmrklDcyI+QoPOE9p5rWbtQAur6jfycqd21bFrJ
         NAF0knKQWfzBS7bpGViAzCAjfLJ83o5f1SHDhi24HRuW9MbXSoqLQvX777T7tXZsIh9O
         sy5ANB/tfbgJz/GJWeoAEM49f1QhHF//xYQK/h+h3vUezLj+5SnldfvWRNTDwCMcYpkk
         E5UDDDPVQyXVpAFD3WB43gk7SVx1iNq1dkQgYqxDc1u5hCvEUeWAbUUBZ3fLqaQ2fUGd
         0joA==
X-Forwarded-Encrypted: i=1; AJvYcCWzOYIskNbwAH+cEez5B79YwtQ/ygcNcRxDv0J16XHWPUXbDTWm/mLtmdi1lKXcV2PRwMzLZFZQrM1KUcA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxR8d+cEUVfE/xAtVh/BWzME7nC0VQBGXMtEqFI68P5bT97Kpmy
	IduJQOMvrUDP+Hj+H02eU5rZ46oCMIJMSDymU9Vm00zqfiulEGgKvdl//R1Xhs2mwTpTN+PumBu
	1Y7UmLYiihKsSuOQGmGoeuuvs6M6bmBsu5WtNZsieO3W/mX+1YMnhr5axNnYxMEsnCg==
X-Gm-Gg: ASbGnctcAW4OQHD3zvCY9rRF5YucMG8vQeVMvzxYQac/3Wp60XdQ/OjCiM0JoSA2woj
	7T6Nkmu6djcB2MfDemkGnyVvucp4/ddhD7TuDr2P0q3whcHKwk1WFOb64C5u+6v1Clh58WoVkYB
	816b35YIy0o8GvOyTY4aW5ZNKXxd6nUTdP60itG5T0o6lqkwIV26cOVf7R5OHsvwjEc8/WzVSKi
	1CFgkU3XdmdzkTprOqYLhCvB5LfT+mY1S2TMKk6WlaSMqSv2RwiUQe1jSGNeerTeqYtTX2aFtfB
	oXWCHmEHnHnvnCXynPfiElgvDMQAiXXUdUhYdWHVp5NYR3FlEkTNWNi7/5KjGPTXYbmALA==
X-Received: by 2002:a05:600c:6208:b0:453:6ca:16b1 with SMTP id 5b1f17b1804b1-4533cac2cdfmr71714745e9.26.1750082476293;
        Mon, 16 Jun 2025 07:01:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IELrHqsFCSRF5sOJVf+SwmO3E4ppjKiAUPCBq6zAgvHq6fLkivA9kdCEj31kWz9k6xL7u5IUQ==
X-Received: by 2002:a05:600c:6208:b0:453:6ca:16b1 with SMTP id 5b1f17b1804b1-4533cac2cdfmr71712865e9.26.1750082474384;
        Mon, 16 Jun 2025 07:01:14 -0700 (PDT)
Received: from lbulwahn-thinkpadx1carbongen9.rmtde.csb ([2a02:810d:7e01:ef00:bf5b:f273:a506:f71f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568a60f5asm11071883f8f.25.2025.06.16.07.01.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 07:01:13 -0700 (PDT)
From: Lukas Bulwahn <lbulwahn@redhat.com>
X-Google-Original-From: Lukas Bulwahn <lukas.bulwahn@redhat.com>
To: Boqun Feng <boqun.feng@gmail.com>,
	Viresh Kumar <viresh.kumar@linaro.org>
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lukas Bulwahn <lukas.bulwahn@redhat.com>
Subject: [PATCH] MAINTAINERS: adjust file entry in CPU HOTPLUG
Date: Mon, 16 Jun 2025 16:01:08 +0200
Message-ID: <20250616140108.39335-1-lukas.bulwahn@redhat.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lukas Bulwahn <lukas.bulwahn@redhat.com>

Commit c7f005f70d22 ("rust: cpu: Add CpuId::current() to retrieve current
CPU ID") adds the file rust/helpers/cpu.c, and intends to add a file entry
for that file in the MAINTAINERS section CPU HOTPLUG. However, the added
file entry is rust/helper/cpu.c; note the subtle difference between the two
file names. Hence, ./scripts/get_maintainer.pl --self-test=patterns
complains about a broken reference.

Adjust the file entry to the intended file.

Fixes: c7f005f70d22 ("rust: cpu: Add CpuId::current() to retrieve current CPU ID")
Signed-off-by: Lukas Bulwahn <lukas.bulwahn@redhat.com>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index ec49e1973425..c23665ac3b3d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -6263,7 +6263,7 @@ F:	include/linux/cpuhotplug.h
 F:	include/linux/smpboot.h
 F:	kernel/cpu.c
 F:	kernel/smpboot.*
-F:	rust/helper/cpu.c
+F:	rust/helpers/cpu.c
 F:	rust/kernel/cpu.rs
 
 CPU IDLE TIME MANAGEMENT FRAMEWORK
-- 
2.49.0

