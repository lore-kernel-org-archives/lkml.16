Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1CE81E3DDB
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 20:46:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746650782; cv=none; b=gfNnpblbv3fdnByFpgcH8g7/zADMBVKUlFUkcGPTywevqkM2i4fjuL8zP8kx9av5awjecdSQnBoFzgBa9pL/uZGBeiZqB+mh1nXlSx3YF1aCG4bO6VbhE/zJ9T1R1loX+h11z9L1DwbiSVmrANgM1yeuI0LxwmLyDT7rJJJ5yXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746650782; c=relaxed/simple;
	bh=NnM9hCAXsuMvfwyIug5ErVJSeiwd/zb63lOOKYS2CqE=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=quFRwa/HJ1OQh6A3xY2t8dX/UHkajP5Sk+frKGznqr/EtK9ySfsf0dw/Gp8ksTDVC0eOWyBOn3m/8LSJgr36cY+D8yUzK+PKQbbQe39pI2cAgldq5nTeZZARs3OzxUwxGGHDye8bmnmnVLJxvZMw03d29gH/gPpNTD0a+2eIeNg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l6F3xvKq; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l6F3xvKq"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-43edecbfb46so2594715e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 07 May 2025 13:46:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746650778; x=1747255578; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XXID5/+UEXqkdMjs781A6X+RM5i/wPq/zCGWpihYsXY=;
        b=l6F3xvKq5bSMhjruoQfSl7pn0ANmNZoL+rxpYR1ZQHcivpXnYg1TtXgyRqwwvnL0Yr
         njS7ECXA6HqVUjazFqWRK2EXTrTUoRpwyBJh12wC2UxMsdbMJhkyYsykAVZ96/zBj4/k
         ZDe5+LYYKReQgSe72YYrKITthmX+5VuJX5RwUK4cBiwCheQBvho2uwRK6VlmnlFOVLBf
         uALm8NIY93ZIUoWhKkhvcjjzvktNa6I3Xsiro7ViudQpZPyYaQobCaFQ3aZVzTmp2mk9
         fPwzq0eYbwBcMQVxLqp9bKnZlzTsSeNkZO0Pj4ZRYRMZdgFtKRxoyDO+oE0THa43Wia9
         T1nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746650778; x=1747255578;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XXID5/+UEXqkdMjs781A6X+RM5i/wPq/zCGWpihYsXY=;
        b=YCpDDl8sF928vVfvtaASFYJmqdF+7MUO2vquudjW+2Jsq7OKZB+UnwUIWDnp0aGUqN
         sJ1TzoHMypSxvKneXh/Nsex5Alh31ZhF6e/ujKBPxjO2gZGmrxsZD6kaUQePQChsy1Zl
         rQI9/ScCRCHtzmA7tz+qjR6gBEOAGig75uXiV/HY6TrlgymCGIeViTkdkH52JIL87To1
         D3DLJfkwlzWcDdMQ2V5/xN66B35vuBld4l/CqkzHWC/jCH5DWjG0bswEbPET6ryDDq9O
         BADQvu2gfsaQAT1plbKK1GnfOTPBJKgw0JBCZ0T/Wq8yKbxcrklUQE5FIz/ocsBVHfQm
         msUw==
X-Forwarded-Encrypted: i=1; AJvYcCWSfuqH7OwCkuKZ7o/Eu740TP9uuJG+6DGSAJD4xyWV2YSo3c8Ut/5zpQYSwrFM0/ai3xqLGy/HrKFqU2M=@vger.kernel.org
X-Gm-Message-State: AOJu0YxqQJGkp2pfDWJ4QVEIiuR6NkwGhXpkXaLCzpfeCRvWHllX9qR8
	/nKGe8Czadv76oa/7rsFiaiA1rv7yZU7Cub7FJ7Li9YzE/y7HEVM
X-Gm-Gg: ASbGncvGDRu3okVTwmZWeXAGMDMllCM6vtqTbyzMaeKCWOl9AQkLt7oQsdM3i/1sb4p
	vZSupd7z7+Jc7suAYBXhcTbaQJ0v4ldUyA48qMUxTfqHJGlN9Z/2fPxeUilg7h+tPhSgZTldBsv
	LKystV8Z10vFzRawBx3dYsrwn20tkQ73/jfQ53zcBrLWWu1Kp0FVMEzcQNqKuQ2NPyO3KdFraJh
	YLO4NjCKTkkGIUuu+YrJHiRr1PddTUvlcsyu/76P7CyeyDjSAfUJIaVsrlzqbXfc+zLXSlidAFx
	SjYm7zxRmnYfKQQqml8XhVLWHH2IKBlJBxppXTZ8VN8X4m3bO276eQ7390ui3bbxSZfkuEkLVbU
	WMZE=
X-Google-Smtp-Source: AGHT+IGz+dz6evHhAkTv1nqWjVBbzhxZR0I6BQYszfecXr647yKe0xXv2YHosqbi3Ue6FUFhZffQkg==
X-Received: by 2002:a05:600c:1c91:b0:43c:f332:703a with SMTP id 5b1f17b1804b1-441d44e088bmr47636325e9.31.1746650777906;
        Wed, 07 May 2025 13:46:17 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442cd33103dsm12361095e9.10.2025.05.07.13.46.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 13:46:17 -0700 (PDT)
Date: Wed, 7 May 2025 21:46:16 +0100
From: David Laight <david.laight.linux@gmail.com>
To: WangYuli <wangyuli@uniontech.com>
Cc: Matthew Wilcox <willy@infradead.org>, akpm@linux-foundation.org,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org, yuzhao@google.com,
 stevensd@chromium.org, kaleshsingh@google.com, zhanjun@uniontech.com,
 niecheng1@uniontech.com, guanwentao@uniontech.com
Subject: Re: [PATCH] mm: vmscan: Avoid signedness error for GCC 5.4
Message-ID: <20250507214616.4d91620e@pumpkin>
In-Reply-To: <FF9F758FB6DEBA6B+668772f9-2604-4035-bb04-b59eabf9bbd3@uniontech.com>
References: <85050791B887DC13+20250506160238.799984-1-wangyuli@uniontech.com>
	<aBo3W5HNMxLdtV2p@casper.infradead.org>
	<FF9F758FB6DEBA6B+668772f9-2604-4035-bb04-b59eabf9bbd3@uniontech.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 7 May 2025 10:55:31 +0800
WangYuli <wangyuli@uniontech.com> wrote:

> Hi Matthew Wilcox and Andrew Morton,
> 
> On 2025/5/7 00:22, Matthew Wilcox wrote:
> > 1. This has nothing to do with the compiler version; the type-checking
> > is built into min().  
> 
> Thank you for pointing that out! My previous statement was incorrect.
> 
> The error is actually from the __types_ok check within the 
> __careful_cmp_once macro failing, which triggered BUILD_BUG_ON.
> 
> But then, why do newer compilers compile this without error? Is it 
> perhaps because they consider 4U - 1 to be signed?

No, statically_true(tier >= 0) is true even though 'tier' is signed
because the compiler has inlined the function and followed the domain
of 'tier' from the assignments and loops.

	David
