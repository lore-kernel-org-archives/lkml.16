Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFB4525A33F
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 22:25:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744151129; cv=none; b=MNK8JQEuU6uY1g6akxxMu4tHfJmAS/ef5HFLQ2dl646UYQ3ikL4hwjNcVRoWa1s6Rvsk0ktR4M4Rll5yNea9BSygfDQpci8LT+8Fl4JU14ilD3ptCGRu6gOitMoUZW1n3Zw/KFSvPyIiCtAHJmlYEyQnO4V52QyGeKQmHzcpDmc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744151129; c=relaxed/simple;
	bh=pwMACUUFlk6EJPa4bMjnzbX97hafZSOHuPR4dKrIeeY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UTDa27YT4jxLlFnkrAEjLvfaeylYFLTbGkZgqfVtAQ70evs3zFTNe6sSVng+0llZCHBTmPI5c55gMUNYRZulOgSSUUMQ91caFlrCy6tbUqLqxUXAmL1vtuLkaf9/D3BnIGXwHGXSj0WK1vLmbtRAbIlhr0c9YmW/zf0KiDFAhm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org; spf=pass smtp.mailfrom=neverthere.org; dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b=bDOisnJO; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=neverthere.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b="bDOisnJO"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-7396f13b750so6291395b3a.1
        for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 15:25:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=neverthere.org; s=google; t=1744151127; x=1744755927; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H6DPxOlzhlYllRH/6vmFWTeCTxnNAuVnsmGi0YRNeL4=;
        b=bDOisnJOt6CrythuQwjq9U4Y2dCNFIa2n/tZaNZJpaIVohHQMH+80mEMPt0CfqLQqN
         SIna8jWMADj2jH5P1WKGxFnidpNfkGTzApvxpZx9qXdY/U6+Jb85f3/+M1U+EJC7nc0X
         ZqFm+ly7POg8LRGd9BJjPJPxtQx1NoI9DXL9yccxs0Vvl2usugi9n4Lu2OUCV5E3I9Yf
         T7FnM6OqapJRFyMuC01RUdBWyonXEG9g8fKhUYqdhajK8bojCnEbpPxTwypXuT7IHJl+
         A9phmG0TvffPPPAa4fc6tFEdvC/O+M1JK8sLel1No4JFgVhFAAr9hO9jdBgp1+4dgGGa
         V8+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744151127; x=1744755927;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H6DPxOlzhlYllRH/6vmFWTeCTxnNAuVnsmGi0YRNeL4=;
        b=BNKJtlw7mQPuQvU1E2snisE9Je2v0i/v+fabFaPEkcfmXVEgVT9HYb5jLyrVBsDsDe
         K2ZF0Di9vTw9aTMhPWAp8D4a8O2N4qCjGWwFJo1j60PP3eY1lAoK4kvSm9c7c7NpJdtv
         hxixkARGKMOjhjs4Qi3DSRHC+kVEiY+rvtlZSOnivOgaAhKIH0/mV4esmoemIzpAfHcS
         I6bJFXBCa+9drbi5KrtvpbInbN+GPl5On/S2Rtk4u7INdYal24WucUFvnHodjEYk8qz0
         pNFP/dIkzUFtcYrq0/m8bcOQ+RPeBO0doH4H9bcIX2ljTs6LTuqubuC8pXMzNstc5+O8
         +s6Q==
X-Forwarded-Encrypted: i=1; AJvYcCVOnY86yiA/EZ2kyToUGiel2+FY1jhBiylfR7eAsALd5pX0edpbRDaaX6+JZkZUeXvl8UmyrqwKH/oVPNY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4rn9NkmOfblTZ+7e9no0fjgCFGojOow3Pq85TccTunNTvefrD
	s6MavUbHEQ2OmNbkrtZkCVaRBRn5y4Q50V1/lAh2uYKCtMl9BwRjMFsqqhZh9w==
X-Gm-Gg: ASbGncuUYBSOKhLixIRfW1HMdiG/ql3fYiRz2dRcQ7r6jV/vAFx8SRfxZoYqI8oDzSO
	48jh8zeC9Q1WNjLAZVo1wO7IAYpCdeEP4vNa32pA0q5K3uwvKSmlEvDsMfXjf4uC3r6Oj1bZR6K
	bhX9uyMmtt1AHyKYT+0zAoChH9P5Ighc6fukZZu+n5+zf6IH6sNLC6Dy7DTZan9BpCOSXlvJOIT
	dXK+dF434WMX8cWfBJcyYn1n2ggrZ8Z6veEEQoBCw2NS5NlN0sT7wUH+xWJfP1jwYzasR4MBS14
	sEnCzHfioXpgjpgJDkxu1eh7SonieabMS7JTfO7VlRs02a8apx6QSD7g6BWE6p8qoPtHPtjbImL
	PXPVE0tSHrQ==
X-Google-Smtp-Source: AGHT+IFdRcMhc9cN/ofWKCjwvcJpIKZ/rH97I+mHfxpG86JlK/ig74gEs6cZ8zLKxi7JsG/vNcg/Vg==
X-Received: by 2002:a05:6a00:2e0f:b0:736:eb7e:df39 with SMTP id d2e1a72fcca58-73bae55140fmr865204b3a.24.1744151126998;
        Tue, 08 Apr 2025 15:25:26 -0700 (PDT)
Received: from tiamat (c-69-181-214-135.hsd1.ca.comcast.net. [69.181.214.135])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-739da0b3009sm11133766b3a.123.2025.04.08.15.25.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 15:25:26 -0700 (PDT)
From: Michael Rubin <matchstick@neverthere.org>
To: gregkh@linuxfoundation.org,
	dpenkler@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Michael Rubin <matchstick@neverthere.org>
Subject: [PATCH v1 15/18] staging: gpib: ni_usb: struct gpib_interface
Date: Tue,  8 Apr 2025 22:25:01 +0000
Message-ID: <20250408222504.186992-16-matchstick@neverthere.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250408222504.186992-1-matchstick@neverthere.org>
References: <20250408222504.186992-1-matchstick@neverthere.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Using Linux code style for struct gpib_interface.

Adhering to Linux code style.

Reported by checkpatch.pl

In general, a pointer, or a struct that has elements that can reasonably be
directly accessed should never be a typedef.

Signed-off-by: Michael Rubin <matchstick@neverthere.org>
---
 drivers/staging/gpib/ni_usb/ni_usb_gpib.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/gpib/ni_usb/ni_usb_gpib.c b/drivers/staging/gpib/ni_usb/ni_usb_gpib.c
index 14f7049a8e5e..715848a3bb75 100644
--- a/drivers/staging/gpib/ni_usb/ni_usb_gpib.c
+++ b/drivers/staging/gpib/ni_usb/ni_usb_gpib.c
@@ -2361,7 +2361,7 @@ static void ni_usb_detach(struct gpib_board *board)
 	mutex_unlock(&ni_usb_hotplug_lock);
 }
 
-static gpib_interface_t ni_usb_gpib_interface = {
+static struct gpib_interface ni_usb_gpib_interface = {
 	.name = "ni_usb_b",
 	.attach = ni_usb_attach,
 	.detach = ni_usb_detach,
-- 
2.43.0

