Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3446D1A8419;
	Tue, 13 May 2025 04:18:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747109939; cv=none; b=q2+DNH9SpSNJO+uyskeeFQahlI2PjnC1PiiHMpFyJT0T2c22nME7EM5fAGxpxeae3QGsTAmY1i0t5Ue/SpOCDnXZhSbr1dknJSApHBxlX1V7OmYj8MN+yr6q7ja/+nRPAo2UnrW8Dabir4qs3mM+ZnrSJ+gZ0rU2rdaAL3Kd1Aw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747109939; c=relaxed/simple;
	bh=hi53hLrUWkV9TsKSTo69nzQE8r+S7yQ++UM4RHhaEGU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RDcBBQ+XHoTkpH+q4P2clTziKwYiltvCYqPTn62Q0+YLiBUYMxady0iao4sMrftGQnuFj7jJ5ExhfqHKurlitgZAB6pBoRgUHXedS0uzRiFZ6uzMLxGviI8pA9MquQCtywaJsaef4t0R7ejxvOtNV3HDGFLl6qIWswqEdnRyqvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GRsiOJ4b; arc=none smtp.client-ip=209.85.222.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GRsiOJ4b"
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-7c5e39d1db2so340036285a.3;
        Mon, 12 May 2025 21:18:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747109937; x=1747714737; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GaDplt6uD8Ya6GFL9X4E2+dAW3ebBpnL9rF8heIlQDQ=;
        b=GRsiOJ4bJ5BlddClHRWV1XV/61SC0jDfjL1krB9kRczfpGIUR7Wcuft2CtC/f4OR7/
         dBoq9GXw27L06sw4QptLqDs6tn4icAh7/MZqYkQRX/wcE4OZFU/Fg1XsyrQ9OvxhV7Fm
         djG0EycCC8iD4eYs0dbZ1KSB41WGkdRyT8xJgxxPYn5PgqiQzhD3W7kNIMJ+527tnoHE
         ZzUeGJuFj5NcTBda92t0aP6fnpvIKfWz0s3Wm6PDfZYWdG1M/dIGsHaGKBxGPB7d7rI8
         IsX/Ltw/uZf5yyoRLn/AuVQDK6Tn4fXqufjuETmaGM1xdVJziu/DrDHF+cV8RGh2jWw7
         L0TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747109937; x=1747714737;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GaDplt6uD8Ya6GFL9X4E2+dAW3ebBpnL9rF8heIlQDQ=;
        b=pqcwAXnJF0jSPLzol7C4+HTbF5C2cA72fttqIBF9zkoOjbP3wZT1KI0asDS6vm7BwB
         ycpkwsut3pPY5JpzNP9Lcw2byCsB7MYBxx3t+lPNYPazaeRaXIo2QLeckq7xhZ+43vbu
         fKV+L9z9iumMJf8hP5OwuxogwHpvbla1v2lYdsrFny1Thk3lmm6V0/Ic9VBdTUivL4md
         JOtzd4xLQDooaV5hCHy67DAnhBiIzyE6X8VprweEUNstmnsn30w2tpx5iG8CCFgBW5ME
         9W02QHL0NJ+mx9h0Ei2/pquqeSY0SBPORktfX6ylFtOaJE1l2yOqfv9Q6yBs/dkOEWf7
         4OXg==
X-Forwarded-Encrypted: i=1; AJvYcCX3Rod1TKsaDLZkT90xG2uu5h1VFVwKsPH5K5898inEGqY3dF8jooCpRPs9L1LJs71ZDBRldneuGUGKB58=@vger.kernel.org
X-Gm-Message-State: AOJu0YwyiBEO+h3KYALP3ZGWHf6wLPsMVvUXMUg1TvLcc+azlHvpTYhF
	2pl0sy5X5pCF+bVp52xiYRc9/j85XVQ9Vo+7+pAYw5iL9GBpJgKh
X-Gm-Gg: ASbGncvwwlmZ2wzlOUoR+tCtHKiwHnz28UTmgqScseOuVTrg6IPfoQJBK8aO21TjucF
	e+fE2DTa8YJD6lyxcTfRRqjw4h3R79ZBLYv9I5fI/yRxSpluMMUqAhLhlECN2ZqbxxgMxX7oBDP
	lBkawbBW+dghtu8MXFAMRErZ389pxwd5GsvlEVTD/OW+vLGM+1qcvLMV+Zj6C+t1MYPFBnqz0CD
	WqH2suRpIgXJPHT2FqyN9rwJNlgvfwwgGL4zVB8RdjLY1NKhJEM2RIf5Ev3wcEsIwPWRSdZIzkt
	QVuTInvzvwpkLu2wDb/sh0Ej+SQpIVGXRUcZVg==
X-Google-Smtp-Source: AGHT+IGlBRWOdS3CfEkXVh58/z7On7nwxsAIWM5VLGw1h5sQ4XN4zOiVj+aqM40scUBbTtFSgOXdbg==
X-Received: by 2002:a05:620a:9518:b0:7cd:155:383 with SMTP id af79cd13be357-7cd01550387mr2276285385a.30.1747109937021;
        Mon, 12 May 2025 21:18:57 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id af79cd13be357-7cd00f6378asm651965985a.29.2025.05.12.21.18.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 May 2025 21:18:56 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Chen Wang <unicorn_wang@outlook.com>,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>,
	Inochi Amaoto <inochiama@gmail.com>
Cc: devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH 0/4] riscv: sophgo: cv18xx: dts rework, part 1
Date: Tue, 13 May 2025 12:18:21 +0800
Message-ID: <174710989159.597941.17259091695735282020.b4-ty@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250430012654.235830-1-inochiama@gmail.com>
References: <20250430012654.235830-1-inochiama@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Wed, 30 Apr 2025 09:26:49 +0800, Inochi Amaoto wrote:
> It is a hard time to maintain cv18xx/sg200x device tree file, as
> it uses something that dts override, shared peripheral header
> and something hard to migrate arm64 arch. So it is time to rework
> the device tree file and reduce potential problems.
> 
> The part 1 change mainly focus on the format of the current dts
> file, and try to make them easy to understand and adpat for the
> arm64 arch.
> 
> [...]

Applied to for-next, thanks!

[1/4] riscv: dts: sophgo: Move all soc specific device into soc dtsi file
      https://github.com/sophgo/linux/commit/e07daed2a1577ec5b9eafcfa0b690d4082661024
[2/4] riscv: dts: sophgo: Move riscv cpu definition to a separate file
      https://github.com/sophgo/linux/commit/4f6d5f22f94db169b58809de57db2fe95ce3fa35
[3/4] riscv: dts: sophgo: rename header file cv18xx.dtsi to cv180x.dtsi
      https://github.com/sophgo/linux/commit/4a7f2bba7bdb2d3afbca8d40268503d32868c325
[4/4] riscv: dts: sopgho: use SOC_PERIPHERAL_IRQ to calculate interrupt number
      https://github.com/sophgo/linux/commit/53cf91b37246948935de7147d09ae6a98070400f

Thanks,
Inochi

