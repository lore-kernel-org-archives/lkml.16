Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 173E61758B
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 15:46:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743090392; cv=none; b=ib768PAuo2DQO4WENJxOlHHtFgIwNqq5GtvcxY45I4gB1wHpogW5jmGIEztkQxIOBfJJ9G0p8Vs4u1RTmhFj4FEJDZ7zZAulgfkE8sexu77IBNbO3pfnbLtAqm0/po3EawQISGpz2hVoF9DcGt4K4KdZ/PAoT/LmNc3ZFmLdyO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743090392; c=relaxed/simple;
	bh=NkuZ4mKdbiKcyZcEMcWy/TSQWHHc4kDRwBx+d0ME7XE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=debLQX+/l0OIb7tO9AFGV4ah+Q30hXEOg6xPwRflTgE10o4Pe+FDR4o2pXQhMHR2q2LDZg/6mExza1chjB4H6enfLBUEtgV7JGhWNkPH2P9ZaG/1pwB2l62+x6krtJ7iMQyryM7RLqikKe6jeRMx8KR/dT4MfahdCwxI1OhISBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VIqPoD0B; arc=none smtp.client-ip=209.85.128.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VIqPoD0B"
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-6f768e9be1aso21595227b3.0
        for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 08:46:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743090390; x=1743695190; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PQQUW8bK5R9MlNgxtL0YKOqY3x02XHrnTXiLJ6eKG7k=;
        b=VIqPoD0BbuTYlMzP0XpEph70/sEI7WohXaQ3QBVcx+l4TM+iBstvBhz8bo9BecBJiq
         JVEMF5FrN6uIICvlotwzAYTclqhFs5ZzcKASlXZ+MTc7qaKbBROF/WLMEHuRl9LpK5Hg
         vDhajGddTWbmpIBbetrtVBbwVYeazSicgsqU2OBPkFSJshDyb628LUo5mmnLoxIKMEYV
         nU4FqFkGvHLZ3YaqaZCMLW31t5AYlN4Cju7+LyFy0175StN3qavvF9Lw3zNQ3iOLIekJ
         Zjpbf3Y8hn0GGH/ynC3SymRMTX5wwvo0q8kq6mb/fXqFaJZaQJee8qtClcEPPrBK07uB
         5rbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743090390; x=1743695190;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PQQUW8bK5R9MlNgxtL0YKOqY3x02XHrnTXiLJ6eKG7k=;
        b=kbVVnZVrczXo41zPM3/s1jDEQL6gIjOebYwePwclufHAz7gfshkmip90oXUKqaOzxt
         LtfT3x2OgAVMN/94a7ALwmgmC0esBU+ORaF+cTo9w/CGAUeJaLSflyvlHCc9K91xQWVK
         odVHhLHcvt855S4iwQkYfiT7k3R8EavtceTrUWb++vmWNQq9VfD+toB4OBYYlrvfs6sm
         K73wVVLUZsW42ICK36M90S6w/FP/BfOK5fC6VpSP0uSfH/hOnH1YYvBebrHYeIaLK1Xq
         ntGSucoyHeVPsRqXT4zaqWx/EvlFxZ33Sbia6cGGMTp2hkpvWh8/ku2zIvWHf9LRYh8J
         CuqQ==
X-Forwarded-Encrypted: i=1; AJvYcCXJv+00EmubMB4oVA6e2o/bnsw+2ld6/U0xIwde6AqtLVEsHw+0UssbcARpVkNLyjF0lk+zSunsTsbkJ+k=@vger.kernel.org
X-Gm-Message-State: AOJu0YxS+7QPzDbeA1OcVY7T2gMbKR+UXlaMnXT50N5NAugQWuAcdq0t
	hCcUA4GV7aRr83ZQ04ciReVZmBdQ5uCYGH/rDH8x1uQbJuXs5TN5
X-Gm-Gg: ASbGncuxBOtPHUhe8bj81OJsWcuoL6IlbVbMEoTfk47XLmUsP7lGYERpDJmJ4F96RKS
	iptUNm84CQhIV6MQy+JK3Z7OvdBCCMXBBxG2rINuiV88aELraqA/r+3UhaXiBEwXFa4XsdpejQP
	nR6QXjz5A/OU2ps3KZBbecKlcjyl5heCfQY11X0yKn/XY5a5R0+SR1IB726dtQp+R5QePdKiWb/
	iORlu/l5Y3vlzQnqUz0kToKDY8MUpHHTUNZCGEIRFTc39qxlO94RNoSu8hdiO8EAhSBd5eNJGcW
	4LGMc36PS5JgRCANMOi3o0PodODdV7Y3hjcR68GHKZg=
X-Google-Smtp-Source: AGHT+IHaO9xmRxopCRW889cpe0jJDTdUuJh0juHndEGnPqSIhDKlZ2fOFs4qqYCG1EKaJY1JqKQK+Q==
X-Received: by 2002:a05:690c:338a:b0:6fd:3153:2010 with SMTP id 00721157ae682-702374a9069mr10508677b3.7.1743090389603;
        Thu, 27 Mar 2025 08:46:29 -0700 (PDT)
Received: from localhost ([2a03:2880:25ff:4::])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7023a98a230sm355527b3.73.2025.03.27.08.46.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Mar 2025 08:46:29 -0700 (PDT)
From: Joshua Hahn <joshua.hahnjy@gmail.com>
To: Oscar Salvador <osalvador@suse.de>
Cc: lsf-pc@lists.linux-foundation.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	gourry@gourry.net,
	ying.huang@linux.alibaba.com,
	hyeonggon.yoo@sk.com,
	honggyu.kim@sk.com,
	kernel-team@meta.com
Subject: Re: [LSF/MM/BPF TOPIC] Weighted interleave auto-tuning
Date: Thu, 27 Mar 2025 08:46:26 -0700
Message-ID: <20250327154627.3195329-1-joshua.hahnjy@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <Z-Uye2V-6Urz2IIA@localhost.localdomain>
References: 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Thu, 27 Mar 2025 12:11:55 +0100 Oscar Salvador <osalvador@suse.de> wrote:

> On Thu, Jan 09, 2025 at 01:50:48PM -0500, Joshua Hahn wrote:
> > Hello everyone, I hope everyone has had a great start to 2025!
> 
> Hi Joshua,
> 
> as discussed in the LSFMM about how you can react to nodes becoming
> memory{aware,less}, you can register a hotplug memory notifier, as
> memory-tiering currently does.
> 
> The current use of the hotplug memory notifier by some consumers (e.g:
> memory-tiering, slub, etc) is a bit suboptimal, as they only care about
> nodes changing its memory state, yet they get notified for every
> {online,offline}_pages operation.
> 
> I came up with [1]
> 
> I did not publish it yet upstream because I wanted to discuss it a bit
> with David, but you can give it a try to see if it works for you.
> But till it is upstream, you will have to use the hotplug memory
> notifier.

Hi Oscar,

This is great, thank you for taking a look at this. I'll also do some
experimenting on my end and let you know with any results that I see from
my end, using weighted interleave.

In the meantime yes -- I think the hotplug memory notifier should do the
trick. Thank you again, have a great day!
Joshua
 
> [1] https://github.com/leberus/linux.git numa-node-notifier 
> 
> -- 
> Oscar Salvador
> SUSE Labs

Sent using hkml (https://github.com/sjp38/hackermail)

