Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com [209.85.221.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F79AA944
	for <linux-kernel@vger.kernel.org>; Mon,  5 May 2025 00:34:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746405300; cv=none; b=lC5GdIxGBVsblF/nSJ0BiOHm/Q+visN8KE/uIubCQWhTQb6qIKK8cPvvMxVlwITormY2PotMCBuAgc9F+YvJDOhdJCXar3YI9RDIs6f5KvXjP23nvbJWRFyEww91zxWD5spSPY/+rB1C9etNc/EX7+kitpYfxVAG+OzOF7XHiQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746405300; c=relaxed/simple;
	bh=0TLVV/DdHyVeodkhJ1xJBu6ZDaYznTlfQVvraT/RMrY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jMA+f5WyJuj0UqbvJBmUv6oPUoMUi9YU2mW3ACPp79cM4EAhKAO0/K28EpPhFgeFIuZSlQKdp7PvkSKavOGuu3Kdd6FCmq+zn5rS/vJ5YMN/UldAysCOulcmqO3K0wqjOf3wNm/QlRxYZA0KvQDvXQAuslEoyC6QRrTymzVMr5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BX73fE7H; arc=none smtp.client-ip=209.85.221.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BX73fE7H"
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-5242f137a1eso971042e0c.1
        for <linux-kernel@vger.kernel.org>; Sun, 04 May 2025 17:34:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746405298; x=1747010098; darn=vger.kernel.org;
        h=content-transfer-encoding:content-disposition:mime-version
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2yzvBpvQ5FClEgzzVOyg0m9n1EEzwP3MVt2zNrnkOjg=;
        b=BX73fE7Hk3cLEpmy1wT++hml6ms8a1PYWLQvtIVaER7qoUB1UlOS2qixomDgh3qtOz
         rT5RuYwlN5+h4eI66o+XSzRwNTEGWmqIvMyUTAyvKq9xqi+1GQuP+4TKiOzT3Zccgdjb
         MIQA6X3xAsu5sCtBpCxErmyobqufOrNC5tGxNlNENiE8T72rrOvw7+s7UtO4jrv2uSXJ
         6A5MJFCIblJTCQi9rdB+XPJXhxqQYj/5fiQoHnd2telh7rBpqIE0qkkHQ9ZW3SXFGyCZ
         bwHJ40LmzNxwuPRFxB39K0rx4v3Jd2VJGv2pcOCW0iVO0azgu1ivihbAwL8lY2qbPjmV
         E0gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746405298; x=1747010098;
        h=content-transfer-encoding:content-disposition:mime-version
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2yzvBpvQ5FClEgzzVOyg0m9n1EEzwP3MVt2zNrnkOjg=;
        b=o8A5rhRzDnkMhh6CPUW/exlnH8c+6KVD8y420EMB1u/84/1XIOz58URLt5bNZOBmKL
         7jDNj1ZjzcTnQHkFHsttoxRopSewiHSPrKCTVp97bD1F9WFc9UBdYWvxbcXBq5w4MngC
         prSUY5ZIfi8l+e/WoQM1OQkn5XkM+2i2O+TRutICiNaIMExezYFcl7HcyOHCJQsygYvE
         OGWCDJbJ3MtmiXI0XKM25Ma18GqopfSzTvtNXUAGbk/QnATlfx/+1c81VSBW2GlF9vGk
         IuhGF2Sy0d//DmG3C5jmfEld6sKUvycX/oPKPDa6nGW6glce2aUxqcCylykxQoI2brMK
         Jklg==
X-Forwarded-Encrypted: i=1; AJvYcCW4CWgec5b9/dn5d13afYcX9SRr/Re3cE4PnfEOQxQj9SWpEOwMAQaE8IQxtD+7x4mXAdyidOxbzdShMpE=@vger.kernel.org
X-Gm-Message-State: AOJu0YyZIApZR3a5oGw2YA4OxEIBR5pYvg25IUrGalIWh0YuyCNbV5Dg
	9uqD7ILFLGWsD3e3gnX3+UseCpXpnjr/ZhNNHClC13Wmeh26zUumquLai8NxdK0=
X-Gm-Gg: ASbGncuVl0hJQhR0i63XE7F/NGZgqB1hxwx66gDWDqXNtwakvJi46mvrjfAGKJZvt5V
	f/lwv/fW6AkOwCBa0YiOFvBcRDyDeTgqzS9EDj3oJexEuH35fKdjo0QKLq5H64BXiL7WZHR+Q4U
	JGiV1ygBvBw9+x3XtX51Qta5sLqQLcw11uOSez9ZVv2sH/fnDRIzegif7kqStIHCZM4mAkBeZL2
	5d99W7aS3zsanaMyoUdKTjU63/VO+UIScS9sVUAvR82R7x3AJVC2RDhhJp0l14o3sZuCnYYVhOl
	sBSkdAsP5Bv9Krsg2RVmp2GdUMmQSX6IyM9WuhGtiUCjrcGUfw==
X-Google-Smtp-Source: AGHT+IE29btOAXpqNMKgXzb1E7QwZ8/baNBK8qaBNoPfC42/xHVEu0e/kpCBAMumQaPLbx6dwwKd/g==
X-Received: by 2002:a05:6122:4581:b0:526:1ddd:7603 with SMTP id 71dfb90a1353d-52b0665adc2mr1792130e0c.0.1746405297806;
        Sun, 04 May 2025 17:34:57 -0700 (PDT)
Received: from fourier ([2800:e6:4001:ff2c:1cf5:fa6f:d573:a274])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-52ae403982fsm1347005e0c.25.2025.05.04.17.34.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 May 2025 17:34:57 -0700 (PDT)
Date: Sun, 4 May 2025 19:34:54 -0500
From: Juan =?iso-8859-1?Q?Jos=E9?= Arboleda <soyjuanarbol@gmail.com>
To: juri.lelli@redhat.com
Cc: dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH] sched: Do not include "autogroup.h" header
Message-ID: <aBgHrsyBsL4MdHU6@fourier>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Remove the unused inclusion of autogroup.h from fair.c.

Signed-off-by: Juan José Arboleda <soyjuanarbol@gmail.com>
---
 kernel/sched/fair.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index 0fb9bf995a47..05ebbce650b7 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -56,7 +56,6 @@
 
 #include "sched.h"
 #include "stats.h"
-#include "autogroup.h"
 
 /*
  * The initial- and re-scaling of tunables is configurable
-- 
2.49.0

