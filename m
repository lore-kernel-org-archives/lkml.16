Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B2361FC3
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 01:38:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746754701; cv=none; b=Tj9gh6WXXku6yJobec/9CTYKEvybdbQ3V1DH5ltDYShDHEB/Olq9WbVkvKy4x504VDBzdGH5/3eUO70xGA7LSchnvpWZmQqHqYRnSti/Zmu4b+kjbguGchki67UX79yNiwoZeaZC20e0WhDpUs1JnNWBcwYq1A3IwguPs0nGToE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746754701; c=relaxed/simple;
	bh=9usjLUr32ZxLro9cjrGBZHFD0yVa51/PNmixGpgHEkk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nfFJlw2ftjVchJtLvP+ciWQJ3WVuEMCoEV4GT7FbJpVdzhhlS7sBLO4+YniuCqlZhbgt9E4ELf15yeCU95DtSn30m2IMsJ/rpeTby+gw/c8cFXZZTvzOKZb363eO+9CDu7Y0jbmC2eCIUtc7/+zHI1ybrI6LPQaNnh1dZ1V0CUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=eHnPL9TG; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="eHnPL9TG"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-22e5df32197so18055275ad.0
        for <linux-kernel@vger.kernel.org>; Thu, 08 May 2025 18:38:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1746754699; x=1747359499; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=q1ZcdHivvNbREwW8KHlFJoP7qz78WcmPAGgzmVjdBy8=;
        b=eHnPL9TGAMg15ELV4jb5dXzRzcXss9/mruTqWrjhRidqeglrWLqDqksFkHCSlns/Z/
         czWhqM5Ll0UMrKmQj5TO6Hnby7lcukAnvOS9ppl2kLnICsinNJPc+Azvqvmn7y8DKUVu
         i4URvOYBSH6ILqyMiZbMEvWMmRnkMHbsxyyZc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746754699; x=1747359499;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q1ZcdHivvNbREwW8KHlFJoP7qz78WcmPAGgzmVjdBy8=;
        b=sgzqM5hm67CTQnymnB0/OuAg0WjcrLoC4SrDlMnyhaWX/SDu9XxwlmgVGncc6qVIk2
         6uoMYMiXB1QAJhaYnq2yLJMfo/X267TffSwltZTFvS5B9PD5F5aJi161AY3hbijmyMQO
         tm5iQsuOQ1sL25LqWkf0MB6WwlI+IMDl8EF8gSbT1ux/xERyDv55k9GArQoPjGOS8twD
         deNgxncuKD/egADBK24uuMyMoHq8q191whYhxZ8o7iKrfrhIw2pZREBGibcjyRTn2zdS
         7J507aixZJSLvf501n8Z3ZXxHC+nheZezjRC6NpOPtvA4E/1XUqlFbyDxjmEOotCiA0y
         z1cg==
X-Forwarded-Encrypted: i=1; AJvYcCW/9YbbwvNoFmWwOn5K8hTUoplqVQTn4l8jlqkggKFUAWGUOEbbRHmRWC7jTa+MpmaU803w3GRw8rrAfWs=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywp/edEzYBpydG9+Xq6XNCmJGVozKiD6rKFNvJmrr+Kdt6wmDtM
	7L/j2kxM0KpIH8rJ+WYmidYtHd5lghUQFa5FSlFSYDBSbBYO4pbIm99BcOw/pw==
X-Gm-Gg: ASbGncvOHcObM3xznw0QYCyN3eUAiPL+JSAGGHCKFRKv1fqe2SbSDQRWB3brCh2phSq
	rsF+Xwn51xHktUZtmo7m5/HNZyDpPZK105/gpR9krDPHnHwred5Pt1RvoAN4IKyxf981Yuq0mS6
	Szy7jljasR/U9tTEpRJFbb1D1tSmf0w3E+cOdeqS+c6uVuF62OUBWMVqcp43qDQlEqgJivN8hcj
	vRQShzQXOHKvt2vWwA6b5zBYSRFeWnLYGdDqKDg8GVOjoQft9ZR7UJm+E6aznxDCKBMr1/OEt+8
	CJtt2CxuOhqBWu+wzYMMgHkyttOYW4FCy/2ChgKcAzUW
X-Google-Smtp-Source: AGHT+IFi530B2sRlz6o2F/z+hAqK2/FbwxnukCcHQ1nZH/APjuWe/i1i5zKAQV7eV8o/m5e/WA5XFQ==
X-Received: by 2002:a17:903:2349:b0:224:10a2:cae7 with SMTP id d9443c01a7336-22fc8e95bf0mr23837955ad.40.1746754699453;
        Thu, 08 May 2025 18:38:19 -0700 (PDT)
Received: from google.com ([2401:fa00:8f:203:c794:38be:3be8:4c26])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22fc7743b8esm6432555ad.101.2025.05.08.18.38.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 May 2025 18:38:18 -0700 (PDT)
Date: Fri, 9 May 2025 10:38:14 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Zaslonko Mikhail <zaslonko@linux.ibm.com>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>, 
	Minchan Kim <minchan@kernel.org>, linux-kernel@vger.kernel.org, 
	Andrew Morton <akpm@linux-foundation.org>, Ilya Leoshkevich <iii@linux.ibm.com>, 
	Heiko Carstens <hca@linux.ibm.com>, linux-s390@vger.kernel.org
Subject: Re: [PATCHv7 10/24] zram: add zlib compression backend support
Message-ID: <gekqwhcpombpm2u3b4xl7zladuyzbxybeq5wcwt47k7tsgo4bh@rfrxaeqwzypi>
References: <20240902105656.1383858-1-senozhatsky@chromium.org>
 <20240902105656.1383858-11-senozhatsky@chromium.org>
 <6046d139-2a46-4824-bdfc-687750c1ee5b@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6046d139-2a46-4824-bdfc-687750c1ee5b@linux.ibm.com>

Hello,

On (25/05/08 16:19), Zaslonko Mikhail wrote:
[..]
> > +#include "backend_deflate.h"
> > +
> > +/* Use the same value as crypto API */
> > +#define DEFLATE_DEF_WINBITS		11
> > +#define DEFLATE_DEF_MEMLEVEL		MAX_MEM_LEVEL
> > +
[..]
> The comment line says 'Use the same value as crypto API'...
> could you please clarify here? Are there some memory constraints?

When zram transitioned from Crypto API (scomp) to custom compression
API I picked the CryptoAPI deflate DEFLATE_DEF_WINBITS value:

crypto/deflate.c: DEFLATE_DEF_WINBITS	11

which is then passed to zlib_deflateInit2() and zlib_inflateInit2().

> I tried to build the kernel with DEFLATE_DEF_WINBITS set to 15 and
> verified that s390 hardware deflate acceleration works for zram devices
> with a deflate compression.

If we define it as 15 on non-s390 machines, will there be any
consequences?  Increased memory usage?  By how much?
