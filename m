Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DD8D1FDE33
	for <linux-kernel@vger.kernel.org>; Sun, 27 Apr 2025 19:00:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745780423; cv=none; b=pnSHaN7uw/paE6ePr6vSVmDRdE4UH0WZU+y0V+YybbmB/D8BKjwx8j9PWJofoh6b9poAIl+G4zhNZLB7YwYtFaVoeE+X7uo5XCBcuxMypQ49r5GLdeIol1aYP1B+xJBNtaJw1MA0r0gT8jKD4qF6U/Q5HOKzHbUOog9egMqdZnE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745780423; c=relaxed/simple;
	bh=YAPaKQufsSkymYOV0BNJBbozknIm7Gc106mHlRJF3Ug=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jObr3y4n7VhVooSgOfVdnOX6YuSKdQ2WCiuqSDYprqnkfvYM3yuMAnRrXZ3hvAPiudl6vdTLyhzNYfDhn5jxpf1lrub1yEwPtRVpgPK6Ahxdn5uHxhEoio8UO8KHIDK88AKkSv4xxDY89zds36dc91LOrPEIF52gfArJrRpYLIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NLNMrh8/; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NLNMrh8/"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-73bf1cef6ceso3950670b3a.0
        for <linux-kernel@vger.kernel.org>; Sun, 27 Apr 2025 12:00:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745780421; x=1746385221; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=mCqwAYZCSc0dh66qfmmYusnvvBLoAOnre8x5oj+2T0I=;
        b=NLNMrh8/etIHeVMpFTUNOcZ2j0K5Z3FG56zzDZnANZhNXtHnGo9HJ5mEGUT0h/H7pl
         1X7r3PgLAN/OGJozZQVqJhYKwr1JDvItJX2O4/m4jFG/1+aMYeE/pSxtpBq3yKeNpD/x
         M/HxZzlRXRnbm9IhZ81KTEqSaVl/UDlzvfS52NAt3UdA3DB8emI66mhR4Druhupsi9kX
         UYJCxn5s8NzmPXecXXUbXh5NPZWHIcg5pjFFkdWrBMr3rRnXy7LXZBP1Cit479mbxpSR
         HCE5WGP1mRJqQyr7pTYrJcKmHrz3q4hRBertFL0cNEunxmztfzX8FBybtSIxMdJwpbhx
         YG2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745780421; x=1746385221;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mCqwAYZCSc0dh66qfmmYusnvvBLoAOnre8x5oj+2T0I=;
        b=H9WiQ8PYd8TRhYzgzmB/Bw82euiK7cHOZM5S7uvYuj2Hys8q+A4ZXX5kBkmOaCRSId
         MNArjvqi1DRlhYaMPFi7l3LmvE8ZfgocfwTkqEsbH7VXiP1sViyvogmxM5hZDYDORN9m
         ahOG6bc/Nc7Rb4aHaMwGDOBMrKHzdThfXkeXXPwo0caXcCZtsBXOA3vDEJTPKUyHTa6F
         MUry5W6ua87EwfUDf0O1MPSTgAjpbDD7eo18a/bRjeQebsQOH+OzUTu6eT0LYaFbpaG9
         kSbtxBBnTCDWDzdb7cHmuWtdCgmIXF7JFUF6TUqbAbOiIXczlsmLD7+GxhfMgoXfWU93
         E/3w==
X-Forwarded-Encrypted: i=1; AJvYcCXfHHbqyETmcOZOqcLZAY7hnIBDGQ4YCtd5hUh1Cc440M0lPWQ9W49J95E6svOnj/DOCxIDKq3co1KO3eM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1pkxJzXdGndiOiJGiZ3W+ulUWIqZ9g2CCjEQha14HFLgUvs6P
	ilTRLQq0UjKCxpZMlphJjGlKQACsXbs6AUDoy/lBMcjYE3p93Cja
X-Gm-Gg: ASbGncsNsKQDISkNFB7Iotllp/OE30AC5ZzVpL5JeSiox2V1IFHouBkqoMZ7AuenQRR
	7XVicJxreyYWV63KQpxjz3xOLQFZOJ1HZh6DwIUPOddGOAMT5pAGgwBHfNLH7MppcFxjD+0KCSa
	Jlp+fiDK/mu/7/ahVP/kqctP3A/Ye69337YR/uoEFhZV/533k7DNUBNpxrJkzLHnJyeU5syFLJy
	K1AjPeKij+weHlTgZRACW6LfSUTusRB9QEAd+R8oY8mtpjHxEuFUV1EILb+Y0BEKso/5Rlf4XE8
	D2RsDN4Rx22jdYEpPTedEJczmyATEfU7ycKUUnR0Gxx22B9K4oLI+f1T8A+ABQ==
X-Google-Smtp-Source: AGHT+IHnhP8OfwmNTbj23T0LsccS6Liv4VufDh0OTB4zjqyQzJVvlOs0vxIfu0mxzqpCysWHijiiWg==
X-Received: by 2002:a05:6a21:9004:b0:1f5:535c:82dc with SMTP id adf61e73a8af0-2046a74a4d9mr7876792637.42.1745780421233;
        Sun, 27 Apr 2025 12:00:21 -0700 (PDT)
Received: from KASONG-MC4.tencent.com ([115.171.40.102])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b15faded554sm5862153a12.72.2025.04.27.12.00.18
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 27 Apr 2025 12:00:20 -0700 (PDT)
From: Kairui Song <ryncsn@gmail.com>
To: linux-mm@kvack.org
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Matthew Wilcox <willy@infradead.org>,
	David Hildenbrand <david@redhat.com>,
	Hugh Dickins <hughd@google.com>,
	Chris Li <chrisl@kernel.org>,
	Yosry Ahmed <yosryahmed@google.com>,
	"Huang, Ying" <ying.huang@linux.alibaba.com>,
	Nhat Pham <nphamcs@gmail.com>,
	Johannes Weiner <hannes@cmpxchg.org>,
	linux-kernel@vger.kernel.org,
	Kairui Song <kasong@tencent.com>
Subject: [PATCH 4/6] filemap: do not use folio_contains for swap cache folios
Date: Mon, 28 Apr 2025 02:59:06 +0800
Message-ID: <20250427185908.90450-5-ryncsn@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250427185908.90450-1-ryncsn@gmail.com>
References: <20250427185908.90450-1-ryncsn@gmail.com>
Reply-To: Kairui Song <kasong@tencent.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Kairui Song <kasong@tencent.com>

Currently, none of the folio_contains callers will encounter swap
cache folios.

For fs/ callers, swap cache folios are never part of their workflow.

For filemap and truncate, folio_contains is only used for sanity checks
to verify the folio index matches the expected lookup/invalidation target.
The swap cache does not utilize filemap or truncate helpers in ways that
would trigger these checks, as it mostly implements its own cache management.

Shmem won't interact with these sanity checks either unless thing went
wrong, it would directly trigger a BUG, because swap cache index are
unrelated to shmem index, and would almost certainly mismatch (unless
on collide).

While some filemap helpers works for swap cache space, the swap cache
is different from the page cache in many ways. So this helper will
unlikely to work in a helpful way for swap cache folios.

So make it explicit here that folio_contains should not be used for
swap cache folios. This helps to avoid misuse and remove the folio_index
usage here.

Signed-off-by: Kairui Song <kasong@tencent.com>
---
 include/linux/pagemap.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/include/linux/pagemap.h b/include/linux/pagemap.h
index af25fb640463..a0bed4568c66 100644
--- a/include/linux/pagemap.h
+++ b/include/linux/pagemap.h
@@ -935,14 +935,14 @@ static inline struct page *folio_file_page(struct folio *folio, pgoff_t index)
  * @folio: The folio.
  * @index: The page index within the file.
  *
- * Context: The caller should have the page locked in order to prevent
- * (eg) shmem from moving the page between the page cache and swap cache
- * and changing its index in the middle of the operation.
+ * Context: The caller should ensure folio->index is stable and it's
+ * not added to the swap cache.
  * Return: true or false.
  */
 static inline bool folio_contains(struct folio *folio, pgoff_t index)
 {
-	return index - folio_index(folio) < folio_nr_pages(folio);
+	VM_BUG_ON_FOLIO(folio_test_swapcache(folio), folio);
+	return index - folio->index < folio_nr_pages(folio);
 }
 
 unsigned filemap_get_folios(struct address_space *mapping, pgoff_t *start,
-- 
2.49.0

