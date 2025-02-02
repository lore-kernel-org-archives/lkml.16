Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5518B446A1
	for <linux-kernel@vger.kernel.org>; Sun,  2 Feb 2025 03:51:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738468268; cv=none; b=uxq+zrCdGgDZX46uvjZDcXMNWKnt0P8TYzOQFXelz4p2+e+Rbi4b3prKsNQb/7gUFmILrbjEfUCnXzaiX9NMqbSFUgPBUImw+fNFPoR7kOZjYJ3KM78/862YtO01/+/EZjLEhS8eqFMOMdVPyusjPZ0RPojLEVLoaGmWibWG6hQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738468268; c=relaxed/simple;
	bh=PbYtkom+gUHlGGx+5lwLVcI6JHpDbOhVcKFC5fhJ7Ko=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=pFGOKLVGLgrBiKFF8SNn5JoV/Ryaq3MuB65KGEFxRObTZ9v/hghxEsYZV9jvHWyyMufIG4DTd0furPQy2L6nsCVw1Mr7GxZhBbSXdxFxm3EjDO7Km/ut9r6KJ9H5fdwEeRWQ24DJ43GCH75AaY4oMi52uqkpWHpN/kBXEzUQ4HM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--badhri.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=O0FJ9g41; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--badhri.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="O0FJ9g41"
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-2f780a3d6e5so6549337a91.0
        for <linux-kernel@vger.kernel.org>; Sat, 01 Feb 2025 19:51:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738468267; x=1739073067; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=jGPnG/KaEKlAC+3m4DMkOr6QTvoaVn2cl6V4SfgkOEE=;
        b=O0FJ9g41UMHT8oGEwe3X1wiiRoaRXaRsfF6OT1RHO0wPhprYSg4jQBMTv4oW3BG2JO
         T85CaMCzYONSAA3AmyciOQDtd16grx/jOCZ9caxKJSbxtnh82ek7G8cfctWChC2FmTkx
         whn3eXm06mZ58cLRbBkRAgeJgQz1huqG/PV0wc0EsDK7wGDCWUcciyY17ijGyqrzyVQ8
         5QFu6NA/KoikvZtu//Ssc4Plk1RBj7ge7aSwdhrnOBTHmfFsDn/tlVqi7b026/TfbjQL
         yhOlXo7APZEix83AGkpuzVgX4ijRLpZqThXlQdBZITO3n3smDS0zVXKPzDZIQXbw8mQz
         FuHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738468267; x=1739073067;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jGPnG/KaEKlAC+3m4DMkOr6QTvoaVn2cl6V4SfgkOEE=;
        b=l0EzpLiF+9phWXBza97jfeoQaTmZ+gUewHfrDarhy73bBNPlA31Ad0ybxEQ6MGqXUm
         uKpUD5MXVi+PJ+Gr587ZkHjirhW54OPvj3C3TZSgplKc5/WZ0ZIv93X+zLfqBnJ9tALZ
         1qCZ46ppPR0UmtDf+WvRYI3nE6DGoMjKMJvreXIN9EtmecDBrMpxN/u20otb9GlqYVTT
         yEIDlLx4wWok7IRq0EqJlM1It1cYWlmVIYfuFUKeLfJEO+mftlpNRrjhNHn3/f8WEAgn
         XAMPds6krfkJG6SO/CtIHQyHpRFuQXygUReWrqHCVsoXLVJU9WuvOXlAuzkZHtwQkBkG
         Enbw==
X-Forwarded-Encrypted: i=1; AJvYcCUW/aJlDAvMR4VkWIpYILyciRQlwgohTE31Wws61mPEK/YJzg6tW+OvX6EHf25DuiGtqANN1D9MCWEm4E4=@vger.kernel.org
X-Gm-Message-State: AOJu0YygrQqxSh0LR71fisJYa/048uns7bNcbJiX7h+vrLF+86Zlb+R0
	5Bu0svtK7vkqACV+C3sMA5BFLorM2Vw000LemKIW0+NaX+cwUdpUcXKAHOlqBel72ODmwuRWzQS
	A1g==
X-Google-Smtp-Source: AGHT+IEDIyLl95Xc6h9Y3VLVPAJilJvXKmnIGcbZt/ClsnL8T/o4SlEvGEsvbwbDOYzS8l6z1Htv/m+Mu+8=
X-Received: from pjbsw11.prod.google.com ([2002:a17:90b:2c8b:b0:2ef:a732:f48d])
 (user=badhri job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:2802:b0:2f7:ef57:c7df
 with SMTP id 98e67ed59e1d1-2f83abaf38bmr27062123a91.7.1738468265303; Sat, 01
 Feb 2025 19:51:05 -0800 (PST)
Date: Sun,  2 Feb 2025 03:51:00 +0000
In-Reply-To: <20250202035100.31235-1-badhri@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250202035100.31235-1-badhri@google.com>
X-Mailer: git-send-email 2.48.1.362.g079036d154-goog
Message-ID: <20250202035100.31235-2-badhri@google.com>
Subject: [PATCH v1 2/2] usb: dwc3: core: Obtain imod_interval from device tree
From: Badhri Jagan Sridharan <badhri@google.com>
To: Thinh.Nguyen@synopsys.com, gregkh@linuxfoundation.org, 
	felipe.balbi@linux.intel.com, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, johnyoun@synopsys.com
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, jameswei@google.com, 
	Badhri Jagan Sridharan <badhri@google.com>, stable@kernel.org
Content-Type: text/plain; charset="UTF-8"

Although commit cf40b86b6ef6 ("usb: dwc3: Implement interrupt
moderation") adds support for interrupt moderation in device
mode, it does not add an option to enable interrupt moderation
unless the version of the controller is 3.00a where the
interrupt moderation is automatically enabled. This patch
reads the interrupt moderation interval counter value from
device tree so that the interrupt moderation can be enabled
through the device tree.

The explicit initialization to 0 can be avoided as the dwc3
struct is kzalloc'ed.

Cc: stable@kernel.org
Fixes: cf40b86b6ef6 ("usb: dwc3: Implement interrupt moderation")
Signed-off-by: Badhri Jagan Sridharan <badhri@google.com>
---
 drivers/usb/dwc3/core.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
index dfa1b5fe48dc..be0d302bbab7 100644
--- a/drivers/usb/dwc3/core.c
+++ b/drivers/usb/dwc3/core.c
@@ -1818,6 +1818,9 @@ static void dwc3_get_properties(struct dwc3 *dwc)
 	dwc->dis_split_quirk = device_property_read_bool(dev,
 				"snps,dis-split-quirk");
 
+	device_property_read_u16(dev, "snps,device-mode-intrpt-mod-interval",
+				 &dwc->imod_interval);
+
 	dwc->lpm_nyet_threshold = lpm_nyet_threshold;
 	dwc->tx_de_emphasis = tx_de_emphasis;
 
@@ -1835,8 +1838,6 @@ static void dwc3_get_properties(struct dwc3 *dwc)
 	dwc->tx_thr_num_pkt_prd = tx_thr_num_pkt_prd;
 	dwc->tx_max_burst_prd = tx_max_burst_prd;
 
-	dwc->imod_interval = 0;
-
 	dwc->tx_fifo_resize_max_num = tx_fifo_resize_max_num;
 }
 
-- 
2.48.1.362.g079036d154-goog

