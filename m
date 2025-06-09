Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15E0C225A4F;
	Mon,  9 Jun 2025 23:04:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749510253; cv=none; b=kmPF/X0HCZXDJCvoK3V/IuUToXCUxW1XqFQZMjA/7P9OT/9AkMUZ3ujIVOJ1uZUX44WtQFL9MR88cYQSGeE6FbCk/7E64m1s3oJkN8QikyJvOwD3q2BZjJormOcpPE5vopwUcDEvBgXoYeHKURxGAflzMAydM8FOBKx3L5mgRUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749510253; c=relaxed/simple;
	bh=fMuxpwKkaDuVqjxZYFtMLKk5XFibqLZEUn6lpe93dHk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fcxoARFp88GxXw6iotQEtMFjgungoIEL2PuQrbUZ6xmMjnEXLflqdSczAaBFI4bnyd7/Yas7fDxH7KLxWSz0zFVnVloOguwNOH11xpMjf9N3hEcGSVoqfygl3SbuvIg5E8DjsBRqXb3ZvAsW262BkxXaHFY14xJoqB+POPMx6+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C4TSB6lS; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C4TSB6lS"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-441ab63a415so50057085e9.3;
        Mon, 09 Jun 2025 16:04:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749510250; x=1750115050; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=q52h/lfPwbDwdpVA5o1DRZUJae8sBtBPulv/3hni2vM=;
        b=C4TSB6lScaM/No35HMF6sBrpEUxOr11SXfo0oFnACAGfmNIyNpEIeZkz1kQYdSMICv
         f5Za9hQocxlhhoWcoXRtF5K1Ta4p3IsYCu5FpqHG3q9TPuiYUaXgKrA4OwZDRKQ8hWSX
         ctbwDqjwKMwN3mojEmyg5j54EKMvZN9NDLQYveWhey5Puy/aj0ZZzkHWF8CPkMdgxvOi
         iYfL6hKBNMR43bExdz05lxhEBkfD1ck1ee7SvZNKIyBWxslf20HtW8Xw/yCsbh4K/HAG
         R+Up8g455yz1SmR28xaQSI+A3hlEbrCz0DQHWMPiGEXS0CRhq4lqjUZQVLfhlbGDxOrL
         LPfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749510250; x=1750115050;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q52h/lfPwbDwdpVA5o1DRZUJae8sBtBPulv/3hni2vM=;
        b=tiQfP0tuK1jjayakvij9EFGXPK4/emK7rJPz5vfeb+1V8/i6K1FJtdeBlkUdT8qNOO
         RrkN4k5dn2VwdayNcf2onlJjBuuiKT/jEHhqFHZjRt/8s4DXTrMLEkxTrBf6GkgIz6rP
         652zICBtz4kEDUcPTmNiA7vfyoN+/dSBs8YhP+uTJogv3f3CDuAToGokYjZOEAJAsvPM
         GaSgONq5w7T9V8T/SNB80QKMV45cjoCdJbv9yyDGC3ppjyC4gIkQSUOiRhn1chEA/GlG
         SFixgVXhEMj2rFBEjlvdcLkJVTGD6VhhNUJLDYr6dobMAoyOx56Q03WYuW7HUspJ6T0U
         bk7A==
X-Forwarded-Encrypted: i=1; AJvYcCWcpdUcQNpUoelEmvP9aLMHb3LUj45PSn60AXKEomzXIeMs/c8tFMG3SJVqtx9MgUFuI5rp/KpQOU1f@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2YAWpvkN+bUsvv0/UtVK2tTo2jNBhf15qBmnQoCy/M8lLABbk
	/afFOcnOpbWEcDe4O+2sX630yAzxO9fZ4b4rqa0Ndk/rJA1TY6hYgk4FMuT8mdOnrkw=
X-Gm-Gg: ASbGnctLF0Uirk6T2Z4NDqQh2lVpnHRUq7ozI9bFGQQul6CGzVPPs7sAl/4rWABSF1u
	dvwEnvXVqJEbyGZ/JbO5K8PQ6Xg3d49ZQW50nLI6m4TaIF/TDV0wXmqGC4PsdsfoX6jkpORuqXd
	ROg+PrgaycBB7iLBPZ9lZksRqoU1HxgDAXmZ/nIOx4rKQxSYObJh/GDEsM0fJD/iJpes1tH8F/w
	OCCYDrsduEmbZ5FN3LrIwHQpZipoeKR75rVGsZZpsJnXqoP0J4EAXa7T359ykV9RNdHUy4uIUIz
	UDt4XSCKDtIWBNcGSLgoUwbriEXQzZjNSUDuhEtTcRww96daG7CVojoZVwHiP+C3twsd+5a86Rl
	4tHMuQo3uCQ==
X-Google-Smtp-Source: AGHT+IHaE50cZViaIR8jpPsU+4oI5U31I7qKoKsPQXD2IoYNvIGGqXd8jWOeVLwf2jPvp1fljphNyQ==
X-Received: by 2002:a05:600c:1d8c:b0:442:f98e:f37 with SMTP id 5b1f17b1804b1-4531de70b5bmr3626745e9.21.1749510250262;
        Mon, 09 Jun 2025 16:04:10 -0700 (PDT)
Received: from giga-mm.. ([2a02:1210:8608:9200:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-452730b92d4sm121340585e9.19.2025.06.09.16.04.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jun 2025 16:04:09 -0700 (PDT)
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	devicetree@vger.kernel.org,
	sophgo@lists.linux.dev
Subject: [PATCH 0/2] Add reset controller support for Sophgo SG2000 SoC
Date: Tue, 10 Jun 2025 01:04:13 +0200
Message-ID: <20250609230417.620089-1-alexander.sverdlin@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add DT bindings and the corresponding compatible to reset-simple driver;
provide the include file with reset lines enumerated.

Alexander Sverdlin (2):
  dt-bindings: reset: sophgo: support SG2000
  reset: simple: add support for Sophgo SG2000

 .../bindings/reset/sophgo,sg2000-reset.yaml   | 35 +++++++
 drivers/reset/reset-simple.c                  |  2 +
 .../dt-bindings/reset/sophgo,sg2000-reset.h   | 92 +++++++++++++++++++
 3 files changed, 129 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/reset/sophgo,sg2000-reset.yaml
 create mode 100644 include/dt-bindings/reset/sophgo,sg2000-reset.h

-- 
2.49.0

