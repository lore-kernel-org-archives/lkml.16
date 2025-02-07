Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FE7523C8AA
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 15:56:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738943810; cv=none; b=WwPxgkY/Vm/+gHGdO+lX3w/s38evATJ636FJNy4p9XRAQk8qoPC6QvOATPCn4N2leOfa4DRavveIm1MEglTqVEPn7FvckRt7/x5GBZZNKgkTAzL0VQJBeQeXgKPVlLMf6JF0vRH+Y1yTKbtt1H87n5RSOk2EQaH1XVl0Rb6bZB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738943810; c=relaxed/simple;
	bh=6Pxx6KI65/1OvLcTbyXFy8HVl7tEE5dMXgqx/8YkiDE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=k3l1jpnEh600FXK9E894HvQmycTSyG3OnThaRzfbT99GU7eCRy1rE/fTI6T97O7eR2YWYHVCXJ2D1FJAaZAXyHwNRgoyw0l8gkJhUURunwIuebAW+DvEnHv7bSHlQAgyiYXYiW8cID9wkG0JbqA/XmCVa3FjE09/cTR8GdBQITU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pVoLb80r; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pVoLb80r"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-38dc8b5bb0bso558315f8f.1
        for <linux-kernel@vger.kernel.org>; Fri, 07 Feb 2025 07:56:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738943806; x=1739548606; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Z4XaH+BkrFcElpValwujf8MTwHDZlLF75VrF7xokMmE=;
        b=pVoLb80r+ls9z0veoWdNjDayLnHz3F/z4vcl7E/6K9XDtTS++3h4svqDCxYFHK7cIW
         Gww6GVrEKuF5WG/SMEl3ZdGCk7BCcGiZirHo+t7c3c3fglBW2NfuBM0+RaBqUm73kHeY
         kZIyLu77MtUryEQZphTuXf5ocQiBIXaVJ0vQnzQ8rSvl1WJSGuVq4X+zExVhEhE6oV6r
         sYbCjzV8HzlPNz+mOWE34TCJVCbAW0HWw0hduFfS8hNH9tp9reii0ijfMjMUcHKluOSJ
         dwqLPxv8fruslukLEkTlKTvlYrc8ZPkbhTw9/cqa32vBL59x1clwq1eZYkwATgUUwNt9
         /+qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738943806; x=1739548606;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Z4XaH+BkrFcElpValwujf8MTwHDZlLF75VrF7xokMmE=;
        b=fREm1mmkaAzfsMochWbfEwIIgQpCcckr05xJxITQ62//X0HPA+FFetsWjrWNL3U7u1
         PZxRz4Ms2mFw651NXSR1K41QMzJ5tW0HELYfDuab8Ei9d1039HRk86RIWRG6NC+CuHSU
         7V0nxRpZMtu4AuBxv1QIqZl8piX/KrS6o8Eu5x7FaHiOuz34QjwlhwdKMgJSwv6nO87x
         uAOLTZfB18c5od/dBynwxMo4tyItDJCXhJ6rjFfqUmyQUzCx9T5Xts1DOGBM1xaezygA
         dVuVQegeLEe6AdaVYWTEuUs3W2HkI7Vs/ni0zNlSCvBLYcoqKdSEVtzUc9CC78F3U8qE
         Xqrg==
X-Forwarded-Encrypted: i=1; AJvYcCXs4LQzQgqqmX5LJJefkdv+Dl2zyl0kBSJFC0b8eaT4HBAJeKUHCPC6LlN2S3sex4gFWiqaNyn1rHe4Pes=@vger.kernel.org
X-Gm-Message-State: AOJu0YwOWpk7HhBYB+2WC/AtW1JyB/FLXchhWiQiV/DgWzAc6h1eM1Es
	vmMW99HcDwbtzjoE27x8+OVOIUe89rQbh+YTOfKbaJ+pgXwCgFcUWkSRR2/ThA4=
X-Gm-Gg: ASbGncsFp/1vlFS2RHIqV6gWGDyqPXiz5y45ruNAnYYJi/qc7KmlPHXWSbtIisqLXS4
	ZIheO7N+ov1MDhqRLb3R24ygeuAJq4bK8Y9A55u8t5W7FHwvAicBqPt3sHzyfNRdfzExBzFbOFP
	/XqPgcKXvCwGfcSdvmdQomzjOHvtZLKE9MuK3vOOrF5has2j43BiB0W5IYyP34NJzyJ8s8bhF/2
	7hk3hcNsPAFOFGKQcBKlaE8X5ykOiM9ThR96hCe42H8DpfBKJ2qILID1G+ktjvbZtZHfK24bRmb
	FVN3Gvxp5xhg0SMwQyhbWm00M6QH8ao9pzs433dQwMbHXfConMvaksQ22FCQB2uRvbw7UEg=
X-Google-Smtp-Source: AGHT+IF1isjfJhpwBwRn2wFIcqnriDpf7RWiylXJF2/fIw66GnlQdlas3grGew4e61BN8nzPIDi9jQ==
X-Received: by 2002:a05:6000:186d:b0:385:e1eb:a7af with SMTP id ffacd0b85a97d-38dc9491e85mr2957542f8f.48.1738943805838;
        Fri, 07 Feb 2025 07:56:45 -0800 (PST)
Received: from ta2.c.googlers.com (169.178.77.34.bc.googleusercontent.com. [34.77.178.169])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dc09fc2d9sm4197507f8f.6.2025.02.07.07.56.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2025 07:56:45 -0800 (PST)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Subject: [PATCH v4 0/4] arm64: exynos: gs101: add ACPM related nodes
Date: Fri, 07 Feb 2025 15:56:42 +0000
Message-Id: <20250207-gs101-acpm-dt-v4-0-230ba8663a2d@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADotpmcC/3XMywrCMBCF4Vcps3Ykt2bhyveQLkInpgOalKSES
 sm7G7t3+R843wHFZ/YFbsMB2VcunGIPcxlgXlwMHpl6gxLKSKUEhiKFRDevb6QNLc3kpbWjFg7
 6Z83+yfvpPabeC5ct5c/JV/1b/0lVo0BrFFlDzo0k7y+OLqdrygGm1toXB7I2fKsAAAA=
To: Peter Griffin <peter.griffin@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 andre.draszik@linaro.org, kernel-team@android.com, willmcvicker@google.com, 
 peter.griffin@linaro.org, daniel.lezcano@linaro.org, 
 vincent.guittot@linaro.org, ulf.hansson@linaro.org, arnd@arndb.de, 
 Jassi Brar <jassisinghbrar@gmail.com>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1738943805; l=1810;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=6Pxx6KI65/1OvLcTbyXFy8HVl7tEE5dMXgqx/8YkiDE=;
 b=Ir9PpklqrZfAtoVJ4ojwHmNFqBLoHsRgq7+0zLdvsefNa+gLYJx+ogCrjXkLGQONm2MnOkOCR
 Pdcub+4iX2yCB9rrP6hCk0igolpv9lrMS2AiWNEMmDCo/5o+wqcDM4a
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=

Define SRAM, mailbox and ACPM protocol in device tree.
Enable the mailbox and ACPM protocol in defconfig.

Bindings for google,gs101-acpm-ipc are proposed at:
Link: https://lore.kernel.org/linux-samsung-soc/20250207-gs101-acpm-v7-0-ffd7b2fb15ae@linaro.org/T/#mb557ee342de628b1a8e462d4fb7c3ac6eb8be4e4

Changes in v4:
- rebase on top of v6.14-rc1.
- describe in the cover letter where are the ACPM bindings.
- Link to v3: https://lore.kernel.org/r/20241220-gs101-acpm-dt-v3-0-642d64daa5d1@linaro.org

Changes in v3:
- ACPM: don't specify the channel ID and type in DT: the channel ID is
  discovered at runtime and the channel type is always DOORBELL for the
  ACPM interface.
- mbox: update #mbox-cells = <0>;
- rebase on top of v6.13-rc3
- Link to v2: https://lore.kernel.org/r/20241212-b4-acpm-v4-upstream-dts-v2-0-91b7a6f6d0b0@linaro.org

Changes in v2:
- update nodes based on the bindings updates
- update mailbox and power-management (mailbox client) nodes to specify
  channel type (doorbell or data) and channel ID.

v1:
Link: https://lore.kernel.org/linux-arm-kernel/20241205180200.203146-1-tudor.ambarus@linaro.org/

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
Tudor Ambarus (4):
      arm64: dts: exynos: gs101: add SRAM node
      arm64: dts: exynos: gs101: add AP to APM mailbox node
      arm64: dts: exynos: gs101: add ACPM protocol node
      arm64: defconfig: enable ACPM protocol and Exynos mailbox

 arch/arm64/boot/dts/exynos/google/gs101.dtsi | 25 +++++++++++++++++++++++++
 arch/arm64/configs/defconfig                 |  2 ++
 2 files changed, 27 insertions(+)
---
base-commit: 2014c95afecee3e76ca4a56956a936e23283f05b
change-id: 20241220-gs101-acpm-dt-6dcde166530a

Best regards,
-- 
Tudor Ambarus <tudor.ambarus@linaro.org>

