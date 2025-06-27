Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C899921B9FD
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 13:32:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751031170; cv=none; b=CGON3J7nBJos12NR5T8IgjFL2YPPQtPdsiXdomCxPlm77KYmeCNAO+e9Yty530zLacpusQNTuSTlesAHvz2UHof8cETDG1l89pxRNhMvdv4olM+PLOETmjQc4twioyofbX+HL2R3iR1dfD6Hf8fIsE5+4r4dY6RBXW+MfxDW+Ao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751031170; c=relaxed/simple;
	bh=3CFQCN69m7XzAoNrptngTrM9nxy7EanLF6eu8+toEXw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rayREtyoPQlvqZuRjs+kB6LLX2UiDeEwF9xMPpxS+mOjTDemBjL13sPGlr8TIvcQpbbvh1bRl36+GlE1lsvXLcRI/AEhzYVbZ2UwENM6rQTr0zVkBiKPRW0f21OdR/F1+N2otQ45WM5VkNujJMIbeKDhlSbO1qgsIEtK+fNCgDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=A5UGbdVX; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="A5UGbdVX"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-ae0de0c03e9so267818366b.2
        for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 06:32:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751031167; x=1751635967; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=yx7UcFPCa+Dpueol6GXn1V8vjpR+B3PuxUNEOBghfAY=;
        b=A5UGbdVXBzPIJ3LcJ82lY7TvdGHhV4kO/K+nggiFsCqWCUtfB7DR0/QYdfB9x+W/td
         OGQMTfmm0JrFAdp/v/ZW09dFkFrbtloiRAkDv4T1PK2nrSf0Gmg7Yx6kCtDDFVvQCgJ5
         RdovP8WeN+kkRQKaWMmMj+SK7BTjoQogpEYw4ZxtxLhjAg1quUSeCNKvCWEvMVOZGU4B
         En+sAC6updYL8YlY5CqA3M2vyWgMjvm5thDRUGmvjEVnJV9lKEHHT8s0DoaRK9FcldJv
         iiGJTGnyTYPcrwXew8UsLeoNh5SeO3hp2n6ppLhz0n/EQRPpCUbqJN/rvFUY+bya7ERX
         ntrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751031167; x=1751635967;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yx7UcFPCa+Dpueol6GXn1V8vjpR+B3PuxUNEOBghfAY=;
        b=J7+4gnwJMARQD3Nc67BR8YRSFG2xIK4lxSUOX6/8a/TcNH5WtFdmxNlgzqx4ZtOvte
         jssoFMkdYJlQ/XECQTL2f9GPOtA3b1gbgoGPh5pft65E3n1+aVB1L3/a6hXPLb9tkp6G
         fUETJt1PN+CH19is+CNPsrb5IzZZlTw40a5zNTG0ZhC7BPsmz2JDB642VrnskayZ89vH
         xzOeujMF2Si8FfUeE2GeTx0cluDqlZkuRrsP6+BC/XaoRG2Kpm9/AIikPe8PS+q+PvlL
         9xkGxEuh/Kr6rcCu4wZFwIjxV3aiD0mFGkxjlhXDWwkWmQsiQc3QGkIFLfjX7ONdOjpO
         nnHg==
X-Forwarded-Encrypted: i=1; AJvYcCX858I7iCfa3gy8+3nsr1lQyTdOLB06GAUWOqsTjrcyLG9QBbHXYwpwLKVo3auZCMJQsxJNEFOWj33A2K8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yws3TrpKv+4nfSPHbMlp4wa+G/rUcwvABeu0I9/dn7JeuON6hBw
	CKtpljg/G+WX2PwpFt0aceSlSIyTDz7nTN+vtquYUW6tqy+oQfAQMypS20cwls3Vm5C+lb3xNhI
	NbdHFdtpx3hETBgJ53ugleJ4fuChb+69EqBzUNGJeWA==
X-Gm-Gg: ASbGncsjswkao8Ph5fgPxjKHvzY+X9LjuLPV4duNXiKXGnH+FL6hV7FlRxsWo0jZfTV
	hqeMKUPxFyXXf0+rUEGRe82I4D53ZXKEluKf8LT2zqRhIPW+QkxvUZlfvdKO4yP9/daOei0n31C
	nPnEDazKpWYjCMQMq+pFw1W97DJ6U0ZmyOPqLui/rVmZhn7jyWMhEt3YZL+9jfOVWoPonWsOo9
X-Google-Smtp-Source: AGHT+IEe/IPSRtND6XVHLzYuqdQeL+pU07j+spsJjTrlNeGkkokEF6l4pMj+scLEAZBVl2XEBvNBcgqfWiPaUhX953c=
X-Received: by 2002:a17:907:1c22:b0:ad2:313f:f550 with SMTP id
 a640c23a62f3a-ae3500f84femr317527666b.29.1751031164107; Fri, 27 Jun 2025
 06:32:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250624204942.715206-1-clm@fb.com> <20250626070057.GE1613200@noisy.programming.kicks-ass.net>
 <872c057e-5e2f-4cbf-943a-072b6015fee9@meta.com> <CAKfTPtBE0_77+J-A7vWRKsHCCmuX1jWTbPYWGVPg1MYq_rv8Og@mail.gmail.com>
 <dbbff170-db0a-4955-a024-978bb8dc3016@meta.com>
In-Reply-To: <dbbff170-db0a-4955-a024-978bb8dc3016@meta.com>
From: Vincent Guittot <vincent.guittot@linaro.org>
Date: Fri, 27 Jun 2025 15:32:32 +0200
X-Gm-Features: Ac12FXxBFesj2iOszhfB3qLpiayh1UF1J5oYaYs3wxecadgqZOnVFPGm4Bds-Zg
Message-ID: <CAKfTPtBinqRvLk4bvP4bbEZU1OcGV=DBnyxQ2SO9SumdwfV-aA@mail.gmail.com>
Subject: Re: [PATCH RFC] sched/fair: bump sd->max_newidle_lb_cost when newidle
 balance fails
To: Chris Mason <clm@meta.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Chris Mason <clm@fb.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 26 Jun 2025 at 16:55, Chris Mason <clm@meta.com> wrote:
>
> On 6/26/25 10:26 AM, Vincent Guittot wrote:
> > On Thu, 26 Jun 2025 at 12:58, Chris Mason <clm@meta.com> wrote:
>
> >> Got it, I'll play with that.  Vincent, was there a benchmark I can use
> >> to see if I've regressed the case you were focused on?
> >
> > It's not a public benchmark but I had some unitary tests with tasks
> > waiting on a busy CPU while other CPUs become idle for a "long" time
> > (but still less than 500us in average). This is even more true with
> > frequency scaling which will minimize the idle duration by decreasing
> > the frequency
>
> Ok, I don't think I'll be able to reliably recreate that on my own, can
> I ask you to rerun against the v2 I sent out?

Yes, I will run some tests

Vincent

>
> -chris
