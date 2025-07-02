Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B58772F5C5C;
	Wed,  2 Jul 2025 20:14:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751487296; cv=none; b=NExkj0Kz1ol6R6/y8ETf57EFc37H/wa3WaaJjJlymBTOIWbQBllIyKMT727zd0zyFXpi4pSfGNy3mnjjfrypBccJJqwsTOqACNj5+UyXj4pBDsEF2skWDhjLmszP2vm8NARX8se2KenRWRu9Jf05twpdBJtOSo+ZD/aKyvz8XVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751487296; c=relaxed/simple;
	bh=0sgoYcwWoSAXxh3ePsTxskwFPgTsDHkWH4z1QYpP3pI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=L3cVH14D8HaQxpEjSuam6An9KPdOAOw9l3pfG5kph8UZVv//SITxNAKIu5R7nCKIBmyrkWMJ8K92cxNtRZkdmfGwmmhIrwItJ8+0ncn5D7gCiXq14tU0GTQ7QCa8XSxWflLNHcN81MzopJk0/1z6lQCZ/B1XlAFNTq45cmOxxPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Vb8Yj0hq; arc=none smtp.client-ip=209.85.128.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Vb8Yj0hq"
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-70e3980757bso2851837b3.1;
        Wed, 02 Jul 2025 13:14:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751487294; x=1752092094; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FkS0DrkPKM+xK6PaTOaoNpfP8nOE8wUiT1pJQUSyCG0=;
        b=Vb8Yj0hqr2vY+vwh1bpfu04KCUp4E+7XmGT7NXQR6tRkAt+Fk8siQQDr6XQYSStv0L
         0Ldv0oLeOI6seiIMDQF1K4fZMqIVm2WzPAORApdkJoOGzMCvzREuyLLEoFSez+5+LbS6
         5tzYlO/7dGOuLo27NrwJ849IJ+VozTirYlyamecjL4nVpF/x2wTaLRCj2UyIP1rDO1cx
         ONkuNRkoC0WFtVD4ayM/xDOGueA5BlZX5g1vTcNEcvB9rTSow9gzEjdJi3LF4ZdpGCek
         YSguqzH0Ovf21GUzE1CK/OYBIMpYXtKwa5SAQQ6HwUDo6+H6VvHh4nCWdIZ7DbT6k3hI
         Y0+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751487294; x=1752092094;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FkS0DrkPKM+xK6PaTOaoNpfP8nOE8wUiT1pJQUSyCG0=;
        b=cl48yyQoMAns8rfKQEmSbnVC486bn7xri4Hll8UwkZ1AmXYOl/fG9DhloZwLeOf+CD
         9VfilBHijVjtVtul6T7+KoTAj9OZwgvj4h9FuxklmtnFYyMGwSm9yA8TrtUse6afafqn
         JSgLZriteh9HLAYSTYOaJzLkU52Qk4OR3CB8xNKx3++N+3oFBcYRFaZ6Afo0q8DsTY8D
         QTlYwZUuqMj5dZjNkgjyw3udO3xTv8RjViauL6FJEVQsmy7R3aPKtTaNf62ZRFDx0Pjy
         EWObYAhvHNlMFDc6tL97p4Y2/yfz0y3xQxToRfBKK0DJOkioYUCHzOHEqqBgyRpOZqXD
         KoFg==
X-Forwarded-Encrypted: i=1; AJvYcCWlXSIIbjPNS1wgidMzAu8F5N5Ay+kIE7UNFoLftPiXE8IK9mY8X9YzNq0P2mmZP50KoYME+G7jLtg=@vger.kernel.org, AJvYcCXEmP68HlDJjq8ZYAgCceqzXSg/UAfwPA9bK6PmoYN9/p43aBCprBu6bTydEHzorYU1fwqNsaLo2r3G29xQ@vger.kernel.org
X-Gm-Message-State: AOJu0YyNgTNZ8NKD2iZQgncPO3W5b8GbGfc4OjxXMCN4f2HqK41zNf4u
	tGO50QhpSxbkf+ZeGTusFfo2Y4qPaAbFXwHW/ZKZo1CV7hsNOa3GIryC
X-Gm-Gg: ASbGncuzlC/9KXyHimfZWVp3aX6t95fiU5/EF2uLgf5i+h7RsdaKhCYeCLTXf6tAJPB
	9tZWVqfYWYrlx9nDgYzl3+xQPaLpSOey+HAyDWbyygk2p0XmMrPdUNf9sx7l6ZrcXlGyCNgBoI5
	WCJ8bqe/N9JYlRst0CM6YySXunlbsU6vHSR+3kl0jQpSgLE1k4qhKqZL+VvIkQG4pa5d5xseKEU
	8v8Ge/b2Gqvy/M7fEAYzVgtj1eBW6/mDM8DfhRxee0Hevl++YGNn+wRm5cv9cvtBVbgRlTh+hPZ
	9UEhH5OyeeufF2edTH6ehs4lifMrQ/IAday/LTMdsT2LgtVrdGFhv4NS/0GNmvJTmghjM0Wfgwi
	rXIeoaBaBGL/nS/A3gQ==
X-Google-Smtp-Source: AGHT+IGm04Vh1HkDnYwneNGvCSl8gsp/I7ZSqzh9/jiYbz/sPZZP1V/Sh0Zp3PhXvLjIcWdu4qs4jA==
X-Received: by 2002:a05:690c:3606:b0:712:d7dd:e25a with SMTP id 00721157ae682-716590f7acfmr13770907b3.6.1751487293726;
        Wed, 02 Jul 2025 13:14:53 -0700 (PDT)
Received: from bijan-laptop.attlocal.net ([2600:1700:680e:c000:873e:8f35:7cd8:3fe3])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-71515cb4347sm26124157b3.83.2025.07.02.13.14.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 13:14:53 -0700 (PDT)
From: Bijan Tabatabai <bijan311@gmail.com>
To: damon@lists.linux.dev,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Cc: sj@kernel.org,
	akpm@linux-foundation.org,
	corbet@lwn.net,
	joshua.hahnjy@gmail.com,
	bijantabatab@micron.com,
	venkataravis@micron.com,
	emirakhur@micron.com,
	ajayjoshi@micron.com,
	vtavarespetr@micron.com,
	Ravi Shankar Jonnalagadda <ravis.opensrc@micron.com>
Subject: [RFC PATCH v3 10/13] Docs/mm/damon/design: Document vaddr support for migrate_{hot,cold}
Date: Wed,  2 Jul 2025 15:13:33 -0500
Message-ID: <20250702201337.5780-11-bijan311@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250702201337.5780-1-bijan311@gmail.com>
References: <20250702201337.5780-1-bijan311@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bijan Tabatabai <bijantabatab@micron.com>

Document that the migrate_{hot,cold} schemes can be used by the vaddr
operations set.

Co-developed-by: Ravi Shankar Jonnalagadda <ravis.opensrc@micron.com>
Signed-off-by: Ravi Shankar Jonnalagadda <ravis.opensrc@micron.com>
Signed-off-by: Bijan Tabatabai <bijantabatab@micron.com>
---
 Documentation/mm/damon/design.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/mm/damon/design.rst b/Documentation/mm/damon/design.rst
index ddc50db3afa4..03f8137256f5 100644
--- a/Documentation/mm/damon/design.rst
+++ b/Documentation/mm/damon/design.rst
@@ -452,9 +452,9 @@ that supports each action are as below.
  - ``lru_deprio``: Deprioritize the region on its LRU lists.
    Supported by ``paddr`` operations set.
  - ``migrate_hot``: Migrate the regions prioritizing warmer regions.
-   Supported by ``paddr`` operations set.
+   Supported by ``vaddr``, ``fvaddr`` and ``paddr`` operations set.
  - ``migrate_cold``: Migrate the regions prioritizing colder regions.
-   Supported by ``paddr`` operations set.
+   Supported by ``vaddr``, ``fvaddr`` and ``paddr`` operations set.
  - ``stat``: Do nothing but count the statistics.
    Supported by all operations sets.
 
-- 
2.43.5

