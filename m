Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57D6B214209
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 15:29:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750087762; cv=none; b=uZLrUS9mTP3gJJf95Hb8K+ZfrwkGuQercTubISZesU2f19OPP8qVC0PoTSmkvWHuo+TS7N3T6gaoScDIxHeHE/cYKol4PycbFME4m4Tq3SJHNojPGEbehwT4rBU2Sl5nev6ml3Kng1SPrvxb8SzyXPJxl6UpD5oLSyv294zcArA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750087762; c=relaxed/simple;
	bh=9mIEujvpvhTohHMZiy5M0YoUiMGbG6gmK8Vd0nLEiI8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=WIl77+fB29yy3llAa61KGkgQzpLx6d/Uint7NDta9ZuRLq/vBRZIuEBRBi5o5GmiwjZPN9PbGzQjPQ9QXyOiVC3GrTpkHkmv9yV/BiAKVAS268IBrVUnaJjnyz/hcfLSxs+hn5R4mUcVXe3FH+HId23A1eok+c+hZf/TnWiUvLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=T1bBJ5YI; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="T1bBJ5YI"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-553b584ac96so2864588e87.1
        for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 08:29:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1750087758; x=1750692558; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GrYQ5RYm/ndWHeW4zKWZCLsfb835d3RGk3FNTjrEr7c=;
        b=T1bBJ5YImNROcy4fvQB2HLFNW2DWcsc+UdFfZrG+8qHaaCATHXqvhG8Y6l0Bnj5atU
         AKWcPIg+nzaOnxXeRjh48waIgUjvsrGz58xBf31sOQXHJaZzQys4QwuzkReSCStUDAMg
         8RI1ZEcZvZaltkTj/0Rs2FoI4JqN1BO+vrmKQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750087758; x=1750692558;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GrYQ5RYm/ndWHeW4zKWZCLsfb835d3RGk3FNTjrEr7c=;
        b=IyVC8+nMPjKocopNMQiK1iKocJ+1FE4Xqc+XAj4eXkKFuaILmYqYcXr4KmfoQC2x3j
         DCjVFbCIPjSQGTO57Jo1MYuS7R6POV4cuGwdv9kc0jRQmnwEEUBxHNB82iocKomJjsNt
         abw2cC0B67it5g42JOMTQ/u0OPeT97Hp2AQZEKtvbqpPRntr04O9WrDlHGjdkxyStuqE
         Y7sbj3jxCpe2LeqCON/cJVKXCB+bdcQ1IFXxtqg0AXsgejiKxKW/Wrzwi0YMKcS40icm
         V5FUxiN1do1owX4nyUX0yhVJPiyhB8tOe+yPfxAJtVVTU/AzD0bldfm8EOKROX9Hil6Y
         /YBA==
X-Forwarded-Encrypted: i=1; AJvYcCVWSxTwkrwsafgdVHp1bURqYJzHXq2M7yxfRcgqo8Dx94pH1QLBhKenrdnEWd6d+MEFMtQVU7kwfJ7e7Dc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxWldeRl8y2M4fhjOORRa1ErFgbTviy+7NorID+MRLe9wNQj5U4
	E4RlfdonD7jrFZjkwtZ+sT+Z+uYoPD0f7Av9GXMhzDGXyXNqtfsaXI+lnYokl5V8MA==
X-Gm-Gg: ASbGncvX9VsBaCGoFiHtA8ZoQBL+3Bj+LBXG+ygXysvvjGb/jGDjNwKntlz49GkfzN8
	Z9lzb7mjuUxUmtZjPD1byl/e7W6cFSbWP1XY8cOelhQqjOx1/Mua1s35HheeRFHpoHvPTNGUXQe
	if49P+c5rm6WL7GeZpMipreXhtPDucLpTD2jEsuTfQKCLgnfQuDBCPkRKy+D6fjo5t6YaO39oIL
	annk2rkJ0N9yMMf8b1SrfyNXZHhZa/DkOItjhBhUjOley4cvelUDAGuKDMP7fewffEsWungY5Y7
	YV4MDjel5zevu7dZsgjzOzCHmqXKiwIsXaNI0YS6pLAefVxHmGLY+VgYqz3ezIhPEMUtHTmEKul
	l45qCpSgmuwMXfRFWSon/BctfWs2vxNvW+Tv4O7R2dg==
X-Google-Smtp-Source: AGHT+IG8dwx90CB8xqMFS+LG9CbZSlFFxF8OJOXueRX1llJPl7IR0aw+2En90Yu09u+vcnLxI5GGLg==
X-Received: by 2002:a05:6512:3a92:b0:553:2edd:a7e0 with SMTP id 2adb3069b0e04-553b6e9c0e9mr2419431e87.16.1750087758451;
        Mon, 16 Jun 2025 08:29:18 -0700 (PDT)
Received: from ribalda.c.googlers.com (166.141.88.34.bc.googleusercontent.com. [34.88.141.166])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553ac11ff5dsm1568020e87.31.2025.06.16.08.29.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 08:29:17 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH v7 0/5] media: Fix coccinelle warning/errors
Date: Mon, 16 Jun 2025 15:29:13 +0000
Message-Id: <20250616-test-v7-0-b8c0f98494fa@chromium.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEk4UGgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyzHUUlJIzE
 vPSU3UzU4B8JSMDI1MDM0Mz3ZLU4hLd5BRDgxQLQwsTQ0sDJaDSgqLUtMwKsDHRsbW1AP7ZUo9
 WAAAA
X-Change-ID: 20250616-test-cd10d8184190
To: Vikash Garodia <quic_vgarodia@quicinc.com>, 
 Dikshita Agarwal <quic_dikshita@quicinc.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Stanimir Varbanov <stanimir.varbanov@linaro.org>, 
 Hans Verkuil <hans.verkuil@cisco.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Ricardo Ribalda <ribalda@chromium.org>, 
 Hans Verkuil <hverkuil@xs4all.nl>
X-Mailer: b4 0.14.2

These is the last set of patches to fix all the relevant patchwork
warnings (TM).

Changes in v7:
- Fix error in clamp logic (Thanks Vikash)
- Link to v6: https://lore.kernel.org/r/20250107-fix-cocci-v5-0-b26da641f730@chromium.org

Changes in v6:
- Improve comments for tda10048, thanks Kosta.
- Link to v5: https://lore.kernel.org/r/20250107-fix-cocci-v5-0-b26da641f730@chromium.org

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
Ricardo Ribalda (5):
      media: venus: vdec: Clamp parm smaller than 1fps and bigger than 240.
      media: venus: venc: Clamp parm smaller than 1fps and bigger than 240
      media: venus: Remove timeperframe from inst
      media: venus: venc: Make the range of us_per_frame explicit
      media: venus: vdec: Make the range of us_per_frame explicit

 drivers/media/platform/qcom/venus/core.h |  4 ++--
 drivers/media/platform/qcom/venus/vdec.c | 23 +++++++++++------------
 drivers/media/platform/qcom/venus/venc.c | 24 +++++++++++-------------
 3 files changed, 24 insertions(+), 27 deletions(-)
---
base-commit: 4d2c3d70799f5eb210003613766bbd113bbebc1a
change-id: 20250616-test-cd10d8184190

Best regards,
-- 
Ricardo Ribalda <ribalda@chromium.org>

