Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 794CC28F51C
	for <linux-kernel@vger.kernel.org>; Wed,  4 Jun 2025 13:58:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749045539; cv=none; b=HU8NMvp+WRTN4WzEK5nFh0voUMRfoRl1moK2SSzhmYW7uo/VsWIPSAs2rWtpklVWH6/Ad80GMdSLiac8pUgcGeARYgnlZ5a+q6euUS7uq1Du95EnBq0LxVZ+okPsYY6kV8r9HYoWEgTfB043tQC9RBKKXHyEuWcszjriDQAJa30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749045539; c=relaxed/simple;
	bh=zk1n73mzXW2cVf92+qDik1vWwaIq1RTipTgZMB8Ps6A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WpOVTf4us5pvflz+AQAJqfvib0XVGKBtWUVM8NjUm8dd0qhUWUZDDCLfYAl/d9hX2LYwlCJS4iw85i8RaHxK1DV+Y2MbxLBMKhSYX5tjPejCL5tvXA6z06UygEYmbbwWR7hiCl+wlMe+hrmtrXkazllQuY0oC99sYKa0lAD/Tf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nrkI/N5l; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nrkI/N5l"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2347012f81fso84295725ad.2
        for <linux-kernel@vger.kernel.org>; Wed, 04 Jun 2025 06:58:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749045538; x=1749650338; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TezHNz2odnPb4Tc8G+1GEc+yw5qGixOkkXSyDu8G92s=;
        b=nrkI/N5lABIPkGecuUilqjl3jXj2kNRQmMOy8L6F8+f+dzK6xDsxNXtK4FfWmaZ7Pu
         nk1IKHKaFmoQXpe6Y3Jspq9fnA+T4LIM7nT6TGoogBsWHsjaDJcz0FcphBV8FPLRpJKX
         W8EWqTO700OBoA33lEZugsxTuJHEcZEdsGcK4fw3nM2wW/steheL24iGZpdAm21gyWOU
         4GQSonWqlaPMcwhTZjGmGdCdQXlk6TgYsLOe2BSFF4vViRkpr/2jgrCwHWGjHvHrDfp9
         kDtoJqZQr6PA6Y9bqbXBsbuQFpU7D0hpoukx/f/fzAlk5o7k8zMiOkZ94xph1eLCWEl+
         muQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749045538; x=1749650338;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TezHNz2odnPb4Tc8G+1GEc+yw5qGixOkkXSyDu8G92s=;
        b=AddW32Bu58Dp968n4aJykiAFiraOFRmT3RxZ0GQYYa6UhBTPYYvZ92PCmDw7Bxkb9P
         BcffjeV7BL9HP1dje0MdD7AwWnoOpzE+TGlf57keCrPdpkJksmYTMyAJzq2X1XCCI8FD
         /vbp99viwnC0MFurvlr+kMAF86DoyqmOHwnCSLuntVi0NsW9fk/KDlSpYfalSwhjO44V
         1MU+/d12DZkVxgWzDn64oumri4QHKdbjWiD84zM065ltVueNL+3kitv2JFQsIdWjuTdf
         DL0jRE1uVsrWdjT8fMVmR+ndAAEEiVSjYlPX/asL0g5BgQ/Ul7CeozY07JtAyMx4gxj3
         ccyg==
X-Forwarded-Encrypted: i=1; AJvYcCUY0wnQZD95mVTemVUEnPUunLDmnW1+3+2aS0dApD55dXLy9imD+VOc2oTlxsFEpnbKCKxYfzhGaww+DwM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwxrVyslXLlGdC14NExDIjDAtORLoFn8Bu7pLDar1fsGJC7B7mc
	1qE5i67sO+I/oqGWwTxsBwqjS+XM/bjzk3UHzbfb/apd41OQw4sI3KhW
X-Gm-Gg: ASbGncsIvenUFmMIpnFSWoEygV7uDb8cA28o+paKEmT/z+nYodIUcSdbDDc3AWg1nkS
	kaxKcAd+ef4bCtcAiJqLMVSul+nx5FnRBhN+MeY2pi3dBn5drU+jIy6e3TaA1MGwWiIIk2oioO3
	6g7CHuSzIBr2FzmewY7ja3oJVP1/24d3xaJP/W2x58rC0uACV7OSuCUlUn7ite3QgK4jgBfZ0k1
	MU/7BsokH3ccyFnYfmOPIgRhrSTEmCGjRc4fNSACVPDMachfkw0h3KJgLiXWM6pDVOAfV4PWm/3
	wkuBtKbFh6QHrCOD9CltyEGdM3vYa4zAdnrymKu3Q0zzYbrvvDC5+nHoBSCNCg0/vV/L
X-Google-Smtp-Source: AGHT+IHmbkpEZcrl1kkqJkoknQgXjKEbbbKpB/jzhsDiUnyUK+LB63k5/qKBP6dihtZ3xkB0st7gVQ==
X-Received: by 2002:a17:903:181:b0:234:f580:9ed with SMTP id d9443c01a7336-235e116bddbmr41463585ad.21.1749045537523;
        Wed, 04 Jun 2025 06:58:57 -0700 (PDT)
Received: from ubuntu.. ([103.149.59.114])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23506cf5110sm104251755ad.177.2025.06.04.06.58.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jun 2025 06:58:57 -0700 (PDT)
From: Jagadeesh Yalapalli <jagadeesharm14@gmail.com>
To: William Hubbs <w.d.hubbs@gmail.com>
Cc: Chris Brannon <chris@the-brannons.com>,
	Kirk Reiser <kirk@reisers.ca>,
	Samuel Thibault <samuel.thibault@ens-lyon.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@kernel.org>,
	speakup@linux-speakup.org,
	linux-kernel@vger.kernel.org,
	Jagadeesh Yalapalli <jagadeesh.yalapalli@einfochips.com>
Subject: [PATCH v1] speakup: Replace u_short with u16 for spk_chartab
Date: Wed,  4 Jun 2025 13:58:36 +0000
Message-ID: <20250604135846.46184-1-jagadeesharm14@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jagadeesh Yalapalli <jagadeesh.yalapalli@einfochips.com>

The spk_chartab array was previously declared as `u_short`,
which is a non-standard type and may vary in size across platforms.
Replace it with `u16` to ensure consistent 16-bit width and improve
code portability and readability.

Signed-off-by: Jagadeesh Yalapalli <jagadeesh.yalapalli@einfochips.com>
---
 drivers/accessibility/speakup/main.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/accessibility/speakup/main.c b/drivers/accessibility/speakup/main.c
index e68cf1d83787..34c7cb6a9b43 100644
--- a/drivers/accessibility/speakup/main.c
+++ b/drivers/accessibility/speakup/main.c
@@ -187,7 +187,7 @@ char *spk_default_chars[256] = {
  * initialized to default_chartab and user selectable via
  * /sys/module/speakup/parameters/chartab
  */
-u_short spk_chartab[256];
+u16 spk_chartab[256];
 
 static u_short default_chartab[256] = {
 	B_CTL, B_CTL, B_CTL, B_CTL, B_CTL, B_CTL, B_CTL, B_CTL,	/* 0-7 */
-- 
2.43.0

