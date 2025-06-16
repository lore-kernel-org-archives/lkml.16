Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A6621ACED9
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 18:36:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750099005; cv=none; b=ZtcS4YU9uX4/thfqDjI2NaPAS9U8sE7br9kHrS5mm++Pn0Jvt2vtIxMNOKd+EDJsK0Va6RTUiXJLtjW/Rl2LGgNr1ppG3sh5y5+l+/zuztlZEAYPM/bY+eJT4YvUx+fDdviTj+L7iyhMa4QH1LHvxegvOHvCjJO9LL6nUjkkJRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750099005; c=relaxed/simple;
	bh=nSGpYWFyBH0MVGDs4F5C6K0C8gD+RnNU3LfhbrL4ibM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lwd5UqGBepthxS8xzRf77o8EMpiNBXGBeFx+vYVqJt1gs7FHOhD9r8FHpJXzXYwZyYzlitjNBHYueuYNa0uXFTf/MIeVVw9UVdCoTmOGkRFNr+cXu7HxeHAaTD2Uv7/SrYi3PpNttRYtX2vdOvYUD2vjVBExOFxFNAOlem+gDkY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cA/F1eN5; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cA/F1eN5"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-45348bff79fso19313795e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 11:36:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750099002; x=1750703802; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MsNLhXeNsR5rk9ayuQ10RaODgphRzkJpXaeg/oHPIag=;
        b=cA/F1eN5FnMMfvCnDKK4KXCf9tq+CO/a0dOxHINgDO+7lAfEnRGlHq0HBfl2BCRaFq
         DQIit3VjNxO+NbT6drasSJxRccqdCOxF5KaQggbm5CpAPcZDVr7fd+gNZYMG5xBx1RI/
         30ZPAgLFYg7ADLkxzH+nw/yDOvBRWoiP3EC8olplncP8JeKffyyHkLOTFvnrIvM3cFJL
         vA2p6L4whA8KpsuYfBiARdkQx64V275/Ex8FgjFl7VrhHZvjJXa6ZXRPCMPG1dgfIkCv
         gv7eUl+Wd3vQhQdkhAZ4M51wuPxBVurFI3syM8+P3wiLsR4rsxgaZ2tQjm+/cRiAVhgN
         j8jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750099002; x=1750703802;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MsNLhXeNsR5rk9ayuQ10RaODgphRzkJpXaeg/oHPIag=;
        b=S0HwE4gF03KYABYZuqOeFDRdg2TdeK9oXoyKo2jfS0BTxeh7RQmRNlrQF6TwpFt6eW
         jSxWnYoGNZvJmEajTwVpwjVQfYsHSMey6+U90UM+wK0cO47QEEaDwaK/9jjUXXYsjNuh
         98XdOc7KDhNPXKmu22oNzWr+ETQ0DP6+lFRI7n+9OtcSjrOhPuA0XYhJrTqU/myvx7u+
         lYePZuFoLSQHF3oeAFHJvn1fJxSSLY0G4n6GG/e5HNwWWHmMuLhMx7N1h1vskYSnPu4G
         ltAC+sM1ZqpbFqifpkP7fLDBnCI/NbFkoC3APyITjgdTOvY/YOYOzVXf7zjG7DnJa3KD
         BcRA==
X-Forwarded-Encrypted: i=1; AJvYcCUMj4QVaoJjrT2gRYvpYQu5L9hiUCnRa0XgQBf7wv0tJCXTVUlqUOVnPjA1DN5iYpqM+isXr2MusHhJKqU=@vger.kernel.org
X-Gm-Message-State: AOJu0YyI5mDaPiOuaHNKHtXjVft0hSiuiNtcW/FTdxgqH+hdeTDSJKNh
	0bu29nJdG1UhFQxuuqBaLKC6mdtAEuaJksGwjCkVaKrQeZd92evi5zhy2VZVIW76YvM=
X-Gm-Gg: ASbGncuJ4C0dMQEd4r1qBV/StAR38X3bCOoVYCDbpSlXivAzVgejIsFSTVX/GKMH/U6
	3V3af6b0qLzgx70fZEcsdPP9pp4qAKXBkealMEQay4InIIChiHheLR6wYA0OpdLMzs33jiITuQL
	onPbCxCmdwFWkr/iLTIclquRCGrToZeJGhtUlnI4M4ZBcJzmfRZCvkuUfXXZCe4X+lYg0Q6bYao
	DMUKsB3jv/XDx9ruPd1QInISp+7hXo9pFeKGGqfQvXPCW1Zc48ii56PBqQexZDoLqMtp4FgSO4t
	p6EI7ibRvepgeLzC4TVVwOdPS58qkfRsTLuHb90qDjGXlvUO3uAGOa3excsxRj9VeMue/7nhxHh
	4Yd3XZpqucgg26MOqUiwLDsayEGY=
X-Google-Smtp-Source: AGHT+IEOqlSJqgf9CjZ6ykf5glgsWkGCYO0VsbAq9E/MbhDTl0OUTeg5nKbhy7qj1p+F2PwbU9Gfqg==
X-Received: by 2002:a05:600c:8509:b0:441:b19c:96fe with SMTP id 5b1f17b1804b1-4533caa3d54mr126618725e9.10.1750099001671;
        Mon, 16 Jun 2025 11:36:41 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568b08dfesm11931080f8f.60.2025.06.16.11.36.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Jun 2025 11:36:41 -0700 (PDT)
Message-ID: <956ddebf-9db4-4875-a948-41f17afe2e8c@linaro.org>
Date: Mon, 16 Jun 2025 19:36:38 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 3/8] soc: qcom: geni-se: Enable QUPs on SA8255p
 Qualcomm platforms
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
References: <20250606172114.6618-1-quic_ptalari@quicinc.com>
 <20250606172114.6618-4-quic_ptalari@quicinc.com>
 <d4ce9309-4021-44e2-bc26-1bd9e7b7e8df@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <d4ce9309-4021-44e2-bc26-1bd9e7b7e8df@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 16/06/2025 09:40, Praveen Talari wrote:
> Hi Bryan,
> 
> Gentle reminder!!
> 
> Thanks,
> Praveen talari
> 
Small nitpick here.

1. You didn't include me in your v6 CC list so the ping
    is the first direct notification of this series I've received.
    This is no problem BTW just for your reference.

2. Again as a general recommendation to qcom folks the commit
    overview logs are fine but please include the name of the person
    whose feedback you are addressing in that log.

eg

v5 -> v6

- replaced dev_err with dev_err_probe - Bryan

etc, that way a reviewer can re-up their context quicker.

---
bod
