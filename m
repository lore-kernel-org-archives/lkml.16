Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com [209.85.167.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF22926B098
	for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 17:41:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747417272; cv=none; b=V09Bm7EIsxb62FBwjaWnOvoQnbuf4m3eWcnojh59HFhiUMmivFCQ8yCzc7cTUgXlmKYm5EGYgBq5y+DsL7Bf7eeDaoqtgukdXKn7kd8/1kyBeuO3aGPcDerqldDF+bRYCoEQduDHzvqz7LdySkU3M0EeeogTnEXBn+CEcyN9710=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747417272; c=relaxed/simple;
	bh=UFNrjMUVg8DFjBXD+zhnzO1QA5PUaz5+Ak1O79HlU5s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MzW71vr7wSBVjU7J9W0DwtoMwT/t+X759jX/aIrV0rWxO2Uc3teuYEbW9bJ3wSGou+7BDNR1Ruukx2MOIM+n94Dic4WrfJmjEHxn7BHog+WyZrcQUB2wRtCA/Bb/AnjObvXSNpsqorov0kPm0wCdrRJl0vcAx7KqL49WzhdRJQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mW6MttKf; arc=none smtp.client-ip=209.85.167.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mW6MttKf"
Received: by mail-oi1-f175.google.com with SMTP id 5614622812f47-3f6aa4b3a7fso1188645b6e.3
        for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 10:41:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747417270; x=1748022070; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/29LGpyzNn0MDmWeJV1bJItc3uLZZ/lzjGkN5WG7MvI=;
        b=mW6MttKfXYEmOvptENnyoKqwqKllgkIo+aaO6VUvcZZpYaTjQnLTVHkUVR+P/QWqfP
         +UrKgifQ4pMGI1EMT1rDbnnl7RMRHr9Y+OHdr6Zq/fuJb0mpdW6nJOgQYpgCv42i/O1b
         tsHowsKCgx/QGcRYt3MLgZH/lnolbXcJ1ocZh1FUrkELro14LJS/NRS/Zs2k0+9TLkjS
         X00bb+kOojqLJ9+KTUluf/wWMcrmUfP6QYr448tP9TRPPrpy3AaqW0iujdXlhMWgz+Jb
         lpQytVkgtwbsfvgMZ9G8PARTCOD399MQBgnM2mEu75M3Wj1umx1kWBNE2KZWO4t6l1Tw
         91aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747417270; x=1748022070;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/29LGpyzNn0MDmWeJV1bJItc3uLZZ/lzjGkN5WG7MvI=;
        b=ATNFpGU9t96wdtzKww08Fjd1x3zZ1+F/J5kIYteqvcH6rHqO/zq5qUQN4svGzO3jnh
         MnTJO/Gq2b9PAndlT1orP7eY6NIGgmueL1NUm4iSqHuCj9jNetpYvN2WeWM2OUg049TD
         n8wU6SN1b/tAg5dWDPEN+MpwFER6/aDFVH1b8b6GzRoZoewvwsQFtSkKcE7o0A1h5HcR
         C2LCEUG2mDxW3MUSUG+iYq3KqIBALDy4HRkYFjBST/o6RRalUKUm5PjNq9GAtygM9P44
         rc6eTzUZiB7SLiqLJW9JILNRswBl569zTvSwqVdG6mYnhwW+0tDciVuaaj3ODl51tjos
         XsRQ==
X-Forwarded-Encrypted: i=1; AJvYcCXTT+BxV6Bm14ecpwk+c0YvrXHFUySCdWK5JbH9h2PWVyPYQjHkoapDqky/qERuPhJYLgNzGMfIESY1pEY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2TDIZzpnXY77RqKnVeXslUDCynfxGHh9sGlQEX89vx+VFOnP6
	JteIBv8QegyB6dtmK3Yaods6eWTQTyVrbwdKBDc0Z78tt0J7aBWUWKAD
X-Gm-Gg: ASbGnctCbxdxxVqtBBvIwpd7Ltt7f7YZdUvz20hiRNRTdSce1vXSCImahCJF+PHEysz
	fKcpw+kYGM4a/6pg5ZtUfmQRk5AucMjudIWxHSnfPqm7U2/tyUUhikPWUtnJOwP/qh80j6mLuwD
	SPG1dzM+SinWmHseiSyuF1m1N/uK4XB1UrXg4TlVrj0AD+n/19VlYmJTXiXCH0nOtltxKcEtU9M
	arXCIAzlb0OBctjpqT41XS+UKHzssUJMUplM7NDgDuCzegEcZ8r02Nwz4Shdvvt3luxjZ9PdmCQ
	sxX/G7es4JVubUdHcWCJZg0iFMEA8l7O+4BbXiGkzMJmXll0zybvbeN82yXjKrsc1uc=
X-Google-Smtp-Source: AGHT+IFq1fljpgopT1vLIk7PkA3q31CtPQYKrJznKVQmapb2Fn0PnllI3YghbkK3ca3bGaQXVeOtcw==
X-Received: by 2002:a05:6808:608e:b0:3fe:b1fd:527f with SMTP id 5614622812f47-404d8616f1emr2407180b6e.1.1747417269657;
        Fri, 16 May 2025 10:41:09 -0700 (PDT)
Received: from OST2.. ([166.196.113.177])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-404d9809bccsm377854b6e.29.2025.05.16.10.41.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 May 2025 10:41:09 -0700 (PDT)
From: Sravan Kumar Gundu <sravankumarlpu@gmail.com>
To: skhan@linuxfoundation.org,
	pmladek@suse.com,
	jani.nikula@intel.com,
	john.ogness@linutronix.de,
	gregkh@linuxfoundation.org,
	akpm@linux-foundation.org
Cc: Sravan Kumar Gundu <sravankumarlpu@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH] kernel: Format kernel-doc comments
Date: Fri, 16 May 2025 17:40:31 +0000
Message-ID: <20250516174031.2937-1-sravankumarlpu@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

kernel-doc function comment doesn't follows documentation commenting style
misinterpreting arguments description with function description

please see latest docs generated before applying this patch
https://docs.kernel.org/driver-api/basics.html#c.panic

Signed-off-by: Sravan Kumar Gundu <sravankumarlpu@gmail.com>
---
 kernel/panic.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/kernel/panic.c b/kernel/panic.c
index a3889f38153d..1f52922d1b2e 100644
--- a/kernel/panic.c
+++ b/kernel/panic.c
@@ -277,12 +277,10 @@ static void panic_other_cpus_shutdown(bool crash_kexec)
 }
 
 /**
- *	panic - halt the system
- *	@fmt: The text string to print
+ * panic - halt the system
+ * @fmt: The text string to print
  *
- *	Display a message, then perform cleanups.
- *
- *	This function never returns.
+ * Display a message, then perform cleanups. This function never returns.
  */
 void panic(const char *fmt, ...)
 {
-- 
2.43.0

