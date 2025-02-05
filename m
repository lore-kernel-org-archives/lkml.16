Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36CF21DDA32
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 17:25:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738776318; cv=none; b=BND5ZrK0sttNMzJc2E2N7RKCuPCoBRnqkNzTd5SiRpwnJNBFFrVwpNBP+gWi7d0ND18QG3Wn8scKcLLweq/vgq2N/ex5mnZfS5H254cu5PEjouNHgLyRVQmwGzc91FxXrzDgSmY0gkha2e2uU3Z2NFQvzC+XYxpA9FeYQSX/3xs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738776318; c=relaxed/simple;
	bh=TqpyMDmpf1W/tOsNu70NlE8XSP5Scatc1vKtxjeZOSE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TUGiYUUGyMIguIEEMGemhF/oQMD1NmD/x5W7dwxpj4RORT5hm1Y9UIVTxSVFCUKgi5hoJ76rRzDSXkMvk1PGzJ/YXLQ5RQjJo3yNQqUVVA/+WxS1wp3ebbes3I9iu1EEJztfS9o4ixl5apk6mkL/CKjPIE0gzf1jsFMCBYqP2yw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IXDzd1Hk; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IXDzd1Hk"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2165448243fso1734805ad.1
        for <linux-kernel@vger.kernel.org>; Wed, 05 Feb 2025 09:25:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738776315; x=1739381115; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UPLKWwOU4d47zpTN4AWOYWgVD0yi3bCcn+ErGfR89Lg=;
        b=IXDzd1HkV1q19CYxZeBPF+/HjXhTC8WQu4ebD7oscWJf6Nd11ljaQte+xpshIQ4oN3
         ErJRtFa3u2bSlLXsP48Bj2zriCHY3GD5AVfUBUCzvWaao6NF531A7orr32bB+z0wSy9v
         h8xB2Vdf5v5ofEqffJcqTls6MglV0taaSN9dQWUn5ZJ2QsGXewcirxZXb8oLcRPOF9GL
         P9T/K5cf7wXqNnp22R7iOfwLo4difFVnzoILmQXTgetrOQkd+5l0PS3eYzjQD8aDFwp5
         AneW8o5CeR64C8KuIhQs85Dd8Bb9K+iFlQOIf9b7cf7dtgcSe1tSk4Sd1cEzwpX/8oLQ
         2H6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738776315; x=1739381115;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UPLKWwOU4d47zpTN4AWOYWgVD0yi3bCcn+ErGfR89Lg=;
        b=G97OsBz7DcX1+mFUUMMDK9gAhX1YshDEtNp5kXVpAGy/PAiePIzd6Tfbe8+8rI1urX
         WGL1fivDBvBP69DPRoQBI4FKkDTZc9sZ86fYpzQnx9CXzGBE4HbebufKEv9jXWOkxN2p
         uunnCLO1dTTVLqagRrU/BwC4KdRDzVhNEXUR6f8AJrlrFnOmkE1rlKCBUs8G6AysQGnS
         EcB3xY2PmPRQPc0L4iCiUWb4RlErB2ThPz6KnDnrZCSC9yXZAQx/cNWh30wfsmgmsdAi
         /r5IKBnNTRduLmUzQs6TmJ9tVFueCeITss36XBp1eCDb5eTkh6kp43LynFHfBVfVmDjP
         6Fsg==
X-Forwarded-Encrypted: i=1; AJvYcCWtcZBhBB9enQU94UV2aNNwby7rbv87hcPsaFKa+Du5E/ib3crYJjXmZdoHM6X7/Rd47Rjy04Iig9HisZc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwsY8x9AI/Qmm8MNsAG7jPFkCTUXHFfoYei7w2bD9DWYMVeHVs0
	MsoS/0usqSB5Poxfj0RJhuxZRKEvkpHyqNcJd5tjyYEHg/Mb7ImM
X-Gm-Gg: ASbGncsdVS8BhVA0b4OXguhWwR8EGsL/b0eEd14VHKVTX4MCN5Hx1CwZg7/0nW6zORJ
	bYECc2q/aQyqUA19i3jQr6D9B3eqN7sBwO/dtPZI3UWZQdP7DblPtvAkGGJaiP/CUPg8fx7Oo30
	ASQhspkbnYmGlkvmINBUc24U1kVv2SZyvoK9w/lK623Z7leEQgUykgphyE7gRHpsGJfOr0TV+dk
	n1Ed0EqjZBAq7HWlsya4X9GCBMbkrXJ2tnjgHlI693Zv/OWUd1irsEW8qDH1wPLGvq6ZWQwnhoH
	1LxNW9bKsL6lWgZmcvKV1ge6yIFjnjvIMy011AMjxEgcNg==
X-Google-Smtp-Source: AGHT+IEWJOXoWeC/VFuQ1owcOXgHiHraEYlmitwfwG4RZPhhWGOMpXQkIDBSxp+a95pIDRcjlcr8TA==
X-Received: by 2002:a05:6a00:3a19:b0:72d:8d98:c250 with SMTP id d2e1a72fcca58-730351080a5mr6024541b3a.4.1738776315187;
        Wed, 05 Feb 2025 09:25:15 -0800 (PST)
Received: from vaxr-ASUSPRO-D840MB-M840MB.. ([2001:288:7001:2703:e6df:5ab5:fc4f:a680])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72fe631be8fsm12731719b3a.24.2025.02.05.09.25.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Feb 2025 09:25:14 -0800 (PST)
From: I Hsin Cheng <richard120310@gmail.com>
To: pmladek@suse.com
Cc: rostedt@goodmis.org,
	andriy.shevchenko@linux.intel.com,
	linux@rasmusvillemoes.dk,
	senozhatsky@chromium.org,
	akpm@linux-foundation.org,
	linux-kernel@vger.kernel.org,
	jserv@ccns.ncku.edu.tw,
	shuah@kernel.org,
	I Hsin Cheng <richard120310@gmail.com>
Subject: [PATCH] vsprintf: Drop unused assignment of fmt.state
Date: Thu,  6 Feb 2025 01:25:07 +0800
Message-ID: <20250205172508.55358-1-richard120310@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove unused assignment of "fmt.state", in both cases the value of
"fmt.state" will be overwritten by either "FORMAT_STATE_PRECISION" or
"FORMAT_STATE_NUM", the value "FORMAT_STATE_NONE" isn't going to be used
after the assignment.

Signed-off-by: I Hsin Cheng <richard120310@gmail.com>
---
 lib/vsprintf.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/lib/vsprintf.c b/lib/vsprintf.c
index 56fe96319292..400299465875 100644
--- a/lib/vsprintf.c
+++ b/lib/vsprintf.c
@@ -2569,7 +2569,7 @@ struct fmt format_decode(struct fmt fmt, struct printf_spec *spec)
 			spec->field_width = -spec->field_width;
 			spec->flags |= LEFT;
 		}
-		fmt.state = FORMAT_STATE_NONE;
+
 		goto precision;
 	}
 
@@ -2578,7 +2578,7 @@ struct fmt format_decode(struct fmt fmt, struct printf_spec *spec)
 		if (spec->precision < 0)
 			spec->precision = 0;
 
-		fmt.state = FORMAT_STATE_NONE;
+
 		goto qualifier;
 	}
 
-- 
2.43.0

