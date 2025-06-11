Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5869522F
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 00:13:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749600805; cv=none; b=cGt7+Ku6MrWcWcnGDQS60/U3wiHKkr9X8cWyjcDR0IVYYl5r/t+pna6rmmYQw2Nl+oe4Ui/V/myOBUudWWoP1e4hVllgH1itYwwhe0FSOrL5hdE6+6FEqQ779PR9mBtkQNePikbUfbXbamu0oVpZvOCTMD0rQaqHwgIHJ6dSArg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749600805; c=relaxed/simple;
	bh=Zr5kJXOd0E61qhqZcjK4JuesW5RctkKk1iK7a73axYc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JHRzjiKUi2iHpAXSmU8EB1IbJUeRkS4cPQtCNRysowhPn4nU/UnimxbNhOZIoeUObnx2r648PpmvMxG4KKwpdA+CQoksJ2Z1IBSECDqpUtA3lgBOIyj9+QmK0gdVRxM35Tc5qcutnHL23CMifDNO6uCQj+T5Nj7+y+Xk82/Rj4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nE8QMIOP; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nE8QMIOP"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-747fc77bb2aso4734855b3a.3
        for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 17:13:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749600803; x=1750205603; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TzGokTHWaqpctTJmaaX7l1tJgh1TuHPjKfl0NST8upg=;
        b=nE8QMIOPBaUERj5O8CU2LWn5d/QNJxqLji6bbXHKpIlbxE5pdmKKMj5ez4mbSYSBZz
         eCBHG6ZkQF8DHqbr5j3RdPrDuR9kONCv4GXfuJvLwUULOSjz5Ti2sBTXF4SV6IKlSWlw
         /iui6Qcl9OqjdC2MYpEJ8Gk7qRmkgZW7+O0Cmunft9Mz31J0ghqJhHJp2W8g9CN0AeOU
         Z4dFdcG7mJmA4W63hiLAzSNC4Dk6/5wMiLuVmjbS8Rq1j+GnWvLugO6dVaLr3ivtQ7/0
         d72+W8Za88LVFP+OM6ZZxFiOt5DI1rPQ9yHln17u1ZI2ryFwNwP9rf4JjviM9zZLDDoq
         Waeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749600803; x=1750205603;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TzGokTHWaqpctTJmaaX7l1tJgh1TuHPjKfl0NST8upg=;
        b=IQcOiB0POAcU0mg4NY2efUsUGNryxvtEMtod1NifT9SSxy5vPQ5oaQC6swyVCt2tCf
         3t9lnZqoNgJG/WqPU0sOgXcIGk1C4KqfLqZp9ODty9rkIKNYU6x98vXdp80YdrgGQEPU
         aIKGQIq5zKRNyLzjROWhZ+9LjEq4y8IYqcTE+WZK9Wor7i8TTMNiaYA9a+/ui8sBWKG/
         +txCyD2XrlW2cRF9ZXpC0YwhsQgwL7sPZZuTtVd0WSvhZpSI5jf1Hw/EwKzX2WK7oFeu
         krdr+x9UXIsNE7ae37AlWSONAgm1Xi0xrHwuBfWuVqhWprHiZddRwgWwI9yVg1yA6jF4
         UP/g==
X-Forwarded-Encrypted: i=1; AJvYcCWg8NIaPcQhBkPHAfyHLVEEQKiNaIIatWaKS4x57har84P9SrU6VPcaRRK/oH/dWpBxEfx5+HuUR3J32WU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwFRinYueyVn0C2qvC6jKsGgOn7thGeYn/V7u1OCOYHtA1+28ow
	4r7GzZxBPiL6hHe3jZ5SWFdhL5r1fSwSGvEZAAQcb2fo+XOO7aMlQy45
X-Gm-Gg: ASbGnctWBGAOcH8PK8IoFfiGJtmfG68G1XND5q5bVE8CfCS2doLkY+xO6Ddjce3pe9o
	m42ttK6rEgv279sBU1Mdc+p9QId/a+VDRvEIfPdZ3QFmdN/xOi9E7GmPh3tLw3L/NYnZjyu8Mkk
	Vj0Cm66rMjjP9rKrhrpI7yHkPmZ7J2xaAzOvF9WerZhR13rjuZ1fz+VxLXgyKDbRyomUAbTxBwN
	CqeehFCRCK/jails40a8XRudTjBdSLvJSqGRoJQzRXQ2IQnuwFLYBJ0J58vl42Vm1137DZB1MuT
	Ak4JfFQsosRTaHbjJT0a3BabrVLqI6iwD+wrNdi4tgF9zA7LbB3s4Bk12VRH1uZNjrcpH7B4us2
	fCeLpGlijia4lbxtypv6aVz7Ivtux9y4=
X-Google-Smtp-Source: AGHT+IFgEtHJxBLgI+jT81eBlMA+EU05hPKkSjYudhy5V5fcfuuIgxncTbMqid7sNNmukcqK2M9LYA==
X-Received: by 2002:a17:90b:3c11:b0:311:fde5:c4be with SMTP id 98e67ed59e1d1-313b20072e3mr846808a91.35.1749600802854;
        Tue, 10 Jun 2025 17:13:22 -0700 (PDT)
Received: from fedora.. (c-67-164-59-41.hsd1.ca.comcast.net. [67.164.59.41])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-313b2137b77sm161367a91.34.2025.06.10.17.13.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 17:13:22 -0700 (PDT)
From: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@lists.linux-m68k.org,
	linux-kernel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	"Vishal Moola (Oracle)" <vishal.moola@gmail.com>
Subject: [PATCH 0/4] Convert motorola to use ptdescs
Date: Tue, 10 Jun 2025 17:12:51 -0700
Message-ID: <20250611001255.527952-1-vishal.moola@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

m68k's Motorola still uses struct page (it's pointer tables) to track
page tables. This patchset converts it to use ptdescs, to help prepare
for allocating memory descriptors independently of struct page.

It also includes some minor cleanups to make the code more readable. 

----

Based on mm-new. This has only been compile tested, but there are
no expected runtime changes.

Vishal Moola (Oracle) (4):
  m68k: mm: Convert get_pointer_table() to use ptdescs
  m68k: mm: Convert free_pointer_table() to use ptdescs
  m68k: mm: Convert init_pointer_table() to use ptdescs
  m68k: mm: Convert pointer table macros to use ptdescs

 arch/m68k/mm/motorola.c | 54 ++++++++++++++++++++---------------------
 1 file changed, 27 insertions(+), 27 deletions(-)

-- 
2.49.0

