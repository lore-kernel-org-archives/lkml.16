Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CDDC2D8DCE
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 23:53:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744761217; cv=none; b=DLjMSFBcEMmo49PXfZ070ohJPiOH0/6W2cTAhFjeCpf8qnw1T/MQTR0s/ksP7lvhK2BfCdgc9+sXfmqT6Xmb1qpLvEti8aKA2q+HtfClB0P73kbcy5zAFslVtqLXDZoZd8/kcQ5jgAYWSDYsMoj462HoW/Le8ZQ5uiNAMACr3JU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744761217; c=relaxed/simple;
	bh=gtqu+hW7zVXxmCZiU7N4xV8OySI1M3oubuMPlaun3AI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WNWsNto/VHKVdstraxjQgplGSKxBgqBaueFqVRwwqa9HHVhm+N4fY2/xxyaHovLjqUiFBDudzx5zt0/x4YPXbSfRFcRvl0jVDjHZJwKO9NIJTVOkKxGtlAFFobPZVW13ncrLx0XfbxTo93p3GhJCKccGj8aOvGQMeKXe/+h+lrU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nHwW834I; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nHwW834I"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-736e52948ebso6930549b3a.1
        for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 16:53:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744761214; x=1745366014; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=HYQb/vAVflfTMHmxSSvin2OsSyxjzOK0qvbBWBFGiXM=;
        b=nHwW834IxP7A3l7luyqiIm+Rjf2JX0mtJ99g5pUjmTqwpSTzkbLXVEBEBvZq0M/O8C
         ctTqf6F7f195t72DouwlFkpzvOcGu5oMxiQpBGlVZYig4309kkYmn4B1CUKsawpy60Hb
         uD8Le/+02x3pSwl3fawwU9t3Nk5oIUGWulYL4iGsOrKZiMHVs36kevJu7yx7xlMgGHok
         ykrvbVPGhuksis+bC8601Tra/z6eZAjBi9kX2wOKNitH0OGkQ3knhmbAHp/GG8M86Bpg
         R7Sn3g/ja6WKGKEkSXFU07oz4iTpNK1Eg7SB/qgNlN1/HtF1x1M+O2fpOXhPEpaz/oQz
         Wv/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744761214; x=1745366014;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HYQb/vAVflfTMHmxSSvin2OsSyxjzOK0qvbBWBFGiXM=;
        b=Y1rnEd7w65GrRan9xssZvXn0hBKePem+MucNzdRY5fvGHLlR+Tk7Bl1ZlbRLR3YkJ1
         S4acTgdCl/6qgNDZqfCbLhWSsrrqoqRYeS9j9LQygbuaEXw63DjsXH23NZYTVpBExzfw
         pqEOGg5h3yXz09UkXlE3iZwJ88YyMkFEn2Avyp7sLsWtL7mFyfhah9wS5rwD0YeT5che
         TNQoRzspqbmlavrwMLx7xwi3AqrUe6cA206tFQJWjNrnIK9lCmk5X7AtIG/4Ma0RKbY7
         DoK2v4vuRJ5zhiodcV/zxa+A9773frGfGv4QyFi003DIOTjlb4R7SPx49TAz++O2G4gv
         noaQ==
X-Forwarded-Encrypted: i=1; AJvYcCVdCe6+X7f9btCVj5ltgY9Aeol4s5g97Ne/wZTBJXIV0cmnNsrzg0vkryDc/awCGKEubFDRIW3P7ffpYy8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwSor5FYIsHK0wdPEh4QIj21XjRTWM548hev3dmrvPhPfLwFH9N
	abHSpVo9/MtgKNxrLzv5qFqNxQoDX7P9q3BwMcgsTjxjnf2EN6Pd
X-Gm-Gg: ASbGnct+xvpPY0QOa3A2dbFiyYoRwb1RhdhmENIgnJlfoeLgpRRpQPSdd+qsJyxSj9/
	K1Ntou9YNJVzulpeYyBM4g2pfmnDQXhXn64o+wly3Mw2rt/lavxHwJtrWoVVoM7TLG51u7WiKPr
	kdiCVPf46cRNucL2rBcymnAqt29jDhM1vzVQJdZBbWZq4WI7DouUgTC2ZS/Iy40JOmDATJDfQr5
	+WleLoqPP1utDcCbGiKZcI9s4wC8aA2TV8b7+XV2zKo47dRkD8qVPspGpHZyHE7GD/98b+T6BZR
	pDblsHnv3etigM1DCUgeX4RLxcqV1u4SR54JcOIn/FxQp3jGwNTc/5JH3UHBn+ax0ZfBXwew
X-Google-Smtp-Source: AGHT+IF9AGYaMGmU+YAriBxrgwOx89adt7HoWOhuVq0Fg95nw1pi8fJCQ6J9UgCYtMmgen35WpsVwg==
X-Received: by 2002:a05:6a00:90a8:b0:736:4b85:ee05 with SMTP id d2e1a72fcca58-73c1f925dbdmr1909994b3a.11.1744761214209;
        Tue, 15 Apr 2025 16:53:34 -0700 (PDT)
Received: from fedora (c-67-164-59-41.hsd1.ca.comcast.net. [67.164.59.41])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73bd230db26sm9439188b3a.134.2025.04.15.16.53.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Apr 2025 16:53:33 -0700 (PDT)
Date: Tue, 15 Apr 2025 16:53:31 -0700
From: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>
To: Baoquan He <bhe@redhat.com>
Cc: linux-mm@kvack.org, akpm@linux-foundation.org, urezki@gmail.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/5] mm/vmalloc.c: change purge_ndoes as local static
 variable
Message-ID: <Z_7xeycZwymvffbt@fedora>
References: <20250415023952.27850-1-bhe@redhat.com>
 <20250415023952.27850-2-bhe@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250415023952.27850-2-bhe@redhat.com>

On Tue, Apr 15, 2025 at 10:39:48AM +0800, Baoquan He wrote:
> Static variable 'purge_ndoes' is defined in global scope, while it's
> only used in function __purge_vmap_area_lazy(). It mainly serves to
> avoid memory allocation repeatedly, especially when NR_CPUS is big.
> 
> While a local static variable can also satisfy the demand, and can
> improve code readibility. Hence move its definition into
> __purge_vmap_area_lazy().
> 
> Signed-off-by: Baoquan He <bhe@redhat.com>

Reviewed-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
