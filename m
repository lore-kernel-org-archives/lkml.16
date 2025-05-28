Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E3C428C860
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 17:05:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748451908; cv=none; b=tYkXGIv1iS4E7BcUprLLtaqn35HPA3YXSavWd7CiwltLjlt14oC5uI8Vf2OFH38nRmZbmF1y8gBKbN5sZYr4MbIj+Ui3wvuZ41neam73C8TuBtExssAD9mIG+ecOT/IX7EaQa+vFadQMOczNSxi2xzWWyYu6Z2OjegslBmEKTlc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748451908; c=relaxed/simple;
	bh=0DgzNtii2XWXPt+m9Xmjccp5sFgv9qhxyoaDSRtPwK0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ix7XqdGMOEOg7Q4pcWDq7djthuqGqzjSu6+dk7n/Vo/K/CqdBkKLxXDbemJuti1p0VPxTvuOfWbpczCPmWLVgxdab1V45nK3V2gta11ht/mxvbHiJQD6MyUVeO0RU9CpGozTHobwy5GdXDzWtbzQoyjdpNhuW83PzyIbpkau57A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=f34N6Uxn; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="f34N6Uxn"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-23228b9d684so1179325ad.1
        for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 10:05:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1748451906; x=1749056706; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=VspX5rS9W9nV20VrA8EY7nkU4h0oSZ1JdThY0x0OkJY=;
        b=f34N6UxnLsD614rWptT3JqFZpcYHDQNow1sWY7r2g7QlVZlpQ78ROrF/CQoPak+ht+
         qoF2T9s4xoI4i2742f+ntk9MtLt8w3ga/qA39nST7AIUTSaZPz84GD5YmK1z5ESFMlar
         yxvP0m24ZwRxS2QgZmT4wJ5F3OmajG0lCBdwU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748451906; x=1749056706;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VspX5rS9W9nV20VrA8EY7nkU4h0oSZ1JdThY0x0OkJY=;
        b=aDIkIVgslyzx5/3yemVRCuhcKJ7JcvZEduG0u/w5pxnQAWrZjLa976yHavyqDDyq9f
         QQPDAshchi8xpX1Qjd5HQfqToCEQfB5l+/ZDbVuSXsWaANswGMd5U52dkeK4N+A7mPos
         tjTKqWCKabroIOqFsdPjqQh/iUtkGHN4qeDHVEJVGAh/yCtLfR1farOLxfbUloYqdxq3
         Q6/WO9wLV/VbemLi5YrDS6dUwlhT+HR7P1O/JRIS5/jdQlAiqUeNTFP8Z50ON/1ERPzn
         koqHm+R69pDk+ODAv+7qQB62ZIBhu/kveDFUa5hlSDQS28DH0oWiIuJPB2l8WqsnFIXw
         Vk8w==
X-Forwarded-Encrypted: i=1; AJvYcCV0tn5LIR49KAlFjA4Eq9dF4eu4ie6l0LOa2IgZaxiRtoQcZMdaTSMwZMAg82VLItBveIMddU2Kr1ponf4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzpjhX/lmpRJyBmCwtZEt+zm1nyCIc9H7uqQYVe+M5T0tLugPLj
	m3/gKFzgU7P4rwJOeCdox/uVAyazwWNbsy/re9a2r8vPt601EXn18B+srBGvf4a2RA==
X-Gm-Gg: ASbGncuLSYs16hicey7CodN183bA28WnUSqNTb1nbKQ4sPAkyH8L9Iiv7DcnVTALzXC
	so4pAItNZr1/8BBf7/qNtYzO2unEfQpLhx+8ZdTSwWcgAL6yZyRCU1B78bxqyll8uBbFSNPfNHf
	Y4GqYqyan+cjaEF3Q3qsMPEeIJAmfZ0fqgQ4jNBs0ePMLOTmEmjM3gO7wL1wCy+ms6ofLZYUfZp
	2ycpK6NwUKGUGUE+i1/PtWm1yQP+LNXCGm22ig2cdNGLMbIfkmihuI+YAeFS7aRag4AdjmHjzrT
	RTwohK0+tq0pwYZAPJc4dNiBJvuECNKx3osMCTB7k5NVEVAxAFgQIOliaZDtZytwiaqwKpCEMDV
	0PthJu4qXx89S8w==
X-Google-Smtp-Source: AGHT+IFU5AHAAdBQ71v43Zug0Rlg+HfRRu/4sHj4AchmDH70sYT6JNthrG2CjwlrMpKf7NwFDUvrDw==
X-Received: by 2002:a17:903:1a67:b0:234:d7b2:2ac2 with SMTP id d9443c01a7336-234d7b22c20mr48025905ad.22.1748451906196;
        Wed, 28 May 2025 10:05:06 -0700 (PDT)
Received: from localhost ([2a00:79e0:2e14:7:1fd6:4e0c:b80e:960a])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-234d2ff7ebdsm14268255ad.106.2025.05.28.10.05.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 May 2025 10:05:05 -0700 (PDT)
Date: Wed, 28 May 2025 10:05:03 -0700
From: Brian Norris <briannorris@chromium.org>
To: Francesco Dolcini <francesco@dolcini.it>
Cc: rafael@beims.me, Rafael Beims <rafael.beims@toradex.com>,
	linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] wifi: mwifiex: enable host mlme on sdio W8997 chipsets
Message-ID: <aDdCP_lvlyvk9J3n@google.com>
References: <20250521101950.1220793-1-rafael@beims.me>
 <aC9dvv6Ki1T5RsHF@google.com>
 <20250523072604.GA14001@francesco-nb>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250523072604.GA14001@francesco-nb>

Hi Francesco,

On Fri, May 23, 2025 at 09:26:04AM +0200, Francesco Dolcini wrote:
> On Thu, May 22, 2025 at 10:24:14AM -0700, Brian Norris wrote:
> > On Wed, May 21, 2025 at 07:19:34AM -0300, rafael@beims.me wrote:
> > > From: Rafael Beims <rafael.beims@toradex.com>
> > > 
> > > Enable the host mlme flag for W8997 chipsets so WPA3 can be used.
> > > This feature depends on firmware support (V2 API key), which may not be
> > > available in all available firmwares.
> > 
> > Is it available in *any* W8997 firmware? Or particularly, is it
> > available in the firmware in linux-firmware.git? Judging by its git
> > history, the answer is "no", in which case this is definitely NAK'd.
> 
> mrvl/sdsd8997_combo_v4.bin, from linux-firmware GIT, 16.92.21.p137
> version. From an off-list chat with Rafael he confirmed me that this is
> what he used for testing.

linux-firmware.git claims to hold W16.68.1.p197.1. Either WHENCE is
wrong, or that sounds like a completely different branch. Are you sure
about that?

> > users on the old FW version. So, we'd need to teach the driver to know
> > the difference between v1 and v2 API here, and choose accordingly.
> 
> This is already implemented. From mwifiex_ret_get_hw_spec()
> 
> ```
>         if (adapter->key_api_major_ver != KEY_API_VER_MAJOR_V2)
>                 adapter->host_mlme_enabled = false;
> ```


Huh, I forgot about that. I also assumed "v2 API" wasn't something
available on most older chips, but I guess I might have been wrong.

> To me the patch is ok.

The firmware versions above don't match up to me. But if we confirm
that:
(a) this API is available in a linux-firmware.git firmware for this chip
    and
(b) someone includes a valid linux-firmware.git version that they tested
    in the changelog

then maybe this is OK. As it stands now though, no.

Brian
