Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B70B239591
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 12:51:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743598310; cv=none; b=m/44qqVsA2tmsTQLZS6ti6FkdlFPwO3QeXFez5LX9YYrTx4vYBmnPPg5bxrC+hshgczgRWBnS+aN1lvZ/1CZ5ZznB2GuSF2lnupMEyAyUvYtm10P1VMCqNLFsR0xqEkidm+oD4zqP9e9qBZd0zyEHK+syyLBdcR58rh007B9/dA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743598310; c=relaxed/simple;
	bh=8IL/Ra0pO0weo0T0Jdbi6Z7WKIY/D3v+uDgImwBhRSc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tsQMe8DkA84l5SvKLbhymdI6bwCeSTXgzMwEAiUdGdzAUkDOHSs2mlGXHTRbUx1u4lrsUhd/TEEsoyWNExy3MRp+A1oERRiB+oku8eznzHcQ17XmNMQ2SDXaVJ/Wpv30kB1wlYazBa3hD/zdLhrizja2uSqXZOEor2WBzwv9O24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cSWiYyal; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cSWiYyal"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-43cfba466b2so66944445e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 02 Apr 2025 05:51:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743598306; x=1744203106; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/r3cMncWG+nY/YBhRc114Qo+8DX8tI4MejL3tdVmr+0=;
        b=cSWiYyal1aLjwX8L+uH/lV5kznic6GRUJruaSDAMvt3eShewpM+LNgE6XRgIlCcVd4
         K/ZPZeWAOBcax7EPDKgjKD7kV+cfSO32V/AYcToH5Fl/4nEJ/B1HRsHI00R1V6NuSJcZ
         oiMMp5va+61HF0K9JLirzzj09Kjjo8TxEB5QbX+8ay66lR7I427TrkPz1ZbWmaGy41lk
         UQNso7tFum+GB4R6XLbOPuFO5L2h46Yg8KxeXWLloEx4qvuFyP0HJr0Ux3dLGst2ooEH
         Cnxj/5gbEJDfJ8eElZ8rniqZ5FAlxAYKuHwdZfBhD6Uau+6pMgDyE9x304a52m9VlOZN
         PHYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743598306; x=1744203106;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/r3cMncWG+nY/YBhRc114Qo+8DX8tI4MejL3tdVmr+0=;
        b=I3IGCd2DDNRXEry7llamjSlkj0eW3EBJj5WDNpTG0Cco1Fn5JGCmU52kAiT1h4gS2S
         Qn8MgfI6O6s5PWnquAjvwLnP18/So/eti26S3ghv+CldER0FEd59UCCO0njXF4+V0d67
         8RhXCxJLDnwG3fMiPpCnFstf7hzoZIG8kbmcSdoPIl4MJFOn4uedGb8rZtBSw9rL0cCs
         AEX2/YELO9iVujWr6oQPAWvBAeuqRHzFh8kTXcYwpGq5tMk4VdmAf0fY4ABeTzFSe2gJ
         cQ9MkfzX/7tT/ZDAzEftMGZlaVY2mH1NuL71RDmYSjKMokoPl1yAtCIjOHP1ATq4cNok
         qmuQ==
X-Gm-Message-State: AOJu0YydY99s8ll4rHPsvCrHSQwDLESXw0IUvg2pA1Pg3NczXP3Y5q1Z
	9ERWqLydXeYdCKweOV/ATwS5tKZV5eMeH24s7L3bK9DRNTVUhoXTERgYJw==
X-Gm-Gg: ASbGncvgsGdBlaFH4/alLlzJ5XIGXwEp0Os8bH6/OnloyjrP6ghCmcaSMDKaxZ4qs8k
	sw6cIhTAI3FktotFW9qrp9SeDqb3o9GIdtNPz0YdKuIPqSSnNYxJ0eEoQnJwPpjizxgCHfhbTKb
	T5DoJmLImA/+/X5z+MAwq0tVLXWqCmT5TcKo+6hKqaYSy5hdxdhXl+Ejq4cNvtkF27uMziN6QAa
	HIvKB78TVsEvrtBDKJHkmdxRD53u5qZHc9eiE6x/LRhCC/FtsfvyuLK7VJc+KT4hkTNEFfaFFjB
	LOtzB3O7qBTwgkIYCOC/iOthN/v6IfeV1A5axC8i0QhP0uSunM692D7NzJgM7v8Mrpc=
X-Google-Smtp-Source: AGHT+IHwTMkfqRSkZ58Yan3MebJBkTAOwyrfLFB3Jty3X3VWWLSJM2hTRFyCsjAcnBT+qa17ceNzhQ==
X-Received: by 2002:a05:600c:1ca9:b0:43d:762:e0c4 with SMTP id 5b1f17b1804b1-43db8518c88mr105724715e9.27.1743598306169;
        Wed, 02 Apr 2025 05:51:46 -0700 (PDT)
Received: from localhost.localdomain ([145.40.144.104])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43eb613a7edsm20452575e9.38.2025.04.02.05.51.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 05:51:45 -0700 (PDT)
From: Chiron Horwood <chiron.developer@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: kuba@kernel.org,
	Chiron Horwood <chiron.developer@gmail.com>
Subject: [PATCH] CREDITS: Add Sam Moores
Date: Wed,  2 Apr 2025 14:51:14 +0100
Message-ID: <20250402135114.225731-1-chiron.developer@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit


Thank you for reviewing this.

Signed-off-by: Chiron Horwood <chiron.developer@gmail.com>
---
 CREDITS | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/CREDITS b/CREDITS
index 5cc36686d0f1..8af8f71d450d 100644
--- a/CREDITS
+++ b/CREDITS
@@ -2857,6 +2857,12 @@ E: paul@paul-moore.com
 W: https://www.paul-moore.com
 D: NetLabel, SELinux, audit
 
+N: Sam Moores
+D: This section is dedicated to our beloved friend Sam Moores who tragically lost his life
+D: He loved using Linux and was passionate about the open-source community
+D: He will always be forever in our hearts <3
+D: We love you Sam. From Chiron, Freya and Rosalind
+
 N: James Morris
 E: jmorris@namei.org
 W: http://namei.org/
-- 
2.49.0

