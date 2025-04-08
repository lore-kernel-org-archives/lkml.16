Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ED8120B7EF;
	Tue,  8 Apr 2025 08:39:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744101550; cv=none; b=gU97a/E/88z7IQhJ96qrRKfGKA7sWfMlq9oXd4ZM1FnRNx6faDSXpGYMbGulrgVbDKHYSziO2p9aEp7DcVxfxVF2GTSub0B5AEnH7dzDcHjYihs5p8F7tRFqGG7NdrFxYhfWmyAt+6eeAvEOEo6b+Ec11MtsTP6jXW8jWbn98mc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744101550; c=relaxed/simple;
	bh=405oCv0v0rr+OMkwd4+3qXpKT+1Zz2yzY0VGQnD72Mk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FPA1cJjxmVK1TpIPVQ+uwzOTtnczL7J4hCnYN7PD1ugkTNRdI1HuPNy7taERFf17sSX1qQCpnh/XsO5Y6kB0Qx4FXwXrc5kr97TzWHGS4m9ek+QkqQj6A4ypp3/1TaqA0//VrzVgqa+vjoPkZd4D4p0yGpqk6Hs9mwtIhgzkQp4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CXIozNZU; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CXIozNZU"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-ac345bd8e13so889164166b.0;
        Tue, 08 Apr 2025 01:39:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744101547; x=1744706347; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=HDyIU+FiexlI8Yp4O22LTNSEscJysno17gzKYI5gbtg=;
        b=CXIozNZUON3/l+Ds6C22g475uqduIrepAkmPC/PiorJyV3vjUgrWZZ4DUsVTSV4MFF
         vI1aq0viq1CHqyJDSw6Qww2BVPaiPJXKp7l1borenr35lsdlMSpur0Vn2OmkxzfqldYI
         ChLHI0/NPGCgzuzfWgL9bnGREQaUgRmRPXvhSr7fDySRvU4T12z79Wrt5ZVc0oIMp70V
         oy+7IfQyjI3HEWquBntbd/afeEQHy3HGSXxYbcmg/q4gEdsUqddBTDmw0Ozhdd/gogDo
         5aI03oyMu4yeLrvmd4ubUMKkTZTEhghtnlNobGK3ipytkMcPLtQMANex+1QN+/SqjKaM
         kgVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744101547; x=1744706347;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HDyIU+FiexlI8Yp4O22LTNSEscJysno17gzKYI5gbtg=;
        b=iuaOri0GI6XG2HxJV0PH9nBql4wsUYiaGEBzN03Aqft++ch1sFJGWfbYnSS6hgKyMX
         N1EGJ6DxWYCUkNNV/G8bDpQNZ1e+hRUarpKXdQ1iIy6IE6XZ+JXCxmxR1rwluvrzFVPZ
         p+mP0wd/0jFjypnc8kPzdwoBzLsO5v1kJmgoV/ziVl7EO0JutIqFxILPUthNTVHzJMBy
         jZ7vePZK5lvP7yOSpbCO5WRiVbAyDv9S8vhNupN64satQxUzC63+cN3Lw0EjTwYAYmUZ
         K4IK4s6yrveRjl5t9UXsN1YMD94G2vKBWPbbvwKnEdJHJabqpFOdSP35ISXqP9w5Q0mD
         7nJA==
X-Forwarded-Encrypted: i=1; AJvYcCUO7H5TeGV79bL4VirdsLFj6/gQmmEavTLBr22+faH+EmjvxQSJT71N/ksAoSywImfrJpee/eVOGApbXA==@vger.kernel.org, AJvYcCXvbZ4tZYpkAFAe1YDSKCVLGVBeEAmbu6ntMMAYUBeiqL1IEg5iJmOpYxtANFCRd07JB1MWs0dq1Icwr08=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1mgShSEqWjHsxIag6TDTBebW6wVtvic94dic/giZg0X9YdMn8
	a17oFiCGgtg7WJS3wXrPhBgCG2yst7osLxe53CeOr2BmJwT6v/C7
X-Gm-Gg: ASbGncvzPdBRK1QSo2Pwlhx4vnBRgjxZwcFBn8ehX5J+gD3EoozwgJOcim0qdrpiR/b
	XTBmV6bDZ8LWmxCqg2qcZ44LmfMpo9bVFGcNcwqWjANvaIE/k0uPg/7DbSvBKmHyS3CyZwgopdW
	guTA07KUiM8hkXY5cBKewOoZb82arZNMGGfhH1UjPrlWgRnXvYuqz7nibN6dBCZClPoWtk1chsY
	dwnRUZNRECtzHZvq+jwplqRXW8r2Q5seYA7fkpJbRJPBCZhA78BzLRL46KF4dXG7FEngSHcqbZ7
	PjK/vjhc0RpkDgnNs8+JurEHYSjr1LcPHM5QLM6EHQ==
X-Google-Smtp-Source: AGHT+IEUyxsnKMR2pN/zngJ52KbnL+3wxUCetigjHGAUCRCf9j2zB/J8TMaNKDu9bR1vrEE6PVzIzg==
X-Received: by 2002:a17:907:983:b0:ac1:e332:b1f5 with SMTP id a640c23a62f3a-ac7e76510dbmr1070164666b.37.1744101546443;
        Tue, 08 Apr 2025 01:39:06 -0700 (PDT)
Received: from pampelmuse ([2a02:810d:a1:6000:959d:6b59:1561:d2b4])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac7c0184d0dsm869057066b.130.2025.04.08.01.39.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 01:39:05 -0700 (PDT)
Date: Tue, 8 Apr 2025 10:39:03 +0200
From: Gon Solo <gonsolo@gmail.com>
To: Duje =?utf-8?Q?Mihanovi=C4=87?= <duje.mihanovic@skole.hr>
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Ricardo Ribalda <ribalda@chromium.org>, linux-spdx@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] scripts/spdxcheck: Limit the scope of git.Repo
Message-ID: <Z_Tgp8L_8goc63K1@pampelmuse>
References: <20250225-spx-v1-1-e935b27eb80d@chromium.org>
 <12647854.O9o76ZdvQC@radijator>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <12647854.O9o76ZdvQC@radijator>

> checkpatch suddenly broke for me with the same error as shown here and the 
> patch fixed it.
> 
> Tested-by: Duje Mihanović <duje.mihanovic@skole.hr>

Same for me.

Tested-by: Andreas Wendleder <gonsolo@gmail.com>

