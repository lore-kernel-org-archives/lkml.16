Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0FBF2D1300
	for <linux-kernel@vger.kernel.org>; Sat, 14 Jun 2025 13:35:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749908142; cv=none; b=SE+8WeVDuJ7buY44fTykwKEJ8CZZ19sey9/G5VoQbufS+GfQg6J3qWli5sY9Hu2nQVuTC2E5xvnst61tnr2ZOJvcRGkyCnGLjXq3arDP424V3obEm0D2IUjXQYG1CtORKWzE7PtwehGjE9Wq472+Tn7zRM16tvi/kkGO9p89Uk4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749908142; c=relaxed/simple;
	bh=ief3h/sg+mxb+Pdl2USdDtIgmVqm5z8oRWkFEFM/fXA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PRiE2IWsC5NuZbvP5xtWYjaRZseQ4xiBOi2OGbQADB1HcJWI+LbDCeDIkXDTrQpCNCJGI9CQ1faVvPH6b7zfxab2LDENJ457x8oDteoUM8gk4zak4MkparzygW3DyomIoTTdmJMolevsvL59d/QDOSSbJOS6zSlEdhdmXRT6DRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=S1itb4IO; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="S1itb4IO"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3a365a6804eso2028440f8f.3
        for <linux-kernel@vger.kernel.org>; Sat, 14 Jun 2025 06:35:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1749908139; x=1750512939; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6/Eh3gsyB8tvsdgcktgKPQePK4IVGGg1wQnBcWfjHbI=;
        b=S1itb4IO4pnoMIJjd/kmNmXxPayzDKweIhIpboaedPjYGsdpRGldMg6SBlz3PdtoJQ
         7qnknJuE+8XfE+QxsaLiycETn78rt1JEhIZTTEaGNdEq7X4W+77paHDJzewKOiQ9lQLY
         4ArRgmu+BW6vceGCvk6KTcQ5ExdEhmFNigNJkr+1BC6brtRdtPFi0gw4+SEB8ZvEVNC9
         EFMSat+8+1xqguargdZ4n3rSyhHdCmbVUT/ePi9mQoZT7jvHyh3oOFQc0HsSi97rRQz1
         aaDyUW4vvlztxSQ94C+Ow08fOSGG0sB/16j+VBW9wWnMLw+6Bx8G7QGAjmghTiCZgbQD
         9Bog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749908139; x=1750512939;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6/Eh3gsyB8tvsdgcktgKPQePK4IVGGg1wQnBcWfjHbI=;
        b=F4p/oRJPm9ElHsffNU05Qu6DK2CwQBcxH4J0EmGT+EvHdEdRD7DpNOhbZbcBlXxJ4W
         NUl6/8wHbb6CH2xFu0T5TWtq+lJ3O9RKowg1Wh8j5GMbrZ1o9aq9fXup69A5+dZaJWjC
         o4Tz2aprwMHrvaGmE8AZZTyfV1bSrNUOjtyqHx+aRTkmalCy7t7Ar2biEGBKV8ldG+mn
         zD0rIAJZRId+H+gutN/6RahXDv/cvbaQhTQM8JJopyNSFw1Rbx2G5+CXgiKsheC/uf13
         R0YrFFmfI4c3fQNHLCw2N0cavjNFmQPwvWddBQBTCrmH9sBDak3pmrUOLeal9sr1nh8C
         YfBA==
X-Gm-Message-State: AOJu0Yw98u80BAZ+65XFfR5NRVYomjrqwqY+PhDXMaNoqpIY7iVQW6DU
	L4+tbNpnUi3mfnvDiSbph+TUrsL684e2V6up6Tnhlyx+iuGs9lA72dx1NnrHwOXiV5u1REqi4Oy
	zzNuXiaw=
X-Gm-Gg: ASbGncvrUCg/0sf9wNZSa/rhcxawX8sinBlLt2fU3v0mLUK43GTcpcx0u0P/KYKLrZz
	esM2v4sYgCjBp9mxP8XfN3V3NhU5Krd7CMf5Af7iyPbBgWGdK5pY/LX7aRTft2YK2XWO2WX2d4f
	cvOFEOi1b8ZLTY0u7vwJ6MI7iAqVgUTeOz/qr09QpXEiyGqc09iwiYioBGV25X0omPbu0fuaDbJ
	PGr7DuiQrXy+/+1upvzXoH+6EvWNmkNgVoJQmR9wdiDahwuxQZsiGPwDaigFrc96RHDN30T6Bfm
	WUyil5KMOCVC6aBivOD9OL2BzTrMPSfqY98vOLy+UsvGtbw934x+5N7S/9KwSdhq7GZ8xfZcKCC
	sJuAQTEaQoA==
X-Google-Smtp-Source: AGHT+IFTO9DhE0mAn7+8zh10pqs+CicHbEkaRT5pLCDnveKpXML/yUTtWb/cpNgaf7RIq/lccYaJBw==
X-Received: by 2002:a05:6000:310e:b0:3a4:ee40:715c with SMTP id ffacd0b85a97d-3a572370f67mr3322816f8f.14.1749908139044;
        Sat, 14 Jun 2025 06:35:39 -0700 (PDT)
Received: from localhost.localdomain ([2a00:6d43:105:c401:e307:1a37:2e76:ce91])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568b19b32sm5306744f8f.67.2025.06.14.06.35.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Jun 2025 06:35:38 -0700 (PDT)
From: Marco Crivellari <marco.crivellari@suse.com>
To: linux-kernel@vger.kernel.org
Cc: Tejun Heo <tj@kernel.org>,
	Lai Jiangshan <jiangshanlai@gmail.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Frederic Weisbecker <frederic@kernel.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Michal Hocko <mhocko@suse.com>
Subject: [PATCH v5 3/3] [Doc] Workqueue: add WQ_PERCPU
Date: Sat, 14 Jun 2025 15:35:31 +0200
Message-ID: <20250614133531.76742-4-marco.crivellari@suse.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250614133531.76742-1-marco.crivellari@suse.com>
References: <20250614133531.76742-1-marco.crivellari@suse.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Workqueue documentation upgraded with the description
of the new added flag, WQ_PERCPU.

Suggested-by: Tejun Heo <tj@kernel.org>
Signed-off-by: Marco Crivellari <marco.crivellari@suse.com>
---
 Documentation/core-api/workqueue.rst | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/core-api/workqueue.rst b/Documentation/core-api/workqueue.rst
index e295835fc116..165ca73e8351 100644
--- a/Documentation/core-api/workqueue.rst
+++ b/Documentation/core-api/workqueue.rst
@@ -183,6 +183,12 @@ resources, scheduled and executed.
   BH work items cannot sleep. All other features such as delayed queueing,
   flushing and canceling are supported.
 
+``WQ_PERCPU``
+  Work items queued to a per-cpu wq are bound to a specific CPU.
+  This flag is the right choice when cpu locality is important.
+
+  This flag is the complement of ``WQ_UNBOUND``.
+
 ``WQ_UNBOUND``
   Work items queued to an unbound wq are served by the special
   worker-pools which host workers which are not bound to any
-- 
2.49.0

