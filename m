Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 181691C695
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 00:21:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749082903; cv=none; b=Qx4qNGuimtnDJ8NzTDc7OpohHdyVEgrLUWbz01Gs83eqIBhqkfanoSRYqv2qK4jY19EQt01HXN+M6OlFog47q8B9kDfJfw+h7ywehj3GU2GE5pLTX7L0senl1DpMdH27nchLyD1UDC2eTMCvLRZGKaPeLCbWBFT/T7CObyX/1+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749082903; c=relaxed/simple;
	bh=Rzc26UGss66HbG99AfC6Xrb6mr5yeBzZKHvJSIqoDx4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=EsFhim1JLaWxuVv/Ji+ep7pg98aNUE1YEfLP+5R4RZmqCb5xG1Ue6v/y0SFqyYfM09Jd/HxD3vjsQaaNkHraIwSR2F6SwEyUDoKwyPcQMhTITMOgb7dhMr1wWqWKUvZtdKqlovFq6q1mmapFRZ8SYsks/W9XL+0HCGcfjiNwvVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i+0M8Fhq; arc=none smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i+0M8Fhq"
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-70e5599b795so4937607b3.3
        for <linux-kernel@vger.kernel.org>; Wed, 04 Jun 2025 17:21:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749082901; x=1749687701; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Vn+YpZ5oWgO6gZ9Q0emBGijkBmytA6hKk8jzRwcMZA8=;
        b=i+0M8FhqOpQWbXlMRgHmkWiW0FKLuyX48DDUXMrqfN2Rm3wqFUv9Ie9dq4GS/A70qS
         CZQOVy3vBlBQJ73YY8jOxO5tPCN1AfedivNN6NFxut5bF4FSqCUc0hT/MKGPMeSYME1/
         MnDgkDB6B4g1nbCv+dq4fhurzdZcY53MUYOD2pVs4XFkD/dMTUakJIhVoT/VOxxXrEJF
         42AknqnlBf74bIfw/7rdptgUsV3ISnuKK8XnyTsgGvV2IdW7GpMjI9T0z4glk0t0mZq5
         PKrrDI166ncm7XmtB6MI0PeiDnnhvbQjTX0Pt9ZKJ9jq7W1B9fCnMWtdNlsaSMnAZ5/E
         +4rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749082901; x=1749687701;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Vn+YpZ5oWgO6gZ9Q0emBGijkBmytA6hKk8jzRwcMZA8=;
        b=YsC0NKtfOXRv0t6gCvqNnK14/d+/TUxD0oi0fvsue6FjnKKEsFjJM12D73sRvhwKMy
         7/FfbGmwEOUc+Env2l9Dd6uIO3G8r13vR7xmBKrD6RNMymH9PyIZ3acV1Ug/3ds4smAH
         UIWz/BKTczLVd+REQ4e+r5UR/yNgNE8WTa0qHbyhliCdD5Wc5OomWfCGec1CC3kFEeTI
         +rJT6hM5T4rTWCVnmLVQwChk8ngwcCxjpN06EfoD8rsviR+Qg+1H31VhB0dfIrEqjHsS
         O6pwg5veccmfyJ7O3W3/Pr5Rdo0iPgGmxa1X2P7FLwK9mX06g9eRqareqkZQU0JiQVTs
         XtBQ==
X-Forwarded-Encrypted: i=1; AJvYcCX64SWrxLkBMq1SApwEBAkSK/9sG0xilIDWeTS2NFZDd9S2eAaTF7Nms7Gr0U25dRS8Pzj4zzstuXavqko=@vger.kernel.org
X-Gm-Message-State: AOJu0YwKH4CHyQlvAEYajEUtFylH3emL1v6md42vYa1fu/9bbhRnHx39
	xvrlU4/nxHXnorw5OAbidOQ0z5+9TlMJbeIu86Zq9wPhYL2qN2rxFmKc
X-Gm-Gg: ASbGncvjdng097t4eWzUr0efVUlYbGW8SjtnbId03D4k/iSiLo4vBOgciwuAqLyWOdD
	8I660wD4Kh41MjRffLXNav58CZPoJtFXJNZEvBn8giZHLSBcVStDMl3clyIBAsP76cJx1vpOOvT
	J2fFIw3Bzq78rudKgngDi8/7HM2jimly8Gid8I8hDtPnKR/CrSiqUcFMFHIe0N1tAefISkWXHyp
	Ail1/gUNsBmCah+TdxacXaAAt6ZCr8gkFpfFRjwe3Qnb5QZVCSP7apZe/OhI6LPBwooPXaHQyi8
	KEEF11mNeORhluquH0qbXkTzVAG/Kjh2qZOgiIBGkY4TGcBp+oaprBn0BT+SYJMc2M+v3p0tT8N
	JT9mmup6rZaTaZjZN4xhHyA==
X-Google-Smtp-Source: AGHT+IFQt7fO9AECKZrf8OQSMHbCPAbYYxpHP3uMmGoGNb/ueCaBAW87Ibq1AW/FU41/+MnBGTaNrA==
X-Received: by 2002:a05:690c:d8f:b0:70e:7503:1181 with SMTP id 00721157ae682-710d9f2e395mr73630087b3.18.1749082900903;
        Wed, 04 Jun 2025 17:21:40 -0700 (PDT)
Received: from localhost (c-73-224-175-84.hsd1.fl.comcast.net. [73.224.175.84])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-70f8ad005a6sm32221627b3.101.2025.06.04.17.21.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jun 2025 17:21:40 -0700 (PDT)
From: Yury Norov <yury.norov@gmail.com>
To: Tejun Heo <tj@kernel.org>,
	Lai Jiangshan <jiangshanlai@gmail.com>,
	linux-kernel@vger.kernel.org
Cc: "Yury Norov [NVIDIA]" <yury.norov@gmail.com>
Subject: [PATCH] workque: fix opencoded cpumask_next_and_wrap() in wq_select_unbound_cpu()
Date: Wed,  4 Jun 2025 20:21:37 -0400
Message-ID: <20250605002138.47124-1-yury.norov@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Yury Norov [NVIDIA] <yury.norov@gmail.com>

The dedicated helper is more verbose and effective comparing to
cpumask_first() followed by cpumask_next().

Signed-off-by: Yury Norov [NVIDIA] <yury.norov@gmail.com>
---
 kernel/workqueue.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/kernel/workqueue.c b/kernel/workqueue.c
index 3bef0754cf73..3518ea5ec55f 100644
--- a/kernel/workqueue.c
+++ b/kernel/workqueue.c
@@ -2221,12 +2221,9 @@ static int wq_select_unbound_cpu(int cpu)
 	}
 
 	new_cpu = __this_cpu_read(wq_rr_cpu_last);
-	new_cpu = cpumask_next_and(new_cpu, wq_unbound_cpumask, cpu_online_mask);
-	if (unlikely(new_cpu >= nr_cpu_ids)) {
-		new_cpu = cpumask_first_and(wq_unbound_cpumask, cpu_online_mask);
-		if (unlikely(new_cpu >= nr_cpu_ids))
-			return cpu;
-	}
+	new_cpu = cpumask_next_and_wrap(new_cpu, wq_unbound_cpumask, cpu_online_mask);
+	if (unlikely(new_cpu >= nr_cpu_ids))
+		return cpu;
 	__this_cpu_write(wq_rr_cpu_last, new_cpu);
 
 	return new_cpu;
-- 
2.43.0

