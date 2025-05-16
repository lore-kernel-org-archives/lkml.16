Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEEB72192EB;
	Fri, 16 May 2025 03:29:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747366149; cv=none; b=tlIF6/FVaJBgNVx/g7E5hlxZnN10EsGjhnkZ+mcBHtqOwV17HdHt+essUqv/cPqsYqi0iQbwlqrW/7LJQzt73HB9kjsDTJHLFBCOY5UCHJkRF5VNjqPyIaKbz+2g0QjABAykTFJFgixCTaQnrEG6mDZFxZxLrRRsN8Y1NFAdyLc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747366149; c=relaxed/simple;
	bh=qykaAmrt0fiJaOPZFM0q6IKoWOzYGwEEmiBfiUtXGVo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=T6CVT1EW6ZCSFKrbh1muyhmY50Etd2c1HLcx83z3v1fMOdKIc1Jex3WsgQW3NeFdkDO4F2Pa+pt8I2zTJbUckUBbh1X4C1YFGrJ0cqmQ5oBiYgKOjqsGoroYKAkyKNVFJsliguXJ02GlTGbB1sNpC3hDREL0NEyHZWb1JTYN1rs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UQQMnaV9; arc=none smtp.client-ip=209.85.210.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UQQMnaV9"
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-7300069c447so1536301a34.2;
        Thu, 15 May 2025 20:29:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747366146; x=1747970946; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZjWVCNUbb27cqpL8lz3saxtPoltKk51BxDAUjAb3qlo=;
        b=UQQMnaV9VX/hOZgfdPiDzVfzlt2jE5zEEyKbsWhU9/ClJ/1VUtz4XNvR7Z7cxq40ZJ
         JGPl9oeIHWc84ML1rdRYM8d6tm6mBmera4LhCaiN89QE8Sp9H7u4/DF6SDLElUqhgPZa
         A5XSZKPGlR07iRWNO4nNgpsXVznyulYJJ1Ah6sDYyOp1EeiglCv5Fga837KGNGrK08wi
         0bVOTjFnWU31kXFyT5P5wlzVbP3bWO0UQjZgl5WnDYTcTtv+xX7G3nq8yqehuJXjJwUe
         5ABLkTSet2Bi9H5bGo8qzI18x9IFSLIyqFKJUjhRP8h4ZZz1Hfv1Y2a7q+GIYG0Cju6T
         hVOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747366146; x=1747970946;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZjWVCNUbb27cqpL8lz3saxtPoltKk51BxDAUjAb3qlo=;
        b=Lsjba3DItUcU5NtyZcay2XrnOdpwAxrbzX2oZBUeJJ0mEdixTQTMs6Y68UoA9C6H61
         Yi7mNPgG2QQ6UeOF/7uCK4OhgbJ7+FphvfBknF/GwzRfQaJ7srjzaX5SDvPgtFYAvNMl
         xlaWNzYCRJA551lpPRjIr3tIiLooY7tjNgoXZhLe3z6iMd+5PzBJwpkDOFaPHtQyJpES
         lk/ETrdhmq6CeiJ6S1XbOvF6pKTaujksOSfpPJL6mGS7Sh4CrRuHlQPpC+Tiop7TgmgM
         4ABnPLjNEsSJMhXgV0DHraa2e43Llownu3TJBY8EOnqhqqgdy7cuDa5CtJ7ct1TEicrW
         qYdA==
X-Forwarded-Encrypted: i=1; AJvYcCXNQ7hJiXi/W1avHWZaPtJs4xsq0g1scIVhM1QuaVhe43dULKAm+1J/LxWcvqmBVhMeV9F4iclcPO4=@vger.kernel.org, AJvYcCXvRFordKTj8GkZe54AwWBLvyQkjZkBgxAtFzrii/rOJk+mPJo2FfhWR+8rx8a0G+GmERQN5LnKLtFjFOmK@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+u+vGVecyAD3UukHkL5qGe1Bg9Eb98DOk2WEQ19YOol+p1NWQ
	QsFltHGopy1/W3OpK1H7kn1eHDLnkjw4dxjhR4DpvAVNmyvRZyUrWDi+
X-Gm-Gg: ASbGnctJdYiLTcRzuid4tBdsWKqexWBDbu7gO67NuFzfXQzCjSGbfrmLfPmnsDjHFB4
	TdtWxevwkDbQmtMTnILgEXZ4tqDbGp6MSVDh88z3AsKcTeWpcFECXTE+FO0Sn0S9buTRyMhxPdf
	pA4kaQ8JuWC7q2xUvK3LK7h2/BPOzQ7BkvSi5oARfI5C6SMu9zaN8qzvf4nMi3uPKEhJWhpeft/
	at5k3TnCib9MfgNCExjyUIJgkyNvGuhV48H8W0PiPta2MEXk6lAJ9N/HRHdAlsDIucEaP92R8ve
	wDbjcqlE4TvJZOj9OhakDpeQR9xYK+YilpSj8ggw7kEerpNT0U2Y6x48urTLhl05olbh+PrwJiQ
	q3yM=
X-Google-Smtp-Source: AGHT+IEGMDnSOq3he1EH+1aAF01gXDsDaoR4guIYTd4cbcSz5Jpq7bPGL2qgfd7mqZFoUj+ovmZTiw==
X-Received: by 2002:a05:6830:601b:b0:72c:3235:9c5a with SMTP id 46e09a7af769-734f6ab3705mr1240915a34.1.1747366146481;
        Thu, 15 May 2025 20:29:06 -0700 (PDT)
Received: from localhost.localdomain ([129.244.19.62])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-734f6a7ffe2sm209711a34.23.2025.05.15.20.29.05
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 15 May 2025 20:29:06 -0700 (PDT)
From: Benton Raymer <benton.raymer@gmail.com>
To: corbet@lwn.net,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Benton Raymer <benton.raymer@gmail.com>
Subject: [PATCH] docs: memory-devices: fix typo in emif.rst
Date: Thu, 15 May 2025 22:27:59 -0500
Message-ID: <20250516032837.42124-1-benton.raymer@gmail.com>
X-Mailer: git-send-email 2.46.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fixes a minor typo in the /Documentation/driver-api/memory-devices/ti-emif.rst file

Signed-off-by: Benton Raymer <benton.raymer@gmail.com>
---
 Documentation/driver-api/memory-devices/ti-emif.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/driver-api/memory-devices/ti-emif.rst b/Documentation/driver-api/memory-devices/ti-emif.rst
index dea2ad9bcd7e..d824cc0dce89 100644
--- a/Documentation/driver-api/memory-devices/ti-emif.rst
+++ b/Documentation/driver-api/memory-devices/ti-emif.rst
@@ -29,7 +29,7 @@ This driver is for the EMIF module available in Texas Instruments
 SoCs. EMIF is an SDRAM controller that, based on its revision,
 supports one or more of DDR2, DDR3, and LPDDR2 SDRAM protocols.
 This driver takes care of only LPDDR2 memories presently. The
-functions of the driver includes re-configuring AC timing
+functions of the driver include re-configuring AC timing
 parameters and other settings during frequency, voltage and
 temperature changes
 
-- 
2.46.0

