Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34ECF1A5BB2
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 11:16:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749554205; cv=none; b=kb/YEZLn5iXK7UtcU7o8RJUKZr8666HdCzbakhOxK1fBpUUpZ7TiKBVIS/7CBcfGp3cRRvn9Y0soCWSl+ynOFEkB48yD4J2WoM4Cd3LUxpEpEgOFm58h932iN2Fxaa26T8filxFTC9njlPGwb8hKKa+5S5ei6O5Vd2AzicQSNNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749554205; c=relaxed/simple;
	bh=D7oAsKh48TB+BaBDonDWriP/CliLu8zUNY994H+Nruc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=aPLD/dJ9gXCpyDmWClhhfXeAM25EfWm/2oKlthw0id1Ui6xrX8G/72wZlUx5dneV6ocOwpNn0Xa1ruQKxtexxhBpCYhsRIa+gDZF5+ftD+T4VcsCWPbl5J6OwGZCW1mElHkb3792xmqkwWE1VvBdAPAb6yLvxbp3bJIOXDw5v5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dzKk29I+; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dzKk29I+"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5536b9be607so3319749e87.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 04:16:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749554202; x=1750159002; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=59+jyY5FeA0lTSpLcCkeMwgce/BtI56CDI+w9Y0BpO8=;
        b=dzKk29I+o+wLNLEP1oOGiSn75ewICsytPnq156KqUfcU0rwD8H86PgrC45lKeEWUT3
         Ne3ReOMXMY3zfYWzgdaKqib4TcZjcZsuv7sFqG7lEcqfDArE9nuIb4KDZW3LsaIaTXes
         FyExUYwfyfhZ/GGyTGqeQJqyLIm8WPwliGDLfPhC0DapsZz1WNG9JuRSe/MvziYhwOxk
         wMDm4WleWmjyw3SpfTV3EuW2SYawX5RBSRzJ9EWWPwEpWSUo/voj9ZrWslW/z9E5Dnc5
         nNEUE9AQAM+jNl0FkbzxL7ElkSDNXkBeKOJtujjLXs3TzzeSSgEnyXW2TX8Vy/4dssWU
         h2IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749554202; x=1750159002;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=59+jyY5FeA0lTSpLcCkeMwgce/BtI56CDI+w9Y0BpO8=;
        b=E73Jgp+TYlk/D1pMV7AVerlR++H46f2QC0ypP97GRZ22YiY+TG5FO/iArIW4jjO6Us
         B/l0b6PXSL44WJclRRml6t0WtZpE0LHOyg+mkC0SftmGrFgOs76HfDPvjqyqTo5pO9+F
         D0Vx+qcXp61pclo06F1NG/+fmkWya1giClS21XtemfOkx3xRPweRthBB+9FfTIboa8Pp
         5VkDn8NO0OaWhXEtR0iW20erBaDtETor0c0lYDoj+U1NPAOXSM+LJty7LWGzmvF4lPLU
         3fcqkQb70Qx9bAXZMCmYEhwKLAkdmlAcmiaYwzzcBTwbsynjUe4eSRM7H9zymD6sNJBm
         Zaew==
X-Forwarded-Encrypted: i=1; AJvYcCUwx14uAAgL6mR6Q3o0BZIqlccc9OzdudTppPe3BeWYwzH6Os+2njpQT01bHjaC6DxfDuQ/0XJyT38eB0U=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3+e8h7q1dGTGLh/qHHYlKpHmdPFkaIzQVgXzdb5a3nU+VtJ/Y
	rQkNBWFOFgWDHe0GEJSMdXm1rzRX23/ZTibSBq0+kDUYVXqo1/LCG7kgoYYulUiArtywHm5G2vV
	TQ3MO5bQ=
X-Gm-Gg: ASbGncs7XZbFhyCgaAHsSUB3NVacOa6Q62yDlyzI+1bu/P3zNi3Oz5SkPBD0BS8A4OV
	WX0YAqRI+cFrmww2BnGkf1rZBq4di2863F+DkG3Da36iQzX9VmlTplZgMiH6M6Vj/lQbydzstcd
	+6swz2pDpCsRaHCEyyx+S19SedZeb1dvv+PbilHr/UBIVgbO1XtWF7CL3KOZMFeE7BFBcDdbDM6
	2jAt8pt9jwBMZDcmRg+5hRqg/GVBJlrSQfvvFf36ckWaMBVPvbo7n/U+5CG7g5GY24dtZJpHREN
	rK/qqT3+9dBrB6UIHLyCjwrybcI81SVbU8ipECCy9yJSaezuefFj207PUO7EjWicmbJL3Ctq6RE
	u4fjYRLlKIAAW8LPbY7LH/hJ3xI86MKgHGxsf
X-Google-Smtp-Source: AGHT+IHOFjelHxd1QOwaYBTXbZfIYjxJcofXqOv7vfCY5jo1kSfya97flIWsOjBIeuzmXmniz8VjQg==
X-Received: by 2002:a05:6512:1328:b0:553:2190:fef9 with SMTP id 2adb3069b0e04-553947c5d42mr567301e87.34.1749554202325;
        Tue, 10 Jun 2025 04:16:42 -0700 (PDT)
Received: from uffe-tuxpro14.. (h-178-174-189-39.A498.priv.bahnhof.se. [178.174.189.39])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55367722481sm1500146e87.126.2025.06.10.04.16.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 04:16:41 -0700 (PDT)
From: Ulf Hansson <ulf.hansson@linaro.org>
To: linux-mmc@vger.kernel.org,
	Ulf Hansson <ulf.hansson@linaro.org>
Cc: Ricky Wu <ricky_wu@realtek.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/4] mmc: rtsx_usb_sdmmc: Improve sd_set_power_mode()
Date: Tue, 10 Jun 2025 13:16:22 +0200
Message-ID: <20250610111633.504366-1-ulf.hansson@linaro.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The code in sd_set_power_mode() is a bit obfuscated and also has some minor
issue in its error-path. This small series addresses these problems.

Ulf Hansson (4):
  mmc: rtsx_usb_sdmmc: Fix error-path in sd_set_power_mode()
  mmc: rtsx_usb_sdmmc: Print debug-messages at power-on/off errors
  mmc: rtsx_usb_sdmmc: Convert sd_set_power_mode() into void
  mmc: rtsx_usb_sdmmc: Re-work the code in sd_set_power_mode()

 drivers/mmc/host/rtsx_usb_sdmmc.c | 31 ++++++++++++++++++++-----------
 1 file changed, 20 insertions(+), 11 deletions(-)

-- 
2.43.0

