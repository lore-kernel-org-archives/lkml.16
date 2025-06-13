Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 771C22E6D12
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 14:05:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749823532; cv=none; b=EuQcLa5wFXHKv4zNU3gD4HYt0TN64Iqn7zBL9QCafntFDm5l7j1QZVjgLuO7qfcmmXN+6O5Sh/QN17w+7tTp334ReqTIhC2nvgGnp9fm7DRnvkShyX1/k/0YMprOw1tfZq3cK/fpukjaJWxpOi/kIiM0/BMuLih4abOEdt8A8yE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749823532; c=relaxed/simple;
	bh=N3iswA1+2DOgy7vZ7wIfGsqALlE/MMqX5CZyUip3DqQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VgeKI4FKr0ZLrZfLePqETYpcedeOkcI1jpQmr91KgGGcyTjBKQm2JvD1rUVLVQfZRWyprpPTGji5fbz/7YFczsiqwkTD7DwYWK/nYKx49Df/mz281NsvwyM+BQnbIq0XujoyqMqql/gFEClvzZwKVL6XIkFhc4XVi9AX51wa0/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=imdPfDew; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="imdPfDew"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3a365a6804eso1408754f8f.3
        for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 07:05:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749823529; x=1750428329; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DgbpV62LiWrQKsbfwnMZoUM9+oxW7YVl7WWXsQs3wV4=;
        b=imdPfDewX+YYI8XmW2g6UkWogRzy9XvGfaAwX7ZRJnCbyGT7LJy/fTrxTrteKICMOy
         WThfg0c1xtGbpp8JAVfRjk3FGkzqnjN8UDCWa1Rk8keGfnzfHYndjAeAuuL6X54ZDwMv
         y7GnNFsEw3svuyaGvuwT/U+7A70iNZ8yhL5UlJWJSe/XQ9lkU0DviTF5ZwAFOagYPAZd
         YnIqzWNw8SeycmoDVz8VcDYPaqhSWqtAHuEBHUg9aJVoSEjHVu5A3/tNDfChcY1tlZqQ
         WPkw6JNgeKMxwaT19MvzMwf68Tc/Wlgm2Sop2aW0s+SCM2eKoHp62/m4Byx1tcPodp6S
         rXxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749823529; x=1750428329;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DgbpV62LiWrQKsbfwnMZoUM9+oxW7YVl7WWXsQs3wV4=;
        b=d7K99eVAZOJMPZ7mQAbFuTDqBxCLZM/4G0+c01ysp48DrUmNSLa+NZ6+6QdWhgcnki
         +rMO3ZYWO5n9BAqmO60Tw4+8jtKvvYBN5QVkICjt4oyrhCvbX8bzEqOINa//m6QEYrt8
         wr6AEjCUynlaVuZQ55bamISq8dpche2xXV968Qeei5JssNljvgppnWZGiBbRNSi2VOR2
         gRzbzevHkgjG5Zg5NSOOx0cIvo/o4OCYbG+IymSscyN/jQHIMQJDV9RBkPhzmJUX6uKU
         1bhSWT2GaXOkXIQHPEnr5ZeK3cUoj2TOI3giXAUHWS/lx/H1N6F+d7MXtl/aQrgVA84i
         4o4w==
X-Forwarded-Encrypted: i=1; AJvYcCUhHGbs+/W/ogHx1prPyDJB6IdeCx8v2xeBeoTZb64yFyWG1AFssCtbUHXMj++4JuZviN/UtbY/qL34oCI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yws7Rt42ZzauE3c2EdG3QW+2IvydsYf9QEH6kZ4KMapOZ7ByWjz
	EKDvq3LoCRrtYAkxG6MK7pqYkjKYrDUpJZwUqu/lb8SzhKvAIYcqKTwDbc+DnMAHv5o=
X-Gm-Gg: ASbGncve20fEv/eEorX7PhjAKJREsgua98X0DXDNg+g3Q6WHvqju8qSUIA0UyarxWwo
	rY/ieubuiyfz2UT38mWJB8GcPYgIgzyv1H2XSKOA9LeqF10kp4aoIbB1KuoINaBgeDITxZ1OMY7
	83v2aOjWl5FLV9/LeLTCQI9JU524LaqQx7ese/g1keaOLmXvzfP7Zdo3ZfTe6eEW0/tLa8vVBrd
	Lu9B6+9jrjaXZ76RUCKnZKEJpeNGmw+6UJSfHgwZcH+OnaxbEP9dX6/WKqiLbzCB4lWVhxZDUaw
	GiISAHMjEsQtig0FR/3I938AZV8YpgsEUGfOTJ20p2MatlMkR9QgpenClr47etX57CzIzogg1LT
	3CJSr
X-Google-Smtp-Source: AGHT+IH+uHLM8Q1BZumEUNO1NXYHlJbHUt903NUJo6OhYuVLmqYHugYn5cTTmIt9ZkzYIXnCM72nWg==
X-Received: by 2002:a5d:5f8f:0:b0:3a4:d6ed:8df8 with SMTP id ffacd0b85a97d-3a568716312mr3152834f8f.39.1749823526913;
        Fri, 13 Jun 2025 07:05:26 -0700 (PDT)
Received: from vingu-cube.. ([2a01:e0a:f:6020:f98:f3a4:ec28:1d4e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568b27795sm2472276f8f.71.2025.06.13.07.05.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jun 2025 07:05:26 -0700 (PDT)
From: Vincent Guittot <vincent.guittot@linaro.org>
To: mingo@redhat.com,
	peterz@infradead.org,
	juri.lelli@redhat.com,
	dietmar.eggemann@arm.com,
	rostedt@goodmis.org,
	bsegall@google.com,
	mgorman@suse.de,
	vschneid@redhat.com,
	linux-kernel@vger.kernel.org
Cc: Vincent Guittot <vincent.guittot@linaro.org>
Subject: [PATCH 1/4] sched/fair: Use protect_slice() instead of direct comparison
Date: Fri, 13 Jun 2025 16:05:11 +0200
Message-ID: <20250613140514.2781138-2-vincent.guittot@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250613140514.2781138-1-vincent.guittot@linaro.org>
References: <20250613140514.2781138-1-vincent.guittot@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace the test by the relevant protect_slice() function.

Signed-off-by: Vincent Guittot <vincent.guittot@linaro.org>
---
 kernel/sched/fair.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index 83157de5b808..44a09de38ddf 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -1178,7 +1178,7 @@ static inline bool did_preempt_short(struct cfs_rq *cfs_rq, struct sched_entity
 	if (!sched_feat(PREEMPT_SHORT))
 		return false;
 
-	if (curr->vlag == curr->deadline)
+	if (protect_slice(curr))
 		return false;
 
 	return !entity_eligible(cfs_rq, curr);
-- 
2.43.0

