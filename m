Received: from mail-il1-f178.google.com (mail-il1-f178.google.com [209.85.166.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E89B257455;
	Tue, 24 Jun 2025 08:24:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750753464; cv=none; b=WzYbb5bXWRJ5/kZ7hChR6nYE0gwErzczh42CXDgUsvbuNqhERVk8rMv3mL4VNy5VV2NL4rz/+Tn+HJceb1bxPVKBiRErpVoCLZoo0UFOd+eYvqGhKq7kWmRVknDjX3FFCxAfFI2Im+bP0VIm7kuJGaysSayBrVhclI9bxUIxF1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750753464; c=relaxed/simple;
	bh=Jl8CLti6K4pODZB0dj33uxfV/xUr4+NEKzZFxbWq5QA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rGLH6567YspQANVjMXRmor1q474KjYiLKK0PZUI8HCgv8DEFR/GQbAKGpPGWB72fCBWyzb+0VjEKwwpeGnrqBuSZ9ozwKMdNhzDqJ5Xe6enK7+BRA7ikyMeijxRzcLPAcxV0zPLQKkColmhJsfL2yjcdjXjBpqltxsli/uOMY2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OVj/lxak; arc=none smtp.client-ip=209.85.166.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OVj/lxak"
Received: by mail-il1-f178.google.com with SMTP id e9e14a558f8ab-3dc9e7d10bdso16489265ab.2;
        Tue, 24 Jun 2025 01:24:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750753462; x=1751358262; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Jl8CLti6K4pODZB0dj33uxfV/xUr4+NEKzZFxbWq5QA=;
        b=OVj/lxakMjnQUtI3AL/SSqU1rOnyMTap4xBefI2/8F90g1BT044Y2d6uJxfwtBsWNz
         xAxhX2ObV1/tBh6uRNtygHypo09K/As5WPkfqCaNa7pRTBHrE3FEJg50w2k2DtK6Iz64
         Vvh5WIhPxUjts2wWoLD+SKXYe9eN/DyIwwSKA0e2YbcIvk4hdGDzhac53gsYIifpxaee
         JKYKxGYiwNvfMBvTosqpL/QUzjfLQ9dRDkeW/z7woZ1vn2Tw7j0xLMHuavWQ93PjbT4K
         ovZExwV8ls8oJRthRtle3B3AjwhRfAGAVe21/dScZFuRChW5EWVnQR9c0FVQ4/+wHSyO
         fvaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750753462; x=1751358262;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Jl8CLti6K4pODZB0dj33uxfV/xUr4+NEKzZFxbWq5QA=;
        b=AH2kSQNv5s3FthmaYZ6EijXMwgRUVzgL9NQJt/gFrcZYAznzPYRyEXuTAf/aF9R/cT
         EWACTiqslDKAjoFr28g5fp6S+StkpAEop7OedsrosM7ciYVpYXYa0WhKEqyHGMLkOzAW
         ilyMLG3gUfSc8VBahPu807DVXEemN0ZHYt93sPkUw1xQKDkt0eBtkBgad5qv7c1JN1Hw
         JU3jJu1SCumN/D/hogiLakfz1/bhDxRsgUjY33XluMs3wd8wJY6Am42Al9zCiWM/MQTd
         3i2UTjbcGa9i6xjv2wEor0q8c+oDwJrpmQeP0k1RdBwGzH6TiGQs6F2SxCQizmiKgud3
         5a0w==
X-Forwarded-Encrypted: i=1; AJvYcCUTkjDjHqyucqn5YTAZn4UIB8SSr6WX90MEN4PHswZcwOYqLgAgM07sI27al58SHiADsYlhxIjH4rzogdo=@vger.kernel.org, AJvYcCW7fBC6D97YiZe7xexftEbA0ODM4TduoI4ErglkWDNhRpZBsx7uCFJ7ZLC2+6WXFxi4OJVcNM79j1RlDPI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwXAJYXs7vuGACcO4JEkqOiqLA/hj7Rptg1wNfrIY95Xs9MdPhF
	DLe41pqhejut/p03FXxPNrpxKs7E8LRykN5x19sJmG0BYakpA1R3E0zft+//ArqMtfH6XKaehWC
	o3mWCe+esDJ+4G+KNGkQd4bax3cUp8D0=
X-Gm-Gg: ASbGncs5RHWIsyKzhJDsK3Pmcs90JukczGnwch70mujk5Cs0TVxdejKe/JxNrqtIMa9
	LQ59ZkZGwPQ8GFuHq+nviGBRAK8JCAUdkKA2qQzRu8s9cm/aUbVPXHkeBSIDqaPNMZ+RQCEPyiW
	leOJZAXPNjdqG45QA0n1vrEnyGmVLP8RSICu7sS0pE3n0=
X-Google-Smtp-Source: AGHT+IHycWZ/xVo3Cc9/nhPhd1qJ7nsaCgIMPtdKa5ASPFyg5vQ7tJ0psIzkhc1u6DczbCgaZ8+ePoOxUwQNaz/cX4w=
X-Received: by 2002:a05:6e02:12e8:b0:3dc:8b29:30b1 with SMTP id
 e9e14a558f8ab-3de38c98784mr166520675ab.14.1750753461902; Tue, 24 Jun 2025
 01:24:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250620021403.624303-1-shengjiu.wang@nxp.com>
 <aFUbGFNAISmamfv8@opensource.cirrus.com> <aFUfEgY9hfhB3lKO@opensource.cirrus.com>
 <aFVXLMtEOuXFL8B-@finisterre.sirena.org.uk> <aFWF84HMipnQTOxs@opensource.cirrus.com>
In-Reply-To: <aFWF84HMipnQTOxs@opensource.cirrus.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Tue, 24 Jun 2025 16:24:04 +0800
X-Gm-Features: AX0GCFspNWx95ugPmUS4GeIzxC1XVwZFFkWPdeClRd0-Q5Ek4MRt6NqvcQTtNGU
Message-ID: <CAA+D8AMCZ8jbcMFPMEm1f6AK8e_iCwi7Jyg8Qb==zzUFO_1cog@mail.gmail.com>
Subject: Re: [PATCH v3] ASoC: wm8524: enable constraints when sysclk is configured.
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: Mark Brown <broonie@kernel.org>, Shengjiu Wang <shengjiu.wang@nxp.com>, lgirdwood@gmail.com, 
	perex@perex.cz, tiwai@suse.com, patches@opensource.cirrus.com, 
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jun 21, 2025 at 12:02=E2=80=AFAM Charles Keepax
<ckeepax@opensource.cirrus.com> wrote:
>
> On Fri, Jun 20, 2025 at 01:42:20PM +0100, Mark Brown wrote:
> > On Fri, Jun 20, 2025 at 09:42:58AM +0100, Charles Keepax wrote:
> > > On Fri, Jun 20, 2025 at 09:26:00AM +0100, Charles Keepax wrote:
> >
> > > > This is kinda the opposite of what I was hoping we could do. The
> > > > idea was to make sure we returned an error if we can't support
> > > > the given rate. So if we don't have the constraint, we check the
> > > > value in hw_params. This looks like it checks in hw_params only
> > > > in the case the constraint existed, but in that case there is no
> > > > need to check because we had the constraint.
> >
> > > Although perhaps I am mistaken here, I guess is the clock has
> > > been set by the machine driver then we would pass this check.
> > > Would it perhaps make more sense to return an error rather than
> > > zero here?
> >
> > The link hw_params() should be run before the CODEC ones so we would be
> > able to insist on the clocks having been configured first.
> >
> > Or I wonder if it might be easier to just implement clock API support i=
n
> > the driver and if we get a MCLK we set it to a sensible value here?
> > That wouldn't work if the MCLK is coming from the other DAI though.
> > Also I'm really not sure how this bikeshed fits into the design concept
> > here.
>
> I think clock framework stuff is probably more work than makes
> sense here.
>
> If you are happy with this as is I don't object to it getting
> merged, ultimately if the machine driver doesn't configure the
> clock that is a bug in the machine driver and it will likely be
> relatively obvious audibily so the returning an error is really
> just a nice to have.

The code here wants to avoid returning an error when the machine driver
doesn't configure the sysclk. As wm8524 is a slave codec, it don't have
any registers to be configured, it can work without sysclk configured.

Maybe we can release this flexibility for wm8524?

Best regards
Shengjiu Wang

>
> Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>
>
> Thanks,
> Charles
