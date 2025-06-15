Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A439C26AD0
	for <linux-kernel@vger.kernel.org>; Sun, 15 Jun 2025 08:11:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749975107; cv=none; b=U4Dzp0BkNRRJ33imGZuhYfDVD89j/GIKvKPRXPPmg28Z172PApy5r7fkAyIOHBJbecNzfA+4qHML4od/9xkj7pLLEvdfrdztfQcDx0fdCB61+1/97cj8gtb4UwtibaCGp1m6CqdklBRbqxm8nd7cG6OYK4aRyJ4LaEFAFZBGe50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749975107; c=relaxed/simple;
	bh=9CazTd5wS+HK0yBoeUMtHxJDFiS9hWu7YYvjO0MyWcM=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=aBBEXALnSVpfPzzowQaybxGo2Ryo/+drhmqzccgPKw0JiiQ/Jxt/p+iLe4KLtvxHlUfCuRbL031MsBsXrwDFeyTFzwO68bojJv53HAxbeYSgSVCTUztpuSKMu1JghfgS+3ky6scbaxJHjtStsuwJ9KdUkg/RsLQfBw/qHXc0fbc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NyeDI4Ph; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NyeDI4Ph"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3a57ae5cb17so179033f8f.0
        for <linux-kernel@vger.kernel.org>; Sun, 15 Jun 2025 01:11:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749975104; x=1750579904; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xQC1l4hed+jDjvcuzyYn26zmXocSEaoHbFMpdpPVTZE=;
        b=NyeDI4PhnkgkmWA7dEvZDKKmo+hO6FLZRBhHDVNwN/GiJknYTaUhGis9oer8nbRiaN
         EHsW4pZ6HGB43nO4yYJvzF2KpurUMkj6LucJLfXbvGMEslEDtYJuQ7llUIF25F4zdF2Y
         qCX+NJZzsZikq/2kVdGlb1QleNewFjo3aHPaNEk+jehXULZ7CZp/5b7palhd5V8cJ4XK
         Red/VMi+xm/NjqqpJRxdyFmBdak/T7BxdUCQXPGs5Uv14ey+1ydKTeHz/s1dV6WAuxfV
         w6o492922D5XcF+KfjKMlz4miY95BQ4WZfpFmW9+rNAaMom2BoO0exDSt0wqMJ8E1PKz
         zFNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749975104; x=1750579904;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xQC1l4hed+jDjvcuzyYn26zmXocSEaoHbFMpdpPVTZE=;
        b=lgJP6B+tfhuxVU+2cUuT+fJg51ouvHPVkmelspGEeJp3xk6MVGjQlpPmyNrcapc3xY
         HbwQUGhuDhg2/nTb9g52+NZ5U8WJnSoto/oDwbEiTlqutfJp2iMdXy0qZUiP9eYU67i7
         a8EG6a30877bLfClOcVlQ/44src0YJ4JALBCftJSwWzyhRFBKH0WGxgWQBSh1595RGTZ
         pfu7hjg6fh7zrr0jnD+ZiAnG+q8vdGJhi2Xph0aBInq7OPaUrPIpOME6dPAy91QY8pfP
         pDbulutyonvlK3DnVKQ4k79bUh2iqWNPmpJ7QLKiuWOPG14vATwoJAt5CEYYb53soOSD
         Kt6A==
X-Forwarded-Encrypted: i=1; AJvYcCW4SNBl4I+dgyTdPCelWbE1g7wanIkvM6wj8UKMK6NIF/QoEE7Fw+zNFtN667tbEpsFzy4AR8EKXf9z/VI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwbtRxGUsjOlRajExTswYJPG9Gaz+yDj/psxMVpqPawDwvswA1b
	jMzmGbsfzomxRnHfwyQQZ1PYpsIZC2YXbmVJNhb7u38dk4iDBUPp77we
X-Gm-Gg: ASbGncuwkh/KXmm1SEpSSbofpnI0ue51RcCfCyn3TT1kdqt79bIUcHgPVM0+v5FttP5
	dPYTz6ojtURciSpdYNhb/dEmq6sPM9AZDTp9VXp1XNjwauwkpetHVTbhUh4LNPgJoO+nKPF7LLs
	IBYO1x6oqLrodVrLvBdXzif7OfStFy2i4dgc0ZflxfDw5O+7hHKJ72IIngznawHPT/NV+ObZdvr
	PTiuzM03Ij5XNdZA3tc51MIsjC4kM63PDnBlpgfs50VyNzhqcU4ShkTmAuegiIc4lnHUvqhFbqK
	m10DNWHygmiNIShkSI0cEuU+jz9HIHAwLWGcctJLkn3CuDFDiQ3H578RhTiqr9CWxVHq/DCFnE5
	i8y4tfUDh7Drr/TOHVL8mqBUeIwcb9YbwY60=
X-Google-Smtp-Source: AGHT+IEt4MLx5qWRx8zxKdVal8i4gp60/oEWaofVvMwCZilpflG+8Y3YcJjDCPeWX2cDAdi54HxY8A==
X-Received: by 2002:a05:6000:188b:b0:3a4:ef0d:e614 with SMTP id ffacd0b85a97d-3a572e79d24mr4433375f8f.33.1749975103785;
        Sun, 15 Jun 2025 01:11:43 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568a72cd3sm7231201f8f.32.2025.06.15.01.11.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Jun 2025 01:11:43 -0700 (PDT)
Date: Sun, 15 Jun 2025 09:11:42 +0100
From: David Laight <david.laight.linux@gmail.com>
To: kernel test robot <lkp@intel.com>
Cc: Ilya Leoshkevich <iii@linux.ibm.com>, oe-kbuild-all@lists.linux.dev,
 linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 Linux Memory Management List <linux-mm@kvack.org>, Alexander Potapenko
 <glider@google.com>
Subject: Re: mm/kmsan/hooks.c:269:14: sparse: sparse: cast removes address
 space '__user' of expression
Message-ID: <20250615091142.3c9520d9@pumpkin>
In-Reply-To: <202506131242.qB8fUSlP-lkp@intel.com>
References: <202506131242.qB8fUSlP-lkp@intel.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 13 Jun 2025 12:28:55 +0800

Not directly related but...

....
> 75cf0290271bf6 Alexander Potapenko 2022-09-15  267  	ua_flags = user_access_save();
> f926e9326f3a79 Ilya Leoshkevich    2024-06-21  268  	if (!IS_ENABLED(CONFIG_ARCH_HAS_NON_OVERLAPPING_ADDRESS_SPACE) ||
> f926e9326f3a79 Ilya Leoshkevich    2024-06-21 @269  	    (u64)to < TASK_SIZE) {
> 75cf0290271bf6 Alexander Potapenko 2022-09-15  270  		/* This is a user memory access, check it. */
> 75cf0290271bf6 Alexander Potapenko 2022-09-15  271  		kmsan_internal_check_memory((void *)from, to_copy - left, to,
> 75cf0290271bf6 Alexander Potapenko 2022-09-15  272  					    REASON_COPY_TO_USER);
> 75cf0290271bf6 Alexander Potapenko 2022-09-15  273  	} else {
> 75cf0290271bf6 Alexander Potapenko 2022-09-15  274  		/* Otherwise this is a kernel memory access. This happens when a
> 75cf0290271bf6 Alexander Potapenko 2022-09-15  275  		 * compat syscall passes an argument allocated on the kernel
> 75cf0290271bf6 Alexander Potapenko 2022-09-15  276  		 * stack to a real syscall.
> 75cf0290271bf6 Alexander Potapenko 2022-09-15  277  		 * Don't check anything, just copy the shadow of the copied
> 75cf0290271bf6 Alexander Potapenko 2022-09-15  278  		 * bytes.
> 75cf0290271bf6 Alexander Potapenko 2022-09-15  279  		 */

Isn't that comment just wrong?
Compat syscalls just don't do that any more.
They might have done it in the past before setfs(KERNEL_DS) got nuked.
So the 'else' clause can never happen and the test nuked.

So anything here is always 'user' (or will have failed access_ok()).
I think that also means the test can be done before the copy_to_user() itself
since, contrary to the earlier comment (trimmed) all of the kernel memory
that might be copied needs to have valid data.

(Unlike copy_from_user() when only the written part need to be marked
as containing valid data.)

	David

> 75cf0290271bf6 Alexander Potapenko 2022-09-15  280  		kmsan_internal_memmove_metadata((void *)to, (void *)from,
> 75cf0290271bf6 Alexander Potapenko 2022-09-15  281  						to_copy - left);
> 75cf0290271bf6 Alexander Potapenko 2022-09-15  282  	}
> 75cf0290271bf6 Alexander Potapenko 2022-09-15  283  	user_access_restore(ua_flags);
> 75cf0290271bf6 Alexander Potapenko 2022-09-15  284  }
> 75cf0290271bf6 Alexander Potapenko 2022-09-15  285  EXPORT_SYMBOL(kmsan_copy_to_user);
> 75cf0290271bf6 Alexander Potapenko 2022-09-15  286  
> 
> :::::: The code at line 269 was first introduced by commit
> :::::: f926e9326f3a79f7e01ac790e2361f44d8ca8320 kmsan: fix kmsan_copy_to_user() on arches with overlapping address spaces
> 
> :::::: TO: Ilya Leoshkevich <iii@linux.ibm.com>
> :::::: CC: Andrew Morton <akpm@linux-foundation.org>
> 

