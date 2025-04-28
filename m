Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78C64266F08
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 12:26:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745843181; cv=none; b=Sv9KtnXyOCZIhbH674B3IFYseK2wq84ZIZmaBlVMVTU2Q0D84X5E9PvdC/Mp9/5zhNG69B1jzPGd4EGhXebBWHSmzy4Xnn7M+hTRsP6JmoFyeGd2WxuMKH+0f88xt0rvOT891n8Ed/exm5D9qchV+qe6yVm/GrCwlAmUxtWQPAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745843181; c=relaxed/simple;
	bh=lYzVuTzAO0lXDW/pRfcCGAFRK6nd4EKEBMQJ2wGtWGg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Xr3bFe2ehyQwMRa8D5pRxLtICYCnsRwbAiS6bDdCdd/mCT5JLTARaJf1i/BVWe2S5dZYDHwFrfjboBJiruy5C5OsmdkpHMM+ayUUqF+NHuuLXOHl77k40NmaxSe3OgdKZaE4lEV+uUl4wqE32awuMSv84hQN4eoQpCKCSXuYWuY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mtCdP0sL; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mtCdP0sL"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-39c266c2dd5so5339974f8f.3
        for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 05:26:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745843178; x=1746447978; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=co5BIfbnH6mxdq8sV4aN5bUuF/8OaVGlXIVj8UR5Su8=;
        b=mtCdP0sLYdmBWtE7zrsvTAWe+fB7P7k1TyH+JY3IwBR10sYigzRvhOXb5jPpaEYm2E
         rMQJg9gsER3dfaMNoMPQUbkse8QNKofZW8CSSGdpgIoD8gMT83RXmKcgzKbD1d0Hxz+S
         kxwqh6mbYq1f67jvH5BpDPDRjv5Aj62QY9FmC1aQiY5mGUt2sVEdfMysW613+fwBbzyG
         t+r7xa5Txm36+mGZN5OVMfs1uA8d+Z0i++oam4fjQNYGMTcIKQBvyZRqngiyGNlQprre
         +EL0XlosplxlT1hNRyBzoFn3ysFvJ78lDgQZ703O+TOqT462eF4S4TPR/vL6lROU9g6e
         heCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745843178; x=1746447978;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=co5BIfbnH6mxdq8sV4aN5bUuF/8OaVGlXIVj8UR5Su8=;
        b=tpN0WOOp4QYgv62ZeTY6pDnlzdrAbqXykGC6wdk0CnNH8fkgjJjeHLTKS5ldBoQ9vA
         mXmosq1OKot610iE9wIAc02vto/1LPwJpvlepqVaKoINrZaUJhCOUp8A+yZenDVS3eta
         JEWi+ePyb9BEjFSF0zFaCFUagl3589u7kkyA1ATAQ2lzh6URSeYqbAyTAP6MQ9vlJznj
         v99b/lMv2BfjsiGcCsEsS0m062LfuChDXuJpDGB5TekN2GNKk7HiJG3LyhEZymh+c3g3
         KkIEvb0ng/G8eVQ0VHCRSKtsUIGDfBTVP173Gc5HrTz8gWkTCxHWCkap4EVDGNk+GWlx
         xrcw==
X-Forwarded-Encrypted: i=1; AJvYcCVS+WfylhrU9MMRhdahg31Q6FlfFC/OzQaQtC9llkmHhi2V8qjLL1g7fqR0008zVw3+gXGzXwhtOoxM+h8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2I/LcKyzz71AL4XC9XxWNYWEaWGNoYRExp1zTqt2qthzCiTlO
	HljipOH2G4IKRAy3U1nAFMZRp1Gl4mLaN6WS8ZitRYJM8lUK5sewgrlH9AslJzw=
X-Gm-Gg: ASbGncsOTVw+1NDzZETjI29rxPC+T9zn8ir9m0QebOBzJ8J5nBoJDVWISq383vNFB3l
	LTGP5PU8GIUNt1FAw4+i64eYymLeQte7kf0zvFfR9hAhiL+Gq6CxR3C//C0sUS84n/lqMRNII9l
	Tr7+pV0gTHmQq/hcWs5Px4GCVnlaP+tNwDlSCpu2gZcT8Ar6TKGupIcukxn9wLMycXi56y3pwIR
	EFxv0G1Cd5mIw4B4yzGP3fEk4ZDWgWgHN3PbD5bHdErlVbzVfRRPYoOZ0dmXEHn5TyMaPb7Q8m7
	fclDiGSBtp0/KEHZlUn60LaTSXk2/49yEzJWTDoBsk/ZEXZY2ClA5GBqNsksdpyffHZHX/i/IEp
	2U3FaGw==
X-Google-Smtp-Source: AGHT+IFtg5gANdNSZfspUoCUzrUK2EdsGN0jIu70mhAaQLR0b//Q691XryrnFCuvoB6b7ZknFBW73w==
X-Received: by 2002:a05:6000:430a:b0:3a0:8495:d66f with SMTP id ffacd0b85a97d-3a08495d6admr2559745f8f.23.1745843177763;
        Mon, 28 Apr 2025 05:26:17 -0700 (PDT)
Received: from [192.168.0.34] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a073e5d4b0sm10933059f8f.89.2025.04.28.05.26.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Apr 2025 05:26:17 -0700 (PDT)
Message-ID: <364500a3-3343-42c2-a0cb-05a1bf39936c@linaro.org>
Date: Mon, 28 Apr 2025 13:26:16 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] dt-bindings: media: qcom,x1e80100-camss: Fixup
 csiphy supply names
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, dmitry.baryshkov@oss.qualcomm.com,
 loic.poulain@oss.qualcomm.com, vladimir.zapolskiy@linaro.org,
 linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250426-b4-media-committers-25-04-25-camss-supplies-v3-0-19e5e72ffc3e@linaro.org>
 <20250426-b4-media-committers-25-04-25-camss-supplies-v3-1-19e5e72ffc3e@linaro.org>
 <20250428-lovely-flawless-grasshopper-bacbfa@kuoka>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20250428-lovely-flawless-grasshopper-bacbfa@kuoka>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 28/04/2025 08:14, Krzysztof Kozlowski wrote:
> Block has VDD_A_CSI_0_1_1P2 input, not separate one for CSI0 and CS1.
> I don't get what is the benefit of this and commit msg does not help me
> to understand such choice.
> 
> On IRC I clarified you could have less supplies in the binding than
> number of actual pins, to make things simpler and more consistent, but
> you did here reverse: more supplies which do not exist.

So the idea here is to make a consistent

- csiphy#-voltage-XpY

Which means that each PHY will have voltage rail names like

vdd-csiphy0-0p8
vdd-csiphy0-1p2
vdd-csiphy0-1p8

Irrespective of the SoC pin name.

The motivation for that is to have the names be consistent across SoCs 
which is I believe what we have discussed should be the case.

That means that each phy will have its own named set of voltage rails, 
consistently named across SoCs even if the pin-name is shared by the 
PHYs on the SoC pinout.

Is that not the namespace consistency you've been looking for ?

---
bod
