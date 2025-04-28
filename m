Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0DF66A33F
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 20:47:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745873270; cv=none; b=gSt7S0O/Hvp9GF7RFs69+dftTDwniBwdMmT3SzlOXh85QkOHS+JicT4vVBa3bDASJbBHepbKNjqpUqCmhk+lbAx7a5te1paxjK9qMH8SWtmyF7fxX/KP5KGeWxKLH5Q7JdqpGGY69hDl2j3wI9dcGNuYBMBcAelhfY5a/3+SZaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745873270; c=relaxed/simple;
	bh=enIVs5dQifBMz4z1G7vwxdbmti9Me+ulWTX7ccL8yPo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RTBBIkBBx2Lg2gN2CIZMHQidsYhbPV1cStTVCzH2pZmyNLZeS9Xu7IRRX2omtnlWHBGYVonA5O20q7iOV0pxvIMKthS/xqP2akcBkhAj1L0i6Gpm+HtL1XdFM/QFPNoXXKBrIAmKKUkqub4g/2c/3q6/N2CYt+Wxq1962geCKL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ionos.com; spf=pass smtp.mailfrom=ionos.com; dkim=pass (2048-bit key) header.d=ionos.com header.i=@ionos.com header.b=e8M7QaYv; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ionos.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ionos.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ionos.com header.i=@ionos.com header.b="e8M7QaYv"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-43d04dc73b7so47120015e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 13:47:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ionos.com; s=google; t=1745873265; x=1746478065; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qozprAcAK6hNuz4heaeJkgS7NDgBnqM+GK7PXfa7ODA=;
        b=e8M7QaYv+S1+T4TdA/kis/it2SvCfML/6T6GjpTwfJE2I05uMJmt1yOL1AkgVxcYx6
         bvXTTgzn/bMytcDMFXM5n8wnj+s9mvx2Zgg6jdvyJk6DT3QFBJ9bfV/8N926bFL1+fkc
         o9vOZqD+ac5+wFfaBpl4e5Chh5npUZQWZO+fd6Wu/lkr7uh5rcEnK6ZtebuUBmPI9+e7
         j/4R3bJJ7Uazh4NRr2VjB6fYw1GtRx5jIzdiOZJCXPF0uCzSpmFHJRNScFRBLaLklUHi
         52BdBmkl2cz86aXryAvSybEyxfi95T/M3mTJLPhm5hGLQPiez6TCKm/DDSWJVHzb4UB7
         MEfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745873265; x=1746478065;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qozprAcAK6hNuz4heaeJkgS7NDgBnqM+GK7PXfa7ODA=;
        b=DO5E81Nex2bqBeKm5pMhXStNvtHdzf8RWTxaoz7Wlb/c6+1mlh0RJDe1UIIKATWKtg
         jJVvoVj2ywAA8iEuszWr+OWcDWYwwi99xUltLClPnSho99Ji4/Vw4LRkCOGrjWi0g4AN
         SH/z3QY69f9K34oJN+XpLFfsHfHKq1gJOSq+edX8d6bS9Djn8GjEAd33AeLxbV98j4K/
         9bv78EwhXeA3Nv52KGnVxJeHg4oD7prUylUyiOSn1MltY6j0dSzywASM5lNbhFPAMbKJ
         v4HDGNrzt/26uaVMvLd/3Tos42Bbi/diXQ/kYKb67v5j2clXZJduAKXSAobJ0qWki0HM
         C9iw==
X-Forwarded-Encrypted: i=1; AJvYcCWP5BBorc6rQgQH6O9QpSlE2PMEbjaE8PqtkbNXugUESR3UVI7FMORKBxU2F2KtQg9oteAbDlMq0HVzh6E=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5WPj8IYaT12J+Gdj3VfefTpp6h7yA9cjSDeUbP2bxDFO9I8UI
	QlvND4K61I5ztN+rSUCnexagFv4hTLeKXIK9yx7Y9bbr3CJSpY8f/ECjND+s1Uc=
X-Gm-Gg: ASbGnctala0fqfEmu2Rw1D1K15fDt6p9OGeKLy1NQhTe0SOgl5Kmk126cSr1qc20aL2
	EZc/7E87eqtHTyaJT30vx5Ze/zvYjUklMVcqYZeYti6eve3sf9gHbpoEiOrlh2cv2SwBxpPk4ir
	2M1pkYoF0oN2w75i7XaRlGVerz9IZTH2tldEkbV/rWr8YNDwqGfbCDr7XYz+BecwhJ9+CoSQyYR
	K4AV9l9BJ1jRsBOC4lHvUsB/SfSjAbu0uzULsukRoGL/M3W0kJCTTIsKNlAAfRZT6ns+wcNpQpG
	sO5OcFH6Qx2NrTumgkLuOtz5e/q8OqzpxkC7oio28dnHMYOxed9H64dPOKjsoJ2ZNwqA3r9qDOc
	ASMGl3zopUy2aHxaqSjw6ZHyG7mACUv58b0q94Kqm
X-Google-Smtp-Source: AGHT+IFLUDLxJ99cgSmn36X6Wg1jyEYbmqHCL7bpSE8/qYfb0DrwqBuz3clea8rZtc5UxvlGtdqV/w==
X-Received: by 2002:a05:600c:384a:b0:43d:160:cd9e with SMTP id 5b1f17b1804b1-441ac85cfffmr7214575e9.17.1745873265189;
        Mon, 28 Apr 2025 13:47:45 -0700 (PDT)
Received: from raven.intern.cm-ag (p200300dc6f46c100023064fffe740809.dip0.t-ipconnect.de. [2003:dc:6f46:c100:230:64ff:fe74:809])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4409d29ba29sm168590675e9.7.2025.04.28.13.47.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 13:47:44 -0700 (PDT)
From: Max Kellermann <max.kellermann@ionos.com>
To: dhowells@redhat.com,
	netfs@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Max Kellermann <max.kellermann@ionos.com>
Subject: [PATCH v2 1/2] fs/netfs: remove unused flag NETFS_RREQ_DONT_UNLOCK_FOLIOS
Date: Mon, 28 Apr 2025 22:47:38 +0200
Message-ID: <20250428204739.3405489-1-max.kellermann@ionos.com>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

NETFS_RREQ_DONT_UNLOCK_FOLIOS has never been used ever since it was
added by commit 3d3c95046742 ("netfs: Provide readahead and readpage
netfs helpers").

Signed-off-by: Max Kellermann <max.kellermann@ionos.com>
---
v1 -> v2: split into two patches, see
  https://lore.kernel.org/netfs/88831.1745855591@warthog.procyon.org.uk/
---
 fs/netfs/read_collect.c | 14 ++++++--------
 include/linux/netfs.h   |  1 -
 2 files changed, 6 insertions(+), 9 deletions(-)

diff --git a/fs/netfs/read_collect.c b/fs/netfs/read_collect.c
index 23c75755ad4e..173433d61ea6 100644
--- a/fs/netfs/read_collect.c
+++ b/fs/netfs/read_collect.c
@@ -83,14 +83,12 @@ static void netfs_unlock_read_folio(struct netfs_io_request *rreq,
 	}
 
 just_unlock:
-	if (!test_bit(NETFS_RREQ_DONT_UNLOCK_FOLIOS, &rreq->flags)) {
-		if (folio->index == rreq->no_unlock_folio &&
-		    test_bit(NETFS_RREQ_NO_UNLOCK_FOLIO, &rreq->flags)) {
-			_debug("no unlock");
-		} else {
-			trace_netfs_folio(folio, netfs_folio_trace_read_unlock);
-			folio_unlock(folio);
-		}
+	if (folio->index == rreq->no_unlock_folio &&
+	    test_bit(NETFS_RREQ_NO_UNLOCK_FOLIO, &rreq->flags)) {
+		_debug("no unlock");
+	} else {
+		trace_netfs_folio(folio, netfs_folio_trace_read_unlock);
+		folio_unlock(folio);
 	}
 
 	folioq_clear(folioq, slot);
diff --git a/include/linux/netfs.h b/include/linux/netfs.h
index c86a11cfc4a3..ab6f5e0c38c7 100644
--- a/include/linux/netfs.h
+++ b/include/linux/netfs.h
@@ -268,7 +268,6 @@ struct netfs_io_request {
 	unsigned long		flags;
 #define NETFS_RREQ_OFFLOAD_COLLECTION	0	/* Offload collection to workqueue */
 #define NETFS_RREQ_NO_UNLOCK_FOLIO	2	/* Don't unlock no_unlock_folio on completion */
-#define NETFS_RREQ_DONT_UNLOCK_FOLIOS	3	/* Don't unlock the folios on completion */
 #define NETFS_RREQ_FAILED		4	/* The request failed */
 #define NETFS_RREQ_IN_PROGRESS		5	/* Unlocked when the request completes */
 #define NETFS_RREQ_FOLIO_COPY_TO_CACHE	6	/* Copy current folio to cache from read */
-- 
2.47.2

