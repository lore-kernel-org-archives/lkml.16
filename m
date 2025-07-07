Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73F4C4A3E;
	Mon,  7 Jul 2025 00:32:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751848330; cv=none; b=b064k9ZegOhxasT5Ogkg8jKzHIj3nfqmZJXNavrS12+2DDw0XcUM4dczlBEogLMl1N2vtw5HybIloGalU4FX/rPMXw8tHARVsN6ICriZOLso+Yb2txemsTrWYyK+zBmOUUY50pRFC3ufqfCGCfNSeoYvn3yzwXLT6Ictzx9WLf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751848330; c=relaxed/simple;
	bh=mhbc0WemYmG8rm7InaTf8LWaoJtr9oPrFfMT15Fe94M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mTksE7dLb7SjJVrCCEHZ1iN2LMp4Ukn+HmArQuispl76FtbaJdl//wjIeWGReRW4zK8vOyKG/5TxXT+WOi2+O61DCzsH/98f81oCV7HWyD0K9qZabJ5sboGOe7Lw7ruRPhCZO8AGVOS6c/QUqTnw3KnhZ/M94I/P5ScohvTdKaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CjjWRng1; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CjjWRng1"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-7fd35b301bdso2612464a12.2;
        Sun, 06 Jul 2025 17:32:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751848329; x=1752453129; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=waNYge1pVnAmfDAo+Scw1VWP79dyDXSW85JWJajzOys=;
        b=CjjWRng1/yBXsTo8SS37DCSs8xrIraEdFmcXWtmpgSEFgD1CvB73e6navO8Toh21MS
         NdZGYBa5GLFcX23OKkDoNEwpu10Ivd0DfxAy4yCwd2DnMfX8tEbfOVZaEDDHmNnHJG3z
         mIIhR4zwPcz2yMIbHnsylteqDWseHgdiv0F431IRxMD5gv97Dixnl/0e7kkVTQ2G4lSS
         pXUP+P9OuCk5VHY6d6/QkXwd3crCvKXlx4S9lHizObKbfcZYagN1JPWp5RY9BdbZiagj
         FDtfQzGYEDpKOeHop9vcPnPEr8MhTDR74H1RufXd56JcSS2IDf2I6RiAT4+Wvt20tKb+
         154Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751848329; x=1752453129;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=waNYge1pVnAmfDAo+Scw1VWP79dyDXSW85JWJajzOys=;
        b=u3yfmRRmb+zUthNqKpiy3UWvHFvWi4k1Of1ppDxmSJdznXk1zBBYAxAsM769go6RgQ
         rKdB5+Wa5obpRkwcuov8x5/N9a0zXdsuhcZYyAl4dCdgRgHCodgp6IWToJI9bDTctSEq
         dj/x+QRP6RQhQDL4Rm9XH8lQFKm807/fzPOqUF9kh68ENaKoVh26gCqtNTETjrtnA5oS
         L6pqQnmURXPZV6ggW85Yik6Y4AhKmanILYI0lW1xeaV7Aj4QjcMjvhKPn3/FVmIEPFA/
         L7fFVS2fE5PJkh0SBwYGWNCWfwLtmz2W4oBI/v4mcxIVjCp9xBkqoDUANxWTIMZYq/55
         Ahuw==
X-Forwarded-Encrypted: i=1; AJvYcCWdfVe5O5TSZPQshZaqO7HXCNXPJScluz924WsTVwuJ+eZhVekxLbODFSRQNs5BjS+HuzZ0KBSbm9TqOdY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxI1uxZTBRh2otaVHUHFroYorqBiT3NuzIuAaYvv5GRrDdMQMwR
	oQCKyqgsW5ou2S3bmawLaIcH2doA4Jm64LASezprNw004gQvcJQsHHmc
X-Gm-Gg: ASbGncvOsESkTg570DPG/tUjEihS11sSgZephZxYdlZqFSo6Aw30GfoUTK4P8vOENYH
	SFcd82UKy1Won9vBanoSrasi7cvJJmT+ZPX82mowfyqUQUaYaU5HIhlCOGAH8n7dV6+w6sYrdCf
	D7JNijA3n3wrcJlxRGB6JCvtpiyz0AHDwDvDtFMHX/e8AFWoX6QgZ2Rx4I+NQhFziMrjhXzgVPA
	/Cu2VDU8Sg3nvSw7TSNBPpDXnkJ/vIqsTNQ9Tdv/ol9OqYbdK/d49iQvwjqcpMlurwI1jTiSg5q
	s1taSnONCyakEHYpwbud1UeRBg3heSFKrrQJGsgL+Hw7lNJTPSdDeKyTS4Dy0Q==
X-Google-Smtp-Source: AGHT+IEJfwXHQNDfml8NzaqLJBaxvkA9HUYq+A9+IyCh9ibIK7D1D9K8y86d2uYsm2pa9DcODEISyg==
X-Received: by 2002:a17:90b:3c8f:b0:312:1d2d:18e2 with SMTP id 98e67ed59e1d1-31aac4b2f1cmr15485476a91.20.1751848328607;
        Sun, 06 Jul 2025 17:32:08 -0700 (PDT)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with UTF8SMTPSA id 98e67ed59e1d1-31a9cc66830sm10477012a91.16.2025.07.06.17.32.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Jul 2025 17:32:08 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Chen Wang <unicorn_wang@outlook.com>,
	Longbin Li <looong.bin@gmail.com>,
	Inochi Amaoto <inochiama@gmail.com>
Cc: devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Yixun Lan <dlan@gentoo.org>
Subject: Re: [PATCH 0/2] riscv: dts: sophgo: sg2044: add PCIe device node
Date: Mon,  7 Jul 2025 08:31:59 +0800
Message-ID: <175184826045.122679.3644918560620246720.b4-ty@gmail.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250618015851.272188-1-inochiama@gmail.com>
References: <20250618015851.272188-1-inochiama@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Wed, 18 Jun 2025 09:58:47 +0800, Inochi Amaoto wrote:
> As the PCIe driver is merged, add device node of PCIe device and MSI
> device for SG2044.
> 
> Inochi Amaoto (2):
>   riscv: dts: sophgo: sg2044: add MSI device support for SG2044
>   riscv: dts: sophgo: sg2044: add PCIe device support for SG2044
> 
> [...]

Applied to for-next, thanks!

[1/2] riscv: dts: sophgo: sg2044: add MSI device support for SG2044
      https://github.com/sophgo/linux/commit/29ce381d6bc61b23024c6ee42a5745d4becb28c1
[2/2] riscv: dts: sophgo: sg2044: add PCIe device support for SG2044
      https://github.com/sophgo/linux/commit/55fd09df36d7c6ae59d82a7df5072827f65a0eb4

Thanks,
Inochi

