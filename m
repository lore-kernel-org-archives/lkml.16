Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DB2E19CD0E
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 13:34:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749562466; cv=none; b=vEksaP52+bDkCoodbZc80n699AggFgG/TvZC42oFm7KuAwLqc9UPfgnhI4Oqa6zj/HH1ByvkNu9XRgX4YNSzSIcY/NDDJByd/d0AdRtSV+HQyqo2NrtrNc9xErR3MrNCCWaqTLzlWoEiYbH5s/fJTgt5Jc7E7tH+d2kuFxGLg+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749562466; c=relaxed/simple;
	bh=XvrsqEOdfXf0A5sl8PhNexgikLmqQdrUFQcyvSHgxyA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sGavGZIGu2xio9EEZtDGN+cs3zMGHlJGbkanyYBcnAxiiXLeWS7tsyW5E8m+AzTPjgA5rsswP3ecGOW/ftRAAgKual0BjryFOBnIuMtHfkgxxCoYUuPs4T0d6hlnYc71jPp/zArFEXlyVfF+V2TBxatbu4gYO9+7K07YxbG8HIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=c+Ujewyv; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="c+Ujewyv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749562463;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=JaThg5+r5uhS87jz3/gzU48kE9fYSYuQjTKSX+XLaXk=;
	b=c+UjewyvG2W/yozdrHtmVYPsp50amu/VP9oR5wcSmttf8kJNRuYrcpJK/6zt2XoI04Gjy5
	SZ3bNFp0jgls609mH41X+apNxF5M3EzlG/b4Ncko7rF+sLJpplxdxb6QRofOjkVMy1V0ZN
	wrxZSRK/+TGEcZacrunzEszT5VFSziU=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-488-nMLkpjfzNGGMtG7ZOteObQ-1; Tue, 10 Jun 2025 09:34:22 -0400
X-MC-Unique: nMLkpjfzNGGMtG7ZOteObQ-1
X-Mimecast-MFC-AGG-ID: nMLkpjfzNGGMtG7ZOteObQ_1749562461
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-adb33457610so508836966b.3
        for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 06:34:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749562461; x=1750167261;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JaThg5+r5uhS87jz3/gzU48kE9fYSYuQjTKSX+XLaXk=;
        b=OV2r4AQ+WbxJBcdSgFg4wUOrpJakmrDIJGyIUBDmUlt0Qq8P9ZXcF1km74XRHRo+uE
         CM1oDtVNUaPZgSCPLszB0/ZEFO9ufBbKg8y3IgIBRnqNjNj6oYyieLjOXC1TICma4IMZ
         hiVxnFfNH10LgIKN0hsYrXIDor7FHqkdP4vAqUwBA9ebjVgbhEa0kJqKiUR3BDFznZM/
         /5VFivpO/5KUGcUuIAutD1RUidrntoxSXo5+CMhoRrbpTV5K/LzFwtuz29TrDGh0OBhr
         TAFpDXd+Jv1xeZ8jRpD9rhuUHC+Jnem3eIDCTt8S7kk8lEJWtiOa9zShafsBKbIhBdMC
         WCbQ==
X-Forwarded-Encrypted: i=1; AJvYcCUAntoR7E3wyYcuGswm7p45vYXimTyXeu/DC65orj+x7m+R4vMu6M0LcIRmomQRe8dZ11Ko7XwwGCn4QTI=@vger.kernel.org
X-Gm-Message-State: AOJu0YyIW/q1TuP44UDgrSVbJ+L1Ng8AF8FBVJyDoEsaSNn40Y9qt7MJ
	nqU4+ezoV56AIaBJ6wR9eqchQpXz3+Mjj+LROzZ/0M1cNheV7x4wpTFVd1sAdXi4vylGVtx+9Rr
	6P3BPnnQTXuEUjoRdwl3mkPjMxfZYUhmxKx6Pk8L+oo58d6v7DVoTGdIU2HHKP3Zprw==
X-Gm-Gg: ASbGncs6oHw0UoT5i9HoDp2L2qutaEvPQa0U5oKDAkZlpTRJH7VNw3nb3YCJgTZO9qW
	4ExO2ZdBC7OytPo+p+H0jgOXjEavKamWl6dZUkXVwqZRVGA0yRDu1D7mlmZff6y7U+3td20Gvbf
	iYX4jrLp0VsXoHB42Ma0ZdDurzZv52yebRox82XLw/0EUGDcJMZAxX+b1saLgQPo84rJ5/Fn29L
	dXwJVDGYM/f/PAIyjK7MfeVS6m3KwpiSQSX9dAFUURN19haIvxYs9+w4YpC8Vls010XY0VDsJCq
	z9/5i79a30ZPoQN76lqURP3nRVw1
X-Received: by 2002:a17:907:9627:b0:ad2:4fa0:88cd with SMTP id a640c23a62f3a-ade1a9161d5mr1556453066b.9.1749562460789;
        Tue, 10 Jun 2025 06:34:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFVQJ9XKVtgWAPBPx92DgJukt6mEoSr0j96sE8wez5IFUYtTCsIHQA0fNWr/TED56i/nhFt1g==
X-Received: by 2002:a17:907:9627:b0:ad2:4fa0:88cd with SMTP id a640c23a62f3a-ade1a9161d5mr1556448066b.9.1749562460153;
        Tue, 10 Jun 2025 06:34:20 -0700 (PDT)
Received: from sgarzare-redhat ([193.207.220.112])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ade1db57856sm727888966b.63.2025.06.10.06.34.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 06:34:19 -0700 (PDT)
Date: Tue, 10 Jun 2025 15:34:13 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Cc: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>, 
	David Airlie <airlied@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>, 
	Gurchetan Singh <gurchetansingh@chromium.org>, Chia-I Wu <olvaffe@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Simona Vetter <simona@ffwll.ch>, 
	Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>, Viresh Kumar <viresh.kumar@linaro.org>, 
	dri-devel@lists.freedesktop.org, virtualization@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] virtgpu: deallocate capsets on device deinit
Message-ID: <4si3wc7jhfcyukrepw3wi6zmylqf7b5ilnlxfpbbexcijcvlnz@3r2zcpxne275>
References: <20250505-virtgpu-queue-cleanup-v1-v1-0-810923da2b1e@linaro.org>
 <20250505-virtgpu-queue-cleanup-v1-v1-3-810923da2b1e@linaro.org>
 <5271820d-7afd-45e5-8103-b7d4fc818278@collabora.com>
 <c3ae2790-20d8-4220-848e-7b02b185e893@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <c3ae2790-20d8-4220-848e-7b02b185e893@collabora.com>

On Mon, May 05, 2025 at 07:22:35PM +0300, Dmitry Osipenko wrote:
>On 5/5/25 18:58, Dmitry Osipenko wrote:
>> On 5/5/25 11:59, Manos Pitsidianakis wrote:
>>> diff --git a/drivers/gpu/drm/virtio/virtgpu_kms.c b/drivers/gpu/drm/virtio/virtgpu_kms.c
>>> index 7b3c4d314f8eee692e2842a7056d6dc64936fc2f..a8b751179332b9ec2fbba1392a6ee0e638a5192e 100644
>>> --- a/drivers/gpu/drm/virtio/virtgpu_kms.c
>>> +++ b/drivers/gpu/drm/virtio/virtgpu_kms.c
>>> @@ -286,6 +286,10 @@ void virtio_gpu_deinit(struct drm_device *dev)
>>>  	flush_work(&vgdev->cursorq.dequeue_work);
>>>  	flush_work(&vgdev->config_changed_work);
>>>  	virtio_reset_device(vgdev->vdev);
>>> +	spin_lock(&vgdev->display_info_lock);
>>> +	drmm_kfree(dev, vgdev->capsets);
>>> +	vgdev->capsets = NULL;
>>> +	spin_unlock(&vgdev->display_info_lock);
>>
>> Isn't this lock superfluous?
>
>Wait a minute, vgdev->capsets is allocated using drmm, hence it's
>auto-freed when DRM device is freed. This patch shouldn't be needed.

Yep, good point. I mean the patch is not wrong, but I think we can avoid 
it.

Thanks,
Stefano

