Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20FD11F8676
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 14:38:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750084734; cv=none; b=sIC60gULwQozh38+MLz79byqagZVA1NF6LRzyXO1HmPzVYEXwjsOpg0dfvDAO1a3nJisxHblxpbBh+PQPvWrBTWFWy7h0RHJlfeQrPW1SGtp/AOGxLnIlDGqx6SnxvZm61dQCk6uIrFWKFBha4HLJdRB/Sut3Rtp82wYqFya9pE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750084734; c=relaxed/simple;
	bh=ytjfmtK/XdCP2wuHUwDkdi5kPia1J9R+DeT4RG9dGAA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=deTwcSnjPJH4RXt8RtgzLRyg8OshyhL4EyOu28H0QwSihCUZyxM8gXtFTg5KIxz99eiLERqJ3baVayx2lraGoyJZg4rRoyFzpg0ZGUW/Im1Y8eqqQ19OXQE7T+bVqcNclOgmNjHlB9lYml9DGyL+wHOUN6aJaBT2dgGeUF6l3R4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=EIn/VDUR; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="EIn/VDUR"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3a54700a463so3330806f8f.1
        for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 07:38:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1750084730; x=1750689530; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gWToLPQVitiBw5bzYj/kjSaIU+PcrpH2/GQkA5MT3qo=;
        b=EIn/VDURJ/pEmfl1IwDXo0UtU/zvPgOMZldIkDL0mkMIO8cF8XsZRraKRvB0riqfXW
         ObzsPB0h/7v227+3XIL15j1VucsxzEX41A+WnUVRZjVpChNxWgJZmpze5SnPy5onkGcA
         yJS0gYD0t5TW0gKFBWBO46o9K7qGbVbdwWpwHLwELWee4A5fPtroDTBBDo1NtcjOoCSv
         vTi2YejmYUud/uG5Y++w1YR4GnuvzaqT8PdtbCXbZttwAAg0ACZI+hSkIvCdNv7CR24Z
         YFDI8wOdKE1GLKjOKPvp6JODud+CbtxQcPTNF1q6d5Fuku1oyijmig6YqdN2Gbvugb3O
         +Svg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750084730; x=1750689530;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gWToLPQVitiBw5bzYj/kjSaIU+PcrpH2/GQkA5MT3qo=;
        b=QL18KgZl5rht7HYyQz6q4LqMsTHFDi6/15f/KeNBYXTrmAV4iPXJVSvRO2ye1QSuoE
         zi96SnmHdavUdmxaeoTJfRO16uxeaCVNLRG07LhN5mrf2slwBU8xDi/tvgh331Mf7Puw
         N5qQT3iItru2RKC/7OmecZoG6zTxaTqQGo5NTe44Kqq4m/TGCUZpEAZRkyJqGysT4EV4
         y8LcSGpYYPaMDdXo6dOlQ6WxmKm+5P4v9cCO9MLO33cB15f41FtTFOwv/1yWjP+ZRpCq
         iviqM0/Qq18ILWLk0cWFvNW1dBxTlZiNqoTjxq2Eq7+1D/QoeGjwL2fs+3FieDYTMQqX
         xzyw==
X-Forwarded-Encrypted: i=1; AJvYcCWobLk9yoyjKNsIxCpVI/QqLM14s9F86oEDkzu2k3koxSzsZDF4IwFhmYGtY9lHtsFRYMOUS30k6kxG5QU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz346gMiPYJgXoWyjW7Zx67s0ZXIhCDbcTHR34/TeimPl/Kno2x
	48ZI3Me9JfcFqQ0AArtE668lRVkVYEaTbCbeFDDanHvkACrbqz2fzDNACmESrd+3MScTWi5EJWI
	//qnlKKs=
X-Gm-Gg: ASbGnctmePzCdA7AE01X2P2d3EZzipGUEAuvi8QlbPtlmI8cKP4v40DDi5Cb1mTBycP
	tTgklMAP0BL5Bw5VJm+IyMH9xZpqsErtOjnAFpM4lyhxHcAbPR7CYNjZVbLZE/uWoUN6AdSHCWy
	PauzopA8LxbuxbF9gEubSRohCuIoxbH6s9ffuPIakAZvt3fgAGGwYYWsALC9crbBx3YZ6kZxKcc
	EgL4ta36Al23bu7DXhUrCWEElrVE9Y4Z7cs32FrE56DkhwMyE5gIbN4nQKp6SFaoU/ZpYQyJq17
	HPLl6NXe6BeqdtQtt0MTU/gU7F6lPCg99RSS5wnLHVBrZtRvRpJ41lKQ5ax0mzJ+yCKGUa+9/+k
	Zrc6fRUgbbx0igI8x44VmdCBj0MVUWncrMlc=
X-Google-Smtp-Source: AGHT+IEGRmeB3oMKleC3pKBVMBYu/8jfqnCCDOYSgFOyYxzD5mJZV1fg44FKowdo55Cr1jLuHCyDjw==
X-Received: by 2002:a5d:5f54:0:b0:3a5:1397:51a7 with SMTP id ffacd0b85a97d-3a56d7cd5b7mr9274661f8f.7.1750084730495;
        Mon, 16 Jun 2025 07:38:50 -0700 (PDT)
Received: from [192.168.42.1] (88-127-185-231.subs.proxad.net. [88.127.185.231])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4533fc6578csm77990485e9.19.2025.06.16.07.38.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 07:38:50 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Mon, 16 Jun 2025 16:38:28 +0200
Subject: [PATCH] arm64: defconfig: enable Startek KD070FHFID015 panel
 support for mt8365-evk
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250616-display-defconf-v1-1-c9c269c9c27b@baylibre.com>
X-B4-Tracking: v=1; b=H4sIAGMsUGgC/x3MQQqAIBBA0avErBNSSqirRItRxxoIFYUopLsnL
 d/i/wqFMlOBpauQ6eLCMTTIvgN7YNhJsGsGNahp0FILxyWd+AhH3sbgxTTibJCkMyNCq1Imz/d
 /XLf3/QDaGjrrYQAAAA==
X-Change-ID: 20250616-display-defconf-54a9bae1db4a
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, soc@lists.linux.dev, 
 linux-kernel@vger.kernel.org, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Alexandre Mergnat <amergnat@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1487; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=ytjfmtK/XdCP2wuHUwDkdi5kPia1J9R+DeT4RG9dGAA=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBoUCx5eXjdcOVffnq7WXqqYRnDsTdZZj1URCBrdgGb
 xUNVAA6JAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCaFAseQAKCRArRkmdfjHURbu8EA
 DHfrZk940Kjkbb7HO3M0y+77ll7StOw6cYtUFU60Y3f0qJy5Uzt49F0AcaoWOICKDrI5rsE0R9CoJ+
 rarUxHOdagpMdKzJe+NbD14e7yujy5McG2KgSe93nPok6kt4Vb1POkq8sb1tbPS3gojF3Gf1mCPN9I
 zEM0mW3pMX29/LOiRnbfRFVU5hXbUh7uIVIzrnYH044y7F9sWochwHdCTKnkCg7z6i4gqbyhpf5f9t
 /UGOE0UxEdJSMWGQZWFkV+OwoPiew+VUWeg6qnJJrNt+S4+bIXftIpGc1UwMmQSeRkamV+ZMMtKD5u
 bOuQlkODD9zAiI+9MMwyBEu42Y1Jiv+4tNARQrtLUKDS4Up2soTHjqyMpzxZ9brKcQZhhdGFpxjV7H
 KhjArSXiUQS9IivhhJJfQufiMlZmpB50pB0jALEzfa9v/pH8QLAqbMQSSpl3znRsq8ixBLP5UIBnPJ
 Xcvk6+6bniS+K+oK87xGvuTJGSnaxXqESOwgp6wssmvRQCzzh75Y495vK5Mmw5HLtDwbUqtrprgzik
 gMN4yU94JQaUBup/uwfZ3hb/S5VgqGYXx3FY9mU3GzjyICzGlCEmHTYfv1lwLR0MPqEKzkax/9IUv7
 fthBOcdg5fZGwwWFLcmUCUWN1oGPhm0ctSoS1WGVlUW7uL7iiqiO4neOMqag==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445

Enable the MIPI-DSI display Startek KD070FHFID015 panel to have it
working on the mt8365-evk board.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
This patch come from another serie [1]. Since doesn't depend to the
remaining patches, the defconfig change has been splitted to this
new serie.

CONFIG_DRM_DISPLAY_CONNECTOR=m has been removed after rebasing because
is it already on the mainline.

[1] https://lore.kernel.org/all/20231023-display-support-v8-1-c2dd7b0fb2bd@baylibre.com/
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 5bb8f09422a22116781169611482179b10798c14..319d1899348bf6b6c26362c9b4fe7f1da917769a 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -914,6 +914,7 @@ CONFIG_DRM_PANEL_NOVATEK_NT36672E=m
 CONFIG_DRM_PANEL_RAYDIUM_RM67191=m
 CONFIG_DRM_PANEL_SAMSUNG_ATNA33XC20=m
 CONFIG_DRM_PANEL_SITRONIX_ST7703=m
+CONFIG_DRM_PANEL_STARTEK_KD070FHFID015=m
 CONFIG_DRM_PANEL_TRULY_NT35597_WQXGA=m
 CONFIG_DRM_PANEL_VISIONOX_VTDR6130=m
 CONFIG_DRM_DISPLAY_CONNECTOR=m

---
base-commit: 0d8d44db295ccad20052d6301ef49ff01fb8ae2d
change-id: 20250616-display-defconf-54a9bae1db4a

Best regards,
-- 
Alexandre Mergnat <amergnat@baylibre.com>

