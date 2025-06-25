Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B91892D5C60
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 17:49:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750873791; cv=none; b=L12DcZ7+ukZsSsjER8Ex3TLKP+da3aP22K9lCv5t6eU4vTcwZllEczATqptbgS9Wo+Lgig52diuFmXStYrfhAOxuYU//SfndHXmFpJvKErcr21l6sd6t+6FodxRjn9QPzh869ipbyNCSQvEeJUh/kuc9wcGsqGd4P4HCRi82u+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750873791; c=relaxed/simple;
	bh=uTW7gs8kvA6nVolSFxs/7DSjkSEwH+EY5b1Idlv0EC4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TLADs2hCm4yEcyrYD0NERYFDd6wnkI01TkjJl6s/MSclG70ZTCvEGezuAlZrds1Pz86LSRddtl9KydS36wZHDtA6qmyhu+y3Dglf61/tPPXwbjeSNYSbm6EIf1BnmRpnTpTc6CC8EflCVRbRtnVoHer8JmWchlKpgTdZZVblkWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jaqc9mGN; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jaqc9mGN"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-747e41d5469so267398b3a.3
        for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 10:49:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750873789; x=1751478589; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R8ReRc6UFydYH9gtSn+f80zTiGgWBcsSXK6ZsJcWtV4=;
        b=jaqc9mGN8HYERqBgRbgQrP4CqUspvLD2OqY4tM1vgph2pjHpYucn1snHPS0ms8l1Ip
         NP0bUlIuOO/BU0VcZZg3ok7LGVaovRNx4Wyp/ywOdcHf7eFMU3+qrunOHR8rKuvRQsa9
         +HilTkcTeYjCOo9NYjFcgwDjwSBbSLc+gLqr9x7WfGsGY9S+qxt98/G3goWjosxaFUzL
         YZVOgS4xKp5yUWJa0bTg1jgZU+xzNtQr6IyyxelivEbEJkNlwKbr2IaPNiliVuAOjJbe
         wCqpjfmPSSkwcyKEE9OkUhxP/D8XosGKIPTUpLbyduaJCbW13iwU0cdMr3CckaHxYlQF
         7g9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750873789; x=1751478589;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R8ReRc6UFydYH9gtSn+f80zTiGgWBcsSXK6ZsJcWtV4=;
        b=SJJjrX089mBIFZUCyelYXGeMIiUrXSEQWG+Ewo04R+NJ6O5tK4MA0oY5ngL/V5/quz
         BkXSIpSa3mqq6+31bTP9NurOfryJZ6VFl9rLBb0/LFVOXPZ3EWsuUp616L/eIi6qiN8e
         3mIMFaABe8nzmNvynSFd0RgHDOqNTlGoikjuGJnDphqnASCc6EVmPuvxuSkw84SIfN6x
         Gs7ATCbJHwsc5D42loZkBXE/G962qUQbtwTCX8bwKWOtnrkByGg3inpBo90huKdSJQxz
         fnsSR+Sy0sfQHSmi6s0j6QP+EKpHuBTsMsyfdhYtgbSHWDX8kB1gyr9tPsW3XWZkyZBl
         Wrtg==
X-Gm-Message-State: AOJu0YzY3zzOA6vuBd3qlRFUUalcpHEXzY+gOa1pkwidCGe7jZzFqDfw
	BSgDHcn7bNDyI03Bm2xjEOI1J9ZrCMxG7y+TlYEjEBQ8RWq2vRUQ1D12YyKX87iZ
X-Gm-Gg: ASbGnctKxgfennO8EUaqmGWaVrGmQPFG4s38M32x3xNL+HEoA4IZXHb7NUlthWWC2n8
	Eei7DmAachzhER3mYq+xzt5iqERKkRs8UeCAHEeVmsUx6dggYN/gkluQeNqbT+ViI9jOB1dEvQA
	i1kgEnOaS/zAOjpK5CXIDonLVSKTkXKCFMhSaQBtAOVnUCPdAGMT9UQq7zxmjcjGg0zKLUCtl7g
	pQS+ENF2NXLIpt/KSithSxsuyolfhfPZS9ZjL3E4ZRiCsWcOBBwZYHK02BXqFRlujA2GqPdLAt6
	1cJ4lkFeOAL8LINH/iTRmQtQ8MsyaAlBbT8OvmOtPUwvWw3YqNyUCQyiKD7ok8Bq9Kb0L48b52Y
	yKH328bk5U3hSf7szJiYy
X-Google-Smtp-Source: AGHT+IGS7kz5uX1FDITaZRBZY3QMqayTuas64co39YoDcp/ViK2Vwt6D23GmpoPp4sqoII7r3Sgngg==
X-Received: by 2002:a05:6a20:158d:b0:218:59b:b2f4 with SMTP id adf61e73a8af0-2207f31ce05mr6229096637.42.1750873788931;
        Wed, 25 Jun 2025 10:49:48 -0700 (PDT)
Received: from fedora.. (c-67-164-59-41.hsd1.ca.comcast.net. [67.164.59.41])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-749b5e23879sm4944869b3a.57.2025.06.25.10.49.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 10:49:48 -0700 (PDT)
From: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>
To: linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org,
	"Matthew Wilcox (Oracle)" <willy@infradead.org>,
	David Hildenbrand <david@redhat.com>,
	Jordan Rome <linux@jordanrome.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	"Vishal Moola (Oracle)" <vishal.moola@gmail.com>
Subject: [RFC PATCH 3/3] mm: Remove unmap_and_put_page()
Date: Wed, 25 Jun 2025 10:48:41 -0700
Message-ID: <20250625174841.1094510-4-vishal.moola@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250625174841.1094510-1-vishal.moola@gmail.com>
References: <20250625174841.1094510-1-vishal.moola@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There are no callers of unmap_and_put_page() left. Remove it.

Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
---
 include/linux/highmem.h | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/include/linux/highmem.h b/include/linux/highmem.h
index a30526cc53a7..6234f316468c 100644
--- a/include/linux/highmem.h
+++ b/include/linux/highmem.h
@@ -682,10 +682,4 @@ static inline void folio_release_kmap(struct folio *folio, void *addr)
 	kunmap_local(addr);
 	folio_put(folio);
 }
-
-static inline void unmap_and_put_page(struct page *page, void *addr)
-{
-	folio_release_kmap(page_folio(page), addr);
-}
-
 #endif /* _LINUX_HIGHMEM_H */
-- 
2.49.0

