Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 238B81FE453
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 08:17:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738829830; cv=none; b=RGEaWnOIPdX3AK2jc26A2RJW4lMbxbuwtAfLNE069VtDBTup4L5UfVwIzARzXWKxpKZcA1IZrk4Y7ptjYNCPrdpNZjiukdZy0JZxU9kRZLxSoMx5uiGcfK+hLSHq6X4HbQk/CrACCVxSfJyjx3vriovjfLCE2ldkUkAFS+FqusQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738829830; c=relaxed/simple;
	bh=jEJ+dzjS9jkqBg5sz39XNcksg28cvuzTKz0gQ8s/HRM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Sgz709DOFfRzhew7kNQhkbxsn1TK1Ybx0Yf7XQb37l+FDm92sozYJqFDM7Fr7KYGjGU0tGiegdvYEX2pRp/zas72mxkjYKFx1gf1bvw8BeQQPmZZ57xc6JP6ypzUGOltM4EdNWaSF+J4lN9tU25AEa2gq7pGZAZjV19gUMY97Uw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=EvfjblR5; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EvfjblR5"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-38da88e6db0so245513f8f.2
        for <linux-kernel@vger.kernel.org>; Thu, 06 Feb 2025 00:17:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738829826; x=1739434626; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ubql9r1omCt43g1m4gjLWGeKKiFiLncoJpuHUqF935k=;
        b=EvfjblR5bg4TmIZW61dM0iXo3gfCZ8kQC3nV/am8kYd1I59JxHDrihw6kLGFERjhMn
         btTW4SnHNdLthJ9y+iuo24NeT4JPjyww5BF4ViLyna5WXxoj/8U421BcfkYH9lW8Vt+R
         iBNFDold/gBRSu80VHbjR/+uTVqF9Y37P7Gq1wX2xZ7b/Lv5X+xBZPEvOD5EQySRB/j1
         UcOK+yoe35VVXiVqOTKakTOHr8/YfrHgkxbGjDlHgz1VisqO5F2A6Dbf9onMW2lID4Gt
         yZdjt7wykIMqE++TrdxdB/W1Q2T12ST1ZsoiAzIsS2/40VQ+xAJqUX7VSBrfJDc2n5RY
         gVrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738829826; x=1739434626;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ubql9r1omCt43g1m4gjLWGeKKiFiLncoJpuHUqF935k=;
        b=aasmYmLjOk16kGrSFATG/pOzwMmiwLu+EEg0a6QnonXUh+kpNldX4cbDkkx4DmfIkI
         BsbAInq+iET5V8OCLN/masoF5B1RlrNzyAR5HeS5HLGWmR/U6rAT2Vrpi/iOhyeFsUg2
         anFtZXTOx8epkdbLUXXAwbsLTxvl4/oP1ePs6zwOfwjEhNz1Fkw6z2P09ttmV5xjFz9a
         2NOlOrzk27cfz2aItL78ksVQyEyN+EuCwrxClFy4iAstuGueGiZILPrl+obATW5DUbix
         kiUOti8OcA/rC4B2unxNedfTT50Nt1WYzv+pU6VPuWq/eJBsRWeCCTYiIkg6thZAPDsD
         u1mg==
X-Forwarded-Encrypted: i=1; AJvYcCW4bYc/+Q/OflSrP4GhKWwfGRthoLGvaIRudWimNi6QhVIPBdRfnoPxMfH6OE851L326hiNFL3ZkdjT6cw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzMROa2AlkhBfCqdE6KZkmi92MLVSghEmvGnG+6FiPwtNE/jAw1
	lkkDT7EO8Tyv0p6UxTFEShz8WI+wjnxwq9fTukV6lODi87rfgglT7f1h1hB10ik=
X-Gm-Gg: ASbGncvVZANpogN/yBmjPLDwUApp9lCrpU3L4Bg6GMmIoe93iJEFMMf1DAZ/y22o1SI
	aFVQ0sr8TFF1IA8UESQHcubjSXM1T0eWthD9mVJ2XO8py1NAGYM1Z5PIkwHNsGakGjVoWPkXytg
	tuWHWHQe487GhPilXCLqLM/7S9abeLhr2VDhqH/J5dOeobP0SYsopPJdfOnN14ikR/IWMNV1tZo
	Gkab87zkm91/zhwMSSDnbB041ui/hmrHvlOx1JbMqrOBuDVGgpZ0hzGvrez++KvVOCRJn2mL8BG
	rT2cVvk6dFZtETU6bsBl
X-Google-Smtp-Source: AGHT+IF7c/c3cT8gIKlZmV09tdvJuSUhNmFcmUl5w0RwgKRFabBb32VFjSdJlhbFnDoNrb4CYnO3Bw==
X-Received: by 2002:a5d:64ec:0:b0:385:f7a3:fea6 with SMTP id ffacd0b85a97d-38db48ba435mr3619651f8f.13.1738829826339;
        Thu, 06 Feb 2025 00:17:06 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-38dbde1de32sm1040103f8f.83.2025.02.06.00.17.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Feb 2025 00:17:05 -0800 (PST)
Date: Thu, 6 Feb 2025 11:17:02 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Tvrtko Ursulin <tursulin@ursulin.net>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Andrew Morton <akpm@linux-foundation.org>,
	Andi Shyti <andi.shyti@linux.intel.com>,
	David Hildenbrand <david@redhat.com>,
	Josef Bacik <josef@toxicpanda.com>,
	"Matthew Wilcox (Oracle)" <willy@infradead.org>,
	Brian Geffon <bgeffon@google.com>, intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH next] drm/i915: Fix NULL vs IS_ERR() check in
 __shmem_writeback()
Message-ID: <7f99a56b-d517-40b0-92b7-421c4fd813f2@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The filemap_lock_folio() function doesn't return NULL, it returns error
pointers.

Fixes: 25dd342f0cc8 ("drm/i915/gem: convert __shmem_writeback() to folios")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/gpu/drm/i915/gem/i915_gem_shmem.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_shmem.c b/drivers/gpu/drm/i915/gem/i915_gem_shmem.c
index a784fb44e59c..fb263b421958 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_shmem.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_shmem.c
@@ -319,7 +319,7 @@ void __shmem_writeback(size_t size, struct address_space *mapping)
 		struct folio *folio;
 
 		folio = filemap_lock_folio(mapping, i);
-		if (!folio)
+		if (IS_ERR(folio))
 			continue;
 
 		if (!folio_mapped(folio) && folio_clear_dirty_for_io(folio)) {
-- 
2.47.2

