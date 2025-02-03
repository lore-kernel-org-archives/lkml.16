Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD3E3C139;
	Mon,  3 Feb 2025 13:11:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738588307; cv=none; b=XOYCw5AIF7m9OzEWGVr6vNhLyLFawUDNdoPQObkaHhSkTiArS/z3uH8PXp4Kt4JTxHgjZBd94pnGBqu8kKK/lbUnJpVcXV0FyZHLwpRUEGkdzWTxKLxWIe643/kGXcieGb2exHkgLQvTikBbweIkHZGtdRumUxxu1LTin0FpSzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738588307; c=relaxed/simple;
	bh=DzSU1APOzsACEuytza3v3Qeh6L0yur890Etpm9FdP1Y=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=G5X3LmE4FrmnIMcQCVY860yOm3hGjMLe77zzaaftCHTtKafyTupQfGgFikZGKXPnCVrDqiS6ybyFOEhOJze3tPXfKg9ohGPGPvoId/LYDmORsVD0W/O/ChZBZsrG0Z723Sr4Nwj3XYMywSZ6Fk1yDVp90JcwaxoSMjs3v1vaYZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fho6tbCt; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fho6tbCt"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-2ee50ffcf14so8127263a91.0;
        Mon, 03 Feb 2025 05:11:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738588305; x=1739193105; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ERRh6bhULTaxnqjnEtSSbfFqlVmrwqBeGnZ+e7hDD18=;
        b=fho6tbCtM26s89aTLpsGrF8XhVvwXPiihi1RXghXktzeTnmcQOHZE4oBPVV7KYMFm4
         sQBRFKaZXo6A9umWnLJFcPVsMClytaU0IG1NwyZaHlgpfwZQMkZyDVAb38VpsjA2GQTx
         3iq4RqQjYEBEnwAmlNsxsJroZAPCIAp6YkzOH4RlFhtxR0/M348aJWbIqYgado3CZHwP
         sEDqr/ZDqHqrd02SBtLfRIqwva0AL4G2lYrP1sDsjD0LEUPnO9Pzr1kqpuifLItNj0nQ
         woMMGwq3+bAtwFpIvl0SJ/OK2B1zNzr0QZIppz4eK8EfoxkspFkiNhFUXgbNt8KRbnHb
         FR6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738588305; x=1739193105;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ERRh6bhULTaxnqjnEtSSbfFqlVmrwqBeGnZ+e7hDD18=;
        b=MMP9AEUb6TDyjyOn+bv23dt3t3QDees04RTQ/jkOVaJnaNIrR+UG25GA781TqLPnqc
         OWrJMiwMTvCVGjDveKB5O3Om1N4/c2/8ylxHcE4xczWvLzKdZ1kRCsYXzIo8LelsfDYD
         KqEj00XhWW1tuyEHmv8IWaf4PW1RsdhDxbwlizZqY45EZfnLkxjrCwdy29UFUNtq8MB4
         HBytEytJtJKuhmSzUDCCaQoRHAD3BahCN9+juYBejK4DgeC6xdLhpgnZMIM76F7YnRAs
         hfzgK1ZziJbjahQ1lfKyf9ndKxilglo80CVONrORwmvrKEezAAQmmWEKWlDULsgkFY+A
         5new==
X-Forwarded-Encrypted: i=1; AJvYcCUcZiFU5YpXY8MmEwOcvtaCisuyz4mT3V8fvLuzs9xo5Iic8fp76r/aKv99jrHrIXj6i5Nt4mOrbuoYdixk@vger.kernel.org, AJvYcCW9a7V1SUMO6fT8DjOgw+NbLS1O2Kh7z2FeSnOyvq/4knk5MtzYRwLaqkx+PZC/SzNBreGDS4Xobovc@vger.kernel.org
X-Gm-Message-State: AOJu0YwI/HUqgH/xm0TAzINJhWXRTucNQHTxorIUTuuxUU+TkPj8p1Fn
	n4AbiOxLT6yqW6J5Ie3/Ur4X8y3lSvYb3K0gbY+ao55QAwXQJhCc
X-Gm-Gg: ASbGnctD51j1FpGT43ggy6xUEscKksL71eTjufPiEKIwNjq9CUiaOvT6yrqukUfGuUQ
	j43Ow7Sm4tK2SeyLfEcz0uP55iC/saX/aBXvmarhAVMrHtNTt+04i+bDYfwHV83QafQeyiOJvgc
	ronHJ0FjmwV7uaYu5PFyKqTxFgF+DKRW+fGYEi49iioN/DRq4cjVqMG0xLLULs8p7VU7DPwiymG
	I1ZHEYffBkDSY7ai/G8/V8T5Dbxgt8L57UOgCWARe6P2ZQyQtCsh3nRcQr6S6W+49pjanQQkQHU
	FF5RKJw54du5092D3I6clm9xlGu7KxChqPj4yMaX/8UajjfJXilv1kcWoW+CQhdmp0EZ
X-Google-Smtp-Source: AGHT+IH4i92orUFnRVo9rLyLqwfaOElTRxGUQRBJpk9f36CmBg6ebio9whJ38cg0kwFE8XUnCvcjFQ==
X-Received: by 2002:a05:6a00:2e1b:b0:729:425:fde4 with SMTP id d2e1a72fcca58-72ff2c61dcfmr22974293b3a.11.1738588304994;
        Mon, 03 Feb 2025 05:11:44 -0800 (PST)
Received: from localhost.localdomain (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72fe631be3csm8377629b3a.7.2025.02.03.05.11.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 05:11:44 -0800 (PST)
From: Potin Lai <potin.lai.pt@gmail.com>
Subject: [PATCH 0/2] ipmi: ssif_bmc: Add support for adjustable response
 timeout
Date: Mon, 03 Feb 2025 21:09:12 +0800
Message-Id: <20250203-ssif-response-timeout-ms-v1-0-6fe279740181@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPi/oGcC/x3MQQqAIBBA0avErBswJYquEi20xppFGo5FEN09a
 fkW/z8glJgEhuqBRBcLx1DQ1BXMmw0rIS/FoJVulVYGRdhjIjliEMLMO8Uz4y5o3OL63jpjOg8
 lPxJ5vv/1OL3vB0G9huhqAAAA
To: Corey Minyard <corey@minyard.net>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Quan Nguyen <quan@os.amperecomputing.com>, 
 Patrick Williams <patrick@stwcx.xyz>
Cc: openipmi-developer@lists.sourceforge.net, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Cosmo Chou <cosmo.chou@quantatw.com>, 
 Potin Lai <potin.lai@quantatw.com>, Potin Lai <potin.lai.pt@gmail.com>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1738588302; l=1181;
 i=potin.lai.pt@gmail.com; s=20240724; h=from:subject:message-id;
 bh=DzSU1APOzsACEuytza3v3Qeh6L0yur890Etpm9FdP1Y=;
 b=GAK/aX4VSX/tXNfs/Y9fqhcSM1vwK8pu5MogHQzQ5xKFxxmwp3ZvPuIAnc/D6mk9APw609dr7
 9uNIy81NfJ1AyPBSgYeMdvDXSQfejkYDNuZQEamhJFHEWPHEI6ZaVBU
X-Developer-Key: i=potin.lai.pt@gmail.com; a=ed25519;
 pk=6Z4H4V4fJwLteH/WzIXSsx6TkuY5FOcBBP+4OflJ5gM=

The SSIF response is handled by a userspace application, which may exceed  
the default 500 ms timeout when the BMC or application is under heavy load.  
To provide flexibility, this patch introduces the `timeout-ms` property in  
the device tree binding, allowing platforms to adjust the response timeout  
as needed.  

If `timeout-ms` is not specified, the default response timeout remains  
500 ms, ensuring backward compatibility while giving platforms the option  
to configure a longer timeout when necessary. This prevents timeouts in
cases where userspace processing may take longer.

Signed-off-by: Potin Lai <potin.lai.pt@gmail.com>
---
Potin Lai (2):
      bindings: ipmi: ssif-bmc: Add property to adjust response timeout
      ipmi: ssif_bmc: Add support for adjustable response timeout

 Documentation/devicetree/bindings/ipmi/ssif-bmc.yaml | 6 ++++++
 drivers/char/ipmi/ssif_bmc.c                         | 8 +++++++-
 2 files changed, 13 insertions(+), 1 deletion(-)
---
base-commit: 2014c95afecee3e76ca4a56956a936e23283f05b
change-id: 20250203-ssif-response-timeout-ms-3bdb88ab337f

Best regards,
-- 
Potin Lai <potin.lai.pt@gmail.com>

