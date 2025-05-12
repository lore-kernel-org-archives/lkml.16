Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77A6CF9CB
	for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 08:38:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747039096; cv=none; b=Ij16v+8f3CqdtEJ6WcLVTtxciCgLZEL7rwXnf774uIASW6coto339KaZyz5ICvomxOZuLexGriv1y9XEOSWgGcTD3rAB/JmH8ZcUsYesaP2c7R+6ZFPYcabCCPHo0PsetlnQoWpVQFIOsaT4mT9YA1NHyjDcg+oJAp07Q990PbI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747039096; c=relaxed/simple;
	bh=8ZUFfo6Z4p5uyO+h1mAz3NIcnzMIS8i9vzdULPQEIuI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=qNnRwsZxSXXF5vH4ZWlCOuS5w1NhlWS5PtgYBtXDYQmo9PnLOnt+PxZjs79eZmSwSZH+n3aZYYHGNpRS3UtDeW/RIgIYz9ulHC4EeGSc6U7332sPr3Mcc7ZvB/3bxMvVH1WYmQnIHQYwuwiO9sM/IXe3ctRvS3wXUh05TK+hTwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ZfyG7WCI; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ZfyG7WCI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747039093;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=PP89qRhPkoWIIYcgVm1wnfv4RdTsHvtgvKByma5wHQw=;
	b=ZfyG7WCISM2oeTUoqWba29Vj3x356zv4+g6OsJnJe07/uaxBAR0vdk7jtkb3TvEfb+Y9d6
	jZwc3V9AiaikG3MtZop1tBthEPJgEJRNbaiz6mi9zbtrCnwVJhuQMPnFyqjyem5s7XjGx8
	GKykPrzXR7nzcfUAd9JezdOesTwaQL8=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-427-o6vHl1yQNxGj2jj0J1Vukg-1; Mon, 12 May 2025 04:38:11 -0400
X-MC-Unique: o6vHl1yQNxGj2jj0J1Vukg-1
X-Mimecast-MFC-AGG-ID: o6vHl1yQNxGj2jj0J1Vukg_1747039091
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7caee990715so1272272985a.3
        for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 01:38:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747039091; x=1747643891;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PP89qRhPkoWIIYcgVm1wnfv4RdTsHvtgvKByma5wHQw=;
        b=iUcCeAmyGMV4PxJE6P2nu83fJi2zp5XVUg4bZB3wjAOcu/r5FEz1VGgm5is+8hKsfA
         DrbhoLeHIMeW4L6DQ2Y8/+UtUOj7x7y41e37QMeEICiSMcFhlQW7o5onMF1YQFIjR7Md
         IMZJZlK+PEwWLZKzx4/g/jZVbRlALfymPD6hZ6lrGkkIcwR6oZkJK0oeDqyh3IyRBfWH
         xhsWQwd7ouAvLQbCAea4922S3GUYB7n+F57GXG5rs5b8aXRfyEL+DfwKuNw1KxmJNfI/
         LYBrRqZ2g2alGyS6fw0Gjd4Uk2mBPpaUf3HFe/Asn96XBHwdAjcDZuIxwx6wx3+XcICC
         z4oQ==
X-Gm-Message-State: AOJu0YyJfZaD4uaBtxTjUBcedufD1CWuj5N+mMAHlwTOqboy1iIDAlM3
	CjRpCK7OBxcuhicN9iqAS81Fop9a/+7J/7wXwUU4YCXhWTlCjE5Lck16/CvW3A6v6M1Xt7zpmdS
	NEG0wLhGl8MQAoU1PoiabYvCQ3NjFiFUaaUE1Pgkp5kIDJ2E47bs3Ly3wsU4CIQ==
X-Gm-Gg: ASbGncvjitIPoCIkgVUDsOobpI0H3P7yt6VwnpUmuKiU/GpL9ApoOb6fgEwiCAHPeoT
	LWv9yNvdEERViRB4usae8RFWpe8Dq+5S4T1jWLg4PubsVvl3Rohc4iBNih/54AkTFePf/MVbtXB
	aJ4MB6Y7ToboymOH9VhlidF9iZ1jI/Qi+nN9iIh0Fjfl3oDFJCIRBkwPpC9AqZxISOExPr7ECqv
	K5wwsI2XGkL+crtBXtsSjmRIvqcjuh6lq1sBQn2DIxSPOdUB3QknbiK/EmdrBcgxyOxIA5f+DfH
	93O3TGyTW809WuIbXEVmvXecY8PPYcQTcYvu8ZmsQQ==
X-Received: by 2002:a05:620a:28d2:b0:7ca:f04b:3fa2 with SMTP id af79cd13be357-7cd0114ef36mr1842632185a.38.1747039091408;
        Mon, 12 May 2025 01:38:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHEXjH17/jNl/oMK1ZTPoobma2pz5XZPziKyHswuWD5nTF/iKW1+p6YuEGPTvLqK5Yg5zg9BQ==
X-Received: by 2002:a05:620a:28d2:b0:7ca:f04b:3fa2 with SMTP id af79cd13be357-7cd0114ef36mr1842630785a.38.1747039091183;
        Mon, 12 May 2025 01:38:11 -0700 (PDT)
Received: from localhost ([195.166.127.210])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7cd00f63a63sm527858985a.37.2025.05.12.01.38.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 May 2025 01:38:10 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, Marcus Folkesson
 <marcus.folkesson@gmail.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, David
 Lechner <david@lechnology.com>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v3] drm/sitronix: move tiny Sitronix drivers to their
 own subdir
In-Reply-To: <8c717f94-5b7f-476a-895a-c5b0969eb208@suse.de>
References: <20250512-sitronix-v3-1-bbf6cc413698@gmail.com>
 <8c717f94-5b7f-476a-895a-c5b0969eb208@suse.de>
Date: Mon, 12 May 2025 10:38:08 +0200
Message-ID: <87h61qp6kv.fsf@minerva.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Thomas Zimmermann <tzimmermann@suse.de> writes:

Hello Marcus,

> Am 12.05.25 um 09:15 schrieb Marcus Folkesson:
>> We start to have support many Sitronix displays in the tiny directory,
>> and we expect more to come.
>>
>> Move them to their own subdirectory.
>>
>> Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
>> Suggested-by: Javier Martinez Canillas <javierm@redhat.com>
>> Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
>
> Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
>

Pushed to drm-misc (drm-misc-next). Thanks!

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

