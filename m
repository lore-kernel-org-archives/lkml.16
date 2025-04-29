Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96BE6173
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 14:30:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745937027; cv=none; b=Sb7qGEwSZ05mQjaXekTeAvJu8LzFBxIsYA8MRsY5lhj1xzuJGdiuZ/bSNfvspSzAgwRuDQFIkS70uT3d95nSASoQSLmLrjzYTVMeEYdID0K1AX5514AGpx0r/me7gPR6cccgGyDvuRjzxctLOOP0f0K2bbkxFenUb3BDqeTvzBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745937027; c=relaxed/simple;
	bh=PwkWG89OVdmgOD0X/eR71nSYmHKbUAZ8S+eVoI8A1sU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZJ0RUsbBauVvgkWz+18bEsB7sVvFW6N3W1iYBntk7bVNqmE2gl5T2Zl+x1bS5H9XBsG/FIIiUFGK4tIAug38MLKtwzV5xw4sN+hfyqMQvHuBrTJGiIVvvCWmlT8X9IaGPSVdobfTHi8jDTFJUoNBoPShcP/SmLPWRboByogyYik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=IL7Q6je4; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="IL7Q6je4"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2240aad70f2so151535ad.0
        for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 07:30:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745937025; x=1746541825; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=c76EfmJfxXVWbrHygpX0zdnOC4zliltMeV3MtoC1+NE=;
        b=IL7Q6je4U+R7nRQ7/KYbPB5EjT4WxrTIDQdofrDhjIwCg9oLmKGRQsxJ8/jOfXNaoE
         72IvGQJNznPSbKXYzF0Ex+WPQVTOihXli91m3Z8Vsf0aGo2dayhL2ONx+XIHzNwyfT9t
         IHzYCpP4N2cPcrzeZa+O2ScOSOgWAbELgtOgTtJj4mNp/l0Q7QAty2ALGdqE192DztXb
         /Moj8cq5oiSO1vtKe4cnT9jeRcJ7bCYf48ABK9HigkXFSidfRMykkiNvae4HfQ05JaND
         o7xcudIC3F+qnxuSxI9KUMmOvjYNs/tyn5yUz7y+AvhswAOH673RH0s4Gb8pyd4Fp0R2
         gy/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745937025; x=1746541825;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c76EfmJfxXVWbrHygpX0zdnOC4zliltMeV3MtoC1+NE=;
        b=pAHIF+HL8zPlJPaBG1vDvVKEsYo2SprgKiiUmog6yaL3BMKso7uykEcxCRwwiJC8C+
         KInouNFyn8mUj3TEZN4FqZgLzkBxU8WrVI5Ho0keMo7P2H4QL7wRchG9iuR+LKAPmo46
         w5HVW6YY6Tui+eqvec8RdTOLUZgazphcTp3QtMMUa+7YXpS4HeFpgvhOwgRwx7UpEE2k
         U5Sbqh2BMBhIP2oE5G4Tb7fghBscviSwhGHxAyfWpIuziaw9UwuApRakEsD+hy2js28f
         Gz8iOOpWZMfJ4IilGqusJ0r9Rg677frKzQMqUVxDx3lxoa7lNVtzlnXN9LI38+q74uJ/
         UwpQ==
X-Forwarded-Encrypted: i=1; AJvYcCV+F5X/SSqaWpDa/dBybPdYPCxKFtbCzg4iEYTgapPQ2LVUuf39u9UO4L8tXGoBYvqUWml7YcaT/U9UV7E=@vger.kernel.org
X-Gm-Message-State: AOJu0YyTGSm9SQNmFW7qcXDJjqPitqFwxZTg53P4Gdd8Nd1L/NIDM9E+
	iQ/KalnF15udk6iUA9bjTRHGqwZw21l84sZJLCEmsajnkEHULsypShKYCEG+sw==
X-Gm-Gg: ASbGncvfGOCLs2pzLNZ5/qLKiDtecLF9mcDO84+21Bka7ieYpd5khlxLARz7iP9R62T
	U+SoHlZVgMC94rAzZVbzAHBCKnUaniZvC+he/ihqctE17zNQi/6l+RmamihXxsxVUuXFhAg8Gpb
	JWRetVXdCJ4ZaPE7zprrzvn27w5Q3m2WxgUqur4UAVvEPgKbM694UvMifyxUYBfczlkSl7tVjJO
	81I2mRR5nAFMGtjD1BefP0WwzUBbjThwjmZOV2MnvDCALEXLy/Memh3v41tdfxKwq4YArfykBEh
	ukmymTQQP/EbzHpz1ymm4UF00+yr83WPPeKXqmgVkxyw519qKvbDghR8ulGi31/aB92vWhlTe71
	X
X-Google-Smtp-Source: AGHT+IGu1pxFUpQ02vuSQNPxJYLkA+b5ThbAqH4W6uNDAY/D4XsZ4SyEyNC7zGFNKPyYJ5AGB9L2zQ==
X-Received: by 2002:a17:902:fc8d:b0:215:86bf:7e46 with SMTP id d9443c01a7336-22de85f0755mr2856625ad.7.1745937024618;
        Tue, 29 Apr 2025 07:30:24 -0700 (PDT)
Received: from google.com (152.33.83.34.bc.googleusercontent.com. [34.83.33.152])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-309ef03ca86sm11267103a91.3.2025.04.29.07.30.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 07:30:24 -0700 (PDT)
Date: Tue, 29 Apr 2025 14:30:19 +0000
From: Carlos Llamas <cmllamas@google.com>
To: zhengyan <zhengyan@asrmicro.com>
Cc: gregkh@linuxfoundation.org, arve@android.com, tkjos@android.com,
	maco@android.com, joel@joelfernandes.org, brauner@kernel.org,
	surenb@google.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] binder: skip dead binder_proc during binder_open
Message-ID: <aBDieyvgjcNc61gy@google.com>
References: <20250429075030.305-1-zhengyan@asrmicro.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250429075030.305-1-zhengyan@asrmicro.com>

On Tue, Apr 29, 2025 at 07:50:30AM +0000, zhengyan wrote:
> During binder_open, the binder_proc list is travesed to check
> for the existing binder_proc instances. binder_proc objects
> are async released in a deferred work after binder_release,
> and may remain temporarily on the binder_procs list even after
> being marked as dead.
> 
> Without checking the flag, binder_open may face a crash as
> "Unable to handle kernel paging request at virtual address
> dead000000000140"
> 
> Signed-off-by: zhengyan <zhengyan@asrmicro.com>
> ---
>  drivers/android/binder.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/android/binder.c b/drivers/android/binder.c
> index 76052006bd87..43ab4350e589 100644
> --- a/drivers/android/binder.c
> +++ b/drivers/android/binder.c
> @@ -6041,6 +6041,8 @@ static int binder_open(struct inode *nodp, struct file *filp)
>  
>  	mutex_lock(&binder_procs_lock);
>  	hlist_for_each_entry(itr, &binder_procs, proc_node) {
> +		if (itr->is_dead)
> +			continue;
>  		if (itr->pid == proc->pid) {
>  			existing_pid = true;
>  			break;
> -- 
> 2.25.1

Can you please explain this scenario? My understanding is that dead
procs are removed from the binder_procs list (with appropriate locks)
before they are marked as ->is_dead. So how is this even possible?

--
Carlos Llamas
