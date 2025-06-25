Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFA141E5B95
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 08:14:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750839293; cv=none; b=kT51c7crHpyK5xtzJToHe8edJj2R+/eu/Zyqwazuj9PBWU94Yi+l035gXfV/+vyz6DZhkFc+c8Cxv+ZfdBROeg0BA3vJN6pPxBSBF2XNYmgFavvx7tHWv+SwPQgAHY38nRz49LmZvFcG2Th9vJ1FjThHjUZu/UN/jndNu7ToYKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750839293; c=relaxed/simple;
	bh=odxAEvsjae9gg8oMLkzk/QnwYb3L7Jx3aIy9//HkUqo=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=XirIEWmegtUTjh1zndpulEIrwn60RmeZG0rUxuyBV74qFCIDQfTLY6X5lGiVnelhMPCj5LmxcNQWWRDUOdFkeK0YUOADbs7tWpEUgHXchu8R8djz0JY4LpKc/S+MxCgiuQbF+lV+zpXRyYcOY/VlJTmAAil2MQuYq/4Z9mfTuGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=Xrwc6/oO; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="Xrwc6/oO"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4536b8c183cso3668465e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 01:14:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750839290; x=1751444090; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7TXKlaJaB1mfu7CRdnCYLYciwYgyLjAklw/2jo0m4qg=;
        b=Xrwc6/oOTYkUWAZ2DgIfp0MaIe67pqEBWtYgh2V+9KTysyzdKJKeNFhV9SEgcTaBiW
         KuhsyqfrVbKAq/DBMK6Ttvg4V5gML5gyVlmQLgZHYyCjEaCT9bfk1gfbak1HWgf5XoCc
         IyjTvodqoSVmGSG5uSHFhxeiR/Sb0Np9sOSTqxAMJysr1pfgN/npQPndwz60xOnrL2zV
         kEQ9xucx6/zmhw/ja22QVqWVaQkzrLdkW/qyHHmrtG4FrEYx9py68N0R2FN/3V2BRIBQ
         H1Jc4lMRmBVuJLwQh93YHNNkmkjakD0G9qsbKu7oVDurRI4cfKPXq1O1d2g6dducWyoC
         UrUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750839290; x=1751444090;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7TXKlaJaB1mfu7CRdnCYLYciwYgyLjAklw/2jo0m4qg=;
        b=HpxCc41g6CCJsx+TObBIjFe1Aq5s0jyyxLh+VwcsHGWx9dkcPYfd8QdQzESSmjQE95
         K/W1LuvknZk1Vg6o5pnTR7RX5x5/b/MEc/VeysidOf1av2+l9oq87LUkiKBnvkR6h98k
         QhpU5UUU6rkhdmeYF6K8eCP8LpiujQpXmgThUbQnkuUoQvG0vw9CZv7NNhnGmOmOdMGe
         UM01r65Ca/vMbb28rJqXEm9cKXflE7ekxV3sj0bG0R4sfLmq7GcUoJ12QBoJwZCwOULx
         2tGnRSv3wrMSuVSKF3BN6avKda8xK73XwLKJR4wiC3N9yugp3Vrl16xXXTjBgVqqCp/W
         kmZg==
X-Forwarded-Encrypted: i=1; AJvYcCVOFmEaaAeE++DniLgHWlqh4na0RmCXkcDgZ8cpB5nzyF27O8+7Y+J0ZeLD/RQ2m12iS2ZnX5G+y1XLFdE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+KnGE4+B4HUd2NAx0JnFiuERshlBFpSmm3tP4BmaxFWdy/gtW
	atuMbb1COEYS5c7Wxtuv59YaEzC1gWSq1MBq7SYMZA5NKaP+CQnT4elsYlMgg+GcVmI=
X-Gm-Gg: ASbGnct82d2h1hywpLnYfqQpfBCupTXIMleVVZz5zhc+93jOTADiV1HodOniyR+XHu4
	q1ZBeLwC06eMv1Shs+wu2OzlnMejEEUrBI3HD1NnhJ76QTKf9AdxwHLxToNvgP3FDBDIDbQEEnW
	9s6zSwAqHx/WYSLsHikpFHWy09YKzOIkaHhGaSxNsHZbfFyL/WqAH3XVV7oFZFTbuqgWGgldJWM
	5w0xnKZZUle8OV1kouHYXzCGcblnBJ1CAfzC7/E3nqnX3/jlI5dBYEe2w8a4XKA5K7SP7xSJ5Y9
	H37HV6r18ouq5L+bXfC7LNaH8SA/nnr/ZEMqaCoX+tvWgmN8g6icH0qZ
X-Google-Smtp-Source: AGHT+IHKfY4cJplzTsHmatG1ztCvxABxeb+cv/Fg+MusXuzpeGlmKLd72ZOwYANXtvt/iRQu7AYeQQ==
X-Received: by 2002:a05:600c:a319:b0:453:45f1:9c96 with SMTP id 5b1f17b1804b1-4537cd8e312mr47207785e9.14.1750839290242;
        Wed, 25 Jun 2025 01:14:50 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:d216:42f3:1e7e:472e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45380705351sm20215035e9.0.2025.06.25.01.14.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 01:14:49 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH 0/4] firmware: qcom: scm: fix potential race condition with
 tzmem
Date: Wed, 25 Jun 2025 10:14:47 +0200
Message-Id: <20250625-qcom-scm-race-v1-0-45601e1f248b@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPevW2gC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDMyMT3cLk/Fzd4uRc3aLE5FRd01Rzc2PzNPM0Y8s0JaCegqLUtMwKsHn
 RsbW1ALXGWFlfAAAA
X-Change-ID: 20250624-qcom-scm-race-5e7737f7f39f
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1257;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=odxAEvsjae9gg8oMLkzk/QnwYb3L7Jx3aIy9//HkUqo=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoW6/4Kxl7vPAEnCQ8Raw4tX45Tmyfwn2lK92Tc
 W3NJLtHzcmJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaFuv+AAKCRARpy6gFHHX
 cqyvD/0VzxhaWo0a5F2yEGJcLOtUr0hkI6quKqs/t3fP8wtAWUktyWj9X7AyJy3D/g5NbQh7yIc
 M4o7xMHw/u5/P5ahBG0BeFop5qBf+XHyYZ8KuW5+fZSb47ykFwfCiDJN2WJ02w//TCUOA6NNO2w
 8F8OFVl8pZcGQdrgmvxRQeHk2Hn0XdPdLLGniVpooraInZGM4fNS2DxF9ZewovM68XNtVsh6p0h
 duNQU09CRM4v+FI/NR6h0GQt8nrui4bCIYYZgFlS4kQfFgXmfcVf5ZdqemijGVBX/xRbyeecfs0
 PZl7w9Wz3D9FkoCV6Hbpjbai9sgySzokiZsghuJaH6GVe6Q7IdeZedE1Qq5aDXVVgOEAd+TvgHM
 SDqzzaDZDju1KBwKin9Bcx40DgOyQHrgUINSteE8NtfeFSeTcuQ0Rcs0TY5u+7mT56eM/LV7jBz
 j2pPi4P7Th2BT+LNYU0NzTIatKnUK4Aq6HuA8rSWVfQzXNYoD8ZaqqkkbVJmlzj8B4MZezPDxnm
 7a7saDtvWhd8HJLazSNkuh+LcxBhya1EoCz7j4StmIdV57i23NgGBZKVXbhcSFV9WaOFvDAqAQw
 mc8JVn60fAsgthEUJk6FfysvUkrtzhI3Pu3lld65qPDtnXx3bbfPbrI7mwpkE4pomx2wZJXTeKD
 xoStsCwpFHz4bnQ==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

There's a race condition between the SCM call API consumers and the TZMem
initialization in the SCM firmware driver. The internal __scm pointer is
assigned - marking SCM as ready for accepting calls - before the tzmem
memory pool is fully initialized. While the race is unlikely to be hit
thanks to the SCM driver being initialized early, it still must be
addressed.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
Bartosz Golaszewski (4):
      firmware: qcom: scm: remove unused arguments from SHM bridge routines
      firmware: qcom: scm: take struct device as argument in SHM bridge enable
      firmware: qcom: scm: initialize tzmem before marking SCM as available
      firmware: qcom: scm: request the waitqueue irq *after* initializing SCM

 drivers/firmware/qcom/qcom_scm.c       | 83 ++++++++++++++--------------------
 drivers/firmware/qcom/qcom_scm.h       |  1 +
 drivers/firmware/qcom/qcom_tzmem.c     | 11 +++--
 include/linux/firmware/qcom/qcom_scm.h |  5 +-
 4 files changed, 43 insertions(+), 57 deletions(-)
---
base-commit: f817b6dd2b62d921a6cdc0a3ac599cd1851f343c
change-id: 20250624-qcom-scm-race-5e7737f7f39f

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

