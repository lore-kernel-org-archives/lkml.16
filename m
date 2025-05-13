Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E49041DB363;
	Tue, 13 May 2025 04:19:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747109955; cv=none; b=S1q0SR1/hu1oZ4HVIgPI6H3S9zanet+l3Wnm2nSDiGwFgjUs7punj+qeUaOiLWm0IklFWWZmeCfLG0T9TLOBw/g80mv3TMrhJQU8qyVcZdadxkz7f/KUCqRGdSgpkxe0gHWInFNs35Ggd8lYAgNaQ+HtwJK78qjV32SLUhnK3l8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747109955; c=relaxed/simple;
	bh=kGZWRZOeRSkQaw367SMSl+gSUcwpGB0B3nI9lZI6dg0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PwILDaYn6DqJhxrIcVzimqkVN93yV16z4sAC+ijh6GIYD+1sNtRX9259v3GBHyW+6elmMHqV3nYQM3A8+D9WNV9KRt9QxB2XPX7L9xPkSVquFH41vDlygb7KRdPLVsv5SYikelBaNT1JQ9PQWp3TYX7skEtuJYGZjv6X0XFaOsg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GwS6FyjQ; arc=none smtp.client-ip=209.85.222.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GwS6FyjQ"
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-7cad6a4fae4so906359685a.2;
        Mon, 12 May 2025 21:19:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747109953; x=1747714753; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SFbsTQE9tHKiV3IKABKjWIYDMs9C+L7n7mu7OXh8b2s=;
        b=GwS6FyjQ82gIHWy3QGbeLmIdY/IS5etIfRp2kzZxOFSWv1veP7DCV2vD+1rB/Mv+Lk
         PVOKZMhfNThjpMA8yyWoVIVQcUsEFTuydto6fvFiN33x6WdSVPv4XQm//cYu7NNSjklH
         JwmicF51HAK3bYjeNWtYoqutkYhjCeVg027QzuwKphEtet8Cd4fKSXweECC4EVAqxUrT
         KiodSFR2p9DI8WogE3+8QjMrOT537yBhCZQ2xsfgWv6tn0pQTyqZwzbFMZ8h27PSqlEs
         XZhsWLzgBKhAdTvQ8YybApIPV6+FxT+mFv5IwaWyGyGtOIJFURmWd96+hA9eEE/e1u8w
         AupQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747109953; x=1747714753;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SFbsTQE9tHKiV3IKABKjWIYDMs9C+L7n7mu7OXh8b2s=;
        b=caScMOJMK4T+8I0pJ+IWbLFevSbFbp9j8B3tSkgF+U+7RDOlI+pR4aQoQ26VzjZ+5c
         BnZdheox9kP2errt3TFD3q3J1/wy/777CJfLB6hyNQBgkap1vnrOCeZJnrdKBOLSDbMa
         OqgSQNR/2l77UCtOVsZai5EXSZM5YUT+1r82vDb+alG94ZcZbqAEnxpAjrMdEcGOPTHC
         8Q5I6ADGtsp7xliHfGE79Lzb0hPLxNb2BAyHyRAFFoE4hCbM9KHWrfQf/chrid8ILF1N
         Q6fD6s75fmkfkO2+f66dKuAOm01XrYalkywIqB6c6D4kAIOGfspYVaQQFaplRGnruVlC
         CkQA==
X-Forwarded-Encrypted: i=1; AJvYcCW4soTj8Kjy3nYALbuCKdRKDydGN/Gn4VHD7eW8qVTIiaRLBnsQtvHX7SOQo0bp4IzfTNwVYhopVknEam5S@vger.kernel.org, AJvYcCWWxXR2jsxWCfuOnKm3uYPwB8mkRUuLyu9qU8LfX4Rhnd0pTUciSF2821xQuIPQQG9X/Y5CXaAZ9GY5@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/9JMyatqIwUANjNjaOv1kPsS1f7cz6lTSvF3g6R/5q8yi/AAN
	VRwwSB9yyTNQOL0MYw74xOGo5ZCUoUZ51Uanbo8g6M1xZIjTvQGY
X-Gm-Gg: ASbGncuSivKyvR/wSTa5+st67JIcIsJ9W1TYiPhj9Zu3NhpJIUAOkRvWq71cN7uILx6
	KNz/BelEH4qjKI5b3NKpFAVtWFJ2nyCoooko1ILkFuhb72WJNB1p1wj7HMIYnyIPVC937/BT7I3
	4PBwR/usZdn5xKxipWcLkPh9CDce+0QV6Yee2LXs0/TzUaNPsxubg3HPaM+tgUOwN25uS9NL5Io
	OlDz3/f81PX+VVcdor7Lf6dqPxfwhUDeHrIu/OhGEmzvazta7tfkaU9AvCyWG8JACS2CyFYkRRP
	LmKS2639Sg0zNghhkiVxdvLoJWnCyi8s+l8mEw==
X-Google-Smtp-Source: AGHT+IGS3DH141eF3XFbywTS59BbLhX/9gyOryljRpt7OKQZ/4+tNhx00bLdZ/bOFxGP5J/MjBr5Cg==
X-Received: by 2002:a05:620a:1b88:b0:7c5:ad99:9e38 with SMTP id af79cd13be357-7cd01143dd6mr2694467085a.43.1747109952721;
        Mon, 12 May 2025 21:19:12 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id af79cd13be357-7cd00fe620csm645540485a.97.2025.05.12.21.19.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 May 2025 21:19:12 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>,
	Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
	Inochi Amaoto <inochiama@gmail.com>
Cc: linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: Re: (subset) [PATCH v2 0/3] riscv: sophgo: cv18xx: dts rework, part 2
Date: Tue, 13 May 2025 12:18:23 +0800
Message-ID: <174710989166.597941.2836952647121868068.b4-ty@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250504104553.1447819-1-inochiama@gmail.com>
References: <20250504104553.1447819-1-inochiama@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Sun, 04 May 2025 18:45:49 +0800, Inochi Amaoto wrote:
> The part 2 of dts rework replaces precise compatible for existed clock device
> with old wildcard one.
> 
> Changed from v1:
> - https://lore.kernel.org/all/20250430020932.307198-1-inochiama@gmail.com/
> 1. patch 1: reused sophgo,sg2000-clk for sg2002.
> 2. patch 1: mention sg2002 refer to a real device, not a wildcard one in
>             commit message.
> 3. patch 2: fix wrong data for sophgo,cv1812h-clk.
> 4. patch 2: remove compatible sophgo,sg2002-clk.
> 5. patch 3: adapt the change of patch 1,2.
> 
> [...]

Applied to for-next, thanks!

[3/3] riscv: dts: sophgo: switch precise compatible for existed clock device for CV18XX
      https://github.com/sophgo/linux/commit/6493272ec02706dcb2a32a1c7b14e47432ce6d6a

Thanks,
Inochi

