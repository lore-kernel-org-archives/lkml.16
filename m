Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78F521EB36
	for <linux-kernel@vger.kernel.org>; Fri,  4 Apr 2025 00:03:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743725024; cv=none; b=AQ3DrWkNaBIITZTmWP/GocUPVXIyImsLwi+fmM/jpVWO77pOCuDVcrl3jQc24x5lPjCsIx6yhaYgT0PF+8BsCPmKNhbaJg4ZM7ptfkKBkXp3hoJb1qECRjSiU7TwHeDEN0XlZPO8RGuZrwXBkC984zFAVKb8Gnxq3fF9Wgm5g4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743725024; c=relaxed/simple;
	bh=dtP05FHtqtvQksRG4fyIfH+IqNwLnnDIsaTOwYM/UfA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=PtbKkWECMqNXV2MtFp/33mZROUZg6GGeHLNL6Ow3U4vTeCxcG4/8yEAsJUs94LnvH5bMRfd5h922D4/DfE/yAP9DFTolBIg+JZ4CUdWXI8KMUiE4r51iIf/DrV5DAsERth/O0ilQv+CA+A1hr3LH0/CQqn/rLAJ27i8iLwQoqo8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cmdeyhGJ; arc=none smtp.client-ip=209.85.219.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cmdeyhGJ"
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-6e900a7ce55so20823736d6.3
        for <linux-kernel@vger.kernel.org>; Thu, 03 Apr 2025 17:03:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743725021; x=1744329821; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VrN/5nI85Iyzwu4Kb1tuLw1B0s/WKF1jD8cGe7yneTY=;
        b=cmdeyhGJ63qKRNoAyrlk2LHKbm3JJtmKqHafpUo0psBTilduAkwVEAtJnUrMTpqA32
         7DKYr8G6RsKFkO3dyJ84HpcbA82dvjp3OBJ/7vXxIFuAMz7B0UOrawNHE3GpB/3xid/2
         agsFOsrBUlJ6RncnX3BK2HWtCc71uJ0NkZ05MrqqU+181cNzxpf4CgtjBT/80lANaeYE
         nwoL/dS3eQyvYjVEfcNKEXuQRQ1PUOMjk+rHFHBZRvjM+BxtvzyNZfbI9KR/zU6Hs7z7
         IWA/cGx11D85fS6eJ2dSTaKWddzx7gX3baJMKHPybrTI6dPwjh0gKJLITRAVyX9BtGam
         8ghQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743725021; x=1744329821;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VrN/5nI85Iyzwu4Kb1tuLw1B0s/WKF1jD8cGe7yneTY=;
        b=qZifdbqNkbK3B/kE07QL7d649kYOABayw+q7iXHAJyZx3yDeIk4CpaSSHL3otzSZSF
         8xL+ZsxN99PFc/U97NPEP+meORyuqlSgDFqu6Bb6v/6TyCIH1KQbyW4+us6YEX7BD8Kz
         XTjLyjSbBBE0RdQdY/ksxUYENmlCY1YWfMbKs5Kn4BZgIaPL84okD5b4yMBQleBCja5A
         V2lzYK5I8JoDlb88MxKqhzYZoONVdAy6Z44OIGsRGyT+Rhq779fCK1ing/GP5jmOQqU3
         sTXA/Wqu4fPAp4nKfSk2FUcU09SvbvRf67ilhWffgS2hGkRP3yRe7z8F6Bf8Xxm3LtFs
         w8kQ==
X-Forwarded-Encrypted: i=1; AJvYcCW0NuaSMBINYH8LlzTX05QsKWU8viyHXuQ3f78E+GoCxLYmmHvaBQsTwAPl2pj2YwpNmZyETkxhRWfbHqc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7FQvgIQq04+J0iwv6K+gUP+J1Oe7zsLu6piEBNnLkeuuPUVsa
	UaUPuiXSgJhiLVCTcMh5w+F3W0cpn3ecm+bEDFb1LHclkUyGjLlv
X-Gm-Gg: ASbGnctktFQp8a9y0GGLd5qt6s29xtg9OpofkNfpgRoZ5BczLDpPACddEo7jrPWzek5
	PcTJhQvOq9hvEhuUZCKYzWbrVClhy9lnkGTTd7vVeC8jIMs6E3CFoBr7aGrkyNHVbK+s3wA3ph+
	qXor/xpD4rrW7Hl4gg/pnbE+++scQp4td2EoJUEKW0HZ1wVq2j/iZswyn+IppB0f3Z0OC9Hdm7/
	h5Pp2b9cq4SXs5y8kJQvrWi2ELTOCqhoHYDPT3qU35sWlL1mz+6pXtU4O8EOm+r+QHx5o6eT444
	96dH/MZb5Nt1x6tE+8teyn2naPe+JTPm8WmwJuFk0JA9h8N3
X-Google-Smtp-Source: AGHT+IHiHvrlSqEA3SAeiWQICnDII+gHiXqvB+ajtAoY3IvBEGYCIz3BvU+epIVNYDdzpIDfQaMFkA==
X-Received: by 2002:a05:6214:cae:b0:6e8:c713:3220 with SMTP id 6a1803df08f44-6f01e7723ecmr24275666d6.36.1743725021350;
        Thu, 03 Apr 2025 17:03:41 -0700 (PDT)
Received: from HP-650 ([105.112.123.50])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6ef0f00ec8dsm13736986d6.28.2025.04.03.17.03.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 17:03:41 -0700 (PDT)
From: Abraham Samuel Adekunle <abrahamadekunle50@gmail.com>
To: outreachy@lists.linux.dev,
	julia.lawall@inria.fr
Cc: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	andy@kernel.org,
	Abraham Samuel Adekunle <abrahamadekunle50@gmail.com>
Subject: [v3 0/1] Unnecessary code cleanup patches
Date: Fri,  4 Apr 2025 01:02:19 +0100
Message-Id: <cover.1743723590.git.abrahamadekunle50@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The patchset modifies unnecessary duplicate NULL test on a
value in an expression, when the value has been NULL tested in a
previous expression.

Changes in v2:
- Suggested by Andy Shevchenko.

* Dropped patch files for media drivers from patchset as it is
not meant for outreachy applicants.
* Added full-stop sign to text in commit message.
* Added space around binary operators.
* Made code more breadable by adding a line break.
* Replace bitwise AND (&) with modulo (%) in expression.

Changes in v1:
- Suggested by Andy Shevchenko

* Patch for drivers/staging/media/av7110/sp8870.c and
  drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
  is split into two different patches in the patchset for use
  by the different driver maintainers.
* Added subject title for each of the separated patch.
* Patch 1: Removed unnecessary curl braces {} initially inserted.
* Patch 2: Unnecessary {} was also removed for v1.

Abraham Samuel Adekunle (1):
  staging: rtl8723bs: Prevent duplicate NULL tests on a value

 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c |  2 +-
 drivers/staging/rtl8723bs/core/rtw_xmit.c     | 58 +++++++++----------
 2 files changed, 30 insertions(+), 30 deletions(-)

-- 
2.34.1

