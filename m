Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81E942144A1
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 23:14:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744067663; cv=none; b=UTHornOa23GzOefM0+W7u8yD+TX/cxEsEqvSwY7oN9FmKz8C4lGumyYbWeHFJBgpTtQ97iP0RyOrprzBM10DqEPM3wPcUbcjICp/9WCOxoUfVBMBlppmTP2Idv4XLLnIQyYSFsVWFOVGI6whZ72k9R1hfzblwZKtEYb0YdYyhJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744067663; c=relaxed/simple;
	bh=FVWh5NPkxLNXUaVX+AXOHfYXjVGZbj/Zpz0e7/c3jUA=;
	h=From:To:Cc:Subject:Date:Message-Id; b=l6NwrDEDDNKqTnLmqdTOy6uARDLMR3Gaf+E320TPMJT60TcmEncgpmmKO8pGSgWaT2RntqXQa1TtjQ3cPmIN9Yi9B/LHHTN2gKWUITpiSu7eRckBzNmQdXMhauaV+mun1vSVG4xyH1fuQPX5POSRrMogmUHdVfSxPMHgfzYuH40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cUuPrtdp; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cUuPrtdp"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-ac7bd86f637so888027166b.1
        for <linux-kernel@vger.kernel.org>; Mon, 07 Apr 2025 16:14:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744067660; x=1744672460; darn=vger.kernel.org;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iwVSTTQToz1Si8xB4Dm4R1UDLYWcbQsamHW0cZfFfXw=;
        b=cUuPrtdpNu96PCLXA1QYT2gwK3lx7rjgkinh01jk/FTw0eLhoqulth0lTWQfU662Q1
         Vp7Sln/n92jpNEGlI5/UPxFer7mrDvmAnqApDFeyCpu9+nHHY3uZ0TUDtyrUOpBZ/kwh
         j7vfL5ZASnqQGIh+Gb+crXED4XBmAI/5rOyY1Nqm0t4IM6juShqua3vKSrGk6A2V1Z/i
         dADZ5CASD0/Qc0PD9W/SIvVEzsgnzj3Glmb+NuX6xjwIMwsfM5mCOls6lKrhd85rLyaG
         1INNoNn5HdJOkK2BcVfOkV7OVUkSat7VmyTIjdMLXkfG3adeByihJWZKBIN22XoaKJ1A
         WJ4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744067660; x=1744672460;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iwVSTTQToz1Si8xB4Dm4R1UDLYWcbQsamHW0cZfFfXw=;
        b=ftR6tqm/Zh7pesVO7MOBELNJaC5AqzD1diVzfWsOyryqiTlmtpEeqSAEp0XpoZiqK/
         qI6gIeb4RbzfCnJslZTdQelWkQ2waYQY98RTj/3i3IzaPvuzRo7IGxIJueOMIZs4GLde
         RqU9gV65App6ISJQCyEIChbZdxj7f97T/dkl3ThXqV0B3jxd++utCkr/LRUiCS1VqMXn
         msRJ8oZhLqadVQmTOxp0NGBHTEN6S7Yu/46BsZinJY/S/SeNiA+FXz5SrBC1+SmwgyyS
         7SxGrOZdUooTZ0Q+C1+opa9juVpiLXafz/+cQf6JzqBc0A+uzf7lnxd1OQimtE0+Cqcq
         NdBw==
X-Gm-Message-State: AOJu0Ywhds8/Vv7a4sPsTaNFmvGFyYUMlKaO6h+YY1Ff/x0Xpr4Rgmnb
	jZiyLRjl1LoIVeFqTtqqwoIvu0OcuXA8FlZ/JPHrjcI26U2B2hXf
X-Gm-Gg: ASbGncvowbMAMcy+iJXQPASS6M1meJluQ3lzjCWb+x7TFUI4ppgloTlrx8l10JQQm0u
	yepu09DeX5yuoqVpi0mCgEk7gb0XjIxQbtubLo2EYIIRJyOPEDHtRrqtAIvwXfyfFD0mcGENFrl
	NCyibCFFYE5rdQObZZ4PJUfdpXRSyH21iuxSj8zSUMJngO18eB2aKV3vB9/yzkN9NUHuYspTi7n
	caKnKyjXhUcJxV5sGcV+kZLh9739r002PlxXm416BL10KHwLj85YryJmh7Myw4uztwQqX78QmWB
	gIu0NgzyvSdsI8iVTDSP6LaGDWXD6BZarsEBKBDtrhPxzCeDbO41Skc=
X-Google-Smtp-Source: AGHT+IEu793rfnRUE6OyaAQJX6Ur7iItwmF1zYiZiKf8alvcfaUjAZHFb3sd5MfyDjl+mS4XpRHKfA==
X-Received: by 2002:a17:907:a0d:b0:abf:6a8d:76b8 with SMTP id a640c23a62f3a-ac81a5bd06amr104421266b.11.1744067659718;
        Mon, 07 Apr 2025 16:14:19 -0700 (PDT)
Received: from localhost ([185.92.221.13])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac7c01c1085sm805151966b.183.2025.04.07.16.14.19
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 07 Apr 2025 16:14:19 -0700 (PDT)
From: Wei Yang <richard.weiyang@gmail.com>
To: Liam.Howlett@oracle.com,
	akpm@linux-foundation.org,
	willy@infradead.org
Cc: linux-kernel@vger.kernel.org,
	maple-tree@lists.infradead.org,
	linux-mm@kvack.org,
	Wei Yang <richard.weiyang@gmail.com>
Subject: [RESEND Patch v2 0/3] maple_tree: Fix the replacement of a root leaf node
Date: Mon,  7 Apr 2025 23:13:51 +0000
Message-Id: <20250407231354.11771-1-richard.weiyang@gmail.com>
X-Mailer: git-send-email 2.11.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

On destroy we should set each node dead. But current
code miss this when the maple tree has only the root node.

The reason is mt_destroy_walk() leverage mte_destroy_descend() to set
node dead, but this is skipped since the only root node is a leaf.

Patch 1 fixes this.

When adding a test case, I found we always get the new value even we leave the
old root node not dead. It turns out we always re-walk the tree in mas_walk().
It looks like a typo on the status check of mas_walk().

Patch 2 fixes this.

Patch 3 add a test case to assert retrieving new value when overwriting the
whole range to a tree with only root node.

Wei Yang (3):
  maple_tree: Fix mt_destroy_walk() on root leaf node
  maple_tree: restart walk on correct status
  maple_tree: assert retrieving new value on a tree containing just a
    leaf node

 lib/maple_tree.c                 |  3 ++-
 tools/testing/radix-tree/maple.c | 24 ++++++++++++++++++++++++
 2 files changed, 26 insertions(+), 1 deletion(-)

-- 
2.34.1

