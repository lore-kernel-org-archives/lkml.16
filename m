Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66B3F21FF5E
	for <linux-kernel@vger.kernel.org>; Fri,  2 May 2025 06:20:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746166855; cv=none; b=kLNRLq5TTqsoW1L6Gsa8HbJ1gH4Uh1ve83Vgz6KABMJDQ0nGbOGICtFX4gy8vGfXDf2GKVvM7aJi1xqxCyZRtJlOBL898/14rUWaUs+C9n5eCUyM/V3vHQBdEonovpJ34/3HKtin/WSZomxRtLYpvJKkjVIMkksU5Oq79mFX4/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746166855; c=relaxed/simple;
	bh=AuIYf6cuEPM2I1pj5QmyT3WTpVD+4qPkOEdINsIPKkE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Hi6fZQcmlite0q9eeZu/p+u+PLDMeoTdZStLetD9/UJiy8D+wobJuVJ2iQXGknYKVWoRXlJfPN+9MgWJ6M+j+MJdlhUMyPWcbTHhygOReECiVijOW5HO868dCpOwu6bEzP+Ki0zXTPstkRAdQzkp01p33ZBjuQ3m294M5h6hHW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=opwq2koc; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="opwq2koc"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3912ebb8e88so26686f8f.0
        for <linux-kernel@vger.kernel.org>; Thu, 01 May 2025 23:20:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746166852; x=1746771652; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ALjZo4nsA5qjfQOan39po5IsHvWCWo2OF7h1r4+hFaU=;
        b=opwq2koc9CXiDqVL8xQPKcvRUsX8eeAzqEIeGzKUjtGqYe9uJEQhJgCiRIEsPxnF5b
         TEX1MYVfsRUQSNnWWitAv3KRXqDEdtWHZtLmn5pxhrFT6TG4yH2nJMP+H2NXS2YwGN99
         RgEKx5JC/LRewmfh6DSqIR8uB5j26HuvAluyJIgn/JMshPM9tiK7SDLKsOsSad4fl3ru
         9qJT+ZrDdjHOoUITH3SMOwm0apFl3MYZVzWAAZhbibfsBpMstQTbP0O5XJhSQmSkW6Qd
         bt4DR36aGrZWRJuT+8gRIIeyIqXqni5326UP7ygDRLAdh6LGBZDQMfujXohtsStr9mU8
         pOqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746166852; x=1746771652;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ALjZo4nsA5qjfQOan39po5IsHvWCWo2OF7h1r4+hFaU=;
        b=JxncNa5+LzoUHKxd+uQBfk3SoUg39W+topalDaj6cJwsFYTEXP/vm7UfIYWvbN2eeK
         MT9cBJWKvown3DvbtXSilT3CuKIyxx2E/TD79NRCUgzDPNVhsfD95tGxADatnaivvJ6V
         w/KG6SZcu8l0hf6bqzuTbC49C3n9wPFXMTM3n0eXCaoZIRvcVQsaDPWCXgj9Xuf+vjwy
         yr8shu5s2PVvphqY1JURKDippVSPhNqxIOt9wZM3rtKtU+96hYvNCqMAk03Sc9/Ob0w6
         DAykgcOcyQXJnFXd7j+IAMXC/n0QobCPFq0VsRdwaYxpApH4vW8FXc4Emcdwq7OcXrhw
         4KMg==
X-Gm-Message-State: AOJu0Yyg7bPDnICUG9AGmsthssU02g0ywGgEYXcyYMgHccHJzd48pMdo
	ECtZL3afk7WgHiGVfQh0rSCr11gF67OVai+mNHXmZg8axB9CsELVU9oUXGMsnwGA26rmE1pR49/
	5
X-Gm-Gg: ASbGncvhdlDi3RVFbOwl5cGLMIKUvo7kqpapIG14Trhn2l7B+GMc53mhHuAI/nNWiPS
	Bsq18nFRAsozDCKfPCzg7VyPuxUnhEgWOue/dPSOjZG88/IdNYj18pt8YI/Npd8sAD4AFhGJ/Yd
	TVWl51tLDQC/TAxeGf4rkEVqn6x6Ks80B5zaHaY8y3PMEl49QsahLFS+TeFqqBoJD7hChzPQdtC
	ddP0u4aLCDcsz/g1VMUND79odXeELGz/BXD4EutxZkYalD0rOlZDt2T8xGAaQl3cTx1EyzNrh9A
	b/UrD56JZjAwmqHSI3oaXsIdHq3qvOWI99H2R+ByzVFGh3i1R1Abd8Hl26OYWCbIAnuDTw==
X-Google-Smtp-Source: AGHT+IGatAOjN+CPRNWmh8EULSNgYhvUBmXi50L7HxMw+FYAqrerH/HdVe3DZumQpm7UJ1O3N6pdbw==
X-Received: by 2002:a05:6000:40ce:b0:3a0:9518:9c82 with SMTP id ffacd0b85a97d-3a099a8a7edmr361021f8f.0.1746166851681;
        Thu, 01 May 2025 23:20:51 -0700 (PDT)
Received: from [192.168.1.28] ([178.197.207.88])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a099b17748sm1159725f8f.100.2025.05.01.23.20.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 May 2025 23:20:50 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 02 May 2025 08:20:35 +0200
Subject: [PATCH v3 3/5] cdx: controller: Drop useless probe success message
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250502-cdx-clean-v3-3-6aaa5b369fc5@linaro.org>
References: <20250502-cdx-clean-v3-0-6aaa5b369fc5@linaro.org>
In-Reply-To: <20250502-cdx-clean-v3-0-6aaa5b369fc5@linaro.org>
To: Nipun Gupta <nipun.gupta@amd.com>, 
 Nikhil Agarwal <nikhil.agarwal@amd.com>
Cc: linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=920;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=AuIYf6cuEPM2I1pj5QmyT3WTpVD+4qPkOEdINsIPKkE=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoFGQ7E1YzD45ltS7og8Gm4LxlxnS2Sp+zrqSo6
 1G0JCxIrciJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaBRkOwAKCRDBN2bmhouD
 1yj9D/sGy5XCfqezN4DOV3C5Fnl+JerYg/vF62aAxmTuugd4pTRdZIiYy7f9kbFhcQifIeOMojT
 92PnmHRNws6lC71ZrceLJh9XFSPfp4sESrGIFOJLZRCEBrdEt/GIQtHzLeYQkMPoHNL9DCHNMjR
 k5PZeBkCM2wkSynz/C9AJtwNT1S3VcKg97+rhBqCBNTrwFXAMSlHawQlpjyQ7nwmywNz0iKWBPF
 BAEBKoXGD/HgYFA8/4r9G7SUDPJwcykvdmTVfo/XIijC3EBCnBDTw58It0F50Z7kr1ANAt1wqL/
 s2sHWj4+/VGPhml5UXuKlefC57aTSP2QaXO6vOaAdTokzgKg0Q188TMe8PPRmhfzSvjKfiEDfor
 hZNGUF36zTaMrUYHCbSUubP6j7Igw1LuiL+eKtifZZNJFWAofxfpstHCLGLUrmcZXcNhtk1EOIJ
 P6STU2h1at9ut8mVJv3tuW3ffgZuOt+rqZnGasPi5hrvTXS1FrA7pl5iG7Wjh5f4Xvm9rZD/7bn
 LpYbq/5MAuYAbZmo3JdUbfEn/1fmVDPrDglq1Zxi/gNmj7kSJKXZuubyd2eAD0OgYrgL6AMXAmX
 vn5zt+SOhCT3rtUPF3LB0Iqubx/HwSJ75BtGVbX/icMZrUctMj0ssksspIwdaz6FvDMjznndyAI
 KlR+umxeEqkV0gQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Drivers should be silent on probe success, unless they print some useful
information.  Printing "hey I probed" is not useful and kernel already
gives mechanism to investigate that (e.g. sysfs, tracing, initcall
debug).

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/cdx/controller/cdx_controller.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/cdx/controller/cdx_controller.c b/drivers/cdx/controller/cdx_controller.c
index 3df35833f0e0a994af0606eee0dc1dfc9c7c22f9..fce90926d3378ae60166426cbf8e4a4fe014af86 100644
--- a/drivers/cdx/controller/cdx_controller.c
+++ b/drivers/cdx/controller/cdx_controller.c
@@ -205,7 +205,6 @@ static int xlnx_cdx_probe(struct platform_device *pdev)
 		goto cdx_rpmsg_fail;
 	}
 
-	dev_info(&pdev->dev, "Successfully registered CDX controller with RPMsg as transport\n");
 	return 0;
 
 cdx_rpmsg_fail:

-- 
2.45.2

