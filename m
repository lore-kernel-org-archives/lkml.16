Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 638F32BEC3A
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 15:25:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751642746; cv=none; b=oZRGVH/ER8FeaRnLvPtDuIb9MoY3Ofo1oB44setyd3i7oDXjJXhVMCnoSWiMM2xy+h0cFZWMa2UbCtoj8mkl4FjB4xdgbuLM58K/T32HZ6i5kJUQqxmCl0G8al4Q6pT9efqYiUyMbM4xeunrwI/GoTVfE/0+zf9HZTJFsWde6Qs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751642746; c=relaxed/simple;
	bh=0gfbkB3PV5N02Wr92thznYi7vUbD0NR4fC7Dj9uLn9E=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=kOibfPV1r65F5Osa+yJzngGlLlYwE0KuQjsCYEXfj/NK+5NOglQv/QwnPR1tNsgL6dyNpQ7YvgMmfENG86egmwgvA9rmJ/8Gs5hdOMrVBmTr+fMgFy3LUboPK6PKRMV8nw0WWCxpw4wXxSzOMV0k2xnlz8pNubWGxVl+ZiD7EX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VsmEfBR9; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VsmEfBR9"
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-32b4876dfecso21826571fa.1
        for <linux-kernel@vger.kernel.org>; Fri, 04 Jul 2025 08:25:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751642742; x=1752247542; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zNvWjNYrNAUtF5MSlixELkfrw/rQdgWdiIqr1YNwBsU=;
        b=VsmEfBR9+XSWUt2EG+UPyTsPzraeV1GUpDvTrdl6GeeLqsSjdL1Suzmg94G7gDeHB3
         tZLgv5p5yhOGmfQUN3aHOwVyb7VGV06H4r72z3Rz7gPlYG2qORqzMqIB9qGNKq71XAzO
         7Z4/w/AXlJKZX5F/tFSExdEEcWMwJ0OajhvLSOb+Qllc7LIiUVdieN0GKrjMFgauIZeL
         SvNEPN00nMDxmWhkuo2umV9gft3pApgkxeQ3Mv8RwESgxU+1fIEIcAOjKlYdAcvQrea/
         lJIRPX6MLhAvs2zHKW+iLWr6Dunhb6mdK6ciHOotmZJ7BA2NhUTOQ7Qbr9DNYpfxWnVR
         cpDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751642742; x=1752247542;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zNvWjNYrNAUtF5MSlixELkfrw/rQdgWdiIqr1YNwBsU=;
        b=wZkSaZhsDmDalkUFJ6BZV4F4d5OoC1vEqvARhYwt2vlL2eVQo7y53/OrO/g1l2MFED
         VNLuKP34sIiMLbiDvxK2bVPCzCNXlTQLnung8348bZLjwjedg9KzvCFbe5LozfOHZYwX
         lcODvEzCWUUtmhRB3OGVdKknVk4KPPJuteHiLjJz1NVy+AiVt8SzJ8SXNbEJev0gKO84
         EU4HRcux8R4DLjt+53k46FL5exHjayDb3OILq41LcXweSKXnURw+USlvPrM+yMt+EbgC
         g1mKHs4w3FNJcj0hOktcVc1Zvj8OfnOF/Yx34Jh635dG0DbQoll4HbpmIfkTndq34o2N
         CpuQ==
X-Forwarded-Encrypted: i=1; AJvYcCV87tb+6QJsSboYSnKweLR/jpqpl1KWLQ+wbMIJbUhDHxia0uHlMtF2/IF4yDqpWjimYbQqsYSZ6az1GlA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2N7NsBN8K8lnVqjy/T8+i3tN5/mVDc4wbq+ibWCZkU1QnE5JQ
	YD0SJ91Yq1/kxVVpnHWLTqBK84UpUo1AUD6aaa35aBgcov42cFDJMj/M
X-Gm-Gg: ASbGncsHw6oYEP+KsjLsp/lAXwYDB1pANu9Xv4XFfkLA/z2HtsEUXws7QpjJu0SLxc+
	P3yx3SkXeBUCd7RZvD9VnjRI+xHT3b/AUFGuF/k8BzRBmTGsmk2ol6MUyGJeFP7Q3x3I30z8EoY
	7UQyOlseurLeiVUg6iNl0d+0AxYD5rsTLDl4kPhHa9pKUg7WJ8GBgUIzeHkhlb3MRC/s++/DeEE
	xsOexWP12A24ozWQYg8otIIiIizBfj7JMMEtpgASp9mKp1Gx7qglGG8NhpApfJVRMuRpBdPRUVx
	Z8Y+4l1Jc8AvS/3IrqNqgYhfLa+w6f/TWqz9ZkBRGTFdYt19RiYwUbwRJA==
X-Google-Smtp-Source: AGHT+IGE2i8eluV/zaoznxDbYgeSGEvnc5JUvAs8UNdO65hStlbpmoDP2IpLyiwGQKpAahNWwpnd+Q==
X-Received: by 2002:a05:6512:790:b0:553:2159:8716 with SMTP id 2adb3069b0e04-5566258d705mr899527e87.26.1751642742258;
        Fri, 04 Jul 2025 08:25:42 -0700 (PDT)
Received: from pc638.lan ([2001:9b1:d5a0:a500:2d8:61ff:fec9:d743])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-556383bb113sm281028e87.11.2025.07.04.08.25.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jul 2025 08:25:41 -0700 (PDT)
From: "Uladzislau Rezki (Sony)" <urezki@gmail.com>
To: linux-mm@kvack.org,
	Andrew Morton <akpm@linux-foundation.org>
Cc: Michal Hocko <mhocko@kernel.org>,
	LKML <linux-kernel@vger.kernel.org>,
	Baoquan He <bhe@redhat.com>,
	Uladzislau Rezki <urezki@gmail.com>
Subject: [RFC 3/7] mm/vmalloc: Avoid cond_resched() when blocking is not permitted
Date: Fri,  4 Jul 2025 17:25:33 +0200
Message-Id: <20250704152537.55724-4-urezki@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250704152537.55724-1-urezki@gmail.com>
References: <20250704152537.55724-1-urezki@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The vm_area_alloc_pages() function uses cond_resched() to yield the
CPU during potentially long-running loops. However, yielding should
only be done if the given GFP flags allow blocking.

This patch avoids calling cond_resched() when the allocation context
is non-blocking(GFP_ATOMIC, GFP_NOWAIT).

Signed-off-by: Uladzislau Rezki (Sony) <urezki@gmail.com>
---
 mm/vmalloc.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/mm/vmalloc.c b/mm/vmalloc.c
index 8c375b8e269d..25d09f753239 100644
--- a/mm/vmalloc.c
+++ b/mm/vmalloc.c
@@ -3624,7 +3624,9 @@ vm_area_alloc_pages(gfp_t gfp, int nid,
 							pages + nr_allocated);
 
 			nr_allocated += nr;
-			cond_resched();
+
+			if (gfpflags_allow_blocking(gfp))
+				cond_resched();
 
 			/*
 			 * If zero or pages were obtained partly,
@@ -3666,7 +3668,9 @@ vm_area_alloc_pages(gfp_t gfp, int nid,
 		for (i = 0; i < (1U << order); i++)
 			pages[nr_allocated + i] = page + i;
 
-		cond_resched();
+		if (gfpflags_allow_blocking(gfp))
+			cond_resched();
+
 		nr_allocated += 1U << order;
 	}
 
-- 
2.39.5

