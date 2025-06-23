Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F242C1A072C
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 06:28:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750660116; cv=none; b=QBQHNjrw7wmU6y7IG7HUWYPFewugUMLoU5TpfJzj0qU+RYQiMQqvh0Yn2VKGq/awYwSlFHTnHHlpTXb57xrkuYBe4iz7k2+4EavfPWG1F4/i1relansqfK5jeaYM7/ETjRRvKkYhzMtNcGSODjygOGeLKZSH10+efSlKn2iSyg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750660116; c=relaxed/simple;
	bh=X4WbRbv6V8tJvEZsdEmMNwzMuyBL5gd4aHLej9qzEkQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LpMKOejop+3e+iip0mPCTH4qytzvF524j2ICU2EXcUTuCuLhn+4dqigAtPlYQxsgeeyo+zjsqLkPL1Bq+rxjkA3A/8Q3gJ4DBEkG6Yb/FA07CC9w/XaIMN3eX/DpfuYvlnwiRq1GSq0XbhKhqz5u9NrmLDptV+0w+d3iUTFRWd4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=PTvIPolL; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="PTvIPolL"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-7425bd5a83aso3164256b3a.0
        for <linux-kernel@vger.kernel.org>; Sun, 22 Jun 2025 23:28:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1750660114; x=1751264914; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ef8y9arEtvADIssXnSG8QzYyNlDrX8DLCib5+r60jY8=;
        b=PTvIPolLcrUWSW1TJ47Ipfa3Tu2DZ0yYiCaqtJKjCurfss8sbs3WsX/GFAUtgdLxeA
         6ux3AZyuO3WyVm8hFlZdPhnIO/X5/+l5NlJncMo3fvSjwr+JLB/2UeYU5jDmJgJnxW61
         beIwfiQVM0rMnq0PG4of2/JmNnoob0wLOnWeY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750660114; x=1751264914;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ef8y9arEtvADIssXnSG8QzYyNlDrX8DLCib5+r60jY8=;
        b=IyPxgx/n/iAU5KEbRd7h4HGh0Aq+9ouo1PzmZpZZGqqIAB/4BgSZcqsNRYjXvWVRKA
         W0TYN2rN2d3twoMn0YcZ+JXT2LZeugM/9pW9IYWvpMlPlqegwnfqJJx6pLhNk7HuCyi/
         pZ6N/EXsF9W915+AgK7QWS0ytoAfZTB16v/VFWiH0Jp9fMGo6l4UuVjbwdoymdYu7m/K
         NxdwPE8TdpJY11+fpzprNYTe2YyRxLIaa6ooWXMCSvUvGw1mG3S5dCMsvub52Mu6bCgf
         zRd8CmPwFjowsp9rvGqi0Mk0ouAtmARMN90AzBsSwOKYRMTX4S7KoAk8911tsXsNVmAa
         QLnw==
X-Forwarded-Encrypted: i=1; AJvYcCXF1qhfcPs3968dnHX8JDEs18A/ZP3JLndbl16POOF9LrT8almW22EJabgc2E+fDV2/T1CqCNOYA4QaJ5E=@vger.kernel.org
X-Gm-Message-State: AOJu0YwF9/zUWBFYeTNh07Om/g+WXxcN11xrdl0KEGxr+r1bGc3R/daP
	bK6gbcxFQ3cV0690NUG15aYvTi/Ec3QTWIav8fvt+CfurVGayRoAePcgOuvOy/qtgQ==
X-Gm-Gg: ASbGncttyLDWD1bohchG3t0yEajB9HnZPaqEA2D86cqYAWeHQtZ4O1HCWNj4YC4siRw
	O9wTCf0ynqjPKfxSmDYCdqm+EDhbJ2o8i+FwkpLDhRiI8gKiHizWDni+rDDG/omXPVUg4/ON+8Y
	KagsDHtXIlvzggRI2ajCEE+VrEihQ6IxigEwt73FkJd9WpN3aITQ+iy6kDXSxFW3AyKWHeQ93er
	GxZLtrrsaG5tuQTq5TxB8yX5X/jTjMJzHyOddYXGOtQonxahJM+Onuaf3+cJZN1zSIfwZNZYsIa
	ERhoPYFwJcBgb2M0yR9KLWfbhH374OvLuyqoG66eo5Urds5WFMLGGIEGg4Q/AzswnJQHdm/lW6U
	KPEqzR2kXN0r9Fm8H9rk=
X-Google-Smtp-Source: AGHT+IEAVhYgLoxjThogzhEx3EDspeWzMpdRDrKx/Ae1I3gcYnaBxInqM8htlNBllHYNChl04jM4Vg==
X-Received: by 2002:a05:6a00:2d06:b0:748:68dd:eb8c with SMTP id d2e1a72fcca58-7490d7a9aa3mr16464197b3a.23.1750660114254;
        Sun, 22 Jun 2025 23:28:34 -0700 (PDT)
Received: from naoyatezuka1.tok.corp.google.com ([2401:fa00:8f:203:6507:6b94:dd66:3c4a])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7490a6d1eccsm7315291b3a.180.2025.06.22.23.28.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Jun 2025 23:28:33 -0700 (PDT)
From: Naoya Tezuka <naoyatezuka@chromium.org>
To: Kees Cook <kees@kernel.org>,
	Tony Luck <tony.luck@intel.com>,
	"Guilherme G . Piccoli" <gpiccoli@igalia.com>
Cc: Tzung-Bi Shih <tzungbi@kernel.org>,
	linux-hardening@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Naoya Tezuka <naoyatezuka@chromium.org>
Subject: [PATCH v2] pstore/ram: Validate ECC parameters against Reed-Solomon constraint
Date: Mon, 23 Jun 2025 15:28:27 +0900
Message-ID: <20250623062827.133373-1-naoyatezuka@chromium.org>
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

This issue was discovered during developing chromeos_pstore driver.
Link: https://lore.kernel.org/lkml/20250610050458.4014083-1-naoyatezuka@chromium.org/

Add a check to validate this constraint before initializing Reed-Solomon
codec. On failure, return -EINVAL to prevent the panic.

[1] https://elixir.bootlin.com/linux/v6.15/source/lib/reed_solomon/decode_rs.c#L43
[2] https://www.cs.cmu.edu/~guyb/realworld/reedsolomon/reed_solomon_codes.html

Signed-off-by: Naoya Tezuka <naoyatezuka@chromium.org>
---
 fs/pstore/ram_core.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/fs/pstore/ram_core.c b/fs/pstore/ram_core.c
index f1848cdd6d34..c7a2ff9c5a6c 100644
--- a/fs/pstore/ram_core.c
+++ b/fs/pstore/ram_core.c
@@ -212,6 +212,14 @@ static int persistent_ram_init_ecc(struct persistent_ram_zone *prz,
 		return -EINVAL;
 	}
 
+	if (prz->ecc_info.block_size + prz->ecc_info.ecc_size >
+	    (1 << prz->ecc_info.symsize) - 1) {
+		pr_err("%s: invalid ecc parameters (block_size = %d, ecc_size = %d, symsize = %d\n",
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

