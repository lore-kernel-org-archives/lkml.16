Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6740E18AE2
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 14:16:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747836992; cv=none; b=Yitel6wOtRAFuFVW908KgvyNDx5TIeiujLQ5KcB37ij24LKN+s5HB6C8i0Br/fzEO2lSRUOutPAbvQuI8OpQc562ZVJxGjAT1kyLxZSa7wxonpTXO5FKyOQAJeQ1cJ8htOcSU1ePGmVUGDQfKyaDazAmXUmn6QKO0RM/cyh/bOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747836992; c=relaxed/simple;
	bh=7dW7bMxejC9fB0BkuZU3QQiwmvn7F1Rq/zjZChCyBD4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=kTsvKudb80P6zODiqp/yLE3ukecdOuzoua8nU6tR1DxZxAmFqDvIkaD3FhNRbKue580J5SCgznVWivKO61gumnLqERydWXYtnEvhiEshhPjd6Y9T+lReC5JFN1vqJsLyiTvQNCK/Fdgxa2alUMEmd6TpcjMsSkKcWMrFOTYdm6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=LA4qj+JM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="LA4qj+JM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48201C4CEE7;
	Wed, 21 May 2025 14:16:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1747836991;
	bh=7dW7bMxejC9fB0BkuZU3QQiwmvn7F1Rq/zjZChCyBD4=;
	h=From:To:Cc:Subject:Date:From;
	b=LA4qj+JMceB7yt+9d0A1Xw+Ayyj39ImLDhIRmUJ7UUTl+bJQyeex22M3Jh/cNs3Lx
	 mc16FVWfE1/HmZIGdoPyZ8iLbFR0lttMjcIH60Qzh6Umqtlu86u9gQmZ+cpsG7KbO4
	 o0R5JLUE2WL9sM4imvT+zjtpRQu00JjXGbmlBcTc=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: linux-kernel@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Arnd Bergmann <arnd@arndb.de>,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <linux@weissschuh.net>
Subject: [PATCH] drivers: misc: sram: fix up some const issues with recent attribute changes
Date: Wed, 21 May 2025 16:16:26 +0200
Message-ID: <2025052125-squid-sandstorm-a418@gregkh>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2126; i=gregkh@linuxfoundation.org; h=from:subject:message-id; bh=7dW7bMxejC9fB0BkuZU3QQiwmvn7F1Rq/zjZChCyBD4=; b=owGbwMvMwCRo6H6F97bub03G02pJDBm6D6zkJmx5+vbhkmB3tW9XlorN2OSSH96e99kw9Pmh3 gVdSn/qO2JZGASZGGTFFFm+bOM5ur/ikKKXoe1pmDmsTCBDGLg4BWAiNcsZFlw5+P+u44XK3DmR 5W25wULelrd7ahjm5z2ZalC3W5DzL5fxC4849XclB25uBwA=
X-Developer-Key: i=gregkh@linuxfoundation.org; a=openpgp; fpr=F4B60CC5BF78C2214A313DCB3147D40DDB2DFB29
Content-Transfer-Encoding: 8bit

The binary attribute const changes recently for the sram driver were
made in a way that hid the fact that we would be casting a const pointer
to a non-const one.  So explicitly make the cast so that it is obvious
and preserve the const pointer in the sram_reserve_cmp() function.

Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Thomas Weißschuh <linux@weissschuh.net>
Fixes: c3b8c358c4f3 ("misc: sram: constify 'struct bin_attribute'")
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/misc/sram.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/misc/sram.c b/drivers/misc/sram.c
index e5069882457e..c69644be4176 100644
--- a/drivers/misc/sram.c
+++ b/drivers/misc/sram.c
@@ -28,7 +28,8 @@ static ssize_t sram_read(struct file *filp, struct kobject *kobj,
 {
 	struct sram_partition *part;
 
-	part = container_of(attr, struct sram_partition, battr);
+	/* Cast away the const as the attribute is part of a larger structure */
+	part = (struct sram_partition *)container_of(attr, struct sram_partition, battr);
 
 	mutex_lock(&part->lock);
 	memcpy_fromio(buf, part->base + pos, count);
@@ -43,7 +44,8 @@ static ssize_t sram_write(struct file *filp, struct kobject *kobj,
 {
 	struct sram_partition *part;
 
-	part = container_of(attr, struct sram_partition, battr);
+	/* Cast away the const as the attribute is part of a larger structure */
+	part = (struct sram_partition *)container_of(attr, struct sram_partition, battr);
 
 	mutex_lock(&part->lock);
 	memcpy_toio(part->base + pos, buf, count);
@@ -164,8 +166,8 @@ static void sram_free_partitions(struct sram_dev *sram)
 static int sram_reserve_cmp(void *priv, const struct list_head *a,
 					const struct list_head *b)
 {
-	struct sram_reserve *ra = list_entry(a, struct sram_reserve, list);
-	struct sram_reserve *rb = list_entry(b, struct sram_reserve, list);
+	const struct sram_reserve *ra = list_entry(a, struct sram_reserve, list);
+	const struct sram_reserve *rb = list_entry(b, struct sram_reserve, list);
 
 	return ra->start - rb->start;
 }
-- 
2.49.0

