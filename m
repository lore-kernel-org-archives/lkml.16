Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3153716F841
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 08:24:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748334254; cv=none; b=QultMlctwDyp6kH7CuiqxttkHeRyZ17VWYaUXW3pkLYG4ud2IiEF34fcDExdHCPXHlKttqVldjM2DtxoNrGEqAFOBqfcHfhyxeCvdjXCbrf298wLUsUMWfSMHyQ7EfoL4YLraYmXC0QOROfpNwXSTIVi1JFpxTahQSWdvsPRld4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748334254; c=relaxed/simple;
	bh=t1xIvOTQ3Ubg1AqjSs07aZxP+v69vlZZUX+s2th+E7s=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=KE6BRlHYAaLp0ru7BpScF0FB7XHey/gwZAfXqWTMfqfC3zKyC/17jLnPLl5wlTtS9BkAEW+wah4TrHdh3TEC8LLu3nwYW961CjeIJNGE3tXBnucVZ7amVKv9Lb6RqCcgrxCROVdwAvpsSLLQoO0w2udHW5+m0zHqN+Z/IfmpF6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=MmB223AX; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="MmB223AX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748334252;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=wmg0zgm8bwqGKOccpFTuoOfVUzJFvXK1R5rq2g9wG2w=;
	b=MmB223AXYLQRXrVmKrlXTfYuNhJ8uvJxzJSMYqij2+KoIx4lPtPnvXwxy4Dcb7KyvFSYEl
	jypZ4BAoWrPdNbw8mY2UXHswiB8dGg7g2KSAsHomJCLr7NMMAssbRHiVmkmzyfvcTZIAxn
	DI7iDSv2zlncxMY5xZkYNLrnityjA/I=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-408-OC5UcGqfMNagKzgskqjJLg-1; Tue, 27 May 2025 04:24:10 -0400
X-MC-Unique: OC5UcGqfMNagKzgskqjJLg-1
X-Mimecast-MFC-AGG-ID: OC5UcGqfMNagKzgskqjJLg_1748334249
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-3a4c8a4963fso1869350f8f.1
        for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 01:24:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748334249; x=1748939049;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wmg0zgm8bwqGKOccpFTuoOfVUzJFvXK1R5rq2g9wG2w=;
        b=MmHdJe7AeDfu1YQHLsXvVFhxvPijcwGgyiXaeEbgswJBAty9gKzCLt2CfX6xBTcudd
         b7Uew0xnDj8t9wgf4AZ4GfB9G8Uvkp5CZOK1iE4C9o9iSvtYIcj/qsVzci5juq/OFHMf
         vej1EzGTRDU8nL/Tx+hXLSMKRZQ+eRol95SpkQzxcxwhUQZyHX7YqIzdJ84GLgGD8ClQ
         3/vXA8HN7resd2pLQxuuwbWhu7qz1inRZ5WQokkHI/5HyInWrLMFoz3t7Gxb64FBtBCT
         Z4XyhUPUp7Y+e/ws5Ye5syUjqSj8C9Sn67dQiFatsM4lbc/rzKB+8Qg7Fjm9v+m6gfVZ
         hKpQ==
X-Forwarded-Encrypted: i=1; AJvYcCWOZB2jP4ewwOgiVZR4OrJihTXcw+vh5lwMcU7o3XwZ4hWWvKNhKVzkN/BoomotHfoAkTU8v4y5UxXROHI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyudg57e7V5bSjkNGVNuP83MMviJycAzwP/H771LrDBaXzPOVuU
	W3wcZmMjLNVuJDabd5xxzaAbTS9koSXGrTAEaNXckOdrJfBwEHvGQPzVucEQpbEyzu0jmwNKVrY
	sdKv7Oj3qFfdyCAjQnJjoFv6z0CTZEPLAVxI9PslOkcJsxvlekBFe/DODHohr4j2dMw==
X-Gm-Gg: ASbGncvC9N61AmMlVVF7rScfEQGvDmO10Gjjf2MnigErtcXRooM0ZyumSp9zuZxd4hu
	NoNBWgXEMEw78+ULjI39wI/AM1C6xJZV1utBP6GXsqN8PpRMUcQzXzxyz8IRvHWVssGa0bZqSYM
	Wgvv72RsSFnAOKGlIvkd5YzZ4Ecc2L7i6C6zgtrIivu5jp5iOEhMzYpgNof39yZ1xFb0klb43WL
	BVIprAc9i4KdvhwAiOHLWOp/MkX09D+lMj+/DPVZH6zBTkEs5wEzGSWdPQkYFduqoEM9Pu/L5CF
	15mhPj4Gn6UD+52sZp500sbEa9hXj+XFFfF2pm29Xcr5wvPRhlZg2P+ve5QOispgb7pyeQ==
X-Received: by 2002:a05:6000:2586:b0:3a4:c6bc:df46 with SMTP id ffacd0b85a97d-3a4cb498f7cmr9722388f8f.49.1748334249333;
        Tue, 27 May 2025 01:24:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF2NpPfVPLaTXD9jufYOsVImLYDjqmB2qgUWGjuL2yiKQhM/XPh2hThBUvyKuRRzV/QF6aQjw==
X-Received: by 2002:a05:6000:2586:b0:3a4:c6bc:df46 with SMTP id ffacd0b85a97d-3a4cb498f7cmr9722355f8f.49.1748334248920;
        Tue, 27 May 2025 01:24:08 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4e4f4d58esm39466f8f.28.2025.05.27.01.24.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 May 2025 01:24:08 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>, Marcus Folkesson
 <marcus.folkesson@gmail.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, Geert
 Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [PATCH v2] drm/sitronix: Remove broken backwards-compatibility
 layer
In-Reply-To: <87msb7ny2p.fsf@minerva.mail-host-address-is-not-set>
References: <20395b14effe5e2e05a4f0856fdcda51c410329d.1747751592.git.geert+renesas@glider.be>
 <87msb7ny2p.fsf@minerva.mail-host-address-is-not-set>
Date: Tue, 27 May 2025 10:24:06 +0200
Message-ID: <87h616tqah.fsf@minerva.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Javier Martinez Canillas <javierm@redhat.com> writes:

> Geert Uytterhoeven <geert+renesas@glider.be> writes:
>
> Hello Geert,
>
>> When moving the Sitronix DRM drivers and renaming their Kconfig symbols,
>> the old symbols were kept, aiming to provide a seamless migration path
>> when running "make olddefconfig" or "make oldconfig".
>>
>> However, the old compatibility symbols are not visible.  Hence unless
>> they are selected by another symbol (which they are not), they can never
>> be enabled, and no backwards compatibility is provided.
>>
>> Drop the broken mechanism and the old symbols.
>>
>> Fixes: 9b8f32002cddf792 ("drm/sitronix: move tiny Sitronix drivers to their own subdir")
>> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
>> ---
>
> Acked-by: Javier Martinez Canillas <javierm@redhat.com>
>
> -- 

Pushed to drm-misc (drm-misc-next). Thanks!

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

