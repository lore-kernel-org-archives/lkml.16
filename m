Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CE392556E
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 05:41:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747114875; cv=none; b=Oj5yEJtLgKE8pQgnxOG/J8u4ngNl1OBlf5JBBlzQJ++EAKv3XbPAPHYUVRUsBnm1OtcuLHDZYo7L1ARbALBJtHks6pU8CzPNMZeVqMlMFDG0U3/qjYnzfYjiQF57faL7iJDoytz1jmhBVtQ6059HVpTUqFIEruV1mJPImX6o1aQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747114875; c=relaxed/simple;
	bh=xFjsDPqOCUK6o2h49r2W4b0pCc2igav2DUvsk72eYTo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YOHGWdxXv2PmidCpXA/aawEY6qvCBUq49vBbQfn2/On8sauiv4YYOrY31Db2L+8ebAIoBc8RmSMpnbklTLjvzrQ8lkpll/ebHhKBk3aClKElGtf1xOiQv+VAxzWQecZ+jA5BWRqOz4MXz2IAIznyyI7ROh9dDbPbBf69dL3eFGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=KkG88GME; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="KkG88GME"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-af908bb32fdso4099592a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 22:41:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1747114873; x=1747719673; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Y8/e09aU88+x5oHV/hz7bpXJqL27aHVE4yHbJnrLGY8=;
        b=KkG88GMEPuA7Ip8KO0CPTxeU6/oYyBa5+NknsZJa7ccrPaLJQ6bC2ae73GKOPtk6B3
         CD2OTQHnrjVa6cP7N9Rfxp57Ta9rFUHklCFRO2XubBMp8hNgOiebbgzbJqWwAJU1zZZj
         o9Rq9IaaPMK/SPb5q3dqtTFhqUuhX/SAguV0Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747114873; x=1747719673;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y8/e09aU88+x5oHV/hz7bpXJqL27aHVE4yHbJnrLGY8=;
        b=CxQN9ck4n1Iw3b++wJLfZJFcNL91mtetZdrHJV62nwEj6W/srg+8H1eeJmRi/uzGju
         As1ljp0cj1JKT8YEYrNChhtEUOuYN4bT9o5SzaOfYbeGOjzfchdyLKSM4KstxQIiHTMl
         shZIqKdMxhU7vGwJnkH/sQKU7zsnElUJSe+MKsk5BuGUuEf8pa6HSKcTYbE4HkiIVB7e
         MjHg6CZqlKnfKhbKovDCDMcqsOgSScJ8CXGLV/qF9Of9OrcUbHk8hMYAXDhnfY0uVL6o
         KK06ng5pM4lYj/F7/jjW6TcYoVraaG3Gk8aQ9xd57T3hVm8F0UHAATuAcTGsUFw37Lbv
         mY7w==
X-Forwarded-Encrypted: i=1; AJvYcCWvDe75/nLZ5SIF2Wss/3tnKqe5ljy3GyKufeu3XgdtMAQJwqH4Dl4KBdOnAthBd+H4xSx/EssF9LQ5uWk=@vger.kernel.org
X-Gm-Message-State: AOJu0YyfJCVHLQCJ0zU7EQJyQ2+AAqjSZV+kdzWOM1HZ5daKxJYL6Nxe
	CqJzHKsuYaulaEP5sNsDm+KXSNyGk6ICn6M3e4g4E9RFWDv37zEPXybrUuXIyQ==
X-Gm-Gg: ASbGncs5yUVZZwrEcQc3UTCCIZm+l98Ht2uEMGE8Jk9DyV93mg7c2xgWyzX0LPY3iww
	LTZOBDrJFpNdynw2gCoXPRvZdswW94Cpr4BydAO55EjYocgIg3hSSfXFXskXDIMeZlIZ9cyodgi
	mdpUguvBwxZo5wgjSRbdVnFRIt7DlNMtmeCexuqw4kxU57UTgj99bvWHan7xS9q2CVg9meI+9uq
	mDak0aP04j+Yg1TK+jucafMiQqfiOM5cpR90GIHimnUnnQR2uR6J+vVqAWpLP2uW0ZnNJHv9KY8
	/wD0mimgyZl+ydtxT69lsoHFjapKE/3bA0pR9BmiBGObLEjqUl1PJPyadAe2HyDuFw==
X-Google-Smtp-Source: AGHT+IH8HYi0iwLoSM9ZEcgQsdWi1ONEPLQT8boJV6r/gWgrnH9v6R8JgAnAP2PObxArdEfREkH33A==
X-Received: by 2002:a17:90b:2547:b0:2fc:aaf:74d3 with SMTP id 98e67ed59e1d1-30e0daf571emr2971081a91.4.1747114873621;
        Mon, 12 May 2025 22:41:13 -0700 (PDT)
Received: from google.com ([2401:fa00:8f:203:7e67:ed66:98df:7a2d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30c39e6572fsm7787428a91.37.2025.05.12.22.41.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 May 2025 22:41:12 -0700 (PDT)
Date: Tue, 13 May 2025 14:41:07 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Zaslonko Mikhail <zaslonko@linux.ibm.com>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>, 
	Minchan Kim <minchan@kernel.org>, linux-kernel@vger.kernel.org, 
	Andrew Morton <akpm@linux-foundation.org>, Ilya Leoshkevich <iii@linux.ibm.com>, 
	Heiko Carstens <hca@linux.ibm.com>, linux-s390@vger.kernel.org
Subject: Re: [PATCHv7 10/24] zram: add zlib compression backend support
Message-ID: <uaxb7sbvrg3eqn2sp66sg77urjzr7jwi2m2bwigvj5n5cta2xu@qsks2da3zrha>
References: <20240902105656.1383858-1-senozhatsky@chromium.org>
 <20240902105656.1383858-11-senozhatsky@chromium.org>
 <6046d139-2a46-4824-bdfc-687750c1ee5b@linux.ibm.com>
 <gekqwhcpombpm2u3b4xl7zladuyzbxybeq5wcwt47k7tsgo4bh@rfrxaeqwzypi>
 <df805c0e-bf25-4cf6-9601-aac594fa0f45@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <df805c0e-bf25-4cf6-9601-aac594fa0f45@linux.ibm.com>

Sorry for the delay,

On (25/05/09 17:18), Zaslonko Mikhail wrote:
> > When zram transitioned from Crypto API (scomp) to custom compression
> > API I picked the CryptoAPI deflate DEFLATE_DEF_WINBITS value:
> > 
> > crypto/deflate.c: DEFLATE_DEF_WINBITS	11
> > 
> > which is then passed to zlib_deflateInit2() and zlib_inflateInit2().
> > 
> >> I tried to build the kernel with DEFLATE_DEF_WINBITS set to 15 and
> >> verified that s390 hardware deflate acceleration works for zram devices
> >> with a deflate compression.
> > 
> > If we define it as 15 on non-s390 machines, will there be any
> > consequences?  Increased memory usage?  By how much?
> 
> On s390, setting windowBits to 15 would lead to zlib workarea size
> increased by 120K (0x24dc8 -> 0x42dc8) per compression stream,
> i.e. per online CPU. 
> On non-s390 machine, that impact will be about 115K per stream. 
> Increasing window size should improve deflate compression,
> although the compression speed might be affected. Couldn't find any
> relevant zlib benchmarks though.
> 
> Not sure what other consequences might there be for zram. Do you see any?

The increased per-CPU memory usage is the only thing I can think of.
I guess for zram we could turn this into a run-time parameter, but for
Crypto API compile-time is the only option, I guess.

Can you send a patch series (for zram and Crypto API) that sets
windowBits to 15?
