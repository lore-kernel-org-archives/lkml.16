Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com [209.85.167.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F00C52E62B6
	for <linux-kernel@vger.kernel.org>; Fri,  4 Apr 2025 22:21:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743805266; cv=none; b=jwiQRN1Bkb0XRxFhG1/ouduRqPM6zQl0D+q7EYq3SKIEAaA0m+pdVefyuj6DEtyg/GrSe90jVVDcXpDTBOVN82ZIjGYqKLeHNuHVdUy3a9n5Ice+HFGn4KXHLl9HDPdo8gg+GaWJJNMPXUuq62rqHURJN6TU5vMjW03vDcWOf1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743805266; c=relaxed/simple;
	bh=NxtcbEcGlEkVU924eiTFpDDLstHKQpVQlhP7SfPMst4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=cQ9Y3Q/HhGc4v05xPVAlK2YcoJ8obkihhN1SS2I6a0xeHvfeKOtXxinqJiEnhQHinp9m3FC7THeqX+cl9Qp9tZrnE5rY/KPDMmdBN6UViPG/Zs8i1YgxqURkYjlxn+A9QdpaviEXpbqHRcF/1FIjInhL1iMZpLB0niMSOLRCkSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=KBpo7ydV; arc=none smtp.client-ip=209.85.167.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="KBpo7ydV"
Received: by mail-oi1-f175.google.com with SMTP id 5614622812f47-3f68460865aso1601560b6e.0
        for <linux-kernel@vger.kernel.org>; Fri, 04 Apr 2025 15:21:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1743805262; x=1744410062; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TmNq3915xWh1Z+2OaQ5mFBZKfmTh6ktynQVWZ1k8DJo=;
        b=KBpo7ydV+ruElWpzVwTk1Fgpnq/u4u1yrVuwYzfvnoVDGpkuEBggyzCFCTPg783eet
         Wvulu1fN/bzvZSLHRMZIVLaokKGF9IT6pBN/6hLBcs7L6Cg0ZLf2Gkp2gR6QA9DKA36+
         xqM4tMFZK8LIh5HoXX1VXzliVG56noG3Wj9+o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743805262; x=1744410062;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TmNq3915xWh1Z+2OaQ5mFBZKfmTh6ktynQVWZ1k8DJo=;
        b=rZzwhz0xeXLjkiJ8CCi1Af2OH3iIKflpO7OqgD37RNHhuQLpmvsipilFb24Xdvw8nu
         6yd6ytWmuIy01yNRgWdnO+wwVdoW43j+lAXWBD4F2mufBI30zgW5h3yA/ezskM594Ikn
         HRWF0ay47HzlyVtAm+WT2MmV4UNO+k5Ji8vXtBX3EjOHeqSHTFoHm/3d0HQ/xsy/g5oP
         CBx+7tYLItRqEkkVFVU9auEsrYT1uIKX1nzS38uYAgqA2Vn2Yp+u7uWW1lQgdivePI76
         sE1o1WFPJY/5Yz5kvdeg4/LUvWbbvBKf5YQbjqk9015WFpD1NiqMo3Ao+nIKMG02pk3h
         +B4A==
X-Forwarded-Encrypted: i=1; AJvYcCWMWSzmjq+RdMjsFOfE/WmADxJPiR0QmPksZBtJypXeSlpknoSWNo+0WvHHT3QyXGRmkioJyH8B98PZpfs=@vger.kernel.org
X-Gm-Message-State: AOJu0YyKzXemx/gn5hgXEI52Wt1i73/C0b0Be+sVtEmXoW0oEisHa4Ay
	GHaBYLmljTC441Va1VaGmIbmMeZ1nXxiSqgUzWIIzA/JbUpDRDpcDiFdEy2aNQ==
X-Gm-Gg: ASbGncu2piA8gG9pvzIFUOGLH+M3vWTgszyPGBODaPBp9Z6Q57spM2kkWHnGT+lhkWd
	EqX8jxD+cu/xlujXIflOdB/J63tq5CT0cHfgYNfs8QEnDfxUCncGal1Cm0vJWxw/gYLjXO6iY/e
	qTCWvAw69DjZYQMQ2xQ9jC8rQT0Ajz9TC+oNaaMmsBW0lPbvhGwPax/EVj/VXR2kMYv0sl8ZbQj
	xWRpQIYlktIsW5xAphJtqBOwL6ms1b7TGu1Shu0KTXSzu9i/GAi9T+m2nbLw8wR9nyeWYYAcg+Y
	pR/dqK8iar82F6v8qeqqw9Me39AfV76z9sBJA1vnL4KlrW8Cs/nZLd/Xc5CRyjuXBFYvy12Lewd
	g6DlPUtvRFWsWWL9sJ7ztWw==
X-Google-Smtp-Source: AGHT+IHlCdv1oHDof2Z54UMKicOslKY+UQoZgdpA4Lwb+2e5qaV5CnASTh2r2stX5Wq+ZGPJHwOxxw==
X-Received: by 2002:a05:6808:1a29:b0:3f7:8f77:2a9e with SMTP id 5614622812f47-400455d1745mr2577021b6e.20.1743805261888;
        Fri, 04 Apr 2025 15:21:01 -0700 (PDT)
Received: from stbirv-lnx-1.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2cc84b30cd0sm925451fac.38.2025.04.04.15.21.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Apr 2025 15:21:01 -0700 (PDT)
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
Subject: [PATCH v3 0/2] mailbox: Add support for bcm74110
Date: Fri,  4 Apr 2025 15:20:56 -0700
Message-Id: <20250404222058.396134-1-justin.chen@broadcom.com>
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
  dt-bindings: mailbox: Add support for bcm74110
  mailbox: Add support for bcm74110

 .../bindings/mailbox/brcm,bcm74110-mbox.yaml  |  65 ++
 drivers/mailbox/Kconfig                       |  10 +
 drivers/mailbox/Makefile                      |   2 +
 drivers/mailbox/bcm74110-mailbox.c            | 655 ++++++++++++++++++
 4 files changed, 732 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mailbox/brcm,bcm74110-mbox.yaml
 create mode 100644 drivers/mailbox/bcm74110-mailbox.c

-- 
2.34.1

