Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BA7C26C39A
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 09:04:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747645484; cv=none; b=FbgdL9MENaT+6o5onjvOL/vpuUf/XxwzRsvmuKPwMkTR4ahkvewUhNh5UrOr8/cBV7bUfaU6aF3GW8fmmzq8cKdYk4hIggvqUcWuZE6vLPgdrXPlzXICQ6XelHCglvfygpAU6eyni2mO7qbApeliZzRiTOcLgTs7gHeEgkOVF7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747645484; c=relaxed/simple;
	bh=s3ZF/R71XbQ2Wv8UWMHptS1RGAgFwyxTx7aSnB/lvm8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=AoTobwX5OUbw8KLa4cCrUvMhkn98MMpeWEwVhsEreLIuHPEQP+eJYhXmjNcIOaWV2GB7Q3G3Xc1rJjCGsckAkVa/0V1eVVpRJrZFmuCoMx6ePG9YH+FJf5uIsKI5LXNkEFFdPcwHPK8I113VCYBl2RF0Noo+jPLJnmdL/wz0XQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=A16mladY; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="A16mladY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747645481;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=b+x4vTIQvSf2FWpLg3QbvkOR5KW8aweHD+AVnGY/4x4=;
	b=A16mladYeC2yACADKg42Cz+2irTFDpgXpS9ZyERYIQcTPvos5QrKQEABLDqsy/VDG8mhgY
	o276q07oqu5jGmpNN0vFqHhUS/zffEvJfoN+eFNZKUav8nYbHTtMmu0AAQ0WD4YhLFkwLN
	pu1GEwoMZoWuFKV2ret1L4wRe72JMjg=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-386-4W23eg3MOPmJj57bSZcCZw-1; Mon, 19 May 2025 05:04:40 -0400
X-MC-Unique: 4W23eg3MOPmJj57bSZcCZw-1
X-Mimecast-MFC-AGG-ID: 4W23eg3MOPmJj57bSZcCZw_1747645479
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-43e9a3d2977so30937255e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 02:04:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747645479; x=1748250279;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=b+x4vTIQvSf2FWpLg3QbvkOR5KW8aweHD+AVnGY/4x4=;
        b=bwVNn3n+wm3H4ULjBLRUBs5zHM4+txDrghydmSpBhHnoCtsN1JFsns+Gkc7803+xLk
         Z6a2fIyELBIScwavNsbAKL1BlF3WyqayQ/Rn8LF+KIEOAyg36BOTDy1JWX+rrD9tU0mI
         s2U5lEu5b0hzVzUyO4WWhsT67xCFo5oxuPb1WvXgObgnjOFN2yplRFh7zw/xJxhbuFNb
         y+STf0IjuXSoZ8H/0qKSF55Js9AUzmVHtvVGLiMLIL7+EWmXfMgTcDT4jLDmUoVJhtoa
         tS3Kkq+NVTzcH/5fmT2GWtVhGGOyTxHp8vKPpi98v9UcRwN9wqilFCDwzE5eOwL/Xsq5
         FZRw==
X-Forwarded-Encrypted: i=1; AJvYcCV0GJkbxscsb7xx+lf4OyJGo8b64xgoLu55Rj8fs5r6yj4U8rgxJ6WoqdGrjWbC/D9j0oyn6nXbsBWmioU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yypf9jDw0SV6SL6FyAEgBhudQgQnsqWVy3JNAPCoCEeqNcdRgXl
	uXG77nNzgcq7q8MGbIwiNHwQg6ouDAatf90zSxuFs0JjXJaATucnlzn11iTtrjhJo6wxBr4Kiu9
	hCUDoEP30d1XPYHWSdTxEMiPtUoQhcTXDkdp/k2e/qbkmd3g0aC3hNib/OWCNvj5UYw==
X-Gm-Gg: ASbGncvSAhlqNux3VyIfPQLhtk3L111qEI+mQAmM4hUq2m9dqn1TnPyiLNKw2bOK9S5
	H0GtMtzpmZBY4MFJ7EUMCtlLe4NINE/HRT4tb9GgCXvzhKhHWqUQz3r2WyB6DumnP0ZgTxXIp/4
	5gmS/8oMhBI9MHONhk2epR7WzZf99C4dHtzGH2gvZntLauiWzDwX38bX+l45mWlPSEEd/TZEMfI
	4gwIEMvlqZO3ux8Z9w+m5c4UAUeW3KM4jzdpSg722e6sXLzD6CcN0b27G3YDtxfB+M80vjPK2YM
	4v0oawlaN3ARCXgqvk8kDRRKmHrm4UXcFyx3NYGHpw==
X-Received: by 2002:a05:600c:524d:b0:442:e109:3027 with SMTP id 5b1f17b1804b1-442fd6649bdmr105814925e9.24.1747645478940;
        Mon, 19 May 2025 02:04:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHBHT37+a7uQLiNF7xXa9+Pq3Q8b9W3F1Dvt9NV0dg1vkagGrtK9lGqM9kuxuBv+sLOTByRBg==
X-Received: by 2002:a05:600c:524d:b0:442:e109:3027 with SMTP id 5b1f17b1804b1-442fd6649bdmr105814645e9.24.1747645478524;
        Mon, 19 May 2025 02:04:38 -0700 (PDT)
Received: from localhost ([195.166.127.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442f3369293sm207128905e9.6.2025.05.19.02.04.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 02:04:37 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, gregkh@linuxfoundation.org,
 hdegoede@redhat.com, arvidjaar@gmail.com
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 stable@vger.kernel.org
Subject: Re: [PATCH] dummycon: Trigger redraw when switching consoles with
 deferred takeover
In-Reply-To: <20250519071026.11133-1-tzimmermann@suse.de>
References: <20250519071026.11133-1-tzimmermann@suse.de>
Date: Mon, 19 May 2025 11:04:35 +0200
Message-ID: <874ixhotss.fsf@minerva.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Thomas Zimmermann <tzimmermann@suse.de> writes:

Hello Thomas,

> Signal vt subsystem to redraw console when switching to dummycon
> with deferred takeover enabled. Makes the console switch to fbcon
> and displays the available output.
>
> With deferred takeover enabled, dummycon acts as the placeholder
> until the first output to the console happens. At that point, fbcon
> takes over. If the output happens while dummycon is not active, it
> cannot inform fbcon. This is the case if the vt subsystem runs in
> graphics mode.
>
> A typical graphical boot starts plymouth, a display manager and a
> compositor; all while leaving out dummycon. Switching to a text-mode
> console leaves the console with dummycon even if a getty terminal
> has been started.
>
> Returning true from dummycon's con_switch helper signals the vt
> subsystem to redraw the screen. If there's output available dummycon's
> con_putc{s} helpers trigger deferred takeover of fbcon, which sets a
> display mode and displays the output. If no output is available,
> dummycon remains active.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Reported-by: Andrei Borzenkov <arvidjaar@gmail.com>
> Closes: https://bugzilla.suse.com/show_bug.cgi?id=1242191
> Tested-by: Andrei Borzenkov <arvidjaar@gmail.com>
> Fixes: 83d83bebf401 ("console/fbcon: Add support for deferred console takeover")
> Cc: Hans de Goede <hdegoede@redhat.com>
> Cc: linux-fbdev@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: <stable@vger.kernel.org> # v4.19+
> ---
>  drivers/video/console/dummycon.c | 15 ++++++++++-----
>  1 file changed, 10 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/video/console/dummycon.c b/drivers/video/console/dummycon.c
> index 139049368fdc..afb8e4d2fc34 100644
> --- a/drivers/video/console/dummycon.c
> +++ b/drivers/video/console/dummycon.c
> @@ -85,6 +85,12 @@ static bool dummycon_blank(struct vc_data *vc, enum vesa_blank_mode blank,
>  	/* Redraw, so that we get putc(s) for output done while blanked */
>  	return true;
>  }
> +
> +static bool dummycon_switch(struct vc_data *vc)
> +{
> +	/* Redraw, so that we get putc(s) for output done while switched away */

Maybe this comment could be a little bit more verbose about why this is needed
for the framebuffer console deferred takeover case? It doesn't have to be as
elaborated as how you have it in the commit message, but more information would
be nice IMO.

> +	return true;
> +}

Acked-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

