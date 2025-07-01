Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 156F6273800
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 11:47:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751370471; cv=none; b=nA8v0JZAFXgZ6ftZe2xpVgI+ZN3NwFYG8ME9EpA/nZMt7oqtwBPjQw/quU4JYaATFZtZKBhyvs2tJ0Kua68to0nGNrN87d4+CQgfPakK2XiLZY/6B1ZpQwxXr4lMnE0RiPs1TPpvwsSOWLwcplZagTAqzOpKPAxdv4cDRx2EPnY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751370471; c=relaxed/simple;
	bh=X+r0zTkUGtRJCJfRcd/bnGrRbNrkBLcRlu6vBZJ73Wo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iIPSDA8q0jv7AbeQnBh0XfqkuEjMyy2QkYBDUT4ChQ1UI9feFijUrGVMVhdPdW5qqBIZ+6kkJjSQU3IcwSqJApsf6wbFu3vUYr5MYZD5NHZ1S9s9ZVtM+VGRCT6Fn1KriTazyQ3O5WYuhFvmBwNhv4DZVXRZ/lk6IkTFYOKEe0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SlUW3bPt; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SlUW3bPt"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5561c20e2d5so1769911e87.0
        for <linux-kernel@vger.kernel.org>; Tue, 01 Jul 2025 04:47:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751370468; x=1751975268; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VAJ6J4GjiYlQlRHxgiIta0TvQOYhp5UxqNHtxTsiWvY=;
        b=SlUW3bPtqMEi9LrnL8dnMaZvtT/OFTsxVYeAYRjt38GOpH1KWUvkb6Sz+e6QHbQQou
         kh0UAUcKM74p61RbE+jtWGDsLr8POOtC2XXU9XJGu/rJPHbzsmzwM6sLXEF8yiKmPeqO
         h535b+PrNI423GadTVD8ag9oLzlMRoXY5h9+aZtEh/WujeYIVM1us4Rmr5395mSnIqOr
         CmaNtf0V4LuQTWWG/Sqm4bCKtwjcYfB+JUMW36msVlhptUw2wcnBmCHMdRD2ReoNxgXK
         +ExPMdDPJpDyhTWuISmquSuxDL/ZOpZY04Sl6fLBJhPeuFFsoXzDBl7pOAlDETzwb5ZA
         wWiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751370468; x=1751975268;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VAJ6J4GjiYlQlRHxgiIta0TvQOYhp5UxqNHtxTsiWvY=;
        b=W7IV6KtPYfW876F4tssAHkhEfoi6h3W97GblPusPLEYEyMdqxpuIvF/E1puJ8YRI/c
         /c/4rqB7/UtOHH7u+q5xOlB1R6Gchhg2qRbB80nVTQvpjEirBE+5ea6rcWxFG/oc1u9g
         O2o39Rj/Q3bRmTZqUj70P3etbT27jWRdkQNbacaEu/MOg1uVFIGze5wdds1aoluEJhA8
         XEa03s4Wrws8+y726DdroOWVTEklofYe72RNMh1dd0YmmYEN0Z5KxoQDRZ6agLlhp68X
         +ssUsC9fXrU+ld+d4lxWn80lTguD8aWwojjeTqmFkJzFIwBzD4Kup1T7aoG/g55RNMrR
         1WxQ==
X-Forwarded-Encrypted: i=1; AJvYcCUYAuz0gRYa8WInKhZaOw+ZJ+CLq+W0BGcgIyqux6v/QPZVuFnLLX8Ak0WUy4DB3qVIUFCq9lIYduwE9Kw=@vger.kernel.org
X-Gm-Message-State: AOJu0YytGKMsV1eyvmprMPQFW2uMBbr7dDotpGbcT7btSH0vfYuXDN5H
	colytSn3l/vUPDm5twdMelgWCFLAS6AxxVmU9bp48mdJ3pomp/4TEwKSl+D8HcIM54Y=
X-Gm-Gg: ASbGncujCqPL4RXfyLFwgu42Eb5rlpJvxtB9p5VCc/FoLCK4qzBnmGZZFbbe28RDrbm
	u3iywLIkqjPeZUJZp7+jloTZ+S8+CqegtNTWjaXVV1768gpmkqfPRsW6syRr63/MHrPImhCNn9M
	kVdQKsGRPQlUwZIq2D3yOASzrXkpxtYyu5e0cp0mpaxafrHPu2XzZkNmZI3FjD7vx1yrlTQ3xTr
	WfGoA0xGk2kCgP4I7VxtkBenMGWjdE6+5uDb4uJQJQBDSdv6Hn46no3IIAON9ERVYW2vJLDOoFb
	P7vkvPbqQINlnwd9tgL5DMll1RWD/RwoBmIZLEGpA1d413BLCGT7sZzETzLCqtsC6911VMMd+Dt
	pxGgWoOhRSFF3+FxOHppor4qGz542ZnnGP21a
X-Google-Smtp-Source: AGHT+IHA2zFo5pnzsu0lhBpGnceUmjdKPW3bEz4nAMuwGE5OIZ/FIvjbr6dJfXztba7RBDcN4Dq+2Q==
X-Received: by 2002:a05:6512:138c:b0:553:2e37:6945 with SMTP id 2adb3069b0e04-5550b89f419mr6638377e87.32.1751370468065;
        Tue, 01 Jul 2025 04:47:48 -0700 (PDT)
Received: from uffe-tuxpro14.. (h-178-174-189-39.A498.priv.bahnhof.se. [178.174.189.39])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5550b2f162dsm1800592e87.248.2025.07.01.04.47.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 04:47:47 -0700 (PDT)
From: Ulf Hansson <ulf.hansson@linaro.org>
To: Saravana Kannan <saravanak@google.com>,
	Stephen Boyd <sboyd@kernel.org>,
	linux-pm@vger.kernel.org
Cc: "Rafael J . Wysocki" <rafael@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Michael Grzeschik <m.grzeschik@pengutronix.de>,
	Bjorn Andersson <andersson@kernel.org>,
	Abel Vesa <abel.vesa@linaro.org>,
	Peng Fan <peng.fan@oss.nxp.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Johan Hovold <johan@kernel.org>,
	Maulik Shah <maulik.shah@oss.qualcomm.com>,
	Michal Simek <michal.simek@amd.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Hiago De Franco <hiago.franco@toradex.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 03/24] pmdomain: renesas: rcar-gen4-sysc: Move init to postcore_initcall
Date: Tue,  1 Jul 2025 13:47:05 +0200
Message-ID: <20250701114733.636510-4-ulf.hansson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250701114733.636510-1-ulf.hansson@linaro.org>
References: <20250701114733.636510-1-ulf.hansson@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Subsequent changes to genpd adds a limitation that registering a genpd OF
providers must be done after its bus registration, which is at
core_initcall. To adopt to this, let's move to a postcore_initcall.

Suggested-by: Geert Uytterhoeven <geert@linux-m68k.org>
Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
---

Changes in v3:
	- New patch.

---
 drivers/pmdomain/renesas/rcar-gen4-sysc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pmdomain/renesas/rcar-gen4-sysc.c b/drivers/pmdomain/renesas/rcar-gen4-sysc.c
index e001b5c25bed..5aa7fa1df8fe 100644
--- a/drivers/pmdomain/renesas/rcar-gen4-sysc.c
+++ b/drivers/pmdomain/renesas/rcar-gen4-sysc.c
@@ -374,4 +374,4 @@ static int __init rcar_gen4_sysc_pd_init(void)
 	of_node_put(np);
 	return error;
 }
-early_initcall(rcar_gen4_sysc_pd_init);
+postcore_initcall(rcar_gen4_sysc_pd_init);
-- 
2.43.0

