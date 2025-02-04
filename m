Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com [209.85.167.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6355158524
	for <linux-kernel@vger.kernel.org>; Tue,  4 Feb 2025 06:58:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738652294; cv=none; b=Tdxpor0ROwQGWgbHGU3f8JHhQRYbPFCEaLpAal2jr/uqF1u1PGyV5vk/mT0DgvJnWRyklYAXuuMmIcRVU11FYegIqIl4DnfPlvSRAOC2kPcBwYAC3/Trp90UbdqizrKXij0gYuAtK68nKz6fBmCmF+1r+MfDwkDG0EMjbDSq/zU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738652294; c=relaxed/simple;
	bh=tL/T+gEcI/MPXxHsekGpjQ9f8hZPbdl/K3I9bR50nlU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rJt59TUL0vdjE6Hc4dsOhAORTP9gDzdEq5qQ43jusZJ3Xxp9rD4EMiIMDaxM1htr4Bgo3s63BpeghH28G43t1SRsvsoasZgyQgUM5Uv76bBR/ZqsAbqTEYOHq9HV7u/sQ7RSaJA/27PRPScJqUZm8qf3nZA1JAENVcuitoBFqsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kKj58T/p; arc=none smtp.client-ip=209.85.167.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kKj58T/p"
Received: by mail-oi1-f179.google.com with SMTP id 5614622812f47-3eb87127854so1078492b6e.2
        for <linux-kernel@vger.kernel.org>; Mon, 03 Feb 2025 22:58:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738652292; x=1739257092; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7LEx7Frw8JjvjTg++iYaavH3tdfrNyzCkmo7RQSiQfE=;
        b=kKj58T/pAP8KCqzeBO5YFiU4rU6p0rJ0HcYQ/8uJyu2DmHwvqKGrW5V/W99u28ATp2
         cR41QC8uONSkwLSeOqkFXxPGEHuVEwlgotcWAHXEJCHCIYdssf5z2WIYECLMa3q42JV/
         2vXXdHzUSD+KofF8eR2inHTpfL5L2cLBNWrIh9ObkQsGSy/B+0XBf0H7UhepLwId7bMx
         8tBg3x4tFHI55S/lyJYBwZfQvO2wRKxqPQmqUGhc+1ZC4E7cgXxpakliE+eOo2LI6zvb
         6uXROAdt6SjNddLAEXgKkLLsnV0JSdUQcoLkixOBnHX6CCvQcdQwaewyqiLh/8q2eERj
         WnZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738652292; x=1739257092;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7LEx7Frw8JjvjTg++iYaavH3tdfrNyzCkmo7RQSiQfE=;
        b=LkhX1tlhYzG3UVn79uNlbV3bGPoevgDoNeearpTvEMb50PpL4ZOfp+5hn3IYtQ7wjr
         afnTm+cVQlOm3qRvGaMzoBxsT8cu9lgZVy7MguqXR7x10Pwoi1QHVhY/8E2ObnQ+gcvB
         fuz/4XFGkz714LSCJbISehCMtEUBZxCPYpS7fiM9eTcQFc596AdeypizjVWYlyh7cj/E
         fHSMiJRvGxJQTudtn228EkuRF0oTQ0uGYpyreARj3LRF6NkwQ1ntoXyKPPQY+iJpuWQG
         Gz6Ngy5xdnkYbkyKjZqyQYP+2sSN+KQEgh1pC0ST1epS9BM7rY9ekJohn3ixP/4xuFoZ
         BqfQ==
X-Forwarded-Encrypted: i=1; AJvYcCUF7kF8F6fx1xb29ryhIoA2FD5F57it2W+2RT/gHc+YhKWATsZnrtBWaAVh9m6lVptCQ4fj/QAamwvXZho=@vger.kernel.org
X-Gm-Message-State: AOJu0YxI8gZHQWqNPj6nkLAov6Dk6KYD8JGEfJcJ00zRf3hT9Cs+vq6+
	DsmIrrWBArRFLfHfU6RPoozUr0xD6nJIUyO+X0ro4K4hOQRmdZR4KIdzWqvgkJw=
X-Gm-Gg: ASbGncuR8/F67t/vmqgAjlhEmxPYaQoffrCtqjFLdFO9IudnQzRUR9oTzpqkKL7rrme
	Wftl80/dhosiCsMDTQESMuFWNbz8A5RvjH7CJF5Xh1kmN0XJ92owvMYlRBQh4Eb/cOensgc3juN
	i702KFuOTfVsZGrZ+cEBkbGfv9Ka0L7MtVGClLNu+HNEJkhu0OAAIrMxkpC3qg2L9gHr28v/tAo
	n6KCTi15nwjtQsiOLahX17axHIJWJQWXvVsrv5wI9LHrpIGiGMIYn5hy1hco3r8IieEm+8NtIe0
	7ktR6SkdLB/pC4kTe7V+rLgxxUUWwDsxuyvVkKpehkvJlkEp0VMapmIVa/0A5d1NVNRITzm/xAR
	V
X-Google-Smtp-Source: AGHT+IH+UQuPTOIDX3XYEd8V1IhA/dflzMYDzCH+I3ySQSxYohtMyVB0hNQEiuB2AvfJWgsTd+5xgA==
X-Received: by 2002:a05:6808:3c85:b0:3eb:8855:eff7 with SMTP id 5614622812f47-3f323b47f38mr14285691b6e.27.1738652291704;
        Mon, 03 Feb 2025 22:58:11 -0800 (PST)
Received: from DESKTOP-GL3U3CJ (162-207-94-177.lightspeed.irvnca.sbcglobal.net. [162.207.94.177])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-3f333558bacsm2899938b6e.20.2025.02.03.22.58.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 22:58:11 -0800 (PST)
From: Ian To <onlyian4981@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Ian To <onlyian4981@gmail.com>
Subject: [PATCH 0/4] Code cleanup patches
Date: Mon,  3 Feb 2025 22:57:18 -0800
Message-ID: <cover.1738651582.git.onlyian4981@gmail.com>
X-Mailer: git-send-email 2.45.3
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fixes complaints reported by checkpatch present in the staging/rtl8723bs
module.

Ian To (4):
  staging: rtl8723bs: Add missing spaces
  staging: rtl8723bs: Split up long lines
  staging: rtl8723bs: Remove unnecessary parentheses
  staging: rtl8723bs: Format comments

 .../staging/rtl8723bs/core/rtw_wlan_util.c    | 175 +++++++++---------
 1 file changed, 89 insertions(+), 86 deletions(-)

-- 
2.45.3

