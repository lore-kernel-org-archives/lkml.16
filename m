Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2C2B4A24;
	Tue,  6 May 2025 23:46:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746575186; cv=none; b=hCZCrk3reLN530SIDHvMftR8gZ6K7ARd+GGcZp98/avGDRdliCYp09+1n0DEYYnM6GBLYLTOimUo/6f3T88xN8HI0meMckNhu7AUfaSBa2ZJZhgPw3rdp0Yf/foR2Oi/JIBVbQS11zDH3NBUL04aXK3/4AGplVIVz3mlQ2WLEyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746575186; c=relaxed/simple;
	bh=B6iRLx81tiF2365iKD/myCSIQNO1TeC7kdHgjWx2T9U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tw1HLbYg5JuudoO1fvPRWLJGmjcu/JhApXfQfeyJ2YrwEs68PYU8OMGBohTtOhgWBF0oKRfU0GBCgYPL8ZzGFa0TIB8DLkLm4RDXH4xBJSdFRAufao1VtPLQnCPP9J21nVEAN8pJh7BU7vSzkjolegEHw4FkaovYcUgai4P2WR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KEpk0OUu; arc=none smtp.client-ip=209.85.222.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KEpk0OUu"
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-7c597760323so652910785a.3;
        Tue, 06 May 2025 16:46:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746575183; x=1747179983; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kNpUQ6GumF9/TU6uK+pRbTYeJUeB4xU1u30e/GuoHLE=;
        b=KEpk0OUuu4URMyX6Ymi3IhYURGfyt9vQuWL00ngFT9rS+mJzYc+gzOr75wTD+UZeMF
         DLd6tQwvDEi8rPYgN11kPNMP1XX6GO1ajnXOpn2ILYWlj17owIUWCK0FxJMpOEdWJwqy
         tAuaq/SZ8u6bxqJs+ZJEHQqgbe2VRqHfscT3qJvN8rfcrqc0kjrX21XdwwvmrET/f8e0
         GxrVdOrsazKN7nzKpv5HT1skvXeXLXunrpxPP2Wgw/x/99Nmei6aa5GyX/54rA33PUQK
         l7Ph5alRn2MIwdrhzJ5fo3jFZReIQNv1dpRftXMCR7UcndISrLp3xGsqyQ60xnRJ8J1x
         Epow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746575183; x=1747179983;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kNpUQ6GumF9/TU6uK+pRbTYeJUeB4xU1u30e/GuoHLE=;
        b=U5Lrtz9pvd9g2ba5cW3lU0/CEaBl8oNVMCvlQUwiUAJfVs20XnnePHI4bLT4l0Mflv
         gAbunCoC0aZL5kmRMBfHTDiVmzA5iohtpSILfU16yZFn06s1jtidi+gnku2rD0bDZl1w
         WcCq9GLX66WqlMVbjhYszj0qMWdx21Hh5+mdK8xB2oxfqr1ZdX9OvURb4z1hDAtYCh9r
         9ZfnBwFr0kOk/L/cizvmXdCg+7GOG+IOifXJB4csAgrh3NoPE1ZIiKnj2lhzuOPCl4+T
         kMk1dKqsTMsbCAJjDL9QbOFPwPQmBFsT6J+gYzkDNcs11mFgHXO6fSZ4wSS78G8ivVZs
         PAig==
X-Forwarded-Encrypted: i=1; AJvYcCUoVchBjwVsfM5BNEkgVzRRxOdxpzjX3fiYqzPem+Z+qcNbXfA1wJLDaAqIGVDGnTSddu8wMcnfvV+1Mk+Z@vger.kernel.org, AJvYcCWEcCVwDvT3Z+ykIH1xX/X1pYrpb0q9isumQYPkgnARPpLCXMRHtiL5dMhJp+oFGluCHb61x7mSVXSP@vger.kernel.org
X-Gm-Message-State: AOJu0YzzK4aEkoXmnaZ+PZwFJ0HDBycwMw/1GpIycZB4ydvPgOCsKTu+
	fjdlcMwN+LNdQyPpj5ttKmYK1BCbuh1OanIPHcUX0o0ydNoshj1u
X-Gm-Gg: ASbGncvDmBSqhzgY78XNtvfqk/AzstCqeLnQhd1184lSOXWVxeN/O08dSq1Wx5Ow6QY
	tun0US9XkJZbXv6eQfA9KqsPOR49HbNUmHfhx+QIMXpsVZcLyslHooc1RSECb6EW06BgXfuOrK0
	5NEovFaeVkV2ujLtCJe80fjDnNeCvPtwWpU91PdTAUvmh7QxKPZy91RZ57BEzzpuwevv+MvhzxY
	A0smbgpTiIjR8d6nfDrX4chFR4fly5xPB0emzRe+YRtH4w3kee2D28Sb0QgiGyMR9YDGwL2RMw/
	bEJPrQAiwbWAzl3mWzYSqjwFxMo=
X-Google-Smtp-Source: AGHT+IHeDbXh28cKEU2lNRj30EE82yC2TAKjYla28J2iicvKZY5F7e3fcCLy0NDluJznncuzGWfCsw==
X-Received: by 2002:a05:620a:1724:b0:7ca:cd43:e46e with SMTP id af79cd13be357-7caf73fa4bfmr266382985a.36.1746575183537;
        Tue, 06 May 2025 16:46:23 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id af79cd13be357-7caf75b87casm46952985a.74.2025.05.06.16.46.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 16:46:23 -0700 (PDT)
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
Date: Wed,  7 May 2025 07:45:53 +0800
Message-ID: <174657514013.201370.6246239358631068735.b4-ty@gmail.com>
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

Applied to sophgo-clk-for-6.16-rc1, thanks!

[1/3] dt-bindings: clock: sophgo: Use precise compatible for CV1800 series SoC
      https://github.com/sophgo/linux/commit/6d880961f5f9b84d13fb4a0208c7405966bc3489
[2/3] clk: sophgo: Add support for newly added precise compatible
      https://github.com/sophgo/linux/commit/dd8bbae9fefeead76f20cd410a5a8299fcbad220

Thanks,
Inochi

