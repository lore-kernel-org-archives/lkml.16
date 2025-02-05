Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0865214802
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 22:31:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738794703; cv=none; b=ak8nhA6jtDaeCksBKOQfoOSp+725LCyPAX6NKLbEuSrKRUZPE8jLJVhPmmEyyfnrLSu5xoofHbA2i0Ergg5qdc55Tm16FcaX1DzRsFI4JLjAw+8Hy72H7hFFOzGLIiumlXFeNS4KgqphiBlNTCB+LoT/c7t53rrT4KWT3v3ZHSk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738794703; c=relaxed/simple;
	bh=/kR10HeCVaYM8Vgq2NDOKfaDPqQ9eCUNGGr0C65gPoQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=p5oHk3l9vl9R4lkXfJphjwmh4xmuZJg4oir4QCogosBO9nQkKXHzga11IVKF+Epz58z1jfHXnY5xiKhYzW1/MOeZA+AUBJctI+OJYD2JLOXLWK1+PGLnaLNYh908zGUFloZ0qabPC7QzZhS/ncM3KgUMoZmWj/pu14l++iImWGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Wn4MsE8t; arc=none smtp.client-ip=209.85.128.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Wn4MsE8t"
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-6f679788fd1so2293657b3.2
        for <linux-kernel@vger.kernel.org>; Wed, 05 Feb 2025 14:31:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738794701; x=1739399501; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dUp96KkPErIjp1gFx51MSdUGxJRFVk8fYcgX7uibo3M=;
        b=Wn4MsE8tuDUOmnRZlZ0JlwZvhTJVVGI0acIIAZoT3GbV9Af51rjRj2LSuDx3Tx8j0T
         dHm5kIp23db5QAK6mWd3SXKCvLW72cs0oVYP6mQyBdSxUa2B0zAxDOKQ/fO1IRpwue4Z
         dv1fGqxrzh1reNfhe9Aznmb8lZkicq8aT2ZvTZ+fQi3JLtNxRX86kIWYpjE05JAtraEK
         kBVOnYZfxR+MWuEIZNeoQoz3L3pn4M8Zy0e7kk6WkqtGOCRaNddsp9cbw5vnTgQ3TTyg
         ATitR1jNn2PjJsEmq/nEFmxiE4ssOQWGvTh85B0Ovy+X87atFsr4recYIUIVyT9jAC7n
         kwug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738794701; x=1739399501;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dUp96KkPErIjp1gFx51MSdUGxJRFVk8fYcgX7uibo3M=;
        b=m9dD6l9UIa1clgs7crVHeTjBeGmK44HC8g/9chN8dTXkvbF3BdXwbcZi+50f7GLH5H
         sqIMy7hxxt9PKGI6xOvN3NMLGhwR/ttWM0BKKi1aA1IWyX6gyz5NmcYDHNahzbkb1+bh
         4Vpj8F3MeOPVHfRjs1Do1XogXzKY5Q4MDqU7GuINwzhP4TiPq1bS/oC5Ji4N8C2fc1Fc
         BnnTSlikNdwCzdT8p2r0ztoqc6cv6PBB7NtyOXzV3dY5cgJ7aXNusdf3vMz/+AZku4In
         SP0A4uEGEJ3jOgrP1atJHTdHePrak8/eq3IReL/1Lt/G2asPqjcRdYub8stm5hWhYpNV
         aJGg==
X-Forwarded-Encrypted: i=1; AJvYcCVZ69rQXGqjK+aqA1yJU497xYWOS3AbW/8jwpITo8E2gwbvtioAiTRr63gXGlq7Xi8AR9+5CzzJY2ZUu0E=@vger.kernel.org
X-Gm-Message-State: AOJu0YwoufNjQo2Oqy+vwQyi+n7ZJe4H9R/Cagx4BcP1WSw+LRp4vnxX
	uy2q1au5AnbBZbasEnBdpedCYPwn9kT3BvS+UJNxj2H+RaU0kW3a
X-Gm-Gg: ASbGnct1iYiltZDOMc/PriFYi8oz6HrqC2oXrTMgKOOCoQBl0WHlt58cAb4IeJil0S1
	y98MFB9ZIYWGQJtC06+s49CvqB6sTPXTRfiBHR9NI+S6yZc2Ab1QasZmjU7EwVvP8yLQGIiIDdX
	TpINaeZGhyINKwg2TACckn+LdQ0h0ljbSsQk5DrpXo04aGKLnSFXvBqwMZvlIidgRfkJG16CZ3B
	4SEngajW7E80odd5VQyQ1fT/r8kyRDV+6dA2+k4s+escZaBUvgE8SmtcHyaFtrIosXd+kIGcQgq
	GJwyXn0zs2T6YyAhRZo8
X-Google-Smtp-Source: AGHT+IG14WsdTTeMN42XPaMB9bsLzPdaQewMB+BTimD7RqH7jKa7+fIz5QE7hDOvceRJnR2xDSmPzw==
X-Received: by 2002:a05:690c:6910:b0:6f9:4bb6:eb4e with SMTP id 00721157ae682-6f989f4a07emr44419597b3.31.1738794700746;
        Wed, 05 Feb 2025 14:31:40 -0800 (PST)
Received: from DESKTOP-GL3U3CJ ([149.22.94.73])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6f961d8769esm15469677b3.82.2025.02.05.14.31.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Feb 2025 14:31:40 -0800 (PST)
From: Ian To <onlyian4981@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Ian To <onlyian4981@gmail.com>
Subject: [PATCH 0/3] fix coding style
Date: Wed,  5 Feb 2025 14:31:34 -0800
Message-ID: <cover.1738794631.git.onlyian4981@gmail.com>
X-Mailer: git-send-email 2.45.3
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fixed coding style issues. Reported by checkpatch.

Ian To (3):
  staging: rtl8723bs: fix spacing and placement
  staging: rtl8723bs: remove unnecessary parentheses
  staging: rtl8723bs: don't end lines with (

 drivers/staging/rtl8723bs/core/rtw_ap.c | 363 +++++++++---------------
 1 file changed, 128 insertions(+), 235 deletions(-)

-- 
2.45.3

