Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D6C01F236C
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 23:29:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743636591; cv=none; b=jmrVQR1+ysW53/sIiqqLmDbudkZjPNDx8nx60o7HgRtxNDgBqaIva7ds2KXPv1V/X48O9Z0ap47xXg1NUKYLHisPHglRP6o+w7j/vYtufsA7D/NmSjo2Ou0T+FVTh4r8rRK8V7wh/074xBe6WqYehnvxMmF/aSL/ey49qncLPwI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743636591; c=relaxed/simple;
	bh=N+690Dl8x2S4PXkBw33aF7TsFud2SHoTXZUfjjRjn5w=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Jp7gYZu1HyGTIiJnXa0ZqWoKdND0kMsXnQq1rZFXyhne4y+NLn3I70R0N99mV2/WDWNw/UlWS9uOCtmz17Zm5hlNhdclYWohyIBWHMb3arBxFTm69UnEkf/nVtTEsnZ9b/buHjgcuKF0NU2uoIdGL1aMvEGJ203lqzvEiJ17ZCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i45MX6Gv; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i45MX6Gv"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-ac7bd86f637so18242166b.1
        for <linux-kernel@vger.kernel.org>; Wed, 02 Apr 2025 16:29:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743636588; x=1744241388; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Dofhp4vd16EdUWCHkTI0LpG1Ae8tGGiEAhl+4/0E1XE=;
        b=i45MX6GvxTu8PlaB9p4embfEHHrfwfkqbQb81Ng7YpxJpPOJ2pPLu0PXySsATW3T6+
         xO9LODnh1te5ahbfuUTTAwefFqdbw+SewdxCaP1tkpD/+XznBJpiKIqjFz7/WW18nUuA
         XBiXA1lb6aYOANa7IFW6PLtjnox+Ej6rAnzIylmqyEKkuNm7iQpEGzaqldnrZ60H36Nl
         WZqZp/KW2eE0243ndiemVsYimpMIKMhVG+cGm94kC0xh5jPH7cLeZJkD9B3tyB8d9LdX
         qVW0yVfpGGOqca2nj8Y1mipwvppxCd/ET3cQgN6z6M3Fzj34sex/tX6OAXgruwV0cNaB
         7PSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743636588; x=1744241388;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Dofhp4vd16EdUWCHkTI0LpG1Ae8tGGiEAhl+4/0E1XE=;
        b=RO0WrFryPaBmSc9df5exkVYbJi3Gp2VstltEnU7FAx40Eij4AtI1O92y1Gu5bFbgbY
         s9btR6dhA5uLhQ0sV9E55jaakWejokb4/+6+sKWOTNmHexU2rcErQanyWMyehNev0o/x
         EUZR+YgpX8Uc8tcjH47ATkGYnKzENhZY7jAhMMV2VSxIQr0TiCo5vA/hQVOki9EeGF/8
         XbjcGlCXlPcM4tIMY/JOd2yI4FCqWpV+qPKM9f8zZ80m+UbmIK9578G9M0JugMyTBSyI
         8G6L1fPZGszUBELh/VmW+ZFONRpDuCTIsVaOuJRQKef3m72M/6xdzIlKH8P2TgG3ykz3
         BRgA==
X-Forwarded-Encrypted: i=1; AJvYcCX0wMsHC2MDIUixnYBQBR9CwGVMLSjjH/mFqHqdlDE4y6e1rk76da3eOL+VzKQg6+NJSgSuK3Gd3hZCwXk=@vger.kernel.org
X-Gm-Message-State: AOJu0YyHYgN5a6I8VAJAIZJ6Zi2Dl6NnjN8mgjl0doPJ9OEnNIgG4ef8
	yH+SNZrWr6Ne2uxktQ27YeRbqlhzg0g9F9LD+0RK5QSxin86aupQ
X-Gm-Gg: ASbGncucbsRwPRNPeitIG9c6BfeOZRphbaapBYEzziyPJD++R4X0mf+0iCDwmsblXSQ
	MvfMNviIPU28Ae3WQEebQYxHdnToL66a/i4BYkOh2ondseOV82ytoHVEwNmtZrvzbMqLU0nCRGu
	gfZxGbMsdXJJZNB2r6tYdP35OAV9HaHKSuPYGBga2qfkFn21cahy4QhA9qP5ihtx/5+QfU2tVXp
	zBcvv3YRjfOQO0Y1vLpKy2hrKWWCRo76nASIImVJxOTpQuLhZq+ak+vrNww6nd5ejbA37TXL7ce
	JJkPuXwRnQeFnqpAfFSxJrfIV45RJ/gncyCZYOu39iq951HXVQ==
X-Google-Smtp-Source: AGHT+IFYFgbrqDbUHntBMUKQVCmrIm0uA2yEG5AMH8rCPKf5xiNlmRPEsS+wGXetxPIV/AYGXPKIWg==
X-Received: by 2002:a17:907:7206:b0:ac7:b231:9554 with SMTP id a640c23a62f3a-ac7b6c46485mr144505166b.11.1743636588239;
        Wed, 02 Apr 2025 16:29:48 -0700 (PDT)
Received: from HP-650 ([105.112.231.107])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac7bfe9868asm2439466b.41.2025.04.02.16.29.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 16:29:47 -0700 (PDT)
From: Abraham Samuel Adekunle <abrahamadekunle50@gmail.com>
To: outreachy@lists.linux.dev,
	julia.lawall@inria.fr
Cc: hdegoede@redhat.com,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	andy@kernel.org,
	gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Abraham Samuel Adekunle <abrahamadekunle50@gmail.com>
Subject: [PATCH 0/2] Unnecessary code cleanup patches
Date: Thu,  3 Apr 2025 00:28:59 +0100
Message-Id: <cover.1743635480.git.abrahamadekunle50@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The patchset modifies unnecessary duplicate NULL test
on a value in an expression, when the value has been NULL
tested in a previous expression.

Abraham Samuel Adekunle (2):
  staging: media: Remove NULL test on an already tested value
  staging: rtl8723bs: Prevent duplicate NULL tests on a value

 drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c | 2 +-
 drivers/staging/media/av7110/sp8870.c                     | 2 +-
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c             | 2 +-
 drivers/staging/rtl8723bs/core/rtw_xmit.c                 | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

-- 
2.34.1

