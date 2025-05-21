Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB16C74040
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 13:35:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747834541; cv=none; b=SWlBfRuDDwtnn8zZG5tXMH6au7WlaPgWl2EzsoEyr+PWCh7tbMPhyByOl+xGnvQWIeA9J3P37eGjkVTtn95dCkkmFfsm65A080A6r6+Cb/9+ZGq3OSj6H1EzulPLaVc+baviZNrwVQc0uL9YK7KBoG0iri+iTuBFRSKIV3jdPqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747834541; c=relaxed/simple;
	bh=Hz0zcak+SEFe3diMwY9NS2ySs/drqRPLTc1WEtV5nik=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nqkdpyqVVvP+ipwkGJCX/jRautEV09GTFwMFVUbOGpHNP/uMAWp4TvXr93xrX99gTA89rCHFPYFRvFHovXtAEHbX/v6OAdICbY8Wxv6PDOTw2BmNejXcpwIiYDg/G/6ThmYRQ0Q8znx0ltKf130v9aZYest/7ZMNYK4/gEH901M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ciq.com; spf=pass smtp.mailfrom=ciq.com; dkim=pass (2048-bit key) header.d=ciq.com header.i=@ciq.com header.b=pfviqgCN; arc=none smtp.client-ip=209.85.160.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ciq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ciq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ciq.com header.i=@ciq.com header.b="pfviqgCN"
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-477282401b3so73810091cf.1
        for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 06:35:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ciq.com; s=s1; t=1747834539; x=1748439339; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zHr0Cs4KaT2UvU/qZTlZsSCRg1iopIeIF/2NlDc8tRs=;
        b=pfviqgCNHCSkJUE6/Z1fEmboC7SIrnVauDCGYaobEHW1kVyQ1J6i62/nXIhnJF2qLk
         io8q5yMUpckR6vRVYkqttsvXytrFqcwxQwH1rROoxtMAaeu9aBnyAFGml8c1oxOz+hP/
         D9og3fMnFASSRrZtiZN7UAhV+EaLve4TOfAAKld1ugRGMHD4+bBuClmNbgrTZKCDZP0A
         fDq9meOt9jbqdLHqjSWtSJq618N2Cvc+MbT1/tYM/zPeRWwrfpwoCXwqVv9LbHDFq27b
         lYVEg5h97nuIfUii2dqoZbs/+KD5rEKKlS86OqWLdsPCZen9twSzUQiSxm+Dw5Pj07ny
         QlcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747834539; x=1748439339;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zHr0Cs4KaT2UvU/qZTlZsSCRg1iopIeIF/2NlDc8tRs=;
        b=oJOuPN7t8wNyiwon1pWEPVqt1YLnVS24JNV5b8MAkyzZm0cuhdjuuvge6ZgeKTtucM
         6wqbCSxAC4OX2pF01mcPOC9hguK/JAYSo6VqohtAB9AMk8xx1ttaKIm0TPtrsW2emjjZ
         3RRbx/TFG+PImk9EkHTjlr/LQJ5PdL6KM5HWSVA+TbagflhHDFGE5Ou0k7h/1iHpzc4O
         XX5aT35pmwSnjy/CWZeRuSkAFI3rhgT74nMyNMmRUKjJTbvPxHAbQQVJU6cxN47ee/TS
         dITjrDk76AUFQ+7RtwT+sf9IO5qpZIa2Sgrn1CgnHYyB2Zovliups2LGEEd40WeSHKLC
         woRw==
X-Forwarded-Encrypted: i=1; AJvYcCU/jbDVepJU6LDl/46p0rwHd/PtgGSKDmv4vBPqzrIoOrtZ4aqaIYs3G6J7OWGVPh6SDFv9LB+difP+VGM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6xnnT6GnIr8bTQUgIgVIlLBWmtFyMW7JW1K0NDaq24f0fz+wh
	wB59UYsV7s05lDlxwi56ZuKLdsFeHmjCjqhmEIpPv0ihj3vvtYhTiPE7yR4zUtCS2FZqRBT2LP9
	uJt0dv8ZHd+TB3kv6cmWTJ3uQHXMYvyWNvUGOxfYdcg==
X-Gm-Gg: ASbGncvc/d7DMV6br0DPF7FwqNrtjMrl/ZZ4XJpeycpl3JxAhu0wESrrhuj9q9h7IUz
	sSezgMK6B1m29mTi4KP8teOls3cch4DMapG9iq1sF9SNDdUXcFfu3yIS7FG2qC1IObTSz5h3o9B
	znyjUUbWkE6kW4tVTcgZQI3VG/cIqxBkwgVFgctueOss0=
X-Google-Smtp-Source: AGHT+IHw0FtBYXqi2ZhMV8XwB3k6d+PXA2qv/4nhtVXTIGl5XoLNBzVEMfmLL//34e3b8tZ7idnmD0eIhKNjVFF8fw0=
X-Received: by 2002:ac8:5fca:0:b0:494:b1f9:d677 with SMTP id
 d75a77b69052e-494b1f9dbe3mr261499451cf.48.1747834538524; Wed, 21 May 2025
 06:35:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250520125810.036375422@linuxfoundation.org>
In-Reply-To: <20250520125810.036375422@linuxfoundation.org>
From: Brett Mastbergen <bmastbergen@ciq.com>
Date: Wed, 21 May 2025 09:35:27 -0400
X-Gm-Features: AX0GCFsnnZ61HrxlDsOy0x1qRDaTZbQ_XLe0x5ZFQ7bykkdgBHhdO40e1Ax1qDY
Message-ID: <CAOBMUvjDCJzGO4kZzRMi0JmzeL-Boj8b92to20AFjtDQWzSN=Q@mail.gmail.com>
Subject: Re: [PATCH 6.12 000/143] 6.12.30-rc1 review
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

On Tue, May 20, 2025 at 10:07=E2=80=AFAM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> This is the start of the stable review cycle for the 6.12.30 release.
> There are 143 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
>
> Responses should be made by Thu, 22 May 2025 12:57:37 +0000.
> Anything received after that time might be too late.
>
> The whole patch series can be found in one patch at:
>         https://www.kernel.org/pub/linux/kernel/v6.x/stable-review/patch-=
6.12.30-rc1.gz
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
