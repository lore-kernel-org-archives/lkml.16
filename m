Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 792EB19F419
	for <linux-kernel@vger.kernel.org>; Sat,  7 Jun 2025 14:11:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749305472; cv=none; b=Yjw/h4zFuI8nOCQMDZEc/cErftj13aiaOmiRrrYF6Q+RVGfwa4EF0VWHHkH2zQZ2cmeMJYgQnlvXJtKpH2VdQbrD1tbHLUgTdQLdaO+oxkm6hqV7jvixl9vjZjORRLv2754cxjc+OhKDUfEHWbRlW0MYlZmW1fERTzpRJHsun+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749305472; c=relaxed/simple;
	bh=xt9yJKe1oZTS3gfwMdJ3OGz0RMTqjgK7dmMB9Mfj+mc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Jik7ZwPzsWR8wD5cdzYtIeVEMiX7mKHC0GwFsQ6RztCXtnW1D699VJF5XLQUOw8JtdabiKXddgB14nmOtkRTouMmXzP7CAZ/y7zSLzOItp9qa+wwMZkwAdNrUF4wLhRucSG+QgG1xpkK1sNws2N7tkDgljo6MEomYd/XqrV654A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Xc5eUvpQ; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Xc5eUvpQ"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-73972a54919so2581086b3a.3
        for <linux-kernel@vger.kernel.org>; Sat, 07 Jun 2025 07:11:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749305471; x=1749910271; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=q+2stuTEmizgDB0+nMm6FFxiEYci69vykIsBtlVFEdQ=;
        b=Xc5eUvpQtpFoa2TPmyGesFbM1hmxK69tz8MITAmfDef/EYRSaznNMyQO6tJn9fXOCh
         tbarrHHJljaaHxnNqnwfbMf7MiWm44sF1+fy2YJG9fclKDNZujta2fu/z0Q7eAmBmOW/
         Jc4mA/Cz0TR6qSYGwcelHo+SllqZmhZZZo37Y4crzUuVG6s0/h6U6P1DRfp+qdFfPQk6
         9U50lCeAoy83ZBhVyTB1aPmFhw8HcSuLMslEovXZSjmHYHNI8ckv3mFwMwOfo0TV8r+q
         9lr9wUrI901gWjh7jZx+71xoRgiLKubj+/vcL1tUBjb171TgJTtv8HGtM6iUlXabCPg4
         JTqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749305471; x=1749910271;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q+2stuTEmizgDB0+nMm6FFxiEYci69vykIsBtlVFEdQ=;
        b=nNoiBXR3GKdA4F7LzFoM9a8/sFYKlYdqSX+HREHpZk097Zg83oAD+G2OnoImBQHAN4
         SOGA3ZiUEDSKgUlWo5ATyBMi97HxKisqKB9AwF6dxATss/CBG+sYMuH9R6+LDN2ft61o
         1/Wm/lQwKvC/1op7CS8XhORZqv8EL15+pjEgBCtVDg4J3OR3JnZNoGid46kQH2No8U+h
         gT8PhJCGt+WZI2wMt0X5/AzOS/FQdJ1YQNIsf7yFCEnCO+h3tckdQZShp/dGUZ+s5cYi
         K/8wO4/1PoJn3CXT6E5wHyhnOWPsV9l2cFWyrq+zmLXf6H5BUTf/S90rf5iNxUj1M0U7
         iNlw==
X-Gm-Message-State: AOJu0YwYuP1XOlWOMFKcp9vgYeg9r9RU84tbzUF1uj5kIwg/p5KpxMpQ
	gclbQUMFdPM88yCpCdv763bQsT0vSPPq1rhTpymaEHCTzLVwKAYwxvvCJTNlmg==
X-Gm-Gg: ASbGncv5skySZ6I4aQlEbm7YCz8ACt1r/qX+ecK5pCHw0ymnmXa2Jb7f6gLECwPRLlQ
	+8GXj6mHfWr7hCDu8Gx9budg49+gN6ixDWGUZcxzc59TW0Fi9/JDCSIwYH1Q4o+0VLIFiJoIVVR
	+f7wBhs+UsSEYeeLoJQCe0ocN6jKYpIuI0qyJAn2npP8dkjBeI9w0awtXkgqYyTXAhGdlHgwEhM
	8kmXmi2lZWJR4p+1c46k0SwFW+TFUbWfAqxzk7MsVrgCthNifTPPQcEmDrhyG1ukIGB2aV7qISm
	oADE6V2le1zh9VXUH0VLcWfjCAmw225IoEDbHbVVewYM2g9yEFd2MeiVjjC22g==
X-Google-Smtp-Source: AGHT+IGuKMKdUSMP7xQmxHNE/bNHOb1TZMkeX80co9rnyjksY5ZhjT9B5gH2fT3ysWp7vmnzM9DnMQ==
X-Received: by 2002:a05:6a00:21d1:b0:730:75b1:7219 with SMTP id d2e1a72fcca58-74827ea2b39mr8836074b3a.12.1749305470681;
        Sat, 07 Jun 2025 07:11:10 -0700 (PDT)
Received: from localhost ([216.228.127.129])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b2f5f782283sm2560164a12.54.2025.06.07.07.11.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Jun 2025 07:11:09 -0700 (PDT)
From: Yury Norov <yury.norov@gmail.com>
To: linux-kernel@vger.kernel.org,
	John Stultz <jstultz@google.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Stephen Boyd <sboyd@kernel.org>
Cc: "Yury Norov [NVIDIA]" <yury.norov@gmail.com>
Subject: [PATCH 0/2] clocksource: Use better cpumask API where appropriate
Date: Sat,  7 Jun 2025 10:11:03 -0400
Message-ID: <20250607141106.563924-1-yury.norov@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Yury Norov [NVIDIA] <yury.norov@gmail.com>

The dedicated API works better and improves on readability

V2: Capitalize commit message names
v1: https://lore.kernel.org/all/20250604232550.40491-1-yury.norov@gmail.com/

Yury Norov [NVIDIA] (2):
  clocksource: Fix opencoded cpumask_any_but() in
    clocksource_verify_choose_cpus()
  clocksource: Fix opencoded cpumask_next_wrap()

 kernel/time/clocksource.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

-- 
2.43.0

