Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01A58283CAF
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 12:10:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748434226; cv=none; b=UkIAXOHbrZqG+HywdCZbn26R/SnsQRItzTDs4KMzz1BW8pCUAock2r9WPbTsxBHSs6fNXFEiXXAApjTGtF+/ecN3RdMzSCbDNlzxLg7P8H8mEQ/7BLwGgeI+8+63U85aUtv5uKzcaJUcVNxeg6r3OJsL4GD1Mwn/6rLYUzaM9U8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748434226; c=relaxed/simple;
	bh=bnWrEHjmKFYA8LT8CsaB58xc1RYelpnOS+RbLx5r16E=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=alotheIqJyvVaCvY9bDqx4MyOC+3ZkJNeD7xCAqZuXH6xgNH8932WHTFfbwb6xGrgq5oAoyxXdFf6hSVd1HPNTuNwcIzqeFhzlWP0SlPHPs+cw0Mn21ch0NxuGJUMG4nh0sKCCaNbI+CUrG//iml11evPFXcpJtMQjhjiX7Yuhw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=openpixelsystems.org; spf=fail smtp.mailfrom=openpixelsystems.org; dkim=pass (2048-bit key) header.d=openpixelsystems-org.20230601.gappssmtp.com header.i=@openpixelsystems-org.20230601.gappssmtp.com header.b=TgOerzSx; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=openpixelsystems.org
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=openpixelsystems.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=openpixelsystems-org.20230601.gappssmtp.com header.i=@openpixelsystems-org.20230601.gappssmtp.com header.b="TgOerzSx"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-43edecbfb94so58390565e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 05:10:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=openpixelsystems-org.20230601.gappssmtp.com; s=20230601; t=1748434222; x=1749039022; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=K/Sru8uL3qj8FenGHJhSAB8NKjzdx19AaoWH6D6+0Gc=;
        b=TgOerzSxVCj3U4vBwlIaEENl3cddwWCA3JxRihb0dCn4t4dHJisTD6HWI6ciIduOS1
         jGUd2BCCDQEqR3+BdVgK72fmMdzfnYF7bj0MLZLlnRrFcmqvdART3EqMuIEiFGu5P6Dg
         O2NE5S3J1ciAQJ89dVFCUsnocv+0+lhXoTKlnGcAmS94l4gwVe/gpki9JkW5BNpR1KwX
         CwHlqUZ281qke5Ik4HBHeP1uPLVPRph7ymqXP2SwE3lQRts7H2SMXpHyxRbfVh6ycLWs
         Jzbilk5C/m1xeS+CD7/jYgerijwFfAoXE7hxPojJaz+K3Vq3tS8Y3/QmMsAm3ilqfGTi
         eCfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748434222; x=1749039022;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K/Sru8uL3qj8FenGHJhSAB8NKjzdx19AaoWH6D6+0Gc=;
        b=RvmBk3H6OzrJPpeQbQ/3q/vsMlUh0rkyCKc1KQ0C+7qFh5oFORMNIhHNdCJw1fKzYF
         Xm1uUNXRp9MiXw+kUJdRU7SWcRMyZofi/7+fZA5/xdAAKsvJtVCykTRIU5OTF4CqSCVM
         c7eebdQsf3wH+UN/1GOXwZeF1y4n/dvB4TozTL4WaeDpqt5fZsh+k0+iYik6B2iqAyiM
         lKAtPKK83kBm7IjuWyiCtGFi1EqPtcJfjIZAt2WVJUHwUeCHxW4umHLvXo4fBxixBNl+
         FZo3CfcUhMs/nwJ+RQFHAaMYIqrvGZDILbrCh6tVO9oEoqFfWKtEOq49s2VN2QTwj4Vy
         iLvg==
X-Forwarded-Encrypted: i=1; AJvYcCUlrCE3Eag+OUFFnTT0hgXpd2hkv0525fEzUbXpG7ctj+GA/N1jnfZg/E9evTI9T87Y8nVVKH+yofysPhc=@vger.kernel.org
X-Gm-Message-State: AOJu0YyCHZDv5Qeiha5blawWbWMDXZ/Xzj1vF+USrlKwfkuKfHHEGUHg
	pTFY4cyKn086AVlbLmwrGsY5mnwvHeEggJ7D65wo45zp/yKXpl+mOAt7CbK9dE87cyg=
X-Gm-Gg: ASbGncveLsVCmNlMw9DEG3nQYt68XeYy220+80IdC+JgnRJOKYduIks1WWZX6UrfrLj
	Q7XuoHdX09FfVrUAz52MgOlAyPVNODFn66PS7zwXqA+lDW6wxvveRm3GdOJfp/jHOdtl6nOkRzE
	8roD7BpfIobowwDV++o+Ip+QjpzHI/u/Kd7QmC/JVumZzheA8PmaV2UA2atjMDXwAKc5DDLjg9f
	sx1F51B2/3beJWqQ+7d3maXW7kJumLj1ziL4m9Rmgt5qMF1fKEtpMKvcyeohI1jxGjq+zyO2pXw
	66DE3gOfwi+OaW8xFitKeGa9MUZfVJHi7lkKBzzFJ0f57nMSG4C/zsknsF5AvezvhURrnbb3qfM
	VFRLTMFwCKs7y7pWyxD8BNSHkrC3hGohGBq1SWRYgvwbXyvCvUPLLSg==
X-Google-Smtp-Source: AGHT+IGJdrXpE2HNtRnmNL6tYG8+KFfjDgcCbvJjR66+8XjZyuCeW244nwDx+6KAA5nIc7Zlr6Y51g==
X-Received: by 2002:a05:600c:a13:b0:43d:160:cd9e with SMTP id 5b1f17b1804b1-44c91fbb448mr163241105e9.17.1748434221918;
        Wed, 28 May 2025 05:10:21 -0700 (PDT)
Received: from [10.0.12.41] (253.124-78-194.adsl-static.isp.belgacom.be. [194.78.124.253])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45006499727sm19874145e9.3.2025.05.28.05.10.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 05:10:21 -0700 (PDT)
From: Bram Vlerick <bram.vlerick@openpixelsystems.org>
Subject: [PATCH 0/2] ASoC: tas571x: add support for tas5753
Date: Wed, 28 May 2025 14:10:07 +0200
Message-Id: <20250528-asoc-tas5753-support-v1-0-a50c3f6734ee@openpixelsystems.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAB/9NmgC/x3MQQ5AMBBA0avIrE1SpSGuIhajBrPRpoNIxN01l
 m/x/wPKSVihLx5IfIlK2DOqsgC/0b4yypwN1lhnnO2QNHg8SF3ratQzxpAO7Ka2amYyTU0echo
 TL3L/22F83w9ssd0PZgAAAA==
X-Change-ID: 20250528-asoc-tas5753-support-8b714da043ac
To: Kevin Cernekee <cernekee@chromium.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, 
 Bram Vlerick <bram.vlerick@openpixelsystems.org>, peter@korsgaard.com
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=615;
 i=bram.vlerick@openpixelsystems.org; h=from:subject:message-id;
 bh=bnWrEHjmKFYA8LT8CsaB58xc1RYelpnOS+RbLx5r16E=;
 b=owEBbQKS/ZANAwAIAblauka9BQbwAcsmYgBoNv0s839Re0z7GaQKdGAbjKad/0vsuw+2/Rqym
 9NzhljG6EmJAjMEAAEIAB0WIQQO7PtG7b77XLxuay25WrpGvQUG8AUCaDb9LAAKCRC5WrpGvQUG
 8NCsD/wMpM07OPPP8KbFBVlRwIZSwItEg43SveGMTGXexG1kNOP0Kqnunz5gBTu9twvvbWeesqJ
 U521yb3lMmwtZcuWisjpc8HPrRHyrsJzzqC3kdsq5ZxyAsB8MBLQfixKR5Yz5J0sYZCyZvHFAO8
 0kx3MhsJdYUXf9ny3I2C9+hHWbyDKLZqD138tB2oBM30Zg9iKUruuXug2q0IGckHD2JqeLnVqvB
 N2j3TNI4mm5/+09WLMRK4oaQqEV2k0UA2Dh5Pcs9O61nmLwl4E56AHGEBHLAbVVMMHYCmL48T6c
 KYu4C1XADMKyddJqYbk4j0oV+vh3GNgszSApz4U0pwqt3B0USM9xX9ZvxuVgZSD7b9TTC342k6d
 igBl9RcBIf/+PvA9oicL6uDpeMkTJm6YMJxP9HhdYwDZtw87VqYvp9yspHEBBzr6Dvo2ntIJYa8
 hBYsliGQSps5O1We3vnBFYmKGkhZbDLE4OEfYD5aDKz+STAiRUXHscQDRIypes8toFat+XfejHg
 ZsOdTgRQu+R9wbGuplnz4j0VyVwW+vjmR6GwLBVd+wgIbp/iBhVXTG+EJlIs2jf9kIVW/6wqr+z
 KxK4CGduky2QE+OkiAMmlAgn2xqyIro6CQPm9HUI81nDDOxrB3UkTdcLBDPV686d/mUl3oq6IQP
 DRrRn2ogWJzABew==
X-Developer-Key: i=bram.vlerick@openpixelsystems.org; a=openpgp;
 fpr=0EECFB46EDBEFB5CBC6E6B2DB95ABA46BD0506F0

Add support for the ti,tas5753 to tas571x driver.

Signed-off-by: Bram Vlerick <bram.vlerick@openpixelsystems.org>
---
Bram Vlerick (2):
      ASoC: tas571x: add support for tas5753
      ASoC: dt-bindings: tas57xx: add tas5753 compatibility

 .../devicetree/bindings/sound/ti,tas57xx.yaml      |  2 +
 sound/soc/codecs/tas571x.c                         | 52 ++++++++++++++++++++++
 2 files changed, 54 insertions(+)
---
base-commit: 76f8d35964e4de1b464de22e4f3fdc14937ed854
change-id: 20250528-asoc-tas5753-support-8b714da043ac

Best regards,
-- 
Bram Vlerick <bram.vlerick@openpixelsystems.org>

