Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D71718F4A
	for <linux-kernel@vger.kernel.org>; Sat, 29 Mar 2025 01:26:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743211620; cv=none; b=qsxnbmDJBPh6SlR3xu1N2+jJUNWeE6dk5w51FNo9DZDhn/0LreNumeK/Pe7lVLz4xgfYhGrrWVCu+YwQ+hA8Ojp13C71+hpT8I3UlnTFb49D1Q2Vxiw8cH6LYlrCNR8qtLimCDzpkHhUz9bIgDdhCFjMKruvh2iKOLv0sMj0jTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743211620; c=relaxed/simple;
	bh=UeU+dNWfV5v3e10I+uyNNP2RIX8IeSbfeC0wbfVG2UM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To; b=JCXTFZG9hSvbLTwUB3GbcUy1siEWS0J2IC0aMSd+qlGQSy1sUQoqoSSqmkGvPe1t8VewDU2v8A34Ym1wa2HwKCYr+nZFl8A174H506r44SlWQ6CF9/6QdTSzKESFJBKgddsGh2uTa1cDuCX48zcVmn3oSPgtiMfWAsFbAJdLZEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=K+lWGTyG; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="K+lWGTyG"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4394345e4d5so18547945e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 18:26:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743211616; x=1743816416; darn=vger.kernel.org;
        h=to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7Xd7RMGwL+Gav8KAb2ER71A9xVEKtaQiZB3bM2GUMrU=;
        b=K+lWGTyGyIXG7EhqrSqtIVAJLdVEc0wRTgqLurh2rKElSDWfM3kHoFXMoOs7O+6JcS
         gJwogy3twL53S1pp0ORdg/kTGumDIkRHoisTibWfgsIIPgIfReF0C21h9w09a+abX9Tj
         mcAzPCTOnTSHBL8C3RJLnG3Fq4DaSqW8n6/vFUXoxeFSmilkU9oH+aIuHVKh4daQyMl3
         bTqs7colwiuP5IPf9bP/kNuTa7jcSe0U694O5ioTA35XImhxsLJuBfANIeTXNdMnVy2a
         8aIQjwmKd58wNhJ/pUN8iKCd053i5hgxJg/dXXOiRO2yFSzbcTQI8ONqUDppQ9TTjmpY
         bHaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743211616; x=1743816416;
        h=to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7Xd7RMGwL+Gav8KAb2ER71A9xVEKtaQiZB3bM2GUMrU=;
        b=cu8buvGbmysUAvdvzLAwprmG2SZgUExmPo0yU4uyLlXN2nsTunRrTFGqA9Orw1uVM9
         kKtOe0nLicykJcFGZ4q+fRONCcqbMIK+430bMlW4wgxoa5BvyZE1+h5+Buq9Hsq7BJ08
         mfIhQCX5OVhK18yGTBbqg5hLRKksACeeXrLnEh6qYg2mrx26WPTYQAWckx/Y0QlGt1PF
         GHe9txMMJuuZAkqXhcAWsHO7c1fBtmtFGLpRPC99prwNgWY58xkk9GEIMamrlZzfGbXY
         23p4CE2YbUh3Yrcr7k0cXbSX6z9GXyo48Fbw6ulFDhhZCj7supq5H2baQh3lIGk8h2Qu
         x60Q==
X-Forwarded-Encrypted: i=1; AJvYcCW632lSZhdjlESns7gmDs0ey0DEMoMm0wioehc80BrUE/A4ZXvIp33c9KizFWRiBXQ7UI1VBFDmzU98Y8M=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0aUzrlqk3sabpb2bC+ftTKbdOY26E4TiMkv5R+AVN5Wg/0h9U
	4QWA0w55gVgQiV9FW2eflMlRjvYzBpHUgMQ66GuL3f9bVWk0CvpYjrBqp8KJPhM=
X-Gm-Gg: ASbGncsb7Tf3kMK3Hqc43DMqZDzFf76VnY7Wg3BO8XXcboAU5Io461KpX+lpv/Lb/yA
	N9uqYlwOdscNPN4QliCSABLbV4/a0b8TKJs3UbUydMU5O5EUJpGncSDaFjLeCt17LF0ltN3JA3s
	SLApXjWzg6v2+B6i/GQlk7gJwEFXbzb0LfS9b5CZ6Ve0QYXm7f/652Ox1Mpf7x3PDY9sv0N/3It
	b3J3m5cLC+bMPwTi+N5F0b4WDmv3mXVloul7tkBWZGxRmHEH2+Gg9B3DdrfxYHoqgTuV5DGi7Kq
	lomozg8Py9o6KNWcke3BcJ4Nm3xA6VZgcFt7JxVZGdUCyA1pL2/x4tG/msYUq98rpNl1iFtq1w9
	hRn4FeL5cnQ==
X-Google-Smtp-Source: AGHT+IEwBNuvUbAMhxVWmNvRXOcvqx3XImmXmPW/lSoPmuRLIWXWpEkqe1jIw7kqySc1oRVntaGqZQ==
X-Received: by 2002:a05:6000:1787:b0:391:2c0c:1270 with SMTP id ffacd0b85a97d-39c120cca84mr847956f8f.1.1743211616163;
        Fri, 28 Mar 2025 18:26:56 -0700 (PDT)
Received: from [192.168.0.34] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c0b7a4239sm4264655f8f.94.2025.03.28.18.26.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Mar 2025 18:26:55 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Sat, 29 Mar 2025 01:26:51 +0000
Subject: [PATCH 2/2] media: MAINTAINERS: Add myself to iris Reviewers
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250329-b4-25-03-29-media-committers-venus-iris-maintainers-v1-2-0ec1007fde3c@linaro.org>
References: <20250329-b4-25-03-29-media-committers-venus-iris-maintainers-v1-0-0ec1007fde3c@linaro.org>
In-Reply-To: <20250329-b4-25-03-29-media-committers-venus-iris-maintainers-v1-0-0ec1007fde3c@linaro.org>
To: stanimir.k.varbanov@gmail.com, hverkuil@xs4all.nl, 
 quic_vgarodia@quicinc.com, quic_dikshita@quicinc.com, mchehab@kernel.org, 
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>
X-Mailer: b4 0.14.2

There's some crossover between venus and iris, I'd like to help out with
the reviews for iris to ensure we keep upstream chugging along.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 5ccddd2030efd96324e53fcee8048120990a85d5..89fd10c690bbb395fe22f7a6440fb98c9a25c659 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -19529,6 +19529,7 @@ QUALCOMM IRIS VIDEO ACCELERATOR DRIVER
 M:	Vikash Garodia <quic_vgarodia@quicinc.com>
 M:	Dikshita Agarwal <quic_dikshita@quicinc.com>
 R:	Abhinav Kumar <quic_abhinavk@quicinc.com>
+R:	Bryan O'Donoghue <bryan.odonoghue@linaro.org>
 L:	linux-media@vger.kernel.org
 L:	linux-arm-msm@vger.kernel.org
 S:	Maintained

-- 
2.49.0

