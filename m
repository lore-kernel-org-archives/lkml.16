Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D54D11712
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 03:56:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.122
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749527779; cv=none; b=s3Is6wdH3264wyqont/kWN8cT/f8IVWDQLkNyzuSTtWX6mFiApuBWQclpPNmToqyU9bxpLXUNPdni/THTKpqzZXcDySXlt+y7691KbMM4NnKKiXMdT1dzYTqAmaWpY3wEzgPCE1TFG6qzR1SRtHuBpxuNe5ZP/amlfX9xq8xVC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749527779; c=relaxed/simple;
	bh=mk//4e0lexN75t3KGWtP4llZR5wKNTTSc4upny09zi0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=nLU6CWDRliSb8HTGebuOfPVjaSTOsIvZwxQpbYXNGH1UopacNpoJvhAr67ppJHKX5qCbdCTB6mCa/JRAkqgyIPVQyWPEw6cYAiZdvAilb2j2eIY/o4WgGzuZa4h9ledTR20hiBLOMegLG5woHd7x1/QAEWvDmiurAGsG1RsB2N4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=k9b1QOc4; arc=none smtp.client-ip=185.125.188.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="k9b1QOc4"
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 26F69446F8
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 03:56:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1749527774;
	bh=6f8UfXSCXcF/uODMP4YgdLJixKlcv1NebpTVVogDgYY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version;
	b=k9b1QOc42excHI6+rhvTa/2iAYz9AHYPhEEco9VAP8JHjEp8Uz6RTJei4VJuqr+c/
	 zub4r5WSPLso/zKCJ36V8Xo7c0oEsj1Y7TkcD/cbFc7NPUVHbhRxA3zcglOCEBqTDY
	 /Kn/lhWF9bVt3nuwDO7vl2jMGPLPKqrEE7Hj+69/1CxNGPzuT+WPXlH6WpfoTkx6M6
	 muki1yHVzyTvQooDL62Q+n/Ro+zSYpsrfvUG3vH1JTx/3d2BciC6WD/2MA5e7D4kOo
	 5dWkmo2/W9U3raPKU/2e7+BqCiulP6RpktkEKefuV/gKeLd+ttHuLlG60JvqPYZUQu
	 1hND2VMjzoFpA==
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-747dd44048cso4044827b3a.3
        for <linux-kernel@vger.kernel.org>; Mon, 09 Jun 2025 20:56:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749527772; x=1750132572;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6f8UfXSCXcF/uODMP4YgdLJixKlcv1NebpTVVogDgYY=;
        b=vktCDo9gUJDZvVwAVcfowGBsjZAlplBjX2xQxPy1hz5ZoGI6U5a4JAUmjT789sSrKl
         FNg85XzaO1ZbhP85rEhSIEkkcwASQ8da2sl5SLy0WcyLWHCl/IRHS7NAlQuAssprQYvJ
         6sJjyCrTPqm01brRltKPZjkwr4+5Kb5bb/6qqQByuzFeqipnJHF/j3d7gtobsDwHQDIC
         /bsixMT27xSIzx37yi36pk1RaNs9avSxfpoJp/ARcQ2by4FjktgnU4FJFhhIDNQ8NTgX
         M3BNeo9dh7Rf0JPH/fe7W2YNNMNbtiA2mznLinA94CaN+2pzCfoePOwRHquOiNbbzLNo
         29ZA==
X-Forwarded-Encrypted: i=1; AJvYcCWYtRxcBiaiHOjKmsQmomlxU7Yxi2u86C0vC2sVVImrLNG4WSOL2wYwZ9tdIaTdCzcFtMMdsIWSqkl2G00=@vger.kernel.org
X-Gm-Message-State: AOJu0YzefmXxPAUpPFt3TDuSYi3bjMdCJat2KuSiiENo6RCce6xR1813
	0gGfECq1b7lIO//rKC2msvEcA4HYfusOOykmlRB67qAVWiAdGp2z7RxJ7/6XldCRZ5UxVvtRjxU
	W2s4Yy/gpC656nIME7YkhkiiL+ugjviw6SNFSZILVA3dwGic14e9VIivpm5Nom+dalT/6cggo56
	psNgYvhnxgk23FeFQl
X-Gm-Gg: ASbGncvBukgxghW4B0Xfsjk2c7gea0dwxD1Px6YRxLieimYH+sHVxfJIhSTKBkBnjZe
	+ULiu2UvgQ9JV71PcsXRcOcpWqHmEaTlP7RrUiS3vPTAoBX0X5CjQn8ZDeAr111Qgl2pEgms+zI
	MVMhNfRP79IV54eIsY9Kn7fChsaGoPsMtjvpMDt3schC7PbCSwPb1inOmkhloKmgFncQnw/2gCe
	IXeLMaLgVYyGTUaipNLLUS89UGCJbKEiSKXAcfgYrUKPG1GZkyNVR6VgmvJcYTLDQQOdDRK+q3U
	j6Rc5i5Xzdnj7miRHhTceyshUH7pYjcgYVzsLZ4mCi4VSsqC9Wtz9FpPYjkP7AYsMw==
X-Received: by 2002:a05:6a20:6a1c:b0:20d:df67:4921 with SMTP id adf61e73a8af0-21ee250ce37mr22866999637.4.1749527772376;
        Mon, 09 Jun 2025 20:56:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHbdZpn/RR12NhB5LgcOMPREv1z+WRxpq5szK6Ofm1MM4coyBQSPQd9Wv8KNZFI5ZUjhjd4AQ==
X-Received: by 2002:a05:6a20:6a1c:b0:20d:df67:4921 with SMTP id adf61e73a8af0-21ee250ce37mr22866980637.4.1749527772030;
        Mon, 09 Jun 2025 20:56:12 -0700 (PDT)
Received: from u-XPS-9320.. (118-163-61-247.hinet-ip.hinet.net. [118.163.61.247])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7482b0c23f6sm6468279b3a.119.2025.06.09.20.56.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jun 2025 20:56:11 -0700 (PDT)
From: Chris Chiu <chris.chiu@canonical.com>
To: tiwai@suse.com,
	kailang@realtek.com
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chris Chiu <chris.chiu@canonical.com>
Subject: [PATCH] ALSA: hda/realtek: Fix built-in mic on ASUS VivoBook X513EA
Date: Tue, 10 Jun 2025 11:56:07 +0800
Message-Id: <20250610035607.690771-1-chris.chiu@canonical.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The built-in mic of ASUS VivoBook X513EA is broken recently by the
fix of the pin sort. The fixup ALC256_FIXUP_ASUS_MIC_NO_PRESENCE
is working for addressing the regression, too.

Signed-off-by: Chris Chiu <chris.chiu@canonical.com>
---
 sound/pci/hda/patch_realtek.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index 20ab1fb2195f..055fddb93982 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -10894,6 +10894,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x103c, 0x8e60, "HP Trekker ", ALC287_FIXUP_CS35L41_I2C_2),
 	SND_PCI_QUIRK(0x103c, 0x8e61, "HP Trekker ", ALC287_FIXUP_CS35L41_I2C_2),
 	SND_PCI_QUIRK(0x103c, 0x8e62, "HP Trekker ", ALC287_FIXUP_CS35L41_I2C_2),
+	SND_PCI_QUIRK(0x1043, 0x1032, "ASUS VivoBook X513EA", ALC256_FIXUP_ASUS_MIC_NO_PRESENCE),
 	SND_PCI_QUIRK(0x1043, 0x103e, "ASUS X540SA", ALC256_FIXUP_ASUS_MIC),
 	SND_PCI_QUIRK(0x1043, 0x103f, "ASUS TX300", ALC282_FIXUP_ASUS_TX300),
 	SND_PCI_QUIRK(0x1043, 0x1054, "ASUS G614FH/FM/FP", ALC287_FIXUP_CS35L41_I2C_2),
-- 
2.34.1

