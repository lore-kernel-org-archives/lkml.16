Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77A942857E1
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 18:42:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746556938; cv=none; b=bECJhGODuwQPVgMsVgQvnFAbMMRYBvzmoq+bQa3kciMHQRo5N/067/ni/GpxqJ1du8Wa7K8nd+9Gj8Rf1cu/WT9nECDzl8B3rcihcQavndb3hVcfIplaOV+/js9N8i5ovP3FDcjHqCbAretZSCYy36ITA98+39K9FdUufDQkP84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746556938; c=relaxed/simple;
	bh=q2fFg5Skl1La9G8p7w+YPHNk8oXfk51x+pWH2YMSDW0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gY1wD++6gaJ9pcRFWBIgGOyxhIPLiinQzryATxymKxHh5m5Y4zGjWNNJD5rq77UZnF00VhoxmBu8XZfm1rlq4CabvdMXwS/W5sWLQM87ZZ5xMsxL+rhkh85KXt37jW9Hr/tZ1epvh8yym5iD0QMvbmWw0+omXrdJUkko1kA2UqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=naGxvY75; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="naGxvY75"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-22c3407a87aso90849995ad.3
        for <linux-kernel@vger.kernel.org>; Tue, 06 May 2025 11:42:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746556937; x=1747161737; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=751wCn22cSBANLUxWukV8c0OnPF3hodGxlspS2CMcZ4=;
        b=naGxvY75arb2ekFYxoH774+KUozvmCv/d7VX+01U5sgDP/DaTITWoWnKJWmzmO4kYV
         hHqNYk0dE2tt1TpMS8VolQKnHg94zRGN2nr+wA0nmiDPwgHEPuWc1errbqXhZAaykJFp
         XdLZtlKb2skybcjuv4g1yaz3XPSc1VBE5A5Lq+xly4lbnrexRE/VU5pR1/njJp7dQkI0
         8yHHzMlK0PneUUOeRtHmMb5u+uxxBVBEUVNk478gILRD8xHxja/SPZPO5x3BPb9RlVAG
         +PBrQYDXdg8c9TDLvnh1QSCjY6Upi5AkP2KNs0OBZhZ0L0wiv3MedWuDgKwpnz1GMkBh
         Iwbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746556937; x=1747161737;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=751wCn22cSBANLUxWukV8c0OnPF3hodGxlspS2CMcZ4=;
        b=c7XQJ1rcp0Eh84e9zXYanAHJr39L/cszdpLIckMwBD5IHihhFr9JG9Rz1rc0F8saAs
         bAGplzPx/u34NI1fHIVy1z2PajfRTGsLNut2z6asC46yqN+DYwFJtmykX8D7jfLY5xDu
         i9VN74TS6k/A5O+f7Do3QwZ1nwJRl0it20BM58/IWrmBvJRPkS4G111O507e1uCcp5kg
         T019hNgx3Ng1XeDgZsN+joR3HWfyfIj6cWcguCSoY5l/SyUePV7E4YViCPVY5jY7kzX+
         oeW0alFwvaBoJfwoK0b9XqC4jnaYMH8i1JicfeWRZZu4s4aE9wAsJu9iiJWfS5QVg3Uz
         GVww==
X-Forwarded-Encrypted: i=1; AJvYcCUWRs3BdbE7jHapugChjgl/8jo+XgJ2akyQLjPndyy8jmxYGXVvLaM/4N050csdCF/6VL3by6ksTfqHyzc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxIPnU30PhY+XLaE2hirRw96dFUVNpdWriCBO3clzpPBpe2DVvE
	VXbywasvVqq7S71eOwzdJ0Rk8aVU/ayn7TxdXsJuMDl2bq5XyHPJHlNSFw==
X-Gm-Gg: ASbGnctfGDyVAef4wE7W6CmEGGcctP3HrRT/glw4ILs4hf+PrqRRA8/I/EF7OOH+oXs
	KBav9jDCOSCH5BZl6gqUJuX1TRRsxFugJtHIxQYmHYYCQ8KkKFbleStXqb8szhLsY9rPFCyFpEh
	5OO3vsYJ37CSuBSSlH/1UIJoiKNxSZFsuWvV1IWYeChE4tVKqI0q8H1JmlaLXNKjqW8yS2CEynF
	9Mjv0udZ/g5XHwidVFvEVSCBWgKwRYtb92/E4PbqBdt4CE0jQiUap94kZ6O+wYwmn1nn9P9MJC4
	Xpn++q0TLuuDjjH/2LmMwRgXBJiOMlyIuTEzFsf3Xt9W8yWiLbN0rjUN7w==
X-Google-Smtp-Source: AGHT+IHlXxN4z5VhW3UOYqa5czpWSX7xGMNnE4a7k/8x32LLYjaXzEoSfdee1GTYD6PEUWVYreRbig==
X-Received: by 2002:a17:902:d54a:b0:220:e655:d77 with SMTP id d9443c01a7336-22e5ece2a0fmr4316085ad.36.1746556936691;
        Tue, 06 May 2025 11:42:16 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8f03:9fee:3afe:d39d:8565:ed44])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22e15228a1asm77527685ad.173.2025.05.06.11.42.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 11:42:16 -0700 (PDT)
From: nifan.cxl@gmail.com
To: muchun.song@linux.dev,
	willy@infradead.org,
	osalvador@suse.de
Cc: mcgrof@kernel.org,
	a.manzanares@samsung.com,
	dave@stgolabs.net,
	akpm@linux-foundation.org,
	david@redhat.com,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	nifan.cxl@gmail.com,
	Fan Ni <fan.ni@samsung.com>
Subject: [RFC 0/1] Convert is_migrate_isolate_page() to is_migrate_isolate_folio()
Date: Tue,  6 May 2025 11:38:28 -0700
Message-ID: <20250506184155.587070-1-nifan.cxl@gmail.com>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Fan Ni <fan.ni@samsung.com>

Sending out this patch per Matthew Wilcox's suggestion 
that we need to convert is_migrate_isolate_page() to use folio
https://lore.kernel.org/linux-mm/Z_XmUrbxKtYmzmJ6@casper.infradead.org/

However, when looking into the code, I have noticed that among the uers
of is_migrate_isolate_page(), in most cases the page passed in is from a 
a pageblock. 
I am not sure how we should proceed with these cases.
Should we deal with pageblock or just leave it as it is and only do the page
to folio conversion for the pages within?

So This RFC is mainly sent for collecting input about how to move forward.



Fan Ni (1):
  mm: Convert is_migrate_isolate_page() to is_migrate_isolate_folio()

 include/linux/page-isolation.h |  6 +++---
 mm/hugetlb.c                   |  2 +-
 mm/page_isolation.c            | 10 +++++-----
 3 files changed, 9 insertions(+), 9 deletions(-)

-- 
2.47.2

