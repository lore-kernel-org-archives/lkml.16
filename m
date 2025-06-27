Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB4D72E336F;
	Fri, 27 Jun 2025 14:27:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751034447; cv=none; b=MB8hJq1/rFU/VQhiPUrvrs8V1hniPEImu3VFnMBWPNIXR+dBjDEdCZjEigofvTiNcQmaOTAhuTbrIlJ5+dE/zggnNPI5rk9YZJC6AnbtuudXuVG+QY+9kZEyVlEteb45p7ZEsVm7/Xeozfl/CpXWewcO1qY+o1vawRWbc7RJ3DY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751034447; c=relaxed/simple;
	bh=PEyK06Qfr1VyeAoDqJeLSwQmPFidFt9WX5l7nZjvups=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=thpsM9HvZXWpm8ZpUfesny/shr7ppWb4Ydwl3hitOcCYfsWiu+T2Rd+PC7JgUsuaLLdPHoBtoYPnkpJU69/9HpG1/xvmqlG3RP1y645dV8rIfjfdkvB6UTJ0UXzwCiSlLk+q2q1iAHILuPOmD/NJ1pPVO9M64+DRl6z7j4Ps1Dc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k9NsdpbH; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k9NsdpbH"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-ae0ccfd5ca5so361029766b.3;
        Fri, 27 Jun 2025 07:27:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751034444; x=1751639244; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CkxeU/GduoWntQlLaILsmti/MYYJWF+ax5S/V6THsN0=;
        b=k9NsdpbHlpKo6mcPzw18FCt404ZF9JydP7o7D8B1JMSQDLoiyiek20gGew/t+57XbH
         J0I0fRflwiUOHYDr2na9FRyIF/MtGo79SRf0oepjVjleX5EQn66ph+fYB5e2ZTod9yKf
         kC87xvmEkkruYULJu+UCBF6hrTUmJkFq3uiUkpzujaNMMnsFodvUcNB5ParC1KDKWRLP
         H4DaJMLU+A+WZ6gJYKfvV4DmTQ08QmgFoNGBuST+MoSrXho7WcjIPlyT/7IxiDigJ3cY
         iy25oBuk3ptiT+jTjy6QKMaAQcWwen3UMB3BldC5ftmTtwJ0As6fWGIX0nJ+uytmBQ1D
         gGVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751034444; x=1751639244;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CkxeU/GduoWntQlLaILsmti/MYYJWF+ax5S/V6THsN0=;
        b=Mhw1xD3kT/QVw13Nwp0wZTTiwcFx04glts6ba/ido7aLHuCM1yyeyz3V5opZ4Ln0MV
         VE8/zQHMFi+3xjJa2rZH+1LAWH/oW7xBtN1PWMjlb6dN/sGmRl8GGvOFpE99DFkaL0DN
         oDDubhHjQ9pmcJ+XAHqWazmahCjLx84NzAgvjFK7+ZvENqwKbgbR5NoHQQ//xAhZseBo
         yS0Y1FzTVa3VDvTSyZi0R7XaRKV9HZtTc683CdFq+wxNFydrfgWU12ozOoEj8gzGW6J+
         rePk6ZzDVLxMYPBoSla3DjUdh8osF8GeXCK7CzAH2eXrlL8m3zvZIn11rPnp13bNpg6c
         gh0Q==
X-Forwarded-Encrypted: i=1; AJvYcCUCi/FgT4LryMPTnmmjVe5fNUk+K2HIj5otUZwMqwG1nOkuXE+zvviNij3lGx5OBDKreNKy+r6j48a7D05M@vger.kernel.org, AJvYcCV1vDDGuStdilvClR0N4LXzXaDahtOsHJVKJkNeOQ4d8sZkpJQjTF08nsCP8L/3abZOCI0QaZ0YlRAC@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2Gq+qElJaGmjE9ASH3PdTRMG/0Q5WBiaoSrOvcSgOkYC00BIE
	GNWPPbVdOOYX3HncBN6k9ZjAIw2WD73atF/20C8b+HNn2HiehTqlBOB/
X-Gm-Gg: ASbGncu4oh43Q+u+XFc6ujrexFQfbUSyVxGPV45BwWsKikl3KB3Jdtx0Mic7jXm43pK
	nG3LksCwxpHPN3nqCs7Zmu9bI5/Hrjz3C5P7lDE+L1u6Yv6KSCTIxeiCTuWW5y6pHR/Cxo4bXnD
	x8xvv37kmvSv+2R1U2ARgmnd7KSisJVLBggdIbuw4+EkYYLM5FzOSTV0q4Wp9611xpPmrKAKqnc
	LJONu0ye1czGqua5eZSdx60GlTsqV5nehAsqA6HHgyZaHkQw/AVSs1tjqOR7H8mh/LyJe6abGA9
	QnOpymbMWIsaYAfIjJ9P5Cg4pIRrnuxWtbn0iC9rC+HWm9DSOyd/WAvQfKPppc8hfdsW8lyMhf8
	OfaHDQJsEv0O6TPn3fXYL7/DEuF6uSMYOqQ==
X-Google-Smtp-Source: AGHT+IG6eRnkKzksPdjHbL7u+Nuu+IwfYQX57kJVKCXC8aufRZRKJsVtQ1pW1LFQxYsz6ofBp88Lng==
X-Received: by 2002:a17:907:97c7:b0:ae0:c8f9:4529 with SMTP id a640c23a62f3a-ae350103238mr299793166b.49.1751034443969;
        Fri, 27 Jun 2025 07:27:23 -0700 (PDT)
Received: from playground.localdomain ([82.79.237.69])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae35e2dafcbsm98925366b.116.2025.06.27.07.27.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 07:27:23 -0700 (PDT)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] dt-bindings: arm: fsl: add i.MX8ULP EVK9 board
Date: Fri, 27 Jun 2025 10:26:44 -0400
Message-Id: <20250627142645.134256-2-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250627142645.134256-1-laurentiumihalcea111@gmail.com>
References: <20250627142645.134256-1-laurentiumihalcea111@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

Add DT compatible string for the i.MX8ULP EVK9 board.

Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
---
 Documentation/devicetree/bindings/arm/fsl.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index b23bc1e48866..0563e9522fb7 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1373,6 +1373,7 @@ properties:
         items:
           - enum:
               - fsl,imx8ulp-evk           # i.MX8ULP EVK Board
+              - fsl,imx8ulp-9x9-evk       # i.MX8ULP EVK9 Board
           - const: fsl,imx8ulp
 
       - description: i.MX93 based Boards
-- 
2.34.1

