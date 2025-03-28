Received: from mail-il1-f176.google.com (mail-il1-f176.google.com [209.85.166.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B26A41DF72F
	for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 23:58:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743206318; cv=none; b=U702JPIG8hRnAbeXZDFzKEhVNgyO7i3h2Vzrm9DL3fBEPFtV1RnXfaPI16XfAxUTvxDlnPNF90XtSAombOnThevRUGZj2hVweFJkgax4MXu95P8soPueFL2bTjFwkD8+l0FEaXiHh5NpKIqh8q2ksL/BOwVMGLXH28Cz2iAv2hg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743206318; c=relaxed/simple;
	bh=p6m/nvz/Q2Q0JIFlNq4Hw/EgwqnEbBRnzIoKtvBxnQ4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Zu2nKQld8zPtPBa6zhe2KKIRZJ6zPvAf1/zGwv3kJdI3TdFemI9KceIQ2c535KQGaQ8ToVXOhknbV8G3W5nm3TDiWb5yHBwpJK06dcnuhBdSbOCcdlKpPJw6Mn2CI+rptq6bES3yE7FXMSVcAg5jVAyrHXH1p8iShHJrsdVIKys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=awQLkTWs; arc=none smtp.client-ip=209.85.166.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="awQLkTWs"
Received: by mail-il1-f176.google.com with SMTP id e9e14a558f8ab-3d5e2606a1bso877715ab.0
        for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 16:58:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1743206316; x=1743811116; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=t5JcEI/bdJeiO7FQkHMbOrLBwPR+IcOVIoR62S759ko=;
        b=awQLkTWs8C7VEnQn/v3pfJMmpb0HtW0XPb8TrQCBTNPVSk+y06amIUNHINHi0xv3M+
         xWzGmPaYBUiJXv9gkKzVUWLe+bO6pOwRTQbMena6R0ltMOX9jkjcYMa2Vc+afrFyxGwK
         27w1b+SsNdawssmcTVk9iG7nrfCdC2xKOo7Wc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743206316; x=1743811116;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=t5JcEI/bdJeiO7FQkHMbOrLBwPR+IcOVIoR62S759ko=;
        b=WDs6sjbWF4FqgfUdvFFgT8FX/JiDjRY7QuD41r9AhoW7xwYjvmPTr0b+U16Do4Rz+D
         uKp0eWCf4s1snQR1ce1hCjjpg3C3UeIayqF5l+hJ5mKLXXz3Jj5KRLKMzljjb1Yj/BNG
         mZeQLXqi/8JM3a1ybyRKoHzFBCgh8G6l+o7nstby4qFaaFx5hxkm/aQCGYrIiZsVH92J
         YYlFHmEjQBe1azC1YO7D/YdbfibG9sSGsjGQFMscujpDmROxmMjXH/vmzt81lck6dLsK
         IASEx3MZx+XKP3BSV0qwIs/pQsWibJhyEvt8Z1RsorZFs3mmfFfixuHKUDE9+3THMlGI
         mqPA==
X-Forwarded-Encrypted: i=1; AJvYcCUpequq+xOItIaVpK2ic8zreeMRxpD9t8qkEOw4HfGYjbQVHacSGJ/ew8JSnDpo293Q5AZGrHWvD25OCjo=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywjxc7gz2skhO0oqQMsi0Q2fHgBASduqrX9OC2BD2PtIlNJIADi
	S7l7hwUbPxzDQHueyT0nPYO39vW7dDt3bEbDm7QUFHrcPsW8B6JIKi0W5x8Y+Fk=
X-Gm-Gg: ASbGnctj3NxsTylXzZPxLi6tP335dhkIKWfga1sSGyW9fpFk32rRXz1GlBRvP0rJgwT
	stH6QtKLqUPeeKbiTkyHHfY9uuog5+zV8kD5V7f6CLJqWJfkxGtbYR7y84N2gqWCmc/2jlX9eJL
	anvbk9hC35vZR2dCtnc7X8A+RwoPtARArnsINVaXEFkMQNaE7IKzGu8FoAUKrZtkv+RgzC01PEj
	0r/68fL3Vr70xBMjtWmByaoGJGTKZ8CBGY7aQAZaMOriZc/zkgWyPN9W3Wap/OT2Bs+SB8mu54R
	8V90Er8rxawTJTb7qZdlWuum0+ZmCHnK0f1gvk6zID/R077PUvR3hZJ+x9RyhPboBA==
X-Google-Smtp-Source: AGHT+IFk3MJlvLeFpqX0/xXhiDnhkbsvv/gybLX1nzNP/m6Tx4Ep4JZoTJEVdakXyN/Hyebwsn24Cw==
X-Received: by 2002:a05:6e02:1aa5:b0:3d4:6e2f:b487 with SMTP id e9e14a558f8ab-3d5e07e88fbmr17198845ab.0.1743206315648;
        Fri, 28 Mar 2025 16:58:35 -0700 (PDT)
Received: from [192.168.1.14] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3d5d5ae2591sm7073465ab.47.2025.03.28.16.58.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Mar 2025 16:58:35 -0700 (PDT)
Message-ID: <92cd8fdd-30eb-479e-9c06-31d6a467cb89@linuxfoundation.org>
Date: Fri, 28 Mar 2025 17:58:34 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] ublk: specify io_cmd_buf pointer type
To: Caleb Sander Mateos <csander@purestorage.com>,
 Ming Lei <ming.lei@redhat.com>, Jens Axboe <axboe@kernel.dk>,
 Shuah Khan <shuah@kernel.org>
Cc: linux-block@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, Shuah Khan <skhan@linuxfoundation.org>
References: <20250328194230.2726862-1-csander@purestorage.com>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20250328194230.2726862-1-csander@purestorage.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/28/25 13:42, Caleb Sander Mateos wrote:
> io_cmd_buf points to an array of ublksrv_io_desc structs but its type is
> char *. Indexing the array requires an explicit multiplication and cast.
> The compiler also can't check the pointer types.
> 
> Change io_cmd_buf's type to struct ublksrv_io_desc * so it can be
> indexed directly and the compiler can type-check the code.
> 
> Make the same change to the ublk selftests.
> 
> Caleb Sander Mateos (2):
>    ublk: specify io_cmd_buf pointer type
>    selftests: ublk: specify io_cmd_buf pointer type
> 
>   drivers/block/ublk_drv.c             | 8 ++++----
>   tools/testing/selftests/ublk/kublk.c | 2 +-
>   tools/testing/selftests/ublk/kublk.h | 4 ++--
>   3 files changed, 7 insertions(+), 7 deletions(-)
> 

For selftests changes:

Acked-by: Shuah Khan <skhan@linuxfoundation.org>

thanks,
-- Shuah
