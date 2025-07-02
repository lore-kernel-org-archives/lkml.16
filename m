Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.3])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A352241686
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 09:36:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751448965; cv=none; b=eDmNxkL3CP8d6n8+xwjrUOyaSzheYfbUFKRSqQ0g2f3QXz2OYRG5pLaCPSg/5Jq7C1xf4gFfG7eMbkqtGWiBynFZU5GwggZGLDGLnKLjhgR1sYsNGu6RLbljw7rPMVpfXNntnsFqZOvD8aeMg94H13hbZvqXx7HoIDBroFFaTgg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751448965; c=relaxed/simple;
	bh=7oRIEP5UtnFc5FK7u4RflcYax4wSTjDpA97IHUqwvaU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=CiIwXtVykSbZ++Ig2XT1B2D5CmefWckH8KIymmJA2DW1AVDR1JT9LGDMLTS8cz9S1UrjKiWjLmtkVYIFvJWKtRnfGrsn+AoBFzYvgRVsbZtKqaWQEo5dAo5HtsC2g3ZV3Frw1cnZBDLcKlAnesPZQDoQkj1sVO/RY+rRsGh2wIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=C38/B7bU; arc=none smtp.client-ip=117.135.210.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="C38/B7bU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=Us
	lz7FvHhcwqapI5iKOUTZYj8lUbm1/lNoJBmLXfYp4=; b=C38/B7bU+qXZ6OlTxR
	2sIgekTofbc1U8F3a8D8pF/7uHrsFbrakUZ78sVD4NH9yZZylNL69jR1iMjQzIVc
	uvis5Pq7zxaLDNhIejyL4m+6aHwhoNaIi5TRA4+gEn65OHruXGqTHR2nl14nBYah
	RHUcsLijsQlYAqMrt4vNTfHqU=
Received: from localhost.localdomain (unknown [])
	by gzsmtp4 (Coremail) with SMTP id PygvCgAnw5Ff_WRoRqnHAw--.5230S2;
	Wed, 02 Jul 2025 17:35:29 +0800 (CST)
From: 18810879172@163.com
To: akpm@linux-foundation.org
Cc: david@redhat.com,
	zhengqi.arch@bytedance.com,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	wangxuewen <wangxuewen@kylinos.cn>
Subject: [PATCH v1] mm/vmscan: Account hwpoisoned folios in reclaim statistics
Date: Wed,  2 Jul 2025 17:34:40 +0800
Message-Id: <20250702093440.146967-1-18810879172@163.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:PygvCgAnw5Ff_WRoRqnHAw--.5230S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrKryfKryfCrW5KF4Utw47Jwb_yoWDCrg_Ca
	ykuw1YgrWUJas5JFy5CrZ3JF9aqr90kFW8CFykJF17Aa4Yy34fZr4Ikr4UA3yUXr4YyFZ8
	J3Z5ZrWSyr17CjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU8OJ57UUUUU==
X-CM-SenderInfo: rprymiyqyxmiixs6il2tof0z/1tbiYh5+9WhkzRNKJgABsI

From: wangxuewen <wangxuewen@kylinos.cn>

When encountering a hardware-poisoned folio in shrink_folio_list(),
we unmap and release the folio but fail to account it in the reclaim
statistics (sc->nr_reclaimed). This leads to an undercount of
actually reclaimed pages, potentially causing unnecessary additional
reclaim pressure.

Fix this by adding sc->nr_reclaimed += folio_nr_pages(folio) after
folio_put() in the hwpoison handling block. This matches the accounting
done in other reclaim paths.

Signed-off-by: wangxuewen <wangxuewen@kylinos.cn>
---
 mm/vmscan.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/mm/vmscan.c b/mm/vmscan.c
index f8dfd2864bbf..4c612f4b6e66 100644
--- a/mm/vmscan.c
+++ b/mm/vmscan.c
@@ -1141,6 +1141,7 @@ static unsigned int shrink_folio_list(struct list_head *folio_list,
 			unmap_poisoned_folio(folio, folio_pfn(folio), false);
 			folio_unlock(folio);
 			folio_put(folio);
+			sc->nr_reclaimed += folio_nr_pages(folio);
 			continue;
 		}
 
-- 
2.34.1

