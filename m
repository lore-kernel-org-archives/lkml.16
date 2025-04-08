Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADF0D2580EA
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 22:21:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744150862; cv=none; b=Ig2+AMowFytYn1DA5HR7f/u5UlTk6mA5Fcbuda2Ooy154CvCR3ohpFnq94G81sSvcxgjnkO9cwR6EfXkRMoWNvkFTnY2SRlBzlrH2fVxJfyn2pKQv038zFprEtHhAe6yktmMk6Ysiq03uGwT4gE7TmrmD9ppRG2rGUh/WPfTYWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744150862; c=relaxed/simple;
	bh=XyPbod8/7vQVXtK70+jplftstJkcfOxYtIGTLd7Yc4Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dsblkZKw9Fc9AKJMGvDZ9zkICBpe3Wbn0LGkdlW4LZiKwGgIOLks98pKxVHxD1Sy97KrIgH9u2jNqL5bYrjZiIgPhQD4cN9EgbM17RzEESV4illpCW/8y2S9TzzwqT/x7pv5UATyJy79+4L0BUwC6J9Z4LbIVTesU5EZ3Vq/VUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org; spf=pass smtp.mailfrom=neverthere.org; dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b=auoqRFJc; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=neverthere.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b="auoqRFJc"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-7399a2dc13fso8203775b3a.2
        for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 15:21:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=neverthere.org; s=google; t=1744150860; x=1744755660; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jSATZl8+I0KjdHP6z4Ok+44QEtTVto5FwknMhI/D384=;
        b=auoqRFJcMvFptIMjUmTdxfw/5Z2K+hqzBVG2ALx9E0Agj15lGReIGnLlSnQL6hN/FX
         sFuwK0ZON4Imj8zgY8nCL87IGPn4NpLp4Mf0xN/GSv2t4VGdUNRNL0+RXa5/qZpLEYBA
         VIgnMfKsTyske2Pxq+RArukFvc70hkvYB3h/GC2ipzsaOnd8ifph5rxT9zZn4ov5gjrM
         ZrueS/biMZLDOfqvN/1dKa1fGvNxkz6EuS/YnR0eg8CiImHDeruPVFcmmPAq+jfu7KRg
         IAVNXaXWNPI0o8UG0pjQQWnvwdQDPoIMeFf16kG/cvDxtr38QXnTunKvtSDaqxIh5hmA
         Wrow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744150860; x=1744755660;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jSATZl8+I0KjdHP6z4Ok+44QEtTVto5FwknMhI/D384=;
        b=B4Qji2UWftiHeTdVup+CytDctl4ytQ6DqZI/EwZUXay7Nmkv8uR8V8MNQs3lsVGWLn
         SUBGLfTuqyDK/YJyaavUyfgsi7MyEsx4S7NV1uPg9OARw3z2ETi+nIxM0M+xX5BKILeK
         rbiJ30O61RJwoX6bCkdZHG8ZHLJg8j7p0TtgOMo+x15/NRE/qb6xy0xGdgwXo55NxYjS
         cLOXe0R2AR839zJGi+lZ2vhcSbwdgf9YqZbyISwVt3A6CrgW9RtqFY5mIZMY7PyhXBa1
         ufnKrPpR1TXk5LMIHTlWK4qNCzAQgftnSjPbqQnqaJFLK+CShL2arzXZ2hpz0I0hgIxe
         uwdw==
X-Forwarded-Encrypted: i=1; AJvYcCUf6jdv3omaWxKbpZJUuEr9bpefgiUZudJT+Nb3EVaUdh8b1KE60LHWvikRqTxbGDYcdViMtEoEGyXMh+w=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2cSq9gjOyx6Aenv3oL9qO6j5eB358QPd28GZWjNc8ow9IOoeA
	bKjx6Trj/azX9Q4PGR1SNtRDcKsAhSUVZcK2jaTEVejyUqMF25ZJghmSpHWe0w==
X-Gm-Gg: ASbGncvYEuRMEX4iPDQJQxk2dm4XbBgH03MpMP0UL22siAny97UGDMr87PBbERG7qSV
	/MtwlzRXSOmirFCTeoQ7knD09A3+p5x+PIMZ3Eej8FZDpuPCg8m2Y0He7EHz81yjpIh9zphy01S
	0NDcPfVoH6Ibz0j1I6BvpSPmpvz2lx+PEI3CK8H9iQslhMtQO+omekrMcEvgyFij94TrvUpNmcD
	PVBBv2VNTuJKWz4FxYuQ9ChKLu5jD/mcZIrUxVgEZ10BcKqIhiY1kxHSHeeu1fGKzvVcA7Iu0GZ
	qsx0cBkon1+nyHPKjmL2MgILljmGqVEvq7PGKoVuyGoIK71mkQiuK6jFAfJoQaZ7JrQoyqXXK2g
	66sC9zW7cuDaxUNK3Kt2G
X-Google-Smtp-Source: AGHT+IFmwXnZEkFNi+5qKrJ4pV+MlosS7Qw8EgUIA4Mc5+r6uHgJAKqAHOt/HfZICbbPLTKWVuxgDA==
X-Received: by 2002:a05:6a20:438f:b0:1f5:9024:3254 with SMTP id adf61e73a8af0-2015ae9945bmr181239637.6.1744150859971;
        Tue, 08 Apr 2025 15:20:59 -0700 (PDT)
Received: from tiamat (c-69-181-214-135.hsd1.ca.comcast.net. [69.181.214.135])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-739d9ea09c8sm11459503b3a.101.2025.04.08.15.20.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 15:20:59 -0700 (PDT)
From: Michael Rubin <matchstick@neverthere.org>
To: gregkh@linuxfoundation.org,
	dpenkler@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Michael Rubin <matchstick@neverthere.org>
Subject: [PATCH v1 13/14] staging: gpib: nec: Fix Improper SPDX comment.
Date: Tue,  8 Apr 2025 22:20:39 +0000
Message-ID: <20250408222040.186881-14-matchstick@neverthere.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250408222040.186881-1-matchstick@neverthere.org>
References: <20250408222040.186881-1-matchstick@neverthere.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Correct Improper SPDX comment style.

Adhere to Linux kernel coding style.

Reported by checkpatch

WARNING: Improper SPDX comment style .../nec7210.h', please use '/*' instead

Signed-off-by: Michael Rubin <matchstick@neverthere.org>
---
 drivers/staging/gpib/include/nec7210.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/gpib/include/nec7210.h b/drivers/staging/gpib/include/nec7210.h
index 4b06ac0408df..5c57fbffb9d0 100644
--- a/drivers/staging/gpib/include/nec7210.h
+++ b/drivers/staging/gpib/include/nec7210.h
@@ -1,4 +1,4 @@
-//* SPDX-License-Identifier: GPL-2.0 */
+/* SPDX-License-Identifier: GPL-2.0 */
 
 /***************************************************************************
  *    copyright            : (C) 2002 by Frank Mori Hess
-- 
2.43.0

