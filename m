Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 805FB1EB9F9
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 22:04:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744322678; cv=none; b=k1aTGgc83v+aLA+B412rMEZtPmLMH2eGjj0c5PQ66A+YRxT6e4EMSAZDu27vlb7SPy+mSTeKBkxl4ZrRlLYbSQ6+xX4ze3G3MDx4o7QlU4bt57Zaf068jH4XOAu8tro/wS/uk/AMnhSVYq3/Ts48JnlUtN6PZv+BGLv9zuSSTMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744322678; c=relaxed/simple;
	bh=3uMBL4NPv3raozz5zKjQqEnw2j9SO97i6WwFa10I4Pg=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=K+RvHtr8k486lawTjyvyqqlI2Bog4ywUPyWamfLZNDrBUuW+/wLtmtgENt8aHFVh86N/fTE2caDXY5lgCnJux+mxiplMng9iXBkxEcIO92JRuOnShFTRBDbGPzXJV8WbYz9kWBHP82U5xPRLe7TpN4i1hxG9S4u23EKVMpxuW6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=IRzUVyAV; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="IRzUVyAV"
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-2242ade807fso20689835ad.2
        for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 15:04:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744322677; x=1744927477; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=7eShhCni2AeN9U5Jc2b4WOHTyOiv0aqWO9tX2xSw/mU=;
        b=IRzUVyAVyvLVBx/fBUB21UfdGMGZ4ygK4G/0p4c6p69cN0Ponb9WkWxSfBa0bpWVlg
         VHX0dlh8zZnB/BabPNiU8KzENBQ1YLIlVKa5olMFDJND0fmG4oS0a0XuZbDl3g7mVerZ
         aSGUCwXeyR5J7jksda4ovDXl01N85cW0Kf8CgXNWsOBgDw2cVwR8IZX4OH3Rs5ewevMj
         H53yNPMSdHhDawzRBq9yYUDGEzrKcamAAAdtHeWFeru20lcwutG+IlWT95634bzCpnCV
         bvPRZ59C31StyFM6SUfH4fu363XYxJBuNznXqARw/Yvzuq4E4utWWljjoyXwyIXsJDTK
         pBIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744322677; x=1744927477;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7eShhCni2AeN9U5Jc2b4WOHTyOiv0aqWO9tX2xSw/mU=;
        b=U0KAiTvrT5vgyzmbAFTPPAGy81e1wvAA4JMvlAQxFveKzF+Nv2JP8V/hG6uR5ldjE/
         nDIWf3j8E4GhMzw8AUFYEG+GOCA4WiCjHLvutC2Y4SpqvMJxhFlmQVphIyKXl5gNv2K4
         7Cnwf1mzSl4dwA3ZFgFvxI8OROzJf4x8SCS4zO6/h9YzabOJ2uTRJny3Q6dveyDk0yCv
         jyubr7WQG+A/Ut+DJ1g7dl8CliRYF+0Q53FZFksqbbomfyLALM2Lul3QyacHggD5kRq4
         s0YtsEuJ3TCWyR6PsrEge1tk5tOQzmtrahHaV9VDy4HQLOhow5EAMVdPSCEXAmCubrBe
         putw==
X-Forwarded-Encrypted: i=1; AJvYcCUvXYKrtY+sWVkl0L0Tsep+u8HIQAGFWWsfcexUcZfYBtk0tKhVwium/lug/udRXlLJ/j3ptA30u2POErw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxuyN3MnvcwNnzPL3V0Vf3NmGh9b/ueT+xSBD5q8f9L56AkLzn6
	4yzAgbKMULE3177QR+UoUENvUb5u5y9JVsLNI6xy8Hn6OQtFjHl9QtefA2lvCqrP8SeXt63esys
	q0w==
X-Google-Smtp-Source: AGHT+IE/nhiyEmsRhP2rb2VCXmUB28XKf+JD6SxynR/MURcWw+q3szzXjCCZ52+kyzlA5ipAqMNlMQqrrE8=
X-Received: from pltj8.prod.google.com ([2002:a17:902:76c8:b0:223:3f96:a29c])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:d481:b0:220:f59b:6e6
 with SMTP id d9443c01a7336-22bea495687mr4890535ad.8.1744322676625; Thu, 10
 Apr 2025 15:04:36 -0700 (PDT)
Date: Thu, 10 Apr 2025 15:04:35 -0700
In-Reply-To: <20250410152846.184e174f.alex.williamson@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250404211449.1443336-1-seanjc@google.com> <20250404211449.1443336-4-seanjc@google.com>
 <20250410152846.184e174f.alex.williamson@redhat.com>
Message-ID: <Z_hAc3rfMhlyQ9zd@google.com>
Subject: Re: [PATCH 3/7] irqbypass: Take ownership of producer/consumer token tracking
From: Sean Christopherson <seanjc@google.com>
To: Alex Williamson <alex.williamson@redhat.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, kvm@vger.kernel.org, virtualization@lists.linux.dev, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Oliver Upton <oliver.upton@linux.dev>, David Matlack <dmatlack@google.com>, 
	Like Xu <like.xu.linux@gmail.com>, Yong He <alexyonghe@tencent.com>
Content-Type: text/plain; charset="us-ascii"

On Thu, Apr 10, 2025, Alex Williamson wrote:
> On Fri,  4 Apr 2025 14:14:45 -0700
> Sean Christopherson <seanjc@google.com> wrote:
> > diff --git a/include/linux/irqbypass.h b/include/linux/irqbypass.h
> > index 9bdb2a781841..379725b9a003 100644
> > --- a/include/linux/irqbypass.h
> > +++ b/include/linux/irqbypass.h
> > @@ -10,6 +10,7 @@
> >  
> >  #include <linux/list.h>
> >  
> > +struct eventfd_ctx;
> >  struct irq_bypass_consumer;
> >  
> >  /*
> > @@ -18,20 +19,20 @@ struct irq_bypass_consumer;
> >   * The IRQ bypass manager is a simple set of lists and callbacks that allows
> >   * IRQ producers (ex. physical interrupt sources) to be matched to IRQ
> >   * consumers (ex. virtualization hardware that allows IRQ bypass or offload)
> > - * via a shared token (ex. eventfd_ctx).  Producers and consumers register
> > - * independently.  When a token match is found, the optional @stop callback
> > - * will be called for each participant.  The pair will then be connected via
> > - * the @add_* callbacks, and finally the optional @start callback will allow
> > - * any final coordination.  When either participant is unregistered, the
> > - * process is repeated using the @del_* callbacks in place of the @add_*
> > - * callbacks.  Match tokens must be unique per producer/consumer, 1:N pairings
> > - * are not supported.
> > + * via a shared eventfd_ctx).  Producers and consumers register independently.
> > + * When a producer and consumer are paired, i.e. a token match is found, the
> > + * optional @stop callback will be called for each participant.  The pair will
> > + * then be connected via the @add_* callbacks, and finally the optional @start
> > + * callback will allow any final coordination.  When either participant is
> > + * unregistered, the process is repeated using the @del_* callbacks in place of
> > + * the @add_* callbacks.  Match tokens must be unique per producer/consumer,
> > + * 1:N pairings are not supported.
> >   */
> >  
> >  /**
> >   * struct irq_bypass_producer - IRQ bypass producer definition
> >   * @node: IRQ bypass manager private list management
> > - * @token: opaque token to match between producer and consumer (non-NULL)
> > + * @token: IRQ bypass manage private token to match producers and consumers
> 
> The "token" terminology seems a little out of place after all is said
> and done in this series.  

Ugh, yeah, good point.  I don't know why I left it as "token".

> Should it just be an "index" in anticipation of the usage with xarray and
> changed to an unsigned long?  Or at least s/token/eventfd/ and changed to an
> eventfd_ctx pointer?

My strong vote is for "struct eventfd_ctx *eventfd;"
