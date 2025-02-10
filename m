Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5121D223315
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 12:52:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739191929; cv=none; b=dxLx5mK8RdXl4qeo1MvZ6Uhy++lFPDx/b5NLAKLH0k+KnvJIhoT3vbgxzvfklkh6fUWeTiLzmrppLTo04S5XXEMvQnjlUAoKdzqIvnzvf9ENY5BUsFtBHIJ3tLkYJGSLO/TeH2ZheZGCDeVLnFCL3aEX0oBivJI1sKkUcTlO3K0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739191929; c=relaxed/simple;
	bh=DOgwB2o78HqwOMGNZ/JwWJJka3ZJ5jZHlvRUFck92Rg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LqRYZSpxZo5BQBIMLsUZTocC7S0NIhMn2mjuX3sM0c1/2yKKbRDtdogh06NLQbba9zusJs9Q9p75Moxl6veBqL48W5AXlqRfjAW6QdDXO78AR2trK70TjeIt4jremi9cgY9Mx0g3/sK5LG4PiRBgYoBDX2PJAbG4x7liKTLaFyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VFfVvc4Q; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VFfVvc4Q"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-aaee2c5ee6eso702312566b.1
        for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 04:52:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739191924; x=1739796724; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=frAoU9FSbapFrq+HpklqCcJQ3Ks77Q8uuZdWNADgS9o=;
        b=VFfVvc4QLCYP+vuqR3XidDRe+rupwrrB5NJkt3weXOFrSWsLPfF3C30zwNo7WPVdnY
         JxYJ1OZ4E9yFeZY/jpl+CJEB+hqleKBOfa5T7pI3/tjULkGNb1lau5nQS6AKFyjt6vs8
         rbddsjFWo3Cti3pRGgL/Pt0iocoLDnIhth9f213RfZrr6+QGh+CnndugOb9qZAU7XOXj
         PpuRpfuBH1U99NZIljgrIL3ll8xdMXCdwhX27enWc36fZa8qMdZPtPt5LDNT1FklRipz
         6+AeifHvkfC+zTEIst5w1W+9+v6Qlfj44h4KQLJHaioH8MuQjrW+cIrpXyTQlAigQQPK
         mSUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739191924; x=1739796724;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=frAoU9FSbapFrq+HpklqCcJQ3Ks77Q8uuZdWNADgS9o=;
        b=im/aIeWjrR0xg7dOkibpTmT2rZP6MtIdW3BGC5smVe/9xQJnHcG+TSDBb+nn0Th7V6
         daA6+mS+RqpxF6LJy3WKtYaQYrcbLHmsmG26E27CeME1UuLrI2s/AKRvsksTP4flWRJ/
         +hOvujEzdAzIwYfFV9d2mm1Mz1BLcZ0RSDhgiBiHju5yTJZcSVu8HwcfQCb1BPRyQps+
         SD5mvCYirw487+R1SxYPWgwDpWVqdHXpZbe1VkIA0FCSZuNjl1zj6FN5n0iwvqvDEL9R
         CBUZ2kNzR66k1RQsC3iyF+dPu4xk8tMh0dT9yqV9GXwDBktGyrt9qUwf4akiL4LdnYDI
         zOSw==
X-Forwarded-Encrypted: i=1; AJvYcCW0gAIVv6hy97oc0QreHyv2q/or60HmkZQ3McPQQrtJvBVRTZ6qC/RY0bPUvMulcIiYo7ibRONki8kQ15A=@vger.kernel.org
X-Gm-Message-State: AOJu0YwInwIINkpwkHOV7wgC7WiZVBc08AKRxrRvWCscUVKTr4W8DAwE
	D+4G24FY1tYzmDwlqpKvDTTlpWU7FQxCji57nGuYNWEZ1uaKn7DrsImmbSvEmfo=
X-Gm-Gg: ASbGnctZNMCRYKZfQ9lc6eVtLEgCWxfVCxLlf6bRXbRrAuoySPqBAuCkDcFUUIm/9gw
	G+Ne66dOQ9+Evum+/FtwLRSEI6w6CvY98VCeIpyuAj1SmK1bzdY8hA+eXo+7zn7z1Tr4mLZyXdE
	bX7qg0DpqGEXSVsprQ2dCg/h0PqT/KyPdul2XeE4yZQZxovTOR1rhjYT7VvtBu6m6/BjlBPgJDS
	8PDoeFj99fWhUVqJiTyUATTfbvqo/v8IigyElzVlya10MJvBSLYT++tpjNFbB4GdC8Hib+AdAuH
	L/VXpv7TjmDxnEPNG/9zVGZPfV65REStzhExmErNQ0CCOkRy5VfF2RoslRN2zoAB1i6pwe0ff5c
	=
X-Google-Smtp-Source: AGHT+IHlPw1KLXMN75TVclRX8S/qE4XVwnFHG0ZCFXVtVKAbnSQdsY2Nvm1erECM0CzNh8K85VHXjg==
X-Received: by 2002:a17:906:4fd6:b0:aab:d7ef:d44 with SMTP id a640c23a62f3a-ab789aecd06mr1234271566b.24.1739191924470;
        Mon, 10 Feb 2025 04:52:04 -0800 (PST)
Received: from puffmais.c.googlers.com (30.171.91.34.bc.googleusercontent.com. [34.91.171.30])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab7ceae3a3bsm85819266b.129.2025.02.10.04.52.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 04:52:04 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Mon, 10 Feb 2025 12:52:04 +0000
Subject: [PATCH v2 3/3] arm64: dts: exynos: gs101: add reboot-mode support
 (SYSIP_DAT0)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250210-gs101-renppt-dts-v2-3-fb33fda6fc4b@linaro.org>
References: <20250210-gs101-renppt-dts-v2-0-fb33fda6fc4b@linaro.org>
In-Reply-To: <20250210-gs101-renppt-dts-v2-0-fb33fda6fc4b@linaro.org>
To: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.13.0

syscon-reboot-mode can be used to indicate the reboot mode for the
bootloader.

While not sufficient for all boot modes, the boot loader does use
SYSIP_DAT0 (PMU + 0x0810) to determine some of the actions it should
take. This change helps it deciding what to do in those cases.

For complete support, we'll also have to write the boot mode to an
NVMEM storage location, but we have no upstream driver for that yet.
Nevertheless, this patch is a step towards full support for the boot
mode.

Note1: Android also uses 'shutdown,thermal' and
shutdown,thermal,battery', but that can not be described in DT as ','
is used to denote vendor prefixes. I've left them out from here for
that reason.

Note2: downstream / bootloader recognizes one more mode: 'dm-verity
device corrupted' with value 0x50, but we can not describe that in DT
using a property name due to the space, so it's been left out from here
as well. This string appears to come from drivers/md/dm-verity-target.c
and should probably be changed there in a follow-up patch, so that it
can be used in reboot-mode nodes like this one here.

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>
Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 arch/arm64/boot/dts/exynos/google/gs101.dtsi | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/google/gs101.dtsi b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
index 86741994bb7c..d60e6a8e8723 100644
--- a/arch/arm64/boot/dts/exynos/google/gs101.dtsi
+++ b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
@@ -1411,6 +1411,19 @@ reboot: syscon-reboot {
 				mask = <0x2>; /* SWRESET_SYSTEM */
 				value = <0x2>; /* reset value */
 			};
+
+			reboot-mode {
+				compatible = "syscon-reboot-mode";
+				offset = <0x0810>; /* EXYNOS_PMU_SYSIP_DAT0 */
+				mode-bootloader = <0xfc>;
+				mode-charge = <0x0a>;
+				mode-fastboot = <0xfa>;
+				mode-reboot-ab-update = <0x52>;
+				mode-recovery = <0xff>;
+				mode-rescue = <0xf9>;
+				mode-shutdown-thermal = <0x51>;
+				mode-shutdown-thermal-battery = <0x51>;
+			};
 		};
 
 		pinctrl_gpio_alive: pinctrl@174d0000 {

-- 
2.48.1.502.g6dc24dfdaf-goog

