Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8F0D22258B
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 18:09:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744049372; cv=none; b=ct2g5dFaL4FQaZTem3bhsefijzG4NJwWK+QfzFlhlFqwXaEHf8raGAPME6976m/KuL5sczAI+JdxmiLsAVGCAzOg2Pl6n3I9MhWQ/yeZdbucF+HMjETgHcmQg4iIOZIMICfRZPIU9J+H6gkpLP0cI5f5lo8OY9M1Qo028f5L8Uc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744049372; c=relaxed/simple;
	bh=+z4ZM3TqTvoic9Teqna+6DZPTl5o6ThQykWvw0OH6uQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uvug+kpMDAGByntovk+uz1sclO0+w+Zd1fZvu/piO4q/+YuVKoL0oUyfZcWQm/T25nF0b7Y+3GMwbhLiDeXn0GtoyidWqKg1GJeN1gHUhkEpox+DyZrQgf4U0gYkVFzZxvQz0oaNicfaA44AasxcTo2+rQyw5zVgqVV2IYyVs/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C7JnpFYr; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C7JnpFYr"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-af519c159a8so4183994a12.3
        for <linux-kernel@vger.kernel.org>; Mon, 07 Apr 2025 11:09:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744049370; x=1744654170; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WMjCLGzG+iKPyMJNKKfkgkaaKsErgB/MOxToztcG4nk=;
        b=C7JnpFYr8VudhnyJv135Wg1LONJWNM9NvWOccEQ8uML7A2/xYwtBWwEEaerqalfhll
         sSC9OmghFJJRhIyrW1NvwF+jWNByPaLVmD8fCN2D82owfy94pXfx68fIFFrvspBJCMor
         2txIDeBxlwvoqDdNH1V36+iVQyNMvBV+ggowdJrNMakm1qDDnEBiajMJ0jpIc68CPHV6
         IPW1piwCU/I7kHN/SZoHN7KZzRt5kW1sfH8Mv37T4CTfKmUeRyEXZ2zp0YltrbqBTsUK
         0fUlrg2fG0i1VJirLKHaJQFaABLUM5xXem8u0rbWRLMd3hiwhXGr0QhmTUOzehvwpVT/
         FO/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744049370; x=1744654170;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WMjCLGzG+iKPyMJNKKfkgkaaKsErgB/MOxToztcG4nk=;
        b=Un4Uth9uPh/813SRqa9kAhqeYUPzggyV5ZRhq1haSn62tlcthzatb5Uocziopg+L7I
         jvjcV8uP2JiYGM6hHAjGUlbTxM9EnY3gV8fZi8BCZirKGtgIjx6kgMft0i44v305Gz3l
         jgW2YvHVPdqkNUZ/eYLqhmWOqra6eNcS5qE87qGVa/3gq8ABy+hLyLbX5priRAf7PMru
         2Ie+nwfogB+l32tWY50vjYlu8JoG1U0fVuUKOuv60JKQNPc8ka5N1ufhq9PZE7mCWSyF
         QI4PvE4yvaP8E1IYQ5Hdpl73mhgMW/FJ0esnyrBFyv5RTMOO1cWi9QUsaaMVVp8Wu+fi
         ITdw==
X-Forwarded-Encrypted: i=1; AJvYcCXdoDDaXOtvoKk2pu/AhEuLnzJxN+X0DAFV/mxrwoe04paOQ1RWhSM3uG+KE8I1KA04WSls5hhYy95xIrA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxrLv9Ua2YhW3iETfSA8ntq22VuK+gEkc09HxlOgzTCywr+RACm
	XNoI7/pcY+CbwV0KKKIJIlp3XdF+2+YZe9xyB7Otbyhc3FpS0IeY
X-Gm-Gg: ASbGncvh1e2T+/BH/5AVwE49++H1SV05dGFX+cDlw+SSfB2zUm/acI/SoMTnkyq/+r/
	knVL+QXzd87dcCC2IXpNOHAaUiM8RUUvmaYydiLqXQMjQRjfqgPSB/1xVu1nEJD2AITugopsSPv
	ckkdIxWULVtGYDZ6jAykJPo78iNCvmRy+VNWPR3ePlOKlzCkNryr9Q6ZjaV0r20W8sKq/yyYsYX
	zHVaQkKIK/aLO+LYAgsKWB1JxLRp17TM2TVlgZOjpSVstz/ePT+WbFv9f5/leuglhyodvZ2B6Dd
	+0cOFen27808R16BgqR3T/xncvu8fQX8/NepMsFVWn+xllLJm+gqZ5yT0t9/fBa/u31AnmZBPaT
	XkeeIaNLMm9r8ew5C9o4IPYUas/X201S0dA==
X-Google-Smtp-Source: AGHT+IFm3nEZ9gY9atSzADAapLMqEef81qmFhhoX5lX79/arRk7VY+zxr+6spU/7xP1WGipqyHp2rw==
X-Received: by 2002:a17:903:3bc6:b0:224:fa0:36da with SMTP id d9443c01a7336-22a8a85bf1amr140171225ad.18.1744049370199;
        Mon, 07 Apr 2025 11:09:30 -0700 (PDT)
Received: from localhost.localdomain (118-160-134-247.dynamic-ip.hinet.net. [118.160.134.247])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2297865e03esm84282455ad.146.2025.04.07.11.09.26
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 07 Apr 2025 11:09:29 -0700 (PDT)
From: Andy Chiu <andybnac@gmail.com>
To: linux-riscv@lists.infradead.org,
	alexghiti@rivosinc.com,
	palmer@dabbelt.com
Cc: Andy Chiu <andy.chiu@sifive.com>,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@rivosinc.com>,
	linux-kernel@vger.kernel.org,
	Alexandre Ghiti <alex@ghiti.fr>,
	puranjay12@gmail.com,
	paul.walmsley@sifive.com,
	greentime.hu@sifive.com,
	nick.hu@sifive.com,
	nylon.chen@sifive.com,
	eric.lin@sifive.com,
	vicent.chen@sifive.com,
	zong.li@sifive.com,
	yongxuan.wang@sifive.com,
	samuel.holland@sifive.com,
	olivia.chu@sifive.com,
	c2232430@gmail.com
Subject: [PATCH v4 09/12] riscv: ftrace: support PREEMPT
Date: Tue,  8 Apr 2025 02:08:33 +0800
Message-Id: <20250407180838.42877-9-andybnac@gmail.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-145)
In-Reply-To: <20250407180838.42877-1-andybnac@gmail.com>
References: <20250407180838.42877-1-andybnac@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Andy Chiu <andy.chiu@sifive.com>

Now, we can safely enable dynamic ftrace with kernel preemption.

Signed-off-by: Andy Chiu <andy.chiu@sifive.com>
Reviewed-by: Björn Töpel <bjorn@rivosinc.com>
---
 arch/riscv/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 7dbed10843d2..dc0fc11b6e96 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -157,7 +157,7 @@ config RISCV
 	select HAVE_FTRACE_MCOUNT_RECORD if !XIP_KERNEL
 	select HAVE_FUNCTION_GRAPH_TRACER if HAVE_DYNAMIC_FTRACE_WITH_ARGS
 	select HAVE_FUNCTION_GRAPH_FREGS
-	select HAVE_FUNCTION_TRACER if !XIP_KERNEL && !PREEMPTION
+	select HAVE_FUNCTION_TRACER if !XIP_KERNEL
 	select HAVE_EBPF_JIT if MMU
 	select HAVE_GUP_FAST if MMU
 	select HAVE_FUNCTION_ARG_ACCESS_API
-- 
2.39.3 (Apple Git-145)

