Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D62CE18BC3D
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 11:29:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744025384; cv=none; b=dodG9EYIsjlWsur6rFVnYtPq+SZf9qDvOC+s6JF2SNEBgxU99r1txTopMaBOVUCAHfHMR6kRVaoYtqW4hrNlXMkf0vDmJVR/8E0UQGHCOxOXApkembaynyKB3uleAJwImKDLT11Nc9RJDBqf8x7+y504XT1/yo7WCxcZoUucLOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744025384; c=relaxed/simple;
	bh=0fGIZENTMQIPAw17Sd9aY6GAyDelwBiQOA99Hzg9RuI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MOMORDTCnOLhw0Vus8248kX3S51mfbb0+kHg9gCoqneKZFT8VYAqAbtVbSc3Ksh7U6MusIItrlpZsJMMA5u+Y1UcEc3FkmkK3vxZWysUZ+ja7RuQ7e+McwxifoTPqJzWQRDq2/RFfxtApxvH5Oa/yiVHEMuqhv9CUwrQhMn5twk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NLRvD1K8; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NLRvD1K8"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-736bfa487c3so3282658b3a.1
        for <linux-kernel@vger.kernel.org>; Mon, 07 Apr 2025 04:29:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744025380; x=1744630180; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Lf8+vIzUcQqtKLZgTtvxYBmzYrBDNAglzFOwESNjG6Y=;
        b=NLRvD1K85ax6q+py3sCK3bg6HpBx+1DU5MOaEkdQUObv3n5GxRDY0AfJdu6Lw0v4/o
         JA/Yv7owrt4qtaVlnmfPr6hNwRcbhMckQdRC9yGK09OJTgK1NrF8Kf+YYo24fk66/KX5
         79Zr44EbhfvvKMkc30Xbi9lsl7nQYmcnnqzL6hdLJ9GOKCegoaPA0o2dllVG3x6sNXue
         3dbuI9cfg0dbfJo3fHAAl1rwAEJLtUJy3eKo3/wX2HnJjbA3Vd5TQROtiKRBqgJnKmfN
         y3PA5Xbke/PekMjAwnnt/AUA7BRIuIAvKo+YxkEMLeo7qNL6V5Ig6Vc3glu80AQzVVTM
         ZSXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744025380; x=1744630180;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Lf8+vIzUcQqtKLZgTtvxYBmzYrBDNAglzFOwESNjG6Y=;
        b=WDdzmlvZ8snAimd1LnBwiqgbijBBs8a2RmcPHkmmfwrwRhBzUhm6wDoWT7FBBCN2LR
         GA7DJuQYk1FPc7Nk17w+4URXnCyfWSJ1GjA0eP/pBpDDxDzMAzDvViarXoRQTjeSCOpi
         IIkpJYYxBWD3U23f0FJw6SPGrAf3z4rs11UyQj+SWd0d4zpvzu8SEI4MTlzztmJM0/wU
         pJFGuWNu8bYfKacktCuuYMfU/eByS7Gq2/n9uNI0VrtMJlRPjgD4qWaz21599YQ1nXFh
         08avfaGDIG/0xxB1S72pyMeV6/JwhNA1sAuoSLI53VtSeIT29X4XbqgDeFowk5PWxyRf
         eqwA==
X-Forwarded-Encrypted: i=1; AJvYcCVJ1eAn6GUf5FKoVubI/2tUh9tgC51Twn9v8GQhYlWtanTNEZPBCABEtebEXdslO0hV97qVzlUGkvUWgtQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwweSdKvbIJ7ZI6wZslROJSKrfhGLyQPz0BYHBmIdFx9xNLH70Z
	jD3kYJSdkXWEdL7Rh9qj6ydsoT+Geyziw3IGSaeMQDWTFpAIxhfr
X-Gm-Gg: ASbGncuZu1moUmOvT3NyehXCKsLYMybivgtOv7DCEIOSpZhjRnBND8+sOkSemPjuLwx
	Z5/po2YTBXnN0YcJ+nq1AFpbzkhxpKUb2lg+EZ+2fNFEDPkTX6mpdqBEnDJKt+bCrNRIcitrQjI
	t37UJPEtzODpOWCgCL//Ke2MVKFPvblH3v7UjsqAIehi0RsLcrrjLbyefEaK4/Wb2lXuMzejG2p
	5b+qM8GbhEiBK5F1fDbY993fGlBmsciFlzRq3c4rRWPmpeAxdPvYeuFWk/PboHKPt2UHJHNcS5v
	u0vs2lDMvx+djpylry3GmojzqmyK3VxaGEBjxGIuI/FcAaFp0mFVjQ==
X-Google-Smtp-Source: AGHT+IEslLNpb0YOIy1A/qjmVIdbvXfSixkGkpSL6RFXFfKsMNi/OQA55y6POTyk+LQwAlUKNy7sjQ==
X-Received: by 2002:a05:6a21:e8d:b0:1f5:8479:dfe2 with SMTP id adf61e73a8af0-20104591150mr18811048637.6.1744025380049;
        Mon, 07 Apr 2025 04:29:40 -0700 (PDT)
Received: from EBJ9932692.tcent.cn ([43.134.231.248])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-739da0b9608sm8258637b3a.154.2025.04.07.04.29.36
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 07 Apr 2025 04:29:39 -0700 (PDT)
From: Lance Yang <ioworker0@gmail.com>
To: xavier_qy@163.com
Cc: akpm@linux-foundation.org,
	baohua@kernel.org,
	catalin.marinas@arm.com,
	ioworker0@gmail.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	ryan.roberts@arm.com,
	will@kernel.org
Subject: Re: [PATCH v1] mm/contpte: Optimize loop to reduce redundant operations
Date: Mon,  7 Apr 2025 19:29:22 +0800
Message-ID: <20250407112922.17766-1-ioworker0@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250407092243.2207837-1-xavier_qy@163.com>
References: <20250407092243.2207837-1-xavier_qy@163.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Thanks for the patch. Would the following change be better?

diff --git a/arch/arm64/mm/contpte.c b/arch/arm64/mm/contpte.c
index 55107d27d3f8..64eb3b2fbf06 100644
--- a/arch/arm64/mm/contpte.c
+++ b/arch/arm64/mm/contpte.c
@@ -174,6 +174,9 @@ pte_t contpte_ptep_get(pte_t *ptep, pte_t orig_pte)
 
 		if (pte_young(pte))
 			orig_pte = pte_mkyoung(orig_pte);
+
+		if (pte_young(orig_pte) && pte_dirty(orig_pte))
+			break;
 	}
 
 	return orig_pte;
-- 

We can check the orig_pte flags directly instead of using extra boolean
variables, which gives us an early-exit when both dirty and young flags
are set.

Also, is this optimization really needed for the common case?

Thanks,
Lance
