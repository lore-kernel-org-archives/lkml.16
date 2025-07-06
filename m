Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C70192E36F6;
	Sun,  6 Jul 2025 02:57:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751770634; cv=none; b=rzLGUBH2FgcfGGqDOgqt9epD9PGu9RAsX8gsITT5G8Y67gZk9Q6aBmBd7rZW4KXki8Woz8gR9kIHuxnvJRbEh3DbI/RRnDNCk41pRKQkX0Rd2mnv3fNTwxJP/5rn55aKZGxZzDSkq9Q9ke3SwysbXCDnEikRZOWHmmyX4NVyWXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751770634; c=relaxed/simple;
	bh=CGe/rgczZVclez4vXhm9vtTagkppEerQab5ddWg0Tgo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=eR3fkqyzCnq6gyTgwGEI+/ojREwRDROQ2DrxuET7sf9ONIai0AQAQGyIQSWzvWHvOj1nXotUlwDn0J3cPKzmjNkmzdunbSLY2RFAso/K/ieOLVLHvdVuzKAt4LDLxkiVRhM9fhgXl8wUxm6xJakdmQ33d290Bf7yBKlYH/emoQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VDEKjFvS; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VDEKjFvS"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5562d8c8970so2059038e87.2;
        Sat, 05 Jul 2025 19:57:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751770631; x=1752375431; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Rn7t5Vn8pMvyg/GganPpfVWGq9uNzUBvg+YEuGMms78=;
        b=VDEKjFvSd2or94I3dZ1aOjWQIliPTVNeDufMH3meXZyrKsD7GAkQvjoFUzMj5gml4E
         lBcPP5vknJI/inKIydqpvevnzWZE1AudId0UJvrO6rRAqmlSlSytORqRRKGgYGdvXs71
         Nl/cfas2alO8NsWSZvVYoZ6wEX8odEfVTQY8fW4b3nO58DT28gCTmMygE4JsQnraYOdP
         KJknjB8+QyIabI4ao5IhXL+vQHG/3FB5ILQUb+t1vTrD0IcP7n5zmIg5fF3PHmkbD+vj
         Zuexu8Wq7Gm5XtUIvXrFQ1IGmROcAkVkg8aJPIUBivUmHJahWG07BoBrO4Hys8gQl1dz
         YfNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751770631; x=1752375431;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Rn7t5Vn8pMvyg/GganPpfVWGq9uNzUBvg+YEuGMms78=;
        b=oYpUysPvK8RHwsf79poH4PMI8ajUMNH5ruzEobePF9druzqJRYR+sZ0x6mzwihLhRq
         MGpyFcUdXEVxE3emiwq9qKLfrE9H+rjaZZutMC2Mq4q0jI2ZO15ORoAOs35Cp1eQOMlL
         NU+hgnROiB5lxd7CsJghdeTVWVKwJ9SQ78RdREKkrTU0ZTqJ/XYfl4kBUCv3AkfzsZbW
         CYFPTol4QTfOzb9peVpVtHtoosFaYD4fUm3qqMabL6hAo2TtTshYkijFhlcT2s4hfDqP
         mgHeEZGRV/RO2XIEGShH/oF5GB3NDjs8n2kiwOkEdH+KXASAAwqKWnLFU+znlxMAxnM6
         eAvw==
X-Forwarded-Encrypted: i=1; AJvYcCXdzbN5BLa2gNavI5+YmZm+lSWeS50yKvXOFjZv5OpiCeve3iCKVGJk0IARHxoPDEK8mOPJk/5UkdPiiIA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzOVWyr1jKz6AjFpPwcCnMbOxQqthm0nm1EQQm7T1P74zNL5589
	63ZlOJQyqdsb22Yfnxr01sYqcAxFBBd93xH9zzvYiZTLgZGME1M/UE5ZR+42TNgrwmc=
X-Gm-Gg: ASbGncvyYTkZHEzxtUMYR2oaGIGUmu++6/Pce50mpVzVJUd4q+OjaVIeHPJfwom3wVP
	P/KnNKQJOielG/OLBODTDYkUCZ9WK+OxWuKWeeCeRZgdDWl+xHV2m5qoSBchBEhJcW154k8qVnw
	pU1P/i26n2Tvq9V5/neBIk2E0HMLmO6OkJt9dtoicqNtlk9XBXNR11ZmPZoZiga9Qn+i5Tf9eF7
	6mzfWbx2cLxthgDYlgfOSdU+5k8Q0uuXmJtUJplb7Y7YJFSMlTVYeVz1qG1zmTrMYfeqbwAvNyW
	HzAkWjqzzfg3AlRaWUx2kJHx5InUKOC6HebggWBJ52pu2qK71ymT0jp+6huFax10Ho4hwXs=
X-Google-Smtp-Source: AGHT+IG7c6DkgUdK6MlS+lGxlxrwGbt7Tzq4+q56B2tWzJqubkeFQQPt3FbCuONr9HeiGCNfS1d13g==
X-Received: by 2002:a05:6512:ea5:b0:553:a32a:6c2 with SMTP id 2adb3069b0e04-557a1235e5bmr2012238e87.6.1751770630659;
        Sat, 05 Jul 2025 19:57:10 -0700 (PDT)
Received: from localhost.localdomain ([212.192.12.80])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-556384b7b4fsm788573e87.198.2025.07.05.19.57.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Jul 2025 19:57:10 -0700 (PDT)
From: iuncuim <iuncuim@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Andre Przywara <andre.przywara@arm.com>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] arm64: sunxi: a523: Enable Mali GPU
Date: Sun,  6 Jul 2025 10:56:21 +0800
Message-ID: <20250706025625.2707073-1-iuncuim@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mikhail Kalashnikov <iuncuim@gmail.com>

This patch adds gpu support on devices with a523 processor. Since there is
no support for image output yet, the gpu is disabled after boot up.

$ dmesg | grep panfrost
[    3.826968] panfrost 1800000.gpu: clock rate = 432000000
[    3.832305] panfrost 1800000.gpu: bus_clock rate = 200000000
[    3.838353] panfrost 1800000.gpu: mali-g57 id 0x9091 major 0x0 minor 0x1
               status 0x0
[    3.846050] panfrost 1800000.gpu: features: 00000000,000019f7, issues:
               00000001,80000400
[    3.854134] panfrost 1800000.gpu: Features: L2:0x07110206 Shader:0x00000000
               Tiler:0x00000809 Mem:0x1 MMU:0x00002830 AS:0xff JS:0x7
[    3.866011] panfrost 1800000.gpu: shader_present=0x1 l2_present=0x1
[    3.874108] [drm] Initialized panfrost 1.3.0 for 1800000.gpu on minor 0

Tested on x96qproplus and walnutpi 2b devices.

Based on v6.16-rc4 with patches:
https://lore.kernel.org/all/20250628054438.2864220-1-wens@kernel.org
https://lore.kernel.org/linux-sunxi/20250628161608.3072968-1-wens@kernel.org
https://lore.kernel.org/linux-sunxi/20250627152918.2606728-1-wens@kernel.org/


iuncuim (2):
  arm64: dts: allwinner: a523: add Mali GPU node
  arm64: dts: allwinner: a523: enable Mali GPU for all boards

 arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi    | 15 +++++++++++++++
 .../boot/dts/allwinner/sun55i-a527-cubie-a5e.dts  |  5 +++++
 .../boot/dts/allwinner/sun55i-h728-x96qpro+.dts   |  5 +++++
 .../boot/dts/allwinner/sun55i-t527-avaota-a1.dts  |  5 +++++
 .../dts/allwinner/sun55i-t527-orangepi-4a.dts     |  5 +++++
 5 files changed, 35 insertions(+)

-- 
2.50.0

