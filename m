Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E59BB2749CF
	for <linux-kernel@vger.kernel.org>; Wed,  4 Jun 2025 23:49:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749080959; cv=none; b=VsG763PrrwlTH0nSi63Cq+MdRyFrAV5C/oRiNO0dIwhN2t3Vn6kignTe+rOqaw8BGNPsGlfmKFYLE55SDLN1KwxAVUvaQHAG4FsuX/bk90OryyoKqmuLSQiy0aA3ARCnWh97CX5eV+gaMOtn+qa0xhkIZQqDpZMmXtwhJFoGfOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749080959; c=relaxed/simple;
	bh=ZESbz4ELnO8zQblI3om9NB+hAW28VwXYgt6cEiXrarg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PkT4+P2piNJtoKxKcl3GfDjpgSj7QB5yucwTNgz2osbiEbwtQS/K8f++N5CTCnKSm66g0TC9/xkP79/jGOKbjJfO4WPPyt6YzIkyue34xcymkN6aJzdX5fEeSYKzEgRIRHjqb+oh4gulxe9MEymTIOaboevmeI92NmqIEFjLFmI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=eKSlsQB+; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="eKSlsQB+"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-451d3f72391so4027275e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 04 Jun 2025 16:49:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749080954; x=1749685754; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LXMgX1rI0BiX2paFRHt2ngtjy2dYKyJCurcIJGGVP0I=;
        b=eKSlsQB+axJ2wBrBCcutB3u/sEifgBhfgzUGAXXMdeQQEVtOpHlVvpd8O0jbeWn7nj
         oiPgcvs7+si4r3rftBX02Ijlfw6LrW4jkD1rHsgm+BoG/2Jbmu2CJOAezK0/MkzlDLTF
         ND2HOjbvFzq1krlSILyAn+ByDVinaD5ubP3s8qTludNEpGdVXQTMdpDsVYNZiJ4o+R/l
         oFT5QmQaG2ggRpjrY1xuc017x6gJ3sr3mxY1qfcRDjMVMrDgltopcruGloUWrPuSNuxm
         DcsFCV6IuMB+khXbT9ezTn3tk37dktAZMY5NCcqIcCSWsDz0TddBcQtkFeNYwxjPC3Fs
         P/HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749080954; x=1749685754;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LXMgX1rI0BiX2paFRHt2ngtjy2dYKyJCurcIJGGVP0I=;
        b=PXj09AFKoWB+a523vrPCLrVRidtrRg/PTpmQv9xQi0LEU9xov5ubprCmBRpFtfku8u
         tSiL6JVE1/0lbmqgfEPatLep9xaBfMaF07V2id1Ob5hRRYXzFNYFtnXFrkK/BjxGb770
         QeWhJLZ30S05Lvno0pZrND3fUEnh4YODWfF9OFMXBvpzALbOeYdoX3xReEHCcD/hcUzE
         1KFCjjt5Klq0GFP0eFn3IoRfcO07XZ676xE5cfe6YAeyiq8yqLA9zNUu75n2z+wF6YLg
         /oAGR7Xs1/m4u0SgslCc5lIxjeeTdmlwzpy2rK4wetuS28xyIjnSYtw0cp0w0iNbWlGU
         8xMw==
X-Forwarded-Encrypted: i=1; AJvYcCUxe05Y0hIGtcGUTGmXsNdEdzmVeuPm9EZgskom895lmssGu8b1FK+V14VrsFi2PznMQCM3yaeK35zqPYI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyx/ci4CsadWMKY5f83eMz0gtBLRtWw4zSz02IMh+IBL0shrSu9
	wf8LAsYT96fbEmUK/KyoV7Guo4AQEvd/8q9SJxw8J/2cKnp3Uuai5gP6Hp2U/SEc1Y5jWyFKqn3
	6bHiVBgI=
X-Gm-Gg: ASbGncv/04Z2Gupm2Xshdx/RTuxTvIAyoWpZ+H3et93uJ85prGDP61acAzjArt/8lV1
	ydzGjczLYJZYyQ29Vn4RuB1LvD4PlYHWsx8F4K2pMKLnZWgcpywlDnxvdUauzLLMtvF2gE6Con2
	K4yZBmhi4I9CxpwIC/WvZ5dAYQhj/VJQxo5eRGKlp676KcA+XlRskgU5t6WmbK4Psh+DeOoeqQI
	PFD8K7mzZb5dqRuU4akqT0rtioVjRRValMCsnHuETanxf0sd1kvCZaDTBmcnRmYF2P+FmpYwcO3
	8411hAIEaX7na7m0uslRv7QByrjUi5U6LrJ/Qg9PZiaN3QeMYlY5fRJYwHxg5M+ye+Xp3VSKNLG
	Na0IeW4fbZv0Y9sG3
X-Google-Smtp-Source: AGHT+IF1mChU7rsrPqSp02CZnJuBIHPZRlYSiml5HbxrDzi778Xa2HmHel+wqN5T3oDjSRgQCq7PnA==
X-Received: by 2002:a05:600c:3b01:b0:450:cf2e:7c92 with SMTP id 5b1f17b1804b1-451f0b0e796mr46847795e9.16.1749080954166;
        Wed, 04 Jun 2025 16:49:14 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-451f9816cdasm5975275e9.13.2025.06.04.16.49.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Jun 2025 16:49:13 -0700 (PDT)
Message-ID: <bdcc3e48-ceee-45bf-bc4f-f0e63d44b333@linaro.org>
Date: Thu, 5 Jun 2025 00:49:11 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 6/8] serial: qcom-geni: move clock-rate logic to
 separate function
To: Praveen Talari <quic_ptalari@quicinc.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
 devicetree@vger.kernel.org
Cc: psodagud@quicinc.com, djaggi@quicinc.com, quic_msavaliy@quicinc.com,
 quic_vtanuku@quicinc.com, quic_arandive@quicinc.com,
 quic_mnaresh@quicinc.com, quic_shazhuss@quicinc.com
References: <20250506180232.1299-1-quic_ptalari@quicinc.com>
 <VkNsXqYDdmwW9dutwc76Dv8ks2pvgcUwpf1UREJXhbXDQRaobVZL8m0hLz6rsOG-v6CjyAW3vHbuKMiPc9kN_Q==@protonmail.internalid>
 <20250506180232.1299-7-quic_ptalari@quicinc.com>
 <47d19ad8-37ad-462f-8cb3-d39c29008709@linaro.org>
 <8f18716f-cba2-4615-950a-63b6b73e23e9@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <8f18716f-cba2-4615-950a-63b6b73e23e9@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 04/06/2025 18:11, Praveen Talari wrote:
>> Separate this stuff out.
>>
>> Your code should match the commit log. If you want to convert %u to 
>> %lu make a patch to do that, even if it seems trivial, it is better to 
>> make granular submissions.
> 
> It comes under newly added API. Do we still need to make separate patch?

Best practice is to split this stuff up.

If your commit log says "I'm moving code" then it should _only_ move 
code, don't sneak any other changes in, no matter how seemingly innocuous.

---
bod
