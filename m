Received: from mail-il1-f175.google.com (mail-il1-f175.google.com [209.85.166.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C18327A935
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 21:25:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750281903; cv=none; b=bO6zsNcN4Y169SsonHFhoSze79gKRq+bCb49FgXupzP6PSPKT0xLuCZgNosWooM05OsdFaSciAiRioYXsmUemNpzBm82qkqVhgFakMQuF3dZVh7nuA6QUfcjPVzET33bWMUI0+COSTYRrotR95EBzuEfpZE9esrmY9WvtvA1gmc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750281903; c=relaxed/simple;
	bh=4TnKHVuK1SxXh4SdmJti3/CTGjaeWeFbmFWbLEc5+Hk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dXmgV2wEBN2iSAD6KXx7CuO3Seqp1VigVDblpSjNVqJHdQ5tYw65X0FPR3K8RV7Nd67xSQmru91/pLLstYepA5rGdBw0WAQRDQ9FoL3zSWs/+14yEmP7tndg10IxRZMcRJqGmaHQzV5OdZ4RLE1D/hpEBM2jfWUtAAYjg7ZFWv8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=Unydjvjz; arc=none smtp.client-ip=209.85.166.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Unydjvjz"
Received: by mail-il1-f175.google.com with SMTP id e9e14a558f8ab-3ddff24fdc4so1241035ab.2
        for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 14:25:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1750281900; x=1750886700; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=T/stNUEq4UDmKbaaw+CMdc4IVQ+kMvVtSAce9sGS+c0=;
        b=UnydjvjzEQnaBKia9+dlVLaw20KAB8lEWPuRECdsOo/CFZHw4V6yVOKfKS2CZdMQCe
         jKDgmAieNYGUvNVIEscVz6G3RfFkXCZb5fkGm8Y/2jhWef/lFzNPWQktGtLHOmeeqVg8
         edOweoYcG8IDHV16CYiws9w2rQrLyAQN9by7s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750281900; x=1750886700;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=T/stNUEq4UDmKbaaw+CMdc4IVQ+kMvVtSAce9sGS+c0=;
        b=ZTtLFIUlaAVCazxTvYdQkl2ePlf+0fOt4PL8fdJGhdgxhuI73uxHQB6pBM5oIHJSVM
         b87HSx/ozg09HydRZrTWX0WEoEwiAkKAXOOP21+TBmyf6f4/bB+mULfXvhIu3MVjw5sG
         1F3moY+D2Dco7+ppQDqypfc8oJHnVrQUplPvecO/nG46/vbGg05paEJfYTdg/M2D+n/8
         I4dLSWtTYStHd6UzpXtQICdhaV/6y7pE4xB4so6+XH6htPtI1Ae24SiL11wYXqm1dHR5
         H8zeaDqdmNN8ppT3HW2IGhbUfE28WkOCDLNVkP6lPoAwR4nXZGAYvKkz1RdaI/PLCRDj
         CMwg==
X-Forwarded-Encrypted: i=1; AJvYcCXMBPJX68qLCwzGcbeLBzsys4RzwLPKC31C5a/5hrM8kkJhH2uzgAzy3T7U9PRz8xI9bLqAelW5ALFGW/M=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2JcnW/5w8NYqmzxZR91Qrigro1/lAGpoTB454GbRhrbWJw+e5
	BL5jdSDOj/QAqRqyrFqRlaDFWouQbismwe4sV05Je/wXEwGwCB0xSizQ6/B+Gzb/jdY=
X-Gm-Gg: ASbGnctLVp2ar8usuQIUeqlcFt06flzjoxtPmslIQOOBOxbQ915kKTqYSf0r8fb+xsE
	DumExlowlD+rywGs6mDqsUDoFTC78pwr0c5PgdotXZNQZXHwW2Kzgx2lq/vmLL1b6bY2u8f2UDg
	U0k8HvrvobXR5T3tZyEoh34/VwnOyu/t5NK1NvDIsN6tmiy/0zG/hx6itjKnwFGSt5wFFKJyoke
	ZK3kbsnKAKZsaOSobWHEcqmbmt56TRjn8kbnFUcWtEY4U12gopL+OCtea9+ZOx0heYDXJzNmfPL
	BVGl4jv+gjVYJQ04y9mxVVi9pXp9TRl08vXArOiMWF1wAqR2Mlayrbym7tzQLFTfYYxgMXCf2dW
	QfS2/Mqbq
X-Google-Smtp-Source: AGHT+IHmdfovRRvTsAll6RfN5zR5l+XX4iyEE8X7FBGxM0+hSaxUSUCkMemNO4l2Dex3NydMszgq1g==
X-Received: by 2002:a05:6e02:1c05:b0:3dd:f813:64c5 with SMTP id e9e14a558f8ab-3de07cd451emr241287485ab.22.1750281900220;
        Wed, 18 Jun 2025 14:25:00 -0700 (PDT)
Received: from [192.168.1.14] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3de01a588d2sm33111265ab.71.2025.06.18.14.24.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Jun 2025 14:24:59 -0700 (PDT)
Message-ID: <97e0eae8-954a-40dd-91ee-4a0a7cc4b9b4@linuxfoundation.org>
Date: Wed, 18 Jun 2025 15:24:59 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND] selftests: add missing include
To: Chen Linxuan <chenlinxuan@uniontech.com>,
 Christian Brauner <brauner@kernel.org>, Shuah Khan <shuah@kernel.org>
Cc: zhanjun@uniontech.com, niecheng1@uniontech.com,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20250610020839.2799222-2-chenlinxuan@uniontech.com>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20250610020839.2799222-2-chenlinxuan@uniontech.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/9/25 20:08, Chen Linxuan wrote:
> I failed to build this test on Ubuntu 24.04.
> Compiler complained about undefined functions mount, umount and some
> mount related flags.
> 
> Signed-off-by: Chen Linxuan <chenlinxuan@uniontech.com>
> ---
>   tools/testing/selftests/pid_namespace/pid_max.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/tools/testing/selftests/pid_namespace/pid_max.c b/tools/testing/selftests/pid_namespace/pid_max.c
> index 96f274f0582b6..c3ee8a2eff75b 100644
> --- a/tools/testing/selftests/pid_namespace/pid_max.c
> +++ b/tools/testing/selftests/pid_namespace/pid_max.c
> @@ -12,6 +12,7 @@
>   #include <syscall.h>
>   #include <sys/mount.h>

Hmm. I see mount.h included here?

>   #include <sys/wait.h>
> +#include <sys/mount.h>

You are adding a duplicate include for the same file?

>   
>   #include "../kselftest_harness.h"
>   #include "../pidfd/pidfd.h"

thanks,
-- Shuah
