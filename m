Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 666DB1F4703
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 10:39:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739270371; cv=none; b=qu5TWr21eTeO4me4D0AJ+hvOHtX7aLzWI1b/Is5341u/e9GQcf3yBnw5/6creXhW7y7XGbVi9GHiKvfIPcod8zFs9bJTKwqIq27MJAtCn5w84ykNFGrOk/gI9x/YW9v8cZQEEmOLIua4PVl+ZWeChB+kN7emCVlCKM4ChfAxN/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739270371; c=relaxed/simple;
	bh=Itz/aPnsCzT3E9fHaaztQ01JCQd6uXtB0mglllTpjQA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BlPl0KjOTerosXS/biyp4XHtrrtB9rku0MaLdwiTlvoIMAw0V+32/IGIKR/TOHIxLYGBmVxdZD/i+7xUlDNnLMBVXFdLn4spjw7Cc8eCJNY/8W29RqKu0FqEcu2ekkj3c5Z3N2nGVJ1rUdErlf9Wj8WomGzKS1o9lHUWYGYRy94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d4UkdK6G; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d4UkdK6G"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-38dc5764fc0so4022165f8f.3
        for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 02:39:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739270368; x=1739875168; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=kyX5GliCGkS9GXhUP/lDAmt14UlfBAJ4be7edHjNLVk=;
        b=d4UkdK6G7BUXpPVBAAkrQPT8vCoThxiyikl8zEUNSVCNtzlcn6tcWnYtSPsqR7zjfV
         vn1U68c1cV9zzCV4XgMa+fAGiYhiB7yvJZd006iUB0dYTMVDdDB7uBOogQpmQRAjIQy6
         jFxxZ+7sfJlPCuqy+AXb4Eg6ZNyhqbEprfF0UVjvrOSKMovHa/ZnbEpIEm1LPtyX4u5v
         Sk1sDnCrqvI0uN+sZGRBwDyIuh8NhSoDY/7+JPm+RXBBvuGzVZloH7wfcRSA46Ztm4nk
         W5uBtT5BYe4AdBrNVEQYqP2kPnwCuHx6etx1+2qaOmMyv+JJJNRx6eY/3WrWXDU3IQnR
         KIIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739270368; x=1739875168;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kyX5GliCGkS9GXhUP/lDAmt14UlfBAJ4be7edHjNLVk=;
        b=M3SE0U6+BsgJuHI5vffWXFA0IIkAbEJHI39N9iENoE56JIeGzxvUVkT0JWp+hIIKil
         fhkUPu/AH/33AqBp++1mbIWmqjA/pjZ/tNtguEfm5gGOnQuZ+uHdxbSrYQu+akF1JImE
         dlcrvEpf+l9yl8GnAISh4mGEwP1s0SGKu0A0oygoS9va0zybjFB2E/ByWaCUS/2Hc6YD
         fSRAXxh+vYOIWySKdbMLAd8JDVcNISM1WUDAfUjypZ7iyfOqFzQx77CfuMwaxWS5A3Q+
         hWHNJ0aJgOsLzMLRSgX6Pez/s9W+vEf12cd0CMm6xue09DqZ2KQQxrw/JhS/O4yTdzkP
         AWVQ==
X-Forwarded-Encrypted: i=1; AJvYcCWFfF45l7tpSdtYryTk/vIKhVFntWwzatUVZ5m44/i46bTMmfio8WKM0g3+7JUBYIFK42RPjXSEPz3pwG0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwY74V78RIW7oIoA5rvMjnX3Sjljl1YFdMSwj42iQPM/lazwhPr
	k0kdnyiCN4JO4M4iLlCb+wX32+o8l6QLZlCb3Sxg3r7jfZOEvdSh
X-Gm-Gg: ASbGncuebVB3OrdMLdBbQzKtVaUGo5YXgavTEl4Ut8Q+Gn3QlCq7Sv/oqAbyEpPC+PR
	U1/xTlh8P2Hk0NAMsb63rQoduiAYcbQnRduiQLu0gCF4XwoM2cmWMEdmCfm7h/OeP3DLQhR1RDk
	P4QeU4oPInFtJgYWFs5bdwr0paGzVUS3RNpRDFO/rKHW5wHG111OPasEAYloIqacekWLEHJ6hDY
	us/B35tsuvuen2GZc4RGhph75nL8736p6lRuP0fb10AaROCVQ3au3VQt1CXXPS3H3JXyyazQ/gv
	ji4x7PdgsgrUCA==
X-Google-Smtp-Source: AGHT+IH46PQbD0D61i3GoKYMxvqIWjEWYfzUm3CKBKsXv98Ie3+SgFLpZGdUw6lQZaDZWnKOz8er0Q==
X-Received: by 2002:a5d:59a5:0:b0:38d:e15e:17e1 with SMTP id ffacd0b85a97d-38de15e1bd0mr5476380f8f.10.1739270367263;
        Tue, 11 Feb 2025 02:39:27 -0800 (PST)
Received: from fedora ([94.73.37.161])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dbf2ed900sm14354832f8f.53.2025.02.11.02.39.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2025 02:39:26 -0800 (PST)
Date: Tue, 11 Feb 2025 11:39:25 +0100
From: =?iso-8859-1?Q?Jos=E9_Exp=F3sito?= <jose.exposito89@gmail.com>
To: Louis Chauvet <louis.chauvet@bootlin.com>
Cc: hamohammed.sa@gmail.com, simona@ffwll.ch, melissa.srw@gmail.com,
	maarten.lankhorst@linux.intel.com, mripard@kernel.org,
	tzimmermann@suse.de, airlied@gmail.com,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 03/13] drm/vkms: Extract vkms_config header
Message-ID: <Z6so3Xpd-z5zQJEK@fedora>
References: <20250129110059.12199-1-jose.exposito89@gmail.com>
 <20250129110059.12199-4-jose.exposito89@gmail.com>
 <Z5uDHcCmAwiTsGte@louis-chauvet-laptop>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Z5uDHcCmAwiTsGte@louis-chauvet-laptop>

On Thu, Jan 30, 2025 at 02:48:13PM +0100, Louis Chauvet wrote:
> On 29/01/25 - 12:00, José Expósito wrote:
> > Creating a new vkms_config structure will be more complex once we
> > start adding more options.
> > 
> > Extract the vkms_config structure to its own header and source files
> > and add functions to create and delete a vkms_config and to initialize
> > debugfs.
> > 
> > Refactor, no functional changes.
> > 
> > Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> > Signed-off-by: José Expósito <jose.exposito89@gmail.com>
> 
> Co-developped-by: Louis Chauvet <louis.chauvet@bootlin.com>
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> Signed-off-by: José Expósito <jose.exposito89@gmail.com>
> 
> [...]
> 
> > diff --git a/drivers/gpu/drm/vkms/vkms_drv.c b/drivers/gpu/drm/vkms/vkms_drv.c
> > @@ -208,8 +189,7 @@ static int vkms_create(struct vkms_config *config)
> >  	if (ret)
> >  		goto out_devres;
> >  
> > -	drm_debugfs_add_files(&vkms_device->drm, vkms_config_debugfs_list,
> > -			      ARRAY_SIZE(vkms_config_debugfs_list));
> > +	vkms_config_register_debugfs(vkms_device);
> >  
> >  	ret = drm_dev_register(&vkms_device->drm, 0);
> >  	if (ret)
> > @@ -231,9 +211,9 @@ static int __init vkms_init(void)
> >  	int ret;
> >  	struct vkms_config *config;
> >  
> > -	config = kmalloc(sizeof(*config), GFP_KERNEL);
> > -	if (!config)
> > -		return -ENOMEM;
> > +	config = vkms_config_create();
> > +	if (IS_ERR(config))
> > +		return PTR_ERR(config);
> >  
> >  	default_config = config;
> >  
> > @@ -243,7 +223,7 @@ static int __init vkms_init(void)
> >  
> >  	ret = vkms_create(config);
> >  	if (ret)
> > -		kfree(config);
> > +		vkms_config_destroy(config);
> 
> I just have a question here: is it not a problem to kfree config (and 
> default_config) here? There is not risk to have a 
> use-after-free/double-free in vkms_exit?
> 
> >	return ret;
> >  }
> > @@ -272,7 +252,7 @@ static void __exit vkms_exit(void)
> >	if (default_config->dev)
> 
> The use-after-free may be here?
> 
> >		vkms_destroy(default_config);
> >  
> > -	kfree(default_config);
> > +	vkms_config_destroy(default_config);
> 
> And maybe double-free?
> 
> >  }
> 
> If this is not an issue (ie we have a garantee that vkms_exit is never
> called if vkms_init fails), you can add my

Good catch! This is a potential use after free/double free or, even worst,
on "if (default_config->dev)" default_config could be NULL.

Even though the bug is unrelated to this series (it was already there) I'll
include a fix in v2.
It'll be the first patch of the series and it could be merged independently.

Thanks,
Jose

> 
> Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
> 
> [...]
