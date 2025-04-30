Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38173274671
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 18:41:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746038514; cv=none; b=iERm7lLoSTodzgknJwuTQb5i+merBn2PoE5GeEFJVLgCxewBbcl2dPFa1gDTQ7+QicWVXvoRvVUelNW5x2aXInDZynM0/4RLBfeoeiU01OclPDo5fYgSiY2gyFVXI1WUKELsI2QdqSjH+kFa+BaTCuWAQQnasHR5ChP69zg8isE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746038514; c=relaxed/simple;
	bh=Oq6tGFhrRxkmZMhP4r8iY75g4HVuYxbGocN5n42gjTE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mcuLU1CFh7TgdiHEEGWIKzjX1pQyAnTZv0jA8fe/37XsSJ6AdAmieQiPVPCbGANqqHdU2BNpIMg02EOsFKBIz/xeNN+cHeGgf0xxTsEfBW4J1c1piqMLnKNmpM22DaHaSvw8NPnMnrhDyuEkR8E1p9oYdN6bjYVh2nrY9RSR17E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sPAm7QN2; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sPAm7QN2"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-39123ad8a9fso3190f8f.2
        for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 11:41:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746038510; x=1746643310; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9ucXzGbbSSpBHzZPrBdGJRZzvgP5bTwCRraWT2PcjgY=;
        b=sPAm7QN2Dt8g9+na2s5kLUQPr6WGDK4GxK+hWIzPcqh0gLn4Ly1s+et0YZelgtHPTs
         NlDiE1NTjqASndaOewkH4TWyhRNdsrCZZLFTf+Ct23h3n+OdjVjomryhtHEPr35yN1dv
         otcIc0y53hP/RLGAGRf2nX/Fu5YS1KahW//xG7AOkoZE76SSRK/URHEaWnqFaNMf3shO
         jVWbR3H3BCVakGfhgDJa2m6rVkDkOfYKAZxuF4Vt2+wV/Jdk3PPGQiWubA4jnR9iv+CY
         sz8viaU4FscHV9p/3uQYh4HRF66TwWoPqtwEBQkTLdCAN27AnqFaItU2Lg4noEAHoC13
         c9zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746038510; x=1746643310;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9ucXzGbbSSpBHzZPrBdGJRZzvgP5bTwCRraWT2PcjgY=;
        b=mCTx+AohEKpdQrqwMHoykifYfZa/9bVbA61bYOIS+K1b9Ff1/EsAa84rUhqurEfgAH
         Lr8/3b1/pSUyMbk/0M2P/sQiW2o7N0yqJEmF8X78pdnJXCJnVd1DlHc/8zvdCby0jXNL
         yfrP4pkyWK9cJU7G9pXtYuUYpX4aB21JZZ8a/qjbDlviKmBgxP1doghyu8vuas9g2DUp
         kHp88MM5Oo3YHdstg8NmdGc43MLq1TT2GxqDqs0/zzbRff6DqMDKyBzXoneo788QpZkU
         hGivSZS05tUfPULge3FcViyFknF6K5bKUBIQkPUEc++qZoDZUFo6W7TaBA0l1p2vLZNF
         e0OQ==
X-Gm-Message-State: AOJu0YyObUgovWgDYWcKA4Fr6yqS8yIMvyA0YCd63YJ3DvhxTruL90vX
	dkgyf5N78BuWsdCR4EPod1atU2WyhaYIh/x7vtA0TBDl+xe8z27x838ryq+azCc=
X-Gm-Gg: ASbGnctF7DjTE7xzSn2bZTigg1jj92T1t2gBIOg5W7u5JqalcniyAlb/gHlScLTu7XP
	aq99f2QyzPpgxm3qmn6SKkK+u1+98cIiv2kGl5tY1wOFTOWaX5ZzVSTktTx5vm3wlB02KGluwBu
	uoxPT2mC16gT8Y/9qAdFTbHzSaMyTt9maLGqQLqX4NW7q2rlFvJawSxpk/YM1N+3cn0uk0uRBxv
	XBj0pF+r+W7RHNKK3E36zHyK2+lyCpOdLvNq/CP+FIH7VytHy7wKbNyh0/gi5pVj/E3WOlrdDXw
	JigYOHeXVsyix7FxNLdNyBntCLAsK4XeMLL9SWi2r5ExlqjJfVsx9uLxn28=
X-Google-Smtp-Source: AGHT+IEXaqkS00hSucz91P2ARv+DeYZsrbs7C6pYVdxeal2Nbp2XUkiYNiK4O+grl6O/UXgdfRMHaw==
X-Received: by 2002:a5d:5f55:0:b0:3a0:7a00:6fcb with SMTP id ffacd0b85a97d-3a090099c4emr1301286f8f.13.1746038510669;
        Wed, 30 Apr 2025 11:41:50 -0700 (PDT)
Received: from [192.168.1.28] ([178.197.207.88])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a073e46257sm17728991f8f.77.2025.04.30.11.41.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 11:41:50 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 30 Apr 2025 20:41:33 +0200
Subject: [PATCH v2 5/6] cdx: controller: Drop unneeded driver.pm NULL
 assignment
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250430-cdx-clean-v2-5-7dbfda9364a9@linaro.org>
References: <20250430-cdx-clean-v2-0-7dbfda9364a9@linaro.org>
In-Reply-To: <20250430-cdx-clean-v2-0-7dbfda9364a9@linaro.org>
To: Nipun Gupta <nipun.gupta@amd.com>, 
 Nikhil Agarwal <nikhil.agarwal@amd.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=819;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=Oq6tGFhrRxkmZMhP4r8iY75g4HVuYxbGocN5n42gjTE=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoEm7kIT/TgcYkysvvzPRuIzyiROP2sUR/lq592
 hDwufeMLkuJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaBJu5AAKCRDBN2bmhouD
 10Q8D/9dewqpIBvX9nQJlVn4cMtbqxL2Gl0uUwRI9TJkUNA9dl9Yby9VM3bFx/LOKJJUmlFmcAt
 DIJ9IAZfB4LZZoh2srDmTy0jutKWG8biVGqPT2JsIdTDfG5dBFfAbpnzGn3rmWintJu3TkqfmX7
 1ylCqCzM0MoBR3rkb93ilPg9Q0oMdPLOrmsviZZPiSBiFJw0FKxd9Mz37gcR9x38KJ5EWIsotm7
 CB1Vvr0ayglAIrbQMeEF8e8WZuCQSM5dm5HjmnAk49xIUoEOY82wf37k2pyp/ay2WKiGO6RIo2k
 Mn5rlDYQMkK5ZgVWX6t/nPwxiF1KIiShPgSU7k6midQ2SwhTJSI8I/DrXCf0Bhwn9m+ueX026p9
 7QXjglNkDGlUX06kW9pHJEwW/3zSSIdX7RN/hYygS63BETaNhlNeXUi1aC0CnLJaCt4TcNdjTX5
 BhbKwZ76PlOxcF3n3Nb3l/SltuU72NvMg7GOTvTQyihnhXB+CEpmxFpGT2iIpg0tEHNAs0vYpB1
 Z8JIIIpii8yPJ6p5mobtHcHlqLRsygGlp6AAIg82aZmH/dTtFBf4rlsOreG6sYjb3k3V5l1HClS
 xFN1iCWs3JbwkwdMdRQ7mCIUneDqz4fVAbvNTWAouH8p9TdowrZ1HRtcQcosxjkC9apblL17ReD
 CtrEE28aociPRiA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Struct driver in platform_driver is zero-ed so there is no need to
assign its 'pm' member to NULL.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/cdx/controller/cdx_controller.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/cdx/controller/cdx_controller.c b/drivers/cdx/controller/cdx_controller.c
index bfb5ac2d861f2708214ae28922a7c0cfdcdf5cc6..fca83141e3e66e68e6916077833db2b7d816395f 100644
--- a/drivers/cdx/controller/cdx_controller.c
+++ b/drivers/cdx/controller/cdx_controller.c
@@ -243,7 +243,6 @@ MODULE_DEVICE_TABLE(of, cdx_match_table);
 static struct platform_driver cdx_pdriver = {
 	.driver = {
 		   .name = "cdx-controller",
-		   .pm = NULL,
 		   .of_match_table = cdx_match_table,
 		   },
 	.probe = xlnx_cdx_probe,

-- 
2.45.2

