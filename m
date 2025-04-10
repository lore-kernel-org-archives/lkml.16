Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D845A280CF0
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 10:37:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744281445; cv=none; b=H53i5FjVKoKak/qIoWjFZK880HMKLod7NByYRVg2aREemoEq7i46Qte+yzHlQo2O7NmzEl73mz+faMiWf1/YtwfB5edC7i2wn4+Nai1HxZ7Iyh25/+Ddf3n0FN6x41r4fyR5Fj202hJwBxt48lgX/4fuP4o+z+8sYXm55cRWHng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744281445; c=relaxed/simple;
	bh=wSoydyQlm6G68USoMznwRosFCC6xPTjIE05opbWT8Pc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=EkGOEhfVo3UQa4petZdQpnlLXMEf2wQ8afjsvBMKRxi8cS/1L0fMez0kJ1O70nvb1sNpjKXwdkIfV+lO0/4O8ZQG1cEz+epffv1XwzLvTo8zixVoyqXnRjz+lafjZvz+GcXtTzaztS8H+JAIZX8Tcm+yWUOu9UridZgo9ld2Lvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tiJglv9F; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tiJglv9F"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-39c13fa05ebso346145f8f.0
        for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 03:37:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744281442; x=1744886242; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=G9EVV1Ec7k3TH3dY1WUPdLQRnNApCBxvvZldU2uE6sg=;
        b=tiJglv9F7THb76uazpWl3uy9IqZfUs/vJZ4HN1qtaeKTbk01IVLC4hQcL6+0Zrz00+
         zVJaUDi5TSVtOTen2pn87JlxbGuNtvvPBef+tMB5TI+giaEzHotN8A9hkxkblN9H/hcI
         NvQjWyT96KKVr4B+xbqcLoV5nvKbsSkGZxqvZr369yCqbO2I5lniezuFvFR4dzQ3tEOQ
         gUHakpu13zBK2p/7wVfPK0l2fj525WMmyj0WxdjmSnPHfHjhMAnwcWzUDryFEpgLkaP2
         tfDchJE04thHonlb3cQ5IjDO/eM1x49wohq43tgGpsFn7h628PFokeBZ+2/QE5IB1xUA
         L2dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744281442; x=1744886242;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G9EVV1Ec7k3TH3dY1WUPdLQRnNApCBxvvZldU2uE6sg=;
        b=go+vuRwv1PygD3t3rg2vSv8LX/cVl03NvIPXED8X2j6Exofs54ApaHUv7SjHUC3s8n
         Fbi+IIZT5WNjsRj7vLPI1G07emU3BAe9Tnu6Lp/fIOQu9USDdgpZXQCV8AY4ld3FMRql
         WeUm1XefoxGFFJB4O4PHPPRBXQ+gshnAKDU9uxZo04Ca8vo6Q6fzCbfVP6lPRDQ064gS
         t9K2vZRxgHn6cyVsqibgWm6qiwfIu7kB76GgKscXFuGqCXdm/MSkCMZoBy1qjvw4pXaV
         mFFp89y49B2z3ZuSZNAbQoOBDyy0tbFlJXGJ+U05dsT+rWe1jkVqGo/ttgJiCQzM9qeF
         EWhw==
X-Forwarded-Encrypted: i=1; AJvYcCX9ozePVY0RtIqPaG+7tVQHN9FyNaEX7D6iL+9HvHD81Kj680hiQxZVucboeSkNsJOr31vrbAPri5g2nPE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3lm2vMlgW+ETKZPF7O1ASmglHt1+qSheDEE9R797KKzrmv2fO
	WeX2jmRN+uAozWyr9f1PvHbkaMIQ6h5lPGsrC/uZBhHX9/6icn8E/fwFH7XWHME=
X-Gm-Gg: ASbGncttVm7eOGbnD/TyB+HSnpW/vL5uqAej//1sH2c0tVUIne5vkQbHmqMkOu6lTfv
	DUrRlgwqpYatahNhkvH4Gt3x3OtTeJxKmNbbB2FGCxfqQyIl9+XgZsPqv/FzHIo2KMiJQTy0DrR
	SWrZYPW/3RaZqF/qIS69cC5B70m7h4nOQGzcQtvURAZfaYI73kCAKtEOG7CGWkV4ZGe+GP8yT5D
	H4JCfBMVl7c+WuCQ9gDAf6lvmuqgeqoVi1XEBgPYgQCfbOsfYYkWgFFCobNPUC+RT1g8WfF4Mk+
	+eLTOYNetyCT5SQklv7L86sgltjVX5TKmT9obNuJ26ADbDI6Rhe89czl3RFiGQ6IpA==
X-Google-Smtp-Source: AGHT+IGkeEI4UgKz0JuWqCEhtgjSvbu9U+eFmkqEWX/tS80WE+jSM4C5CfOpaNBujEMwfFmabhy3kQ==
X-Received: by 2002:a05:6000:381:b0:39c:2665:2ce7 with SMTP id ffacd0b85a97d-39d8f4f3461mr1543583f8f.53.1744281442157;
        Thu, 10 Apr 2025 03:37:22 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39d893612dbsm4309388f8f.1.2025.04.10.03.37.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 03:37:21 -0700 (PDT)
From: srinivas.kandagatla@linaro.org
To: broonie@kernel.org,
	gregkh@linuxfoundation.org
Cc: linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	alsa-devel@alsa-project.org,
	srini@kernel.org,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH 0/2] MAINTAINERS: update my email address
Date: Thu, 10 Apr 2025 11:37:11 +0100
Message-Id: <20250410103713.24875-1-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=421; i=srinivas.kandagatla@linaro.org; h=from:subject; bh=8qFbEEYlqyqgMAwNvBba8Rd1eK7Pf1l8so2JmRuG/RA=; b=owEBbQGS/pANAwAKAXqh/VnHNFU3AcsmYgBn959YBmrwcaStKI6QyXZvaW289Ghy10STyn4dB cV7Njm3f4CJATMEAAEKAB0WIQQi509axvzi9vce3Y16of1ZxzRVNwUCZ/efWAAKCRB6of1ZxzRV NzEeB/9AMFa6xheHkfhJH2rJy8dCoPZI3IaOUGU9NaN3c60Me5Et0Ax0iyOwHJ3It3vhc0o8poW hfD7usI/odUC1plQbFinU+pFZHv7NIEHgZ24cN7pW4GgncDug8fXZRvd4OrxsX3AWrqPGqAXq0y FArPY086qlPKJcqkvWcyb/m3dVGIXgdNAttvIuG5MIj4MuqOP+fb4xiPU+FMzaeuGE70CQOm1F7 dy42y95kqNBkiMltXX0/TIsbhv0KtlN7qlE0vMZxO/8mwivwppxpt+J4RiyC0j46MD0nt/NCCzU DWia3qVa8/rNZpWgmwHxTR676iXu2gn9sTVWqVDdJAVeap7W
X-Developer-Key: i=srinivas.kandagatla@linaro.org; a=openpgp; fpr=ED6472765AB36EC43B3EF97AD77E3FC0562560D6
Content-Transfer-Encoding: 8bit

From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

Update .mailmap and MAINTAINERS to point to the @kernel.org instead of
the @linaro.org. Linaro address will stop working in few days.

Mark or Greg, could you please pick these two patches?

Srinivas Kandagatla (2):
  MAINTAINERS: use kernel.org alias
  mailmap: Add entry for Srinivas Kandagatla

 .mailmap    | 2 ++
 MAINTAINERS | 8 ++++----
 2 files changed, 6 insertions(+), 4 deletions(-)

-- 
2.25.1

