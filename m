Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDBDC1D5178
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 07:57:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739260678; cv=none; b=gGYMzDexlrhDdwAcGqngduZOzTH18yOWfKn2eqH6XnjficoprTdjg8qSJGJLTonVxN05ny5GXMxesk/yh6RJvaWpa0CqSJ3xN6rZHSulWYmgBaNadnJXEuR4fd11hVU+4lUwAzNYB9UlXuygbyFnC2An9deg6nPnnyGJ/hBYfmY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739260678; c=relaxed/simple;
	bh=Lcml8aJDBTGKpyIaX4HKBifxt+OxHZQ7x1WL3jIsN4I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=P8YMag4Ko2TTKlU2p8p6xB4Es+qjdyIPIZ/j8n61oJHcyCuPKyF+ihPtjonFZ1SPK46wqlIbPDBFAhqoWu8tLUpSsFq082KnxaDy3Jm9Ak+BEegso9cKzQieHthN+xhVfxhCrolIAc90y+yrbSqLm6dThQ3HfRz2epKCincfQHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=T5Uf6EcT; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="T5Uf6EcT"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-38a25d4b9d4so2713673f8f.0
        for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 23:57:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739260675; x=1739865475; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=42HWzkx6qBwnjJ3MIpdxDc5gSzsxvujl0Un+nlip12k=;
        b=T5Uf6EcT1TJT4QXndH8AMbWxcmsnJtj6VbZvlpdrVjl0dmRYiA8zZQo84XbxrH5Qzz
         M28nK9mnMCmS1LFMsbGkILIwPPDM+kJM4c9umzZDENBzZ995R/S6sFSgWbCocAFWquGs
         /Z1it5qfvRUspfp621pWyByFvzNu4b0OJTD4o0pyqdfylFQLfjOPDUGhJk0x8WdsPYXE
         SVv3X1/Kes1JDlWIgQHA7BZOVBUZxA28ViljpbpOyd//RY8VtJrybP3ORJY1RdkByVOL
         vHcU4EyzQ9nkq36RXeUo9AUi/eAf7bQHeYt/NO2Ra7+Nfj9N120B7C/0wUB3hGD9ycez
         kwvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739260675; x=1739865475;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=42HWzkx6qBwnjJ3MIpdxDc5gSzsxvujl0Un+nlip12k=;
        b=HNV2xhTXEy/Kf1icNZQR7CCvC3tr8S2AunjSY8jXOQqmBfwgfqW7rjwYYJ8Y3kGAVv
         tZ5UXaIWBUvxDNEKnfxe2gtGUnFNK/9q6s6L1ABWVx4EW8140OOhSsma9LhSs5UWK0uu
         qHMwy5D/Z5oy23LrtXDAHbTbq+SxpncTUjcxnzzsfUQmA6UzUWycqjpP9nO5n4I8xg1P
         D5mufgQv5sbw1hWKMtG6Ax/QZQYMSzYKRbcGbaVe4hz7xpsd0hz4D0PaMp37b1ycCd9z
         JtBh3SPShkGLMOjE17QFz9zYm57cF5XJSstKF3OhXQVXBzSSkuq6dhdogV3ZftZL0CJ+
         Tyuw==
X-Forwarded-Encrypted: i=1; AJvYcCVRBgZJF5CKMTqZmkS0nx8+WGxVJqlgjQDbI2z5Ev+jASS9MLuyMA11Gn3ISMQH5rYB0KvDBdxh8/XHlvU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzUgylTOdXiuMJUbVhapusQ/NrphzTdmo2SqgsG3+QiD2t6Vplu
	7hX03zPzZKqqR+0FhyjxRtrylKyCM6FpzoTvQrAM//kNKuYPoKN5PbVsANMoouo=
X-Gm-Gg: ASbGncsPaXO0n9w9iKjx1RemOesdt4eVmND2fIsD6n/RnkbFzT2sorEZ60yMlKhJDPU
	AgHFIRebfINU7SuC7P1lXn+b4PhhXIqMYGKNzZBxsmAucbblR3bAJtb0apz+XMeb2K6b3e54xPO
	OXylASAGXtRoAv3FjZiEPGzEWTBbMYboln+tRc7zsxoMu0vvpyH2vDiEFIlIRXFRBgCQeSKktu8
	8v9cpm3j1pciiw83vA5gmTnPX84RyxLAmvQKN428Lu7XR53gUNxD/sOmq/486IawdRyS/CHEiWY
	43EiRVbDhjS2z8gvQCGWql+vxdZa9kLIlmWYN3Q9HEupqYhTKLif0zM=
X-Google-Smtp-Source: AGHT+IGi7+qfoBcLxF8pRER6rZ/Hk6AG5kphY1zYe0BKOmClMdXm6jxLj1GKveMoCx+zBMawGOCnIQ==
X-Received: by 2002:a5d:5f86:0:b0:38d:d43c:31ab with SMTP id ffacd0b85a97d-38dd43c33f9mr8339431f8f.7.1739260675170;
        Mon, 10 Feb 2025 23:57:55 -0800 (PST)
Received: from [192.168.10.46] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4394127afcbsm65781475e9.23.2025.02.10.23.57.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Feb 2025 23:57:54 -0800 (PST)
Message-ID: <5dc4bbb7-71b5-4389-9e99-099e1c93d1c9@linaro.org>
Date: Tue, 11 Feb 2025 08:57:52 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 0/6] Add TSENS support for IPQ5332, IPQ5424
To: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>, amitk@kernel.org,
 thara.gopinath@gmail.com, rafael@kernel.org, rui.zhang@intel.com,
 lukasz.luba@arm.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org,
 linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: quic_srichara@quicinc.com, quic_varada@quicinc.com
References: <20250210120436.821684-1-quic_mmanikan@quicinc.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <20250210120436.821684-1-quic_mmanikan@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 10/02/2025 13:04, Manikanta Mylavarapu wrote:
> IPQ5332 uses tsens v2.3.3 IP with combined interrupt for
> upper/lower and critical. IPQ5332 does not have RPM and
> kernel has to take care of TSENS enablement and calibration.
> 
> IPQ5424 also uses same tsens v2.3.3 IP and it's similar to IPQ5332
> (no RPM) hence add IPQ5424 support in this series itself.
> 
> This patch series adds the temperature sensor enablement,
> calibration support for IPQ5332 and IPQ5424.

Applied patch 1 & 2

Thanks

   -- D.

-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
