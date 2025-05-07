Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 029F51482F5
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 18:57:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746644222; cv=none; b=g1SSopSOpaA6nx+6bKLOnBb2IvHhdXL6EVujNq9mtYOFCst++VlLBqdknbT4QH6S8063uZAs+5N5jkxOs2GaSiaDG/2fJyW3SHxGTcuOxUl4S3utBZFq+XPakTjheAPSVrtTa6za/UrlDQ3pQSGKM74hAZQHv2wogXBe9mhXEJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746644222; c=relaxed/simple;
	bh=pe3tyzUnuTHHV9wY+pcDILJl9icjd/4bGQ8VCrn/BHA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XPxeHmeG7fpC3huzFL/g/UN0QNzNcFcEJMsuWHdlxkKJJngJSgmoSIIyXmbzFgU5UNVXHdE49wNHvhJvwLDnZjxvA4HH3hZ64T7xwhzF9462XH+ZzT0zIcpm2HhDCVzXoIbrTjt8nqpxup63lS74rtneUqbU8C9pT/5cbtuGn5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pdp7.com; spf=none smtp.mailfrom=pdp7.com; dkim=pass (2048-bit key) header.d=pdp7-com.20230601.gappssmtp.com header.i=@pdp7-com.20230601.gappssmtp.com header.b=byBmq9J0; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pdp7.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=pdp7.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pdp7-com.20230601.gappssmtp.com header.i=@pdp7-com.20230601.gappssmtp.com header.b="byBmq9J0"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-736c3e7b390so292457b3a.2
        for <linux-kernel@vger.kernel.org>; Wed, 07 May 2025 11:57:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pdp7-com.20230601.gappssmtp.com; s=20230601; t=1746644220; x=1747249020; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0D7Z3FNBB3xDX5RO0FZQrmLI3qnCJ7UO3XkdhJ32m+0=;
        b=byBmq9J0BMzGUW2oBf42qoORUcDgUlFE3wFaB8cqTPOUaKk2DtgfSZnUduQX+NxQXi
         JaZJpaTqPH+ePjESJDw/tC7aI4xmkXxR4pykLReKqndmUo3INRJfyHHRLO7ccJo7ksRp
         OgUqzkXnTg/tov4QyM1nisO1uvMUQVf/SMeB76Vp0R94DHmRp5kmXtpFxtRaJxLZHOVB
         IFTCFduzGAuDaLpeNJwD0LnKc6bt8cfWE7DDQuS3F8FmaPiHrP2UDQ3dAPSH+zKbIG33
         te9rj1aksaleiDWPAKY2Bn5ITFoFY8tGTIGLhvLpaiyb9AatvtPioMCy496dKXbVOfif
         jaHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746644220; x=1747249020;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0D7Z3FNBB3xDX5RO0FZQrmLI3qnCJ7UO3XkdhJ32m+0=;
        b=aLLGVXDsZFFwnSEETAi21Bjit9Qhb5aDoLlCNMIzvtdcRTbs+Egk/QGVpNVvbzdhad
         yIGrQ1QkXtzwU4CDTEor/X6SUkCcCfxdq+b8fiod2NNT/O4++oSVjOSKNk3OTc5+skeE
         Zi0rpUKEZFDEAyZggxOQDrlUF9lT1VlWlAOfdwQXLf5Ws6PIraIWSlZdjji2XyBy+420
         tUORjIUftWupD9jk/UxXu19sUxhzSZbfKr7+VG+K/Qgfq/71wbC6LimfGIC9E1nyurp6
         LsD/Tj0wJNt8xxEbDN7B0RszDtAZW/sny1cm45lNpZEvf1SH9CG1UCeelzlqorQxh3Vn
         rjnA==
X-Forwarded-Encrypted: i=1; AJvYcCWfM+GoUnkQDxmibuFg2yT1jw7TcZh++pPFlYsBw8RqnwqOeagjZaWYFYjL/ML9A/tHQtaDEE70B8yo7Io=@vger.kernel.org
X-Gm-Message-State: AOJu0YxPgdPBY8CRHn7h1x7pu4Qf3anEFZAeCmOucO+7QQkSfeYHWXGA
	lOzuxvF3wfZrPj8f1AFmdBQmJ9WpHG/ohYnb4vSG/1LD7MusS/ADC0sbio8dnDk=
X-Gm-Gg: ASbGncsC2UGBxxPZQwIKj1G2FX4o7VkW2AdL0SG4ufxbyl6t0dWKesiitefwMyUR1md
	RIjYBIXnYbejG40zuNl7f/aQ9XqDLzdCY+W9ikNPy0Ood2E5KlIWzUsm1HuM11XRyeJKtl1tBfl
	9Tn5QQimC1wQ4xQZadlP/q3D91t2CCQB6g2rAAUu2p8+cidv69/VQZL/5QL4jAd+9TY7alqGvnj
	InoIjoAnGDVIafX9L1BEmCPLDss25/vQRmusb1+p7QFWHQvnESWAx2eTeQZZpvMjzCpkxVdbLpu
	11Gk4FnVToy7d0zDGXF7Oq9aJYES91MIP5UvuON261sqPnk=
X-Google-Smtp-Source: AGHT+IEdnDHavMVVsk2ZTJfyzX7ew+kWTOFVAkNqTxlCa/8qxYi15T/lhuGRhufPsi1FCD90sh72qQ==
X-Received: by 2002:a05:6a00:e0b:b0:736:32d2:aa93 with SMTP id d2e1a72fcca58-740a9a91092mr595573b3a.20.1746644220028;
        Wed, 07 May 2025 11:57:00 -0700 (PDT)
Received: from x1 (97-120-122-6.ptld.qwest.net. [97.120.122.6])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-740590a2735sm12068773b3a.176.2025.05.07.11.56.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 11:56:59 -0700 (PDT)
Date: Wed, 7 May 2025 11:56:57 -0700
From: Drew Fustini <drew@pdp7.com>
To: Stephen Boyd <sboyd@kernel.org>
Cc: devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	Michael Turquette <mturquette@baylibre.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>, Fu Wei <wefu@redhat.com>,
	Guo Ren <guoren@kernel.org>, Jisheng Zhang <jszhang@kernel.org>,
	Palmer Dabbelt <palmer@rivosinc.com>,
	Michal Wilczynski <m.wilczynski@samsung.com>
Subject: [GIT PULL] clk: thead: Updates for v6.16
Message-ID: <aBus+Yc7kf/H2HE5@x1>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The following changes since commit 0af2f6be1b4281385b618cb86ad946eded089ac8:

  Linux 6.15-rc1 (2025-04-06 13:11:33 -0700)

are available in the Git repository at:

  git@github.com:pdp7/linux.git tags/thead-clk-for-v6.16

for you to fetch changes up to 50d4b157fa96bfeb4f383d7dad80f8bdef0d1d2a:

  clk: thead: Add clock support for VO subsystem in T-HEAD TH1520 SoC (2025-05-07 10:09:28 -0700)

----------------------------------------------------------------
T-HEAD clock changes for v6.16

Add clock support for the Video Output (VO) subsystem in the T-HEAD
TH1520 SoC. This includes the device tree bindings for the VO clock
controller as well as extending the TH1520 clk driver to provide
clock functionality for the VO subsystem.

Signed-off-by: Drew Fustini <drew@pdp7.com>

----------------------------------------------------------------
Michal Wilczynski (2):
      dt-bindings: clock: thead: Add TH1520 VO clock controller
      clk: thead: Add clock support for VO subsystem in T-HEAD TH1520 SoC

 .../bindings/clock/thead,th1520-clk-ap.yaml        |  17 +-
 drivers/clk/thead/clk-th1520-ap.c                  | 196 ++++++++++++++++++---
 include/dt-bindings/clock/thead,th1520-clk-ap.h    |  34 ++++
 3 files changed, 216 insertions(+), 31 deletions(-)
