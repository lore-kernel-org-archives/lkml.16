Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4282A28BA96
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 17:22:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745428932; cv=none; b=h+L2fU1aIfEH0vw0sannbBWr7+q4JxqSl4FZqdlRFtlrHn6gDjUQfe3DwUpVZCnAoDhxbeXtRLgWTK3nRCxnFOyjajNvMCqeiKjWFYsIhM7a2On47JpVMBno4sF2ko4HQtZXuLas7IVw1i8d04PDZw7TcWJmrfRCZeHl61o8Npk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745428932; c=relaxed/simple;
	bh=oJSYqGkH8eJ7nnI4eONslaNCAK4zDKV2Mf6cPlywreQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=dcTo0M1cH1sSz2GyzT2QVNaD2FDY6rCA1pFtF47Bam6RSDj4EhTU2Tl0DL43M78es5U3PajVaO1db2QcuIOm6rJcOD7dslcTrAOK8u4uDMSz2716n5muK/EiSqbBZJTtypry3xtsuyHvD8bZ19hAE59Xj9dy4F9gSeUWuCLpHYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PIsTen+t; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PIsTen+t"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3912fdddf8fso937729f8f.1
        for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 10:22:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745428928; x=1746033728; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=I/fWatsoyC3ISeEvWnCn+x63EPNqLu0aQi3bXvQHx9s=;
        b=PIsTen+txJ4y14/TzBIiwRaPQhjL1Zx7srnlszJHjVqrqoKe6tLh23V9tXqmqwAVRo
         7wEO3Vmo8s28ddYy9Ypyap4toFXwh/GUYi8/LOXySKfHS38D+4kGvEwhLks/LmtHT5ln
         orS+xQg2/vhfolUbGfDwoSmMuNtf0HNlH42P8h+BtfjE8c9FCHMaNXs0iedaq8VNM0N8
         xMrapZFwNbFHuxIU9PWus5fWm/CQyIY8oFLGwgqb9ckR3+3z1AnDFcztUPi8OU7ESN5D
         jrDw6efb0GulF2VEsgAn9kNv6cIk3etFBwxRzW3u8LwJYToDTrSyxUf9RF7V4SgefNFI
         gOaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745428928; x=1746033728;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=I/fWatsoyC3ISeEvWnCn+x63EPNqLu0aQi3bXvQHx9s=;
        b=fCJnJd8xGZa75Q3SJZHvmeYa3sLItjV858/gYm2Yqf9AkDph55dU/s0GjZ+rEK54qQ
         dwnBJBbEmQiGiyUlG2rWvub0+Uiwa41Pf9oPFma/YoLKLMQaUcIkoUdA5MT/rZl/J+pZ
         azzlkgLkvq14BvsBi/UsLHSw9pAJkKUmaRRe6WUJp3S1kI9a09JIA0QNnjIP31NkGo79
         ylKhYlg3PqYUeowP6J5H0g5PyJx2EF6sRaeQO4H/UopcWnGaOrDPv+uD0Hwy4KXCur20
         8x3+nztmEtksseelaFPPFFtr9y5Z8J7DXP8TfbeSLPzYAZbCsHv4hMiy5jRGicp/nmeU
         6gMg==
X-Forwarded-Encrypted: i=1; AJvYcCU4cMnURrr61l6FnQE1fv9B9AL+paPTUdtPEnnQoVJYd+Ti/XUv4vqy1rN3luCktqO/2n87oqOCwCxJ/ig=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywlu7qz97AIJ7cU93PEC/sGqCJMQ9Rmoa0Saqxg7Xg001T3s253
	JzY/YN2isaexoSP0r+NEpIdxvLq2p4hAY4SVIA8u31DapbKCwHAifEXXg3FL6z0=
X-Gm-Gg: ASbGnctC+Ahel7sCHWaKpIBEFxDbaKx7bKEJqC0VzzLUgdxfcbjyt6HUmaLEXs7Ls3z
	3XcO0LsR8WqUqKbUl0qkq1R70emIoACu2e+2PKb1pVkMDq9RQrfNXa1Od3wWJN+QAiOaE2pS8ei
	ANF7fEd7F+l68S3yad3EUzHOEGT+5XD5CTSj1oPeWvhV/Yc+ce8dBaH5JytXZ8oPqPk7MVLqht0
	DD8cFHO0lbg91DcTsuspQoMwM/10OiMuclGN48fRAToi5sF6JVyv+OPIw3DHWIqOlhzgo9zTz5c
	tC2CizB8cNirigRoGxux6YEsWMC7xWedJzhuHbycqoiZtQ==
X-Google-Smtp-Source: AGHT+IHpb3M2AX8ubADr1y8Clnmgy74dWjubTc/OZ082AsTXoWv1+RFKxrQiRpJTvsF1zuzQls4pfQ==
X-Received: by 2002:a05:6000:1acf:b0:39a:c9ae:9eea with SMTP id ffacd0b85a97d-3a06c6bd8cemr18787f8f.10.1745428928559;
        Wed, 23 Apr 2025 10:22:08 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-39efa493115sm19460396f8f.78.2025.04.23.10.22.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 10:22:08 -0700 (PDT)
Date: Wed, 23 Apr 2025 20:22:05 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Naresh Kamboju <naresh.kamboju@linaro.org>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>,
	linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	stable@vger.kernel.org, patches@lists.linux.dev,
	torvalds@linux-foundation.org, akpm@linux-foundation.org,
	linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org,
	lkft-triage@lists.linaro.org, pavel@denx.de, jonathanh@nvidia.com,
	f.fainelli@gmail.com, sudipm.mukherjee@gmail.com,
	srw@sladewatkins.net, rwarsow@gmx.de, conor@kernel.org,
	hargar@microsoft.com, broonie@kernel.org,
	Arnd Bergmann <arnd@arndb.de>, Liam Girdwood <lgirdwood@gmail.com>,
	Frieder Schrempf <frieder.schrempf@kontron.de>,
	Marek Vasut <marex@denx.de>,
	Anders Roxell <anders.roxell@linaro.org>
Subject: [PATCH] rpmsg: qcom_smd: Fix uninitialized return variable in
 __qcom_smd_send()
Message-ID: <aAkhvV0nSbrsef1P@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+G9fYs+z4-aCriaGHnrU=5A14cQskg=TMxzQ5MKxvjq_zCX6g@mail.gmail.com>
X-Mailer: git-send-email haha only kidding

The "ret" variable isn't initialized if we don't enter the loop.  For
example,  if "channel->state" is not SMD_CHANNEL_OPENED.

Fixes: 33e3820dda88 ("rpmsg: smd: Use spinlock in tx path")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
Naresh, could you test this patch and see if it fixes the boot
problems you saw?

 drivers/rpmsg/qcom_smd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/rpmsg/qcom_smd.c b/drivers/rpmsg/qcom_smd.c
index 40d386809d6b..bb161def3175 100644
--- a/drivers/rpmsg/qcom_smd.c
+++ b/drivers/rpmsg/qcom_smd.c
@@ -746,7 +746,7 @@ static int __qcom_smd_send(struct qcom_smd_channel *channel, const void *data,
 	__le32 hdr[5] = { cpu_to_le32(len), };
 	int tlen = sizeof(hdr) + len;
 	unsigned long flags;
-	int ret;
+	int ret = 0;
 
 	/* Word aligned channels only accept word size aligned data */
 	if (channel->info_word && len % 4)
-- 
2.47.2

