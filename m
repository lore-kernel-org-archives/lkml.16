Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1528128E5EA;
	Wed, 23 Apr 2025 15:28:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745422090; cv=none; b=ByfZfenDzCDSXZiK/UYhVbvPqYyC8OZX4kJ84Gtdgw1gNaHrrByDQRIQmSgvSFThqdxG7zXx7po+o3OrGUB9FayPX02QY6+A1EmgVZWwMeP1xPmp+6gmY0KqpUrQz5Jtp73axToff1nmKrxWX88ziCd59OO+aMPAqHDH0isaMfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745422090; c=relaxed/simple;
	bh=ar5WCV/Xk2IvA/B5Jj/QEtesIzgZa8TMAbgOZNpp97A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=h+3d5D7lH1cUJ9Hr44ZUCBLE/hcCfraqOGaLOxOBHOGi1uN+iOCoAls2LCUMtEDw+lFSUd9uxHvCglrLOkzHcO9fQkCEYKEBDE78uh+NQi/RwI7l9vphU+Gj7TomRSWeL8QwVJrUogMmVWbYHx6osY1YQF38h1hQ7IxlMJucatM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PGJxbP7w; arc=none smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PGJxbP7w"
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-6ef60e500d7so672047b3.0;
        Wed, 23 Apr 2025 08:28:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745422088; x=1746026888; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fHVRbngq1O+ZmgUJJIDpKFCMr5eVrxZ3pEePFAGCAnc=;
        b=PGJxbP7wL7Fa8PF9KzzG8+XI6tjtFIz3z1Y5DlH8G5lUr+OtdJhLdsUtyfD03ApU0L
         a0Dx6vVXDav8qzsLy1RFEBjGpDben1C6KHVBu0ZVaC5AhXjc+redE42s0y1frZlhu/Jf
         zfMrbf0R91CYkxgwvEnXiXUDzBxeZQmleg3hYK83/G4WeLBatRQtY2VEVwcG2nFrzs0O
         ysU6+T4j+j62BnGEhK8vzYMV7mDmTQbCVsEEjeu27iLp/X1M3QawYRU37gLMXULwGm2i
         kS9MJNxzgFXCEdtpxoZ/Ot1nb6k/MMLFzrW6Y3li+pq8qGWbKFdq006+yNh4P+V+7hyj
         8Hxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745422088; x=1746026888;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fHVRbngq1O+ZmgUJJIDpKFCMr5eVrxZ3pEePFAGCAnc=;
        b=DKvFmdKUIedp1U7VoFYUcUlqFqF6070r2o6ARM6dWi3bjmHg7p7RGFolmW23C6Wqy7
         32s3t7Mz3VgAkZhwy/Be5+fzkz97/0swbhJvGqKQmvVxsLSmYnzzVVpCpjt8vp2Weoj1
         tMvc8vQsJQ5K06gLY2ibFdliTe4eRN/hax1oLvcergHIRoyo5/r2tN2Iu2AhKHqBaYta
         b5mtlJ64ai/iTK6QsjqJZ3pzdhhoKRlI+S1Yb2tDYVgoo38KSK6am8e+b/yxvQuAf88t
         ejb7+oJQD0JBRo5lIyWyJrChFQHYaLdoltN02iDT38M6oNI5f/1PtvDrVYOG8o4TFpfB
         5UFA==
X-Forwarded-Encrypted: i=1; AJvYcCUoq6XTqMqVnk1+sKsTFgZuHaoY4HQz4hVvTANvKaI/BDQ7ucxvnhmCfpUcqnE+cOkKlN+DgJBWvEo3EsLq@vger.kernel.org, AJvYcCVFmsy0f76x8p2DFTIMmQEoVIKQZHTr2Ji+poyjsIUVhUrb67yauIuzIMbGFywCPTYNfOfzENVtPtV3m2BpTTU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxousQeOkeMEK6TIJzay4Bpmej33J55p4wag2iA20HF649FusMq
	LGdoO2nVyLlKacS9UpJ/9sOBJ1UFC1+daIcbnqLKy9RTcyn973k9
X-Gm-Gg: ASbGncuj8zzSGV/Z5EQdxNIPTdKqVk6rZW7ql/lyap+X0I9zqTfQCrSXvH2RTosejs8
	GQudV8ZuPX8NX3hwMfGg3Qig0dwSSbBOkHX5TkzXw4IgXKh6MwStI7qhln8Obzl6XoI6QrbJG68
	xHoR0zEGkTNTLXFJI1UJbtXjaDjLD0Wu8aAHrqq7SREmvDEcUCVkcOU9B5XsLc+kS/Puv/+mPIm
	WMJ5uFAzskmfYUprDS+foJ9q9QLTDT3bKbYLDkLMwzjtk0jZ+fL/ZTXALnHYpzPTFvpeKeQqVBT
	HNmy2HodoKmDcydWA3UmjK364qVIgsX/ZH/9ppAMwAllnzH52Q==
X-Google-Smtp-Source: AGHT+IHISuZsHHkHKpHC5vi+J56ww4pcJQDqy9fckV8l4A2hgMFtaimgTTejY0prWaIIVPx/6Hrefg==
X-Received: by 2002:a05:690c:9:b0:705:750d:c359 with SMTP id 00721157ae682-7083c0025d3mr1114097b3.32.1745422087718;
        Wed, 23 Apr 2025 08:28:07 -0700 (PDT)
Received: from localhost ([2a03:2880:25ff:1::])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-706ca53be7dsm30065797b3.84.2025.04.23.08.28.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 08:28:07 -0700 (PDT)
From: Joshua Hahn <joshua.hahnjy@gmail.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Rakie Kim <rakie.kim@sk.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Honggyu Kim <honggyu.kim@sk.com>,
	Dan Williams <dan.j.williams@intel.com>,
	Gregory Price <gourry@gourry.net>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH next] mm/mempolicy: Fix error code in sysfs_wi_node_add()
Date: Wed, 23 Apr 2025 08:27:33 -0700
Message-ID: <20250423152805.3356081-1-joshua.hahnjy@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <aAij2oUCP1zmcoPv@stanley.mountain>
References: 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Wed, 23 Apr 2025 11:24:58 +0300 Dan Carpenter <dan.carpenter@linaro.org> wrote:

Hi Dan,

This makes sense to me! I think that the only way the node can already exist
is if an offlining node didn't properly clean up its sysfs entry, which is
a bug, of course. With that said, I don't think the previous state would have
caused any functional problems, since the same node offlining and onlining
should share the same sysfs entry anyways (unless I'm overlooking something
important...)

This fix will help when the cleanup does fail though, and I think that will
help us assess whether a failed cleanup does indeed cause other problems.

Thank you for spotting this & fixing it! I hope you have a great day : -)

Reviewed-by: Joshua Hahn <joshua.hahnjy@gmail.com>

> Return -EEXIST if the node already exists.  Don't return success.
> 
> Fixes: 1bf270ac1b0a ("mm/mempolicy: support memory hotplug in weighted interleave")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
> Potentially returning success was intentional?  This is from static
> analysis and I can't be totally sure.
> 
>  mm/mempolicy.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/mm/mempolicy.c b/mm/mempolicy.c
> index f43951668c41..0538a994440a 100644
> --- a/mm/mempolicy.c
> +++ b/mm/mempolicy.c
> @@ -3539,7 +3539,7 @@ static const struct kobj_type wi_ktype = {
>  
>  static int sysfs_wi_node_add(int nid)
>  {
> -	int ret = 0;
> +	int ret;
>  	char *name;
>  	struct iw_node_attr *new_attr;
>  
> @@ -3569,6 +3569,7 @@ static int sysfs_wi_node_add(int nid)
>  	if (wi_group->nattrs[nid]) {
>  		mutex_unlock(&wi_group->kobj_lock);
>  		pr_info("node%d already exists\n", nid);
> +		ret = -EEXIST;
>  		goto out;
>  	}
>  
> -- 
> 2.47.2
