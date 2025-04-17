Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC39F145323
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 00:32:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744849972; cv=none; b=oH8S1TQNw1B8jnC+kc6kUmvDd3fgh1So0Yqs2N9znWChGwuQq3bcpf7nRWDag2saBt2vHp7xtLMGiv5InIZVrxyKB/umZJqk8jcVG9ZAxcWbpYvxOt7ar1VvviY+w58gjbSSOwi1/uft6mbtZkGc+TO+lr5zlg6EqVQSkbaQRTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744849972; c=relaxed/simple;
	bh=uEoHmC4tV4NU9qt0IQ4+gbKy6BRGh5IjnM1E3Q6wo9I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kyL7GmCBH+pPADpar6/ivr+8VUJc2buCkhV9ohb3QPZwfQUpznB3UoNYDhQ+pdu3cwTQjPhiAsoEPZzaH8cMkDjU7CcYGWD4O4jwMyPrCTgiwQ7xSbVYsAABB+DVH+9IxEp3fQBpJHR6EsDUYSWVgOqsxugR6J7B+lvLf5LlIWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org; spf=pass smtp.mailfrom=neverthere.org; dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b=HVWv5iug; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=neverthere.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b="HVWv5iug"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-306bf444ba2so141868a91.1
        for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 17:32:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=neverthere.org; s=google; t=1744849970; x=1745454770; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2n8F0kDNjcDIJbaag40zmW3Ovg/wUOWV+XY1ifN82lo=;
        b=HVWv5iugzJho2QDSqlhtj7PmrCzLhiwFNeoNp3m902KsawQs3sfz0WgA2c7h3KUztd
         pgHO5ceTTZ+kaATSAcz3dbNa1eX9o4nBifPKlFbzXqYrqhcZ5/4DVWTdgriyDWAIdiZR
         hp6sXoMeewlcUbYIMjepnPa59Oh3sb7Z4pekE4ZsrFJQTA3LnnPNCyZkmwM9cFfKO+S2
         BZxQjC6X6JuSMQOLfFhPVuGzclfGzlw+Cx7eJTSRPyE5LGZTpJJ1hpH9KKC0idqr6r0I
         4jB3XTlPZQI5RbXX+GQPI2ZSkvlTBLMXmEJgCotVwl5N06G+QUYKJzdkmQcHWJvSuivg
         GmcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744849970; x=1745454770;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2n8F0kDNjcDIJbaag40zmW3Ovg/wUOWV+XY1ifN82lo=;
        b=Ri6oLDyyH9acagMIlrF27moKT1ct/XLsbJ75vi7xmScBtMjr+9sV9r4UiJO8JH0qeB
         Ga71fD8ckZOqHGjBV0rzH3GMoOO2ozNCM4qfPYh3KL7G7PeZuCrZD1dGp7AFxN+WctoM
         vpgvJa24SpoYt+nGGAejpRzjuflWBudXfDN+gnfMvd+//JEqrkIUMJSb5a+Mx73/Pf9B
         IBtjrE8ftsSr0lgRjL/UuEH7gVk2XlijETJVorOAEE1/0u71j2QmrU+lH7jo1uRe4tVq
         IsHVgTRkrR4px0e133ekuxgrxqGzerFwC9iE/YKrRhAzcmyEY3xKqA83CcwzvsVgKJk+
         vj6g==
X-Forwarded-Encrypted: i=1; AJvYcCV1zoumSMud3BSNeKMdQRVV7HvUddj4pE/JmlN/liDkT7mvXPOuteqzIh3suPsWw5MX+eqRaNUSeeuX6yo=@vger.kernel.org
X-Gm-Message-State: AOJu0YwndUiW1tTQI3vYbDSje4kkaWlcrM4+2OiuSPcDW89Gjk8Oam4K
	lxL22b1sce3jhB/ilkkctaQiIdc/fbn/6Wz5CzzqwYKK7y6pcQZfUPixLuSTp+FKtw1VlLnDD2E
	=
X-Gm-Gg: ASbGncuqEFYMGxhBIYqS6PIRcb/cocuIzOl9y2mqhVX1huZYLdTGtQXyJSJ4qfgbp7O
	ZuiA3zzU4+kt734/GnQn+xPtBLtIdhJuCzCO2/vWzuT8Xw70u3BDS3BPCdxrcFPbAXiN49xOD6f
	7bkGJsZq/OKndNE2MogwkGIPJgo06tcPR0i+CXYy5xjVIs0jcXj5obSJXZyGFmshivzmXTOeTOD
	dzI7w4KfCCElWZVQ52WB+rWntkMTFL5ZDwwOBy1De5YHWFmWu6tnkkYT+3cjFX6ytexEibvwJ95
	+opls4BqPvFwN1ihCGk6FGFnyRx5gfEvIER08QgdynQ9X9NBQ3OTWpucicpDNshw2LYjdC5dyn1
	5U4Xd/g==
X-Google-Smtp-Source: AGHT+IHQX2aEg8gBZ1hKj7ZpuoyTuAr8dI4SZEWszwz0A4CFXYXv6Te0FytWNllT9h8Uj82vv40iOw==
X-Received: by 2002:a17:90b:1f8b:b0:2ee:c04a:4276 with SMTP id 98e67ed59e1d1-30863d1fdbamr5387736a91.5.1744849969912;
        Wed, 16 Apr 2025 17:32:49 -0700 (PDT)
Received: from tiamat (c-69-181-214-135.hsd1.ca.comcast.net. [69.181.214.135])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b0b220cb76fsm1564801a12.30.2025.04.16.17.32.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 17:32:49 -0700 (PDT)
From: Michael Rubin <matchstick@neverthere.org>
To: gregkh@linuxfoundation.org,
	dpenkler@gmail.com,
	dan.carpenter@linaro.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Rubin <matchstick@neverthere.org>
Subject: [PATCH v3 01/18] staging: gpib: struct typing for gpib_interface
Date: Thu, 17 Apr 2025 00:32:29 +0000
Message-ID: <20250417003246.84445-2-matchstick@neverthere.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250417003246.84445-1-matchstick@neverthere.org>
References: <20250417003246.84445-1-matchstick@neverthere.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

"Having the word "_struct" in the name of the struct doesn't add any
information so rename "struct gpib_interface_struct" to
"struct gpib_interface".

Signed-off-by: Michael Rubin <matchstick@neverthere.org>
---
 drivers/staging/gpib/include/gpib_types.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/gpib/include/gpib_types.h b/drivers/staging/gpib/include/gpib_types.h
index 2d8c05d1fd4a..712987ca139f 100644
--- a/drivers/staging/gpib/include/gpib_types.h
+++ b/drivers/staging/gpib/include/gpib_types.h
@@ -22,7 +22,7 @@
 #include <linux/timer.h>
 #include <linux/interrupt.h>
 
-typedef struct gpib_interface_struct gpib_interface_t;
+typedef struct gpib_interface gpib_interface_t;
 struct gpib_board;
 
 /* config parameters that are only used by driver attach functions */
@@ -51,7 +51,7 @@ struct gpib_board_config {
 	char *serial_number;
 };
 
-struct gpib_interface_struct {
+struct gpib_interface {
 	/* name of board */
 	char *name;
 	/* attach() initializes board and allocates resources */
-- 
2.43.0

