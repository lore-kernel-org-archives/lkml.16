Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80AF8288C98
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 10:45:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744713915; cv=none; b=i2RWEDg7gVESHl3oJxZz4R0ItaXIagqsz0djrsKa5GDulF7zWfB1gOT62n8NsaeAqpD7S+LO+l70tCpSzpdAazLl+8dpyoViAjZybCd4j9ob/RQnEjf+0br4vViZm1kRgbE82dgBPm2w3Kpi2+ubNoIsyN+QITaA0c+3SDiXgNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744713915; c=relaxed/simple;
	bh=fWybr2mbKY7qGwtYIZOqWE7CzXG4hHWRB38TSR3OKy0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ddcbPxwfdfwx3juXm79Y1syngtXa2aSwrr0o3J2td0I4NSY8/cBONs4qX5NksG9U9b3qWuX9TiuqrB+t5PDbZSUqgecJrDhFZykyswoZaDAPL5Gz9imU4qLbiUEJOTC4+NoaSVFHmmoAJILkglNqseBRISSg8nEw1xprpJsYO0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RzX+R7ZH; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RzX+R7ZH"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-39c0dfba946so3864078f8f.3
        for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 03:45:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744713912; x=1745318712; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MK0WNbcSw4ed5M+cuZDVZvCtmU0gyT+OlvAi63oIbak=;
        b=RzX+R7ZHzDIYeuFFMHRllgaRq1lcrTbfv50CSffTmnYLsS6pIdaY/xpgeHbiWFWIPJ
         P/HnI4vbZkMsWL6KW6wm645WzX5BJZt0ytSwAUH0x3jIg/M7hoJ4pyr/dbnuGKBZj04x
         TS21bbDEPt/2Vn6tNURf7cfgimX7aZi11yeyjckmRxBSa0IVuWT1NE9/65LQXk3AEor4
         ZAv0Ok7Mfk2kAysc+EVxcHk7yvpqSCI/Teci0M/3Ofs6xlouUTX0J8bpP4CT3GDa7PQ0
         JV7tbBcOn7nF7DHv8UH9l1oyQXUqJKwWiOeA6s7oge6XMfU381VeHLqBXqkO3LSbEgjD
         3PiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744713912; x=1745318712;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MK0WNbcSw4ed5M+cuZDVZvCtmU0gyT+OlvAi63oIbak=;
        b=CYBX7HgvYAW7f8jUDQGidyMCbAgUheaD1yrZnPUTaXYm5vPF7mNEHNe0exATMtmZdi
         exqEKl4T84ZyDHdlRvKSbxSXrXL2CzEXn2uF3t66CH4GpehOSViNYSICVS03BeY7h61S
         NZ5BhwHJJTSgtJjJkIWIFJoskKECF2KCPcSnZx4RnKzPxiKbcfHw9yN1XAXeGPYxiva5
         fbVB9aGTdKZCtjyoPGsd8Ot72seTLTZImHVDwst/qNY+lCjzFGXv33U7TzJGQJ/05OoM
         4b1/HFa97Cg2qpeU6qBccDBkF8OJSdaBd3knPhDgQFqw1OvvqoxWPXfH4A7tLHA9kkQt
         omJw==
X-Forwarded-Encrypted: i=1; AJvYcCVT5kg4CVwT/MJDFe2+JArSQrgiuVWvehBfXCDM/UtxxaZVrDNYc/IU6pAxPCz02s0QZBunlGKDQmpLHaM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1I87Y3DWUmGaOfQ05VQAv6sbVkJ1p+76uMfYWTEaoWiEWz38F
	5FkfakVETO6ep82eAKuHdKJH3IIdYIISaD2aF5wFLySkTe+2mQxBNoepYEoBiCw=
X-Gm-Gg: ASbGncvGSmiNlYtIyHgzREB6uw2+lDsgaC9nG+H2YMmSO8781luP1nA/xYfrBCZ6ZVY
	NwyYj24N5OZCt2X0T06ol7IZw3tKOFR5gBzB8aiaOoUTRz6Sa3eT5sVpnbNLcmqFgK24NGm/T3U
	V5eOzc+luHYKMJaFOePICrbQENRlSYlSKR2vtNxVR3UVM2kVCp0Ok1a89ASbd0YdDbgkoa+LOIj
	uPkwn7jcG3bZ1pZxBMDVgkh5jzzq7TiMMeBS0VgMRZ70/GeZrnj/urA/SHA5ZkCQlSutDSWrfFO
	GB43om/cgJn3kLvpIDryWHTWcU/vWPC24YgIyk4JbXQHYA==
X-Google-Smtp-Source: AGHT+IEIyKYv0BMZJodwyHmcwoGOgDdIqbSLHON2cJ+W/AbXoA9xLZFAvBmJ/hOGIRmJfI19cAlXiw==
X-Received: by 2002:a05:6000:240c:b0:391:4674:b10f with SMTP id ffacd0b85a97d-39eaaebee70mr12627884f8f.36.1744713911750;
        Tue, 15 Apr 2025 03:45:11 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-39eae964025sm13625378f8f.6.2025.04.15.03.45.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Apr 2025 03:45:11 -0700 (PDT)
Date: Tue, 15 Apr 2025 13:45:08 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Andrei Kuchynski <akuchynski@chromium.org>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Benson Leung <bleung@chromium.org>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH next] usb: typec: class: Unlocked on error in
 typec_register_partner()
Message-ID: <Z_44tOtmml89wQcM@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

We recently added some locking to this function but this error path
was accidentally missed.  Unlock before returning.

Fixes: ec27386de23a ("usb: typec: class: Fix NULL pointer access")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/usb/typec/class.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/usb/typec/class.c b/drivers/usb/typec/class.c
index 3df3e3736916..67a533e35150 100644
--- a/drivers/usb/typec/class.c
+++ b/drivers/usb/typec/class.c
@@ -1056,6 +1056,7 @@ struct typec_partner *typec_register_partner(struct typec_port *port,
 	ret = device_register(&partner->dev);
 	if (ret) {
 		dev_err(&port->dev, "failed to register partner (%d)\n", ret);
+		mutex_unlock(&port->partner_link_lock);
 		put_device(&partner->dev);
 		return ERR_PTR(ret);
 	}
-- 
2.47.2

