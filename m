Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A336628B509
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 14:19:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750429169; cv=none; b=aFMgfy0r/UGs/wjIC5fVkyxR58Ug6URG/VRf9tQZunr3WxLKRluH/31fF7iR5QARNECjJxXKm0GSeKhjgnMUv0L4BAztq7Ng0y7nO9+73vvCYoOJjqMfWUCVlS6X5AU4fVWXJnuXGCM0BEIcpKUqoVWBGCPlfTKVS6IddLhlk1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750429169; c=relaxed/simple;
	bh=8CJoLCJXCOyIpvTywBbT8XlN5Ques6WNn5S/J0XqyFw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c0nuYFnFDilLQRnP+RlGk9PwnE1BChE2hgTQWBIUbtcfCM19fqKCnXZEWHin1t2LumgXKhJXpP4mkxlFO0safnanRxfSq6bpq/gc9c/3SizJsGfeTg6G2ZVebZJrNnMFBGArZm55QC42hMhmo4RzKkrgAYIhogJ7QRk65PTJiK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=dX2IpB4n; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="dX2IpB4n"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3a6cd1a6fecso1545866f8f.3
        for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 07:19:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1750429166; x=1751033966; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=QcIANUFmg72DF9cGoDfdw8AIN97v6nG8QwHQh2/qxAI=;
        b=dX2IpB4nU5vfcxS3NxuIj1qd12878v4R3lOShj1Zt+nw5O4WIUHnRZcUk35BDG1gzq
         p7i19ZfjD2VAYgY/AMwMZxgO2/AN4Tzw+YYqXMXWwe7UsrkuDLjc7f+T9RxlYeLnV7v2
         dLy5KXPb2dEHDeavvW5NwieqdZl5dHSzDrAtEmvkamlarFMyLAzjVldZmvD2zYWQEU/F
         SrFO1d0APn8/4Nuj07dtGebEPuVHK2wIHd9CLX98RG+kVvq95HOIvz9uxk8shjZ0BInq
         MhpwCZsYpmxTKZLQvarZYmq6g8kWHtX6d2ibs1xwXLNycoJKRKN1OlK8HdIeisg8pe8e
         xJIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750429166; x=1751033966;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QcIANUFmg72DF9cGoDfdw8AIN97v6nG8QwHQh2/qxAI=;
        b=kGMAA2YbUfSqucyYhhbT6y/S0t0m+JQcPFvz7IpMjRtsEI4ir2+EV+P8cPZLmd+NQf
         TkucUTQs5DSbiebt4eTsfuThcwcX4RaD/1K4QOrIPnKomafR5D+zLncYXgTJuN04pU31
         Gj5qiDD0Ve57oDJFFKSUt0OZWQPDGRyDl9e2oho0p4XU5tM/EsGII4mDu6ZJwKfGMr5J
         BXA1lpefIUvrqlJak3a1MGJpb1N1iI1yqKLYRY+t/wpAuexnXPci+BhMgRXVtrS9X8BS
         vuUMRIhn/NSLvtOdnoHaHjazb/larQaNm7UFQLXDwBpPjKjIBSJjBo1QbS7XxwYJh1BX
         bDwA==
X-Forwarded-Encrypted: i=1; AJvYcCVaj3F61f/LPJFcN8lWigcUqUcAGAOLa3ERIIH7XILlGt3kPXYBcJ6HvuyrQRkZ+ZvfpUHM+RBHAYchjCQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzVcndVTtQttMXpUHZY/RFq9RaeDqKYtgSPwOhbnXxJxsCp1qDs
	mLGyArRIPH+85/Pw0n3dh9XeMY7dYPHJt+Fw9AoJHApT87yJufHbGqBV6FlnCXHr6j8=
X-Gm-Gg: ASbGnctXxaixD8zR3IDTc8wzo2sEx1dDe/tsvtylqWqRFphcOUNlugiCHBlkcJAFbH6
	tVY0XBDZCGaxh+OUPxYDgSlU9C19dJRuypjMu0M4IlPodnyRxBiFKKslmyJZbBcCnbCn2Jbe/gA
	UuAisYBx7SIxwBRdtQVmLiGMjqaW8X9vWflzPNs83s2xVxFXfyHWelUs1MDPmRplgAlVbWg2jUe
	M110OCWaMiK4HQTtnVCpUClKp+++TmmCaYzS4UPUy/3e5SQkzAHxh2DbH1iVhtHpGljOeBTPfNA
	Ak9f9SblWCT5xwu2hSs41MCzaDQU3bICbBD3KmQ18Y0kHYUO2tLK0eej/Bn82P6N
X-Google-Smtp-Source: AGHT+IGDkqKNq8v3dNn853DIS3meR4JeL+7ByQQNXyvQzrzptSdjweoDZXbvKhkzyKuwG+1w5IP36w==
X-Received: by 2002:a05:6000:25ca:b0:3a4:e65d:5d8c with SMTP id ffacd0b85a97d-3a6d130337bmr2943700f8f.40.1750429165692;
        Fri, 20 Jun 2025 07:19:25 -0700 (PDT)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7490a621cd4sm2212308b3a.105.2025.06.20.07.19.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jun 2025 07:19:25 -0700 (PDT)
Date: Fri, 20 Jun 2025 16:19:13 +0200
From: Petr Mladek <pmladek@suse.com>
To: Feng Tang <feng.tang@linux.alibaba.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Lance Yang <lance.yang@linux.dev>, Jonathan Corbet <corbet@lwn.net>,
	linux-kernel@vger.kernel.org, paulmck@kernel.org,
	john.ogness@linutronix.de
Subject: Re: [PATCH V2 1/5] panic: clean up code for console replay
Message-ID: <aFVt4XBFArtFvPRh@pathway.suse.cz>
References: <20250616010840.38258-1-feng.tang@linux.alibaba.com>
 <20250616010840.38258-2-feng.tang@linux.alibaba.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250616010840.38258-2-feng.tang@linux.alibaba.com>

On Mon 2025-06-16 09:08:36, Feng Tang wrote:
> Currently the panic_print_sys_info() was called twice with different
> parameters to handle console replay case, which is kind of confusing.
> 
> Add panic_console_replay() explicitly to make the code straightforward.
> 
> Suggested-by: Petr Mladek <pmladek@suse.com>
> Signed-off-by: Feng Tang <feng.tang@linux.alibaba.com>

Looks good to me:

Reviewed-by: Petr Mladek <pmladek@suse.com>

Best Regards,
Petr
