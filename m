Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD24B25C6FA
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 09:14:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744190062; cv=none; b=nyt6EPjh9F4rat0UJqonaki8DkdBN3jEHz0rzNySfUq5t1uv4R+gGhsO2XCcJaDBvgZmH+KRWWirZn05VdHdEUL1Eugy3GtubpFfQZ3notP3g88WC241wvu69aOsrp2j27AcTGjSxkEN8uCBcLHCCIIcImbOt6IdsAucU0tzTyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744190062; c=relaxed/simple;
	bh=KPrSjQFz6RDMLvo3Gr/vxAHo3CF4mjppfNm8W6oMQVw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=NQvw6PK77nyOGLTiU7bc+tN83SZraIF7ACLYJ4WpLDnR3cQAD6Bi+m8ZN54ESt2Y2B/zbEu361x9KPJHH68FNJX1nqgOl9jt4ndUHlDhoSaGdi+EeSQDbPRuOXQW45CNhSDch+I7YzYaiq+9Gs1K1h/CFfO7LU3t3WfsiY2l1gc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=APcPPBQd; arc=none smtp.client-ip=209.85.160.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="APcPPBQd"
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-47663aeff1bso59460021cf.0
        for <linux-kernel@vger.kernel.org>; Wed, 09 Apr 2025 02:14:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744190059; x=1744794859; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LuSuDtNF61PvgQQchQkid6uP+93V9BVfdt5rCLmmpzU=;
        b=APcPPBQdD2cTL4lpxEZFyhbXatPqS151moiFmWQ7Ma3w64nWkQQ4/rG2R0YVPpQU4M
         poD19MXMVx+lwrGNeLTOi9/mDwbJO2tgFB5A4+hFwpsnDsKNW12ZCA2pJOsCCn3qOy3y
         DLWnwBgSjXiwF8dX72X9IpntXXmw+Ad41QgAXudYqhlbO1GzmRQbwJNhESLJEyoaGZXg
         srB0Q01dmjTgqyofONcF6QsRoGbHUu88pbHVmOUkAc3XTOnJAqoBnrBTJ8hjcXqunhLG
         rG2UjGUYNJPGuOdBvCT8zTIxOpvDPTMis7m+y6364vE+7C7Z2//zqC4lNlbOgK8wdBv+
         O9/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744190059; x=1744794859;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LuSuDtNF61PvgQQchQkid6uP+93V9BVfdt5rCLmmpzU=;
        b=Z9ZG89R7O3IdYJ7EmA07lJRdijsb2x8cs7rEegENWpTiKhVpU0KVazxSz8jwIV8VK1
         y7IH2lByNXExZL3qdIRQyYFh7i7zhjDaTGNeq56sCcI5vZl7xwQOuN9whl2VigwWiux7
         EDnDJ3alYVO7ECSrUcIYmJ5RkVX1yBb/bwHfpfriIdsJon6v/+bjAvBWiw79X/Eah44x
         DOW6xbogCMf7BOYbffVE3cuUcVPDZreWxAWBG0I8lYFV08mtCghDFQ6SBoBrpg8I8/IQ
         cNjyAmgRyzPta0UWk5PCvDjJ4mx2oba2IXszHBZ1hCj2cyGKpfhR8ANcfCVsInipEDcq
         mjpA==
X-Forwarded-Encrypted: i=1; AJvYcCWblutdcJPGo4M+qKagjrvgLhoD79R3V6dqe50JUjtVRpSXjskO19p95e/s3wrGK9Vt7c4Oo6Q5r+unfFc=@vger.kernel.org
X-Gm-Message-State: AOJu0YyZ2cVBL4qKpJW6D/dsmUKuvjf6blMtslPWnoTSJyrNoLkzhadO
	M8MHxKUS61VMyo1F3uzbc7jXYgn+FOcd2JifLCbivkInLx5n1VDa
X-Gm-Gg: ASbGnctepAjHmDod7hO6X4niHM5/UG0wSzqJbDTQW7cnfOnPJUy1g7KsJSMHbil/bjN
	Z8Gu6w117HjbTkPoVlB2cg2WJuidmCjFKznJ1bsaFoQvTY+V1SlOorsvkVlsDLWfMcRKe7RTf6g
	gmCzFDBKeMrhFhcKTginIRnBHYnlREbraFzXzN3z4wCeIw0SYC7VSbMGm6V8tgBcVzWtBgiMjy1
	fuBUV0naYTGE6+q8QB33eiMR9nGZl3peAphbIUpQeJ8ZD+bhulphrEoSjzzVrEqeE0ufHyE2o/B
	Reh2yWO0pPieiIvORv4fqx5MdJBzdaUGoXr63CpI8bzrSA==
X-Google-Smtp-Source: AGHT+IHROIfff9EygQflh2Ny77Q7Q9H1hfUvsrr1DY/l79I/KwXjFhlSR1X4Vw9Pm8MnS2NAuG8V5A==
X-Received: by 2002:a05:622a:50f:b0:474:e3e8:1a58 with SMTP id d75a77b69052e-4795f2d0919mr25813461cf.16.1744190059511;
        Wed, 09 Apr 2025 02:14:19 -0700 (PDT)
Received: from ubuntu ([105.112.112.184])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-47964ef728esm4631941cf.73.2025.04.09.02.14.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 02:14:19 -0700 (PDT)
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
Subject: [PATCH v9 0/2] staging: rtl8723bs: Improve readability and clarity of sequence number wrapping
Date: Wed,  9 Apr 2025 09:12:53 +0000
Message-Id: <cover.1744189500.git.abrahamadekunle50@gmail.com>
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

 drivers/staging/rtl8723bs/core/rtw_xmit.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

-- 
2.34.1

