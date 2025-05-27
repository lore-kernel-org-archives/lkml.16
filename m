Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD6941F4174
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 06:54:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748328896; cv=none; b=U13drn0NugQDGL7GhU1C4/eR2XBQdbcAUvgf0u11ktJ2M7LZwGQ7bou6YHcgt6zKjqleYl8wOXwuNhZRcZ5re8P9zWJhb0uF6x60TJbUjsd2V1PerJyP++CamEjoes6U64GtbfjR/X93qEXrbXmQ3w9AIFYmf4Oit+POWcCdPX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748328896; c=relaxed/simple;
	bh=pueDU+2IVTTmzOG2Vomw35iAiyVvIagwvaJGKUbfBiQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=unGroVVRAF95GjWFtsbHeuddF1AdDjNdHc1v3Ha+D18zvsOaHqoJu31FlpKyIunYk9/AvLAoql9pcu3Azdemq6MiFAohs1SjLVYFlspLNpgIinvOjgzciuWAUcC4vkp7KG8c9Lb0udlYxxjEmOKq9Jm8/XLuSII8bEDUDkQmAfI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=EWTA4Sy5; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="EWTA4Sy5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748328891;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=SVUV/9vsn38+LgyadSljJNqJbaXdm38PmYNVYcVKANU=;
	b=EWTA4Sy5jW7FA4kFoOECr3Ykn8Hh0j3EZnMIDtT+92liYFZrTOeQvG5lYQV+FRnJKpmY/M
	bofzqg+Gt1DXBKyvUpZWjXO/9CeFSdPBY2QU/v5CE39KbXGiYmGBFHgqFaadd5eqDPBUOO
	7tWcHm2SlyqKsNvvVmfv0Lpr+eFRfp4=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-118-P3jcw9h8NHyv2xx0d82p6w-1; Tue, 27 May 2025 02:54:50 -0400
X-MC-Unique: P3jcw9h8NHyv2xx0d82p6w-1
X-Mimecast-MFC-AGG-ID: P3jcw9h8NHyv2xx0d82p6w_1748328889
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-442fda1cba7so13596965e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 26 May 2025 23:54:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748328888; x=1748933688;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SVUV/9vsn38+LgyadSljJNqJbaXdm38PmYNVYcVKANU=;
        b=Sg5cJBtyevG3YVrUjxwqnjgq4+9CDjAgXr1CJl/W7MEbbpzma5zQJefLaZGp+0yNw5
         uzQbPQCgSDQj5opsrSV3WsUx4Ya14+YlsdUYaL1MK4Q5FMYqV3iTnlflUXYiSsUZ22LC
         Ae9RQ+ZbSSq99Gn3Dcvb3CSZYvr0TTb4/JRZBYho32zpogELQPAO4HHp2trHeyt6g+Py
         xEdV7KaWSDHsKNLdLvW8iAttbP1Qh/+e861gxvEY9qTVboIvF/YkQYHqndzdcH4F0ZkY
         f0bZK3X6JZ03d1OcakOvPfq1k5PKK++5+dZHqWrkWhja1n05DrpAv2+BBUa4F2PszOQ9
         H8vQ==
X-Forwarded-Encrypted: i=1; AJvYcCUmpiqdwFPKKdcxxop7tE6JprpRX6xRV7/q9mZSbfG7Z/idVFCG6AGXFEE/23lwIdHPxpYSUlhszP8yCbs=@vger.kernel.org
X-Gm-Message-State: AOJu0YxmtXpSAMEVrPhbEGZxgW+HlgKfPJsIvdeCIfBkqG0jpGH+kGAL
	87ssqcJoJTpvjTvYfji+/VWjfz2ktn2Cp3E/NOaL09tQig1/pjAE3EPPwJ6PGEag+zF4eoqsCus
	15zUqTW1L97icNi3CuVryrTiCZ0ns8sGIFovqA5B8qQrjSr87Hr6SGqbgex5gyUiVVw==
X-Gm-Gg: ASbGncs2vAcp99Eg0JpNcZ00oTGQ5Uo0Fq8MAExHFL00OXp6G3gFVcbSnAOZKKssnnm
	EBqqnR/M0J1Jgujdds1xbEWb9+pG9PRB/C8p81h6fFSQWvcOrXm3mXAaUhR7PLdsFHfaSE4q7sF
	Obu7yOTipWYkeZs/6FXSjOnY9mfXMsFL0E0+Ob3uDBB2K/0ZvtBfLGa1yPwZgsmMEAbZTEpOn2X
	9aaamEBEdP1K1rXb2KOns6PZ8ruQMRG+/MxEtf+QToTSKbxP6qFsHl84/pZCKfDYUaaGxTIUK/E
	bzL7t95svwbKELsRzLb34237OWsOdNvjUDl1mfTt5/NzzzNjGi6IKm6rudk=
X-Received: by 2002:a05:600c:8187:b0:442:f4a3:9388 with SMTP id 5b1f17b1804b1-44c939c1165mr82543235e9.19.1748328888621;
        Mon, 26 May 2025 23:54:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEdvlq2u3HtOzGNrDrF6DdnIHv/xATBiGmzadzOCj185iZIcGz3tFT0jB+qadEvps/mZddgsA==
X-Received: by 2002:a05:600c:8187:b0:442:f4a3:9388 with SMTP id 5b1f17b1804b1-44c939c1165mr82543105e9.19.1748328888257;
        Mon, 26 May 2025 23:54:48 -0700 (PDT)
Received: from lbulwahn-thinkpadx1carbongen9.rmtde.csb ([2a02:810d:7e01:ef00:bf5b:f273:a506:f71f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-447f23c07bfsm260066835e9.23.2025.05.26.23.54.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 May 2025 23:54:47 -0700 (PDT)
From: Lukas Bulwahn <lbulwahn@redhat.com>
X-Google-Original-From: Lukas Bulwahn <lukas.bulwahn@redhat.com>
To: Matthias Fend <matthias.fend@emfend.at>,
	Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	linux-leds@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lukas Bulwahn <lukas.bulwahn@redhat.com>
Subject: [PATCH] MAINTAINERS: adjust file entry in TPS6131X FLASH LED DRIVER
Date: Tue, 27 May 2025 08:54:34 +0200
Message-ID: <20250527065434.202622-1-lukas.bulwahn@redhat.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lukas Bulwahn <lukas.bulwahn@redhat.com>

Commit 0d12bb1a7fb6 ("dt-bindings: leds: Add Texas Instruments TPS6131x
flash LED driver") adds the device-tree binding file ti,tps61310.yaml,
whereas the commit b338a2ae9b31 ("leds: tps6131x: Add support for Texas
Instruments TPS6131X flash LED driver") from the same patch series adds the
section TEXAS INSTRUMENTS TPS6131X FLASH LED DRIVER in MAINTAINERS,
referring to the file ti,tps6131x.yaml. Note the subtle difference between
the two file names. Hence, ./scripts/get_maintainer.pl --self-test=patterns
complains about a broken reference.

Adjust the file reference to the intended file.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@redhat.com>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index e20de38ffa54..0c4f0eb7f49c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -24518,7 +24518,7 @@ TEXAS INSTRUMENTS TPS6131X FLASH LED DRIVER
 M:	Matthias Fend <matthias.fend@emfend.at>
 L:	linux-leds@vger.kernel.org
 S:	Maintained
-F:	Documentation/devicetree/bindings/leds/ti,tps6131x.yaml
+F:	Documentation/devicetree/bindings/leds/ti,tps61310.yaml
 F:	drivers/leds/flash/leds-tps6131x.c
 
 TEXAS INSTRUMENTS' DAC7612 DAC DRIVER
-- 
2.49.0

