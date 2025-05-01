Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C930B215191
	for <linux-kernel@vger.kernel.org>; Thu,  1 May 2025 16:52:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746118323; cv=none; b=lUVaMAgY0EkO3sUutF4ctp+wqnpOuvL4AxY+ApmEE4rtoKm8M036/7R88UAvC+XufP4Z2WqJynrpWDPyuKkh0yi+8Gsc8BgTyAGDQ37JOUjwozuguqgWOYNX44jBSzp5YyJkxXsd8kdyt9xJB2WoE/t/O+iMgPkpnns9/oHrWRY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746118323; c=relaxed/simple;
	bh=lcuM37nEEfw1eVtAi17oW/TmlS7ujhxVr0s+lodaBY0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QRTwP1qhitq+NpM3+S5IwVTcf/Ky9FKB0mCDgfBsifyXNq6fD49QtjOYqE+FMQ+hzcZIkjIBjrtzJhbDrxagsljhAhGtaaYT+BMaPhcR/yDfihPR0MBl75cgBSxuaBbEIA+rUG1lfYFq5bLPqmFLIRco124UmWAP4pwWAw1jUSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=wrKtWUIX; arc=none smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="wrKtWUIX"
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-476ae781d21so14799771cf.3
        for <linux-kernel@vger.kernel.org>; Thu, 01 May 2025 09:52:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746118320; x=1746723120; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a2+qh8FDDcMl0mU8xoMNh8k3pyM8a4zq+RRhfHleKP0=;
        b=wrKtWUIX1X7uEvPtpLJyj/gaBcTih9IpzJYq9PYZgH9So4KWylzjhnusdD05Z7H6MZ
         2iWs79MeSeg2FZ+ZOcz9fPEC7CHuwkMxlVP+GauV9BbfEYl/rxMYLmR7WSQ8MHAFh6Ad
         xNKTPWIARLnmVcuRQLEw7P62lT4P+eX8CEB7zITBoJBYFBw8bPOfR8KmFu9Cfl4L2BDq
         DUoIC6SjKfigWhfmY5+pk2PL8EteY7OKLaKrArBR9e0FvpjIN9xa6G3uQqRKj1OVzS9f
         zlx39UvMHroFoGmX86i80TjPt2WNrUx3IGzL2JdqzbzcZmxNImuF7b7WnXA3wV8uvcfY
         gYlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746118320; x=1746723120;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a2+qh8FDDcMl0mU8xoMNh8k3pyM8a4zq+RRhfHleKP0=;
        b=k27BFGLW0lU+LHBWGo+NlKr+FWG8f7x/8WihXSIN69/wDFSx1coQey8ilsaKSDYxCs
         vUadn485hWDGSUDBR0cq5AWFjOCoxBtE8InjiwlH6CRrSJgsKrIDKJM4JtbxtuEJVGhI
         JR3h5McpNthn4Di+SjDzODJtvnrEie8b4v1ME5GDgpUcgvvANk0bEAjvH8WXYGHeVj1o
         sk2dODQjqd9CGkn3syAjAh/rcBABHA7Xr4jpOGdvI8QeRLiEMzuve8za1n2L1gALuP3A
         sd3LPzElYDgRLzRnantvdoAjuwtpovPHPE3pBl3VSEgPOn6JycTTHHsY2xnGQ9Jb/cok
         1o6A==
X-Forwarded-Encrypted: i=1; AJvYcCVPZ0H+kjcIDU3K9pFYoaus3oQQN6wbr4/129q3PQWXKZmG6APyDvbIprw9/11z0qCwdJNrSfXCZf3L8lM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwoPCZjStUvLK7rNNKVRorcN4+uwq1h7wfrSUu5CiLrdLkyhrGh
	TwPyNGazc6IP4GnBRsvwCm3jgfrWylGxyYJpATX7xuuOeheRWEGPrKrhEYg3Qn4xpGfD7z7QfRe
	BIuZmZqJ2v9zBbCRQFbUohxZ46yILiY8RbPil
X-Gm-Gg: ASbGncvsSYKm4f7e8g89TFa/FpvxkNqR6ntp6rda5JpCvk18Bowzd5t0l9z1vWtAkln
	5Kyo3lSoe2k1WpAnuHi2usgoUuiieZCBYsrqu99LDXy7u3yAbd/FR5jTJF0ILpo3J0rTLEEpkrL
	gWNxsRHxgeZQMo3yLD8xPxKtY=
X-Google-Smtp-Source: AGHT+IHwKH7bRC/TqD5cR/AUaiV/3bOZWGDCYig2ZUzkUVAm+8UnykCncFDQcJwcNffRAeiBD6cFzN1kckSuD7KOAbs=
X-Received: by 2002:a05:6214:2483:b0:6e6:6103:f708 with SMTP id
 6a1803df08f44-6f4fe131a89mr124885996d6.38.1746118320270; Thu, 01 May 2025
 09:52:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250428195532.1590892-1-brianvv@google.com> <20250501151616.GA3339421@horms.kernel.org>
In-Reply-To: <20250501151616.GA3339421@horms.kernel.org>
From: Brian Vazquez <brianvv@google.com>
Date: Thu, 1 May 2025 12:51:48 -0400
X-Gm-Features: ATxdqUEOGH-j1CFr8QL7QMirjvKCDO3-hjrj3ELuS3nArE1V-dBcyC9tmga7-Ek
Message-ID: <CAMzD94SNJe3QcLgNCPtVqDa69B7qcghcBkSOPWzV43d_XAeYuQ@mail.gmail.com>
Subject: Re: [iwl-net PATCH v2] idpf: fix a race in txq wakeup
To: Simon Horman <horms@kernel.org>
Cc: Brian Vazquez <brianvv.kernel@gmail.com>, Tony Nguyen <anthony.l.nguyen@intel.com>, 
	Przemek Kitszel <przemyslaw.kitszel@intel.com>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	intel-wired-lan@lists.osuosl.org, David Decotigny <decot@google.com>, 
	Anjali Singhai <anjali.singhai@intel.com>, Sridhar Samudrala <sridhar.samudrala@intel.com>, 
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
	emil.s.tantilov@intel.com, Josh Hay <joshua.a.hay@intel.com>, 
	Luigi Rizzo <lrizzo@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 1, 2025 at 11:16=E2=80=AFAM Simon Horman <horms@kernel.org> wro=
te:
>
> On Mon, Apr 28, 2025 at 07:55:32PM +0000, Brian Vazquez wrote:
> > Add a helper function to correctly handle the lockless
> > synchronization when the sender needs to block. The paradigm is
> >
> >         if (no_resources()) {
> >                 stop_queue();
> >                 barrier();
> >                 if (!no_resources())
> >                         restart_queue();
> >         }
> >
> > netif_subqueue_maybe_stop already handles the paradigm correctly, but
> > the code split the check for resources in three parts, the first one
> > (descriptors) followed the protocol, but the other two (completions and
> > tx_buf) were only doing the first part and so race prone.
> >
> > Luckily netif_subqueue_maybe_stop macro already allows you to use a
> > function to evaluate the start/stop conditions so the fix only requires
> > the right helper function to evaluate all the conditions at once.
> >
> > The patch removes idpf_tx_maybe_stop_common since it's no longer needed
> > and instead adjusts separately the conditions for singleq and splitq.
> >
> > Note that idpf_rx_buf_hw_update doesn't need to check for resources
> > since that will be covered in idpf_tx_splitq_frame.
>
> Should the above read idpf_tx_buf_hw_update() rather than
> idpf_rx_buf_hw_update()?

Nice catch, that's a typo indeed.

>
> If so, I see that this is true when idpf_tx_buf_hw_update() is called fro=
m
> idpf_tx_singleq_frame(). But is a check required in the case where
> idpf_rx_buf_hw_update() is called by idpf_tx_singleq_map()?

No, the check is not required. The call is at the end of
idpf_tx_singleq_map at that point you already checked for resources
and you're about to send the pkt.

>
> >
> > To reproduce:
> >
> > Reduce the threshold for pending completions to increase the chances of
> > hitting this pause by changing your kernel:
> >
> > drivers/net/ethernet/intel/idpf/idpf_txrx.h
> >
> > -#define IDPF_TX_COMPLQ_OVERFLOW_THRESH(txcq)   ((txcq)->desc_count >> =
1)
> > +#define IDPF_TX_COMPLQ_OVERFLOW_THRESH(txcq)   ((txcq)->desc_count >> =
4)
> >
> > Use pktgen to force the host to push small pkts very aggressively:
> >
> > ./pktgen_sample02_multiqueue.sh -i eth1 -s 100 -6 -d $IP -m $MAC \
> >   -p 10000-10000 -t 16 -n 0 -v -x -c 64
> >
> > Fixes: 6818c4d5b3c2 ("idpf: add splitq start_xmit")
> > Signed-off-by: Josh Hay <joshua.a.hay@intel.com>
> > Signed-off-by: Brian Vazquez <brianvv@google.com>
> > Signed-off-by: Luigi Rizzo <lrizzo@google.com>
>
> ...
