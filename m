Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6B171DC9BB
	for <linux-kernel@vger.kernel.org>; Wed,  4 Jun 2025 23:25:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749079555; cv=none; b=HmvJG+7EUItdfarFlatD1rCpBeZ8/mc2FFrkiVPNcHhsyc6UzMKQ54o2GldqYsmtr2tbQe49FR2NX9tdVBA6KSoup5P3b9YTeQWV2HiHaXKdGdRn3xOve3SGuD7/dOLqGFmWH4WUSo/F1vde9+hmvYDp8TQZCRVtsA9YylMJd+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749079555; c=relaxed/simple;
	bh=Vwu4TJ/HvFXdXHkNqXk/zVSddth2RQ3EoD1ZjKR/Xuw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=j0MK09BgP/yCy35WvyZGyVjgimddRX+l0vAndK42pMhYwOMW9XImczpg7G6sJORG+5zh7HKsCoI677kcWCPGfQ3EV6CsjQ20AmkpSUuyRPceHUvTGmAeQwsBfXuBcSCT1MRRdOR/vBUcPm1qhd7vY+cHX0m3PJ1uwRtHQ+bwR5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mqlLCa7g; arc=none smtp.client-ip=209.85.128.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mqlLCa7g"
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-70e3980757bso3955497b3.1
        for <linux-kernel@vger.kernel.org>; Wed, 04 Jun 2025 16:25:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749079552; x=1749684352; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kM/3Db02CilzNEun5cvgT1m6Xyu3oxCMObMXqf4IsrQ=;
        b=mqlLCa7gOUmRC/vqjX6XMY+KbqZJM1xu+jlwdyQ2dlhU8oTQM5mKwyFLr3ww6XAqrJ
         x+vLADKFTGuUsEZXiBetDwCLQ7AfkapqTu8pVUp/tSE72dwLbgLea8a+keivHOK45Ueu
         xW6mvXwVfd1tvVP0LkKtfILHEz0dDBCpcqvmGl3Ch6i5vLXhD7jrD2on62WEEh/DP3wr
         ReptYnwE2h8MEDXv2bUccpbc2sGbSQZJ2WiKeE7h219czACa+WcngDNHgSQt/RGMACMH
         7elOjQfm7beVJ6pGpbzSdkOJqaRS/xOheIEzBVeCKgmNQVEfPOL9u+TNIayHK6zIR+Mt
         qsNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749079552; x=1749684352;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kM/3Db02CilzNEun5cvgT1m6Xyu3oxCMObMXqf4IsrQ=;
        b=Af4lCAhlfDld+6XT9VSWThlg62tstPRWdpN/BGhPKdLzqI9Oefoymnlnq/dKUpVa3P
         DpzBiy3wRh8Ce6GewXTo/Eucb8P75KQ8Z6xaEArKAAe5xaGIDn5p6ZWTNbDics7Oj8jE
         e/kexAPDHD3xmeuRhPDddQ1T8Baszn5EQdWtKg+AhfmRvfQZW06Xcn8t/h7JaIKoAgl2
         Z+6WuXSiZtMhYLNL05cEklpbe09XT71bJU0ipbXYMpc6PsExQJV6KjynUIljssTjdNN+
         btZQ3iZdta1mNfcXlo4tQ96wmIqiR2Ku+wAdrOyaQfwvFjNLAYPQ1n2FZZn0vAz3dp4p
         D6YA==
X-Gm-Message-State: AOJu0YyFElJY3LcJTc8DyCdCr1HejQgZnEHQOIcaNi2mUmD3xDNvVrQl
	8j+4z6NL7blBJX4w83gkAjcmH+pBex8RlPr/Yz7xWfZKsr8SMaKnOyQoe0gZTQ==
X-Gm-Gg: ASbGnctIx80be5frDtQmYt1xgdNG85o0qP9cwesOPeeBezX5NDn+qYZPzrIjDcCs8+e
	QBV0zEvu8dRvBTdNmJoDbfatW8PBtVwmbR2QK9qnU2EA71YzvgtAzSpTNHbxIdduyXD+crI23W0
	hqPUfevoeaCEnSTyYOOvwHlFXEfB1gE0kF3jyRDvLOkgbHTj/OU2tzaCyV+Tv2GhM0SJf8Gr0AR
	xJHkPowtLc3uRM1Ro+74YeYGo8PiGufTCbtY8r0Fq66UjUkML5VcRVkcEmSSjgz2ZCXq9YpOGkM
	X/U5Ev8aoZtW4y2Y7oFeBkDVwM1qcLrq+JR/MYs7hjDkUeG5eGKjcWAVtZb3lysfT97k005FHrV
	K12NaFthW4hI=
X-Google-Smtp-Source: AGHT+IEqQ6aeB9JspUZcphGc0fYJ7NSXL3yLfPKnkJgCb5esBZXUjB4GymNOZNZpBp3CAmiGC0jHqw==
X-Received: by 2002:a05:690c:6e8c:b0:70e:7e33:fbd6 with SMTP id 00721157ae682-710e7ed8674mr21882667b3.17.1749079552517;
        Wed, 04 Jun 2025 16:25:52 -0700 (PDT)
Received: from localhost (c-73-224-175-84.hsd1.fl.comcast.net. [73.224.175.84])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-70f8abeed16sm32164577b3.48.2025.06.04.16.25.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jun 2025 16:25:51 -0700 (PDT)
From: Yury Norov <yury.norov@gmail.com>
To: linux-kernel@vger.kernel.org,
	John Stultz <jstultz@google.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Stephen Boyd <sboyd@kernel.org>
Cc: "Yury Norov [NVIDIA]" <yury.norov@gmail.com>
Subject: [PATCH 0/2] clocksource: use better cpumask API where appropriate
Date: Wed,  4 Jun 2025 19:25:46 -0400
Message-ID: <20250604232550.40491-1-yury.norov@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Yury Norov [NVIDIA] <yury.norov@gmail.com>

The dedicated API works better and improves on readability.

Yury Norov [NVIDIA] (2):
  clocksource: fix opencoded cpumask_any_but() in
    clocksource_verify_choose_cpus()
  clocksource: fix opencoded cpumask_next_wrap()

 kernel/time/clocksource.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

-- 
2.43.0

