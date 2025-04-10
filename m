Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F44D1D5AC0
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 15:17:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744298249; cv=none; b=mVINujpARLl3Y4GbwIynNC8XZ4NyZCncDTMbZ1QoYHwfs2kJfIX7RNtOy9ICiS4HLWsa9WSqVgdqt8j0cUY0bNr67OhotJWjBTeKUXJbtkRw9ZSYXwcF/PYkbqvbFFcLDFfUziQoG1X1KH/Tgs+i69qWjHLsSXdb0QyRW4MzA7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744298249; c=relaxed/simple;
	bh=hLk6XTKcmMABoUGjVeKBYfaEJiteVf593gjpM78Fd2s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oMkjlBknbrKBwByYiuozz+ZQaxPkOGutsE9lj6V2I89P5fyeHwn7amk8/FjAkQSmWmBwtkGIFdt9zX3lVoLQqDPUZ/v3n4PgJZQQzaAY8R9gNVF3c6q1AG0BagDK0RDodxSiA31XN4jdEiF/dAYaw2e1uQX5eLaY4W+y9+VWOTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=Y3MQp1cb; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="Y3MQp1cb"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-43ea40a6e98so9007345e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 08:17:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1744298245; x=1744903045; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=f6cj/et3tJLOi8nZABzE1bZ8So47tTX91IayHIgQTo4=;
        b=Y3MQp1cb2Mc+wnp9DYt3+gTXVATPrVfdmgxgdIBd6HnHKn81edOxIdLyQBw9XkI/MA
         X5Z6jp0hR3/7UtliArk2HJPIFqFnjoCdWyBK+ATL7VhItipOQygwcB9/HNdC20q8iDV4
         nhTReiEPieyX/mjWs3c8Nyc/sgqP7UiY53VwT0xgMzyzlWrjuXrZOBELZPGzr/MFf2AX
         QeOga/oPDJSFAWZeM9Al1TjE3dr2thJU3Fpl0z3vxfSR7pDIwGuCvBaV93pWJgtgSTjr
         EnAs3ULgxXvJvoBzyF3X9lcrl9hvjQ0bjP19H3kww2p0vu/zYCSwch+WecbKIyn4na8Z
         YMXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744298245; x=1744903045;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f6cj/et3tJLOi8nZABzE1bZ8So47tTX91IayHIgQTo4=;
        b=fGuhYH2BlP9Z251UxoerGKb9OY0VNU9K9zwr0tMnXDjdAuXEsWhN6BO9lz23uY7uuA
         XZQ3meFRwLx/7G6Z56+AgjEx0z6AI7qvlUWY3f1fAb5x3LdluVpEq0XJ+AfdgS0hhOvw
         k2K6+ojtUMysxncoF6bd9jCXL4g65XUVcW5c09DWstTpmd4q7EsKzghUhazyhZ70SuFa
         +CfcO2vDwNBS2swOVFTVoYionD2s5P4VYvoXbi4KkDUlRl+a+WIhwaggG+hKponaESH0
         cpd2fHn18BL3YQfP41k+tFDLRUcgPmH9Bt7DSkvrmgk1pwzy/uTVdo8/bZgGILmVz9ug
         fUXQ==
X-Forwarded-Encrypted: i=1; AJvYcCWbeSVUj3dNJ63D0sWg43rUuVeCKcr3HnnDh0WTmAZBPDjqwJz2N1gNCQwxcvjnc7+fr5c8+FNEn9HRg2g=@vger.kernel.org
X-Gm-Message-State: AOJu0YyeubQgkEYl27HLpY5vR6qwSWqzjCcfwSC+P25KUGPVn3AJE4yj
	jgo/2pVssPG8OgsYmlFVRG+MHx/ZwYYtXRTk6ieS2by0yUPp7MCjkmxxOSD3RR6goVDAfWCc+Bo
	f
X-Gm-Gg: ASbGncts1uCZRNU/oUQexNmAK9gjfmUUn/fBE8l0soJXIO/liAIV6kbyZT63y1P1rNW
	I0aj6ZD0nKlREkOlH3fQZbb8O4DVEa1wUqTgF+qFxeJQzjCr+0iX+BJV1CyK9t6vISHC92NzJ9R
	hgkWclGj3QthnFjlwHsCcFzaZgYQ0RybFcCq4/aGvl+T7w3Kj/iZ4xvzH00U8GbwteKgYGDyJq5
	9L+2vh/cEH2oscoMgHZQCgomAGSM6KyMEoXajnQiCDt/z3GVXWbu4RIaHVco1K4mXCDhyqAef9+
	5dN49eeCcqrZ6fGgj63wnWRjN8PvJhQ6Sebyy7ebq7cOiyPQ5nN8aA==
X-Google-Smtp-Source: AGHT+IG+NzZVvrmsCa4ZlEdd9DFX82PR77L8xEbBogXJLZfgAsJhybLCQSoboxlSlXUt/tEoUyKrwA==
X-Received: by 2002:a05:600c:5023:b0:43c:f87c:24d3 with SMTP id 5b1f17b1804b1-43f2d9529aemr28961245e9.20.1744298245314;
        Thu, 10 Apr 2025 08:17:25 -0700 (PDT)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43f20625eeesm58156015e9.11.2025.04.10.08.17.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 08:17:24 -0700 (PDT)
Date: Thu, 10 Apr 2025 17:17:23 +0200
From: Petr Mladek <pmladek@suse.com>
To: Song Liu <song@kernel.org>, mark.rutland@arm.com
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-toolchains@vger.kernel.org, live-patching@vger.kernel.org,
	indu.bhagat@oracle.com, puranjay@kernel.org, wnliu@google.com,
	irogers@google.com, joe.lawrence@redhat.com, jpoimboe@kernel.org,
	peterz@infradead.org, roman.gushchin@linux.dev, rostedt@goodmis.org,
	will@kernel.org, kernel-team@meta.com
Subject: Re: [PATCH v3 0/2] arm64: livepatch: Enable livepatch without sframe
Message-ID: <Z_fhAyzPLNtPf5fG@pathway.suse.cz>
References: <20250320171559.3423224-1-song@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250320171559.3423224-1-song@kernel.org>

On Thu 2025-03-20 10:15:57, Song Liu wrote:
> There are recent efforts to enable livepatch for arm64, with sframe [1] or
> without sframe [2]. This set tries to enable livepatch without sframe. Some
> of the code, however, are from [1].
> 
> Although the sframe implementation is more promising in longer term, it
> suffers from the following issues:
> 
>   1. sframe is not yet supported in llvm;
>   2. There is still bug in binutil [3], so that we cannot yet use sframe
>      with gcc;
>   3. sframe unwinder hasn't been fully verified in the kernel.
> 
> On the other hand, arm64 processors have become more and more important in
> the data center world. Therefore, it is getting critical to support
> livepatching of arm64 kernels.
> 
> With recent change in arm64 unwinder [4], it is possible to reliably
> livepatch arm64 kernels without sframe. This is because we do not need
> arch_stack_walk_reliable() to get reliable stack trace in all scenarios.
> Instead, we only need arch_stack_walk_reliable() to detect when the
> stack trace is not reliable, then the livepatch logic can retry the patch
> transition at a later time.
> 
> Given the increasing need of livepatching, and relatively long time before
> sframe is fully ready (for both gcc and clang), we would like to enable
> livepatch without sframe.
> 
> Thanks!
> 
> [1] https://lore.kernel.org/live-patching/20250127213310.2496133-1-wnliu@google.com/
> [2] https://lore.kernel.org/live-patching/20250129232936.1795412-1-song@kernel.org/
> [3] https://sourceware.org/bugzilla/show_bug.cgi?id=32589
> [4] https://lore.kernel.org/linux-arm-kernel/20241017092538.1859841-1-mark.rutland@arm.com/
> 
> Changes v2 => v3:
> 1. Remove a redundant check for -ENOENT. (Josh Poimboeuf)
> 2. Add Tested-by and Acked-by on v1. (I forgot to add them in v2.)

The approach and both patches look reasonable:

Reviewed-by: Petr Mladek <pmladek@suse.com>

Is anyone, Arm people, Mark, against pushing this into linux-next,
please?

Best Regards,
Petr
