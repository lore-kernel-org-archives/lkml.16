Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A661C26ACB
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 16:02:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747324938; cv=none; b=S17cQveLrhS22A0vAKdhUqU+/16VDSogi7KF1p+DM2ni4jHbSxcKEL5BgsNtL1eofodYZ2FpJBblXXOaMzfZFsJI7UEY+jaUof3JGkJR7RkPf5DMGvoX/pI6MtsHTPRUQEWcOwegE/ZD+GuF4YckFVr6zH7GdlXodvxqnluIEWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747324938; c=relaxed/simple;
	bh=mFVzz9p8nfztx5gF1nGVYeQVyOsEHOvOODmYxl6S9X0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kZvYgxPPM+XlQD3d4pHkdTkDgrh/iEHLKY3pOkxHhX79p1eT6JBaQmzgA/BGThwjGe53xllo96gd37MNHcELDORhumwD1HlMcrj6zu2CYp8+lSozavVBzIVIkckQVOJfAO+NEqZsUJmoGwI49ENkm/ciOOYfLfG6PDhv7agXUHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Eoe1tLND; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Eoe1tLND"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-30ab344a1d8so1037601a91.3
        for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 09:02:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747324937; x=1747929737; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=mFVzz9p8nfztx5gF1nGVYeQVyOsEHOvOODmYxl6S9X0=;
        b=Eoe1tLNDmKeHZrBGtGvfxUrzFvba3Za1ac3dB8RYHNlWJ/Zfxski4o9FakQs6k4bpv
         vTtLV8mcMmhbiIkVZayNldK6HSGMTMJMfNWZ8CBJOTzZ4l52RAPLHi76AOTTaCk0QlaP
         PVCjgmGsx6A96BV4+UJcpAAXEcdwPWB+NSQTS2IawqtJvm/vKtZ8oTyE0E09zfmSXdSJ
         Z9ZLNoF97e6wQSwAT6ZEdyI5FpDJn/Rdjjk00TD4ETULdAiL+A9mruGQ0bVF6Cdrr6kj
         4DjAsB15Up+4AwK4ekdAPvcCCr7/pUa0+o0z5f+rDyXgE9vtAw6bwvjHEdybQq7ehBn3
         x1nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747324937; x=1747929737;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mFVzz9p8nfztx5gF1nGVYeQVyOsEHOvOODmYxl6S9X0=;
        b=ZsJ8d4iGhGDKIvdNpdX2+YFHnSb9si0bKJun38KooYwbXzKkuan4M/3Q1Z9H5xoxzG
         azyJishZa9FUfu5PPqgEI3+zH0LJ4r6zJSN4itEOhVNtwYxH/wD/5B8/5R5ecxuOzqck
         5C3NvDC30fjjL+r1h+h8ZpyDghNYL4RZdIkgzQl/CFamI7IQwKx8HGlrq24bBPSZQbXa
         QDTede13tBv6bMS2N6iv8l4DP1M6irTy0+mJzkS38Yg7Qtgi4He+tXHPFzN+URe+yS9t
         8ZDL+pnbjB9qfr3I/HUPBrd16oL2OpeNy0djhbrMsePOzNup07pQ6KBmka2TkAwMA+nM
         a6+g==
X-Forwarded-Encrypted: i=1; AJvYcCUtuXSbpbU++YmaBRzW8olCtslgK6qAg7GYoqXI4+e/1ojpi71t3Ajd+cydwJxk8jLK8ldjTcIvCXLIO1c=@vger.kernel.org
X-Gm-Message-State: AOJu0YyKfng8AvG/hvjlWDllyCiYBOrGu3amsvz7h9kLDeniT+5UJC8D
	yPI9OtdyatcJ1Y/hSrIVk4TeczXU8n2/24cSBc/BPqPAcsLAptsGw7jwRRHTpo4i6n8k9fBrkTX
	esBp5/Gk+6bfZQsLTLyNQFtegdg0=
X-Gm-Gg: ASbGnctfM3IPE15CfDh2OBOarC3vtAwEDc0FkvZ+3KfFaA8njQSCvGgMsQ0LMyOMupj
	4TlnamanaGaEKLekzljWdQUUax7h75A7q8X6RmdCt/933kG4OLZMoiAynWzsNp8whdBtDxGiGzg
	nUiJgHlLCN4tk0UIe9RghFM7/2AlRlhe0=
X-Google-Smtp-Source: AGHT+IGDOIZGWOmD296FS3hkTixomDty6fSvG2HOiEQYrAsqxmtVUY12en+avv8fHmq7vb8xEgxioYdEU0tNiM7o0XI=
X-Received: by 2002:a17:90b:4c4a:b0:2fe:b9be:216 with SMTP id
 98e67ed59e1d1-30e2e642306mr10564212a91.31.1747324936572; Thu, 15 May 2025
 09:02:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <0250510102130.14710-1-amfernusus@gmail.com> <20250514151130.701885-1-amfernusus@gmail.com>
 <20250514151655.GA31705@lst.de>
In-Reply-To: <20250514151655.GA31705@lst.de>
From: Ilya Guterman <iliyagutermann@gmail.com>
Date: Fri, 16 May 2025 01:01:39 +0900
X-Gm-Features: AX0GCFuKsxJ3JOZQYgEyE26LSRAa6osFiGqWClik1JVAd51MntNf-f1eZAJLX9Q
Message-ID: <CAMraO693bYptEOA-bH-GH5drx8HJkqW-7a8652Gi1d=__pxavQ@mail.gmail.com>
Subject: Re: [PATCH v2] drivers/nvme: Add quirks for device 025e:f1ac
To: Christoph Hellwig <hch@lst.de>
Cc: kbusch@kernel.org, axboe@kernel.dk, sagi@grimberg.me, 
	linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

I appreciate it, Thank you.
