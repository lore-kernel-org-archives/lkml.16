Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D385F175D48
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 19:01:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743620518; cv=none; b=fYcj0/GnSw/bV3bPPF+enM5K16a/2EBR+iv+J/GoGodGIbNgwZFrD9pH45rd+uKxTEzM8hLjGKhabGUdbi34ooYyAtDX+TBn8ohgxdJIBbM3f+2iVwohFDKCKU5ymDtdobjPLcQMl+Kjnn0DSMwONbtU4Mctmol2yqdxB53jvNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743620518; c=relaxed/simple;
	bh=1CRTZ17xGy1eJAgP86O3H7RxWmFhSfV0qChPUCeg0x0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jfWM5mp+ioVb1T3odQqiU1QIH5Ty3R5lJZaZnUQ/7ylrvDtn3qrRr1l5v4EC+ztGDGlR3h49177XGZvnCAyGbyjAsOTJ0xn5QwyJcW/yTMuxs32q5aqweGELve018RMMYrcbLgRGT+gJSh4fr6wfGeX4l7dFr4ViVfQVfz4VX4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U3pH6+t8; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U3pH6+t8"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-736bfa487c3so103345b3a.1
        for <linux-kernel@vger.kernel.org>; Wed, 02 Apr 2025 12:01:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743620516; x=1744225316; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=nb+Gpjg1JmZryqku7pXG2hw8wj2Q2vTluqT4h8F5GS4=;
        b=U3pH6+t8EWvIou3I+FSXMsmPaX6EUAhr05waYHhTQK4W7TRbL4ndbjguZYse58QnVz
         4/LiKOVyBisWebUCI7ja37JmeK9INMDISTeRAcjnMel3ZzwmgD2dAM8Sv+v1g6XM0J1S
         t90O6WhcMziJc1KzXByBSmZ+6yT9o9VSd8UdkU/F9CHpcZ/n63tyBK2/OBQvrSJD49N1
         M0f19MYk260NXkjkOz6EGrDLFjlr3eHyPta3vrDZIhsdvaCmcOpHDaYtXndMdb9YRh4F
         EAtzFUq4uUq6a26EznHKY8HW/BtEEhq3D6VzEYmGYDBRe9m44m6kibWJ+6FU3oN18rn/
         LxMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743620516; x=1744225316;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nb+Gpjg1JmZryqku7pXG2hw8wj2Q2vTluqT4h8F5GS4=;
        b=lz7GGvP69BumXwLeU+MKgu0X/MNmeHpyVf4hOw97yXi9k8KZVOoBxtb0nrPv/My9lj
         uGanFW/yoMszRmRMA4JhAhDhV+wVa+9KExJGM2dcku5yi4PMfVAH0y1KAxXvStpXyV4Y
         y1FawIMNoXgxiin7p2Seq3GKqBSiZ7/DpNirvUxluRSucKUxaz+VF2NuYvKpmIxTrqB9
         uvwuWqksthVQD92D3disK5uXr9laSCts1IvWOavKYhKZQmGSCHyk5rHVbCpR0JU7/O+Y
         FOvo1ft6kyPiaLMKDsqJq0M0eZI9vz65TT6gsgHhnv8/qvLMkdFNMA9qnUN5Fs1YEM+y
         WkGw==
X-Forwarded-Encrypted: i=1; AJvYcCX7F8ogPe0AjhvnTDYyxFNpRsZvjM3jPX6WT5XC8+wsX2RCd6l3h/XjWaCZdl8bLiKpVm58xtodfCWLfhQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7+rRSMKAx7x40A2BuLzsDQbsquqtxrvsO7hklxjjKisxN8w6y
	4p/tQqGiy2ab+6b6NIG0gLDEMJeQYmNrm8lCkpAPKt9DIKZ6dieI
X-Gm-Gg: ASbGncsR2JzLiiiwl7Rv6YvNalBSoMhlkLXoocvZGr0WY+F3Bn2EzGueLcAihsWNYxS
	iJPnM+Jdp1jvcz2M/X3gXpnPIsQPZFWspf8C3cRfyLI4XY9UViEE98ZoEA8XL2ubLIrun+4Sf0v
	O2iAyDHOJGRIXS6oJYOim62Rh0iOiOfIR1hsRm5xDxrlRUy68zvffD1CahRP+SNw42pwWClua+G
	MALcpvsUnkxIUcTjfp9Xble6hpdt3G7gGyR6lJfvH83D6BqDqNPFigkR+jwlx2Cm9mwUut50nnU
	nSeSOH2ika9+1+yi8099eb2H1MrctxWDkQLWktXYdR6M5anMAKc4eZw0ZECGy2akHh3vncAjUc/
	e
X-Google-Smtp-Source: AGHT+IFw5BHeHgoe/2f1XCTVp8zBEE9uULeUw0xNTUTDyx7n85Bk/+ooSDGmjDTYpc9RcDsrxy8V1g==
X-Received: by 2002:a05:6a20:9f99:b0:1f5:8f65:a6e6 with SMTP id adf61e73a8af0-200f73694admr58421637.27.1743620515909;
        Wed, 02 Apr 2025 12:01:55 -0700 (PDT)
Received: from fedora (c-67-164-59-41.hsd1.ca.comcast.net. [67.164.59.41])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af93b6d57dasm8684672a12.33.2025.04.02.12.01.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 12:01:55 -0700 (PDT)
Date: Wed, 2 Apr 2025 12:01:52 -0700
From: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>
To: Songtang Liu <liusongtang@bytedance.com>
Cc: akpm@linux-foundation.org, ying.huang@linux.alibaba.com,
	linux-mm@kvack.org, linux-kernel@vger.kernel.org,
	zhengqi.arch@bytedance.com, songmuchun@bytedance.com
Subject: Re: [PATCH] mm: page_alloc: Remove redundant READ_ONCE
Message-ID: <Z-2JoJWjGuqWCsdu@fedora>
References: <CAA=HWd1kn01ym8YuVFuAqK2Ggq3itEGkqX8T6eCXs_C7tiv-Jw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAA=HWd1kn01ym8YuVFuAqK2Ggq3itEGkqX8T6eCXs_C7tiv-Jw@mail.gmail.com>

On Wed, Apr 02, 2025 at 03:41:16AM -0400, Songtang Liu wrote:
> In the current code, batch is a local variable, and it cannot be
> concurrently modified. It's unnecessary to use READ_ONCE here,
> so remove it.
> 
> Fixes: 51a755c56dc0 ("mm: tune PCP high automatically")
> Signed-off-by: Songtang Liu <liusongtang@bytedance.com>

Reviewed-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
