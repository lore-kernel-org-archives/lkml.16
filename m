Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CC82230BF4
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 04:49:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743569400; cv=none; b=mBzWZmQPSJ2IvNtJ5t0cD2SmVPf0puvo1eRBBGg71h4reAcjFSUcT2hYGJ7Vd0VxAuwbhdqvR6cnWYv/BMAaYQW4eSPJ7uzNP2w1SvByGrkviff1k0OJlgOskpAapg7vOqkqdlpXO3Hp3iHZWR3g8Om4k439gWfk7KxYut7CCCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743569400; c=relaxed/simple;
	bh=9avm0LqOZNotjogzUUyckFvE/j+N5SXlPAiqBtwZqUM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Mn+2qV1DXGjA00yjCjhtTXV7a+cUVcr8L9/x3MOvFLQVZNEQDAlKaON0IB8n47bo2EG3I90LZz9gilGBUlpX9g504YogyUyBrOF8ejrHglIIKSzedkLlSMUuGMZxYQBanYP5ZXDvEiPD96Lj2CvFAhBrIDabJRLCXegbyTDN9Cw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=HRqBiFIL; arc=none smtp.client-ip=209.85.219.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="HRqBiFIL"
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-6e8f8657f29so50614226d6.3
        for <linux-kernel@vger.kernel.org>; Tue, 01 Apr 2025 21:49:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1743569397; x=1744174197; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9avm0LqOZNotjogzUUyckFvE/j+N5SXlPAiqBtwZqUM=;
        b=HRqBiFIL+fmTzqnP91EOuNWsNtsZo1FoBDHKDoMOwQMJTnOKxkOxxLodJ0b1DPXLl+
         pvQriF3hHpBxGE2o//aBLjAyhAsen7/a9K5PDq0m4ogKew+oPX/uH0TIfJ+mt4vnkalm
         v67EejmS425+97wZbbwHQcAmJJcDEbYltE0bpktd5ChyGFkJGrSGZnVQAHrSLRWwMLBM
         h11YtcFTwkIuKXzONwbLFDtAWVwEeGdP55jHQj46OX75hMuYjwjOandpvFs9lf9lrbWu
         kLSkpTKDlKY29rtGJsnnlB2RJ4FGJsPBwzVTLzBSePxq56OTXeFQSgjwM5hbNNR1VsTc
         eoDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743569397; x=1744174197;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9avm0LqOZNotjogzUUyckFvE/j+N5SXlPAiqBtwZqUM=;
        b=SedmfVfTkn7fbrbwbpcOJl3qVIAtovyA7hPU3SDSxy81JbrDwmDHCU67Ekj9ssyyQe
         Ax2LRNMwDfYbTep4AahIZItWMvnYOz05hue9A9vSxuY/o5fLuZA48jwvU3BfUgbIHdsp
         Jjz2e/s0RpK7y0+PMctUt40ZlPNPJw2JicXao7F7i4YMfKx8N9r/fOTyOWY3GZOM5wza
         pyrY0MMAO3RFD7Fw6Ht95TQWPzHM2Y7YEwssn8gQn1gM0//lOvoLlJ3Qx34x1fO/3u8h
         78sN1VuauVli//zGOlbIOxh5xV8ez31gwCOOCx4FOaWG3qB1uALP+5EmTW1you+ABkDa
         JcDg==
X-Forwarded-Encrypted: i=1; AJvYcCUnyalw2+F4uz8HHrL/rlaUV0AwgWW3D/82KeFE56GUw7Cg5Tz3WgZ7OW9SQdML7sKgEGE6AYd81kjWv18=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+9m1T6YcdhgaKVAefLuiez35rm7+qI5L9zqd4DtabsbN/DEeZ
	hyjDwxx5OAk0T/hYpRJXSnhwT4fJmz0kn2xc0xw9/Vs6up1i5TpzwkNtUwMiuJXUhmetrQ5bL9r
	4
X-Gm-Gg: ASbGncv7kDPB9bstBLv8OTW5ZmV9oxQIl+h92vHCvPxykhi+csFOG+U1fv5YyE90RaC
	7B1hWhrCu8NKT244gk4mxrObBhGxC8QWhcgaONEBiSShpGy6wT8Nn9p+4TfSPyVfJ9YlbYdyxLy
	EZ7rFCaj274b3ig3nvOrIaaBjjOh+nQtke4jnnJtX7UcZllUTMVHezLvvnrZ89PzIc7fA3JqS1A
	Q38Yu3uxu0Gw2clfYC3hUvdp2OKJbTji7/PwBXQcIUutmBdX6pkwlyxTsX4feY1GSKpUAw59RpD
	lUPDb3N89I9uXSoJLxo9l+Ojd93w9I/mYR5PLiDF9B+t1FU3GTgJH8iqUvDNPPayvXmET33fIb3
	2+8YY8QkyJxZEFdzjRMPZGkILS7E=
X-Google-Smtp-Source: AGHT+IHrhKBTscM2jCOGQCQuvRNnom05HAA99v9sLRDShuoNOC7upoIA4o6a6EuUpMYxe8aKa7cJeA==
X-Received: by 2002:ad4:5d6c:0:b0:6d8:8d16:7cec with SMTP id 6a1803df08f44-6eed6297aadmr271668976d6.37.1743569397172;
        Tue, 01 Apr 2025 21:49:57 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F (pool-173-79-56-208.washdc.fios.verizon.net. [173.79.56.208])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6eec96281aasm70706636d6.4.2025.04.01.21.49.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Apr 2025 21:49:56 -0700 (PDT)
Date: Wed, 2 Apr 2025 00:49:55 -0400
From: Gregory Price <gourry@gourry.net>
To: lsf-pc@lists.linux-foundation.org
Cc: linux-mm@kvack.org, linux-cxl@vger.kernel.org,
	linux-kernel@vger.kernel.org, mhocko@suse.com,
	a.manzanares@samsung.com
Subject: Re: [LSFMM] Updated: Linux Management of Volatile CXL Memory Devices
Message-ID: <Z-zB86WcoMEQ9lKV@gourry-fedora-PF4VCD3F>
References: <Z226PG9t-Ih7fJDL@gourry-fedora-PF4VCD3F>
 <Z9mo5qCpdlE-KZ7P@gourry-fedora-PF4VCD3F>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z9mo5qCpdlE-KZ7P@gourry-fedora-PF4VCD3F>

Slides up at:
https://github.com/gourryinverse/cxl-boot-to-bash/blob/main/presentations/lsfmm25.pdf

Docs Transitioning to:
https://github.com/gourryinverse/cxl-boot-to-bash/tree/main

Browsable Page:
https://gourryinverse.github.io/cxl-boot-to-bash/

All help hacking on this is welcome. I imagine we'll convert some
portion of this over to kernel docs, but not sure what.

~Gregory Price
