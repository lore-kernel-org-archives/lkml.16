Received: from xmbghk7.mail.qq.com (xmbghk7.mail.qq.com [43.163.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B49356F2F2
	for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 09:05:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=43.163.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744967143; cv=none; b=u/Whrhie07WyyaA/Rpj1IGXJqYOzpXQyF58w2jBs1YA0EnvR8ienSe3oAKWgrxQdjT1/Os+11EEKOFFomBxrVBp7ReCJ1e4KAKBo7UE7p3TUliFA0E0GsRQB10Zwcm+WJVf/aPRThneDglscQT6Xzv0iewNnTAeR6rDqYcZmRQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744967143; c=relaxed/simple;
	bh=CSAcT9y1dgKFQiGOKA7eAkgfquZYpZNTZ9gN8SdYmDE=;
	h=Message-ID:From:To:Cc:Subject:Date:In-Reply-To:References:
	 MIME-Version; b=q0bcoFrmCEsgzaYBa6GzcXNT12cGITThBavdg3Z4ATSQUR/9Aod8td48B/inrzJ34yVyUVWusvWFR6amqPvo1gMlgDeZObe5ytHPbLZqLF4mPQuVHLH12pt62HwGuNEpOLnFahAvpq+3R/xOJ5uPPyC2AQUcAJD5+IiwTUxo+Cg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foxmail.com; spf=pass smtp.mailfrom=foxmail.com; dkim=pass (1024-bit key) header.d=foxmail.com header.i=@foxmail.com header.b=nIVYnfRI; arc=none smtp.client-ip=43.163.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foxmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foxmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=foxmail.com header.i=@foxmail.com header.b="nIVYnfRI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
	s=s201512; t=1744967131;
	bh=dqgVYil4YYpdpzAAqV4jIEyT1ciSFtJVD4nZvtSglZI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=nIVYnfRIYYvIV9+pk1lr4LXZYthhnCQ+8UsB9ZnTHgZz+oN9QDWRB/vlHO89kuWoF
	 bO7phYWhmHRoFcxquWKMTG54+nOSNuJ+8MCe7z9SEUNBN7R/NDOe8/KtoImrp1pK8v
	 klpTdLWISgbLsw6mHELcWuSpGmMy6aGFbz7q2NEs=
Received: from localhost.localdomain ([116.128.244.169])
	by newxmesmtplogicsvrszb16-1.qq.com (NewEsmtp) with SMTP
	id D02256E1; Fri, 18 Apr 2025 16:52:02 +0800
X-QQ-mid: xmsmtpt1744966322tbv47dg2u
Message-ID: <tencent_CDDCEC54C190265E5927ED7353AE68116A08@qq.com>
X-QQ-XMAILINFO: MDbayGdXPuoejz0IJbLNlvGlQrfMwwGCzx0vH02CNjF3Sh9ixl0uYTKpzU71P0
	 pn+cpDQIyT4pwtzN93SA0JbqtlS1DjDPw/qvY7WmwzJHpe2s7mDaiSIHgsferEJtAOxGXmcwNLi1
	 wakBSnnjbIf5jyn8EfXFb4U9ATgDz0ydZprLQ+N3Wg0hHWEYLKWVp5DBnOWHre0vzEo8aBR2ptFJ
	 35Ngjk+XWbnyZkqEts3fSc0GRJS1SeF0RjtXR0K7x5D/uyU67I2+XAeJPWFHAhm2vgvQm0SEve3e
	 O8FGdMeGRCujUsgk7utEUKTcfYmgw0NKzKsFX2u0Jvf3lPTfirXxiVDGs+lgRZg8o2ywHLjQRv7J
	 ZGq6okaNDtllkCHkz8gDnlW26f9XaL82kxxhj9J4wqCyebEF8kWRypAFFFJrPA3x9bQmbpv2MSNa
	 0dBVG1EomBYM6gWRJSsFio16AghYpV+ayVxWr3X+6no0xf+mGHFfAE5i4etQBacx073U/qwOV5x7
	 eHvKzW3Mld0KbIW/jfsX22mH2koaPTbs0NBJhzoftPO8tJvlZpNxukcr2Xsh0OUSUZgkvF9AZB/+
	 1pKt8+uJzoCPXCUYgQfZcqsI5IutKcxo8oMy7v4MZxbL7QxJ57QeiMRR8EfyNB8Krb9VX7eQzG37
	 UbEaQdEsakYlmik6iR54hVKrsbDO7QhZ8sRyMDkFKuUmMYVFAWHNecTsmSHnXyAugrFWNEmqHkFc
	 +nJJUbwDIwfkLXG/us3aN+dVwdmO6gFzdCQzh/gw31fGkO+FDtOyMoA8NYt1TIXjzmrU5GjSE13x
	 NKdfftbC7DZmKb+kiA5mCE8QdmG45Q15oOINDMGL3AqmPDfVKsfggxWl8Dop6xgXS7z+o5D576Z7
	 8Pzno6f//e8BXTaYUANBVrxa1KxEgy8LHRIKzxz+otjaLxbP6DZmX3xRMzwQCkjsnANOidBmmcgA
	 if7D373XvMTtAgXYUo0xkDYLDBWenJb96mNwdmYsBHIDjj/7NChZnltv9yF2GlA11EqWuwOMpRNZ
	 5NLu/J2nKEUF8fkdO8ydUSfIVNrN8=
X-QQ-XMRINFO: M/715EihBoGSf6IYSX1iLFg=
From: xiaopeitux@foxmail.com
To: linux-kernel@vger.kernel.org,
	f.fangjian@huawei.com,
	robh@kernel.org,
	john.g.garry@oracle.com,
	andriy.shevchenko@linux.intel.com,
	xuwei5@hisilicon.com
Cc: Pei Xiao <xiaopei01@kylinos.cn>
Subject: [PATCH 2/2] logic_pio: Add detailed comments for find_io_range() and logic_pio_trans_cpuaddr()
Date: Fri, 18 Apr 2025 16:51:45 +0800
X-OQ-MSGID: <caaefbeb215a4f3cdcdcf022e23438094782d2f1.1744964101.git.xiaopei01@kylinos.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1744964101.git.xiaopei01@kylinos.cn>
References: <cover.1744964101.git.xiaopei01@kylinos.cn>
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
 lib/logic_pio.c | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/lib/logic_pio.c b/lib/logic_pio.c
index e29496a38d06..3a49f424acc0 100644
--- a/lib/logic_pio.c
+++ b/lib/logic_pio.c
@@ -138,7 +138,15 @@ struct logic_pio_hwaddr *find_io_range_by_fwnode(const struct fwnode_handle *fwn
 	return found_range;
 }
 
-/* Return a registered range given an input PIO token */
+/**
+ * find_io_range - find a registered range by PIO
+ * @pio: logical PIO value
+ *
+ * Return a registered range, NULL otherwise.
+ *
+ * Traverse the io_range_list to find the registered node for @pio.
+ * The input PIO should be unique in the whole logical PIO space.
+ */
 static struct logic_pio_hwaddr *find_io_range(unsigned long pio)
 {
 	struct logic_pio_hwaddr *range, *found_range = NULL;
@@ -204,6 +212,12 @@ unsigned long logic_pio_trans_hwaddr(const struct fwnode_handle *fwnode,
 	return addr - range->hw_start + range->io_start;
 }
 
+/**
+ * logic_pio_trans_cpuaddr - translate CPU address to logical PIO
+ * @addr: Host-relative CPU address
+ *
+ * Returns Logical PIO value if successful, ~0UL otherwise
+ */
 unsigned long logic_pio_trans_cpuaddr(resource_size_t addr)
 {
 	struct logic_pio_hwaddr *range;
-- 
2.25.1

