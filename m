Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26CFB15D5B6
	for <linux-kernel@vger.kernel.org>; Sun, 20 Apr 2025 04:14:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745122502; cv=none; b=VSV4ewhLUFWZd3cKhiKpgHNV0wkg7tAt+ss3BPTAh77hWVI8BwP1UKAI+eGSoztT3S6J/OgBtdpCY+Z7lZmKiFfodLXdEt1J31MMA5U29u+sgd5GKuR1KA78OTSYT38hlclTqTKs5kdgRuv4gEx11swfqfxz7vOq9OmxZNe51MU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745122502; c=relaxed/simple;
	bh=vrRK6sdxshe7zgreO0icrsIYu2dpEpBfv0a9U6CA3F4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=GL5sp1dNbWhEesBdYWMshRTDId+F7q+bJzpFnjWtK0qLIwurZLGPHvkg1oKiOLn6h9sd1xI1IGfaRnVtkC8EOgCQ7BC3sH4Mc2PFnpgCrYVVIL/lU/2HUqLUS8Zzt16QDaYOvc05MVzkQ+HHaufRqJxQhvvSVWBP6mJwSWtqEEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UIZfs1Wd; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UIZfs1Wd"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-22438c356c8so33442765ad.1
        for <linux-kernel@vger.kernel.org>; Sat, 19 Apr 2025 21:14:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745122498; x=1745727298; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Gq3eOM5hE1X8uoAe1U581S6eQD3BQ0s7OjJBWEqkBA4=;
        b=UIZfs1WdDR9JtkVUbr5TbTnMtycy+qaNUk8P8qe+zVgKa47nQrTQ99U5WE3ySOErbf
         uofyCPBZRB15GxCeIv4wkcaIH/XCZN7yxY0o5kbkw/XFU70rsgwC6yNCGN5pVSa6PPDN
         vR0PwxNJT3xT7tsV4G4IHUmFoozpFb5jnDkpCx63liPu+xVF2fNUKK1DMzbv57Cx17JR
         lhx2I5BFC4ldGP7qqMTHTx3EO9QCuhD3+9rOTcyQprgTvi+qjY0VAFUKPsPgd5ZuNeMm
         4ge0cY00iEnA4VML1g5V80Dp2jkAQtfHTA/qIPOFa0MdCVb4lq+dJEnph9ClMh3PAVWO
         0Jpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745122498; x=1745727298;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Gq3eOM5hE1X8uoAe1U581S6eQD3BQ0s7OjJBWEqkBA4=;
        b=PIH/7ByZbdR0kN+3jzqFSCDQ5hmYrnrCn4KDMP7Dl3Sw5t6cUP9hegbeELDIoBiSNs
         QomU8KWiZqCBmjYVVAYNUZE+c+W9yETfYyadaRI2i7a5geJHgSL656YTI4oteA/ktSSY
         sn9Soz8aLTsfn4KFqqsMYBnt/WYBenkz17vtfeysQ9VXKXO1/8l+m7Y6awTmL1oP4Xze
         0860uoVpAamvxeT9PZNAra3EceEEKVzk+2OiLWXgxmyQFu2nFYUIvZdV+jGeC2VXeVO1
         e8DRH7jB2r6HqmGHbVfKaqiXWhIYro0iG5pR75udnw0A5tsr8k/4CRO8ci0x0Kt/BtSZ
         N8WQ==
X-Forwarded-Encrypted: i=1; AJvYcCUvTv4OB/aigeQf/hnREACiXV/pvJR6H5C+iqK78Q1tdlryH67DXKSVJxfPR00+hlqbXOgeVpSgS30cDUk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6VV/nWeHtOHsRQZJChCSpVsSMeriCapaa/qvGlYyC7sG8fn7l
	yqykEnt9XBnJpp/+Zlj3rbGIBpyn13jUdvFyGgxvUmiuCJ3BZn204NF3MURKZRdLpYh64xDPBrE
	=
X-Gm-Gg: ASbGncvC7eZL4QAAa5jltSLD3Jf5xRMb2Fy9dE2MDUQVcaeKm9MtW7/lQPPRkCq7t4L
	HU9swM8A9BeHRadsleYD6mMfmKvCxcVTgVfXGab+ywwCEYssC5NInFoxcu1X4xLlCcsFZAkMzKv
	ZzkKk4HK5S2v9m/l1NSng4WUKFSgzqSH6gnGfWEqucOKcFHRMyG7iNrD9itwkc2kTv7tGG109ng
	t8dXXmSojxL8FY6Sc01DHAlbALfk23hBbUV7cn99peMv9ipkkjpEjE+0nD+WOLjqCwNojX5ecAa
	wsg46yrmxITbclIQruXi9XQ4Z5gfwHB/q3dHitTI2Ne1FiM9OyZGFzaXqlJJoypH
X-Google-Smtp-Source: AGHT+IH0Ul9myETUjE6RsaTKjYuEftn6ksNt+XFLIBnkXHJ5m5w5McMSLkUMSv1HgvljYu7WrWw3XQ==
X-Received: by 2002:a17:902:ecc7:b0:220:d79f:60f1 with SMTP id d9443c01a7336-22c536151f7mr112689605ad.42.1745122498412;
        Sat, 19 Apr 2025 21:14:58 -0700 (PDT)
Received: from [127.0.1.1] ([36.255.17.92])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c50fde851sm41412575ad.239.2025.04.19.21.14.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Apr 2025 21:14:57 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, 
 Bjorn Helgaas <bhelgaas@google.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 =?utf-8?q?Pali_Roh=C3=A1r?= <pali@kernel.org>, 
 "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-pci@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20250414214157.1680484-1-robh@kernel.org>
References: <20250414214157.1680484-1-robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: PCI: Convert Marvell EBU to schema
Message-Id: <174512249494.7011.2708584951288197679.b4-ty@linaro.org>
Date: Sun, 20 Apr 2025 09:44:54 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2


On Mon, 14 Apr 2025 16:41:48 -0500, Rob Herring (Arm) wrote:
> Convert the Marvell EBU (Kirkwood, Dove, Armada XP/370) to DT schema
> format. Add "error" to interrupt-names which is in use, but missing.
> 
> Shorten the example from 10 child nodes to 6 as the additional ones
> don't add much value to the example.
> 
> 
> [...]

Applied, thanks!

[1/1] dt-bindings: PCI: Convert Marvell EBU to schema
      commit: 761aebd2d783a068afd7c81925dc8be9df58bf2c

Best regards,
-- 
Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

