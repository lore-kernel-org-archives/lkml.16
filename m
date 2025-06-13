Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A94E20297D;
	Fri, 13 Jun 2025 16:35:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749832523; cv=none; b=VbTqvFH4NMIatDju5FsYRZec8cXPTslnPxN44O7nvmePV7F3pEAINaoPPBbyKy4M6eNFnLhmWNnOSFM4KMLGxQh2oOSmIKXPCFoUJIY1iIHSltBHGLG3mBTg+idR2bJUttZ0nEDrwc6M+nSKwm0frgnmV5gYwopZPVv9oDSdSdQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749832523; c=relaxed/simple;
	bh=QXE8CKFwmIeb+JPAQUReJotkuCcr6O5N8pxWfDgAg1c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=pnlCh7YldDXPsYgfZOBhCsBAlnZQd4avyRmOYVt8fbPHUDTLE2UBNkOhhtYhHatRdkg9+3aWKWPLKMwuoUEv9zCm3CiP5lBSgISNDaEFMQX16yRtNu9yhZ0jkpkokZpCvRnWnjbNwcx1tfWcsCKJDoeag5hiPKFKt7WeeQMx8/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Olh/xIyA; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Olh/xIyA"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-312116d75a6so2114124a91.3;
        Fri, 13 Jun 2025 09:35:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749832521; x=1750437321; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FHPrpo9d42nRJm72Dq1MnICc6IUuyfQPRBp7KXTIMQ4=;
        b=Olh/xIyAOI1IXUkpB0UgFWAOtNYq+AcIofwCd9Opc0LBO4IX6esV39SnyQ9fksa11Z
         2cDtKZeSG1QGLshmmWqOij2R5ehI75+okNuqaQXEQnXEAYyISUefsSYObmEkXRq0jg4o
         hoJ7KwscBSW3qs1VZNDmKkCXLPy0GfJxsSVHJc/+I6CblortqkrkfrZjvlUT0MleKegt
         NqlycJiqtdnB5ngMY/0kacEYUnjgL+bDcU6GU4qowuJ6Bm/fHfyX5utWEYWzj8RUnCn7
         ohpzKfc3BJDNiS3SIgSBPKCGUgSSV3LthLEE+U/Rq34HCH2y0+uQI7QD09EgsOMeZ/GI
         j2dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749832521; x=1750437321;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FHPrpo9d42nRJm72Dq1MnICc6IUuyfQPRBp7KXTIMQ4=;
        b=apAAWp1J1tflonUXU7d+5r5BKEemHi8SyC1ErpAZb0gnN7HORo3vUrfNXOuqTJT76g
         3XTsbeKv3O3QjtLH1bOO3onYCFlqZew89AMT+YTzHdH6WLZRuCo8F4mLgQ6skfq3Fg+S
         iK5hnxDnLwr5So+8G6VQyATW3CNIl0Qz3zVhRVlVkgthCG1OTA1xpUs4Kh8reGfG8/Rr
         IeJy6ouGM4uoTG//FiJC3Yb+bc9QToQuCw5twpHUvG22sPIcNOg23CSAq/qN8y+ZWF24
         IPiIxa+GxW9F5OO1FrpdTk6HMB0H9ggsr3Sw/vTvC8mgKJXpaGANj+c8Zzfezs5348jE
         s7RA==
X-Forwarded-Encrypted: i=1; AJvYcCX9/s8xlSyQe0w86nGmosU8mLpEgYbnPwnVbMpl9SGYF3lq6V5Oa0y6EXv4laFsWtqWsRMUwIL+cHJzoSw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxpft0Tt2oChOFd5kAmzkJ6dJLMzBEgswAKF3ye84IzpEcJOs8a
	RHjeF79hEd2y8XFqNwVgxA06h8phFenmf6FWpAKQpPegbynD/WCcKYWJ
X-Gm-Gg: ASbGnct9FMFrmmAbSXwIwlW4D3n0CqeQGVgF/xNrlmY8dX5fILdiT5t7kfJm7B/gs2B
	gpVTURGRWa3G/Bw5ZwNYY5c4gjPvof5AvoUDgfB95VR69XuqQsZtF+7qgPhd40k9J8I7yBXMZ06
	ekDXTs8nxJ8iqMZJIfXinG/xEQgwXWgTTXPFxBPA7x821/3qbtPYPZtikAprO36loWL8/TJ7qAH
	BX9PqpYsNIy/KfDeHsp0HtJ1Bt0PjTGKpLJPU4U1OvQaOMm5SFWcAZvNgdATT67H7YoSqRWMqeO
	vLdjPgnwszxp+tMNK+q6FBBIr09A8r7IZr5muxKKZmKuhysUat+yujJge+Il9AB1A3HmJOJD7PM
	NWTluj5TxJl3UvdJ9Wn7l
X-Google-Smtp-Source: AGHT+IGIuAqQa292qV7dqgToWK54149pBTrBaPodmpn2s350eBZtY87Pv6smrPbvL/pWn7OY37TTsA==
X-Received: by 2002:a17:90b:1c04:b0:30a:4874:5397 with SMTP id 98e67ed59e1d1-313f1ca7f9cmr519630a91.9.1749832521202;
        Fri, 13 Jun 2025 09:35:21 -0700 (PDT)
Received: from joaog-nb.corp.toradex.com ([67.159.246.222])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-313c1b5a85dsm3568672a91.38.2025.06.13.09.35.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jun 2025 09:35:20 -0700 (PDT)
From: =?utf-8?q?Jo=C3=A3o_Paulo_Gon=C3=A7alves?= <jpaulo.silvagoncalves@gmail.com>
Date: Fri, 13 Jun 2025 13:35:04 -0300
Subject: [PATCH] arm64: dts: freescale: imx8mp-toradex-smarc: add fan
 cooling levels
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250613-tdx-smarc-imx8mp-fan-cooling-level-v1-1-59aae8fee2db@toradex.com>
X-B4-Tracking: v=1; b=H4sIADdTTGgC/x3NTQqDMBBA4avIrB3Q1KTqVUoXMRntQH4kKRIQ7
 25w+W3eOyFTYsowNyckOjhzDBV924D56bARsq0G0QnZqf6Ff1swe50Msi+j33HVAU2MjsOGjg5
 yuKi3UFKTMMMENbQnWrk8k8/3um7Lrur0dAAAAA==
X-Change-ID: 20250613-tdx-smarc-imx8mp-fan-cooling-level-b67265ae2c49
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Jo=C3=A3o_Paulo_Gon=C3=A7alves?= <joao.goncalves@toradex.com>
X-Mailer: b4 0.14.2

From: João Paulo Gonçalves <joao.goncalves@toradex.com>

The fan controller on this board cannot work in automatic mode, and
requires software control, the reason is that it has no temperature
sensor connected.

Given that this board is a development kit and does not have any
specific fan, add a default single cooling level that would enable the
fan to spin with a 100% duty cycle, enabling a safe default.

Signed-off-by: João Paulo Gonçalves <joao.goncalves@toradex.com>
---
 arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc-dev.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc-dev.dts b/arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc-dev.dts
index 55b8c5c14fb4f3e7407243760ac01b0aca0dacf5..5f233304cea747d3f04a748265f96696668c9d6b 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc-dev.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc-dev.dts
@@ -213,6 +213,7 @@ fan_controller: fan@18 {
 		#pwm-cells = <2>;
 
 		fan {
+			cooling-levels = <255>;
 			pwms = <&fan_controller 40000 PWM_POLARITY_INVERTED>;
 		};
 	};

---
base-commit: 1a2ad59da68dd294f994efbf68c5d671f6b42fad
change-id: 20250613-tdx-smarc-imx8mp-fan-cooling-level-b67265ae2c49

Best regards,
-- 
João Paulo Gonçalves <joao.goncalves@toradex.com>

