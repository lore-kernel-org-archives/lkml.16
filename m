Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D68428635E;
	Tue,  4 Feb 2025 09:05:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738659903; cv=none; b=SnTVspLIJQ2FcPiN5nrECJlL+9O5uzm+6d5WJx8Lcy42L/DxwP7N4tHZC0iEzcd/4nWhWkH48mg5LBLIVQ5o8uGU3sTWChZtFFA3N9+ozYEnkl9//MeD1Ngx7HqoIc0n9/Qpydpp8iuqUwgK7lU13WFZWQHmRm2NGWZOpYj1yiA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738659903; c=relaxed/simple;
	bh=NDwu4ZrRPISU9qi/wnZ2zADZ8PQ6etk8lPQhZfxwq4w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=L6cdbhoS7GVXdkPPuboBLCvY1gN8l5gWbhLKq7BxxcmyjFcaZmDLdOSNYjjwlMwSWMlcp6y9ZMsTHudc4yYYqUm+zqA2twPGrjVvPzxFXiIqCmhkprshasXRdnzhOgNn7jS8AVwkGDg2Hfn8ihTb1hQxLRDk4pjMpjAz2fdS3No=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D0AHKZLj; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D0AHKZLj"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-ab7515df1faso39339666b.2;
        Tue, 04 Feb 2025 01:05:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738659900; x=1739264700; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0kI4NP1tXV9aem3hXqN6Du1n50W7pEZF96SEVciB8Ko=;
        b=D0AHKZLj0GVYnn79zjEmXabO6t0vrPfhLPrqpJeIRfr83aZct5z68foZpzISXEGZ82
         tIJ9357tfLXwWhOjiTjkfRBc0LHEzujoXRnbukgo4HAWlQJyjbOMBCa1E5XrJbnCxVkT
         t8jqZCFdhE02AdIqNAiYVdPxZPboEFcwGK7BD5w8QVXVIfabqzGKgqW0GisaaC/hxGwe
         dLJKfCbNaS3lS2QPEPbGCJ/pc7Hw8+dIW+j6liFrjYTM9zaItwfJuYIcSTWpkCn8uxD0
         r1KlIgWXvf3wgDSxE/vrinDZJqRUZf64xwcbdtHtS/nJfIa9GrkAu6be3XB8bpSUzoOS
         axtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738659900; x=1739264700;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0kI4NP1tXV9aem3hXqN6Du1n50W7pEZF96SEVciB8Ko=;
        b=spQX5NkhRzKUS/M+RC11wFBlkAJjaStLRL+bRGyrZrGMuCxWzjyo65KzW4Hry2oUK4
         w7AjQ3hKxbC3P5wj753dPcWEmdu53q52yNBSIZmXbKqC3sjati94I6e/hmKK5evtKqxx
         axnsyyx8dztMC/2om3uKT9EeUTjlP3bL81QcRVLVc6SYk8mktPK9OAtWzJOsCk20TT9c
         1IauIaNTyqQL1WEby3vxSrEVxnZ7Ocj5oY+NFDLfsYe/Z2z/o1wE4hPmUpZ9vX+YXEa3
         Pes7oK0TTpAgu5rzp8QGdsdf1xXHqn+27Q20nKS5uuRkWLGwPs/kcKHgBmwoUA2iNVlW
         Fb5A==
X-Forwarded-Encrypted: i=1; AJvYcCWPqEA8JeC0ZbXLhl/4n9eCGdpT9pZ69I5Ixh7Z9mmEr/mJl5j9xeAgY5mLHSV0ImPiW4AJ0tvKXhVP/og=@vger.kernel.org
X-Gm-Message-State: AOJu0YynkSYrG0YLLWdt4h3jOm6rIvIAonryopmzVm3HvJJ44eHbGsz2
	liLRFJKqnruxud0aI8HxyOWhN2VN/LusMNbA7KEI8RX7HWcCX1Vk
X-Gm-Gg: ASbGncvkPprFB3sDXZ1vumSYG5sKT+OCU7scPA4u7U0jwYkBXUm6gDuuvoYGjBfpZE6
	pOKoA5AxM0rJTQ010HHxfurqMUQ9sbXB5boe000Pb1VfuooyDBm1wdFlJ12XyycIjKnXMwjYpsh
	DFwBCJKyxhImEDLqw7ZEtt6BBPYdvJxUrNSzEUPj24f9WW1eLl1aM11DKRusCtZQtKjfiRPPUBi
	RS/Qu/tuHQ5qwogcKMrv3JDOfhibRnIyq47NDRmZnwqYGmD4aoGVFfcsqiIlau+ItKDon8BoMg+
	heTvDMvvTLLRK7jqtac2QHlpOkRoYayH26Xyw5jDakTu0IuThKXg
X-Google-Smtp-Source: AGHT+IG2j3iFTdYHrAUTP4K8oi4lYb6baPp04EFcHZ1LuOZiK2yq5dv01V1NQAJCbpvlrCZIAd+NOQ==
X-Received: by 2002:a17:906:f5a4:b0:ab7:4884:c804 with SMTP id a640c23a62f3a-ab74884c871mr289566366b.36.1738659899876;
        Tue, 04 Feb 2025 01:04:59 -0800 (PST)
Received: from [172.30.32.150] (bba-92-99-174-191.alshamil.net.ae. [92.99.174.191])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab6e4a326e6sm880773966b.157.2025.02.04.01.04.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Feb 2025 01:04:59 -0800 (PST)
From: Alexey Charkov <alchark@gmail.com>
Date: Tue, 04 Feb 2025 13:02:28 +0400
Subject: [PATCH] arm64: dts: rockchip: switch Rock 5C to PMIC-based TSHUT
 reset
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250204-rock-5c-tshut-v1-1-33301e4eef64@gmail.com>
X-B4-Tracking: v=1; b=H4sIAKPXoWcC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDIwMT3aL85Gxd02TdkuKM0hJdQ9NksySLNEuzVBMjJaCegqLUtMwKsHn
 RsbW1AMMYKURfAAAA
X-Change-ID: 20250204-rock-5c-tshut-15c6b8f96e42
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Alexey Charkov <alchark@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1738659896; l=1575;
 i=alchark@gmail.com; s=20240125; h=from:subject:message-id;
 bh=NDwu4ZrRPISU9qi/wnZ2zADZ8PQ6etk8lPQhZfxwq4w=;
 b=Z6SwL2znsuKUTw+uTTQ1+B4YWdVoaboy494h1y9Lv187OXEHVdaqeY76XpBkIVRLSt+U0dZlv
 GOmN+F8BhIQBQLSlJzSTFd+S5KOTPxqIgCLxOYV/d3x82dB6jUaLcaP
X-Developer-Key: i=alchark@gmail.com; a=ed25519;
 pk=xRO8VeD3J5jhwe0za0aHt2LDumQr8cm0Ls7Jz3YGimk=

Radxa Rock 5C supports both CRU-based (default) and PMIC-based reset
upon thermal runaway conditions. The former resets the SoC by internally
poking the CRU from TSADC, while the latter power-cycles the whole board
by pulling the PMIC reset line low in case of uncontrolled overheating.

Switch to a PMIC-based reset, as the more 'thorough' of the two.

Tested by temporarily setting rockchip,hw-tshut-temp to 65C to simulate
overheating - this causes the board to reset when any of the on-chip
temperature sensors surpasses the tshut temperature.

Requires Alexander's patch [1] fixing TSADC pinctrl assignment

[1] https://lore.kernel.org/r/20250130053849.4902-1-eagle.alexander923@gmail.com

Signed-off-by: Alexey Charkov <alchark@gmail.com>
---
 arch/arm64/boot/dts/rockchip/rk3588s-rock-5c.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-rock-5c.dts b/arch/arm64/boot/dts/rockchip/rk3588s-rock-5c.dts
index 6e56d7704cbe0dc06242cb39df56b2fc9d6bc774..00b2d87a6bce4af883a3e7c7e606ea5b96c68b19 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588s-rock-5c.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588s-rock-5c.dts
@@ -873,6 +873,8 @@ regulator-state-mem {
 };
 
 &tsadc {
+	rockchip,hw-tshut-mode = <1>; /* tshut mode 0:CRU 1:GPIO */
+	rockchip,hw-tshut-polarity = <0>; /* tshut polarity 0:LOW 1:HIGH */
 	status = "okay";
 };
 

---
base-commit: 6399b505aad2531d6244f3e943ad384b56095710
change-id: 20250204-rock-5c-tshut-15c6b8f96e42

Best regards,
-- 
Alexey Charkov <alchark@gmail.com>

