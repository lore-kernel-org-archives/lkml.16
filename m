Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4DD525F785;
	Fri,  9 May 2025 20:34:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746822888; cv=none; b=mgye53wbeALWUBS6FjAjvnAvLFt7uWCyo7V/SbDP+6tzjkmjSHKHrExYNZwleN6b4AMmeu7i18+6S/J5r/jo1pQF4hljSG64BbzZPpO40nydQIRFKRcCFX9eTS+1mGJpGa/PYMtMz6ty6JlcqC+UmLG6g1G719BF++DHjIJOJkY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746822888; c=relaxed/simple;
	bh=kPFB/oDA/yPmG/oLic+MIvk+/TBR3j/A0nDTZGOZ9m8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=C14CJl6gO6VQlM7Lc1bFcToqc+/6SLpZNW4T1UVynfGGnJ/aK6/tr2L3DnNuf7bAYl3N/4VYIl8woAvM4ID/HTi6OXna8Xaq3tHcXrOxrtNedsWaxldqEmOKAvVmyBRuWtipWNFvOs4A/238Vg06+KnlEc5Fm0DsZijNW29Bro0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c3jj09RF; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c3jj09RF"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-acb615228a4so687401066b.0;
        Fri, 09 May 2025 13:34:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746822885; x=1747427685; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S4boxaVVlC8FsLZlX9BFkSmjFeV9ooQQovdkGIoB3Ao=;
        b=c3jj09RF46kqHe2HKup5tuANh4YR1YalnX222nZzBLtzOlMs3sjiq7whbDiANdKqsB
         YijFaLRgeBeXUIyZaL31UQ6H+PITSDyN4vP/qxuuXOTuSaPk9+BdMcrsSdr/csmVEgkO
         UBsoGA1XOq1Q4JoSZ9sYAk/VRwYwBCqKIninTvHzPPAhXohviLMJOoQSg79lptFwZIHK
         JsSrti2TapOG29o+4k1pfFkEZEM/CR3ggQpISbK5sc9LR9Ez+DSdWYaapkekv2LPNRyY
         OGlkEJnKlQUat8ZrN+iWJ7brYpwrKN8Arfr8vd/916xSN+D9GCpqqT50OSAJYGdFqsWC
         dUxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746822885; x=1747427685;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S4boxaVVlC8FsLZlX9BFkSmjFeV9ooQQovdkGIoB3Ao=;
        b=IFLopWKk2/R+rUJ7ungebAQPrLQ1uNiqjBcKiB6839WcIBcqoHbTmqbJgTEttfkaZo
         HaPS6xsveIvDnIGTW81tUeqoZ2bq2fm2bKSboujtXGvbKyvJG3EfCH5qzPYAQ0ZEXL2F
         ofaz52SAGjA1U+v7vYKPqmpVzI5b1VVH8+VIJZjksFLq71ro3W+9L+At4I1w6rpQzhim
         NU0uvTqE31zYPLQAB1goXuXY7w4JPfqNkKQsTztlXDFoqxLk+Ts17ED1+fZgPthSsXni
         UCYdu4pfIXVx5GWGvYiJwcmIKHCvFD9Bk9gEG741N+qDflR4V5AIybiKFoXs6empcD27
         RhAg==
X-Forwarded-Encrypted: i=1; AJvYcCXYeWtxD1Z2VrCoaWbh0g1e3lXz0Xp3pUsDeJ4IlyTQSlMMEZoCpffmWdXjNm9kooZ06GvDUObMgeJQCJ0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzifRxG5rkNYdtKdy34jXhw+Uo9P30UpghqJpd+4PuqSXSI6uIj
	UUNiUKUWRZ1Et9yeYAY46C1/pG5UzU0LoNaWdzpSN/EerF4FHLDg0hYK
X-Gm-Gg: ASbGncuk7Dsdor1JWyyTrC80sVADax44cjspXXIs+9KfaSfvQO7b8TqR680qcte40ui
	rAAeiWlT/NZHSUDsFmxLaNMXSDU99oG4ZrCXK1LSTTv27hPvbvYMsVPrVVCm9/ypUKzoI2c6nxN
	nDlXwCTOQH09ohB2/bVy2FvLW5ZjvawyvFIbnyA2lUxfeyb5XbN5D96Ex1EvM/I9WSgpUVASD6D
	+CBaPhpHo+Z2uC/3hWs2QeYFEIKDAn9KdgBiUH/kA5NB1u1qbyP4gtyWO1khT6eV8eEE+rUFSGg
	7hLEod0AFQpt8nX7xUuPvtJegu1aQSnP3G84sVnONq4WvobYq3qq9dHdifCHQXAw/uRHbCc=
X-Google-Smtp-Source: AGHT+IFB5orfr+OVIXlyPi2PrLK141JqOtAQPPcIWvPEX2QMx7O6IOIMTbjy3dnyiR7URghN4134OA==
X-Received: by 2002:a17:906:6205:b0:acb:37ae:619c with SMTP id a640c23a62f3a-ad21b21d279mr397950266b.15.1746822884523;
        Fri, 09 May 2025 13:34:44 -0700 (PDT)
Received: from localhost.localdomain ([46.53.251.33])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad2197bd219sm202255066b.141.2025.05.09.13.34.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 May 2025 13:34:44 -0700 (PDT)
From: Alexey Dobriyan <adobriyan@gmail.com>
To: corbet@lwn.net
Cc: workflows@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Alexey Dobriyan <adobriyan@gmail.com>
Subject: [PATCH 4/9] CodingStyle: mention "typedef struct S {} S;" if typedef is used
Date: Fri,  9 May 2025 23:34:25 +0300
Message-ID: <20250509203430.3448-4-adobriyan@gmail.com>
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

Signed-off-by: Alexey Dobriyan <adobriyan@gmail.com>
---
 Documentation/process/coding-style.rst | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/Documentation/process/coding-style.rst b/Documentation/process/coding-style.rst
index ac9c1dbe00b7..5c5902a0f897 100644
--- a/Documentation/process/coding-style.rst
+++ b/Documentation/process/coding-style.rst
@@ -443,6 +443,20 @@ EVER use a typedef unless you can clearly match one of those rules.
 In general, a pointer, or a struct that has elements that can reasonably
 be directly accessed should **never** be a typedef.
 
+If you must use ``typedef`` consider using identical names for both the type
+and its alias so that the type can be forward declared if necessary:
+
+.. code-block:: c
+
+	typedef struct S { ... } S;
+	typedef union U { ... } U;
+
+	struct S;
+	union U;
+	int f(struct S *s, union U *u);
+
+
+Forward declaring by typedef'ed name doesn't work.
 
 Functions
 ---------
-- 
2.49.0

