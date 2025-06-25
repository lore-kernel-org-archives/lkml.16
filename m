Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEE342C374E
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 10:49:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750848596; cv=none; b=BkHYhth+IbLFAm+mzhGJbha7GEUfUexXL+8wzdajy0OGIoHlX1C6xuwcmLRBnD3ItHpls88qtbAlCuIilYGqHSLkRrS+RcQgY2aUKslm2WNByArun+Morv5tHsHXlYHxHRGyTpYOdxVImKgDb094RGuHLxdDYmb9fKdKS4PP6NY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750848596; c=relaxed/simple;
	bh=QxhCKOwQX3/w4cEC+YBV23ieMtNm48ah9QIvp2Iaer8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gCGIcC0jQ/e9afaP+G4vz2MR1SKkgIIS7k1+PZOpJpA40gEJ6TIdVGY92Nu1++/n2t1+CSxam8CVsEP99PiplgBPiwFOcoBVk0tx8jzzt7wMNyaAd02jeJgpNaJy+CqcAUoRTduWa7NQ9vP3pHbMiYDoOkQnC2+8bi/l7EjoseY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=CKLjUTX3; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="CKLjUTX3"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-442fda876a6so57650845e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 03:49:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1750848593; x=1751453393; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tjfLYY6m+InLLOXmQz/G5wxqGf7sYVhoMUnxMflt9JY=;
        b=CKLjUTX3QW3aFzrGgJEtzX94zCJrtTaqo7L9q7AwXOSG5i/d0YXxhRT7TrB7l+EjJ2
         WWA7W/p/SQHoUdolWCVRmdQPo5MZcKPLNwWV/W2Daz4g6pDvSRFbYM4kNMmsrQzjGAie
         r9FQy4K0m4HqN3/MhL3lcqn1dF7Lv1/lxE4jYRMRwVYiwnxRw8ob50W7KNFoy7vFCjC1
         1vxNb5SsgCXirRhoxZkN7wOwFYrpXcS2QcWhWtPQNjAY8b4yIskUqObiJvV3qSszscdF
         8rCv2W4PMSYLbZfkmEfsUK/gDYkyKwatrWtsZ+5h1kmIJ3o4CyrfID87czBQIGq/xT5X
         ReBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750848593; x=1751453393;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tjfLYY6m+InLLOXmQz/G5wxqGf7sYVhoMUnxMflt9JY=;
        b=kk60dOck/Oh9gazDKv6xBcStCRR8ayJrVnRAetYdepcxFGR72/vSQ2O3BcL7nMcrGF
         YhDENa8KAeLiQkLZ5ISu1mxUUMrS75KumUH6ZVk710gq2cjKbWaVAyIqgPpXa2xi8ZHj
         AOXnA+G9yAeXzC10RL8es+gvdiFY6eFhl0BWDiuenO9z/czZv25iNWamJStMNPRMZLTN
         dFU4dmyCwoOH3FVrNrrt60onW/6u9uRZpTa6KbsU0hoRqp/HvjLbIUZYrH12l1HERlEf
         oAexNOUFSsQhw7EJNgHOohutBzLg7K5wVqtw8IRnjSnbnqUVaCRe1SPKcD1N6eni8jh3
         uLow==
X-Gm-Message-State: AOJu0YznCPieT2qhamPK2ZMmObYyjyOQT87TV5MJoZSOckl76jtfEjh/
	W5wTm31uqmVPCxwN+/R11uIIuI7XYtsUvxRfVbx4Q7QJX7jqUmH71TZpLXz7DT8fF1AdzqfSmYc
	h7Q7M7C8=
X-Gm-Gg: ASbGncuKPx6X99KEripkA/M+xFEyezUEs2VKo/xBWjyl6hGDEZI4ehBvKc9GSDWRpuY
	BsyxG5M5gOEQFnMWXGsJT6uqpTBVjsc9xOnWAl8KJPR8DvwB7x5hl6FGXfuMn2P6ZrZDbQZv7sU
	ZGdIiOErGly//vhmV3wxOjbpES4hmVK3wKjnXwrfCaC8IZfEWz4ds6FfinlK1C0nChcxIZd+89E
	RHaI4ESzYDUSF3FxgSOyoTfTElZ492B2a+x1PQ2T13oz3zR2u7sJS2WjRTHkcRgAqhd7GuwCt7C
	fFpZZxRMcXlPdKGfSeZBgAnnT7psxVq2AHVDYZPaHD4NH3NCOQbhDCjMw0pYOiruzhweuA928Gl
	lgPw+prp1qw==
X-Google-Smtp-Source: AGHT+IHm928/gVX1BV/DpjdMaorM7QwdkK2jDA6VeU3isTyZr79v8CCILH9z6/QfH4oCziJiSkCxbg==
X-Received: by 2002:a05:600c:5492:b0:453:6ca:16b1 with SMTP id 5b1f17b1804b1-45381af1eaemr20632185e9.26.1750848592827;
        Wed, 25 Jun 2025 03:49:52 -0700 (PDT)
Received: from localhost.localdomain ([2a00:6d43:105:c401:e307:1a37:2e76:ce91])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4538233c49fsm16195055e9.7.2025.06.25.03.49.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 03:49:52 -0700 (PDT)
From: Marco Crivellari <marco.crivellari@suse.com>
To: linux-kernel@vger.kernel.org
Cc: Tejun Heo <tj@kernel.org>,
	Lai Jiangshan <jiangshanlai@gmail.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Frederic Weisbecker <frederic@kernel.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Michal Hocko <mhocko@suse.com>
Subject: [PATCH v1 10/10] [Doc] Workqueue: WQ_UNBOUND doc upgraded
Date: Wed, 25 Jun 2025 12:49:34 +0200
Message-ID: <20250625104934.184753-11-marco.crivellari@suse.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250625104934.184753-1-marco.crivellari@suse.com>
References: <20250625104934.184753-1-marco.crivellari@suse.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Doc upgraded to mention future removal of WQ_UNBOUND.

Suggested-by: Tejun Heo <tj@kernel.org>
Signed-off-by: Marco Crivellari <marco.crivellari@suse.com>
---
 Documentation/core-api/workqueue.rst | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/core-api/workqueue.rst b/Documentation/core-api/workqueue.rst
index 165ca73e8351..c8ece1c38808 100644
--- a/Documentation/core-api/workqueue.rst
+++ b/Documentation/core-api/workqueue.rst
@@ -206,6 +206,10 @@ resources, scheduled and executed.
   * Long running CPU intensive workloads which can be better
     managed by the system scheduler.
 
+  **Note:** This flag will be removed in the future and all the work
+  items that don't need to be bound to a specific CPU, should not
+  use this flag.
+
 ``WQ_FREEZABLE``
   A freezable wq participates in the freeze phase of the system
   suspend operations.  Work items on the wq are drained and no
-- 
2.49.0

