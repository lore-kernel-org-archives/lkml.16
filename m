Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C5961E008B
	for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 20:59:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745009953; cv=none; b=pw30K7or9mq7XpdQd7DDdQUUMosuChLzWrkIyGON3zqntMd54V2/xQwquoz2A/WSCIWXwi1LaGBBL0+EpZmNYTHjA898JcRq+gYSGRMczirbIKZaYgKWFXFIQeoXZNAsm/gw7Y6++uS3wxnKJnRt1hW9+1iIUkTSYX0UTCjAVx4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745009953; c=relaxed/simple;
	bh=lApZN5z9p0s54CynvRVxK9ennA5ELn9eA4SaRMP6RvA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pJ1y/2F568NdTn8G4IT9Ut2Eg75Usda9vA63L1F9jJgHKij8e75g9mZdJqJwpkKY2vEQ19y/S5zvtQuNKPduMRKZnfjDHkyscCR94vexF0yMXHPX4R1XBevoNQjYHb41fxaxwUmQdQtKbzzRKn4/atIujL3lpgz5xID95H2H6SA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=kayVaHJL; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="kayVaHJL"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-acb415dd8faso357256666b.2
        for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 13:59:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745009950; x=1745614750; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=lApZN5z9p0s54CynvRVxK9ennA5ELn9eA4SaRMP6RvA=;
        b=kayVaHJLHvQEWG8+3kD4Ccd6DFkx809e+LSqqpDlqOJyBvf/8AvUEwABboFcIooMq8
         GXsYL2CmwlZr1XwFjZv7BML+x6boVhlgtyQv2KeKK03GXBMUfwqov6qP24uPSuJ7cbH0
         VXu3TG9OkYf6ET+ERYBHkphofpREzPF+DH7vgXy+ZnU9cIH8nOJtjs9+dAUN9pV0jO06
         Io8UI0dmTl0mktI8TsQm28PfkMRUSPlqe1oBX4V+pUI2KewFqzgFYLDqjXsltGQ0BUmo
         NxkqLqdEx1s6WvMiCMm/J32Sxs1QXlDNfQ7KB1yUWG2R4Pi9Glsp1avq025HSIVVhWv3
         xwtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745009950; x=1745614750;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lApZN5z9p0s54CynvRVxK9ennA5ELn9eA4SaRMP6RvA=;
        b=wLeFoK2t0mDye22RNQlkyPw4NjE+WkemG9ps7v4ThSWLASPifdfk4pT5YWC4rwFqhW
         aKV/c3vRnIUdgvl4KhWhAVB6JxwSjPmaBG/s8mkh5V3DIn8JpnNiT6h711vYbjdsp/+z
         UqkDGFPcGtX7YtyWfk27eXMNbTj3o3We9gMH8VeBuxIyqfwTHUbIQW73EG53pEVWRnl3
         ot4FCLpk+q9rOFjBPl0piWOqwRHYw9XBmDwtSWXxP+iXPRVAiAmLoDZW1c9nYmozaq1i
         NxdtdP2wev81xts+YBiT/8ELQBNZJ8cDKHrGrBpsgqc5YO+YiE2Xb24s7z/fG28/mjlw
         ymbQ==
X-Forwarded-Encrypted: i=1; AJvYcCXSPJTm/GsBt5aNsDvjzH9/1N5Y8h5J3EPxyCoNS+zgm+vFXefKYTWbw80BZiINQcFUL1b4OrkHnNvA5TI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzWgmCrews0+2wE6uwZKxPCDRX8dmPnn3MstuzXUXMWMRWZLCBR
	y/yrzYvkjPY1NAotbcX4HimBHGM8sA08UGsSpf0PRM3rnriQAJjHlYmWsLRwbYhrqKKKZZ7iEbN
	Gr/ISk94z835t7Mz5H1urTA5ScrZ1WTx0yMIe
X-Gm-Gg: ASbGncuDaFu2xsBCllYAO4dEOPK4VY+balslXDlx7lBcSqefqGDyn3SC3f7UxgB0jOT
	4JbCODSMi1hKpV8en7SSsfVr4Lz+4ob3IeDBa/Mr+E0qmjL3AbcGrdY8aT8K+ctc+mGZ+7zEke3
	bMuUGJU9nZ6eacIe6Y+5BbdBHy8N9YPUnhlw4oGSLgqFZqj/NnlruuGoIhpM3OIQ==
X-Google-Smtp-Source: AGHT+IGM9HVisrkPvo6yjNR1VPrJS62wb1eSKPM8h5GjjkwKRX0V6HlORbk+zzka1e13yuuQD0n31dapGIhq/Zmiw6I=
X-Received: by 2002:a17:906:c10f:b0:ac6:f6e2:7703 with SMTP id
 a640c23a62f3a-acb74ad2854mr336671866b.8.1745009950398; Fri, 18 Apr 2025
 13:59:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250402212904.8866-1-zecheng@google.com> <dad0822a-5e0b-4518-a246-a3820787ed87@linux.ibm.com>
In-Reply-To: <dad0822a-5e0b-4518-a246-a3820787ed87@linux.ibm.com>
From: ZECHENG LI <zecheng@google.com>
Date: Fri, 18 Apr 2025 16:58:59 -0400
X-Gm-Features: ATxdqUFEUWs-xC9dnUTuErgsn9pCUB32fjwzolFznMRicHSRccISOX5B_fyG8t8
Message-ID: <CAJUgMyLDwyK-WgNFOr7bGmXPG9eAEnG7mNtjfPSTeJnJT8bAVg@mail.gmail.com>
Subject: Re: [RFC PATCH 0/2] sched/fair: Reorder scheduling related structs to
 reduce cache misses
To: 20250402212904.8866-1-zecheng@google.com
Cc: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>, 
	Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>, 
	Dietmar Eggemann <dietmar.eggemann@arm.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, 
	Valentin Schneider <vschneid@redhat.com>, Xu Liu <xliuprof@google.com>, 
	Blake Jones <blakejones@google.com>, Josh Don <joshdon@google.com>, linux-kernel@vger.kernel.org, 
	Madadi Vineeth Reddy <vineethr@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"

Hi Madadi Vineeth Reddy,

> This patch is based on optimizations by reordering for 64 byte systems.
> In case of 128 byte L1 D-cache systems like Power10, this might or might
> not be beneficial. Moreover lot of space(almost half) would be wasted
> on the cache line due to APIs like `__cacheline_group_begin_aligned`
> and `__cacheline_group_end_aligned` that may restrict size to 64 bytes.
>
> Since this is in generic code, any ideas on how to make sure that
> other architectures with different cache size don't suffer?

We propose to conditionally align to the cacheline boundary only when
the cacheline size is 64 bytes, since this is the most common size.

For architectures with 128-byte cachelines (like PowerPC), this
approach will still collocate the hot fields, providing some
performance benefit from improved locality, but it will not enforce
alignment to the larger 128-byte boundary. This avoids wasting cache
space on those architectures due to padding introduced by the
alignment, while still gaining benefits from collocating frequently
accessed fields.

> Due to the reordering of the fields, there might be some workloads
> that could take a hit. May be try running workloads of different
> kinds(latency and throughput oriented) and make sure that regression
> is not high.

For workloads running without a cgroup hierarchy, we expect a small
performance impact. This is because there is only one cfs_rq per CPU
in this scenario, which is likely in cache due to frequent access.

For workloads with the cgroup hierarchy, I have tested sysbench threads
and hackbench --thread, there are no obvious regression.

Heavy load on 1024 instances of sysbench:
Latency (ms), after-patch, origial
avg avg: 2133.51, 2150.97
avg min: 21.9629, 20.9413
avg max: 5955.8, 5966.78

Avg runtime for 1024 instances of ./hackbench --thread -g 2 -l 1000
in a cgroup hierarchy:
After-patch: 34.9458s, Original: 36.8647s

We plan to include more benchmark results in the v2 patch. Do you have
suggestions for other benchmarks you would like us to test?

Regards,
Zecheng
