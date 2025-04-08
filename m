Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA49413665A
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 13:32:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744119144; cv=none; b=JFuDPyqCuR9QwpPPqgYaGaGiTV75tldmDSLN4wYEvvCcWc0PHuJxZKAhVM6vCLRRJFrN85ExH5A+HXBq1hV/KtPfWBrWhtaDWA3ToHBYVT507skgDaatlUpT6JrFpjJ9KjbChLCfoZVIN2CUfrJ/eW4cpWKqQ77zOVWRNUppqE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744119144; c=relaxed/simple;
	bh=hmK7xZSP/TrL/aGU4yYwggY4mAze38UQN+xeOLax+fk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=QJN7ZuF/5IJXRBArwYH3VNpnr5wdee/J6i/V3fLwe0++leYPBufoT82CiBJMoSIcfKYqHCze75PxIL60O8T09WBhM2+VlYpBBhiTPp5U/PaMA3A6yCIOU3ta2xvEkSq22ONCvgGYlAh5SLSMmH58zT5ha8IlYd8knPpHwB/nyKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jP3PKaoI; arc=none smtp.client-ip=209.85.160.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jP3PKaoI"
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-47662449055so29223781cf.1
        for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 06:32:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744119141; x=1744723941; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cVc2yBWBNeVkQp8L5/khTVMylls0C7oPE8ISuX2JCkk=;
        b=jP3PKaoIrA+uPALVX78eex+ddqNUD3rg0Ewnnw0GqWCe6WSmMAxCYY6hFYbAx6gEUR
         S6v9/UxW1rQlV+wNgSLLX+Z5aj02o9KOJvOtHP/XMuAfKZNIzzjYxjdaqwq0Cvu5N3SU
         0QkiZLIUG6+MEZDwYJ77bsimGi2Cl3R4KTK7xK4SOf7sXhF0NNRfNYjan3Raz7MO/ww+
         05EUWRG32HwmpPuZHDe1cn+8/913y0xzQKSucJD5P2oE4ylHqWocN85dJtBoh2ltNV5M
         WzoLLU+ramcMp6pau2hGuK0+3aZPaxgkaApUXRTvzfjQsCtBKJzuWF+t6AQLNJqalpkZ
         +Osg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744119141; x=1744723941;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cVc2yBWBNeVkQp8L5/khTVMylls0C7oPE8ISuX2JCkk=;
        b=FkIKQ9aCUpI47gp+hyiQEkcZ/ryKyiul90zeFXau9yg6G3V6FD+ev4FJ0dFrCMOzTR
         cp4VWy6xdb1Vusdrm6u67vZpHabVOMvUsokI4oDIkaGZy/kWDKO9giMnAs6P86uvDNfp
         j/2/AQO6nwbUKAQGOmtbkOvVHXdyEmtuwVhhjnujjLsYzytJeJ+dERnHEWX4I2bbFi05
         q7qsiny0EAUK7d6SWhZm36YZLxiYuvwc770V4Mb3PKrTlBBRshOyxhgy8mfimsNAs7iw
         23b3xh79UXt2DTecePhMMggdpKDGXAGXg9eMh/fBzJScBFpN+csd1t495WGmW5eGKR3p
         QwRw==
X-Forwarded-Encrypted: i=1; AJvYcCWh45OparO3ZrxwCKBJfxLMxZ7vsyiX28QVjdLwZ/UMzm5Bze6gjyFP6J5zrK12sLewUcwj17xn9zfUs3M=@vger.kernel.org
X-Gm-Message-State: AOJu0YxZM/NT+h3P2V1WiG7NPZ6Z3XpPVIIBq6bZ9Bj7J93dpS4R3z92
	ix/Gpuvw0t4ph2tRu9OxTcJ9r0k95CpRdXf9F+nPlu9HK3d2xaR7
X-Gm-Gg: ASbGnctHE1ammchLi4pogj+VKgATEmBYfunk5SuQKZWfDx7bZfT/sNuuTJaT6o6W18c
	E/7BIbO8mEY9hh1YRCEbL5d9Zthl4mvtAJigSLZt6fWdK5U7q+3VSIfnSCCvZIQXLb4iUswFjX+
	AqqAVBj4r4sXWporsx+fRItuDvV2UCF4JXLfRBgle38aTHkQdbLZt/6n09IObaqxphnVsYl4dFm
	ZfnqQ221lpUTBTVN9Q8NfAC25vdKYyFqOX7V3cV0nyvBFAxhg0S80zGcCVpyoNhaqZLINBAj1Xs
	GnV4vREbObutOzK+3txWxMK6SuSRGRzYBacjM4sRslAKyMU=
X-Google-Smtp-Source: AGHT+IHaAKkw7ePak1dBQHCJ57Uk2UodgseNi6b5nngGTa7XmLNaGUTdqsDKsZTYdaSV580TSeEK1A==
X-Received: by 2002:ac8:57c5:0:b0:476:89d2:8234 with SMTP id d75a77b69052e-47925a26e09mr191577441cf.36.1744119140612;
        Tue, 08 Apr 2025 06:32:20 -0700 (PDT)
Received: from ubuntu ([105.117.1.177])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4791b1444bbsm76281671cf.74.2025.04.08.06.32.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 06:32:20 -0700 (PDT)
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
Subject: [PATCH v7 0/2] staging: rtl8723bs: Improve readability and clarity of sequence number wrapping
Date: Tue,  8 Apr 2025 13:31:40 +0000
Message-Id: <cover.1744117091.git.abrahamadekunle50@gmail.com>
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

 drivers/staging/rtl8723bs/core/rtw_xmit.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

-- 
2.34.1

