Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B476525E806
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 14:35:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750689335; cv=none; b=TGhqG+dOfFn6DwspXhAgSADTJRUHysePZaCs9buvyHVAdjyYlN3hcGjHoIrhQg8DTkNkVPB0B/NTyrIyiRL6WtCJmf2Cf8ivP0xTUfn4clbwPXXBNxkuzedd4fgyWLrcvLPvwE24k6ZfffYgj4OHoMaiy+Njky9+m/exGH122Ps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750689335; c=relaxed/simple;
	bh=9LGKOzoBSn5ielAxf43x1FsCr8uxqxO5k4cdaz7r3uo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kyzGTJzdFklTpEfDmLYzNhDKpdSe4vO2DR9HdGGDK0j4sm4wUpRn9QRoU3a7NJWjh+qfQegXVz8Ks9GMYvgJFgJ824+/xMg45yY0I5Zyt61PllZmlYeBbcrAASG5J106hrIBO6hG9CijKz4jJIJBi9kq8oRguLY0X9RQWndHIbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Iykw1VWe; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Iykw1VWe"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-7fd35b301bdso4959275a12.2
        for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 07:35:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750689333; x=1751294133; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=XlzQYA4Vqi8dQ5FDOU8JcHAlJHgTJcysjtW2A8SXnvI=;
        b=Iykw1VWeg30uwTVKIhBm+zuieJ/fnGvEbXb4roB+GF+K92e0H8bTTAI5rvhNLoafCh
         KVqXudSUlWaOP/NNXP3ghmPSJ4+G+5FEXnUOTiBJ6F4KZYHGXkN4OuEWSVRzOPGJ2Bma
         qA5mjmVLYs0gF4r61rGE2c73keQUq4hR23NVV9QjrqygsGP4VfbLCqyoRur5JL8k1jg1
         NP4331RIkS7rsR0kVN+16eWHHSytIjoSzU3/aoKp39+Atz3t9Qd5MoQbROzMfB4cWjuc
         qJhMJsoayoJceP46qqejz4yP/0jqrPssxqcQp8fUlKxsu0Mli6rrukC6qlX1OMFXyjod
         vVLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750689333; x=1751294133;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XlzQYA4Vqi8dQ5FDOU8JcHAlJHgTJcysjtW2A8SXnvI=;
        b=MOIknf0q2oansLpE7th/y0V2nkLOf6kesGA6TXuD7m95tou5XUl1wUYcjuafSIEZDm
         NmVN0c5Cbs7pdpyqRr7ehQrYK4G4hnSQ8ORV7XqIVA5VSzzZoDYgLgDb9Aup7JEZvhGj
         fDsBZpdB7mPOE4W5861BXD55YW+M1/bzaRMoOeZPqB9JnKnS15cmnnhfent9n7fTGhu+
         P2DwHMjLLB8f5jZUtupGwBdCHNwWEYKqGi8iZdTcLOHddzvblB2tATLD7G7rnE3F8YDA
         YtRg0e1f3HD2DOXlTUFn6XP5EPSocw8SHokQ78urlhEj2tau9rtZxgj7Iznui2IEGvhG
         H6Lw==
X-Forwarded-Encrypted: i=1; AJvYcCXD6JuGHbRogKVJNmT1QcxyOjvjzi+AP4VfcdFcEgrebBv1lK9jJ2E1HoonWTZYQ+Lzgxr6fe8BEGdFAbk=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywi9Swe6avSA1pjR2saItMJLKDyGujS2ZYikn30nf81l3oV1PQc
	X0jnyadrKZzEXgMyI+ZtfHf/FqxvGO03d0XCbTGArnsjwIL3Bu6UB+5G
X-Gm-Gg: ASbGnctH3Z3tHaM2WcUU3xkOppPrsAg2C0zYVtE2dPut1pD8bE+mf7ATpOCx7UprGBC
	TSrh4Tx/oCta3RHz2f3HAHf5VbmwQ/hqxHOIjdZySgLs5+t1vO9wCr8qmcUmPRSBgADl0UqFKg0
	6abRYIF+eUZrUwxIXQzulF9OO1rJ/XbzCvkhZyC5iG12RrHSnkMYQAwoYE7KACFNevFWpkWAqBB
	3YyZkEtAyDBeNAfQlQFOWpIem1tecbKrB626wlfAxn05edFyyFO4o4fem3DoDZconzHoE9gV32a
	FQFe2f0vR2OLjMcuIsvTCvSkSuyWCaDlvX+5isGkkTsPbRK9sHjlWBYKiwTAnss=
X-Google-Smtp-Source: AGHT+IFX+VmhiUBnmA4pNZEE74T73jbLUZc8BjmHxWRKCnJo1+RhenR8isYSZfLvtDMHgo1LsTb7Cg==
X-Received: by 2002:a17:90b:4fc2:b0:314:7e4a:db08 with SMTP id 98e67ed59e1d1-3159d8c5de2mr23707176a91.18.1750689332776;
        Mon, 23 Jun 2025 07:35:32 -0700 (PDT)
Received: from rpi4B8Gs ([182.216.63.93])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3158a331288sm11812762a91.43.2025.06.23.07.35.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 07:35:32 -0700 (PDT)
Date: Mon, 23 Jun 2025 23:35:27 +0900
From: Kisub Choe <kisub.choe.0x1@gmail.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Kisub Choe <kisub.choe.0x1@gmail.com>, gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8723bs: replace msleep(1)
Message-ID: <aFlmL0DtydfsbFl0@rpi4B8Gs>
References: <aFdAEM6GnCudvqMV@zinc>
 <efa56904-eabf-4493-b064-652d02839c6b@suswa.mountain>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <efa56904-eabf-4493-b064-652d02839c6b@suswa.mountain>

On Mon, Jun 23, 2025 at 01:54:01PM +0300, Dan Carpenter wrote:
> On Sun, Jun 22, 2025 at 08:28:16AM +0900, Kisub Choe wrote:
> > changed msleep to usleep_range to
> > 
> > Adhere to Linux kernel coding style.
> > Reported by checkpatch:
> > 
> > WARNING: msleep < 20ms can sleep for up to 20ms;
> > see function description of msleep().
> > 
> > Signed-off-by: Kisub Choe <kisub.choe.0x1@gmail.com>
> 
> This type of change needs to be tested before it can be merged.
> 
> regards,
> dan carpenter
> 

Thank you for feedback.
I understand that this type of change should be tested due to its impact
on time-sensitive behavior.
However, I currently don't have access to any device that uses this
driver.
Please let me know how you'd suggest proceeding in this case.

Regards,
Kisub Choe.
