Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96EF123A9
	for <linux-kernel@vger.kernel.org>; Sun, 20 Apr 2025 02:26:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745115976; cv=none; b=VL+9Gd+JpkUy2sFCO+hDvU9T13nAeWczC/dQJ/nQ3GzhHKilwCmAXqA6iSOTP71FLWxODwUfJddfKC6CWDcooee6IMENbMzW5iw8CRXiBMQPVebf+WXmGYoTjkldQFRp3bU0729MD7x7VTFD+ZVqvpMT70ExuIVVLL9/uDa37XM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745115976; c=relaxed/simple;
	bh=QlvYbnjmX+W9K5stFkZ0L0iTSHEa3C6CvwYAW0xyphA=;
	h=Date:From:To:cc:Subject:Message-ID:MIME-Version:Content-Type; b=tVY1zLIJCx00x6lXGup1oTDgXFFNAj0DIHFaNrwcdaG5Jj2YzFFeUukpnBsmSUdwyk38pqU1EAtQRjdUB4haM8hfsNCLWjReZrh8cEBRkfgw80ErP4XPp4//SXG2df4EHM7yRRylT8nGGxf2pQ/j8VrDxAE1gvNVBiUdXi3acKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=oaz/z6VJ; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="oaz/z6VJ"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2263428c8baso400025ad.1
        for <linux-kernel@vger.kernel.org>; Sat, 19 Apr 2025 19:26:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745115974; x=1745720774; darn=vger.kernel.org;
        h=mime-version:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=PwmHDGV+N70/f3UyaxNCX6reyKyfr9ddRKfVtg5RWn0=;
        b=oaz/z6VJfW8GNfbAfJFuqWJ2UTrIDavrjS9USzjjVzms+GvlqjDKTB9+FL5Ew2nfH+
         38ucfc5rBzX5HepPCL3AIpnVzp96WVBQ3LhF6BwUyaAbPmTOzw5yq+muzwu6i4WpTc5g
         k7OPyedj9j9/jxYjTISBTytAwkKDtqQdOJ/Tqebx/AX3ue/2A8oN/euYfzzQ7o29OukK
         w7Qp5D/uf8Qnq5AXlHvMT0kBRvcBfdZD8pTmnp/uGyQTzd+CQvs49GGI2cs+N8dB0Aae
         vVjk93AqNRsTqL3lYyNNmUS5gqHZzwz5zuJxS6ePpPokgw7xD+rwOsh/m0Sbmuf+3pMJ
         PiQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745115974; x=1745720774;
        h=mime-version:message-id:subject:cc:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PwmHDGV+N70/f3UyaxNCX6reyKyfr9ddRKfVtg5RWn0=;
        b=Ax0Lg2nxyw4tGty5EMGJiASZbhp6DgTSjRpSQ7FEGBIumBMykFMqtaIwOAXiX1zx4F
         Jz7WHXADwEsHWvGWmXIzj7Mtzy53REIX3NrMp15oDUVAJ/izgFo3pJkoi7h7qPrR4+qv
         mkJR29jQZ/r0Yfh3SbHVMNKkT0LNBjgqyH2vxlH68IHYdKUNIlDzo/YnnJuEs3+uzs+/
         EBqwZBY1ZxGvyARSvqlBi0FCd4kHdhCVY9oSqhC0Kg1+JATuqRaZFiKp55VOJlwOKr7w
         iy4K2R+JJlqPpEvcxWUaW+hKdI/EYQs478NNYekoqPu0z7wpRBtEpznTHzKlhwjSlNjY
         9+8Q==
X-Forwarded-Encrypted: i=1; AJvYcCUqv06OSX9Dj606Hqh/8DyAK2Rip2zr0WOdFJj9s6vjgVMVI7D1/+00EWDg6P8yJEc5lL3JdZhImlzzaOg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyz3ZAaegw09B3OXU3nhu2zYUYS10C1kuteYbY0NvDjIKAPK5Fo
	fgxCTR7D5ig83SfuwMxUKOOZ5G7/NV7gCsE5wdV3tWU0RBcNTfQq/vAfS3z8nI4Syp/hmjkRt5K
	Lzw==
X-Gm-Gg: ASbGnctv0wYvcVaWbevnykBJm0z6SesAdVVBVC0L08Iv4W+NYQK6MuvIg02D39rcJuz
	O41Ose8sqDAUm2TqUVQi1ZIYmN2JXFtEmUbs8xM06x63a9M1hXn6HNHzURjbHcuZEir1xZibsi+
	8PfQbVL9qNIwpYZg/hDRE65xYdRwbpTDJhoU7TMPTNIIieZZiJtmbFBZ0TTPuKqYRn3XAcodY2F
	fDJSpC/ZfTGB+keuigMhBqIT60myfdVjJa0qHrKYIEnZj2cHRwzX3SwSwf04tw2XfQXAcQ8se04
	b30YntNMowAeRpR6c2ZejDT+f9YrdObb1ePTwscSvqtzrYEqAfyxqKCtY7E2hMCs03pAVknvKoj
	STahq+jPHEEHS4fqzEO7bpX73+107vl3wSvQ=
X-Google-Smtp-Source: AGHT+IGnLUYbDggjdUQLI5hza7vToJkfmKyNR75xrDRYJIxY+Hnlxo9WBkXTYtO4CsdL2gGRVNS7tw==
X-Received: by 2002:a17:903:8c6:b0:220:c905:689f with SMTP id d9443c01a7336-22c54680d66mr4584665ad.25.1745115973210;
        Sat, 19 Apr 2025 19:26:13 -0700 (PDT)
Received: from [2a00:79e0:2eb0:8:3e8e:d566:514d:339b] ([2a00:79e0:2eb0:8:3e8e:d566:514d:339b])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73dbf8c04afsm3964752b3a.23.2025.04.19.19.26.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Apr 2025 19:26:12 -0700 (PDT)
Date: Sat, 19 Apr 2025 19:26:11 -0700 (PDT)
From: David Rientjes <rientjes@google.com>
To: Christoph Lameter <cl@linux.com>, 
    Andrew Morton <akpm@linux-foundation.org>, 
    Vlastimil Babka <vbabka@suse.cz>
cc: Roman Gushchin <roman.gushchin@linux.dev>, 
    Harry Yoo <harry.yoo@oracle.com>, linux-mm@kvack.org, 
    linux-kernel@vger.kernel.org
Subject: [patch] mm, slab: show total unreclaimable slab footprint on oom
Message-ID: <93c5936a-fbcf-20a5-af1d-bee840e18d39@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

When there is a large amount of unreclaimable slab memory in use at the
time of oom kill, what really matters is the memory footprint that it
consumes rather than only the number of active and total objects.

Include the memory footprint in the kernel log for debugging.

This may overestimate the amount of memory since slab pages may not be
all of the same order, but it gives a useful upper bound for
understanding where all the memory is going similar to slabinfo.

At the same time, align the fields for some lengthy slab cache names such
as fsnotify_mark_connector.

Signed-off-by: David Rientjes <rientjes@google.com>
---
 mm/slab_common.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/mm/slab_common.c b/mm/slab_common.c
--- a/mm/slab_common.c
+++ b/mm/slab_common.c
@@ -1145,7 +1145,7 @@ void dump_unreclaimable_slab(void)
 	}
 
 	pr_info("Unreclaimable slab info:\n");
-	pr_info("Name                      Used          Total\n");
+	pr_info("Name                            Active_objs   Total_objs       Memory\n");
 
 	list_for_each_entry(s, &slab_caches, list) {
 		if (s->flags & SLAB_RECLAIM_ACCOUNT)
@@ -1154,9 +1154,10 @@ void dump_unreclaimable_slab(void)
 		get_slabinfo(s, &sinfo);
 
 		if (sinfo.num_objs > 0)
-			pr_info("%-17s %10luKB %10luKB\n", s->name,
-				(sinfo.active_objs * s->size) / 1024,
-				(sinfo.num_objs * s->size) / 1024);
+			pr_info("%-30s %10luKB %10luKB %10luKB\n", s->name,
+				(sinfo.active_objs * s->size) >> 10,
+				(sinfo.num_objs * s->size) >> 10,
+				sinfo.num_slabs << (sinfo.cache_order + PAGE_SHIFT - 10));
 	}
 	mutex_unlock(&slab_mutex);
 }
