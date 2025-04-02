Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DD583594C
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 01:19:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743556789; cv=none; b=r/36+0dvL3D80PW3OMtw5vdzVf7tJOXgojf6fUUi+tKXYRiXyYxfF0y3UIcp/BBZbGDS5ZuYAR0XK79qb3XRLTdTWCoS1hQl6TWTdFqBz0TWqrYIFpJZlTb/xx3RV97X2gwoLPDD9eQgnuRq5kMrsViWUHEK49Qx9qIKb5uH5aw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743556789; c=relaxed/simple;
	bh=RLEiu2FiIeEhO0Opk+ML0A3mhqOEQouObnMPzTgCjTI=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Ykj45FnrXpdWvtKPXGtNn69Y7dpvA4uI53DNyR2hJ5+Va8USXSA2y3zVrfLymCJ9E4rfkSjZngp7HGWCBecDGQUxtop+tCJKkIJe9HMFpVzw9xWBE36JMGIKXzNOAezhaBiILQq4D6T6PSdXTsdF3nEgtk32tieNM1kEuZQb578=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--yabinc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=af4CLlBD; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--yabinc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="af4CLlBD"
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-2ff798e8c3bso10193137a91.2
        for <linux-kernel@vger.kernel.org>; Tue, 01 Apr 2025 18:19:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743556787; x=1744161587; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=pSlxqnwG66RpI4NydmFyMljcKVBEXuzMCiirmmrdybk=;
        b=af4CLlBDahzMpVzh4C07h3uMlr+A0G/lAlfiOzNOyXoXc7tuw33i/9Ni4qhTj3/QCN
         aRD5xajP/egS9UtDraAEBu+WBgfrAZuSzybQP+MXf1j/FMtioIK9rdSg6SDU/yv9IjCH
         MC8yYN5LESOHyuWPeeghZYycNLfG0cu95OqTqmSStIzqjXuKvsqD0o/OX7fzb1+Yscyy
         GvJ5K1XCe+xiaph0xRfCZ+fZ9dX88uVVhMgnSYNHo/kvk0K/GnHGC1syLPUXg3MZ2WQT
         sO+BrdpULkpedn7eNnHsvubXhOPQfeqiZfLmQU3NkEDyywhjWzQbpspHe6fiIggjkEvP
         uzIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743556787; x=1744161587;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pSlxqnwG66RpI4NydmFyMljcKVBEXuzMCiirmmrdybk=;
        b=fp/W5TUzHxv6w1/SGJ9ymPMnBvmPyQM7Rgc2RaCisjgc1JrrrxMZ0/2nqWr7J1tM90
         nTdaELhOFDGUx/MGVCmMbupT4+ZC3Y29n+skCrmABVgXxKXps+DiUNxf7+4ZZwnYMifp
         9raI++dpZn/FYAvp1aM0IF1qhiiy50omvpu44/HCqwBlC5bqRwIdfOS6llRuo5BjGjul
         6TK1yV4DATZaMalUZEr6Piepq6A8OF9AZMwy8WjtrGjc9uHFi4e2BocT+rt+ewccl8aC
         Z5iM3pkUtgLvXoW0lQ1RMudeW4v0mKCNx90+8IGAmpx55kx4Qs3iSoQ0jHtbfTesYoJ+
         wCaA==
X-Forwarded-Encrypted: i=1; AJvYcCVG/PBiiafQ9J4dCQ36NSFyFEeDvSR5yPHRX4MYf9p8M3E9YARal+z6pRKhpQFmS0dsQI5SYLlk3KYlvhY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6XAzr69k676hwBFzjYxDOpUIM/FwIy86MnNTIpmv36VZ9RMg5
	MRDkIGaj9y0+lJr9CZRq7VeZj11E0BEWMifxXpXLbyrjD+s88zL0hMLr7/pN6KtvdPag6lVzIqf
	T
X-Google-Smtp-Source: AGHT+IHJEWX5SyKsMBVrfD11mTlu3gj1TMgPFW597EbBGHguuUgIjtgGC2kPgrrqDa/yLFsO+hpRhNIFFa8=
X-Received: from pgax9.prod.google.com ([2002:a05:6a02:2e49:b0:af3:da1d:452])
 (user=yabinc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:3a8a:b0:1f5:520d:fb93
 with SMTP id adf61e73a8af0-2009f639283mr27306581637.24.1743556787109; Tue, 01
 Apr 2025 18:19:47 -0700 (PDT)
Date: Tue,  1 Apr 2025 18:18:32 -0700
In-Reply-To: <20250402011832.2970072-1-yabinc@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250402011832.2970072-1-yabinc@google.com>
X-Mailer: git-send-email 2.49.0.472.ge94155a9ec-goog
Message-ID: <20250402011832.2970072-4-yabinc@google.com>
Subject: [PATCH v2 3/3] coresight: core: Disable helpers for devices that fail
 to enable
From: Yabin Cui <yabinc@google.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@linaro.org>, 
	James Clark <james.clark@linaro.org>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Yabin Cui <yabinc@google.com>
Content-Type: text/plain; charset="UTF-8"

When enabling a SINK or LINK type coresight device fails, the
associated helpers should be disabled.

Signed-off-by: Yabin Cui <yabinc@google.com>
Suggested-by: Suzuki K Poulose <suzuki.poulose@arm.com>
---
 drivers/hwtracing/coresight/coresight-core.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
index fb43ef6a3b1f..e3270d9b46c9 100644
--- a/drivers/hwtracing/coresight/coresight-core.c
+++ b/drivers/hwtracing/coresight/coresight-core.c
@@ -465,7 +465,7 @@ int coresight_enable_path(struct coresight_path *path, enum cs_mode mode,
 		/* Enable all helpers adjacent to the path first */
 		ret = coresight_enable_helpers(csdev, mode, path);
 		if (ret)
-			goto err;
+			goto err_helper;
 		/*
 		 * ETF devices are tricky... They can be a link or a sink,
 		 * depending on how they are configured.  If an ETF has been
@@ -480,14 +480,8 @@ int coresight_enable_path(struct coresight_path *path, enum cs_mode mode,
 		switch (type) {
 		case CORESIGHT_DEV_TYPE_SINK:
 			ret = coresight_enable_sink(csdev, mode, sink_data);
-			/*
-			 * Sink is the first component turned on. If we
-			 * failed to enable the sink, there are no components
-			 * that need disabling. Disabling the path here
-			 * would mean we could disrupt an existing session.
-			 */
 			if (ret)
-				goto out;
+				goto err;
 			break;
 		case CORESIGHT_DEV_TYPE_SOURCE:
 			/* sources are enabled from either sysFS or Perf */
@@ -507,6 +501,8 @@ int coresight_enable_path(struct coresight_path *path, enum cs_mode mode,
 out:
 	return ret;
 err:
+	coresight_disable_helpers(csdev);
+err_helper:
 	coresight_disable_path_from(path, nd);
 	goto out;
 }
-- 
2.49.0.472.ge94155a9ec-goog

