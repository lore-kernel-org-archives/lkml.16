Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF8AC2356B7
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 20:42:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744836133; cv=none; b=uIYm5SDPpwSstZqeCqJB0wJamty8/qMxVIZi3Gp7Ax6zelHMZKbVKUnI8WtN7B7Cmbr0jUPxnm9nivL+K5UAmQJR3zlhuFjgNTf3hGt+IJy+lBsGfWLDusMZB1kz3pp1KPAhpK6+aRxEQFunqYGoCXhcr0qjhMBfb1hQWVqYhVI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744836133; c=relaxed/simple;
	bh=9qC6SADjVBvrGdZqgD61dD4ij9DtU63SWTFy4hBsTVs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bNowL53Ii/1DDzRuu3vBz6Gwr0PtvoYxEoINPUfsHqyTNrbr/M7843frj5BkppuVebTpsBZGHjrnE7VwVQzjciOpm7AptGwS0mvZCdiIvsJPZKogBrkWkMPGfVGQVDJGqx1kv3p6xRzQpDRoM+woQK2kFZLoFR57yRkYiDwuccE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org; spf=pass smtp.mailfrom=neverthere.org; dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b=NQYQY5Nn; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=neverthere.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b="NQYQY5Nn"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-2ff799d99dcso18341a91.1
        for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 13:42:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=neverthere.org; s=google; t=1744836131; x=1745440931; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WSCp68TzSTwAIQNUn8peisTtRZqQcqQfdhU/AvOcNRM=;
        b=NQYQY5NnxUv3NvF/QbfXpq5uTBhIpwJpeZLWVHI944XlRrZfY/4sy+nFOV3fx3g4qr
         P48C46lWLJOleUt9RjT9gfql/MfJ5IiPj1C4cboOGRbOWLclwPARpaSkmeyzzVMfLxvV
         WstT+sL2GDi5jRZc5r+sIz0X18VtNsqyMhn/bm/RJZxLFqOjOiLKwFk+/aaX4XMEe9US
         sQpoWKTEMKKoCDzp6S/vGpCvARbuYlVaelU34rHKo6um6CtBrCTHxt2nA96MyfBJpWnl
         K0+d5oTdEelY+I8GKt3RktyqhyrF2H3FidQw1XqXOfyUR/srvU8QMQH0Y4IurBmg+fAH
         njLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744836131; x=1745440931;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WSCp68TzSTwAIQNUn8peisTtRZqQcqQfdhU/AvOcNRM=;
        b=L42/0Zy3KmU51BYGLpnhMJvA1iLgHWNsGBdJSZgpFBhIwHApX6lLUnCV46Mzw2D5CP
         1F29NSB6sZlRcaewj+NTuv1GNGyv7vKMvSB868cF4Hc+630IR5GuDbb2nMNYrqD06z85
         BWg0we65vICbIeJGRRg2joXOUTMzGbACZiaJ4Rj/ioiwbi6Gy+0EyIrhqWXzvbW87bTZ
         z1W4VD+bwvD5sEn2DYO4x8iypnZR7xvXlG40XAucCtuZSdszIcGVEhQhBVu5Qh1kvS9f
         bMii8B3Wp9MpSH5EJ94i77sEeBSWQLZ/v9Dwq5KOa8m7sQiKU8SCcf5Ho2pbWpABiIg/
         mAcA==
X-Forwarded-Encrypted: i=1; AJvYcCVKGP7qbsRFhci4DRC12tpppje64XblWPXMv/3+9ZttcQq4SX0qNRiRPjCo6vPmiligVoWAOz0wczW+eFg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxniI8VWWfJzMeZ0y7hxmPAFy1Zqp7j85Sxl6KZgDgacvoR57I+
	8KjePtVWpgDZzto1yGFJqdOWMQ/8ogoPsL0bhFysMl43qzkfFprh9bq7GcMHhRSxq/SB8oXZLpM
	=
X-Gm-Gg: ASbGnctcwe6fLJ1Ev7rXyhf98nuckPqs6x+05/GGLznCcYp4b5ObUE3yy3jl+ASQm2h
	RIdT4wMQYRomNU4YhbhTOsk78t6KjeLVWGOHeBawWLdiuLrlbemN8eCalLvC9ASanVlD3G0EFef
	MYTHdDR1lWXOEw2vzOuygQklwruisIt7WU/A/cSo4ouZVf3+8JMB9Oq0MjsT0o9o/oaTxrSalaM
	e0R1DyZSevVkfsb3RU9CfXEad6viK6K4+RfnWq97EXTYvssBmt9ErpED6iPUsHp6jlGZB/l3Taw
	ylMUVkkXB0w0RwfNnfcaiXM8hFRw77rovacsdPqC2fCT4Zsnl21cs9G6DbZQAO4C+3CmZuZg3OJ
	qxdM3YA==
X-Google-Smtp-Source: AGHT+IFUJCXUb8UliTOdXtwXcqyxAlTjdp3qL3EnJlnAZaSnWvHEsplxd3fYc7soqNPAW70n8SA9Tw==
X-Received: by 2002:a17:90b:53cc:b0:2ee:45fd:34f2 with SMTP id 98e67ed59e1d1-30863d25d6bmr4360821a91.6.1744836130996;
        Wed, 16 Apr 2025 13:42:10 -0700 (PDT)
Received: from tiamat (c-69-181-214-135.hsd1.ca.comcast.net. [69.181.214.135])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-308613cb07esm2088367a91.44.2025.04.16.13.42.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 13:42:10 -0700 (PDT)
From: Michael Rubin <matchstick@neverthere.org>
To: gregkh@linuxfoundation.org,
	dpenkler@gmail.com
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Rubin <matchstick@neverthere.org>
Subject: [PATCH v2 03/18] staging: gpib: agilent_82357a: gpib_interface
Date: Wed, 16 Apr 2025 20:41:49 +0000
Message-ID: <20250416204204.8009-4-matchstick@neverthere.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250416204204.8009-1-matchstick@neverthere.org>
References: <20250416204204.8009-1-matchstick@neverthere.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Using Linux code style for struct gpib_interface.

Adhering to Linux code style.

Reported by checkpatch.pl

In general, a pointer, or a struct that has elements that can reasonably be
directly accessed should never be a typedef.

Signed-off-by: Michael Rubin <matchstick@neverthere.org>
---
 drivers/staging/gpib/agilent_82357a/agilent_82357a.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/gpib/agilent_82357a/agilent_82357a.c b/drivers/staging/gpib/agilent_82357a/agilent_82357a.c
index 7076e9f57d69..9e41fe611264 100644
--- a/drivers/staging/gpib/agilent_82357a/agilent_82357a.c
+++ b/drivers/staging/gpib/agilent_82357a/agilent_82357a.c
@@ -1434,7 +1434,7 @@ static void agilent_82357a_detach(struct gpib_board *board)
 	mutex_unlock(&agilent_82357a_hotplug_lock);
 }
 
-static gpib_interface_t agilent_82357a_gpib_interface = {
+static struct gpib_interface agilent_82357a_gpib_interface = {
 	.name = "agilent_82357a",
 	.attach = agilent_82357a_attach,
 	.detach = agilent_82357a_detach,
-- 
2.43.0

