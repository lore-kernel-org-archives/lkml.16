Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A21CD278E6D
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 11:23:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744370584; cv=none; b=IVYl0vv+xfIlCpl38Z+g7EV49PSpHiT4WrInA94l4U62x0i5LLjI2WDOG7CmDOoDNPU+ZZ6TYaiB3tYkLrncG5qPSAKOt5PeOmgmxQi4nrPWMJ7ug8mEnBeuyuyACO46rzIoLhNwHZA4XlpQNkfmmk8XxALAJeNjQ88qQ8oqcBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744370584; c=relaxed/simple;
	bh=TvlXDqc1xMPoOkjBgZNwkzSBlQefPbWXWVyLhrazopU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=JvoR2hJl9fCBHSIctYFYA6rXxMI0uPpJ5PZpMXf2mVX4t3/hUmVNrfaI2OHUtSsUGSNW6rV0IchOey0rPDbtvH+GXuz9rdLPQdM16JkgHD7HMHeWTtip3aIguNTEGc8JMQvRU/oNjNUNvJZ9qVx1sejp8/BhSi0i1iWTm8Dp8rk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tZf2w9H2; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tZf2w9H2"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-43d07ca6a80so9024255e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 04:23:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744370581; x=1744975381; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hN0/xmTtaIP8WD/Sy1+fQuxXGGXWsmRYd4s9sEQ/h3Q=;
        b=tZf2w9H2Sg7DvksRna5Kc4R38GhulX+iItiM+tkLCX4WDJjwAka1dtbw6/CvaG7Gbg
         KMjqke/U7Epg0W2UQrHGMlcGtdb3MfKHetd8WRtT6wBo6IEvbfJIv5nJlfCUogBDuSTA
         zdUCW7sRfQ2eLhlWIEM4Aj9BuESJ8fhhPVlPombOGQEir9ASAolMRKgQqXKXJZhYtl13
         k6GYznHaMbqsTrHfxILqQCMAfHxR/LaM0YzE7UpAsFzwT2wKdhFVgAtr0hc2Z0OVODPu
         4LQOADZk3VBLhpUU4D49JBwnqNr/w/Ba18OHAsH/y0ywbgjx3xDKCt2gOYQuKqu0Cd3Q
         lVAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744370581; x=1744975381;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hN0/xmTtaIP8WD/Sy1+fQuxXGGXWsmRYd4s9sEQ/h3Q=;
        b=IVPnD+afFw+HFImneCtqhDTiXcQ/uPNxyOXEpfcJ9WI1nm0G+xhY7h9wV8oPtuoBjT
         dHncglyTyO/2U1WhfzJ6Jzv7JISOEYAYrIQw4Blfm1vA8SSi1pTUHIUQ8Xxz+0uqiuW/
         GiQF02jT+d4erln2ra8ZkZQIAgsXHCpy3yIey5GCq8yL+h4xtAwxgPuLcenLJeG0KQoy
         Dlg6W1jbclLwPGOVyVaYYEXP7GIcF/f7BEUr29B9k7g7kuofOufgkCcLLkLq/rBdx98X
         tmPeZV/cXqclo20X1PSPv9//rKLqx6lJzuSJ5u8AhblqqYTUQwgY3h20ekY6Ac84Oukk
         xHpg==
X-Gm-Message-State: AOJu0YzJO1jJib16cgB+FhzxBmJVS94WbpuRgjvsIH61Zxhbtn2a52eu
	W/ylGZtz7cJWF+wrGMDgMDdEPeBywPBj7HR8mpk8iMWm+WMcgPqTxgDIUMaTUiDIB3Vbi+YYJrR
	VDXM=
X-Gm-Gg: ASbGncv9eYUZRj0EMJ+zHZEBijkr71AMzxhh5wpsBau6DhX6Jx669dAK/pBXkWU33MF
	8vzhfyShNaVbflzjIJsCd+HjFuPaqy87gRYfoK/oLKg+nno6/YOdIk3z/z6pCctg8hnlrD7y3bI
	Ty73XYMLT9nptaI3z1/l79O9gciBH1dbKuJYzokE/f6w+0+pL9MP9Kj0TJKwibsEOn/VSgDrOUw
	0oHBr50gTANz3PsaT68DCSvRLhEBNXm1yPD+sojuCzs7XYQqRY9G3TVtGFIZ3RHpBffxoJhwo9S
	oMJbTa+h5xhi6BUOxB4ucboBTMrF3JEPWiZJ9cg9Y4pHEHxKISfYhrqnoNbkegvzWw==
X-Google-Smtp-Source: AGHT+IHxbYe7g/hQxxMCVLQqWVALnx96eZk+iKXgAtt/zNcrtvka8FbUBzRBsLP0Hk/U1A2gj7WhaQ==
X-Received: by 2002:a05:600c:34c5:b0:43d:649:4e50 with SMTP id 5b1f17b1804b1-43f3a93c74cmr21336295e9.13.1744370580853;
        Fri, 11 Apr 2025 04:23:00 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43f2075fc8esm85171445e9.30.2025.04.11.04.23.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Apr 2025 04:23:00 -0700 (PDT)
From: srinivas.kandagatla@linaro.org
To: gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org,
	srini@kernel.org,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [RESEND PATCH v3 00/13] nvmem: patches for 6.15
Date: Fri, 11 Apr 2025 12:22:38 +0100
Message-Id: <20250411112251.68002-1-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

Hi Greg,

Am resending this after rc1 as per your request.

Here are few nvmem patches for 6.15, Could you please queue
these for 6.15.

patche include
	- updates to bindings to include MSM8960, X1E80100, MS8937,
	  IPQ5018
	- add support to bit offsets for register strides exceeding
	  single byte
	- add rockchip-otp variants.
	- Few enhancements in qfprom and rochchip nvmem providers.

Thanks,
Srini

Changes since v2:
  - no changes in patches, just resending as Greg's requested.

Changes since v1:
 - Merged fixup "nvmem: make the misaligned raw_len non-fatal" into
  "nvmem: core: verify cell's raw_len"



Akhil P Oommen (1):
  dt-bindings: nvmem: qfprom: Add X1E80100 compatible

Barnabás Czémán (1):
  dt-bindings: nvmem: Add compatible for MS8937

Dmitry Baryshkov (5):
  dt-bindings: nvmem: fixed-cell: increase bits start value to 31
  nvmem: core: fix bit offsets of more than one byte
  nvmem: core: verify cell's raw_len
  nvmem: core: update raw_len if the bit reading is required
  nvmem: qfprom: switch to 4-byte aligned reads

Heiko Stuebner (4):
  nvmem: rockchip-otp: Move read-offset into variant-data
  dt-bindings: nvmem: rockchip,otp: add missing limits for clock-names
  dt-bindings: nvmem: rockchip,otp: Add compatible for RK3576
  nvmem: rockchip-otp: add rk3576 variant data

Rudraksha Gupta (1):
  dt-bindings: nvmem: Add compatible for MSM8960

Sricharan Ramabadhran (1):
  dt-bindings: nvmem: Add compatible for IPQ5018

 .../bindings/nvmem/layouts/fixed-cell.yaml    |  2 +-
 .../bindings/nvmem/qcom,qfprom.yaml           |  4 ++
 .../bindings/nvmem/rockchip,otp.yaml          | 25 ++++++++++++
 drivers/nvmem/core.c                          | 40 +++++++++++++++----
 drivers/nvmem/qfprom.c                        | 26 +++++++++---
 drivers/nvmem/rockchip-otp.c                  | 17 +++++++-
 6 files changed, 97 insertions(+), 17 deletions(-)

-- 
2.25.1

