Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB2F1298CAC;
	Thu, 15 May 2025 19:39:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747337986; cv=none; b=HtNoo6GxUKabQlasqsZDqupmYf6V7rwM/sQK5h2jnX8/UibeSm8YFL77I4Kl5xLARBXs7vdzQHLVTWUzJhTYCT+V5p5FUNVOVbd0+Bx3RgAJ9lUmbSpumnb5nVIQZNdnw06QII327+UQLEUVxrVRx+kRlDKZb8XtDYCQ+pmhPLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747337986; c=relaxed/simple;
	bh=ANAphqhg6ksWKFoUmKbpfjwBF/cQLekOGuxXp4doXfY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=plbOPuuSeB5Rul7wk4EsUpTn1A+4gmcfMk16bwQoakmXBwWBiVAB7rgWtrOMsFw8B8fcy2CHiY1wN1tLccDyTz9hLyv3JC3KGuAzf4uBNcR4O0DHJGO+V8c4X+mWzWKYI0pI8P5LObypFDduZNH0vioWvWm9DBwCAlUFZl2spEQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SEkKm7OQ; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SEkKm7OQ"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-54fd1650b83so1499512e87.2;
        Thu, 15 May 2025 12:39:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747337983; x=1747942783; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=egF95f1ZAlVnAg/IDDnMiAp99kBUtL1Ze5itVnmPs3c=;
        b=SEkKm7OQjjXZCVnTyjTvoKsxlx5tBzlxPVcw8A4cYddl4yL7aTze3K5L785r/q52Oq
         56IKuTrpT37eYm4nSPMFTvJwzP8qehyMuGCTngGTyhWcQeQsIcZZbw+BVUdsMQptCCF3
         2k56MOkNHlyoBwETIic7lDpZWhKpg6rKBIwpFyokbnr+kbznLXccjVGRrJWckh5W3WWt
         idw/0WP6+ck8PixvLqyuP4Qwgl6vsCo6P/dNQyrNkEVh46GzXUGnHiM/q1DqqefFDMDs
         Q8MedfxG2lVdElcJXjTu6uRGOOKsfQvwUyr/u6Xp2D92SIfJHKbCAZxq+59HybBSEY3z
         9SpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747337983; x=1747942783;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=egF95f1ZAlVnAg/IDDnMiAp99kBUtL1Ze5itVnmPs3c=;
        b=inXil6RL+tttx42OL2SkMAzJ1q/sOtolzaMjXcdS64yPmowP+2mzjhgGSBc6ohxPtV
         fYjm7/22j6MojvsovImo4WG7G9npz72wzQpUbWH3gEdAwiRaAAKXvB1AwC777uvL58uB
         ndTU16tG52Poo30zmOsQjYz7mF1VNxszjuxNzbTOEhnCRm70bCawCsWMvEQXgLeKjdIG
         GuHBbQN18GRVKH/lMciMYUhUzItw8IC7Dhy7ZplbAigr1QxjAwMbEbMufzxtwzSTOCvZ
         AlouvItLZZM0KIbnERVB3aUO7R6f0RZ2wWqKsKTpOcpVW9EuybuhTMEmIFkX9YHPIanx
         Rn9w==
X-Forwarded-Encrypted: i=1; AJvYcCXOwV99e/kNRUlP3OtzF0QtJMyFlhtMm9RKU/EcmrMqi3lEMBJTEbEnrGrSioMvoOauzhtuDsEEJRWI@vger.kernel.org, AJvYcCXlHlOyTzVGvZiB+woerqNArUn8qhMGseUgsE8D2wC7K1eWjDhDS0dMxEdt0imcjQeMVRZ1EI5qsNe8/I1B@vger.kernel.org
X-Gm-Message-State: AOJu0YyyMwC6QLvozBrLINfA1j93hQArB8Mm0VGpGEuy4CAwaLHGPIEA
	kfUmtVIjztYEAHO0hQcDg9V9LHb4aD+pc/RvIKU4Nf2AfmWVV3WUSxOwaIvjySMgove8Gw==
X-Gm-Gg: ASbGnctiZcHKW6mOomMyWe/V6CYmcW/paAbOjuGYIoRPPFGQSb6OE9h+oWiMhc4j118
	5gVWCueou/UKk83hwuA+7/AxkB+rgY90voo4QBZ0KlFmPB0GBnnEw/Wn9X+S7ecbUc3ruEDCsum
	AzMXd63DIa3sfMVqNxa44jUWO9nTG1eXzMVIjeIvzBAKfVrkvl+VBS/B8lmqbkbDPmjnKCq9dAU
	C/DS1PdVnd7Y5s7g06SMYYfl56VgXRU1q1RwiL3Ft9EvrExRGK5SkJlo00XvMOEqvij9d9XmUru
	rYobfa8TTt2CZYZub9rXe6JH5Q3N5FcXdfkiQwF2Bwc727ooeeoYoJkQNFF4G2qG9opCkKX3s0o
	=
X-Google-Smtp-Source: AGHT+IGUCsw8qFKpgM9j1qE7EjoAdo/69tOoN83Te1kLjkBgvmte65PM/krZlbao2WzUeXBu0SqdYg==
X-Received: by 2002:ac2:4e07:0:b0:545:5d:a5cd with SMTP id 2adb3069b0e04-550e7197912mr270320e87.6.1747337982796;
        Thu, 15 May 2025 12:39:42 -0700 (PDT)
Received: from NB-GIGA003.letovo.school ([95.167.212.10])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-550e703f544sm72297e87.235.2025.05.15.12.39.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 May 2025 12:39:42 -0700 (PDT)
From: Alexey Charkov <alchark@gmail.com>
Date: Thu, 15 May 2025 22:38:43 +0300
Subject: [PATCH v2 4/5] ARM: dts: vt8500: Fix the unit address of the
 VT8500 LCD controller
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250515-wmt-dts-updates-v2-4-246937484cc8@gmail.com>
References: <20250515-wmt-dts-updates-v2-0-246937484cc8@gmail.com>
In-Reply-To: <20250515-wmt-dts-updates-v2-0-246937484cc8@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Alexey Charkov <alchark@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747337978; l=911;
 i=alchark@gmail.com; s=20250416; h=from:subject:message-id;
 bh=ANAphqhg6ksWKFoUmKbpfjwBF/cQLekOGuxXp4doXfY=;
 b=HMN+PTA7l2fq8fgnNb6B7VWiPSWo8JlWLDM4GC9sBkw3DRQ1v2LAucZvWM9E5Dh1Yr/qW6Cez
 B88UnbrgDWMA873xwbvLjHQ1pxYYaSsg7etMQrKyCFq3BvHrSYrin+4
X-Developer-Key: i=alchark@gmail.com; a=ed25519;
 pk=ltKbQzKLTJPiDgPtcHxdo+dzFthCCMtC3V9qf7+0rkc=

Set correct unit address of d800e400 for the via,vt8500-fb node
in vt8500.dtsi. Note that the reg property contained a correct
address, so it must have been a copy and paste error earlier.

While here, also update its node name to a generic one.

Signed-off-by: Alexey Charkov <alchark@gmail.com>
---
 arch/arm/boot/dts/vt8500/vt8500.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/vt8500/vt8500.dtsi b/arch/arm/boot/dts/vt8500/vt8500.dtsi
index 30ebaaa1e5a4b53094b295570ab6e831acfb1c93..9b87b12897922b20be83d7df686dda713bb4f098 100644
--- a/arch/arm/boot/dts/vt8500/vt8500.dtsi
+++ b/arch/arm/boot/dts/vt8500/vt8500.dtsi
@@ -122,7 +122,7 @@ usb@d8007b00 {
 			interrupts = <43>;
 		};
 
-		fb: fb@d8050800 {
+		fb: lcd-controller@d800e400 {
 			compatible = "via,vt8500-fb";
 			reg = <0xd800e400 0x400>;
 			interrupts = <12>;

-- 
2.49.0

