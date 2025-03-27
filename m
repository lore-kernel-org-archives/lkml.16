Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com [209.85.167.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 727DC28366
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 22:16:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743113795; cv=none; b=JznYooi+2VlejgpvrFHfk5+BoTTLvdenCZEy9XGJ1bj24LOpwTuYEMOrymcowQmKwyai+kMA9q0cq2TpM+OYnYmF0ROa/tMHKeEHjAM4zzv04UCBzAxTUujSV/9p3dL8V/BvkcZ9HjfmktERv04TH+eYgbbbeQRpO4MN8sgwxUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743113795; c=relaxed/simple;
	bh=fUh5GtfQfAAlwST5jSRPJgKqT0/rr26Ag5vsqVYRX5U=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=hVd6Sb3ybJ96zk1c03ZrWlgn8jENH3X/Kg2v82Zt7SfNB/8tYX5FDN4WuBKXs8HqTVM1hNWD5yoNIEeYvR2ORfu8gqwuuC0IH6nuOSuK0RB/RbFsuhD3VjwHRliqZ1G6yFAqOOuBAz3J7b77K9xCPdJMchnky8Tr54JvYIfhmtM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=JKtNFBuz; arc=none smtp.client-ip=209.85.167.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="JKtNFBuz"
Received: by mail-oi1-f176.google.com with SMTP id 5614622812f47-3f6a92f2328so827066b6e.0
        for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 15:16:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1743113792; x=1743718592; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BUptK6otSzyjdHzI4oMLC0OqmBTlOuKhDoyHAoxCs+4=;
        b=JKtNFBuzRQTGLnosCcD0sF4fHNh+yyvM6OgTRRPAoeqhsqoYCXVdNi+Bh7w9AhVXxE
         tr0EknKwA7kCRoxQNFMBSeM5HfW+IIsrheGxCHMJGcQpdaXSZEesDX2Tmk+WrRdYrBoh
         wPAFcEPEfjrfhrgCgUYnN3aPBV7vS2tpmzH+w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743113792; x=1743718592;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BUptK6otSzyjdHzI4oMLC0OqmBTlOuKhDoyHAoxCs+4=;
        b=RODXFoiK7zouhVBzUPVtHAE34qMFJVJsIVe6U+2aKqbEnCtjnnL9TtnotJULz3f2Yh
         f8Y+bIzdy5/luGrE1vsH/JuswZxKEqhwG77YUpLxapOY6+Smf/5ebrrXZ7jF8Sx4Smez
         rFDh9gRy/wAjFAgXDr0wPN0ik+yjw0JP8uS4XVt7ocBM+YXJjAQmAno4ZzBDCOlibk/9
         Cd3od0joXeF1mIZJqFybTHC4GP8lL3x6HzNoD+izYADuXGXn2m7ITva1mgGLATln2BCC
         tKgCfAkUmt0EVK5aHXjzwRt7E5ylkQco+rmRMOTQrbQi1u92RMnVyGK5AAEZO7y24mLw
         fE6Q==
X-Forwarded-Encrypted: i=1; AJvYcCURRmk7k18tn5BbvKGzBQ02+YbjU8xJlkLT+VrsJJDmaoAIlN98bBInwQvRfw5zla811BZjPoSAdCEk/JE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yym65b4a/dzqWkyPzD+T9xUaxN8Qtx0BbvHl379ROOOI9DsmwkC
	HOgcXxwI7Pa36oP3kId2/XeEq/olrjvXhIeaopKmzDudd+D9m9tmvn1flkY1hw==
X-Gm-Gg: ASbGncus2luLSs2P6JqNXIe6UK++OEVgSVXFQVrO2qHnEGkf+lOzcNd8uxeL8LiIPVx
	teZU0OBjOxT2ptR1ECPSTFgeERxO2pcJhkc+z2Tl00rXHE5Fdr1yCfVdSSK6dkPQ4cNWbO1aPOn
	gOnKjpsVyZ/GX6nBvwCYp9GfmwbDhHVb6W9bPppFIpVkfxSMFVO5DE5xswloOCLQ7npkNHpKK81
	Ga0UtuFr/88Ja6p9+lkyf7BseWrl4zNlvJJ8aW4fpvCBRkEkoFM7syw6zY5Oh3arMZhqjVwzBz5
	X6/Gv7ly2TqOfBTlHjrxrmFUV0tvEFQayCmnf/SeVKWFKrcnttwANxozAIruweQ3EvP1k/HJqu3
	PwkF6abtzXL1FZ+yS43d2Dg==
X-Google-Smtp-Source: AGHT+IFe9UwBGyHMUR53G94gdFaI8rhRZjDtkIMFykUA6r0ba851ZkOMzNTzDnJ9RtmV6lkufrRjbg==
X-Received: by 2002:a05:6808:3a15:b0:3f4:bc5:d47a with SMTP id 5614622812f47-3ff05f39b4dmr330200b6e.13.1743113792272;
        Thu, 27 Mar 2025 15:16:32 -0700 (PDT)
Received: from stbirv-lnx-1.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-3ff051680a8sm105031b6e.1.2025.03.27.15.16.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Mar 2025 15:16:31 -0700 (PDT)
From: justin.chen@broadcom.com
To: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: florian.fainelli@broadcom.com,
	conor+dt@kernel.org,
	krzk+dt@kernel.org,
	robh@kernel.org,
	jassisinghbrar@gmail.com,
	bcm-kernel-feedback-list@broadcom.com,
	Justin Chen <justin.chen@broadcom.com>
Subject: [PATCH 0/2] mailbox: Add support for bcm74110 mailbox
Date: Thu, 27 Mar 2025 15:16:26 -0700
Message-Id: <20250327221628.651042-1-justin.chen@broadcom.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Justin Chen <justin.chen@broadcom.com>

The bcm74110 mailbox driver is used to communicate with
a co-processor for various power management and firmware
related tasks.

Justin Chen (2):
  mailbox: Add support for bcm74110 mailbox
  dt-bindings: mailbox: Add devicetree binding for bcm74110 mbox

 .../bindings/mailbox/brcm,bcm74110-mbox.yaml  |  68 ++
 drivers/mailbox/Kconfig                       |  10 +
 drivers/mailbox/Makefile                      |   2 +
 drivers/mailbox/bcm74110-mailbox.c            | 661 ++++++++++++++++++
 4 files changed, 741 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mailbox/brcm,bcm74110-mbox.yaml
 create mode 100644 drivers/mailbox/bcm74110-mailbox.c

-- 
2.34.1

