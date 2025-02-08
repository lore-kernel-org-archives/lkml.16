Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EB5D241CBE;
	Sat,  8 Feb 2025 17:35:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739036158; cv=none; b=k6tBxacBjwBadPbAao//94er48JGQXy2wvaipMjRnQoG9L9ebvHdeYTbZCYKo8IK6tyiKb9Kcml/Uju+6nt7XdDbZhczlX4UBV/n4r7AhzRj/cJPOqBdywwA85+8DgK7lF0sCGksqc3P0c731vNALBCHxh4HQ4Ci+del7Zrtm7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739036158; c=relaxed/simple;
	bh=eMZffd+CadDurEeqwJEY5xGDr/mcDUP+cWGAGDhXkVA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=OsNfyOm4feEn83Gx0t59sKRCw/TnOjnGFtPqbrpyOffv4HDGNySZnPpTj31lSgnyJR4TTHZrPKhhN+pA9kpFS+A/4amJLzvkiAvxOLeisnQXh7KBWvfbGH6XX5v1lYVwhIr/A1ATbsUVvz2BB52gLSX18Vf+HEPqKrclnYhMhf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kLiuU9dn; arc=none smtp.client-ip=209.85.222.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kLiuU9dn"
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-7be8f281714so295981185a.1;
        Sat, 08 Feb 2025 09:35:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739036156; x=1739640956; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pFzxysuPq7z+/AWWc6raq13TKutBoDxFqezNtvWPS14=;
        b=kLiuU9dnLUH4gUhk80ah2meA8+dSLoWszYNr2UMrXAsh65NiuyERL47VnRO268sZdo
         sd4j0v0E1RW5NKSdbxePPxvx3IVqhfmir6/0CZWupViQFBRyITDlJ3eHnBQoYO1d5uoq
         14cA6sCS7iRdK1HC1VbSAEJDL3gpx91BXM3lpuuBxCiNx8L2qwK2MCubLtEOwLYmmkmf
         P6i0pcWVWdQcFkRPwWO0IikY6LvIH+hIlEoqi+zKbstfW3mKDaEsCEL/GxHo7wAdJOxw
         /xvaLwZpgHEFT+WqA2RqBE9KzmGTeRQhHjX4vj7lL2MbEaYG1NEcq5qW1fZUlENww7k5
         hH3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739036156; x=1739640956;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pFzxysuPq7z+/AWWc6raq13TKutBoDxFqezNtvWPS14=;
        b=g5TZBb49EMQ6MBfH3rSwaaFuU3sVZNQ/qaJ8t2yXT0K/hmONBxjBGtWfFg79wv5Qv5
         OVDgYrFdmmAsC32Hc5iXARFkvHVvYwkmGHsz7JtmvJ2N+nmO3BJoeuaBwuGr0IsQUszL
         dNqpggL/NLbRoZ7nDRW5JsvjO1SghhQuAIsC+xb+F4il75vdIT8Yi+boMim8Zdpul03J
         8FzK/HQIyB9LeDf58/q2YpQkOKQuBqrGywRLdxmfJd0rrBnfcPNNRLZZPwK7T9C2PoUg
         QrujyF+PfiPqmzSdBlkZSeYOhvT/+3X+X18qjUfrskmcOaBum3CYfbi50OIOqnc9SbeK
         eZPQ==
X-Forwarded-Encrypted: i=1; AJvYcCWDGena66Zw6+w623PEBc+1dVFigx6/A8jjbXUaeuG7HqkXYdt6/NuFDzZ8WBpbg/JtPwbs/0wL0PI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7M61YuXq1cQtCuK9wPOGhxOpNAb/2SoX4oqypA7S+T/TmKsCa
	jZHq9sHhAHfQefBkySdp6OwU6b+u3CBoNnyqQmNFM7QGRrEorlbS
X-Gm-Gg: ASbGncvgRckkWI0+AfjgwsK4rJEC1aeoLf5GGsoKqg97u1ARNOEpbiynoOhSvpqJurq
	qiAnVt81cRiKezuliPw0wbBv2opWS+40FibA6C25d0zMws0iDRdKImPSsMEy3DT5ydfrpNhNepl
	kV9bRn1rHoiMhIt7+9U7HVCl+OCeyZADyqVdI7HM12cNmUfZaRtUCwisTT8Rhi6nAhz0orS1ooE
	v7cO0nnVNUt2lqBbR2fGpk8VMeNbbdO9qobnm/Zp9m7z0wZDbbE7HKNNMsHXILBCmiYS0LjENoM
	FmrJx5AZN2n2Wt1oCbfjsfpbxgtWhd4nPO7AyWXiie+Cvfrqt85HFt+JfZ68
X-Google-Smtp-Source: AGHT+IF0gm0hACvAn/KGurrADYXQRqp+r5zIZ86tyDekU7Pa/twFzTRNBMTXl1JBZ2fejh0stjaMlw==
X-Received: by 2002:a05:620a:3191:b0:7b1:12f5:7af5 with SMTP id af79cd13be357-7c047bf3fbemr1034580885a.3.1739036156013;
        Sat, 08 Feb 2025 09:35:56 -0800 (PST)
Received: from localhost (DESKTOP-V1XZZQ5.ross.clarkson.edu. [128.153.205.31])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c041dfcafdsm324136985a.46.2025.02.08.09.35.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Feb 2025 09:35:55 -0800 (PST)
From: Brendan Connelly <brendanjconnelly17@gmail.com>
To: corbet@lwn.net
Cc: linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	dmitry.torokhov@gmail.com
Subject: [PATCH] Documentation: input: Add section pertaining to polled input devices
Date: Sat,  8 Feb 2025 12:35:54 -0500
Message-Id: <20250208173554.209688-1-brendanjconnelly17@gmail.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Added section in Documentation/input/input-programming.rst about
input_setup_polling() and input_set_poll_interval()

Signed-off-by: Brendan Connelly <brendanjconnelly17@gmail.com>
---
 Documentation/input/input-programming.rst | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/Documentation/input/input-programming.rst b/Documentation/input/input-programming.rst
index c9264814c7aa..2b3e6a34e34b 100644
--- a/Documentation/input/input-programming.rst
+++ b/Documentation/input/input-programming.rst
@@ -346,3 +346,22 @@ driver can handle these events, it has to set the respective bits in evbit,
 
 This callback routine can be called from an interrupt or a BH (although that
 isn't a rule), and thus must not sleep, and must not take too long to finish.
+
+Polled input devices
+~~~~~~~~~~~~~~~~~~~~
+
+Input polling is set up by passing an input device struct and a callback to
+the function::
+
+    int input_setup_polling(struct input_dev *dev,
+        void (*poll_fn)(struct input_dev *dev))
+
+Within the callback, devices should use the regular input_report_* functions
+and input_sync as is used by other devices.
+
+There is also the function::
+
+    void input_set_poll_interval(struct input_dev *dev, unsigned int interval)
+
+which is used to configure the interval, in milliseconds, that the device will
+be polled at.
-- 
2.39.5

