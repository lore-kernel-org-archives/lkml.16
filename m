Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3504A25DCFC;
	Fri, 25 Apr 2025 15:02:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745593346; cv=none; b=cqefhDrs/LV7ihc9KXm7I7CKHu52PBkpo7bfxDGSTP9//zkJ+mdSSdas1MywGcNUb8oWZQEyZCM07t8eG6Edme3zDsSwj+tDjxvFbWxjb731I4KCq0FCzzm0HTobQMAzvTBMl58gyFZy7XQyaUa2ZqdoP3ScuwMhoKW2SWBGyAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745593346; c=relaxed/simple;
	bh=+8Jhr4lXBd37amRhl8DkfhFl3vWfPC/cgjVXW5fibXY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=hfC0QsjiNcgWvmYWad9TiGAtU43BJkyRn6rP//Il4mpInRSQ/Gb/5sakWVmZPOSmr8pCDcbiefpsu9www+JcSMvKfd7GaAGl7rnOrHedhQI3qivPEMOYwdypFqoovFQBmzGASUqiROdzhJJaNXYKiH8T75dHY/VLATTqy2yCYUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fwr7Y4L7; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fwr7Y4L7"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-736b34a71a1so2754850b3a.0;
        Fri, 25 Apr 2025 08:02:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745593344; x=1746198144; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=E4iq3ZV1gZ2A7C5pUxV0xluU9k930DxcjxwJQQWmeeo=;
        b=fwr7Y4L7iGdvtOS4u2JKuA3zvFRFEFlkTk4LqpW8+TOIvnHNNcC1U49T9eh4AYSZOE
         BLpXxyL2ZgPvqj9PqRmeW7o8MI1iOSpYrP8cRuOR9SfX5e3Gq33IILPqFOsIHVcqx3PI
         ufnt17MLj34KkBi1KlT3M7lvtomLWrnk1eIvUb//BVY8E6NVcyFglMn1adGsbLFc5Atw
         x51znj7gh+i7MmJLUmGeY0/MnkIj1EfK5dtNZG5TEpIoPsnG5sO+lzdbzLcsdSuk/LsL
         ZDWB9TseA7267zYclJDUShrhqOkQa3gU70IsloQ+YK+EKxXbGUh8TkxxhCVMJSfdGwe4
         2mdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745593344; x=1746198144;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=E4iq3ZV1gZ2A7C5pUxV0xluU9k930DxcjxwJQQWmeeo=;
        b=nYPglACNYnRxAy722Zeb5WIlHdOyPncaB5RcM5EgztaNtEic5/XF1xOAP8bcKWl7nR
         M582VttEBfDIKP9UO060QAyyY32Pyqcn2AjmC3Z/uPYO+nGRBMUVLZrwPxbCZGHDrxH9
         3SJo7I9tGOD9eGOh/1aKRibxDl/znqETmgfJ07eSUKuC/mE7GisAiFvcbzbaHb5uHCO8
         ua5yZfTaiQeTIto4lSrKUlWVyPhWvMqL/p3tfVVkTTHrRClMoiPnWXWO7H8zzNid0tf+
         yIjvBcuaV92uIayrn9gs0G3MGoLcxtZAo9tK9X5Y4b75bZWgQ/aK/gmLHFDgaJe9H0Qe
         EghQ==
X-Forwarded-Encrypted: i=1; AJvYcCVyw+mKCVy7rNCfy8Izp2FRSHSgLjiZe9S1JMVvGQ8b+9rwXTfFDyvcwUVFwwGV72OK9ncLuWo7YK9LIZA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzrRsrvLEcfxUsSS+PPQ6hBlsNiUikwHogmon/Q28Y8eFXU+qwE
	XKrDik6uz2bCSTlWVO4mzulDcVSFyDLU0LyBYzbYhJsCf91C8Sj+
X-Gm-Gg: ASbGncvTcjdpb2AtwaOWNCmx1loOudfNC6aKN+ezk5a+GVVksDHrI5FhfrOTQGZt1sT
	qDjszMRPRMe3KU2e/hzK7Crcmqovr9K7rJJKI7mj2CPj0Z0NM332mpu9V9MCLT74SQlhCs9ZAbk
	aEv4SE3WNcLAh+fwMJ5lcK96QtrZqkrbtaAd08SsCWaFI2MTUHb1iEHXqyGleJBfGO+M8vSnals
	0goVTbk3Hc/eyklzdJot2cIZfgUqUvd6C9Z+3AcwuhXSbxsbZMHVp55GID2yAWBlwu3V3mljgt4
	FcomoUw39rUX52IexgwAcBnO5FHZxT71nT6DuvhUBbYXcLHYp9DoP63dGOX4gcM=
X-Google-Smtp-Source: AGHT+IGDo0mhcDv+LGOTc0hTgh+mctyyVzduVPzACzshBZ5R/WGcrSfIFLzGkl9D3SR5J4+vsMUBSw==
X-Received: by 2002:a05:6a21:1511:b0:1f5:9024:3254 with SMTP id adf61e73a8af0-2045b6ae0c4mr4060200637.6.1745593344365;
        Fri, 25 Apr 2025 08:02:24 -0700 (PDT)
Received: from NB-GIGA003.letovo.school ([5.194.95.139])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b15f76f45bcsm2996984a12.13.2025.04.25.08.02.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 08:02:24 -0700 (PDT)
From: Alexey Charkov <alchark@gmail.com>
Subject: [PATCH v5 0/2] ARM: vt8500: Add VIA APC Rock/Paper board
Date: Fri, 25 Apr 2025 19:02:21 +0400
Message-Id: <20250425-apc_paper_binding-v5-0-3aef49e97332@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAP2jC2gC/4XNzQrCMAzA8VcZPVtJs3ZWT76HiLRdNgPug06GI
 nt3u52GiJ7CP5BfXmKgyDSIQ/YSkUYeuGtTmE0mwtW1NUkuUwsENKCVla4Pl971FC+e25LbWtq
 KHKEtdgpIpLs+UsWPxTydU195uHfxubwYcd7+0kaUSqpd2APmPg1/rBvHt23oGjFrY74S0HwTc
 gnS6sKDNUYj0Keg/wo6CUABS6jIE6q1ME3TG250fOc2AQAA
X-Change-ID: 20250418-apc_paper_binding-8feae286710e
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, Alexey Charkov <alchark@gmail.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745593359; l=1922;
 i=alchark@gmail.com; s=20250416; h=from:subject:message-id;
 bh=+8Jhr4lXBd37amRhl8DkfhFl3vWfPC/cgjVXW5fibXY=;
 b=LPnroPcrUyM1MHUdpXiqGUMmEbn8FngdwTmdNlPJ5SqHDewfZ7IfuTZtC1jPdjsxiqQ1WKlLF
 7KbbntQrnU3A0p/bEw57r7vSTflMg5cmqkzU7+QoA1Vr1hWNgInR5nK
X-Developer-Key: i=alchark@gmail.com; a=ed25519;
 pk=ltKbQzKLTJPiDgPtcHxdo+dzFthCCMtC3V9qf7+0rkc=

Add binding and DTS for the WM8950 based VIA APC Rock board. Paper
is the same board for all intents and purposes, so reflect it only
in the binding description.

Split the series from v1 into several chunks by topic so as not to
spam all the subsystems with unrelated changes, per Rob's suggestion

Changes in v2:
- kept single-valued compatibles in a single enum (thanks Rob)
- dropped the empty overall description node
- Link to v1: https://lore.kernel.org/all/20250416-wmt-updates-v1-7-f9af689cdfc2@gmail.com/

Changes in v3:
- submit DTS changes together with the respective binding change
- Link to v2: https://lore.kernel.org/r/20250418-apc_paper_binding-v2-1-17c9023b7c9b@gmail.com

Changes in v4:
- fix typo in the dts Makefile which went unnoticed due to a previously
  built .dtb file lying around there under just the right name
- Link to v3: https://lore.kernel.org/r/20250425-apc_paper_binding-v3-0-846b0855420e@gmail.com

Changes in v5:
- simplified binding changes by putting the enum directly under the
  "compatible:" node instead of nesting it under another "items:"
  (thanks Conor)
- Link to v4: https://lore.kernel.org/r/20250425-apc_paper_binding-v4-0-0ec2d0febe21@gmail.com

Signed-off-by: Alexey Charkov <alchark@gmail.com>
---
Alexey Charkov (2):
      dt-bindings: arm: vt8500: Add VIA APC Rock/Paper boards
      ARM: dts: vt8500: Add VIA APC Rock/Paper board

 Documentation/devicetree/bindings/arm/vt8500.yaml | 10 +++++++---
 arch/arm/boot/dts/vt8500/Makefile                 |  3 ++-
 arch/arm/boot/dts/vt8500/wm8950-apc-rock.dts      | 21 +++++++++++++++++++++
 arch/arm/boot/dts/vt8500/wm8950.dtsi              | 11 +++++++++++
 4 files changed, 41 insertions(+), 4 deletions(-)
---
base-commit: 0af2f6be1b4281385b618cb86ad946eded089ac8
change-id: 20250418-apc_paper_binding-8feae286710e

Best regards,
-- 
Alexey Charkov <alchark@gmail.com>

