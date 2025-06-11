Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93706239E74;
	Wed, 11 Jun 2025 08:26:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749630365; cv=none; b=dv+wfGL8ZbJqWJbKM7ryEc5bJpHhuowwn8emjBesq12ae+NCKRKerAGoTqSaxYTGJKd4oleqLn2OGmVi5MgNHADbWvDDGJzk7fSFPWCflSBk2Wyo0S27T2m/kpfauxKcV51c34xoIGovpa4rvtU3rXb5NWAnM+Jb6BcQ1OU26AE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749630365; c=relaxed/simple;
	bh=oHshKpS8U6n2biCwRD+WFd94TuWLzC8tz5YORyxSnOk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KlPE97fQlroEpUixooyIh2aYRJdRBpCSn+mtR6QzACjJov/MTssLStImtTAnQA3wWjc7GyMlhYHbqaVoyeMES9Kp/6AxGJMm/3AcQnAP1zNvAa60U6WZJpRYgDvzgmfvAIov3yZFF7NymiR573UQcG59bHN+XwFan0d1GsIrIzA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U/iIewk/; arc=none smtp.client-ip=209.85.222.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U/iIewk/"
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-7d219896edeso625965585a.1;
        Wed, 11 Jun 2025 01:26:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749630362; x=1750235162; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mxDj74r2F7SZcoM0PboKeLbt+zjbwKcJyw0F7Gv8gm8=;
        b=U/iIewk/7hO/lpr50MQspra8qq1ihALjZo7tKBvB6OjFCq8YqfagWnPcZ0jFXBVvIc
         IJVBONLd89Gfk6Pe6QsJeqeY+yjoxo5c5RJysdWhRih5dW2U0CtLsT+z/RAU2sjGK+JD
         aBeOD3CXD5JzTujMglhGQpCVls6G7uRrL0XPxk+p/Llv5hG7OjeqdYLG0XQOWfLp3unD
         uHHoXePROHW6U38H0ikr9mA1EphtAJBDIWQUZ/nBwE7tRBxo7jrW2BftHkBN79nieuu6
         QUuAb0cz+K7f55sPgrO2369WiiNTcvgY+wbXT7RPliietcKk+5vf/siHqzDnrUsBgkFK
         zOUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749630362; x=1750235162;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mxDj74r2F7SZcoM0PboKeLbt+zjbwKcJyw0F7Gv8gm8=;
        b=wJI5Dzk/ME5LZ0ZxOP6N1rVnJmANp1MV2+zS+K4AUClYJrvScPD7M1DC+Oe5EBfvvR
         zjad9QE/ZJ3hTiw0A9SNoNmSrqaCGDKlzJORoOY/TNbS26P1zdh41cpXx6piGacwqEGB
         uIJke9uf14ByYwHH2o0dwLC6Segvl27aHO4MV2TMKlj/gPtiSPaN+BPelKFLQLi0o7ZW
         ODPOV+p59Oro19v3B9Hu8CybrCb1xKXxYkbkX+52t51F6mRSqziPPHs0ZeIW5I16D6Tu
         95I0umpBCfB0Fn45OwTJcwPRrfm41wnNo6qLCZ/1P6KefXMeQbUKHnCsxDCU+kNhlR9w
         oyaA==
X-Forwarded-Encrypted: i=1; AJvYcCWS9YqNjh1waOIq1selwNXC1B7tJImqhee2JdiDMftD6fdl2v1dVL4BQY5qFCLKMtAvc4Ehr33K56U2yR4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxV2JB3+ZPlq2MrbIHCsXAubxfYfwyGQxdfotWkcAkcZ6uYXm7f
	nrb+4MksmDSxh9ZPtoQH2llGwBhzpTRqyKC8PUG1dn7ivQBYwUJ6jGfk
X-Gm-Gg: ASbGncvCXJDL4/Mc50Ffoh9nfufD/iBMz0X5QjLDNvwUCmHYz058JOlrvbQ3dr2vw5N
	aSWTh8TFBq0TffaT6MgnTUlX441ba/EAbqf0JOfLmawUQqa5/QDljnmQfutAt+SeQANYBtnzWb0
	L/LnaSkU9ghilnXA0z9/l19y8/0ToZ8aZ2j+Dga/27BXPwvMOuwsWBhzYyNu7K933yh2XkVzwJo
	SDDCMJs/8P4jw5K6KdQuq4mwwvXPPAkGYTVUYggpc4pIHFLq1pj/v102ES3b2LowDDFW0agEsTX
	5y7ruhfZteH3xyk8lA3bAb4/L3njIYM8ly7HkKO4Q/k6KPDa
X-Google-Smtp-Source: AGHT+IEwaN4dBdPQ+NDYVxNKaVab4sJPvqdTUOFH7bLWBppsyFBAN2TwbbXkYP0gjhdzUVTSukz4sQ==
X-Received: by 2002:a05:620a:3904:b0:7cd:3b02:b6e4 with SMTP id af79cd13be357-7d3a8806020mr398355185a.1.1749630362302;
        Wed, 11 Jun 2025 01:26:02 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id af79cd13be357-7d2669b4444sm834084985a.105.2025.06.11.01.26.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 01:26:01 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Yu Yuan <yu.yuan@sjtu.edu.cn>,
	Yixun Lan <dlan@gentoo.org>,
	Ze Huang <huangze@whut.edu.cn>,
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>
Cc: devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH RFC 0/3] riscv: sophgo: add top syscon device for cv18xx
Date: Wed, 11 Jun 2025 16:24:48 +0800
Message-ID: <20250611082452.1218817-1-inochiama@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add top syscon device bindings related DTS change for CV1800.

The patch required the following 3 patch series.
1. https://lore.kernel.org/all/20250611075321.1160973-1-inochiama@gmail.com
2. https://lore.kernel.org/all/20250611081804.1196397-1-inochiama@gmail.com
3. https://lore.kernel.org/all/20250611081000.1187374-1-inochiama@gmail.com

Inochi Amaoto (3):
  dt-bindings: soc: sophgo: add TOP syscon for CV18XX/SG200X series SoC
  riscv: dts: sophgo: Add syscon node for cv18xx
  riscv: dts: sophgo: Add USB support for cv18xx

 .../soc/sophgo/sophgo,cv1800b-top-syscon.yaml | 57 +++++++++++++++++++
 arch/riscv/boot/dts/sophgo/cv180x.dtsi        | 40 +++++++++++++
 .../boot/dts/sophgo/cv1812h-huashan-pi.dts    |  4 ++
 3 files changed, 101 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/soc/sophgo/sophgo,cv1800b-top-syscon.yaml

--
2.49.0

