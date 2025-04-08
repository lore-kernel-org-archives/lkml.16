Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EA5123E34D
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 19:06:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744139214; cv=none; b=dm541XqEI42mNrSdoeFI7Rk2MeD49VJiEH8ie5AJIFpFwICM23LeMfkcjVa/bPYghVdGsg2wvymx6xA2ineQ0yJfwxf5h6vaAVuYFR/yjSrXynIR4wAQOEbeqOMp6wZK8L9ikzxhz4xopLfbbqJwZLXP0ReOZTJwRtuawY8CCpg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744139214; c=relaxed/simple;
	bh=XDO7GZgIXZbIuvcgx0MtmUVNnpEHDttID7IaGMbJf/s=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=WgtU5coaLA9dEnBulUuekOKJDKJZcC5IoyS3L7Jlw4Qri0SvjRM4kVoK98dHZcW/VYmJ07sO5pSs19BEjruYSYy47zWT/X4BHs+H+alUWr+uSjyHb9GgpC5ahciRCAp28QAgPkfkf18sM+k7HY7TLzRIHbiZFDWic8AELEmvm6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nCsWHMxB; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nCsWHMxB"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3912622c9c0so581507f8f.3
        for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 12:06:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744139209; x=1744744009; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=26BZYOZea4bfw7CNCFKawdkyJnG29aqqnfgcKzudge0=;
        b=nCsWHMxB5lf12q3hAcn3iKQHC+p2PIBTwTv3HsESAajJeiKAPJOWxUFsd9DrebpWtw
         3E1tVyXPnfZgpSPM//j6H9q8oe2HPARv6UW4HzIwfCxG5xhk7E9vnJdMQKR+Iobs94/U
         XdhNLIJ5grTj4/KQXGGnMb+mS1B+O5SDMy0DjtR84rgIRTxyZP5knmMX9msQuGYWVi5C
         btVU8DFwbqQ1RrhbupRBZQq1oI+8SwwaF/wKyAuiyfIiZyO6QkwcNhwZbzTnMcW4eyf7
         D/Fj9HWbVsoDAidtF+Mcl7LEShs2vcxN782FDPaYG2KcUXCQrMJPgsG6+LrEmSA9RUEg
         EKOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744139209; x=1744744009;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=26BZYOZea4bfw7CNCFKawdkyJnG29aqqnfgcKzudge0=;
        b=pDD+5gq9xC674+9dGjdin95uHvEqxOexkWQSPwAf1PLdDYoVLKUewTE69NKRtwXA7f
         E0OBVYJSgtW8u9x2rTcflU2WsC3rrRRJLD9ktvYySCvg8i5pQeWGNdj9Z5iMVlYsflsg
         qHgCK46xAjiYO0SvdxvHKPzfzMBMchfvErBXX7ndcv2VZf8NCr3maf2W0/fAxZ3hAS3W
         48a/jrIv6qerd7w8GmHEcQGB83Nvhy4ClZzm9Yu4mctuPOfasiXRtufIBsv0d6MtcuZh
         mK69Znxn7zY0h1zW84aZxs/Rv6ub9Xldz0LodS5WyDdjU07uwRTbthyk+FwZXR72NGmJ
         nnXw==
X-Forwarded-Encrypted: i=1; AJvYcCV33OkOAAnpIdNCWGjHGaJo0PO2U9IUWQflb8qeE/2et7C8lpJ1flu37+YPbz14vXWntWj78QqesJ0YNWo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6kKPPlYUp1pXMdfXPBZG4L7aSfzwieN7LSte3nec45eNFfug3
	fjUb349ro1WA8qz41AprT7LmM2WjM2HopC02wK49X8NBBnVqVF9emkzRTJgfReQ=
X-Gm-Gg: ASbGnctEx6hbCujiuJnvchw4wghCQKuqVR5UMgin4IP6QdXbD9XApbpqV5jZd2JYvMV
	ap3Up6Y3OedLrJpCLIhvebhoWvxAdb/BUfgC8YzEoST6Due8sI/ghTEDWympn7OJlof7/CJ4ixJ
	g/bUhNeH2VNUlho99O2rGNOnAaLMp8pwa4hiWFbf0ITI1uaGow3j/oI1AIQpVZC//Z27tyQcxa+
	nH9XIH/SWSymjAIz4N0RFUGvB6zDenXHqiiE5c3neKfV4n2wClOionS/+04sFgiFAzbSiqHsrS5
	hBQHJnh5GhHCrFyS52wfJxyG8BW+RFhZOae/fhaznjGxZj70lys6CqYgPJOrSbU=
X-Google-Smtp-Source: AGHT+IFEmj19Sjp6m7XUEA3vyo+E8QmKaZA1qZbfv2jh+SPPFex3IJzzYfOY3+icqIou7/aTD5sG1A==
X-Received: by 2002:a05:600c:a016:b0:439:a3df:66f3 with SMTP id 5b1f17b1804b1-43f1ed660damr1024815e9.6.1744139209570;
        Tue, 08 Apr 2025 12:06:49 -0700 (PDT)
Received: from [192.168.1.26] ([178.197.198.86])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c3020da17sm15853743f8f.64.2025.04.08.12.06.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 12:06:49 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Peter Griffin <peter.griffin@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 andre.draszik@linaro.org, tudor.ambarus@linaro.org, willmcvicker@google.com, 
 semen.protsenko@linaro.org, kernel-team@android.com, 
 jaewon02.kim@samsung.com, stable@vger.kernel.org
In-Reply-To: <20250402-pinctrl-fltcon-suspend-v6-0-78ce0d4eb30c@linaro.org>
References: <20250402-pinctrl-fltcon-suspend-v6-0-78ce0d4eb30c@linaro.org>
Subject: Re: [PATCH v6 0/4] samsung: pinctrl: Add support for
 eint_fltcon_offset and filter selection on gs101
Message-Id: <174413920812.155881.15584409813277033669.b4-ty@linaro.org>
Date: Tue, 08 Apr 2025 21:06:48 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2


On Wed, 02 Apr 2025 16:17:29 +0100, Peter Griffin wrote:
> This series fixes support for correctly saving and restoring fltcon0
> and fltcon1 registers on gs101 for non-alive banks where the fltcon
> register offset is not at a fixed offset (unlike previous SoCs).
> This is done by adding a eint_fltcon_offset and providing GS101
> specific pin macros that take an additional parameter (similar to
> how exynosautov920 handles it's eint_con_offset).
> 
> [...]

Applied, thanks!

[1/4] pinctrl: samsung: refactor drvdata suspend & resume callbacks
      https://git.kernel.org/pinctrl/samsung/c/3ade961e97f3b05dcdd9a4fabfe179c9e75571e0
[2/4] pinctrl: samsung: add dedicated SoC eint suspend/resume callbacks
      https://git.kernel.org/pinctrl/samsung/c/77ac6b742eba063a5b6600cda67834a7a212281a
[3/4] pinctrl: samsung: add gs101 specific eint suspend/resume callbacks
      https://git.kernel.org/pinctrl/samsung/c/bdbe0a0f71003b997d6a2dbe4bc7b5b0438207c7
[4/4] pinctrl: samsung: Add filter selection support for alive bank on gs101
      https://git.kernel.org/pinctrl/samsung/c/a30692b4f81ba864cf880d57e9cc6cf6278a2943

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

