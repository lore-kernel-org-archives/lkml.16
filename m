Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FF2642049
	for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 11:36:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745235406; cv=none; b=T01Waq9rr33KL3aTt+clEUsh5b31TRKcGHZFEZQrLMlEaiUDj2qYo3vo1/M2PeRJT1ARE4mCJljhpT1uc9/4R3ccj/D0McbZJdkj0lZdjl8QrGtVaZkgkeCXvCy/lEqYYMds3cc6o3U3k+WJAc+J+mP5rUAt6H+YQdeS+rLraVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745235406; c=relaxed/simple;
	bh=FBZhr5uEz0jedLWq1Nh+fKUD5Qd3YCQhBdWW2BwpStE=;
	h=From:To:Cc:Subject:Date:Message-Id; b=JU3p2BxoTJEc6r2QnyXRimtWRQ4uN5dijB4THJ38tqSUzDyv/X3Mh2LC45011dmmSVsmUcQO3USYykQyyIL9m7fuevKgNXV2rNcVXN73JUMxeyL8DO/xVAtquorN6wwi/HPuDKPLjUKTl/FgyLlMpb2T8wBd2WfxJGw2Kbkwp4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=huaqin.corp-partner.google.com; spf=pass smtp.mailfrom=huaqin.corp-partner.google.com; dkim=pass (2048-bit key) header.d=huaqin-corp-partner-google-com.20230601.gappssmtp.com header.i=@huaqin-corp-partner-google-com.20230601.gappssmtp.com header.b=vdayyPG+; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=huaqin.corp-partner.google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huaqin.corp-partner.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=huaqin-corp-partner-google-com.20230601.gappssmtp.com header.i=@huaqin-corp-partner-google-com.20230601.gappssmtp.com header.b="vdayyPG+"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-2ff67f44fcaso935182a91.3
        for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 04:36:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601; t=1745235404; x=1745840204; darn=vger.kernel.org;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0qnhLCMCJX7x0yayfuWyZs6nn9tnfPutjl4IqAVcAEc=;
        b=vdayyPG+S2xoDSu7xHYF66m4YR3anG8sPaktnOc3vljeqXWtOL5U5xtC/MASXyRXIG
         Ymzukzs2OiWoQL9TM11RTGx4x9/jLrYQt4aNk6QCLF3MBEanO1EvUKP/8Z/KItAZvmPa
         mDLEriHmAbyBc97y8xx6ZrFYjp8yqnuiYOKoh9JyWuYpMMOOmGJBourjzDZ/nz+XSFYz
         RV/tG5va6LQ2gB2VT84h692RujHskTJBv54yICeu6ZGRw9iaAVw2hK11opmFUBeDAiHs
         aZfrjQ+QrkT1WjkE0638Tny75AvXP/dMiIAD5xhI//7olzcaHUZEfzndqCB5VzxvqmGk
         +mOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745235404; x=1745840204;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0qnhLCMCJX7x0yayfuWyZs6nn9tnfPutjl4IqAVcAEc=;
        b=uns/N/pGaRmHJfGLmxAU39kQcvaOAwUz/d5RDewmaTBp1e9Y4PH8TB+I5XICCxfvSA
         Hbt4TZ1usUXjWXCbL5+lJl5tZM82tTv1puVS4QPY7eSXBwxVrRVXEEHjVibQZaz0W7Lf
         wW1YM0appmYSqorH8mkT3QZgaV4mXeO8nuzC47ly3wDbcQEaSVpXWwNcKuO/gTNqRVXT
         tkG8uhK4xgBLcvh990ayEAzUqd2ieHPy8+FZ6pDAjOJd5UlgTo1xmziWTx8F9S4EXbkH
         paehv7wB5KDmKrg4zUx0Qh+xXHmeh1Qev3FfSDEKOfj1sRSyWOkwgYwjH9FETQ//PFBw
         flAA==
X-Forwarded-Encrypted: i=1; AJvYcCVqrhq7/BKJetuLy5HHxX84TjXnPjBLM7PUfKtGLckqL345ih24Mh3Z6CZyn74W8cRK5pB/YA5r0V5/OAo=@vger.kernel.org
X-Gm-Message-State: AOJu0YzbtMevGa4IT6469pY+4ZvCggrY1cqHOCB4fKotniuloPsJwC6I
	OcRUmpk/ZzWxa6w9GA+EsdouTL45ar4QEVEqgU1bJJgzcYocDxAdWIrzn9cewkw=
X-Gm-Gg: ASbGncsp41jPIav+0yNf4YztKQzD5SF6sYk8rWhtQixNnNLG0sqZeguKy8CgGkhEFRq
	ye7RYOyk9owDKGAY6wIOVd3nJDoMtLHtgxK6l8+8V0VTnkYvZDcVHkNs6qTTJcTK8Fp77LvVgCt
	jOpqL+QHk4L1iRrO4KGFEcqw3JURWXLKYJmgUPAU4Cylu5Vvl9SbR8IvTW7Dc4ljt+BxmhMbTbW
	LVNQD6reIT4kzNufQIGqfK3FkUPzgQ9Ty6CQ311NOsifuPyCsGGnMFH5/G5OdNCT0jqumDEBGiT
	5cZwz1rWUjDVuNQ9N2QvzizlrcSJfr+8SKaBBZ1VfuDNg8+jsF4wjIZ+vhnhM6zn6IJWmOFfaoL
	h/yqVMyMDUcOn/GU=
X-Google-Smtp-Source: AGHT+IGI8DfRA5rnQJOOhTz6HCH/XgvR71Jo4tXJgPBGvvQI727+wnnOGr434IcQceoHYBylPeCl1Q==
X-Received: by 2002:a17:90b:1d06:b0:2ff:7970:d2bd with SMTP id 98e67ed59e1d1-3087bbc4f53mr6443408a91.5.1745235404427;
        Mon, 21 Apr 2025 04:36:44 -0700 (PDT)
Received: from ubuntu.huaqin.com ([116.66.212.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3087df4dfc5sm6336689a91.32.2025.04.21.04.36.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Apr 2025 04:36:44 -0700 (PDT)
From: Zhengqiao Xia <xiazhengqiao@huaqin.corp-partner.google.com>
To: dianders@chromium.org,
	neil.armstrong@linaro.org,
	quic_jesszhan@quicinc.com,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Zhengqiao Xia <xiazhengqiao@huaqin.corp-partner.google.com>
Subject: [PATCH v2 0/3] drm/panel-edp: Add support for several panels
Date: Mon, 21 Apr 2025 19:36:34 +0800
Message-Id: <20250421113637.27886-1-xiazhengqiao@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

AUO B140QAN08.H
BOE NE140WUM-N6S
CSW MNE007QS3-8

Zhengqiao Xia (3):
  drm/panel-edp: Add support for AUO B140QAN08.H panel
  drm/panel-edp: Add support for BOE NE140WUM-N6S panel
  drm/panel-edp: Add support for CSW MNE007QS3-8 panel

 drivers/gpu/drm/panel/panel-edp.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

-- 
2.17.1

