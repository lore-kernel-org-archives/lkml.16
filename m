Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FA18227B8C
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 12:57:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746709077; cv=none; b=Fa+WkzdTtE5Vr7eAhOxJqKGd7ZNouxoSGlAq8+CzdXvYHriFeogNxv83ygklWg473KwG1KBLZBKwiVSXDgNkzD36CyKVrwXb+HgIiV2ZGz1S9M9UD8F2OoBQL3vJrvHQJlvcGBxkq6r3MCJQEz1jZaml013n3FjsCj1VpsN955Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746709077; c=relaxed/simple;
	bh=h3od/OZUMN3oh5T0hUXF8qsNbZ6GG1EY18oqLAL5I5c=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=NGX0yiY3RersoZIvU6+yCsJz7i4ReFE0ksnRBDZkbLAh/bhFBhTsMqf0UuycEQDs1Ov8+OZsI4166RiAd9zVgnkY7mmaL91Gt2A5T4IPdfpI75SzRFACsFOjaHCsgzj3hrf24Cfx9SRSZvhYc+GWEL88NO5zAhO4XDPgBFcyLqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=f8fhPjbf; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="f8fhPjbf"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3a0b201faedso144532f8f.0
        for <linux-kernel@vger.kernel.org>; Thu, 08 May 2025 05:57:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746709073; x=1747313873; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=41fQ9P7nrmZ9gEDUpXifgmNoxRJM6C9jPn3nPNbCsy0=;
        b=f8fhPjbfnn2ANzdlY4xQ449xb/u7gjfEm6ervwAXJHH/ohSsauTBQxrnBK9OdhxbC/
         dw7M23DqSS4hb3ZJhmpeqFsg5oSWPlM9tQh0MDfPu8W5Jzm3DTnc8puPFoq6CRcNIZrj
         Oc9LSQpqkzUxsQXXht4UJ5nBxJuKhvoVRwT30OrMkmUtFEpN7xBySXuwdxvzrLoykh8l
         KIhzjSde/CEtw6R9YEq9l4YyWoSmC69BAHJj853hkTPToDXUNLIC1k/Ate9sVBntcgbz
         g6/asn/s8eBcW00PNlwnVaCWcJ5+ok8NHGLrSZCYJxd5W+EJRj/sqFbXJLYOeJb66CJ+
         hhNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746709073; x=1747313873;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=41fQ9P7nrmZ9gEDUpXifgmNoxRJM6C9jPn3nPNbCsy0=;
        b=WRL7iho2Q/PUoSkGQCVOd2RsVZFw69Zm8PCoQSAaAPeB5mEwh2tKa4vkkIjsIdXvhP
         0iPLU8DEbqKwCGp9heAxchuIDW6ffGIwmB2OEG5DehvKUPYJ4gkGulfJKVzswGu0H4PQ
         B19w7Vs8cmUHltUjNQztJgfa4GPhtlpluCApUgqvqPuPu/aNHtM8Jx94TPWWB3iBZpIR
         XgtFao9sXCAHiHWPaQSMaTEJLXcyYA0T18Ma3poYIpHMr/WRO+lMk6Ao+y0Poqho5RPh
         78u0td1coK98hBL5C7WW/DBejABK+YFurwNYbGsmHM6hp8NfMD2WiLkKeU8dt1U9BPzA
         QJAQ==
X-Forwarded-Encrypted: i=1; AJvYcCWW+RJjDbUtKNcIKZWXLY3eYgBTLpSdLFJ1L0BIHGWIfyObcMOdnFPm5AjhyeBCfZvKfWKRbzb/hopGovY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/orj1qYKEO5P+cMOCN4ed9PKO+IZ0c2eqpqYFlW1fgo1ORruV
	ENH2yXKb5jnoQMBriS489X/tKE78V58EX43/EPSjGFwjAhOOlVPV7Z58bne4jqx9o3EjMIWxYXw
	y
X-Gm-Gg: ASbGncuwEw3JbEJ03cnlNKqXctS5qDxN7qJXgpFWfWK7te9RqCcgV4fk8aW5n6JlOSa
	4qZ1JN1pa9JzWeRYfAcYUP9WkGP/XCfbURQ7KcTep8TaNYvZBuabyDgBTERrcE9qHogaLhOC4Vn
	iWaUJKnfYD834joWgraxzAD064nIqaRVOLS4x9O+/nRcWrN93UZ2vlrhRztJAX0pTggxtzqqmUW
	WRETkgZi6XHeXwTNrRE9hN57luQ/sawYM1j+tXhp1l2eOn1nEJAU0Qb7R1K9MKLMQUrG61B5Dom
	3Hm27eEzfGt7kdng/J5cCeNMhdzNYz7ycYbgVKhhSSYPesG9gdQFl2snHMs=
X-Google-Smtp-Source: AGHT+IHkKn5DpCm2MDSIaZEFKIGhgLbqZ2SLsDQ/T7AcbdUeYu5WwW/A7NgfILFa57g/wXMpeGSoqg==
X-Received: by 2002:a05:600c:3d0c:b0:43e:94fa:4aef with SMTP id 5b1f17b1804b1-441d44ed538mr25318955e9.8.1746709073277;
        Thu, 08 May 2025 05:57:53 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.207.88])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442cd331221sm36183705e9.11.2025.05.08.05.57.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 May 2025 05:57:52 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: peda@axentia.se, broonie@kernel.org, andersson@kernel.org, 
 krzk+dt@kernel.org, srinivas.kandagatla@linaro.org
Cc: ivprusov@salutedevices.com, luca.ceresoli@bootlin.com, 
 zhoubinbin@loongson.cn, paulha@opensource.cirrus.com, lgirdwood@gmail.com, 
 robh@kernel.org, conor+dt@kernel.org, konradybcio@kernel.org, 
 perex@perex.cz, tiwai@suse.com, dmitry.baryshkov@oss.qualcomm.com, 
 linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 johan+linaro@kernel.org
In-Reply-To: <20250327100633.11530-2-srinivas.kandagatla@linaro.org>
References: <20250327100633.11530-1-srinivas.kandagatla@linaro.org>
 <20250327100633.11530-2-srinivas.kandagatla@linaro.org>
Subject: Re: (subset) [PATCH v6 1/6] dt-bindings: mux: add optional
 regulator binding to gpio mux
Message-Id: <174670907131.90037.7280261510052841645.b4-ty@linaro.org>
Date: Thu, 08 May 2025 14:57:51 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2


On Thu, 27 Mar 2025 10:06:28 +0000, srinivas.kandagatla@linaro.org wrote:
> On some platforms to minimise pop and click during switching between
> CTIA and OMTP headset an additional HiFi Mux Switch is used. Most common
> case is that this switch is switched on by default, but on some
> platforms this needs a regulator enable. One such platform is Lenovo
> T14s.
> 
> This patch adds required bindings in gpio-mux to add such optional regulator.
> 
> [...]

Applied, thanks!

[1/6] dt-bindings: mux: add optional regulator binding to gpio mux
      https://git.kernel.org/krzk/linux/c/e9c695067b68da6b39e0d70cd4a061d0f70050d3

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

