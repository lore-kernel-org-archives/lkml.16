Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DE1027A939
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 16:24:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745857476; cv=none; b=RAR+CSp+/iiZhDq6MIkA1t5ETZ3/mf1avY99JcGAmhIkrN0GalzK8W7pfJD3lcPvClSp1zCKDySMpvTTxMHRenbBDKz0zsWLsa9fzFNkd9yvPL8NCe1/k/2WJxzZ5/tHJPt7+g9la0redWTCQ5I6fU68NknyPQTexSqiXe/34Qg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745857476; c=relaxed/simple;
	bh=gx7RtZXtXcXDCgsMk2d3JVtds6JRV5t+fEp5vL+9MQ4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BIZYP/Ek9ytbi9ARwq4ZuYuiZySPxSzLs15Cm/zUr69AeC+fcgrAX8AChOqwXhO50Po2iirLjjZ+ywoe8bR7f6ENiY1AY1qYzwzi/h4Zrh4y2uATrrp9vHfnobAkNevOLC9O1QjPpTgR6swTfmyQcFDvj7kOZYINzjMYlR3bfiY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=RjpQpXPu; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="RjpQpXPu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745857472;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=KRdiWHlG77Us6l2oFM6nu2eUggr09dOOElY1pvowm4s=;
	b=RjpQpXPuCWq6gL9UFiXj/hsOoO/3pwepsXb756559WTebj+OHTS0QRcy/j+0F95QRE8qB7
	L3aOq6WiCWd35U7A1nevgx+xu6DXDUEy0kD7H+qm+v6M1dp2u0d76QRlfzEowznxCS/edI
	h/gurOtPqpRYeJ4GVJcy2YfjD1+QLzI=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-428-9ryKjGSPM7OGF2YR4kqDnw-1; Mon, 28 Apr 2025 12:24:28 -0400
X-MC-Unique: 9ryKjGSPM7OGF2YR4kqDnw-1
X-Mimecast-MFC-AGG-ID: 9ryKjGSPM7OGF2YR4kqDnw_1745857467
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4768488f4d7so70275631cf.0
        for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 09:24:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745857467; x=1746462267;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KRdiWHlG77Us6l2oFM6nu2eUggr09dOOElY1pvowm4s=;
        b=jJdKOYuPf+kQQho9Wf7Riflu7Gr0bNIbMnSD2IbWcu39rDJY0JSl8dmTSzNZ6XDn6g
         fk9oWmOfshLQYlY5OEQ4Hvhv8kUm1OHCf16J7WSLyavvFQ0K80vkViUd43yfsOVuiAnj
         axSrlb4quMTwdt/HOPx5ymmLjUGoTRCL9012LE8TAw2S0V6sGwXppVGH87tvYRvTE6WV
         YNpbCtTUJwq+jrVZREOVAYKlvhPt3tfdDdZrpSoSpmvxoU6CUGCw5/kU9DhPpAX0dbXE
         wNZMFQanbP8LRgzUFARukQnCiOegySpnC6VIQwOgLiffrHFpOoSiyUSahHrCOKBVrkaH
         1J9w==
X-Gm-Message-State: AOJu0YyPftS0PTZhG7fYqLQxxvLNlOrIaOCO2C8Gfs4138bvblYEJI31
	yQ56aWjXNdBSPGTDW6Hzo39ddnSZO19DKbqOMMwyIIfqDXApQKM655jhJMGePmumbAqx+Pu/xdJ
	ra3VQcEkiCIbfXbXnNB+OSlIyHqqNGHCpkklIgf5kQvoXYnv78WbjEhQIlQuz037P7hRguQ==
X-Gm-Gg: ASbGncvZLzCEVLwoICrj3mu0PEZYMbBYSb7DrcO7wqHBVzZ8lhUEvvwihF0M59l9UQ0
	dBwB0TqPNPy7JztHMQhAzf+Wsfp50dUY0q3lN744+yzc2X0C7ikKIX5gbBLSxUUs5oyj03jHfyb
	z5KX+UbXhTktdz5tQmCHygRSqFh5/PgsyZFXVGxRc9JVLNCIDH5J8r6UNW1Jbm+y4NBLLjDpyph
	DEubzqCboS6hjJzBADVWcn9b5wmNZ89vRDmOOWrtYiUWPxpnbaJUM1DP1JgUhAep4LCx1wa+Ew9
	Le4=
X-Received: by 2002:ac8:5885:0:b0:476:8ee8:d8a1 with SMTP id d75a77b69052e-48025238433mr189998661cf.45.1745857467084;
        Mon, 28 Apr 2025 09:24:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEbtfAYJXqWijuqC9qE1XAYSFE+Ms0Ul7NtVdmGjB5I/RjjP9FCiSLL88Eit0raUnSdKc6qiA==
X-Received: by 2002:ac8:5885:0:b0:476:8ee8:d8a1 with SMTP id d75a77b69052e-48025238433mr189998431cf.45.1745857466831;
        Mon, 28 Apr 2025 09:24:26 -0700 (PDT)
Received: from x1.local ([85.131.185.92])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-47e9eaf264dsm70223561cf.10.2025.04.28.09.24.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 09:24:26 -0700 (PDT)
Date: Mon, 28 Apr 2025 12:24:22 -0400
From: Peter Xu <peterx@redhat.com>
To: David Hildenbrand <david@redhat.com>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org, x86@kernel.org,
	intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
	linux-trace-kernel@vger.kernel.org,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Andy Lutomirski <luto@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Jani Nikula <jani.nikula@linux.intel.com>,
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Tvrtko Ursulin <tursulin@ursulin.net>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Andrew Morton <akpm@linux-foundation.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>, Jann Horn <jannh@google.com>,
	Pedro Falcato <pfalcato@suse.de>
Subject: Re: [PATCH v1 05/11] mm: convert VM_PFNMAP tracking to
 pfnmap_track() + pfnmap_untrack()
Message-ID: <aA-rtji7ujQgckbM@x1.local>
References: <20250425081715.1341199-1-david@redhat.com>
 <20250425081715.1341199-6-david@redhat.com>
 <aAvvQ1h9bg11hiqI@x1.local>
 <bbadf008-9ffc-4628-9809-2d8cf104a424@redhat.com>
 <aA-n9hvSX9JLsRM-@x1.local>
 <7a26e29c-d889-450a-a5e1-ce671f09e4c8@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <7a26e29c-d889-450a-a5e1-ce671f09e4c8@redhat.com>

On Mon, Apr 28, 2025 at 06:16:21PM +0200, David Hildenbrand wrote:
> > Probably due to what config you have.  E.g., when I'm looking mine it's
> > much bigger and already consuming 256B, but it's because I enabled more
> > things (userfaultfd, lockdep, etc.).
> 
> Note that I enabled everything that you would expect on a production system
> (incld. userfaultfd, mempolicy, per-vma locks), so I didn't enable lockep.

I still doubt whether you at least enabled userfaultfd, e.g., your previous
paste has:

  struct vm_userfaultfd_ctx  vm_userfaultfd_ctx;   /*   176     0 */

Not something that matters.. but just in case you didn't use the expected
config file you wanted to use..

-- 
Peter Xu

