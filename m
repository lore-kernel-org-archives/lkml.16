Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DA742BDC35
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 18:40:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750704042; cv=none; b=FfMSDDOArdOUxhSf1AEh7uon/ZEYIhVuqjUxE2w6pPaQrMuQWD46B9UmtqgmT5LhiJbAwNPLU2Oa/ggB8RLaajTEx2tghnQt2Wc1ySNczkiBGPHjK1HNkz4zdaeBVReGlnrtk+a5NG6PZNJE89v9UzX/jXyaGaNEz6zW4sU5SxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750704042; c=relaxed/simple;
	bh=h387iw6lrE27m64daAX9Nw6jBAPHtTAhW2ZW2hOkTVc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=InOZpHfqjMvjElF58szrJLt6/Dk8F6cOgxxhEzERAl3eoTApHQAcQ0rxFZQGSNm03Fub4rmGArQ3B81QAsAUCCoOepseQmIJewjdGEeZzeT4sH6lIBdDe+fU2fD6jPRyaoh/e5PUqGF+TmUnImg2vqZhZ4b8qPvDteR+j/Druo0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HTbBnePm; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HTbBnePm"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-553be4d2fbfso4513756e87.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 11:40:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750704039; x=1751308839; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sFG9IxypmlJ3SQaxdodVvHUqxV7JKyHaU0cTD9oY6hU=;
        b=HTbBnePm6eJFgkM0lS/u/Ibrd+OtUqdGJSKjgK0skyoxX91SIBD+S2fOXe5BjaRsmB
         L8FeigAdS98Cf4z8QHTCNmF23DVQnNkL0ffxrRxadtiTVFchq5QrZ9raGMBK0trFu7xx
         Gr6IhhKUeFkqKtVt44Y57MgVuvgNe0Jgryxm/RnajUnTItW7oFBaGGVIs3CBiE+sUjaG
         I6qTS8zmxTXd7KKmzrdmwR6Zk9p+lzF6Xvx2LrkCdoUZtcCGL5h2ugMv6pLWxzUrgLEw
         iywRBuB3nnKy++7+oJ0SGY868kb/vYDbIMiZET7iSg3vru5gH3LgoWW8XJLcAXtMDndu
         MM2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750704039; x=1751308839;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sFG9IxypmlJ3SQaxdodVvHUqxV7JKyHaU0cTD9oY6hU=;
        b=VTc8qW5XYCclABpmcZH7X2Vfi/EmWzMm0FOwqEYmj+30F/aII2k7MTGnFHw4zL40OR
         uaxE/1Xck04/V71iJFbBVfSaZgqQ8rwkrT36ivUgAKT+UzF8l5W5eFGXO+OK/3e8pevI
         0LlAtDxdLSL7dxbUj3MQlgkxlgE1XeYQbugq1OjyZYz8d9E/UX6oCmhfHdVHmprdCqq8
         gO5oCuCW0Hb2j+8XCCO2h6662CJczpyQpgeaknrngORP6C8t73UPGaiP7QRNHSKKp4z7
         lEG0BOAO/DswZqOYEjda3tUqUqOLK4haT28UuoAhy6O45c8bETOBA1N2n7ao8PQOz+zc
         HqVA==
X-Forwarded-Encrypted: i=1; AJvYcCV5zAadSuwpiM0m+O9znymlQTzpKje/btehtTmagjyKV44F/VbHTCb26mmAr5PzStsZWS1VLbfGVHAXPJg=@vger.kernel.org
X-Gm-Message-State: AOJu0YyZgb+hsp0rd3Ssjp2EOuihPUhF+TKslcfD6jG5cwdQvgjrog8c
	8HLTmnuZH4ihJzYMQazVuI/Y4GQwanFkgKprz8XO6787yrTaFwBiPBUX
X-Gm-Gg: ASbGncvS3LvGVoYRMs74ZsLuHEyKqTACoa8JsvTpAqw9S7UiZajul3DV439AWbs/Xn+
	C1sog8YZQm4JwA2pTXE5nKai2+bIdYXx6SkIuDsWuSpX4FYQi/kiceRiKLeg7O44XD2h6Unyvo1
	pPm1kUWvhTWH1t8YTWWiy7oK4IAfAhUfG+/tc7eVNZIVDTkeSGHXX2Rw6alb5J3wiynmCp4G8a0
	pwlGo9tZxbv/3aHqfYX2F0Wux32U8/Iznf/Aw075yya6k43BifI7Jd/kHZXL4egBjTrJd1thsh5
	LUH/sZOQUoedLYP2ESAlbVt1WfFql3JSUMm/gyp7kpQxiBlHzp0MaG2CjX9cX5QlCAn3
X-Google-Smtp-Source: AGHT+IEfOYIWrO2ta6dUeoA8spqQLb6ATNX/Yh9Gp6X1sbe3Z0YWyzkeU5lr+qM8DXvD9za49y/lrg==
X-Received: by 2002:a05:6512:1285:b0:553:2e59:a104 with SMTP id 2adb3069b0e04-553e3bfc3f9mr4441366e87.37.1750704038761;
        Mon, 23 Jun 2025 11:40:38 -0700 (PDT)
Received: from pc638.lan ([2001:9b1:d5a0:a500:2d8:61ff:fec9:d743])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553e41bc2e3sm1500330e87.131.2025.06.23.11.40.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 11:40:38 -0700 (PDT)
From: "Uladzislau Rezki (Sony)" <urezki@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-mm@kvack.org,
	LKML <linux-kernel@vger.kernel.org>,
	Baoquan He <bhe@redhat.com>,
	Uladzislau Rezki <urezki@gmail.com>,
	Harry Yoo <harry.yoo@oracle.com>,
	Suren Baghdasaryan <surenb@google.com>,
	David Wang <00107082@163.com>
Subject: [PATCH 2/2] lib/test_vmalloc.c: Restrict default test mask to avoid test warnings
Date: Mon, 23 Jun 2025 20:40:35 +0200
Message-Id: <20250623184035.581229-2-urezki@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250623184035.581229-1-urezki@gmail.com>
References: <20250623184035.581229-1-urezki@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When the vmalloc test is built into the kernel, it runs automatically
during the boot. The current-default "run_test_mask" includes all test
cases, including those which are designed to fail and which trigger
kernel warnings.

These kernel splats can be misinterpreted as actual kernel bugs, leading
to false alarms and unnecessary reports.

To address this, limit the default test mask to only the first few tests
which are expected to pass cleanly. These tests are safe and should not
generate any warnings unless there is a real bug.

Users who wish to explicitly run specific test cases have to pass the
run_test_mask as a boot parameter or at module load time.

Cc: Harry Yoo <harry.yoo@oracle.com>
Cc: Suren Baghdasaryan <surenb@google.com>
Cc: David Wang <00107082@163.com>
Signed-off-by: Uladzislau Rezki (Sony) <urezki@gmail.com>
---
 lib/test_vmalloc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/test_vmalloc.c b/lib/test_vmalloc.c
index 7264781750c96..c1966cf72ab89 100644
--- a/lib/test_vmalloc.c
+++ b/lib/test_vmalloc.c
@@ -41,7 +41,7 @@ __param(int, nr_pages, 0,
 __param(bool, use_huge, false,
 	"Use vmalloc_huge in fix_size_alloc_test");
 
-__param(int, run_test_mask, INT_MAX,
+__param(int, run_test_mask, 7,
 	"Set tests specified in the mask.\n\n"
 		"\t\tid: 1,    name: fix_size_alloc_test\n"
 		"\t\tid: 2,    name: full_fit_alloc_test\n"
-- 
2.39.5

