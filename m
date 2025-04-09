Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CFEC1D9A54
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 05:32:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744176742; cv=none; b=bKENkxtjQLLcO7YO83nFlgRYsHon8nW9AuebCTbdN1IueQp/+691ovkENOyJNDJm+1/hnMbYHek4WwQca/iTnKgq/QwIe0OOdAlP4r+4rOKW1kqonX6oSveQEw3FOAj9WljkOGQVM1VcthjCRkVMClz/jPTp+Bx8oMroxbwVrMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744176742; c=relaxed/simple;
	bh=2iFpcjMuEBHc6EEiX/UltOrfSiESXXtv+Vrk/DWljdE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oKxDXtDx6Ddj8ILuKsXb1KPIuC71O5pgHF8trLz7G73eLJ3Q5SDmmdp0Yr3vrTVhX7Q5hVFxPzd87E0XjWxR2u3o0QRjebeYM5Vk6MjV1rcZtHcF/lTl18jQzHmCmEU2PtZFh/7xbpfjAjl7l58fEoA/xUyI59BfJ3BW/tlKyMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=dOBasmdP; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="dOBasmdP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744176739;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=QqN9Zfb7zsWPAApJSbDsVLc/6LelOdZ+0v2KH6pBb6E=;
	b=dOBasmdPtWaMWnZymwVcIpeTuuCeu8Gch8Hfm7yAR7DMN+Up2g3f8kF8SaUHfxgcVz2Lv1
	VEzHar68Gc6day415an3iuamKW/8P3lbnjWzktV4GrPQ7oXT/5mcQp9yQTQ9QcI3mlC+RI
	TxXoChoRaKw1rFNOcFFpIGdWiyIlvN8=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-121-MxEwS-PXPmyEMMMfmqzFhw-1; Wed, 09 Apr 2025 01:32:15 -0400
X-MC-Unique: MxEwS-PXPmyEMMMfmqzFhw-1
X-Mimecast-MFC-AGG-ID: MxEwS-PXPmyEMMMfmqzFhw_1744176734
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-43cec217977so40249335e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 22:32:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744176734; x=1744781534;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QqN9Zfb7zsWPAApJSbDsVLc/6LelOdZ+0v2KH6pBb6E=;
        b=H1Ry5HErQCdrDRXlfs077NyRopUQGwURRDbCsXbE17Yfdao7LmM4GFtTI+w2ixT3/m
         f6qUAQJMg32HwAacv6yWWwm6TYei1cuLVzENNlGcQTKPbEtK/boZa5fUVsGPsuLc0YXx
         Gemz8v9/FA3GU1cug6gNR5wO7czGnpnCD9OCXM4+DPnOsg8/B7fxOlxmWPkPnMRYlWDe
         PBO9NwjvDrIGs38ZW/34Ub3QdiDoJo4MkuwKkbHv++DsDXp1tZ+438cn9llYfX45GnVY
         DtsVKbVU66FAlQCkOOmR/Ti4wXfYpjcWuEFvIwEhKsN9NFWs9kOJA2XeNgOXfBIaZR/F
         16PQ==
X-Forwarded-Encrypted: i=1; AJvYcCXCwY2Os3+rVkcITX0CmYICohWKUq15J60D9W6mrojqYGWxf8dY7j4sNfZlSKYPAyIT8ZywgrLYdlDFw3Q=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8XvPjTvVKkakyQS+YnhjYSsTteYnXCOB5oT9u92xx8dfiazdE
	oNuGNRF3ZkrytrKJj13Qt1A5eX46w234UHHKw9tu8M+QzVJnSIg00lLGJWxuw2iRWetnb/fNEGt
	knSGfpwUNtTet8RXDZFOAPIRUcW8/ky9/0QgvryGI0gz11+77tkSpTI2tDA5k9Q==
X-Gm-Gg: ASbGncsdTDnxnBMK9BaYyQ/YAhV8VnUHEqlKE3HRSRYc+zn5TLU1UsabIsE296+i/wU
	e0wcOPF0r8AyTivrRRHbyjx8He3uwo6qPjtTspYIjqI5HfaFbmDoDB4Gy+FPj0WQSOFIljAxfrw
	rHMwxPfAMU38pPIOaov+vVceb1mmx6OZNToav5vBQEXZzusiZ1jQpgV9p9JJEbg1FpyMdsqKBKe
	QJUJboJb3oGIRMJoEGDf9UOhQAS8QUXXZ87CTXajQT8IaqQD8sICBKZ5YMlBqISI8y7NclTXrc0
	M6WDyJQM3nT3K2GL/qisNkIWU20riCT1oNFc9rkpf7+dxVo=
X-Received: by 2002:a05:6000:4023:b0:38f:4d40:358 with SMTP id ffacd0b85a97d-39d88525ebcmr801332f8f.9.1744176734497;
        Tue, 08 Apr 2025 22:32:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFHFPdvMlkiXcaHT/+np9HKiWfjLVNoIGsBWaLbzFDwMgEMDrzSpCUsSKwEhafjbiP42cKtig==
X-Received: by 2002:a05:6000:4023:b0:38f:4d40:358 with SMTP id ffacd0b85a97d-39d88525ebcmr801314f8f.9.1744176734140;
        Tue, 08 Apr 2025 22:32:14 -0700 (PDT)
Received: from jlelli-thinkpadt14gen4.remote.csb ([176.206.22.101])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39d893775b9sm579664f8f.35.2025.04.08.22.32.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 22:32:13 -0700 (PDT)
Date: Wed, 9 Apr 2025 07:32:11 +0200
From: Juri Lelli <juri.lelli@redhat.com>
To: Harshit Agarwal <harshit@nutanix.com>
Cc: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH v3] sched/deadline: Fix race in push_dl_task
Message-ID: <Z_YGW8IrRQfhfdM8@jlelli-thinkpadt14gen4.remote.csb>
References: <20250408045021.3283624-1-harshit@nutanix.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250408045021.3283624-1-harshit@nutanix.com>

Hello,

On 08/04/25 04:50, Harshit Agarwal wrote:
> When a CPU chooses to call push_dl_task and picks a task to push to
> another CPU's runqueue then it will call find_lock_later_rq method
> which would take a double lock on both CPUs' runqueues. If one of the
> locks aren't readily available, it may lead to dropping the current
> runqueue lock and reacquiring both the locks at once. During this window
> it is possible that the task is already migrated and is running on some
> other CPU. These cases are already handled. However, if the task is
> migrated and has already been executed and another CPU is now trying to
> wake it up (ttwu) such that it is queued again on the runqeue
> (on_rq is 1) and also if the task was run by the same CPU, then the
> current checks will pass even though the task was migrated out and is no
> longer in the pushable tasks list.
> Please go through the original rt change for more details on the issue.
> 
> To fix this, after the lock is obtained inside the find_lock_later_rq,
> it ensures that the task is still at the head of pushable tasks list.
> Also removed some checks that are no longer needed with the addition of
> this new check.
> However, the new check of pushable tasks list only applies when
> find_lock_later_rq is called by push_dl_task. For the other caller i.e.
> dl_task_offline_migration, existing checks are used.
> 
> Signed-off-by: Harshit Agarwal <harshit@nutanix.com>
> Cc: stable@vger.kernel.org
> ---

The new version looks good to me.

Some final minor touches to changelog/comment might still be required,
but Peter maybe you can do it if/when picking up the change?

Anyway,

Acked-by: Juri Lelli <juri.lelli@redhat.com>

Thanks!
Juri

