Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com [209.85.167.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCFBA1922D4
	for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 22:23:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743200624; cv=none; b=j6tV/w8IVAlHnpdFVylgrqOvd9nGdY5a04i9DZ1UnSyS4ewWMI3ELOMnju1cyHTyf4hfa9bJh1COVebpsIDZYqw34VxFL1mnC6BuzTZjR83wgNJqFZ7O5DJUxegsYeMW/foiRlAkrx88imOGmSn4DTkzm7tNOVbHkFqTlrXqADs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743200624; c=relaxed/simple;
	bh=PBsm90GoR7tViYFpdI3XnG8Uw+mKc6knBg1pKxFjQyA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ePs6wIbZYQNZO6rsnHXrenEdwuOsATkw2HMg564YCJT+DtW5p17LYktw8gDbns0VUi44cQXrqjZ5qoRHg2eD2a/cPgDHjyrYKFb/kTXbX2Ly2cxrKj0qJNxZ5tjlYe5+puSJduSZR/O1btoszB9c2QyNR8MO2r10hn2vqcAmylQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=hQM0nIaY; arc=none smtp.client-ip=209.85.167.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="hQM0nIaY"
Received: by mail-oi1-f176.google.com with SMTP id 5614622812f47-3f556b90790so840391b6e.0
        for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 15:23:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1743200621; x=1743805421; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VoQ3CY/UbCxQ1vfYn/wDbcVOfLwRr7UamsFPY0WiHL8=;
        b=hQM0nIaYzPPhuQF3wK334OCbFCe3x3SqOuJaMsXb0tMhcmh6ulUI69Y0wgmsUv9lh5
         5KfxARtEWWE6EizApEMKsSPZ657myd8AGWRLgImqQe4rLH0WFO+ADqkwxBbAvZV2idl7
         fA2szaiHHAaM0vbJ223VkJBBtxSAcYQAiYac8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743200621; x=1743805421;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VoQ3CY/UbCxQ1vfYn/wDbcVOfLwRr7UamsFPY0WiHL8=;
        b=QX2w/AsHQ+7y5nFp2DvCm15I3C2JxhwXEIC9ECb06m9SpyrmGv6r+UxHi5wPJVxvSK
         ys5gtttco+egg5uhDg0QLMZGbJpF37Tayll2vIKNyzT+YQwFNbe2/i0nxFUBqrRRzHnQ
         WT8VySdnNFuW5Yd+EuvLnDX1sKyqWXyB6salk+iuY4bwBvobU1vVkCgxeqprFWmGViaB
         Nlu5NGH6YZDk9bm10CY7grmy0RG1juwE/O1yqYclBfhbS/K7E5ELOfu0dQyubZpJRIhY
         YQqi6K37AekhmMqroR7TH1EbJak2ag9hBkoWsLn7eWs17ouCrT/iaj36gtuIWSPwFfU+
         fljA==
X-Forwarded-Encrypted: i=1; AJvYcCVTg/IvSeuAtCCM9srbYNj0QPplWssl7AUMYvCIRw2MRtF7DD4TUrJQiuNcM6psG+3xEUQj4MmlzdhS8+Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YyG4Knn81z9JG9zxXTkynqt7yhOdv3TQKqhtXgE38YfNIP2pzBk
	UbZWS17j7HSmuY1Q2E2Tms8xEQQN2nKvvfp3VEcY22uj04TNDXS5Hd2IO03uBnk=
X-Gm-Gg: ASbGnctizvMdtQVNcAYMaNNdsrwOZa9d1JfViS43qdCpLMbLkrL1kZcmCvhjAuoV0Jq
	Qh5GfxFofbIR6rQqUpEmKFfPFM600+ssEvjt/jKDIF4vitF9WrNbke2xkTluoXQZIZNJFD+yFH3
	xYu+QLPUQp4sYbt4R7Kly6O6OW71LV+lhBjhprxqi6wF4SVa1BAkxGS/X8NmE3c5IDqSskG2pkF
	xHEckqo88yi2VOoSL5Zq5qSTC9MAqPybmE8IRYH1B9eS689qsTgquumiB/+usZ67jmGJDR2Yncf
	xXOZn+xCypJHib+LIbPIYe4zoHbKtjYNAPNjtqpNfa6x8ctLCJ5iKbjQ+NqNa55k3g==
X-Google-Smtp-Source: AGHT+IHIHEUmNn+Ej+d4DBj6F1dLhdjYv2M3oXqEOqrgsaGxua6hF4SIr5R7CXRXG+xJlFnyff5Nwg==
X-Received: by 2002:a05:6808:14cc:b0:3fa:bead:68 with SMTP id 5614622812f47-3ff0f3cfd8fmr535368b6e.0.1743200620648;
        Fri, 28 Mar 2025 15:23:40 -0700 (PDT)
Received: from [192.168.1.14] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-3ff052799b6sm513053b6e.37.2025.03.28.15.23.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Mar 2025 15:23:40 -0700 (PDT)
Message-ID: <76eb91c8-4c66-4e2a-8d32-f2e5d545bb74@linuxfoundation.org>
Date: Fri, 28 Mar 2025 16:23:38 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] selftests/nolibc: drop unnecessary sys/io.h include
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>,
 Willy Tarreau <w@1wt.eu>, Shuah Khan <shuah@kernel.org>
Cc: linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
 Sebastian Andrzej Siewior <sebastian@breakpoint.cc>,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20250324-nolibc-ioperm-v1-1-8a7cfb2876ae@weissschuh.net>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20250324-nolibc-ioperm-v1-1-8a7cfb2876ae@weissschuh.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 3/24/25 16:01, Thomas Weißschuh wrote:
> The include of sys/io.h is not necessary anymore since
> commit 67eb617a8e1e ("selftests/nolibc: simplify call to ioperm").
> It's existence is also problematic as the header does not exist on all
> architectures.
> 
> Reported-by: Sebastian Andrzej Siewior <sebastian@breakpoint.cc>
> Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
> ---
>   tools/testing/selftests/nolibc/nolibc-test.c | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/tools/testing/selftests/nolibc/nolibc-test.c b/tools/testing/selftests/nolibc/nolibc-test.c
> index 5884a891c491544050fc35b07322c73a1a9dbaf3..7a60b6ac1457e8d862ab1a6a26c9e46abec92111 100644
> --- a/tools/testing/selftests/nolibc/nolibc-test.c
> +++ b/tools/testing/selftests/nolibc/nolibc-test.c
> @@ -16,7 +16,6 @@
>   #ifndef _NOLIBC_STDIO_H
>   /* standard libcs need more includes */
>   #include <sys/auxv.h>
> -#include <sys/io.h>
>   #include <sys/ioctl.h>
>   #include <sys/mman.h>
>   #include <sys/mount.h>
> 
> ---
> base-commit: bceb73904c855c78402dca94c82915f078f259dd
> change-id: 20250324-nolibc-ioperm-155646560b95
> 
> Best regards,

Acked-by: Shuah Khan <skhan@linuxfoundation.org>

thanks,
-- Shuah
