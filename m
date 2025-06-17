Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A0632EFDA4
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 20:08:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750190940; cv=none; b=u+KogrMlzKyVs2t/5M8VJEy+Kycwt8NAdcBGWpDbakCbvIuEr1qTUmwNTk9Nc0Xvn+cNuMJ0J/443DfQkrSYaQT8O6D3vYDxMzLEoUW+h5n4x8ev/Lejnur6/J0OFncpTd/ycRsZlKlwxZsCkmx0n3y39JSq7Qntjg3aRjjT/G8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750190940; c=relaxed/simple;
	bh=wxOvh+GF+in1MSzH2UE546ZSyHEOfEynhpNsRbeUCow=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=q8xj7t8nU7ows49TluIky2zCxAkP5SpaQnHJQgN6ls8+1HI05tmyDiju4v+z0g6XNZS5456gLVgAlLaTnrPkNnsmFIUuZMtIOlB/kFmmXzb7lYQl9AHygiqXbsgfwBY8x0WN3bcw9OVSOeuU2lyWulStCfzUUAJsbxyvO5fikmk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DMSNff1N; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DMSNff1N"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-311bd8ce7e4so5159877a91.3
        for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 13:08:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750190938; x=1750795738; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=3kfpkF9+b14mrDfpfRr1KNm+WBacL6oyJyK2M05D+JI=;
        b=DMSNff1NSadNj+FwdZr7HvY6UYCyMDUy/NZ+Y3lzBhqLV7xmjrpxeyEHyHVusTqllz
         FpEpXdGGH6RIsARuGRmbtNo0/9cqMzLJ1R+2oC1An5xSDO4L182zGXYDUlLj8RsMq57U
         5jiG21Likv+qpTt27tdXMI/ik01VXgkV1Sw4EQF26Zx8MKGuHbmgcUh3xUStq9aUSfcj
         4AHk1pO2PUUGl0qoiP21vJNf1i6lPk2OHvBRun3rZR52UK5PCMJrbyVJNZf+BF0cgLje
         fr/sWJegZBwXjENlgogozTsToeVCE7Ry/ygDIhAAvyHWR4kbOnvHM7V7lxCITKdz3dDQ
         e/IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750190938; x=1750795738;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3kfpkF9+b14mrDfpfRr1KNm+WBacL6oyJyK2M05D+JI=;
        b=dGsLlWmBsjQqpXzSJF+hY3iOruZIf4Z7HDxN6xlYyg+pvqfbpw/NSADEZMZNmiMx0Z
         WzNs5H+vq5IjFL4h7r3rrQQ4gYAfrftUxBkZ8oMcP8gcA1i2tk6gMR6UOX5IsM3FEn76
         JLLTngVqn5DOfoRY4Z9XyRuAgkJBydrJmo4w90VI1VTD89oYm7PNvRcJ1Je1NyvXnXcR
         51K8sVqpd4OlVEQTLrstNuUJX2qkvdTpmTBjFcq+gBLf75/Xm23MvOpyLLf7LNatrH6v
         xeiiXhPvDR1nZLdpYbu8/flN3ZISGMJI5UuYCBg3JDjhgJ1NjCOeMiyYSY3qINpkREjf
         gw3w==
X-Gm-Message-State: AOJu0Yy38Od/PKyWAKK/aTb83SpZpccfdzONmd3z/sUu67pF892tW+Wz
	YEuTE5mqzXH9HKpPBR3Pes5Ee+wXDYdgkGDmAM3ojHWAATJXmqdMp8oxb+yJgQ==
X-Gm-Gg: ASbGncuVOZlV+azl6F6d260o2ToWFDpDNFo3Uk1w2+E1UVPcIwM8Ai9qwKNRgt12Dlj
	Nus76/pvUjSSB1JaF+Nl2x62a5NHF5RRTMMnymOu5L1YZt06ExD+7jE3voqsNuGffulXjS99ht+
	k7qgtHg2ISPubeXQPLtg2EspDRbNZLIgyGoFWzivOSLKSXSAu5l9+nHbMuXhsjc7K1Tlp0Sb5B/
	TdaYRlIODCX9K/OTs3x/PMAJb6colRG72N3uYvRA5bfpYLO529asyNmrqYYMioQtFKQoAb19FK0
	QJoHPVntfrNZi/uM5GG+utrwdqw5khdkdDa03/qnRDAX95/zCns60ic03Y1TFA==
X-Google-Smtp-Source: AGHT+IFWnUVfNBACeG32v/bgVGq2QBFjCU37R6x9/dR/jWR/kGGReZkxpXc69ZJg6oUUPLqx7WeGVw==
X-Received: by 2002:a17:90b:5847:b0:312:1dc9:9f67 with SMTP id 98e67ed59e1d1-313f1c7c54amr22431257a91.2.1750190938499;
        Tue, 17 Jun 2025 13:08:58 -0700 (PDT)
Received: from localhost ([216.228.127.128])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2365deb6a0csm84744525ad.191.2025.06.17.13.08.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 13:08:57 -0700 (PDT)
From: Yury Norov <yury.norov@gmail.com>
To: linux-kernel@vger.kernel.org,
	"Yury Norov [NVIDIA]" <yury.norov@gmail.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	John Stultz <jstultz@google.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Stephen Boyd <sboyd@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v3 0/3] bitmap: introduce find_random_bit() and use in clocksource
Date: Tue, 17 Jun 2025 16:08:50 -0400
Message-ID: <20250617200854.60753-1-yury.norov@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Yury Norov [NVIDIA] <yury.norov@gmail.com>

nodemasks implement node_random(), which may also be useful for other
subsystems. Generalize the function, and propagate to cpumask API.

This v3 reverts v2 change that removes inclusion of random.h in
nodemasks header. The nodemasks indeed don't need random.h anymore,
but quite a few units include random.h via nodemask.h indirectly.

Resolving this is out of scope of the series, so I'll do it separately.

v1: https://lore.kernel.org/all/20250604212125.25656-1-yury.norov@gmail.com/
v2: https://lore.kernel.org/all/20250608194536.28130-1-yury.norov@gmail.com/
v3: keep random.h included in linux/nodemasks.h

Yury Norov [NVIDIA] (3):
  bitmap: generalize node_random()
  cpumask: introduce cpumask_random()
  clocksource: Improve randomness in clocksource_verify_choose_cpus()

 include/linux/cpumask.h   | 12 ++++++++++++
 include/linux/find.h      |  2 ++
 include/linux/nodemask.h  | 16 +---------------
 kernel/time/clocksource.c |  5 +----
 lib/find_bit.c            | 24 ++++++++++++++++++++++++
 5 files changed, 40 insertions(+), 19 deletions(-)

-- 
2.43.0

