Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 313E625291F
	for <linux-kernel@vger.kernel.org>; Mon,  9 Jun 2025 10:16:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749464219; cv=none; b=L5EYt/hcqp0tRT2x+Vhc8OXlR1e2ra9NfyhNxM9f+bPw7O84tk5UdAvW5f2WKwZvz2otZ4PbqFSmMIp2gAvgzHJk3NqP5RdNrC2tZSmgTjg0wnLtOPckjiZejlaX75cUYUP5phpiHZNxTkZKXHumeAbtpn5QhLG9ZHH3rN9b/LU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749464219; c=relaxed/simple;
	bh=aOMbBEpJBsHAJ0f+8jF+ZN6WNbod+xI+ZXgFkkv0hSQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=E9CfQsiaT9LSwFLpbFhuhEKMs7PfU/1BFNjM2CjN0oDPYgxL9En6qqSYndIg3bP+Ie5Hj2pR2xWBQL44/qswXi/6NxRx3dpQprZq3sWbRSQrenka0tTPs/OPHRZVD3QFLIt/vC0hG5yzV6FCsKtx+D/TQwYvuyEna1RIqGKA/pc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=e/vzd1Bk; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="e/vzd1Bk"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-ad88eb71eb5so568382266b.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Jun 2025 03:16:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1749464216; x=1750069016; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Czzd7R8n7wUjaUbc99aX/ItOeaVAXm9a6fTCw0FFyqg=;
        b=e/vzd1BkKXwwcr5uYuWd3QnB8Bk9vPqXsciI6niQ5AaIWOe1WwHKztvKBMwFR+OsTH
         HJgMdRLvcKB1EtMJXzx9FAEJpohhdKGQZUM3Ec45hg7HzbXIkUslK/hmHXWO8altUBn2
         72QTH6yHd67bJ9FlS8KNfxGKP9zypZJE1of5s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749464216; x=1750069016;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Czzd7R8n7wUjaUbc99aX/ItOeaVAXm9a6fTCw0FFyqg=;
        b=M0TBOAkrXXTorkfc6FdgfZvDHJ0kPjD/B6bYNYDnjXLIG+UwW/gfd4cVwK4FwNWk3G
         a8hj/Fwhq3MCWPOdGp88dzzZ6E/wl3PJJL5vERnPDy0Hmr2hWwW/EWTY6njk8bx1MyCt
         OO2njEA1pKF6en7xcsBhLa7YjeJE0JPWw6kU9/rrYhSWBeH1aS35CY/MK5YDyH7ede70
         Fh0hXgnIIbATE0lmuWOkXf6PxVXxmQpgFjOyAuYenldPwtig9MLzjTHbPErzMwD2hMdF
         0C2vidfCTTcbsbC8Y3Xqw/tMqqROrqgy8nrCcd5qMaheAh2JMYx1lMY0TwdLOi2Q/zI/
         G8Pg==
X-Gm-Message-State: AOJu0Yww+u/mRO1I0jm4+E1/Ub4AZLCsfT/It6TfZwKc61BLYtBSM8RA
	aAVmT4isUgJHDnZpj2CODYGYZwpBwrsnQWkELjyffufbvOm1rikTC/P8ot3XdohKqXnFGk3DoYM
	dZSQn
X-Gm-Gg: ASbGncvaWDye/ecyswcVeCW4r0Omrh7nbYXVc5a0FupjuiV9NTOtu1lK36qz7dVuDzQ
	eisG87agqKy8FG5dFTuQ9/8nsZfL2HOeqrs1yWVa9Ruze5YvlcoeVhzTa3rSe+8PD3L2XJe4Xxn
	DzLjFU5xCJqFiKtaREsApmRNDYztrDH1X/1FDVMhM65zJdZ3pruk1UJWHKwSGW1/4HSu6nZjEEw
	HIqmcWhiiB0BkuJSTFzplIvrEfunU0usZLe+U5+DfrCZkP0+CBdkmQZciClF+WYjPMK58WladGO
	06iFh+D35uJWO+Pnar+FZHJg6GHWsdgqz+0IjQVaOe3UpDkG3XeOiZci5vBTuqjTD2q8d8s/Uqp
	EtfqhT2ABugSAiIUjtdDF61949F0m2z1XwSFBl1ggqf6iQ9AmFT8=
X-Google-Smtp-Source: AGHT+IGSlc13W/z23hHpLKDwdcOkLDQpPe5iJyc0Swi9kFRIGCnP+JMqpE7sE3pgx/cMVZQvJu0usA==
X-Received: by 2002:a17:907:2da6:b0:ad2:1cd6:aacf with SMTP id a640c23a62f3a-ade1aabc6c7mr1037537366b.47.1749464216259;
        Mon, 09 Jun 2025 03:16:56 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.amarulasolutions.com ([2.196.40.99])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ade1db55c7esm529257066b.49.2025.06.09.03.16.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jun 2025 03:16:55 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	Matteo Lisi <matteo.lisi@engicam.com>,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@denx.de>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Frieder Schrempf <frieder.schrempf@kontron.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Marek Vasut <marex@denx.de>,
	Markus Niebel <Markus.Niebel@tq-group.com>,
	Max Merchel <Max.Merchel@ew.tq-group.com>,
	Michael Walle <mwalle@kernel.org>,
	Peng Fan <peng.fan@nxp.com>,
	Primoz Fiser <primoz.fiser@norik.com>,
	Rob Herring <robh@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Tim Harvey <tharvey@gateworks.com>,
	devicetree@vger.kernel.org
Subject: [PATCH v2 08/10] dt-bindings: arm: fsl: support Engicam MicroGEA GTW board
Date: Mon,  9 Jun 2025 12:15:41 +0200
Message-ID: <20250609101637.2322809-9-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250609101637.2322809-1-dario.binacchi@amarulasolutions.com>
References: <20250609101637.2322809-1-dario.binacchi@amarulasolutions.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add devicetree bindings for Engicam MicroGEA GTW board based on the
Engicam MicroGEA SoM (System-on-Module).

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

(no changes since v1)

 Documentation/devicetree/bindings/arm/fsl.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index 58492b1cd468..99ff7c78544b 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -773,6 +773,7 @@ properties:
         items:
           - enum:
               - engicam,microgea-imx6ull-bmm       # i.MX6ULL Engicam MicroGEA BMM Board
+              - engicam,microgea-imx6ull-gtw       # i.MX6ULL Engicam MicroGEA GTW Board
               - engicam,microgea-imx6ull-rmm       # i.MX6ULL Engicam MicroGEA RMM Board
           - const: engicam,microgea-imx6ull        # i.MX6ULL Engicam MicroGEA SoM
           - const: fsl,imx6ull
-- 
2.43.0

