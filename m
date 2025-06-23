Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC6651E261F
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 07:22:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750663376; cv=none; b=nkQ0WdB5nZM+MdJCU6Gj0fp1UtzVHLmyTFKD0RsL8lD/pf7NQfrqBDc4ehFuskj34F8C1WPeKY/j1JT1UGuCRJJXwBQyR/L1XvVaZpKOZdDrSxZDYsYoK9YZQRMVKfdE6i6jbATvhA5VATpV+FlQXG1l62MVBv26F5eiVZL2XRI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750663376; c=relaxed/simple;
	bh=tVPLtvullvNQjyX06AbIbSTUgnJpCt5D3bAGyBfQVFc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LDkHJhQ4vanYcCeCJw8pLE6RaBWPw9Ql9WLmZNpCQtcZ4kRxf2MDqQiD94WJEoC5QGoz1AKYkoIkq2U6AHbG6ew32f3g5zRujO5FPUTNZLiYRVIGiV0xObY88hLwNIz5HY/GrDDoaSQRNyKjkxQviS/LlkNOMxli8Dw/HXhYWqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Wz823JMb; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Wz823JMb"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-23526264386so42197775ad.2
        for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 00:22:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1750663374; x=1751268174; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1ER9fq2t0eg8l0t3Hf1In7ziuJr8IwFhvzCavbCoJRs=;
        b=Wz823JMbaHUIoZ2/7YVEJ7vwv6VmfFr6rR8nfaf1h7Jau5/JvzoU/Xww6K5SunMQLo
         jJJwqvtPhVmluPkO5BDAyg/tQSXs2iFnWnOY+M2OqOltTWaFvxL1eWn8iRjjozWUTIv7
         WPxxb3TBk82yRVAgJoxGBOQ/yAOelpcs9h7XQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750663374; x=1751268174;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1ER9fq2t0eg8l0t3Hf1In7ziuJr8IwFhvzCavbCoJRs=;
        b=vXLe9N7xuRBw5yAD15gmRDU+LnmiJrK/6JiODpK87ZAy/rfznHuaJFa4SKXcKPAkFC
         YP26K0rujlg0qZlURehnUen10Rw9qCo6zJHT3iPsv5R92u5tAszF1mdkpP+xZNwM4d5y
         gTXVLUHfhNxqtODub2XxwnMFyB2euafWDbU3rKm1Hz9ikA4w4XrkDBHRVoJHViyoHVVA
         Bi93ziwLOnY3VDGW/lbU8VY50ffb93741iyQ8Ce65QdWKjNdqdyE5iMRoK5vN/dECa4D
         K6jSc8riIgJMCT5jrq4w9NUnCu/DyIOrA8mM1e7IYqdP1YUT3rWpPHHsItgYWvDhdEm/
         2oaw==
X-Forwarded-Encrypted: i=1; AJvYcCVWvUu+zCYhhXl/3yklGNy+JrB5iEM5cZD7h+uk2EdPMYLFpBDE8aveglg4M0z1ZqQfJ/gqv2VIEPwKwSg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwYMH0oDtM9B0VVrw+9OR/zl1OF+meK4FQt9HFH43RQgU2BoN/B
	Z5xCIvd2PbiS/yojmTGAPZzDnVIRwkuh7ovYS2DCuttS4bAGqKhZHEOnzlUa5fK+PQ==
X-Gm-Gg: ASbGncumQNxEzDTYwtqOnfYKq912z1amgqokVG6B4nhBf5Vxve22sjw/sq4yhZDtvT1
	hIChn033XHccYRwS9DG8f8FYd0I4oXoPLCKcS55PCBg3S7qatzBTMtqQOVMs/vfhmiIpSW08FiC
	IMpdYzbDxItpxwZN6BCk/XDmWoy3yFCLBZln7ffFDWXgD45TuHo2YezSqU7rV4LhodmK1jSbkSK
	4+o9Q9byIwokbnCPzl5BEEi/4r0Rtefn3eTNrB5OQqxmjf2lCJqqRbDVjt4QuP84ayHAmJ9/kG+
	7B+qB7hjDp1KnEseHVRoFShL3YARbpvRo10Y7vCbdoIVMOLm4uXWHxXi3TP/iKziJr4hqQaLb9j
	iz0FXyND/S/zv3moCVKE=
X-Google-Smtp-Source: AGHT+IFIWf+eX6Jha0d5myVggnQw78e8hvpbhp8ZINfD3GjMTiVzWryPYj08pzWUXUldpNI91QeNfA==
X-Received: by 2002:a17:902:fc44:b0:234:e655:a632 with SMTP id d9443c01a7336-237d9b19e2cmr194435735ad.51.1750663374310;
        Mon, 23 Jun 2025 00:22:54 -0700 (PDT)
Received: from naoyatezuka1.tok.corp.google.com ([2401:fa00:8f:203:6507:6b94:dd66:3c4a])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-237d860a8b4sm74796595ad.90.2025.06.23.00.22.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 00:22:53 -0700 (PDT)
From: Naoya Tezuka <naoyatezuka@chromium.org>
To: Kees Cook <kees@kernel.org>,
	Tony Luck <tony.luck@intel.com>,
	"Guilherme G . Piccoli" <gpiccoli@igalia.com>
Cc: Tzung-Bi Shih <tzungbi@kernel.org>,
	linux-hardening@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Naoya Tezuka <naoyatezuka@chromium.org>
Subject: [PATCH v3] pstore/ram: Validate ECC parameters against Reed-Solomon constraint
Date: Mon, 23 Jun 2025 16:22:44 +0900
Message-ID: <20250623072244.368902-1-naoyatezuka@chromium.org>
X-Mailer: git-send-email 2.50.0.rc2.701.gf1e915cc24-goog
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Reed-Solomon library enforces the constraint `n <= 2^m - 1` via a
BUG_ON() [1], where `n` is `block_size + ecc_size` and `m` is `symsize`
for the pstore RAM backend. A driver providing invalid parameters can
trigger this, leading to a kernel panic. For more details on the theory
behind, see [2].

This issue was discovered during developing chromeos_pstore driver [3].

Add a check to validate this constraint before initializing Reed-Solomon
codec. On failure, return -EINVAL to prevent the panic.

[1] https://elixir.bootlin.com/linux/v6.15/source/lib/reed_solomon/decode_rs.c#L43
[2] https://www.cs.cmu.edu/~guyb/realworld/reedsolomon/reed_solomon_codes.html
[3] https://lore.kernel.org/lkml/20250610050458.4014083-1-naoyatezuka@chromium.org/

Reviewed-by: Tzung-Bi Shih <tzungbi@kernel.org>
Signed-off-by: Naoya Tezuka <naoyatezuka@chromium.org>
---
Changes in v3:
- Fix missing closing parenthesis in pr_err() format string.
- Use [3] instead of Link: tag in commit message as suggested.
- Add Reviewed-by tag from Tzung-Bi Shih.
- Add changelog for v2 submission, which was previously omitted.

- Link to v2: https://lore.kernel.org/lkml/20250623062827.133373-1-naoyatezuka@chromium.org/

Changes in v2:
- Provide a link to BUG_ON() in commit message.
- Refine commit message as suggested.

- Link to v1: https://lore.kernel.org/lkml/20250620054757.1006729-1-naoyatezuka@chromium.org/
---
 fs/pstore/ram_core.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/fs/pstore/ram_core.c b/fs/pstore/ram_core.c
index f1848cdd6d34..64fa55daa47f 100644
--- a/fs/pstore/ram_core.c
+++ b/fs/pstore/ram_core.c
@@ -212,6 +212,14 @@ static int persistent_ram_init_ecc(struct persistent_ram_zone *prz,
 		return -EINVAL;
 	}
 
+	if (prz->ecc_info.block_size + prz->ecc_info.ecc_size >
+	    (1 << prz->ecc_info.symsize) - 1) {
+		pr_err("%s: invalid ecc parameters (block_size = %d, ecc_size = %d, symsize = %d)\n",
+		       __func__, prz->ecc_info.block_size,
+		       prz->ecc_info.ecc_size, prz->ecc_info.symsize);
+		return -EINVAL;
+	}
+
 	prz->buffer_size -= ecc_total;
 	prz->par_buffer = buffer->data + prz->buffer_size;
 	prz->par_header = prz->par_buffer +
-- 
2.50.0.rc2.701.gf1e915cc24-goog

