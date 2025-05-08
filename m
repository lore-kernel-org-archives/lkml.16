Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B48E26D4EE
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 15:13:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746717204; cv=none; b=S3h611UFN3yvwj9D/WCPpU0K9h/tz51VM431ZSeRsmfHY0vHE4NM79jCSdTZmefXma7C+jSbN6p1uCVbE0qIMIJvBFchTFM0VWYCqEdN1HedYrGA5Hm/ktU3u2NjO8wVG0+j2wPui3/uVTsBYwxSo4DR5JIELqFJcKTVI+ADTwI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746717204; c=relaxed/simple;
	bh=er9JruBJ1ROI98KBkKzyBvjmSvmVDo6LqUcMUzcey54=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SZavK86SIORZH47n/nP+dI9RUvwvxXUtsfC4Iw55sBviSyG8rIG6WPi3qE2HL3+47UF0XQTqPfbgjrlFM8GV6RNLsvKfLKMr4HlzLIy3U+5etQDU2xm+s4Tg4DxSIcVN/XcGeSN3A4FGVvjsLTewGKMwodY/UwR4zt/R57gc4Zc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Bjxh68Z8; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Bjxh68Z8"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-441c0d8eb3bso554835e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 08 May 2025 08:13:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746717200; x=1747322000; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pN3djr/Ox6iIz+2iFp54kpKXmeWRt4ynHX38XP+wEPE=;
        b=Bjxh68Z8DmWvTMwtMfbaE4hVNiZGAvUR3uCZghFI9uarO2lLxLqkPafhkStoa1NCze
         CRWZeGle9kY9IiQ4dRrb/aehtzifsPWMdm7EPB6Hb6i7yRPGI0oaqqkqRheq9O4bFEHc
         0It3Ohi1KoA8M7pnjTJhyc6HB99P25pQeuaUrniuqAlyHR70xsJeB02BOfUuBuDR48wH
         3SWgNMxZ0GLkipTBNIDk9tG+lartAbOh4kX8V94Piu90hHW4DBpXgJ9kWNdnhM2iX9L6
         xBL+lkLvQjqIikRpkdCb9zmAAPkx/+8qkPk0OsVgMZkmc3kVzjummaCufjF4v+BzcDkQ
         7t7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746717200; x=1747322000;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pN3djr/Ox6iIz+2iFp54kpKXmeWRt4ynHX38XP+wEPE=;
        b=F5tJecw63fB18oxzfqy1FApVLpVGhr4tqPJO3s2BJW1Ho+rwspkwCOb585gFnP/75Q
         4Pzs2mAYhosBWLyU6f7e9ONoeYOO1gisCJ6wg+N6uInPXZUgi0+qzzHpAMAoK20CBSuw
         cgwGkgwqqOA1W+RKkI6txHX1+Vkbs0QgKkfKDVUO2fkyZaGQTF/vwyWn8iqSUN4P4Dz5
         X8cyd0S4bzV+Q8yurnkNGEYuFCN1hY+VZNGKxHVOzXhgCC86M3uESDB+2bkkgDqDwub9
         9NICKWtst8QS2K12v8QjMLRPhE+R/TMd8+4p1qrQojPmULlx7SsfBq6N7J2XsVgxBa/S
         ig3g==
X-Forwarded-Encrypted: i=1; AJvYcCVh7PdeQPG1M9p3dnvfjNc0079grwZxEmBDcW2ayCLyLO1Ore6v4W9JkUkHOnPM2wv48/WAdkNKxAdqLTk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwMjtJRD3T9Zqj7yFOrdEgHNdszB2xnNPAC8B3KYTfLp51sX2oR
	4XG4q08qQ7BjWis9ZUcbgxoEz6H0EKkbXA77tS5s9Ne1NQrixcMZKpWv6nFFj0hItubIxDjupPV
	B
X-Gm-Gg: ASbGncvZzdPcE5dWJ3wH5Jq99qUJmK1EHbFCudIVobidlu3iMgUoNSvjlRDBxzE+bZW
	98bImsqw7YxzfSx0HvyH3gRfstUbPeI631om5B//TM2gX093K9qwwRs8WsAY3g6bZIww0mGuvJm
	VcWi0SxsTSwD0shTtYOP4OgWHNgkBjdNj562K+wwo7sh6Iy/JCm2vGBh/AwWRH4xMRASowwfEBS
	SNjpXU6OqQseLaULG8H4LDTNiUP6eRkCKND2a+ymv1KMATb87hryvEnxzkCIRZqT0DZt9rSX69W
	sIy291aEvvO4f3uLYmKJAvjS3IBFRPIBpTnYyZrTb8vNz/5Vdw==
X-Google-Smtp-Source: AGHT+IErviNxwSHugUP393ShTXvK7BVPilsbdU79yB5PzcgGeL2DYiovzo/BF006+TE5n8rgNyPDcg==
X-Received: by 2002:a05:600c:1c8c:b0:43d:fa5e:50e6 with SMTP id 5b1f17b1804b1-441d44ed5afmr22861605e9.9.1746717200589;
        Thu, 08 May 2025 08:13:20 -0700 (PDT)
Received: from kuoka.. ([178.197.207.88])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f5a4c5c5sm224684f8f.96.2025.05.08.08.13.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 May 2025 08:13:20 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Mircea Caprioru <mircea.caprioru@analog.com>,
	Peter Rosin <peda@axentia.se>,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v2] mux: adgs1408: fix Wvoid-pointer-to-enum-cast warning
Date: Thu,  8 May 2025 17:13:17 +0200
Message-ID: <174671716287.210402.13952248395866315913.b4-ty@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250501181819.164207-2-krzysztof.kozlowski@linaro.org>
References: <20250501181819.164207-2-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Developer-Signature: v=1; a=openpgp-sha256; l=613; i=krzysztof.kozlowski@linaro.org;
 h=from:subject:message-id; bh=MFK7NgR6Otww9YF3htt49ijPK122UNFCKRwH9r78zG0=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoHMoMGjI3HHuD7R72fnl2vWtIT7CgiSNgnZ2dn
 5GHAqp0NyCJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaBzKDAAKCRDBN2bmhouD
 1/fZD/9s637We+pp6QFCgEj9ISIZERl+RgwhtJjFmYZ+k/TmCj+nothOoPBX3APPiEGbgpINRq1
 c3uQGct6eFZSRXKrEOVQ1RNyfda+hrJrDnJOzVOPKuozcrxEmfCFqvYgOpTcL4lmlQ7FCHXrBm7
 +DBzVax6pXxdUFZVKFoh//cf1bLuR2OxaNMiiacOtlXlJFFwVKwd2slLx8nJlF2hu4PbqSY2Fuo
 EFcwaLv4IafchbvBIILDzy62rS4/Zd27ax0e1VJFQZ9bezCTnxcyeTdqDF+zwL7xD2rfCWdURvY
 8ytEEXGT36Yyi5EOPM5/MXrMiba6cLlL2UYVqz1JfS6Qs0g1V+Zsp7QvHzM1HfsChcNNdUdBwKD
 2/pi0rKY/R1v46ZkyfL021uouK+3Lka2RMNBeW6C73rBHN9cRwlI+1giZY8hIfiMhKGETznUzt7
 MQYLfbi3whZbve5H0vymkeUIK4XtMGTwe6BAL+V73aqIS/J8Wi5crsKw4m/bAOYM/jQd4yOu6cA
 8qG3rQWrJATTrhI3xW1pFTsNw02QZBWBF9tvkIshdUFKSmMNLiB1tuH1ncyk0rr2T/lCr5D/xVc
 Z6Rh7oGPKRTBSNnEhrd1zLdkM8Otpk2lyzU5AvZ8SH6MVcV/TD26mGg3isOtJ9TNKa/jnqDYPS8 i848Up2DeRHJc7g==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit


On Thu, 01 May 2025 20:18:20 +0200, Krzysztof Kozlowski wrote:
> 'chip_id' is an enum, thus cast of pointer on 64-bit compile test with
> W=1 causes:
> 
>   adgs1408.c:63:12: error: cast to smaller integer type 'enum adgs1408_chip_id' from 'const void *' [-Werror,-Wvoid-pointer-to-enum-cast]
> 
> 

v1 of this was waiting on the lists for some time, so I grabbed this v2 as well.

[1/1] mux: adgs1408: fix Wvoid-pointer-to-enum-cast warning
      https://git.kernel.org/krzk/linux/c/9761037d28327e0d4ee9586a8210ef6462c2c757

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
