Received: from out203-205-221-231.mail.qq.com (out203-205-221-231.mail.qq.com [203.205.221.231])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 356F719CC28
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 11:37:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.205.221.231
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745321854; cv=none; b=uhpDjw0CCnASqaU2U47pgQJgys/nE1cZIPt7YWPEz724eglOFxdk1fDzYocl/T2s1XaD4Q3v/9RY5xwdfVLCe/4LXptFOPf0QQMoHAorb+SC+TmkEyAiohlsKm7m6pYMS+BCnfP+RO2QX5kW573gytMhfCdPJ/N/xhQJA/CGgI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745321854; c=relaxed/simple;
	bh=NnxY89LYhbLARetPN5zhGa7iUim7I6iRVpsHqE0+Q5w=;
	h=Message-ID:From:To:Cc:Subject:Date:In-Reply-To:References:
	 MIME-Version; b=dEn8p5RGYweBQQWbzjqtPRt+PUZGoC9mHR54wmehiRpo59xzNK2af8+iSFwZlPpXzWRrPDbP2C3Z04c/8o9L1vPlju2lbOODOskNQS1YYAHqHZH9KBgTXkTiHuig80NyWzHpas9A6CLkedPauw1+GEbLvfV2m7FVWxZYHh/WpeM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foxmail.com; spf=pass smtp.mailfrom=foxmail.com; dkim=pass (1024-bit key) header.d=foxmail.com header.i=@foxmail.com header.b=LRw9wxWa; arc=none smtp.client-ip=203.205.221.231
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foxmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foxmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=foxmail.com header.i=@foxmail.com header.b="LRw9wxWa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
	s=s201512; t=1745321542;
	bh=4xl79K4CpovGmqVP3x6m7YPQRoyNgTpQhURrMUQlgOs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=LRw9wxWaa6FDexKoVP4e0JeQ/mys7Sy0hfnqT0Yvwe+l+eXBraZUDq3UutttyB3qx
	 PQbCE8iyhLVB9ESSQwaRcz/saPag4pFPJ9T+eVNVunVc/+wM8ZY2yOuizt6blT3VP/
	 0FT0DsVG0K/zrw8D3j+6fiiKa7zB5Voavu8lmqDM=
Received: from localhost.localdomain ([116.128.244.169])
	by newxmesmtplogicsvrszc11-0.qq.com (NewEsmtp) with SMTP
	id 814266CC; Tue, 22 Apr 2025 19:32:20 +0800
X-QQ-mid: xmsmtpt1745321540t4fv6o3a1
Message-ID: <tencent_3FA290FB5E6F27C37304AEA91143DC0F5408@qq.com>
X-QQ-XMAILINFO: OdDhBiKk1LgMsLreFc7Yg+e5ZO1/TZcbbcK7wIXcZrI8vC4xKJFncMk6OhOYBZ
	 R8DWimveepk0MHIy5TD57YHIarEvUAP1Hp99hFFgL+x0YWAhCNpQ5ctZ4yH7ErXBgAIpQV08jRwf
	 8ccDn9b7jR7vHGXjLToLjlzP15nExwZZ9ig4b55uxoek9W0x1kg8mqtgWQ0rC+olMeK9fZbUR1dt
	 KOIXSm38HDVJQ6xs8a+tKn2QOzfWUzyiLkhxZOcaDfFkwphHkhpHOmfj0DLSKehYl9qAM4gNiqyy
	 8lDD+l+13RAXHE8wCkTJ4xqDgN3faAki97WbLjky0H0J21Pc61qOA2ONTFD7y5OhtPTv4UZcDa+B
	 meGVMaArMio77/oOtBaWSPskPKaE+0xLgjcW032wKHHkVmSenV1OHy6jkdnAaBmntbj+IhglhV2J
	 ZQnBArsuz4tXdDC/8kbwn2nR3C1oFDS9zfrqc79DTW/V3P7favda/bOLIPk0mClxiPQk9wbyZQxg
	 wNInOsaWlbGdl6mGIacYmgRM9gSp8yVUCiS4LXuWv3ElxHETPVMzu84gpTFQFY5nOKZoaVnyHlH3
	 Uk8yltmNzx3OpIC3hbBHwu8o0eiifnorZm47yp6okHEH35HQxGXF9ly1yyfCNv+BKzFi+Aj6wncA
	 kWWUpD49X27YOBa7rjNIHjzs0KHSqk5TNznnYmfZJU9sKk0gdWPBHwFDCBOY22SKkfUXg5Zt9ZWg
	 C4jnm3gz2aaDv+zgFG5fbGckE6phEkp4gSOIJqB657l67wg0K7jEDtFfltt5rgTN6ZT5GLI6GquP
	 qX3s4kL7VyFkFwiY4raR/za/aiPfKPf0sXhBKt6AEQX68kq3BfbwhbMO/jEHBlc9Dea8gr6NgpfK
	 OLqLpDbZ8VNSE53l2jCI3Ot1jLfZUeHWk8Mebo63N58Q1YtU3wsNSUGiReYX8zyPW4oA1iNij94W
	 KpO2TwVZ+fMKQ/YeUriPzMWpZWAS8FEGk7/HjNhFAn1x0PUTgmj0H82ftAuFtiWq9rSWk+cbsm/f
	 0R4mrDC1vhi6rumduR09ufoU4FGWsWAUsYGa12tA==
X-QQ-XMRINFO: OD9hHCdaPRBwq3WW+NvGbIU=
From: xiaopeitux@foxmail.com
To: xiaopeitux@foxmail.com
Cc: andriy.shevchenko@linux.intel.com,
	john.g.garry@oracle.com,
	linux-kernel@vger.kernel.org,
	robh@kernel.org,
	xiaopei01@kylinos.cn,
	xuwei5@hisilicon.com
Subject: [PATCH 3/3 V2] lib: logic_pio: Add detailed comments for find_io_range() and logic_pio_trans_cpuaddr()
Date: Tue, 22 Apr 2025 19:32:19 +0800
X-OQ-MSGID: <acf45319e9599976304fc5d8172f8291d091cba9.1745320689.git.xiaopei01@kylinos.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1745320689.git.xiaopei01@kylinos.cn>
References: <cover.1745320689.git.xiaopei01@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Pei Xiao <xiaopei01@kylinos.cn>

Add comments that we were previously overlooked for find_io_range()
and logic_pio_trans_cpuaddr().

Signed-off-by: Pei Xiao <xiaopei01@kylinos.cn>
---
changes in v2: fix returns differ
---
 lib/logic_pio.c | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/lib/logic_pio.c b/lib/logic_pio.c
index db3ad65ccc48..44ba50386714 100644
--- a/lib/logic_pio.c
+++ b/lib/logic_pio.c
@@ -141,7 +141,15 @@ struct logic_pio_hwaddr *find_io_range_by_fwnode(const struct fwnode_handle *fwn
 }
 EXPORT_SYMBOL(find_io_range_by_fwnode);
 
-/* Return a registered range given an input PIO token */
+/**
+ * find_io_range - find a registered range by PIO
+ * @pio: logical PIO value
+ *
+ * Traverse the io_range_list to find the registered node for @pio.
+ * The input PIO should be unique in the whole logical PIO space.
+ *
+ * Returns a registered range, NULL otherwise.
+ */
 static struct logic_pio_hwaddr *find_io_range(unsigned long pio)
 {
 	struct logic_pio_hwaddr *range, *found_range = NULL;
@@ -209,6 +217,14 @@ unsigned long logic_pio_trans_hwaddr(const struct fwnode_handle *fwnode,
 }
 EXPORT_SYMBOL(logic_pio_trans_hwaddr);
 
+/**
+ * logic_pio_trans_cpuaddr - translate CPU address to logical PIO
+ * @addr: Host-relative CPU address
+ *
+ * translate CPU address to logical PIO
+ *
+ * Returns Logical PIO value if successful, ~0UL otherwise
+ */
 unsigned long logic_pio_trans_cpuaddr(resource_size_t addr)
 {
 	struct logic_pio_hwaddr *range;
-- 
2.25.1

