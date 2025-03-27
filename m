Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 132A020E003
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 09:57:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743069430; cv=none; b=AYt8JqQWHIinTxC90oADRs6NV7xW8+9ndy+o2pyq6tuYX4udX5k5FZiPcHSpq5e8ES1bhpfyJGAABYgMgxDi9KQNHGP752x7/XcZva80VYipqdPodw64dvzpb+7TQjc+uffT9Ury2REmYB36nSnOR2jMqp50HxbnhVPcYcAeOf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743069430; c=relaxed/simple;
	bh=AZTW3sYxFHPk0sPFQTttiOZU/fA3BF1URGRK7nuIn6U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c65RzypC+Jjrf7h+1vbKhkgSjjGYDlNwuXvRKFVY/lMBLumXBQPQCtQt4DsLEMorj5zP5GFlxKiJMxqfwR2TJDbmfWGWwJti8XRXJBZwWlCLCvMh7cWFtwnBhXyD/QXaFaS1XEmxw7B/Q+fUy3fIzLN8/oFZVyHrraCLAYs+dEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=fAdd8c+U; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="fAdd8c+U"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-43d0782d787so5456985e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 02:57:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1743069426; x=1743674226; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=azhWYOyoPENmsPwsYBmojB1LmnODjI23hsEwWUC2iFY=;
        b=fAdd8c+UPL+akUmF8P3kPcNeC/DQ+Dk/NS2oeEzYSyuHOKUjA6/BpZHEcBeZxA2TIL
         5uwnmAj8ZEoh8azTGDDpXaLTTH+k91RSegHwAKDFpmhqECEnoWv/aKGY3u0bRIFwZWBY
         bYOrdVF/IvDiiS8+t2LIhdN2oWPOvJpga/MCci2Tr8p1y9oSpKkZOM1gx0XzD/LzyiuR
         MAywNWCZuDJd9VVnzqIc27aH7uK5jTQDBA0Wv6MhgvAx14Asvpt+WurlBDC4HBWuiU83
         cUo2X+FjU093jmNHsSABMnXWIndcUBcszOcVc2lnTrkNf2S6eX0aoouiUR01Xhwzjltw
         iwCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743069426; x=1743674226;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=azhWYOyoPENmsPwsYBmojB1LmnODjI23hsEwWUC2iFY=;
        b=ldsqVHb3lcJYt14T2qKaY553jr/SIjaeufKQYhjYW0agzJlq4pJzezl32RGks39jEd
         Yizl7uT+dZAek5xpEk8H0J+1wpqT5RebHooepM8wK2XwHtVUKcWKhgtkuUNZ2XmbVkcX
         BhRvKoiwlNIJj9n+Lpvqcd8sbG2A7esKeFUptIiTvQd7AzQxhANoG0NdoJeKMTCToBdT
         sSwCeabVXyc5tCfxwvSsyyzsBjUf0GecfQcoCydrk1JNY95RsLy1SwQKintQc+B75fJl
         6MLq0wahBg3e+ERv/T4Rtb5CBuJcStGhD7XJR9jeXKvayNjtcs1Ao2uTNMPzXXqVROC+
         RhDA==
X-Forwarded-Encrypted: i=1; AJvYcCWUdR9C6Zgkrx1myIq8QAw1m2pvtLJMqV/d99xq0Dv2bDRPF0XO4//xbre3gD3+VLUaCGcTKbF+P6LKtBA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzavK4vpXkOb+42NGZ5Is/L4/s+PdDHaK0BSQPOYd5ELMmtQ4Sb
	W1ue7+xt3wWsybXebSIQkJ79CTZT5sxdP9ss5Uc0wN6A/37r10tDJGXOcgcEras=
X-Gm-Gg: ASbGncuyVVL+pVmHWaTe4zJ9W8lB7Pk8PaW75uWyh93+yoeEjAipZkY0Q27+G8PUH1L
	HYFFv7QwmxoRZ/LnUXguE81ehSsQ8JMGjBrVyczqyZ3dYtZEsno1X2oXbHtfUqSBtLTTqfsfSf9
	muC6Q3WO37Ocbf1DUU0HcG70Eq3spcFraiRcXtMfqlHLBaer4KZa7R/FRxI6DOhvwsEX4vyS1ou
	BKSBOjNnUcHniJMjZGBK/h2GzZBgy/qtbMAzkjXFltEo1abfkWvn+AU73r+C0mm6jUM2Ggp9j6J
	4jMHTijeF1qgQKMJtQhUFz7XlLycxymavQz2xqvp1/Fa2as=
X-Google-Smtp-Source: AGHT+IG0C4/rhsbIrvHN9c358LUEtRlf07bzJU/mmHWp5Eqp1R+dKhX+DPE3+SHx8Tl/dF1nMcvA7Q==
X-Received: by 2002:a05:600c:1d16:b0:43c:f895:cb4e with SMTP id 5b1f17b1804b1-43d84fb5ff2mr27733065e9.17.1743069426289;
        Thu, 27 Mar 2025 02:57:06 -0700 (PDT)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d82f7f9b6sm31682035e9.39.2025.03.27.02.57.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Mar 2025 02:57:05 -0700 (PDT)
Date: Thu, 27 Mar 2025 10:57:04 +0100
From: Petr Mladek <pmladek@suse.com>
To: Aditya Garg <gargaditya08@live.com>
Cc: Kees Cook <kees@kernel.org>, "tamird@gmail.com" <tamird@gmail.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] printf: add tests for generic FourCCs
Message-ID: <Z-Ug8FeyJ9fTMhNf@pathway.suse.cz>
References: <4378DDFE-3263-497A-8364-433DC1984FEE@live.com>
 <202503251247.086BD45C@keescook>
 <PN0PR01MB958842137184723FD29694E7B8A62@PN0PR01MB9588.INDPRD01.PROD.OUTLOOK.COM>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <PN0PR01MB958842137184723FD29694E7B8A62@PN0PR01MB9588.INDPRD01.PROD.OUTLOOK.COM>

On Wed 2025-03-26 00:26:08, Aditya Garg wrote:
> 
> 
> > On 26 Mar 2025, at 1:19 AM, Kees Cook <kees@kernel.org> wrote:
> > 
> > ﻿On Fri, Mar 14, 2025 at 03:45:01AM +0000, Aditya Garg wrote:
> >> From: Aditya Garg <gargaditya08@live.com>
> >> 
> >> Format specifiers for printing generic 32-bit FourCCs were recently added
> >> to vsprintf. They are going through the DRM tree alongwith the appletbdrm
> >> driver. Since the printf tests are being converted to kunit, this separate
> >> patch for the tests should make it easier to rebase when the merge window
> >> opens.
> >> 
> >> Link: https://lore.kernel.org/dri-devel/79FA3F41-FD7A-41D9-852B-D32606AF5EB4@live.com/T/#u
> >> Signed-off-by: Aditya Garg <gargaditya08@live.com>
> >> ---
> >> lib/tests/printf_kunit.c | 39 ++++++++++++++++++++++++++++++++-------
> > 
> > Linus has applied the kunit /lib move tree, so this patch can land via
> > regular trees now. Who should take it?
> 
> For some reason DRM has not taken up the patch set yet, even after approvals.
> I assume it's partly because gitlab.freedesktop.org was down for a whole week.
> Now that merge window is open, I myself dunno what is gonna happen with those patches.
> Also, I doubt DRM wants to take this up later. So, I have 2 options:
> 
> 1. Just wait a bit more, probably till merge window settles so that DRM can take up those patches and then you take this one up.
> 2. I'll just send you the non DRM patch, and upstream it via you so that atleast you can get free. Then. I'll tell DRM to just upstream the DRM relevant patch, again after merge windows settles. The patch is anyways a bug fix, rather than something new.

I prefer the first solution. I'll take this patch after the already
queued patches reach the mainline.

Best Regards,
Petr
