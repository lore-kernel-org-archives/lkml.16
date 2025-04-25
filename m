Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD3FF2580E0
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 11:54:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745582046; cv=none; b=RYUViMTgYXf8477buqyB6McvAmL108Wqm0W8nVt0GBbrWS33OyWDKrIagCUcgA6LJDbVyuIIi/ZC/nP9ZDpniyhn9zN9A+4AQAFmxfDJEXAWDlQg+pQnoN+YR0bN+4JDwX0F1xOys6QCbHjfOUUbescgxEJQqqHT5i1EPJR9z5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745582046; c=relaxed/simple;
	bh=XeLScYN1m0ukjFgUD/1D7cLPV73HY95z3XyksonqFU8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=l6GMCCRKjmkMOk+QmQ8utY/CFFWmpuspHqMmwST4cl2ibcj/kz079c20T3CW3f3EAvT1IHJB8OFnaYYJpueni2xgtpeBgWkABXEAFzm86j/6EC7oFqT1d6lqJGYV2uGqvtbqcQ0Nk99ZjW+yqkgyGHI61eSEl2nl9G5igfQ33o4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=zIAtgyz+; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="zIAtgyz+"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-ac2963dc379so317157066b.2
        for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 04:54:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1745582042; x=1746186842; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=E5p8Y4tKvhmWdEJbi8Vucn1osV27ys6A00EvEG0UdIw=;
        b=zIAtgyz+LAQo1CYtBiB/esImFaSmFbdAKFrr1H5zoB6BTdelC785RBfiGM+s7qbN5b
         gsPqq7SB6IHBkOLP7n2cKTfDoOpINGBS/QUQIM8Sb0rN1K7QTohNue2Cb9z34CT9aavY
         6vEVDccu8eLdFEZOtP0dPw+KZ71Ck2g791dPpgaNZFsXaZRqOKzdkr2hmnj6M3GU0j4g
         igYg/G+WJrxZGEKp7qXmXW2p/RePaZ/XShB9ux0kqeZKkfA2jEy7XFZx0KuJrWF1l1gw
         eHvPmr1fOUeWHExp6pDe7Um6ovh6sNUhBy4Bw5qaYWnBFkAxMneHiSPn/qD+K3MQU47Z
         4GHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745582042; x=1746186842;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E5p8Y4tKvhmWdEJbi8Vucn1osV27ys6A00EvEG0UdIw=;
        b=nwgUHhw1fo84isEJFQ647CG65ADplbPX790lQHOs8OnDKclToyglZSyYDohcD0+ZoK
         BjdWxSmG9xqrCLSGgdWc9YTlSGDq6eVgoOzWx8sZwlixPKKXCeWY5dbeETCNrRG2qKVM
         MvzUh4FfPuP11/NLzJ/B1yQWNAHcXK/grXzMSlSRK1PmfFw+gzHrk/hL9WQdcK7pJQ78
         uTK5jUEpKkvAGt0jnj6Bh/fCFKW9/YQWwg0y0lpCALxB2ro/dsanD4qmGZx37LfQYZG1
         CuLYpzNO9V1QXhQuI//ZUue+7z9XDln8GtXBOixjoPkUxROv7hRGnLlvUqduepHc/sng
         +uRA==
X-Forwarded-Encrypted: i=1; AJvYcCWtWS3ZOmbMmhDidPNudJOuSsA6ykuZqeS1n8icN9m2Zw5Gt/uDmUkh2Vvru/kfjjT3+E3pyrJYE++30fQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwD8kCFE5IBez4jpjs27g7Xbi2WwJGnNSuDQtnJJrVyjlOP2ngy
	8nV2ewM1mWTRhUlFFtHrIvcj9iwpT5+NkrSNOalrPj0Yk2UipnuGq6Leay9nZZVNbY558F1QRYv
	Z
X-Gm-Gg: ASbGnctpYCl2OljVpP9XtqKP34LV8ZSulvj2epkrPNxR0aclsVL1gXy+qCT4CF1Tnul
	/o82AQ95OtwQJiaJwBKi/pGd3f21U37jmcIr3z/hihje3+hFyp4zpjF0l2M9jfwqzzC2zpPM4Y4
	oD8aSTD/K/jyJIo1RBJbvljMEEVA7BtRvyLunfXg3CVm5/C9keCqmI0ZqEal+AKUZF0TS0pf+dY
	1LGrMIFTduMFbM9g8CW82h0sLvmVUusjv9OKzHtoHXSnaeC08EPSq0g5MSSdKKc4w8F9yKIsKK5
	EAD8DO+VOV06cXXoMuO4yQFGAtskw5T5cwXpvgREJYrGOQ9KVNwaas3XYOD5cfabmzHzbjaNY3l
	njtNfJD48jfUSqnsIPCLvCJetG9fW8f5xOyLKNNv/WmWMDcAJRrYmjAuU
X-Google-Smtp-Source: AGHT+IHXVxQr9EKAcQoitGTUZluFbCx4sSSzrFsb4EnuyIfexq+vDee5puKelJFBvsXZN5mVWwwbUg==
X-Received: by 2002:a17:907:86a7:b0:ac7:7e3e:6d3c with SMTP id a640c23a62f3a-ace71425b3dmr210673766b.55.1745582041986;
        Fri, 25 Apr 2025 04:54:01 -0700 (PDT)
Received: from [100.64.0.4] (2a02-8388-6584-6400-d322-7350-96d2-429d.cable.dynamic.v6.surfer.at. [2a02:8388:6584:6400:d322:7350:96d2:429d])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace6e41bc36sm126081566b.33.2025.04.25.04.54.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 04:54:01 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 25 Apr 2025 13:53:48 +0200
Subject: [PATCH 09/11] arm64: dts: qcom: sdm850*: Use q6asm defines for reg
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250425-q6asmdai-defines-v1-9-28308e2ce7d4@fairphone.com>
References: <20250425-q6asmdai-defines-v1-0-28308e2ce7d4@fairphone.com>
In-Reply-To: <20250425-q6asmdai-defines-v1-0-28308e2ce7d4@fairphone.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, cros-qcom-dts-watchers@chromium.org
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.2

Use the MSM_FRONTEND_DAI_MULTIMEDIA* defines to make the code more
readable. No functional change intended.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts | 6 +++---
 arch/arm64/boot/dts/qcom/sdm850-samsung-w737.dts     | 6 +++---
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts b/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
index 7677acd08e2d176be932d3f726fe5602cf8d50d1..3b28c543fd961c787d7e788995f8fe0e980e3f68 100644
--- a/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
+++ b/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
@@ -612,15 +612,15 @@ &qupv3_id_1 {
 
 &q6asmdai {
 	dai@0 {
-		reg = <0>;
+		reg = <MSM_FRONTEND_DAI_MULTIMEDIA1>;
 	};
 
 	dai@1 {
-		reg = <1>;
+		reg = <MSM_FRONTEND_DAI_MULTIMEDIA2>;
 	};
 
 	dai@2 {
-		reg = <2>;
+		reg = <MSM_FRONTEND_DAI_MULTIMEDIA3>;
 	};
 };
 
diff --git a/arch/arm64/boot/dts/qcom/sdm850-samsung-w737.dts b/arch/arm64/boot/dts/qcom/sdm850-samsung-w737.dts
index d6d4e7184c5603864668057de79c7497ad361ab3..a676d3ea01b997ec9663199fe04a230aefa555b5 100644
--- a/arch/arm64/boot/dts/qcom/sdm850-samsung-w737.dts
+++ b/arch/arm64/boot/dts/qcom/sdm850-samsung-w737.dts
@@ -425,15 +425,15 @@ &qupv3_id_1 {
 
 &q6asmdai {
 	dai@0 {
-		reg = <0>;
+		reg = <MSM_FRONTEND_DAI_MULTIMEDIA1>;
 	};
 
 	dai@1 {
-		reg = <1>;
+		reg = <MSM_FRONTEND_DAI_MULTIMEDIA2>;
 	};
 
 	dai@2 {
-		reg = <2>;
+		reg = <MSM_FRONTEND_DAI_MULTIMEDIA3>;
 	};
 };
 

-- 
2.49.0

