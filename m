Received: from mail-il1-f176.google.com (mail-il1-f176.google.com [209.85.166.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 268F07083C
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 15:33:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744299225; cv=none; b=s51D93x9QkUJKKuaDGvzrwW3r/lWxxnKc1LgDf27EGD0ULvxCAX31qrsU7B8NGIDI0YGlFtTrZ9Rwl0o/WmZOGpkbcOhos/kgx2xak5rLqexS7CH1obxIaXzkuC/5AM/ohZzrBEV71YXu4H4HEHgpFZApqY15SqK2Op422yyHUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744299225; c=relaxed/simple;
	bh=v99tiqhZEPNc+au+zsTlLfO+UL4lnCpGAj55KgcQOyM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Epvf6imnzJ9p5YbT/OjU0ZybSSUsvuTNhj7l3UOuOhqiSrmZt6XaUsVE82GIy4sidfda5uMYm/qOId18PEe7p5njDYEmUB3OHKK1tRgR6QX+pLDbX3sx2LCBFjzv3HhnFZjtMYF0fL5yG7lMltgiVg6WQRDTNjxf+KHsuL3XTB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=XdvUjbOQ; arc=none smtp.client-ip=209.85.166.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="XdvUjbOQ"
Received: by mail-il1-f176.google.com with SMTP id e9e14a558f8ab-3d5ebc2b725so3242015ab.3
        for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 08:33:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1744299222; x=1744904022; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TWuu0TVvkVtEFQtTM518BO6Po0Ztx9T2clp/sbsG4gU=;
        b=XdvUjbOQSZ2FbCmM7yrk1oQiK0qVCi7pOOZYrF2G7x7xU+6jlqt+TcxVLoN8D5T3PV
         o87psddCbCZyzCdmbgJCyW1G2gudqolRdqyrB6B8UMlGtq+MjxR52VZBaO55hY27YiSB
         fdE90Ymu3KKhIJyZomFAaxRtz3/TBxnl+sNt4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744299222; x=1744904022;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TWuu0TVvkVtEFQtTM518BO6Po0Ztx9T2clp/sbsG4gU=;
        b=d5Y0g78yPj1CB7ri9J3BSvl+2t19gF5FIBC0ZRS1p2m0suTvevLgnfloejOXjEyNrU
         Hs7onW/AJk6XcAQhlS3264oSWL5I/CkvuVYopMTx7JYE+7WW5r4DmpQcEau35uyRMBHZ
         /B/pSk6kRTEkt5IxQd5mSP42HheKp2oIWontDNQumJYL9gDuOAiwnJMpSA8gH7g/JfEp
         KKIN9Qo8KCnfiXEzd9VlQvVKrWDU5Flb6FtMGUpKWMckHFhcphvdfyYzIyq0W3qAcm7a
         czLQyUt2GK8J0iQ8MQ6eHzoIicG+ol3oywELljBfOTPgicU5lpnmMhZr7BD4nsu6NS+S
         RZjw==
X-Gm-Message-State: AOJu0Yxuvd+mvyEw+OZQ1fW9cxkVPKnNSh4YbsxfKoCXFnn3Bh9V6tKS
	Uzh8HlU5qZlaUVr2gedDjo8VOiBNAHznq9J+TlRE8N1eMaf5gtiEU+hQI3f1lR0=
X-Gm-Gg: ASbGncvYvJrsHfCT0knliGNh/azrWrrEe6pORC9zM36oxv1WIQ0NIeRbLnFzHvsEiKI
	wIpLn2OMUD0xn3fFzxrLUJQGNFDuyUJ9jjwf3Af10FZrL/nUdqK2UyBvc1yYCd9XK1CBpCpp+tD
	DReImOH2Cp/gkERs8BAGoMhFZRSzw2WLL7S4yRgDruaI/I1WnvFK5RSXvjgL+XyImLgQtSZo4TM
	0scINmix8EOXrcN2mkyo/hbcpKMdGRReYhYeFtgulSw0RtGgsuDFYeA6+XeSDtvXpd/O5PwgfLp
	KQtL9Pm6/B43EnGpyjTr+pE0Bb/9oN65NN+hrX8zUsqhTH+gQbk=
X-Google-Smtp-Source: AGHT+IEMrgXmJRRAoLU7m+PL1i/g4DJ8Gi+/jcEloYQwuzmWrc2QtQdxI25WU5XntnT2B7cItRJfPg==
X-Received: by 2002:a05:6e02:194c:b0:3d0:21aa:a752 with SMTP id e9e14a558f8ab-3d7e5f50684mr32572795ab.2.1744299222246;
        Thu, 10 Apr 2025 08:33:42 -0700 (PDT)
Received: from [192.168.1.14] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3d7dc591f6csm8208425ab.69.2025.04.10.08.33.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Apr 2025 08:33:41 -0700 (PDT)
Message-ID: <f72fcc0c-b0b5-4131-a5b5-bf1d1320c85c@linuxfoundation.org>
Date: Thu, 10 Apr 2025 09:33:38 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 02/32] selftests: harness: Use C89 comment style
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
 Shuah Khan <shuah@kernel.org>, Willy Tarreau <w@1wt.eu>,
 =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Cc: linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20250407-nolibc-kselftest-harness-v2-0-f8812f76e930@linutronix.de>
 <20250407-nolibc-kselftest-harness-v2-2-f8812f76e930@linutronix.de>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20250407-nolibc-kselftest-harness-v2-2-f8812f76e930@linutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 4/7/25 00:52, Thomas Weißschuh wrote:
> All comments in this file use C89 comment style.
> Except for this one. Change it to get one step closer to C89
> compatibility.
> 
> Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
> ---
>   tools/testing/selftests/kselftest_harness.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tools/testing/selftests/kselftest_harness.h b/tools/testing/selftests/kselftest_harness.h
> index 666c9fde76da9d25fe6e248a7f2143c113473fe1..bac4327775ea65dbe977e9b22ee548bedcbd33ff 100644
> --- a/tools/testing/selftests/kselftest_harness.h
> +++ b/tools/testing/selftests/kselftest_harness.h
> @@ -983,7 +983,7 @@ static void __timeout_handler(int sig, siginfo_t *info, void *ucontext)
>   	}
>   
>   	t->timed_out = true;
> -	// signal process group
> +	/* signal process group */
>   	kill(-(t->pid), SIGKILL);
>   }
>   
> 

Looks good to me.

thanks,
-- Shuah
