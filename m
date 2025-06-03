Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0DC223535B
	for <linux-kernel@vger.kernel.org>; Tue,  3 Jun 2025 14:41:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748961666; cv=none; b=OVEJ6EwXDXkLrqrbH91M5sNtlE31nM+UOHUOAJRHIkQM4vc1v2Lst+/Jd48jJoZA6zXE6vfu7lFCrNw8m1hxVZT4Hr0h9rrL7b3TkPnuk5sSUBi4Pqu3oUup3g1qcvONtnfX4YrsMuFi8bc1DVy2g7Qu7Fdxv6spxNJuzvI34rU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748961666; c=relaxed/simple;
	bh=oDFEQ8/8ZMa1R4I35TT2WULoCOjgL6PNxmpPuk8RuJU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sKb0sZy6aR84YukC+SS9kepdDidHu8VjA1+IYBdHHO0o0fqzJ6tAuK/9DGxpWaikE+yEAEVo97lNG6dYfV96aCnrkJbbBNnDq7VNZbxx984Hal9Do4N6neMJ8cGWrYqeg0JrYr4sBLwXYy6K1MxdglVGynriCG3/0x14U1Lg1vE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ODIUIMPY; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ODIUIMPY"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3a50fc7ac4dso1191599f8f.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Jun 2025 07:41:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748961663; x=1749566463; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vLKl+eBINJD8nDmTWsnka77ju1HlxtzNFzg0Kr2clF8=;
        b=ODIUIMPYF76ySXpWH+fZ7E2KAeuH5tKb4VzG79gwPKyPVR4Ct+fwfvcR51KTdTBoAT
         yjJNYWn7lDM+Ar/Bb1YF9DDx8p/KJlsiONVZUl5XLlSH8pIG3s2exPWvLgXRMbEFaNcs
         y5JGMWwB31vDb/D2m4fBeAgKqDro+SDt4WcJEYiwC+O0mSPOq5ItvayEAFEhfj1PA1Xh
         ELTsoLFiXt6tmu3dsZ+8JSfE89iRGcrnD3fe4+TF6/IjsGuv4hxs+BC+LqA7pp1atEXZ
         MK8RRoc72x5NNc7o+UsC7PhRt9wTFm1o7emQa/6i4E0a4XK1mpbPAonLslmcz6ujkEsk
         DrjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748961663; x=1749566463;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vLKl+eBINJD8nDmTWsnka77ju1HlxtzNFzg0Kr2clF8=;
        b=p6H03dErohqYgsBA4C9U2UILbqsB0G35xBuNDNVCzciTFe/7u1csJJEl1fozjpdZUl
         O7DVbWLfJyYT+EKxh2+3STfuua40qoKfSElWRzFSWJz1cMBmLtApb6wwwaQoMg8WmTlX
         9KrJ9icgKfILI6r4/MDz8a5GI+A9WkGsVXUwIaBqkm/zoxHZ55ZygJ+3uZ4mEAVEwLIK
         MjPMkwaioOnPypk1aW9LdMaiCEaMIDE0wyAaihWsgfTh8wYcKOJ1YetUxvguGRKKBeco
         LCuQ4rWGnEGKf6iUDAqbGvYxDONZ4fANQ6zOExHcy6xW6og+OhjM0aCjDxPwJlhDgjp5
         8elA==
X-Forwarded-Encrypted: i=1; AJvYcCU9RNUSIMkXAoN7THeuY+Np09c/tQcxTfI7pOeGOs+kJG0EzkgqkJV0AU+c/lSbUeCxdFHHwiXBu2gJ0H8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwCR02QNuJD9zWIAayxAYMvSvsESrsfJBzXQEUYtE73ODAo5H8o
	09n7a/eUC2bdy2lRXgYlAribIiqKsaM02IUO4/mZN/4NKZbqign+VkoHX0pwsOzElb8=
X-Gm-Gg: ASbGncu3A3xSBxsAWaWfx38Ov/lWfbe8rJ+HEyyCoC5XXPS44tm7uYUcvwzZhXmyHxm
	2QMQz//onSZn3BY9HJOw8dt5v8DFwWX6IKBvmidjsHqCEIFVdUhB1dvh906Id1u8BkIBrtmrvFd
	cdbazrM4razcW1YdkR9Xd4GKMBQSCdaTG1LBsjCFSzbAPP0Nf52+z5rCtc2d9XUuDIEUzavtNN9
	0hXdgdErrdpOSsE4gZIia38NA785D5Lx3/4CyQ1tlnn6bpWdespCoPT8xPoNGjJfZxptG87hHnE
	iHQXjof6H008rmFS/XuXpM8PcCG9ArSgSvgahJ5DVc6RQhu1oGP1+plTQUGkTJp3TcIZj1+1i9V
	DiC5rDm7x5z7Qy3EO
X-Google-Smtp-Source: AGHT+IHwJlidHh+57XeiKH4dEGZm0pFiX1LA59KNB9wSamUPD0lMua3IgRZDkuiH/mUBKnzOBl6REg==
X-Received: by 2002:a5d:584e:0:b0:3a4:f519:9997 with SMTP id ffacd0b85a97d-3a4f7a3dd10mr14815287f8f.9.1748961663156;
        Tue, 03 Jun 2025 07:41:03 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4f009fdbasm18145340f8f.85.2025.06.03.07.41.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Jun 2025 07:41:02 -0700 (PDT)
Message-ID: <47d19ad8-37ad-462f-8cb3-d39c29008709@linaro.org>
Date: Tue, 3 Jun 2025 15:41:01 +0100
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
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20250506180232.1299-7-quic_ptalari@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 06/05/2025 19:02, Praveen Talari wrote:
> -			"Couldn't find suitable clock rate for %u\n",
> +			"Couldn't find suitable clock rate for %lu\n",
>   			baud * sampling_rate);
> -		return;
> +		return -EINVAL;
>   	}
> 
> -	dev_dbg(port->se.dev, "desired_rate = %u, clk_rate = %lu, clk_div = %u\n",
> -			baud * sampling_rate, clk_rate, clk_div);
> +	dev_dbg(port->se.dev, "desired_rate = %lu, clk_rate = %lu, clk_div = %u\n",
> +		baud * sampling_rate, clk_rate, clk_div);

Separate this stuff out.

Your code should match the commit log. If you want to convert %u to %lu 
make a patch to do that, even if it seems trivial, it is better to make 
granular submissions.

---
bod
