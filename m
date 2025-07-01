Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 450CC275AEC
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 15:41:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751384495; cv=none; b=oXiepevFbz7V448KlD51aPZnyEk63sWT1hF8HdA2t+V+kjypr8bTmo21tE1AFPunW7LnPNI5e15WyF9UswdUcDM/vI4F6a53alVwU+DDZQgOPHHeKI+zOMlDUZR63OxcFo3++tsl4jBaZRgn4pjrAq7rpbR1AOMaMUuAkqD76Nw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751384495; c=relaxed/simple;
	bh=vssQDmpqsqtEsVZ+J0Rxu/Bc2+tTBwvSxd1dgCxlXZU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=huafCYeavzyi6cZOanLqWD+i1LWWiG9U4TIqDRuZubwnIlTQrYcL/GwBLh9UptqCUvYIOrt2pRnew5sOXujQfwiWzo6UH/CqLIe6qfoF79krm4QnI6AVrKDAVcYGmEVrum1WIST8fAjosIWykxFtCerpPItXE3745kIXjNo7Lh4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zetier.com; spf=pass smtp.mailfrom=zetier.com; dkim=pass (2048-bit key) header.d=zetier.com header.i=@zetier.com header.b=Beb2niim; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zetier.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zetier.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=zetier.com header.i=@zetier.com header.b="Beb2niim"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-7425bd5a83aso3297533b3a.0
        for <linux-kernel@vger.kernel.org>; Tue, 01 Jul 2025 08:41:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=zetier.com; s=gm; t=1751384493; x=1751989293; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=59de6pmFOQy/rScsXfRhVQYqTrbVpesPpP5fOBkEBh8=;
        b=Beb2niimVluHZ09GrFiQXJ99dprdGuW82OxY4ID53EcM4S4SkLtL8Y/kafSu1WjAir
         sTttOBlxOW9i4Re8i8k0bgdm1OELc8LFMrOQVBjj+H+hFNgNmxuIXSBp35pDLNSUzOjz
         sHe5WOzapa5jGF7zJJgWGqJE5SCoHB2MGPkIr/bCwEZ4bbug8FrXrB/RZ8ndsiWN4TXz
         W3JoGOhkbg/37W2mDGUFfZCCgh1DT9PQQwW2+QvTwSDlUa3VI/Fqj4OTXuvKOTYmejyU
         K1xdsqH75/Wu2JQP//d/iv7BR8oKHbqXJyZa/5CjoDJRygf9Bvl1iX58qYVPs0XVz5nv
         Za6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751384493; x=1751989293;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=59de6pmFOQy/rScsXfRhVQYqTrbVpesPpP5fOBkEBh8=;
        b=KSftyZv/Hn+EO8T8MALwX4/yLPNK1rj/JT4Byu6lcvL+CFwTGYRxnY2gipNgYWi7AN
         w/hZqcGV700RJLEfuj5iLvFmfnqHTnZ7PBxCafDOeM554T1S7oMHnvSTk/tL/uxW1h6u
         wgXojOFQ66VRwyoJvAj9KeIWerCzqoxbJsFqPiuKHvwf+zPIc5FRKxs68xEC/bAgLots
         LMWheAJr7FuAuQubERqGKc5Buiih7bE/jvGWDW5bTpK0U+rRxHW5TdBsWlJyHzixHEFm
         FQ1jWj2+R1+h8DX1ElYrqf1/9OFJfG+fnvWu7D4IHa9Qy7P4AA/xu0JR9O6RI8XxbKli
         sxdA==
X-Forwarded-Encrypted: i=1; AJvYcCVYB2ISpVteNiwGQdA+oWlXviB7cgiMXBgEwgrD8CMqkRp1XCCy4gw0dXbzmSIRSQrFuRGBMxUthDeq5VA=@vger.kernel.org
X-Gm-Message-State: AOJu0YyRWu4J9iYv+czaM/k3J7EvgqHTSTOW/Liaedrlq6WzYo1N+qui
	zBOJVRnz3SWfRRjqFUE3izsjZu6W5tDC/8uG5yVfo93pLlLXwHDMXs9cfBGQ0KjS0g==
X-Gm-Gg: ASbGncvESbxod4icRnIjnUkmfrNXzBmrx75lDaIhmdeVMeIsQg+xnuZMdkkV94ipBDK
	RWiv6/drNTO9Kr8YN3bzKnOJySO5RLX1wYjB+7UV+Uqxwn1cyr2JOJ14aEFI2o4fC4KiRu2SzZX
	HgJ4GpoKPqJWmEzfBIg3D8OJ6eoclv4KhNybgIEejunRu0GoaznRmsUFa3OLFqsh1yQA63zv42W
	ksvwirtCRFpuMhOikJ1+kdgeDqeqerJ37JsHNGZOnbtOXgf6+bL9t4TXKakA+3yv90/0rKzV7zi
	RfJNMz3nVbIG0qB/ZMw4WcatSGItKTBMVYtR9+28fF6+PMjKwka+w6xdJqfzu01ZxtcngngcoR0
	UR+OQwlxwk/H8MeMC0eqQAIP1erg6QJIGVDi/xJ2q51gk3N7l7FgZzGWEq8k3BsgSkI3+0wY=
X-Google-Smtp-Source: AGHT+IEclQh5sNqNxGCJ9QcJrals8daG9Os0Vgw+JP1Dhlzs2OqOepPslgK8FbWpG+V5py//MrkbPw==
X-Received: by 2002:a05:6a00:2447:b0:742:a0cf:7753 with SMTP id d2e1a72fcca58-74af6e892d6mr27354642b3a.3.1751384493356;
        Tue, 01 Jul 2025 08:41:33 -0700 (PDT)
Received: from system.mynetworksettings.com (pool-71-126-161-43.washdc.fios.verizon.net. [71.126.161.43])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74af5806b52sm12574910b3a.169.2025.07.01.08.41.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 08:41:32 -0700 (PDT)
From: Drew Hamilton <drew.hamilton@zetier.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Bin Liu <b-liu@ti.com>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Drew Hamilton <drew.hamilton@zetier.com>,
	stable@vger.kernel.org,
	Yehowshua Immanuel <yehowshua.immanuel@twosixtech.com>
Subject: [PATCH v2] usb: musb: fix gadget state on disconnect
Date: Tue,  1 Jul 2025 11:41:26 -0400
Message-Id: <20250701154126.8543-1-drew.hamilton@zetier.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When unplugging the USB cable or disconnecting a gadget in usb peripheral mode with
echo "" > /sys/kernel/config/usb_gadget/<your_gadget>/UDC,
/sys/class/udc/musb-hdrc.0/state does not change from USB_STATE_CONFIGURED.

Testing on dwc2/3 shows they both update the state to USB_STATE_NOTATTACHED.

Add calls to usb_gadget_set_state in musb_g_disconnect and musb_gadget_stop
to fix both cases.

Fixes: 49401f4169c0 ("usb: gadget: introduce gadget state tracking")
Cc: stable@vger.kernel.org
Co-authored-by: Yehowshua Immanuel <yehowshua.immanuel@twosixtech.com>
Signed-off-by: Yehowshua Immanuel <yehowshua.immanuel@twosixtech.com>
Signed-off-by: Drew Hamilton <drew.hamilton@zetier.com>
---
Changes in v2:
- Cleaned up changelog and added Fixes and Cc tags
---
 drivers/usb/musb/musb_gadget.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/usb/musb/musb_gadget.c b/drivers/usb/musb/musb_gadget.c
index 6869c58367f2..caf4d4cd4b75 100644
--- a/drivers/usb/musb/musb_gadget.c
+++ b/drivers/usb/musb/musb_gadget.c
@@ -1913,6 +1913,7 @@ static int musb_gadget_stop(struct usb_gadget *g)
 	 * gadget driver here and have everything work;
 	 * that currently misbehaves.
 	 */
+	usb_gadget_set_state(g, USB_STATE_NOTATTACHED);
 
 	/* Force check of devctl register for PM runtime */
 	pm_runtime_mark_last_busy(musb->controller);
@@ -2019,6 +2020,7 @@ void musb_g_disconnect(struct musb *musb)
 	case OTG_STATE_B_PERIPHERAL:
 	case OTG_STATE_B_IDLE:
 		musb_set_state(musb, OTG_STATE_B_IDLE);
+		usb_gadget_set_state(&musb->g, USB_STATE_NOTATTACHED);
 		break;
 	case OTG_STATE_B_SRP_INIT:
 		break;
-- 
2.34.1

