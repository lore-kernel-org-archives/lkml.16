Received: from mail-io1-f49.google.com (mail-io1-f49.google.com [209.85.166.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41311205AB9
	for <linux-kernel@vger.kernel.org>; Mon,  2 Jun 2025 22:37:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748903843; cv=none; b=AdVTvlis/vvwfoApB+CkHZw2de2IlFUPTtz6Vzeoqi8doL//mieClkDaMa1emAUlIf4xYAuOc2knpwD7CHppN2DxGufZISvo/HetT6um7XOLmz3AbK2HhtWaa7pTjGL+IlA/k3EPAYVi7UTU2/qXwjuLufK0Xjp+8C/+gbTxelE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748903843; c=relaxed/simple;
	bh=r7k6bG5Py1kCkArtt6Kx6C3RAo6ZjdMLiXc1eV3Aj30=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=P5ktsCvOg7PtaPC3q7r/HqUE/Is+PnD9ki5zhmJ69x7yfwVp/YTfrBXovzz1UFbGN0h0UBaI4zLdrjdoC0ty4EAC3yluURREo1xSgLKGLtCRtPTiwJ7o4mwUXST5PM7RYePR3jfOjtAvL3CyKCvhmG41DJzpQ06CZaElu0mrgM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=BAU2Urc0; arc=none smtp.client-ip=209.85.166.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="BAU2Urc0"
Received: by mail-io1-f49.google.com with SMTP id ca18e2360f4ac-86a52889f45so148883339f.3
        for <linux-kernel@vger.kernel.org>; Mon, 02 Jun 2025 15:37:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1748903840; x=1749508640; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=12T9W+zJ7OWMhNAgsHi6b5IDqVrAfWIhIz/reSH6rSg=;
        b=BAU2Urc0VRP1pzMcgI9wFLmhXb49Lf4X25nGzRVf4OSs2K0iHJIpm7OdUEWcqKfCR0
         moDdw9mbapBWXIi+4YF8TvqPwwKLRqFbTZKZPQMxzTYAxrfU7PtHs094lrSlHPq2UN9t
         PCNd7P2Fz0TCbYiw4ihgQ52YerHCvXxvWdsIs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748903840; x=1749508640;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=12T9W+zJ7OWMhNAgsHi6b5IDqVrAfWIhIz/reSH6rSg=;
        b=FuepuaqdeD+YZLcRvC+uR4KIamQGdTYQUgWK6LZmFdc6/JZsrrQCjlRWGzRtkMiJcz
         lTFa86t5MyE7WXjhpJATGh4RyItSW5V7AkEeLm+P7mdjXCe3Dxj8V7h4IGe40Ksa0xDJ
         XDoGKd9p93lgEBKr1sULjWyhJzyUKAREfLFxtSBg1UfjNKGOdiGn/BueNE6kg/pMnD63
         sDeqIM+w+wfnOA/B4sy2ILiI1fv7tWnBpwftTuo55tVKLj4iSDmeWgWwPjLpoJKDM08q
         5x9b/reSt0vlHvkMt81eY0qEhXEImILdebnMZPI01vi//UQ+91diZhig5HIo436gO4zL
         WY5w==
X-Forwarded-Encrypted: i=1; AJvYcCU9FANkrf7Mp3NMkFtllVqz+g0skFyAzlrUdjFkRH+HxBN6NJG84PLleNDKmT8LPUO9mjuXNRD50O3a1sA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzJNHpxr/csJtTQVIML9lrWRLQAZsifjnWJ6ctD7kfKcS9qbLct
	6pnLdeGFredMo/NJIiulSbFf/NTJmoxhUaV5jvFpVqFfWcT7x2YmuAUIInWw3sa4he4=
X-Gm-Gg: ASbGncspfyMEICLyAUakx/xU9JEXecq8qtvvu8LuOTr6jajn/WYtTfhTZYPkSSB6qV5
	u3Dvo88Rrtd3ObKN5cVdkHj/czOB8H2g+WBuoO8RiVdyFK7mh57VvyOm87cdH25tJQvDYutbylK
	PclimInn/fP9NbsYKjIZtudsz9fdvpOZ7bJwydX9KQxcP12KgkTJ0Nd0PLvlcM1jIxmIMN+OWBC
	9OArYPWfh6ACkyayc/ZgrViKnWCMCnSM+PR/VfFHqcPJ4Bqx2wgVnMQB/AJWDr5ZVYiTUq68Vts
	olXDgFEEQrfJRqjFz3RZoaXnGa97WBaANc252UPnPZxg+rt+TJlzZfNoAKN4DQ==
X-Google-Smtp-Source: AGHT+IGf0yaexklfzi6TQvlxE6pO9F6XuAuKiNt1+vArAkLDaKC8rFe/Qu/1VP11g4Yo9fCF48ZuJw==
X-Received: by 2002:a05:6e02:5e88:b0:3dd:b762:ed1b with SMTP id e9e14a558f8ab-3ddb762ef65mr3362615ab.16.1748903840250;
        Mon, 02 Jun 2025 15:37:20 -0700 (PDT)
Received: from [192.168.1.14] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4fdd7dfe582sm1950657173.18.2025.06.02.15.37.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Jun 2025 15:37:19 -0700 (PDT)
Message-ID: <edf6b46e-786d-4614-8e50-c365f52ff9cb@linuxfoundation.org>
Date: Mon, 2 Jun 2025 16:37:18 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] cpupower: Allow control of boost feature on non-x86
 based systems with boost support.
To: "John B. Wyatt IV" <jwyatt@redhat.com>,
 Shinji Nomoto <fj5851bi@fujitsu.com>
Cc: Thomas Renninger <trenn@suse.com>, Shuah Khan <shuah@kernel.org>,
 John Kacur <jkacur@redhat.com>, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, Shuah Khan <skhan@linuxfoundation.org>
References: <20250522061122.2149188-1-fj5851bi@fujitsu.com>
 <aDhJdTWzDihchywc@thinkpad2024>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <aDhJdTWzDihchywc@thinkpad2024>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/29/25 05:48, John B. Wyatt IV wrote:
> Hello Shinji, ty for your patch.
> 
> On Thu, May 22, 2025 at 03:10:57PM +0900, Shinji Nomoto wrote:
>> The cpufreq subsystem has a generic sysfs interface for controlling boost
>> (/sys/devices/system/cpu/cpufreq/boost).
>> The sysfs interface can be used to enable boost control from the cpupower
>> command on non-x86 platforms as well. So, allow boost controlling on
>> non-x86 system if boost sysfs file exists.
> 
> Did you test this on non-x86 systems? If so, would you please provide
> details on those architectures and systems?
> 

I applied these to coupower - I will go drop them now.

thanks,
-- Shuah
