Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C5A726AC3;
	Fri, 25 Apr 2025 10:07:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745575652; cv=none; b=TYAqzqbwC2ZjkTn7pxZhOdJvWM9eG/Qz+lo4190dIBFqxsh8maMaYpEUUtz/+zP6p/3S5eyE1/y4wh+k0HmURcOgMhue8gJzPlX0LPBghLZ76imw4YFq7NUpods03O7a7OwC4qZzEu0V6DJRHnUbu48cg37kvDXMPWMhUlCQQRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745575652; c=relaxed/simple;
	bh=AEtQ4zVhOD5ipP+9Ofvo+I3POCv/ZAPLObFlY45PRVo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=JCgcgJBpIujqISwLSYoJosHYFuYz+Nockv1x2wuRwefeE54gyuGnbXZ5Dh9r5QDvVAQZ79w3CYFkGvw+Rx1Tu3miJAYXIYGPEKbAdeMnOJvC4EeeCrZ4u6X8rOJjgZkVx7EkEZk2Bg8SYIqgW1k3tlQsGZ0QTMlSV+Yy5Hynhpk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cRz8R4fN; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cRz8R4fN"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-af590aea813so3107274a12.0;
        Fri, 25 Apr 2025 03:07:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745575651; x=1746180451; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9uPmzHYOFCtYn1VfRn4G0KZ5XWfuvrYmTvkQ5ZTDH8s=;
        b=cRz8R4fN7dSlBirVjdrfUm2phowCC1GZ3ausi9WoEgYxHNEXp2Ic4Smf96vxI3VCYT
         H3eKRCVFV63aSPLaV3GoaGzKeJyX2u2M1vdaL7Co8RC8L5nEZ4wOfhW+csCN7phi5gLa
         OZzCA31spbSVoVfy158Ur+KDF5qJ3chdBYzn6pI2Fx1cfPXnndcryGD/KvMEDt7aviYZ
         GKjGma1GaEsUrH9Xy1TChtFF6priEBScxyUvYzmcl44g9qTeITyHMLKUovVeN5/VjYe0
         TQaTQ38rsBrtGZ1LMj4RUf+pSpwwl9Us25EUfrgAiMA12ecIKXVr6QT3lxK0tM556HhG
         lILw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745575651; x=1746180451;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9uPmzHYOFCtYn1VfRn4G0KZ5XWfuvrYmTvkQ5ZTDH8s=;
        b=IG2Se8ErSr7t8OCm9p1G7+80TP0wFK83OZMTUNEQHObo6yjj0xaxsPrz2o8GOjss8o
         b95vG3/r7vfIRrpRbOXtfN3Tq8x3NJeHGoyJXsGsGMQEJCKM42TXrrhegjCxFiXeuW8f
         2wxkkb+YVws7vMtTa1Wax0xBrUa7E+0zApUkzIXioPzFg/y47dZSpPjf6Ds0+zYL/Prt
         3cSZTY7e5hUIVItY25O0ed9PfvTylN19UpQVrvITl5iMftoELSBN9TtfwBlSiMKIecO2
         u9n/67/zwWv6V86H3DFunhccMzKvn50GXQ8BuJREfAmYNRGKlGcTiE7cVPW0ht8I3iEG
         UQaA==
X-Forwarded-Encrypted: i=1; AJvYcCUTQU4BPE592S/gZcJM3VprEATX1SCEGcPh19z2rEUtkmvHc8zqSTj0BnC4U9G0mpz/cR2bF+MvjrWo@vger.kernel.org, AJvYcCUkorRfhYE6+K+hNBsYCMOk+5r2/u1Inn9plQSYHj+4hTfGZnS4Y/wOSoVSWuKpjf/7tChf123o9ieWH17Z@vger.kernel.org
X-Gm-Message-State: AOJu0YzBT8aZQdZJCf3oyr+Up4TmT51sePJfABNhW6Wr4eJ0ECGWnLXF
	fBg86UaanxwjiWeHOQj46JiB9WF+RViQTkEW+krE6C699ZAPjEEs
X-Gm-Gg: ASbGncuFuVXSPzu5Lr+HnPpxJ7/k0v9kcQ8JbJUTd1MEAZOZb7SqzhJrS4NsQWkKjl8
	zxEK6+asAArOIRi+LhEpAgNjVj7doouRxPnjXEQXwVtlhT++r0ypKPCwNKwzxo1pShkfXAtJ4vM
	rmYE4t/Pja6o0whVTpAteE9BobVlloKToqCkVCXgaGiWyeycl6ZghL5WSYdfMqzChESODinbLC0
	xQ8lF6ZTrKwl90HsIOKcYi1bS3q3qXKqoqeNm3Y4iRxnvNcBaFx44nQgstHAy2kHPasGdNXVBtw
	pt54030gYqbpYyejuA2PJfZZRPn8YTMEUfowEvRCrvATuzMTXSsB
X-Google-Smtp-Source: AGHT+IEOXFkBumaprnMtZPAH/o9LFhkdeVpSsvxZfbKPhXNApsgEGu3ARHcUpcaYofflyKnemwQfCg==
X-Received: by 2002:a17:90b:2741:b0:2fe:93be:7c9d with SMTP id 98e67ed59e1d1-309f8992d63mr2194207a91.7.1745575650719;
        Fri, 25 Apr 2025 03:07:30 -0700 (PDT)
Received: from NB-GIGA003.letovo.school ([5.194.95.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-309ef03bb26sm3337254a91.6.2025.04.25.03.07.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 03:07:30 -0700 (PDT)
From: Alexey Charkov <alchark@gmail.com>
Date: Fri, 25 Apr 2025 14:07:31 +0400
Subject: [PATCH v2] dt-bindings: usb: generic-ehci: Add VIA/WonderMedia
 compatible
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250425-vt8500-ehci-binding-v2-1-b4a350335add@gmail.com>
X-B4-Tracking: v=1; b=H4sIAOJeC2gC/32NQQrCMBBFr1Jm7cg0sSquvId00SSTdsCmkpSgl
 Nzd2APIX70P//0NEkfhBLdmg8hZkiyhgjo0YKchjIziKoMi1dFJaczrtSNCnqygkeAkjMhnuhg
 /eGeNh7p8Rfby3q2PvvIkaV3iZz/J7a/978st1nDVkdOarLqP8yDPo11m6EspX5r7yUO2AAAA
X-Change-ID: 20250423-vt8500-ehci-binding-e607bfafdcbf
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>, 
 Alexey Charkov <alchark@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745575666; l=1405;
 i=alchark@gmail.com; s=20250416; h=from:subject:message-id;
 bh=AEtQ4zVhOD5ipP+9Ofvo+I3POCv/ZAPLObFlY45PRVo=;
 b=vyHQLxiH6LvzFbCTrK/BQsAfEZwEPwwAEu0+Z2j4SM0N2lJrJeHP4v8CfMaEVeJROC0PduAWH
 nrT6KR+ej9LA4O4dHv1G5+WDymiZLntez9+TgpduHl/hqlgx3DnQBZT
X-Developer-Key: i=alchark@gmail.com; a=ed25519;
 pk=ltKbQzKLTJPiDgPtcHxdo+dzFthCCMtC3V9qf7+0rkc=

VIA/WonderMedia SoCs use a plain vanilla EHCI controller with a
compatible string "via,vt8500-ehci". This compatible is already
used by the mainline Linux driver and relevant in-tree DTS files,
so add it to the binding.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Alexey Charkov <alchark@gmail.com>
---
Changes in v2:
- Amend the commit message to state that the compatible string in
  question is already used by the driver and DTS (thanks Conor)
- Add Conor's Ack
- Link to v1: https://lore.kernel.org/r/20250423-vt8500-ehci-binding-v1-1-1edcb0d330c2@gmail.com
---
 Documentation/devicetree/bindings/usb/generic-ehci.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/usb/generic-ehci.yaml b/Documentation/devicetree/bindings/usb/generic-ehci.yaml
index 223f2abd5e592ff8cc3ad97f9a325356ea57044a..508d958e698c2e8dad748a6fcdef65d6e883b97d 100644
--- a/Documentation/devicetree/bindings/usb/generic-ehci.yaml
+++ b/Documentation/devicetree/bindings/usb/generic-ehci.yaml
@@ -86,6 +86,7 @@ properties:
           - nuvoton,npcm845-ehci
           - ti,ehci-omap
           - usb-ehci
+          - via,vt8500-ehci
 
   reg:
     minItems: 1

---
base-commit: 0af2f6be1b4281385b618cb86ad946eded089ac8
change-id: 20250423-vt8500-ehci-binding-e607bfafdcbf

Best regards,
-- 
Alexey Charkov <alchark@gmail.com>

