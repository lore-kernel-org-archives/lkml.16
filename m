Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C18B1A2391;
	Sun,  4 May 2025 10:25:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746354327; cv=none; b=ZKckTMsntH496lRmUSSdQXRFtWS3Tc68RLKD+aPtBZXXZDOO0VfiYhH9+b+tuniMUR0Tssm9X9XUwd0seYbQAJwysJMRX2lA0fP/FkILzuJ2ZmdTp99i4ggD9Df0HxkHeZMs0EScsIrfNKNER/BSpjiVOreQjjmdDzyWsDD0C/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746354327; c=relaxed/simple;
	bh=ODi0JC2HXqZMTWwR1s5f2hkdCy0uXccGWzvYMQKQfwI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=XsgMUCjokg1TvRvrBmfYIA5N0qLHrupF30Dlg6XouTP0I6jzGQ+iTsvvkLUs6NoZrdOe+1BDM5yn9H/hD1bWcXzfARMG1KGnRn/qDWfCr4ToeQw5Ie3ktM3NeYQFZ3uYARpOntoxQNf2v77HCIP5lI5Qw5GdqWIPuoyNIc5VqkE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RvcE6v/q; arc=none smtp.client-ip=209.85.160.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RvcE6v/q"
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-4768f90bf36so40123011cf.0;
        Sun, 04 May 2025 03:25:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746354324; x=1746959124; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QeBI1hiHxX3EY5hNbTVYMQnv6jTJMzI7qpXjSX73AkQ=;
        b=RvcE6v/qnyj7wEWJSuXPM9/LRJ6ioK6uw4ljrKG3lm40NyjFm1fAAQpZX6Qo1wqzxm
         f12MJ0jevmS2QAITvmPtPhph6ICQ6pvZvRQbGaeva2j2msf6O0e3FYaOAqn02z3f9Gb7
         1l/Lfl1L0kx/VrfuQabgbe2UpSegvs9DRavAZp0LK0Ih6vrFY6/ZLwzB0K4vkb9MGYGB
         q7kSJcKQnZwX0yp5J+cG3jt2ruq8inOXocY25fg4Rc6UW0kiXGhDl2qcbcs0gQzmwmcl
         kRDENC6DQdUbx796NO6paLmehRne2Bom28iFNibHOcgYuuPnj8siADpfqBKzi7XSiutZ
         U3zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746354324; x=1746959124;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QeBI1hiHxX3EY5hNbTVYMQnv6jTJMzI7qpXjSX73AkQ=;
        b=RPcglBJQSIZRdwY+etUIhCcWqDDhue3FpVcCbTyfSXvF44LnighoBAsrWb6ZZ4sUhB
         ab2U2JGSKC4z7O+YKKRxOxHI/O5CEDQvjSZMzDPAlJwQcur1+kYrRnZaHsOWANRrkHiu
         ChJOeFZ/d4mfpuDPFjAlKdstK10Xp6wosFVssANJJFPr13loYAzsi59qN2y+7FWaCsml
         /UuEod4hT2Nw4TtjSLfDsWgnYL9wJJR+LdWYM5I69Som+BdU11naf//s2lbwpWV7j+FS
         T+XZtn5LvM3C4slxJkPcFUXgQt2YLJTcJXo2WjkLHwzDbY1KX7WyYalAIJI+ElJgyVOh
         fX9w==
X-Forwarded-Encrypted: i=1; AJvYcCUvDiZ6QuUKQWy2Pl8142NsmNnJsZdyLDDlmfPQhIDMa2qDE+Q5kgF0QjuXLm8eDgifRjA4pkZO8+u0@vger.kernel.org, AJvYcCW5ktdnVqmx2SgUAtwfI2b4sz66FTPQ2+QwdCfzlW+IeW735NdvN1aDnjQcc3CWrmM24BZ79TDtIif8V7/T@vger.kernel.org
X-Gm-Message-State: AOJu0YxXLDWF8olgpu3fVsH5YMUa5wB8gYHebjYHkxeLwgRDS2ZtCu7e
	3TmZUmPALCi8NInNSFDvwcPjdsP7K8anmgKyFz7i9W6RMWfS2dcxtW8yjGTdHAU=
X-Gm-Gg: ASbGnctLdBt6f+Q5e+L0eLGCidtSATF7tGw8YWXbXEaSgBRY+acjiYrYPOneZCFNaFz
	dLF4zI1rl0IyJ7Dij/jjIZkr7MEKNWqhzxmdEksj0K7bV16FeBKbn+H12YaAKHJwNg6+5veoie2
	RwWOIQtMIpqeEoZSretdBJ4aEFD33Xc2Ln+iu7tb+cgcVvn4nJCP21MlYYgyfgDOveHqlX9xqD1
	4IamfxyVYqnhmikz/26myZlCjGhPE4tUMdxttjLhAJ8zCen7dl5B4ZVVbQ6CKUzsItfZEz8R3gy
	hG8TSAd7hwOha2Hy2xkjrsW3WX5RF6n4Yhe9Oxl9uePOA7b+F833
X-Google-Smtp-Source: AGHT+IGz5k+2XSwMUtRHKJOMrQNaU9zoqpmnjJ2twV1Pghmry78hHJFx69ES9l8vE65GsebcgWjtSw==
X-Received: by 2002:a05:622a:5c6:b0:477:41e5:cb8d with SMTP id d75a77b69052e-48e015516e5mr46421111cf.44.1746354324469;
        Sun, 04 May 2025 03:25:24 -0700 (PDT)
Received: from localhost.localdomain ([216.237.233.165])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7cad23c48d6sm429222285a.32.2025.05.04.03.25.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 May 2025 03:25:23 -0700 (PDT)
From: John Clark <inindev@gmail.com>
To: heiko@sntech.de
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	nicolas.frattaroli@collabora.com,
	detlev.casanova@collabora.com,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	inindev@gmail.com
Subject: [PATCH v2 2/3] dt-bindings: arm: rockchip: Add Luckfox Omni3576 board
Date: Sun,  4 May 2025 06:24:46 -0400
Message-Id: <20250504102447.153551-3-inindev@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250504102447.153551-1-inindev@gmail.com>
References: <20250502205533.51744-1-inindev@gmail.com>
 <20250504102447.153551-1-inindev@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add device tree binding for the Luckfox Omni3576 Carrier Board with
Core3576 Module, based on the Rockchip RK3576 SoC.

Signed-off-by: John Clark <inindev@gmail.com>
---
 Documentation/devicetree/bindings/arm/rockchip.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Documentation/devicetree/bindings/arm/rockchip.yaml
index 455fbb290b77..225a2d9e4d94 100644
--- a/Documentation/devicetree/bindings/arm/rockchip.yaml
+++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
@@ -715,6 +715,11 @@ properties:
           - const: lckfb,tspi-rk3566
           - const: rockchip,rk3566
 
+      - description: Luckfox Omni3576 Carrier Board with Core3576 Module
+        items:
+          - const: luckfox,omni3576
+          - const: rockchip,rk3576
+
       - description: Lunzn FastRhino R66S / R68S
         items:
           - enum:
-- 
2.39.5

