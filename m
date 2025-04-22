Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69C5B281367
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 11:32:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745321555; cv=none; b=awLdFts70IuUHtmXmlxqbqICsPFYUlwiodZ46P5CNLNwetiQxUiUDjbXwnjfFA+xC+xO2m5NMfto0OJHTxBA+TiAO0gn5rgiVedzAKgSCmCWJuGcHucsUN4JOGycKf6/erzC6sezJoMxGqZt1uID4016EDxbfNKtRQBIdo4UF7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745321555; c=relaxed/simple;
	bh=gQDPkvVC9lqTB+MV6UQ/E8pyhNViS1oHACaHEDpFvWc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=smW96iKRvUkTFBiBaYDCNozayGihd/pUoQFDnPUycU4pGGTrUh6dFRYww0IFdm8xTI1ckkQgYuCPLcu5XpdgiA2vwtHvfUh1ktvLd1O05LjG1G5GewQrSIc8HWE0MMos3bpKxFuEZfWAb5/Idp3hIWVXEfnrJzw6RqDgRCGeIdI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=npo8pfQ/; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="npo8pfQ/"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-43d07ca6a80so24402605e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 04:32:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745321552; x=1745926352; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=23OVpoYPLggoCGZU9vcl/htrC1VpcPls14v+en9CHkc=;
        b=npo8pfQ/zHqEXqoElK8IzGujkMjXdAmaiWGEv/J7NlandjQOd7d5ToEPPENGkVjh6z
         R1NC9RREg2iHvJ6BlYuQQLTULaGvldmtura/n+IFky0hGqbrjlrIMUo/96iGsHenMYNO
         16vM45CRoxVHlM57mT3u+ILTxtoQRIWYAs6vlFzRMDe/cR4ny3haR1HL5XSSsNEcqGI4
         zdp43GlzNqmDtijqQ6/nwIm6f+aNjcsrpUJ5lWS9c6nBqqcaV33JDySqUJ3bQQPXCGWN
         TtIZHW69Q3ZNVSbn5we0Z9rFLQXgk7ETbmXADQ9MkqYfcQXvFmr1MUs9MZSuqXCvkLfd
         C8pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745321552; x=1745926352;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=23OVpoYPLggoCGZU9vcl/htrC1VpcPls14v+en9CHkc=;
        b=EDXNR2u5IXnmA2RDMgwbcdbx7lbypmpElOKXjrrtsLWf5Q9S/33Lp0TP3Nm4GL7QGR
         6x70pyLBt0sA22OEUxSKAc8JxVIjKHAifHhcub3bkJsUyAVg5OaWtool1PL52xi256QY
         RozJuWhzGYLo8cMaBABKxXtDPRLhCeJ9WgTlC4h1VR4grSmaG/PYlJYbSyXwUcDmHXnc
         zWuc2fOEA2iSRWR9ZMCyFKfeTm/5L2CNT6p48w8z0AAn6tOY3lvK5RkTYF+ZedJKKsAn
         WPx72viQVaACOJv18F8sLN9uK3sfAWCa3dWtZBzllYJwBazU3fcWDVPbhh2oNFV3V51k
         F1KQ==
X-Gm-Message-State: AOJu0Yx0c5YTq0LMVBFa0SR+NoWbmXPpnbI/nfvRk7kenn3jEhjZf/S9
	q75N+vnkgg6iXI+5jATqDGm6VlbKeibdZeBo8ykXqhHNSLy13Ota67+Dvsqct3kQ7KUUlmKTgWH
	y
X-Gm-Gg: ASbGncvIoznHkFFRlhyTw7xogw4n8Pa98vrCDMMR5Egj5B7va5T4Pn+JFC3tZQ2cqM1
	nlBTW8Qq3c2CN4QYNNvtkHwOJSmj2jAcCjMshnZPou41ymCVCpRbPSQwSokC+81Uhu3KgsgzPFZ
	gCNA8Nu16Gx6mThsFJLAVixAVBbtzRUEJl1c7xtRPI6mQgMERpYx7Stc8nKHl7Oj7R2g6yjgafA
	Pr984m40tSxciA/w8qiYoVUrEZFOww8G8gOhSf4PRXWGAfKx/AokLjIsFI5lmDSe2kz9MtFxGhR
	tapw3AgavguKL83b8Kt3xp3we8qr/SS7DzI/9w+OSykE4kJ//MCR
X-Google-Smtp-Source: AGHT+IEtVC5/hLkXP7uFg7Zmm5Mq0Mlz2uLSiQFUOQWsm32IsnbnTjBX5PadrzYjNG2TCCeAvltguQ==
X-Received: by 2002:a05:600c:1ca8:b0:440:6a79:6df0 with SMTP id 5b1f17b1804b1-4406abf94afmr91474835e9.22.1745321551609;
        Tue, 22 Apr 2025 04:32:31 -0700 (PDT)
Received: from eugen-station.. ([2a02:2f0a:131e:0:1820:da87:73b1:d80c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39efa49312fsm14907887f8f.70.2025.04.22.04.32.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 04:32:31 -0700 (PDT)
From: Eugen Hristev <eugen.hristev@linaro.org>
To: linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	andersson@kernel.org
Cc: linux-doc@vger.kernel.org,
	corbet@lwn.net,
	tglx@linutronix.de,
	mingo@redhat.com,
	rostedt@goodmis.org,
	john.ogness@linutronix.de,
	senozhatsky@chromium.org,
	pmladek@suse.com,
	peterz@infradead.org,
	mojha@qti.qualcomm.com,
	linux-arm-kernel@lists.infradead.org,
	vincent.guittot@linaro.org,
	konradybcio@kernel.org,
	dietmar.eggemann@arm.com,
	juri.lelli@redhat.com,
	eugen.hristev@linaro.org
Subject: [RFC][PATCH 14/14] kmemdump: coreimage: add sched registration
Date: Tue, 22 Apr 2025 14:31:56 +0300
Message-ID: <20250422113156.575971-15-eugen.hristev@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250422113156.575971-1-eugen.hristev@linaro.org>
References: <20250422113156.575971-1-eugen.hristev@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Register sched info into kmemdump coreimage

Signed-off-by: Eugen Hristev <eugen.hristev@linaro.org>
---
 drivers/debug/kmemdump_coreimage.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/debug/kmemdump_coreimage.c b/drivers/debug/kmemdump_coreimage.c
index 7f3b089b5739..2be396ca0495 100644
--- a/drivers/debug/kmemdump_coreimage.c
+++ b/drivers/debug/kmemdump_coreimage.c
@@ -78,6 +78,7 @@ void register_coreinfo(void)
 	kmsg_kmemdump_register();
 	irq_kmemdump_register();
 	panic_kmemdump_register();
+	sched_kmemdump_register();
 }
 
 static struct elf_phdr *elf_phdr_entry_addr(struct elfhdr *ehdr, int idx)
-- 
2.43.0

