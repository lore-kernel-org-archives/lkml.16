Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com [209.85.219.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DF34E56A
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 23:01:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750460514; cv=none; b=VkLHbvWTUkUAn3R0K7nSovdx2HE2sl8oNms5BPhseUobRTtCuUXlVpNf0fbtSCP6RfBiLunhA3VDdqauLY13ystLeUK4E2vtRC9j1UL0V7IbUkLYQk3UeEe8rjsvhNdQ4yo96mZQCy268TMSlVB4P+cpMSkJo5tvJr9UObMJi3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750460514; c=relaxed/simple;
	bh=1CjXLgo+Zncqos5rGLcn9J0nGkVOXpturf/1AoFPYsM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TyNE599wm/HRT20sclIiuCoD7W4id5ftExa5g/3EZ9YeyNKDJEFKNFKlO2cNC+/xe4DbLa5xr50+0o/nHUjc+5rw/s8L6KKdB/t2pm7at1sIM1a9o+k9eiqUVGICDXjXghbXd4aSKl/bz10QRYw7WD6QUzlxNYzEki1Rnvjo3lA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cKwBlLKB; arc=none smtp.client-ip=209.85.219.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cKwBlLKB"
Received: by mail-yb1-f174.google.com with SMTP id 3f1490d57ef6-e84207a8aa3so1445012276.3
        for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 16:01:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750460512; x=1751065312; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JikPmj+Tbl9a+ehXhSJqmNGzV2XtAyT+83+OAHnOpbc=;
        b=cKwBlLKB+bjeSecF0Mx6q/yS3UJ87Qgbv0BMYwOVPNMN+6/5fx/Q2H/KZJciq9D3Wh
         jmu1WXJ4mz+M/RvwR4VnID0zeeMA5urfqSNFK5egRuhSDLrPKHkSM774cdAO3as85Ha7
         kKQvPQ/aqiRCAZe7EF69wSOoW7Ysf6h0quBDvUPRnuWYdzxHqX2mtCTIW3/Dw6pIrtKz
         RT/5sate87U5VMjU3xbWeogDzC6fLVAYdMQLuwHyC3oNxX3kRH8wffROS9mXQS79qHwN
         GK2ckUJBEj6o/IUV3nPt6Y6friw1T46aQ5+jhDkc6ASX6KmI0NZih2dVQMIKLZCfFoCI
         40lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750460512; x=1751065312;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JikPmj+Tbl9a+ehXhSJqmNGzV2XtAyT+83+OAHnOpbc=;
        b=Aez7lLMeciNHsyRSmx48ak7s/ykW3gXpqNOYA4aW3IFUo920Buuj4mLuY4/wSBtOj2
         4u9Bx3Y4eFsuEzd/QX1zd0ZJTj/bpumDXAMmzjSEhtK7YWEeFAt8nRhpWDXqhSL44V0Z
         QNdj72hey6dlzMKA5fPTJIKrCdiCGPR0JCU9OewrI/WZTy/fYQgSeLA1U9/YvFXrLSac
         S45VV5B+vfLg6eWdtsLQWbTOvIgYW5OESo3xzeuy131zCAckS5t8E2ZYm4bthhBoetVj
         Odr+l/VSEnTMBNilRnWOGLqjABULo12VL6m+7HSgsHEWZiM5ctIDLGbRGs6y7SQTQ+Sd
         RFaA==
X-Forwarded-Encrypted: i=1; AJvYcCWSUUH4PFX6qfTAC1jwe1QJJcAwwb42HisHyOVQhuu3pfDtjsu5BB7ZlALOnZ8vhvPhdw0fPXdShsumh/0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1zWl8aSywKn0f4XZMYiqGZcq27pg2P1dUPUiIGJheTq/gIXuM
	iySjmvGVOF6ymZMbHkw9JsyVMdw91PGVW+dMSJHWOkcz5InJJAACFPZiDZNJlcqv
X-Gm-Gg: ASbGncvAydqSTSgn3Ku+64jrsAUSi/KTLLBH28aJTQhvS8jHEBbpcrMPjTwhBNT0nqR
	fXnDirN5vmTRBaN9sbwDoX1FAgB+Yp54JLaALdj4unmMzDsphZ987ZZDfcnTEVrahuycgXg1Plw
	S9o5RNlRwsBK3iT9F+DpeoKLnoiIUN41EuYCieGnMPNJUo6x686hIAwqZc2s+JXBYJYxKVS5qzH
	NNsCdm5xzjLmKYPZER65pWAq+86TVV/6kyyZ4qUZaDMVo0PFfyJhegeqaiY/2OhPmXxnzDUxhBK
	ncgKMU6PHMp0aGjtTUZ4nzOaCNh/leboNRERKukMutnPu/1/Dx+YmcOy7W5P/S+1KH3Jwkzs2WH
	twqbwNWdIpxyp
X-Google-Smtp-Source: AGHT+IGgd/lURj81Z9lsAnWesUa/WPM87LQAXPOtcH54feWmINQKauS46gMbJi7bbxN1sl530pyd4Q==
X-Received: by 2002:a05:6902:2201:b0:e82:acc:d607 with SMTP id 3f1490d57ef6-e842bc621d1mr6259362276.9.1750460512198;
        Fri, 20 Jun 2025 16:01:52 -0700 (PDT)
Received: from Slackware.localdomain ([191.96.150.102])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e842ac984b4sm893270276.48.2025.06.20.16.01.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jun 2025 16:01:51 -0700 (PDT)
From: Bhaskar Chowdhury <unixbhaskar@gmail.com>
To: dan.carpenter@linaro.org
Cc: Bhaskar Chowdhury <unixbhaskar@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/9] Trivial fixes in the smatch tree
Date: Sat, 21 Jun 2025 04:08:49 +0530
Message-ID: <cover.1750459100.git.unixbhaskar@gmail.com>
X-Mailer: git-send-email 2.46.3
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is a human being with flesh and blood ...not stupid bot or idiotic AI..

Dan,

Could please pick up these changes to the tree, if and only if, these are
viable.

Bhaskar Chowdhury (9):
  Replace pipes with a binary for cpu core count
  Looks nicer in usage output without the full path of the script
  Eliminate the full path to the script in usage output
  Doing it for the consistency in the tree,eliminating the full path to
    the script
  Again, for the consistency, eliminate full path to the script
  Trivial fixup to take away the full path of the script
  Took away the full path to the script
  Usage shows without the full path to the script
  Trivial changes,usage text show scriptname without path,and few of
    them use nproc binary to show cpu core

 smatch_scripts/build_generic_data.sh        | 2 +-
 smatch_scripts/build_kernel_data.sh         | 2 +-
 smatch_scripts/filter_kernel_deref_check.sh | 2 +-
 smatch_scripts/find_null_params.sh          | 4 ++--
 smatch_scripts/gen_allocation_list.sh       | 2 +-
 smatch_scripts/gen_bit_shifters.sh          | 2 +-
 smatch_scripts/gen_dma_funcs.sh             | 2 +-
 smatch_scripts/gen_implicit_dependencies.sh | 2 +-
 smatch_scripts/gen_no_return_funcs.sh       | 2 +-
 smatch_scripts/gen_puts_list.sh             | 2 +-
 smatch_scripts/gen_rosenberg_funcs.sh       | 2 +-
 smatch_scripts/gen_sizeof_param.sh          | 2 +-
 smatch_scripts/gen_unwind_functions.sh      | 2 +-
 smatch_scripts/kpatch.sh                    | 2 +-
 smatch_scripts/show_errs.sh                 | 2 +-
 smatch_scripts/show_ifs.sh                  | 2 +-
 smatch_scripts/show_unreachable.sh          | 2 +-
 smatch_scripts/summarize_errs.sh            | 2 +-
 smatch_scripts/test_generic.sh              | 4 ++--
 smatch_scripts/test_kernel.sh               | 4 ++--
 smatch_scripts/whitespace_only.sh           | 4 ++--
 smatch_scripts/wine_checker.sh              | 4 ++--
 22 files changed, 27 insertions(+), 27 deletions(-)

--
2.46.3

