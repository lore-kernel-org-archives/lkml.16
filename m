Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 505F91A8F9E
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 09:24:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739179444; cv=none; b=WKGNk8NEis8yTw55AgwQTA8B1jp/Fa6I5mJ7DxxPyh/ydz13Jdg2EzUzf9hVj06Cw/mAokNtg60EnWvnvhdn5i181ouAy/f2iB/yTgRF1Hj0LfJxeNbSvJznlh3gdUBbZiYey94vpCUImEiRzim6Egrc9e42U4aTTIWbQfmst6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739179444; c=relaxed/simple;
	bh=4F4S3IzaNvyKGcWgz4cP/T0d9ml/Zknz4NxFkF8YGt0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=O5liouGPntpQecr6txEl+pv65EImpRwFKr72l58g5yfknIoHv7Pyb5/KDlMa6hQZPxrtUDLXiO3rnteFnxnuMcaHvXn4cRgEAWqOsIxmNM3KrPkWmWb6J5oGBX+nSZ6hPDt/5rzNL492t3WCJOSNBFKiaz10NjtRf+aBWdJfQiU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=LxIRw3YR; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="LxIRw3YR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1739179442;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=UwcXqeIhV/s1vnE/HqxmZgkHKfi+VWdlt1zliVHj5TQ=;
	b=LxIRw3YR28Cyzs5D8Jn72InOOnXtbdZPIaaRW0mJkCV9ET7t0YQW2X1Rl+NTk/DirjKMSN
	3y2mSwz39QGqswCN512MBJHLiCI3jGRc45ERwBr2O4SEMoYDm2MjNISHIGuART9EWo/z9F
	odZYpl9CL7pwbsw8QdFwGG9woy4Su6A=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-665-MtGgPijbM0yMp9tf8ecuZg-1; Mon, 10 Feb 2025 04:23:59 -0500
X-MC-Unique: MtGgPijbM0yMp9tf8ecuZg-1
X-Mimecast-MFC-AGG-ID: MtGgPijbM0yMp9tf8ecuZg
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-4388eee7073so23634245e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 01:23:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739179438; x=1739784238;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=UwcXqeIhV/s1vnE/HqxmZgkHKfi+VWdlt1zliVHj5TQ=;
        b=hpCPeKcy4MQ6aQjPiby0HdoMSrc5uTojXyCIFoHylAhKejwo1mQuNXnOtlfO5dTwVD
         1ZTZZA1qCinXjgRGlfOqo6IavVVSFxswQ6/1X9LC0MlDfC6KoGZYufWUD6qkglwwVRXX
         KRJPMWr3SYD40Fka5OiG4rBXJGWxlgsYjr5lfuw0Ya6yPyPhP3FxEUPyPjmxHpqPLLHp
         JhJWYzlafRyzHPE3x4l4qhVzmL4JwVwwSoD1D665y9K3UxfieTfAu7kuBwtzeh8R7vvM
         SdVYwe7ZOtNb2I3vxBoJXem2stfxz0qgWIoQ2L6Bjua9TG8t2RvCfvAjT3h8PBd+Qnru
         idpg==
X-Forwarded-Encrypted: i=1; AJvYcCXjh6P5JjnQvRkU/geIZBxftzVYj7w4bHUYIejhfym2RgDiKUBxIfCR/jgoyHm5Nikvhi2A+pQBBQ6LDg8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzMRgbGXqahzlIWv1VmHwYeDePMG54XXxYpn+c1CarnBE9Q+e4F
	ZuXjkDABhhJiWI68PAXBTlTy+uEdNQgLRa1HLUHt78XJxbrhl8GznvxOJMCS/HIu+FjtT9tja7h
	eJGLqjOtvgmYx1PKyhXYuVwIZX1n6tCMuoOf0AdYhY/6BeriKQN9vkRjpDKBAjg==
X-Gm-Gg: ASbGncvLZ+ShTyb/SDwDVn6y8dM/U6xA06ayYGryWrfEOXFXAiHNpAqc4oEi9+ObvTc
	a05V5BQRqJYIrtfW5CNQaiNpHMl5vK0LQkd8EOUPfmJCkCHzcIpyIvVDpDQ69uLz/4yVpbYjQ/8
	GAfVitfLhnhiaABBYXWiPxPSSDEEX5bpHGGhS7nKoS7bYtDhmdGesijBNaUW4iZY6utlinOv75v
	jHXYRTwwYdcjRh754EzidICI/gWEqUyHLs/RGcb6oLJjBqdE5exNPmi8GJEpt/HN1JljZ3PZQv5
	wwMFUggVwqgA1/48mXXuB0DhgABWBH6nnrb6kQk7r4i63JgufmDtRB7spZYXpwDXB02gonTx60m
	FnasowzngbCgDWexd+fKQxk1oCjV9JttZ
X-Received: by 2002:a7b:c342:0:b0:42c:baf1:4c7 with SMTP id 5b1f17b1804b1-43912d150bbmr123252305e9.4.1739179438639;
        Mon, 10 Feb 2025 01:23:58 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGhk3Pqop723/zySAwaM52VQqdPHjX/5n23EiWoaPZW+xlAIpKvjvjpgkMUmyvTjM1fIJmzbQ==
X-Received: by 2002:a7b:c342:0:b0:42c:baf1:4c7 with SMTP id 5b1f17b1804b1-43912d150bbmr123251975e9.4.1739179438057;
        Mon, 10 Feb 2025 01:23:58 -0800 (PST)
Received: from ?IPV6:2003:cb:c734:b800:12c4:65cd:348a:aee6? (p200300cbc734b80012c465cd348aaee6.dip0.t-ipconnect.de. [2003:cb:c734:b800:12c4:65cd:348a:aee6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4390db10b17sm172224995e9.34.2025.02.10.01.23.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Feb 2025 01:23:56 -0800 (PST)
Message-ID: <62670dc0-216a-4e59-a6c1-889065efb529@redhat.com>
Date: Mon, 10 Feb 2025 10:23:54 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] mm: Remove the access_ok() call from
 gup_fast_fallback().
To: David Laight <david.laight.linux@gmail.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Linus Torvalds <torvalds@linux-foundation.org>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, x86@kernel.org
Cc: Jason Gunthorpe <jgg@nvidia.com>, Jan Kara <jack@suse.cz>,
 John Hubbard <jhubbard@nvidia.com>, Peter Xu <peterx@redhat.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, Andy Lutomirski
 <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>
References: <20250209174711.60889-1-david.laight.linux@gmail.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <20250209174711.60889-1-david.laight.linux@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 09.02.25 18:47, David Laight wrote:
> Historiaclly the code relied on access_ok() to validate the address range.
> Commit 26f4c328079d7 added an explicit wrap check before access_ok().
> Commit c28b1fc70390d then changed the wrap test to use check_add_overflow().
> Commit 6014bc27561f2 relaxed the checks in x86-64's access_ok() and added

checkpatch.pl will correctly tell you about the wrongly quoted commit ids.

E.g.,

ERROR: Please use git commit description style 'commit <12+ chars of 
sha1> ("<title line>")' - ie: 'Commit 26f4c328079d ("mm: simplify 
gup_fast_permitted")'


Apart from that

Acked-by: David Hildenbrand <david@redhat.com>

-- 
Cheers,

David / dhildenb

