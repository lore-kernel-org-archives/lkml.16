Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BFA613B5B6
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 14:45:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743691521; cv=none; b=S0EatedMMLqcqsjAL6XLJ8m7L8Je+UPCOOYojREi/WBErEBRq7AAHbEnEfsMoGNhmyOfhexqsAFUPZemecGuXnw3Gz2z7JgDSQcTtQkWboOqy5PTSLvzQawjXa3FyxYVlgzAQxtr24sjs+MXiFB5zZyH0Aglc+dNjoJkdc45er8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743691521; c=relaxed/simple;
	bh=3btxJzNX1nWC5uaW8M/gZ6MXHb0T1ZAXwTOrALLVBbg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=ovQxcYhlOG4aXs0ZxQu976H/b3injDnKx9JhaR5Z8g8Eh4h43860/BM8EVnmPhAObmkwCC/Kjfk9/+MxuSshgCKrIRS7SIkc4gXnEn73lfrzeXfTV/vnpsC9kWM8DypZxj2Sjul6nDqO6wxktx/ZhLAh3PSt2rM2l7lYYr+bhSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mXz59f3l; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mXz59f3l"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-39c266c2dd5so870995f8f.3
        for <linux-kernel@vger.kernel.org>; Thu, 03 Apr 2025 07:45:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743691517; x=1744296317; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GZUZF1QD+6bbOsbzh5V9brmPQr4qnHCysNrbSkqr6FQ=;
        b=mXz59f3lt3tRrQWTDt/NDcMhEsYzCW9zaB/fE7uMohaNO6t/NDA6+O54/Q0+AMrq5b
         D4UEUlS08jLQJH8t3sAHJsKuUHRuhYqOTKetm9H1praMbg1X6kdtVHyrXQf9FxNEp/60
         5wjD9el8h5jjRta2dYPP/41/ysyJrd+gyYWpuzM6QAiojd1pn5SUctKw+zsugMM7ToYp
         RlVix2dQYi0+0eg1JpqWSQHe0fzG9G2NWXWbe3/j2f+aH6reo9LQvw3zGxzrdn9bMXmW
         Uuk6lSDe/lLMS2HfSc6qg7fv/niApIkk2cBmXugTSojhsXtQlKjlHNUPgjQ1hUqaK7lo
         wtcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743691517; x=1744296317;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GZUZF1QD+6bbOsbzh5V9brmPQr4qnHCysNrbSkqr6FQ=;
        b=Rrru1MNV1h0aev9qmUZSmj7KnDDeYjDxcyj9o31Os8LQZl5mWdAC6792RcfTRY5vOC
         t33vsKYVNpvXaAoj7S6XzgzAwhDR3+enSA9qkA+ha2PFUiLKHdCf46stIcl1ReMVSKEe
         XNxwvSGHveuzoFuykKKBoudba6rYmMvKDBkJ33RpyUewpHU2w/xXVT/WoooMwsgtNbfb
         g7C6W+tmIqvkT6dqiCVsjnVqmIGGdC/SzqSP+VSdFtpdEqUjhmM9DZ7pibUyFlJCL94Z
         erCFc3QJT2w7z7Kk9B64UCeQsP1mLYnd2u6Uhp1O5N7jXHa1XNhkjxejLftDUwrffF+E
         YybA==
X-Gm-Message-State: AOJu0YyI5SwLbqYXexf4IV3Yb04pMTgxirdIH3IqR/axfmlTIE5/Dw7H
	zOxs2ApjJ5rBXqbd0avUZ+5JILh5L3Sa8fs+FS1cs8p5ykY+xEVqlkcli0JzA/g=
X-Gm-Gg: ASbGncv88AT1AF6VZ/XGkC/m7VMsWkykv1vIjs1ounHBrAgt0km0Rxk7dIb/I4xWP4g
	wIWZDR4o3iJmA9cvWyHrMxt9uNP5r0BEx0ofmaloxy4VmIbNHuqANo3PPrMlbtpVw2LcpkyWLM7
	cN6cDwpUDp74HSibEvKGY69vqkJ5oqD8xqax3kjHRHGliLxn2cuI1fDjmWJIseaxlZ5eKU56BEm
	ENsypX98P/G49bddYC2jgwaYoZ+WHBQM44FIIL9sQrvmvEUEyF9sQ3zSnGbQKA0o35iVxbW7PTh
	ZUYWBbZVIyY/5IlDGbWGUCWWXOiLNUbO/yjunTPK4jIAzCXacWHKdSdWdiZUefXcVmVbrw==
X-Google-Smtp-Source: AGHT+IFwGqSF3ppKW0jbks5OeUqQqeJKL+jLvvT07/7XZSduLFdne0ThNLK5QOgfqHjvfFmWHsNrUw==
X-Received: by 2002:a05:6000:4021:b0:391:38a5:efa with SMTP id ffacd0b85a97d-39c120e07e4mr17271906f8f.23.1743691517543;
        Thu, 03 Apr 2025 07:45:17 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c3020d661sm2044374f8f.66.2025.04.03.07.45.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 07:45:16 -0700 (PDT)
From: srinivas.kandagatla@linaro.org
To: gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH v3 00/13] nvmem: patches (set 1) for 6.15
Date: Thu,  3 Apr 2025 15:44:48 +0100
Message-Id: <20250403144501.202742-1-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1994; i=srinivas.kandagatla@linaro.org; h=from:subject; bh=pldFi6GXiqRfTJjrT/iHq66ZPOyHtGoAlV0wtFyRVZU=; b=owEBbQGS/pANAwAKAXqh/VnHNFU3AcsmYgBn7p7cUDaBl0d7vH4hGUdlU7OBon6wd7WqiH3AZ 5KEFv6kmtaJATMEAAEKAB0WIQQi509axvzi9vce3Y16of1ZxzRVNwUCZ+6e3AAKCRB6of1ZxzRV N4tjCACbBq8D57aRV8Xuj8dre59pglx40RpzxedSaq2g8Ww4zXCS2S0LMwPUt7hZnGp+2JQtk+U Pbea2ENjU/6ceiXZtzQ6xng98N4WS9cdQkp2iHQSIqgIg27ZJwrUhuyZWJTlkZm8fOQRHkSxDQE o2N7UJH5ukp1kNJll5Qp5GE24umMPpMQG0HcDLig8Gnj4Bua/acrXJAltg39N8X41wSwhbzRBng qVfRj20SmYeJYP4mpVN7jB7lCvcYzU4C6V1bj1pDBAJuxi1G02vmMjHcevpo5yGpDFHn7z/E23A yYgOWCM+8cVC78mOnFDezA3uvwcxJGig6LcVcVxDcsCLUbzD
X-Developer-Key: i=srinivas.kandagatla@linaro.org; a=openpgp; fpr=ED6472765AB36EC43B3EF97AD77E3FC0562560D6
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

Hi Greg,

Here are few nvmem patches for 6.15, Could you queue
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


MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

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

