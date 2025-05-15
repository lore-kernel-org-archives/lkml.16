Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D10C678F26
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 13:31:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747315918; cv=none; b=QT4RzEwhTNc2MNxg/HOsjm2aIBISKGrcsOcx9mHGL64109yqScKRnhFZ1ldEfbopurtdIEfKdSGN/uLsV3KDE05h8/h3vYpPR3/b2cQLc3wU0rkdKxac1TbUMu+NReVrTtujQiP6PzOYKB+hAQolN73lQD9+ewfBUzAmysf3RIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747315918; c=relaxed/simple;
	bh=Y8GGo2AMVQLbxKDyPRfMjRfAQBjFC7gN/PCZcDvLNIo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TA3xwhm+sDtMk0Q4FyipISCIMlBeUCLx0TIUQ8F6B7zjPnCSlfVH3j09R+SOZ5GfXYGyvMRMHVnSV3AgFqSyO69XWrx7oPEPxmLQULl7KuUaIQiV3KDBie2E2E28IPWl6VDmXQ3Jvshq2fpTFf5IpGbmNE/3dkp0efzv9W1mJ24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ciq.com; spf=pass smtp.mailfrom=ciq.com; dkim=pass (2048-bit key) header.d=ciq.com header.i=@ciq.com header.b=EGM4ScRm; arc=none smtp.client-ip=209.85.222.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ciq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ciq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ciq.com header.i=@ciq.com header.b="EGM4ScRm"
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-7c5568355ffso76931785a.0
        for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 06:31:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ciq.com; s=s1; t=1747315916; x=1747920716; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=idQ7sd0YlO6Ua6mQ5kuc0PUAbrEds8+KAPjDg8rCdTM=;
        b=EGM4ScRmj1n/VlfczGUQ5cHVcYCC+BIk19rooYOGJRVROie3Do3pZ2Ri7j72vmyZmJ
         7xtWF78/oO15hpoBEEtWfxy18UtVRE3npxpuKGGy12NctkfAOn0hf4dEUYds4Bwe8UGC
         lIReRIQ12AhEQT/Qw/kIIjZK60VnuDpvB2olS4Pcc6tkXuMBQN13WYkBZO9HpR1lEiB5
         /VobMaDmnpGygaUzGMxIc8ztKjvrL8m9w7jrEws4l2+ta8b/PLKBMGuHx4oi62eXuDGZ
         jpCLEiduTnPE2vOrdapI+Uy4dQjya1Kww5LAHlCTPhZyAdHdOqZKiodUrncE7LcP0SbC
         fXRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747315916; x=1747920716;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=idQ7sd0YlO6Ua6mQ5kuc0PUAbrEds8+KAPjDg8rCdTM=;
        b=vopimpiW6kH/jv2s4+XYt9doOL+qE9NjN0LTceIucMAcrXxSniGstwH04v7wv1QnIC
         Wj/35fOKycWWT47os7mxLCi7xOSnjTuHfD6URdzpy0Lk5qyG/9w8kDzhe6Pbe6ro3gaw
         BPl9G1Z0znfN2x5E8qdeXFJHy2QG3R6ciZfjkYyXfkkBsvbES/jOQB7rDpEgaZClnQjV
         CrZustQdIRUTWXcs/tJNniO+m5r2xTUmoHaX9zTrQFOr1AeRSouwrutENcxx4g0HlTfJ
         tMk3TF7yA2LVKpMpCylQ0IaF07PnIp8BpECWxCOxgmJ/lzfOxIXk0GJlXqCxb4RlDOm2
         JP2g==
X-Forwarded-Encrypted: i=1; AJvYcCV2o89OIEwbl3RlCvOO/0kQU+hWWSAbLc4E5PbMwp+FnUYEUYIEG3xy66TgH+LgaYf6PnZF33+y6EUU/to=@vger.kernel.org
X-Gm-Message-State: AOJu0YyMBqK7U8I7yx0JlomLtnKQlMcxwdtg8s/loY4oPRcR7d72/VEG
	G3R1SAfeZrJm9lTV1RKQWe8jafCaY74FNCvjHitB7BECtApvvikxLdYfrfsusLB4HBnhOxnL9MC
	+qCNtirzxQ1XHpqYh4EhS1N5Q0x056fpFnvxmjA==
X-Gm-Gg: ASbGncuaoHw+FDoIhy9oAm3okg/QCq2cXIZEB7DF5B7n0DImhPVtEl0BzjGt5f+LSXe
	5GDo00b1cneecLxWiexBHTQ3EO6DATnXc8kKMcjMBBtpp4YaSIYfc2q5sZjSnYtd7nWBwa60SSu
	cwxN4gDEpyDBvyIVvX2/35fFhvdC+/keln
X-Google-Smtp-Source: AGHT+IFftrViizvwzo527CdaZ+aGd3PB2+/eA4itoniQfclfljSm+WYpnBXwFNoTgGMvKSyjqiFv6xwETd/kIumJRy0=
X-Received: by 2002:a05:620a:2445:b0:7c7:b4ba:ebf9 with SMTP id
 af79cd13be357-7cd287e16bemr972802585a.22.1747315915661; Thu, 15 May 2025
 06:31:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250514125624.330060065@linuxfoundation.org>
In-Reply-To: <20250514125624.330060065@linuxfoundation.org>
From: Brett Mastbergen <bmastbergen@ciq.com>
Date: Thu, 15 May 2025 09:31:44 -0400
X-Gm-Features: AX0GCFt_T4qmlAP_NoDOQdZAbnEbFphd6WaqCYxvy8tpdv3fkVAu8JdgYSY-VoQ
Message-ID: <CAOBMUvhtrfhJ7s2s6nL3dSoq2a3YwrHV60eRQ5e4si6Qhu3tdA@mail.gmail.com>
Subject: Re: [PATCH 6.12 000/184] 6.12.29-rc2 review
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: stable@vger.kernel.org, patches@lists.linux.dev, 
	linux-kernel@vger.kernel.org, torvalds@linux-foundation.org, 
	akpm@linux-foundation.org, linux@roeck-us.net, shuah@kernel.org, 
	patches@kernelci.org, lkft-triage@lists.linaro.org, pavel@denx.de, 
	jonathanh@nvidia.com, f.fainelli@gmail.com, sudipm.mukherjee@gmail.com, 
	srw@sladewatkins.net, rwarsow@gmx.de, conor@kernel.org, hargar@microsoft.com, 
	broonie@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 14, 2025 at 9:06=E2=80=AFAM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> This is the start of the stable review cycle for the 6.12.29 release.
> There are 184 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
>
> Responses should be made by Fri, 16 May 2025 12:55:38 +0000.
> Anything received after that time might be too late.
>
> The whole patch series can be found in one patch at:
>         https://www.kernel.org/pub/linux/kernel/v6.x/stable-review/patch-=
6.12.29-rc2.gz
> or in the git tree and branch at:
>         git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable=
-rc.git linux-6.12.y
> and the diffstat can be found below.
>
> thanks,
>
> greg k-h

Builds successfully.  Boots and works on qemu and Dell XPS 15 9520 w/
Intel Core i7-12600H

Tested-by: Brett Mastbergen <bmastbergen@ciq.com>

Thanks,
Brett
