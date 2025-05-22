Received: from mail-il1-f179.google.com (mail-il1-f179.google.com [209.85.166.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 589742C0338
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 23:04:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747955102; cv=none; b=tTTE3hBKGDbeklDB5DBmSYOIOlaN98mvhyuJRM0Xmo8ldpbM4HJlkt0RXFFbE8NgpwRybc1cvrylRnKSNm0lOsNxxdQGyBOqI2ga6wX4P/IEjaZ9Z4vZIzIpnCQKKkr5N7en+gI49tRTX1PsJ287NaISC1gFEQ2UzcMZ0pp0GRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747955102; c=relaxed/simple;
	bh=lScQnSCkvuRBtECCWLHIYCv8vmN77MwE39G4+WsfwoI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LIHNiVqmkFh1O2ZzHXPT7yHUO140nrJdE8x/lRRvbYZezzJCfxLJHKbWSmIkBz7u1qk/Ln42Xb6at9ckHcCKOTvkiDnPHG3lhzzYMTuWdO0Ot76UBXKwdVzLpDN1545m9W8sAfGnFlN3YSFWGpjbeNyz0wdSiUHrhM23aO34eb0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=HN6FeF2M; arc=none smtp.client-ip=209.85.166.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="HN6FeF2M"
Received: by mail-il1-f179.google.com with SMTP id e9e14a558f8ab-3dc73b1bd7aso29078175ab.1
        for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 16:04:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1747955098; x=1748559898; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NyQ/Gx89Cr5NXHdPsJF5IueYH71HqlFunPxqtl/qLjg=;
        b=HN6FeF2MiC7fFEHxmFsL6OL6b6NBiQo8Y/2heghsL9cCi8xfqaHkmy96L7K8oBrjfz
         JSx96lKxpQjStR99tr9QocdPVXinuga4F2ar22XhSm4QHMY7a4uNE5jWDLrtoRZ3uZnc
         38Te2I2VK1OaZv6w4DPMrEDVHF9gnjzNzf8xw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747955098; x=1748559898;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NyQ/Gx89Cr5NXHdPsJF5IueYH71HqlFunPxqtl/qLjg=;
        b=aeA8sN7IoUXmk7JkBYCFV8t7nALVyNWaKiBmCSZdvr3zb6N7NSxsZRx/zc+J9HpZAM
         EG95R9R2q7fsSK2olfFacHQvd98ygHlwdWCZD1+XbT41oJDNcCPfPqUsmRCz+3vGR4XW
         tKL6jBZqDzyluslTXwg2z907xYYyRV/u/xKRNjdUprIWbkzIYiaZJdb8dpsJaW5G9OPo
         QC6i8+XqO/KyjCSPmf2dP/hwwoKE7RhzaVQhpwXashJINacN7PS7wdXl+gkgVUj0G16t
         nE/aqu7tlWdpjex/DYnnjz4l9i949eaiS6xvTpa+xUzLZMyQv32tTVtle+GAvDP1vVlR
         4wCg==
X-Forwarded-Encrypted: i=1; AJvYcCXKg2kog5mF7YI3nrGFomCmpB5tCBogSN2IujkgSYpjeRqAJOOrm/lJSRFzgSdT19Ybxwi49BwiZpmvMU8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyjaXkCXssGuCdTc69vFRcsIQDjXlTc0kW83LHUnpycnYWQ9IpZ
	pn6XSdPa2EV2Gbhk/ljlF5tTcgzpPWkxrP6L/GIlAtSU5ro9Orm1jDtikVJUXG6NSJQ=
X-Gm-Gg: ASbGncvJ1H47j+UQkLBR/mFzSrpLJO7H2K0jm6gJJ0r37cNpPWEXJAdmvlMkZVACV8Y
	Jh84nF8hxvpiQycIMxUAD2/6ZwP/qYnMcKhoOHD1iuxnXmXtKdZpNvQpk/JGKDz2a9eRs/f4XUG
	mDT21mz6/sUu5sCwKtYpf3Y0Bnp2Vi6EU6L3V1G+OJEzEUByGM/XYSWp/qxL1l+9rnpKzwdWzvJ
	r6DvOvh9rLYMca9+kzuwTbR5TdvXFYy0YZojbl6+wA2NgTEFG7ku7jBO9RKRX1WbYbh3QyM7okR
	drgPp3pkro2OwwXmKFFqfLAJfnKIsirTTXHhDmv1+IXXO3sRCmKvFX0yKYsPMCO6VtSJIm0P
X-Google-Smtp-Source: AGHT+IHl0m/OZ2YTgjx9CaKgNardws6NVkvU4kTAEKOuts391ldEwKbiR8NDEIfzEyuXJto1DxeWHg==
X-Received: by 2002:a05:6e02:1748:b0:3dc:7df8:c82c with SMTP id e9e14a558f8ab-3dc7df8d014mr126479675ab.7.1747955098357;
        Thu, 22 May 2025 16:04:58 -0700 (PDT)
Received: from [192.168.1.14] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3dc8b75d09dsm6447005ab.54.2025.05.22.16.04.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 May 2025 16:04:58 -0700 (PDT)
Message-ID: <e1f8156c-e9f5-493e-b780-1f1e63f22cc7@linuxfoundation.org>
Date: Thu, 22 May 2025 17:04:57 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] cpupower: Implement powercap_set_enabled()
To: Suchit Karunakaran <suchitkarunakaran@gmail.com>, trenn@suse.com,
 shuah@kernel.org, jwyatt@redhat.com, jkacur@redhat.com,
 linux-pm@vger.kernel.org
Cc: linux-kernel-mentees@lists.linux.dev, linux-kernel@vger.kernel.org,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20250520094345.97200-1-suchitkarunakaran@gmail.com>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20250520094345.97200-1-suchitkarunakaran@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/20/25 03:43, Suchit Karunakaran wrote:
> The powercap_set_enabled() function previously returned a dummy value
> and was marked with a TODO comment to implement it. This patch implements the
> function by writing the desired mode (0 or 1) to /sys/class/powercap/intel-rapl/enabled
> 
> Signed-off-by: Suchit Karunakaran <suchitkarunakaran@gmail.com>

How did you test this patch? Please include the information in
the change log and send v3.

thanks,
-- Shuah
