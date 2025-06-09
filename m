Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C216B2550D5
	for <linux-kernel@vger.kernel.org>; Mon,  9 Jun 2025 10:16:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749464216; cv=none; b=SouAcxzObPSIWmJhcx3ZFeDCay+7vVr8kxqNjDJD01vpxu3YuxXXr591IjPqHgzflxz2mh2yID0cdh2k8fA4b1BLkxpe45mhNqy1w0+HOetrGQg+u54MBIAZ2Sd4yFvqe1IC3RWSTpCvS+TIxC3bwfUBm+g23ZUjtFAlyRqC2UY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749464216; c=relaxed/simple;
	bh=s6LKkZfapvI7MnBTrIqeUsxITzDRXn8euJLSIzRNxCE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mrgJrF0RPxtHnR34doS61Ru9ZMdmtBb/MhzaI8O43ZeWbFKKVG2f08Jh1W2EegHhg1EHf6XUO/PehfyQxTJoU2rglsVLXd9+JJE8Cz08g2SFS5xok7JA0+LqC1U/NmSWUS8MgXdUdh+rvyvK9FAufvwA7NRfcBPplVX6tYX23Zo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=YnKzJWRP; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="YnKzJWRP"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-ade30256175so482903866b.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Jun 2025 03:16:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1749464213; x=1750069013; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FYF/Nuv4YsITgHfVkZ6mdpU41q/1njXFGt7R6uHs5Pc=;
        b=YnKzJWRPJq/h/vROQbopeGNl8vBiH4obyP3yT+6nd+CLDjcECrxYRGluWnn6HJ7WaA
         e8qCv5j/H0CbJcCLbTeX1mMW1nlNSDUSVFGgAfhNcBpqMAvEk9nr9maE0kaW22NUKDB1
         igrOC5iIWiYHyooT6lnisA7W3tjh2IIG0Hxgo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749464213; x=1750069013;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FYF/Nuv4YsITgHfVkZ6mdpU41q/1njXFGt7R6uHs5Pc=;
        b=Z8xX3iWwVdUigu8AJLntgtg5i+UtgWrXzjfgJn3/d6Ycgfi5IjCbjF/2teCITE2no/
         1TAXRVfm5iZWC0+9C9/aQAUxLKBOUC6NxzmFLzuGH0sYY4IPUmGCgOj77pMnt8lUodyX
         fq2qzcxpZGOlGtMOWt4L8/JJE+npBnB/x+3UFe1LVGIOpgrAdkO4nyKZmM4gSWDSoFGZ
         N+kKlNRDpVRbywrHh9MpY8jnMRklsqvQk70K8JmEA4y1IsWlDOleactMtcjrvBMLcqN5
         4TBkgKjDTCXFZAYeENddw2+amqKx4vK5Sp1c/NHVsFy9dQZHAMJsS3zgsTWxycqgllyp
         O9Lw==
X-Gm-Message-State: AOJu0YxlGoJkaDm0AjFOPaTRmUHSq16GRj7A7i8VD32oyt9TLIcCQYoj
	2XCU0rqK99bqQkpNlN8BQrUeD0nISnzVzy0Njqy13Dwl9qZqUZurKwS/D0j73WUaBxww7sBhNUL
	R7nmb
X-Gm-Gg: ASbGncvCCeZpaJcGfoYXqmaJabwFaSJH0NWfaj6l48Ih/5v0fbj4B/0jloCTYlpjHku
	YdqGqGZjYBwZXazwJj41FOEpcxy+E3HYB14uVrV7wxSqxanvoEF+oGYPLJ5LLki/FAKqTDRoCIP
	xMlXtRjuUNfdWo+2d3Vqym/x2Lgf+Bl0eunLlek4Qw5vtzOmyELLg0a6OFe6+Ic468o5wc8pwCL
	bzX5wGK9DMuCbljJ/GYSY/k9E3kfu/rRwiNuupe5DS/3UTLRTdic1EPcrD7vRWUd+7dZi5RJsGv
	g/9IPtDLnQgRkOfk8A1//wdViUQktsSK0ZwDUOFtJMqLKtX+0jtjSWFI6giaE+bq2P1ZquF7ML4
	rptH8r33By6o6838m9ZfDEGMRGxa0x8GSFrAIjEo6C/DRgE5GFyM=
X-Google-Smtp-Source: AGHT+IHKKFXCGNXdjWNzxGqJXdSd6NPHPT2S9VoQbor5KMg8rGZUplkeNNbvsImx0hccGmWvP5prVw==
X-Received: by 2002:a17:907:3f89:b0:ade:4121:8d32 with SMTP id a640c23a62f3a-ade4121a383mr759217666b.3.1749464212993;
        Mon, 09 Jun 2025 03:16:52 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.amarulasolutions.com ([2.196.40.99])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ade1db55c7esm529257066b.49.2025.06.09.03.16.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jun 2025 03:16:52 -0700 (PDT)
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
Subject: [PATCH v2 06/10] dt-bindings: arm: fsl: support Engicam MicroGEA RMM board
Date: Mon,  9 Jun 2025 12:15:39 +0200
Message-ID: <20250609101637.2322809-7-dario.binacchi@amarulasolutions.com>
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

Add devicetree bindings for Engicam MicroGEA RMM board based on the
Engicam MicroGEA SoM (System-on-Module).

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

(no changes since v1)

 Documentation/devicetree/bindings/arm/fsl.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index 5feb62611e53..58492b1cd468 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -773,6 +773,7 @@ properties:
         items:
           - enum:
               - engicam,microgea-imx6ull-bmm       # i.MX6ULL Engicam MicroGEA BMM Board
+              - engicam,microgea-imx6ull-rmm       # i.MX6ULL Engicam MicroGEA RMM Board
           - const: engicam,microgea-imx6ull        # i.MX6ULL Engicam MicroGEA SoM
           - const: fsl,imx6ull
 
-- 
2.43.0

