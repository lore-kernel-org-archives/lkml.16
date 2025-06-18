Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6A2A2EE5EB
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 14:55:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750258557; cv=none; b=jW9KcaUo5oWT7K+Re06vTZK46D8XcEmfzZYDiC8fcKZ3IY8qFD+fjF1B7mq5VuSBMysN7x7WwmESId2B7Q/ZTafdWuCnA9LnZ5UEdldYfZI7y7fNaRpcEA1Z/xrTIR7tVdOer+iYUuWLeQNRjwBQjxtNB/Aom9qmfpuAdbvYMJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750258557; c=relaxed/simple;
	bh=cz1K8HLQmW8pt1BEX0adLUAJri/EVs1UC94kpElp3yQ=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=YFsK79mJxZXpLqYlAeVYektR96TbVEKHj4cB0kpxn3hMGgZvD5G31JWi64DrjzVI8aYjOb06kaJU+lrNqToN/e5VSakYPaMV0nvmCfPJtPCymsYq0WmcnJ7z9KjLm12g7T/9UtW6wq7gcSUR49vQSehbKJrqfOy/Ih8yrMMBIGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R4l0AGF9; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R4l0AGF9"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-b2c4e46a89fso5740543a12.2
        for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 07:55:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750258555; x=1750863355; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=O0+ApZGPK8hxvj2a8PRGTgxGTWYM7Y+VlHmPdB1ZKT4=;
        b=R4l0AGF9gEiLzGcfSNtkNDqWYTjgrMJjC4iZBq+tNbjhok6dvMjvuQFwL0K2ojHvxg
         U7B12J60GvqyNM0IHmHScwiHfFVentbCSHTOLinjLnemUq70yzV3g/7ARPZR5VUgP2MA
         kB9b5G4J31sdeZALzANRR/XmHzPsP9u6yoGePfVPU+e3U8qnmeJOYmp6lguBF29vOnZj
         GC4Nr9vMtGJ6vb+P81w2PUI06bqt7SyBNxGH3CKh4ue2jwYsi4vwxfxo1r2r6jS+qcTD
         ZX4larBWlsre/i7toEhqJI+DfYhMe9BDDIRBQgDj3/mcof6jWqUFLA6rSYXeQps93i1s
         9PeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750258555; x=1750863355;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=O0+ApZGPK8hxvj2a8PRGTgxGTWYM7Y+VlHmPdB1ZKT4=;
        b=KaOCeRMH6Ly3ehpVcyrCoyMYooS+VdQ+wTKGJY04Nuy8koFvaywGqD8LH7oppu26BJ
         FutmDvIpuQ/A8pyXUwjtjlrkSvmhdWG7wSjkeDh1lfoLY6QSt/YPNxiaa2JCg9/Gfhw0
         HnWAIZBYBRUHSKNtcAcT2tN9gYlhKJ1wywsAEjkv9ao84VmWaHMMkl5vSL0wG9TAVzHt
         93Mypgb37I6kdr+7yBNQOTPFFurRVQZ4vmEPyDYQhc+r4yAntD95fNKQ56YXGny5+ijb
         CzRB6OrkHHLwdlHzEGd0t5YhDA2CPCwOQ+VbkeyBz8z9rgFvcQiDg/WUEV3hXInyHKKQ
         UrvA==
X-Forwarded-Encrypted: i=1; AJvYcCUspHbU316gTeI9CLiG0uFJqP436tm93frmWAT7dRd4snsJK1qISmtw39GbR6PiH5Jd2zrd7VpKMuTpC8c=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+Oh2WAsovOebpmuvGv4QUojKPNO3qGlMcUa5yU74hn6EEafD/
	Yw+8Xf+1HZavbhg9RWGWogT/JmEYSD3dc/2jjErJhPMHdfGQzZ2nnyAT
X-Gm-Gg: ASbGnctOX+1KEb6ov6WypYzs95lvAy7gw6vdTSHaOq/3rHzjRIV4+n7xVZ8kPPFacUI
	lt3FWRiKdxe0CoN5AcNZ+eTqjp3szkzWUYdJJCQPH+BkybKdOUg01zpc6zEV0W5rLhmCSWGje3b
	ZOZa6dBbfdWjbieyR4Syc1q2NZCrUZVcPRK0kn1MVls7rzZjr5mnkoh71Evomo4Snl/f0h9Ra7r
	LlR0wsCQaSq8Q87F9+htCjoZQ0WqF+n/leljSQKB+/mxbBNw10WimlfXZYsRqmlm68KV8Ioi/Ze
	ve8/zNmN4AKIrN8RRkvV0ADd949l4FldLZIqSbs9KPBSTga+UTBsbM1Pxgwjqb+B0hq9/U5RSQS
	hifS0uOo+nDIsizRWEBX0
X-Google-Smtp-Source: AGHT+IGpGCrlyY3byltTmOzl5uTsCXlaknteykndOb57J/GEID8SRTtCeTktYUWgs9uY+GuI0NIIhA==
X-Received: by 2002:a05:6a21:b97:b0:1f3:1eb8:7597 with SMTP id adf61e73a8af0-21fbd596405mr28892958637.35.1750258554894;
        Wed, 18 Jun 2025 07:55:54 -0700 (PDT)
Received: from localhost (21.203.125.34.bc.googleusercontent.com. [34.125.203.21])
        by smtp.gmail.com with UTF8SMTPSA id 41be03b00d2f7-b2fe1643e9esm11093646a12.25.2025.06.18.07.55.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 07:55:54 -0700 (PDT)
From: Chia-I Wu <olvaffe@gmail.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
	Steven Price <steven.price@arm.com>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] drm/panthor: always set fence errors on CS_FAULT
Date: Wed, 18 Jun 2025 07:55:49 -0700
Message-ID: <20250618145550.1901618-1-olvaffe@gmail.com>
X-Mailer: git-send-email 2.50.0.rc2.696.g1fc2a0284f-goog
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

It is unclear why fence errors were set only for CS_INHERIT_FAULT.
Downstream driver also does not treat CS_INHERIT_FAULT specially.
Remove the check.

Signed-off-by: Chia-I Wu <olvaffe@gmail.com>
---
 drivers/gpu/drm/panthor/panthor_sched.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panthor/panthor_sched.c b/drivers/gpu/drm/panthor/panthor_sched.c
index a2248f692a030..1a3b1c49f7d7b 100644
--- a/drivers/gpu/drm/panthor/panthor_sched.c
+++ b/drivers/gpu/drm/panthor/panthor_sched.c
@@ -1399,7 +1399,7 @@ cs_slot_process_fault_event_locked(struct panthor_device *ptdev,
 	fault = cs_iface->output->fault;
 	info = cs_iface->output->fault_info;
 
-	if (queue && CS_EXCEPTION_TYPE(fault) == DRM_PANTHOR_EXCEPTION_CS_INHERIT_FAULT) {
+	if (queue) {
 		u64 cs_extract = queue->iface.output->extract;
 		struct panthor_job *job;
 
-- 
2.50.0.rc2.696.g1fc2a0284f-goog

