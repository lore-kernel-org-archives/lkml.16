Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4493F1E5018
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 21:36:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745444211; cv=none; b=Z3aZlXQAyHRQwKUy60MDGCr7zkieHgXWU6hIoR2NSPJdzK1NEY/ioXO8x2yvXY3m6smgL3xTHDSAj7ntyG+9r5qpjjF//d+VxViDVST8InG5Tyzuj6O1G6kIIwFIGM21+9TAYP4w4LEmp8Io5SdXrpiHGMp8BPsUOoeZbLAmPKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745444211; c=relaxed/simple;
	bh=bLFs+8/609N5da21p6V3HY8mVyw8mskxF34anzVCFCI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZdfcBByQv9RVAYprsQCg/vLozyDw7AYaAATsIFLV4lrtQkKPpHz4CiQUN/c6nfLbzxnGK7n7aRyq40FcJ9eD0fkv8fL4IFE+qr44Ui4Dg8DyJX2iu6cX6sWKII3wF3WldAxrIXkpnY4SXpiP4s2ocoUxbzxPMyFB9cDhAvcFxIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=P9eszGJ1; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="P9eszGJ1"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-43cfba466b2so2800945e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 14:36:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745444208; x=1746049008; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bLFs+8/609N5da21p6V3HY8mVyw8mskxF34anzVCFCI=;
        b=P9eszGJ1vxDzwFgcnqRyNPl4UJaD5snD8B1AbGdJWsgcJootZkpKFXM1n6Cg/nwCew
         ol7bFG+ziEZe46xK1m515LtX1mKcpuZt0m39GmgO1yKBCwgHoE64F73veMI1I8s7pyYs
         nXrRIyS2XCJiheGBRSxJ4ZE+SBFS/hgnj6v02S7FAdSoFKkOTBrG/OxslvkBf2XvOV4q
         LGbVW5boPt9Q7ANvjbtJl43gk9CKN+1jK578htQQiyWQV74EjSJsu2aPdehrDRwhiwY+
         lK758+WoJLcG4qzQfdrkW+9JV7l9Y1AMSOqsiW26oPZeLEERwor/HgHbhykoOUWjp+bo
         bkaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745444208; x=1746049008;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bLFs+8/609N5da21p6V3HY8mVyw8mskxF34anzVCFCI=;
        b=KF7jwRlXewjBE+xyiMTZQuXXu6m70Ye1g5iknyiP0rezZLBvv0mFD5zH3vlAGZ3WPw
         h0t9C+cRrpRB2dGqKHVJeA8+VaOQR7WKVeBhVCYdZb6jjJA+i6+9+6GzhgSfuYngvZVP
         O7AFXwokL0MDZurvEYX61Q1Ep6YAfX8SMZ68xayPOdC2ZNm8MvZRIKFhy8fBN27y62Wa
         RaBMCb6EM1T+eDMsXh3MXkStoisfEyJAzoZEqO2QKkaFrG6qgw8SZ9eHvC7YiR1WBORI
         c4hGyZe9i6HEPfxnbFHb1BJcvMNKO/4kP8uMTvOBYkgHZhHZK0Nqc50mL0W9ma7aPk4C
         aQdQ==
X-Forwarded-Encrypted: i=1; AJvYcCVWly0RDWEek/AoCrU0w+pIawkTPjLJV9VBMLuf5vQXXYHgCtgE50YLj1XcBxjWooxjhiyE/X4bbtGsM4M=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyc0OBDwPtmoyKjLj3BdqznQ6e6udzFPvnWtRXL6eeSQORxrvFx
	wuo6hWeNAZwrnEx4rnjGVYtxnWEpG8G+Z85awh2r90GwN6VFj3IZVcD33aLxLFY=
X-Gm-Gg: ASbGncshfBHG3ocE2u76GgmUCmAcrGstRb7EGiUwxo1DfHJj52X5OHQOjb1XojncojU
	nqqW6XKvGj18IsjBXZcxUoB4twNk+qBn9H6He4HUNyBSJv93rRJcc9OSqthRtNkgF+ZkUsjGzl7
	wcRbwh1rlXUp0cfOiCu4/95zJDpWL0nXFjoC0c377+Fx4yJtw9orvpDxerS47V+OdFvRTXCmF7g
	E/X0Rik317McqWnzyE4VwFNJmhhep34a4PVVA24GbgHa4qOPRKHr4DOTFBJMKKk5DgKcni+Lphl
	5wq3mDacPKi68ACrJQtMSmDGNbn1oLZRjJedBbaFj9fYEFNMb0TfFjRbHZwWXK0wHHI1+Uucbz0
	Sld729Q==
X-Google-Smtp-Source: AGHT+IHX4800B8+8wispo4NFuzLS1LI13Oo5p3SlOPOoJI9EwHInwHF0S8Z/t4cJbeWZDuERNzlMOA==
X-Received: by 2002:a5d:47a9:0:b0:39c:30cd:352c with SMTP id ffacd0b85a97d-3a06cf4b95amr43032f8f.8.1745444208469;
        Wed, 23 Apr 2025 14:36:48 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a06d4c4945sm5473f8f.47.2025.04.23.14.36.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Apr 2025 14:36:48 -0700 (PDT)
Message-ID: <0e1030b2-0bf1-4fb7-8588-4019d7dfeedf@linaro.org>
Date: Wed, 23 Apr 2025 22:36:46 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/5] media: iris: add qcs8300 platform data
To: Vikash Garodia <quic_vgarodia@quicinc.com>,
 Dikshita Agarwal <quic_dikshita@quicinc.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250424-qcs8300_iris-v4-0-6e66ed4f6b71@quicinc.com>
 <20250424-qcs8300_iris-v4-3-6e66ed4f6b71@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20250424-qcs8300_iris-v4-3-6e66ed4f6b71@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 23/04/2025 20:33, Vikash Garodia wrote:
> Add platform data for QCS8300, which has different capabilities compared
> to SM8550. Introduce a QCS8300 header that defines these capabilities
> and fix the order of compat strings.

I'll drop the "and fix the order of compat strings" no need to resend.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
