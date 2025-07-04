Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACE31307AC9
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 15:25:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751642750; cv=none; b=gZaP4H//SnS/rHQ6JYxSXvrbdkETfkpPDIsEbeFzX3SVIlmykrZas8u8NYzkxBn21wvc5dqXT/70GnGSgxtdYrj0Pa310tfH+CnQqkHnJsJX5xR3JzuvruBQ8Ax+qeSzzCxXt4OQd8QGGEXwRUgyikeIqbwcy3tsTbWeoJG3FmI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751642750; c=relaxed/simple;
	bh=qdbcmnfi6BBagOQtQeWcXYCebYXtRv8siscZpl3YqSs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ueWXoLhZj/sGupXrAyEDP12MqOfyZlgEUam51agrC8LKIMC7pawgY2knyASp7YEPfQGgejs6YLn07l2PypNRpPu4JpgDbl3TTatS9pCQAPdtmxbmHguWZZ6Lb51mj9tlGoElnWGiT66bsoDXVUPtmWNkXrTumjMynaxKGV1wRYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aB8OuB49; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aB8OuB49"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5561c20e2d5so1308106e87.0
        for <linux-kernel@vger.kernel.org>; Fri, 04 Jul 2025 08:25:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751642747; x=1752247547; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Kenxt5H/LkX1Kdgcu9dff1634Pox2bcA7pVcuxiSLYs=;
        b=aB8OuB4936SnwjW0Pe8curH/YYo8TyLrhzITvmA6FpeaJE+8BAtUlcVwX01rP3XXPs
         xmP22WqV5CA3HxGpCKkNr7fKibVXiV7DqlCaAjxaIpm2gGyUufSaPnc+dygaYpEe+Fkk
         QCXXQs2uhL74XTDPnMnbc72Giqu14OVHt+H2ivc4mvGsDCBjAAJtpoVEbj2Bxe8tD+Jx
         kGw8eZl+ymxZxVfxWXtPzXVN0lv6SCoDiygWkpLcN+bFCjxydREjAUZl7hTkRZInX+XX
         gE2wpauraestzFo6Pgs2egTsVt+pRH6Ru9GfrNhEAdfKGJKXDYAFzVCVS4KQtwumcF7x
         tbgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751642747; x=1752247547;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Kenxt5H/LkX1Kdgcu9dff1634Pox2bcA7pVcuxiSLYs=;
        b=jyGnaPZ6f1adbopTukVc6N9SlKR61CdnWhlKh9xrxAa3fFzd/3Q86mk088fnsxCUWh
         djnxKGewPtPsew0q2Qy06zK2sI9cMfxfZ4MxpVeXS/G2vFPwv4Nb8MpkXS97QKkKFKEJ
         N1usBkoaR06fXUiTSh5fPhBl3YdmSKiHdunK5awlHyV2Tpjt3ztMJESbZB5fIG9QsQBw
         ilfOKBUH+0F3b++SVR8tK9Z0snbsuqC28cCUKgMH5FBf8ak7SrhhNALKhie+MZa2O7vO
         5oLaEwkN5NCfEvKoU8caTrjxctOCyA9CeNcyp4nPXGCfDWNH9hVVCTZKJw5Odq/w/Yw/
         ZKBA==
X-Forwarded-Encrypted: i=1; AJvYcCUUJhhW4KKdfeIYty1TrsMTLXUbjBEjtq39U3ZvdCz0elh4sDQTylXcbmI8vE3f256DVcXc33OGSOJ2zZM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9oCWdPHp+iTeeKxFEz6K+Ec3ilxcle1NDtyGAsx0Gffs6+eeR
	Jg+9GwlazCvUu37VNfVm2H94DJEhYtMhEmXcrTiBU3f7iPWfUcG2gI57
X-Gm-Gg: ASbGncsA5P3ZFnNn+r9+oRE0JxEgJgVB4XcSl02oRebOlJYMfiRwfDRY6lYB35tRkS2
	JSKa5gSGLPGZXKjxUO2yc7AWiK0c4GmJtFj84lIUy+3KvzEcNet+dWWgAtBnKz/LjvJUmK7PC4U
	LxkVH/oZaM3s5wsxHxFPurfELrOCemXMJjyTUM0DGtbbmisqLOWw2NjMrXiLjCop9RNT1QokJEv
	xY7IE91+X1mdyabeyVw9gU+KoF78uTC0ka2M4GV5mmi+gAfz+4uXTVUD4LGRCWitHvB4DxAEhjD
	qBFyBwQkqnfOBo0W5AMW/lko0iHKrs4h50/pgtw4aKUWReeyF/AnegSDwQ==
X-Google-Smtp-Source: AGHT+IG/HUixC6AiULlotmtiHBrwDZHuColKMq21lzt3LlhO52ExwXaVlOR9T0P1ss5qTdOAN6EAxw==
X-Received: by 2002:a05:6512:12c8:b0:553:35f5:7aac with SMTP id 2adb3069b0e04-556dd1e4a26mr931907e87.48.1751642746367;
        Fri, 04 Jul 2025 08:25:46 -0700 (PDT)
Received: from pc638.lan ([2001:9b1:d5a0:a500:2d8:61ff:fec9:d743])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-556383bb113sm281028e87.11.2025.07.04.08.25.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jul 2025 08:25:45 -0700 (PDT)
From: "Uladzislau Rezki (Sony)" <urezki@gmail.com>
To: linux-mm@kvack.org,
	Andrew Morton <akpm@linux-foundation.org>
Cc: Michal Hocko <mhocko@kernel.org>,
	LKML <linux-kernel@vger.kernel.org>,
	Baoquan He <bhe@redhat.com>,
	Uladzislau Rezki <urezki@gmail.com>
Subject: [RFC 7/7] mm: Drop __GFP_DIRECT_RECLAIM flag if PF_MEMALLOC is set
Date: Fri,  4 Jul 2025 17:25:37 +0200
Message-Id: <20250704152537.55724-8-urezki@gmail.com>
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

The memory allocator already avoids reclaim when PF_MEMALLOC is set.
Clear __GFP_DIRECT_RECLAIM explicitly to suppress might_alloc() warnings
to make more correct behavior.

Signed-off-by: Uladzislau Rezki (Sony) <urezki@gmail.com>
---
 include/linux/sched/mm.h | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/include/linux/sched/mm.h b/include/linux/sched/mm.h
index b13474825130..40757173acb1 100644
--- a/include/linux/sched/mm.h
+++ b/include/linux/sched/mm.h
@@ -246,12 +246,14 @@ static inline bool in_vfork(struct task_struct *tsk)
  * PF_MEMALLOC_NOIO implies GFP_NOIO
  * PF_MEMALLOC_NOFS implies GFP_NOFS
  * PF_MEMALLOC_PIN  implies !GFP_MOVABLE
+ * PF_MEMALLOC      implies !__GFP_DIRECT_RECLAIM
  */
 static inline gfp_t current_gfp_context(gfp_t flags)
 {
 	unsigned int pflags = READ_ONCE(current->flags);
 
-	if (unlikely(pflags & (PF_MEMALLOC_NOIO | PF_MEMALLOC_NOFS | PF_MEMALLOC_PIN))) {
+	if (unlikely(pflags & (PF_MEMALLOC_NOIO | PF_MEMALLOC_NOFS |
+			PF_MEMALLOC_PIN | PF_MEMALLOC))) {
 		/*
 		 * NOIO implies both NOIO and NOFS and it is a weaker context
 		 * so always make sure it makes precedence
@@ -263,6 +265,9 @@ static inline gfp_t current_gfp_context(gfp_t flags)
 
 		if (pflags & PF_MEMALLOC_PIN)
 			flags &= ~__GFP_MOVABLE;
+
+		if (pflags & PF_MEMALLOC)
+			flags &= ~__GFP_DIRECT_RECLAIM;
 	}
 	return flags;
 }
-- 
2.39.5

