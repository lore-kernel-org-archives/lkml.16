Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A79DC28C2B3
	for <linux-kernel@vger.kernel.org>; Mon,  7 Jul 2025 07:57:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751875057; cv=none; b=mB8i+XEzVx73ytmwABos2LexEns3lAojfA6LuN41c1TELeejqr4Wg5kE2pZLsNmVunq93NxAjc4+Ix4S4jRcKphrqi19PEom3pORER4MimEzS6ApCj8EVbIjaZbSeQPMlwHoylybMjRxamfAHCU8F/yRcuuOP4e7nTDCtiSJF4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751875057; c=relaxed/simple;
	bh=TIYvoKfMMCjlv2uIdTylizwMRIdwqTIRMTgS9s8saVs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fPM1hWLN+IuTUjMFz8PuGVM5mXkX0nOmzAqVKP6VNZQoPX+YnSco5HRJYYLDmzG4xy3f8b2kDY8QaJq+QLCncxx8aHRm7xoIYH1G1v7rg6eVqaVvKP/C8iOgO0A8FKyNveDoDJ8Mx2shm3cmIdOxt13+ikIP84WqoV6ipX3D3jA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=brighamcampbell.com; spf=pass smtp.mailfrom=brighamcampbell.com; dkim=pass (2048-bit key) header.d=brighamcampbell.com header.i=@brighamcampbell.com header.b=fAXCp2Ok; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=brighamcampbell.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=brighamcampbell.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=brighamcampbell.com header.i=@brighamcampbell.com header.b="fAXCp2Ok"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-af51596da56so2098205a12.0
        for <linux-kernel@vger.kernel.org>; Mon, 07 Jul 2025 00:57:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brighamcampbell.com; s=google; t=1751875055; x=1752479855; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/MC/xohKHOcg+vnOOSNCEDTYlZuTz6zJxo6U8fkD0yY=;
        b=fAXCp2OkG630hcC1x3SNl4GRMHD9RpPkRHnjMVtZ6FFYIFmA53Ndu6pC/DKss6AMO0
         miJtcA+RgIfT4ZcCMdSEHsINFBUDHyI0z9bz3OFdiVmnswRIdua/ZjZp3X9iF03RlRyR
         PlUD4+PZJqaqi9vMAIRxLOFBwL3Hi5gjOBPSrGPWxESuMLzJJOVV8as2NhmOjRDLPHtl
         HVcFX1ZR1kifAT7YyHm/ado3fX+5d0vOwbVHRgRNFvCfyoPlU5Qg1W6jn8MtBpl6pjkw
         Zn6Z1VO6TWQKNSdiSDneMvIRQkdurjS0pAs9Yw5opKmDyrHORLnwUS5tm6zN109SuUJL
         OU/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751875055; x=1752479855;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/MC/xohKHOcg+vnOOSNCEDTYlZuTz6zJxo6U8fkD0yY=;
        b=EkMZCpI4Cv96KwM45Nrt0mQTWHgWfh19whG4CcCJiTsjed2ojzZRLpXJH9FY/GATE7
         SwCjDTXFUA/HgiWJc1Z8e+kY13X2fbxyV5igaFu+SWa5vLglo5WiLa3GYFkrN4JxQq7n
         sfT0cum+c1b7aCrM664Yp8v6Y2mYMadio4XU251mEH3VzU/jkPqo2GxtyzBimRjHUc/u
         Q9dcSxonpeTQV+/f5/emjAzZY7J7+ZulHiIEmq0OZZRSgS+41jEKSzcdpnQyv2AHEkkr
         mvf5UaYZ9mmLvb3vnv0Bbn/6nw3QBYqPKgiXqBrV8NgodecNWWC1teGWiDN9oxybuCNw
         e+6A==
X-Forwarded-Encrypted: i=1; AJvYcCUCebzOyD5oy0lwE3juPrfOBID1ebAx/cc9wbuiVvfY3KJ1sgHqWGOpoAhpluR932HJZKnaF2qDJxzwr0w=@vger.kernel.org
X-Gm-Message-State: AOJu0YwKZzDSPIfVuUBxQN+reap05IH8vJ5fFZgi3EHlbZCyJymaGDZn
	XhI5kU9j5k21KAAWCCuzp31fZEoqylFDnbfb64O2KfIRrQVoKHNZEATpZWQ6rGx/7Qg=
X-Gm-Gg: ASbGncsMDba7MdetRHU3daOqdh73hspyykBfq2RPUF+DomvHKkMEPeoBWfKJandRTEK
	AAoXKacCpAdTYE+i3UmcQWbRr9urMYNpscZ29brpcK6Ch5ggEIAWyTv4uFoT3kBieFz4GwMD5KY
	c8PxvcHNBE9wRaqcaJC8egcpv3GqM5F6u+9U6IV02Z1T4tUlD8yjqweVjXFhZMqHzEYyBt7ddOw
	I1dO24Ny02Edm1gu+YLl3NMkY4Y+1XKh+xeTD/TFPIXNZf8hUBnklYX6CYdnTpR7DPLFYXTGFWH
	FyXiYuaiH2N/4cbbpZk9WEKoLCHPqjWOXdl1zw12ejJMR6xMldt5eWI2lvn0YSTzPW/+XjoBnqF
	u1+zCBXg55WtyJQ3WSA==
X-Google-Smtp-Source: AGHT+IEG3rUVLj/sU9Sc3cCmT/rktoO/r9+WAKUWx4b+U8GR+jBcTNhe69ooHHcJV8ngN58Oe5tUvA==
X-Received: by 2002:a05:6a20:2583:b0:21f:54f0:3b84 with SMTP id adf61e73a8af0-2260b96873fmr18892440637.35.1751875054860;
        Mon, 07 Jul 2025 00:57:34 -0700 (PDT)
Received: from mystery-machine.brighamcampbell.com ([64.71.154.6])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b38ee62f8bdsm8246476a12.57.2025.07.07.00.57.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Jul 2025 00:57:34 -0700 (PDT)
From: Brigham Campbell <me@brighamcampbell.com>
To: dianders@chromium.org,
	tejasvipin76@gmail.com,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev,
	dri-devel@lists.freedesktop.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Jonathan Corbet <corbet@lwn.net>
Cc: Brigham Campbell <me@brighamcampbell.com>
Subject: [PATCH 3/3] drm: docs: Remove completed task from drm TODO list
Date: Mon,  7 Jul 2025 01:56:58 -0600
Message-ID: <20250707075659.75810-4-me@brighamcampbell.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250707075659.75810-1-me@brighamcampbell.com>
References: <20250707075659.75810-1-me@brighamcampbell.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove TODO item from drm documentation to transition away from using
mipi_dsi_*_write_seq() macros now that the work is complete.

Signed-off-by: Brigham Campbell <me@brighamcampbell.com>
---
 Documentation/gpu/todo.rst | 18 ------------------
 1 file changed, 18 deletions(-)

diff --git a/Documentation/gpu/todo.rst b/Documentation/gpu/todo.rst
index be8637da3fe9..76afb8a784e3 100644
--- a/Documentation/gpu/todo.rst
+++ b/Documentation/gpu/todo.rst
@@ -497,24 +497,6 @@ Contact: Douglas Anderson <dianders@chromium.org>
 
 Level: Intermediate
 
-Transition away from using mipi_dsi_*_write_seq()
--------------------------------------------------
-
-The macros mipi_dsi_generic_write_seq() and mipi_dsi_dcs_write_seq() are
-non-intuitive because, if there are errors, they return out of the *caller's*
-function. We should move all callers to use mipi_dsi_generic_write_seq_multi()
-and mipi_dsi_dcs_write_seq_multi() macros instead.
-
-Once all callers are transitioned, the macros and the functions that they call,
-mipi_dsi_generic_write_chatty() and mipi_dsi_dcs_write_buffer_chatty(), can
-probably be removed. Alternatively, if people feel like the _multi() variants
-are overkill for some use cases, we could keep the mipi_dsi_*_write_seq()
-variants but change them not to return out of the caller.
-
-Contact: Douglas Anderson <dianders@chromium.org>
-
-Level: Starter
-
 Remove devm_drm_put_bridge()
 ----------------------------
 
-- 
2.49.0

