Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DC5529C34C
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 11:23:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744370596; cv=none; b=OhOiJwGFOk3Yh2wduzL9/poxz1Pb2SpCu1acadSbQ8SqayGGvFrQbysISdFN0/M44sqlsYR96FSO2lIdO7+ENAdYLOaNkIWXOvh6v2ll1XBJ+xu+qIFhqJ6rPjd0mloFoNUQcF5Q8z5KJFaDKd9wy0S2hM2QYZcYND4z7Rped80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744370596; c=relaxed/simple;
	bh=uhHFr5ZcBYSXRZg+1EFSf+qV4LAGtXIShJKYOeyyoPg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=GPX8vag2mS9GNVZbbj1VHtpnvENYkLsegSDDkNcQyUigp/QlJ0RediNBjn4eg+0dr8qf4DpEyoG51n0cCfdE+15Y+4Qw8XeIJkKezjTA918KuOasrISyBB6PerKkQt4PN7oBjluilzU91sAq31F4VDm9LNlgoXnwXVGSrYncaoo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GiIS7yiI; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GiIS7yiI"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-43cebe06e9eso13965145e9.3
        for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 04:23:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744370593; x=1744975393; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aBbc0AKb6l4hZdbfGv438FhQVfxtFcmRgrMMnsTyw9c=;
        b=GiIS7yiIGJvoiAg8V7gepkCjsyr/86ZOz9NQU/e7ARqesmyglhDT3ikg+SmeTTePTP
         WDk89EFZfnyYNi7wHcZAZMWE01aY3q6vl6FIzPTMQxaYgvTIBh6vPCELDHciPP72TEFi
         dq4/n17SQ2Xdic+PazetYDI1PA1CRbmGqXzxeMlQa8a15UrRUsWARbgq9pQjCrEkG0yu
         84XjOJYzZMG9kEGgRJSNkxRjxp3v3Cq5CjmUID/hu0+q4flL7iS+NLy5xrHVIBfA2KG0
         AvagItJqbRailkU0KsKYBtav2dM3jXtKnaWLZNngddzQ2AsHYINyQc9ser74XufBITyS
         VvPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744370593; x=1744975393;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aBbc0AKb6l4hZdbfGv438FhQVfxtFcmRgrMMnsTyw9c=;
        b=w+E0gQ8r7b1sS7WY8aUXedk/svVABDIOBh3ZoZhjHcaFmSi1FwS/OsMFmxeQAJjq6A
         iGETIyH/Ypc35zrMwggDoVJ4Xk597eJhBUgNbQT+6Z62AQGk+llei31T3PFVWuDeQP1s
         OZNJKjnrBnZXo+tpaBY3rlGSDS8PBYZ7b/gbTE2oXKFCLX2CZGRzlwhY9xhQN4V6HBro
         GwAW0xrcmwMb5I+AQVVQ2kq6u02nBnp6fmQ2s6/AimAl+bm3zVvXHknMXRmVdax4jkDo
         k8/DPv4SlbPGBT+GUkkMI+ffLJfvW9XXbnzDPRJmiwGwXId7XkIR/f2dv4NzaB6ZHhGh
         ez4A==
X-Gm-Message-State: AOJu0YxgzdatOvtw6hZGCpejUt+qeIm7TugQCfWbqDgixKW39HWbbcOY
	IXrmo/+mZ7HvgG3BJZiOx1qb2+4GzvLv3RtMr2t+CG979iQkYXRe6TftGA4b/kA=
X-Gm-Gg: ASbGnctCF2p3Yp763b2VbPdrckMl7UQjONQbwCtYSHh1mgT/h6iTR0VAKgCKy20VbTM
	oFA1B2iQemui/onnRmQrRE4FDSrgbQO3oSsOZF+a1ORjrJWngmm0GfIvyl3J7QcNJ0+ZPoD+wgi
	up5jwMbard9rUM/W0QQKBDZRv2o2O7poYdh+9AjBW88cehKY7b4JuvpVygKoZpiVibHmmHsRPU1
	obzKQaM8nlQ4JBa81a2+KITOKHZAQRdf+WTMZTEm7yML5dwtV4RH+9EMD0g15Mn7viYnKGYWVgR
	iRSEiVxvgDqq13YGRqPzIb5+dApuRFBehfbT8RcgkbTUJ27++6+jhkx8L4y/qTXxNHO9YYZsBwH
	Y
X-Google-Smtp-Source: AGHT+IHn8OWfQdVPUCp35C/S+aegQFaLL5QS6385GGQATPzSR2C1y7YljsZRG/tetk+3EfGDhducxw==
X-Received: by 2002:a05:600c:1f11:b0:43b:cf12:2ca5 with SMTP id 5b1f17b1804b1-43f3a93c2f5mr19025995e9.8.1744370592662;
        Fri, 11 Apr 2025 04:23:12 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43f2075fc8esm85171445e9.30.2025.04.11.04.23.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Apr 2025 04:23:11 -0700 (PDT)
From: srinivas.kandagatla@linaro.org
To: gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org,
	srini@kernel.org,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [RESEND PATCH v3 09/13] nvmem: core: verify cell's raw_len
Date: Fri, 11 Apr 2025 12:22:47 +0100
Message-Id: <20250411112251.68002-10-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250411112251.68002-1-srinivas.kandagatla@linaro.org>
References: <20250411112251.68002-1-srinivas.kandagatla@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Check that the NVMEM cell's raw_len is a aligned to word_size. Otherwise
Otherwise drivers might face incomplete read while accessing the last
part of the NVMEM cell.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 drivers/nvmem/core.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/nvmem/core.c b/drivers/nvmem/core.c
index 7872903c08a1..7b8c85f9e035 100644
--- a/drivers/nvmem/core.c
+++ b/drivers/nvmem/core.c
@@ -605,6 +605,18 @@ static int nvmem_cell_info_to_nvmem_cell_entry_nodup(struct nvmem_device *nvmem,
 		return -EINVAL;
 	}
 
+	if (!IS_ALIGNED(cell->raw_len, nvmem->word_size)) {
+		dev_err(&nvmem->dev,
+			"cell %s raw len %zd unaligned to nvmem word size %d\n",
+			cell->name ?: "<unknown>", cell->raw_len,
+			nvmem->word_size);
+
+		if (info->raw_len)
+			return -EINVAL;
+
+		cell->raw_len = ALIGN(cell->raw_len, nvmem->word_size);
+	}
+
 	return 0;
 }
 
-- 
2.25.1

