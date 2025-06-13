Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7373A17A30A
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 14:21:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749824462; cv=none; b=bkac4ZceHvFcD417IhKY2ha+oYVW9hP+ln9YRCbyOMeh3sm6pdNBfC9fsYsQZJuo5/7LXqu2kH4VmmftOYHCRj/0SUJ5hwn0jUgQOd/Sk2noO6jB524Rt3Tdlr+uN2iRvUG26NzVcv7BHWtMaw5X3/71TfDpVXongk+Z6GYgXbY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749824462; c=relaxed/simple;
	bh=8RFkh10HvZ/w2jf/t+vYn3rNmrLXvK7k7dDzREKy4dQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=e8cbZx/httR/3M8Wh9x10ILqI+3dJXFniT/4bMfnFqMBryhYIm5jA20CCGP0TMHoxkcP3A9cmyQaPCCfA69wzN/OsekFpmXc50tgF2wVXdcfM7deww/XbJT+uHbnNe2O6gYIUkVWkw3H1DIp2MNItv4UR757o3gH3z5kEO06Q1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=eI/LasO2; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="eI/LasO2"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3a531fcaa05so1292106f8f.3
        for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 07:21:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749824459; x=1750429259; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WNv7YJdDrmh1DAA1lS0dRZIzLrEmVq95r6unZgFCZ3Q=;
        b=eI/LasO2tnjA6J1Yf7mSkjnnWC0eQa8CS7Y9YOkCwi70K2w/IRoU8L8lNkKy5yUUR1
         TA4qF83dDv3l9u5low2DaHl2Uq5tURZp4bu1qwM01jIXLC2uEX7otbJ203LlPfGbe294
         I9+DE+UJBwZ/lbR73CqU3xtZ67Vo9MiPuPamra9H28jb2g6+A/GeOMD7WhawQ95xVBz6
         Cc6+rqXD4j3Mib6pKWkq/sb1Ok6rxjyDzYjwLt1MlowG89eHjrUDUyXYwe57Ix6C+NND
         aDwWSVTjoYTzuBfuG2IrxgCDR9IH4+N5kpxbTeSt6KdQtbc6jL4EFaybw93MvKhYloZw
         bPxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749824459; x=1750429259;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WNv7YJdDrmh1DAA1lS0dRZIzLrEmVq95r6unZgFCZ3Q=;
        b=laIrNieBxR4p36qrkrfC94BVERYvkxR5Of9Q81frfW0aCL8oafJJZ20sSR61Yx1iEy
         aG4nLabuvxSb6hP0xGbFNjZZbqGfErFeuEcNZSUFJ5vu2OG1Y5Bc8MnFvmTHj8owYa3B
         gO5Gvnfj2n2O3Fyysgtm9SeQwhFR4v8PIe+SGWuBHJqt+EOO8i2qp/UNfGDN8OAOJCe5
         4WSpTibFJ+v5mArNQA7zI4YB6YxZLHO9rNlHARJ9v0sesrvHSWfysqL+2IsH3dNGwxxL
         bFVF3HAuk4esXKSyGhO+ydK8yE3LJEGZbM1SHwebpPRaqtgG1vphx0+TQwroQmJJc9Vp
         PyjQ==
X-Forwarded-Encrypted: i=1; AJvYcCVxkBLMbM3BUqmz9xkq7IbAOkASpEI8RSUcZJEfELXH17YMm8LW2+F3iV/2zLUTSUczXE/dyf8qsypU9H8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwfOk/4DOqp0zNXuArQUOZyGNhwDTAfXl0TxEeanGkrXyjT4uEF
	Q7ZT2iXLkpKR1jde2Q1HW3RdU77YxyKb4PRDdEGicWXkXswdL2u0Hf68jM49mbVkE59Z2qAmXtJ
	prDQWnX4=
X-Gm-Gg: ASbGncsaMNej9+6tv7zzDEoan/iMVyMBcLsv4U+Xh06CVWjdgViOJ5uE7VlqinDxNFR
	l72i+RBg8yZiY/GmlaPypJNWWiNYU7Qgd5bV2cHLJEoJZ1MAcEG6fGWoalQEmPlLTncGbaSZrCK
	BPvV1S54iCOSlmsP6PRlc4NprkcLVjwYWJciWR5E+XJtMkweNSVHk6HumuGBbzhjP2cCzaJW0lC
	kLAB1n+ELhNXaZOz4CHrtkrtlae13Q4LcdwIAKzPyXltMaknRmbFlHGMm2hOFuZbBdyKJuhjsfL
	U/NzJXQ7bpUC20Q2CX2pEEVpCzQ7SetKHII5MzqCNTagJPyz336rTwRINTn9J3/KC42KsEOXotd
	b2xjwFQ2G8LTXOCX8TjSn0UcyIJ4=
X-Google-Smtp-Source: AGHT+IE+UNToq+LVvyKCGQgv9Z4GcwrsaV/DBnUpsoTzZB4YzEzxKPVKycpy5RHgs0fTAZp+V0+Jzw==
X-Received: by 2002:a05:6000:420a:b0:3a4:fbaf:749e with SMTP id ffacd0b85a97d-3a5687298efmr2771830f8f.49.1749824458733;
        Fri, 13 Jun 2025 07:20:58 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a5689e5f3dsm2557756f8f.0.2025.06.13.07.20.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Jun 2025 07:20:58 -0700 (PDT)
Message-ID: <98cee94a-c9c5-46c1-b6eb-f5141dfceaab@linaro.org>
Date: Fri, 13 Jun 2025 15:20:57 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] dt-bindings: media: venus: Add qcm2290 dt schema
To: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
 quic_vgarodia@quicinc.com, quic_dikshita@quicinc.com, mchehab@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 stanimir.varbanov@linaro.org
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250613140402.3619465-1-jorge.ramirez@oss.qualcomm.com>
 <20250613140402.3619465-2-jorge.ramirez@oss.qualcomm.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20250613140402.3619465-2-jorge.ramirez@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 13/06/2025 15:03, Jorge Ramirez-Ortiz wrote:
> +        video-decoder {
> +            compatible = "venus-decoder";
> +        };
> +
> +        video-encoder {
> +            compatible = "venus-encoder";
> +        };

Not necessary, drop.

---
bod
