Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8E86202C21
	for <linux-kernel@vger.kernel.org>; Mon,  3 Feb 2025 11:59:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738583961; cv=none; b=CdlnmiDg9PAe6p6KUDFUE4latxJKyGqYnGJ4YD1AW+hEAanAeaSUCOwdzXnLQnay7Bhf2vBRQDpTQmBUdRD3o2H9hA7NmYpDtQyr8I6+qudK6/V9jgTnkB1CRHcSVXA4Hw8R2w736mkVh654WKs3i6KXfQ5KYEgyV2TgAVHeTGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738583961; c=relaxed/simple;
	bh=3NcVFj349lyJfGOL+vdcgKBeFtROFl2Kj/Ur8lBQEhI=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=KEk/SczLF/A5rD6Udo0+2DNNIJAeXW5hsmUHO5592Ct218LiNHTzytLsxOhEyggHarP4KtFyHyktMSRWhsIBlATEDXbCOUaJ1ReOSyZB17u8F9C/UWRY2SZ8UrVFXpRMTKFlwyrqkE00sTL8WAIGUkQjG/hgBats+2AGbyMP2aU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cUDqQTBu; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cUDqQTBu"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-43616c12d72so6573755e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 03 Feb 2025 03:59:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738583958; x=1739188758; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=u4w6z+wwJMdG8nN9Qcvb+agCCZc4JaIRFTNtg95ls2M=;
        b=cUDqQTBurQiy70pQBraeb0FsyWcYYdtCgA5j+pFbavTpZqrB6dreTagV69q3lCCrJA
         Xd84HBtKeVBRXYscEkp27tFjLaXQ4UFJ0YkxiJrrgO2xCm+KkKFiayJg5G+6zOohZv04
         WybjHaXi+XKmhM4PGhBEzmiqOKPh2i4KmFbyyPYMP2MRiOLvJcA+MtpdfdP6AEOHLBr6
         /WjqZ0OHDL+VU2mxbuDw0M2oTi0Xh22HPOQCAYdKXUMpanNaw9Z6yJ3ESfRkhoqeRfrR
         ideWrY9SbcZbdxBp2dIcNf/UPzB35KtikDFAwVRefnXGTx+2+6JGdu7DgXtILbtNHgVL
         m+GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738583958; x=1739188758;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=u4w6z+wwJMdG8nN9Qcvb+agCCZc4JaIRFTNtg95ls2M=;
        b=n33MIGlnwOfItjX0a3lZdV6oP21nX4jejx8xcvGHRiYyRs4w+koGtew3/91DtXq4KH
         Bm2WmpV4ljGlNb/EMT+cBfA9FlaNOsZpHHFfu1RUR66BinU/sBIDkRhWlRNA07PCE9CW
         Qgs37uLQUSWKs1k+8/NRGRS7hv0xxVEvLwZNwXeH+aBbfqSZNowsfvWa5mhJGLGSbQCj
         FKuHitJRN4bJwW1pXjHk4Nx+uWyhyFs4cE+9om5B1oM+FQTFVe0CLnxZpHmOJzcG20A3
         Br4zkb1stH65JWfJDOY+qFrRJ7CtKevvJLWpwfdArxM9bDDUu0miEF4KTzD/9EbOFl6M
         +UkA==
X-Forwarded-Encrypted: i=1; AJvYcCXm+8c9pZcwYAL+2ZvwV7G46T3QUpFHiMZ0vTWQCBD4/57ZOLOGi2QQ2GCqF6zfVtxvhMs7jaCPKhR3ul8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9OlbjYmVR4k7VZSkmcdVXYBJBNo+40Xc5MR1gKfMvKTNkcoGN
	u2sgLmoJZnbB2mMfFcMlGW8QsHQf0rqI0zJl3BFjKQM0AUuoR/++T9gDWCGXBMA=
X-Gm-Gg: ASbGncscTNYDxeWX538FWRMtAuyuMP93KlviDn9Vz0TkKeBsNnHi4fOwP7h53huXbU7
	oIhpFv3KnE4TeTVPYjGt7e2KkOBJKl28r+s60lp4ayMxybp1rKW0Yjld7IZBI2xkkNaxEy/64qi
	7xkQEkAQxlx0wNqPMot9Cv/uTdX6SRqGGixZh2Buh4ldL0/M8UCCK5OqMgCXQq6876Mtc09dv3z
	IsABYkOSU5/wPSz1cMVWOJZUE0bME+ulsNujr4uSH+D2wIJuNOr1n2bCfAPaLm9OnvBJe/mqaFL
	/hK1pi3fi1O1xDALi7xxZzLrC/IlsW8=
X-Google-Smtp-Source: AGHT+IGL0xSElRrwcfKwrUUF6e3pFFAp10ZvxPXdfiqbtaqax1cgDagk0qGOXhxfUjZX4jjdbpXMsg==
X-Received: by 2002:a05:600c:4685:b0:438:ad4d:cefa with SMTP id 5b1f17b1804b1-438dc3faf7emr70962115e9.4.1738583958145;
        Mon, 03 Feb 2025 03:59:18 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.144])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c5c12247esm12921274f8f.53.2025.02.03.03.59.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 03:59:17 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20250111185402.183793-1-krzysztof.kozlowski@linaro.org>
References: <20250111185402.183793-1-krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH] soc: samsung: Use syscon_regmap_lookup_by_phandle_args
Message-Id: <173858395687.133675.813378795094586109.b4-ty@linaro.org>
Date: Mon, 03 Feb 2025 12:59:16 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2


On Sat, 11 Jan 2025 19:54:02 +0100, Krzysztof Kozlowski wrote:
> Use syscon_regmap_lookup_by_phandle_args() which is a wrapper over
> syscon_regmap_lookup_by_phandle() combined with getting the syscon
> argument.  Except simpler code this annotates within one line that given
> phandle has arguments, so grepping for code would be easier.
> 
> 

Applied, thanks!

[1/1] soc: samsung: Use syscon_regmap_lookup_by_phandle_args
      https://git.kernel.org/krzk/linux/c/00c1fda73df8081f40840f860c8d75e2c9070d48

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

