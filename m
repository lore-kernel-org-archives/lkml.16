Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03205261574
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 22:27:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746829674; cv=none; b=CsWV1v151Q3Gxw1nKbLC+T7spT03paj1CCxnEAaTtE+BzPWnnmws6Uk+OGLl7DoST/UGnjaT8DHrG6BRC+tbAYok1TzAGXKq9hwUEK+kslCoHrPxx5gRcDDH2lr6fyeIxiRta+pvxFtxAYUaQYAXnLVcVcxPeGn0FyMSViWkLGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746829674; c=relaxed/simple;
	bh=fpcCe5Pe3DQ99Xt5/ZVJQxg4XXuoBQ3TXj482waHmN0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fPckbLOHsL769roqeUXlpqwBbFthSRWfsJjoJJ8WXCYs3hZ0KOe9jXp3uAARP21evetIlXkn2NGN1DrixHH1f3AQKfvavrwvWAC0QU4hOtMDuhsClVBQWHU5HmRAEmV7jzEJZ9U36DTtosVkwlWMywzzB6WRynpq3UfZz+o2eXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pdp7.com; spf=none smtp.mailfrom=pdp7.com; dkim=pass (2048-bit key) header.d=pdp7-com.20230601.gappssmtp.com header.i=@pdp7-com.20230601.gappssmtp.com header.b=q0tflXen; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pdp7.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=pdp7.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pdp7-com.20230601.gappssmtp.com header.i=@pdp7-com.20230601.gappssmtp.com header.b="q0tflXen"
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-b1fde81de05so1644555a12.1
        for <linux-kernel@vger.kernel.org>; Fri, 09 May 2025 15:27:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pdp7-com.20230601.gappssmtp.com; s=20230601; t=1746829671; x=1747434471; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SlfY6HFrt6KjD7LtGN0cH5vsLg4tj5XTdmzdfNRbZFQ=;
        b=q0tflXenaF26nFZQ0OZLF+enPQSgKw/Q+/e0AzkZnyuKvBWkpTeo6TE+3aOQuzUqkO
         GN4JdiJCyQJ8z0rTYlCVrZKC+ZYgykT4zlXCME1NZYf1OI4aTvs7bSnWSIOhi1HrDFNp
         HS1zBS6ueMR/X3rKPbxpCmank5R/HYYJb1WxpuPwfCGJRt1OVdgdAv1AvI7kHQJypKpR
         T8FFAU8PJm9ygd7g/KzJ7gZe/Jxhfqr0HtO8VEU/ponA8zDvwCFMDDKUnRuosTOoKk+I
         p5SADGfzAwXDdSmIH+J5cFLxAAHhk0rbN22USSIhYVhy8vkpvojXB6IM0FJV9HV065zC
         ALrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746829671; x=1747434471;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SlfY6HFrt6KjD7LtGN0cH5vsLg4tj5XTdmzdfNRbZFQ=;
        b=Q/2TYEpbV/QTwRdAxEKGniTfeeNn0zJBItMwpzKlBc8AYm9AM3yueJJZlMUwpNzRi7
         Ol1ScfVTN268cvGB9TuarFegGU6q9Xnhg68BURUsUEXmKibg72TS+GuIe98OoWesUeWu
         geZKrA7J5FGFkxvhfPTL+2nzZkD6TqxIJD11/6OI+wqOr9yOmSTstCBGXHC7OiSb1MfN
         k7vL1dYhqnht5/FpZXxke/rLOAhaC4cmasZFyrafPGXMPhLXAbkazx20cdJkjsuCkZVM
         5GRtmdZrycr3eF62Qonk/NdKG4MG+hB8JTSaQR9a8Y1OTTQVadHTSmrFaWz9VIQYBWdT
         k3CA==
X-Forwarded-Encrypted: i=1; AJvYcCWMvfP368Zdspo8Ic/IMB1hDrArKDckHlFbjUtjD7reHIFrAtVDx5gxIpYmcXivNZKtegmex4Kjpf0XNRA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw01W69dquPBDV3/6U5JNDiHC6ZM/xQtcYAL978D2Zqt+yFNAAz
	hQN15lZmoSeCmkf06K4iPkxPoIEh/+I/SdY+KR6sUY3pHFGb3Lptl3dQVVxNtYk=
X-Gm-Gg: ASbGnctcdFD7cImPXQwfNLyOuK3dZ+6HjE9U4xHNUkMnpugYiUJH7oAq4TKd1peyub4
	vSTpLKMxh2jEAGAFomDZ9CBtpTbHMUhP/8SL/KfGBmwIS6YVT+8E8tEwTMyBlkoOQLjjXI0GK4I
	Xkp7DL9M+ZtrTcml3RREi2Bs8hXDnI/gj0eFPECRt+Z0I1s30XiPlIPZ94rz7roG+5n+oZS06RV
	c4lAmMTNXbQLzRm+eyRhm2t3YCOiGTixVwToXAUApCEx1LG9qES/mC/1OwZMhMNugTrjTEf+r6D
	oeLmLHqdaasf0Abzr8R1HBPU40GxL1H4wnkZcxHse8Qi3TJbBQyJjR5pIQ==
X-Google-Smtp-Source: AGHT+IENf7Kcb8dJPQCDteAQPpxoaSfjEOkbSR/iBVh1JMloeodx77VyrnDGlCBUYNSjh2bS0sBuDQ==
X-Received: by 2002:a17:903:41c2:b0:22e:62da:2e66 with SMTP id d9443c01a7336-22fc8c78182mr82262675ad.24.1746829671116;
        Fri, 09 May 2025 15:27:51 -0700 (PDT)
Received: from x1 (97-120-122-6.ptld.qwest.net. [97.120.122.6])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22fc82a0e52sm22426175ad.216.2025.05.09.15.27.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 May 2025 15:27:50 -0700 (PDT)
Date: Fri, 9 May 2025 15:27:48 -0700
From: Drew Fustini <drew@pdp7.com>
To: soc@kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>, Conor Dooley <conor@kernel.org>,
	Jisheng Zhang <jszhang@kernel.org>, Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>,
	Michal Wilczynski <m.wilczynski@samsung.com>,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: T-HEAD Devicetrees for v6.16
Message-ID: <aB6BZMWDXoRXrZVf@x1>
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

  git@github.com:pdp7/linux.git tags/thead-dt-for-v6.16

for you to fetch changes up to a4c95b924d513728df8631471eb3b1c300909e21:

  riscv: dts: thead: Add device tree VO clock controller (2025-05-07 23:38:41 -0700)

----------------------------------------------------------------
T-HEAD Devicetrees for v6.16

There are several additions for the T-Head TH1520 SoC:

 - AON (Always-On) node which serves as a power-domain controller
 - Reset controller node
 - VO (Video Output) clock controller node

These changes have all been tested in linux-next with the corresponding
driver patches.

Signed-off-by: Drew Fustini <drew@pdp7.com>

----------------------------------------------------------------
Michal Wilczynski (3):
      riscv: dts: thead: Introduce power domain nodes with aon firmware
      riscv: dts: thead: Introduce reset controller node
      riscv: dts: thead: Add device tree VO clock controller

 arch/riscv/boot/dts/thead/th1520.dtsi | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)
