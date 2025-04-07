Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 115B6200114
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 15:38:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744040341; cv=none; b=GEal+bbcRUj1mqdAWIrKESEiEpZHq0TuO44c+B4A7QOJ+avICB36QJ4XgqRefkcb4p3TXbf6QejUZE0/ZJeFjW7GaYHyetEzscUoYk46Ll6PQ7f2P0eimI2Fm3RavNQyQbqRv2yb7/x4dK3z79TZsNKLfd+Jn+Qn+zwF+z71WY8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744040341; c=relaxed/simple;
	bh=dwbSAtKldl0BbILJp1GVrL/yXnbNxbyOhAztADC3s4k=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=lCyZyt7PrrZWRYl87lz2d3neJxF57lnuQ15K+f4e+K4SXzPQR3bFQFsVQCv5yox2LtOLJWstgxBantnN+BkZ3jvyOXWEgrYNrvTZgDMYZBhFB5riH/GhPspg3Qvn1VAzIy5HcbgdeWMZ0u+Qtfuy3EJiPWJv42h0Kvg3jrCxGbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TJu/R6/d; arc=none smtp.client-ip=209.85.128.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TJu/R6/d"
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-6f666c94285so48543467b3.3
        for <linux-kernel@vger.kernel.org>; Mon, 07 Apr 2025 08:38:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744040339; x=1744645139; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=QtSYvWzrk0VScnOOFWHdizBCo8ajslxrvYcnnH98cNo=;
        b=TJu/R6/d74EkaIwTi5KJ8cqdZnjndMD7M8pD3c7DxKI5zq9WYLCvj3ADImgem8mcu9
         j8nwOi2Zb0voz2FHCG5RYNHM9g0Y/Vbi57PRstigWTePpitTAW2g46rViwVHydUl1/tb
         COooPHWusY3zKFDrlSnqW98FkMiMtyN7D8T6AvT+GF3yoKYGk6Wh1aADENegM97Pftat
         BEpD1Gq+E0gJRWyz7r7QfOUOD4/CMC+LQzC/4ODHk5C7UJA/Kqy1D7iDOVDJ/mRpd46b
         AMMYVwyfAehkx1x6l73zZYWatljYyf6xtkliuG+Af7E235UqWgh97dPRbdjA67KrkTxD
         iv6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744040339; x=1744645139;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QtSYvWzrk0VScnOOFWHdizBCo8ajslxrvYcnnH98cNo=;
        b=akLzDswAAP6fCfQzEY1Zfn8qrp6E94uX5g5+SVUvbOXlDOb3J6+9AVVlAEP9Qu8s3D
         p16w1rEURUfy17kkPnwq5gXwS4WeaF07sbTVQCEl/OimmvuoN54qNKD4G1UkHRIgo0VP
         uN3qt8WwF5/Sk7VuL1a64WCuo28F4GDGFcrCxQktppkiwFxbCBvwFcnREOjchFXrUyjc
         VO8ABIvOI3eZpiI6sh4HL2lq0GjZMeDn+xRMEW0wBC8OPHqiYCukRBglHuTcRZ9Cz0tE
         ud7RnAykUaS2gwoHu7Kj1Te2Sz69p5+AkgYFcMmmyWGuGClx4PPcie8JnLdTKtS9by04
         gjVg==
X-Forwarded-Encrypted: i=1; AJvYcCUPfT70aH8zdOHWoZrU3zDn/wMqq8VsHTson+vuJNN7vTiyABn7RjPgEUV7tMb6sKTcJOjKYEz7oZvWisY=@vger.kernel.org
X-Gm-Message-State: AOJu0YylsGpPzDtHtU3O9NtFyB8LcEfrhqdD/NCsqRR4xk+kxlE5Tbeq
	Q6Paz4afTdsqZ7NV0JGL8QWcQNtRtExYYIo1mjCYC30swuMvho+4
X-Gm-Gg: ASbGncuW7QPX5S1tP7Xhs+VVi281vtt/HBpaEgePtUSCSoNANJ4xxDk7q/n2S1uO/ck
	dIE7X+uhjgDrCCI6IdSXVIMhkd34TOJRRZVBD/BnwKLtshEQ9+aiy9DBudmmHvedC2j5qFXfLeX
	us//s5Cd8VXfYHfl6OvgRJFjq+Q9hcIKh0zmPCYdHBY7Tnh2m+i+ldhoj1OPhvHST3838tCF3KW
	xTJhIsNCvKDzWc+K/4flSVPJU0aWoshX2Bl8nk1wrkz53HXoHN7SOYjFZ1mnNzjQwslHZZB7a/+
	HkvoIZ7Wo7vHEVVAoOv1KpbF5Te4OM7LSNcXSGxp2rvijwoEEsWThe6pdooecPiHfILJDc78wg1
	pHkM+
X-Google-Smtp-Source: AGHT+IFzlTGk/hVFL1+UWxpnHWm38CREhh/2GeKQ8rne09KTGOM/Df21gQgFvRlGyVQfgGK7HqPsKQ==
X-Received: by 2002:a05:690c:338d:b0:6fe:e76a:4d38 with SMTP id 00721157ae682-703f4198020mr169274207b3.21.1744040338871;
        Mon, 07 Apr 2025 08:38:58 -0700 (PDT)
Received: from localhost (c-73-224-175-84.hsd1.fl.comcast.net. [73.224.175.84])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-703d1f706a3sm25851477b3.81.2025.04.07.08.38.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 08:38:58 -0700 (PDT)
From: Yury Norov <yury.norov@gmail.com>
To: Tony Luck <tony.luck@intel.com>,
	Reinette Chatre <reinette.chatre@intel.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	"Yury Norov [NVIDIA]" <yury.norov@gmail.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	x86@kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/4] cpumask: add missing API and simplify cpumask_any_housekeeping()
Date: Mon,  7 Apr 2025 11:38:51 -0400
Message-ID: <20250407153856.133093-1-yury.norov@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Yury Norov [NVIDIA] <yury.norov@gmail.com>

cpumask library missed some flavors of cpumask_any_but(), which makes
users to workaround it by using less efficient cpumask_nth() functions.

Yury Norov (4):
  relax cpumask_any_but()
  find: add find_first_andnot_bit()
  cpumask_first_andnot
  resctrl

 arch/x86/kernel/cpu/resctrl/internal.h | 28 +++-------
 include/linux/cpumask.h                | 71 +++++++++++++++++++++++++-
 include/linux/find.h                   | 25 +++++++++
 lib/find_bit.c                         | 11 ++++
 4 files changed, 112 insertions(+), 23 deletions(-)

-- 
2.43.0

