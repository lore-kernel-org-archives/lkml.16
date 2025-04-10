Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com [209.85.167.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53D2F204C39
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 07:05:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744268735; cv=none; b=hAoEVhVvjgrrbhDJT0LXQB33r0PDroAZj/9G+0Fo8ZWMzjUPqMjbFK5YEw7jhPRBPZCnpFyLP0I738PRXQs5P9hFjqnnhZcq9l5tzQb1eNF3/raebDJS9tdhgVjr7JNIuVdCcdnR3UR7TZNE14J54/Mx5820uwYC5sSepi/09jU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744268735; c=relaxed/simple;
	bh=HKMnBVdHsElfI+VU/kTaLpcWor2d4s9BxLReognxMNg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=jAyMmILhG4mkkgHPDWXE6YNmAWuSELykPxOuuLLIwF0eEUO4fQ6BBhlmnKRJxggmTR901gzNs2og8v0YMNy7vqlUCAzdSpAqiIpdYPoKGiBRWrBB40QCFFLoPflUX+5KvydKy6gqUBk2CTfXc9TO/iabRX5eAO/2muzP/Pnc550=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tenstorrent.com; spf=pass smtp.mailfrom=tenstorrent.com; dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.b=HaELGWEq; arc=none smtp.client-ip=209.85.167.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tenstorrent.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tenstorrent.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.b="HaELGWEq"
Received: by mail-oi1-f176.google.com with SMTP id 5614622812f47-3f6a92f2328so292914b6e.0
        for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 00:05:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1744268732; x=1744873532; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mh8UBXGzUbnvdsif2sw+KTYhRC1BSjBoml8SqEobyIk=;
        b=HaELGWEqy2aRo7uxRbyFlOX3yMS8h5N7OZRrCaLqZwIyTd6yKPxz+p9OPoqt1JEWNf
         F9zSBPFF0pSTioJ275CYOWte3oKZ+LhyvV4XAhwgIYUByMUZSWnokzqqtLhBW3BxSmxM
         TPS+T9TP7eiCPRtdulqNtRgCc1p6bwgdHSxDybh/nr5UeX70wR9pAD/KIHdhUp7a6gmq
         F8ZSKIhVKoBOepeya+KhFB18n+rMs1z+kGD/QQ9/70nY869CDzu28BQHjkHc1AujJ6k6
         ysmAQljMZQ2lCt3FfFkcQycREVe9esLuUaLhIIcqM9+ftvhyXQHiChQvYz9SslzoXnNe
         vS9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744268732; x=1744873532;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mh8UBXGzUbnvdsif2sw+KTYhRC1BSjBoml8SqEobyIk=;
        b=b0HmITRHUdKKvaccpjaoa+FGkQrGiUEImubtib9U4flBbDmYrNwEOEqun7xEPOvwtm
         lN/0lurYC/yPIAF8vqriQEzn0QgxPFDfNhY9ZBby4GmCMxy3JyqkBej42RSqZRkt5qbG
         bziAFVUMI03rxWNbdaH13P4aij9sSA9VxPNH6zOqQ1IzK5rnVGxDTLgfcXv8ouS6RheX
         pc/+jjBiOiFYxJpBmF9Fzc6ILZRx0L1btQBRJLjk/meqpMcCa3SEVcdMcAggncnpJhKX
         HrrXGD7kYNLIrguEY69rdXQemr1ww5iMiEfFgW1b92j55rkAOI8q509VRJng4HJ1HbvC
         6qFQ==
X-Forwarded-Encrypted: i=1; AJvYcCX0ukKzXq8m+md6MvlVMMv/n71+MnSD7RbSzALN02TO9OOtmoE1TG3wICeVWnmlklovHatNd+hwVtkKlQ4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxY+rEv5rBus/+bSoiheCTekYRAftle9zCDEkNTCs28sv8l9Fo7
	G+4kgKNM/6K+tnypFv3Pq91jXs/Sizampuxo3CqJwRmbQJ5Khv27dDd17ucVpA==
X-Gm-Gg: ASbGncsIIaQSpFCvsKgYLQQJbFZ9bjLZFnFK4TdlDwRnplFMp9Dvknjhn7Co3i2E8rp
	bNzIi1SqeKibv0tMd4phQklYJCEky1C+hgcp46kqyyccTt7xo6ZlMxtl3HyTvPBKajQ2N02PoAY
	Huvx54t4nOZlHEILN4zj4iQ/9ojPA2qZq+lDs0t4/Wq/I99E7tUtGl0vQ+vWatcxk/N6hMAUVYW
	ccYDD8ecUZpfyWH4MHv6wXt9K1JB/L/qeP0hPd6rooNNaOQQswS6JoBURgzb7YCiAxgxO3TKRAz
	Ct13pnws9WNwVNR9ek2s/d01Y7fN5mubr8iRGYCL2TuSoXrR7NtabZJJv7F6O0LBAm5GWQ==
X-Google-Smtp-Source: AGHT+IE/XTUu6u5msxN+Qw7e3Ta4Mxkm8pI5BxCJg/oExJOAteicyPdgbu1SRM4uzbVEJeCFnx0ZuA==
X-Received: by 2002:a05:6808:2f13:b0:3f6:7677:5bef with SMTP id 5614622812f47-4007bfa52femr977035b6e.2.1744268732358;
        Thu, 10 Apr 2025 00:05:32 -0700 (PDT)
Received: from aus-ird.tenstorrent.com ([38.104.49.66])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-40076282ce8sm461369b6e.9.2025.04.10.00.05.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 00:05:31 -0700 (PDT)
From: Cyril Bur <cyrilbur@tenstorrent.com>
To: palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	paul.walmsley@sifive.com,
	charlie@rivosinc.com,
	jrtc27@jrtc27.com,
	ben.dooks@codethink.co.uk,
	alex@ghiti.fr
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	jszhang@kernel.org
Subject: [PATCH v6 3/5] riscv: uaccess: use input constraints for ptr of __put_user()
Date: Thu, 10 Apr 2025 07:05:24 +0000
Message-Id: <20250410070526.3160847-4-cyrilbur@tenstorrent.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250410070526.3160847-1-cyrilbur@tenstorrent.com>
References: <20250410070526.3160847-1-cyrilbur@tenstorrent.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jisheng Zhang <jszhang@kernel.org>

Putting ptr in the inputs as opposed to output may seem incorrect but
this is done for a few reasons:
- Not having it in the output permits the use of asm goto in a
  subsequent patch. There are bugs in gcc [1] which would otherwise
  prevent it.
- Since the output memory is userspace there isn't any real benefit from
  telling the compiler about the memory clobber.
- x86, arm and powerpc all use this technique.

Link: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=113921 # 1

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
[Cyril Bur: Rewritten commit message]
Signed-off-by: Cyril Bur <cyrilbur@tenstorrent.com>
---
 arch/riscv/include/asm/uaccess.h | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/arch/riscv/include/asm/uaccess.h b/arch/riscv/include/asm/uaccess.h
index c9a461467bf4..da36057847f0 100644
--- a/arch/riscv/include/asm/uaccess.h
+++ b/arch/riscv/include/asm/uaccess.h
@@ -219,11 +219,11 @@ do {								\
 	__typeof__(*(ptr)) __x = x;				\
 	__asm__ __volatile__ (					\
 		"1:\n"						\
-		"	" insn " %z2, %1\n"			\
+		"	" insn " %z1, %2\n"			\
 		"2:\n"						\
 		_ASM_EXTABLE_UACCESS_ERR(1b, 2b, %0)		\
-		: "+r" (err), "=m" (*(ptr))			\
-		: "rJ" (__x));					\
+		: "+r" (err)					\
+		: "rJ" (__x), "m"(*(ptr)));			\
 } while (0)
 
 #ifdef CONFIG_64BIT
@@ -236,16 +236,16 @@ do {								\
 	u64 __x = (__typeof__((x)-(x)))(x);			\
 	__asm__ __volatile__ (					\
 		"1:\n"						\
-		"	sw %z3, %1\n"				\
+		"	sw %z1, %3\n"				\
 		"2:\n"						\
-		"	sw %z4, %2\n"				\
+		"	sw %z2, %4\n"				\
 		"3:\n"						\
 		_ASM_EXTABLE_UACCESS_ERR(1b, 3b, %0)		\
 		_ASM_EXTABLE_UACCESS_ERR(2b, 3b, %0)		\
-		: "+r" (err),					\
-			"=m" (__ptr[__LSW]),			\
-			"=m" (__ptr[__MSW])			\
-		: "rJ" (__x), "rJ" (__x >> 32));		\
+		: "+r" (err)					\
+		: "rJ" (__x), "rJ" (__x >> 32),			\
+			"m" (__ptr[__LSW]),			\
+			"m" (__ptr[__MSW]));			\
 } while (0)
 #endif /* CONFIG_64BIT */
 
-- 
2.34.1

