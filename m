Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B1EC130A54
	for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 17:01:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743440494; cv=none; b=HtytY0Low+AHXF2+8B+HXV5x07UU8+E7CBiqtsGdgpmPSg1GGAXuxrGuy9rA0SL6gLO67HCYFUJVpcuG9Dx6gCauQu+JP+n3jJN73j8EP2l2EhApE1OAUr8YxMgLNq2z1xDGJAVhCmzsswPnaSK6tiri/hGeYF5asLvztI7/GXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743440494; c=relaxed/simple;
	bh=8IL/Ra0pO0weo0T0Jdbi6Z7WKIY/D3v+uDgImwBhRSc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mD1o84KD+SL/c7ZY5zLchaXIA1OZ1P75mqs2S+sLbvmXNs2l654ezI3lFvIEsCgaEFZSKL3v9B3mcQiTNViA96us+O5rkj2RDezuWvf7SDpjUCNiYaNlDZnipCtrv+yhvojcBFu1iFjvrKS5sATmsTOdYglVr1AKQ24rob1I9A0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fw5n3oOD; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fw5n3oOD"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4394a0c65fcso45014565e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 10:01:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743440489; x=1744045289; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/r3cMncWG+nY/YBhRc114Qo+8DX8tI4MejL3tdVmr+0=;
        b=fw5n3oODWjF8na0MnF9LvPXxbvJRy582Xs73jLdOvNIFi5bXFWkbz5mjwPmF0smw0V
         zZCciJ1IfrE6hZPaONvIEKIRKHSfRva9BO05ugkULyG5JC+EblkJEuxGTeGdqOYdLO8Y
         cAcqTlbJeuzY57uF6MUPTZhgQ1CdUOyc77+Rv4o+I5Hku5ygm3jDCsaGMlCytS/Uqxti
         f37NrofyUX9sBwzh1l+2ueCi4gcTsePCdMQ8XzPl+OPiEBdhXxSo2yOVDtc3LRtdlU4f
         qG8hLvBXawUuJSn0VBKzWZRT/xpXtfVXI743QO4wjlriEKP/aN2XEXJCmZsCwESrm9aZ
         Dd5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743440489; x=1744045289;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/r3cMncWG+nY/YBhRc114Qo+8DX8tI4MejL3tdVmr+0=;
        b=quxDkeo+IC0stnoYNbUihkd7TsbFoemGBf5JidfAxcaT0Y1HaO0DDG9eSz8VmTHeZN
         iyw1vkTCJ18FHz5iVWPFbd8g5hJxld3b9OTlraouU8HIS1QBM7BXtoS17RuSsfe+B8ru
         WhDfSj5afMnIvu10sOKd5u7dW1sIvn8xuciWDqRP5HRt0gLWxXDxDQfvi1x12r4oIVym
         EHfrSdYZ1EW6xxHGqtT3FtdLxl5wDmGdcqf+UXgbaZmAKZ1qOFj1NexImLba4sobCCXU
         VNs3RDB/8qX9EjNotALvc6KnyAvxMSG+IuMV6Pw9NIMk7GbyUF0BEMlovAdh9r4rwOxq
         mlyg==
X-Gm-Message-State: AOJu0YwMbJnBuuZBr8swPji6s7nk+UxMXZ/4rQ07nCmDg6DycBkyHE9n
	e9JyRE1nfPGyIpOKvXqhpXuzSuthcPlUY+Fn23/x8rfoD7+iQvpEVmLQsw==
X-Gm-Gg: ASbGncsNR9pA06za3VpefW8d1TG7SLf1aD2pQg23U8XDFWTlTjykAFMdgCJgh0GLpr1
	d7Ti6hDhbzkpVYvj6eWmo9tvrAvM7otBxqz0YWdOgxfRm2vYYwr8RtJBA/CFpB2VRlHS1ndWbAb
	ezNE1fmzxiMlSfHNbMxXKiw6FS2aK1X7w9CNQ+bYBCBXAzEy5ousnSgnhv64z1Cs0JVXebzcX5d
	W9OiwmJJ4OPj27kXZjU+84pp7RKKVrsKsAQVa82bXuLtQi+0jIe39FBv4Y7NSjPhHFqnPOC7mcm
	cfSbw6Mmef4gLJSqunJuBuqs0H2gAcZGrpQu8B98dcfy3ixrREIe+IB29XwEsDkCJ6z8LCEW
X-Google-Smtp-Source: AGHT+IFrWW99VuYLydKfDJdKrNp0jCkmt3VC6VQ3OE4jNig0W63r/JX5R7w3Qlo11exHRiAl97rKlA==
X-Received: by 2002:a05:600c:46d1:b0:43c:f8fe:dd82 with SMTP id 5b1f17b1804b1-43db624aed9mr89094335e9.18.1743440487779;
        Mon, 31 Mar 2025 10:01:27 -0700 (PDT)
Received: from chironslaptop.localdomain ([145.40.144.104])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c0b663617sm11853806f8f.34.2025.03.31.10.01.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Mar 2025 10:01:27 -0700 (PDT)
From: Chiron Horwood <chiron.developer@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: kuba@kernel.org,
	Chiron Horwood <chiron.developer@gmail.com>
Subject: [PATCH] CREDITS: Add Sam Moores
Date: Mon, 31 Mar 2025 19:01:02 +0100
Message-ID: <20250331180102.216308-1-chiron.developer@gmail.com>
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

