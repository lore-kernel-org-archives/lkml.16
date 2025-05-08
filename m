Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07F1723D2AE
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 09:07:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746695278; cv=none; b=VH4NmQwxt4DVzn1Q3KnZOfyWVDKkz8g48ynbmzJvg4YZ+jGy74FHN8X195wt01kqg86n74EO66XsMLIPxkpEqikKCevcOq3itMdWHBem9ycMIXHJ4YfLOqKbG1en8y2+TyRUNvC8Ih+3sw+kS2YDbhr4jJ+Gjh7Ci1Am/CfTfAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746695278; c=relaxed/simple;
	bh=cFOGWnVtQr0saOTihmVXuGVu+LURGA/kQzStCBpjTyg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cwKOGMc0lOw5DRwvboFKYmX39NC6DJNhfIsqHLq2THOBC691gpxmKbpshA9IJFsaSikapsQdBxgFSZBUcziKOchFJZqzmtVKKFUd8JzkctceowdlHFokb/8PhsQ0fO2/zyIjpZH1MjrWrl6aFyo0RedDrCXK2ooKANDN3cYV3oY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dzT8mBkY; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dzT8mBkY"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3a0b5b90b7aso101410f8f.1
        for <linux-kernel@vger.kernel.org>; Thu, 08 May 2025 02:07:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746695275; x=1747300075; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lMpv5HRf7q1KKLcNwoafQJQk9nLYrnMRUfqpfBYSi/E=;
        b=dzT8mBkYxfyp/V1mE2Vyk+GFlD7m3I1V8H/gPguooBC2tv8LGPIH6Z4TbXsbF0fOPn
         SdEGjiBC80Az5UJ1Uwl8VsYVzsHmr1Pq1MWiDwMsySlAGZjydV1KC2+nJ5t1bxIhmR68
         4FXveChc0mfOISF8tYy5ybqGN+qb6U0ObuymLU3ZeoSWJrrKrVlOWcXBa26OpvTFUJiV
         +F/oh2IRBbKqk31gTKpjwmeZVkxiXHwn4McEoSxXOf/Mg5qhkJwMFEh4fZNNP3M01T1N
         ZOOVTb1Zstcb65pqRCgH9pZj+e0lBnXdUvkx1dA1S/GzjvShnYyXTOordXHgsO89V00K
         44AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746695275; x=1747300075;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lMpv5HRf7q1KKLcNwoafQJQk9nLYrnMRUfqpfBYSi/E=;
        b=hnXOhD+7UjfvbKzt2faw1JxWOlP52yQVMrR+rLt2NJ0E4CL59aradG4MMBpL7esgP+
         kp+NJL8Fo5X1ZLoDy8FLqKBqOIRQgDJsIOQZtCBj/ep2VZFGfpspEERAoJQNoOWOABix
         Q5jLMeqh58BRt4xSanT+fphOp2i8lsX/4jGDb5IQvkeW+yMGDyt9DjsnJdyoDr2X54cL
         VxA2gTAT0NnC7dA1fJWr9WaiSYSg9ImJkO6lQuQ3Cw7Dy7h9Alznl00gsRxmONtUjTP9
         kXpq8UTkTTG6PBndISD8dZfKH+rjJs3E8wKwfKJy9zEugGtElX3HOfXNzAOlydR2JkQm
         lrJA==
X-Forwarded-Encrypted: i=1; AJvYcCWL+S4/7IfGTb77eZoBcTQYM7rZAWfCnp1+CAJfVxdpPLHbY1Amp12HPyHJVETMCg2yaBbM0Rs+XfSgtLQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxJo3cRth4ZBVEzu7WSHCKgO8ts6y1K0ztSJ3e22DBtx6kDmSd5
	si7QTwol7KJfRzoASkqZjOWVtIOlmt8krxMp6pqaAjKjIs1mY+KAXvzf7aSNvqs=
X-Gm-Gg: ASbGncunAQGcDajVw2rEE2RAr1OAqt1yuwnfeNWea+4eOBOWFMt6VaE/Q7v71ZoXQuI
	x8Ox6U/nL8wbp9WddxIa36CJcJ+UkhgUNZHlyPlnv2XwIhqS6dD7763pcU7/7cBS/vxm1NwQW5+
	zEHh2gpOtrbnpUTvcA9Ri4YNm/0wyPS+zuHey1etFgsxszIYBeAOOPBQqJwxHa3VEke+v1xO4yy
	r1mj2iQ4H/jri9lkVktCABY7A75aJWiMB2jd3zaAHC6U0C33+rTjvHYbZqb1EO6+6yzQuOblJWI
	kL+tccjU7s24f1qy2M/M4dZcaspcpNr7DnhZz2y6YNRcVn50ng==
X-Google-Smtp-Source: AGHT+IEPpTmtaFEr5272RyfI2A5wJm126PcKcCmO3UU4wfCfxMuNh81Fph52JbVRVXplQwXettz9FA==
X-Received: by 2002:a5d:588b:0:b0:3a0:782e:9185 with SMTP id ffacd0b85a97d-3a0b49e9e45mr2153806f8f.2.1746695275227;
        Thu, 08 May 2025 02:07:55 -0700 (PDT)
Received: from kuoka.. ([178.197.207.88])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a0b5764733sm4867922f8f.22.2025.05.08.02.07.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 May 2025 02:07:54 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Mark Brown <broonie@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	soc@lists.linux.dev
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: [GIT PULL] memory: drivers: renesas for v6.16 (for SPI and arm-soc)
Date: Thu,  8 May 2025 11:07:48 +0200
Message-ID: <20250508090749.51379-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2476; i=krzysztof.kozlowski@linaro.org;
 h=from:subject; bh=cFOGWnVtQr0saOTihmVXuGVu+LURGA/kQzStCBpjTyg=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoHHRlWbsbAFQq97t0KAdqrSkwvWfZRQTyzwNrF
 lAI8TxsExmJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaBx0ZQAKCRDBN2bmhouD
 179UD/49zZ3UpgAr2vDLFWDBNBHfYlp58/q6tWf1hqTuUKsHwB0kWAprD/ZAXKdf/4M3IlwYI0q
 pT/ByCDAt9N9kRg8s3cfs3eR0+VjN+HFE21+ml6ss00duM9Ujrmzn/CyiV9zdItjpGURh2R9asK
 d20mVaMAJ5TsM2iq3Hnmy2jf+O/bEbneaimBc1JFLgdkPXbqflAXUwlChC8iHhHldAJLfugOnW2
 rFn2dNNobiSigTBAZ6t4BFBl9LOcIhp67BvIDblrw6Bkt9JGgmfL68ctwKbQJ8Li7RgsZDgU8RZ
 bJUHj+mkRN5Hj/WeuW2FzL3LEGU6dzTT8QMR9OLCq9ocBg0aqlVCJU2BOXh5j+4nzM3QozUUeii
 RXE2oHJlA3ASHsbmJIGnFLpeXCbhYNo+y+0qMnDf5Kn2WaXgUwvn/q+DRPFrAwgAb+1jf+WYhnE
 MGimB9e1zYuslH2by/Av8cXinVy5bII5uV/iFKrHy+ze35QD6fY6dumxeR+cGgOR6/4e50VmTTU
 Oz1BjcGS/6vKbPJc6dWGo5cGIhihf3YL1zJMSeqxvA84bxJqML5UGyC9KX8R6lY+94d2t10Ark9
 zpwOhTuu4hK4Agmvhb1qsatvDx7hfZKdXvtBo4PLcbrJkRmHhR8h8hkSs3k2nHzhuNlLz0YgCl3 xemMhmYlhcYiRpw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit

Hi Mark,

Feel free to pull stable tag with Renesas PRC IF memory controller driver
changes exposing interface for the SPI driver:

https://lore.kernel.org/all/20250424090000.136804-8-biju.das.jz@bp.renesas.com/


Hi Arnd,

Please pull this into soc/drivers for v6.16.

Best regards,
Krzysztof


The following changes since commit 0af2f6be1b4281385b618cb86ad946eded089ac8:

  Linux 6.15-rc1 (2025-04-06 13:11:33 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux-mem-ctrl.git tags/memory-controller-drv-renesas-6.16

for you to fetch changes up to 798dc3f19c9e3855c18c3afb610bc5d27195ef44:

  memory: renesas-rpc-if: Add missing static keyword (2025-05-08 10:59:07 +0200)

----------------------------------------------------------------
Renesas memory controller drivers for v6.16

Improvements and new device support for the Renesas RPC IF memory
controller driver:
1. Minor cleanup and improvements.
2. Refactor the driver to accommodate for newly added Renesas RZ/G3E support:
   - Acquire two resets instead of only one,
   - Add RZ/G3E xSPI support with different register layout and its own,
     new interface for Renesas SPI.

----------------------------------------------------------------
Biju Das (9):
      memory: renesas-rpc-if: Fix RPCIF_DRENR_CDB macro error
      memory: renesas-rpc-if: Move rpcif_info definitions near to the user
      dt-bindings: memory: Document RZ/G3E support
      memory: renesas-rpc-if: Move rpc-if reg definitions
      memory: renesas-rpc-if: Use devm_reset_control_array_get_exclusive()
      memory: renesas-rpc-if: Add regmap to struct rpcif_info
      memory: renesas-rpc-if: Add wrapper functions
      memory: renesas-rpc-if: Add RZ/G3E xSPI support
      memory: renesas-rpc-if: Add missing static keyword

 .../memory-controllers/renesas,rzg3e-xspi.yaml     | 135 ++++
 drivers/memory/renesas-rpc-if-regs.h               | 147 +++++
 drivers/memory/renesas-rpc-if.c                    | 714 +++++++++++++++------
 drivers/memory/renesas-xspi-if-regs.h              | 105 +++
 include/memory/renesas-rpc-if.h                    |   4 +
 5 files changed, 914 insertions(+), 191 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/memory-controllers/renesas,rzg3e-xspi.yaml
 create mode 100644 drivers/memory/renesas-rpc-if-regs.h
 create mode 100644 drivers/memory/renesas-xspi-if-regs.h
