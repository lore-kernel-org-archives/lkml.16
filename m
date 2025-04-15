Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 371E11AF0AE
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 08:44:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744706654; cv=none; b=RTlpPp8ypl12MG30KueCawff5ZMf2aUOfzHcfBEVq2X83y6Gdpc4KV1qH3TWztE+JcWdcBJYfM+T7PRCG05nMv2IyJGOFNEQb4caSos+6KFnDqZmP+FdEiUS7jUGx5Gmw3cJ8xH/vjz3+ywH7LcpPbthITkDFf911bc0S5Haa/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744706654; c=relaxed/simple;
	bh=LAabiM4TPF38kAYsZUo11m9Q82vur12kUTr0m2VKGtw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=meVecdz2ex4yb7aS73vKif+UfdHxPeK8qVKd6YqJtBuZ55coUggjFlcfVpFawI9o4J22TaR9Z+d9fdaFdpubQ8MJ63UACmsmtNFt95MEOTMqpp67GxCKU7Ke1VoXzYeWyLHy1oN7xfTT+dozHpZrIJMN0Pk5Pa7PL1shm2RGkbg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu; spf=pass smtp.mailfrom=szeredi.hu; dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b=jW0Q6D0E; arc=none smtp.client-ip=209.85.160.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b="jW0Q6D0E"
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-47662449055so27092241cf.1
        for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 01:44:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=szeredi.hu; s=google; t=1744706650; x=1745311450; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=LAabiM4TPF38kAYsZUo11m9Q82vur12kUTr0m2VKGtw=;
        b=jW0Q6D0Eg4AoMqjgkUZsu+8SqGw1G5YjtUOJMJiMxaAlT0LhQ1adCWr9paRbXd500v
         p8T6p6VO6Fjn09M87mk08snZ1tz5Qj3NMXEvCBvDna1jWewvxm0tc5mRRHLULasT0k0x
         re5KaQ0wvj3aSzxle3adqeYXo7mLIKDTBXzME=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744706650; x=1745311450;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LAabiM4TPF38kAYsZUo11m9Q82vur12kUTr0m2VKGtw=;
        b=k6cZQYmrrD5jFH6SyqJOvhM8onnW41bLvizFsSzp+PQS6AIGbO9hLKdcrD6hDUVnJq
         2/AzHAqSiYWsU0/w5sDWPG0q/C9FC/Mue9Z/3eGp/DNBdVwDukIBC3M39ayAciUEY3hg
         P8msCe/yecC9AXS+RVJayjXCUxBnHtxORBKWX1/4eG5Bua5bIMqOHIAeTM0H/NVTpq/q
         1coePiTorMMS0ojgA7UBg+jlKuzwPSoJGpw//KkUX/Slm8JW+wuaiK9VvwaWgxnZK7r/
         0SdauXHQIvWiVg1ztkphPrtyZjJz5dcFcBR8/3VX+Hg79fizZJNxgjgoB7y0yzg6GS3o
         EHYA==
X-Gm-Message-State: AOJu0Yyn9ZCEJCMHfoJWonfcsr2XfStm7k13JXqdVYb7zV63+8pK3VIn
	QluoS0pSEmAeqW9A1aIR0wYrWj+/q9uLavjHcD7vlAZxwUsod+IV5dY5AFfhnDxmf8RGeiQNi3k
	AnMuvrRThYtmASvlBRNmMF39xl/LmUGRNImTlHjtCGQCeycs0
X-Gm-Gg: ASbGncvUe9p/ZJJhr/WBQTE7rU8zfit1yTdCgvEU5mK85AZKmdLgqrZ7ve9JVfvOJ8v
	JysLI3a8FRoadK3Dcl9ARj/ViPefzwR+gLvYYgxemSik3ZcPVO65EUij3B8uM/ek0Lg9Wjznzhd
	4uhLr31hQ4UjuM4KCmWufF
X-Google-Smtp-Source: AGHT+IH2zkg3JBkVX8tZSe6Dymy425acHm0nx+g6+ODx4iVkOFOHuLBjkcilgsmZjJf2lWdAxiR3JKelikOF23YKSRA=
X-Received: by 2002:ac8:5f91:0:b0:476:83d6:75ed with SMTP id
 d75a77b69052e-479775dd23dmr277687171cf.34.1744706649975; Tue, 15 Apr 2025
 01:44:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250129181749.C229F6F3@davehans-spike.ostc.intel.com> <20250129181756.44C9597C@davehans-spike.ostc.intel.com>
In-Reply-To: <20250129181756.44C9597C@davehans-spike.ostc.intel.com>
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Tue, 15 Apr 2025 10:43:59 +0200
X-Gm-Features: ATxdqUEXb169NCqOpyB29RP_KpKB9sap8dRPbGCysm9RqLIzdCcscH0aFeS-Ig4
Message-ID: <CAJfpegtc56iCZe7KfEm-juA7DriLn7Pe5yvZEWzZqx1R5MdicA@mail.gmail.com>
Subject: Re: [PATCH 4/7] fuse: Move prefaulting out of hot write path
To: Dave Hansen <dave.hansen@linux.intel.com>
Cc: linux-kernel@vger.kernel.org, 
	Linus Torvalds <torvalds@linux-foundation.org>, "Ted Ts'o" <tytso@mit.edu>, 
	Christian Brauner <brauner@kernel.org>, "Darrick J. Wong" <djwong@kernel.org>, 
	Matthew Wilcox <willy@infradead.org>, Al Viro <viro@zeniv.linux.org.uk>, 
	linux-fsdevel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 29 Jan 2025 at 19:17, Dave Hansen <dave.hansen@linux.intel.com> wrote:
>
>
> From: Dave Hansen <dave.hansen@linux.intel.com>
>
> Prefaulting the write source buffer incurs an extra userspace access
> in the common fast path. Make fuse_fill_write_pages() consistent with
> generic_perform_write(): only touch userspace an extra time when
> copy_folio_from_iter_atomic() has failed to make progress.
>
> Signed-off-by: Dave Hansen <dave.hansen@linux.intel.com>
> Cc: Miklos Szeredi <miklos@szeredi.hu>

Applied, thanks.

Miklos
