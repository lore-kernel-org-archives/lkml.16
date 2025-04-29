Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 967D8280A57
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 09:40:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745919627; cv=none; b=X2YamIkEOx6QhHMBEbQ4SXkf5Eu2a3zw/tx8a8Zef5SEIB63T5kBA4unQbMi9/SvtdO3rOVNp87a0LI6RPsjlJkvmDO0wcvlRMKfWzyoUpW2o2Jj9RqwItSI//y7v77jlnr6bK54XZdA/OvDxPRLUrQlUSyCvEqWfWXDEZRlbUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745919627; c=relaxed/simple;
	bh=VEClPpvelOykPpRU7PP7F/S3ulnhMGLUZV/2Au4tLs8=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=NryCN/NokKLQq2KPIMwWdtrhgToG6NVam5gCorHb7aLdKrx23sT/zx7HXr5VJN4uZ33zP74DzO9CUHxsAlcOvQajcgwIT6Siidkb8n2CYZFo/5kgP8L5gQ7OIdHOkQPiPxeoYcltUAtb5oQtKhJIprRNk9monVm0UTdgs6Kfp3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Rvo2mRiX; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Rvo2mRiX"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-22c33e5013aso68332935ad.0
        for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 02:40:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745919625; x=1746524425; darn=vger.kernel.org;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=887j+HuJAg3GAFJi8re61kxKscTlK+O7RQ0PqOMN3wo=;
        b=Rvo2mRiX50wj6MiH7GVu1/4JUDxZ5AaIKK6tXbKTL+zC98IAU9sbGWLOMKTVS7bh+V
         C2cVA+1wg+RPu9DlCnhf1GbS7LUbopgmbZ8wycFTmQlYG5+JWne8AIi2Plin1vRKPDbs
         aEbPNNTQc1/tAORHZ/MMFXujNu1/lHh+AgDDT13BT2lNHbSS3mU3fMG4ImpDeySRN6bZ
         6MFGjMeQohT8Xt/HV2mq4gBULlW6MCtISMBbFeHg83Fzj4c7D5b46fZgCYG9rRusS4ar
         tURDpRrqCFcVmEQ8hK9AdrTX2ZyF92nAIhjhZ3WKke2oMORKvNk1qAdSjWxBbauf/fmX
         2GjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745919625; x=1746524425;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=887j+HuJAg3GAFJi8re61kxKscTlK+O7RQ0PqOMN3wo=;
        b=LxM/yYxuyVa80KixL2pw8Rj5msBNQIsSckJo+qxORoKL6EWxWZxvV7CBsJx81d/5GM
         bLtHT4EbQ2C1UkS/Or1XZwSUkV2p36Ubn37b8FC1nixM+vyyo5J2LFyaUBRHoYun/1sE
         4AUkND67+y2YSSxxmXGbcoRPSvWM3aZyb+Izf7xNik/wfTgsQELLQQCQp5W/DF7u7Bda
         FSKMm3fwcLn18wNHMxB2bBMbiev2KX2hKx6W/IDAadDkNWl1i9RufPPX1EtEVtjqjmIH
         6CgOymSRRIZMewZ6Jgohn959cr7/XGmHYGJ6Z2nRVjw+aADV0pkokj4iDk/SHu5ZjSZL
         dD+g==
X-Forwarded-Encrypted: i=1; AJvYcCXVldY3Fq/S9+JZZV+mh2QgHqDS1T2gMH348hkbqdIbFY27Ws82+6Hcq8RROHXW8P9oD8DwpieGXYFXeQ8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzTSkcogTWnzIu74po0GvcpELbKAVpU5Kwww8FgyA5dphJQOrvf
	PmZdVHqm7ULy3O/wJE4okbxYDFwY97AFLBZsDsqn9olJ1TwyY1O9BfqGV1Pb5gLdZd0Rfw1+moC
	6Zw==
X-Gm-Gg: ASbGncs82amhQibrErIjtdbhT3sjmyR8aKJ2yxzYLHLwSM9BYRM72PqQixkmOei0KwO
	hbhXWoTmi23DGV8OHEE0UWsRIY2fI5XLZ+NrmpaU7GTwLaNswkoQhWpxwJnRACVIJSkCU1oT4SH
	f2bIoLNn5JLXJ8h7iCL9uMqNbqPkNcDJ/tzhCaAphb0lW4u+bul9nmqbtJES/HJitA7t9Ghtx86
	YHDmlx+yFLhH9+ZxhLpjikYq/qsVdm2fTNH9kNgcyeJeKz/HaggU6jcJNnY0hCvq2eu2dK1ppDR
	KYaNo6qIGWH6eTvtfXm6CmKCujM0WSkwz6v45DSfNbxvcel+SB8LjNvXlCo/K6LuJ78pDOdamEq
	m6k/nJSjQERq4tmn8HOZ+vbq9
X-Google-Smtp-Source: AGHT+IGJzRx+E9AYOKH3V9G8U9AElamVc69ogYXshkqnP91KceEEIHQZBBI1Oddf93pxjy3KZrE5dQ==
X-Received: by 2002:a17:903:2bce:b0:223:4c09:20b8 with SMTP id d9443c01a7336-22dc6a6c91emr166079865ad.37.1745919624658;
        Tue, 29 Apr 2025 02:40:24 -0700 (PDT)
Received: from darker.attlocal.net (172-10-233-147.lightspeed.sntcca.sbcglobal.net. [172.10.233.147])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db50e7cf2sm98181285ad.154.2025.04.29.02.40.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 02:40:23 -0700 (PDT)
Date: Tue, 29 Apr 2025 02:40:07 -0700 (PDT)
From: Hugh Dickins <hughd@google.com>
To: Andrew Morton <akpm@linux-foundation.org>, 
    Shakeel Butt <shakeel.butt@linux.dev>
cc: Johannes Weiner <hannes@cmpxchg.org>, Michal Hocko <mhocko@kernel.org>, 
    Roman Gushchin <roman.gushchin@linux.dev>, 
    Muchun Song <muchun.song@linux.dev>, Vlastimil Babka <vbabka@suse.cz>, 
    Jakub Kicinski <kuba@kernel.org>, Eric Dumazet <edumazet@google.com>, 
    Soheil Hassas Yeganeh <soheil@google.com>, linux-mm@kvack.org, 
    cgroups@vger.kernel.org, netdev@vger.kernel.org, 
    linux-kernel@vger.kernel.org, Meta kernel team <kernel-team@meta.com>
Subject: Re: [PATCH] memcg: multi-memcg percpu charge cache
In-Reply-To: <as5cdsm4lraxupg3t6onep2ixql72za25hvd4x334dsoyo4apr@zyzl4vkuevuv>
Message-ID: <d542d18f-1caa-6fea-e2c3-3555c87bcf64@google.com>
References: <20250416180229.2902751-1-shakeel.butt@linux.dev> <as5cdsm4lraxupg3t6onep2ixql72za25hvd4x334dsoyo4apr@zyzl4vkuevuv>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

[PATCH mm-unstable] memcg: multi-memcg percpu charge cache - fix 3

Fix 2 has been giving me lots of memcg OOM kills not seen before:
it's better to stock nr_pages than the uninitialized stock_pages.

Signed-off-by: Hugh Dickins <hughd@google.com>
---
 mm/memcontrol.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/mm/memcontrol.c b/mm/memcontrol.c
index 178d79e68107..02c6f553dc53 100644
--- a/mm/memcontrol.c
+++ b/mm/memcontrol.c
@@ -1952,7 +1952,7 @@ static void refill_stock(struct mem_cgroup *memcg, unsigned int nr_pages)
 		}
 		css_get(&memcg->css);
 		WRITE_ONCE(stock->cached[i], memcg);
-		WRITE_ONCE(stock->nr_pages[i], stock_pages);
+		WRITE_ONCE(stock->nr_pages[i], nr_pages);
 	}
 
 	local_unlock_irqrestore(&memcg_stock.stock_lock, flags);
