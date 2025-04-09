Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF4B926FDB0
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 17:35:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744220121; cv=none; b=ViOvMXuQ7gAi5EMDIfEojTZ8iGMfN4Aj1tIteDyqTYvmstSiRF4LIi3ES0RuFxyk7suut79Khu1Sg9c/jDKlU3HncwmAtaJifU5/3yzHmon/VtcAWHob5iR7M/+AxXoK02t3iNLb40eP015lhUy4SVYKcc4Sp8fO07Prj6zmdKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744220121; c=relaxed/simple;
	bh=U+ehWLSaRSK6X6F/UDLucuBn9urzPkl9KrBmPNVyMwY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=huqSXId82IVzFJ9v7kYO5mqscmKjnsviVeBCpGDKYUwUILtq/K1RDMWHSNFn0kyy5GYa41F3/eoidUtRqyd/+Ag9WyONcVc0OS2QcETUk1ZHoDudvFaeuhALqhTe3g4V2cSTw87VIPSXkgOhdMVLNmLoKm5HqyEyDmdH2TV+8Fs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org; spf=pass smtp.mailfrom=neverthere.org; dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b=WinMl4CX; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=neverthere.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b="WinMl4CX"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-226185948ffso74994635ad.0
        for <linux-kernel@vger.kernel.org>; Wed, 09 Apr 2025 10:35:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=neverthere.org; s=google; t=1744220119; x=1744824919; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zLfeIRA8tBnw8zdIQ4nzT54/RyV8f9HMbjY3r3rNPLQ=;
        b=WinMl4CXplZWPGsNSjuEtYbGcYIxgonPb3nG6ZXvHjNpfekf0K8UpY67YyNVZs0ABq
         jUDqokhU0+stHqPftKyVY3fopl8T/8oMDE61sB6v03Q7rawTDTVbvmJGLi7jMcfaHZ+E
         0OS1Xk++lhHGGSbpTX17e6HhbTa3BR7BMp/yU1ZIPikC1xhkzNZisRy5jlljdhSkDqNT
         AFwmyiCp1VvZA+DFdyJlme1H8SSrkTaocpsjoKfB8kcyi+X8xy22YRgCI4ADtxGKjqhj
         EeEUyd4vdTJGvlQnP4mI4PhVDt8NbNbigDD2rgP3V81Hb7Pa6yHzegvZpls+seYYi4VL
         31/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744220119; x=1744824919;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zLfeIRA8tBnw8zdIQ4nzT54/RyV8f9HMbjY3r3rNPLQ=;
        b=rl/ZD9J6EgAUTC4oANwQts/lNDJhn2ytJiUIgLAldv4HI86J/Iu6yEbWEyIll/Xbqd
         QgOBwTCmCkH4I71XRaPJJmNPRuxST9knwigoN7kDH+yHRy2iAhkkxhhMZtaqbDRbsLrF
         AkDj6mAOS5fDXR6K2olxXEr0lXPzNZeARAH4CuEBu1KIwSt5q+tGA/+NyAm3wyPhcmDz
         tu6PMTe7TrQn3qqjMTyZJLt1uELYeVSO65WySrY31ExVmqYK3NGYdrhXcGyfm15VTLuD
         9wfMTx0+td/9r2U06QeuvT3I7R5D0MK5SbN3IG87heBEaeZo5B/qhVZ5bpgoIunMRwR4
         oadg==
X-Forwarded-Encrypted: i=1; AJvYcCU8RE9/XU52vfNvZPd7daLgc6L8+6XLa0jMR0211oGwRAjUmtekqnoerZX4s2SwJnYvy6xOHAjbwe9tiRg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzY+QWBhY1SmiNh2wLVJ0TQOn1D9fGhDQ/Byr5O/Nn1WZH2CJQk
	9iTC7feB/1yvdKlLKKxODcaq0fIvy3OeWFEZXQQAbhHKR3P8csNcig40w1bJZ5rFD3NxERRY7R0
	=
X-Gm-Gg: ASbGncv42mFyG28lhDWmPDjMOG7TgTPMEovluiOKhpE2M5bRVPYo/RQgQbtiNsuWGzf
	of2beXDEN1/qbrEN3W0qjgQqnhY7Fg81cRM7Y4Wwhx6Fupy24PNVgs5GWFoXkM7ltDZagGAQaH5
	qKp2oTFYAJloOwS++MpSxVxWvPNHyrJpXg7x/HPNiEV4QM4FAhP+ZAxbtLTtY0cAtlXo8vHn9Np
	gmL60b/3ISulb71Veor4i1HzK2wxDzPJOyFMRgAfDktn5Ncgr9NAKnbdfV9boyHmvjcRPLidO/N
	L+UxHgEzHc8qax6hsT+13btkue0thKgnpHLZD7GljWhpr+oaYyFtvSjs2hDKVoNMkN9yNo2GUOs
	307B3bA==
X-Google-Smtp-Source: AGHT+IFcgdkrxNVEeEhkEg7JnH0hPXgiQiSK7a4tnmQYQuz7yC29z/6DzMpXot7Z959OjLMQDlC+LQ==
X-Received: by 2002:a17:903:1c7:b0:223:5ada:88ff with SMTP id d9443c01a7336-22ac29be057mr66409385ad.24.1744220118923;
        Wed, 09 Apr 2025 10:35:18 -0700 (PDT)
Received: from tiamat (c-69-181-214-135.hsd1.ca.comcast.net. [69.181.214.135])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7b62895sm14927945ad.5.2025.04.09.10.35.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 10:35:18 -0700 (PDT)
From: Michael Rubin <matchstick@neverthere.org>
To: gregkh@linuxfoundation.org,
	dpenkler@gmail.com,
	dan.carpenter@linaro.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Rubin <matchstick@neverthere.org>
Subject: [PATCH v2 01/18] staging: gpib: struct typing for gpib_interface
Date: Wed,  9 Apr 2025 17:35:15 +0000
Message-ID: <20250409173515.386725-1-matchstick@neverthere.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

"Having the word "_struct" in the name of the struct doesn't add any
information so rename "struct gpib_interface_struct" to
"struct gpib_interface".

Signed-off-by: Michael Rubin <matchstick@neverthere.org>
---
 drivers/staging/gpib/include/gpib_types.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/gpib/include/gpib_types.h b/drivers/staging/gpib/include/gpib_types.h
index 2d9b9be683f8..10d8776ef425 100644
--- a/drivers/staging/gpib/include/gpib_types.h
+++ b/drivers/staging/gpib/include/gpib_types.h
@@ -22,7 +22,7 @@
 #include <linux/timer.h>
 #include <linux/interrupt.h>
 
-typedef struct gpib_interface_struct gpib_interface_t;
+typedef struct gpib_interface gpib_interface_t;
 struct gpib_board;
 
 /* config parameters that are only used by driver attach functions */
@@ -51,7 +51,7 @@ typedef struct {
 	char *serial_number;
 } gpib_board_config_t;
 
-struct gpib_interface_struct {
+struct gpib_interface {
 	/* name of board */
 	char *name;
 	/* attach() initializes board and allocates resources */
-- 
2.43.0

