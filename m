Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CDF32451F3;
	Mon, 30 Jun 2025 08:02:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751270532; cv=none; b=knfuRImSUaoxmSLkjt3c0jVT3Z23iOg9RgY5qenBbAKOrV9zJAdY3/ySHWlz0KpKz31wiEbkLG2IIYHAHOIgEbgrvkyoiokZP/pT9OWptyhzvbBDaN+fNge04t77mZ/m1aTIYglCSL8C4hpjdD9zzhYRtqHJh9to/BVcLbmIFYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751270532; c=relaxed/simple;
	bh=hOd6+qOcYjH/w/j3ddYeY0GLTSBfqJE3weH99urGytI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=C3FqkbRIsqifRa1J8w+0Eroqi1VJj3uZUYs58tS5Kyyl3YW5TFly1YL0qYCtk7mUIyMMveOnotKOhtT+7c/rbVz97G8APYJa/vx0HujcRXaCGFFiGqjO3ayVnXffjzIB1bEUzwcbP0GajwrfM/GQYWiJ9DKbIedx3aIq8Zw6qNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TSd0dczX; arc=none smtp.client-ip=209.85.219.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TSd0dczX"
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-700fee04941so10116806d6.1;
        Mon, 30 Jun 2025 01:02:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751270530; x=1751875330; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3DnWNuVGlcxt97iON5+GLNil5h81EohwejutmAGRqZY=;
        b=TSd0dczXkhd9GywGbJfI7e+YZ9Eb4erqrzUbded1uNz8Gt1QU1lV59iza4C5hAAkre
         a8FVeR/BFQGJ+p4bNOdZEnI+plzdTmVQSD23Y3IDUfwNhxpzwgwqtEUCtu8laxx3oz+Z
         iEcCxCaKpz2y4jUsB3rOQk6w6BAbJyeoUtKK6mQtX38cOyedgDhZ6fgEwy3Ytp5H/Vkm
         wR/B0kJMQwIE1aOiyCN1LSdtRAXf0hsF/59RFZ2xGhmz5g/dY0WoOZTxWcdWttGQe5V4
         vKhhnQ53nMLQuT2IGKTsk42gHosx5JnYCweoTmzGn2gocaUOkmGnIU5UYLZ+XDURRCaZ
         LD3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751270530; x=1751875330;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3DnWNuVGlcxt97iON5+GLNil5h81EohwejutmAGRqZY=;
        b=xM1kl5fvNtBgph14+pOnPXI+5D77g9cmFE5miZBICOWu6utnCuXH1GkNjWmW80iUxT
         sBohLyIgVZAoByG2T9bcTZDGsYoCjaE4IhsFzf3xj2/48xjeW7X8DOE7WdvwvwnG99P4
         QXqxMc1lLQ865jBbixEym73/zZxWLhw0hqpDTc154Ulr4dJ0cTvvlTmLhPyt7bw6NBgR
         CbCiZLCdpZxT3900hpL7qIhWJb5Fwp1bD746rT5uG8NVtxAdyrw23fUM8/wQwTgH1gdY
         tmUhJBwTBgvKX7Qs3yjtmxNw00Gg7CqWYvU4rUJtt3fLKig8nKFpRWPwnFDiv+mWRz7Y
         JuJg==
X-Forwarded-Encrypted: i=1; AJvYcCUleriDIl4arDGvUaVLSsD7zUmlT96qeKXH+Kwua+xYOzLvxegVdCNk5KB7FTE9lZfhu+wZwxh+09+9JuGfPzC1CFcGLw==@vger.kernel.org, AJvYcCXDU/EnrtwfKYic6nNwVVQ4mzBTFkjlPEkGV+pFJ+zp31XIlzYVO4VvDsoMK0peB5jBQqfzAuEggtmO9Ck=@vger.kernel.org
X-Gm-Message-State: AOJu0YzbN4o7hqrAY0Ds0G8DUYXKbAMSLv8r2rGprN2tWojuYfjgHmll
	J1IS2hKN6T4sQxPli+wvDO9D59AAmVbQCHFng8J1RstzHDzRmCUIbrH8
X-Gm-Gg: ASbGncsEkYjN4OQE3k2O/BdSBE4KjzpGpjr+6faz8+kUhXg+a5j7BJd1qFGI5G4YE9w
	pyY7EQH9vy/qqvMgIY/AtE79Gl0oBfIAZ9Rg/ylB1Q4KC4HgsySdFnj19xcs++AbeEF4EIzLkvF
	mNiM2rAcA6Rzv1Q48l0dwavWloIPuivpuSrNkxQwwxZSyoeqNVGFFi47ELl0M25cacbO80MY8Zz
	7bporU/NE0qtyiABlGl8+UHwHSrgTCq/kaGAEjldAx4/S+uov0efiBQm4nZjKvjBEvpMIJfUu6t
	KUEcR9Ld/clwsYOyfPHNAV/ixdzKJX5QafKTu9k82hUAD+DNGHESO0qMSK3V5w==
X-Google-Smtp-Source: AGHT+IHsLPJS1KQ87rYWgOPssNPc34rcZKreTHx889UrwUoHfES/M4Ocd15A0FcVhMZv8rxR0ldaPg==
X-Received: by 2002:a05:6214:f66:b0:6f8:bfbf:5d47 with SMTP id 6a1803df08f44-70002ee6975mr173749146d6.24.1751270529900;
        Mon, 30 Jun 2025 01:02:09 -0700 (PDT)
Received: from [192.168.1.26] ([181.88.247.122])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fd772df637sm63677026d6.79.2025.06.30.01.02.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jun 2025 01:02:09 -0700 (PDT)
From: Kurt Borja <kuurtb@gmail.com>
Date: Mon, 30 Jun 2025 05:01:13 -0300
Subject: [PATCH v4 6/6] MAINTAINERS: Add FIRMWARE ATTRIBUTES CLASS entry
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250630-fw-attrs-api-v4-6-1a04952b255f@gmail.com>
References: <20250630-fw-attrs-api-v4-0-1a04952b255f@gmail.com>
In-Reply-To: <20250630-fw-attrs-api-v4-0-1a04952b255f@gmail.com>
To: Hans de Goede <hdegoede@redhat.com>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>, 
 Joshua Grisham <josh@joshuagrisham.com>, 
 Mark Pearson <mpearson-lenovo@squebb.ca>, Armin Wolf <W_Armin@gmx.de>, 
 Mario Limonciello <mario.limonciello@amd.com>
Cc: Antheas Kapenekakis <lkml@antheas.dev>, 
 "Derek J. Clark" <derekjohn.clark@gmail.com>, 
 Prasanth Ksr <prasanth.ksr@dell.com>, Jorge Lopez <jorge.lopez2@hp.com>, 
 platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Dell.Client.Kernel@dell.com, Kurt Borja <kuurtb@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=875; i=kuurtb@gmail.com;
 h=from:subject:message-id; bh=hOd6+qOcYjH/w/j3ddYeY0GLTSBfqJE3weH99urGytI=;
 b=owGbwMvMwCUmluBs8WX+lTTG02pJDBlJLsm6O5ZMUXeYl93O9T9y4/Xosi8rruXGLNjM+DtJ/
 2LVPRnbjlIWBjEuBlkxRZb2hEXfHkXlvfU7EHofZg4rE8gQBi5OAZhI4GJGhjPTGhu1Y9e2THuo
 1tFz92WklWfVOgENwe4ECeceCbmHpgz/A+qPCXNeO6OhHCXknOX5Nc1Qof7PzX/ff7gweX08ZV3
 KBgA=
X-Developer-Key: i=kuurtb@gmail.com; a=openpgp;
 fpr=54D3BE170AEF777983C3C63B57E3B6585920A69A

Add entry for the FIRMWARE ATTRIBUTES CLASS.

Signed-off-by: Kurt Borja <kuurtb@gmail.com>
---
 MAINTAINERS | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index c14614613377df7f40565c6df50661fe3f510034..c799f603e9210e4703eeb1f0ac9d6b9e8bd469c5 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -9352,6 +9352,14 @@ F:	include/linux/firewire.h
 F:	include/uapi/linux/firewire*.h
 F:	tools/firewire/
 
+FIRMWARE ATTRIBUTES CLASS
+M:	Kurt Borja <kuurtb@gmail.com>
+L:	platform-driver-x86@vger.kernel.org
+S:	Maintained
+F:	drivers/platform/x86/firmware_attributes_class.c
+F:	include/linux/firmware_attributes_class.h
+K:	(devm_)?fwat_device_(un)?register
+
 FIRMWARE FRAMEWORK FOR ARMV8-A
 M:	Sudeep Holla <sudeep.holla@arm.com>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)

-- 
2.50.0

