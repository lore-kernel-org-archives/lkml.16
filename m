Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0231252904
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 19:59:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744142400; cv=none; b=mqPVfyPGSc2Ek10fLxnvIJ6kwxghue86cBsoD7Wl0Ha27zTS+9SJAdMpPpoZoZ5mpDO7a8jqpXhwacx/ANoJ3ojJ35Sikn/eumtwucbhzwyCnD1Zi5UOlacB0BreiXYAIw9F21cFm/fEa3piv/NTVVikjuqBbOCDXQOW0CrGNas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744142400; c=relaxed/simple;
	bh=3eKMst404MCWjVtSOpxFUSarhxkSczCeQNB0k+53r8U=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Vnb7fDfThD5haC4Tmvn4uTmD8v0qSbn1mJnhh7x2Dyuiikr9KNT2dcdmgX3pLTuLr+gvG/xe1HCGKTlQRbXXi+4wRSuP7K7YE7gB9yTjgk5vlDnVu7Eg/Al1sebXfOzkyL2sPzQq/4DG/4hpkwJM3KdsoEJeQfEpBAkxxm98HT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--yabinc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=s3H3mzi4; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--yabinc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="s3H3mzi4"
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-22406ee0243so44816365ad.3
        for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 12:59:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744142398; x=1744747198; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=q34M/yB/cQDsaQGLM78DLdQn24/bplv98nkSF+8rs08=;
        b=s3H3mzi41P/Y9FtMnX3wkSTYUUXr21hn6TvEP20Ss8e3lhyaygTT3utNTZrliLTxzC
         rrD69+/Gsie7KccZmcu6WI53+Vp9X5qdE28QDxEdwddalKmvuBdV/kfX1QCiQNGANLv4
         IkmISdU7EMq5bMS6XtqN7ELl7ND76E2SqQt0czbMPbUriSQHILi3PZR8jncWsfAFyhtc
         yIYMf2YbUsHtkZhAACEC7kAreg00y+ZWmRoG0THhpRRkrExzJorCpZP9mECQOLE0cyHl
         Ksn22TqoemUJd9XA+/CilhmZq7ERGJk9nctqfZvZDfVgxqg2RfIPLhBS54uD/noznMvk
         KqTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744142398; x=1744747198;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=q34M/yB/cQDsaQGLM78DLdQn24/bplv98nkSF+8rs08=;
        b=FA42Ak3FSBi1cw8oSquW/HdkT3Hn5AL6+xq2Y6dXOht24Erq+Bl+rUrGjk+AIsCqDH
         AwUjH5L35aiqIwgxIU6cU3TQnPWNUW39aI9GiMkDrqaFS3vx0X0DPjoAKZfDcVQMTWrT
         iE0NVsjSGkO3En9oFZ4TtDVA0gnZluQw7QBdTYffimG2HCAFz43Drm9qytn0CPz/PU8S
         guayGsP5AKge+Bd6GIgZU9C9d7JUifZ3XI09C+Ev8eFAGP5s2+WYZrZleYNHLUeUb1fU
         l61K39nLTmrHfaC2hMvmwNpHxvvIRBO8K5317aHxrWKdKPyLqe9TaHlndQBTgPEn8Pn3
         FRHg==
X-Forwarded-Encrypted: i=1; AJvYcCVtZ9hEnhAlrLY8HM+fvY2hzG9fVNOt0XON14HAcmN/2JK0kyivpeZRnEaDiCWvfCmMJbwdmP3vrOEsiCg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxre/qTgffaRLJpLoN0ecVFXGj4NcunI8sgeZSCNTq9ZAJlesTr
	j9zhnXewjWXdMkck2LsjAa2KnJl6jFjpmdU4c7o1UrZ2MUzOnSVrw3YtN+XCJnKILo3FFm/J9pg
	Q
X-Google-Smtp-Source: AGHT+IGNR5b/BrzCv+igEUSxJYcjHRcZBXMY8xbV6NXow+K+OzxccVFEs8fcuddoHlcYKYCwVdfk4FJMh9g=
X-Received: from plqt8.prod.google.com ([2002:a17:902:a5c8:b0:220:d79f:a9bd])
 (user=yabinc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:1450:b0:223:53fb:e1dd
 with SMTP id d9443c01a7336-22ac3f2f26dmr387475ad.9.1744142398107; Tue, 08 Apr
 2025 12:59:58 -0700 (PDT)
Date: Tue,  8 Apr 2025 12:59:22 -0700
In-Reply-To: <20250408195922.770377-1-yabinc@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250408195922.770377-1-yabinc@google.com>
X-Mailer: git-send-email 2.49.0.504.g3bcea36a83-goog
Message-ID: <20250408195922.770377-3-yabinc@google.com>
Subject: [PATCH v3 2/2] coresight: core: Disable helpers for devices that fail
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
 drivers/hwtracing/coresight/coresight-core.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
index fb43ef6a3b1f..a56ba9087538 100644
--- a/drivers/hwtracing/coresight/coresight-core.c
+++ b/drivers/hwtracing/coresight/coresight-core.c
@@ -486,8 +486,10 @@ int coresight_enable_path(struct coresight_path *path, enum cs_mode mode,
 			 * that need disabling. Disabling the path here
 			 * would mean we could disrupt an existing session.
 			 */
-			if (ret)
+			if (ret) {
+				coresight_disable_helpers(csdev);
 				goto out;
+			}
 			break;
 		case CORESIGHT_DEV_TYPE_SOURCE:
 			/* sources are enabled from either sysFS or Perf */
@@ -496,10 +498,13 @@ int coresight_enable_path(struct coresight_path *path, enum cs_mode mode,
 			parent = list_prev_entry(nd, link)->csdev;
 			child = list_next_entry(nd, link)->csdev;
 			ret = coresight_enable_link(csdev, parent, child, source);
-			if (ret)
+			if (ret) {
+				coresight_disable_helpers(csdev);
 				goto err;
+			}
 			break;
 		default:
+			coresight_disable_helpers(csdev);
 			goto err;
 		}
 	}
-- 
2.49.0.504.g3bcea36a83-goog

