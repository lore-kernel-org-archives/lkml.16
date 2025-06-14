Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 723FA11CBA
	for <linux-kernel@vger.kernel.org>; Sat, 14 Jun 2025 20:22:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749932581; cv=none; b=JYNwhfTfYp5RoqJJPrNnL2AHT5il15XQj2U2mRVacFcon5sp29gy6fwOX3cKV4Qyg0BO2SbJn0O7Hs8/mT4g0/QUmZAok63/K6wppa/vi45YhzrRNbMeXhfBtX3rgEgM1zPISepv2hZEPaS+oOIiJCvk2FTry8jR8HdPcW/JwaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749932581; c=relaxed/simple;
	bh=T58bBxYsNtyvOgVpXu7+m30A5tndGn/hqOOD2wXfBkE=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hwXUV+63/6SXB/5n63MPFBvJ7zmVBERLUTzOhsO36N/a8trA4mVQzbqOSr2ZN7PHtU4E1kL5jG83tpPCFZPU3uXlIGvr/C12C5F3+KuexUxGx35jXu+mdPcTpgNCT9g+2WxMjmguJd2ZuTtJWV0Dup4D3VF5MXSaMhMsnBUhov0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V6vbuUtA; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V6vbuUtA"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5532a30ac45so3129013e87.0
        for <linux-kernel@vger.kernel.org>; Sat, 14 Jun 2025 13:22:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749932577; x=1750537377; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7Zr0b+o2K8A2zKLdR5Tu1wVpfcW7sYJjgwLgwlDEGo8=;
        b=V6vbuUtAwPLHHeE6qTvuPUdBHUo5l3EyzXMoxfO2VWb8aE2ms+onsozym5yzQlDqyl
         4yM1P4JYROcoXWq5NUAESJgn+elTxaH+qxkvo9jq6iBQ/tSjmSGF9Lppx7eJkt/jfEq1
         ZASzbpiV0oIe5gNqNmamt6k1wA0FFU77KU6RjCinkOYWZPs76GpYzCnQuG8YtRPhdv9K
         AfQzbQmsJpwbDsIKm+Y8lZKdu84rp2k9aocgqWRJF5E9c0t+7xLx49oR9AeqHXHbr7XO
         fH144oMrTQjCLszojXM4NQRIe7LI0qqYS3bMLeGqiOmmNhPqurgT8z2jJYfafc6pUM7w
         wN6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749932577; x=1750537377;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7Zr0b+o2K8A2zKLdR5Tu1wVpfcW7sYJjgwLgwlDEGo8=;
        b=rVc9MpAGBhPmM447h8b7U8BZdNIW2b8qTn5wVebI9DAwBw27u5RASGUmcmZ+4BgIN3
         ycZ9ZpUxSPNhkcEJ+sxHJ0ZXPOktyTaCWvUEScwhQq1AgoXv5QtXelCRjeMpZaMROK3d
         jhJII8UVmzjNv/T6/MEUYAIZ6eaFZmhApmHzCN9ecQX5rw0MlzXLmFBUfAJjj9dwHqgm
         5WGPaD28oaFHmpZd0KGNGU3970wMEPYx8LMv8C2X6tr9jLQ4Z3iKQd/2I8BUPhFkPohN
         zxQn9CeiT/E8fMMTr05yxa7kVk6kCcViD0fmiICycRSM7B6/cYde3Hawb7TE/C3oNcS3
         uvvQ==
X-Forwarded-Encrypted: i=1; AJvYcCUBosbNgKMEd4zQW1U3K43umM4UTq5PXVmYwSLbwWczxso5Q+kw56mYwtz0EN5VgzalWVFUNVVtJxDav5w=@vger.kernel.org
X-Gm-Message-State: AOJu0YzOrX7bjBbN1LjzY7PHBT/nI7R08Hnq7ibm3K0gsAR0EvLJiaLz
	+zUUZGjKhO9cGI8wVWLHQ5jy1gEr1XaIzR481MexkBw6U1+QEGTZNl2o
X-Gm-Gg: ASbGncsr4Mz+w1lNI3DCG3KAUYYiZS64gzf8yO5+Pbi1COM4Oc8IqBdEv5CioGxuSsY
	CUrhvzWlmrPZgtlej1N7mQN85BP4VMMDHm0s40u9Pjyn4XJYjYsnsbYGkJvMsDnaPRbDS9ysqtF
	bDEPPtU/Z085YXLgv6SJn8WP4Nh9KzU0dpf/Ak4l0FIAn2hEA2ntVpIM8kKbvSGkgHxgrhSC0jS
	EYPZMOOjqHM/3PPZJl1XYcStIjJ6ujCZtvSycaYt2cd5WUExqME67lKeVekX4UrB3ihBAcC0mUa
	//AUXpgZ8ExexQ7IpdwZKzQUObOt9L0MnhbPBJBafrtgxmxQvZRiNscyJ/AZTL87/dWkOJTD/41
	1RA9ZJYflATL8tZytn4rqCAwFRpRWbF403Bx59WWdV8QEvwbH3TnARaiyF/JtqPATHfgYtQ==
X-Google-Smtp-Source: AGHT+IGNDWiVpEVRg/rBFO/WckscZ7asYdyK4nHbco14EogyIbnSRbbuy5G3CqOmQ8T93HX6uG4hmA==
X-Received: by 2002:a05:6512:458:b0:553:b592:783a with SMTP id 2adb3069b0e04-553b59278b0mr1035022e87.27.1749932577124;
        Sat, 14 Jun 2025 13:22:57 -0700 (PDT)
Received: from Lappari.v6.elisa-laajakaista.fi (nzckegev6v1b7007j63-1.v6.elisa-laajakaista.fi. [2001:99a:20b9:a000:bd45:faca:fc88:8ccb])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553ac1169efsm932996e87.45.2025.06.14.13.22.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Jun 2025 13:22:56 -0700 (PDT)
Date: Sat, 14 Jun 2025 23:22:55 +0300
From: Heikki Huttu <heissendo88@gmail.com>
To: parthiban.veerasooran@microchip.com, christian.gromm@microchip.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH] staging: most: net: Fix typo in Kconfig help text
Message-ID: <aE3aHx5eAYwTt-TZ@Lappari.v6.elisa-laajakaista.fi>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

This improves readability and documentation quality for the Kconfig entry.

Signed-off-by: Heikki Huttu <heissendo88@gmail.com>
---
 drivers/staging/most/net/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/most/net/Kconfig b/drivers/staging/most/net/Kconfig
index ed8ac7e076d1..8ddc3a522aba 100644
--- a/drivers/staging/most/net/Kconfig
+++ b/drivers/staging/most/net/Kconfig
@@ -8,7 +8,7 @@ config MOST_NET
 	depends on NET
 
 	help
-	  Say Y here if you want to commumicate via a networking device.
+	  Say Y here if you want to communicate via a networking device.
 
 	  To compile this driver as a module, choose M here: the
 	  module will be called most_net.
-- 
2.47.2

