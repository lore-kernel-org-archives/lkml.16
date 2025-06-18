Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50A052F0039
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 16:34:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750264483; cv=none; b=BzmkUMVIo2RShUz3tPV1d3loggBEvMTPl3ZkN0oSwZEzY3dXCk689Pzjwqmu0ZCQqUrwuM1hQ4xNcVfUSBdhiiaF2dbOyo+VCoFQUp1TD/Ur+OKSBA3imG27rUOoMStLTfSXCozbY1L+uSrmKpOGyOQ5SI3CBee6yj1j7AwbbN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750264483; c=relaxed/simple;
	bh=ZzkADdvrUYp2iBklNDWW6xzN0gMHXVooR4VxL/q0Dq0=;
	h=Date:Message-ID:From:To:Cc:Subject; b=CQ8E+ugBYnEWeh8V8AePlzOPcYoIGnLWgH570g9AaxhpQhUV8lmNv8tXWySwJhtpyz8UBVuCOTAeFSGJ10kMbkE8qntKbu5QWc6YunwmrZdn5IGrSKDXTckM+YtUcjTc5H2GyLSusqT00hzFpnUwijhh9UbiOdzHUeBVWkzFN8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=VCt6yaDd; arc=none smtp.client-ip=209.85.222.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="VCt6yaDd"
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-7d3e5df4785so111717385a.0
        for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 09:34:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1750264479; x=1750869279; darn=vger.kernel.org;
        h=subject:cc:to:from:message-id:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=imh5Ssw3G0KGFdr40XoL+KWm94eOloF5qrtOJ+fWZB8=;
        b=VCt6yaDdn3tqn0oi6o/OUg9dN5QKBmB1+CSNLD9T/Mectqsiw5Di3ihKtFq9VSUip0
         kbDXiVw/zk1i4+lb4XiCVMm/f7+/POeF192NrrnAr1Eh1Zve117g2SUqk6CSWt2SxLQ7
         6/+3UGaQ1t3JCUJmM3T1nXnLtoKnFYcViqYa5b4EUiMnwXBQe5HTgYWOqyrmt3coebGW
         ++6Fqj2GzJdfc2cgvZLYpDUmscDPg+Lsy9lcIwKuj/ssNssd0q5UiC/z7KsEsPxVh/cP
         yVtIHcCBMfWh2KLMIKFz08KYQAlR3b2FrPWk/5YlTq+NUMCeZV0g5Tkv5z8UdErLNnyR
         njBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750264479; x=1750869279;
        h=subject:cc:to:from:message-id:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=imh5Ssw3G0KGFdr40XoL+KWm94eOloF5qrtOJ+fWZB8=;
        b=d+oQSPPfr49/JBt4GhzJ4e0896yT//KauRQa2mJsOO1fxXIMyRFiBYzNKdNHsVmbuv
         WkWkgocx92pOFm3Ysm/gM4DP9I3WGA5I7/7+0J3IIds5q982+gUmLwZdY6/NgZ+pM0Fi
         Hxdn65cwYs9ZRZiymPWJQh8lXcASOFp8jyVSms5pqcTnhvITEITJ4uyMUxvPb6wCHpCM
         G6DTPdZ0HOsjn7FHKrDvbUWWbogjZ9qDAsXbbC5BUQbiUFr6Q57hap/Sn8xceeL8Pl8H
         jZlqyfNdpJVvPwP2Q57ZU6CKDLd+xx0XC6yHAuslyhX4FYYByLjv6Ny/dNDnCxHz0/tT
         vCoQ==
X-Forwarded-Encrypted: i=1; AJvYcCUEMI2h92xnLKcW4TwHIWYPvkDIZ4wYAZ8GbCeaZV3iC7AhTC6gWf1XG3xMU4KLHz5TGTM7sc4y5CHWWhA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzxoBooOX7mIy4vJZCseHdpH4N6GwMWxH7HxHVXJiG1+q4w/2Me
	r7bI8IBmuMWkVYkIJYeYK6kg+oJ9UsimQJiIpWd0cFJc1PV0g8o4lrPLFLjg/VvokA==
X-Gm-Gg: ASbGncvo2c/gVvj9FxENCY4XfsLKnpcOrkr5i/30pbOpIol5ResktQTxyiyoztpSanj
	40p/G0yYRmbpTBRsU9q+coklTJb3Hev9WeHhuU94jXlo8UaK2ScPG/rEcjcM32eTIeR/540njWK
	PgiNYIZ9BAdfhMgit9YmK9pdtnAF8tZxKcwhYBALlcqpgghOVQHjz8Q++YBQNZLe8ylNRpknlmz
	QzDWI5qWFlHc9LoeVNi5jWP/DG5lVylOr9z/OXlDXw7nqDWtG/AM86c7hM6vdLgLpnZ+qyne2QO
	fpP68bht7NRM72R/tnciih4b6jS9Bq/vGRnLfBq5Pv17slUTAZUa3WbP9ZC+o7AhyxFKddDISaN
	C/stcO2hhfx9TISdOB3w/aV23FRA7k/g=
X-Google-Smtp-Source: AGHT+IHr8FvKf71qQwRs4UPz7p47lfWchWTy4Nt0DInVpS3n1BfVZvOZGMOilRzif8doAl9RkPjI0g==
X-Received: by 2002:a05:620a:3725:b0:7ce:f58e:7e9c with SMTP id af79cd13be357-7d3c6c0c72bmr3217588185a.7.1750264479031;
        Wed, 18 Jun 2025 09:34:39 -0700 (PDT)
Received: from localhost (pool-71-126-255-178.bstnma.fios.verizon.net. [71.126.255.178])
        by smtp.gmail.com with UTF8SMTPSA id af79cd13be357-7d3b8f114absm778879985a.106.2025.06.18.09.34.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 09:34:38 -0700 (PDT)
Date: Wed, 18 Jun 2025 12:34:38 -0400
Message-ID: <5894f2f11a7a4741ba0279c703160e82@paul-moore.com>
From: Paul Moore <paul@paul-moore.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: selinux@vger.kernel.org, linux-security-module@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [GIT PULL] selinux/selinux-pr-20250618
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

Linus,

A small SELinux patch to resolve a UBSAN warning in the xfrm/labeled-IPsec
code.

-Paul

--
The following changes since commit e04c78d86a9699d136910cfc0bdcf01087e3267e:

  Linux 6.16-rc2 (2025-06-15 13:49:41 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/pcmoore/selinux.git
    tags/selinux-pr-20250618

for you to fetch changes up to 86c8db86af43f52f682e53a0f2f0828683be1e52:

  selinux: fix selinux_xfrm_alloc_user() to set correct ctx_len
    (2025-06-16 19:02:22 -0400)

----------------------------------------------------------------
selinux/stable-6.16 PR 20250618
----------------------------------------------------------------

Stephen Smalley (1):
      selinux: fix selinux_xfrm_alloc_user() to set correct ctx_len

 security/selinux/xfrm.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--
paul-moore.com
