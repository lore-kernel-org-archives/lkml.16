Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C178E1F4624
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 14:03:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744725835; cv=none; b=RaLzHVItgdGQqh5ICu6Ap4DMypdwdH9B7PuHdgHfEDRmW56413ZTeX2Y7Wrmelg/BJGJxNyKFi0qwPFkXuq3/ooT+M/JpfmORMRsQ5cotIpttMlxzhopHc3jTVx710XCdOIefGctoj4WpxVuj94WokY4XRnjAabkF1kWKwCgUe8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744725835; c=relaxed/simple;
	bh=+pO3AVN/aeyYjGs/uvZL9/pMlGhMaUlro2tVrwsvVAM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jf9M0Bqs/r4dejPfo0bhS/xKKj3h1Yc5QlCVZHjTM3WTPYoouzCsa3mG6yHDGkDSJ3dYGYXUGp9j0Ls5YiAg1NNKpbiWBCsTqw+p5juNqaJ6qxYcUROUz2NYmynAGgdldF+tHGBz3fAw2qAo7G2GLfaCg0hulYZ6J6UgrHbAvAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=G9Dq7qdT; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="G9Dq7qdT"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-39c1efc457bso3772130f8f.2
        for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 07:03:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744725831; x=1745330631; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Q95IvwcYDw3qW8njoHdtEvuzlSDB0gpbkfP8uQLrrTY=;
        b=G9Dq7qdTtj+9ILZH40N6d7BVjpFgGlkor+pfJbGGXWIrP0aMVOLCjtZ20TnB/5bFYY
         SdB1c3p4IImssY77rv3oY4pORbKs1pBE3x58RkPrnra7BvKbdFJR8VoUdhVeLsIcJJfd
         BpOjkestkbd9/PgwJQf16gmWKij+xEh4sgtjhv1GEyY4wL5l9lgU109Lj4EGFITOSzS7
         6bCqwuX4YNhRUFF90HB/CsHdkH5FE5jIlB0f7xuctOs0RisXCO5/rAbaPyYkBrbUAuFc
         xUHRV25sTT0yNC/athYP8Wd0KX/46bWQQFm912/aQZStEOW8FAQc5aUNdBbEgF+/NNZ0
         gL9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744725831; x=1745330631;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q95IvwcYDw3qW8njoHdtEvuzlSDB0gpbkfP8uQLrrTY=;
        b=ifolmnY5rlKZbXr/I4+8AbviIxcsxm202jkBdi7ckh08FmBFT6Q85S88EItxvoIMS1
         mnAZXS2xI/BCLgYDicVX9lL+43kmzW/M9epPNxaySUpBxEtHMDeWonXpFIXkjm80rJVW
         Jcgl0eOaeA+1Xw11rTx+gMLeT00WYzBNSNqoITASD7IVaiK1I8NX7IlFsyLLLzNOZ45j
         TzZVxkUjRRM3BemkIgXKqHpoSyD90WT/WLf6XUTce3bxg9q7U3s1lZ+USaVPKuSUXiJA
         5liAufywJTE81eXzulwRYJ6RampGKCglxgsWEoe3W76flTPuh+/Vr+7zdtiUirCNx1Mj
         SJ4w==
X-Forwarded-Encrypted: i=1; AJvYcCWAZbbLmYYgp6lCCasiNSScfDZmyIRtN0e4p+XS0uV9+bTOAD/SjfPJxAVa4Pa9ar2Btcb3LCJ4jrH3av0=@vger.kernel.org
X-Gm-Message-State: AOJu0YypNdrkZ9YlYEs/7UySPsc73ruay2hlVYeXKuhUgEYq6g6/l/8T
	ANf84y/r4DDxoc9PrUgyDvRWVwLkMkllO1AGCgxIYk7IZaFe5jwAEjEclImHmVQ=
X-Gm-Gg: ASbGnctiVMy3M0a8MTiIzBS3241Nqg9tPbmoIwrmThjk5iJW0JdVolfJ36uNVQEzFPS
	DZP68o+JomQkPQc/BR1x+HwqmWBKMjEBcExNBOEqNbcuDML0hWsA+qrydBeybvopJapycimSfT4
	ldrLKhpjJokvUsFbsidypQAqgrLA7n2wgx1NAxB9F1wdIlKsZ+CoLwRnWrbSAjhl0B8GQdCopd2
	VJ+lIBNtzfFyp1HXx+OpGI8tozmYKeZ3xo+ZZtMVWS5C8eb9AYPU72radEMqEGokYt8rXgeZGiN
	ehYlGhThFB2k5ocnIgavVyDx5chpkpyGQ07Y93n9pbtTnk9fCt+F00Yw2AbxlU5ZeNP4FFio
X-Google-Smtp-Source: AGHT+IGi/ESeerSQ2DGJb+UnnMQR30IonApFkItZ2Dh6XzmHMLQt1Aw87lW6Udmaph1B5TLutLSY2A==
X-Received: by 2002:a05:6000:430a:b0:39c:1257:c96c with SMTP id ffacd0b85a97d-39eaaecd7cemr13341716f8f.56.1744725830935;
        Tue, 15 Apr 2025 07:03:50 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43f206332d9sm210480765e9.13.2025.04.15.07.03.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Apr 2025 07:03:50 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Tue, 15 Apr 2025 16:03:47 +0200
Subject: [PATCH 1/2] dt-bindings: interconnect: sm8650: document the
 MASTER_APSS_NOC
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250415-topic-sm8650-upstream-icc-apss-noc-v1-1-9e6bea3943d8@linaro.org>
References: <20250415-topic-sm8650-upstream-icc-apss-noc-v1-0-9e6bea3943d8@linaro.org>
In-Reply-To: <20250415-topic-sm8650-upstream-icc-apss-noc-v1-0-9e6bea3943d8@linaro.org>
To: Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=755;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=+pO3AVN/aeyYjGs/uvZL9/pMlGhMaUlro2tVrwsvVAM=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBn/mdEAzYk06meqRmEKdkOkx1Ei6+UXDzusTOmUEMI
 fm5qt7CJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZ/5nRAAKCRB33NvayMhJ0UF1EA
 DITfk6b+D9ankrJUBkpb1zN/U0dvdlXISKYPjoRDZxS5kGibAEkWtWYrCD3ABoho8WtHpQAUkdUUtK
 0YmdSlRKDE/FQWQ9o6c/FRMTEjW/FGKavu253rCPi6k614UmpL9WEEBJay/35clfza7B9KgUarPJvT
 5wesQvQ137/8uM5zVlAUd/zPAdfYkVeDagOobGwJ2xIrmTGJ8nxZaoCBCaZzszoMu8vuuvkR+1XpOL
 P88vvR1GTsIbOar78B7rmDm+5VqrYpPuLsbr+jGmJ5aHRdp/KdR7hQ4QYE90RS0g9b4MV8WIYH7w9S
 8G2VLXFyt1HR6Qkg+T0S+Em6iweK3DXPT75drPsApXJqgneAIo4vprNBhsyQhfL+gnvQTXKi0XX9Q+
 cT7VG10wDckvOXwMeCVmSZSsJ34eVe2uooN+1sApfB3LH+JD69pd+V31TAdeeHOAGeGY4kko9WaabI
 Z6FiQLT3NVQ3YJeUTx77Gj4279k6jbxBa3XoADLBeZm8aFyuWIHsS50BEi03tpQ75LkQ9U3fTuHd/f
 BcjP6uFIjYULZtQmxBzb0r7MXvRTlEM6LIGXV3y0puiAmDj4ZQK1NbBf1ZGFb3GatuUHHQf8GKrJxj
 qzKxmCb2/MQnPeEehYUMccWBr74ExlzZjPuxyW7BkvQCqV+rKFnNs+qjkc+A==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Document the MASTER_APSS_NOC interconnect node for the SM8650
SoC system NoC.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 include/dt-bindings/interconnect/qcom,sm8650-rpmh.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/dt-bindings/interconnect/qcom,sm8650-rpmh.h b/include/dt-bindings/interconnect/qcom,sm8650-rpmh.h
index 6c1eaf04e24103c9b82ff28811c058e5203c4079..1216aa352d55e095a9cdbd45102725768b01e78f 100644
--- a/include/dt-bindings/interconnect/qcom,sm8650-rpmh.h
+++ b/include/dt-bindings/interconnect/qcom,sm8650-rpmh.h
@@ -150,5 +150,6 @@
 #define MASTER_A1NOC_SNOC			0
 #define MASTER_A2NOC_SNOC			1
 #define SLAVE_SNOC_GEM_NOC_SF			2
+#define MASTER_APSS_NOC				3
 
 #endif

-- 
2.34.1

