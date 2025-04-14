Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19ACE25A2B5
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 09:31:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744623093; cv=none; b=jQlE963VbZjd+1qFACgE962GJW4zXSnSwOj3QkAHwkkvkGlps8vYw7GJ198ed6wOHYBbdBKamwc0yvRk8KN6Zbc2/WSPi9TTSv+YHmpL+ntggfAsg2aUQ/tmFDmDyPzXnRwYuBCJybcyQw7UBhOSw+fxfDhvNPji8ZxC91eeaww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744623093; c=relaxed/simple;
	bh=WEfGh8/JZ50VI42QY/UzDVj5QGsc8xf1TZieBe4ZvGo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CrdVFFAGD196xev88lam40l5AvvWSxMXtHsPzwCx7frCtDWJQkDqXY+ADr8APx5kwbm6KPZFkahYEybiEEuBCiHMe5mFGB/3rinFZTM+L8U48y5IhaXqc/+tauNJ7fsrFKniGh1SGdg3hEITHY4UCeneofO+mtb7wboi02HqJmY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Ps/lJyEi; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Ps/lJyEi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744623091;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=DcJtOZqqmGG/GNqQfI/h8Deen7z+Z9B2I6ayBe0ZS9Y=;
	b=Ps/lJyEiHcskBVfeonzxNiqTMF4q4OhkqNEoTdP7+tAzXpAA1jBuDyInZhCZKFpS/xMPte
	CLoUOrZr0t6/PMFGic1P7eANHyORkC0mkC00Y1ILx/CpO1gELaxWPT0svu4f/bQwKeTb4N
	hDIkaQE2ANZOoFnKVN2FQFWhg7auMbU=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-244-0pm7U3p3OVeN7-3xW32TGQ-1; Mon, 14 Apr 2025 05:31:29 -0400
X-MC-Unique: 0pm7U3p3OVeN7-3xW32TGQ-1
X-Mimecast-MFC-AGG-ID: 0pm7U3p3OVeN7-3xW32TGQ_1744623088
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-39143311936so1560311f8f.0
        for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 02:31:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744623088; x=1745227888;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DcJtOZqqmGG/GNqQfI/h8Deen7z+Z9B2I6ayBe0ZS9Y=;
        b=RVfG9lTznJ62U/TQPmB4wu5doD+xTEKY0TwdstOb1zlTAMxdAt+S9NXmRZdsiWaPwT
         kuom4KB03ip2L2SnCAAEt764IpGyW/ilpnP//VODQbc3WFv2ueBoh5qpp+56oOftjyVj
         J8QR+F8CbOZla4G+KJnxrTBJxJLzAY0ZUsG8fNbImi2ekp1Arm4RoPftZKV87CpOdC34
         T5kJy66jWQntUotgRtWjaRXMXCue1nDg8woTEa+xCKSGYK9C//Ahk6Pw9BiVJ7ZUjqUo
         iPV00R9d/FvIrmNVr+c1b4FZXipe6TGMVfJnfbHolYucnWK8oD3N/BExOO4DodbL/aPJ
         Ik2g==
X-Forwarded-Encrypted: i=1; AJvYcCV/Q+upu39OC/gT1nkuyxk0eJ7AvC4+gj7m1B4Z9hdN8NyaQrWUzV8G/tkBwRWEWiISIpNLtLT5IXW7Xf4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8alruqdqNHOUykpQjHgllhW3HnSs+XBY/wUURrAy7wuK17zLS
	jMCkcVqROjSAJX0E9SvTN1B8dhJfrlF+UdKJBw/2nW2TKEPVaTfZkBRyusGFw5OT5BsgSRVm+I9
	ydvUVEY2aBj2gJgor5dXfKJlqdeY53pB8TD9DHoUF9UtmGP3//6zkGRiRdS1C0Q==
X-Gm-Gg: ASbGncuCs38+g2+QmR5NeSJlKs4FuKmLjKfRjbwiXGz1pn/y30/wxRuSsFCvdQw9Ijq
	e5ogoOHLAj8Yf0/S5mHV3YMD9yMUlcgc0lRw+xsDAX2gkZaUgAV6M7I7zDVrjbyOe4HdOMesDCP
	vMtvzeMMR/lIUr7JmQq0ruFUxNHvUXN0er0B8IQYPG/5uM3S/sw9t6Hlt48hlO5vHkqtYOi1yV2
	iO6d+iaTCdFJrHPiN4Tmgtgy8f5wAlhFQx3vyarWdEcmtroQqhtBz/Gk1CPh7d8VoHa0eRiQvjs
	n2aQI0h1SijxPl1IPCpzHdCyuVYpYgZ1P+f05LlDGqyPRD1ViIkB6B8cHw==
X-Received: by 2002:a5d:6d8f:0:b0:39c:dfa:e1bb with SMTP id ffacd0b85a97d-39eaaecd89amr8181807f8f.42.1744623087999;
        Mon, 14 Apr 2025 02:31:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFIf80qJHQp64UqJH+NY2wPEKUU4CFrtiWzV4xC6O7YO6zvGgMGZVZiou6pYI9qUGO0MpoZFw==
X-Received: by 2002:a5d:6d8f:0:b0:39c:dfa:e1bb with SMTP id ffacd0b85a97d-39eaaecd89amr8181783f8f.42.1744623087487;
        Mon, 14 Apr 2025 02:31:27 -0700 (PDT)
Received: from lbulwahn-thinkpadx1carbongen9.rmtde.csb ([2a02:810d:7e01:ef00:b52:2ad9:f357:f709])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43f233a2a13sm169193675e9.10.2025.04.14.02.31.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Apr 2025 02:31:26 -0700 (PDT)
From: Lukas Bulwahn <lbulwahn@redhat.com>
X-Google-Original-From: Lukas Bulwahn <lukas.bulwahn@redhat.com>
To: Frank Li <Frank.Li@nxp.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Patrick Havelange <patrick.havelange@essensium.com>,
	devicetree@vger.kernel.org,
	linux-iio@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lukas Bulwahn <lukas.bulwahn@redhat.com>
Subject: [PATCH] MAINTAINERS: adjust file entry in FLEXTIMER FTM-QUADDEC DRIVER
Date: Mon, 14 Apr 2025 11:31:24 +0200
Message-ID: <20250414093124.19683-1-lukas.bulwahn@redhat.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lukas Bulwahn <lukas.bulwahn@redhat.com>

Commit b7549ed5edc6 ("dt-bindings: counter: Convert ftm-quaddec.txt to yaml
format") renames ftm-quaddec.txt to fsl,ftm-quaddec.yaml in
Documentation/devicetree/bindings/counter as part of this dt-binding
conversion, but misses to adjust the file entry in FLEXTIMER FTM-QUADDEC
DRIVER.

Adjust the file entry after the conversion.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@redhat.com>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index af3537005de3..661419d7c71b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -9216,7 +9216,7 @@ FLEXTIMER FTM-QUADDEC DRIVER
 M:	Patrick Havelange <patrick.havelange@essensium.com>
 L:	linux-iio@vger.kernel.org
 S:	Maintained
-F:	Documentation/devicetree/bindings/counter/ftm-quaddec.txt
+F:	Documentation/devicetree/bindings/counter/fsl,ftm-quaddec.yaml
 F:	drivers/counter/ftm-quaddec.c
 
 FLOPPY DRIVER
-- 
2.49.0

