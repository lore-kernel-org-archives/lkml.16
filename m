Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F64D1CB31D
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 06:18:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746685104; cv=none; b=RZMI/lPR1S5pB9VSY0Z3nlTGaRxaXMSgHkIcxMg7tlDuO31l7FG1UNmPHKg08l+TH3TiktsdZhjLNTAhvglGANlVKgYxGH3xXiBu3h9I+6Mus/kpVayyGvk8oO6MJr1+F9Q1Vk3TAQQ/iOed0Vgk3/rvG79UWaVMKYv46HwZ/D8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746685104; c=relaxed/simple;
	bh=XqBq4/xGPzOX+eDMZnGd+MB/OvHm44XA4eW9KOQu//4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PRzVCfDQqYYaUcI2iSx8MjeEtHiNOHziRZP5Uo5prVcNZGIZEpjFher6eCMYdyYfswN2hcWq+Pst6BTFlx9HVlpgil/LC+Xfz3GWZPpZQ6M/FE6O1lk2Jqh+lGLK4F3RnNAPBTj7egOgzVH42qBB8//+6RAcGcr7kz3uo3nffls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Iktx37Y4; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Iktx37Y4"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-736b0c68092so592743b3a.0
        for <linux-kernel@vger.kernel.org>; Wed, 07 May 2025 23:18:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1746685102; x=1747289902; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=a5vDJd4sFj9Mbe4a4INcdSXmTrq/OgA3/EgwfJosPAI=;
        b=Iktx37Y4chA4eOl/1sMGCyuBK7aU1lXoOh9hz6AL7QX0aKqQheyd/qSRu8wjbkCA8C
         uGmx2cTlrhPNysBpYUzabZ3OJ1GmVxtes3uMgb6AHCSLarGRwVF/yVXXWbWF/Juux8ek
         Dlyob0JLpbbE/kHqYp4eyd641C5jVcRGOLukY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746685102; x=1747289902;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a5vDJd4sFj9Mbe4a4INcdSXmTrq/OgA3/EgwfJosPAI=;
        b=VtfznCtkIBmAb528wLqb8+hqer91j4eOJJk7jef8orzhkDhaKv9LNhC6YtGbBQ+Xig
         cSjXZQcda6T1VukJnBXQzphr/Xz4WsIwVVHUBTx+ROiLiqmYfr+thfSMeZEKip9oGySO
         2sv5wKIIPS3drSxtf7BcTPifmSQ1Vc0B1Ph7Lw+T9+bJCR6yD6/ApM7T2L23gjjSW9yu
         XRckqwAYjnowlvhAAKEkzorVv85vmgvNa7Tu6WP+HDucAKj+aCvO015bzTi4PE+poaoq
         hn2pr14pOn9RRaSRCUU4qG2P14zrGKwqhyoCMuYso7xLMB7K+vYOhoIbdT/puA1z8kUk
         PK2A==
X-Forwarded-Encrypted: i=1; AJvYcCU/+Bcv1fLWdWhyjOG2peVpWcm+aaCLJqxh6FK2iUgv5d04GFzTXDIDUf/kjrUXrfBH3QMtrga+Zl77jy4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwMMdzmpBTBY8hzz6tmVq447lU9/r470xrrQIl8KOAfzXXiK+G+
	DMLUB5OmC3l+Yny8bFaxu+ZLlCKMfsskI828OV/Yfct3PUki5A55bl06Lt6xfw==
X-Gm-Gg: ASbGncttCA8EnVENEKq5FkmawsoYDBkPVyYmBaLH9cDrmjh3q0+f8TRpJht1kq6JXJW
	jQVvfOlxMJYAnrTFtdaiCaFVwlNjPTVzF1RNBUSfHlnqHAacLo5emV5nADml0oPsOK/Tr5gYsty
	7/upnyWGS668iKf+xWgmfhr0OuwW8BPZddIiUlUPY4mHdrxcmMeZW+fGlVplrsyc6So9m+7Dp04
	blDp+aa7E1hrMfkFlUT5rYce6a8dWRRDnphxysfSbdCpFkn0svp3YBqHEtyTuEcpP8EJYWbJIxu
	BQVqStaiPo5NJteGG/LW4FicnMDs0jlfQ8sI0dncgOQRvIzym7MgRKE=
X-Google-Smtp-Source: AGHT+IEmjxbI0CoGYM3oDVwMMaIwRnvSdfZ4i+4zpM4DgPGGhHStpLMN0bKNgHpy3FaRRumZ4MX0qw==
X-Received: by 2002:a17:902:f78d:b0:22e:7f20:52ed with SMTP id d9443c01a7336-22e7f2055admr31670455ad.20.1746685102508;
        Wed, 07 May 2025 23:18:22 -0700 (PDT)
Received: from google.com ([2401:fa00:8f:203:c794:38be:3be8:4c26])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b1fb3b53a6bsm8935238a12.22.2025.05.07.23.18.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 23:18:22 -0700 (PDT)
Date: Thu, 8 May 2025 15:17:56 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Christoph Hellwig <hch@infradead.org>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>, 
	Yosry Ahmed <yosry.ahmed@linux.dev>, Vitaly Wool <vitaly.wool@konsulko.se>, linux-mm@kvack.org, 
	akpm@linux-foundation.org, linux-kernel@vger.kernel.org, Nhat Pham <nphamcs@gmail.com>, 
	Shakeel Butt <shakeel.butt@linux.dev>, Johannes Weiner <hannes@cmpxchg.org>, 
	Minchan Kim <minchan@kernel.org>, Igor Belousov <igor.b@beldev.am>, 
	Herbert Xu <herbert@gondor.apana.org.au>
Subject: Re: [PATCH] mm/zblock: use vmalloc for page allocations
Message-ID: <at4djawky2n5d2nrxor62osid3mkaid4ttmlmc3xwsju2hstun@bos2kgakshpa>
References: <20250502080156.1672957-1-vitaly.wool@konsulko.se>
 <aBoK7f7rtfbPFGap@google.com>
 <m2dmxnhtvxano6lye7lr3saiobn4ygpln55xntlstfo4zwws5g@qpq7aagx3xwq>
 <b42gpp5qsa4j22ai2v4rwwkjhvfbcbf3lcnjoccz7xeidae5c7@ot2ocric3qzs>
 <aBsDj0IGQBJC_JMj@infradead.org>
 <unyov4aypoaotj56m5scgd4qtjfn2mceb4zdmtaek42dfqaq3t@lrrqwojlmudp>
 <aBxIlUYEPojTopek@infradead.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aBxIlUYEPojTopek@infradead.org>

On (25/05/07 23:00), Christoph Hellwig wrote:
> On Thu, May 08, 2025 at 02:58:14PM +0900, Sergey Senozhatsky wrote:
> > Oh, I didn't realize that zram was the only swap_slot_free_notify
> > user.  zram already handles REQ_OP_DISCARD/REQ_OP_WRITE_ZEROES so
> > I guess only swap-cluster needs some work.  Are there any
> > blockers/complications on the swap-cluster side?
> 
> I think the reason it was added it was so that the discard can be
> done non-blocking with a spinlock held.  Which seems a bit sketch
> when calling into a driver anyway..

swap_slot_free_notify is not guaranteed to free anything on the zram/zsmalloc
side. zram attempts to trylock entry and if it fails to acquire the ownership
swap_slot_free_notify for that entry becomes a .miss_free.  So we just keep
stale data in zspage (potentially, preventing it from being released if that
was the last allocated object).  I don't know if .miss_free happens often in
real life.
