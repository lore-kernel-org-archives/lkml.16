Received: from mail-il1-f179.google.com (mail-il1-f179.google.com [209.85.166.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD0EC199252
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 16:59:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745341148; cv=none; b=pTMk71dJXayyRc6JrTvmA0uyRZyyoowe0iyjgPpQOxJZ+NxjHHmdCzo9Vg/RhbGpnSvABOotgkaTms13tJjrCof77tv4qFcmX6aC/drrBJQ55R+6jwFUfE2n7pXY2j/33E7k6r07sR3UOt3Hz4ZZvBI5uS18r0Kn/qGFpkBurPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745341148; c=relaxed/simple;
	bh=XtM19fp6llQW0I7FSfQu/I/iDTjKjadmXVKD8lRQnqo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dkH1IPAiwrcPMR2fddM6gAdrwVuKOUX7v8kd6UkwSAD3VLS5DSCB3WObvmcncAgsp9r5CX9Ze0CBoMlT1pRV3Fx3FgDfW4VpMd/tYRcpCI9txZpw+UfGTo+OdR6JXa7qPsduc8TTF73poPE9FulY39zGFAmjlSHTK2VxXNKF3qE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=He1CgaJi; arc=none smtp.client-ip=209.85.166.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="He1CgaJi"
Received: by mail-il1-f179.google.com with SMTP id e9e14a558f8ab-3d46ef71b6cso45634905ab.3
        for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 09:59:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1745341145; x=1745945945; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jy5TPkMpiqRKsqQU6VOgWl7+8BuUE5e/MNZHqkVmKvk=;
        b=He1CgaJiwOmbHxvK0q/o+gua1ALmOGVg8Bd49bIDyzzDI0widbOzOja0JmfQX8K75S
         u/BsIoVycC00owUKLjCumkPdlRwFIiJYquERs+2CBRXuWQXzN6avgcHI3MV8DsGo5gpI
         2ebh42wrnNY1V0ve1kvtyUq4tfMIUbug+7/cY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745341145; x=1745945945;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jy5TPkMpiqRKsqQU6VOgWl7+8BuUE5e/MNZHqkVmKvk=;
        b=QkhlKF5kmT0OR8N6DzDQBboPh7U9flX3R2EzwuecaAc0t1HqqurLDGXVkKhf7GNKkI
         7TDKowQ1kkpSZtqlsES28X3ihHpWeJ2p79fUpc6yHa3z+JonDq6TV/8beQp4CIwhuZ3E
         nxzQ8175QcZR6sIJ8LyXPfhrz12H77y/8ohdZPrCaWjPZYZt9RyPqG1XBYMYzK5Nw3gI
         +/DWnxQVrbIVOVDxq7gWG+X+U+vmYI2LSGlFV1kerWITbjtXyXkXk98AHCKa9F2ex/3J
         gsehv74K59sDCkBwswNpTD+VxKVnKb/+0zkNzJ830JQQq1Zv14kXIRkH2OWdotWNLNFP
         iGGA==
X-Forwarded-Encrypted: i=1; AJvYcCW6KwFQEPfc7G++MUh/DoEqPjWA00k8pgWQe98yBMqPe8GvB9qzbcG2sQUvNgf6kr3EOVP37vvAwDpeGBA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwVYbEs9zXHsFApDIGYQmVhXwHsn5yYKxu/TodDTUjhmg5ape9O
	up/uYhccv0EK40SDX1kN1WVVwe7kH+6BxhIuLj2kcBtc+9p4yMY4kG/nuMG3uiPeszYp8pqVnNR
	/
X-Gm-Gg: ASbGnctHr1ZJODIGRRcBrCm2uMODRRSPlJ//oJDketjN/QvSSARnVAcSVKy9kQxo4Qs
	WC/1c7Y4UGPXF4J5nfogL6onXj7I+S6oDUrDI5kpHmgne1mpt8nmSYrBshkkT0WHXu3MPF1g4uc
	sjva/yISVimPot8E/F4ropNmVkPSl4WnNRJ9QL/IF5AuyMDtRp2xEMQsBsD0cqQ6TRqi5dCStZp
	X2CIDyfnuM7Ailwe+4td5sVgWRpxanuOjaJ+4wDgT0nyZ/15Y9p581dcB01sA996EDHayBM2i9B
	zQF9DObnBlGYFmkkoNvcC9s187uoQVkrb5hc2W46WrBmBVaKjeA=
X-Google-Smtp-Source: AGHT+IEWkZs6CedJNt2KE1miQGjqJBAptodtv2M35SklMJZz7zNwT8QqCf/45+jwRTedwK7cIsTwaw==
X-Received: by 2002:a92:c24f:0:b0:3d0:19c6:c9e1 with SMTP id e9e14a558f8ab-3d88ee00454mr153841585ab.13.1745341144724;
        Tue, 22 Apr 2025 09:59:04 -0700 (PDT)
Received: from [192.168.1.14] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4f6a3957613sm2412786173.120.2025.04.22.09.59.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Apr 2025 09:59:04 -0700 (PDT)
Message-ID: <de2a5e52-8061-4907-bd48-0d6d28b83b75@linuxfoundation.org>
Date: Tue, 22 Apr 2025 10:59:03 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] tracing: selftests: Add testing a user string to
 filters
To: Steven Rostedt <rostedt@goodmis.org>, LKML
 <linux-kernel@vger.kernel.org>,
 Linux Trace Kernel <linux-trace-kernel@vger.kernel.org>
Cc: Masami Hiramatsu <mhiramat@kernel.org>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Andrew Morton <akpm@linux-foundation.org>, linux-kselftest@vger.kernel.org,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20250418101208.38dc81f5@gandalf.local.home>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20250418101208.38dc81f5@gandalf.local.home>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/18/25 08:12, Steven Rostedt wrote:
> From: Steven Rostedt <rostedt@goodmis.org>
> 
> Running the following commands was broken:
> 
>    # cd /sys/kernel/tracing
>    # echo "filename.ustring ~ \"/proc*\"" > events/syscalls/sys_enter_openat/filter
>    # echo 1 > events/syscalls/sys_enter_openat/enable
>    # ls /proc/$$/maps
>    # cat trace
> 
> And would produce nothing when it should have produced something like:
> 
>        ls-1192    [007] .....  8169.828333: sys_openat(dfd: ffffffffffffff9c, filename: 7efc18359904, flags: 80000, mode: 0)
> 
> Add a test to check this case so that it will be caught if it breaks
> again.
> 
> Link: https://lore.kernel.org/linux-trace-kernel/20250417183003.505835fb@gandalf.local.home/
> 
> Signed-off-by: Steven Rostedt (Google) <rostedt@goodmis.org>
> ---
> Changes since v1: https://lore.kernel.org/20250417223323.3edb4f6c@batman.local.home
> 
> - Use $TMPDIR instead of $TESTDIR as test file (Masami Hiramatsu)
> 

Steve, Masami

Do you want me to take this for rc4?

thanks,
-- Shuah
