Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98B221F91E3
	for <linux-kernel@vger.kernel.org>; Mon,  5 May 2025 09:27:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746437253; cv=none; b=ifWOFt+/cutz5RJ3PsAWoX2Xj1nv/SqS+oP0F3lbU3lKhiwpxoJZds2+RQ9Sym0h/GK8Gu5TIECEQAOLpfxjxUcruWdhY7XGwu/izE+crPwREG8e5II4v3p/8yMtvvQ4lYswfwicLAAnfRFUDeWVHAGZHOOKvtmK4rHh9Ky2b8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746437253; c=relaxed/simple;
	bh=VCmoWmJTvqlgEOq6zbWHFFjE8aX3WtnAN6LuKDcJFH8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=KmnOV4R870ksg2WhHC2vHrD/enolP8x033pME19um3lveiUlHvulJyTsL3MSoB7JOgC6InYmEtQxPp+MuokmUe8aMZFntZAN/myEGzTnG7WrAngwCVSJSB951e+Fx98CWAE74QZMFXit11HT0CHtO0pXsys68Ex5BD2bLLxis0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=VH+sS4Vs; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="VH+sS4Vs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746437250;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=l0RexrooVEAiTnjYfMDdv53LIbR51/bbTVhj6k4gjWQ=;
	b=VH+sS4Vs4q0zGaYKw8HleSNrTO7NMxuFKTApal3+iu6glI7V8Nhnphyez9R7dNQtUpelna
	bvaXtFzQu2WbeTnSr/seoeke0LoTnT1f2ITmVyVWKYiAe/zGBdeFTQXlMRYHtfGKhSnnQT
	mea8s4athiDT/HNDlj4pfHSvtNHs9kw=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-516-pLGTdMW_MPmGvBbgygUBLg-1; Mon, 05 May 2025 05:27:29 -0400
X-MC-Unique: pLGTdMW_MPmGvBbgygUBLg-1
X-Mimecast-MFC-AGG-ID: pLGTdMW_MPmGvBbgygUBLg_1746437249
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4769273691dso73571381cf.1
        for <linux-kernel@vger.kernel.org>; Mon, 05 May 2025 02:27:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746437249; x=1747042049;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=l0RexrooVEAiTnjYfMDdv53LIbR51/bbTVhj6k4gjWQ=;
        b=qnYCzeg38jY6wrWkTbpQ+wryVa7KUws5/Abhbl7qJqcRN4wpRDsg9MB43pdL3Hh4ih
         vDVhU4brQW9qAYPDgxflb8F8uUITv9M03hTNeJf8O85WNLTo6qQJklgcEMMpOBatI1CX
         zlulbkSbSko32YSbXQiSc7zwjPJ8gXRXGZbH5hTNVYL8F82FBreds60m5aPQQdg3EHNg
         5WIKoonE08NIvP7d5fDNt3DCyp9fzMyCH9qNhu3sEDyDVBGXZg9Vd8osOvXy5hzrRafB
         RlatM5AYJdLPQHWtoIMLStnOWc94u05ZgPrs7oyTvQrvQWGENxJ9BIsp/b1TYlbUAHy7
         Cl9A==
X-Gm-Message-State: AOJu0YzRCQ/188Wh1WQI4h/wQi8dGwrxsoh4egORrnnXI05l/UpUlDKd
	TBrwAFwkw9AK+UJFQuf8U5guOf05r2eb2g/JQPZXFLmOoiMVNPYGTww8HeKN+BLswUnUBbcioiZ
	cnIJjVPed/YJOT/AHQ5G7uJIbXCRKZv9aT5xhqBILtFdbRqfLLoUOtGxs+E7hYw==
X-Gm-Gg: ASbGncswJrbJRN7dhqyLQMYI/wMlVqK8RPZeUGKXSO46ik6KDfdgWdyAtNvdvXRN8gY
	ZViaO8hLXscpXz8ibd20n5gOwRoOdnwDttYTki0lUQbmJxx7nLLb1GdmQ5OmNg8Z2QWaiiCeEb0
	VTBWb9GnfIDBcwPYbxFNtN2dV1D8pKRROq5K1aVbTZUcR73cxgL4MBsOgKtkH4E8zGdu5QWqrXf
	5ZfCdgon10Cch8tfboVo1w/bAT9skt60wl1/+HcA0UpxR/F/voKhYKQKrqe+NhB33UskWoYRcKe
	NEqbTkxxNFJYT5WNilRioN1PTlzd1lNFYNogZpDSHg==
X-Received: by 2002:a05:622a:11c9:b0:476:b7e2:385c with SMTP id d75a77b69052e-48dff3e0e3dmr100492611cf.2.1746437248834;
        Mon, 05 May 2025 02:27:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF/m1KDaJj1j7Rb7thoAV6E+uqq6uO9rXBEssgmcDxA3L86RFMfhiWPFXAgyoIIP0edVrBL1w==
X-Received: by 2002:a05:622a:11c9:b0:476:b7e2:385c with SMTP id d75a77b69052e-48dff3e0e3dmr100492471cf.2.1746437248557;
        Mon, 05 May 2025 02:27:28 -0700 (PDT)
Received: from localhost ([195.166.127.210])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-48b98d0fc7esm55680821cf.73.2025.05.05.02.27.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 May 2025 02:27:28 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, Marcus Folkesson
 <marcus.folkesson@gmail.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, David
 Lechner <david@lechnology.com>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2] drm/sitronix: move tiny Sitronix drivers to their
 own subdir
In-Reply-To: <27a5f519-de87-4fab-b465-bb89ae5b988b@suse.de>
References: <20250503-sitronix-v2-1-5efbed896be2@gmail.com>
 <27a5f519-de87-4fab-b465-bb89ae5b988b@suse.de>
Date: Mon, 05 May 2025 11:27:25 +0200
Message-ID: <87r013wgoy.fsf@minerva.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Thomas Zimmermann <tzimmermann@suse.de> writes:

Hello Thomas,

> Hi,
>
> there's one major issue here. You must not change the Kconfig symbols or 
> you'll break kernel updates for a lot of people. So those TINYDRM_* must 
> remain as is.
>

I disagree. The https://docs.kernel.org/admin-guide/abi.html document
explictly states that Kconfig symbols are not an ABI, and userspace
should not rely on these not changing over time.

> Best regards
> Thomas
>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

