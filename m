Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 926DB269816
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 10:36:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744108620; cv=none; b=INA+WnDtkzl4soaXF3f2B0y9uwj/tcUczjvGYHWW7ABeskpi4305SLOcEzr3xZBCL6iktDt6oqGmqztnJ+jhbW34ljYNZE6GtBOZCR3AiLehh3GKE0hDRePc7vhnWBflppge87ulC8684laeywPp61RjJNzRkwwugRW2vQSlreQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744108620; c=relaxed/simple;
	bh=z6yPF9uOlyPYwnYcyCbUHbrjMWRaBMiD7QCPSnGxte4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BzX9uOXj6K3GNvvsxGJbMj5wrnXxOYlDNi0DrNtKK3Cf2Kx+4fDbeJqx1an4x4KJ67Od+21OzoN9ugjpqHhO+lZo8x6rPNWYrJHiohAbNUnZnV27yjgH0rosUgtfzDcbB20HM77hReu2/MzcpSWkZgeBVwmJxrxH4a/Og3kbBrI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rJzrZy6R; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rJzrZy6R"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-39141ffa9fcso5858172f8f.0
        for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 03:36:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744108617; x=1744713417; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=sG5zgBeaBnx+L7h2Ew9MdPNsbBnWrTWwGOQbfcDyH0Y=;
        b=rJzrZy6R5Kpln99jfUPCUNKqQJl+0SKajWWxTuKX/pfD+NcfY3ubT9c0Q4DNtNzdWl
         7qAQilYZRKwuHJx61bgsvkqQwok0ufeiB2r4mL6Yok2My3UFJk6ktkFp1lvXZEF3L9m7
         eyWNfm5mBPV2dG8Vi2xTwDy6sZNcdXRlFXkalv7sJrhtRga3sVGRlI4G1rDRG9Ag10rT
         SRbp3g6LLIagY5SaVsO+TBDsy3JMAIMB3ZUWf9AFA1ma5cP3yfQdhwvHG0a6tIksS6Sd
         LLE9aZqdOAPCpktWxVQ2CBZ3pcz/te6J5pJNWbRAaiSjuJfRPhCmp4ZOwftN8ZaddVkL
         5vEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744108617; x=1744713417;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sG5zgBeaBnx+L7h2Ew9MdPNsbBnWrTWwGOQbfcDyH0Y=;
        b=eZhjsAV0wXYOipBA9jmHI88VRhF/ODIY+00ptnAk3x7m8xBQTvTi+8REoRWfEOnuL3
         sWxqCRS9BYEBcMhgdIvtBJdPXPjABcpf/hP7fnlA0wChOQVmJpmYVRdR+J1b9Oq2aEZj
         vXorCK5LklqsHu68FCrNZBXZBLU7mnHbj5fQ10Wf3ff0WdtAo6pvX6JhUwAt04WUtO9q
         rad3BjuuT/G3wfLO0xh43jS6ijY92i3CBtK3KQvwYVv6FkOGee0Njlu/NeRm2LSNn7Jy
         8VIJDB781srOlQcyRrlcVmtoG05UhlzOEtm95QeUfS14TnMN1iWvE6z/sdh2HjvA8JfR
         pN6A==
X-Forwarded-Encrypted: i=1; AJvYcCUsQyZyf2f15clsRmKlrL+wk5TyTzR31btzWZX8kDmfP+151S8Q7dYJH19FzWAq12jdNSRduAYZYxV2Vng=@vger.kernel.org
X-Gm-Message-State: AOJu0YyVpM6cdQhMUH0nRDcjoKepnrd16kR9H0xH7HCGbMCqTqEsepno
	t3sTBRZqk7MCpmOfJknsJo4ePi48cPcHABpxXDp3qRDzEjmKMRntQcLoi1utnFM=
X-Gm-Gg: ASbGnctt9C2cWIqBjiF7jY/v1ibMY0Fv6koAQ+SEVoRF0OYwTAsaxzpqmFXxOLi34um
	icCxTcJjz2UGZ2N3rlFEw+ENiyuctZQ9Ucqn7DfTryoDtlx9TSCONBpda3D+zrKYNTFI0n3XCQb
	bZvy6Xf9GSk6hTUs6HrmxogM5b63ivIpv3kzHK/LtaDigDA1hSB9R1QIJWLy2Tb2iyAPtokqlXj
	kRxpY4fdozhhzMcT8yT89jdE8e2vk8rovpj4GhrLSRNZeRdyiHsTP5iRqpx50KDcE0P0KkdCqEI
	ffm0ZXREdJTGnaPyKw6edGtWoY0juqVU6K5SlH65k+jfsDf/5gEYaLKZ9YeV
X-Google-Smtp-Source: AGHT+IGtPTU+zuWSgGfB7w18BXvfTFGqbzfm5r9SrIrzLuQfA8Y5CPDOZv1Q0DcjrDiDvt4vtBbAOw==
X-Received: by 2002:a05:6000:2509:b0:391:2fe4:de0a with SMTP id ffacd0b85a97d-39d6fc0c1d6mr8986003f8f.2.1744108616902;
        Tue, 08 Apr 2025 03:36:56 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-39c301a727bsm14422827f8f.27.2025.04.08.03.36.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 03:36:56 -0700 (PDT)
Date: Tue, 8 Apr 2025 13:15:08 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Samuel Abraham <abrahamadekunle50@gmail.com>, outreachy@lists.linux.dev,
	gregkh@linuxfoundation.org, julia.lawall@inria.fr,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	david.laight.linux@gmail.com
Subject: Re: [PATCH v6 1/2] staging: rtl8723bs: Add white spaces around
 binary operators
Message-ID: <b89c8837-4aa1-4073-bb09-f71f37b5dcc6@stanley.mountain>
References: <cover.1744061673.git.abrahamadekunle50@gmail.com>
 <4ccdbfd3e8d74d99679927f294f71cfb694fcc6c.1744061673.git.abrahamadekunle50@gmail.com>
 <CAHp75Vfp8Je1fUavSwTDAM_5_rDaDfXETa2oM5f0CjL1mxWX_Q@mail.gmail.com>
 <CADYq+fbh=kG2JABmdF8FjjPiyigMpnJ7WhQh+faqRk6FJe4MBQ@mail.gmail.com>
 <Z_TtyXwkOBK1MXGy@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Z_TtyXwkOBK1MXGy@smile.fi.intel.com>

On Tue, Apr 08, 2025 at 12:35:05PM +0300, Andy Shevchenko wrote:
> On Tue, Apr 08, 2025 at 10:22:44AM +0100, Samuel Abraham wrote:
> > On Tue, Apr 8, 2025 at 8:20 AM Andy Shevchenko
> > <andy.shevchenko@gmail.com> wrote:
> > > On Tue, Apr 8, 2025 at 12:54 AM Abraham Samuel Adekunle
> > > <abrahamadekunle50@gmail.com> wrote:
> 
> ...
> 
> > > > -                                               psta->BA_starting_seqctrl[pattrib->priority & 0x0f] = (tx_seq+1)&0xfff;
> > > > +                                               psta->BA_starting_seqctrl[pattrib->priority & 0x0f] = (tx_seq + 1) & 0xfff;
> > >
> > > > -                                               psta->BA_starting_seqctrl[pattrib->priority & 0x0f] = (pattrib->seqnum+1)&0xfff;
> > > > +                                               psta->BA_starting_seqctrl[pattrib->priority & 0x0f] = (pattrib->seqnum + 1) & 0xfff;
> > >
> > > You mentioned Linux coding style, which also requires lines not to be
> > > so long. These lines are. That's why a few versions ago I suggested
> > > you to change these to be two lines each. I don't know how many times
> > > to repeat this (it's third one).
> > 
> > Okay, sorry
> > I will add a third patch for a line break before the patch for %
> > operations since each patch should handle a single thing.
> 
> I am not sure you need a third patch for that. It lies into category of space
> and indentation fix.
> 

Yeah.  Let's not go crazy.  Do the white space change as one patch.  The
rules are there to make reviewing easier.  Splitting it up into three
patches doesn't help anyone.

In staging we say, "Fix one type of checkpatch warning at a time."
That's because it's a simple rule to explain and it stops people from
sending us huge patches that fix every checkpatch warning.  But this
patch is small and everything is related and it's easy to review.

regards,
dan carpenter

