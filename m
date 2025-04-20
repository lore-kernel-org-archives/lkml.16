Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32B6819258E
	for <linux-kernel@vger.kernel.org>; Sun, 20 Apr 2025 04:15:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745122504; cv=none; b=kWLZGsQi/nbl6/l5WCJrmM/tu155NPoUYAfoWCfK0FpThMcc13ajjLyXUC/X6cRjo5zT0JKwHGRNqmGYbvbu7CPW4cgO38VnX4dcdHIeTsJABObW4Hpmp1SIgaslB42P1DFa+dy1z5bnsEiVDjmtuBX/IPRBJV2kQ3849Oe94pg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745122504; c=relaxed/simple;
	bh=5wxG/PD3y1gNjGB7AK6b5PlI67QEyByu1d/flv9JTpI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=NB+dzz9UDSxxsILJmt8UuoKRhYMNJqH1TcFKWSLEV1s44aBccJL+B+Hd362CtoBTg0D8DBIrXlVwO11/QGsy1iB8IbVG4m1pxHrwT8JSYws+HCRUuXB6ZwFZ1pjmy8VDuy/lEj69RLmkg7QGsVgNb3um8XXcZwG57RLrGop1w6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IFOuQoHP; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IFOuQoHP"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-227cf12df27so26071675ad.0
        for <linux-kernel@vger.kernel.org>; Sat, 19 Apr 2025 21:15:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745122502; x=1745727302; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q2HXiX0Llqkid7BbKxFHITtAYArqMyUNvEqqrLum1r4=;
        b=IFOuQoHP5cMJfaiJsVCYWSMhTh/Q+0G4JBJFmslnIcreFrb9GvFsP/k9RwHUvx5z7d
         OODekzgM77emRXLqa8ka7dwwjA4MOoocFFck6cEUU/CdrJb6PSsk9ns6G855q/FcKAoj
         TUyFQFi2XxoorOhq8dGYnaVp2miD8/zc99mLaA2uJG2rDvAD912RMDZ+E+2fj0l8vgz5
         aaYuqIeOPp7EWfo1uj4hm7kr308BPG/pKSZUa96CdR4NiPqmZEBZuw/tj2azFNopA+yf
         VyMyk5GNLLR2GOWXmw1eY5+quVktvkrNabI3Ql5QRBLShVww3itsDSPtV5GzLPJvQkkI
         7kYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745122502; x=1745727302;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q2HXiX0Llqkid7BbKxFHITtAYArqMyUNvEqqrLum1r4=;
        b=ANhv3QbjlKxC6X6ObUKWAcU29nIWRZQ0gLM8WF7RdqmvTb2eR0gqDWTxTEPoxZauJA
         JgnbbHHD6PLQHFueE1jUa2xcQyAc4G59KF1/TINj7QZTgfsJsCua7IeuhzO9IChQK8JZ
         ghRse6kWEMtjxCPxSSzuV/j2U7wWub8hwf8aJwB6eGFxHVwi8ao52zKKmiDuDTdI7AI6
         ITXE7XFfjIu9P3OlfjpBHuwmd97rzGf76ICTz+mwDa+igiO6szlfWND/yqvy1JErZ6NK
         e/Q82yZDmtvuPf9HWi8fHZGAjIEaicIfAvq4QPNxzjzu1fBKX/iy6KiDzMnn7Aim8yMy
         cyCQ==
X-Forwarded-Encrypted: i=1; AJvYcCWvX32i6CE+MwGYbEgd984cZ1eroG1v0SXwJ7TjKjKVczzKybZIxPsDJrkYRwN8Wjx6bC2kz5XO2LdCtBk=@vger.kernel.org
X-Gm-Message-State: AOJu0YydenXt+eUX1npqvMELJALNjKq36txg8+4FRciSUzkoB5pWcXzb
	r/QNLnq4R/40WytxIop8zZ5+P5fvdMZhu9xGQZJLD4OsWSlyM3gxKHspCmn1xA==
X-Gm-Gg: ASbGnctD25XbSuUT0dbemzF6Hnw7vJbzTfU5s3P6PQBJl6OuMY+NvrfLwtgso6J/6b6
	2Di2lFI7jepPLA5Tux5/Wp4h/BjiYm486Ff7b7PXEwBo6IvIzJ/748cUOxVJSdV9yrjBdYeh9vY
	HC8ClpGC/c0+tvqgB0mLVRyHPhRMZx1NRcB9NPt+gXD3IowXuXCaan5ey8eWHZoH+6g3UhuzOEw
	Z9Af/qg6ShgUhIsdQjmjC1gs0XNeWNQoYjxRNmkkG33ZufKQ6XBIob1T8MvyQyIgxTmwRfnOO/6
	FnsiRbLnC+fr7xJTYRPlXCSqdKomzB+gBWFtfONav8k2FlX+b4m0KQ==
X-Google-Smtp-Source: AGHT+IEoRogqNsHUePuqqRRfsSxmfzIJqF8/P5aLwK+/NB/DXV9xoYPlMraILqGL7x+DlXFdEmPRaA==
X-Received: by 2002:a17:903:2f81:b0:215:742e:5cff with SMTP id d9443c01a7336-22c53ef1653mr122737365ad.16.1745122502501;
        Sat, 19 Apr 2025 21:15:02 -0700 (PDT)
Received: from [127.0.1.1] ([36.255.17.92])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c50fde851sm41412575ad.239.2025.04.19.21.14.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Apr 2025 21:15:02 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, 
 Bjorn Helgaas <bhelgaas@google.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jingoo Han <jingoohan1@gmail.com>, 
 Gustavo Pimentel <gustavo.pimentel@synopsys.com>, 
 "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20250414214135.1680076-1-robh@kernel.org>
References: <20250414214135.1680076-1-robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: PCI: Convert marvell,armada8k-pcie to
 schema
Message-Id: <174512249875.7011.12246888223550931495.b4-ty@linaro.org>
Date: Sun, 20 Apr 2025 09:44:58 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2


On Mon, 14 Apr 2025 16:41:33 -0500, Rob Herring (Arm) wrote:
> Convert the marvell,armada8k-pcie binding to DT schema. The binding
> uses different names for reg, clocks, and phys which have to be added
> to the common Synopsys DWC binding.
> 
> The "marvell,reset-gpio" property was not documented. Mark it deprecated
> as the "reset-gpios" property can be used instead. The "msi-parent"
> property was also not documented.
> 
> [...]

Applied, thanks!

[1/1] dt-bindings: PCI: Convert marvell,armada8k-pcie to schema
      commit: 82f48c8c83f576edb2614c49d0980f8d65eb4772

Best regards,
-- 
Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

