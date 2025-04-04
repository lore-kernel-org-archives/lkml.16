Received: from mail-ed1-f74.google.com (mail-ed1-f74.google.com [209.85.208.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FBCE1D8DFB
	for <linux-kernel@vger.kernel.org>; Fri,  4 Apr 2025 11:11:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743765093; cv=none; b=tYk73R2kwoN2WL7VB1owegFZ02J+zpwrsO3MZ5yLMqJoFlqlfHNAPqeddm4dVYvRwefH/qBiWsf3zMHlXTIXNrJRzULMenw0gSufaw7Bmb4cSYZ/Q8+3ZJ2/lb3gEmTgHPLmsqBhJZAfzhuUFAIA3PihaCvBU/i6AO5Kcu4dvFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743765093; c=relaxed/simple;
	bh=5CJiGcja7AktqPuYGnTo/h9X3MBvV+BYT1jWN4KIlws=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Rbf8/bldeE5NvfXfi1YIcB00ouAj6KhmqUYwBbFxfRdrigu8YH7cd+3ocPnRonArtj3Ovz9RFjzpl4j1lnOVmBidbQ/MCU7BTfOET5UUqmb4CJYm/10OU+bvfyL4EBPHPEuqBB23DMR6B5p6pSbLylypN1WleENyxGwTSmtB4Rs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--mclapinski.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ibm5OrKU; arc=none smtp.client-ip=209.85.208.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--mclapinski.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ibm5OrKU"
Received: by mail-ed1-f74.google.com with SMTP id 4fb4d7f45d1cf-5e6b2b8339fso1883247a12.3
        for <linux-kernel@vger.kernel.org>; Fri, 04 Apr 2025 04:11:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743765089; x=1744369889; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=0TuGPcYbkpHDWRddmkuJsnZqAYnjFVPblguEP3A9V20=;
        b=ibm5OrKUL+gm34yDGQlxhXjgQvSr9U+bFrG44RIRW87JJHEgZGl/PpnRFme0aqZhqA
         oxi0x2l5ja0xLwXMFkajFs1rgqA9enYrVP1KI0hrUq70NkKP1FgtFGn8/FJc47NJftBf
         +xgZ53QIsatVPobaRbP/J6kph21AytbtkP93YGU9/7+w20LmEnJ8bQJFJ4my0Kr+wChM
         6AQez+23lhMJeeUHV/1J1Clm2t7PHRaaw4ps+8MKipuj+qd8VHXBk50WFfAqj+ZVCpdZ
         eDVXmrCq6DrZczWVqMQDrqkHXVBzT/dmZjYP9llZ1v4qEFs34wEp1PxD0RhF8Pmt0b4v
         JnxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743765089; x=1744369889;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0TuGPcYbkpHDWRddmkuJsnZqAYnjFVPblguEP3A9V20=;
        b=cxhRBX626xpXbk1jYc+xmI28bi6mfex6nKGl+mzuTOqwcZeGDJMhci7nvIaXunwsfA
         3+L75UBty2PxRgdwS4RLJEVAXdzYry8NdJYSaaW/AS0NIS2Rh5xWPo3SvTbF1/5brtSN
         kd9yRQqI62HyWCYxaIgCUYk/4O31lwfELCKojoHJc4jt6lvRUp7Ji6elIqtvKjHO/Npj
         YninZvh0CmuaJfj8O2027z8Xp1PGPpy+2M5kiW3pb9n/tl3cgLCUDFDS3rVXuP76DZ0w
         o0OZs0jiXgbI6sTE6IMNf4DJ6jAFIA5pEEZ9cWOAKneuWLd+fL6MDjJg+iwe2Mi/nJ06
         A0/w==
X-Forwarded-Encrypted: i=1; AJvYcCVoFegLWlZ1OJ/cnKdry4VpvqIWZqy66wJZ1ayARXNYs6PNJ/Tlo6j0vYzKR95h72ljA57IcdEqpJG7yME=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7a6IyJixXS1VX68YgMFMmxBS82yy4qi/pzWnEXPN4pmo/rDQi
	4TRMRdKJRcYPbXUxpnVzAMCIviJJa9F4CxHdm50HecmRekBm8rQAKzjTLTil0ruuTbcOtuh98B2
	i6uNirGyRIECLYq13bQ==
X-Google-Smtp-Source: AGHT+IHdrgU8lDZx+TtRTe2b+4ez31o9X0k6eoK4oFPd7Qu1V3csMbGMUR0TqPmktPO8jbNXGxNwODfQ+f18L62M
X-Received: from edbbm23.prod.google.com ([2002:a05:6402:b17:b0:5ec:d8d1:ed36])
 (user=mclapinski job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:51ce:b0:5ec:cd52:27c9 with SMTP id 4fb4d7f45d1cf-5f0b66272camr1633832a12.31.1743765089689;
 Fri, 04 Apr 2025 04:11:29 -0700 (PDT)
Date: Fri,  4 Apr 2025 13:11:02 +0200
In-Reply-To: <20250404111103.1994507-1-mclapinski@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250404111103.1994507-1-mclapinski@google.com>
X-Mailer: git-send-email 2.49.0.504.g3bcea36a83-goog
Message-ID: <20250404111103.1994507-2-mclapinski@google.com>
Subject: [PATCH v4 1/2] mm/compaction: remove low watermark cap for proactive compaction
From: Michal Clapinski <mclapinski@google.com>
To: Andrew Morton <akpm@linux-foundation.org>, Vlastimil Babka <vbabka@suse.cz>, 
	Pasha Tatashin <tatashin@google.com>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	Michal Clapinski <mclapinski@google.com>
Content-Type: text/plain; charset="UTF-8"

Previously a min cap of 5 has been set in the commit introducing
proactive compaction. This was to make sure users don't hurt themselves
by setting the proactiveness to 100 and making their system
unresponsive. But the compaction mechanism has a backoff mechanism that
will sleep for 30s if no progress is made, so I don't see a significant
risk here. My system (19GB of memory) has been perfectly fine with both
watermarks hardcoded to 0.

Signed-off-by: Michal Clapinski <mclapinski@google.com>
---
 mm/compaction.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/mm/compaction.c b/mm/compaction.c
index a3203d97123ea..4ff6b6e1db2da 100644
--- a/mm/compaction.c
+++ b/mm/compaction.c
@@ -2251,12 +2251,7 @@ static unsigned int fragmentation_score_wmark(bool low)
 {
 	unsigned int wmark_low;
 
-	/*
-	 * Cap the low watermark to avoid excessive compaction
-	 * activity in case a user sets the proactiveness tunable
-	 * close to 100 (maximum).
-	 */
-	wmark_low = max(100U - sysctl_compaction_proactiveness, 5U);
+	wmark_low = 100U - sysctl_compaction_proactiveness;
 	return low ? wmark_low : min(wmark_low + 10, 100U);
 }
 
-- 
2.49.0.504.g3bcea36a83-goog

