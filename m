Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE6E3230BF5
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 18:47:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744742824; cv=none; b=tPjxl4zVj+EvyXn2IUrxJsI7Q0t4eMliR0z+s3T0EAr+LikMKBcZ1TEGs+okhmCW/QDgWqPZMRxSRi2DDg5EQU26EjEvephM2F0wDdRCtjqnhZVdhQ6Qu7VsG1gI2QWxmOJvmQwaI8alqb9mdweEUa/LgbtClXJC79of8JEpc6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744742824; c=relaxed/simple;
	bh=OU+xASx9DV5Tg9l46em3oZZnzIkD12NST2/O9VLP39I=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=NGm+L13tXZHi4l0qTpukOibdHrjbZqPL7ih7IpyqeapcGZc6icQueFDTVowBPbwpe9EoGqxDJeOCqbj9vcyKRdyPSy8fO5zHrPoznCbAMyCaAmNazK/GhX7LWBivoVGX81U5WQSBI5zojS5NBDgVcC5YWBPmuz3Ltqpb3sFE30o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--yabinc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=lTiVHIdm; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--yabinc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="lTiVHIdm"
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-227ed471999so51569485ad.3
        for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 11:47:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744742822; x=1745347622; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=vrce6Ur/Z1bBcoSkzpW7fAIgWwmrsZNhT8/LajKfaJQ=;
        b=lTiVHIdmBahsZHGhBXy06sl33g+L4M2OzdCAOT8CJMZQlmQ5eS7xV6e+eyzAWV+Yo5
         ghI/6zXkhnA20Z0x2xPFPdxu15CiCvwx9UPaSwTMJIihG6llt7P4+p9tgYk8gBSQnEam
         lyZoIVfd9wLe7alsZ5YqDjBET6BVIIbOqOz9EMkOWT3RuhdJ+Lk5NDP2J6hMMENZYWGp
         kK22YnMQ3yDvgIsqWHI+04gu1TCO6KFIInweFGr09K8ZV4n7z1tflXmbcwyD2hc6YvVe
         OlP3fwAihxE1aGkk81Fd+HGYNbvhqm7tceXfk5QEacSDRFlo1d9MKvuMn7nk+Kl61S2r
         37/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744742822; x=1745347622;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vrce6Ur/Z1bBcoSkzpW7fAIgWwmrsZNhT8/LajKfaJQ=;
        b=JzXfXT0g2bXXj+mU5QVXOQL0XZBB6hBRHcd0oGWIADD1UQXYPMjiNs/mdnrEIsBAZS
         /OUceGbMdWeuOA3uvd3n8jmpzPSCk2qyYJVE7lowqVqPaBtMYeax/NCvYBPWn/nAklX2
         GUe3rqVEmhN0WzcqKpbR0AD0efii9vgySKLfe/dQTvNuhwm+ufJA+IV92wxSrc81KROB
         dFoRNaHqrE8maReJcmwGAv2ve/yNYBDlOZVQi+Z70ReqqerXAE9xAUhHFInQif1se2op
         PCfvbKYL7KXsVQsdS7jAvW2ygcYiWSsiprH2Hon48YaAQBGyjYzEpfZgna9h9wwr5CcL
         4MFQ==
X-Forwarded-Encrypted: i=1; AJvYcCWSKrJ0ZOKc5WwXxZO7jBV9ZvoyumcXKDBzxYUJu2Wj5VDw/ehhnmpPvA3W3ZTu9/AquF5hJRtb+AxwLNo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2D2iRZ5YPhyvz7cCAvj0yr/Ay7cn6UaLHuFTJXBOLDk9mTiSc
	NnVtkh5MAFwKh3dsHs9IOnhshN6s1Sg+KNODgOgYT8LO7XiHVK4XK4Z0AerKhtO38LWD86Nvzkz
	2
X-Google-Smtp-Source: AGHT+IG3fu0AcNyUIzJ/75A6XmoJKAgZCtU5+fN/L99HtW09ex7tvaGVLFa8UCS6eaNGUaRKbqlz0X7DUhU=
X-Received: from plcy20.prod.google.com ([2002:a17:903:114:b0:224:13ec:ae57])
 (user=yabinc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:eb8a:b0:219:e4b0:4286
 with SMTP id d9443c01a7336-22c319f77e6mr3968165ad.29.1744742822049; Tue, 15
 Apr 2025 11:47:02 -0700 (PDT)
Date: Tue, 15 Apr 2025 11:46:49 -0700
In-Reply-To: <20250415184649.356683-1-yabinc@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250415184649.356683-1-yabinc@google.com>
X-Mailer: git-send-email 2.49.0.604.gff1f9ca942-goog
Message-ID: <20250415184649.356683-3-yabinc@google.com>
Subject: [PATCH v4 2/2] coresight: core: Disable helpers for devices that fail
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
---
 drivers/hwtracing/coresight/coresight-core.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
index fb43ef6a3b1f..d9fcea69d221 100644
--- a/drivers/hwtracing/coresight/coresight-core.c
+++ b/drivers/hwtracing/coresight/coresight-core.c
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
@@ -497,15 +499,17 @@ int coresight_enable_path(struct coresight_path *path, enum cs_mode mode,
 			child = list_next_entry(nd, link)->csdev;
 			ret = coresight_enable_link(csdev, parent, child, source);
 			if (ret)
-				goto err;
+				goto err_disable_helpers;
 			break;
 		default:
-			goto err;
+			goto err_disable_helpers;
 		}
 	}
 
 out:
 	return ret;
+err_disable_helpers:
+	coresight_disable_helpers(csdev, path);
 err:
 	coresight_disable_path_from(path, nd);
 	goto out;
-- 
2.49.0.604.gff1f9ca942-goog

