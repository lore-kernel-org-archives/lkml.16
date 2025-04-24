Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E031927F73C
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 14:24:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745504688; cv=none; b=WgdB9AjYdZsyUpLhp53UIxftAG9nYnKMzberRp6o4/7LM+MCOgIcPSU/nk6dXMONhAS1U4cC8kNdZMvU1EmIG2cDmk3CW6W9WGk4HDvQ4N4BH2aorHBa6Y1+YXpPDWXAR7eG0JXQ1vJ2QC0CblU7f/rQ9pEomjXXVnUH/NvUTPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745504688; c=relaxed/simple;
	bh=ITEJU5E+U8k3jYhXGW3lQ1NkLPi5MlRGY624NYpem6s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OtFRLVtw3pRViDlXMdCNGvwM5vuq3ZyyW4LhpzY7zlYnSc/Y10TcIYi0CLPdCj44B+smHhR8wZzfnSbn/Qv0/EeVzF+jvcOuPMuP6Spf8ky37dw2eW5nASgubDtgjVoKyE68yLXzM6At0tCdFN6NGrvY60UcrFG1GTro+llHNaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=MWLPUnfp; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="MWLPUnfp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745504685;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nV8jVW/8nt8ZwTGGNIL9yTSPGZZ29xDmvRWgbdJwWX4=;
	b=MWLPUnfpcvNHHJ1WBQzKNa+lMz9pMQUPOxryCpQW87xhpJbLZFeNeNgr/cEJ8IygNa0fqK
	4uWYxOF5s2ShK96NGJ94luvvc3gNo7Si5lfM/Y8jp0ACH4T+i/XgOfOog5eKBvbet2ZtR4
	ApMiqvEcTKyIYrnhSG9ZU5O+I5ypgOg=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-533-gPwoh4amOXqNYfGmWhuLBg-1; Thu, 24 Apr 2025 10:24:42 -0400
X-MC-Unique: gPwoh4amOXqNYfGmWhuLBg-1
X-Mimecast-MFC-AGG-ID: gPwoh4amOXqNYfGmWhuLBg_1745504681
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-3912fc9861cso385632f8f.1
        for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 07:24:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745504681; x=1746109481;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nV8jVW/8nt8ZwTGGNIL9yTSPGZZ29xDmvRWgbdJwWX4=;
        b=SgkFXfuLwOFCcrnmDmIrvPYOL5XPV2aiUHRg/2ZV8SfxyYcfK9qhvPEEjt29oPuqmn
         pmyX+5YTAhGNnbq7F0KeWFru477ofZwfrKKGWv6nl7Jg3/Ex7p42b+zShcB/jszKSsSE
         siAg4ex9+u9T99z8hL93iVOhonIE5orS/nnIyVgJZNRNrK263hSOttggZfV3D9DyTkzf
         kuY62mwhtpIk9T4u/R1oqT/rqPn3c57y5rL8ggTsy11EoVHcVRmPFqvhhG361QSSW7Ln
         HO48c28kIcwOOW+r+LVbnvSSfRd+/OAxPL9yZYdacuhWXDZWsHcw4AeJakkOqQPZ8ubC
         7Adg==
X-Forwarded-Encrypted: i=1; AJvYcCXNEftkZ/PrK267ChUgcbWL+TSAekN9faNeDUSULDiWgV/jTQYrv1RtiAW8yihY3uQmFY/+Ym6jyWTS7ss=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx00QSLp/Nm0asdRhvvS2vCbgGyuMrGJNTPmq0jkpQnFKe7cQNL
	tXZvASd7NBqQRQ86yX6QAansng5lZqLvgAgsNi7d8wRPVR0RdBAmLqCLwH/69vNPyLw7XZ9c/4f
	2aOoZ+RdbhakGU76sVhLbQF86jw8eEUNN/5rZkqUG2kkjPZIUO6Pwt5BHTXhrdw==
X-Gm-Gg: ASbGnctndO00TxqJTDErfsD4iYTj+k4P8lXpNwvQTjsG8IKC1jnaJn5dwL5QM4bRQSy
	+xhFRhtM6DPcsbAkv1ieXM907C+SnIv0iQf1IbMwNdy13vIDHmfLKkYrNaAz++XkyvGxMWoOwUw
	0naX2uoFcRFxseNHOKaPz+J1vqaJSoiwtdQh2MoQgX2S76OjUhqyuVIVV/wQWd/C91I7LNaSbH+
	wcjJcIU3bB8aXZg7LqSNApYCefr4BYjT/bOy3v9VvkPx6AZAiabglAJ6Wx0VTh+qH6atMOvPbUH
	Jlq08Q==
X-Received: by 2002:a05:6000:240a:b0:39a:ca0b:e7c7 with SMTP id ffacd0b85a97d-3a06cfaba23mr2493036f8f.36.1745504681013;
        Thu, 24 Apr 2025 07:24:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEwBzD5hh+2Z62EditO+ortaghgO8pvR6NguSzN5/Fukq1qShODNoWcevMtBiQSBYPeBcmOdg==
X-Received: by 2002:a05:6000:240a:b0:39a:ca0b:e7c7 with SMTP id ffacd0b85a97d-3a06cfaba23mr2493006f8f.36.1745504680461;
        Thu, 24 Apr 2025 07:24:40 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc0:1517:1000:ea83:8e5f:3302:3575])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a06d4a7ff8sm2347237f8f.13.2025.04.24.07.24.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 07:24:39 -0700 (PDT)
Date: Thu, 24 Apr 2025 10:24:37 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jon Kohler <jon@nutanix.com>
Cc: Paolo Abeni <pabeni@redhat.com>, Jason Wang <jasowang@redhat.com>,
	Eugenio =?iso-8859-1?Q?P=E9rez?= <eperezma@redhat.com>,
	"kvm@vger.kernel.org" <kvm@vger.kernel.org>,
	"virtualization@lists.linux.dev" <virtualization@lists.linux.dev>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH net-next v2] vhost/net: Defer TX queue re-enable until
 after sendmsg
Message-ID: <20250424102351-mutt-send-email-mst@kernel.org>
References: <20250420010518.2842335-1-jon@nutanix.com>
 <a0894275-6b23-4cff-9e36-a635f776c403@redhat.com>
 <20250424080749-mutt-send-email-mst@kernel.org>
 <1CE89B73-B236-464A-8781-13E083AFB924@nutanix.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1CE89B73-B236-464A-8781-13E083AFB924@nutanix.com>

On Thu, Apr 24, 2025 at 01:53:34PM +0000, Jon Kohler wrote:
> 
> 
> > On Apr 24, 2025, at 8:11 AM, Michael S. Tsirkin <mst@redhat.com> wrote:
> > 
> > !-------------------------------------------------------------------|
> >  CAUTION: External Email
> > 
> > |-------------------------------------------------------------------!
> > 
> > On Thu, Apr 24, 2025 at 01:48:53PM +0200, Paolo Abeni wrote:
> >> On 4/20/25 3:05 AM, Jon Kohler wrote:
> >>> diff --git a/drivers/vhost/net.c b/drivers/vhost/net.c
> >>> index b9b9e9d40951..9b04025eea66 100644
> >>> --- a/drivers/vhost/net.c
> >>> +++ b/drivers/vhost/net.c
> >>> @@ -769,13 +769,17 @@ static void handle_tx_copy(struct vhost_net *net, struct socket *sock)
> >>> break;
> >>> /* Nothing new?  Wait for eventfd to tell us they refilled. */
> >>> if (head == vq->num) {
> >>> + /* If interrupted while doing busy polling, requeue
> >>> + * the handler to be fair handle_rx as well as other
> >>> + * tasks waiting on cpu
> >>> + */
> >>> if (unlikely(busyloop_intr)) {
> >>> vhost_poll_queue(&vq->poll);
> >>> - } else if (unlikely(vhost_enable_notify(&net->dev,
> >>> - vq))) {
> >>> - vhost_disable_notify(&net->dev, vq);
> >>> - continue;
> >>> }
> >>> + /* Kicks are disabled at this point, break loop and
> >>> + * process any remaining batched packets. Queue will
> >>> + * be re-enabled afterwards.
> >>> + */
> >>> break;
> >>> }
> >> 
> >> It's not clear to me why the zerocopy path does not need a similar change.
> > 
> > It can have one, it's just that Jon has a separate patch to drop
> > it completely. A commit log comment mentioning this would be a good
> > idea, yes.
> 
> Yea, the utility of the ZC side is a head scratcher for me, I can’t get it to work
> well to save my life. I’ve got a separate thread I need to respond to Eugenio
> on, will try to circle back on that next week.
> 
> The reason this one works so well is that the last batch in the copy path can
> take a non-trivial amount of time, so it opens up the guest to a real saw tooth
> pattern. Getting rid of that, and all that comes with it (exits, stalls, etc), just
> pays off.
> 
> > 
> >>> @@ -825,7 +829,14 @@ static void handle_tx_copy(struct vhost_net *net, struct socket *sock)
> >>> ++nvq->done_idx;
> >>> } while (likely(!vhost_exceeds_weight(vq, ++sent_pkts, total_len)));
> >>> 
> >>> + /* Kicks are still disabled, dispatch any remaining batched msgs. */
> >>> vhost_tx_batch(net, nvq, sock, &msg);
> >>> +
> >>> + /* All of our work has been completed; however, before leaving the
> >>> + * TX handler, do one last check for work, and requeue handler if
> >>> + * necessary. If there is no work, queue will be reenabled.
> >>> + */
> >>> + vhost_net_busy_poll_try_queue(net, vq);
> >> 
> >> This will call vhost_poll_queue() regardless of the 'busyloop_intr' flag
> >> value, while AFAICS prior to this patch vhost_poll_queue() is only
> >> performed with busyloop_intr == true. Why don't we need to take care of
> >> such flag here?
> > 
> > Hmm I agree this is worth trying, a free if possibly small performance
> > gain, why not. Jon want to try?
> 
> I mentioned in the commit msg that the reason we’re doing this is to be
> fair to handle_rx. If my read of vhost_net_busy_poll_try_queue is correct,
> we would only call vhost_poll_queue iff:
> 1. The TX ring is not empty, in which case we want to run handle_tx again
> 2. When we go to reenable kicks, it returns non-zero, which means we
> should run handle_tx again anyhow
> 
> In the ring is truly empty, and we can re-enable kicks with no drama, we
> would not run vhost_poll_queue.
> 
> That said, I think what you’re saying here is, we should check the busy
> flag and *not* try vhost_net_busy_poll_try_queue, right?

yes

> If so, great, I did
> that in an internal version of this patch; however, it adds another conditional
> which for the vast majority of users is not going to add any value (I think)
> 
> Happy to dig deeper, either on this change series, or a follow up?

it just seems like a more conservate thing to do, given we already did
this in the past.

> > 
> > 
> >> @Michael: I assume you prefer that this patch will go through the
> >> net-next tree, right?
> >> 
> >> Thanks,
> >> 
> >> Paolo
> > 
> > I don't mind and this seems to be what Jon wants.
> > I could queue it too, but extra review  it gets in the net tree is good.
> 
> My apologies, I thought all non-bug fixes had to go thru net-next,
> which is why I sent the v2 to net-next; however if you want to queue
> right away, I’m good with either. Its a fairly well contained patch with
> a huge upside :) 
> 
> > 
> > -- 
> > MST
> > 
> 

