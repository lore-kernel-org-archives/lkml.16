Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF59E135A53
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 12:06:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749730012; cv=none; b=bhQNfnuf+gGpcdLBvKYz81rHdfP2E89vw3emlxv2cYRbQKuuXPPbrdU0RTNr0ajWOIi0FPEU0BwPKPLgWTH3AIaptk50wi1S4DIqdO9wq9Lh3JgBpPBUTRt57Br8dIdcWcdrjNcwnio2B4SPk0ovbwgbwWJ1qN0gcAjLwm8YJ08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749730012; c=relaxed/simple;
	bh=bt8x5keeLDE81x2GrYzxHcSD008whjgI3Lsl2w1r3ac=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=ujGynEO2wOyJesg+7u57/sNWLoZgxvoErDe4jR+IznNxxKJe5Xw7EIAdaQ3SbwHeRTCMbiTc1xCFbZW5oThEHNcgykasJsGf+4ql7RJFxnni50dNQMrvi9AitWGvqXtovmMG/K++pBebQoegqRgx6ki37aHJO6btgzPghH1j56M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=g+yez3Yy; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="g+yez3Yy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749730009;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+6AfO1YybxLGPmROnZhI75QLnlG9tkbcH/GZMCHyp4Q=;
	b=g+yez3Yy93T4fvf5cRDaaJEfJouCrFomvnQPyExGItXQsXwZL/w7uqdYs9Je7rJXcqmL0j
	oMosvyw6ZyVrD2M2hYt8eYArLsvA5G28Rp6kUzK92sFd0CoizTfnw7lHsCCDp26YFPxy+5
	jP6yZs7M+/KTgNZRIlaqlMLfH+TJoM4=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-97-R4Bxs8vMN1qTKAan9YxIdg-1; Thu, 12 Jun 2025 08:06:48 -0400
X-MC-Unique: R4Bxs8vMN1qTKAan9YxIdg-1
X-Mimecast-MFC-AGG-ID: R4Bxs8vMN1qTKAan9YxIdg_1749730007
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-450d290d542so4834125e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 05:06:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749730007; x=1750334807;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+6AfO1YybxLGPmROnZhI75QLnlG9tkbcH/GZMCHyp4Q=;
        b=uyuFsPE1LRE8AzKNt29vwdUyxHA1NWOVi9VnhK3KMxKKJ+I0Py20QGgnBRmMcPG8Ht
         EfDP1zK/Eq0Uj2LGGfaqKGYs4cQo5qKBcpEz4Y6OvCQqrVvHaLii3964zbpqFYAxbxnk
         sFVS/aHaYT3K/zscLmOFisxF9FZ1abPGxq7c/8fuS4qNzp4BuKtby62Nl84LgzPU3z/b
         LjViRSnQqbWE95nJrzXoWRvPIevGKCDhm/9GWoxlVmXO+87DGKPVB01Vwc1pLSn0zj4D
         JE37OeRT4vtDOOVb9BRSyYQe22n4EdJnTnyS6/2cLgm/WOGLKNIaheNLQfe2i5U7vffO
         F5kg==
X-Forwarded-Encrypted: i=1; AJvYcCUmOk8uPzvh25QPj3baNXRmgLeLLmGLqax7vRzfPcFE9nLEd0SK5j4qt5RwmC+v8RhSJQaBBWgFrriJiR4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzdXNuAo1UPqU9P+WLsXMoY8nL5dhHBRLz338fePcp2cL62BQY8
	tlSYIKJsDb819cd32fAhXBL8zFMPqEhfT0bAUl/W2+fKI/+DT2e/bjrE5rzfvyVKbvcQMAVYL+N
	vIqBwqFhSS+eKYBMxYKAaY3+AiDBNRHVJvsS7qaIZQNX9PY8G9sMCkmzmdWyKLR8/Yg==
X-Gm-Gg: ASbGncu3mNvmEyOc9+X0onvrMBun32Wqk4TxEZF2YZpCA0Am12SpbpSdgNxbG+NeXRs
	JtKs4EH+NwFXTgssV7aITi/f1A04+ntUOXLjutrwpXlqF1GzKhAroiuq2fB0QJHQgb7niYKebV6
	lLfab+waKGac2jOCjGwGJBGqCxK1QzLBrKmNG3KpVU+NA7FQkZovpznBs0QTpB50kXUqO9ii+C9
	uDUWjq3ROL4KNaudXZmCXOpLlDL15jmM36jRWfFE0cFAWBQRRsKW4UJl2FY5Lg4UpGNxOdKnczc
	75jVQwO9tgG5LPTdO3a4tW2LIZt8qgI2xylb98LGFs28FrYko5HwPt6YZiITyVSOe0pABvUshlf
	552c4
X-Received: by 2002:a05:600c:4f07:b0:450:d3b9:a5fc with SMTP id 5b1f17b1804b1-4532490d350mr60458885e9.27.1749730007373;
        Thu, 12 Jun 2025 05:06:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IECOqBPukEfbMMYv+M4kFQvSfoApbouCQboDsRv8ZIe+hsTnwqXQ+pN68YZ/SnG6HPde8Y/Ew==
X-Received: by 2002:a05:600c:4f07:b0:450:d3b9:a5fc with SMTP id 5b1f17b1804b1-4532490d350mr60458475e9.27.1749730006945;
        Thu, 12 Jun 2025 05:06:46 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532e224888sm19001155e9.1.2025.06.12.05.06.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 05:06:46 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: John Keeping <jkeeping@inmusicbrands.com>
Cc: John Keeping <jkeeping@inmusicbrands.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/ssd130x: fix ssd132x_clear_screen() columns
In-Reply-To: <20250611111307.1814876-1-jkeeping@inmusicbrands.com>
References: <20250611111307.1814876-1-jkeeping@inmusicbrands.com>
Date: Thu, 12 Jun 2025 14:06:45 +0200
Message-ID: <87cyb9w4dm.fsf@minerva.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

John Keeping <jkeeping@inmusicbrands.com> writes:

Hello John,

> The number of columns relates to the width, not the height.  Use the
> correct variable.
>
> Signed-off-by: John Keeping <jkeeping@inmusicbrands.com>
> ---

Pushed to drm-misc (drm-misc-fixes). Thanks!

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

