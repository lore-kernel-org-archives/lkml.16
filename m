Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9931F21422A
	for <linux-kernel@vger.kernel.org>; Tue,  4 Feb 2025 13:58:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738677532; cv=none; b=GwQRba2qldWgDKB66Hr68SYjNnzxgCmEth4VXDfoOLvPQwUuytAJIipP5OHDLg3lLTbzsLISy5Kusw0wfz+Erlrw+SqYhb+ZbBDrtGa3R/zYov7O97fQNRpU09lqiJivS8auez/IDt6+gNWwP52E2zv25NMPwJcu7B/tX1AL/ic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738677532; c=relaxed/simple;
	bh=qwNusalsxqdNQhdpk2S5586/XFRiEANFBgaPdBV5M0o=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=BJl0v5xuEUeKCDs5WMV7KsKZmtn7vQfwI6Dq65/Z/jipAhmMxLFyFq4ZuBiscaDGcPmBCKlc7tdO5D66bzG8DHdN1jVrSFjJbbgWLartJm1TkFLrza+1AplIBSL9C6Kdvi6snRcrIJOZ/fHnQ451K2KZzOx6x9u7ddtlu4wVngI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=boH7aWQ7; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="boH7aWQ7"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4363ae65100so65954945e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 04 Feb 2025 05:58:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1738677528; x=1739282328; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b9Mhzic04g3H6M95YhZzI57+VboqPOZ3dYOfhKdSDJs=;
        b=boH7aWQ7bQMZim1wXmX7I6vCO+ngAxKeBp1qUp9j2z+oarLpSz40LOVbq1YaIbK6U6
         rNPvPQ4waGaSfzqNN5zVpnxy/NOH5EvUFds/jEwauOhRHxaRzkCHemAF6GTpOwsexX9I
         jV6hydVbsKG9sC7Jj7sHUNgswTbckRYMVpLBRkSytJ9mxU5J3hyIOxZipEHKiNwVOy3H
         6acbXMUIuUZg0RX+7GvPvUf8KhN1VRKuC3gtCBhPmHYkmb1wQ4d0qMa/PupLQRGzN4ru
         OSrcEcE2NHGxBHl7tJMWfBdTZBz5qhgnpnqvsNUQFb96CTAkytANiIrez0krj3tpkbJQ
         /oBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738677528; x=1739282328;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b9Mhzic04g3H6M95YhZzI57+VboqPOZ3dYOfhKdSDJs=;
        b=MVgQ04xWYRrNAm/LoCz1/YpBgCTFZShuJ4dfCpvMU/hKymWogYfz6o0yfD/1SYLREN
         fYLwyOjQwOF4czAw9Z6ua/QX/vizShhtXbX85gkK29WoDPQOTP5jBtRSsWVE7wi7yXBZ
         wUuzx3fVW42pdun9UVEu2n4APFYTpEnJ164KhucgzAhnZDoB8ECidmP9fpfKXvu3hiAo
         rEqAJEp5qxmrsavVFNaHxbrzk+VcyPjyyPzyyIwFlUwERE7SuHj4q3foMI6j6218qmnE
         4dCQFMa2tYCGl0DXH+M6tbUakOTuoZJljdjEDScO+ToAi3zrkqCYatlsifOcvfcCGS8d
         VVhQ==
X-Gm-Message-State: AOJu0YzcozszhI5NSFZ8gcNSHbsSszYo42PD3/3mpnLBEpw/DX67xur2
	lUdTxB+x5zlWIIjL0xOZmFnilpVLHaJ2SK3jrGc1mgee1B5djYjVhTuQR4hEdNg=
X-Gm-Gg: ASbGnct9FKAUqDu3zA3BSaAl7dTFgEvAG7AKX5OPxZEoVIQYoJeN34I6OHzx6wjPEmf
	/ayd0masWHr60WxNt0Q7DjmPS7SV7C/aB80SW6IKyHMvMJ+GPiRBGIkds//uqA0CJU/456CYe5r
	kXangHfiKF8VuIJ918OEkGrT3pP08XQOd0MQbqvyPl8FUOeQl60Z5WGHn4GRcv+cZbjyoN3B/OS
	yY9BP0lkt0g61g+g8Z63vdmplkrzeXQKVqNuySNB0lc6g68g8aJg1pBJs6RUHUd9NBHjjCewEK3
	mUc60ADvMLYelRuKh6OfaMWL7lqCW+FMwSSgCn+pxCMTO5jZeA==
X-Google-Smtp-Source: AGHT+IG6HYRgSllCm56nuMoAeKWHbxfz6C7lnkj3eQ0dmAHEhCsGlZxEcR573rWapsj44lPvD0/Tgw==
X-Received: by 2002:a5d:6c65:0:b0:38c:5cd0:ecf3 with SMTP id ffacd0b85a97d-38c5cd0efe3mr19037648f8f.11.1738677528507;
        Tue, 04 Feb 2025 05:58:48 -0800 (PST)
Received: from arnold.baylibre (88-127-129-70.subs.proxad.net. [88.127.129.70])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-438dcc13146sm224328065e9.4.2025.02.04.05.58.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Feb 2025 05:58:48 -0800 (PST)
From: Corentin Labbe <clabbe@baylibre.com>
To: gregkh@linuxfoundation.org,
	johan@kernel.org,
	martin.blumenstingl@googlemail.com
Cc: linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	david@ixit.cz,
	Corentin Labbe <clabbe@baylibre.com>
Subject: [PATCH v8 2/2] usb: serial: add Martin and myself as maintainers of CH348
Date: Tue,  4 Feb 2025 13:58:42 +0000
Message-Id: <20250204135842.3703751-3-clabbe@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250204135842.3703751-1-clabbe@baylibre.com>
References: <20250204135842.3703751-1-clabbe@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Martin and I did the driver and have hardware to test, set ourselves as
maintainer of it.

Signed-off-by: Corentin Labbe <clabbe@baylibre.com>
---
 MAINTAINERS | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 481b2dac1716..42558a70dcb0 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -24530,6 +24530,12 @@ F:	Documentation/usb/usb-serial.rst
 F:	drivers/usb/serial/
 F:	include/linux/usb/serial.h
 
+USB SERIAL DRIVER FOR CH348
+M:	Corentin Labbe <clabbe@baylibre.com>
+M:	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
+S:	Maintained
+F:	drivers/usb/serial/ch348.c
+
 USB SMSC75XX ETHERNET DRIVER
 M:	Steve Glendinning <steve.glendinning@shawell.net>
 L:	netdev@vger.kernel.org
-- 
2.45.2

