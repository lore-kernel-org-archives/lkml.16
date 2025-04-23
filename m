Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C748322D4C0;
	Wed, 23 Apr 2025 19:49:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745437787; cv=none; b=CsMTnTyGELwpBnew2sPqz3OO2TdLzerPR9l2lOQuJZZV+/YDgna+VqmdxXtfC0IDXWJCXZspPndGHlfbX5qLJGuOL9GNRzVdR43uqTs2Cve/oQFOfOaEZXc9zKZHsQYqFcmrIJ2VjjukHz1D1xeaQjROPVMTs1LDHzqvZACrdnw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745437787; c=relaxed/simple;
	bh=/gqHgIWvYDoh2ay4Dt66VfQN7r7ooPdcaJZKWyVPCKs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=sANUSswtoNY9ztOKpmBT0Pf0tNWh4chlUN8QZyLFDaZWofCTWA25X9tR2pICPJ48gu3J4ZMIyGp7P2iG/7cp8mROcgtCohjHbS05TAP+LSiDrfZkZiKwMQH3FsCMJGUbw/U0jbTh1S0csLIgMwQzz6P3a2c4SLnx6/b0nRd0bvg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aEZilbFr; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aEZilbFr"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-7390d21bb1cso150508b3a.2;
        Wed, 23 Apr 2025 12:49:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745437785; x=1746042585; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IfqjFKQjrrhlniO3DJvD09VooUIqHiiSwxn0+0MLQUI=;
        b=aEZilbFrnExwTaVaMsmMasFlDwmW6gif8rlOmDXo4agNZFuZF0E3D3Q5YiLKZOcTJA
         QXtmzNin0h2AKgBtLCMmJJ2xHR7yhw+KEyrfgKAyQ7GEW4dGqVAwQIEewX3vAHYm272F
         tASuumoZZ4TKz8xDn4V9/xpFefXLzQKYf3qY/OBw5fTkUtzvhDKo2r0MbDyqDKL14MOx
         bgi9TWpTggugFnCeqKOLNnsxp7pYsV/a19SJFZ7KXak71GL65kd0eVPqyn9eTu5MdIM9
         GHEhs9VuMEZ9Efc2PfZW4MFWnWLT3F5AAqBAHQIVZUKrpTAXymMq2oWU7Ic8UcW0D1FT
         HXtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745437785; x=1746042585;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IfqjFKQjrrhlniO3DJvD09VooUIqHiiSwxn0+0MLQUI=;
        b=IpR0YCx5zWK+YrAeYfwE3mAfEh8M6jRhIJRNvy+ZMz+kGoaCkf3Vxdxu5Ciew/vJkz
         7yPy2sDyyqcGXM1dzN44PCYfMy2AMbPyzp4iUnUNcjh4PYiQBoKawHooOF0llGD34wsH
         dyVOHU2DiKPBCjO3EoZDJmw0P9+mynyjZn1tz59xEj8R8BRb/unVC05hjSj98RwBkqE4
         gCfp3YeC58hT8QTLUWbwj0kALJGvL2V3Z4x/SIBQsiYWUJUbvHs6ma/y+s+Yn8RVndx9
         EtMq7miI13tCX+ql+HP8sb6UcFr83X1CJmhty3ocwhejqYzgEKNxmumFY1b2PfDTXMTt
         GHTg==
X-Forwarded-Encrypted: i=1; AJvYcCUFrcUN6I6kqOBres9DfsF0rv05Nypt/GyaeJ1TXEyoSNpD2kqn3Y2yWm5aaq5IFgNn5YakkDeB7PmB@vger.kernel.org, AJvYcCWlJOm1bZihCroFSzAL6m6tReDH+bz9y8ARSfQCIFVqHc96pWkgyOeFC260SHf73OEvxckW6JADCvnw2yNc@vger.kernel.org
X-Gm-Message-State: AOJu0YzjaleA4nGrrSrdXv3GY06NAqV8BFmtEPgIvQ314NHbTZPKi4EI
	VazY1XJOzETM+WWKTFqPlLX8nhD1L2EGHpgsG/ZghsEauA344rBf
X-Gm-Gg: ASbGncsu1l20EGk9f86EMyJlPIGy2uZHdFwjDjZKON1L7O4BLCMJs3pJRDZ+GhTTPVW
	xEPm+1qlU29lGV+hv+461drJnQZ/BghjFFliUsA4lQP8NhaGyzorb9Q3Yj/ZoCw1Y2KV0NMlY67
	BApSrmjY1WtZc+joaIABwHuk5r3cBpEDBOGFigbEIHJzJP3E2gABxcr/4aj7tOst3wtQ46mRyp7
	HrFjQsCRLB+L9q7hhH7VjJpTzvLHFgVM8zKhFy+jy02hGoCZ6Wtec0P7eOOoTVSVirZIjDqSXFl
	hi2OPh7r0abfJPGyxOCwU4M+49/dAp7zt1zcmHYR6ordVJhuMuRaZ8Tkt2ltqVg=
X-Google-Smtp-Source: AGHT+IERPQh4Y7V/l8lpr/XRnfwQmrzpEaU9fiS3c+vk4gGTjri+1BnCKpknXP9KXB9GLNf1W7dR0A==
X-Received: by 2002:a05:6a00:4642:b0:736:ab1d:83c4 with SMTP id d2e1a72fcca58-73e23ca12aamr97912b3a.0.1745437784854;
        Wed, 23 Apr 2025 12:49:44 -0700 (PDT)
Received: from NB-GIGA003.letovo.school ([5.194.95.139])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73dbfaeb525sm11406279b3a.173.2025.04.23.12.49.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 12:49:44 -0700 (PDT)
From: Alexey Charkov <alchark@gmail.com>
Date: Wed, 23 Apr 2025 23:49:45 +0400
Subject: [PATCH] dt-bindings: usb: generic-ehci: Add VIA/WonderMedia
 compatible
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250423-vt8500-ehci-binding-v1-1-1edcb0d330c2@gmail.com>
X-B4-Tracking: v=1; b=H4sIAFhECWgC/x3MTQqAIBBA4avErBuY7JeuEi1SR52NhUYE0d2Tl
 t/ivQcyJ+EMc/VA4kuy7LGgqSswYYueUWwxKFI9darF65x6IuRgBLVEK9EjDzRqtzlrtINSHom
 d3P91Wd/3A17/u5hlAAAA
X-Change-ID: 20250423-vt8500-ehci-binding-e607bfafdcbf
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Alexey Charkov <alchark@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745437797; l=984;
 i=alchark@gmail.com; s=20250416; h=from:subject:message-id;
 bh=/gqHgIWvYDoh2ay4Dt66VfQN7r7ooPdcaJZKWyVPCKs=;
 b=Uxzl8ig5PbeEHBkzgXe9Pk6zvaBfDgPpzs3GgsQwzbwNlruzYZq1HwUzXyuWm4M2cmk//lxLU
 rY3BPSXCVidDqxFW19O+M+kIEb7K/XXKhiS/2m7MIFQXIZUhXSb7JlP
X-Developer-Key: i=alchark@gmail.com; a=ed25519;
 pk=ltKbQzKLTJPiDgPtcHxdo+dzFthCCMtC3V9qf7+0rkc=

VIA/WonderMedia SoCs use a plain vanilla EHCI controller with a
compatible string "via,vt8500-ehci". Add it to the binding.

Signed-off-by: Alexey Charkov <alchark@gmail.com>
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

