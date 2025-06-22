Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1779A847B
	for <linux-kernel@vger.kernel.org>; Sun, 22 Jun 2025 16:17:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750609054; cv=none; b=BdhKp0KUWiEFgRLozLNawL/yb2IKsXT2KSIb0GmlAlMDYB6k4uM/49y02QwZuIFz3B/yP2q+PVd4cyPjcktLtBVn5s0OijYZ0rl74DvWWXkuXJyt09cBgoc7w0/fSC5fCZU8/Ud9LePe0CsVeNrMmeMST3mTyXTbPsdRK9oVBgE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750609054; c=relaxed/simple;
	bh=1L6qBQgD/y4ibIobHS8NpMHQdcc6nBb85hb5XbuUsys=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gtbn8Ztr5q2WpkscWxLgd+J0kb/As2C6FKhqEpCzUY8C3x6ygRJfw5zYpIv7vdVpcOsDjk+RhYLc/SjswLSkpAkzoWs0drDLS6j1pDLPw+JLpv609cYdLMhVIEb7s1kLYnO2HC7vYvUw43/U+Vwb2zfsOsY2ewSiCDAgxvxAuHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wbinvd.org; spf=pass smtp.mailfrom=wbinvd.org; dkim=pass (2048-bit key) header.d=wbinvd.org header.i=@wbinvd.org header.b=f6GD1SxZ; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wbinvd.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wbinvd.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wbinvd.org header.i=@wbinvd.org header.b="f6GD1SxZ"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-b31f0ef5f7aso1582643a12.3
        for <linux-kernel@vger.kernel.org>; Sun, 22 Jun 2025 09:17:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=wbinvd.org; s=wbinvd; t=1750609052; x=1751213852; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=X1KTOCwfZS/ZHyt7Ze3Qe5bkO5xdz13ZUAb8TVvncXg=;
        b=f6GD1SxZp3av5YnBHZF7prcq02r1f6dCxQqjarH1u/c7e/FTki7HwsL3nv5e7z8we1
         V9l1hFE24jHdNRRtCCL+2CpClEeyurosRZy72DWED7njvCoggoT9jmgflOC6KG2p6HWu
         IvLbSz6Gj2jEy265lWhVn6uUrwwDp96xmIgo5A0lk8KvKIFvb38v/YXjb0GAZwzc0p6c
         8aq+XVy3zKTt3sRoxmvdR5k2jZw3tV037vAeZRJbMX6GARwqLaLunB1aLrhthqKlUi0r
         /41NOOg37c9Wc61XJg0MN04miZMVmK+q0eIbldLj5eHfGPR0SLRPCGBzE13ie4gqOiSV
         WqvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750609052; x=1751213852;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X1KTOCwfZS/ZHyt7Ze3Qe5bkO5xdz13ZUAb8TVvncXg=;
        b=Zje7z1RGExmID0kRFg+fb60/iw3u3oExHXsfAJS832RvONWV1osm6/akxZXC0u2G69
         MuMUTdNTuxCazSB6GH42SJcfM7L758BCp7+6CwLsO/TMsmG+A1zVq0T07P6YtJhbyiCg
         qMDDAE3xfm+GcNNYudAX29Gfv/MWHj2GH7xPcr9f39uAeC+tNRte+FqUFYs6tev9L//q
         rghw8Rk8swAZSWkPDYr6spMtbvEQl6YCZ7mjHpugnmCzhd/1mj+j+m8GvI4wbDgGWx2v
         kO29FCWAX/kKT49RFDXyFwlb7lk7zzV7kp9aHnwxRy9GfdDTPGTvQN0DuwLiv4QMmLo1
         FgCw==
X-Gm-Message-State: AOJu0YznMYpCuBmM2SNudnDcNGwBhHi0JuiY+GwgF921qnx+etRrfPab
	eMii8lU2uQ2f09Bf1f52ejAOP42S/iO/seppG0SfCS0OhoLg00zQipt52H3Vh1VhXT8=
X-Gm-Gg: ASbGncuA/CcqEBSUoaYYAKcQs5Kek7RBEOsKd+dZBSRSGF4trkwzSg/5CUy9r0FQ0AF
	U6FaxYsWvHZZNzBtNrOboPb4Hwx9zYe59XgWAjzRsvRZEMQK/UMURi/16b4uViI1X4wKICRSjsX
	IjNR/N1DOMrsEnhbIdoA4rVr/UrB2amn7+Eh80n5vMEEfROnE0kClo8L6JYZzWAXpKh28uZwvxV
	Qi+Do2rO+8kSn1W03BuWhBysgsPtaaL90wInypjTy+jRRJkueDRA1RlpaElLfxbKvrZwsn+bezG
	gh98zPYU++hHK1ib6H0kmahbdfdKaew0XRCwhcEHFZsHWWgxglHGCf926Clnpw6w+Qu7+nLVTCb
	c9de4gjfcuP6R/TWydbE4UNEuftylfbw=
X-Google-Smtp-Source: AGHT+IHdhHDRIEd0Nt4XwbI3FLnREoGKSsroilhDIrHQP79ov5brsx7izvecSS9tdxObpa22zoQtkw==
X-Received: by 2002:a17:902:fc45:b0:223:619e:71da with SMTP id d9443c01a7336-237d9b0a268mr165259865ad.49.1750609052396;
        Sun, 22 Jun 2025 09:17:32 -0700 (PDT)
Received: from mozart.vkv.me (192-184-162-253.fiber.dynamic.sonic.net. [192.184.162.253])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-237d86c47f2sm64200345ad.199.2025.06.22.09.17.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Jun 2025 09:17:31 -0700 (PDT)
Date: Sun, 22 Jun 2025 09:17:29 -0700
From: Calvin Owens <calvin@wbinvd.org>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: linux-kernel@vger.kernel.org, "Lai, Yi" <yi1.lai@linux.intel.com>,
	"Peter Zijlstra (Intel)" <peterz@infradead.org>, x86@kernel.org
Subject: Re: [tip: locking/urgent] futex: Allow to resize the private local
 hash
Message-ID: <aFgsmQQR6MVJNrAO@mozart.vkv.me>
References: <aFLuDoX9BGBUC3tW@mozart.vkv.me>
 <20250618170924.Z34OXf1E@linutronix.de>
 <aFMoDcWy-OzE3yoV@mozart.vkv.me>
 <aFNCHS-5LLywIAC7@mozart.vkv.me>
 <aFR8EuMg82aMCvjo@mozart.vkv.me>
 <20250620103110.xd5CEFDs@linutronix.de>
 <aFWuwdJUEUD8VcTJ@mozart.vkv.me>
 <aFYEpPIwhlL1WvR0@mozart.vkv.me>
 <aFZeHv72yPGovnRv@mozart.vkv.me>
 <20250621210157.J4QMzB0C@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250621210157.J4QMzB0C@linutronix.de>

On Saturday 06/21 at 23:01 +0200, Sebastian Andrzej Siewior wrote:
> On 2025-06-21 00:24:14 [-0700], Calvin Owens wrote:
> > 
> > I went back to the original GCC config, and set up yocto to log what it
> > was doing over /dev/kmsg so maybe we can isolate the trigger.
> > 
> > I got a novel oops this time:
> 
> I think I got it:
> 
> Could you please try this:

That did it!

Tested-By: Calvin Owens <calvin@wbinvd.org>

This was a fun little diversion, thanks :)

> diff --git a/include/linux/futex.h b/include/linux/futex.h
> index 005b040c4791b..b37193653e6b5 100644
> --- a/include/linux/futex.h
> +++ b/include/linux/futex.h
> @@ -89,6 +89,7 @@ void futex_hash_free(struct mm_struct *mm);
>  static inline void futex_mm_init(struct mm_struct *mm)
>  {
>  	RCU_INIT_POINTER(mm->futex_phash, NULL);
> +	mm->futex_phash_new = NULL;
>  	mutex_init(&mm->futex_hash_lock);
>  }
>  
> 
> Sebastian
