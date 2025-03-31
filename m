Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E62A215771
	for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 23:00:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743462046; cv=none; b=Drmm/nmHuhtEU7tjZaKZPqW/tuuxYx3aqTkJVSZyds9zJcsyE1NsD9DjD4DfhwFqv/x7iyOHGZsjbT5O9rc+AbXvP6bNbldsPfvvJfSfpH6tB84xRtL/JKOlm3i9yzhfzDTO83pM+tXurBN4+ydrPq3Naza/s0RaJpsIvE3DuQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743462046; c=relaxed/simple;
	bh=Uu5UFR8h9rKzKbaED46JCrLLvQ/YDhWURODmFEk87y4=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=oAe6FEEuNBwfOF8YBtfeyNIQXlLOvQzrd036boRPw6WF6JOfAz7Rz0TON1Ubh4V1tzJ0NKYC/L2wcM+dEALd1MjOJ54lRb/FgkDYzvG7JRBQRJCZ8icS+BY/jyLqmVUzcWg02s1rjLhmCi1y2PqLSVGij1fKhbyueBn6u4F5rOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--willmcvicker.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ktdm0Xxj; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--willmcvicker.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ktdm0Xxj"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-2ff68033070so8146834a91.2
        for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 16:00:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743462044; x=1744066844; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=2A1KKKyyzdpcSVMQiU3dhTgCCmATcVgptXdxBkHBo5A=;
        b=ktdm0Xxjp2YKHoQi9Gid4FqV1MiNaEfq3bVf5nHAAq/lYxgMxMHTtTFqwk6/1CJA4W
         SLKMccWGh3vB28tLsq4+a5M9fgy4eLEa+PtSIuMNNtP+3klAnJ8enMiuVo9onr1CPxsO
         blEJETMl7nhuXnmvsI5aCd9hNDILShU1nGz/N89ZfS3gx6xFoJnDhyYJm582GJV/Yhfr
         GQtLtlGZ5kiy1+sxi0zt0ZWUHHDRUAT8t2D9vyGa70aYtx8VJPEI3pq2Eo64mf9dCwX4
         M6+1nVGd8Ayzk3M/++1X14BxU+jEG7o1HsPIxOXsmOBkFvlFFyuCSkBuRYY6hpR799OW
         RE7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743462044; x=1744066844;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2A1KKKyyzdpcSVMQiU3dhTgCCmATcVgptXdxBkHBo5A=;
        b=c9XRXLyZHVPEaFrVWcGC4bsmLFwhLhKUTtzt4N4Wd5XcifkQISuatSg1vVq/Lrajzh
         H6AulwGI3ywZ4f6ksoi3Mic0lnASHBk955jc65H5au5fYlsUeDhChYZ8qtcm/Pk2mHOx
         Y4koWyrbscGCB3+kGqWcmS33iMXhiQ5L0sJPtvPCPAnpFydOju/hlCeWYAEQvs5LNpJq
         CDqTs3BChtAzat/5H1UvTZjr33HHWanZZYjBNzGYYPe9rlAuZNld2IwvB7dObzA/128I
         +n8gQiCWraKD9+Vtwit8sbL3rOUlAM8fEuImZODgWTi+v8gXbqnRhWtEsCe/hfPSiKxV
         pqzQ==
X-Forwarded-Encrypted: i=1; AJvYcCXFFFkd3YEHdjTXt6+6oy2NEdjFGw011SuC6ED0knsbAQ3kUv2DIYf3XW54V7V++3BxudfqzpFd7zRWTNM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxFMaXdrb+1ZWGKTzMDqiuWnXtbPzeWJwT68SnHFn6hoootDT05
	PHxgnxXdo6r4qV7irEcYPG48QakjUEOEFUEJM5LnLMEnYzTtnjopQlCbe146/jdSlB2JQQ4IXU8
	FLRADc2rYsL2PGVjplC7KqNNAIQ==
X-Google-Smtp-Source: AGHT+IG/ebJE2gKC/wqWBycsTxmqQFxHKcT+hLYLzDS5AFcHBpCYSXiF3vCmtkgKMTAKak4Gunic/DECRCqZWeNK0w8=
X-Received: from pjbso14.prod.google.com ([2002:a17:90b:1f8e:b0:2ff:84e6:b2bd])
 (user=willmcvicker job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90a:e187:b0:2fe:a8b1:7d8 with SMTP id 98e67ed59e1d1-30560949dc0mr1232407a91.25.1743462044603;
 Mon, 31 Mar 2025 16:00:44 -0700 (PDT)
Date: Mon, 31 Mar 2025 16:00:23 -0700
In-Reply-To: <20250331230034.806124-1-willmcvicker@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250331230034.806124-1-willmcvicker@google.com>
X-Mailer: git-send-email 2.49.0.472.ge94155a9ec-goog
Message-ID: <20250331230034.806124-2-willmcvicker@google.com>
Subject: [PATCH v1 1/6] of/irq: Export of_irq_count for modules
From: Will McVicker <willmcvicker@google.com>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Peter Griffin <peter.griffin@linaro.org>, 
	"=?UTF-8?q?Andr=C3=A9=20Draszik?=" <andre.draszik@linaro.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Saravana Kannan <saravanak@google.com>
Cc: Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Need to export `of_irq_count` in preparation for modularizing the Exynos
MCT driver which uses this API for setting up the timer IRQs.

Signed-off-by: Will McVicker <willmcvicker@google.com>
---
 drivers/of/irq.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/of/irq.c b/drivers/of/irq.c
index f8ad79b9b1c9..5adda1dac3cf 100644
--- a/drivers/of/irq.c
+++ b/drivers/of/irq.c
@@ -519,6 +519,7 @@ int of_irq_count(struct device_node *dev)
 
 	return nr;
 }
+EXPORT_SYMBOL_GPL(of_irq_count);
 
 /**
  * of_irq_to_resource_table - Fill in resource table with node's IRQ info
-- 
2.49.0.472.ge94155a9ec-goog

