Received: from mail-il1-f175.google.com (mail-il1-f175.google.com [209.85.166.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89245255246
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 21:27:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747949229; cv=none; b=TWz4EkaE3pW+1Qh1crCIfl1WqSURYtOMd54clBQ3v8h6N/XCBM4FL7xkNSwqPJ3+LJ6xKKix0gphXOAimh+h+5pDwHVPKH7FyuGQNv/v9HdPwFBZro9/U6DGMf1CD6F+9FSWoWcyLGL0Dsxk8HZRNOOnm7PB6WbyS1UtP9DdOqs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747949229; c=relaxed/simple;
	bh=us3iKQhRkalRsD/BdhzsJnzgFym5+0ASy5QVjxwWNRM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=so23nHhIXhDP2ualpYteIzdU9GFMMSUKGB4sD632fWSsgqiw8r9wz9MX4shrycc/VC8FSdEDNgrmlH+N+8teOnvJiFAxn0CpApbklgcyLQiQrJrkpExwyLbpg5VlDfS6zMhUVtW2z7zyymAL4+rkqzU4kmNRF4Ub97joEdF2nZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=IbHUkve6; arc=none smtp.client-ip=209.85.166.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="IbHUkve6"
Received: by mail-il1-f175.google.com with SMTP id e9e14a558f8ab-3dc82baf4eeso10612615ab.3
        for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 14:27:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1747949226; x=1748554026; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tPrRYdkJWlMyJE3e8/1vBPYSRNP9akBhDsTfTw7hzKQ=;
        b=IbHUkve6squdhF+m9oMoJbc9Zpxb0V3Ml8cioGhtGKkhwK/af5jVntYyJwhgw5dTAK
         +ckHg1vgTaJAO/eLd/I+0DMScTyamEPA8OS6Ea7b8BvueGvKttyUwbSU+gkxzGMEb6D2
         +ABpikm80NPTZI8/cy0nMF6sfWnzd3ekUJWc0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747949226; x=1748554026;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tPrRYdkJWlMyJE3e8/1vBPYSRNP9akBhDsTfTw7hzKQ=;
        b=DrPJJdn+dS6bepck+rlkR0M75U4Q/sMNiYfpk4+eOtebJzFPrQ0dgwgv/khjBgLa+p
         3vhlcNzh4yDw8eeJMc2Gf8hu6UHgW71kBzMp4EawO5t5GWJuF7bA8zgE4EO5LqZzyDOc
         qmewF9BlHZGXP1FxWR+uxD8ndGnUdwYX/y4eBLluWR6fsZ1+HR0pj60TN/d0v3NDsMhO
         biK575zBhLGKd8Mr8HfXkmd0Fa+18Xx7uPTIm5XwCAcOWrSa9rTnkU58n466ghuZeiOx
         +9/AgQoCJUOEDDyr5pCx6inKYV5rZ/dXPj5FDAIu7NdTDkEEqy6B9jzeSB6/PrYM5WSM
         jaQg==
X-Forwarded-Encrypted: i=1; AJvYcCVWHjhmPENey7YylsnfaadWQtfgOw+pRqI7z+tQCzwhksTNKUeX2Lebb4doIC+i/RbFnZZJfuF8x40JNnk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzHi1gxsq0a1OKS5UXktBB0PyxcJT/DSzMayjcYyWHxHAaeHlap
	kCxzIXHO3nXT2S5GRmUeiXFwWDJucFAblqXKmot6udqGR4fshwA/Obs3x7g3WO+/Vkw=
X-Gm-Gg: ASbGncurgSF6o4j0V2kJ+hsiUDlbbxRMiDq1KogYxFSLhj07W1TKo77NOcSq2OF6w6N
	BG72cHdZ97kY5lo5aERp2qJklx6RvB9HMGNFGpYM95uyd7LzSaLaByF8201ztguO5UKYsgDHjlR
	fykRif/U62ckCyag/xJiIzTliEbslpZ6aVh7M6mdOCtiZBaotWjbkPDDYH7zaH9fC2Z5eEdBQ9/
	o1YfCJft1lpeNqNK4fPTIgd0Gj+pYIvYyhQgv1OudDdahmNpcNHLiS7yVfMSrOH1IjRcoyrpTvl
	IAqjneWALBAvQvpvs8AD1SDVV80uaTj0MualA+pcthlpsDTOsFc4uXFQcNDNJw==
X-Google-Smtp-Source: AGHT+IGF9kkHq2D7sAhTSbY7gkGLf+579rCp+JAYlJuNdBfKaUKaUnINA0WTF8k6WQgBZE7m8pZOpQ==
X-Received: by 2002:a05:6e02:3181:b0:3d8:1d0e:5308 with SMTP id e9e14a558f8ab-3db85737862mr271861965ab.6.1747949226326;
        Thu, 22 May 2025 14:27:06 -0700 (PDT)
Received: from [192.168.1.14] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4fbcc4b3b55sm3280486173.131.2025.05.22.14.27.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 May 2025 14:27:05 -0700 (PDT)
Message-ID: <e2ad679c-7c68-44c1-b4fb-20b3d02a7c35@linuxfoundation.org>
Date: Thu, 22 May 2025 15:27:03 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] selftests: acct: fix grammar and clarify output messages
To: Abdelrahman Fekry <abdelrahmanfekry375@gmail.com>, shuah@Kernel.org
Cc: linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linux.dev
References: <20250513221426.303691-1-Abdelrahmanfekry375@gmail.com>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20250513221426.303691-1-Abdelrahmanfekry375@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/13/25 16:14, Abdelrahman Fekry wrote:
> This patch improves the clarity and grammar of output messages in the acct()
> selftest. Minor changes were made to user-facing strings and comments to make
> them easier to understand and more consistent with the kselftest style.
> 
> Changes include:
> - Fixing grammar in printed messages and comments.
> - Rewording error and success outputs for clarity and professionalism.
> - Making the "root check" message more direct.
> 
> These updates improve readability without affecting test logic or behavior.
> 
> Signed-off-by: Abdelrahman Fekry <Abdelrahmanfekry375@gmail.com>

Did you run checkpatch on this patch? I am seeing

CHECK: From:/Signed-off-by: email comments mismatch: 'From: Abdelrahman Fekry <abdelrahmanfekry375@gmail.com>' != 'Signed-off-by: Abdelrahman Fekry <Abdelrahmanfekry375@gmail.com>'

Please fix it and send v2.

thanks,
-- Shuah
