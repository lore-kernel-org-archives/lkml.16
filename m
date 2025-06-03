Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E83D4224B1F
	for <linux-kernel@vger.kernel.org>; Tue,  3 Jun 2025 11:57:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748951850; cv=none; b=kV+Hgyqmce9dT++64ZlFq7as4kC5CnDo6tz/jQZgATGeEySVurzRn+nkhFAAuFQULKED7P3uOoBxqv0LZ0h1kEjimvbIRsT0EjZqlPmx53Kv5pwmWNAqmOax8loENUl4QZn/g+dJ8PARMnvaKpyRnQqR/I9stu3GPBJvlaEK/VU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748951850; c=relaxed/simple;
	bh=8VGdoBQnsW1Y8fk4p9+RrKW9XWt9gACX/CPbdQ0dOb8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=OzAs1ElG8yhfIcdi2RZC0aes2VPUfxdyuwZy63KYB++4A5KCTeXOJfX0qhCuoeoO8COvaltIdLwgKBBlsIrp3/jSe4ddGA2c8R7vh305uxqjHZa3ktAGjXHvX23I7OzCiuGBxbbugqFB0XbAy0GvK6zwz6YQA5cFY0gORAA7Nrg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ju0G0vqW; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ju0G0vqW"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3a4ef892ab2so740388f8f.3
        for <linux-kernel@vger.kernel.org>; Tue, 03 Jun 2025 04:57:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748951845; x=1749556645; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1IBFWQj94F31lf6usd6PCcvd2+aXV7FOAOa4N/LRiuA=;
        b=ju0G0vqWBuSJVuEFV2dCSjU0MIbsyU8GdCozvUoF2AC1UBJP9m/XWXJWb4lPg+2u2Q
         7HKAZkJ7/OFPUrXKADzsHmyez6eWnbmkaRc8yLhwAMZcIJ78KPUV1UbXlfw1DkLfwlpc
         ffCKvK3SaQfYXTf9N/AiGBfk5LzbTKBa0uBZicZhLw2+D674t4dQJiU4I1VYjBj0dU/3
         bphVS8FPsf4vRZJBxOPFgVSzqoswppM7HnVYk2+r50w71AbZNYrgdFVFIa9yMo2oajcs
         wMM7MK9lG4drKdCweJticdcry7qetqEtMm9ZulOsRa9ES3T6K/gnrc5Jcz3yYJ2O1TyN
         2F+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748951845; x=1749556645;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1IBFWQj94F31lf6usd6PCcvd2+aXV7FOAOa4N/LRiuA=;
        b=Xz6KIAmadd7rKvBs9VTJlDa6ZdTzuYldSzm0Z3+lDQRjJSHYbuIof1kHR+upk9hxsm
         ZKUw+uuy3QYGByzwfJyWnBxnJh5TVThEK9AGfD7qVEK5r5+voqNzicfd9mtPmjA3E4iK
         U9YJ04gpAiZBJg+WP+0hSk3FDumYnmkLjnhkPDrh9sXdmu3vZPojAImoWNkazdCNqhP7
         L7/sG7NwR7IutxoGWUs3yjL/bj9CyW3KLvwXW7FIJwri232FWdIQZw6YtXTOZDk4hOER
         dcY+57rawf65Z7RBq/7wtEgsB20PrJcBomWrK8vW+UwTkoZYtniqOTfpq9/rt4m/vJVN
         RuAg==
X-Gm-Message-State: AOJu0YwJRotdtvSV0Kh+M935k/rXhpcIQMA1BtK1S+zjjTd+UIxbYR6m
	TdegIkfy21U18oYurP6dmkava/B4Z1S4z2nOqOhTNDMzoEIhoE53KYW3Guz16od6FH61LOeg66R
	qyX2q
X-Gm-Gg: ASbGncstbB3Hzk5Y989pYlhF1TXaiCl6BH0vvBVM490nIDXZJHmNxjbQOIuTrxSeEnt
	zRy4QzP3Y9GqFwrq5pG1A5QrmozERyHnV5Uz02+mfFty3sGi0CLA1byu/0FXEYWzQatQwxWFxl1
	ZU4Li9miTLt+6yzdqW+bo5sjWptYdDuisO6o4t3Tp0xOIG1Ct5WcvI/vvuG2a9wbOmBuhXNwxON
	zpg24Qn9QPQpHCsX6QWvQ2eA7LxU8cTz7yv6q8K8xcDr1HCCymoWs2syzhDUB/Ff7RdZAdgIrGb
	7FsILlAikP0HyIaeBNKpTek2F+Wlrcflz6BTc5ZDJhOLW2WVy7La3DrTRfi2pWlngyiRI+eE7Px
	vygWnlLDeLcd2OGVXQMa+Ow==
X-Google-Smtp-Source: AGHT+IHcDKEnQI0iAe8KmJOAN+5AyRCThhejg+k63FaCsSnbGWGPgYCXX5i11cKOm0Js9aE/AZP8Og==
X-Received: by 2002:a05:6000:2dc6:b0:3a4:e8c8:fb89 with SMTP id ffacd0b85a97d-3a4f892f306mr4455673f8f.0.1748951845084;
        Tue, 03 Jun 2025 04:57:25 -0700 (PDT)
Received: from [172.16.23.13] (adsl-84-227-104-5.adslplus.ch. [84.227.104.5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4efe6c7adsm17671666f8f.26.2025.06.03.04.57.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jun 2025 04:57:24 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 0/5] dt-bindings: mailbox: Few cleanups
Date: Tue, 03 Jun 2025 13:57:07 +0200
Message-Id: <20250603-dt-bindings-mailbox-cleanup-v1-0-724407563997@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABPjPmgC/x3MSwqDMBAA0KvIrB1IU5OqV5Eu8hl1QEdJbBHEu
 zd0+TbvgkyJKUNfXZDoy5k3KXjUFYTZyUTIsRi00kZZ9cR4oGeJLFPG1fHitxPDQk4+O4a2bUx
 jtH1RB2XYE418/vfhfd8/Li2Ljm0AAAA=
X-Change-ID: 20250603-dt-bindings-mailbox-cleanup-c884545267e9
To: Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Nishanth Menon <nm@ti.com>, Chen-Yu Tsai <wens@csie.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Sven Peter <sven@svenpeter.dev>, 
 Janne Grunau <j@jannau.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
 Neal Gompa <neal@gompa.dev>, Hector Martin <marcan@marcan.st>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, Suman Anna <s-anna@ti.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, asahi@lists.linux.dev, 
 linux-tegra@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1218;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=8VGdoBQnsW1Y8fk4p9+RrKW9XWt9gACX/CPbdQ0dOb8=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoPuMWnfe5utyaUx5gvALmsxmruk7JbV/krIhA4
 j8qvLrJLFCJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaD7jFgAKCRDBN2bmhouD
 15ILD/910b+r8xCBseUJF1YO+j/IHLYwnq2p99ZLKQrjJPODK2Hsa8PvABhsMOVX7NEhd45xauB
 1gokachMmddL3QTHvT2SwZxCkXOkbMCydACOrC/fTJt47ZMqSJVTQddnBcQSgLyjNGm4CeOEnp9
 PNBoEYnzvybXEkQACPTe80hUYBPNMff0l9H1886se4gDoMTuKflotBkuNAKnzK+8kiDBgxNOH9h
 bZsCvRJodQOSAPreMvq0IihcpWlEs34BWltovMVcvF9aAUp083WRW+KVQYmOhWlos+j/T4BRIbR
 CwPlyHjcGOVLxKnlJKijLA9qGkIsezGqUQ2SPYxLPKlc2qzyajNrDlj84gdKweskDeOpiBvLN+B
 KyqdmGfxbd7NpRwX3CTYh4w/0CtWItIAUr9Ys7jFtXr/VsuA0YOCgJjVX1uEFU1xkudoFs1rAth
 RJ/8B3UMC55EENVrV4M2L4siLZlqy2RcczsoTJFZF2waT+o7rvR+fmeeJf0wybsj1f/u9znmagT
 kQ8ZnJpha5iIwXpe+p1xsFf82A53nj0jMMo0yNx2V3WeXOWMo7LyjgxfIAQHTUVhIFc4TIZqJVB
 +kMs1/3Ubq5gPtCQo6w7qymB7PfuxwdaWvtwnw2jPw7zgEtHYR+5EiDbtFhXsuuiB3VyuoxS3ez
 N7pia2kgSwXPEsw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Few cleanups for Mailbox bindings.

Best regards,
Krzysztof

---
Krzysztof Kozlowski (5):
      dt-bindings: mailbox: amlogic,meson-gxbb-mhu: Add missing interrupts maxItems
      dt-bindings: mailbox: ti,secure-proxy: Add missing reg maxItems
      dt-bindings: mailbox: Correct example indentation
      dt-bindings: mailbox: nvidia,tegra186-hsp: Use generic node name
      dt-bindings: mailbox: Drop consumers example DTS

 .../bindings/mailbox/allwinner,sun6i-a31-msgbox.yaml   | 14 +++++++-------
 .../bindings/mailbox/amlogic,meson-gxbb-mhu.yaml       | 10 +++++-----
 .../devicetree/bindings/mailbox/apple,mailbox.yaml     | 16 ++++++++--------
 .../bindings/mailbox/nvidia,tegra186-hsp.yaml          |  9 +--------
 .../bindings/mailbox/qcom,apcs-kpss-global.yaml        |  9 +--------
 .../devicetree/bindings/mailbox/ti,omap-mailbox.yaml   | 10 +++-------
 .../devicetree/bindings/mailbox/ti,secure-proxy.yaml   | 18 +++++++++---------
 7 files changed, 34 insertions(+), 52 deletions(-)
---
base-commit: 3be1a7a31fbda82f3604b6c31e4f390110de1b46
change-id: 20250603-dt-bindings-mailbox-cleanup-c884545267e9

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

