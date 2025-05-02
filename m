Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 918AA2581
	for <linux-kernel@vger.kernel.org>; Fri,  2 May 2025 21:46:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746222391; cv=none; b=nUR3V8g2Vfy+sztQmEYiY82mqZwqVbHdo+scGa/56p65VpLsIu1QtJGD6J5veQAHBLTvYsFz89KhzDMsgSCFvo3XjBcWWmwiCVsB7ePiy5us8HEbBiiafmMo++Sb/3dFF4GUlYsnXa78GmP0VM9H6uQIC9lFgMt1AKIIUCOd8Gc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746222391; c=relaxed/simple;
	bh=m8op4hzK/ze/42jzZ3HGi2Iw8sBLTABaUx3jblmVAGU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=gNNGQAVtq59EZs+A+qkcys4CbWZX8y0dOKE7ofZHaVZ+BDDA0LVpvTKHVhCmQWbCunAH9CK2S+Ja4Cv52Owd8EypPHLQLbPVscqdq4c2h1pO4HFAvL+c41haZeM4kW5Z8uXDeKN7/mMCd0r5QBmaVRRv3zBzjlg0btmUuuiDF/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=MlrJ5IRz; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="MlrJ5IRz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746222388;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Qahbo3crElebDURDi/YqbJUSVFuNiuA50iMSrGmQ2PQ=;
	b=MlrJ5IRzAWKczanC8Rs3mbSqBdFo1CqwppoxI5bYnGLRGmO6VjTlTJG5rXEKmnk7sCxhZy
	S0s6WytenzlW1wISw5ypEYWHt4ESgvE+HrhAQW+7aZbK2Fn9pbfLAgF56FvnYktdTzjSih
	Zy5Ja4dvmPLEJ05x5aDNuLk7lJqDfqM=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-550-v7D_y4thPtKxQGPqPMkLNg-1; Fri, 02 May 2025 17:46:27 -0400
X-MC-Unique: v7D_y4thPtKxQGPqPMkLNg-1
X-Mimecast-MFC-AGG-ID: v7D_y4thPtKxQGPqPMkLNg_1746222386
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-43cf3168b87so9986625e9.2
        for <linux-kernel@vger.kernel.org>; Fri, 02 May 2025 14:46:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746222386; x=1746827186;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Qahbo3crElebDURDi/YqbJUSVFuNiuA50iMSrGmQ2PQ=;
        b=oNtBAmTC/sfjNYMm5FWyeierQutq1VVSgp6XPGJ5fzmri0CM1lOa7toPK1cBRUPuGt
         j/nss2uXQDMngNGfubGBpaFvZC53nEdrmkxLt4kBktP3nmSt3XEy3OPUB0T8gNLfNVNP
         Yz/PmpV9zcrw5eY0pxRmB1/jpI766C8v2SSpca0EJ593E7/UXUCzxtS3gPBitnqY81bg
         PzoH4epP5WOpv2PxbpgzcK2QKD1APcqBdZdXwa2VnJ5XtGEVGBApZM0V61wPF8Q5yHBg
         Qy/I0MM7XDimpmxksDGu3iFNz4YjlR+tmQEfvNeucd/fU/NqeRz2gnL0AwvLKehTyXyI
         /zQQ==
X-Forwarded-Encrypted: i=1; AJvYcCWBOR7JLK65K9abvzdUtW0LlUldK8+kVkGcAoOrEl4/aI2F585yi8oHvCihS7LuN25hlFZNF8XBjWjxaII=@vger.kernel.org
X-Gm-Message-State: AOJu0YyIn3en456VV8zqIUJNsyJ+K0K49XueATo4W1IkDr0Dpv75C3+v
	WB3+VSPOhUA7cXsvftWyRTjAw70EJe6t+f0S6HubfuMP1fSUxrwIRR2CN/BTrAHLTJINc4NjQW/
	px39gZsp/VnwieowLLC0LoTDco5m5OhUUAxSEYy5Dg80AEJCq221HutkQIfyi9w==
X-Gm-Gg: ASbGncs8LFDzkwMRcD9YRLOnjx2PX+fSdl/Ye/9aAGU8zkCW+4ll/xbpM3Uz9z6Nbgk
	igkPgkxHijVP+h0CW94l69wIp2eALR+UZ5wBbiZHkSAH71HNQTqsSsl1F4fBOWYc8saOqBYRiPI
	yi5Ly+kNKhShoktYJ8gQnh6z9JAFN5DLUcAGxO43IJ/E7JY5+G5/YirnzVneEG5B8z66vdf8d+U
	xUkRgxd3E7+ekrQGubukRBzhLs8JN4HGgmos9wtiSA+n3b6LfuKZM/5UX/q3XteLRYPGOPJ+kP2
	WhW1cnAVvc10TAcW7ZOAlsLzBRUeJ3cy18qp1L73FpTYVU4Swi7xO7zZJeqcR2NqMDWZaw==
X-Received: by 2002:a05:600c:5022:b0:43c:e6d1:efe7 with SMTP id 5b1f17b1804b1-441bbf34052mr33060925e9.26.1746222386014;
        Fri, 02 May 2025 14:46:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH9F3jRqEYmLmAVEbUTid9i2DombAT9dIMgyp5RDfvj5Q7CwTNt4gGGQ8wqa4dSHLhfQuMcXA==
X-Received: by 2002:a05:600c:5022:b0:43c:e6d1:efe7 with SMTP id 5b1f17b1804b1-441bbf34052mr33060785e9.26.1746222385690;
        Fri, 02 May 2025 14:46:25 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a099b172b3sm3168912f8f.90.2025.05.02.14.46.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 May 2025 14:46:24 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Marcus Folkesson <marcus.folkesson@gmail.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David
 Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, David Lechner
 <david@lechnology.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] drm/sitronix: move tiny Sitronix drivers to their own
 subdir
In-Reply-To: <aA8yKi0QDCg1k8mS@gmail.com>
References: <20250428-sitronix-v1-1-4e7cc0a8195a@gmail.com>
 <877c3421tb.fsf@minerva.mail-host-address-is-not-set>
 <aA8yKi0QDCg1k8mS@gmail.com>
Date: Fri, 02 May 2025 23:46:23 +0200
Message-ID: <87bjsavg7k.fsf@minerva.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Marcus Folkesson <marcus.folkesson@gmail.com> writes:

Hello Marcus,

> Hello Javier,
> On Mon, Apr 28, 2025 at 09:16:32AM +0200, Javier Martinez Canillas wrote:
>> Marcus Folkesson <marcus.folkesson@gmail.com> writes:
>> 
>> Hello Marcus,
>> 
>> > We start to have support many Sitronix displays in the tiny directory,
>> > and we expect more to come.
>> >
>> > Move them to their own subdirectory.
>> >
>> > Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
>> > ---
>> 
>> Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
>> 
>> You can also include the following if you feel like it:
>> 
>> Suggested-by: Javier Martinez Canillas <javierm@redhat.com>
>
> Oh, yes of course, sorry for that.
>
> To whoever applies this patch, please add the Suggested-by tag.
>

Yes, I can do that. But I think that you would need to post a v2 anyways,
since two fixes for your driver were merged in the meantime and otherwise
there will be merge conflicts when applying this patch?

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

