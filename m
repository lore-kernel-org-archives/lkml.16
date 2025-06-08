Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED9D71F542A;
	Sun,  8 Jun 2025 23:23:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749425015; cv=none; b=MtBFypsoK/gLxEGoDi/11kKX1Qx+sAYF67tNgLgn9j4qaN4UXwYVa4karNnKNTXKajNQToHAQv4n5NlDjP46PgH2xSmkZhBsQJV/M/rua7USrgG3pQYixvh0PAy8UOZrGt2coY3plH83C3hPnBP76bBFrg0AH0bOiiUvkBbtlGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749425015; c=relaxed/simple;
	bh=6W7L6mLae0Gwk7i/q8VTDrfQXggHDNqoAV/kISEHYUc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Q4OcfyUITpzxVztu4y4KglumElUUc/CrTJIdDEpG6pP3zWC+SDqzflC9fLUOz8t+MsgQD4GV6ct6lm+dWsCJKDaTiP5ypIN3myjUOVBQDncUZD+jJ8Y3FQ+S3PvUdjQi7ztWE3HNygTD0ckQplG4gchTWjj1vV1N/13UzX0pRjY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G29JLaHx; arc=none smtp.client-ip=209.85.160.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G29JLaHx"
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-4a43d2d5569so50607561cf.0;
        Sun, 08 Jun 2025 16:23:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749425013; x=1750029813; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hnz/0tuwhYz4DMu7YFaY4+MBrOn4ASwg3VdpZXlOjs0=;
        b=G29JLaHx6tztws7yxFz4Dq6OLtKSRjEAPFpzE+oAmxGgY7kS1YZLLqwqF6v+MDxejJ
         qisYvnXjvS77OtNdGvcMOCAhxuRDPGpjC1Ox5ta0izID9/4x0XbljprR7TS2cAjbqw6W
         4TAr5MMlxrdTm8gFz8ZpwIbD2bZ2vINQ1QcBB4pKb1aek4D4HVA/e1pbRmbH0WRj177x
         sGCd08jErzY//K8F39G2aZG6iPq+gaxUgTOPioLwqlzcDsiSvh8UyLF/6frtxombaZpT
         IgNNVdG8MJbs2r61KRqgTdcl+b039zEBV5iT/45J17kN6+LGupXqQqPqsLu37msAEAOV
         EQJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749425013; x=1750029813;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hnz/0tuwhYz4DMu7YFaY4+MBrOn4ASwg3VdpZXlOjs0=;
        b=Hdnip5f5+eyiwT00s4KBBk3fAFDN5dp5l172iZ7ML8YixDBBOCsyZ32qsDLLXzgm08
         lc7RvOgi6RLT9qYvg3nKe9f0/2mf5mgpE+vf8VNCfKYEaplIrfN6SLzTH2MxpsWvgzZs
         5/NkYOPGC3JMFBKkH6SMYlvcU/JRsZjzzFzuQDIHMa3QH98JFFRnwmV4COX1wGqOaAuc
         cqdxY/xQa+ckWtDDJvu46kghK0q24wMDKxHkbDrUfmcb9JzFh1diIduRpDFqPeME8eMc
         q/zlh7rPvh36UtHf3LH1EilhZcxdM9yndJqDqgCpjWy63wademgN08/n6Yv75m38GwwD
         AWYw==
X-Forwarded-Encrypted: i=1; AJvYcCWTFZdbrLtxmUYuYr6VdH0zHUNVIJzZ+JXWHjvbK44lmVJTWl/orfyQWAT4HSfhm3bWaW1mVDUhLZjW@vger.kernel.org, AJvYcCXNVcN/A+zvtunuHHXIOABF9zFc1nM8tdOzg3C2nKEeeY1GQ5aReoet6DKioaXDoMsynKFqMuW7FyUPwDDJ@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7iXkw5KaGbKceKgSTD1lBtdWVgtvquS3+zeKcHqmi11EmYdJ9
	BAbTPGnd1/f25v9GhvmeCfNkkbjiOAFWBjKZlh0DZ2t3TOg1TVkvXmVP
X-Gm-Gg: ASbGnctepgySYYpH5kEZi4RiKjpq/8WFcFCD70Kb0rSwuY5qESbIfxWCr/QQPRgUkwJ
	Cd5Jt6WLYVrK2Fd2U6ZH4QvBk+pOrulpHJ+GzoPyYFbLcSWhD9k+D5Eq6dCiSS4QIPNqoKqPOy7
	Bxe74LNdidwWz/UNmIzcpq1iu/CMOpctzAqiL+PCSSDb17VrGY11QR6+Y1pvyne1r9g9PNApDPR
	k78BlRs5Diy1tt1o8PQ5OVrWwl8xKyb/Ok5Wsyav2v+DVJ2T0oy2xj1FiUecJZb97dPPSQE8NKa
	693XsivaU2ECE7+uylRbqQJtTAxI6qMGvd3mQA==
X-Google-Smtp-Source: AGHT+IF3xphXoXKZTtdXVGAmCrM+vdD5L5L35t04k2N082DOU5EycEu6eHnJomWRNQdN0alz4WHfCA==
X-Received: by 2002:a05:622a:5909:b0:4a5:a5df:d1f9 with SMTP id d75a77b69052e-4a5b9db110fmr208752761cf.43.1749425012955;
        Sun, 08 Jun 2025 16:23:32 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id d75a77b69052e-4a61116b780sm48297791cf.19.2025.06.08.16.23.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Jun 2025 16:23:32 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Yixun Lan <dlan@gentoo.org>,
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>,
	Ze Huang <huangze@whut.edu.cn>
Cc: Junhui Liu <junhui.liu@pigmoral.tech>,
	devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH v2 1/4] dt-bindings: reset: sophgo: Add CV1800B support
Date: Mon,  9 Jun 2025 07:22:07 +0800
Message-ID: <20250608232214.771855-2-inochiama@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250608232214.771855-1-inochiama@gmail.com>
References: <20250608232214.771855-1-inochiama@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add bindings for the reset generator on the SOPHGO CV1800B
RISC-V SoC.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---
 Documentation/devicetree/bindings/reset/sophgo,sg2042-reset.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/reset/sophgo,sg2042-reset.yaml b/Documentation/devicetree/bindings/reset/sophgo,sg2042-reset.yaml
index 1d1b84575960..bd8dfa998939 100644
--- a/Documentation/devicetree/bindings/reset/sophgo,sg2042-reset.yaml
+++ b/Documentation/devicetree/bindings/reset/sophgo,sg2042-reset.yaml
@@ -17,6 +17,7 @@ properties:
               - sophgo,sg2044-reset
           - const: sophgo,sg2042-reset
       - const: sophgo,sg2042-reset
+      - const: sophgo,cv1800b-reset
 
   reg:
     maxItems: 1
-- 
2.49.0

