Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A093E1C173F
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 08:19:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747988390; cv=none; b=b59UUQQErDIzPd+HOPmOKuGc2oiuzNS1KcR36Z7fvJnWkl/PwuczEB4Qn1oJcep5WlqWPtfnSPww2aNjmX/86XQMnwLonJvolsfx/P9MtuI2ng9FwRaGbLVCKJzBhtib0jRcuMYuZiLjaJGIaeShp0v3fpMJ/IrUOdV50NgtzxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747988390; c=relaxed/simple;
	bh=HNSWagAEX12O10t4eRkKH1SjIDKexCjBhWGMr16Yykc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Gl03Kb4RQ09ywL0ZJongVg7JzGQixSPg227H4Hl4V9PrXV6cB0tBOJAugkUMKfOi9xPSDimbeaP+QLEczBlQ4XHCCFw72zHvotzlAoBR1VDyU/0cNi4H5yilLXW1JMlqu0GQf8at2qdbk3AUI0XfLXvRxeUemnz/9eQtHqFUa/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KmXkzArn; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KmXkzArn"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3a375888197so2970137f8f.0
        for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 01:19:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747988387; x=1748593187; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=flkPxGTAPulzErROQlZpjAXNRqaIuRh5Y/yxPEIKvFM=;
        b=KmXkzArnpz77dspTyA+Pj0iQZl15E4HDBh1oupiZb5cqFVNr/T6D4b5BfH8qGkG9OQ
         wUvtE8Az94q0buU4vEgcPL87ecenGNtAuSEiGL6XePqu566vP7/UXbOAfSVJb/nAE3we
         VLfJjlXaO+dTYdLmNVIIUbjhSKICUYyivQO7AIdHW2aEqwGBiVefiROLXavMNIzUl3zU
         4zK5FCiuH+976bJdfNb6CR+L3xlpRrpYpNG+E6onCNq7M8f3v/MDAfHdJN5s1WPnoKdu
         PxV5Gn1IGcv8NFQL4mm7HPTMiWQt2Pbb37+Jv5uPcuzbUlc+QD+DFPlODNuYpb38JeN2
         oFdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747988387; x=1748593187;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=flkPxGTAPulzErROQlZpjAXNRqaIuRh5Y/yxPEIKvFM=;
        b=qZCdFM7OKDlnm2WgKoFDiP6KcsvrJ4iqvBwZWhTNCJqI1noi5wXhcP9EsHt6NsGmh9
         YkfxB0PNkwqeC8CxhOY+mwduwjaWt5xKfEj3gbMdzmIDWxe1ySy8V3s4Zot1u/GTQV2u
         5+/ftiwX/inR18kTKoPN8NBSu1E6LJkOUzbZzzZZP9YGI8jAEOdxsvgIx9XJu2latzv6
         5id/rKYNvec6V+jHaByK3xX8fzbyaQ/EZtz/VeGc6LfYjv0I2LryfIZ3g1AlM73oxEwQ
         328xpwx0VZm6TPIHfermVyXMxUtAFBu7ukdh3XHR8wCS4xl+WzeVBXEcv8TW1P+KE6K9
         tpbw==
X-Forwarded-Encrypted: i=1; AJvYcCVsjJyO2Y2KGuCflHunR7e2z9nTdIoe/ff6WrL6baXfhJatqNdM5rY53dFKHLgpkYFL02kk4zp1g4ZsFKE=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywi9ZKJeh8u+dCQDnQqgsBHYVeyERLNijTmJPcgGTCaduY6BwL5
	ZGSFAGO7SQNcU6BjwXaZHdNvLmpz5OOggQUbMA9xA0rT3ZvuqmnavB+9PXeFxbyvizY=
X-Gm-Gg: ASbGncsy1LnX16OWZ5/nBqcghWBvXpt6z43Y2ozbv8R905skFzdwe6Ts/0K+wV12zM/
	OkslLJafH+XB9xWNO50e96aj7g+yywyoZxwsAFUlH2v37/prNHh84NH77nBJHPy5x66J3D8tyLq
	Mpqu5w6YQFGWUeqdKqjQxWX3oRnsIVzSD5mToUXolUSQ87OEV8GMV4h5N8MBRaiM7qHrYr5noWu
	4Ak0pNBP/wSZojHhCru5sm+BvO8s5sRZ/kPKuhRFArmAx/HQEjnb6fYMElZTJT2E76bTyGDuUaM
	MS27XSoj8+cKdD0WrW7RvOPiJsxT+fwnV1tQHnF6pWt7HZVaQaX2XbTz
X-Google-Smtp-Source: AGHT+IF4/Q3PO7+Wp7rssB2fh/14f8yoGc7vb2xypco+l1dme8+hwhmvGGV/4fhj0blkBQdH6++bgw==
X-Received: by 2002:a5d:64c7:0:b0:3a3:77cc:539a with SMTP id ffacd0b85a97d-3a4c2103d41mr2588162f8f.58.1747988386849;
        Fri, 23 May 2025 01:19:46 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a35ca88978sm26223360f8f.65.2025.05.23.01.19.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 May 2025 01:19:46 -0700 (PDT)
Date: Fri, 23 May 2025 11:19:42 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: rujra <braker.noob.kernel@gmail.com>
Cc: Johan Hovold <johan@kernel.org>, elder@kernel.org,
	Greg KH <gregkh@linuxfoundation.org>, greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging : greybus : Documentation : firmware : Replace
 deprecated strncpy() with strscpy()
Message-ID: <aDAvnmtgnssj7K5l@stanley.mountain>
References: <CAG+54DZgF55R2pEtkVBdnwXEyNu9TrSMA9zkmw7RjWrDqX4SsQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAG+54DZgF55R2pEtkVBdnwXEyNu9TrSMA9zkmw7RjWrDqX4SsQ@mail.gmail.com>

On Sat, May 17, 2025 at 09:11:30AM +0530, rujra wrote:
> To ensuring that the firmware_tag is properly null-terminated. When
> copying firmware tag strings to prevent buffer overflows and ensure
> data integrity.
> 
> The maximum size of tag is GB_FIRMWARE_U_TAG_MAX_SIZE = 10 bytes, and it
> may or may not be NULL-terminated.
> included in "greybus_firmware.h"
> 
> changes has been made at 3 positions:
> 1: update firmware tag
> 2: backend update firmware tag
> 3: backend update firmware tag with unipro
> 
> Signed-off-by: Rujra Bhatt <braker.noob.kernel@gmail.com>

From doesn't match Signed-off-by line.

The patch is corrupted and doesn't apply.  Read the two paragraphs of
Documentation/process/email-clients.rst.

This is a usespace program so I don't think it has a strscpy()
function.  How did you compile this?

regards,
dan carpenter

