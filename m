Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 333E32F5C49;
	Wed,  2 Jul 2025 20:14:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751487261; cv=none; b=R/eFeXFQ80yv1BOkM4E1vppowSD8PC0Pi0kc6Q5K8l36ZiGXJTdLYY/nNX1c+3nrU9J834HJoqDPaBdfA5MGAV+tsimQytarpsj+LbGj3E1PF7F+TH8eygLQlMzkUcQDTAsuMOhLBCmudZfzY2ViqWrviq+ICuzzY3ga+9LJLF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751487261; c=relaxed/simple;
	bh=3euwdPgDUGI0g1cVnpDdDa3NasDn+36g8DZQS4wsxSM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=G9Y8lS04Igty2MP23T1UArzaDsxFmAM4QsekYvcwXT0WKsb0WH7DtFG3F9TxNMhwEtgR+cFfuP7AZc4xFd4mcApUH5SLVJfkF3J1rZB0Np6zUXsjQIrBut+VHZSAgF44p30o7+BlGBQ0qR07LuNQlRE+saoOGjZwZ/+5hQ8cuLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P8yqgB9b; arc=none smtp.client-ip=209.85.128.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P8yqgB9b"
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-70e64b430daso53464787b3.3;
        Wed, 02 Jul 2025 13:14:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751487258; x=1752092058; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ka2lHJKibszvD814XqK78W02tftJp26/CMGv/fNrDPI=;
        b=P8yqgB9b98EVjThUFLF7N+mT4LjCn/e78cx04KtTmdLNT/JJ7HGS1ET55LXZmFPkgU
         du2vDoOvMR6x2xIbcVr/wpSyb/G9HGb2pD+jkCt0tnZ6KKYZlGrn1wWUhsV/7UR9l0o9
         XTBIwTahIxdqHySvS3BJzOIIQCw9Ux1RD58MeVEodqzuYLyQ2lPrQYCYGGjxiHD8FD9k
         TM9GRN96ewlGWPNHOkZIj+eCEqZTp4l2Ura0PyS2X0vilT1/JJZMsL+Vd2eaGVkf756G
         PYn5Svz1hnV/WYvaIeyUYTJtV+271Rje+3lP58nqfFcrYcj0BMJJq6IbLpaSQjP8eLsx
         PYEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751487258; x=1752092058;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ka2lHJKibszvD814XqK78W02tftJp26/CMGv/fNrDPI=;
        b=AKH6EgeCWqMKEQjSQcghwZgMGkc5oPR7WerQXCHumd8EcPdkb10q3F5F+cF+u64+gj
         QC825mK3IXxKDBfPLYpsH6t6t8N8X0BbOO2HAffM3GjgBGAFDBByY/wQKzWYXe2w5YAu
         fSj7ZIk3R6aOIfIw/+4j1dPwXxEsMAizwW4SRP4Ltdz0rYgnwFRXaWELzJZ0PbkqncTd
         NXb3+ieJLigwGxBZrRkpBXU8c5QG6xOZZuC9nkzd9qINcp2IrC5MNJmSzgoeXHzWQ8Lc
         9ftNDsUUPSq1mrr9GQe8Y4N5ngRM8bms0kxrqR86Is5OMl57WP/TQo/J89wqSnwggcZf
         SfMw==
X-Forwarded-Encrypted: i=1; AJvYcCWxECp0bd+RDn39fGloeRx+ywuXXCsZbrFLxxWF/FaqyFNp2rUc8oMbNfqsH9HAgt8LABB/VcdUY0A=@vger.kernel.org, AJvYcCXKo2oH1jraTCNmeYOTP2IfHC1S8BdFJ2IYeVwu0uZtnQ1Bhsm+Pct11l9N6puUsF06dqhhTQMl/AdQ8Kjg@vger.kernel.org
X-Gm-Message-State: AOJu0YxMoIF/gqCQCNVDYO6iq2cCERavnvTvYsO0XViNNFup3vxd8vWG
	JyeVLo4eSbJDLzDywFoboAyOE3+2k30TmReIGTrq+mJ8WaM93PBS4ct7
X-Gm-Gg: ASbGncutaZMj4k2Km/xQO0tunpofcw//VQu0A3wIJFgIf7yGBuqm/deVLEj3qHIwewV
	Ei8+8jmy42uRoTfiH7/rkwgmJso70EFek5g0qp7rSZYeYqpFqDPut33GJ5ZC6gPpWd7dCwiGurq
	DOzd0WKvhhYJM/91JLkRWVodu5LPLe7Fi/Ib2wah5s/HKuafpSub0M65iMQbmw1w1PTa/TeiGlz
	u2jAcDK0Dmrn+gwJSUGsCby08UyiAcQoAgy8vRynoKMSpV2nNayHPPuaDGj6tRsxwvlhlT6//g7
	es0qvsvhC+q5vzcZGUc1c4jIXogyMxrUYPM3EqGr/B9a5strIOKb6tpncvr3af/C0hJQV3G5DTY
	6SzFWcv1UIjzDfsXThQ==
X-Google-Smtp-Source: AGHT+IE3dlhWUQcRHaBMecK1cT77BYAqbxJi6TZDV3Mx4tnnVo3pxRt5aw3J+eVaop43IyeQiBIT1A==
X-Received: by 2002:a05:690c:6513:b0:70f:8884:a5fc with SMTP id 00721157ae682-7164d27d031mr57275137b3.4.1751487257720;
        Wed, 02 Jul 2025 13:14:17 -0700 (PDT)
Received: from bijan-laptop.attlocal.net ([2600:1700:680e:c000:873e:8f35:7cd8:3fe3])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-71515cb4347sm26124157b3.83.2025.07.02.13.14.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 13:14:17 -0700 (PDT)
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
Subject: [RFC PATCH v3 03/13] mm/damon/sysfs-schemes: implement DAMOS action destinations directory
Date: Wed,  2 Jul 2025 15:13:26 -0500
Message-ID: <20250702201337.5780-4-bijan311@gmail.com>
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

DAMOS_MIGRATE_{HOT,COLD} can have multiple action destinations and their
weights.  Implement sysfs directory named 'dests' under each scheme
directory to let DAMON sysfs ABI users utilize the feature.  The
interface is similar to other multiple parameters directory like
kdamonds or filters.  The directory contains only nr_dests file
initially.  Writing a number of desired destinations to nr_dests creates
directories of the number.  Each of the created directories has two
files named id and weight.  Users can then write the destination's
identifier (node id in case of DAMOS_MIGRATE_*) and weight to the files.

Signed-off-by: SeongJae Park <sj@kernel.org>
---
 mm/damon/sysfs-schemes.c | 225 ++++++++++++++++++++++++++++++++++++++-
 1 file changed, 224 insertions(+), 1 deletion(-)

diff --git a/mm/damon/sysfs-schemes.c b/mm/damon/sysfs-schemes.c
index 601360e9b521..b9434cdaacdc 100644
--- a/mm/damon/sysfs-schemes.c
+++ b/mm/damon/sysfs-schemes.c
@@ -1655,6 +1655,204 @@ static const struct kobj_type damon_sysfs_access_pattern_ktype = {
 	.default_groups = damon_sysfs_access_pattern_groups,
 };
 
+/*
+ * dest (action destination) directory
+ */
+
+struct damos_sysfs_dest {
+	struct kobject kobj;
+	unsigned int id;
+	unsigned int weight;
+};
+
+static struct damos_sysfs_dest *damos_sysfs_dest_alloc(void)
+{
+	return kzalloc(sizeof(struct damos_sysfs_dest), GFP_KERNEL);
+}
+
+static ssize_t id_show(
+		struct kobject *kobj, struct kobj_attribute *attr, char *buf)
+{
+	struct damos_sysfs_dest *dest = container_of(kobj,
+			struct damos_sysfs_dest, kobj);
+
+	return sysfs_emit(buf, "%u\n", dest->id);
+}
+
+static ssize_t id_store(struct kobject *kobj,
+		struct kobj_attribute *attr, const char *buf, size_t count)
+{
+	struct damos_sysfs_dest *dest = container_of(kobj,
+			struct damos_sysfs_dest, kobj);
+	int err = kstrtouint(buf, 0, &dest->id);
+
+	return err ? err : count;
+}
+
+static ssize_t weight_show(
+		struct kobject *kobj, struct kobj_attribute *attr, char *buf)
+{
+	struct damos_sysfs_dest *dest = container_of(kobj,
+			struct damos_sysfs_dest, kobj);
+
+	return sysfs_emit(buf, "%u\n", dest->weight);
+}
+
+static ssize_t weight_store(struct kobject *kobj,
+		struct kobj_attribute *attr, const char *buf, size_t count)
+{
+	struct damos_sysfs_dest *dest = container_of(kobj,
+			struct damos_sysfs_dest, kobj);
+	int err = kstrtouint(buf, 0, &dest->weight);
+
+	return err ? err : count;
+}
+
+static void damos_sysfs_dest_release(struct kobject *kobj)
+{
+	struct damos_sysfs_dest *dest = container_of(kobj,
+			struct damos_sysfs_dest, kobj);
+	kfree(dest);
+}
+
+static struct kobj_attribute damos_sysfs_dest_id_attr =
+		__ATTR_RW_MODE(id, 0600);
+
+static struct kobj_attribute damos_sysfs_dest_weight_attr =
+		__ATTR_RW_MODE(weight, 0600);
+
+static struct attribute *damos_sysfs_dest_attrs[] = {
+	&damos_sysfs_dest_id_attr.attr,
+	&damos_sysfs_dest_weight_attr.attr,
+	NULL,
+};
+ATTRIBUTE_GROUPS(damos_sysfs_dest);
+
+static const struct kobj_type damos_sysfs_dest_ktype = {
+	.release = damos_sysfs_dest_release,
+	.sysfs_ops = &kobj_sysfs_ops,
+	.default_groups = damos_sysfs_dest_groups,
+};
+
+/*
+ * dests (action destinations) directory
+ */
+
+struct damos_sysfs_dests {
+	struct kobject kobj;
+	struct damos_sysfs_dest **dests_arr;
+	int nr;
+};
+
+static struct damos_sysfs_dests *
+damos_sysfs_dests_alloc(void)
+{
+	return kzalloc(sizeof(struct damos_sysfs_dests), GFP_KERNEL);
+}
+
+static void damos_sysfs_dests_rm_dirs(
+		struct damos_sysfs_dests *dests)
+{
+	struct damos_sysfs_dest **dests_arr = dests->dests_arr;
+	int i;
+
+	for (i = 0; i < dests->nr; i++)
+		kobject_put(&dests_arr[i]->kobj);
+	dests->nr = 0;
+	kfree(dests_arr);
+	dests->dests_arr = NULL;
+}
+
+static int damos_sysfs_dests_add_dirs(
+		struct damos_sysfs_dests *dests, int nr_dests)
+{
+	struct damos_sysfs_dest **dests_arr, *dest;
+	int err, i;
+
+	damos_sysfs_dests_rm_dirs(dests);
+	if (!nr_dests)
+		return 0;
+
+	dests_arr = kmalloc_array(nr_dests, sizeof(*dests_arr),
+			GFP_KERNEL | __GFP_NOWARN);
+	if (!dests_arr)
+		return -ENOMEM;
+	dests->dests_arr = dests_arr;
+
+	for (i = 0; i < nr_dests; i++) {
+		dest = damos_sysfs_dest_alloc();
+		if (!dest) {
+			damos_sysfs_dests_rm_dirs(dests);
+			return -ENOMEM;
+		}
+
+		err = kobject_init_and_add(&dest->kobj,
+				&damos_sysfs_dest_ktype,
+				&dests->kobj, "%d", i);
+		if (err) {
+			kobject_put(&dest->kobj);
+			damos_sysfs_dests_rm_dirs(dests);
+			return err;
+		}
+
+		dests_arr[i] = dest;
+		dests->nr++;
+	}
+	return 0;
+}
+
+static ssize_t nr_dests_show(struct kobject *kobj,
+		struct kobj_attribute *attr, char *buf)
+{
+	struct damos_sysfs_dests *dests = container_of(kobj,
+			struct damos_sysfs_dests, kobj);
+
+	return sysfs_emit(buf, "%d\n", dests->nr);
+}
+
+static ssize_t nr_dests_store(struct kobject *kobj,
+		struct kobj_attribute *attr, const char *buf, size_t count)
+{
+	struct damos_sysfs_dests *dests;
+	int nr, err = kstrtoint(buf, 0, &nr);
+
+	if (err)
+		return err;
+	if (nr < 0)
+		return -EINVAL;
+
+	dests = container_of(kobj, struct damos_sysfs_dests, kobj);
+
+	if (!mutex_trylock(&damon_sysfs_lock))
+		return -EBUSY;
+	err = damos_sysfs_dests_add_dirs(dests, nr);
+	mutex_unlock(&damon_sysfs_lock);
+	if (err)
+		return err;
+
+	return count;
+}
+
+static void damos_sysfs_dests_release(struct kobject *kobj)
+{
+	kfree(container_of(kobj, struct damos_sysfs_dests, kobj));
+}
+
+static struct kobj_attribute damos_sysfs_dests_nr_attr =
+		__ATTR_RW_MODE(nr_dests, 0600);
+
+static struct attribute *damos_sysfs_dests_attrs[] = {
+	&damos_sysfs_dests_nr_attr.attr,
+	NULL,
+};
+ATTRIBUTE_GROUPS(damos_sysfs_dests);
+
+static const struct kobj_type damos_sysfs_dests_ktype = {
+	.release = damos_sysfs_dests_release,
+	.sysfs_ops = &kobj_sysfs_ops,
+	.default_groups = damos_sysfs_dests_groups,
+};
+
 /*
  * scheme directory
  */
@@ -1672,6 +1870,7 @@ struct damon_sysfs_scheme {
 	struct damon_sysfs_stats *stats;
 	struct damon_sysfs_scheme_regions *tried_regions;
 	int target_nid;
+	struct damos_sysfs_dests *dests;
 };
 
 struct damos_sysfs_action_name {
@@ -1762,6 +1961,22 @@ static int damon_sysfs_scheme_set_access_pattern(
 	return err;
 }
 
+static int damos_sysfs_set_dests(struct damon_sysfs_scheme *scheme)
+{
+	struct damos_sysfs_dests *dests = damos_sysfs_dests_alloc();
+	int err;
+
+	if (!dests)
+		return -ENOMEM;
+	err = kobject_init_and_add(&dests->kobj, &damos_sysfs_dests_ktype,
+			&scheme->kobj, "dests");
+	if (err)
+		kobject_put(&dests->kobj);
+	else
+		scheme->dests = dests;
+	return err;
+}
+
 static int damon_sysfs_scheme_set_quotas(struct damon_sysfs_scheme *scheme)
 {
 	struct damon_sysfs_quotas *quotas = damon_sysfs_quotas_alloc();
@@ -1894,9 +2109,12 @@ static int damon_sysfs_scheme_add_dirs(struct damon_sysfs_scheme *scheme)
 	err = damon_sysfs_scheme_set_access_pattern(scheme);
 	if (err)
 		return err;
-	err = damon_sysfs_scheme_set_quotas(scheme);
+	err = damos_sysfs_set_dests(scheme);
 	if (err)
 		goto put_access_pattern_out;
+	err = damon_sysfs_scheme_set_quotas(scheme);
+	if (err)
+		goto put_dests_out;
 	err = damon_sysfs_scheme_set_watermarks(scheme);
 	if (err)
 		goto put_quotas_access_pattern_out;
@@ -1927,6 +2145,9 @@ static int damon_sysfs_scheme_add_dirs(struct damon_sysfs_scheme *scheme)
 put_quotas_access_pattern_out:
 	kobject_put(&scheme->quotas->kobj);
 	scheme->quotas = NULL;
+put_dests_out:
+	kobject_put(&scheme->dests->kobj);
+	scheme->dests = NULL;
 put_access_pattern_out:
 	kobject_put(&scheme->access_pattern->kobj);
 	scheme->access_pattern = NULL;
@@ -1937,6 +2158,8 @@ static void damon_sysfs_scheme_rm_dirs(struct damon_sysfs_scheme *scheme)
 {
 	damon_sysfs_access_pattern_rm_dirs(scheme->access_pattern);
 	kobject_put(&scheme->access_pattern->kobj);
+	kobject_put(&scheme->dests->kobj);
+	damos_sysfs_dests_rm_dirs(scheme->dests);
 	damon_sysfs_quotas_rm_dirs(scheme->quotas);
 	kobject_put(&scheme->quotas->kobj);
 	kobject_put(&scheme->watermarks->kobj);
-- 
2.43.5

