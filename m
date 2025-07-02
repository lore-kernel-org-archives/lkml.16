Received: from mail-il1-f180.google.com (mail-il1-f180.google.com [209.85.166.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B198B2F49E6
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 15:57:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751471861; cv=none; b=bmlCecgUNOEmtL4ssCU1pdSY7oLEhJMc3iTDXJqpYAM29wnubbmisR+DZ9sy8P9bulw0WuKscjGAIMCXlNrLfbmgbkg4HTvK8NLnBRr7WZgKjQCeL6b7rIGIMPG4q/J9Uc5NCyoSV8+EiIQ7fReRfm7C8yBDs5eegyheBJbrxbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751471861; c=relaxed/simple;
	bh=UBW9AmBKxoaiwqYygxaAtj2TxtrVFxLGmLOlmZwydlE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BAn5fbvDw2PayzCsj5OpY+YdE5WZE0bmaaJpyVjL1rvyHcBdcPfQeyDufBS/nNRm+JPB90X6jLx67yv+B+/boeJnmd0xhdVxQNQfoyrci8kVlYTvL3N716PATEVVEpf311ESRzlbAmE82Qnl+n1jWc2mpoupuQB42Wv1FhUecaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=AxAQjm39; arc=none smtp.client-ip=209.85.166.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="AxAQjm39"
Received: by mail-il1-f180.google.com with SMTP id e9e14a558f8ab-3de18fde9cfso25575205ab.3
        for <linux-kernel@vger.kernel.org>; Wed, 02 Jul 2025 08:57:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1751471859; x=1752076659; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qaOezCvCj2SfYR6XkwjTmit8j2uV7y/Y9zEGmjTXRkg=;
        b=AxAQjm39joQBHZft9a5oDr1wlcrJ/ZrcHOkrPfm61kL49Y8VgGoN+dGsknE18nMt+h
         e01e/IaRaGlh6lvzUA7TLDqD9eNhlkEtmPOpjZzPHw3+P8XSD6G8JkjfmakrHrGcgjqY
         izbmLB0z7VD9XwczXX580gFBQPJiK5/jYpzPY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751471859; x=1752076659;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qaOezCvCj2SfYR6XkwjTmit8j2uV7y/Y9zEGmjTXRkg=;
        b=tRrfHxX0V4KqZ3OD2ZatgvJc7klnOKB+o5M8U2KBlP+Kn68cYUdJUj54g5y1Sr/en4
         Ga9zHa+4gR4iXDptCkZyGkFOdkzwxCkUUt7l5hRl2qWMzy6TsVCfVEGtX+bGDsdPnI+L
         GOfIgMFEbxazCApY14z16T06KHBO5wlvsFFnQrng652fuNoMfXzvmAGWb5FYnDOVccYt
         cZzMctXLL0ui6A/dK24nch+xQENR/Vple6c/h+hSy+pc0xHHVmr4JhZqVtO0Rt7GMDHY
         GhsDvWYaHjEGjHncYvpHImu02Zoyc8PWJe0K5M/QH3K09XTLHFyZHPBfVRoHajb3hViX
         ch5Q==
X-Gm-Message-State: AOJu0YxIX9ZCfkdB9YxQqJpz1IH37xF0nsMEl0C7diP0yH2mIWZ0yCpd
	fpVWtHORQcYeVjFYy3PCn6rgwz7+B6IwM885bzsiH4LDJVn/pWVaMO0k8zB5swTtJC8=
X-Gm-Gg: ASbGncu7PYWFcBooIwzvDyEdRtKxyH6fDkKg4ykob4VQaMVa9WdAJnT1PLCVsawJk6w
	/iVe5aHA8biJ+pyPLOI4Mda294bfrxKjoSuvowK3U0sY74h29WBzrty/9VFaWpLbwC7Znzu590K
	h/+Y4m6W0aihlAHSijMqAiRQddBntm0FE7wiEy6VhYlKPlw2KOMNNvaBjmTlsCcWMoLdRBkJhp6
	RC/PxQU882TVCPz47lA/+YZut5IWr6FnpKQjf4kXh3hNL+xT6hxGQ3+dBSaeLomlM2Ty9jQJ2zO
	bhBh2TH5pBldSRJdF4Byd/162PkDiNyVPrwdxZHVt6dZklOFKRGkLujP2TYUKCWDTPT05cl2JQ=
	=
X-Google-Smtp-Source: AGHT+IEffZHObu858zlikGrgCt/g9OhlW9cNLvPa1LkclqEt06Pa7ejia2NnHEl3ekATO4Eo0uH8bQ==
X-Received: by 2002:a05:6602:741a:b0:875:bc7c:5cf3 with SMTP id ca18e2360f4ac-876c693db2amr435512639f.0.1751471858695;
        Wed, 02 Jul 2025 08:57:38 -0700 (PDT)
Received: from [192.168.1.14] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-50204ab7b31sm3014206173.127.2025.07.02.08.57.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Jul 2025 08:57:38 -0700 (PDT)
Message-ID: <1181af84-d66d-4ee1-810d-4bd697912b80@linuxfoundation.org>
Date: Wed, 2 Jul 2025 09:57:37 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: duplicate patch in the kselftest tree
To: Stephen Rothwell <sfr@canb.auug.org.au>, Shuah Khan <shuah@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20250702163622.12bd45dc@canb.auug.org.au>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20250702163622.12bd45dc@canb.auug.org.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/2/25 00:36, Stephen Rothwell wrote:
> Hi all,
> 
> The following commit is also in the mm-nonmm-unstable tree as a different
> commit (but the same patch):
> 
>    fd4fadf0da98 ("selftests: ptrace: add set_syscall_info to .gitignore")
> 
> This is commit
> 
>    1d8c98f3b408 ("selftests: ptrace: add set_syscall_info to .gitignore")
> 
> in the mm-nonmm-unstable tree.
> 

Thanks - I will go drop it.

thanks,
-- Shuah
