Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B654281344
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 10:52:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744282341; cv=none; b=r+b/fi5I60n6+UEgyWR4E2T6yJj2UyW5M+hPNdPb42qo59uQglgZ3erJcc+0H7SR26fjk4reMuDMlRxEUm2ZzuJFyqp9RtTHYsM0U6tYxhXfRpnBNr9/6RTGTzCcmbOwBu5bYBjp1dZ0k5fC21a1zpy9eELtqbnBLvCgxzShpRY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744282341; c=relaxed/simple;
	bh=1jL98FxzSf4s5tHDEZgWQVWhqUhDWULIaZUepIR7WWQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lvRdWvF/zwRbgHIFizcTaFxdWrEpELESHOIEnrSE63mpXR+XELio4gXBkJDd3LHcH2W3E/xGeZ/a/XYYGA/3bOJOQ4kxluz4GhRkNkKSVHkjDJmwNK+x1KkW/hoRoyi9UvxhbWdS8G9IdzZLeAFz0NlEFtEEdyYgKoQClYIR5Ws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CvabugO/; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CvabugO/"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-af579e46b5dso514903a12.3
        for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 03:52:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744282339; x=1744887139; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LFjJEsl0KPwTjl343CDDvY9GIcYnXS0XMMT/i0ap3iE=;
        b=CvabugO/HoviUSL0iwuv4yVi5L1mJdSGCSGBX7L6Cyc9QhI/R5WDXZMSgxhjM4KDHO
         W3P2dtxRu8J5cRcJH2rzQk1ECl6KVkV1KFnTfcjbqFqSQCYhn0Wljs9eeJncKEopt1Ty
         yEeIe7ml1lfmY7vp5nlW3LBa4U1/Rgrgk2AVWu0/jzNxFutd+SYSy5iWot6rg86NOkmC
         8bjN85kABuCl636adgO2AVaiDe1U6I7nybURDWhPrZqOU25AqWPpYFW2RDlHmPzcyXk2
         hLJdDlCBXglXyQAdpnjV9O1UhoHOFOONiPWJTPdShKy3K9RI9bajWUMqKMdibxUUjKHT
         t9Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744282339; x=1744887139;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LFjJEsl0KPwTjl343CDDvY9GIcYnXS0XMMT/i0ap3iE=;
        b=LhjWGhHC/+d8Pg2NKzndZwhfnb2eRr3pEjX/m6oTzuix/6QMa4kFAV6wu8KrBixIgl
         OkaoCUUrimaDJKPbXUnIM5yB2FwK8xQv3iUMRqF72V+Q7rHLbuqgx4Y0w4tp3QPiMIXo
         KoZo6Xz7XSFoFwkgyAbUrxv7SURl4VsUt37dIJXmPWaNZgQrZ52vifgkCstcMvURV0i4
         mf7TBhyblBd8xzhxRTfss47BDNLbEGWEFpjB8r5hEpiybTLj500cJrQvVJk6w1W+Wvp6
         vBhzYsxA2l//EbrYKFg+bz7GEj7twCVR/h3XHoRL6UrlMhpEYZT0BwgAT2VJLO30aRZz
         JzOQ==
X-Gm-Message-State: AOJu0YxcdrBsV7RoyzYwquACanq5iT5D1iMQhLcQf8WvaEnthHDwAJct
	dpP1Do3nKwRMFqB0mfBbwxs6sdnv+trj1qR3/PKjd5nIMT6MkJQ+vsi5MP1jxgIqoA==
X-Gm-Gg: ASbGnctVjbmwL6kB8PDkyz98jLEZAVCiqdsjgNpcC7gS+4LnOg2puKkM8nMj1iN1KaG
	WWhrxdg1FPxsELMIL3uqLsVdQgUVpmNUSzXbRj4FF80lSrvKK/I9f1bycMBq6hgEpze1omlhJNv
	jhksh7bEQjllh+CGMpvdcshTWHKoX9mNn2pMRa+iNFMkKS7SLfn4MtLFkvW1r5lcyn3Ep4vtcJo
	92l+HrRsAyk7ZmXqDfw4uId4T9YRGmctQt+8uwQ50Da27zHaqPFseyYL7sWmE9fC7eE+cLigVvh
	i5bwbTZiWvbT+Y5S+ZtRBfjHTfs3OLSZ075HuoWrup5ACQnEJSdTpidPhjf7PYVTm35K7YgeKds
	3mwG3Mw==
X-Google-Smtp-Source: AGHT+IG7zOSlcJqePm3JnMECI3YLLUHsnDD0zhMw+P4vDzQjOkFRq6ETsmdoaORwjWeHynHpZfAkvA==
X-Received: by 2002:a05:6a21:6d81:b0:1f5:706b:5410 with SMTP id adf61e73a8af0-2016ce19a25mr2571669637.38.1744282338696;
        Thu, 10 Apr 2025 03:52:18 -0700 (PDT)
Received: from ubuntu24.. (36-225-108-143.dynamic-ip.hinet.net. [36.225.108.143])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b02a11d2c1dsm2665568a12.38.2025.04.10.03.52.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 03:52:18 -0700 (PDT)
From: Cheng-Yang Chou <yphbchou0911@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: tglx@linutronix.de,
	corbet@lwn.net,
	jserv@ccns.ncku.edu.tw,
	mingo@elte.hu,
	peterz@infradead.org,
	Cheng-Yang Chou <yphbchou0911@gmail.com>
Subject: [PATCH v2] genirq: Fix typo in IRQ_NOTCONNECTED comment
Date: Thu, 10 Apr 2025 18:51:43 +0800
Message-ID: <20250410105144.214849-1-yphbchou0911@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <87bjt4tnjz.ffs@tglx>
References: <87bjt4tnjz.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix a minor typo in the comment for IRQ_NOTCONNECTED definition:
"distingiush" is corrected to "distinguish".

Signed-off-by: Cheng-Yang Chou <yphbchou0911@gmail.com>
---
 include/linux/interrupt.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/interrupt.h b/include/linux/interrupt.h
index c782a74d2a30..51b6484c0493 100644
--- a/include/linux/interrupt.h
+++ b/include/linux/interrupt.h
@@ -140,7 +140,7 @@ extern irqreturn_t no_action(int cpl, void *dev_id);
 /*
  * If a (PCI) device interrupt is not connected we set dev->irq to
  * IRQ_NOTCONNECTED. This causes request_irq() to fail with -ENOTCONN, so we
- * can distingiush that case from other error returns.
+ * can distinguish that case from other error returns.
  *
  * 0x80000000 is guaranteed to be outside the available range of interrupts
  * and easy to distinguish from other possible incorrect values.

base-commit: 92b71befc349587d58fdbbe6cdd68fb67f4933a8
-- 
2.43.0

