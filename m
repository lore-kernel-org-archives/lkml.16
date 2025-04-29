Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6931046B5
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 14:37:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745937441; cv=none; b=YbwDeX79S3wFAm68rxIeLh/zXzmyTzyN9PnRtZBfta6ocJFXjeyz7wXGF3w1L9F6/n4+ywF3lewERaFdwo8JADKunfU/PhZXNqpjz42UVPn8Pjia1bbAP1HWl/WARO8KnwWqx0+FAB5tbCPUqGW+f0tIAvnbRzyWqH4coicyYno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745937441; c=relaxed/simple;
	bh=qA2vmZpsm9MXjJz8/ABOmVcvFNn4BfZryNTqFdiv+b4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RIcVcvtx5Rc1UXBmExf6Z4qNE5adNUmpTrN/ZGsA8bmBJfoE1UpR/rM1J0PxHcKiSL892VV6A2uZfj+QbWnijFNQCRM64SmgintpqyZQ+6rB2xwQmH4EFHt9MXLM1JwblKwkzPcy7QLBG8JD/DNn0MHDI0VPFvopw1uwlPm2mNA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=bWUlrK2m; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="bWUlrK2m"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-ac2af2f15d1so760656666b.1
        for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 07:37:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1745937437; x=1746542237; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9Ufp4WkcsJlg8ks/5Mdw+aPumXFp2SwFQxmHDZiEErY=;
        b=bWUlrK2mcH8uQtZjlj1Q1d4MKdv7yXBy7/3HaQnoaJnCjIZI6Csya8QrlR0SUlx5I9
         Wb7k30A2uP/6iilhor5xpZT2YRk0nbpuWOCZd6Zn0yMY+azAzrHLqwcYrZN/F4fcQPZ7
         2mCI4Cn1zzfbLePHLn2JhgM+BedDHTpmRXMt84mg2RS+j2APrn3BRKgBXy833DbpSav5
         IZV1Sp2wGDr2NwUlSRnlmUqQF4dPl8/ykDHlT6L2jLR8Uc7YF0dUO1LFln/ao9JxmHGR
         e1FSGENQpBvedip7hxtheUSXTVBRCKNLtf/0bxM/Jw25smmngsM+1jnRPUeQC6xoaXHd
         WrbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745937437; x=1746542237;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9Ufp4WkcsJlg8ks/5Mdw+aPumXFp2SwFQxmHDZiEErY=;
        b=aXvnQflfGpTK0OPHofbfWrUX+HXj8Tyo4KU/6K0BC9VcV7t0tcptmZpUSTzN5eQI69
         3pUWlkgolfX5e0RQ5pdGUA+BAm2t//lBXmDlIzW36eetfaUuQ/OlfVmFtBSXklu+I4aR
         PMiytSRbVJSjGE3niKB4NMT+1Y8jwhfD0vgib+Bs0u5C3qqSpUZ8mkAV9fxK3p2mWDhz
         MsVmVe7zDshpggeqyRlv/YCLf8zt0WUppk7yXfT+DP6UGKRAGyvX4oHyn8vFLc7//x7c
         BmIsfs+iO+dR6pKsQnYqWV7r9N7xbpldicsSwIdjarOuAhWWGKlo7eyq+cj0sw6k+uHo
         HsgA==
X-Gm-Message-State: AOJu0YwSapeP8+KansPuv1vAa0ucK2rPnrjldG1JxJXQ9tJUNTAKYrAl
	i+kFW+lSQjwdusVhdsIuMbdHBO7cODkC7locfdCCJ6yIgedEfsBhY6clJSnC2ZU=
X-Gm-Gg: ASbGncsjVYCaC14tLASg02bj0VxXoBXd3IfoRfKqDRqNi/prAkPnbrMl6Tq16nIRPq+
	WFPrU0Sdbhg+OFgmB/JtbStNTZU99ik3dcloanH6yTZ74jptYkjkSu3XOthWBiP/rV+sgCSWkw2
	ZrUgkvV0i1fiNG3cgXpNC418rboo1inSJWhMAgPiExHVLYpqLPbsjrkhO++rPPhkP55xzO0nu33
	cTkyrG+BewpwknjHKfk5iv0dzcuDfRg8P/VV3J6PXMKQTLbpG3xshtzd7rfeMj9d17uQSKUBYW0
	C+3zL0yimcOrCSIeOGEsdnHYff8h/SuDaDb2nJHy
X-Google-Smtp-Source: AGHT+IE3S/fpZve4DBSQrctJimdzy9L4Ibc1lCThFS9Gfbg4W+NFYZd3iQ9Y4tI2ItL+gJOTWq0Vkg==
X-Received: by 2002:a17:906:6a1e:b0:ac7:95b5:f5d1 with SMTP id a640c23a62f3a-acec874bee9mr305876466b.42.1745937436593;
        Tue, 29 Apr 2025 07:37:16 -0700 (PDT)
Received: from pathway.suse.cz ([193.86.92.181])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acec4a84247sm158436066b.55.2025.04.29.07.37.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 07:37:16 -0700 (PDT)
Date: Tue, 29 Apr 2025 16:37:14 +0200
From: Petr Mladek <pmladek@suse.com>
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: linux-kernel@vger.kernel.org, kernel-team@meta.com,
	Andrew Morton <akpm@linux-foundation.org>,
	Kuniyuki Iwashima <kuniyu@amazon.com>,
	Mateusz Guzik <mjguzik@gmail.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	John Ogness <john.ogness@linutronix.de>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Jon Pan-Doh <pandoh@google.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Karolina Stolarek <karolina.stolarek@oracle.com>
Subject: Re: [PATCH v3 19/20] ratelimit: Use nolock_ret restructuring to
 collapse common case code
Message-ID: <aBDkGgpssYjdmzfO@pathway.suse.cz>
References: <72ee57b8-9e2a-4cad-aaa0-1e3353d146d8@paulmck-laptop>
 <20250425002826.3431914-19-paulmck@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250425002826.3431914-19-paulmck@kernel.org>

On Thu 2025-04-24 17:28:25, Paul E. McKenney wrote:
> Now that unlock_ret releases the lock, then falls into nolock_ret, which
> handles ->missed based on the value of ret, the common-case lock-held
> code can be collapsed into a single "if" statement with a single-statement
> "then" clause.
> 
> Yes, we could go further and just assign the "if" condition to ret,
> but in the immortal words of MSDOS, "Are you sure?".
> 
> Link: https://lore.kernel.org/all/fbe93a52-365e-47fe-93a4-44a44547d601@paulmck-laptop/
> Link: https://lore.kernel.org/all/20250423115409.3425-1-spasswolf@web.de/
> Signed-off-by: Paul E. McKenney <paulmck@kernel.org>

Looks good to me:

Reviewed-by: Petr Mladek <pmladek@suse.com>

Best Regards,
Petr
