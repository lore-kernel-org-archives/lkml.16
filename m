Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEE868479;
	Tue, 13 May 2025 18:34:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747161278; cv=none; b=AnxkLoDSp45Tq15rvIr6XeS4A9VB2XukigztTxjNdjcs0XXGMvHtqKEXG+Sqqje2f7DwDiEyim5jpAmiVCzkVySfjdknXUg+9kEQJSzbpY98ERqdtQdlujYv+cWkA7aVFsDGkPnheG3PiMj+qZCWaJzwt55ZMb1vOL/FSSQk7To=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747161278; c=relaxed/simple;
	bh=ARjKxv54xqwWx1r1xsT0LxS3Dw+4Wx4YErSoJo8TbAI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T4l2CtQKPR1mm5v0XEbzPj9Y52GSwuqT1izvdGf37znOpT5oj85q8cWL3poFhHzJ/pqc6NKRRvJotxp4KenbGalZXjcd+0ximMQhb1bNZrqH907R+DkI484ooU2CeG/UBWC4/7VhE5rC74Zxuki4LGg8LfN1j9zAePXtZ00M/ok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Zpo4S3Go; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Zpo4S3Go"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-ad4d5bb4d0eso242940766b.1;
        Tue, 13 May 2025 11:34:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747161275; x=1747766075; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4LHpvWACDMKbZxhtHwigNldj0+/UXgYOK5RwmFQbLoU=;
        b=Zpo4S3GouDx2T3f192oxZ/ehVyb4W7cM3wxbTz2OyQA6c1z4aKbhNBY6yPSzpeSbAs
         f5p+hOWQ1Uvy1gqgUzEEMiI1nhSGadd1JeMtb997ids9di19C03hYiUXoU/eSH3ABb4g
         4DyxMy55nScmRHwlnaPJnrFJoqZbJw7Yfk77zq4h7OXv9jfkoE9l4uk7dG7LsbcgrSAo
         uhv6KSi4XgQr1Mc8rNt7qlUmmSJzOX2dFGFS8snzMzuSnuCKDuLkvE9MXpZk9v/efiN7
         TK1WDZoAwnZ8tjOfLTQ2PRA/cPGXXDRn1gSzr6Q0kQhtq/NMpdMeQtP22EDyVfJZ9fHx
         +4xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747161275; x=1747766075;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4LHpvWACDMKbZxhtHwigNldj0+/UXgYOK5RwmFQbLoU=;
        b=vw/zjhGCFpiDouwvKhz29VEwu36qYvyNvMmhR52cpSxCauCfy/JmRtwAbSmbMvgWMT
         eqOEaDyNoBRGM7avLj6mRdHuuHgVqoUmcyxyAZwE/QScEv1pCMjs0JCNtcZrELvjB6vw
         cpaNxZOI+/Om97oy5km3JQFvD69kpfZZV8nNDEwDq90rwsgK4AXY3M51DNBWPYziK18T
         NqYiFR27JbWvkw2F8mk5KvTE06WXH122EPUXHS24fp1f2fLmWKk7jQZs2LL0HVw75fko
         b6R2+54X24hu2LZ+xYvd8tR0QYbFG24/eyxc73vf8/sUTofNHEnJQgccFI/sIcLRKjio
         ZPgQ==
X-Forwarded-Encrypted: i=1; AJvYcCWn+vlCZMEc+M7hS/Zc5Aw8JSTKmzsu/XDPDb4JD+usv2bwkIsnq4jKHU1yMFCMrGkwAv1CbICLfo384QI=@vger.kernel.org, AJvYcCXLge2c6eIVyUjYksc5frbKqAEYagKHcDVMKfCz/KSidK0lvtsobHLP+SESseqng2BmDoU4Okhrj0nW@vger.kernel.org
X-Gm-Message-State: AOJu0YyHWXyZnq1wQubOppcqaoGV3CHKR5nUYumtK7z/2BpZua9MRbhq
	3wuXIMmkY/268de9mbXUKYnOrfV5mwtYlPd7ymf+VP3fFukpob0=
X-Gm-Gg: ASbGncv9jbyW7vZdhUvJGDfY4w2AAmTlMAkr2EMtfkGYQHL72vGkmpIPa/4AU0KGehQ
	H0QODUEoqP326Ot1nAqpYer9WDreSNTXeLNk++m4aY8IKeeyPaw5vnSrXWzM643pQwExoD4S94U
	mY64Eb4ZKR8+XmTTd7mdQWZee/6Hk21wuswpwpjllxpnkzB4zqA65owEtxak7F/E+gq+OrybCrV
	fFw69ezOJ6S8V9WLHmnmS7GKT2zPkyGATrTfJWNPhkd98F9kPKcpkFD0oh10Zq1mLuOE7P9FE7z
	ExecFSu+LTM17qtum4Qd8suBtTDCL4ufV2by4g==
X-Google-Smtp-Source: AGHT+IEiHH6U9Fl+KuK+HfKK7LIIFYL2TeI1tlJtTlj9ScQtFHXONW2RMPZa0Ome346zfxM9WemJgw==
X-Received: by 2002:a17:907:3da4:b0:ad2:5220:b478 with SMTP id a640c23a62f3a-ad4f7147208mr66923766b.10.1747161275033;
        Tue, 13 May 2025 11:34:35 -0700 (PDT)
Received: from p183 ([46.53.251.33])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad2192c8f98sm830772666b.10.2025.05.13.11.34.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 May 2025 11:34:34 -0700 (PDT)
Date: Tue, 13 May 2025 21:34:33 +0300
From: Alexey Dobriyan <adobriyan@gmail.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: corbet@lwn.net, workflows@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/9] CodingStyle: mention "typedef struct S {} S;" if
 typedef is used
Message-ID: <55373914-e6e3-490f-9d79-5321f908701e@p183>
References: <20250509203430.3448-1-adobriyan@gmail.com>
 <20250509203430.3448-4-adobriyan@gmail.com>
 <2025051041-hardness-effects-89f0@gregkh>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <2025051041-hardness-effects-89f0@gregkh>

On Sat, May 10, 2025 at 08:18:53AM +0200, Greg KH wrote:
> On Fri, May 09, 2025 at 11:34:25PM +0300, Alexey Dobriyan wrote:
> > Signed-off-by: Alexey Dobriyan <adobriyan@gmail.com>
> > ---
> >  Documentation/process/coding-style.rst | 14 ++++++++++++++
> >  1 file changed, 14 insertions(+)
> 
> We can't take patches without any changelog text, sorry.

The changelog is in the patch itself but OK.
