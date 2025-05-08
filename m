Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE3FA275103
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 14:38:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746715111; cv=none; b=KWZatE8yucuNuYMBMsXLA6yVvaHDOuQ0xYF5lIRF9PeyfPLGvyAnLG5FutKpr0AoHv0Qb8tUCK3DijhE2X4fW4g+d6KVmVEmL+q92tHQSy8Ascsb3b/+/+LrSKZu7KUV+h3GUlQAPezhPH+PkNa+HvgYXD9B9IKUcvQFI6kZt7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746715111; c=relaxed/simple;
	bh=h8tLLBwmVHhXzcY4CBxkKepNse0ipgFBVtL90XUegXI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bq9eaYbgJ84ZBTFjSOyEuE8LT2LsPbCwulsm1nTc1LdPn4C4UDC+CeXfVaZ2ti/hRP+xsIb1evOcH9FFXfW9iCAca4RxbAftMyor50aa1jbmMAOGsSVdyq9J66DnAyfmFs1TCBdvtF41lhpuxskQNMOUpDNAdGqPcPVIj9/1YDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NY0N+TNj; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NY0N+TNj"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-ac3fcf5ab0dso177007766b.3
        for <linux-kernel@vger.kernel.org>; Thu, 08 May 2025 07:38:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746715108; x=1747319908; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fV6z3wEsX5jPniERvxweY27+ZB3ZDQ8SXlFYiQ3tpqQ=;
        b=NY0N+TNjPPx1a+wh1d+T5heGmgcgvjcZk/sigc5JbrXig1E3Dpjw9LfLsayRc9WnCm
         LDIOmb5gyAIVqoPwE6Y+0LXwWSGr/+FQtYVJ+i0ae7yYdBmpeU9pyhWidMQ/TnYW42Vx
         sDQc0A2JfeDhQ9xYggek8YUe2hg/K+28O6TXIzj7jgI7279hiqeaU3xZJ9n7hQmLg/F7
         F0l8k3f+ze+4/nKeAnO8iDoG2FuaNgduP3EwQtD7mC0CuE5geT85MREnJ3W2xMx9xgXp
         eRp2eYDjb/5swRCFwZwn2IfbCwZZiRPi9c+hZZmYa1nkXsEx+gyNmdzAA8ROwSZID/XO
         DTsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746715108; x=1747319908;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fV6z3wEsX5jPniERvxweY27+ZB3ZDQ8SXlFYiQ3tpqQ=;
        b=BWfIgvijocPz4O9leHZD/A+m/zQr6KreEf3yxVFwjz5ewc1cJoA/uJHreQq+O87yy0
         MMia6/NRcEAMbva3NPTiD63TNH5Q1T42EoopvI4yVQrbwaVzfcQloSZOrbsyjAj/TPs5
         TUs1EnASAU8u468Ogn1pubZG7GLOSPtaYMy/WvBva69y2Z2TlnEOYoll0Cwy/IludhDU
         +fpmPGiZHfTK1c+ZjUMI+j3puifaGoiFHllYuEiwX1CLUn8XmaPKQvxNI6j5a4//xks6
         I7UO7ye/CkJJf3xjfa92klCct9CvOk19X0VLONJ6+icqQDjyPmuJNONQwoRcKEQCWzgV
         mCcA==
X-Forwarded-Encrypted: i=1; AJvYcCVGVwG4SViHQJPas5M8xD372E1qLLs6xGSVogxjkeWQKeY/9A1Ho5NlOB8EXXf+FKoJnakRK/l6di0DBxs=@vger.kernel.org
X-Gm-Message-State: AOJu0YxTc/2+rU9Wa63TaevSlZjEFrI4WEfIqvfoYpYWjbod4UxxkYb6
	mpCwQ/iD6b0GtHdMhJh/kVcSVoyQEXpy803H8Sf7wXgPv5Q9ICHl
X-Gm-Gg: ASbGncvlfJ+k3P4jqCGhfqyHonPh0pzr/PQ0i0E9a1ceXmDKygpAsydqXlNaGp9GVUz
	DUytCTm9uaFzw+K1TG/XUXv2eCY9q4vvK+w1AJ58ZvGQayeq01rY3oX9/sdPj0T95Zpc4eGZQhB
	zVbhYICywXk9xjPnzK+206NE03rracjDteVu4WDUx326U7Uu6ri7FluFm+zuT3R0m3mqpSx/s11
	idl3k8KLcXNEMJffvJpODk958mdrDMupCaGgJKKKhJt8IRlmRiSAkWcPxkSXkc/0HdaeYQP2+LI
	UoP2MtnN2EEu1NsK+BS0lDIpORcfCssC8+5AQBaUyKXK
X-Google-Smtp-Source: AGHT+IGDEN2MbBlmq0bIZCAvWn5aWPjDhiXBhWQm101mbZ/4tXMirT6r07+akmrhMBuysPGpzBv+ug==
X-Received: by 2002:a17:907:d507:b0:acb:39bb:f880 with SMTP id a640c23a62f3a-ad1e8d2c8cfmr826276366b.54.1746715107907;
        Thu, 08 May 2025 07:38:27 -0700 (PDT)
Received: from wslxew242.. ([188.193.103.108])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad1ed2f588csm334443166b.42.2025.05.08.07.38.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 May 2025 07:38:27 -0700 (PDT)
From: =?UTF-8?q?Goran=20Ra=C4=91enovi=C4=87?= <goran.radni@gmail.com>
To: alexandre.torgue@foss.st.com
Cc: =?UTF-8?q?Goran=20Ra=C4=91enovi=C4=87?= <goran.radni@gmail.com>,
	=?UTF-8?q?B=C3=B6rge=20Str=C3=BCmpfel?= <boerge.struempfel@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 3/4] MAINTAINERS: Add entry for ULTRATRONIK BOARD SUPPORT
Date: Thu,  8 May 2025 16:38:15 +0200
Message-ID: <20250508143818.2574558-4-goran.radni@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250508143818.2574558-1-goran.radni@gmail.com>
References: <20250508143818.2574558-1-goran.radni@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add a new MAINTAINERS section for the ULTRATRONIK BOARD SUPPORT, covering
the stm32mp157c-ultra-fly-sbc.dts board support file.

This ensures that maintainers of this board are properly listed and can be
notified for any relevant changes.

Signed-off-by: Goran Rađenović <goran.radni@gmail.com>
Signed-off-by: Börge Strümpfel <boerge.struempfel@gmail.com>
---
 MAINTAINERS | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 183083ead1da..7ecf6a796d25 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -24844,6 +24844,12 @@ S:	Maintained
 F:	drivers/usb/common/ulpi.c
 F:	include/linux/ulpi/
 
+ULTRATRONIK BOARD SUPPORT
+M:	Goran Rađenović <goran.radni@gmail.com>
+M:	Börge Strümpfel <boerge.struempfel@gmail.com>
+S:	Maintained
+F:	arch/arm/boot/dts/st/stm32mp157c-ultra-fly-sbc.dts
+
 UNICODE SUBSYSTEM
 M:	Gabriel Krisman Bertazi <krisman@kernel.org>
 L:	linux-fsdevel@vger.kernel.org
-- 
2.43.0

