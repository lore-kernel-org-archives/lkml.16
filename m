Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com [209.85.219.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2465D29B766;
	Thu, 12 Jun 2025 18:15:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749752108; cv=none; b=EpxNrRzp4zmO1+e6RjgGwIZMwdsIpfCBWIeveyWosDmo3umnQtpPXDmPWlCwJksEnM7byON+wdjkysUePVeuvGFsIXj2qLojHF3Boq295QQrkAd+PI3Jl30lW8+/j/ZYG/DbMlC67JxqiEkJMUwyPsqRi8HmGBbjq+G1FOgXjvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749752108; c=relaxed/simple;
	bh=oyqZmRXZ4nv9NU3aggfqss2LA4D+iQG3/UH+ZUIJS9U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZIR/cg/CPvk3E4B9mCaXRv5xK0/Ahy3zhwzyKAJxKfNpWzTDKAbmKrsoWutZ7Em+m8C6tidzJyU9uNAf8+blLejD+d2MvtQkeXtdHTtpYTjpZu4XXlFIeu1Gh0Tn2yytAXlWYZ+1+DbJCI0miE8caSYucSTdgbQTZlwVoN9I+rY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e4U2VbFC; arc=none smtp.client-ip=209.85.219.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e4U2VbFC"
Received: by mail-yb1-f181.google.com with SMTP id 3f1490d57ef6-e7b4ba530feso1114790276.1;
        Thu, 12 Jun 2025 11:15:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749752106; x=1750356906; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V++6cv3qI3iZESOVkUblHQI5RcqouiBvkHuiKma2hsk=;
        b=e4U2VbFCV4ZhapRm0OOnx3kASwLpLCIf/1Y9QHpXA5r12AdfcShDlK2vGUcfVfsaCK
         9KBrdabl8Wh/7FwKvW06LEOf53X97Jxb0wctMOqg5uOWQXK1DtrwP4nhEtBCoPgtidTW
         rynilKCxhd8KzPGD1k8vImH/fdR1KqIuDV8PWE6syc74z3i6uGRGg7mW+ytkF3Z7JF6u
         hVYKje/TBLHTCb2p+C+7sR6FWbFnUf8keajx5+A3v/tgvmvdTTZABuEWachhYcwTDYqA
         p7P/rDqM3g1Y9/FGaKGVs9OJtsMiN+AZmH9MOO1ML0Jlmf+iEWx5cbeMGS4evaw+Cn90
         0PHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749752106; x=1750356906;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V++6cv3qI3iZESOVkUblHQI5RcqouiBvkHuiKma2hsk=;
        b=TliRPEOb4JsJD9pG/BuXAhxUMMHDEFFFRnp1nhzPlBohKRfBZpNwvWn1VMA+1HEpMt
         4iZ0KcEYqxhMZD6rZ809t4+OnuKxdOEPPKRADk+XvcdQhWpGuaAX7HeFbMVaAr3v6moF
         3Dz26gpRECaQYfKgsjraHs0lf8DLUlFRwwd+ZuxhqkacwKYHZkFsIswYPNwDsIlar7P3
         iDnhz1n1jJA61JatVp12ivAT2EL9Cg+T7zMcIZx9gbiYrR3oPHhmGsjdezFA+5+VNeLc
         /hOHY631AlwRzq31E23VJ1H6ybxS50Rl6gpP8TDAmGvtYJg/m+kGmPeTvo1ne1WX3xJL
         Od2Q==
X-Forwarded-Encrypted: i=1; AJvYcCWDmyugdIUvIYmHl/Z5LvikPlS4nwV9J3jrRZ6Kg16Q5y0x/A2T7DXZNLhlqlDFGlr7J+Bg6DVsQdRI1M1V@vger.kernel.org, AJvYcCXaOaiMn7caa9bk+DCvcpJ38QCBjIE/relN3Ibi4beXAuuYUPr747h+nCiFxhTX4v7QBY5kDBq4jmA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxtnroQcn3BDvAAka4sSj1L27V+lFxV2mytIr6fq+tbA8T0oHoC
	0D/0oF7I8HITIl30mN8W0wT7enIVZqmVRgpDcKz/NKYg2ibupRG+qmpkr4uiSmQtjww=
X-Gm-Gg: ASbGncsh0xH1Lw26DIeHJjEMkwetRCTCZURiuAF38TLlrXZ/qY9qPpGG1d6cpO3TYjB
	P40wMNnTZItplDsLcMRRa0Q/2C8Izp6FQePr68r1Oklh+HWZZLkdIFoMYCYolB98nOAf/7W2zDd
	9UMPAS5YsjYh7+Wg0+dNhHfJD3h9BifRMS4E70ZSABQvAlCwI3mmfFmURMPWi9KU7VwtezWKYiT
	ZGrE1LmEiks2Bt7jfEZAxzBRvX2DMd/QPRxRpdqQ32VDSVN8QlV7tkKP6LgHkGI7+tdZvCZWyMc
	qY2GEzAvvHH2qSa6DUGN8vqco3HGf/pTpn0vY7xcxikbEx+M6dQQtmapsM2zErXaQu85kYgUFxj
	j7POmDV4=
X-Google-Smtp-Source: AGHT+IHBLjOPvosv/hB5QLaCCYrNVuZy979I3J7L41vsNM7eevjRMEzQ+OyB6twZbnVhhLkQ5/HufA==
X-Received: by 2002:a05:6902:200f:b0:e81:32c9:f9c7 with SMTP id 3f1490d57ef6-e820b64cc40mr6125353276.5.1749752105996;
        Thu, 12 Jun 2025 11:15:05 -0700 (PDT)
Received: from bijan-laptop.attlocal.net ([2600:1700:680e:c000:dd1b:d4ae:15de:11db])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e820e312452sm592480276.40.2025.06.12.11.15.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 11:15:05 -0700 (PDT)
From: Bijan Tabatabai <bijan311@gmail.com>
To: damon@lists.linux.com,
	linux-mm@kvack.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: sj@kernel.org,
	akpm@linux-foundation.org,
	corbet@lwn.net,
	david@redhat.com,
	ziy@nvidia.com,
	matthew.brost@intel.com,
	joshua.hahnjy@gmail.com,
	rakie.kim@sk.com,
	byungchul@sk.com,
	gourry@gourry.net,
	ying.huang@linux.alibaba.com,
	apopple@nvidia.com,
	bijantabatab@micron.com,
	venkataravis@micron.com,
	emirakhur@micron.com,
	ajayjoshi@micron.com,
	vtavarespetr@micron.com
Subject: [RFC PATCH 1/4] mm/mempolicy: Expose policy_nodemask() in include/linux/mempolicy.h
Date: Thu, 12 Jun 2025 13:13:27 -0500
Message-ID: <20250612181330.31236-2-bijan311@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250612181330.31236-1-bijan311@gmail.com>
References: <20250612181330.31236-1-bijan311@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bijan Tabatabai <bijantabatab@micron.com>

This patch is to allow DAMON to call policy_nodemask() so it can
determine where to place a page for interleaving.

Signed-off-by: Bijan Tabatabai <bijantabatab@micron.com>
---
 include/linux/mempolicy.h | 9 +++++++++
 mm/mempolicy.c            | 4 +---
 2 files changed, 10 insertions(+), 3 deletions(-)

diff --git a/include/linux/mempolicy.h b/include/linux/mempolicy.h
index 0fe96f3ab3ef..e96bf493ff7a 100644
--- a/include/linux/mempolicy.h
+++ b/include/linux/mempolicy.h
@@ -133,6 +133,8 @@ struct mempolicy *__get_vma_policy(struct vm_area_struct *vma,
 struct mempolicy *get_vma_policy(struct vm_area_struct *vma,
 		unsigned long addr, int order, pgoff_t *ilx);
 bool vma_policy_mof(struct vm_area_struct *vma);
+nodemask_t *policy_nodemask(gfp_t gfp, struct mempolicy *pol,
+		pgoff_t ilx, int *nid);
 
 extern void numa_default_policy(void);
 extern void numa_policy_init(void);
@@ -232,6 +234,13 @@ static inline struct mempolicy *get_vma_policy(struct vm_area_struct *vma,
 	return NULL;
 }
 
+static inline nodemask_t *policy_nodemask(gfp_t gfp, struct mempolicy *pol,
+				pgoff_t ilx, int *nid)
+{
+	*nid = NUMA_NO_NODE;
+	return NULL;
+}
+
 static inline int
 vma_dup_policy(struct vm_area_struct *src, struct vm_area_struct *dst)
 {
diff --git a/mm/mempolicy.c b/mm/mempolicy.c
index 3b1dfd08338b..54f539497e20 100644
--- a/mm/mempolicy.c
+++ b/mm/mempolicy.c
@@ -596,8 +596,6 @@ static const struct mempolicy_operations mpol_ops[MPOL_MAX] = {
 
 static bool migrate_folio_add(struct folio *folio, struct list_head *foliolist,
 				unsigned long flags);
-static nodemask_t *policy_nodemask(gfp_t gfp, struct mempolicy *pol,
-				pgoff_t ilx, int *nid);
 
 static bool strictly_unmovable(unsigned long flags)
 {
@@ -2195,7 +2193,7 @@ static unsigned int interleave_nid(struct mempolicy *pol, pgoff_t ilx)
  * Return a nodemask representing a mempolicy for filtering nodes for
  * page allocation, together with preferred node id (or the input node id).
  */
-static nodemask_t *policy_nodemask(gfp_t gfp, struct mempolicy *pol,
+nodemask_t *policy_nodemask(gfp_t gfp, struct mempolicy *pol,
 				   pgoff_t ilx, int *nid)
 {
 	nodemask_t *nodemask = NULL;
-- 
2.43.5

