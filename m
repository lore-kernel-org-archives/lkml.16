Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2058721ABD2
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 08:30:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746001811; cv=none; b=HiO11qMQ0iRAxnJgEevgN5CiuycztmXMwwGmGq6BcEQqN/pufXQzEso4ci0mPVC54FMsPjMNB5GCADeSkrFl8h0IUFrUV7UHxUBkFPc8th5zTc0FEEW/FwwSgB2BuTNOjWoeM2xMAtTad97sDDNrZoM+H/d0/pxpBFZ3b3zEI5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746001811; c=relaxed/simple;
	bh=WwNEX0SJd4sKCdCIpe+GFVpttomXVtec+QbXcof6w0w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Oq/e9AIg/LQfT45Ws9mZjy+JXUdqVksDAg3EPNmZnTJzc2Oxi46NfwgIaK/m3LUTBl/HAee77uIoFdYxxy72OB2NcLNsllIrJPEaM/curUa5KZ4eawEUr+2CeMNK7eNWI8D6K+lKIuJa8f2pCeoK6o4/IbDMXLsYDTuwh5ipL98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SQsh4Ibr; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SQsh4Ibr"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-39ee57c0b8cso7732054f8f.0
        for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 01:30:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746001808; x=1746606608; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BQgBSGX6UzW41PwoF6qQQTtlNAihQ+2ygYEYwpcMDEI=;
        b=SQsh4Ibrs72fjakucYL6OXHZ79Hbf1Z3FbfrLR0cpq7ovAIHmBLn7wXAM700tKMgPQ
         +AFsRoJrn4RBMOcPeAVCmE+P4qTjtlTAoUfOa+mHGdXxX7+Pz4XftmT8NGYrTWX+Uv8t
         X/X8/lsPKkWvNFPnKM9Vt23jIFXDKAA9fRmJihalhdGl4xQX65qgfgWiC5oKeRjv82oQ
         jotWZEomIkKxB8a1Hy5PfXv4IelE8HnFles2xTzOvkfVxGSREJzvM51VMHO5bzZ8lWFh
         OoNM6U5/bwI+hlhvFsrZZer68L/WlrshPBGlVH3QieXPgHJi/FoIluBrXd56myBvkd6I
         UBZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746001808; x=1746606608;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BQgBSGX6UzW41PwoF6qQQTtlNAihQ+2ygYEYwpcMDEI=;
        b=WuhdAFzBFo+Zn66vmssFYWFTnGupxe7xxWI7PKIOP8lwEsJdSmuU2Rtt2gC3H7oBt+
         sLuIl2xYXZAsIypI3LqaHkHquN2W+49lI4Fz0vjkIwbDtMZH+zip3oF+kLvGS71QVJPy
         G+s5aztCC3IG0UW/V1KTmKYMZEImPv9uZT99Bi2PG9ZZ/EtT/aDgfWZ3A00YjkvxjsLE
         vQwSw71fdFrWX4SLimZQQgh0vnLPoSyZPhA6zZz9pGFdCzcp9MR8ENriQJ6MlO/TIwUX
         m2CEykmSoXC7ramRO1PfAT6RpeywIvwwRI7QBmyMUfArPL0iBQOGkVqNOJlARhhPmria
         a7YQ==
X-Forwarded-Encrypted: i=1; AJvYcCViFrQnuByOiq6K0YHXAWp2suj5rVdRxwPzLHEuDE1XFYVorbY7QaH+Hfh8T/+21d0q16BzCzC2+HLR9QA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzzkHshIpNIdveJzhUoBC3TAMRuJXvbn5OZ1BVz1I2cuEmgZ67+
	Dg10nsXSF7yOCj07Zr/fhIEKpRhKAKUI1wqxoY5JYKb/sQU483KEa4ATe2NDi/o=
X-Gm-Gg: ASbGncuuvcJUD/GPfU53wEs8Y7Opyn3CVhKfZwqN4CmBhh04O+NyR0p3V77nYiA4bbL
	5B+mJzJcRD7pvIP8YYDOhxIhfuSoVsbHiVAsEQlEuexQAQX3dffOQ4JsdWZNIqzI1jCtuFZanac
	IZqmaqgSdbzGzg9t5UwOegwqb5F26PPOLozWnWT3RffejhUliw/EaOVhLafi+D2ggeAYX5gQCNV
	xWXBjNsmBrbCpee32tYibMWIWmRPm3AsGiZCq1dbdMImbuFbllBDUNSDNTbK7djPS2ff0qmnzar
	SbAM5D3az1YRBremb0ZtmS/sejSP9riA0y90OAwltxjxkB/lYFwatAX26od1AnUHBhlh4XvKn9Y
	GvEcnhA==
X-Google-Smtp-Source: AGHT+IEMbr/1aWW2sRvMW/gmZB7eZZbSIxh1N3RpCw5sEtrnwewfQ3Bx8136TYBSoJ9ZuMZ6YQF1uA==
X-Received: by 2002:a05:6000:178d:b0:3a0:7b07:af9 with SMTP id ffacd0b85a97d-3a08f7bb221mr1880126f8f.56.1746001808467;
        Wed, 30 Apr 2025 01:30:08 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a073e4698csm16399086f8f.62.2025.04.30.01.30.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Apr 2025 01:30:08 -0700 (PDT)
Message-ID: <4d942a6c-cbff-41ac-af8b-12a1ff5181aa@linaro.org>
Date: Wed, 30 Apr 2025 09:30:06 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] media: qcom: camss: vfe: Stop spamming logs with
 version
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Johan Hovold <johan@kernel.org>
Cc: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250429180828.950219-4-krzysztof.kozlowski@linaro.org>
 <aBHQejn_ksLyyUm1@hovoldconsulting.com>
 <3e34ce09-1207-4dba-bff8-38c01cad9b78@linaro.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <3e34ce09-1207-4dba-bff8-38c01cad9b78@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 30/04/2025 09:19, Krzysztof Kozlowski wrote:
> If anyone wants to know it and cannot deduce from compatible, then add
> debugfs interface.

dev_dbg(); isn't too offensive really IMO but if it really bothers you 
switching to debugfs would be fine.

https://git.codelinaro.org/bryan.odonoghue/kernel/-/commit/e62825fc2ed737ab88085567f0947306a2a0da9b

https://git.codelinaro.org/bryan.odonoghue/kernel/-/commit/ff0d7d980ec8192b459b5926b85a105917746d91

https://git.codelinaro.org/bryan.odonoghue/kernel/-/commit/3580ffcbe507036c35e8f21e293f018fbb62d8bf

https://git.codelinaro.org/bryan.odonoghue/kernel/-/commit/cd88d924eb55f5dfeb2283e6e0eef37d5bd4c1c4

---
bod
