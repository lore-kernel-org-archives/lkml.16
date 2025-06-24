Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E141F3074AB
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 16:06:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750781189; cv=none; b=NdZZO3RzVfBTtiL3akCg+mOkIuAFtBI0CvxcF8njZmNkHnMPdk1Rlwm66cBLYXfC1iF+HKc/43Nmh9Ps0A99u4O3vohIWWqXjUG2RR82o0nMJPzw0mH2fGOpWiWYH3RPsKcT8yvWz3MurvVEZ6kGLdd6vOckPoWv3sC02mzzIe4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750781189; c=relaxed/simple;
	bh=xlkLlcSf0h/ZKVboOWy/I0VnhwHvItq4orD9GOCGulY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=VFiTdIlHejA5W9kiVYELZyfSwakIhqe9AVrmvSrqrNZuQOP9jw/R30FgcACuLNOXmjSfEQ225RzeWQHJ5DGfL9fYv0Gmwp9Y6gQ7krxjlH7GTd+ln9rdxreL403R1XnGYnRj+eeeLK3y6H8VMtOeW/a69QpDBn9RfmIhNScBVzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=uDPIkN+M; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="uDPIkN+M"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3a4e742dc97so14496f8f.0
        for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 09:06:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1750781184; x=1751385984; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1cid1BQIElBt/p0v4bYFzQjvCg76HYy8SFF6cbZxptU=;
        b=uDPIkN+MxQJODh4HrRhooG1FQJ4LQef7MRE94aUugdM1U4b52i2Av1Yi/G7SYu7kHX
         cs9vw65qc+H9RawGU8rsA8eNK+o0a8/bPlWm+1KccLM00Ahe1AiK9899wBGnQCfTw4Pr
         q53Vt0rcYwKtrC4Mz3wtmrnDHrKOvg55gEFHB0yXk2Ejx5DowG9sao8xpkr76yoDRPLO
         RreRMPn3Ud4dGHk5Yn5e78jj3Dlv5NRJTFmeJktqbMNFfhPgg8rLdy/HqpP9teZRa4P3
         /Jf1EZXrcZT7lWfBYI22jThmv5oo6cN5IW6T1gQcN1hLN4pjP3YaGlRlCv0Ip81sEPtG
         O++Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750781184; x=1751385984;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1cid1BQIElBt/p0v4bYFzQjvCg76HYy8SFF6cbZxptU=;
        b=i0i4K6RCfmUCpW09X2nNjEZffHEWWzBAH4ZJhSb0XXgP6u9LAbljsRb6EXsPcX7Z4S
         2A8qltFz/E/pjDMHxsK1KJjNDAVbDERqL8+yxt5L/0ksYpwUtGpE29cQRU8WL37sEPJM
         RzfYQ9tKpizFh1PpMaN1fshZgqAqwsgZlSUUYi6mgZuf+pF7nV39pVWBFcKGZ+3H8duo
         AYZc41Jn3Mktsog9a7/mZu4ZodjfQcgUSrEZt8iWEWhITx4s7De+L6pfEq3ZaR8ogEVi
         aKlqXfT8qlEpXSR89Llr/GsZv9QzGqlpiBnEZTOJm1+QPxf19z/LFfktAoUtGz2y7roY
         JzNQ==
X-Forwarded-Encrypted: i=1; AJvYcCWjGb0i6qSk0cdkUaZjgK1+SRO0L4u5gGbW3oHaeMkkIvjllRsvyZsBtRCcWPcPPz3/jD012zP7ZBNEckI=@vger.kernel.org
X-Gm-Message-State: AOJu0YyW89PnpeDOJMc3Gb+Y5totI254fzxD5rz0TYbzPtmwPTw2gbo4
	q0v0c6EJJIFd8GkIbsPnNICLNeUb3hmfpH3xFDvl5WPeUMwQz96yWmwhLgwQt2+afMw=
X-Gm-Gg: ASbGncur0aX3kp90FyF2zX4uGd2pBal5TLGkk8kB3BcGpGdzhPPrc4asdbDyAsTvSed
	ea0Oti7McXf2MhOBd/AQ0uNuZ8NaLMBf8SgzQQi9dlkDRrH+ntJyuC1Ul3sG+6QnR0LGH1jv8HZ
	xfDie6PeMg7HCJU4hyZcxkcF97g/nI/ym98mfqR27VhEG5kQ1PCHGabfjSqeawRmaHTARfx6GNI
	0Msp/7cTAfYNkVOLncRGcNhxxdLpYxF/LqI68GagGIf3obBfadCuG/89/ks9NJf1rQ5qVVp9F1I
	Ivlf062xvNNut2+1ugirFFQIjuyJN8ca+5t7HFww6RFAr4zswAFsgFdwMURCXxCpjeJJeRCzfcc
	H
X-Google-Smtp-Source: AGHT+IE7QrYdODMg+rQ3Qulq63j+JWzcWyuaiscjncp3n+omTYlc5+kTNiqEaBdrxSFrvdg+ETe++Q==
X-Received: by 2002:a05:6000:2913:b0:3a5:8934:4959 with SMTP id ffacd0b85a97d-3a6e720e285mr3568635f8f.27.1750781183884;
        Tue, 24 Jun 2025 09:06:23 -0700 (PDT)
Received: from toaster.baylibre.com ([2a01:e0a:3c5:5fb1:9dad:c694:2b52:ea7d])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-453646cb64csm151933805e9.4.2025.06.24.09.06.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 09:06:23 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Subject: [PATCH v2 0/2] NTB: epf: add vNTB support for Renesas rcar
 platform
Date: Tue, 24 Jun 2025 18:06:15 +0200
Message-Id: <20250624-ntb-rcar-support-v2-0-8c0e5cf69c4d@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPfMWmgC/x3MQQ5AMBBA0avIrE0iUypcRSyoKbOpZopIxN01l
 m/x/wOJVThBXzygfEmSPWRQWYDbprAyypINVFFTWaoxHDOqmxTTGeOuB7IxXetb6xpDkLOo7OX
 +l8P4vh+x54qEYgAAAA==
X-Change-ID: 20250624-ntb-rcar-support-e3397f76c532
To: Jon Mason <jdmason@kudzu.us>, Dave Jiang <dave.jiang@intel.com>, 
 Allen Hubbe <allenbh@gmail.com>
Cc: ntb@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Frank Li <Frank.li@nxp.com>, 
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, 
 Yuya Hamamachi <yuya.hamamachi.sx@renesas.com>, 
 Jerome Brunet <jbrunet@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1448; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=xlkLlcSf0h/ZKVboOWy/I0VnhwHvItq4orD9GOCGulY=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBoWsz8XitbW65TZA5BSG3j7AAxJ1XgMryQBWpCW
 JJZGFjrqiSJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCaFrM/AAKCRDm/A8cN/La
 hTuRD/4qu3puCsQNgW95NrBlI2j7ugbs47thV9vS7IwWYXIeU+7jkSUFYV1h5NwVSBQxc5y8O4a
 nF//2TP0H2gFfLPOnZnclShKUc3/87jGsoX5f3O23NtBKTVrQfLWDWw91bGJp+R+Q1G1h1ywh/k
 dPs+EPuTvcWiUn/eJaD2BdKAswPoXpyPAKu7wVOZpds0h+IVm6hJ25t8NW15EqyykUsGG3yZUbo
 oEvkOXRrtbQY/zFgBYQKkMuxJckauImcPO4+Trb7zakem1pozwOJKvnCQTdLPodLEe0JgmoT6Lm
 1pZTu9/dUwR08CFEvYgVgixi7uz8twJNAuIIiem7X9cp0DR3e6WWiDmlrSgcl66rbzLm1sTXLbF
 LYlndHEx+14Z8JEr2NnDRYzrfY9JPjYj6JJ09McQWpN99/ACkukjpyfSGSOEHOMnL4qrdSq5Jy+
 ECpm1oYOCLoHMDw96rv71iK4dSWtIetcRXdmrCkMoVwBv9IhqHdgOv3F7QkB0q6yC59n24l+5lg
 A0Q/hOBTzX18ETZvuop/MX9qE/Q8OtJ5bI7Ued21bAwuBpk512fVFp7K9VZNwZOYpyRvySEM0O2
 5xz7jN4SXKBUD5ADPkh9+JUpaQyfQgjx7zO6OB1xVupE6NSmrFor9FT0FlAkD0jFfgccPYO4rNS
 /u5FJ5NPjsoepUw==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

This patchset adds support create vNTB link between rcar platforms
This was tested on rcar gen4.

The changes here are for the RC side of things. The EP side was sent here
[2]. There is a runtime dependency to get a working vNTB link between the
two but no compile time dependency. It should be safe for 2 series to go
along in different trees, even during the same cycle.

It may seem like we are starting straight from v2, but a v1 of PATCH 1 has
been sent along the v1 of EP side series [1], for illustration. Starting
from v2 to avoid any confusion.

Changes in v2:
- Rename barno to barno_map
- Drop unnecessary default values
- Actually add rcar support with an product id provided by Renesas
- Link to v1: https://lore.kernel.org/r/20250505-pci-vntb-bar-mapping-v1-4-0e0d12b2fa71@baylibre.com

[1]: https://lore.kernel.org/r/20250505-pci-vntb-bar-mapping-v1-0-0e0d12b2fa71@baylibre.com
[2]: https://lore.kernel.org/r/20250603-pci-vntb-bar-mapping-v2-0-fc685a22ad28@baylibre.com

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
Jerome Brunet (2):
      NTB: epf: Allow arbitrary BAR mapping
      NTB: epf: Add Renesas rcar support

 drivers/ntb/hw/epf/ntb_hw_epf.c | 120 +++++++++++++++++++++++-----------------
 1 file changed, 69 insertions(+), 51 deletions(-)
---
base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
change-id: 20250624-ntb-rcar-support-e3397f76c532

Best regards,
-- 
Jerome

