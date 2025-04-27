Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19CAC1D5159
	for <linux-kernel@vger.kernel.org>; Sun, 27 Apr 2025 17:38:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745775541; cv=none; b=ESM/UtFAGfgwLE2Zp1PpxdikPo6IVopOqF+IZpuUPpTOEwVcg0VUOaDmf1yj7Wb1+oQOfs9ct6iIy18iH8SWsYB2tjcF2vrn7q0z0/td+A1OS4ZbDQRR45Uomvplh5W9ubMY6PSSgK7v6upnvdm1m/dY5Z1xX0wHFkfC6C947/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745775541; c=relaxed/simple;
	bh=xlOkb+AA7EeoOdc+SBv2SlUBLZ444ktBXbA5itkBKrM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mgFgJ5+FNjXxvcTu2vGH7wQTmnTahdQQbSBlUAUcMYNwfQUlZfngM5vPVI8tnuJ41oOX8YHGaeWOvh4xirfNj0ctZAYSgBgIwQx8a7lwIGbSL+E73un3M2pI/OAEfKl8Ag3Gp7X9PapV16gT1NMG9AIXXsMhWDWNNZbQUOLzOsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Mj8FXkbf; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Mj8FXkbf"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-225df540edcso50467235ad.0
        for <linux-kernel@vger.kernel.org>; Sun, 27 Apr 2025 10:38:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745775539; x=1746380339; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vQlOF7pnuoHcV4tUzU9FAAnsi+yiSpTmFNxdSuCGH2w=;
        b=Mj8FXkbfunkSE18HhuzSHu4wNXue46L4eyK1um4fP0zZA+/wZIxQtCehMiy3k8HWK5
         zTr6skiGx8KaOMWhEPCIcbZYvp4qWAS2N6hgeSf3J7hlEr6HphBMtXj40hClGxVe3PWi
         2hyKdt4hg98/OceoiFc49UwHcVR++anQVqQ341lwGAKZVgfdjbz39dTyizOMXh8X2Pe4
         h3kdal2AMuWC7EKs6GbcJt8XoHrxcni9W77GGcjb6tfmk/xQxNNk2UpEUTMBUa+VX6fc
         Knm+RaCnAFhxW98wwbYvD4npZ2u0yQLpsdnm+QmFym2g4htklIQq8RhgIcpcn1TAENoj
         LOuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745775539; x=1746380339;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vQlOF7pnuoHcV4tUzU9FAAnsi+yiSpTmFNxdSuCGH2w=;
        b=YLuZyMD42D3MC/X0+/taeZa+eorHk4tw728yoqea/Puc3onKIJBGydiVbcvZC7L/Ey
         J27h9uHRNPxRnK6eGdn5gJcmnY4kyWemNsViAe/Fx3glOC5p4zNCqgsH9JA2013DI4ih
         NCmF+PWTfH9mi/Qjg8F6GKiXjvi4WKMDsHdCEzfLOzxZNdoly7uzfKMSeFgP9yVUQymy
         /wxji5B/HhXAwPvtJvxN4MAJHsgdutnIaUwts4Z3Nv4c2XLrjGOm0dTiKB6uKwOPFhJu
         ecemVyIqBDTOhAPd37r7MWJ1sfTO5jIi+MGGG+AILFhDPe+VPJnisLAOW98ddLBlcg7S
         QE2Q==
X-Forwarded-Encrypted: i=1; AJvYcCXJ7MYJKfxMmUok/4pmvRiSOsiXwYYlVNToe+Uo+uROrjmk1zPvV/p5G+dr7c2Bvj2hnktwCmPYPBD66g4=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywl8CdNQCbi3yBQhXdhiw/K7uVQIprX8T6VhF/xDVc7tY/xAZHt
	/vdscP7ar27nyjBZrVWXl55ZhDpEi7XJtCf1Ca2NH0a83lauqKZRl4rUImXc2A==
X-Gm-Gg: ASbGncuJizIKs4qOolB80DPZCXSqy9E/A9AuG2SSAbB3K73WXIXNmoC0C467AKIWB2s
	NzogcSb2RJzOFBF3oK53FiE2/v0B8eKM7UlPI1nQXMapY3dytauAoLfQUmFUDpjkaDcy1ipUFru
	R2W2lhlfoZ6HQOvFPJ6c/0AOtwOcsKBzI4yo7IozzzvZwR0Wf97/hcgixlXeqrFJq+gv6HVxWsy
	TJ0UNkJytyMyMLxCr9tDzEFCeGpQMe08PS/EIwlse6g5sz049Z9PvJg3JMmI8HTE7Hf4nTmt5wP
	7UoVh9hxRgLUmdVbezWPB6zMCg8zLhOF1fKgY9/doujJB0XrE1IU
X-Google-Smtp-Source: AGHT+IEU5IH9SCIsyt0qXj4mqk3Sr5u/bdn7eIkZRJYO1TNJJ8pz73ALG1a7lc4tKhheycKSRkIO8A==
X-Received: by 2002:a17:902:d4c2:b0:220:ff82:1c60 with SMTP id d9443c01a7336-22db481b546mr195207145ad.14.1745775539333;
        Sun, 27 Apr 2025 10:38:59 -0700 (PDT)
Received: from thinkpad.. ([120.60.52.11])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db4dbad7dsm66569285ad.60.2025.04.27.10.38.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Apr 2025 10:38:58 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Diederik de Haas <didi.debian@cknow.org>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Dragan Simic <dsimic@manjaro.org>,
	Rob Herring <robh@kernel.org>,
	Shawn Lin <shawn.lin@rock-chips.com>,
	Niklas Cassel <cassel@kernel.org>,
	linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] PCI: dw-rockchip: Fix function call sequence in rockchip_pcie_phy_deinit
Date: Sun, 27 Apr 2025 23:08:49 +0530
Message-ID: <174577552237.92328.3418257212908173284.b4-ty@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250417142138.1377451-1-didi.debian@cknow.org>
References: <20250417142138.1377451-1-didi.debian@cknow.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 17 Apr 2025 16:21:18 +0200, Diederik de Haas wrote:
> The documentation for the phy_power_off() function explicitly says
> 
>   Must be called before phy_exit().
> 
> So let's follow that instruction.
> 
> 
> [...]

Applied, thanks!

[1/1] PCI: dw-rockchip: Fix function call sequence in rockchip_pcie_phy_deinit
      commit: 286ed198b899739862456f451eda884558526a9d

Best regards,
-- 
Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
