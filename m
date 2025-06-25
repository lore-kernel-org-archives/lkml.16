Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A691C2D9ED1
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 09:19:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750843148; cv=none; b=lNG29c81SVuxWSvPBABOmTCBKZsvsJG3rEzCgZsuPkveCoGSnb7e/DhVTMv0Sc/6yhPTCO6Y8CmnUtMjo7izOnKdz9lCyEStysk2t8zgIzkICem8+TrMlUmIrbCQue+E5ZietqQ3kpZ4dfei+Hs1DG7YttNSuy/kXN3CRFN1R/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750843148; c=relaxed/simple;
	bh=pUbk1uqDn3rkUzvHyGVf5FiMIjDaRG8buGqEDrG6+iY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=t9iW7HktVH9gdwaIwWzXTQeAdhyMj5dVsD8RlLqCxYAoFR1UEncG4zTrOgqXjo0+DmqzCfDEuoXnYu8Y6dVRqR+7k3Au8ZuXXhE10r/pjOVkO1zqyGlhLgD5nsrLKF5edpjxCXJzMhwP4iasWkFRlvIu+ycvbu+Aj9uHsAyqnvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=IPWW2O/G; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="IPWW2O/G"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-606b58241c9so10039213a12.3
        for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 02:19:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1750843145; x=1751447945; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zTFzCvwRXcKyOlaP6VWm+NwlDdnptDG85UUcTbjMo4M=;
        b=IPWW2O/GHDydEyCavPkKeyHTHKHDEbs+3Nv05PlnBskTX4zlSVarCU2A7BO2o02WWr
         oOZMBYwVdJDII9ZWqRzxj5+7sk2WRTPgRRlFNDMVxqIl5HrJWmpRt59exA9rmmrBFXnO
         iXWlfBA6FMx70SAEGhK54vkT0IY/zGtI/E7iypMcJRlkULHPUAx+2i/Vn8kNgIq53QW8
         gsxO0Efa/AYR0Y9cyf0zNDoitBTyLswZ8bgCEcjw+2t4gM2yl/GJlIj3LAfudkG5G+7F
         lC5rdj/qypDpFGNrljitFMyyKNo84qpCEam5z4luPDdL/2lHd7i4eg2Yg+4+4VCBheo7
         Bd7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750843145; x=1751447945;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zTFzCvwRXcKyOlaP6VWm+NwlDdnptDG85UUcTbjMo4M=;
        b=EEpVji1cKjWcKxm0Hf34WqWyCMHR0/27zuNfUMvTzXSDRbBbXzFJ8ZBrsXB87Ir0jS
         pLMwU+Zio3S8g5bzrObP9h+4G/NoGBRPwYhs6awc1blB531KGHUSlOUIhtxmYt3zbvKV
         jHGu7O5PyTJBuohiLVTclAHLbvTPDQ5l8YhzkEYUzXBXDzNSzM3oAFMx4By95IU1hX7H
         MWkhhFU5zH9Xl7ZiqoHTkwGSjrZLCvSzEZAMY4w7/ODWAQY0QaQgCkhpyySzWEcof2+e
         P4SGcEMp/w3bTGQYSWR0E+pb/RmIlskSSk0abiBURrHB+BpzZZzcj2ePrPhUPv0l1j5B
         bfFw==
X-Forwarded-Encrypted: i=1; AJvYcCWdDcHFFxdI5SqkbuyLO7UaR7kOs0XjtpTlCk81LEE5/T4HnZwqGxmbUHrCof2Y72NR6F74HpOadRxZdbQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YyEiGyzScoGKWxknH7nvUXiuSk9m3KCcSyFNoM6UY2z6F9FRubx
	UOmyauwy1370E/zyrU1C168/20T3CX9UTCMrCtyugQy1iFhaQ9TRjJkVrzH9EsbJ3bM=
X-Gm-Gg: ASbGncuPvAFY4smJW+OyWFUyqP9nVOSNt6mDHRubob3giFB66vgUtG28FvawXwMIT0x
	1Yhz10fMRwW2KOVUBv6FkQWVgoh1u3JIcNy8Oq1Fn9SShWOM0VZ2R6AtYeeUC7czNUzX8qhgBmU
	JVwxczlk8rntOyGEcnCc2LjicFJRCFX5B54ImEJfXQOzb9ym+CkwV8g2TW+ebxEx8CPDDDpyjtn
	6nlHkn4u+MDN5AwHUVjkaXnoNV/tl48sPtoef/h/4mb6KyOILQJUmKatk1u72XTrd5IIWLr2kbd
	UGDI+KOsCtM1MRRvTBfhzF5Uy2jWLSh5NHCceYdDGvph7KdRbDwt4LulTCHqW64EWrlTyBCqIJx
	8V9nBPVzjwRXniv2YopBPUh98vBts4aSa
X-Google-Smtp-Source: AGHT+IH8149yP9D8VkRVzc5ItiuTtvTkM2SP+ZetN60G4hPLdR3fSCS4GsHThskLkKTdSjnQ5A6uxQ==
X-Received: by 2002:a05:6402:2548:b0:604:e33f:e5c0 with SMTP id 4fb4d7f45d1cf-60c4de4fe80mr1738458a12.30.1750843144927;
        Wed, 25 Jun 2025 02:19:04 -0700 (PDT)
Received: from otso.local (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60c2f196f84sm2194802a12.14.2025.06.25.02.19.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 02:19:04 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Subject: [PATCH 0/4] Add RPMh regulator support for PM7550 & PMR735B
Date: Wed, 25 Jun 2025 11:18:55 +0200
Message-Id: <20250625-pm7550-pmr735b-rpmh-regs-v1-0-cab8ef2e5c92@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAP++W2gC/x2MQQqEMAwAvyI5G4gtsepXZA/qZjUHtaQgQvHvW
 zwNc5jJkMRUEgxVBpNLk55HkaauYNmmYxXUb3Fw5Jha5zHugZkKLHie0eK+ocmakFrqgvDsp76
 HkkeTn97vevw8zx+M1CBJagAAAA==
X-Change-ID: 20250623-pm7550-pmr735b-rpmh-regs-06087e5b3a99
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750843144; l=815;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=pUbk1uqDn3rkUzvHyGVf5FiMIjDaRG8buGqEDrG6+iY=;
 b=9SrihxBYIY5Fo98SHHtSnS8hT8vJEMRffaa99XV2DXPTTOlML224CrfPKke4PaDDTj/ageEdP
 QhFBOtbw+BWDlxNRwakK2ZhdgZpY6D9Pk5a8taiiIRq8Nt8dXilDPmS
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Document and add support for the regulators on PM7550 and PMR735B, which
can be paired with the SM7635 SoC.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
Luca Weiss (4):
      regulator: dt-bindings: qcom,rpmh: Add PM7550 compatible
      regulator: dt-bindings: qcom,rpmh: Add PMR735B compatible
      regulator: qcom-rpmh: add support for pmr735b regulators
      regulator: qcom-rpmh: add support for pm7550 regulators

 .../bindings/regulator/qcom,rpmh-regulator.yaml    | 35 +++++++++++++
 drivers/regulator/qcom-rpmh-regulator.c            | 58 ++++++++++++++++++++++
 2 files changed, 93 insertions(+)
---
base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
change-id: 20250623-pm7550-pmr735b-rpmh-regs-06087e5b3a99

Best regards,
-- 
Luca Weiss <luca.weiss@fairphone.com>

