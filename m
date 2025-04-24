Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58D982367D9
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 10:37:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745491035; cv=none; b=unTuuT5AnM3DraAPi+aKEZVhxegNQZXucWrbTQNtkFAuRlDc4VZd5v0lqvClLxcZL06NnhMQLw5y38liAAgKzmvU6OFPb1Ioq79nEXRZZLPMCHwJlXDKs/+3/dOgkgIIGT7ANqFsJpZDBvoa5QyAZZElyFBsiuINZrnIiI07PVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745491035; c=relaxed/simple;
	bh=NeVKdcw8OCf4gupfY3nEEQyeD5Av5HUkByu8eDlPENE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=qYltZJGbKt9TGm3CdFZDP6jSI+oHbxTS6n+ikVpuRKqeGXADDVOdQzo3avgryXfRMF7xiIoQyOCblCIOoCu9Ah8Lr7WBRfz+gqHNE8Dym0ZGV89Rlj5t2/fUsDspm6l9DMnhqCnfrOFh1hxG3ugcXe5DbG7K7BUkL/oqx5SoBuQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=i03xX/0c; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="i03xX/0c"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-7399a2dc13fso1080590b3a.2
        for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 03:37:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745491032; x=1746095832; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vscvGKi8aZQ4AtwM5RonL3qnlEsuOoWo+Mhs+nOpbME=;
        b=i03xX/0cbq5zQVf+tCHpDlvx9PLpM9Q1lStx+3clg+CMSTzi/fq34+L891nfwfXObW
         pJ1II6byoKqGQJCOdt9E7mBhoDv6ezILDu4T/aLImuo2zK0prKrVNU/6rWFqT6BLcgP3
         j8kjAiqrUomXw6p+cbO1Oc3Td4hIBN7K2qB2QcoX/yqvbx4mgoY8FUm45v4FD/cuhi7j
         7kSz0DdCY0rmM7NKHLswQIicCVP/HWB5vOBafo/wDWOBiec2OQBd5FuS3ZxW1zSkYLqh
         YX+XWHjoASa/EZl49iiFwM6OCtHthgQ8UdonZUT1xZMC48Q2X1ecsl9NY9UYeoTuY9mi
         aaJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745491032; x=1746095832;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vscvGKi8aZQ4AtwM5RonL3qnlEsuOoWo+Mhs+nOpbME=;
        b=SRi/hlMQb84hbfu1qqV8jaBI3Qvsc09HEcQ4GCoNqVspm7No4bFwV102JoRqFrWGgC
         G8WCq1AIchxwrg77O0x/XVWsZlTUZP4pMSyr6CTrQhbbjgYmoUmSWNuAMG4vGyuYIRlR
         MdEp1my+DolQv7IXOlRtDnw7red6rOdPW8++Y6VN4jyLEPCHuP+q0v0L62bt0TWADhTO
         SWApZFjlKXusQt9MrMO+yPc+uTrjzWZ2XSPeO1cVora8QPeLLFSCbScIyqDTRfkyMnfi
         sN9gNOvM+wW6Zlt1n16OwYBu1MNNM6oH2lpZ5pE/PHyVLT+/y5lJ7hu1jUodUL8X3Qd0
         vMlQ==
X-Forwarded-Encrypted: i=1; AJvYcCU1aidhZ6snjuE5m8/x8fbEi5I8nxXZ70VA2fdrDNZ2Hwb5LpbEK1wwn0ZUYx6mJyPn+U1qlZJ28R+iFts=@vger.kernel.org
X-Gm-Message-State: AOJu0YyoKs261fSsxTNjVpbPW/nslh+pdbHsSwtn8R6kVye/B7L3LZja
	vJft1PQ8Sb631SJ2v5XqyhpYrUU15V6gAEnIAoCWYfLeVsBb86twzCWZ6WBzJlQ=
X-Gm-Gg: ASbGnctJ5Rak0pAIsY8DB0mlETCeNi+b3k7daWTPAIo2jVI0ImyiPF0Ec36wYHaCfZu
	XarIQccVdwLDDvcjy4/MwLCmL4rCde27kMQxI83VkZSehMFw+4NPxUHvh5YWaF27uH/7Z+jw8P7
	ThXLkm1KwA9/yBI+5AqVD+m49QdH/Z+CnxJlvHynRQB8W1Nw7OvWKMC7bjsWgGzeGYzG+PgW0/t
	bZTNnWeHQJBotgRySSvsmnjhqQIZAJd2mXz/7tAoyqkoPv4OIpKyWP7QWVCZf+mrV7aa5/IpSYA
	+9Kq3UR+EEMb5cUmm6bQ5uJYNO5QevFoPLEHswXw6w==
X-Google-Smtp-Source: AGHT+IG2u1pypaLFiO4fsom7dy5KA1qvfxkw47AsY/FMtzeMJ0wlTMGgmr1u6k36FoY0kYO6FF+lXw==
X-Received: by 2002:a05:6a00:179e:b0:73e:359:1c86 with SMTP id d2e1a72fcca58-73e247d7cb6mr2816818b3a.18.1745491032617;
        Thu, 24 Apr 2025 03:37:12 -0700 (PDT)
Received: from localhost ([122.172.83.32])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73e259414d3sm1050286b3a.47.2025.04.24.03.37.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 03:37:12 -0700 (PDT)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Viresh Kumar <vireshk@kernel.org>,
	Nishanth Menon <nm@ti.com>,
	Stephen Boyd <sboyd@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>
Cc: Viresh Kumar <viresh.kumar@linaro.org>,
	linux-pm@vger.kernel.org,
	Vincent Guittot <vincent.guittot@linaro.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/6] OPP: Return opp_table from dev_pm_opp_get_opp_table_ref()
Date: Thu, 24 Apr 2025 16:06:46 +0530
Message-Id: <ead694941686345bfd3f95100d889191cb9e3cda.1745490980.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.31.1.272.g89b43f80a514
In-Reply-To: <cover.1745490980.git.viresh.kumar@linaro.org>
References: <cover.1745490980.git.viresh.kumar@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

For convenience of users, return back the pointer to the opp_table from
dev_pm_opp_get_opp_table_ref(), so they can do:

	opp_table = dev_pm_opp_get_opp_table_ref(tmp_table);

No intentional functional impact.

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 drivers/opp/core.c     | 9 ++++-----
 drivers/opp/of.c       | 9 +++------
 include/linux/pm_opp.h | 7 +++++--
 3 files changed, 12 insertions(+), 13 deletions(-)

diff --git a/drivers/opp/core.c b/drivers/opp/core.c
index 150439a18b87..14fb0f43cc77 100644
--- a/drivers/opp/core.c
+++ b/drivers/opp/core.c
@@ -58,10 +58,8 @@ static struct opp_table *_find_opp_table_unlocked(struct device *dev)
 	struct opp_table *opp_table;
 
 	list_for_each_entry(opp_table, &opp_tables, node) {
-		if (_find_opp_dev(dev, opp_table)) {
-			dev_pm_opp_get_opp_table_ref(opp_table);
-			return opp_table;
-		}
+		if (_find_opp_dev(dev, opp_table))
+			return dev_pm_opp_get_opp_table_ref(opp_table);
 	}
 
 	return ERR_PTR(-ENODEV);
@@ -1687,9 +1685,10 @@ static void _opp_table_kref_release(struct kref *kref)
 	kfree(opp_table);
 }
 
-void dev_pm_opp_get_opp_table_ref(struct opp_table *opp_table)
+struct opp_table *dev_pm_opp_get_opp_table_ref(struct opp_table *opp_table)
 {
 	kref_get(&opp_table->kref);
+	return opp_table;
 }
 EXPORT_SYMBOL_GPL(dev_pm_opp_get_opp_table_ref);
 
diff --git a/drivers/opp/of.c b/drivers/opp/of.c
index 87cb6aeb49ed..c240acc81a8d 100644
--- a/drivers/opp/of.c
+++ b/drivers/opp/of.c
@@ -60,10 +60,8 @@ struct opp_table *_managed_opp(struct device *dev, int index)
 			 * But the OPPs will be considered as shared only if the
 			 * OPP table contains a "opp-shared" property.
 			 */
-			if (opp_table->shared_opp == OPP_TABLE_ACCESS_SHARED) {
-				dev_pm_opp_get_opp_table_ref(opp_table);
-				managed_table = opp_table;
-			}
+			if (opp_table->shared_opp == OPP_TABLE_ACCESS_SHARED)
+				managed_table = dev_pm_opp_get_opp_table_ref(opp_table);
 
 			break;
 		}
@@ -405,8 +403,7 @@ static void lazy_link_required_opp_table(struct opp_table *new_table)
 				continue;
 			}
 
-			required_opp_tables[i] = new_table;
-			dev_pm_opp_get_opp_table_ref(new_table);
+			required_opp_tables[i] = dev_pm_opp_get_opp_table_ref(new_table);
 
 			/* Link OPPs now */
 			ret = lazy_link_required_opps(opp_table, new_table, i);
diff --git a/include/linux/pm_opp.h b/include/linux/pm_opp.h
index 5e4c3428b139..0deddfa91aca 100644
--- a/include/linux/pm_opp.h
+++ b/include/linux/pm_opp.h
@@ -100,7 +100,7 @@ struct dev_pm_opp_data {
 #if defined(CONFIG_PM_OPP)
 
 struct opp_table *dev_pm_opp_get_opp_table(struct device *dev);
-void dev_pm_opp_get_opp_table_ref(struct opp_table *opp_table);
+struct opp_table *dev_pm_opp_get_opp_table_ref(struct opp_table *opp_table);
 void dev_pm_opp_put_opp_table(struct opp_table *opp_table);
 
 unsigned long dev_pm_opp_get_bw(struct dev_pm_opp *opp, bool peak, int index);
@@ -207,7 +207,10 @@ static inline struct opp_table *dev_pm_opp_get_opp_table_indexed(struct device *
 	return ERR_PTR(-EOPNOTSUPP);
 }
 
-static inline void dev_pm_opp_get_opp_table_ref(struct opp_table *opp_table) {}
+static inline struct opp_table *dev_pm_opp_get_opp_table_ref(struct opp_table *opp_table)
+{
+	return opp_table;
+}
 
 static inline void dev_pm_opp_put_opp_table(struct opp_table *opp_table) {}
 
-- 
2.31.1.272.g89b43f80a514

