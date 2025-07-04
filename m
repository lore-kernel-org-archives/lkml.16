Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E5F8277C87
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 14:36:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751639790; cv=none; b=FWQ1alIcocrIlpkUx68XSdbVySy6dhrmq/okT1cBtLvXAKi1U6+ZUJXKv25Lz6RPUmWjlohcCksQKbalJ589wgxZGOJSA5p6/Nnjvye9eS9nbC/u6IpsR15vM/gKgf7OaoYS+w/p9x3EIPV09WuMd4/Talh90I1UXhHLFe0RdA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751639790; c=relaxed/simple;
	bh=zon+2bZeFZ3I7M92hXQ659ByBgia0BgvZL3f6vbsv30=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bd84W0S1xuYZrVIa/f5OIevXzUgXtYqCVEY/wM54F3e8FGEqpcTTJqeg85PN1/mZwHNDp93+OsMdLHb+USDDTCzcLq8a0vA9rTuaTAxXdOjBb1mPf9VvBpb5dAFXIVZyNHEXIpJL2LTW8qbW06CWivG2MJyA3uyf8RO+wjwWk4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=j3e41Xn3; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="j3e41Xn3"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-450ce3a2dd5so8663015e9.3
        for <linux-kernel@vger.kernel.org>; Fri, 04 Jul 2025 07:36:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751639787; x=1752244587; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fYNAQQahuUMGDz22rnH2lh9atASoN+pd5LzktjQrHhM=;
        b=j3e41Xn3fsLycsvLDVyoK+BTSyrCYbqAMePMkGCw8M+1mx1Lt15J+/NaacK/9tPCE/
         w3nc10Z2qResc1m4USKJLd3Q9boE4Q2XNV+zJbnHECieIDGfd1kltXVDYpcQXTGCHXrI
         nowWbYg8ZnOjHy6p8bwG8ZmhPDPAyiwI0Og0xpTwgwv3NyWo8RC/bBN/u6xkef1uQkW0
         nnuBJY6btrD/SR2qMeDlPOuMCJ9/XpPL2QeKTIZlD69jql6V+pVzR4q5HXr95wc0k6oE
         rrqE3SJzP42kKXPTosRJSRIzfhJ5a8hiNGsQihObN5NQGsCEfM2u/IZlQLHanSjeVXdO
         YFOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751639787; x=1752244587;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fYNAQQahuUMGDz22rnH2lh9atASoN+pd5LzktjQrHhM=;
        b=Q1Pz53c6I3lsN99LuH3ismjITId+CDTJdtRxn0+AwN9nIHJGM7C48lJsWHQV//iiXu
         BJ4uDq82wHMweyT9DXnSrZH9/XgMuUxT+H4FlMOfyO10QRy05BOEcyntZwAqpQHvWKML
         nO8GRkIuMgWPwSBttzrWqv7aOpF/RbxzK48r5crPu5MuD1/ObefFXAmouHTcehXBK1Go
         i7SrN7wrII86LLSvVL4LWIIQbi9O2v6mRG8MxqETpPIq/KQribI3K0ZJ1JA9ZXplFziw
         hVikUfErnpeY/Sd9HZOV+EP12D7Tu6f8rVNnpy14pGcpffqz/MVa55hvl7Ri0KK2KOix
         oPpQ==
X-Forwarded-Encrypted: i=1; AJvYcCULAz9Vnhqtt6xBuuJkKUW3nj++kDWSHKXcrm2orViJLGO5agsxF+ThuAZHyJu2+pktJZ0JEZucTJyJbCM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwDS7O5pEtzorQ/T5I3a31IgWxK2PImSLCraUbkRzUbkXuu/BQL
	p50nVrqAYmPAc2fHlnRmUAJGU+a7C/w8meW+8x5qtpQkfgRL387a5hufFv2yicSR/2U=
X-Gm-Gg: ASbGnctHDDMsJ6sM8DcqoVJMU+kHaglilFra2l2OyvmQN/aP1QELqt/U4UJSBMvAEC5
	QCTiJiNVe5t7bqWdecDZgB4dbeNizfPs8MbBWHUg3NJ6ShEacjSYgphWU/mg7fwcT4McpCRL51P
	/FkQdGNukY4QCSaP6qr19EyakiT27Xts894Inm+UpQ4HHH21UKrVNdhD7yS2hvEW4aJ2juj6XNx
	E0EypIZnubwZiU3j73jLrFEz0QpjcDhmUxxn+hU+Qzmg81UxjW9HErdQ6uMmfCPmjadAVaA4ZOJ
	pP4bz1HA/7AvTzU/aIiSciBNzWjzIXrWduULKf0I4hYwGjGqHT4Uc+kGnbw0wtll7oA+R2PuKhO
	rBNALkQ==
X-Google-Smtp-Source: AGHT+IEbOXsOsFrWj3VhBwyGUbOHwXo35WngYlxUc9cqgxLa6FBhnGGYCW+1X3Dqe26+x/f41H1UnA==
X-Received: by 2002:a05:600c:8411:b0:442:e147:bea7 with SMTP id 5b1f17b1804b1-454b7813f2amr16064945e9.29.1751639786941;
        Fri, 04 Jul 2025 07:36:26 -0700 (PDT)
Received: from vingu-cube.. ([2a01:e0a:f:6020:7ff5:bbf8:9357:784a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b4708d0beesm2690186f8f.36.2025.07.04.07.36.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jul 2025 07:36:25 -0700 (PDT)
From: Vincent Guittot <vincent.guittot@linaro.org>
To: mingo@redhat.com,
	peterz@infradead.org,
	juri.lelli@redhat.com,
	dietmar.eggemann@arm.com,
	rostedt@goodmis.org,
	bsegall@google.com,
	mgorman@suse.de,
	vschneid@redhat.com,
	dhaval@gianis.ca,
	linux-kernel@vger.kernel.org
Cc: Vincent Guittot <vincent.guittot@linaro.org>
Subject: [PATCH v2 6/6] sched/fair: Always trigger resched at the end of a protected period
Date: Fri,  4 Jul 2025 16:36:12 +0200
Message-ID: <20250704143612.998419-7-vincent.guittot@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250704143612.998419-1-vincent.guittot@linaro.org>
References: <20250704143612.998419-1-vincent.guittot@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Always trigger a resched after a protected period even if the entity is
still eligible. It can happen that an entity remains eligible at the end
of the protected period but must let an entity with a shorter slice to run
in order to keep its lag shorter than slice. This is particulalry true
with run to parity which tries to maximize the lag.

Signed-off-by: Vincent Guittot <vincent.guittot@linaro.org>
---
 kernel/sched/fair.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index 58f25f0be25f..debcc136f1c8 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -1188,7 +1188,7 @@ static inline bool resched_next_quantum(struct cfs_rq *cfs_rq, struct sched_enti
 	if (protect_slice(curr))
 		return false;
 
-	return !entity_eligible(cfs_rq, curr);
+	return true;
 }
 
 /*
-- 
2.43.0

