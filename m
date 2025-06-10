Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 939851714B2;
	Tue, 10 Jun 2025 01:54:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749520464; cv=none; b=plYZOr3g9r4OHvORjzjcnmEQlU9PWVNELXrIM0GkqSA7rA1YkDt8HSyunjQsjkEgPZFRHKU1R1CntizXabi7QnDSVmvid6hk3ZUbLZOHZdIsT0nO/R8gyCOvwlFgXYy3FEThVU2OYHK19TqXlGCvMTrNZkEbMFM5LZVrOU1qhtY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749520464; c=relaxed/simple;
	bh=NB+87qNxRVZfDW7UBsllocQT/yoOGf/1PU7g7n1qjaY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ifZnqECrO6fmZYDRs5Eq2mcVG1PLLq63+DrM1oa6xx4yuR0Vx74YhnewYipcrQ2BcPAEuMvxbf9XLCe9vGx9fH5N8FSMr81MQGAXwIK+4nPblXI3UZ2LixUCxC5pZ5aJWTldwYMLHljSayW5CEdMMrOIXoP/q2DJQbu9wL+Ei8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hi3Dv9gY; arc=none smtp.client-ip=209.85.222.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hi3Dv9gY"
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-7d21cecc11fso811353585a.3;
        Mon, 09 Jun 2025 18:54:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749520461; x=1750125261; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zysQkTOL7VgaSXw9pls6ruJyOkXSEGdyuCbnLSDDgu8=;
        b=hi3Dv9gY/04moesusRSTKVPJc7f7O6FcnUTUmVkXmVXE4jOieIlLIYormadXrMzJQ4
         2YXjG9wgTv1wZnqTXzlV/9JOc9z4Emxf1TG+g09vcvXxo0Je6YF+EJCIrleqtJ+IbJ16
         OzkrdWajoSI+1vImhE0kF2m8Li56ZtTfQcpAFliz1lXxbAd/iyx4gftFunI/FzxCiny8
         qWxMbu4BQ22YZv8hhd/owuM9HzjkJba+rVnkqizEmGHRw9dOJx4mMOqRJMpswZ1wov+i
         JPnHnDviB3V5+Kz9ClZixW6e0DjI1pga+6k7FjuIkXq63DGdbgnz0QBeWYwa2jxhDAjQ
         vloA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749520461; x=1750125261;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zysQkTOL7VgaSXw9pls6ruJyOkXSEGdyuCbnLSDDgu8=;
        b=DqHx94PCStMv7tTBM1jQBE0vy2F05I2uUdixgqndV6546pnAZCLYUTI0Ejz5jaTNfL
         I1HaReGoV3jRwHgGp2i5OsQrZYunR3U8hpVCGaqs4gxUGouXcR7F9QGMgz9VFrskug7Q
         NivlJp+RyU0IkeUITXJwZET2Nq+YQ1g6/zUJqPrHI0FWJbST3kRalGJr8DuqZ3t1ipcj
         zkz3Ek1yo+OhwSDEwVi2+ZdDA4YzKzaJxpdsUjBhEtG9S0659E1G1aVJKLwEtjNQRrN/
         yspIEVJRUhnppESt1nWr6p/mHGH9RFrSC9/oTlowVKL23t4bAEGlRnsR7CY0ZhsoccER
         uWmg==
X-Forwarded-Encrypted: i=1; AJvYcCVDQV6wd2gOV4Oz4StLBGwsaBELdo0OhqvkHTPXAcF4WC/X0F3iQM9hVFkQsuDmNj9Ljky/axOncM8EnYp/@vger.kernel.org, AJvYcCWvaoiin79qTZQfvQhFqPeV17+zCzXSZdVp035h2n31+6+lG502VoPVk43XYuQAwqElHqI6ZYNdfwoo@vger.kernel.org
X-Gm-Message-State: AOJu0YxRpNXYNpzTpVVf2f+d8axmTOIRlKTldxJUpuwlvh0sI+SGF9cI
	FN6HbPWcj4MiLl2rAWJuZYZ7MsjJ9anxhHjupt3dYqPc+0zZBGT3gJyl
X-Gm-Gg: ASbGncs/Ps6pR2Lfu6gKWFIXbnzw+xoDqWrTOP0eZhHExSoSerUu3fYeovtW6BflfnX
	DIPwLCRSepQUJnnaQH0nuqqx7WjCDsf00ACe+v34WcXazw3E3YVOK3koxTKlxX4wjRkb/kCud3H
	hdtGhNC6NOm5/IXXm3V69oHqivmMM1suB/cJWLUROi0w2kBD0o+OKLW8LfsAVgUKIO29UbsLwqF
	wD39vYCy2tvp9gbNifx6OB39c9uhY1GmHNXc+m2Qw+qswayZLQ812A/M+tMrON4Igq6xZylxRVs
	KcxziwBk4zhMNJwsrnbu3kU025gq+khKctHVvkdweVRe/6JR
X-Google-Smtp-Source: AGHT+IGJg+//Ofhuk923r0pXGjvlOiPdRgjYkQEFmw4lkzq3etJ3xBBBD+f4KoaeRoOYtCBqhB6xhA==
X-Received: by 2002:a05:620a:8b15:b0:7ca:f3c6:c0a1 with SMTP id af79cd13be357-7d2298ed317mr1921854085a.55.1749520461458;
        Mon, 09 Jun 2025 18:54:21 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id af79cd13be357-7d25a61a8ebsm622857485a.89.2025.06.09.18.54.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jun 2025 18:54:21 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Chen Wang <unicorn_wang@outlook.com>,
	sophgo@lists.linux.dev,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>
Cc: Inochi Amaoto <inochiama@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: dts: sophgo: cv18xx: Add RTCSYS device node
Date: Tue, 10 Jun 2025 09:53:12 +0800
Message-ID: <174952038849.949885.15347540485983948845.b4-ty@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250513203128.620731-1-alexander.sverdlin@gmail.com>
References: <20250513203128.620731-1-alexander.sverdlin@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Tue, 13 May 2025 22:31:25 +0200, Alexander Sverdlin wrote:
> Add the RTCSYS MFD node: in Cvitek CV18xx and its successors RTC Subsystem
> is quite advanced and provides SoC power management functions as well.
> 
> The SoC family also contains DW8051 block (Intel 8051 compatible CPU core)
> and an associated SRAM. The corresponding control registers are mapped into
> RTCSYS address space as well.
> 
> [...]

Applied to fixes, thanks!

[1/1] riscv: dts: sophgo: cv18xx: Add RTCSYS device node
      (no commit info)

Thanks,
Inochi

