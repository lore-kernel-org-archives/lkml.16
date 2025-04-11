Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52DCF29DB7D
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 22:11:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744409493; cv=none; b=KdDe6rw01jb6Jgg7sXFHxJSMkZVKnQtFEdcFH3e6uTOu4VtccAet6/0H/ivxRq4wr9wt9pKb85GuTboUr9dAW6uAm1qLni+shvyo3Mkihz5YZB9AF8OWFzhW88yWFwhfRmREBnv3z5gKralG1nPAGeHivjSEhC1BGL6Ml5kRp9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744409493; c=relaxed/simple;
	bh=ewxzTYz7FpHsua4MPn9Pv3cPqlKa0+soWzYQ4CxwUFo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=L2UARzdCU1huJF12ZSDSJ5bpuBOKHnNW0ylKZ48mLv443SLxD6vK7tN4QxJuFJq1L5TRvGuI7X7vzoW8sIfUt9nPljvrJEvzhH+4V4T1pHV33SlaKyg/U1zxlLd8V2Sue00sl2lLITWBl3oFxGY58W27pGmbjSLdnwdMLZYULDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=t+BtqV8g; arc=none smtp.client-ip=209.85.222.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="t+BtqV8g"
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-7c5e1b40f68so260266185a.1
        for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 15:11:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1744409490; x=1745014290; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4knjTgfLUxexllxquvgcrExMdcCrRUJpeZqsZVIgbfQ=;
        b=t+BtqV8gRJZQaaZdxNACxutghKtvSgfTfabl9T89dypDzxrvW1WSxbgX2Ss1z2Ye/e
         o0eBN8QwpmBT4nSdTooH9TGRtrEBLad/tZt/fAj/NkrbwcAbJNgQgwK+dF8qKea21c1/
         3Jr+BZk+Qj8JGtyd1DCDnH0ZavW2bS7gM3Fac7K+3Uu7aRu24v70x0IZ+U9dQTdqR1hB
         8nc15RJo9MLsLATOwSPE3jhXPJGVNuzwnKXJeL9U2RvOC+Bh9pt4RACjQbI4HRlNovRn
         6/s9CdXg9mYzhnDwZY10DWf2zveU+2HIC71sbbVcwSubBVRcnSwEfYnznbOl6Zm90SGW
         Jnuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744409490; x=1745014290;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4knjTgfLUxexllxquvgcrExMdcCrRUJpeZqsZVIgbfQ=;
        b=jkHcJPom133D6X/VDHfsi9DJc0R2jj47nXSRWneoMJSSpHFirDcMC1v6ua2MV+6a1/
         YiJxGPz/0jGqFY83OOiLzhIPUjjnrq+pXb8EAHmjEsiFGFsuBO1CcAqZEWwoRWppGcQ2
         FUT/aXes/DemvNDJzAYedUBwI1hRFcTad3T20pAYwoC7W3UnxXVfqkyAKiyIU7BRi1Q5
         aeBvQhYwq5uAeAo7xLkiQltlWyaR+8V+ybEd6rxaC70UREBE9Wfrs6skljiKL3stQHXB
         KUvPLl1F5l1J4ng5fZ2FaiSEnKBw2DQG+keNWoVIsanmVV8q1pzBypkzKb2rTDINnHYI
         O36A==
X-Forwarded-Encrypted: i=1; AJvYcCVnivXqlbpP0yhm9Kcl1ka1zSByk/LKacPvUUjT79bmlgkIiXj1TUNETC9vdG2YysUpW/RAv78tqKqbBy8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwOO/39b4H9mi3mJYkW1Jg66FtFlS4EAribb+sZDcYFYRd3+IQJ
	rBY0XB3Gl6BVlhMqc16XHxaHJbNGLnQRgaUnPRFO0eu0ZmYh8QdOHp2PLaotIi0=
X-Gm-Gg: ASbGncuaiX4Dnmn0mPLJpGYbS0B3g/P/6QE4wp3ybPe5QmhGVhhTYDfpIkFs0FXS+3q
	XezO/qAAFcKKm2FtSMkvZyKgbUtwVsjqWNjQCythCsoEtsP28ltXgvoV++i12Ns+ilDmv96xbhX
	eRQO+SZ/FTSQTxWgjHnlMEn/Rg8RXnCba5ICAY6heWIIGkVdWTTC2lSC+aHAdCK+6SPFTUcPiA1
	gmR/qeO73c5fbOcXrHAm5AEJWtKgthop4XizPl5vfQIc14dJLxnkLvZDOzOADdCa3sxCbSWq97i
	FNe7pw1Z2gIx6cfTwmKyrTltFFlI32v3/qT4Ysq4zfhR5FFcABfPWNRry3F0BOjY3LpBStlat6S
	wTVjI937IF8Zlac7uzIJd84xNHS0Z
X-Google-Smtp-Source: AGHT+IFPrHSgjpnA70GEzyNSzThI5+wEmoFgLTgJqJozp7Gixhu+QP1bFfbShzpASwZwh2CD62666w==
X-Received: by 2002:a05:620a:4405:b0:7c5:5768:40b9 with SMTP id af79cd13be357-7c7af1cabd4mr698339585a.43.1744409489819;
        Fri, 11 Apr 2025 15:11:29 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F.lan (pool-173-79-56-208.washdc.fios.verizon.net. [173.79.56.208])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c7a8943afcsm321264485a.16.2025.04.11.15.11.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Apr 2025 15:11:29 -0700 (PDT)
From: Gregory Price <gourry@gourry.net>
To: linux-mm@kvack.org
Cc: cgroups@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kernel-team@meta.com,
	akpm@linux-foundation.org,
	mingo@redhat.com,
	peterz@infradead.org,
	juri.lelli@redhat.com,
	vincent.guittot@linaro.org,
	hannes@cmpxchg.org,
	mhocko@kernel.org,
	roman.gushchin@linux.dev,
	shakeel.butt@linux.dev,
	donettom@linux.ibm.com
Subject: [RFC PATCH v4 1/6] migrate: Allow migrate_misplaced_folio_prepare() to accept a NULL VMA.
Date: Fri, 11 Apr 2025 18:11:06 -0400
Message-ID: <20250411221111.493193-2-gourry@gourry.net>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250411221111.493193-1-gourry@gourry.net>
References: <20250411221111.493193-1-gourry@gourry.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

migrate_misplaced_folio_prepare() may be called on a folio without
a VMA, and so it must be made to accept a NULL VMA.

Suggested-by: Johannes Weiner <hannes@cmpxchg.org>
Signed-off-by: Gregory Price <gourry@gourry.net>
---
 mm/migrate.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/mm/migrate.c b/mm/migrate.c
index f3ee6d8d5e2e..047131f6c839 100644
--- a/mm/migrate.c
+++ b/mm/migrate.c
@@ -2654,7 +2654,7 @@ int migrate_misplaced_folio_prepare(struct folio *folio,
 		 * See folio_maybe_mapped_shared() on possible imprecision
 		 * when we cannot easily detect if a folio is shared.
 		 */
-		if ((vma->vm_flags & VM_EXEC) && folio_maybe_mapped_shared(folio))
+		if (vma && (vma->vm_flags & VM_EXEC) && folio_maybe_mapped_shared(folio))
 			return -EACCES;
 
 		/*
-- 
2.49.0

