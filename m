Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F3A2153801
	for <linux-kernel@vger.kernel.org>; Mon,  3 Feb 2025 03:12:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.122
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738552367; cv=none; b=JQmIzpLgxurI2gp77c1+byPxriAAzNdHPK0N+wG0dGvX4qMevv9dH7WvMT/mCvn56fF5d7eiJyvgu2f7aGUCu8R0ONV3YJhUIBy/LfWJxby2a/WUl/388X+NEK72FXlY1Dc02IgwdIZCQxWNerX8/q6k+GJ4sWynv25E4OOpa7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738552367; c=relaxed/simple;
	bh=D5T5KJKLkNqZuunpZaQz66egOgmq3gUBykVLiVCskVA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VsHXJkLJfLWUMFWnAEoTcNB2GVATJbGziALlOYXvpQ0k8mM3hoBUCO/V2dfvGB5cuxMlXvZPPOxqUk514oI/Bk9qbvlhoi2BNW81ljkBp/NcDo1Tvn3/Dpw2QDtXlcu25KI1y/xz0tpVEFeC0hnN89/J294TIo0KdbTzILi3rE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=YMOmdPZx; arc=none smtp.client-ip=185.125.188.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="YMOmdPZx"
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 561363F689
	for <linux-kernel@vger.kernel.org>; Mon,  3 Feb 2025 03:12:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1738552361;
	bh=CmjoqfiwFmGpVKgL8na+qeTrK73yJ3NuCGJzYY0C8p0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version;
	b=YMOmdPZx5KBFEKDyXoudCMJ2AIM8SAyyTfLHeocMwTtC3daFlUzCAkL9KUGl/ejsA
	 kmYQ1WINeCH0M03j639LahZGdrWOKGG7o79usD7B3uXmRLV0RFPnC9ALeQDXgcEUXp
	 OF9/przXHgb4Kb9Bp7s6x6fJIyrRtpb4ZFC3B/orOWYxac1KZqS4xSL66RiuZqR9/q
	 Trw5LOZU9Rhq2vPEf/TJcJj99PnlC+d2fIQCrOoV/BVIwTCp/pEwt+PAPKpHY1uIj7
	 jXjXlDeBdBPy9LysVcoHSDU3COtmN9ufXRi/hKEu2tcpC+o8aTnU53f2udnUpj7FqV
	 te+6g5uO4jD5g==
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-21648ddd461so83226805ad.0
        for <linux-kernel@vger.kernel.org>; Sun, 02 Feb 2025 19:12:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738552360; x=1739157160;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CmjoqfiwFmGpVKgL8na+qeTrK73yJ3NuCGJzYY0C8p0=;
        b=v2awvCDDuVCWJj71YlE1Douyj4joe+/rNiz5MY7+cpRRnenz5Qs6JcM2+H3wz7+Wdo
         ZwhtnRkBLYYEx/0OcAGl9Ao66zPxQhINIqAef+MKHQ6/cFYL7Adeq6IKIF9FXix3oAcy
         k6CyVo9IqC8FadANseqyAAobPUiM9CtW8/SUTmw+H2evzNCDkLBJnTuo9HGxuDptrFd/
         ABVmh6TmrSKyAInyi03HReXl9M5P1deQYoha6ylavmyZSD6XvW4+oiwFSlVfgtTjB9ZG
         2Eb6AhcckliKocjxTY9q71u4M7hkUyDpr9+rxUyLAue8u/ayI+kgFFVJ5Kui3Yit4uUu
         Q0UQ==
X-Forwarded-Encrypted: i=1; AJvYcCUf5FMOPUHA1M16kEcn2LY20MhTpGmOsRdNH0ro5IT2nr9Ho5EPkHyYv1t2XwTprHedz0QIYhr7ShGP8M4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyf0RyVCTjD/srK3M8h1Oxc8J4WkRLRq9SHfmDES5mcIlUAZpPz
	6zdx+TBddcr15XxdzhcePi6A5C3xUTO9bhtoJstr1rYo90FMddWTNjbRB8rUpxS4RfEUBUVhsoN
	muFp0YFasYS1+qL81duXqbevWqXPqB+afECduv1/yiRHy0q6jgj7CD1Qmn4PlqgFH6gsYqlWzTv
	6uQA==
X-Gm-Gg: ASbGncsUMPJe7u+wQyovOv3tzLx7qLmJ0EFbMrT9Re1FdnmcitOZZtEdrQJOZ58Vcec
	Pr4LuG6FVsnec7Py6bBWUPRxTYI5p5DgbWJBkb3fJgCNc95z0+XDtO2mw+8y0jCUigZbQvPyxRy
	zKD+dGanLIInmGjBLStc7VE/JWNb+wW/uN86oBtlbWf9MDZRloKlVZ29U2P7PxbPvv3oWhJWIhy
	BFwG1PASjhOVKTu5uYPb1RYYxo9I0TdBkdCktZoYoUHz1nhYylhAhyv2gw3rMPPWzc9u1m8RwRQ
	paIO
X-Received: by 2002:a17:903:32c4:b0:216:1543:195e with SMTP id d9443c01a7336-21dd7c46c41mr327607065ad.5.1738552360007;
        Sun, 02 Feb 2025 19:12:40 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHp+COZgI0atxnqhzoQqDdxpFJFFAFhiXjT571bA8VSq+NYsAvBWHh/9zdb8p4Q4G2jzbXzBA==
X-Received: by 2002:a17:903:32c4:b0:216:1543:195e with SMTP id d9443c01a7336-21dd7c46c41mr327606845ad.5.1738552359688;
        Sun, 02 Feb 2025 19:12:39 -0800 (PST)
Received: from z790sl.. ([240f:74:7be:1:33e1:5e62:5b35:92b])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21de3300253sm65809075ad.162.2025.02.02.19.12.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Feb 2025 19:12:39 -0800 (PST)
From: Koichiro Den <koichiro.den@canonical.com>
To: linux-gpio@vger.kernel.org
Cc: brgl@bgdev.pl,
	geert+renesas@glider.be,
	linus.walleij@linaro.org,
	maciej.borzecki@canonical.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 04/10] gpio: aggregator: add read-write 'name' attribute
Date: Mon,  3 Feb 2025 12:12:07 +0900
Message-ID: <20250203031213.399914-5-koichiro.den@canonical.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250203031213.399914-1-koichiro.den@canonical.com>
References: <20250203031213.399914-1-koichiro.den@canonical.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Previously, there is no way to assign names to GPIO lines exported
through an aggregator.

Allow users to set custom line names via a 'name' attribute.

Signed-off-by: Koichiro Den <koichiro.den@canonical.com>
---
 drivers/gpio/gpio-aggregator.c | 42 ++++++++++++++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/drivers/gpio/gpio-aggregator.c b/drivers/gpio/gpio-aggregator.c
index 76d3a8677308..3263d99bfe69 100644
--- a/drivers/gpio/gpio-aggregator.c
+++ b/drivers/gpio/gpio-aggregator.c
@@ -63,6 +63,8 @@ struct gpio_aggregator_line {
 	/* Line index within the aggregator device */
 	int idx;
 
+	/* Custom name for the virtual line */
+	char *name;
 	/* GPIO chip label or line name */
 	char *key;
 	/* Can be negative to indicate lookup by line name */
@@ -678,6 +680,44 @@ gpio_aggr_line_key_store(struct config_item *item, const char *page,
 
 CONFIGFS_ATTR(gpio_aggr_line_, key);
 
+static ssize_t
+gpio_aggr_line_name_show(struct config_item *item, char *page)
+{
+	struct gpio_aggregator_line *line = to_gpio_aggregator_line(item);
+	struct gpio_aggregator *aggr = line->parent;
+
+	guard(mutex)(&aggr->lock);
+
+	return sprintf(page, "%s\n", line->name ?: "");
+}
+
+static ssize_t
+gpio_aggr_line_name_store(struct config_item *item, const char *page,
+			  size_t count)
+{
+	struct gpio_aggregator_line *line = to_gpio_aggregator_line(item);
+	struct gpio_aggregator *aggr = line->parent;
+
+	char *name __free(kfree) = kstrndup(skip_spaces(page), count,
+					    GFP_KERNEL);
+	if (!name)
+		return -ENOMEM;
+
+	strim(name);
+
+	guard(mutex)(&aggr->lock);
+
+	if (aggr_is_active(aggr))
+		return -EBUSY;
+
+	kfree(line->name);
+	line->name = no_free_ptr(name);
+
+	return count;
+}
+
+CONFIGFS_ATTR(gpio_aggr_line_, name);
+
 static ssize_t
 gpio_aggr_line_offset_show(struct config_item *item, char *page)
 {
@@ -728,6 +768,7 @@ CONFIGFS_ATTR(gpio_aggr_line_, offset);
 
 static struct configfs_attribute *gpio_aggr_line_attrs[] = {
 	&gpio_aggr_line_attr_key,
+	&gpio_aggr_line_attr_name,
 	&gpio_aggr_line_attr_offset,
 	NULL
 };
@@ -813,6 +854,7 @@ gpio_aggr_line_release(struct config_item *item)
 
 	aggr_line_del(aggr, line);
 	kfree(line->key);
+	kfree(line->name);
 	kfree(line);
 }
 
-- 
2.45.2

