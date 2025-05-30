Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 705BE26A0BE;
	Fri, 30 May 2025 17:46:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748627214; cv=none; b=hz+Zmm2utJUOhNryDVKxbS4JembyRCZIKvIQYpSStYIZJYVKe8iYgf01vXSzKJkC0T5CbY2zYDlnbEakgsrIhurDZSZo+NQil70Dv+rkAskAQEHfk1K7od+DPSb1F0ZedxR+lMbZZQ+IgRGb179ZfHZPk7+e+ey8PU90uh7o3Zs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748627214; c=relaxed/simple;
	bh=vRflShkK0QVF32FYyRhepXzHjk4JEqhl1dD+AekKEWI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=rM/HDcO6Mr5q20P8FDiDQj80pGwvQIX2gPCq3WISdd+wyGY/SQRCi/RjrdJJ0w9KD+0mZjPiVy9CLLn99jAr27MaRrNarhlFJDqFhGzieO9JE3vIYw9mFDFjXYzozFVkb3fW4vo6btWlN8tfG8LJDxX8Pfm2F99SKA3czAcNBV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cENcTrjG; arc=none smtp.client-ip=209.85.219.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cENcTrjG"
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-6f0cfbe2042so24622296d6.1;
        Fri, 30 May 2025 10:46:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748627211; x=1749232011; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4yWvre4iDXKzBypLznnX+SBubiDfmTLcrr0bP7oEJqw=;
        b=cENcTrjGPXiJglj3cyfu9xxGpBZry2Rcsc1MokW2Bjt9mobfEpm/Q0SFHm0htEzblV
         sd9DcWXn66UI61xGJxdSU9+dONdhaZxyKvEifeIc9NRiY9plh5m9bKBl51hJrXJ9x1CI
         aaq/qkmf6L8juInpNKxSA4XdRgHsPNJyoQw6HZCeNTsrUiaVKhlHCxibd5GTLgWfB9l8
         J7cnWVcEHyWbA/5cDYD9Ndra/Mk13L/tV4QxmXndiEr1s+wDwxv9C72Cuu2UPf9tLJdc
         22e9xvDWrNwUIyZynVGOLUDG+3U1CnzgJf3RECEeyD3N/amSgrHdMlv57qh2sW4bajCx
         WZ8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748627211; x=1749232011;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4yWvre4iDXKzBypLznnX+SBubiDfmTLcrr0bP7oEJqw=;
        b=FOYhpZXDdRjMrWYiya+oaT2Kqs8Oq7/cVcdVHdg5FnemdiL3iXBwdx2P6Obf1Qgv/T
         sZnSCh+sU7lDtk9+BUd7fP0LG2JD5Mw1kKg7XGBArydBTsJYbK594FrYXGzxNFTPbyd8
         HflBA0aTn67WRVMbZ2u7esn6SK/ICa/4QvFi9TNRH3UO5eBTwncsycUE94IdgKBF+SmM
         QhSPm9N0dO9HqEply23wxnslTYAmPH6e+eKu/2cQdG9drvAoFEb99wXs2AwDToB9O1C1
         Oh9Zlwosoz+iToIGquyh6mG3izd8w9jGSAbs6GUBUzBqpmdndtRqYbBtPcElBX/JOZGL
         exnA==
X-Forwarded-Encrypted: i=1; AJvYcCU3c/J/S6r2o2R5uZPKeXhTVl8sGc+EKpbM/BlChiN5zOHVGX38UoKzCip/okw+jsNXpAVyyBT4s0bjFSLK@vger.kernel.org, AJvYcCUIr6lSHFpnn/hl1HeUxFCz5kzh8+saVx0jRq50zTJHXYucJcPfNbUOXnlncPYvpHNOlLwWxLSIWlMy@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1lNz7gRr//lg64AP9Ql50Aczjacz14OCpgkZUDdK0r0X/OqJq
	0qQZeF8QD3RFmw9qzI6mNBPq5PRdW3cHpNFmt+QH2fSQwAsxGVU/FLC/hl3iIeHC
X-Gm-Gg: ASbGncuBFHSEQLc6c/ZfVDMnOLzkh/AGd1oa/T0HteDguS0f5pYPvVqKqCb2kpUHpWB
	ujcY3Y+yE+UVOuv7f5KNx0SG6S0OK/72ejQ8/6ZUseqfbaMInYLin0w+JBSLcgDV9EKEna3PGIt
	wJAeCfYl6lFJlZQUu1qFELQqSfN5UVCcSU0G2WxsZeYd0eT78obMSA9qis8defZcOJ0oqv7Irr3
	VdnyV/88dgiVOffNMn3CpMJvHR0r0OJrKitWib8WfqQ/8geWoBFN28wpbELh4AeMZrQRa+vNodu
	FLhKhfaikLTTGGikWo/2JOZOWIRBDJuaTKXe0vCITnf+ONfl9H38wbvIqSuczaoDn1QVGMImWOg
	h6KgUumYy8ApvfjCxc5AIrZ4gqIzsMdw=
X-Google-Smtp-Source: AGHT+IF9tURkuT3YArE+DnyZIMle9WncnNtAWoNMHJyKa12+SMywR79cNrkihMBZNgoPhgmwaa04Og==
X-Received: by 2002:a05:6122:17a8:b0:50d:39aa:7881 with SMTP id 71dfb90a1353d-530810a550dmr5023203e0c.0.1748627200605;
        Fri, 30 May 2025 10:46:40 -0700 (PDT)
Received: from joaog-nb.corp.toradex.com ([67.159.246.222])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-53074ab0d37sm3578591e0c.8.2025.05.30.10.46.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 May 2025 10:46:39 -0700 (PDT)
From: =?utf-8?q?Jo=C3=A3o_Paulo_Gon=C3=A7alves?= <jpaulo.silvagoncalves@gmail.com>
Subject: [PATCH 0/3] hwmon: (amc6821) Add cooling device support
Date: Fri, 30 May 2025 14:46:24 -0300
Message-Id: <20250530-b4-v1-amc6821-cooling-device-support-b4-v1-0-7bb98496c969@toradex.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAPDuOWgC/x2NQQ6CMBREr0L+2p+0tSh4FeIC2wF/Im3TIjEh3
 N3q8iXz5u1UkAWFbs1OGZsUiaGCPjXknmOYweIrk1GmVe1Z8cPypnlc3KUzml2MLwkz+6o6cHm
 nFPP6G1mNCbja3viO6lvKmOTzLw334/gCUbXkk3kAAAA=
X-Change-ID: 20250530-b4-v1-amc6821-cooling-device-support-b4-41efee7492d8
To: Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Farouk Bouabid <farouk.bouabid@cherry.de>, 
 Quentin Schulz <quentin.schulz@cherry.de>
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?Jo=C3=A3o_Paulo_Gon=C3=A7alves?= <joao.goncalves@toradex.com>
X-Mailer: b4 0.14.2

Add support for using the AMC6821 as a cooling device. The AMC6821
registers with the thermal framework only if the `cooling-levels`
property is present in the fan device tree child node. Existing behavior
is unchanged, so the AMC6821 can still be used without the thermal
framework (hwmon only).

Signed-off-by: João Paulo Gonçalves <joao.goncalves@toradex.com>
---
João Paulo Gonçalves (3):
      dt-bindings: hwmon: amc6821: Add cooling levels
      hwmon: (amc6821) Move reading fan data from OF to a function
      hwmon: (amc6821) Add cooling device support

 .../devicetree/bindings/hwmon/ti,amc6821.yaml      |   6 +
 drivers/hwmon/amc6821.c                            | 147 ++++++++++++++++++---
 2 files changed, 131 insertions(+), 22 deletions(-)
---
base-commit: 7e801aa73daa456c4404fde177d3fc397661abf0
change-id: 20250530-b4-v1-amc6821-cooling-device-support-b4-41efee7492d8

Best regards,
-- 
João Paulo Gonçalves <joao.goncalves@toradex.com>

