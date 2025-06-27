Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FD2A291C1E;
	Fri, 27 Jun 2025 23:32:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751067128; cv=none; b=S0qWJQ6yawqzzlGTSkQBOzRqyVo1o5HejsNVg7CVdW4JioVuiF+66BKs5IWsa5nqylGcvYrZOXn0eL1AebkAG2PNzi4m/zhZOFnz3TDFDGFeqpwXr48ngrHtkMFC9Xob+BcfK5dlw4wComJFwso2c6ifAGNDie5wmyQv4AZIP/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751067128; c=relaxed/simple;
	bh=YPnTiOfKeorNB8r7cpyKWvCUxr6j45iw769OI9lLoV8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ss7XG3PK8ywZfxq0kgUL1vXJSjLq6nFpYwiEH7qqLXruaQAbgGpfeRxYB6erUmsUzwZRfbWhSJhq0DeotU4bqqOe/Qsc7JdFyLU19EBF/AG6TgFPpIr58Gh4Td4mcjxUZH8rZ0NkGZ00rh5j2TS2tn2IwqSZWJTDls3UR8Orbro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H0SWFBoI; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H0SWFBoI"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-23633a6ac50so32785685ad.2;
        Fri, 27 Jun 2025 16:32:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751067126; x=1751671926; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I+DGQNS5yV0iBqaU1x/InlhD/xcyDEGMcKU4WcCfmD4=;
        b=H0SWFBoI41JJwiYC8lY/fYwyXuxR5/EJvimjS+X1ea1A8ZGMQ1oGQ9U+Vo1ONrPyPt
         HilISygfHR+TPp4jzW0UR4gp/WQKDF3giUe8FPWtCUixt8nQfR5nYuhHZiWUXimbQKRC
         jtcm5q7JB2CI/FAry/AhwiIxo+t2IicqbHBnPrzKEGdbPwqX34dNHx8zpkx6A5dXFFJP
         7qW0YRYQ/PLewQsL6sxD/E2RGuKsRip2gllvYy5PYBcsf9KKnkUd9ilP2iL3RoKv56pt
         KPKa0jUe0EoDEH2s58+wYdypv4zCWVcLtcl9eeOhz8storIR1Y91kJOXL0LUV4Md8azC
         Uasw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751067126; x=1751671926;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I+DGQNS5yV0iBqaU1x/InlhD/xcyDEGMcKU4WcCfmD4=;
        b=HWt/E8BVIO/LS3kB+B4cpvVp9i0qwl3+8gQQhqs+RvKJq+PLGe6J80h7xvnHH5rJY0
         FKGOECQnWeeRMtopIAEtxEnvY2G5adcCk0QuDhhe8RcMabUbc4SK7yp5mt4zs0Ko7vWU
         Hpjxw7b0l4JFsu4IhCRVOQlCbK2UKwXeoSLu4UhfsYC8AkPLMLF9Nl1dz2zb96MaoWO/
         wL8vDrHAQ5ra+5BrkoLyN0t7HCm8j8Q2U06gctXbTqQuKMI27dFdknt/+Oy0SIZ5nkfl
         t/28uyr/Ij9/T/7xcUTbxuMrtMUPZeEuJZiORgVqb1FFZBPfqqhmXxp42tk58JROKFHX
         qKLQ==
X-Forwarded-Encrypted: i=1; AJvYcCVakO4Oosf37FdYsvwXaFJsxL9yotYZNldO7o8hkBeyKVJzPZJaTRdhLkXSfYdyBXFkoUoqqBr0JMenkDs=@vger.kernel.org
X-Gm-Message-State: AOJu0YzAM/nWt807g57a7+lVfVbESzuVmJOMTfJAD1PeBxjTnTxY+157
	YBuND4UYRdbt50V9zRW520YtrxCWuZP/oYLktKuDAEnF4stFbmXeO5mb
X-Gm-Gg: ASbGncs26ORScH+F88+xKs4wYdTo5c1E1op4zstnHUiGXIHFlHiwBYglgf9SPSiEcbi
	wE2tQOdgm2LtBNanuaiYHegp4vL36nS6aBFIk8v0wtNqlYmHxO82RUpoi5qAF8ZJ1IZDNe3KNOX
	CsowiHHZ2ocmOgejLGNdbbhDaCQimUXKNBME/ivSSMEWUI8r1AbTjcLVu509M9pHeaguTNfIAZT
	ZFaoJFoPqOTwAWKPa+aIClqXuEhPcz5hXfE+5y+AkAuBV29KxOofw5JnjHGp7WXnTCpuYPNQ58B
	6ECZ3FXRMWkx2p8v57teSX6RSlsj+SD9zYT+YVFx1Q/v7CR+yf80dWADhoq2lQ==
X-Google-Smtp-Source: AGHT+IHg7vP7/d9S3v6EOl8gQObtoAsfGkXEWElQTHDuv46nJXJg9sI7JyZdzQjwWXqvHw/s8C35xg==
X-Received: by 2002:a17:903:b8f:b0:235:88b:2d06 with SMTP id d9443c01a7336-23ac3bffd96mr67891485ad.6.1751067125934;
        Fri, 27 Jun 2025 16:32:05 -0700 (PDT)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with UTF8SMTPSA id 98e67ed59e1d1-315f539e6ccsm7564660a91.17.2025.06.27.16.32.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 16:32:05 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Yixun Lan <dlan@gentoo.org>,
	Ze Huang <huangze@whut.edu.cn>,
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>,
	Inochi Amaoto <inochiama@gmail.com>
Cc: devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Longbin Li <looong.bin@gmail.com>
Subject: Re: (subset) [PATCH v4 0/4] riscv: sophgo: cv18xx: Add reset generator support
Date: Sat, 28 Jun 2025 07:31:50 +0800
Message-ID: <175106708298.79260.10445943203117657356.b4-ty@gmail.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250617070144.1149926-1-inochiama@gmail.com>
References: <20250617070144.1149926-1-inochiama@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Tue, 17 Jun 2025 15:01:38 +0800, Inochi Amaoto wrote:
> Like SG2042, CV1800 Series SoCs also have simple bit reset generator.
> Add necessary code and bindings for it.
> 
> Changes from v4:
> 1. patch 1: convert the compatible as entry of enum.
> 1. patch 2, 3: apply Alexander's tag.
> 1. patch 3: apply Junhui's tag.
> 
> [...]

Applied to for-next, thanks!

[3/4] riscv: dts: sophgo: add reset generator for Sophgo CV1800 series SoC
      https://github.com/sophgo/linux/commit/fcb3f47c81afe43b336bf8033234417445789807
[4/4] riscv: dts: sophgo: add reset configuration for Sophgo CV1800 series SoC
      https://github.com/sophgo/linux/commit/880f18ee6772d4add69519cb7de2fcf9f4769cd6

Thanks,
Inochi

