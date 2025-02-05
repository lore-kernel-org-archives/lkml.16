Received: from mail-il1-f201.google.com (mail-il1-f201.google.com [209.85.166.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE59813D897
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 18:57:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738781834; cv=none; b=u+cVZVxj/KR0PwaV6A1UURL3HkG6+DHykuLpw3BrI11SSWqz9GKhBqzpCOE0hYUsA3PjTzR4aTUoYsZvDMHhXIGiogLvu/gh5X+Ffu+96s1yAarcyu9JTSqBk1eQ3vIwaL1omfdm803ZBxEKdzCh7O9oUPSVTcSIum4H2LMiPAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738781834; c=relaxed/simple;
	bh=rOrAEmmc0o2wzEyiwOq4DQ4uXK1/Mbcgtx+WsCmakwQ=;
	h=Date:In-Reply-To:Mime-Version:Message-ID:Subject:From:To:Cc:
	 Content-Type; b=U0R/k/GjgQVmxDvpePeyKCfoZpoGZ37ErZggFVmrfQ3poD2szHpURWqqv8xjrTdT5ulbqcEUbWImqp8KnAQXtqw1cSk/Jsm91T3esymxfu5IJ1zm2EPbPa9rahz5QY/YmotwPfDFWV9iud3YDNKLE/gFpLCadsXtDYtE7pf300w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--coltonlewis.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=I/gF84+0; arc=none smtp.client-ip=209.85.166.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--coltonlewis.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="I/gF84+0"
Received: by mail-il1-f201.google.com with SMTP id e9e14a558f8ab-3d0203cf90cso927265ab.2
        for <linux-kernel@vger.kernel.org>; Wed, 05 Feb 2025 10:57:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738781832; x=1739386632; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:in-reply-to:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rOrAEmmc0o2wzEyiwOq4DQ4uXK1/Mbcgtx+WsCmakwQ=;
        b=I/gF84+0v8UjGpjupw7XyMERPXHuG8+pRbEQDrEJbWWFTK9n62c4UDsR30tUbH0CRj
         NIWQ7B9uPQ0Divi0i0tx9hU9JaPrKr8ZIAXTlFgSt6qrltiCRKYEi+2UmwUg2SbpGN8Y
         tu/tyfI6MTDV35rmT1bz0nxZnPABEane90507r2rayX+oGbx0jxnv1sD2OPLipKfGGKM
         ymFcVl5WQkepwemTilcGYIzCKNjmHaqCoJf0TygWeCI7ZiPNhQOIY6Q/QZcpmVfLlfo3
         9pd8pqba7hJ+2UcVsIJ7l992a8UOCJs2gDjbSEjlD3GJR5ZN3Unjvn7pLh9i+sp6EOUs
         CYvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738781832; x=1739386632;
        h=cc:to:from:subject:message-id:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rOrAEmmc0o2wzEyiwOq4DQ4uXK1/Mbcgtx+WsCmakwQ=;
        b=R56O6Qy63puBpgf7w09CMKjhPBRNnMRDifhXfuUu4luwuQ9+tt+Nx4J5+L7AyzTzxZ
         u1eI42gF3xCxeGVD3oE9oT2sLACg8vbrko9LYInkOD+um39aWlX9N6ahk7tXcRgqEZIB
         H314wX51X9KXSDJU8D49KgYjZvTg0a4Anpmx4i9bgORNMuoOSV4TQPQvVbrY/dKR7Ie7
         Dgiz+yiMYonma2UyxsJOeyGhh6abqByZMy5MhEFQNHuBw/sewl0B/N49nmQ9nrUUP0mH
         avUGZm+kbz+7Stnx18cvt5Zwd9vVpszzkvCkbAc6mAtu+2MQ4WbGI6F8VgUWwodLDoYn
         7cbQ==
X-Forwarded-Encrypted: i=1; AJvYcCUVWhRP/w7nibSOcZva3CU4fucIWgHCjB+FsXrXEALREwM0J2++3gmUy3LZDIgweTzA1kIFZak+VSEKkp8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy61wyHAw3R3fkDhNJ+K+tmb71tuPMKKunexVm+hQZdE7ZuG2+O
	4T0I+GhMLo41wW2hdrROCKI9SPtprWC2oqfOkeGC3MfBz2ojwJroqLtjBSSpS5CNr6YbLhamAUc
	MZfdWiH3rCCOaDh4UamLcMw==
X-Google-Smtp-Source: AGHT+IFWjXwnbjoiuM23Lh8ngijtdwE4nXRVNLab1fsF4fpL0OVJ9k6mAwaRhufdfdCX0QUJltSRVIg24JQ3/eImKg==
X-Received: from ilbbe10.prod.google.com ([2002:a05:6e02:304a:b0:3d0:e0a:64e1])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6e02:2197:b0:3d0:1fc4:edf2 with SMTP id e9e14a558f8ab-3d04f41ec43mr42282665ab.7.1738781831860;
 Wed, 05 Feb 2025 10:57:11 -0800 (PST)
Date: Wed, 05 Feb 2025 18:57:10 +0000
In-Reply-To: <Z6KqDR3S_AWXXLJK@linux.dev> (message from Oliver Upton on Wed, 5
 Feb 2025 00:00:13 +0000)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Message-ID: <gsntpljw1apl.fsf@coltonlewis-kvm.c.googlers.com>
Subject: Re: [PATCH 2/2] perf: arm_pmuv3: Uninvert dependency between {asm,perf}/arm_pmuv3.h
From: Colton Lewis <coltonlewis@google.com>
To: Oliver Upton <oliver.upton@linux.dev>
Cc: kvm@vger.kernel.org, linux@armlinux.org.uk, catalin.marinas@arm.com, 
	will@kernel.org, maz@kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, mark.rutland@arm.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	kvmarm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes

Oliver Upton <oliver.upton@linux.dev> writes:

> On Tue, Feb 04, 2025 at 07:57:08PM +0000, Colton Lewis wrote:
>> perf/arm_pmuv3.h includes asm/arm_pmuv3.h at the bottom of the
>> file. This counterintiutive decision was presumably made so
>> asm/arm_pmuv3.h would be included everywhere perf/arm_pmuv3.h was even
>> though the actual dependency relationship goes the other way because
>> asm/arm_pmuv3.h depends on the PMEVN_SWITCH macro that was presumably
>> put there to avoid duplicating it in the asm files for arm and arm64.

>> Extract the relevant macro to its own file to avoid this unusual
>> structure so it may be included in the asm headers without worrying
>> about ordering issues.

>> Signed-off-by: Colton Lewis <coltonlewis@google.com>

> Is the intention of this change to allow asm/arm_pmuv3.h to be directly
> included? If yes, what's the issue with using perf/arm_pmuv3.h?

That isn't the primary intent, but it's a good side effect. Headers that
can't be directly included violate people's expectations.

> We already use definitions from the non-arch header in KVM anyway...

My intention here was just reorganizing a counterintuitive use of
headers. The arch header depends on definitions in the non-arch header
even though the inclusion relationship is the other way around.

But this patch doesn't matter as much as fixing the cyclical dependency.
