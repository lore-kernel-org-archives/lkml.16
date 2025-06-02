Received: from mail-io1-f47.google.com (mail-io1-f47.google.com [209.85.166.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 322B02C3254
	for <linux-kernel@vger.kernel.org>; Mon,  2 Jun 2025 22:17:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748902660; cv=none; b=pyzcvhaVmicT+6W5GX1JffOTktCh7G9M6JmNw7pDOywGBV+ldTDRe73yPQO4NZYBp7To0z6CY/C5SHqgSCbq2M2OhkSZZcLDXhi6XfK5C2DOZEomyXcpON7i6dkp847/kW5kTbKVI1wiLRx2HGlnYSe64q1zPRP7LXvcpV0AvTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748902660; c=relaxed/simple;
	bh=j6Fap+EQAIOK+jn18EOLW8N0FIHYXwyw9RKc0Puqt1o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Xtpgu68WFBd+X8DzqDSkZBN0b1fx/I2+Rka1aOQJiP7qiUoxr/eQ0PygihZ/ykT8jigWUauNcwxHpMCO5DmNzjeAhIgx5sgQjmuuNzRnxkUFBrJIliKoAYOsLfkkielJO6WfNKM4bnRvvwro41pyoFejOHMGBFV5nOYyh7izqAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=BK4v3r74; arc=none smtp.client-ip=209.85.166.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="BK4v3r74"
Received: by mail-io1-f47.google.com with SMTP id ca18e2360f4ac-86efcef9194so63331339f.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Jun 2025 15:17:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1748902656; x=1749507456; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=a2QWknujeW14lLIRfZtcP+1dmYSGYay6rfog0SJjymc=;
        b=BK4v3r74kqkF4M6ZdU+2g2p0Xv/cuKXdLslyJSKmrVHEqeIUNf6hKDwnc42WnYIxfg
         xK75xtpwoauPCt8Al1uFNuij+dPILB/csOpQyYfGLYfeFQSJH80pDinld6LI4x1qOEXf
         cqDkvRq9gFkEHda5n7FVh0/hAqGjzcgqV+Q8s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748902656; x=1749507456;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=a2QWknujeW14lLIRfZtcP+1dmYSGYay6rfog0SJjymc=;
        b=gfld7cu01GD5vBt1GSRaAunj6MuFGKjOVV/SdJ5C73XyCewM385rMSdXAGoM4TGppy
         mMSVH8i1BiXDOnJXi1VTfZBDAqpd2d781ci1l73/XwgL7Nq68HXZWh06Wfu7LtS5y277
         jwna8KguFUCaZ/7TD3om0j3WIh5tsnTyMCL/YhyqfSxjdNIfpd4W6e1sNeW3Kw4Et6ia
         3lZzdUb81O9lUNHjechJRQ8G13rusFe/i0P0jvt5lj394KffSoMBfQYqtGKhx/8VDnat
         glYAVzztACjAJXjcCUKOiNh0CvJGdgKB1WrAAWcUjZXx8oHo8KRwoeaF1YBmZDmC/qSE
         vyHw==
X-Forwarded-Encrypted: i=1; AJvYcCVghv8ZJOA9A1HBIul6fu41smZizViKyrkfC28s8PhjZ3vBJQQBU8yrIWqTOc5RoYRfT5/9PvKfIGbUwCE=@vger.kernel.org
X-Gm-Message-State: AOJu0YyFgxAeVD5q98lt5WuY0AfTcwbDGPAYgGNgEQ/xAhzCFeKkXbZ2
	JDtUMpZZTxHPUgd3Hk8brUWgvEBOewyFllC/yU4ihpbhxkmJVvBvRykTB0lw8SDNDEQxjFIVjxy
	tTY83
X-Gm-Gg: ASbGncvfcoVr2/RUpQ+CV0tPLH4PA3gpanlSbvVYnCQwl5w1QXanBTkzIBJrRRP5ozw
	kXLNfaFb62EHUyVTPbRsCnQofrmPdTTVU7CjQjclVtVsM4rbSoxfldcY7flLMG2w7f5DwGxxUl+
	EAW+UnWJOdWg0eZHXU3u3X71VqjcT2Y7s7SSBWQ2EvzE676p0nvBWNFnAHNG5pwvaKm/kKXrbKQ
	/JnRARHwtuCo0JXALvgEQsp8pxSHCyKDIgT8EFMUQ8V68BJmrbcliEIB9y6AxDEt1C7MBf/8p2L
	cmMmfsuSV41MXdXDmL+zBcstRcXTbHjX+vh7O+rG7/yGfZf9boNh1i7kM6Wn7w==
X-Google-Smtp-Source: AGHT+IHo0xFealycsEKSTMK+zGMcC7ZgOeGW2tvBAdIjxOTYpMujokNufwJ0G96rJS43d74JdBHfZQ==
X-Received: by 2002:a05:6602:3a07:b0:86a:93c:a721 with SMTP id ca18e2360f4ac-86d05094622mr1429654239f.2.1748902656177;
        Mon, 02 Jun 2025 15:17:36 -0700 (PDT)
Received: from [192.168.1.14] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4fdd7e3be98sm1863324173.60.2025.06.02.15.17.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Jun 2025 15:17:35 -0700 (PDT)
Message-ID: <53586971-e67c-4b10-b42c-4aec8fc4fff7@linuxfoundation.org>
Date: Mon, 2 Jun 2025 16:17:34 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] selftests: ipc: Replace fail print statements with
 ksft_test_result_fail
To: Nick Huang <sef1548@gmail.com>, shuah@kernel.org,
 linux-kselftest@vger.kernel.org
Cc: usama.anjum@collabora.com, zhangjiao2@cmss.chinamobile.com,
 linux-kernel@vger.kernel.org, Shuah Khan <skhan@linuxfoundation.org>
References: <20250531070140.24287-1-sef1548@gmail.com>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20250531070140.24287-1-sef1548@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/31/25 01:01, Nick Huang wrote:
> Use the standard kselftest failure report function to ensure consistent
> test output formatting. This improves readability and integration with
> automated test frameworks.
> 
> Signed-off-by: Nick Huang <sef1548@gmail.com>
> ---
>   tools/testing/selftests/ipc/msgque.c | 47 ++++++++++++++--------------
>   1 file changed, 23 insertions(+), 24 deletions(-)
> 

Looks good to me. I will apply this after merge window closes.

thanks,
-- Shuah
