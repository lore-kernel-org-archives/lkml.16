Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D394C1E3772
	for <linux-kernel@vger.kernel.org>; Thu, 30 Jan 2025 11:11:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738235509; cv=none; b=h4vEEIw5ZUe+w8UfZfDl1FrZbF5gtHEYycDQceHpAAmNC9oY9ayz5B3/dNwQAbJg9SkEVg8bHxnO4gIhLmVBNwk9G/3xt7772Nys0s0XNqS192a5TzzDK5G8gneMWnd4vkJxt2odEswGi14qJmYzfEmYMhOtStUJ3tJNnyWH6wg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738235509; c=relaxed/simple;
	bh=P9VdcunwmUSUgdStR+4cpgVmYLBALxuBPRS0y11jyMI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OJTWbwRWpsEdO4zp4An3HhwUB6bAqYB+8RE9HK+S7olz/EN/d/pBsfXjl/HgS7fAq3FWv3SZ/QiAYsjsVpir2azM6iPluV+vz/wLzxfdKCxzv3UKUTuRzeSKCM+VL4HphWogOZzkRCYIyJMjdLRNTscpGAJTAjkQ5vNNEeit+uA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=TSSIe89c; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="TSSIe89c"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2163dc5155fso10162345ad.0
        for <linux-kernel@vger.kernel.org>; Thu, 30 Jan 2025 03:11:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1738235507; x=1738840307; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wsNyTVEtqJeOeaUMXY3SZH4okPEwKCuL4AyQgcINZOs=;
        b=TSSIe89c4QwixqpaTSH/2pEPJlycRQ9Ock260B+HGj83kmY377MyW7BIYXrvnCun/T
         Ip5Yzbo0ImzFWl/r1CFWVD+BKOSOPNrQu1viGELE9bjxHkI/Xrw/tVYA0p+zvMd5pFFY
         1/YMM/9lTTpEIgiitoz3tiJavoaODnh4vFD9E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738235507; x=1738840307;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wsNyTVEtqJeOeaUMXY3SZH4okPEwKCuL4AyQgcINZOs=;
        b=oNvMp2Tv9SKxr0NiBpMVQnDG0pCe7+nkPaL2lF0IET0/Jb8B7eXK3JGMaem52xJeqT
         f51j6fTqbXkzlz6NVxXIcKl4gu9x8eUuRRNKKvhcgxtjOtA+rxYwjeGackC17YMQ3A3c
         LGufln5y0ogYEyDh0ObYgB0GtyBekp2X+o0yV7saYmlM4O5dmHIe7CIAEJR4N3rY8UZU
         i1DmvQv+VZy6GULf1EtBleS2jc+d3fUk5VYXQGCUQGS5GZ+y0J9GIDRsuIfTz8eya7lB
         agaNVDUqVTGITgF5Okez3te6xfemHQT+bCBsy9lrbL+C4jwK1Cn0fG2TymoaBHoCy4Y8
         1oOQ==
X-Forwarded-Encrypted: i=1; AJvYcCWUkl+raZ5NMBtG/A+B1C6r9tIbJzePy2y3nTgysVw2Wpwa1Adb2DfesVljyshBhGpqj/kFL265qJxr6mg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwBFIS4exm1lWJdRh3fg4PLS3XMNzfX7oyYcBiyV3jRfzr/isbz
	oYfhADDxr8p/EFOESWfGfEkow4F0H3V23yelwVDlt3C/4a+rqL5BGfqLHv8eVg==
X-Gm-Gg: ASbGncv64oOjD6jYjd2GguwVO5hZk9TqjebfrS2uGBGIXcgoFb3DQZj4ZOhdBifdAtW
	Aw6CRQ6fe7pmtMe+XsT7YmxEmSsSLKMBdXLBFkk0OJZViEAcbvpzCfVLEoORbO07cIt7yu0JZA6
	p3yS4Oczs+tCRHquKJWkDn4+4fAML1Ld/zOFaMCoyhtHhrdyJzUDyAhtHJ/mSXhmCLI9r+mwD57
	EyQkEH6JX+pipfuClABsl8zX783Mi9p3QkUc9N1pnxG7icH+njfrH82nyMSz0Zgkj9xxLGnoTkI
	nFQ1OH0xr5ZF0RC9
X-Google-Smtp-Source: AGHT+IGkwzFoDqvhfsm5VPosd4bbEzVRTQxGnDnsn5b9Avd6d9LNbqhCO+f9O1miDGFRqxuRGkD6PA==
X-Received: by 2002:a05:6a00:2448:b0:729:a31:892d with SMTP id d2e1a72fcca58-72fd0be5470mr11033309b3a.8.1738235507138;
        Thu, 30 Jan 2025 03:11:47 -0800 (PST)
Received: from localhost ([2401:fa00:8f:203:d4ce:e744:f46b:4fb])
        by smtp.gmail.com with UTF8SMTPSA id d2e1a72fcca58-72fe653fe6fsm1164789b3a.80.2025.01.30.03.11.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jan 2025 03:11:46 -0800 (PST)
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Minchan Kim <minchan@kernel.org>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: [PATCHv3 07/11] zram: permit reclaim in recompression handle allocation
Date: Thu, 30 Jan 2025 20:10:52 +0900
Message-ID: <20250130111105.2861324-8-senozhatsky@chromium.org>
X-Mailer: git-send-email 2.48.1.262.g85cc9f2d1e-goog
In-Reply-To: <20250130111105.2861324-1-senozhatsky@chromium.org>
References: <20250130111105.2861324-1-senozhatsky@chromium.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Recompression path can now permit direct reclaim during
new zs_handle allocation, because it's not atomic anymore.

Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>
---
 drivers/block/zram/zram_drv.c | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/drivers/block/zram/zram_drv.c b/drivers/block/zram/zram_drv.c
index 28e5b02dc3a1..ac8b4f47a496 100644
--- a/drivers/block/zram/zram_drv.c
+++ b/drivers/block/zram/zram_drv.c
@@ -1981,17 +1981,11 @@ static int recompress_slot(struct zram *zram, u32 index, struct page *page,
 		return 0;
 
 	/*
-	 * No direct reclaim (slow path) for handle allocation and no
-	 * re-compression attempt (unlike in zram_write_bvec()) since
-	 * we already have stored that object in zsmalloc. If we cannot
-	 * alloc memory for recompressed object then we bail out and
-	 * simply keep the old (existing) object in zsmalloc.
+	 * If we cannot alloc memory for recompressed object then we bail out
+	 * and simply keep the old (existing) object in zsmalloc.
 	 */
 	handle_new = zs_malloc(zram->mem_pool, comp_len_new,
-			       __GFP_KSWAPD_RECLAIM |
-			       __GFP_NOWARN |
-			       __GFP_HIGHMEM |
-			       __GFP_MOVABLE);
+			       GFP_NOIO | __GFP_HIGHMEM | __GFP_MOVABLE);
 	if (IS_ERR_VALUE(handle_new)) {
 		zcomp_stream_put(zram->comps[prio], zstrm);
 		return PTR_ERR((void *)handle_new);
-- 
2.48.1.262.g85cc9f2d1e-goog

