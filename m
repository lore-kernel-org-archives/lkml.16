Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 417BC7E0FF
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 02:56:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738896969; cv=none; b=R1xZlJTxACtNu5qJbGfi7dYiMOPLv0PsDAvX6DtHQAYHM8i5N1ADLGBvQjQzMFIR36bA4lp3durMX05hhfpE1IXgPKA5AKV/y4pfNhUpCyk611J4z45dJXtzDMVZSXxa5KE9ywb0qjuvoLSYLFE6OuUx1izBLkkUkM+Xg9cVa7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738896969; c=relaxed/simple;
	bh=tsJDGSRj5KoV50TMFReXOZW5hteqI9h253hqVqaRLek=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ovr3LuGAWgXLi7MSA6G2bszqi+RXj1DiJ5z5lXtNqM7PCh0OcLBHeTuZnIMy7Ad+A2ybDaeSCcSQDYhIUUYcJq9hSX4AscDlN2Ij5NFLYAR6Ovzy8omHL9LLjVuSDYBzG+LE1dEWj2jkeGWROirS5xB0s3fdVNZm8RgReV0Zb3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=gYf+YWIu; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="gYf+YWIu"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-21ddab8800bso22906745ad.3
        for <linux-kernel@vger.kernel.org>; Thu, 06 Feb 2025 18:56:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1738896967; x=1739501767; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MOd4R4QD4yTRTYqUIyIfC9qaMS5rYTZOemKwXt2pRVo=;
        b=gYf+YWIu2dDlOtcq95Ysr2vQXBqntPbml3fRsAOzJKOtDVia9/0bxfcFEiixZaJGrO
         Az3ABhTq5dRKY7IqKLeNdW1Yioh7P156GS4BE5c/Jezp7/ZMwsetl4bosALI05YTvEQp
         H6UIkhvXMiis47ROiAsa+pPYxgkkzcq3uv/KA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738896967; x=1739501767;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MOd4R4QD4yTRTYqUIyIfC9qaMS5rYTZOemKwXt2pRVo=;
        b=qCbjHDpImL8tgD9ygTVBsZUL2liZI+0+KQfFh+pTC4WcP3ymEsdGIlaLB+dorjhIK9
         aq6vvSbivb1CTp3CwQ2r7ZiZVpPs3Q/TePq/9k/8cKuTtaXJXRg0vw7MBz3buWpoM+4x
         AZ0wevS5J759Q0J54zUQFirdC6NeRWWZiOCzRTnKjszsbwdfENgtAMya47hrlT+DdA/M
         B7++U9vgAcmzXiYUKmTo0PefgMNIxw7vFiJjJ0alLrS2yWdrNlLxnpAbTThCl/VDacx7
         RM8xEut4c59Ye3BVE5Ku5CTQ1cMY2gctfnq/WobkoA6ojmRj+7aGdSOlv0N/djqSNUfb
         E0Bw==
X-Forwarded-Encrypted: i=1; AJvYcCUmzBo2r6eS+uKv2XlKlSG51E4NlVE5UN4AxaUr6y7pmuDX5FWMedaEG0e1owTz6OUoEX4l5QrEe7B1UUw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwCESYs+lTOTzyKYZij67Yjoi2rBrLX1TDlUL/BQLfVQHF0dnYJ
	mRiCK8YHLyP3gTor6E1VFM0kURnuDplm3biTFhDtKU33wOD6+X1aqR1ag2zc4w==
X-Gm-Gg: ASbGncv2BsnEpxkywPHrWKmjVZBYWKMBdHJgcbd5WspxVfNTkdRa9VRa49Cdsf+vq3n
	P366u2Fy+l9Fgx4JB+WWl077oNgp0Z74msSJUIVxRJ9GMVVu7M7+wc3HsR30WsVQodNWGgqkrmi
	MA44LrEkB1y5US/lH0E5lExvrLGdNf4/4/heIbTU3j3iYBaUe0RI4SQkZs1v/RFP68xFnSAN1Zx
	+FGHW5MSnXp7PCc0kunS/CV4YslVuukY4CFQRwFM3EWwr1en4QVmzBi/XXaHXotv2WBh9YfPWLH
	mpXnwPtj4WiV6Tq17wc=
X-Google-Smtp-Source: AGHT+IGoEzmid0eg+e77/XKk9RTP/A15aAjm+SUgP6OzJG2D8+UvoM/vG7vUjR51J9sTmXBHfa2nEA==
X-Received: by 2002:a17:903:234e:b0:215:bb50:6a05 with SMTP id d9443c01a7336-21f4e1cb7b0mr22889305ad.9.1738896967436;
        Thu, 06 Feb 2025 18:56:07 -0800 (PST)
Received: from google.com ([2401:fa00:8f:203:28ab:cea4:aa8a:127a])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21f36881e14sm20056445ad.207.2025.02.06.18.56.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Feb 2025 18:56:06 -0800 (PST)
Date: Fri, 7 Feb 2025 11:56:01 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Yosry Ahmed <yosry.ahmed@linux.dev>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>, 
	Kairui Song <ryncsn@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Minchan Kim <minchan@kernel.org>, linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCHv4 02/17] zram: do not use per-CPU compression streams
Message-ID: <n3k4c6qurl7vuqenxhmtxtitkeszohrcpauobwxxc4cpgbfujg@jxrinduvof6p>
References: <20250131090658.3386285-1-senozhatsky@chromium.org>
 <20250131090658.3386285-3-senozhatsky@chromium.org>
 <CAMgjq7BFUrUY5Xq5Eks4ibqbWgJcca1vqB4kq=otQVyG=23FRw@mail.gmail.com>
 <ryc3rgu567q44d3ck4un5itf77i2os4rqx3ruohivaqscn3rrt@ms5xoipyi72q>
 <CAMgjq7DKveiCJVb4ACSaLFV0Q1_Yd+sbL_X2dgXz6QGYwuNRTw@mail.gmail.com>
 <ysqyikz2jhnvjkhmkgwekbmz6dykvjssut6n3t746tpsscursu@zc6rg5xgk6sp>
 <Z6TgSaYIf1DnOszP@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z6TgSaYIf1DnOszP@google.com>

On (25/02/06 16:16), Yosry Ahmed wrote:
> > So for spin-lock contention - yes, but that lock really should not
> > be so visible.  Other than that we limit the number of compression
> > streams to the number of the CPUs and permit preemption, so it should
> > be the same as the "preemptible per-CPU" streams, roughly.
> 
> I think one other problem is that with a pool of streams guarded by a
> single lock all CPUs have to be serialized on that lock, even if there's
> enough streams for all CPUs in theory.

Yes, at the same time it guards list-first-entry, which is not
exceptionally expensive.  Yet, somehow, it still showed up on
Kairui's radar.

I think there was also a problem with how on-demand streams were
constructed - GFP_KERNEL allocations from a reclaim path, which
is a tiny bit problematic and deadlock-ish.

> > The difference, perhaps, is that we don't pre-allocate streams, but
> > allocate only as needed.  This has two sides: one side is that later
> > allocations can fail, but the other side is that we don't allocate
> > streams that we don't use.  Especially secondary streams (priority 1
> > and 2, which are used for recompression).  I didn't know it was possible
> > to use per-CPU data and still have preemption enabled at the same time.
> > So I'm not opposed to the idea of still having per-CPU streams and do
> > what zswap folks did.
> 
> Note that it's not a free lunch. If preemption is allowed there is
> nothing holding keeping the CPU that you're using its data, and it can
> be offlined. I see that zcomp_cpu_dead() would free the compression
> stream from under its user in this case.

Yes, I took same approach as you did in zswap - we are holding the mutex
that cpu-dead is blocked on as long as the stream is being used.

struct zcomp_strm *zcomp_stream_get(struct zcomp *comp)
{
        for (;;) {
                struct zcomp_strm *zstrm = raw_cpu_ptr(comp->stream);

                /*
                 * Inspired by zswap
                 *
                 * stream is returned with ->mutex locked which prevents
                 * cpu_dead() from releasing this stream under us, however
                 * there is still a race window between raw_cpu_ptr() and
                 * mutex_lock(), during which we could have been migrated
                 * to a CPU that has already destroyed its stream.  If so
                 * then unlock and re-try on the current CPU.
                 */
                mutex_lock(&zstrm->lock);
                if (likely(zstrm->buffer))
                        return zstrm;
                mutex_unlock(&zstrm->lock);
        }
}

void zcomp_stream_put(struct zcomp_strm *zstrm)
{
        mutex_unlock(&zstrm->lock);
}

int zcomp_cpu_dead(unsigned int cpu, struct hlist_node *node)
{
        struct zcomp *comp = hlist_entry(node, struct zcomp, node);
        struct zcomp_strm *zstrm = per_cpu_ptr(comp->stream, cpu);

        mutex_lock(&zstrm->lock);
        zcomp_strm_free(comp, zstrm);
        mutex_unlock(&zstrm->lock);
        return 0;
}

> We had a similar problem recently in zswap and it took me a couple of
> iterations to properly fix it. In short, you need to synchronize the CPU
> hotplug callbacks with the users of the compression stream to make sure
> the stream is not freed under the user.

Agreed.
