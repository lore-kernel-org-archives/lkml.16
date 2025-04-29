Received: from mail-qv1-f99.google.com (mail-qv1-f99.google.com [209.85.219.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A682277007
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 22:41:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745966474; cv=none; b=i6NIgmDHIjkgg9i140XDWRkwXGndfrMiCpDymaDKotsY3nDgln0JD1Gv29zlVM3FFhgJWJpSbuVHC/DoSntKfGdWrhdrWD72cb73DLZCbtkSoXnLpCNC60sKJZli2v4ifAMU9KZLmBHH3LFZlkUylhhTEZw0h1PC+FsfoHITeVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745966474; c=relaxed/simple;
	bh=EVZKMNvHicJPbJJ+yeVyQMnNcU1DnEd0UGXD+q/p5UI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Z3WIbC4ncnRrzBgI6qbVgRvmE6JNKEC2IVbqeXT8wbgacU4TORDOQ5CiHvZFCPSt/+LpmR6iwOJ8spbXbbkoY84rb/CLh8K6wWzQEYnUdShXCwVnyCIidF8YqzNwk2SOm+pcCe+lTRm2f3lSGQVZwzShuZQpDXasM68Iw9/4rm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com; spf=fail smtp.mailfrom=purestorage.com; dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b=PzLQSNvr; arc=none smtp.client-ip=209.85.219.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b="PzLQSNvr"
Received: by mail-qv1-f99.google.com with SMTP id 6a1803df08f44-6ecfc7ed0c1so62614566d6.3
        for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 15:41:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1745966470; x=1746571270; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XJN4BA+fMMi5a/WeaDyJHm35TLpFGbEwKhPCZI9p8q0=;
        b=PzLQSNvrms3oriDMKBvT8UI5L6FTGu4HZox3IJEvB0VnL/ZelQ9UgkJToKvSu8EDLM
         K9x/LxmK7GQCyUa4OU60wejXudtb37yV5YOwRUkggvzrviDF9u06g961+RzoeYzvfY4M
         uo+dLRT2ZUOGA+lvVCahPXWhb2uOc94s0UL1sFY29JL8VS1pcE0LkkHDXMcf5PdJuxK1
         ZYfrQKvQTYhn0wQBCXVbYiBJWomn1nYnvaEksxqESTtH5jgFqQeCKb1nVjwTCNPe5T7U
         gEQmdruv8y2ZFAi/7D81p6zlp1qwQU7YJQxs2abHZSwV/bdwTDVZTd9HlbVP238cMzEU
         4kSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745966470; x=1746571270;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XJN4BA+fMMi5a/WeaDyJHm35TLpFGbEwKhPCZI9p8q0=;
        b=WtYXysn2WLhFgDX7iu6lEGhl17IiAesHlVEUA7bFzYzElCBuhL3EOOzA94vfy1QhCm
         T87UsGqeCgY9LJhfnk1Y3rIMItXF42vDfmbutlxfdwsf5DfIB4jYCcrFDdGFfvYFkNZY
         f8N6H1zv0XcIM0Rp2SxEUgfrLgIaXEzNV3UIv4mYd0FelLB38EiaaqttxkcA0mQpDIcA
         sW0eC0BK1m1V9geWSkWNT1l9KtvlkK6WYSxfbLsZe6OxRRBPuAIjrSQV3y39IL3EFI/a
         igT20sNxjQw1E4n/GsfYqkWGqdvuCNEoJMuih5D7LA2SOYSUzLGLi1Gp9hF42ICgte2m
         ITMw==
X-Forwarded-Encrypted: i=1; AJvYcCUlpAfRSm8TBLyPrdL8bnlFMfVb9ydWgfAC4Y/6VGNSA/pT0/kRntgcO/K4aj5v8U5ViCDV/DWmu/mekDU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzJZGBdJGk59NahvGqY5ARx9kVUhi872EnQ5qUQo+XNA+9z3EVP
	elZEGpA4gBRCKFtyvTrF3jzRvNvSNDMlkiNN0rWhmzc1R5muDlMeKznonJjQu80dvB2huRbnbW2
	aQ9ECsxldzGgeOtiEnVx3R8LYx0Sm+mAv2b0AHcDJI2YWvFYv
X-Gm-Gg: ASbGncur2YyITevI6Ykn22cpzYyoC0LobxJunFylUzrYd2CVys6W8UZTffMiiJEDdKx
	fMbCY57h1PzdeG9dR2uDuDK8O80vpgKISTdqv6Si4emrEt8ajyY3+59rtVqyIsEQYpYHskWNvLt
	bTEDivfln072QgkSAARlwpDfRz9jKBuoCwFGl0roenke8xmHi6zGPB5NqMeUYyfuP2IdG+2KW73
	WDaq7ekdoBk1YAVLu4/s6Fls+Ix85WMrw/rNgkwJKLwkQbDnz+DdpCmqOtI/8+Vo6Umg/FqTSSL
	iVqvzTVxJQVD0PwxY8cxwDWvcSxPvCs=
X-Google-Smtp-Source: AGHT+IHx5pKBNfEP8GO2QbCkLxtckJoqsomQ7OcV39RPZuItnaXv8KVoALbXjsU0BbOjgfoJVSlyWwOn84oC
X-Received: by 2002:a05:6214:488:b0:6f4:cbcf:5cea with SMTP id 6a1803df08f44-6f4fcf6e44fmr18344266d6.44.1745966469654;
        Tue, 29 Apr 2025 15:41:09 -0700 (PDT)
Received: from c7-smtp-2023.dev.purestorage.com ([2620:125:9017:12:36:3:5:0])
        by smtp-relay.gmail.com with ESMTPS id 6a1803df08f44-6f4fe6a84fesm96856d6.4.2025.04.29.15.41.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 15:41:09 -0700 (PDT)
X-Relaying-Domain: purestorage.com
Received: from dev-ushankar.dev.purestorage.com (dev-ushankar.dev.purestorage.com [10.7.70.36])
	by c7-smtp-2023.dev.purestorage.com (Postfix) with ESMTP id F374A340304;
	Tue, 29 Apr 2025 16:41:08 -0600 (MDT)
Received: by dev-ushankar.dev.purestorage.com (Postfix, from userid 1557716368)
	id E3E55E404E6; Tue, 29 Apr 2025 16:41:08 -0600 (MDT)
From: Uday Shankar <ushankar@purestorage.com>
Date: Tue, 29 Apr 2025 16:41:03 -0600
Subject: [PATCH v2 1/3] selftests: ublk: kublk: build with -Werror iff
 WERROR!=0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250429-ublk_selftests-v2-1-e970b6d9e4f4@purestorage.com>
References: <20250429-ublk_selftests-v2-0-e970b6d9e4f4@purestorage.com>
In-Reply-To: <20250429-ublk_selftests-v2-0-e970b6d9e4f4@purestorage.com>
To: Ming Lei <ming.lei@redhat.com>, Shuah Khan <shuah@kernel.org>
Cc: linux-block@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Uday Shankar <ushankar@purestorage.com>
X-Mailer: b4 0.14.2

Compiler warnings can catch bugs at compile time; thus, heeding them is
usually a good idea. Turn warnings into errors by default for the kublk
build so that anyone making changes is forced to heed them. Compiler
warnings can also sometimes produce annoying false positives, so provide
a flag WERROR that the developer can use as follows to have the build
and selftests run go through even if there are warnings:

make WERROR=0 TARGETS=ublk kselftest

Signed-off-by: Uday Shankar <ushankar@purestorage.com>
---
 tools/testing/selftests/ublk/Makefile | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tools/testing/selftests/ublk/Makefile b/tools/testing/selftests/ublk/Makefile
index ec4624a283bce2ebeed80509be6573c1b7a3623d..529ab98a2633a2278bc0df8b26500905d60d2bec 100644
--- a/tools/testing/selftests/ublk/Makefile
+++ b/tools/testing/selftests/ublk/Makefile
@@ -1,6 +1,10 @@
 # SPDX-License-Identifier: GPL-2.0
 
 CFLAGS += -O3 -Wl,-no-as-needed -Wall -I $(top_srcdir)
+ifneq ($(WERROR),0)
+	CFLAGS += -Werror
+endif
+
 LDLIBS += -lpthread -lm -luring
 
 TEST_PROGS := test_generic_01.sh

-- 
2.34.1

