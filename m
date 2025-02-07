Received: from out30-100.freemail.mail.aliyun.com (out30-100.freemail.mail.aliyun.com [115.124.30.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ABDE1DE3B6
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 09:44:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738921482; cv=none; b=sv0+ioSD1OBJ/FsV7ll8qBuRF7xiOH9s2q6sclrIXS8EqoBukikLec25ZAKsZ3hnXa26Jaa/cpxFdkMw5w2TJwCMwlPYKxhwK+5eGh9pU6S/1WtopxTXSrK/81jyW9E1IAbIuiBKQPgRHZJ6RpCGmPUfSI+xRARRVd2hLEtV9tY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738921482; c=relaxed/simple;
	bh=lZc4MSW/5wBHYM5x386uvX7j/sz6rzQpwfZIBMZc8nw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=V4qez9UatZ6DP6fZF7KY9CbHnbWq+tg8OdnsWL4ko8fQSMM+ujgsjqsNldTwtzUIpbVbErYCcFLLyNDDJMxfJcXpQHfZq2EltuqbPVKnl0xpn1cGhxlElFX1h0OLLC+7hmgnfT8rrjXC2rbOeEsBbIuZusfEU3oX3/Gke7YZbO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=ARt1+6yn; arc=none smtp.client-ip=115.124.30.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="ARt1+6yn"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1738921470; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=ET2M5RfKIACOkV7gUbUijh4rZv1dga746bLIAUCkeds=;
	b=ARt1+6ynaSnsUEeCfIwpXp5pEBRDESy5GBQEjbRk4Cbzjm1+amHm5e8EFfPTcRo3UwOGjiL/Spk/oArGH8I9EBSWjfyXPEC/VrQMrmYzfuVzzu/CjqjHgo8hCt1ydkpIXw/gzzBwV8ABaR5BBzKzUZsbNlBJVj730OzoxIZe9S4=
Received: from localhost(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0WOz4ok4_1738921470 cluster:ay36)
          by smtp.aliyun-inc.com;
          Fri, 07 Feb 2025 17:44:30 +0800
From: Baolin Wang <baolin.wang@linux.alibaba.com>
To: akpm@linux-foundation.org,
	hughd@google.com
Cc: david@redhat.com,
	baolin.wang@linux.alibaba.com,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/6] mm: shmem: remove duplicate error validation
Date: Fri,  7 Feb 2025 17:44:19 +0800
Message-Id: <dfadaba4c8b24c5ae1467fe8b6744b654c65ec91.1738918357.git.baolin.wang@linux.alibaba.com>
X-Mailer: git-send-email 2.39.3
In-Reply-To: <cover.1738918357.git.baolin.wang@linux.alibaba.com>
References: <cover.1738918357.git.baolin.wang@linux.alibaba.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove duplicate error code checks for 'start' and 'end', as the
get_order_from_str() will only return -EINVAL if the cmdline string
is configured incorrectly.

Signed-off-by: Baolin Wang <baolin.wang@linux.alibaba.com>
---
 mm/shmem.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/mm/shmem.c b/mm/shmem.c
index b7aef4f0a427..b764ad336598 100644
--- a/mm/shmem.c
+++ b/mm/shmem.c
@@ -5650,19 +5650,19 @@ static int __init setup_thp_shmem(char *str)
 								 THP_ORDERS_ALL_FILE_DEFAULT);
 			}
 
-			if (start == -EINVAL) {
+			if (start < 0) {
 				pr_err("invalid size %s in thp_shmem boot parameter\n",
 				       start_size);
 				goto err;
 			}
 
-			if (end == -EINVAL) {
+			if (end < 0) {
 				pr_err("invalid size %s in thp_shmem boot parameter\n",
 				       end_size);
 				goto err;
 			}
 
-			if (start < 0 || end < 0 || start > end)
+			if (start > end)
 				goto err;
 
 			nr = end - start + 1;
-- 
2.39.3

