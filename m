Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 880A81E1C1A
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 19:39:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748374781; cv=none; b=OAH2DCwWHh5Ivr72bw8nV7PVkaUkS2yp7+LdSa0UNPuB5Ndo61ZMTw5yWwZM6B88oULaQipE8UshgkppeTQTF9WpIWSr/HeWJqJ4bmP1wKirco5hVEiAU5omKs5zgimsRmqEjDrRA1OGRSh332SXrAK8IznDxcOuIu5U0zMenoA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748374781; c=relaxed/simple;
	bh=brv/Dzc3G+0xJ9qhyuuN0xiV5ltOTAMZf49nNCeODA8=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=hTpY9aaS1b8eBWoZ7hYkXf/9ry+a9OpBkeW2nSfj1klHvGrs2Cr6QHPfGDBCv+lQD3eSGxLL0CrU364a7VJXm+hrvN1TWYe7XzPF2XaFKs1uXRrwwf1tDskPWjWrykRMLpnaF0HNTJoquOo57bac39aUF4gQoqHdJEY9xtC7GVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D213Toe2; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D213Toe2"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3a4db4d1bd7so375928f8f.3
        for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 12:39:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748374778; x=1748979578; darn=vger.kernel.org;
        h=content-transfer-encoding:subject:from:to:content-language
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=brv/Dzc3G+0xJ9qhyuuN0xiV5ltOTAMZf49nNCeODA8=;
        b=D213Toe2qEzEn1o4u3upRtwuyARnPyt2IlwOpyk+ZZRMXj/M69mX36h0x2KIeraTgm
         FOG2BaIswB59RK5dEa40TO2/8byw380JKP0PIE0ThyOt72hCyKq8ei+FvmqgR/lqF8y/
         yDnmq2R4xKcm0n2gMASdlUAKYinoW/awNJ6Vebio3aAHcAECONpLCGSslGKT3f05pqIy
         mWp/1SObdSVA9NQclXcMhqcIX9ANdVhnuDAwFvucnOMk/6kloTUM82eCPYkrY6Lo5OY3
         s7Vx/WhZ8eh/Tr8F6mfkWB+iv8hV1JCoiKvdGY/6WB+WxEf7TbBVHlyFXHn+MpypWDiN
         b29g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748374778; x=1748979578;
        h=content-transfer-encoding:subject:from:to:content-language
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=brv/Dzc3G+0xJ9qhyuuN0xiV5ltOTAMZf49nNCeODA8=;
        b=J5B5zHdkq3W/7Vrml/gKLSoJpZRzPkRuq/0NBEJJZLHtfa4murUj1OAFRhjA/DlwEt
         KI3fDHpHcb3ekgeL2X1tKyHEXOev6CHTHDhMHPAtrKGlbBov5WNvuEC3Zy/FtRvU4aeo
         UWJKy4hd0cf8PFJXhDwnhMlbxCf44U7q0b+wdpvhdFP2MzL1kcLujVsIfYEKpleCHsnZ
         qhuau1DN7YnYvwyDfn0tID+E6lok/3h2D1LTytF+53h2DRHzIAvXVUYui645u7PAVix1
         XKeNYA1TB4nYr/S25DFJ6vI0ZB5vxOAFidNBpjifpPQpCcEsDIJjS+JoN+15fJecDi2b
         4ElA==
X-Forwarded-Encrypted: i=1; AJvYcCVucl+HoQoLQXnbX17fSyj6Kqe8LeCid4uzN/L3x1lC3pHLxLmB+VbzKo+QYp5JnLT035q5qiXu9eaalTY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/gJlZKyhfxLo26oF/qZHGtnoVNRCrvtvKhW6fOE/UAXuBF8uy
	2DkzOLf7VoUf+j3MK5owcWJlfBTP87N8K0TZn7ZnTwzEjW6Uy3QLmSY=
X-Gm-Gg: ASbGncsLllagvXj0U8VqTEVpFzM0sBDQr6XrtaCD5gCnRuciPVw8A/4IzvdK1pFRJ0L
	F6lFWUw7GhpJVvGU5WopSqeuVULgyBBaWcF5oz9m3Nrt72LNWoYYNedTXRSsKhpvIwdRkGL2bx5
	Z21/jlC7VHTzUmsTgvnb6WjE8jzIlyilBYloACWXsWQq9PmsAuxP2gYZ1ht3EnBX58mqs1SHTgb
	kmOJazG+3LZBiASQAgAU1TQZAtc2ovBqtN+7ehnjBbUnRq3pP8kJV6K2dioDyUHt4333zhBaULP
	a08MhBM3lzDvKoGID7CgXFtzQrkx2MwxGQ4A/ER2QwHMRBg6gSMYVnAU/yvlFn/q/idOf5mtxZY
	L/rNUTKzhiJ16LVZXLTk=
X-Google-Smtp-Source: AGHT+IEnBiQ7nz+tEsQjp6QVHAtRCCPh8tM1luopBOrJkpXfCa+F32otGwZx1b9gB/4MB7FsdxxOYQ==
X-Received: by 2002:a05:600c:511f:b0:442:e608:12a6 with SMTP id 5b1f17b1804b1-44c91dc9fd0mr45484665e9.1.1748374777524;
        Tue, 27 May 2025 12:39:37 -0700 (PDT)
Received: from localhost (162.red-80-39-157.dynamicip.rima-tde.net. [80.39.157.162])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-447f1ef0b20sm286172265e9.14.2025.05.27.12.39.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 May 2025 12:39:37 -0700 (PDT)
Message-ID: <0fb8c99c-34f7-4bab-a182-cd9a94a161f4@gmail.com>
Date: Tue, 27 May 2025 21:39:36 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Language: en-US, en-GB, es-ES
To: Masahiro Yamada <masahiroy@kernel.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 KERNEL ML <linux-kernel@vger.kernel.org>
From: Xose Vazquez Perez <xose.vazquez@gmail.com>
Subject: Re: [GIT PULL] Kbuild fixes for v6.15-rc7
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Linus Torvalds wrote:

> There's probably a small amount of "the kernel keeps growing, so build
> inevitably slow down anyway", but yeah, it's probably just the slower
> compiler that is what I notice.

gcc-14 is also available:

$ dnf install gcc14
$ rpm -ql gcc14 | grep bin
/usr/bin/cpp-14
/usr/bin/gcc-14
/usr/bin/gcc-ar-14
/usr/bin/gcc-nm-14
/usr/bin/gcc-ranlib-14
/usr/bin/gcov-14
/usr/bin/gcov-dump-14
/usr/bin/gcov-tool-14
/usr/bin/lto-dump-14
/usr/bin/x86_64-redhat-linux-gcc-14
