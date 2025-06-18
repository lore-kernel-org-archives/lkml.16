Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47E661DFE09;
	Wed, 18 Jun 2025 03:12:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750216379; cv=none; b=USZgs2TeQ95FtRN0FugMUjd+sUCEePhS8oGCgZOEOBT4/rxaq9kmG8iSPOxzVfGKsO/OiH5Yga2zut0MxPlAtjvkGz400xLtJgYD+VV4Ta6JRmTqowSRd3ZmCgGH6OQwj9c3TyAaVshykuhK8dxpmCYrrIYgoBtI900poI36Azo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750216379; c=relaxed/simple;
	bh=CaIBrWdHA8A6Hl+8od7bG7PtDXCOvZVEVSYJx4ibA8A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pCLTmdKHr73vjVtc2PjsnhqxDVABzTFJsUgNKC2dFOHc/op/VgK7efpeHJb4rmxZH5Dqnjv0khAbkt59sKkrGCEGZr8tF7XcgNsvobqbWe955yKD4JjW2h0Vs7SwWjTfH7LK4JkgLXZR+7LN3KRLUxgyQafRVdLYeXTfW34yc+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NMmfFaKZ; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NMmfFaKZ"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-23633a6ac50so93629405ad.2;
        Tue, 17 Jun 2025 20:12:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750216377; x=1750821177; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rVmw5bZbkl4jrrqCt8IvJKSgjCMD7aRK/gZMumHgDnk=;
        b=NMmfFaKZoDx/OjsULVrdQQXkDfLrQuZPCcp7bdl/3+EEo+Hf1z3PIGjGpvAMPiXegy
         askk2n97c6v6DkGS/scxxO1sktTjnwqUNSm/qsJSsKz1jPuYuyfQl5Odb+X/OK292ygt
         uG/ceoYf2m+TVkVBkJRLA9Mqv60B43Tl89oz54BrKacKtk8QjrL6I44//Hj+Gx95y+xE
         RKVtMxfDw41727a46obtH3ON0pKzqQ+iHrd2qXhRpLH+D3ObG3zAK9WEZamCOx7Ni5tF
         mI8bIqAHTcO4SiRxMnIxfM1Bv0q90SYznvIzuOy4hgaHtQ25PM+w9NRGyQPfY/wjMl97
         ZRvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750216377; x=1750821177;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rVmw5bZbkl4jrrqCt8IvJKSgjCMD7aRK/gZMumHgDnk=;
        b=oUIJ7oafFPIFtJJBhAOIN4Onqrjedq5W35wUl+QTAPJX3HgId0a9gSwOPBJu/wPp1G
         85VymOFMKtN5gUShk1rtTPm22vNybwVVsCQUx+m1d14OcIi9/Vku644XBnU6msr9xIl+
         M3M7Xf3dtVxCPA+1kfmLr/LFRgL2oYbZZoMmJbgtpIIjGiqmvUzIp/R2/jM52FKlpbnq
         Gcxb7dLWfOZJPzKFsVzmtzY9gILXEAv6trI3sime4RUGWWX6+yhEngJLYGzvo9TxkLcs
         GIZ+NDBK2A5DytspaCRTh+v8P3zqVCS0bWO5GjOl1sQ7PXo3WrvEJTRhboeXwwD5mavA
         /VvQ==
X-Forwarded-Encrypted: i=1; AJvYcCWbpTTvAJaFOcPgmjcZDoGVT0AKB3aE6Hhw18fTIPPgw2sed0vxKE2RnT08rOK7sCnqHLvNAnmYS7X9@vger.kernel.org, AJvYcCX1d1akTr1YME2Ks3btV05odUUgfayGksE9VrAY+xgsQzUf3xizgXKKFaFYALal5t2FolQczpKBA8NNYF6u@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1E4CRhCYOl/V1jMTkAfaY/lgobVF7mSKCqeXraO9gr//r5r5E
	CCimnjVYfTdq/LsX+B8qHiOHxpwWZpyDQ0hqknNFB1Q8y0WAFoWMPsTm
X-Gm-Gg: ASbGncuTkXUmn81xxVEKRpO0/CmQV/lpoJdYWL/82qzQQduACNVOxSihgY3uTeSfs2C
	iVt8MO0Yl33zcq/yCxqrlMwe4usmF9CxuUd3Zrd2XUa+kksTG06p8SNgSiDKWRyknkrEZ0EGOt2
	1LOYrNQDS9cwwSr6WiXc9l7094p0xFrAoacd5b7bJgMHvG937YmVfFev0dTCvAzteB507CiDM3A
	+jpoZ96UEp5ABNq6JIrFGL162UE/OkFyjOLe5R/BOZw1m9O6xvJANZuGSR0SsnKJistHU3tvqf4
	6Xx//nBQGe5/nBiNPyGCiPpiWcll2S9sZMIXYkd6KwhXNWIMOeP9KxQovRmx6BBUExxWixsp
X-Google-Smtp-Source: AGHT+IH8hgD1LGsHJfDQnAXl9HvOeBTvxQ0AmdkVrJ64/WhDiqReq6a0y9o7OxH1H5lmzbPMTmNXgw==
X-Received: by 2002:a17:902:ce81:b0:234:f1ac:c036 with SMTP id d9443c01a7336-2366b40b7c2mr211182775ad.50.1750216377556;
        Tue, 17 Jun 2025 20:12:57 -0700 (PDT)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with UTF8SMTPSA id 41be03b00d2f7-b2fe1642ecfsm9772763a12.19.2025.06.17.20.12.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 20:12:57 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Minas Harutyunyan <hminas@synopsys.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>
Cc: linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	sophgo@lists.linux.dev,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH 2/2] usb: dwc2: follow compatible string change for Sophgo CV18XX/SG200X series SoC
Date: Wed, 18 Jun 2025 11:11:30 +0800
Message-ID: <20250618031132.373216-3-inochiama@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250618031132.373216-1-inochiama@gmail.com>
References: <20250618031132.373216-1-inochiama@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As the wildcard name is dropped and favor new compatible string
which match a real SoC, and it is not used for any board at now.

Rename it to sophgo,cv1800b-usb to match the binding change.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 drivers/usb/dwc2/params.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/dwc2/params.c b/drivers/usb/dwc2/params.c
index 4d73fae80b12..ea6bd537e337 100644
--- a/drivers/usb/dwc2/params.c
+++ b/drivers/usb/dwc2/params.c
@@ -334,7 +334,7 @@ const struct of_device_id dwc2_of_match_table[] = {
 	  .data = dwc2_set_amlogic_a1_params },
 	{ .compatible = "amcc,dwc-otg", .data = dwc2_set_amcc_params },
 	{ .compatible = "apm,apm82181-dwc-otg", .data = dwc2_set_amcc_params },
-	{ .compatible = "sophgo,cv1800-usb",
+	{ .compatible = "sophgo,cv1800b-usb",
 	  .data = dwc2_set_cv1800_params },
 	{ .compatible = "st,stm32f4x9-fsotg",
 	  .data = dwc2_set_stm32f4x9_fsotg_params },
-- 
2.49.0

