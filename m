Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35D2A1B414E
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 08:25:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747211114; cv=none; b=M+hq09fmXmpmTzOMVRtTI7RSt2MgyEjqnDVqc+1F8J5MRVjizlKIUqYVzPPcL1NzRgzByaSGm7P/Uj61tta5EflTLejk8+ncbE5Wj6QAQfyi1+gRlTtp/mFrr9Ys2YbN06VXt799d5cm7Cq3A5KEsT4Wz2TUap5bSPB8Yd4/cxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747211114; c=relaxed/simple;
	bh=qc/nsUTYkyuzCMF1Z93QgX0RM9mLg6+yezxc1YMOKms=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CZl12dXV28L9/CflpN8Wb9iVUCo9VmLAMIL3vzkYdRLODjq6D+UZpjmyk46eWl9dWLRfWW5QkiYMIn1qRl3IF2bPiKFSDXLwAC2zoMToqk9hp18VJxQnvs3WtAW/EIAhkpd/urcNaJu2IrAZ246KCPeRFxrYsq363vmKrpXVSUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=GXuW66rR; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="GXuW66rR"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-442eb5d143eso14568785e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 01:25:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1747211111; x=1747815911; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Klj8NdPC9rX4nFDMdyr+gujv99cd2TFqTsaOoeEged4=;
        b=GXuW66rRl5HRZK6+HmBde6lAaByu6v2rXNQzL1341eY8aJITMinoNQYTBVQavz9xuh
         svrrpag6qrWdcnes/rQbTmKGToGUR2PDD6gj40VV5hgCH7QTVRoB/Od61ItDhZ3YfXEZ
         wyRWvZTb236F5kHBVbdjLNMZcpAAIawi0o90k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747211111; x=1747815911;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Klj8NdPC9rX4nFDMdyr+gujv99cd2TFqTsaOoeEged4=;
        b=H5LYxipGYyF670l6mjH7Myb5gLF7FgqpIX7tfHpqIbw8Uf9NmfQhjU9tUi26EhIceD
         KhpAqP5c28e9Wp1rFpJn/sOJoJ/knR7b8Ni9FVErBO4IjUcSH+4X3ISeWLola9E8rR2Q
         svNbGU15qPyQmptrnZhyqq9Rr1E16D7Uv5b16uvVof/1ZNnrKloJnwl34QMI8ylsuWX7
         LigLQ12aIzjD6JaU3hTY3vFoi5gXFs9jfaPpT+74bTbjXa0p9Si5Y5FOji8pvHF+nclg
         YB8c4adL+cy+RAw2zB2h6PE/DQjVCIiuIWg4ngocJmqAqTNVlCy80FEAoHQizK9PfMsS
         kTcA==
X-Gm-Message-State: AOJu0YwRMymnJQL4BwfitU3g0FhFzPe6cPDJZuJo/UKGpk9JU0zoFf9s
	xJ0oiIbFsBvZNNreuKPGVr6cAyaCb9NdLy2JgFbJlnZd9mRJLJsYdgB3U0bO2H0s/jUK1UBihY/
	FZvo=
X-Gm-Gg: ASbGncs1vzY93MAD/IXeWDy8q+YmCMAHktUPawmoiHy21SQy6Cmaa9v9QP6F0QuNXpm
	P1vJymfPdkqPgK3t1qeF36VZcJ2eoolW8TFkjcEmWr2v2bmmOeDSRQg5RRTpfjmj4IjnxHqtq36
	W6RdrAHbPmQC9GknNmR0RhzeqKKzu4VoT9JzR67gtUwYlrCtHQepvxoHhnqI6dpRSEZZBsQ+19x
	ezIgrGU/5ZM2FU+RKMDy8ae3nF184nzICt+n/qwGmlFE+AF+d99lGksnpOIkWm8YrvDLtmdCwNx
	VGGZ+UuHNRdC2E8wHYXunbcPkIVRSE1rnOjUZyUF2bJ+6xOgEEG0iTsqpM4FO6hXCSC1sUB+mAa
	4YI+w8HR/Uc5av2AhDNYaQDCy0mqIqRk0Vqu7/5c8D10=
X-Google-Smtp-Source: AGHT+IGa+UmxR661YRcC1N4UAkW8IE0iPci8H8/AjxxIIiISRrbp1i8SREEO2kqtiAg1FYOJKvF4RA==
X-Received: by 2002:a05:600c:1c14:b0:43c:f895:cb4e with SMTP id 5b1f17b1804b1-442f210f6f4mr22958705e9.17.1747211111376;
        Wed, 14 May 2025 01:25:11 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.client.m3-hotspots.de ([46.189.28.43])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442ebda7d2csm30987365e9.3.2025.05.14.01.25.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 May 2025 01:25:10 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: Simon Holesch <simon.holesch@bshg.com>,
	Karthikdatt Anantharamrao <karthikdatt.anantharamrao@in.bosch.com>,
	michael@amarulasolutions.com,
	linux-amarula@amarulasolutions.com,
	Wolfgang Birkner <wolfgang.birkner@bshg.com>,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 0/9] DTS updates for BSH SMM S2[PRO] boards
Date: Wed, 14 May 2025 10:24:54 +0200
Message-ID: <20250514082507.1983849-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The series aims to upstream some parts of the DTS that are currently found
in the kernel used in the field. This is the first in a series of
activities intended to eventually lead to the use of an official kernel.


Karthikdatt Anantharamrao (1):
  arm64: dts: imx8mn-bsh-smm-s2-common: Enable GPU for smms2 and
    smms2pro

Michael Trimarchi (3):
  arm64: dts: imx8mn-bsh-smm-s2-common: Define suspend voltage threshold
  arm64: dts: imx8mn-bsh-smm-s2-common: Leave regulator under hw state
    machine
  arm64: dts: imx8mn-bsh-smm-s2-common: Keep wifi enable during suspend

Simon Holesch (1):
  arm64: dts: imx8mn-bsh-smm-s2-common: Pull Up Console UART pins

Wolfgang Birkner (4):
  arm64: dts: imx8mn-bsh-smm-s2-common: Set minimum value for
    VDD_DRAM_VPU_GPU
  arm64: dts: imx8mn-bsh-smm-s2-common: Set minimum value for VDD_3V3
  arm64: dts: imx8mn-bsh-smm-s2-common: Increase drive strength of pmic
    irq
  arm64: dts: imx8mn-bsh-smm-s2-common: Disable PMIC SNVS reset target
    state

 .../freescale/imx8mn-bsh-smm-s2-common.dtsi   | 31 +++++++++++++++----
 1 file changed, 25 insertions(+), 6 deletions(-)

-- 
2.43.0

