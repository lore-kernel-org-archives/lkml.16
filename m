Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51FED1E5B99;
	Tue,  3 Jun 2025 17:01:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748970094; cv=none; b=RAB1LeiW0zG+qWSRKAs9c57TuWiEqvtO2HVRRiXwFxGwXc19qvJlwDpwMMa4W+0+fvS1nBpA61mrEbZLDA23dS81lDzzPfNsCcu6TCXBV8vY9Bg2BeLtR3C4nkWafb6Q/1BVskwqSB4bsBoKM2vDGn6kiYGjOiT5TD1qDATtlW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748970094; c=relaxed/simple;
	bh=MRpcTnOmrGZKKzMf/zKdzcRdfMSKeKmyduo0AYU5qjI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XpVoCkfzzUiUVU1rn8IC6yJHCkvfFPntEpGs/5tHzXjGVw7ibDoovBv+kxGzzQxYHhJYiT4HPOoMyUVSxLy9P37h1f27vomObrud2uvAOwCSEkcfJu9xfQMhCM5H1yvNQvxilU9aXsQ+0kVolWE3yt8dxpAlmqVVQrF00gn0lXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VXHUisj6; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VXHUisj6"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3a361b8a664so5659961f8f.3;
        Tue, 03 Jun 2025 10:01:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748970090; x=1749574890; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=L2WNeHWGKI9roALR2lWxhNA2hHvIsfJxDyoD0/1ONqw=;
        b=VXHUisj6Et0si/dHk4MAR5xE6qGPLUZvmuJvwj2jQ5F6x5nzjCIiEQdaP7KtIu3AIO
         pqHKRs5KzrQfE0ZzXu2iWSixIyg6sJXy8gNLE0rkmmdcBKp6aancBr9ao5PFBuFNInWY
         PvFDU/KYOjkwNQqspSgqL7im+H9P7FLXIjp2XrQUNg31R47a+a+fKnhXKEGJO10VxpNK
         Um9j+GD5tUKVbFuw0X1USuSXk/823Ktod6S0ItU6ewd/Gd7Zlyg6juRy9sremGwQW/Oi
         udMHO9sqH6DOrOQ6HzSG3+u2i4sjJhMIsIpTtb4A8xB/tG50l7fAWqoOw7fyL/Yy7KW1
         GhUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748970090; x=1749574890;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L2WNeHWGKI9roALR2lWxhNA2hHvIsfJxDyoD0/1ONqw=;
        b=wyll/Zu4ekcY6hp2drLfz1g3UAAyorQ+rTtqzZUOOLi6YB+J/fQpOPM8FKFhSc6ct3
         b+gS9nHYj4PLWe481IeSZ1hIUZRArD8d8h4xEygVxpTh3w6clp46EZuVKCD2PwcDUghi
         8gG9gsTri+TdldSafoESclZm5auHe1SmHuz+fJUTDxm9h3ok/78HQf/kjmkxT00lqC0k
         8jqTvmPVZ07DTjuGEijSyJyIjGB1hYEhtKXL8KfPRPWzRHoydVN+NFYkLS6cNbD6Cu7u
         kQ+g0vjFhJfGHEFzfP6K1NlDZcyMqd0vMFnP3S0Xusgm1qHQ9BQKIdSAWXwOzlUA+HPj
         fpRg==
X-Forwarded-Encrypted: i=1; AJvYcCUvAOIUtG91KX5pnicqmYA8VA3a7m6ApgqyA6zdVZsfhgiY12aJatEyA6s31vvgALhrK1wfac0JHILUUfw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwRMxJkM1TBezYt/sYg7w6Nx8HH/afE8Mp/8I/3mjxLzkKZwzqm
	FtGlWBQvRnH7LhyQFupsyUzksSCVksDwdd5NOZlxFMJ3sB8IH/NYvs5fIkigTeGfJqatNA==
X-Gm-Gg: ASbGncsVD4rkQbzUSz8W5VE8F4RgZzz9pMRR+U79dzNDA1T7pvzJN0EwSwXeNr63ILT
	mAMFe7856+T6ovlp9qu45kwcosEwBEAwePtN+B746yXkzOY5SJavlD78iNp1E55ImeACQ+229wf
	Dad0iYSShymJ8bR0qRJ/kW1Q8VlnWbRh6o3ilBiOeZajnUzTWl28cNSIV7yD6oT5zvklzsIdJkt
	Idhr1Xs+ixPrw+PZMuCjiUhd1VCjyv6dhI8mLCtBpJGVazff7ck6nnJ6k5UDZyvma185qbszLzk
	6uEFMl2mksH3IDXFNhJyYH65iZ+P7tZ5h2hx0YsX0phXlB0nPy1lZDXwiu5nVgZ8qeD7BCE6J+H
	IVFWfdb6+vE7MHt6IzAL2nI+PqY+61CXQHB0V
X-Google-Smtp-Source: AGHT+IE6GEEXLj+uCTG7+WFHFtMo05gc7+06c+MEmNE8u8Ku+jPfH+KoYhCAkxPaUNl4r/V43bwYZg==
X-Received: by 2002:a05:6000:4023:b0:3a4:edce:b2a6 with SMTP id ffacd0b85a97d-3a4f7aafdd0mr15910447f8f.53.1748970089947;
        Tue, 03 Jun 2025 10:01:29 -0700 (PDT)
Received: from alchark-surface.localdomain (bba-92-99-174-93.alshamil.net.ae. [92.99.174.93])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4efe5b92bsm18574640f8f.9.2025.06.03.10.01.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jun 2025 10:01:29 -0700 (PDT)
From: Alexey Charkov <alchark@gmail.com>
Date: Tue, 03 Jun 2025 21:01:16 +0400
Subject: [PATCH 4/4] arm64: dts: rockchip: enable bluetooth on ArmSoM Sige5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250603-sige5-updates-v1-4-717e8ce4ab77@gmail.com>
References: <20250603-sige5-updates-v1-0-717e8ce4ab77@gmail.com>
In-Reply-To: <20250603-sige5-updates-v1-0-717e8ce4ab77@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Alexey Charkov <alchark@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1748970076; l=1967;
 i=alchark@gmail.com; s=20250416; h=from:subject:message-id;
 bh=MRpcTnOmrGZKKzMf/zKdzcRdfMSKeKmyduo0AYU5qjI=;
 b=smst/OKPkZEHmFa2lIItgsGCj0ToD3bQtjChD6j/TxtKlzH7pmVS/qHpQJMmNH4dOT3XXqCu+
 GBz4ySF7afoAA32zIGNcWjDPMygusyjS9VBK4SMPL9H0LMXQyONjVPu
X-Developer-Key: i=alchark@gmail.com; a=ed25519;
 pk=ltKbQzKLTJPiDgPtcHxdo+dzFthCCMtC3V9qf7+0rkc=

ArmSoM Sige5 uses a soldered-on UART connected Bluetooth controller.
Namely, board v1.1 uses a Realtek based BL-M8852BS2, while v1.2 uses a
Broadcom based BW3752-50B1.

Add required device tree nodes to enable the Broadcom based module.

Signed-off-by: Alexey Charkov <alchark@gmail.com>
---
 .../boot/dts/rockchip/rk3576-armsom-sige5.dts      | 33 ++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dts b/arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dts
index dcd033859398312f7693bebb7f080ee4f2ecaa32..46e5d6e30898a0f937283e986f188947e10250ec 100644
--- a/arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dts
@@ -791,6 +791,20 @@ usb_host_pwren: usb-host-pwren {
 		};
 	};
 
+	wireless-bluetooth {
+		bt_reg_on: bt-reg-on {
+			rockchip,pins = <1 RK_PC7 RK_FUNC_GPIO &pcfg_pull_up>;
+		};
+
+		host_wake_bt: host-wake-bt {
+			rockchip,pins = <1 RK_PD4 RK_FUNC_GPIO &pcfg_pull_up>;
+		};
+
+		bt_wake_host: bt-wake-host {
+			rockchip,pins = <0 RK_PB1 RK_FUNC_GPIO &pcfg_pull_down>;
+		};
+	};
+
 	wireless-wlan {
 		wifi_wake_host: wifi-wake-host {
 			rockchip,pins = <0 RK_PB0 RK_FUNC_GPIO &pcfg_pull_down>;
@@ -872,6 +886,25 @@ &uart0 {
 	status = "okay";
 };
 
+&uart4 {
+	pinctrl-0 = <&uart4m1_xfer &uart4m1_ctsn &uart4m1_rtsn>;
+	pinctrl-names = "default";
+	uart-has-rtscts;
+	status = "okay";
+
+	bluetooth {
+		compatible = "brcm,bcm43438-bt";
+		clocks = <&hym8563>;
+		clock-names = "lpo";
+		device-wakeup-gpios = <&gpio1 RK_PD7 GPIO_ACTIVE_HIGH>;
+		interrupt-parent = <&gpio0>;
+		interrupts = <RK_PB1 IRQ_TYPE_EDGE_FALLING>;
+		pinctrl-0 = <&bt_reg_on>, <&bt_wake_host>, <&host_wake_bt>;
+		pinctrl-names = "default";
+		shutdown-gpios = <&gpio0 RK_PC6 GPIO_ACTIVE_HIGH>;
+	};
+};
+
 &usb_drd1_dwc3 {
 	dr_mode = "host";
 	status = "okay";

-- 
2.49.0

