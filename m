Received: from mail-oa1-f53.google.com (mail-oa1-f53.google.com [209.85.160.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78DCE288510
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 15:22:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750864966; cv=none; b=DatSIc3oLCdC9kfwBQZoMmdcm24UDdsTgcxyN05gYJwmdgly1mIZVnYKoPAS/Wo4tlp2Tu9DtuMc3UVZtFosFjvUjlSOlOLGVFmuyaTlnt1pWizidMFF9VKIANL017cj8O5pe9G6crGvy2LsXG10e9K5p/IbkavRTWDYtTIqBps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750864966; c=relaxed/simple;
	bh=mQ25qvLYMDyvpv7j/NtUZhUMRsahcY03k4TaRiRkM20=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bUr9ntG89wcWweLU07webdG2hcRWO+PnmgoghdNy80oLQZkdFZXGVBa5u+UWwJHNLbhCOZznDwHmWaZGk2/3QrDQdhf4S7UI8fT6KO0Vw4kFZUk+6Tz1RfGArMmA/Zr0XUfWXSqOjt9Y3hvliN2Th0Bk63yd+yTYJMyHRlsQvv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FVEeVp8D; arc=none smtp.client-ip=209.85.160.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FVEeVp8D"
Received: by mail-oa1-f53.google.com with SMTP id 586e51a60fabf-2ef891cd058so32758fac.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 08:22:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750864963; x=1751469763; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gV6LKTyimmW9Sx8Hibhbqk80op5pM6YCyNN7CEAKCkM=;
        b=FVEeVp8D7I3eWP/zEEURmhwpJmvCTTmC8Pj5y+FDFPIvzj8Rtl+Zz8DJxTW67fY3Pr
         zPu0e7KC+B7RBgGwZ+pLVa7Ia3Qe/wvNoSP6KDiJICpazSCtJPIQpg9kvV5+X9xlsjAc
         3Zk9nocvX12gjIUO3U3j+CF9s3b/rv+VrE6yVxqQt5jDw2Yca0lLVh512fHpUbr0em+n
         /WnQEcteaEZnKtGLlHuYEvEMb+dRr9gJ3DsT+olDUORWCigLtNCoOISSrxP6dY5P8mLL
         oDBI3iSdisUFIFSCHliuuj+o19uNIg7qQePHcsqcmoWTKqi3q9HYB9/oIz/iGj1HZIVm
         XogA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750864963; x=1751469763;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gV6LKTyimmW9Sx8Hibhbqk80op5pM6YCyNN7CEAKCkM=;
        b=qzKKQrd++HOshCazhwtwNMT3zuvUYlyr0nGSznGoRXFr9VsTz2ADDjM3bMNmV7OYpB
         yQ1iqrvAnYJc0C3IwDaOBwR8ZBSy+sGF07JZc0Cgh1ZS0zLNtF1JsSaWWxK9XmPI74yr
         i8XLsnMD4XucEOkTyTIf3RATTApsDLrxNIzJ/PQIgErriJ4y9x6M1uy+mkaaKkfFqBXI
         arWN1HJUV5LJ8LejD2uR7W+CCBcAKleBgrcCCiZBG1152CwZDbT12qxKOE81X3YjwO5E
         p933C9QNuWLPEVaQlFk/ge0jQzQSZ9E3qUJiuZrZ4nR86S8aYcKEd10CIzoO+VFApe/b
         oRBQ==
X-Forwarded-Encrypted: i=1; AJvYcCUNg4kxWTy9vtMjZAh3KSZOubyzCT+03P7Bv496ty3raB5R1FfZnlGlBxSoJbptP2kcM5vaEHSAFb4LqCM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+l+GyCRHv+0Navtl8lUL6wsqYmT4oczNV3niEVSudUFvizvxC
	fCBpqshP2UenZGAiskTwz65L04aCJXEmZ7hDzVLC1RAW4GuZh4hsnjugDC4EQ+KAXWw=
X-Gm-Gg: ASbGnct3gPBiDa7v1s6AGk0TG0zs3NX7XnWzhUVADOMR64HWi/1T7Pp56EloWQVJfVn
	rHxDij0EnEha77TmSKrq14ndMFxSiqRNQBCLzcuMKNcbZTqgKO17uTe9SKn2R3qGdRpoXUCKNx4
	12YXG2J0HBBQcjwrt+974ksbkuaK7274JRi+wv09Xn2uuYj40iWc6CAVuGw9hrQ7fghXd2LxUc3
	nD1/jZ0OOX24yUY8T0avdAZfhM+LWv3TEPlmPl0mWaxm9DQI6o42sJlEfqWWXvFE2YkLKCVdzRr
	pQwCMCemtUYf24E3fV+PYxGBwYKOah5hTPVtqRMsVtaR+ulmBZShv03yF+Ulcuk7yXKFZjtgeUS
	8w7xe
X-Google-Smtp-Source: AGHT+IFd6lJtom/4lncQLlKjav5G6+Wsq1AopBqbxlhEagb6rUzpAIrbOCnTOFGol9ueG4rxfQAm6w==
X-Received: by 2002:a05:6870:af88:b0:2c2:c92a:5789 with SMTP id 586e51a60fabf-2efb21346b8mr2671351fac.5.1750864963645;
        Wed, 25 Jun 2025 08:22:43 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:1fca:a60b:12ab:43a3])
        by smtp.gmail.com with UTF8SMTPSA id 586e51a60fabf-2ee664ba910sm2562945fac.8.2025.06.25.08.22.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 08:22:43 -0700 (PDT)
Date: Wed, 25 Jun 2025 10:22:41 -0500
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH] soc: qcom: mdt_loader: Fix error return values in
 mdt_header_valid()
Message-ID: <db57c01c-bdcc-4a0f-95db-b0f2784ea91f@sabinyo.mountain>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

This function is supposed to return true for valid headers and false for
invalid.  In a couple places it returns -EINVAL instead which means the
invalid headers are counted as true.  Change it to return false.

Fixes: 9f9967fed9d0 ("soc: qcom: mdt_loader: Ensure we don't read past the ELF header")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/soc/qcom/mdt_loader.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/soc/qcom/mdt_loader.c b/drivers/soc/qcom/mdt_loader.c
index 1b4ebae458f3..0ca268bdf1f8 100644
--- a/drivers/soc/qcom/mdt_loader.c
+++ b/drivers/soc/qcom/mdt_loader.c
@@ -33,14 +33,14 @@ static bool mdt_header_valid(const struct firmware *fw)
 		return false;
 
 	if (ehdr->e_phentsize != sizeof(struct elf32_phdr))
-		return -EINVAL;
+		return false;
 
 	phend = size_add(size_mul(sizeof(struct elf32_phdr), ehdr->e_phnum), ehdr->e_phoff);
 	if (phend > fw->size)
 		return false;
 
 	if (ehdr->e_shentsize != sizeof(struct elf32_shdr))
-		return -EINVAL;
+		return false;
 
 	shend = size_add(size_mul(sizeof(struct elf32_shdr), ehdr->e_shnum), ehdr->e_shoff);
 	if (shend > fw->size)
-- 
2.47.2

