Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94956223706
	for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 11:48:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748519293; cv=none; b=c4nVtr78bYk+d8adXLJeQUkM9Kx0jfNGgiVGy1Q6+0oUiuqwABHdAolMry0ztL1d+/pLcYx6cASkd7Qbz3STxXPHIpK/T1ErmWgnI62MV296CfQHvZWlZRxnIZOKQZ+EvEwo/S7WzodaF00w62aSVkUsupea+752Rko6mjIt2mk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748519293; c=relaxed/simple;
	bh=v3hY30nRmImnHwGi0UTTlXOgANRkQjAhzdIRchakAbY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=INL4Sl0bxYz0kXZJLJU5VzzRhA6ndCJY6OD1Nedmj6ckMdeXR8vBe1SryfUaj6eiU0CyisV4O+pvGNq3jw25dOvYkfQ6faMOQ1aMWuKrnwZytm5ChyQDgUtnkNzqI7WFOFEs+ZGLdbxNlE5NB2+z2sg3/RU2z0ayOY4PksDfs/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=G3++koYs; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="G3++koYs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748519290;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=S4FAuUtIwDWMT4NYmHX6VvziC3AQhYiVZgYgYuZl1oc=;
	b=G3++koYsgMv4aQRDVvKqfvipNt94aO57D3OLFmITCQ8g95I+f6VrCr2GeOVePSLdfl4VYM
	SO5t1PriXD1Zx/WJ3sgzBhtXvX6UvXaZFqlHoj6WcaeDhQVjr3x2+xMUNj4aNVZL8x4VY2
	nMIlk5/8JCtBffoFNLgNk5oo0vGgDHc=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-580-7LyVvO5uN4OT9bYfRFGIng-1; Thu, 29 May 2025 07:48:09 -0400
X-MC-Unique: 7LyVvO5uN4OT9bYfRFGIng-1
X-Mimecast-MFC-AGG-ID: 7LyVvO5uN4OT9bYfRFGIng_1748519289
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7cf6c53390eso81722885a.2
        for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 04:48:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748519289; x=1749124089;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S4FAuUtIwDWMT4NYmHX6VvziC3AQhYiVZgYgYuZl1oc=;
        b=w368gTlyLlALi7Q9enQHDU5JHOl0lUteXno6+hQT0ZtC8uGYHRUUHIN1YdO+Tg28Ik
         AKIH8NR+Lsc7NujQtMJV9lTstgGNBdROjf3XPFJrbyOANypDzYRMbATES/L2eYvrJ+CB
         0H92vPp1KEuufRhHXL8fVM6Nt5ovPJOdoy/ZkweYuZWgGVc+thEj0dbyIvMZZdPfoOap
         wykBX/B5CWMww1AL4cblr90C+S+6cC1lAvx5VGYaHZqzRzG6g9+/hLzA8fXgV2mWAKfl
         Gk8Mv/ybsTTJqpoZQMPYlEInD9aiAx74SHrxXGNL8sx547Fx+sDaDL8kx/DFoMpKfgiS
         IhqA==
X-Forwarded-Encrypted: i=1; AJvYcCVx1PMgJG9hTjlSTxoukLA6rFuqQFSUGqLd4rUQipIE1GLNgxeFXYk6LigNJvhx8uv8cbcVpLIIZlwjotM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxQrth2Oj32VSrahdo1bI42DF7rRSZdQ0wrPj6lqX3kF4sGvN5X
	GFpioKUpmg/+pA3DjPf5FbgYCfqhm15XafZbvhI+oVk8Wi6BaA3eTaL+f225i34cT5Y+dfyg/lp
	UYS/L/KjYn9oERpTqhH6XkuMhy0Ydi01QNssrOoe9QntV8FVoOEbkvqnrkMV4fF63mA==
X-Gm-Gg: ASbGncvZRkbBswpgyTaUx9Ck1HgfaD0FBeZIuhwICQ+L977gCdyVQeuYFVl7h5YvnWG
	63AeZ8q8W8gSPvThtRxsNRY+bdeSPEC3Po+7JJhEkA2xuzFYofObcVWMU128JVc2vD/2rk6K3Mz
	qVeW9QaHyjWtI9h8T4Oj1WdsKa683OEDgCBKSr7GVl8jFOjpkJIYJNlNdIHS3dOuAJlJWzTceXV
	/JdONA0cdU+4CCpgx49uZGdBK1f18Yo6anGBrg3BipSyN4sLdmnIFELVhhBCRS/0HWSxGuzXH6c
	B/3rPYI=
X-Received: by 2002:a05:620a:3723:b0:7ca:f40c:c1c6 with SMTP id af79cd13be357-7ceecbe0761mr3449461185a.44.1748519288736;
        Thu, 29 May 2025 04:48:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGGz1jWGH1Xl1+iHv8W7jy7T3u04fgOFgKY4M/nMJaXF++uobBUOQZcZvHceBp3q+sYifPF9g==
X-Received: by 2002:a05:620a:3723:b0:7ca:f40c:c1c6 with SMTP id af79cd13be357-7ceecbe0761mr3449457085a.44.1748519288338;
        Thu, 29 May 2025 04:48:08 -0700 (PDT)
Received: from thinkpad2024 ([71.217.74.78])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d09a10ed2asm83898485a.53.2025.05.29.04.48.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 May 2025 04:48:06 -0700 (PDT)
Date: Thu, 29 May 2025 07:48:05 -0400
From: "John B. Wyatt IV" <jwyatt@redhat.com>
To: Shinji Nomoto <fj5851bi@fujitsu.com>
Cc: Thomas Renninger <trenn@suse.com>, Shuah Khan <shuah@kernel.org>,
	John Kacur <jkacur@redhat.com>, linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] cpupower: Allow control of boost feature on non-x86
 based systems with boost support.
Message-ID: <aDhJdTWzDihchywc@thinkpad2024>
References: <20250522061122.2149188-1-fj5851bi@fujitsu.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250522061122.2149188-1-fj5851bi@fujitsu.com>

Hello Shinji, ty for your patch.

On Thu, May 22, 2025 at 03:10:57PM +0900, Shinji Nomoto wrote:
> The cpufreq subsystem has a generic sysfs interface for controlling boost
> (/sys/devices/system/cpu/cpufreq/boost).
> The sysfs interface can be used to enable boost control from the cpupower
> command on non-x86 platforms as well. So, allow boost controlling on
> non-x86 system if boost sysfs file exists.

Did you test this on non-x86 systems? If so, would you please provide
details on those architectures and systems?

-- 
Sincerely,
John Wyatt
Software Engineer, Core Kernel
Red Hat

