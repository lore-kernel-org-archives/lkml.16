Received: from mail-pg1-f202.google.com (mail-pg1-f202.google.com [209.85.215.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A12BB2DAF90
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 23:13:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745968404; cv=none; b=Q5+apligJgUfPTIZIndG94sA8kWCgmZ4Y2YJqUS+kJqQkDrHb2MIeztVQgbsaEvW8eCcpDb1iuBqus8HScD6EC0ga69/3IfanjvovC046VTRD9jzP7BhR968zeo9lGyZXXoFeodJ7po3pWoGgn9n7+aohiZzbkv/c5n6ceKidyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745968404; c=relaxed/simple;
	bh=L1akBAVuNGL/HgjuY+Dt/87IXyFTEjbq7vYmV4pniEU=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Vp0+18f5XU7aYwPBYB3U0y0oojqXJG/UHksP6P4nWxi7ETf7tc9aiGiwSySdCXbbuaP7Cfp6agQ6+V3E8C51Pfa83rz9sy5V1iJpj0azyeNq1HYb8SRevQzta9P/ugIpH4Gln36kXH5qwEhiPTOyHqZ42L5mej5jswuaXr1gquA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--yabinc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=314bLS1Z; arc=none smtp.client-ip=209.85.215.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--yabinc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="314bLS1Z"
Received: by mail-pg1-f202.google.com with SMTP id 41be03b00d2f7-af59547f55bso3605988a12.0
        for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 16:13:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745968402; x=1746573202; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=H5jsaexJJdkxvjPU7Sdj2kvtz8W8nkPeoHdR3jNANOg=;
        b=314bLS1ZB8J9x3th2+txgE1UCfNmJhKwqSo2GIMKEOXKo/Igfog5x5sRTD5Oot0bHD
         CuC4GEWIVVq7mWGtbX380uyMgrPSJ6/vzmZz2u9ZAaYAn2jBfnI11HE7ZgGjdnVhND7D
         iCmVKhIVYiKV9nU0XHkW0AtVXow6kFTLYj6zsxEdkRPTmhjchk5vN4cxg7FdF9cNL6hA
         ah9mXeBJaBYcrm2/1Fa0anIgcD+d9tG4Vi38003xB39DojRS/OSFBhQjYj2bDKLsEC8p
         vmFmW5XDIw3p58ReplbjJdSrAlC6OiWHSS7fLmdRwAWVkcWJHyXCbMNTWkDg5B+wljsn
         fQGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745968402; x=1746573202;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=H5jsaexJJdkxvjPU7Sdj2kvtz8W8nkPeoHdR3jNANOg=;
        b=gJRzHIA5rOtudZfAETY/Y69qOBBysJclnc8DB+EjuaQADdj5npPqbVgQrsiR9SyRwM
         kWq0R5hkRIXgRvStabkz7NEbCEsDWidOehQ+5vyt48bz1Idu55omAsL+zsem0k/725dy
         m8TzNYAlrWaelql9i/DXUl3dWndagmVxi79k87Ya2CIYTvskf4PrIqTFdgUhmKVkVCC4
         xwNqVMEni/c3XDRZet+iv/Ji2/T4gL2schpov+pjrqpe7KNg3WyWDZJVdaoaYBK5SqO3
         6EZiBD+10dSgq8Qq1508IxLb5PxQ6hnEG+dR1icHo0LSplBB+WP9FOeP8Xd4U5bvS8o9
         WAkw==
X-Forwarded-Encrypted: i=1; AJvYcCX8Bk0A5+GN/KkFvvhO10QperQl9TZJ24d+57DMjntQ20PMJwMY7xlOy4J13OMrmDTZNCVuC3jnhGUkhkE=@vger.kernel.org
X-Gm-Message-State: AOJu0YydNnptZsCHVH9VoisqkJeLWKpAjqfDQ7WZxDs4AHldUA3FRYfH
	5tE9X284gIPp+nGlJ/qHGfkW7CsjcCuu4lYNqmXymFm451r5lTsVvEppD7pQGabCP0iBZ+5ACkL
	h
X-Google-Smtp-Source: AGHT+IH50STJWtK1MCML9Q9BF1hzSCklojd5KzXO4ucJvZeFgv98Tbj7wq5WAu3vJGIOixVPU9Xw+SqETqA=
X-Received: from pjbnd12.prod.google.com ([2002:a17:90b:4ccc:b0:2ef:78ff:bc3b])
 (user=yabinc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:db0b:b0:21f:2ded:76ea
 with SMTP id d9443c01a7336-22df5839f4bmr4572335ad.36.1745968401836; Tue, 29
 Apr 2025 16:13:21 -0700 (PDT)
Date: Tue, 29 Apr 2025 16:13:00 -0700
In-Reply-To: <20250429231301.1952246-1-yabinc@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250429231301.1952246-1-yabinc@google.com>
X-Mailer: git-send-email 2.49.0.967.g6a0df3ecc3-goog
Message-ID: <20250429231301.1952246-3-yabinc@google.com>
Subject: [PATCH v5 2/2] coresight: core: Disable helpers for devices that fail
 to enable
From: Yabin Cui <yabinc@google.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@linaro.org>, 
	James Clark <james.clark@linaro.org>, Leo Yan <leo.yan@arm.com>, 
	Jie Gan <quic_jiegan@quicinc.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Yabin Cui <yabinc@google.com>
Content-Type: text/plain; charset="UTF-8"

When enabling a SINK or LINK type coresight device fails, the
associated helpers should be disabled.

Signed-off-by: Yabin Cui <yabinc@google.com>
Suggested-by: Suzuki K Poulose <suzuki.poulose@arm.com>
Reviewed-by: James Clark <james.clark@linaro.org>
Reviewed-by: Mike Leach <mike.leach@linaro.org>
---
 drivers/hwtracing/coresight/coresight-core.c | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
index dabec7073aed..d3523f0262af 100644
--- a/drivers/hwtracing/coresight/coresight-core.c
+++ b/drivers/hwtracing/coresight/coresight-core.c
@@ -465,7 +465,7 @@ int coresight_enable_path(struct coresight_path *path, enum cs_mode mode,
 		/* Enable all helpers adjacent to the path first */
 		ret = coresight_enable_helpers(csdev, mode, path);
 		if (ret)
-			goto err;
+			goto err_disable_path;
 		/*
 		 * ETF devices are tricky... They can be a link or a sink,
 		 * depending on how they are configured.  If an ETF has been
@@ -486,8 +486,10 @@ int coresight_enable_path(struct coresight_path *path, enum cs_mode mode,
 			 * that need disabling. Disabling the path here
 			 * would mean we could disrupt an existing session.
 			 */
-			if (ret)
+			if (ret) {
+				coresight_disable_helpers(csdev, path);
 				goto out;
+			}
 			break;
 		case CORESIGHT_DEV_TYPE_SOURCE:
 			/* sources are enabled from either sysFS or Perf */
@@ -497,16 +499,19 @@ int coresight_enable_path(struct coresight_path *path, enum cs_mode mode,
 			child = list_next_entry(nd, link)->csdev;
 			ret = coresight_enable_link(csdev, parent, child, source);
 			if (ret)
-				goto err;
+				goto err_disable_helpers;
 			break;
 		default:
-			goto err;
+			ret = -EINVAL;
+			goto err_disable_helpers;
 		}
 	}
 
 out:
 	return ret;
-err:
+err_disable_helpers:
+	coresight_disable_helpers(csdev, path);
+err_disable_path:
 	coresight_disable_path_from(path, nd);
 	goto out;
 }
-- 
2.49.0.967.g6a0df3ecc3-goog

