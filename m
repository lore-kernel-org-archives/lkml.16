Received: from mail-ot1-f73.google.com (mail-ot1-f73.google.com [209.85.210.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 828351FC7E7
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 18:49:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738781358; cv=none; b=C3gODMptYPSLJ4w6iNpYdo6QrYcoNyxKGwpVbSReUGO108galMBcBEwn3oJ5Y3EZQdOq58XfIzgp/K0QhXAW13XZXvonL5ZO/kAOZ3LWoruciaC8qd0PkQpi6MfitaY7xSudr+6jV00XwyaXx3heEE540vSk8/UJd+IcNWkBMcM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738781358; c=relaxed/simple;
	bh=RFLD5Y419LMLKxBPptSqSiuNprPZyJrTzacReh60S5o=;
	h=Date:In-Reply-To:Mime-Version:Message-ID:Subject:From:To:Cc:
	 Content-Type; b=nxf5JXxH0OXvb2ZdnAowRDjNGnzb0YXAeCAFKMzFP4hVFBzm7ByXfFAskyONYHG7T5jkWcA2yzqaYAVIMoSX1charj8VQa9kF7jZe+GW3mBs1hK0FX866yOlX4S1cGcjBYa5nzOu7q0XQ3BjQcTW5671Rn03RGhCXaILt+PF3fA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--coltonlewis.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Bc9D8d4q; arc=none smtp.client-ip=209.85.210.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--coltonlewis.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Bc9D8d4q"
Received: by mail-ot1-f73.google.com with SMTP id 46e09a7af769-71e197d0cdfso112130a34.0
        for <linux-kernel@vger.kernel.org>; Wed, 05 Feb 2025 10:49:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738781355; x=1739386155; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:in-reply-to:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=RFLD5Y419LMLKxBPptSqSiuNprPZyJrTzacReh60S5o=;
        b=Bc9D8d4qjFNaT5FkZfMhsFHqzSswEmFapvHOzX0kieKcw7oX2WMIVzeNUoaQk64J1Y
         8wbMMbPxqnqFextlgTsqN7OEM1DlS6SRmHEO3D/JzTvtwI2yunWKojSY1YXbHMshNg8U
         wny07IX8eiQASToK82mgYuPiOBksDzf/rFpH0gwMHeMvhtIANY+8wtnoiz9sf/3pC/Qh
         0EFqRHJbvRQ1AjuEt421TG+VUVnZAng/d4lx4bp4FPy9xBfrdRg9GN7KxwbbI4TpAuqB
         iKT3eV4Hwn3mveJBIhKM1ten3V8pIB4EaAq/yJCUVWeiV0Kc3FFDYDpxExwIY0uUoJ1u
         vhbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738781355; x=1739386155;
        h=cc:to:from:subject:message-id:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RFLD5Y419LMLKxBPptSqSiuNprPZyJrTzacReh60S5o=;
        b=UHxorleIqSFIZZVGcSH95TQwgkunTJhEWbsobCUNnLUUCAeoz+Jjct/QFdjlChjF87
         DPQ0XjsbuHEQKPg8w+f43cgRYsrCudHPPc5026G6+dbiuohoZy4+jpT7XcW7ZrRPFBxt
         +wHIpJRyeDz4pALSlicXpsrDx4Iqi/3RRgh98BoxRlZuk12RbRutZIMn+nC/lv7XCOlP
         LWJaINY2ryJ8dpQpOur0J7g4kzU67X2q3lZz/yuBYAQ5Oa0dMR2cks0V81NjFWxy3vg6
         Dxe7STTMMl+dDM/Wjubcwiy0zx7cpYeZ53oC6oxmo40et43NmzZGNfyTJeCOTX9HuPjm
         snHQ==
X-Forwarded-Encrypted: i=1; AJvYcCXbR370qFXHfU9F2Co4NyE8Hs0t15pr0K9nRy3H+yMuWK1IpX0Wa5qHUxFISvacI8ALD4sYnKkOomLeCAQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YyFyvukOklfbAHkyjGW70VRRrSjc3hUnqmOiJudJpEO2Wpl3uwB
	/xs3WFOP/sflCQumKwiJCUAu8QnMqeb8EDen1OKPGBYJsmzhFokVm46nDLkZamLVRoioozHlSvA
	1AweZ4BBNH586QmfsH1HWRQ==
X-Google-Smtp-Source: AGHT+IG1848Nyq0Ep5YZHUoXqdxSYPedyBRtjzatXIPDIYwQRd5LUrtw/B5zE5Ng8GmU9F7dXNmOSuoU4vizvGXdRQ==
X-Received: from otbcs10.prod.google.com ([2002:a05:6830:678a:b0:721:b316:918])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6830:71aa:b0:71d:f6d3:9fd2 with SMTP id 46e09a7af769-726a428cc52mr2331443a34.24.1738781355567;
 Wed, 05 Feb 2025 10:49:15 -0800 (PST)
Date: Wed, 05 Feb 2025 18:49:14 +0000
In-Reply-To: <Z6KoUBdmjVRuqPnU@linux.dev> (message from Oliver Upton on Tue, 4
 Feb 2025 23:52:48 +0000)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Message-ID: <gsntseos1b2t.fsf@coltonlewis-kvm.c.googlers.com>
Subject: Re: [PATCH 1/2] perf: arm_pmuv3: Remove cyclical dependency with kvm_host.h
From: Colton Lewis <coltonlewis@google.com>
To: Oliver Upton <oliver.upton@linux.dev>
Cc: kvm@vger.kernel.org, linux@armlinux.org.uk, catalin.marinas@arm.com, 
	will@kernel.org, maz@kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, mark.rutland@arm.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	kvmarm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes

Oliver Upton <oliver.upton@linux.dev> writes:

> Hi Colton,

> On Tue, Feb 04, 2025 at 07:57:07PM +0000, Colton Lewis wrote:
>> asm/kvm_host.h includes asm/arm_pmu.h which includes perf/arm_pmuv3.h
>> which includes asm/arm_pmuv3.h which includes asm/kvm_host.h This
>> causes confusing compilation problems when trying to use anything in
>> the chain.

>> Break the cycle by taking asm/kvm_host.h out of asm/arm_pmuv3.h
>> because asm/kvm_host.h is huge and we only need a few functions from
>> it. Move the required declarations to asm/arm_pmuv3.h.

>> Signed-off-by: Colton Lewis <coltonlewis@google.com>

> Please do not move KVM namespaced functions into non-KVM headers. Having
> a separate header for KVM<->PMUv3 driver interfaces is probably the
> right thing to do, especially since you're going to be adding more with
> partitioned PMU support.

That seems like a good idea to me.
