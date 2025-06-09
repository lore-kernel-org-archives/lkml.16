Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAD13221562
	for <linux-kernel@vger.kernel.org>; Mon,  9 Jun 2025 20:52:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749502330; cv=none; b=cQFWhkpCgaJlE1RWfQZa8+PHhTW8ToAQVXPAK3Mk7MYRy8/OH6YBz/XlDGb+iLvX+nC/VB3eYy+DrImpJMY4F8AbQKPQ+l2OCPOeSY1L3Bk1is/Lggid2b6wfWQRrJsvpGBB5U5UsnZAsT20XjrFzUe6x7tOfNKKnlrjjqikkFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749502330; c=relaxed/simple;
	bh=JqB/AcIr2fJYlCtmdUPOix0+dbAsf4Aa0b940qhUGVU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cNBtTwwvLpezNVN76JIsg0N+/RFYf7v9fHmPa2MJPOZrLfoc3u3D1IzzS83jZo5HFMq9ZMhDIZ2+Ignuo3yTIbIOSdH+JloEOdM4up54pNaFnjrwQSWjZQti1qrsrejxmMFf9VbhUVUsEmSjIpxtNrxlF5NT2wcdifUix4EX+SE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NwZ1hQgh; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NwZ1hQgh"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-3109f106867so5750354a91.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Jun 2025 13:52:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749502328; x=1750107128; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6RbYCer2V+RGn9HaMomqHLR5bhXznuxMoFTrz6wAork=;
        b=NwZ1hQgh/Et1LKk++QBHo5UqokWAcpFiIqNi95P4ojtag4SQeIHgKr6CWmB5wwMPYw
         gOA5MNjbtcZl+uF7z+H76qjGgsS8nZ+4DwhmL2/N4c+GVdXHC20mP87mY/Hsl24rbi+z
         EJXAvqdvNDTdl5wFvNrDQNpahNJooSg0InMr5ZJV3fdqN8nrB0DjbiNMPflZ/euTJvAJ
         9VOPJRrMSl4Gl7q1WzZ/NkcmTs1mPigscI93IczMNCCqcEwNMoHm903fqSXr7kE66bs1
         iY1yBm9qVe44VsEz7N3cpdN0NFfJ4rTNF/xp0aSFl4QhKZkeqZ5Q8jsJIl2t3hgnnfLw
         /W6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749502328; x=1750107128;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6RbYCer2V+RGn9HaMomqHLR5bhXznuxMoFTrz6wAork=;
        b=CcvQ7ylbiACE9aoH1DWe2jMF2PvSGQ5ft0ER2mn+XVWx8dsEimLr1c/0/d1K30luZ9
         rYh2SmTXM+MuwJoZt1b5Tg19zg+iAmBBZy+Pu15ptkNmL+P062Jwuya4AGd6hBqPvSa1
         bdojERs8Muue59rEBw6mmTiJsRfF4zDsvcFdQUMXGhRwhl0Yg1cmJsFryV0MeO0cAfyX
         XPSihL90riVQAunlAhFdaHu4NjXPhlwL5NJ4Ij8Qdt88dvVHQFBR8N4ML0+GlCE1KENt
         vNGyZWk8nOn+irgdyT2JwA4jFa+KgHIxvfnde9I8a/0fpaJYPWAS/GX+ryyaOpo7Eo3U
         xfGg==
X-Forwarded-Encrypted: i=1; AJvYcCVsfgv2JV38q73EHKe1/eBk/oLYDXyVasYmNk2SJELBWcvUAOimeTHvBc315e1xNkQUSkw5v0lmkT9O9es=@vger.kernel.org
X-Gm-Message-State: AOJu0YxUV68B6R2nq9QmD8F4nMBuo3hi25OeH044+xRG+u8ahGhtE1GV
	wZIRWtmxGkweTEXcl5z/2+YwJ1K6eMIIR9iKnQjo8WMi3kxh4xvvp9SOZz+F8Agau2NoZX/RKUl
	AvwP7uhWhfagU//iqMSzPsiZAyzjSg5g=
X-Gm-Gg: ASbGncvO6nTQoibjzuqUZO8fS1y4+dpWVvQFV5G/E+DZYeKaN3C0jB2fq3AHThv0RCb
	+2/J32WUO9+cbkaJ/FsKb5f4L0tDIrEr5ZAwFKxq5GJK1MWipVBBTtsc8ElcYpsbvRhfKaqxo5X
	4E8l4gMQfK4GDZE23CyrFKFyKBuKyMPViRuSG+LGlQpqQ=
X-Google-Smtp-Source: AGHT+IET0NEgO3/vTlneRu4QfrqEne0yuMzlMO6fUFvdxMwrFR3HPVc7JLyRBY2w81+WTCFVEAmW8kACaqLQ7fRV0f0=
X-Received: by 2002:a17:90b:4b90:b0:312:db8f:9a09 with SMTP id
 98e67ed59e1d1-31346b2acbemr23617713a91.14.1749502327788; Mon, 09 Jun 2025
 13:52:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250521143701.60625-1-yechey@ai-sast.com>
In-Reply-To: <20250521143701.60625-1-yechey@ai-sast.com>
From: Ilya Dryomov <idryomov@gmail.com>
Date: Mon, 9 Jun 2025 22:51:55 +0200
X-Gm-Features: AX0GCFvD8s1u21oZJFnzsQ-nPd9jdtS4XKiDstrTbtP7C8Pqdae2YhIrdpSCATs
Message-ID: <CAOi1vP_8tkj+JmDJMA6PdDHzpbOyBxBeZ=yD-jmu14Fp6sfiBA@mail.gmail.com>
Subject: Re: [PATCH] ceph: fix potential NULL pointer dereference in ceph_msgpool_get
To: Ye Chey <yechey@ai-sast.com>
Cc: xiubli@redhat.com, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 21, 2025 at 4:38=E2=80=AFPM Ye Chey <yechey@ai-sast.com> wrote:
>
> Add NULL check for mempool_alloc return value in ceph_msgpool_get to prev=
ent
> potential NULL pointer dereference when memory allocation fails.

Hi Ye,

I don't see any dereference after the call to mempool_alloc() in this
function -- the pointer that is returned by mempool_alloc() is simply
propagated.  The dout may log it but it's not dereferenced there.

Thanks,

                Ilya

>
> Signed-off-by: Ye Chey <yechey@ai-sast.com>
> ---
>  net/ceph/msgpool.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/net/ceph/msgpool.c b/net/ceph/msgpool.c
> index e3ecb80cd..e9d81c76d 100644
> --- a/net/ceph/msgpool.c
> +++ b/net/ceph/msgpool.c
> @@ -74,6 +74,10 @@ struct ceph_msg *ceph_msgpool_get(struct ceph_msgpool =
*pool, int front_len,
>         }
>
>         msg =3D mempool_alloc(pool->pool, GFP_NOFS);
> +       if (!msg) {
> +               dout("msgpool_get %s failed\n", pool->name);
> +               return NULL;
> +       }
>         dout("msgpool_get %s %p\n", pool->name, msg);
>         return msg;
>  }
> --
> 2.44.0
>
