Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25272273803
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 11:47:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751370471; cv=none; b=LTgriPbmcjKzEU/rKfSRveXSXx3b+QypBktX/pptVBAN6K0T2wksnqoMx/qQasA/ojikbStdpwpnMUuII7VE073eWPUGg6s2Xjqh0CZgfHs5w39wEohxSJs7WNvFyNxOBnn1RXZMM/6WLUXdG/6wyeuIb3xXCFM8WoQ0xk4eYsc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751370471; c=relaxed/simple;
	bh=OJ7vM9iaMyWGCEbwZfryMptI4hIou2/uDCYlamFnw3E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=seoUpiYc+5fVbiYBL0mSErwa1QdJwj7C0Rilqq4Wh9oomCYKJbsOqNN2/JwWosZmJQYtbITzKbp+1ZFy/37hbw575NL/WN42r8dJldCe8sFJQg1sWNEwJV5HPEr1y6nabvZQYZxi2WRmU9tVta86gQe2ASr7/37NpRgkI8Dfvns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LqPc2VBE; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LqPc2VBE"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-553b16a0e38so6080103e87.1
        for <linux-kernel@vger.kernel.org>; Tue, 01 Jul 2025 04:47:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751370468; x=1751975268; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xR/zckWVNzKKFa7LSQ++02YjQJSEEQWqz9MIi6yuZiU=;
        b=LqPc2VBE9aT5rrPWOCCLizVSwVx6o3yNpiIoDWSEAlr+QzykBQVbc4TiRBj3Bfi4Tr
         2xm98cclKutHtOvYZW5xKsjP/XnU2RVKqI++KQNxZMHWvfSI+E/8aQtJGN7nOomv1k2w
         aGCFBO/5TiNBH8x9qqEsyFMeO8Sgub8uZ8KcLS7rZEKr/COZ5ozORJeZ7I7mrnSTw+rK
         fEjlHaQ9PtkKr2OJGNRz12yZUl2iPX3CyzKD0E3gm5CM9Qk5CTuQQ1DjOVx22bUi1JTU
         upD91mCeCaPychQodlT9YtyrwfyoO5oRJJO+vbZyJRUpFm89JguuYwPkREuOnu7MkjUc
         HOeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751370468; x=1751975268;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xR/zckWVNzKKFa7LSQ++02YjQJSEEQWqz9MIi6yuZiU=;
        b=h6zAPjo+HvCh4GFFa9gXwj+ZkkLkgqzxe3dHpCaoNmY2TQPAtiyasv7GBoqwRE/5Ed
         5pOmjtskzs3hoa1WtvrSpw0Abu9OVCiu3UcwJ3oN0rZTvbxwZ9J6fdSe1MZqhOKoOMuK
         p+UbE7hcbAHx1yo9gm6Z69Oi5/+6bT3WiXftbXO1XA8hCjeReDba6nBLzE9Krfc0ZY6M
         +eTJ7rXQfyFUGOCY8GWjFSP8vTACbu8oDXKARYSndWhr10afr5SwpVNxxx0+dbLJCUKD
         OQu2dEBKH/vnK61VKFP/2Vfey+EwmPdyHjNe/lxcL/vsUdMA7t76FQE9Oz2bYmpzq4F8
         6a1Q==
X-Forwarded-Encrypted: i=1; AJvYcCU/BMsQDmQMJLh6KtSGaLG2imVopWkjLKa2+hcmUdjRqA0FHEigtJEhF2UdP7vi8zdCmtWXpJhJfQmS1bc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxtpPJcFff7QEdvOS61NpwjmfUWeeDEkdH+NuHNDYT7hUpAuyDd
	Fww+OrEXPQWISkYYddVUCbHTeE9uSO22mevZ8ILYtpF59s49XOHpIyGa3CipOIQuCkQ=
X-Gm-Gg: ASbGncuDMeXOWi/SMYFWV3ipp7xED8cmL7FfRaHZ6PjFDJq6B7i/xqkZaS9THwL78yh
	rms8pEN6lVndBdO1dZzeSnlYON72ntwbFyFr5HVMc+vOlLvt7/uLmW1Kb3NlP3DeI3OCIhBCyeK
	Y7pznQizw86zT/qFdRMCq2GpLLcSfFWC9MMObQt1GnEMHOuGicIc5QY6gTSlQQI0j1rnfqEqZ6K
	lc0amlYMMhKzkoLzWExooliHAdCUlnVOBPcLB0dtMfcdZosHZSzDTq1QXvjfe6qaqa1OGxuqP9g
	qe/oUYHIthfoA2PgCcpS0L0aItiWpaxyG/g6KJXCGu5V7gGUfswg0bRH85GeHC0qXOVoAvdETyZ
	swznLDLc4O6gQikYsna2+u3VnKARApIHHxyT0
X-Google-Smtp-Source: AGHT+IGO5gKzZu+VtDDlyhN1DOFOUCU8t35eiES1E+DxBtLsVS3EGtlEnPMXH9LKCJiKW0MjI+Jmzw==
X-Received: by 2002:a05:6512:159a:b0:553:ac4c:2177 with SMTP id 2adb3069b0e04-5550b83772amr4796245e87.20.1751370466845;
        Tue, 01 Jul 2025 04:47:46 -0700 (PDT)
Received: from uffe-tuxpro14.. (h-178-174-189-39.A498.priv.bahnhof.se. [178.174.189.39])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5550b2f162dsm1800592e87.248.2025.07.01.04.47.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 04:47:46 -0700 (PDT)
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
Subject: [PATCH v3 02/24] pmdomain: renesas: rmobile-sysc: Move init to postcore_initcall
Date: Tue,  1 Jul 2025 13:47:04 +0200
Message-ID: <20250701114733.636510-3-ulf.hansson@linaro.org>
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
 drivers/pmdomain/renesas/rmobile-sysc.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/pmdomain/renesas/rmobile-sysc.c b/drivers/pmdomain/renesas/rmobile-sysc.c
index 5848e79aa438..8eedc9a1d825 100644
--- a/drivers/pmdomain/renesas/rmobile-sysc.c
+++ b/drivers/pmdomain/renesas/rmobile-sysc.c
@@ -335,5 +335,4 @@ static int __init rmobile_init_pm_domains(void)
 
 	return ret;
 }
-
-core_initcall(rmobile_init_pm_domains);
+postcore_initcall(rmobile_init_pm_domains);
-- 
2.43.0

