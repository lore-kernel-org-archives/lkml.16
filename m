Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74E38255E32
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 16:24:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739291065; cv=none; b=VnvlrMOavziRbCCSCIE594McR161lHSFaL45vWzUPMwNIgbt47g8F7/F5BF52ar/XC2dZ6sEe19RA4t0H27kkgLSMoLGnHjphejk+wuMeAnZBqhYXQ6d7WpDqSAAbi4dE4f+vawDIe9KpmyCl0r/3d2bx1RIdMtFN+grtxx6NUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739291065; c=relaxed/simple;
	bh=0os+MElCisuNWT9g05pz60WaTG2qjQP3ozTpq+p7oV4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TD+l5LKX8Scl/HlJ5tuWntEG2PQZs4gxddjpa5zHomTucoFVddJlDjcF8Lm/rqSNwijFe4tls5ZjKFs/aZXO5hOv7GOcrbGEV0oiimzuBQODpoSaguAIaBZWbCZgDOdjc3b83gsVI92rAMFnPr92nX+fxXdKF0jkCs2zmmiQNu0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dMOwb/bi; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dMOwb/bi"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-21f3e2b4eceso110181845ad.2
        for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 08:24:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739291064; x=1739895864; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7OENMnC/QFuXeZf795S/xFXKvwcJa0Os6HB7QmDPx1o=;
        b=dMOwb/bi58m+XrdglIm2deGIKI1GOWW3dz2T7DZWeHqGaKCSpN7dc6clTKSTOdKUNc
         l9XcsqVo9kVPIdMJ2E/AjtCyyijumI1MwVq8KFJ+xQW3UtFCC9CwI6gXx3lCfv/xPPMF
         Phyij31QLxc2baP6C+hvZd6CbAfGN/UgSI0aU/jIoA0Cg2h46ek2D0gMfWMAm1c6z5ie
         RzX9foWYHcaw/qkur9tYviV/leAwH8EoNNH5x2Zcf9nfeWATRwdS4RhfwNSjGjGQkchW
         dufKwmnvK0LY+aANEyt/jzYYfCSMUf7ZLJz1Y8oYKRp/73dJG42fyivOsIftiiDdt8b7
         AOoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739291064; x=1739895864;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7OENMnC/QFuXeZf795S/xFXKvwcJa0Os6HB7QmDPx1o=;
        b=epQAEDJqGjb70keF0NWt6qC3wWaVO0u1d6tqvMPXKqINMIqJmKGjJknp4C9YiWPQlR
         jkUkmFCXazYrMjEVyA1kE5G9QhTlwFs3K3mScF5VOoprvNw4Rtu/ZdXfmK0YTKeHAx4k
         Lsq5fE4IrjC3j079yHQg/rfzbjqTzqcRXOoje+KrrKjHX3Btro1nY+89TjhZjjnP46gR
         Jrl4ezEtB8RfTlKJg9SZ+H/EBoiycdxr1iA+UxqhqIj++FYlryFsxG0ZtKaBJdZ7RdQ4
         PEWaii+w5/InBtDZuyGsYwiJ0LZF076WkOfKoOXv43RBIgoIyYjV4+gG/6fEd1MMyljh
         TCdA==
X-Forwarded-Encrypted: i=1; AJvYcCWjpeXWUv8RLlAqUh8MY5EqQ/nWoIRthy+aZ8oEM87/Xm4AySLOt2OC6GSD9BplEtHi15qST0MRpSjwfMQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4REjt3NbJYD3uIOBInWeGeaCRtA9gDTXeuRdylKhvW6gyUGha
	ntBrmCHAHCD0LPT1iRNo8E4XvO1UIgyZ0TuToomcdEmB0SQHlGxS
X-Gm-Gg: ASbGncuOHEtV1hdTAji9xpm3WGZHuZC9SgQxYNEtJ3QaJOwSGFHoSb/w+r98H+aE/zH
	R8ATWqWcLcq+1GV/2VNBmdIn33pWld69PuJyceU8l8KU8jwf6YPZl+FkZLy77VDyCzLy9WervcH
	6r3m78l1/JtZf/jNNOjKSdcMXW8w2RTEWx6Yt/NNr+xvZOnVy++aKSK2XscmNyLA2TbqHA4kk5l
	w8fHQprHzgqDe3zsOk+YIvF7O+CY5me2P3cryxQdN32GZ61pnwdYiYgLBjmbCPQgKJWn0BGZyYE
	oJfMHWwTDIICSFPwHG+Pns0a788C9NVpogj967KNz0O0
X-Google-Smtp-Source: AGHT+IECtDR/wxftlFlI0nH4ijEwZgWokgNzemFi94yyE+Ukk6C+OHyCyCwfRKs2b165KpbPwSBzZQ==
X-Received: by 2002:a17:902:d4d1:b0:21f:7526:2a11 with SMTP id d9443c01a7336-21f7526492dmr213539685ad.31.1739291063820;
        Tue, 11 Feb 2025 08:24:23 -0800 (PST)
Received: from vaxr-ASUSPRO-D840MB-M840MB.. ([2001:288:7001:2703:e985:a3e9:17ea:8af])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21f3683d5b0sm98212385ad.109.2025.02.11.08.24.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2025 08:24:23 -0800 (PST)
From: I Hsin Cheng <richard120310@gmail.com>
To: yury.norov@gmail.com
Cc: anshuman.khandual@arm.com,
	arnd@arndb.de,
	linux-kernel@vger.kernel.org,
	jserv@ccns.ncku.edu.tw,
	skhan@linuxfoundation.org,
	I Hsin Cheng <richard120310@gmail.com>
Subject: [PATCH 2/2] uapi: Refactor __GENMASK_ULL() for speed-up
Date: Wed, 12 Feb 2025 00:24:12 +0800
Message-ID: <20250211162412.477655-3-richard120310@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250211162412.477655-1-richard120310@gmail.com>
References: <20250211162412.477655-1-richard120310@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The calculation of "((~_ULL(0)) - (_ULL(1) << (l)) + 1)" is to generate
a bitmask with "l" trailing zeroes, which is equivalent to
"(~_ULL(0) << (l))".

Refactor the calculation so the number of arithmetic instruction will be
reduced from 3 to 1.

Signed-off-by: I Hsin Cheng <richard120310@gmail.com>
---
Test is done to show the speed-up we can get from reducing the number of
instruction. The test machine runs with 6.9.0-0-generic kernel on x86_64
architecture with processor AMD Ryzen 7 5700X3D 8-Core Processor.

The test executes in the form of kernel module.

Test result:
[452858.156718] new __GENMASK_ULL() : 5908678
[452858.156722] old __GENMASK_ULL() : 5950998

Test script snippet:
/* switch to __BITS_PER_LONG_LONG when testing __GENMASK_ULL() */
\#define __GENMASK_ULL_NEW(h, l) \
        ((~_ULL(0) << (l)) & \
         (~_ULL(0) >> (__BITS_PER_LONG_LONG - 1 - (h))))

int init_module(void)
{
    ktime_t start, end, total1 = 0, total2 = 0;
    for (int k = 0; k < 100; k++) {
        for (int i = 0; i < __BITS_PER_LONG_LONG; i++) {
            for (int j = 0; j <= i; j++) {
                unsigned result1, result2;

                start = ktime_get();
                result1 = __GENMASK_ULL_NEW(i, j);
                end = ktime_get();
                total1 += (end - start);

                start = ktime_get();
                result2 = __GENMASK_ULL(i, j);
                end = ktime_get();
                total2 += (end - start);

                if (result1 != result2) {
                    pr_info("Wrong calculation of GENMASK_ULL_NEW()\n");
                    return 0;
                }
            }
        }
    }

    pr_info("new __GENMASK_ULL() : %lld\n", total1);
    pr_info("old __GENMASK_ULL() : %lld\n", total2);

    return 0;
}
---
 include/uapi/linux/bits.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/uapi/linux/bits.h b/include/uapi/linux/bits.h
index 8fc7fea65288..965f6eb91ff3 100644
--- a/include/uapi/linux/bits.h
+++ b/include/uapi/linux/bits.h
@@ -9,7 +9,7 @@
          (~_UL(0) >> (__BITS_PER_LONG - 1 - (h))))
 
 #define __GENMASK_ULL(h, l) \
-        (((~_ULL(0)) - (_ULL(1) << (l)) + 1) & \
+	((~_ULL(0) << (l)) & \
          (~_ULL(0) >> (__BITS_PER_LONG_LONG - 1 - (h))))
 
 #define __GENMASK_U128(h, l) \
-- 
2.43.0

