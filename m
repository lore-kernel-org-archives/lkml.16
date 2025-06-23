Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D78621C17D
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 00:00:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750636824; cv=none; b=KPIdxAw6CcjsUfLZdOGG3m9MaxMjgm9BRFyCGki6WfxD4PlUIegG4mCppyVMbWqYH5Cf4R8hHyO860nBuWtyD5izhc5S5L8RY4gREYYmmrUdH8k7F+5tdnLZ4bqPzt4jl7ETxhZz6wHHv8QLczXGCSQMM8YGC/3CILB+cKjCTTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750636824; c=relaxed/simple;
	bh=imuK2T8drX+ZLlrEtBHjX3bcu+iaFBiL6jam/tfVMAA=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fvI5IDLbfQGxhMO1kZPwtaajZxGp4Sf+UtfnQewmBQlzRxQMRHVuf/NXrElVrhDyGlNzT8BZXwhzt6WTFRFIZ7E4Q8VkQuFK6eCn53sBmKAu7iFLwlGHxk6gUBR85JUoR8BB25uir0b5JsM0Jr8kDTD69GT0KUnQ1Yrlnym/x0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XO55MCT0; arc=none smtp.client-ip=209.85.128.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XO55MCT0"
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-70e77831d68so33346667b3.2
        for <linux-kernel@vger.kernel.org>; Sun, 22 Jun 2025 17:00:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750636820; x=1751241620; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N7UVaCS12Xf6Wz8HX/a2PTgWqADCA4GJZ/2LGMJLYoE=;
        b=XO55MCT0AK9b7DWSkC5YuKcAu92HoLxxtEzGmZRMBOthz4Se7NARK298LgN+dIcX8Q
         4BssDGkdbSJdNw7eXq1MtxTCW6EiLUwQuZw1pqwGyvGkj4rtBjMv+DHsEEfmwrYRi9GM
         027jGIZul/Nrtl62VtIcd9QByircYHBb+xwRKttjPUg0322OUwU03/sE/pHc0MZYV/J9
         qH4pLuqyMRd+7BuR8ZLagx+3xKxGvE/YBxVzglJAGfA5xWxcgrp3uJ+7yh8VvwF0HJNu
         fVF4RI3J8HmpAYCnFF4s2Ia4XWukbHshuI49HaCZuohbPtnxFKUYKc8B9zpp25YPPZ97
         Sckw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750636820; x=1751241620;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N7UVaCS12Xf6Wz8HX/a2PTgWqADCA4GJZ/2LGMJLYoE=;
        b=YEVgl9tZXwPXu7y+uqA96V0KudNed7tCTHN7nLQnI4wz367C1r5u8Q2oDwNX8RAGnj
         QYrAWeZG/lmhXJoa3H3q3IWxCULlof8ZaVvOit/8DSvLuTT6MIOSOyNCUEohUD57sjFw
         +GcFn4AlHpZw9f/VX99SLyWZfihZNcLGc+otedkiPQ3iA8llZQmRFOR0n5ejXDGV/Yh9
         kbCrnTTo9tpOCLyUFcZAuyGC65xaMIfqAOS3fic+TRYCpedlAg3e0tY3kfti4H21954Q
         Q6zhQFiD5qbRURRPGLDhE9Su7poIK0OieOPBCrG9O80nkCd0Uc/Jzia0u0tcITpCgI4L
         or3Q==
X-Forwarded-Encrypted: i=1; AJvYcCWhwoVj4WattKn3bmjbnK2oRX2UchAs4H3LOgVZu7E9YcI0B8BP6O2wqVsI75AGszlM3mTXCX/8e/oOxmk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwALwCDGd6EPmoRXxSFaMEJArJBYZK/TTN9zZ2W93h2Fs16Fv/x
	rBnL25w6meMLMWKmNxR7U1fOB3hTIS6gzjeAM2riAlbT4mMinjs98xjj
X-Gm-Gg: ASbGnct8isgDqSocQzjyQZ0E/uo8XtumAGwBrw0tl6tAjjI9G4KQewxZVYrlUBfKhtr
	OLRqtGO8Kp7exIo6epUHZN8fVjIuElUuXDgRa1/aTPFJdbdCBKzc4bznEgp1KAzJPjcVSNkbazP
	kGQBC5uPDM+AryKymHrH7N82nkcVtu5cfTGPeKPYdK+Af2YdU/n3LJbmEQBJUQqSur4qBry2riY
	aLeEI27g1gsq0a96tiJSfcpXAQkprGe7ODlPjzLLQfmNKXmRMMEquSG8Pk9RQ5TIbXAoH9172i0
	GJb9Mk9ecS5YnCGn1NP983RWCFpVHUylAFGPWmGllglo4TiBCrazWsJEEVxCAKR3Vaac55EYd3Y
	lp3pzImkR85TpoMZ7vrMEww==
X-Google-Smtp-Source: AGHT+IHM7doYTAmYmivYFzoUuG7mrbbh5bv+OzjJWZsq+Z2PPMsk75/7913K9T2MqMjKzfHBIN6qHw==
X-Received: by 2002:a05:690c:6e0d:b0:70e:70de:64f6 with SMTP id 00721157ae682-712c601b6c9mr154977777b3.0.1750636820510;
        Sun, 22 Jun 2025 17:00:20 -0700 (PDT)
Received: from localhost (c-73-224-175-84.hsd1.fl.comcast.net. [73.224.175.84])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-712c4a2359csm13537517b3.38.2025.06.22.17.00.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Jun 2025 17:00:19 -0700 (PDT)
From: Yury Norov <yury.norov@gmail.com>
To: "Paul E. McKenney" <paulmck@kernel.org>,
	Neeraj Upadhyay <neeraj.upadhyay@kernel.org>,
	"Yury Norov [NVIDIA]" <yury.norov@gmail.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Thorsten Blum <thorsten.blum@linux.dev>,
	Zqiang <qiang.zhang1211@gmail.com>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/4] smp: Don't wait for remote work done if not needed in smp_call_function_many_cond()
Date: Sun, 22 Jun 2025 20:00:08 -0400
Message-ID: <20250623000010.10124-4-yury.norov@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250623000010.10124-1-yury.norov@gmail.com>
References: <20250623000010.10124-1-yury.norov@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Yury Norov [NVIDIA]" <yury.norov@gmail.com>

If we don't actually send any IPIs, there's no need to wait for a job
completion.

Signed-off-by: Yury Norov [NVIDIA] <yury.norov@gmail.com>
---
 kernel/smp.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/kernel/smp.c b/kernel/smp.c
index 5871acf3cd45..715190669e94 100644
--- a/kernel/smp.c
+++ b/kernel/smp.c
@@ -849,6 +849,8 @@ static void smp_call_function_many_cond(const struct cpumask *mask,
 			send_call_function_single_ipi(last_cpu);
 		else if (likely(nr_cpus > 1))
 			send_call_function_ipi_mask(cfd->cpumask_ipi);
+		else
+			run_remote = false;
 	}
 
 	if (run_local) {
-- 
2.43.0

