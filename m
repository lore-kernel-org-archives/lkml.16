Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF6E41DC994
	for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 08:23:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743409425; cv=none; b=PzWxkZYek/pwY8BE4zS4uW96lsvXGtrc5FZha2fLNfTcbrx9QlItFm6WJCQoyeKyaimnaEAmS52oadxaWhK7jC51LYMXLfMVtUWgpv6MEqUmPl9DscdpvE5FEPJYQKEavv+VZiz/NWmmwST35Y/tiEkijX4QRF20RKBttREtiHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743409425; c=relaxed/simple;
	bh=ERwV/SnUIQ4OHPGNRv4Tp+NTvJ/Vyjhm4B9Sc83K5dE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=B2PemZSj/bau71T7PTvqTLVi/ksd1LzEo55UlWYdp/fwmXgxz5cjMacGELoxGTvA+l2m1l4yKT5eVIJlXBbrRiGCBb5lo2a76J8YhDXg7QaHRC+7JMKUUawp0jyZjeq8d1oi+1wh78vit1WJx1c1C0b+peaZgxAMqSRD0HegF80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Mmvqv5Zm; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Mmvqv5Zm"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4394a0c65fcso39773555e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 01:23:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743409422; x=1744014222; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QK2g3FGZIjasAQ7VSmorolGoY5GKHH9MhFTld7ZjnJs=;
        b=Mmvqv5Zm+6prIa5/5c4NAYohHs7sZ43JWGVT+BMeFbttcsAHtlK+q8ywOZdS850k8m
         uJQMQPuOLNhGKPUtwfGjFegOWk9119gN3zc9tuF1JPbQUQYimN3+xQsfRRIGkZkAChfe
         8CRmChoSoVNOFNtYMcyeyC/9r7ee3j5MD9CCw6z+Mi4LkfxxrbBm1yEE42+JnoKyn3M9
         46YJTMULCMKlNqCnsPqOkydTYdftZD8cKVg9D7Qf1OT70andvUcK7ENZQCTzJzGj8uME
         n9VOttFSppcDOSQUfAiEaqH+FkIOoIqQBaKmAOdtVdrkBbvpBmBhe8GpTFMFvfzFczLG
         eukg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743409422; x=1744014222;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QK2g3FGZIjasAQ7VSmorolGoY5GKHH9MhFTld7ZjnJs=;
        b=cRdaq1VcA2OmUr3sDY0lrFwU9XdIDCZdcL7KyDwHeVlLHPMtxhOnmNoYct3kclhhnh
         gaQHO046P1nFQJOimXqeM1TM3JkacDNoREGeRuE5t0xhUKbOYhOeQl8nSXHdWH5vXs8P
         lKii6dLCzun2JmuHwwMk+bH1KiFuv0SbY68MRoRo68I45UTnAXGhTCt7pJLssSqdmNqq
         L84mZazf+OvPqWflAeK5TSkXkA7M7lX7F8YB4YaLTeFKYVkumSNa50MDD08XCkijFVx9
         cEf81Fle7UwzFlwei2kdU6FhNhcQu/oJ8E9/7cY/LBBjAYL9Ig3yojb1O0Fc4zXSN3DZ
         MWhA==
X-Forwarded-Encrypted: i=1; AJvYcCVEkW+5CCcAHbMWlMzrmtruTOTaDaFF7K228l7yJxyc4B7Gj414Qqhaz1+xML4xWWS+tSAiqtQUfi9gBZo=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywjj2bTdjPzQTgaYQtQY/kigKigCWCmcobXx4eP+j7cZhYP9qYZ
	QbWqyS1LBxzZ1rX9Tt4y0kTr5T37sSC3U8eE0ffYTetGK3Vr3hmm3L8DWmurp3o=
X-Gm-Gg: ASbGncstgADBKfH+867UIle8nVSh08RnhzYynl2rQTdTQDqCKzg4ODX3x6ZDWt8XOWR
	3xobVL3N3Fb1/7nWL7LObKCpu2AzqBuih5Z81zgrz0V4ALwT147MAnMD4kZ5ONYeg48I0C21nFK
	ZWas9vAkMe/KoNyO8wm9wNyUKLgTmXQlqmIgm9dIe3QW1WAEa7/Pmb+5dP67TJGbeobB9qDMu+E
	6EFlsBT7+W0yd3iqkszLovXFHx37nwSnXfEv3mG3HM4+KUd8oi9vk6NmV3sVNTzz0sJyJqTLJEU
	nc6lw9MqBF+7MdJWNMtSixufWiOwvagVHqd5TCW5YlqETCyKtZCbf+Za/PV2m9CCqxuTRehDeGZ
	bgeCwdDjTEsYyr7URfwwx
X-Google-Smtp-Source: AGHT+IEISWKcgsRTpQ3Z0Z0qNZlwTz1sZpCHybyqtuv68X05X4q1wH/e/XIbVecbpVDX03fLTSyYhw==
X-Received: by 2002:a05:600c:34d3:b0:439:9424:1b70 with SMTP id 5b1f17b1804b1-43db8526487mr85580955e9.30.1743409422187;
        Mon, 31 Mar 2025 01:23:42 -0700 (PDT)
Received: from [192.168.0.34] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c0b7a8e0asm10520079f8f.101.2025.03.31.01.23.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Mar 2025 01:23:41 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Mon, 31 Mar 2025 09:23:34 +0100
Subject: [PATCH v2 1/2] media: MAINTAINERS: Switch from venus Reviewer to
 Maintainer
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250331-b4-25-03-29-media-committers-venus-iris-maintainers-v2-1-036222fa383a@linaro.org>
References: <20250331-b4-25-03-29-media-committers-venus-iris-maintainers-v2-0-036222fa383a@linaro.org>
In-Reply-To: <20250331-b4-25-03-29-media-committers-venus-iris-maintainers-v2-0-036222fa383a@linaro.org>
To: stanimir.k.varbanov@gmail.com, hverkuil@xs4all.nl, 
 quic_vgarodia@quicinc.com, quic_dikshita@quicinc.com, mchehab@kernel.org, 
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.2

Stan has stepped back from active venus development as a result I'd like to
volunteer my help in keeping venus maintained upstream.

Many thanks to Stan for his hard work over the years from originating this
driver upstream to his many years of maintenance of it too.

Acked-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 MAINTAINERS | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 29b4471574982bf3f8d03158cd5edcb94bc9fab9..9571d042c7f4f7d3b0eb3e627f3b5ae20cf52e99 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -19590,9 +19590,8 @@ F:	Documentation/devicetree/bindings/usb/qcom,pmic-*.yaml
 F:	drivers/usb/typec/tcpm/qcom/
 
 QUALCOMM VENUS VIDEO ACCELERATOR DRIVER
-M:	Stanimir Varbanov <stanimir.k.varbanov@gmail.com>
 M:	Vikash Garodia <quic_vgarodia@quicinc.com>
-R:	Bryan O'Donoghue <bryan.odonoghue@linaro.org>
+M:	Bryan O'Donoghue <bryan.odonoghue@linaro.org>
 L:	linux-media@vger.kernel.org
 L:	linux-arm-msm@vger.kernel.org
 S:	Maintained

-- 
2.49.0

