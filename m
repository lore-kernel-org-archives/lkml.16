Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5759A19D087
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 04:21:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748406093; cv=none; b=c6H9A4q9rAwsUjJaz9lOL7IyPAnXj26+xxeG1BA+kfZdKuZ4hfU3TkrPziRfai2GCrDgzygX318hAnQYtR2hKPKns5NcBYB2VnMJuiL5/f0kxYV/YiTnVVWC8Atjydy4km+GJuyBa5j+gAXZmNc86U+q/6rYsFsKqBEMGQDJOko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748406093; c=relaxed/simple;
	bh=gYpAGN+5M5Rw7wA5/nO5pYmaDLAbaV/Yvvl8IIn+E24=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XWPkQDHpS8fdrwIpT36VSv9h+0vjOK6avLbbIzshmpaRgX8suS99L7KPwB8C6AZKHW90MTPMHAfun1ozD8HARX2cBH+66qMe6lZkqraAx/gGpNFJ5LqMcoXdnMPXX94/7+Ea7eu8iYWQ4lFFWwgJD+CbIWT/6vgOouwldgpHoPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=cMaRMSv7; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="cMaRMSv7"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-3116db72bd7so2537467a91.2
        for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 21:21:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1748406091; x=1749010891; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WV/qvSPB6WEwErKAsMTVFQ4E7hjPgAfhVGUmnDRBrnE=;
        b=cMaRMSv7Pv/ROGY6fkrh8+RygvTG+PBrbMUdzrkz8Jd1tT330v7WgNmlTHmPKx+g44
         9zOtCZJeZoojIXs2CAJT+2WcWUw+GV9cUYL0XlGyeSq2OHHp/tOQR646tAwY7vZUht6j
         Dl+j580Zz7mEPq+Rvf+Bi4hHrfy3DeEnKXh1ym994GgFdk3aLrllakjoJyH2yV7swjS/
         bKi/tQ/u6oM4EyRzkAqyb2vaGAMpehrklZKggvmsWxQ9ZjBjDsS3dFsUtEs3bsfk6iLq
         9t00N2te20tNUoabKnvifMU6HYq7KO97B6jH3ojcpZJdnR9zenGHVmBx1kgjDEJ5DcTi
         ZWrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748406091; x=1749010891;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WV/qvSPB6WEwErKAsMTVFQ4E7hjPgAfhVGUmnDRBrnE=;
        b=NNZn17gtIpHvAA8tsvNfeXnIQ7qPsRieb3g4hN6m4FN6oM5mik7k8ZLZitIlDqbQFq
         NwLYMYrNZbpPPpTe3oEfJ8fjTs9lt/ZF8MTuPizj571/L9vYUMwMQ6QTNvhMdT2P1J9D
         BB6Jl3V1qb5ajZZd3uVrFg4CZ3FtcR4PF9kLNTzBoOSaoJXABcz3024faB67iHRCojcK
         P32ayiRp15s/sZJ1gQycPyLPAcJ0/UnMwSoNZG7GaFB9IqeHoJmsfI+0kuWoChKUwu7i
         wskZIjMo+2V2nCJ8oW0qvzkaHMOLpPpB0QrF2ftO7JNnBZW8Cw3DXlr4R46anECR9wVN
         V3AA==
X-Forwarded-Encrypted: i=1; AJvYcCVh6kkZxkToyMfEK7CgO7AP+TP1bfjQcvgEmg6ubtGk8al09UTuHDSUdOBB4GJJeOFeT97JDCHIlDhBZ7Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YzBgUDGPn76lQxnNIbwyZ2/5/nU2ZNlCH0KFrjOw8qgbb9xNArg
	3hb6MN7vH+kVFlIfkKmwOoFA+1StSd2/OP0uvCqh79KfMBRMfsszj4yYmLqNSu/in2A=
X-Gm-Gg: ASbGnctxLgcI6uMMczKDScGmj4y0rCeoNLrRWTLO6WkbVQHdWCbLtuc+z/h7SFHlJSC
	Jjj/2YcJfFMUKnqUB5UEC3HBIxU4XqrkaY/pbOJpwKswdMTWIWyIWNSuoA0xTZsxJHo79X3IoEo
	I55uw7LEIEDr+AsCu1yng3xHm7dIZ0ctBCqe/l5pbsBJysWr6Zh8Eh5cCNOEeC/iQ0uhyL03pF4
	Gskd0A7eWWKrkHt1/awMSwxIlnDHfPzxfMhP2RL6FUzRYTQ07kb9U5/dayqRS1seesASM07SsAZ
	8r7sJ4SUBdo88T7EJmYW30eQbJzfdXhe3em+TPX4PO1udB9d4l+JBBoFIZyJGNi4zKhllGDATLf
	b+A==
X-Google-Smtp-Source: AGHT+IHqceBKN3JoBv7Ps32UTkuJjeTI+o1YYmCxSCNbbdszAchYvVphd4HyUAYDLsrNEZRQGzutlA==
X-Received: by 2002:a17:90b:38c3:b0:311:df4b:4b91 with SMTP id 98e67ed59e1d1-311df4b4de7mr2403223a91.7.1748406091267;
        Tue, 27 May 2025 21:21:31 -0700 (PDT)
Received: from localhost.localdomain ([203.208.189.5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-311e9b7f444sm285956a91.24.2025.05.27.21.21.28
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 27 May 2025 21:21:30 -0700 (PDT)
From: lizhe.67@bytedance.com
To: alex.williamson@redhat.com
Cc: david@redhat.com,
	kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	lizhe.67@bytedance.com,
	muchun.song@linux.dev,
	peterx@redhat.com
Subject: Re: [PATCH v4] vfio/type1: optimize vfio_pin_pages_remote() for large folio
Date: Wed, 28 May 2025 12:21:24 +0800
Message-ID: <20250528042124.69827-1-lizhe.67@bytedance.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250527131450.7e961373.alex.williamson@redhat.com>
References: <20250527131450.7e961373.alex.williamson@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Tue, 27 May 2025 13:14:50 -0600, alex.williamson@redhat.com wrote: 

> > The utilization of the function vpfn_pages() is undoubtedly a
> > good idea. It can swiftly determine the num of vpfn pages
> > within a specified range, which will evidently expedite the
> > process of vfio_pin_pages_remote(). Given that the function
> > vfio_find_vpfn_range() returns the "top" node in the rb tree
> > that satisfies the condition within the range
> > [iova_start, iova_end), might we consider implementing the
> > functionality of vpfn_pages() using the following approach?
> > 
> > +static long _vpfn_pages(struct vfio_pfn *vpfn,
> > +               dma_addr_t iova_start, dma_addr_t iova_end)
> > +{
> > +       struct vfio_pfn *left;
> > +       struct vfio_pfn *right;
> > +
> > +       if (!vpfn)
> > +               return 0;
> > +
> > +       left = vpfn->node.rb_left ?
> > +               rb_entry(vpfn->node.rb_left, struct vfio_pfn, node) : NULL;
> > +       right = vpfn->node.rb_right ?
> > +               rb_entry(vpfn->node.rb_right, struct vfio_pfn, node) : NULL;
> > +
> > +       if ((vpfn->iova >= iova_start) && (vpfn->iova < iova_end))
> > +               return 1 + _vpfn_pages(left, iova_start, iova_end) +
> > +                               _vpfn_pages(right, iova_start, iova_end);
> > +
> > +       if (vpfn->iova >= iova_end)
> > +               return _vpfn_pages(left, iova_start, iova_end);
> > +
> > +       return _vpfn_pages(right, iova_start, iova_end);
> > +}
> 
> Recursion doesn't seem like a good fit here, the depth is practically
> unbounded.  Why not just use the new range function to find the highest
> point in the tree that intersects, then search each direction in
> separate loops (rb_next/rb_prev), counting additional entries within
> the range?  Thanks,
> 
> Alex

Oh, I see what you mean. So the implementation of vpfn_pages() might be
something like this.

+static long vpfn_pages(struct vfio_dma *dma,
+               dma_addr_t iova_start, long nr_pages)
+{
+       dma_addr_t iova_end = iova_start + (nr_pages << PAGE_SHIFT);
+       struct vfio_pfn *top = vfio_find_vpfn_range(dma, iova_start, iova_end);
+       long ret = 1;
+       struct vfio_pfn *vpfn;
+       struct rb_node *prev;
+       struct rb_node *next;
+
+       if (likely(!top))
+               return 0;
+
+       prev = next = &top->node;
+
+       while ((prev = rb_prev(prev))) {
+               vpfn = rb_entry(prev, struct vfio_pfn, node);
+               if (vpfn->iova < iova_start)
+                       break;
+               ret++;
+       }
+
+       while ((next = rb_next(next))) {
+               vpfn = rb_entry(next, struct vfio_pfn, node);
+               if (vpfn->iova >= iova_end)
+                       break;
+               ret++;
+       }
+
+       return ret;
+}

Thanks,
Zhe

