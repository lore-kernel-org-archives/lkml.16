Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B1CC25F7BD;
	Fri,  9 May 2025 20:34:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746822890; cv=none; b=WheB47OEqYCOinMmg0DnSDKNMHMosU26beF6R6Ff0rXj7Atlb1ZNZlbELDVtgR0jGKMqOOYwBkJe3tJVv989MHuB1Yyr1ZzFLGeB9gofZlDF7S6ZYmSgaKFewkUhjy6kVlstYMS2Uxjz/6V0UmZNHbQBxBYCVC0xGwOqSsNRbK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746822890; c=relaxed/simple;
	bh=p0N1JkT2/xLLLi8cugDEWXwuM7uwy0AJmnt0uKprhmQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Zt7+3N6TLAv/X4iydy6yQCzU8xl1kT8e4WU4v3oxeRa1R2q9NRic+zV/yAK5hiBibM/9NRq1UkcPiLzzNJNa7KVwvn2viX0g8X9jNVTXL1rmP5f9Y3uDNNSVtgHaFSZcJua9TOybvUujp8HMAHwu9l5a60zlNwc8RX/phw/EWfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kq2tEt8/; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kq2tEt8/"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-ad21c5d9db2so231652666b.3;
        Fri, 09 May 2025 13:34:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746822886; x=1747427686; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gTQz1qp+LCvTxWsAMMO3CfVyc44sS81nVli0WMqNCPI=;
        b=kq2tEt8/uX1FRqCFSXRXq7T4VlUFfa7c6797SpUUSigSyR+JPYczPi3RWyEQ0eIfqx
         MxRHy1wD4CuakPrd2D6fOjK6uvXQmmyUqKJDz8LGjG0pXVsE88Bo9y0krHz2EE/gMt8Z
         5jFDQa6/kOFGR2K1L7eXeQbf2gsFRAS734S5jSTLt7YKN5da9Cr5VSW5TTsfp/oKyEIA
         a8uyEPp66ft0cyXHF3uomjBjSFN4MRFJ4MvSteOzzwkylYE6KUUh/J2nw0Iuw1pQlOGl
         ePLupgaJJEPIgsKLmX7wjF+2TgXa9TsTnVmbrwWAQ8lFhM/Pf8cFOK4oiNTwUTDOP4ty
         KOHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746822886; x=1747427686;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gTQz1qp+LCvTxWsAMMO3CfVyc44sS81nVli0WMqNCPI=;
        b=fCRB71iU6NGYqWkLfP64Xm419Ce61nWLJQ7zAj457jetkDpel0Lm/ub7Fs8BH1lExf
         2fJXC80JeKR6+XVR+gJlVSrvR5pndtejNnZcq8W7gQT7hq/QJ+EpBbSlx79vA+KFEjx9
         6RfFSkAv7CEYfFGhj7HLFT8qoitgd/SL2N0WDeBVCcWng9tk0VMBcVNN5taKLJAFG84I
         tKpdAQkVxqtm3kTKwIRtRd5ca0JWFu06QwdhxVUEWp4+D/n1p5R6UHImhXFdyQhg8PJB
         mmafv+iCqvem49x4t3mtFyjC+vVMGUMHjRfFGi1J7UmgOqatYyzMvDzWQ4UGyWM4B51q
         V01w==
X-Forwarded-Encrypted: i=1; AJvYcCVawKPABsaQjGPQvdadVs3EDL57sEoEEPlK/UxBQsn3OW68gTnhQ6RVRHX4js9KYb/TgY5pkQViCcXbMLo=@vger.kernel.org
X-Gm-Message-State: AOJu0YxWFFbxm7DJZjOyqCSMmK0MW1Ve8blHwN03mox7Phfapkx42I1C
	boS/lU50N0UP21qRWP/fa+pVL4GNvtsqoM8i7zN8jpCKglViOavVoTw/
X-Gm-Gg: ASbGncva8a+YSfsmOf8PH/SIE3qrla45B+tPoWr/Q7q6Ffej9ZPwmjaMtI+iZVfEszf
	L7xLmRPL83YAXtz1yDl3zl1bnKOsTF18jZd45YYgDnYidG+ZQE7lqNitlupZ0LlcBMcAcTtoyOl
	nV08o42llYASl7GkF5gLRkh+nuxoc2Yll9YDKf2z+/fmw8oN0fOFoyjpwMxJGVyYbLHYGhLGqOP
	OvfKfJankiDroQEiqbu6yxNSUufPFFgvl94C5/uzHw7njxsJEnqK90INXjyQLGXt2SRGjgz7KOS
	dXRMUmtuY0YoZa3e7myIBWKZs8v6rlCZU5DAwKS5AK0npgF4FFkP0vEXbfEUinxmpLy3Hew=
X-Google-Smtp-Source: AGHT+IE5zcH6g670goLcEybs0egiuk2RibDUz7ViDwJg1oceGAy80dAUzGHMwJsjnex3zruRHF2+Lw==
X-Received: by 2002:a17:907:a646:b0:ace:d3f0:e51d with SMTP id a640c23a62f3a-ad2192d52demr475689766b.54.1746822886056;
        Fri, 09 May 2025 13:34:46 -0700 (PDT)
Received: from localhost.localdomain ([46.53.251.33])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad2197bd219sm202255066b.141.2025.05.09.13.34.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 May 2025 13:34:45 -0700 (PDT)
From: Alexey Dobriyan <adobriyan@gmail.com>
To: corbet@lwn.net
Cc: workflows@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Alexey Dobriyan <adobriyan@gmail.com>
Subject: [PATCH 6/9] CodingStyle: recommend static_assert/_Static_assert
Date: Fri,  9 May 2025 23:34:27 +0300
Message-ID: <20250509203430.3448-6-adobriyan@gmail.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20250509203430.3448-1-adobriyan@gmail.com>
References: <20250509203430.3448-1-adobriyan@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Linux's BUG_ON is done backwards (condition is inverted).
But it is a long story.

However C11/C23 allow to partially transition to what all normal
programmers are used to, namely assert().

Deprecate BUILD_BUG_ON, recommend static_assert/_Static_assert.
And then some day BUG_ON will be flipped as well.

Signed-off-by: Alexey Dobriyan <adobriyan@gmail.com>
---
 Documentation/process/coding-style.rst | 23 +++++++++++++++++++----
 1 file changed, 19 insertions(+), 4 deletions(-)

diff --git a/Documentation/process/coding-style.rst b/Documentation/process/coding-style.rst
index 63c41125e713..f8d5151eb0d2 100644
--- a/Documentation/process/coding-style.rst
+++ b/Documentation/process/coding-style.rst
@@ -1302,11 +1302,26 @@ asked the kernel to crash if a WARN*() fires, and such users must be
 prepared to deal with the consequences of a system that is somewhat more
 likely to crash.
 
-Use BUILD_BUG_ON() for compile-time assertions
-**********************************************
+Use ``_Static_assert``/``static_assert`` to test things at compile time
+***********************************************************************
 
-The use of BUILD_BUG_ON() is acceptable and encouraged, because it is a
-compile-time assertion that has no effect at runtime.
+C99 has standardized ``_Static_assert`` keyword and C23 added ``static_assert``
+later making Linux specific ``BUILD_BUG_ON`` macro obsolete.
+
+Note that both forms of static assertions are classified as declaration and
+thus can be used (almost) anywhere in the code including top-level.
+Don't introduce fake functions to test things at compile time:
+
+.. code-block:: c
+
+	_Static_assert(sizeof(u32) == 4);
+	static_assert(sizeof(struct S) == 8);
+
+Also note that the second argument to ``static_assert`` can be omitted as an
+extension. Sometimes filename and line number of a compile error is all you
+need.
+
+See https://en.cppreference.com/w/c/language/_Static_assert for more information.
 
 References
 ----------
-- 
2.49.0

