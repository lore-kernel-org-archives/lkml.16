Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADC951581F8
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 17:17:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743614224; cv=none; b=rJGQIDiTwnsjkQybx9jIdhqoxiRxKJ6ufxlKKvDf7HKdDIhf3y2Z9z37EFOeNLBYk/6MLmu35XgkoJqy6IIsqM56KEOA/YZmjp3yp0X4jLgVqbVEYhErlzAV0lj2d2YHosnI3eBPuI/2aIHjaMkRcqhYuGA4CA+3BGOPyWMuJ3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743614224; c=relaxed/simple;
	bh=k9YK+X3azKj4clAIgj5V53g4uah9aIU8AMWiWLGGwZk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=iCAjtUN/PNuoBd0nz0AKfzQhKb0TuRwADyQyDwGLvX8A+rbdHzLa5FRIY0RsWNfQOL48CLxJSG1h8YEqVqbofXr78z61KbAHJqqqdrfQPcoJ4e1/qrsZltjgrU4O2ZXjcLdR9dALruz6LkycS07BmpBGuZeS3e+MxMP/Avotw0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JtwSL2Sr; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JtwSL2Sr"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4394036c0efso48478635e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 02 Apr 2025 10:17:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743614221; x=1744219021; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wbACQ7BLnEl+BnTR/u/TanvhtFFXbzt5go95fESQfSQ=;
        b=JtwSL2SrpldKk/g1MagKv0FeyQFf0yOi6eYwQc35Ax/vk5tyzgidodLWuhXtchft64
         EywdAmtkyQ7PJh69M4qLMf9bxKCa/aVxfSwy/NeBAuU9MVniX5jUNQT2Afn2FS9GR3ZQ
         Uflaq+dCGSGKdXkw5Q/FUWKQR7thHUMhPC23Q/4YAEHc/FrGN4DQ9cr3XIPU0gvvKfqK
         9FgQaIq59Ot6SOFNkfwSybqVc9PTu0KFRf4Rv/KqcQxrvEyPoHFCsF6FLF1gP0z316uF
         gsHwpKuJ2Pb9J5qROWSUPsc2JcjdO8LRk10xbaDXAEiOEk8wU1pzyF0j8Nfj/dHLUzPm
         Y/SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743614221; x=1744219021;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wbACQ7BLnEl+BnTR/u/TanvhtFFXbzt5go95fESQfSQ=;
        b=bASLHg58IWblwuYfyq1a29zHbxCp1zydfrIVAK3HnxBojg6T4vK0Bg7CAYg5XjrXQD
         f2NMxO1SwVscoZJSdPhc6SZKpyPQ5L0mIIwwHsFE8AmaVyJQC5NKE8h3+pSyHXF9wwLA
         AO3KB0WIzAXjfpNJ/RiCzZUGpumITqBCGjZ7DuXTkCi4PhuOUsD5kTS6yhaEhDdlNNEz
         KgwncV66BQevWNi/Z/ScrhOrk50hBM0+11Bdx6r9e79x370vNo2a6OVbhKsLvO7cNVa0
         0aVs2ODgdvImRmF1PVOgsVIsqIikQJRSGpJ0Fu/gM3z7K0DVvIdYM1omhSi/K9NKmYjV
         g77Q==
X-Forwarded-Encrypted: i=1; AJvYcCXLh58keDq3dk4WRGs93lfh27CxiivZXs8atLRDWaVvfVm1B6z1uGlzrcpgTBgy/huqSmtXCLszH8AmM/E=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/xycTijEkVxZ0eCr+CCxabN6ZjjmfjVHWizaTvvzdsSBsHGVQ
	7IJBhBsBA1VYKpb81Y75Cg5BbMFDmParKp8WJi1V+VLuHmqkU91m
X-Gm-Gg: ASbGncsAKLlTWJThzc+QpJlZ1F0Cifm4nGXbhiCXbrmZH8vrmkSefnVZdpqxJIYY7OI
	SXxIfiVv/WtG9PGgMANOqI4rSw4nCpXHprWEycUeB6O35vJ5nkIQd1ND1fOY4STs14EkS83noJQ
	M0eq5Z8SJ/ctUXp87p49EOf9a87z0eO5x+F19sw93Kjbx7rbE5FMBBuRyJ/cGf8F+R4dFOflkWH
	iJ5lbSzkq4p7AbJGd9xf/6OwJAFw8wP9LLSmX8THH+H3Vw6VD+mC7KR6+kTgd2oRbg9k4nOoha5
	Z7CffjizQBr3hzsyXE6iAyaDVWiZE8Cllmzt+ugkyA==
X-Google-Smtp-Source: AGHT+IH0XXgRcay1/TXbCvKo3B5wwZ0vOIzKabPOAte83IKh7GsIf5L2WP9dh4uRCk+VihOT8kUz0g==
X-Received: by 2002:a05:600c:1e85:b0:43d:1c3:cb2e with SMTP id 5b1f17b1804b1-43db6205bf4mr210102735e9.17.1743614220614;
        Wed, 02 Apr 2025 10:17:00 -0700 (PDT)
Received: from pc.. ([197.232.62.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43eb5fcd489sm26713525e9.11.2025.04.02.10.16.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 10:17:00 -0700 (PDT)
From: Erick Karanja <karanja99erick@gmail.com>
To: gregkh@linuxfoundation.org,
	outreachy@lists.linux.dev
Cc: karanja99erick@gmail.com,
	philipp.g.hortmann@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/3] staging: rtl8723bs: Modify struct rx_pkt_attrib attribute bdecrypted
Date: Wed,  2 Apr 2025 20:16:42 +0300
Message-ID: <00287fa9f40c643b8451a0d2df8e2fb97235ee46.1743613025.git.karanja99erick@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1743613025.git.karanja99erick@gmail.com>
References: <cover.1743613025.git.karanja99erick@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Standardize boolean representation by ensuring consistency,
replace instances of 1/0 with true/false where boolean logic is implied,
as some definitions already use true/false.
This improves code clarity and aligns with the kernel’s bool type usage.

Signed-off-by: Erick Karanja <karanja99erick@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_recv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_recv.c b/drivers/staging/rtl8723bs/core/rtw_recv.c
index a389ba5ecc6f..fd04dbacb50f 100644
--- a/drivers/staging/rtl8723bs/core/rtw_recv.c
+++ b/drivers/staging/rtl8723bs/core/rtw_recv.c
@@ -1358,7 +1358,7 @@ static signed int validate_80211w_mgmt(struct adapter *adapter, union recv_frame
 			u8 *mgmt_DATA;
 			u32 data_len = 0;
 
-			pattrib->bdecrypted = 0;
+			pattrib->bdecrypted = false;
 			pattrib->encrypt = _AES_;
 			pattrib->hdrlen = sizeof(struct ieee80211_hdr_3addr);
 			/* set iv and icv length */
-- 
2.43.0

