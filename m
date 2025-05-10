Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CE0D259C
	for <linux-kernel@vger.kernel.org>; Sat, 10 May 2025 10:24:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746872664; cv=none; b=LHuPzFGaE8TlhOUBdUSYlHHRCIicgVlWKF7Dmyx0E9CmggVNSVA50yjOhHD7qRuOBhqaQVnOnF3w2vcmA3b+3+wYxKrI6KJFBCrZzYNbWmy3QM1SeVKxsOZwj30T7J+RnAXHqWStKlOHoCEQ2nM+9t0Ns+pCDFOr5UsqlyLsIvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746872664; c=relaxed/simple;
	bh=XR2eoL21B7qgjqjwcqA53eAq02iWZTPQJFIvkizweE8=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Qkx74eiAI4gjcinWPFPbrXzlNaDoOGOaofU/noGOB9vmosxvLHm8fYbScwEe1YfSVra9exQeR7xFE1rMxn5Rv1vw3ZbXQWuJ/YDnH5rJnuxBPCPiqsU24hCVMKVQRHYb7Uxxwg2zUeVNrKx3oHRbbmAhk7qVPy125k8+0Ai3160=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YCX2IeS/; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YCX2IeS/"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-43d04dc73b7so30633525e9.3
        for <linux-kernel@vger.kernel.org>; Sat, 10 May 2025 03:24:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746872660; x=1747477460; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X54rWRNLW17tSBvsmAsUPfuEHJyuny1CVhaZpG1ZBXU=;
        b=YCX2IeS/NEOvTvdOvKB5DcuMlasDELhv5wcLUVa+6tzhIzVvdKcpdO6FWy0ywKFE2F
         jlPwrz6k3AaebT4a9BADNBgV8SZUqM6mjBCSDnj9pnK0oUmds/F5EKzPUT8L8/d0cz7I
         2s9Qmhm8iyPhhL+yFCgZ4i9rMlFQFj15W9pD71deZ28soksykJoFW92ys8HhtkDwpZ5H
         z2fGNfvDgvuMlMWCGd2n4aEU84/gt1ts6k7x2YggSXIZ+O+zp28VSvenD6NlNg036nmU
         tKIGTvaVU2CqWnmsr1yod//FnVTA/1J+lK8lg4xz5vzQDKBbNs2L1aK4tiU7ldOiHp5q
         T5gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746872660; x=1747477460;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=X54rWRNLW17tSBvsmAsUPfuEHJyuny1CVhaZpG1ZBXU=;
        b=dk2/Mxi583NVx/nKSvWRW8iuopQZNzUY37QXkqyKWc+NUmQ+8ZgHa4cFe8YemPfePy
         HVw1DJr+Tn3JrGLh3IU5rzfgHRPcbk5ZOZ+a2VDkKA9DGOgQoIWzcjB/bD+WxRNqfnnK
         Bj1SuQ7a+ZSQgtPYaFhII0bFHpDE8l51GfWXINTECbhk5q79h2Ywwi7dR6v/IigzQuVb
         aWnvgT/dUxkajzJuClAXa98L01UODGVqIeRGf0vj6o5JatyzEmj514LJkp9w8wdacST3
         KnSdpBw4bbPnhDOXAhxsOuwK20rfnGZ1j2SupCyiCJBz4qzjt3k8o4S5D8diteSa7tfp
         cbBw==
X-Forwarded-Encrypted: i=1; AJvYcCVIoHwgJidZfJ5ToF2+CCirEzJPuxx3q46CmbNgOLpE5Ox99RwyqJ4J9ktra0F8T7beCw31EbO7cRFFlpk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxSlpn6qNik7bothLygq7IQDCvLIZTTOU27tLDW9oYEqQo3NMw+
	UiJgzCszBZpGOznvyrjTWeHKFl3gydnfWvqXXTEuG4H068UeZvzn
X-Gm-Gg: ASbGncsADJZcpTaM8LWg+LbklC2VAhW8eBwdyrs03GqpZSN2lMV+oBqoeWVriq800Oy
	ffs/jNmwmfHjqDEb/OKaLbJhaluRQ14a9wzQlxUMXqfVIC2LTRpbm+x2WEphdGJt7RsV7OIhUll
	UdlPhjvEgtvKZ0N+oHMRBCClS276NX91jXU4Of+5KrqV8uMyfeFbAjNiB5USq6F6hUChFQg4RMR
	s8T0bDB2e5BAzIObBwoM8n7/eIsjXKPzvaiE+TBGpDP5HmPaiy/H9pZoOCHhkR6ww9LGh2XZv9p
	EZ8v+dagwSmCyWPL3Xeuuo2gWXrWnHMqib5kqTmBA0fRkTkA41J9f3x5Z5YM6qR8gftsJu2zV31
	9QpgmLxVvAvHDNw==
X-Google-Smtp-Source: AGHT+IHmKjjVR4g+SsPL5UrBT/AEPsB+lNkQ5qQbaRA/6ZQru5xn1OVVVzTDLMZwyDlYYW3az+Mxrg==
X-Received: by 2002:a05:600c:37c6:b0:43c:f629:66f3 with SMTP id 5b1f17b1804b1-442d6d517e2mr52696175e9.18.1746872660399;
        Sat, 10 May 2025 03:24:20 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442d67e138asm57265725e9.10.2025.05.10.03.24.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 May 2025 03:24:20 -0700 (PDT)
Date: Sat, 10 May 2025 11:24:19 +0100
From: David Laight <david.laight.linux@gmail.com>
To: WangYuli <wangyuli@uniontech.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, yuzhao@google.com, stevensd@chromium.org,
 kaleshsingh@google.com, zhanjun@uniontech.com, niecheng1@uniontech.com,
 guanwentao@uniontech.com, Matthew Wilcox <willy@infradead.org>
Subject: Re: [PATCH] mm: vmscan: Avoid signedness error for GCC 5.4
Message-ID: <20250510112419.749652a7@pumpkin>
In-Reply-To: <74D5BC8AD7E5511A+13242b55-13e5-463a-9422-f863d58b6af6@uniontech.com>
References: <85050791B887DC13+20250506160238.799984-1-wangyuli@uniontech.com>
	<20250506162438.91fffc7ef924d9653ed0f503@linux-foundation.org>
	<74D5BC8AD7E5511A+13242b55-13e5-463a-9422-f863d58b6af6@uniontech.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 7 May 2025 12:06:11 +0800
WangYuli <wangyuli@uniontech.com> wrote:

> Hi Andrew Morton,
> 
> On 2025/5/7 07:24, Andrew Morton wrote:
> > On Wed,  7 May 2025 00:02:38 +0800 WangYuli <wangyuli@uniontech.com> wrote:
> >
> > Make `tier' unsigned?  After all, negative tier numbers are nonsensical.  
> 
> That point is well taken.
> 
> However, I've noticed that variables named "tier" seem to be commonly 
> defined as int rather than unsigned int throughout the mm subsystem, and 
> perhaps even the wider kernel code.
> 
> I was wondering if changing just this one instance might feel a little 
> inconsistent?
> 
> Perhaps a possible approach for now could be to change this line to for 
> (i = tier % MAX_NR_TIERS; i <= min_t(int, tier, MAX_NR_TIERS - 1); i++) 
> {, which would allow us to keep the signed int type for the tier 
> variable itself.

Remember that min_t(int, a, b) is just min((int)a, (int)b) and you really
wouldn't put casts like that in code.
Even if a cast can't be avoided only one side would normally need it.

There really ought to be a 'duck shoot' against min_t().
I'm trying very hard to stop any more being added.

	David

> 
> Regarding the potential for a more comprehensive change in the future to 
> redefine all these "tier" variables and related ones as unsigned int, I 
> would be very grateful for your guidance on whether that's a direction 
> we should consider.
> 
> But actually, whether it's signed or not likely won't affect its normal 
> operation...
> 
> Thanks,
> 

