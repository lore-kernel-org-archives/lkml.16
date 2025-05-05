Received: from mail-ua1-f98.google.com (mail-ua1-f98.google.com [209.85.222.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B207B2D47B4
	for <linux-kernel@vger.kernel.org>; Mon,  5 May 2025 22:53:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746485625; cv=none; b=BH3eqA5ZshA6YW+WCLQuoY3iuERa8cd7BUkTk4FZBg7VOyZq3r0BX0UXCFV5R3HAQK6u6W4T7gvRnjAnWU6b7fJP2A7J+K2gFhV+PzTwW03zec3oE2dI/+Kdj85z/CmR49oJ1hVRVFl/9aTAnkyKgFRtv4ndel9M6fWXrU42k8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746485625; c=relaxed/simple;
	bh=oWRWu4J3rOlzeZEZE09NG8G8JVW/wVAOK1aQt+vNBTk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rbP/hf0jCI/5X9P4P+9v82w74PY5yqEv3gXdpGpZGvCzCjyL6jxVZv5OXq02zVB7Ph6nLtM38iN0XRszQQGGLZgZpQ9eylHibKPJPPPwhLAXDIzswlciVl8ARsdZCbJyu5WZEXePJQ0PgTr4jIeSN3qM03/QmLEn1A/Y1Hq4YJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com; spf=fail smtp.mailfrom=purestorage.com; dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b=bGsJ3rqe; arc=none smtp.client-ip=209.85.222.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b="bGsJ3rqe"
Received: by mail-ua1-f98.google.com with SMTP id a1e0cc1a2514c-86c29c0acdfso1289417241.3
        for <linux-kernel@vger.kernel.org>; Mon, 05 May 2025 15:53:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1746485621; x=1747090421; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=eiXzmkb8vltyH6u1BZ9L/v+dxL0ZMqO2O1cKAYZNXPs=;
        b=bGsJ3rqe20V11uU6uC/iGYzpZKh3HRfig0sea/5RoX8n5OVPtHegjGPFD4xu6w4ph8
         CNqcZh5i/ZG6nnbU74h0d86JJJAmEGTgCmuANFaZEU64iDNBUp7Gi8C84KgQUR9AHgY3
         vp96z2XM4EPNNvQEGC2Mj6wXlWeNlEFvp9OM5TWArIJL/zhen0wOwN2S6VDlEy/XZHRS
         S6FmSFPdFJbPxZVBSH96YZY7z3SJx/dd2BC1lLSVXhXKRBNlXorGLuWxJuo6D1J3C3a9
         F4lYi/djUnNL72zS0b17PZh6RG/2Xj0X3UoG7228wFpagW8Q8kLQW4hAC+p2QB2R4lRP
         XCZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746485621; x=1747090421;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eiXzmkb8vltyH6u1BZ9L/v+dxL0ZMqO2O1cKAYZNXPs=;
        b=Ej1SUbmKBAnrRYGY5Pk3fJRnha/0wliZXeBq6dtTF+LQZ9nQJBVyoc6gmb0mo3WPir
         TCw/qW9BMdZCxIRLgLZfnyPjMMkeQZKZUU3uuTOeGBI8atPiUsqP9p8EW1WxnjUsPkRC
         T/Ob6DU/meZLd2hqlIJC3a+dx5OD1SuqLVc/yc0i1YN76rNuRCTyKBGDjirKaD05RaZl
         gOBO7Yu8YlvcgfR8l72gYLpLRivGpOjCPCHhPWTLuC7KEI8Bc/4BsfsKcfy09FrrIbp7
         h+QnpKI6fE8e4E+6yaCOUslcG/XoJhG2MwUmYncleDxG6ER8qt17IcbIjRj4Aa0Qo5ui
         2CPg==
X-Forwarded-Encrypted: i=1; AJvYcCUreJ9SE1IAw+LqU0ACeT6ZzePR9YWbkAq+Koelk68KadLO+8QYcnAnODRAi8+qLvV4CaAUKYFFMk6Tkcw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwmqX3bsCo7+6bF8yhpaienjbevNxgyeFTsJQ4KohQGk76yP95D
	S0UHOJ4FFpHqMxYClGqc5jF0GDXZITGsAhYMMkwOQbeSw55uPBjknxOEsggkb7rL6tb4MX56eSa
	yJPQ3HYWzB/LGXB87zquFqPppJntpY+1U6SuHjPX21bz5Ckam
X-Gm-Gg: ASbGncsIYq8rOuyCG0XMwobh18XX+SMMl3bwqFX0iMsfiMKsKC0gNpOAqR5wyEBCOV3
	RTWD6KUTxKKV+XPuXrOj8NZpXMz39HbmiJvnQEKECbZhjq4I8OuKDbfxu+BcC2Q4Xc+jEI4mFuG
	dJ7t1hu4kf7HGF1owyyS6hantsIHdr8JN+BhmrV480uJZMwq5tuKT7ammrDyy/mZhVdobxYmOnM
	KhXhdsvwobcpJCTSiRopMekP6bfUPUxgAujNpWR8xj4RNkoZMxb64rcbbkKC96upBUm1TJtff2u
	FUm/2brz6XXBxPT0i3/6HPuLjRyF8Uo=
X-Google-Smtp-Source: AGHT+IGuGPu+zNWnKMENBRH1cGq6mvAP2tt0vUVDuY0s1KGIy/+MxU+EJ2xkScan9kLdomgicesqCN/5M43b
X-Received: by 2002:a05:6102:5681:b0:4da:e631:a472 with SMTP id ada2fe7eead31-4dafb690042mr8174826137.20.1746485621498;
        Mon, 05 May 2025 15:53:41 -0700 (PDT)
Received: from c7-smtp-2023.dev.purestorage.com ([2620:125:9017:12:36:3:5:0])
        by smtp-relay.gmail.com with ESMTPS id a1e0cc1a2514c-8780afe9e7esm785191241.3.2025.05.05.15.53.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 May 2025 15:53:41 -0700 (PDT)
X-Relaying-Domain: purestorage.com
Received: from dev-ushankar.dev.purestorage.com (dev-ushankar.dev.purestorage.com [10.7.70.36])
	by c7-smtp-2023.dev.purestorage.com (Postfix) with ESMTP id BCD78340278;
	Mon,  5 May 2025 16:53:40 -0600 (MDT)
Received: by dev-ushankar.dev.purestorage.com (Postfix, from userid 1557716368)
	id B0A55E40643; Mon,  5 May 2025 16:53:40 -0600 (MDT)
Date: Mon, 5 May 2025 16:53:40 -0600
From: Uday Shankar <ushankar@purestorage.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: Ming Lei <ming.lei@redhat.com>, Shuah Khan <shuah@kernel.org>,
	linux-block@vger.kernel.org, linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] selftests: ublk: more misc fixes
Message-ID: <aBlBdBl8uKCIVOPG@dev-ushankar.dev.purestorage.com>
References: <20250428-ublk_selftests-v1-0-5795f7b00cda@purestorage.com>
 <aBkgLOxWLp74TShe@dev-ushankar.dev.purestorage.com>
 <aBkg0LW5YO6Osdnw@dev-ushankar.dev.purestorage.com>
 <3a6050b3-03f6-4c22-a2c3-33ab6a453376@kernel.dk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3a6050b3-03f6-4c22-a2c3-33ab6a453376@kernel.dk>

On Mon, May 05, 2025 at 04:44:19PM -0600, Jens Axboe wrote:
> On 5/5/25 2:34 PM, Uday Shankar wrote:
> > On Mon, May 05, 2025 at 02:31:40PM -0600, Uday Shankar wrote:
> >> Hi Jens,
> >>
> >> Can you take a look at Ming's comment on the first patch and merge the
> >> set if things look good? I can rebase/repost it as needed.
> > 
> > Bleh, sorry, I meant to send this as a reply to v2:
> > 
> > https://lore.kernel.org/linux-block/20250429-ublk_selftests-v2-0-e970b6d9e4f4@purestorage.com/
> 
> Let's give Ming a chance to review v2, then I can get it queued up.

It looks like he has already reviewed all the patches in the set.

