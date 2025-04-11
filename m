Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA8CA2586FE
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 19:41:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744400482; cv=none; b=Uvl53Up5XiSvt5NXuQuQMalSGj/SUT4vN0b94Mz+SpgI0OHLEvEjQravZUxA5ooZbrVpAFpX4BH44VoIZaFcRhK1MVvnunBf361u5oAYA+e+9C5Zj5g2rTThVS3xD8brANLIKqdgwOLs943hfGvg4RtnuZYHvXOvpByIVnoTbGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744400482; c=relaxed/simple;
	bh=d4sYTTDLbyYeWKPHtORx1pdOLAkRGQVbUduJ4gMmTTE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=fAaqGjnn5HSx8VUfacAxAXKf8f3l2vkEl4eSv+Q7mf4HPKBIZ5RkIa0dPGa9wjyg5FyuRynu0NGxv++5oz/e1BBKU+O6Wx6QW7X6L0LN32y7U0MrxRSfjWJu11al25QDpzSxeMfJNMkKK+HU+rjLmhqusxDiGOYEDw8gb25bn1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kMbykd+3; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kMbykd+3"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-5e6194e9d2cso4558211a12.2
        for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 12:41:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744400478; x=1745005278; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1XTE4UiVxoOqY3iuQcM3viCRnNdByGl2a9srDreM4Ug=;
        b=kMbykd+3aoz6i0b7ii8PgDSLy2yHHSWrZldSk9aYHv9Y3wkK9yKZ3cDJYwWn1fvOLf
         N6T/lALqGLkXw7ZFgor4aCsalpgIw1BQnwtsieTYNiu/C9N5fQvBwbN7iCEaP71q7zKL
         krr4U7CyyaGxt87DbazlQ8srvCCzRP23NPGIp7v9XPUqcJUdtyYIiCG67Q3reb4M8v1x
         s1GdFFbJtCvSJpWtT74IGbhqTTaZswnl5bGaLanEd50iSzRR34bfVL0SvKxK9D4p0f2D
         GhUryiy8R5mltvY92x6NYuJ9Qeax8DefnPGYhpj+ZxYX1HScZ8DQxKNa7I9BMdSSasyI
         VBDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744400478; x=1745005278;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1XTE4UiVxoOqY3iuQcM3viCRnNdByGl2a9srDreM4Ug=;
        b=X0cCPwLEWm+l4H/b9zNy1hMHajYCiscbhPQgBzbP/noDZde7GwhDjK80shZLDrntOJ
         7AlIQSgn3avcCYneRbSYPR8UXflAFowFffFN2nQhlBkSUEZ1rmetswfy5bcQ16o81obJ
         dchGe0CHIXiQmmk1fsyX3oryjd9CiC+IzrdCDPJ/QRUEiRzWe5zBj7EdEpU4lDUWblJO
         lyjIqS+JE7YaSMFfbeRs6DyNAUYWfizdB1XyuPA5/7h+Wa1wRqg5b3gFg6bhpoNXLqO+
         rQjQHqFvIC0ax0Dtu7Pc5w3N+CjpU4A4dC8jLimPXHeFum2Ljg3vuto5K49ynCiY07We
         Bmsw==
X-Forwarded-Encrypted: i=1; AJvYcCW73Zi/2Fnyz9gohgRPlLu/zRrmLWS+IXKs3wBiV31rFUjCag9JvC3IHFAEIPV5QTJN2jRYEwz01Kz/toc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yynp7RFCeufMvRAJsBX/bo3FDroK8x/IPeeqZVFwawy4pysi/36
	lGjKL0ejeJW7zYmyRGM3tFG9+zOQThpZmLc2DodU0m7m805O5q35
X-Gm-Gg: ASbGncunyLehOqs7A47KQgDKqw8SANEuiYt+XWpINEnK15ypauo5EsS0DNqvVvr9aAC
	CrCeX0l7RmRkaS2xaabC1HRPGviZBnji2GyGMhymBiYRCaGxJW8CRWm6stgexFPTpTBNofP2NSz
	uwvnsBqiEqLvi5tsKyzJUz7GkUXw8BbwrtYS7RLhAd7+WuzFenyZvDZ6VsOFzAtKFqvIO2Xzxw7
	FVcYazVwEcPToWbmtdyn6x6jj9El09G9pJWd5+0ExvUCJ5P+xo9Z1tMB3giqPY00s8SZFbH0sr2
	WFUEocpFiY6YFbQCYsGjhvWy7UK2Y2UrGZD0tBOn0qtceg==
X-Google-Smtp-Source: AGHT+IGzSMrzJvLKnG/jYkR1F0xu8pl1o3+7OHwTbyykOFgEtjIjwBW6rl9qA+eGGnTiEkiexg2xwA==
X-Received: by 2002:a17:907:7ea5:b0:ac2:b1e2:4b85 with SMTP id a640c23a62f3a-acad3456e28mr373610366b.3.1744400477780;
        Fri, 11 Apr 2025 12:41:17 -0700 (PDT)
Received: from ubuntu ([105.112.122.132])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acaa1cb4070sm493672866b.102.2025.04.11.12.41.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Apr 2025 12:41:17 -0700 (PDT)
From: Abraham Samuel Adekunle <abrahamadekunle50@gmail.com>
To: outreachy@lists.linux.dev,
	julia.lawall@inria.fr
Cc: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	david.laight.linux@gmail.com,
	dan.carpenter@linaro.org,
	andy@kernel.org,
	Abraham Samuel Adekunle <abrahamadekunle50@gmail.com>
Subject: [PATCH v10 0/2] staging: rtl8723bs: Improve readability and clarity of sequence number wrapping
Date: Fri, 11 Apr 2025 19:40:22 +0000
Message-Id: <cover.1744399612.git.abrahamadekunle50@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The patchset adds spaces around binary operators, breaks long lines to enhance readability
and provides clarity on sequence number wrapping by using a modulo operation % 4096u, in
place of the bitwise AND(&) operation & 0xfff.
The patches are required to be applied in sequence.

Changes in v9:
* PATCH 1:
	- Added more converted cases found in the driver to the patch.
- The Coccinelle semantic patch used to find additional cases in the driver is:

@@
expression e;

@@
* e & 0xfff

- The bloat-o-meter tool was used to ensure the sizes of the binary
files before and after the change were the same.

- $ make drivers/staging/rtl8723bs/core/rtw_xmit.o
  $ ./scripts/bloat-o-meter rtw_xmit_before.o rtw_xmit_after.o

This showed identical 'Before' and 'After' size values with a 'chg' of +0.00%.
Changes in v8:
* PATCH 1:
	- Added Reviewed-by tag to commit message.
* PATCH 2:
	- Added Reviewed-by tag to commit message.
Changes in v7:
* PATCH 1:
	- Added blank line to enhance readability
* PATCH 2:
	- Changed `power of 2` to `power-of-2` in commit message.
Changes in v6:
	- Modified cover letter BLURB to reference newly added line breaks.
* PATCH 1:
	- Added line breaks to long lines to improve readability.
	- Changed commit message to include the information about the broken
	  lines added to the patch.
	- Changed subject line title to also include the newly added line breaks.
* PATCH 2:
	- Changed instances of `& 0xfff` to `% 4096u` which were now in the broken lines
	  after the broken lines have been done in PATCH 1.
Changes in v5:
	- Converted the patch with the subject "Use % 4096 instead of & 0xfff"
	  patch to a patchset.
	- Added a patch to add spaces around binary operator.
Changes in v4:
	- Corrected patch to use '%' instead of '&'.
	- To ensure this change does not affect the functional
	behaviour, I compared the generated object files before and
	after the change using the `cmp` which compares the two
	object files byte by byte as shown below:

	$ make drivers/staging/rtl8723bs/core/rtw_xmit.o
	$ cmp rtw_xmit_before.o rtw_xmit_after.o

	No differences were found in the output, confirming that the
	change does not alter the compiled output.
Changes in v3:
	- Added more description to the commit message.
	- Removed blank line in the tag block.
	- Added more patch recipients.
Changes in v2:
	- Changed the commit message t a more descriptive message which
	makes it clear why the patch does the change.
	- changed the subject title to include `4096u` to show that an
	unsigned module is used.
Changes in v1:
	- Added more patch recipients.

Abraham Samuel Adekunle (2):
  staging: rtl8723bs: Add spaces and line breaks to improve readability
  staging: rtl8723bs: Use % 4096 instead of & 0xfff

 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c | 2 +-
 drivers/staging/rtl8723bs/core/rtw_recv.c     | 6 +++---
 drivers/staging/rtl8723bs/core/rtw_xmit.c     | 9 ++++++---
 3 files changed, 10 insertions(+), 7 deletions(-)

-- 
2.34.1

