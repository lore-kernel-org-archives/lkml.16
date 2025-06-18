Received: from mail-io1-f54.google.com (mail-io1-f54.google.com [209.85.166.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A4B6217F2E
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 20:52:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750279934; cv=none; b=rY4cend38uamLaBg7CT0cDAadmD/DNl1B1zibhNSxcPBlTYGv8WfO2GKfOMEOtBRMKsI9tIAtnMte1SM6qOC6J3CpvhGe6EjTEwB+okg26zQosWohsbZQjpB6CQzyGgm5oycI7MvMCId5+4u+RKBWnM8da9CcV6dSqKtB2O2jEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750279934; c=relaxed/simple;
	bh=udfxxBUYqOxwF4CpJe01eYlAvRjWcIPtTrlrYNAkw1Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cw4WfvoTvHcGvN2K5BiE0ImGzw9Vv9cZ3zVzAcTUh0yuyvDGAMY2WuNKX/o2ZVUrEwNFMO0oGO9fH93f24ZTZ+mwFMNPAxddl60fJFpcC/rikr2CbDaG9vIJsLLvpesoHo9fnlATpfQlMLnY+4OD/EIyGqs+chrYv0ZzmeSKJBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=Tx6xHE3d; arc=none smtp.client-ip=209.85.166.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Tx6xHE3d"
Received: by mail-io1-f54.google.com with SMTP id ca18e2360f4ac-86d0c5981b3so867439f.3
        for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 13:52:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1750279930; x=1750884730; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0Y7/EqwIOfu/4i0R5S1fQpdZTumyIs1zK/W1iPvlsMg=;
        b=Tx6xHE3dr5yHfhCSAYw1ZM8boLJLe1tjT8s2V04jHLarNX5n7+d76DtwBP9aFpH0oq
         YzFwthNCK3gTvz0Ga+1dCmfwAqUCenpM0o+vUkQwZtgpp2frSKFQixUM+Iv3zQszVXbg
         ndyWdXNwPHKHhEvnGY0EdcrNhl+zdloqEA9II=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750279930; x=1750884730;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0Y7/EqwIOfu/4i0R5S1fQpdZTumyIs1zK/W1iPvlsMg=;
        b=YmR01D+TYHmOhqyLb8vKjj5QOyn2Faj8UzI5duNxO+ieJ9cSYeH3B4kkTP1vvJW7IX
         46jrQDuGqmh6leDHIApNDBA2n4+qNsSUVLuaelt3FHoV7KST5DxZGonPOQXmOkExT5o5
         2Ob0L7PsN6MNLMrOYo+PP0CUeTEPdKmg6fyRKXxgPWCZKDCh39TBmcKSarberENxctof
         IqFNkwEZGKP5kw63HTRekBTi3cLmN1hVqojatqxgX6jv80nf1xHhiIfxoTUCVsT1fguO
         gHY7jJZCrfICpnce0DGHzR6nCW15e9PKEN05id+LFC4LilrT5AurCkgmRGu9+KyvJh+7
         Z2Dg==
X-Forwarded-Encrypted: i=1; AJvYcCVJQD03hki/IM3JHsCCidBPftBh16ZvvmcLxcsi3PtiRvPph84D7D/kWFjvQeHXmR3Q6ORgmDVYK24Ybms=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzlx5Yp1KPreSIuqZg/UkdMCXI0OqyRwM65/de+S/0gT2Ei0x7n
	tAFzM9WAZcK+pYNXqt7be0Brf4c3I63POxouD2Vf0Jxh2WcKbjJM4G5W7WUlINdskgo=
X-Gm-Gg: ASbGncs9dWr4CswGuVqnVh7QZbQcgG6qca2n1usaV4diyQ/qMWTHA+V50Qu2am5FrM1
	Hf2a4/sdeOuJz04bwh810PbdXykYu0J9rwabTGSIhkBfG9uLCd0SzJJEJo49u/oZojmkakAuHJR
	6BrL2DO2MnoWlLtVZj+r9UsxmoeFZMEbl+dx08GQI9uScq2MPBKTufw+4FlGpLEoEsD9TWxSzCy
	XhC0ZjkzVbbfmk/BTVuASeTYNC0FdCfDIGL0zjfqevHSjbXXrtZwn9NxasDiG9Eppbl4o/wCc1b
	ZGlG0MQsrwtmKmwZHpSn4kQaR1LKV1MWSbQ5nAmSTOvJ60cMKtN4PtzK/CzS79eZ1cTalAanOA=
	=
X-Google-Smtp-Source: AGHT+IFPfu2uaM1NocL4Z4iAcYmQ75ftw0wdya9PlU93jjCX0lxXWAzQlA6uFQLDr/7/ZZFP1+EZow==
X-Received: by 2002:a05:6602:3fc3:b0:875:acf6:21a with SMTP id ca18e2360f4ac-875dedc39afmr2110106839f.11.1750279930245;
        Wed, 18 Jun 2025 13:52:10 -0700 (PDT)
Received: from [192.168.1.14] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-50149ca31b4sm2952500173.132.2025.06.18.13.52.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Jun 2025 13:52:09 -0700 (PDT)
Message-ID: <9940a310-5a39-4489-a1bf-0809e5914c08@linuxfoundation.org>
Date: Wed, 18 Jun 2025 14:52:08 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] selftests: filesystems: Add functional test for the
 abort file in fusectl
To: Chen Linxuan <chenlinxuan@uniontech.com>, Shuah Khan <shuah@kernel.org>,
 Miklos Szeredi <miklos@szeredi.hu>, Christian Brauner <brauner@kernel.org>
Cc: zhanjun@uniontech.com, niecheng1@uniontech.com,
 Amir Goldstein <amir73il@gmail.com>, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20250612094033.2538122-2-chenlinxuan@uniontech.com>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20250612094033.2538122-2-chenlinxuan@uniontech.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/12/25 03:40, Chen Linxuan wrote:
> This patch add a simple functional test for the "abort" file
> in fusectlfs (/sys/fs/fuse/connections/ID/about).
> 
> A simple fuse daemon is added for testing.
> 
> Related discussion can be found in the link below.
> 
> Link: https://lore.kernel.org/all/CAOQ4uxjKFXOKQxPpxtS6G_nR0tpw95w0GiO68UcWg_OBhmSY=Q@mail.gmail.com/
> Signed-off-by: Chen Linxuan <chenlinxuan@uniontech.com>
> Acked-by: Shuah Khan <skhan@linuxfoundation.org>
> Reviewed-by: Amir Goldstein <amir73il@gmail.com>
> Co-developed-by: Miklos Szeredi <miklos@szeredi.hu>
> Reviewed-by: Miklos Szeredi <miklos@szeredi.hu>
> ---
> Changes in v4:
> - Apply patch suggested by Miklos Szeredi
>    - Setting up a userns environment for testing
>    - Fix a EBUSY on umount/rmdir
> - Link to v3: https://lore.kernel.org/all/20250610021007.2800329-2-chenlinxuan@uniontech.com/
> Changes in v3:
> - Apply changes suggested by Amir Goldstein
>    - Rename the test subdir to filesystems/fuse
>    - Verify errno when connection is aborted
> - Apply changes suggested by Shuah Khan
>    - Update commit message
> - Link to v2: https://lore.kernel.org/all/20250517012350.10317-2-chenlinxuan@uniontech.com/
> Changes in v2:
> - Apply changes suggested by Amir Goldstein
>     - Check errno
> - Link to v1: https://lore.kernel.org/all/20250515073449.346774-2-chenlinxuan@uniontech.com/

+ adding Christian to the thread

Hi Christian,

Would you like me to take this patch through my tree?

thanks,
-- Shuah
