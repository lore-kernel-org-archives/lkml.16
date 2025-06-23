Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88D06146A66
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 00:00:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750636816; cv=none; b=rD9RZ6moBOEK3+Tw4zYZLnWO/BSSfZ9uotNddN7gQDWph+nE2SJonlCNOMAonT3bFMfj7+x3puMR4lexHwNRWnLxBaS+WPXzx40FR05RzlrNzuSzW1w/5H6L1tItsTrJ0m5MuMFu1K57daZ2UVGMH0Bu4+c/9sNIF592ahYncUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750636816; c=relaxed/simple;
	bh=Mj2fvXly9bwS4njsve9U2ihJKBbJlX624WHTHgtWMUQ=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=IDrRYq8oZ2AuNEeytuJ1i5VI/78P7pSS+Z3SLu2HgdUFSKhhMRnC7BU5H2IZyZDcYSImVTom9Y890KAmoT/Xs/67o2IuT1Dla3H4gHD7Tm9PrkLewxv3XOV0aSLMQ8MVMxU5WXlyUK6jO4q4ZiWnAh9skHFpSEW3opiUsayWtys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Jw8UkKJN; arc=none smtp.client-ip=209.85.128.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Jw8UkKJN"
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-70e4043c5b7so33432657b3.1
        for <linux-kernel@vger.kernel.org>; Sun, 22 Jun 2025 17:00:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750636813; x=1751241613; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=QkBHIC97bf51W5nfscDUkxw9dBFrFAPaKytZfgKTLG0=;
        b=Jw8UkKJNdGzS8CH0p2bDenbwsItjY1QT5SlikDMuglNwnWbuBIq+k00ktSaSVUIur7
         Ub68DpnVfUfsmETZIvl6QlwBUeVP1vGD4bYZss/GRCRVuC/Tr8kuCJ9o4YAHKlPhfzAy
         UlpZgr8X2tTPQRb14JYmYmMrLxywRNSQb6ZmE5YYnbmKopOa9RoPH9VCxFCi+58c36m2
         c5VH2MIesqFYgUpSdBA7VnvNOLTujhuzaT39nKQ7Zi+hUe94lpT1CBJqmW+uQ71af52l
         koN7KqN0DRBCj39ZB3a7EfUfL1ovvCtd65Q+a0CbynTwLFT6HxbIgD8fDAr5RG7qdjTI
         0pJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750636813; x=1751241613;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QkBHIC97bf51W5nfscDUkxw9dBFrFAPaKytZfgKTLG0=;
        b=Wd7uG4gBV/t9N29PK6hBK8hrRetreXEI9RA6AtIS8A09jq0BYRtZXDlwu3YR0tMz6I
         F3TRVD21UFM2eAZMUfJWme0D+Jmx6tchrz6pEwChExfjhyv8Y6mkDhEW0l6FE0BK4YVT
         f5RifnNTHRauYA+WIsztiVGhLSv/iJZgG7ouoOMTLgeuKp3mq5Sl7KSvbC27MJG/CBZu
         bY+btmL4RgHnHYA5/tI2r5m1jvVEd3KqrTseDCDWN7f5PR87HQDIr092EEMlsdHNyQH3
         ++7HDnhwitFa0TpWRjCHok9aepK7UdmvUUKHbktqvZ59R6T0ioANpdO83mVq5IIckPjM
         aKhw==
X-Forwarded-Encrypted: i=1; AJvYcCX/AyqFNYdxLEuURcCa52gMA5RuieqknbhW71Hy0a2r+BbeIN1CAy1cT64wP5tDMxrR2GY/n2ikuiWeYTg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwVMBObFS5qlQuqdLJVKJEgspCeecPYpyskTSOdnhfDb//W6+J9
	1Ilo0MHUa07vYRJ257il1/pIaGyVPvIZTEUEr3pIW+9ZGhvRbfcxV+jJ
X-Gm-Gg: ASbGncukiNo2bmZQ3slB49PJ2fbtAOP/ES/8ayZd/O52f6DV3v3ekZ/Aje2KHabugNK
	GvYYnPzvm0hN3Yxa+HZljN10KSqO6FQro0aD5vxjXvGLrmVkpX8rTLGtSN7bbYWnDXN+l1gQJXm
	eAUZqiAVsiEXXVe42I0F97GeaCRxyLxqmhGoKgG+ou5OWX5Q8nwIEny/BVt2dZRlhU2rJLCSt5M
	nQ0Rne8MHwyxAc1eGtL5YHTnzheHU5t+D9DxvgSnmhRPQ7JsHznpZnBL9+sw6aZCu7NpJT1x0IH
	ubO0dHh5Lz99GmOKVoKT7v9XedTzxw836dGkeA7m2o8mYLZAcOx4L6vcV5Q/6cIURmAKihsGCFi
	FVEmw00dZCYE7jZlzZ/hpnQ==
X-Google-Smtp-Source: AGHT+IEWdvZlj86F7P01ky6kTmtIOij7BIb+A1k0W3wdjMvTeJeNh5LjwHf6jK9/J4DJkgvJyXsgDg==
X-Received: by 2002:a05:690c:4b90:b0:709:176d:2b5 with SMTP id 00721157ae682-712c6394653mr169014207b3.2.1750636813341;
        Sun, 22 Jun 2025 17:00:13 -0700 (PDT)
Received: from localhost (c-73-224-175-84.hsd1.fl.comcast.net. [73.224.175.84])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-712c4b96923sm13825877b3.68.2025.06.22.17.00.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Jun 2025 17:00:12 -0700 (PDT)
From: Yury Norov <yury.norov@gmail.com>
To: "Paul E. McKenney" <paulmck@kernel.org>,
	Neeraj Upadhyay <neeraj.upadhyay@kernel.org>,
	"Yury Norov [NVIDIA]" <yury.norov@gmail.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Thorsten Blum <thorsten.blum@linux.dev>,
	Zqiang <qiang.zhang1211@gmail.com>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/4] smp: Improve on cpumasks handling
Date: Sun, 22 Jun 2025 20:00:05 -0400
Message-ID: <20250623000010.10124-1-yury.norov@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Yury Norov [NVIDIA] <yury.norov@gmail.com>

Switch smp_call_function_*() to use more suitable cpumask API.

v1: https://lore.kernel.org/all/20250606202732.426551-1-yury.norov@gmail.com/
v2: fix conditional expression in patch #4

Yury Norov [NVIDIA] (4):
  smp: Improve locality in smp_call_function_any()
  smp: Use cpumask_any_but() in smp_call_function_many_cond()
  smp: Don't wait until remote work done if not needed in
    smp_call_function_many_cond()
  smp: Defer check for local execution in smp_call_function_many_cond()

 kernel/smp.c | 38 +++++++++-----------------------------
 1 file changed, 9 insertions(+), 29 deletions(-)

-- 
2.43.0

