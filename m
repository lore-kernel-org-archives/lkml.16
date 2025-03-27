Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D7C820DD4D
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 09:56:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743069408; cv=none; b=no/kYYovvQIASLU/F3SnfPIKB5QIaSkHUfQg1tQLUiFglDOS8OgVBkU1Y3DiWCnxKTCaCO0YiORuFycsuoB8Hia+QhaQGBKCvi5udfJJvDIipNHGPCUooghNGxZr83yv5i+RnzA8uBpEP/mp1D3H1eIS+QiNVsUDAfLkyg4gBwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743069408; c=relaxed/simple;
	bh=hKz2mu+pHNVmR0ycddqUf0gXQfCUTQmlkkrCoqxO3sA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=R/v6VC54fwucS0awtUdzjK6BOl73z2b7J38T+8Fr3lYjR+uLHYm9FoIw3GUml6mHPAYLav4BkStALmrSxc3NszFdRAvEjOoMHQ6RArqWVMxf4/VYoBRI7xUw7l2aka+Jbslw22TzMZ53h/EmaA4iTZhS81n5bhLHGtDRqd2SS+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b40PARtO; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b40PARtO"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-5e5cded3e2eso1245397a12.0
        for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 02:56:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743069405; x=1743674205; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KQKK9jdW2vZQ1nSZsyOiIsmUPjwxSakOTrL/QeXtDc0=;
        b=b40PARtOJesHJIfZkV3EWkttM+rcr6W1E7+QYeIl/xNlpZEERiLdGVPIHPic3ICGGG
         800D6hZFooohWk9HDtHiIy+8yFg0x6zSEPHq12LSKY9f+d1IeKD0YNp8le99n0Qi1wkS
         9UVz+MY0lO/SwoipPa2qO86OtQHVmq1wc27NScTqHtwB0QhbpFH/ZaoltiGYLquPiOBC
         7/urv2olmjTYIIG3z5KTqqLSiVwEVO94N0BwvLEDGesLqu4F8RhpInEOGbWUTjLSlmQX
         KFe5a5BAlYWJEs8cIA8KjyjPEiahf5BVv85fNTGuAsiV98GZWScuYD6dtwDwyROSgT99
         iOyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743069405; x=1743674205;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KQKK9jdW2vZQ1nSZsyOiIsmUPjwxSakOTrL/QeXtDc0=;
        b=PrlSptzY30Kk8k1nKNUJd53ULyrGYyNcOuXGLNewXfNzHelrNyN0th8RyfWV4r1J9e
         jm+iyhK0/UtmGr+JsDONI4abv+v1UE6zqsv4MlMpKk1CHEy8e0wTF6WKrKGbP3J/jug/
         E9mthDLYvwAzMaD1Jlg/S3YyJLraQOeYwQTmqSdvoppUesCt6EGojOy050L5SOiVkKCM
         OVBnQ1tNw2JBLuCNkP+cm0O647P82BmIGNaebgp4QRfBmCzuUGeVf33ZNULBr/F5AZD8
         BnteYuxGGvf+r2xdnLsXZg+ylSVRIdbOE8LQl1LCQnQryoMbF/4IjGuv0Pvhy+gPNlFT
         ivxQ==
X-Forwarded-Encrypted: i=1; AJvYcCXv7FXJf/Oe78fzlFBUasXiLmLclL8nS2r5ukpSRKZlJcEJN03Zz+thVJ7KJJ2VFdAqJdzAn+b5uS7tOfo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3RnYjconJldQNRAYdTe85+eceaphV7wTpnBA20hRdOUzaOXrM
	BjuS9Myuot+4y0LUNqxRGA3/iBQZQnEDxRiCtl06XKqDmKV0Lr9g
X-Gm-Gg: ASbGncumcda9Y3m9STD68K9KegvQYn41fxyrvQFXgPZrJJlwRVqs5cdMwEIh9Du+qWr
	uVD0PIlajXQFjDSxpRqQ3jsWlbqsJb0tjP4LH5BAAQxZbm21EvayK22g0OukUkIvVK7VAo7Bu0M
	B2LwBvkO3U42Sww4h/bMnqd73tgAYiF8Efh+gyBCGWKWYeRinoHke8e+5+6JcmoLqk7YhkU0Zs5
	9q7rmymrO/h+TOwDCLcFhe5e4IfUIdUNJwQr98wCSyqoE+kDY/RUaQsrzWR+fsQTKBVHfialr47
	Uv+O5fSQZ8uXhntXQPbxwoTfDZk0IKJEInaG
X-Google-Smtp-Source: AGHT+IFnLNNFDrtpMTpkEwig1nGVkfEVzqIzt8YKV2wz7tPtPs4O8HKQRnARyFT2s/kPMOWHAB3f/A==
X-Received: by 2002:a17:906:7310:b0:ac2:510c:a3cc with SMTP id a640c23a62f3a-ac6fae494f8mr255847766b.1.1743069404399;
        Thu, 27 Mar 2025 02:56:44 -0700 (PDT)
Received: from fedora.. ([193.77.86.199])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac3efb51cebsm1202845666b.107.2025.03.27.02.56.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Mar 2025 02:56:44 -0700 (PDT)
From: Uros Bizjak <ubizjak@gmail.com>
To: x86@kernel.org,
	linux-kernel@vger.kernel.org
Cc: Uros Bizjak <ubizjak@gmail.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@kernel.org>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>
Subject: [PATCH] x86/bitops: Implement variable_ffz() as variable__ffs(~word)
Date: Thu, 27 Mar 2025 10:56:28 +0100
Message-ID: <20250327095641.131483-1-ubizjak@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Find first zero (FFZ) can be implemented by negating the
input and using find first set (FFS).

No functional changes intended.

Signed-off-by: Uros Bizjak <ubizjak@gmail.com>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Ingo Molnar <mingo@kernel.org>
Cc: Borislav Petkov <bp@alien8.de>
Cc: Dave Hansen <dave.hansen@linux.intel.com>
Cc: "H. Peter Anvin" <hpa@zytor.com>
---
 arch/x86/include/asm/bitops.h | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/arch/x86/include/asm/bitops.h b/arch/x86/include/asm/bitops.h
index bbaf75ea6703..eebbc8889e70 100644
--- a/arch/x86/include/asm/bitops.h
+++ b/arch/x86/include/asm/bitops.h
@@ -267,10 +267,7 @@ static __always_inline unsigned long variable__ffs(unsigned long word)
 
 static __always_inline unsigned long variable_ffz(unsigned long word)
 {
-	asm("tzcnt %1,%0"
-		: "=r" (word)
-		: "r" (~word));
-	return word;
+	return variable__ffs(~word);
 }
 
 /**
-- 
2.49.0

