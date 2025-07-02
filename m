Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 480092F7D15;
	Wed,  2 Jul 2025 20:14:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751487264; cv=none; b=MR1Pl1jQE0UjcWwpEMP8bZaKJoMChPKAokJOjDoTTxN8PLq8lzbcblvybsCyi8+HtHVLg/c3VD42geWmr2a/uVzBT5cCgd5EPthIdp4ecGQnITiY8eX7WRl64IJQPoLlXShRw3Zk8434cex2bcvb+/SXyacLcxMPwsTd13l8XK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751487264; c=relaxed/simple;
	bh=6ckvsTJ0k3MJxqXPk4gHWmVH8SQj1M0to+OoYwY2kBE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kJzURkscPl5+7UQqQZNOhSPD6qOn2t9p8b3alCDnH10YNf4bU1e6banRqRFbCJB+z2Nr3j0Wb8aC3AqzbOig9Am5YCifGqKSsz1Kddfny5UyN28UZvwVfmemWe+nL5CFRJXlasuIZado521Ddp8bVItU5xA3qr9lwj2rmKx+t58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HUurx5cg; arc=none smtp.client-ip=209.85.128.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HUurx5cg"
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-710f39f5cb9so71377537b3.3;
        Wed, 02 Jul 2025 13:14:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751487262; x=1752092062; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YV7c5B61vQxWIW6brHrpvujjHlceZq5NHO+Y3rO8xqg=;
        b=HUurx5cgzeyIMTKraUYtV1RfvKmflvhzyKxM96nC8zKo3bQBZA2NQ0SzyxsYA7Othr
         xjo1e2iBMpDtAyVYGlzD+6fijGK2rFBh0ThU/yAnWl4DBzHy9OEeAQTNcYDv55A7fejs
         k/sLD6sx4pOd1WRi5wYNDV856Tz6SvsKWek07yJ4pkpz8VJHDP4WvbJzARbQ/qJ4ov2N
         DPsGLZcMW+uXu0nfTvhVA4r4fagGKp2AgJC8JoU4qiaxVWeh3LtwQT7YYr6WqFg+ae3L
         5d/0GQa6a4v5WG1SA0S+gHvhiKEMw1jlX6Ut3vVJRuZrvUrd0N4IrTEryPtpdnKkUj42
         bkgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751487262; x=1752092062;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YV7c5B61vQxWIW6brHrpvujjHlceZq5NHO+Y3rO8xqg=;
        b=WbEdGZn3al6Dt3STVYdfzPfBmbFZzO+SPHqGAn8AB20Wh/ptKj7FlimeBQAa+a6KdE
         gonE2SlZSAJ/HiGDyOmWLZVwiUTc/ylTsXrdDqIA1ccEqgsXIZOR+R7uj0w0X8ejv14z
         kwsmKufajEBqt6p//1Sa9ULqI+s6ZRKDWDCf8KfpxW8lFUWqAswRnwSh/CJJbVko+LxB
         4xNcCTn+v61ovHNCsSYfcpobJ9ch/sZaZg2FZ8P++IGIO6sL2wlJZZ37RIR/Sn0UdzsL
         v54svypTodV8pEYx6dlj40Xc5QEzyZmN/fwOWADF3QfnsQQWJyVMrCWxSsQXgjYwFK6v
         iJ3A==
X-Forwarded-Encrypted: i=1; AJvYcCU9gYtOHJHfUWWry4tXvn/DV0ybcQf5TDAAc4aN4JNioIUjl+9LhnlspjSIuhYzeLAvXQZuGgvw2MU=@vger.kernel.org, AJvYcCXHSNTEijtFaaNklptfIR0wfVaorEweXEBoXp4OMce4wd47u+cY64CBFB8mUEBKA+SZOOrRSecFHMxfQKEf@vger.kernel.org
X-Gm-Message-State: AOJu0YybjcqB1AU9P15TO+d6bXUMnloXDV9YTF1D0QF7ba3MLbeikZQr
	dqaGBNbBrrnxC7ojjpLSyTZmTaMFcHYGTftsytBJErR/sPMyMJXPmYQb
X-Gm-Gg: ASbGnct4tGWDAmjaV0z9M/sPekcwciBOy6Dl4UuG/6h09A5EH9zPZaO6yJEeBfNQ1d5
	ld9sJRNISogRl7A6THQRyaUDOi4SARsirQK6RiCIy+CbZc5B2H8t6ciwd+9mt0J2ZWlxjJ7D/PT
	di2afgPRPZZ8PHD6NC9Ei0KEoDNhQy0CWIBJxxObijipCSVQ4Gz121boTMN6SDCmxpTRYcCamxm
	P1yQG/MTDoJ1xfbQqMl/b0i9ZsTEy69dOATvvUAXNFArdZ38TvRhwaGi6IxHsCuDJB12qwRQv1q
	u01ikeCHwns0q5NPhPBNcbNCzLRatkOBxPG5my2l3YxPqRkD5QxQ99W6dJ9ZSuDMccnx4O3UewS
	I0LD0F1s=
X-Google-Smtp-Source: AGHT+IHp1CXE+NbRDNbbZ1RkBJrHvXGjBoQplUW4P2ktChHA+wcWgIrifVUCN244xHgPY9Y9aBH+kg==
X-Received: by 2002:a05:690c:6ac5:b0:712:36f3:f6d7 with SMTP id 00721157ae682-7165a3e0987mr5233677b3.32.1751487262117;
        Wed, 02 Jul 2025 13:14:22 -0700 (PDT)
Received: from bijan-laptop.attlocal.net ([2600:1700:680e:c000:873e:8f35:7cd8:3fe3])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-71515cb4347sm26124157b3.83.2025.07.02.13.14.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 13:14:21 -0700 (PDT)
From: Bijan Tabatabai <bijan311@gmail.com>
To: damon@lists.linux.dev,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Cc: sj@kernel.org,
	akpm@linux-foundation.org,
	corbet@lwn.net,
	joshua.hahnjy@gmail.com,
	bijantabatab@micron.com,
	venkataravis@micron.com,
	emirakhur@micron.com,
	ajayjoshi@micron.com,
	vtavarespetr@micron.com
Subject: [RFC PATCH v3 04/13] mm/damon/sysfs-schemes: set damos->migrate_dests
Date: Wed,  2 Jul 2025 15:13:27 -0500
Message-ID: <20250702201337.5780-5-bijan311@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250702201337.5780-1-bijan311@gmail.com>
References: <20250702201337.5780-1-bijan311@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: SeongJae Park <sj@kernel.org>

Pass user-specified multiple DAMOS action destinations and their weights
to DAMON core API, so that user requests can really work.

Signed-off-by: SeongJae Park <sj@kernel.org>
Signed-off-by: Bijan Tabatabai <bijantabatab@micron.com>
---
 mm/damon/sysfs-schemes.c | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/mm/damon/sysfs-schemes.c b/mm/damon/sysfs-schemes.c
index b9434cdaacdc..74056bcd6a2c 100644
--- a/mm/damon/sysfs-schemes.c
+++ b/mm/damon/sysfs-schemes.c
@@ -2576,6 +2576,29 @@ void damos_sysfs_update_effective_quotas(
 	}
 }
 
+static int damos_sysfs_add_migrate_dest(struct damos *scheme,
+		struct damos_sysfs_dests *sysfs_dests)
+{
+	struct damos_migrate_dests *dests = &scheme->migrate_dests;
+	int i;
+
+	dests->node_id_arr = kmalloc_array(sysfs_dests->nr,
+			sizeof(*dests->node_id_arr), GFP_KERNEL);
+	if (!dests->node_id_arr)
+		return -ENOMEM;
+	dests->weight_arr = kmalloc_array(sysfs_dests->nr,
+			sizeof(*dests->weight_arr), GFP_KERNEL);
+	if (!dests->weight_arr)
+		/* ->node_id_arr will be freed by scheme destruction */
+		return -ENOMEM;
+	for (i = 0; i < sysfs_dests->nr; i++) {
+		dests->node_id_arr[i] = sysfs_dests->dests_arr[i]->id;
+		dests->weight_arr[i] = sysfs_dests->dests_arr[i]->weight;
+	}
+	dests->nr_dests = sysfs_dests->nr;
+	return 0;
+}
+
 static struct damos *damon_sysfs_mk_scheme(
 		struct damon_sysfs_scheme *sysfs_scheme)
 {
@@ -2638,6 +2661,11 @@ static struct damos *damon_sysfs_mk_scheme(
 		damon_destroy_scheme(scheme);
 		return NULL;
 	}
+	err = damos_sysfs_add_migrate_dest(scheme, sysfs_scheme->dests);
+	if (err) {
+		damon_destroy_scheme(scheme);
+		return NULL;
+	}
 	return scheme;
 }
 
-- 
2.43.5

