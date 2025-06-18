Received: from mail-il1-f181.google.com (mail-il1-f181.google.com [209.85.166.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF6E227A451
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 21:21:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750281706; cv=none; b=TuZVgZxPeNUYURSPhBOujeMUuS6uGlfmofRmiTJqD7x9Y/c3zVjLE8lPNfbWLoMWlXxiM6jx55XNXk3/vfsAn9x9H3ABh9L6BUiFycn2p9s2nJMNdWzSFxBkeUm4Ead7F1elbmn78GniLjRe5kr5+c9tItOMknl0vxN5XubgRjY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750281706; c=relaxed/simple;
	bh=3Q9A+Uy7HEpDEX/GYqxA+SpsZyCTOKE2HK1F7wsecDA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FkUnKHwRCUtPAmq7eCrpCb8Mn1pjYkXLcZbKl9mRwqZCYY1Lwo/eiapWiMt+//9RQtRuGkdcCSL/4hX+sLHb0cUGZqurbOWRqtG/fFs24Uy3zUM1UG6MQheq3VYpsEq/EdrgJ8mYF1Y60zIO1qPalFx/K161f3pXfCx05yXXhAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=I+muPs9K; arc=none smtp.client-ip=209.85.166.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="I+muPs9K"
Received: by mail-il1-f181.google.com with SMTP id e9e14a558f8ab-3ddcf0edef6so643805ab.0
        for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 14:21:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1750281704; x=1750886504; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7hzjQpLH9P4msqIcMls8fz15GHsVyIhA4zncYp2T3JY=;
        b=I+muPs9K4M2rexzJQ1Rp4eTUrNd0Ha1m4qBsozNXGH2KGc40Zy5om69dh1QIDe+fxQ
         xdD7A6chgH2X4p3btPeEckxS8weZQL+bEymjJqAhmEfZMk/8nrtQK9oYyPgXtbPeUSJj
         A8yAfXLDjNraE3LUgFbARQCVPH90Zj5rAoqqQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750281704; x=1750886504;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7hzjQpLH9P4msqIcMls8fz15GHsVyIhA4zncYp2T3JY=;
        b=leZL5Nqy14zhqU6fnL9TC8TAESqT8FFu+9SSyxBqxXLmebqgLESe3sNZMRcn9UvEF4
         VfAbpgSOVbuifkKsPe9z8A1wx3mflalf0Cw1yliICQ/GTQ6tsFwwmnXUfTpxG+U85cIl
         8x+WkMxnxgupL1yfenOD41uKk1QV9dZMAzPbOBMDxkhUOYmDzqmsWDC+UYOUecU58/Fp
         wrWaivlp9mxGVEqt0qTPflxYv9h+JOt1Vdm2RoLewk6Y4MSDpZRl9VtNxeTzKzY4yEpE
         7jf6C/qM4FYn3Od+3nsaZT9rPJKink9psr9batsOEKAd/Uxow4kFDRehT5v+gv3dJovo
         MldQ==
X-Forwarded-Encrypted: i=1; AJvYcCXgZ8hR2M3cWv0D8QGMEtPC7NtBUXruvVZ8DH4anaelhVVrq5hIVVu5AsyFVuAjHHJjiWLI561wJlbuPJs=@vger.kernel.org
X-Gm-Message-State: AOJu0YyuNca17NgNeqN2+L3vO0CBQbGVbrUQeoU3+LF75gkg4ARDd/jP
	Xx4WWKJAIU2dPMNNQVmxoXSuIUXwPvDZuAPOAdk3Y91P76zZ5QBtOTrFNw477RPDN1c=
X-Gm-Gg: ASbGncssAQeMCUHp1TV2bZ62g1ZPiLh9gVb2+86yfmmx3GQoVvpxDI0JzSvrZ+QuBXv
	3Bw8DuuWJ6H0jw7j4emJZmxlk6voxs9S1hf3bhG/1g1oXBesOVn74P9ljptw0WGcSeeWfmfaTZh
	BPH2454NUq5s+nO5o8H1v8tu84YasJxl556iosmRhB8DDTh9KXuvubLm/B2jkuAi8DtQVIdg8wz
	ABPpEo4n8RDlC+EmuNsnKuxQIVyq1u6qd2xNT08biajPRuIEzjHi3GLmOy0Sz5pOl+Fe3vK1Y0G
	JS4qlqgqOgoN3dEFZJOZZ5ffYza7g895Ei8ecDH9+uQuFiDMA0RbK6qjpMBM54C/DvKZeZiOzQ=
	=
X-Google-Smtp-Source: AGHT+IELzvwbi9JQ7DZZenz0U1vkPgwf8oGH4UkYFmct5jt6JQyDwhZyf2BVjZryMiJrjh2k6xcFdA==
X-Received: by 2002:a05:6e02:18ce:b0:3dc:8b29:30bc with SMTP id e9e14a558f8ab-3de07cf9efcmr248982405ab.21.1750281703912;
        Wed, 18 Jun 2025 14:21:43 -0700 (PDT)
Received: from [192.168.1.14] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3de019b4398sm34101575ab.14.2025.06.18.14.21.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Jun 2025 14:21:43 -0700 (PDT)
Message-ID: <96c46d3d-0e0a-464a-b64c-15c2a544a974@linuxfoundation.org>
Date: Wed, 18 Jun 2025 15:21:42 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND] selftests/memfd: clean Makefile
To: Chen Linxuan <chenlinxuan@uniontech.com>, Shuah Khan <shuah@kernel.org>
Cc: zhanjun@uniontech.com, niecheng1@uniontech.com,
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20250610020559.2797938-2-chenlinxuan@uniontech.com>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20250610020559.2797938-2-chenlinxuan@uniontech.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/9/25 20:05, Chen Linxuan wrote:
> When writing a test for fusectl, I referred to this Makefile as a
> reference for creating a FUSE daemon in the selftests.
> While doing so, I noticed that there is a minor issue in the Makefile.

What happens if this change isn't made?

> 
> The fuse_mnt.c file is not actually compiled into fuse_mnt.o,
> and the code setting CFLAGS for it never takes effect.
> The reason fuse_mnt compiles successfully is because CFLAGS is set
> at the very beginning of the file.
> 
> Signed-off-by: Chen Linxuan <chenlinxuan@uniontech.com>
> ---
>   tools/testing/selftests/memfd/Makefile | 4 +---
>   1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/tools/testing/selftests/memfd/Makefile b/tools/testing/selftests/memfd/Makefile
> index 163b6f68631c4..e9b886c65153d 100644
> --- a/tools/testing/selftests/memfd/Makefile
> +++ b/tools/testing/selftests/memfd/Makefile
> @@ -1,5 +1,4 @@
>   # SPDX-License-Identifier: GPL-2.0
> -CFLAGS += -D_FILE_OFFSET_BITS=64

What's the reason for deleting the above?

>   CFLAGS += $(KHDR_INCLUDES)
>   
>   TEST_GEN_PROGS := memfd_test
> @@ -16,10 +15,9 @@ ifeq ($(VAR_LDLIBS),)
>   VAR_LDLIBS := -lfuse -pthread
>   endif
>   
> -fuse_mnt.o: CFLAGS += $(VAR_CFLAGS)
> -
>   include ../lib.mk
>   
> +$(OUTPUT)/fuse_mnt: CFLAGS += $(VAR_CFLAGS)
>   $(OUTPUT)/fuse_mnt: LDLIBS += $(VAR_LDLIBS)
>   
>   $(OUTPUT)/memfd_test: memfd_test.c common.c

thanks,
-- Shuah

