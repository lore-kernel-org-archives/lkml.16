Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29203824A3
	for <linux-kernel@vger.kernel.org>; Sat, 17 May 2025 17:24:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747502676; cv=none; b=rTIWsJSmptv3lJ7HlRCpPIkJ82TTGORTZ+9OpFTJKiHTnMCQkgK1eFO35+V8OdeL19vo5qWdWFeUmL685t1cPajGNrB57PPGi16aTA8XPYFhx+6ZIKa0jqrPh4DmS2ttUzun4uQK25dTNDQyMs7k3yW1KZ18rSws6gGI6cdQFp0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747502676; c=relaxed/simple;
	bh=z8LLO4CfbqUUPiKHIuvOW++gvxT4gE2SjOytd6qsgXE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k+duZ44BvEM4Zdme9YpcWO/bU2CXznngaTpCHzJnJAt1hl8VAskTFTzXdD+JH/LuKkwgFRj7Vm/Ruwyn1ViRt02H8k8/Lv5jm95fiWASvDJ60UlwYdwgfWhIeMdMQrLLWBUnw1eOlxplClxtDU0igpvQCB2xyB9ffwm14cz6xTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=tfgu619L; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="tfgu619L"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-231f61dc510so159615ad.0
        for <linux-kernel@vger.kernel.org>; Sat, 17 May 2025 10:24:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747502673; x=1748107473; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Qqy2Ok99tzdes/algCyy2EWTV7lGolaWpEaKtqiIGxA=;
        b=tfgu619LmwYy0OInMu/yyQECOORlNGH0wKs7pIdKVKhfN/63CKS9t3t8IsgdY3Ku51
         yG/j7lWqm5xZ19tcsd/nnDtISAxk28kNcDuHNrfWCCmfJ+McuwSjdscMu7rL4L6wHNGk
         b1olHK0fUogJDECRp1lG/NO8TM3hWDTRSh7mraYKMHX7L2Ap2jgkWO+eaN5jVaTgNsAq
         0m7onXpN7JFb16BhKu21A27mOG9wGGv3eyPCIW1Aa1IjLMduY1MSQTutjYmlQUXoRchf
         7K/V/zFcM8MG5nFjit824oHX395JKZq9pOm6rANvXPbPZ76p7z8/o4v3r1N+iSPeKQso
         P/aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747502673; x=1748107473;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qqy2Ok99tzdes/algCyy2EWTV7lGolaWpEaKtqiIGxA=;
        b=CI4ne9kfN73iMq1riycRNtsKyjxmSBsCWl60UXFtd8qsg6OX93nYitnPhJ51OPuuiZ
         vX4IerkWhzM3fjBU+m+seLhtorePQggjGaSg2ubYsXDZjDEqNrJvA2T8q/12bKHlG5ZN
         Ccw7Qdf+2GsaImMU0BknTUQCbKGSvQCIzjF3R9Lu0L6DHR7Z+Mu8dW3l5i9Y1/y1L6qA
         yeCXHhlpCZrTwcksDseL1Vt6TdtVryiagmlno6pyWwgAo3YWyt8KycKcOkmXElw6XcC2
         FNCwgnSawZmef4OhEAtmdYju06DRkI+fo9X+tB0y93010EQxN2PBaNT4WfX/4qSucUmY
         Ws6A==
X-Forwarded-Encrypted: i=1; AJvYcCXTNffCb8GGSq3Joul3nQjpdhyOtYujoSjRemkI6J0MsCmFYu7t0EPzqMZMVFll+EMlR1j1u+uElTjSmhY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3FKUaYFxdcOAWJPFnt1lvSTLiIFzi/hcBCqS2DhmpIwLRu/uB
	/5MxiTJVKN9gds+VmT+zW6AkIv3fWDygdHoiyfpGOKysZB6lpYuIXP3HFC6jWsY4Ig==
X-Gm-Gg: ASbGncvHFsMiDNlVJGbQkP4xprU1fnBKVl4+wiAf/YAOdZgmvnedp65DL28Y5ORYLxO
	giYT2c9/8tT7sKYOZDd/QDkdxP9hQVXS6sxKpCgjeKL/wH5SgUomhur3TTluZriRMJo4IqeNekB
	Hxhd9dhFPaBenm/7OPIfsQzzeoUmQKLro50N6DygBs+BRV1e+gOXB2WDfOjwuFJSXZMfsD3YPDn
	eerZ+ni0t3g/9Vky0yQJ3ya+8rNJAQs1sGj0OoVjFeSCjE5YBBC5URqV84JL1W9Lv6DejvZigYe
	jZqUSJtWHEFhy8aCbVBH09KjbBp6CVnEv0uL8H8quFBk9cUpXZDMGju9OEGmyAkpM6oRGkNV6JJ
	+xLkqEIeE
X-Google-Smtp-Source: AGHT+IF88TtQLXYrRSe8rM+mUjk82s80bsGLJXAGOTf4zdwlwYZrQ5hNgTUnkne4+aZPxIghO6XXPA==
X-Received: by 2002:a17:902:e94f:b0:216:48d4:b3a8 with SMTP id d9443c01a7336-231ffd31118mr2205705ad.16.1747502673015;
        Sat, 17 May 2025 10:24:33 -0700 (PDT)
Received: from google.com (3.32.125.34.bc.googleusercontent.com. [34.125.32.3])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-231d4adbef3sm32884585ad.61.2025.05.17.10.24.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 May 2025 10:24:32 -0700 (PDT)
Date: Sat, 17 May 2025 17:24:27 +0000
From: Carlos Llamas <cmllamas@google.com>
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: gregkh@linuxfoundation.org, arve@android.com, tkjos@android.com,
	maco@android.com, joel@joelfernandes.org, brauner@kernel.org,
	mllamas@google.com, surenb@google.com, linux-kernel@vger.kernel.org,
	Yeoreum Yun <yeoreun.yun@arm.com>, Yunseong Kim <ysk@kzalloc.com>
Subject: Re: [PATCH] driver/android/binderfs: fix race for binderfs' devices
 list
Message-ID: <aCjGSx2TvQdECBT9@google.com>
References: <20250513174719.3096063-1-yeoreum.yun@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250513174719.3096063-1-yeoreum.yun@arm.com>

On Tue, May 13, 2025 at 06:47:19PM +0100, Yeoreum Yun wrote:
> binderfs' devices list is global list and can be accesed by multi-thread
> while unmount binder device.
> Since there is no proper locking, it can meet datarace problem.
> for example it's one of case reported UAF while binderfs_evict_inode()
> removes binder device:
> 
> sudo ./stress-ng --binderfs 8 --binderfs-ops 10000 -t 15 \
>   --pathological --timestamp --tz --syslog --perf --no-rand-seed \
>   --times --metrics --klog-check --status 5 -x smi -v --interrupts --change-cpu

I just found this by chance (there is a typo on my email). Note this was
already fixed here:
https://lore.kernel.org/all/20250324132427.922495-1-dmantipov@yandex.ru/

Cheers,
Carlos Llamas
