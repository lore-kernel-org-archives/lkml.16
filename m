Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E958B27E7CF
	for <linux-kernel@vger.kernel.org>; Sat,  3 May 2025 20:24:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746303885; cv=none; b=PSG52M4aOhf/9Y6yNARZ0sher4cMVHR3wMa54ZDkKcmIVRd2CbLcwt3FRP95gDWjaj4CgCyFlYyf0rqXsoLLpl7nzUYc83POxqCiYP7R7TS8Kr0XE8/BdA0cYn/8M6eJGxPbnU42inhfguFW1GEJF0bOwPqcQDILaIyYjx/tdhg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746303885; c=relaxed/simple;
	bh=TAHJwBNAeKqo1+l0Pi3fM8ptzRKXTosNkFT1juzLK6s=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=p82i0qwuBArj+PUXr1PE835zB/BGVyX42Wm6/5D/96s7ET0JNjMVXmfp46hZeVRmyj/TBLmagbAJzHrAGFH5hPwXFfF2kC+CVUcjFy2u9uhLXFszxn81vpR+gI1tZrZGY1E0qR/8B1aVgNaZJY7hEK6MlrTeDzlJDNQVJGTc8zU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CR6yrvdv; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CR6yrvdv"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-3014678689aso2536926a91.0
        for <linux-kernel@vger.kernel.org>; Sat, 03 May 2025 13:24:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746303883; x=1746908683; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2q5uKd3+lJbLrPjBN/39c8sZuHCSfc1w3O06tTdCSIw=;
        b=CR6yrvdv+fMbwLf8+aB/Le1uWKTTzh2+pcvzq+60yGJ+20O868XS63AGZGDHj6KZUZ
         9YBEA4spZnkD4oaLSSlJRfA1Q9QH7y55ppjVTNzVur3sdCNATKT2qZo0lKmrNmL6/YG2
         jnhSSoQdKzAtGfMbkiuQS8u3uBXrGB6No9m6jOhZPsK5uiRGYPRgND8txOLxUW6814yE
         YHUh1ZbA22QGclo74JNEGPyd/RPEb30jCgLnMDYLM7jZWAGTp5tG+8TAPW2QqrwxUwFL
         PQdkvRLK+LPnUvgXmqJR0hqQNpnCU1HyC/XZd7CoPhjpTeSh+ZHFfvO/RZO12ZELnA+b
         373Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746303883; x=1746908683;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2q5uKd3+lJbLrPjBN/39c8sZuHCSfc1w3O06tTdCSIw=;
        b=i1yPvmJ9kac8zFM96MG4DwZ6HlimgXOWato6s5BZLBxKv72D+FOscADERO2UXX2Ygo
         VVJBPOlqsQUJLksesZBkT9wcPXjQ0DXqp5rklaMAcEy3Fsv9qnKh0WjOPq3Z2ZanM41t
         45tRB7BnJUi/ylyYaLSCSF0rEOMg3j9rrWNucA4NbptVub/RooomQpGMKcUOrFLuygGu
         gRzR7OnRHuJMy/Rx2e4WoTGonfqCiYT6NlU84HA+mD6iRd0VHISf3+OuCe0dAkrF8wit
         2W8OdUDag2nuzAh1dKH57nCIrJsbE4qpHWkMhJfhFPrAg3tN7VvItVFed6HL69nPmaIy
         EbsA==
X-Forwarded-Encrypted: i=1; AJvYcCUq65uojJM/x+QgO33mG3I4eE6G1iW5xAA6OaX1nn1DSR3Yzv8QjtIxgsosZmkd/WVVBR7HnkDfzqO1RGY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxa8t3WVraf2KxH+ryz8NgpR9U9U7fHNCjlBQupm7xF6lBDMdhW
	DpcO/32XkeFzFuO8eUbR5r/SQeGbbcQRnDgjIWYxsS7BBNodnuCs
X-Gm-Gg: ASbGnctAw8sK+EYutACkTuuLqcfkuEZXN0UCUjfYpo66t8E0xRE+KnQlAxzQEIFcrA+
	d3cf+87N+XacUt5WRNg+W4BVMZb+bnne6WHj8S13OAiTWYdNYg7UHTdEPaDUT5eiMgnSZ2g+qJ8
	oVH1BrZ/m2CgMLvdXqvNIOPEwmbPxiwNwk+/px50MDrt05OGGT7a7KMMCSzukVXOz3y7CFD/gTm
	A2Bh61Ij0PGLWNccxBIz66XmLDVDqnYWCNOWTKRnsodWIBn3pm9cQBn3CXBs7zRZNLH2Ri/Pg8+
	XEptuH1Nr+D5HXiBs6H/7uKk8tnhP7OtAf3gLrrpaHlIJrhE0bI=
X-Google-Smtp-Source: AGHT+IFf34YJVXfP7Pz8cQvJg1IrQekx2IBw6l6EtPWiJtlZ1gOYmI6zevWfKc3dEP8I+9bndMCmNg==
X-Received: by 2002:a17:90b:264d:b0:2ff:7ad4:77b1 with SMTP id 98e67ed59e1d1-30a61960f02mr3397166a91.2.1746303883063;
        Sat, 03 May 2025 13:24:43 -0700 (PDT)
Received: from localhost.localdomain ([200.133.129.60])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30a34826684sm8253198a91.41.2025.05.03.13.24.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 May 2025 13:24:42 -0700 (PDT)
From: =?UTF-8?q?Rog=C3=A9rio=20Fernandes=20Pereira?= <rfp2005@gmail.com>
To: gregkh@linuxfoundation.org,
	dpenkler@gmail.com,
	linux-staging@lists.linux.dev,
	koike@igalia.com,
	linux-kernel@vger.kernel.org,
	~lkcamp/patches@lists.sr.ht
Cc: =?UTF-8?q?Rog=C3=A9rio=20Fernandes=20Pereira?= <rfp2005@gmail.com>
Subject: [PATCH] staging: rtl8723bs: Removed multiple blank lines of rtw_pwrctrl.c
Date: Sat,  3 May 2025 17:24:30 -0300
Message-Id: <20250503202430.6053-1-rfp2005@gmail.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Removed multiple blank lines in file rtw_pwrctrl.c
Found by checkpatch.pl

Signed-off-by: Rogério Fernandes Pereira <rfp2005@gmail.com>
---
 Hello, I'm Rogério "Fox" and newbie on kernel contribution and it's my
happiest commit. Any feedback is welcome.

 drivers/staging/rtl8723bs/core/rtw_pwrctrl.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c b/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
index 74a8fcf18..44f7c1930 100644
--- a/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
+++ b/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
@@ -8,7 +8,6 @@
 #include <hal_data.h>
 #include <linux/jiffies.h>
 
-
 void _ips_enter(struct adapter *padapter)
 {
 	struct pwrctrl_priv *pwrpriv = adapter_to_pwrctl(padapter);
@@ -994,7 +993,6 @@ void rtw_init_pwrctrl_priv(struct adapter *padapter)
 	pwrctrlpriv->wowlan_ap_mode = false;
 }
 
-
 void rtw_free_pwrctrl_priv(struct adapter *adapter)
 {
 }
-- 
2.39.5

