Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53ADC21420C
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 20:30:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743539444; cv=none; b=okM7tYERqDK8aUk1oSDCn4dm84zV7t8PXLCJCRH7W7Qj1VI+7ehqdZXLBWQG7IqxwQ4f3tDkEFmADLhiosSR/PCH+yGLjKHd83OVzYNUt2x5Z5WDy7wHgQy/VV9GboOgIontJMPz4lXgC/p5X0N4FUunflvD/m41/GXrhSqMJqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743539444; c=relaxed/simple;
	bh=e1ShIkamowVUA9eVIDtAHBesCYliDssvEraQvEbebDw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZudrjbVZ/Bd1RClvt2PHkou+sBHJX6kpZXybKt8SkVh0nfCqsNXXwZCHMh5MevTgH7sbSCQuiuglOishy6l9820TmosHPvm0SnulN76wySwBT3s0eUQOKDpo7IJQc8SMB+8PEWoHgHp9mXTffn1lL6HNRR0WQFwjuRekbCgK3c4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dtcL+eRZ; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dtcL+eRZ"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-43cef035a3bso43778655e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 01 Apr 2025 13:30:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743539440; x=1744144240; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6QHmwB4LgIc5d8nRTjkH67nVHdKKt8PlUfNNTxoySLI=;
        b=dtcL+eRZzFCDBJQVI5m6Efwnp7/ynd6J9D3DP0uNQpb4sR5uDCjuqEMg3B24aq+2/s
         kJ0ieaxum3mq8r5I2mbzSb5tpRMvA0sWZS/KeR/U6tKuCjbNgsfbWI7V16UDHW1OAg8+
         aMmip0rCaQCR29kBFkUTbzro1uAimOrMsHeVNUmmJFAAgZ+4NBTkL1aPpriUqa4VQ3Mp
         KljWzz00SPmHJoeC1GnFBRdm3hc0PTjguEmTUp7wqAlJIV0gzZ9Qp5KxJqYN3em5m+Nw
         VFFb+5GpUYRUPsMwArFOV2Dh1wij+KoiwsHlRR9VpNobsegK4pM+TN34Y9Kz8fgZAOPd
         3BZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743539440; x=1744144240;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6QHmwB4LgIc5d8nRTjkH67nVHdKKt8PlUfNNTxoySLI=;
        b=Gpid4dnk9T7Fw/I11MB8ZmVe2jkZBsuTH1ImxBug9N9pzFPnSZACAqyjs0oTbw+idy
         wIqpF/1mp8XEGkd3MG9Am0dNFN74dX+RrNI6hRFY1H0Tnjgi9JvElRBEaQ9yQtagi58M
         q+O+wBfDDpw68Oaz2DJCParycDOUnrUPSSu2kuEQ+lEbtJYvqoRpXuSyibCyZTkmGB2a
         sut4aXJXHt3oUQv0r6IzXYyp2rdkYfD/8/qByEKsUGGQCa8hltSdj/JnJOQ+/F3fWL28
         JnIg6b5za/1eLhvleKOxpjirQ1u71lOKQR1bQ1KKKwLmuKQZ7OPuAl32lnHio75w7U82
         vUAA==
X-Forwarded-Encrypted: i=1; AJvYcCV2M92404gnsje+OTVCZBn51SCpKh3+4B+2bLstVYK4tjQJQY5yohSj5n+rL40C7fmQQs7Nu+LScqiUcbA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0343KkdxuUQgQgueKy2E6WTk6BU2ntNi2autT7FEjw3f7+975
	N8bL97XWGP6Mn7seEAGZbD3nvtuya4gosDG/C0BY9Zqc6Wh7b8LO
X-Gm-Gg: ASbGncuNUTmOqo1XENrULB3qWNnXIc4L/SUvRRDeA2UXqJmDKIKamFe91bgyVpT/pW5
	6G7EIMMnT1hm1gYZyFsxJ1kuCFSsTTP3ZryjBUHQlsw32i19Y0kw/jeYWJdOvk0lHXqFJUHReb7
	P+QkRwklUZHkLlr7dwCWkzxoSHX/ujXUYDbaPRruVjpp1Q6qmANSKdCHlfppTRDxddaIwSvOt63
	zmK6QKPK4ZChY/CwZVYJv12xPngc6vF14WoFYcYDoAPFjTQF0nx9uczkqDqSvcx5J4zczzybPpF
	qc88mGJkEesZbVzCGgUZ6SKWAkOVX4R+CI9vCScaYWEn7K6GOSmpmetWL/2G
X-Google-Smtp-Source: AGHT+IF6WoA924thzyiezlrUcswx4u2tIuuRHX0f73idiC4a4c+coVG5HBcFiOVXH22mv/K63QVGoQ==
X-Received: by 2002:a05:600c:1e1f:b0:43c:fd27:a216 with SMTP id 5b1f17b1804b1-43db62b7121mr131833025e9.23.1743539440203;
        Tue, 01 Apr 2025 13:30:40 -0700 (PDT)
Received: from f.. (cst-prg-92-82.cust.vodafone.cz. [46.135.92.82])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d8ff02f9csm168010325e9.26.2025.04.01.13.30.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Apr 2025 13:30:39 -0700 (PDT)
From: Mateusz Guzik <mjguzik@gmail.com>
To: mingo@redhat.com
Cc: x86@kernel.org,
	linux-kernel@vger.kernel.org,
	Mateusz Guzik <mjguzik@gmail.com>
Subject: [PATCH] x86: predict __access_ok() returning true
Date: Tue,  1 Apr 2025 22:30:29 +0200
Message-ID: <20250401203029.1132135-1-mjguzik@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This works around what seems to be an optimization bug in gcc (at least
13.3.0), where it predicts access_ok() to fail despite the hint to the
contrary.

_copy_to_user contains:
	if (access_ok(to, n)) {
		instrument_copy_to_user(to, from, n);
		n = raw_copy_to_user(to, from, n);
	}

Where access_ok is likely(__access_ok(addr, size)), yet the compiler
emits conditional jumps forward for the case where it succeeds:

<+0>:     endbr64
<+4>:     mov    %rdx,%rcx
<+7>:     mov    %rdx,%rax
<+10>:    xor    %edx,%edx
<+12>:    add    %rdi,%rcx
<+15>:    setb   %dl
<+18>:    movabs $0x123456789abcdef,%r8
<+28>:    test   %rdx,%rdx
<+31>:    jne    0xffffffff81b3b7c6 <_copy_to_user+38>
<+33>:    cmp    %rcx,%r8
<+36>:    jae    0xffffffff81b3b7cb <_copy_to_user+43>
<+38>:    jmp    0xffffffff822673e0 <__x86_return_thunk>
<+43>:    nop
<+44>:    nop
<+45>:    nop
<+46>:    mov    %rax,%rcx
<+49>:    rep movsb %ds:(%rsi),%es:(%rdi)
<+51>:    nop
<+52>:    nop
<+53>:    nop
<+54>:    mov    %rcx,%rax
<+57>:    nop
<+58>:    nop
<+59>:    nop
<+60>:    jmp    0xffffffff822673e0 <__x86_return_thunk>

Patching _copy_to_user() to likely() around the access_ok() use does
not change the asm.

However, spelling out the prediction *within* __access_ok() does the
trick:
<+0>:     endbr64
<+4>:     xor    %eax,%eax
<+6>:     mov    %rdx,%rcx
<+9>:     add    %rdi,%rdx
<+12>:    setb   %al
<+15>:    movabs $0x123456789abcdef,%r8
<+25>:    test   %rax,%rax
<+28>:    jne    0xffffffff81b315e6 <_copy_to_user+54>
<+30>:    cmp    %rdx,%r8
<+33>:    jb     0xffffffff81b315e6 <_copy_to_user+54>
<+35>:    nop
<+36>:    nop
<+37>:    nop
<+38>:    rep movsb %ds:(%rsi),%es:(%rdi)
<+40>:    nop
<+41>:    nop
<+42>:    nop
<+43>:    nop
<+44>:    nop
<+45>:    nop
<+46>:    mov    %rcx,%rax
<+49>:    jmp    0xffffffff82255ba0 <__x86_return_thunk>
<+54>:    mov    %rcx,%rax
<+57>:    jmp    0xffffffff82255ba0 <__x86_return_thunk>

Signed-off-by: Mateusz Guzik <mjguzik@gmail.com>
---

I did not investigate what's going on here. It may be other spots are
also suffering.

If someone commits to figuring out what went wrong I'll be happy to drop
this patch. Otherwise this can be worked around at least for access_ok()
consumers.

 arch/x86/include/asm/uaccess_64.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/x86/include/asm/uaccess_64.h b/arch/x86/include/asm/uaccess_64.h
index c52f0133425b..30c912375260 100644
--- a/arch/x86/include/asm/uaccess_64.h
+++ b/arch/x86/include/asm/uaccess_64.h
@@ -98,11 +98,11 @@ static inline void __user *mask_user_address(const void __user *ptr)
 static inline bool __access_ok(const void __user *ptr, unsigned long size)
 {
 	if (__builtin_constant_p(size <= PAGE_SIZE) && size <= PAGE_SIZE) {
-		return valid_user_address(ptr);
+		return likely(valid_user_address(ptr));
 	} else {
 		unsigned long sum = size + (__force unsigned long)ptr;
 
-		return valid_user_address(sum) && sum >= (__force unsigned long)ptr;
+		return likely(valid_user_address(sum) && sum >= (__force unsigned long)ptr);
 	}
 }
 #define __access_ok __access_ok
-- 
2.43.0

