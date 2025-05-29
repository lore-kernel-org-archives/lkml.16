Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F48BA55
	for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 09:19:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748510400; cv=none; b=cY93QheaVz+JNKJMpFE0euj1pl+3nnxfOJZ3ucLCZ26N/4Fqz0j+0Actt3YPnV/qDdH4OUxSaRSWi3N6TFYdbuM7G+lkiczdrl4uaykYf90htBDOO45i+cUqCwffcv+L4zvRZ82y8mm47kDI8edl+0iKhF6tHRq8Q3oAWSJ9muQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748510400; c=relaxed/simple;
	bh=7ErKMfn0HYzjnh8ROxXwWnHBnT6eAFpTgcf8kV+OYUQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PsGQSzYpaAZvJU/hOBvxA1ck3/SGr8DbnQAdeoL7mmkUYNc8+jrIAXV5vuiHtSkk7YbGlM58f1dKIyIySTxOScX+tM/t+O3CUawZ5vzHL6n5wBHyCpR8aOUd7ti1keiLLxVimDhP3jaRiPqGe42Zr2KKuzZdUmRcOOnVxs3i/tw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=MnynTusS; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="MnynTusS"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3a4e742dc97so1212240f8f.0
        for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 02:19:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1748510396; x=1749115196; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Ptk4vf9TFuccydOqbTHwIit7Mi2XSLpvZwljdh3B7PQ=;
        b=MnynTusS9C0+5m9cTau9yzhY2HjR6fbB/68Us0nRgJyYOqVQg3SurmIL+qa1By0v3d
         7uWUX5agFT8qOmQA6/+QBjXk0v2FCqBxnmZtpF6KmhfnT1cwGG6WvTB9tXDfXahwLmRo
         Y3oo94URbFdWsRn1fLcDZKo/NnuuTmoOOfdCpLEdXDvbedTTJDR+J1caFjG1phJFEjb0
         mWixFRp8GYI0YvPqrvYeHpBXnDTw/hJZ8yjwgSIF2R9zHaxln9ewAnqSNtsfTIphzbmJ
         vuzlMNm+07QKCLnUPtmLdu8e/BFdgm0gLrijpMKIQ3ss1U85n6+eX+6fZIln7yX5YByB
         6oAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748510396; x=1749115196;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ptk4vf9TFuccydOqbTHwIit7Mi2XSLpvZwljdh3B7PQ=;
        b=ARNLhWIhdfMP4vdyWRFIYBhmSI1by3Ri9oSjwt+nsfyD/ZBlU+za5kje18C2f4wEL5
         EEehcKOj/JDW0S6WCY/nX5gFXE2492PZSwUsfXQv8lxZyo0FN6Znw75S51ljg7yr7q5U
         QrZSKxO7RLlyemunx+3CwgjSfBQOL3Xh1LCC9k+cOxN/cGPN0u71LPzHTrnxMfVF5LSb
         DpMEbpYOpdH+vXDKiPsAwU2ko6ckw7CKwHFauh81X+MHGr66fZAOHz3RjnnUkpNYnjE2
         mKKkJ96JajVpBcxNUjLxyGzTGf6EynrJYfjvf11AaCC5Q6XWa9wYbNVvG3D7uBho+ZBt
         pRJg==
X-Forwarded-Encrypted: i=1; AJvYcCXE+h/MLbIfQ7fMndqjJ9y/UYCRIbzMCaiaVv3OWvhhEC17NRP5/mKPJq2C/hFP/Fj09G22VAWrRY3f95Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YxEb2LVYLFxhUQZdvI9iSxrzVg2uQhEkNU6ViA2Tdd8sky4SXqZ
	8EfRho5DAi3A36a9iZKvN/fyW4mBAa/+kqxrFd4RIU3Xi1rqSRuNtDHbcql2m+7prp5s4e/kbr/
	59r9Q
X-Gm-Gg: ASbGncubsx2zCUFgHm9EeTpXRdJuJLlzJb+AqEPpbhgfigvdZMc2kwouY2auH9diYQK
	oFvNfmTG3fWi1y77hpUvFhKVFAayTCZgXMjate8y8Eb7R4wEgau6jXCcKxSWPJF0oOHVA/jgUAn
	QmHQW7IuekmfKtCVWFspj5hICYabJxFv2V7NOCndtm/YJRXvZWdbZuqjjw2CJDdMwSXzO3p6uri
	aqfKpq0nuMckVfKZqnEKFtDDxa10UHdhjrHrcUqSJqTlFm4Wy62nW3EZtRhP2GbMtJp/K5xRUiw
	zyRLRgudyR1VNYY1D+/P6b7B6PJZA/DRsoyZCGVwe8CWtg4VtVC9/CJez6rjx27Q
X-Google-Smtp-Source: AGHT+IHJBMhRQ+ovIFAhUhr16RkaKMXCgPSGtp8h/7Y6GpbhycWlqT6b5YEMAzolhz589ymnz6a4cA==
X-Received: by 2002:a05:6000:310d:b0:3a4:d719:5be0 with SMTP id ffacd0b85a97d-3a4eed91301mr2424426f8f.2.1748510396572;
        Thu, 29 May 2025 02:19:56 -0700 (PDT)
Received: from localhost (109-81-89-112.rct.o2.cz. [109.81.89.112])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-450cfc3785bsm14479815e9.40.2025.05.29.02.19.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 May 2025 02:19:56 -0700 (PDT)
Date: Thu, 29 May 2025 11:19:55 +0200
From: Michal Hocko <mhocko@suse.com>
To: David Hildenbrand <david@redhat.com>
Cc: Baoquan He <bhe@redhat.com>, Donald Dutile <ddutile@redhat.com>,
	Jiri Bohac <jbohac@suse.cz>, Vivek Goyal <vgoyal@redhat.com>,
	Dave Young <dyoung@redhat.com>, kexec@lists.infradead.org,
	Philipp Rudo <prudo@redhat.com>, Pingfan Liu <piliu@redhat.com>,
	Tao Liu <ltao@redhat.com>, linux-kernel@vger.kernel.org,
	David Hildenbrand <dhildenb@redhat.com>
Subject: Re: [PATCH v2 0/5] kdump: crashkernel reservation from CMA
Message-ID: <aDgmu2im03zrBZlt@tiehlicka>
References: <Z7dc9Cd8KX3b_brB@dwarf.suse.cz>
 <04904e86-5b5f-4aa1-a120-428dac119189@redhat.com>
 <427fec88-2a74-471e-aeb6-a108ca8c4336@redhat.com>
 <Z8Z/gnbtiXT9QAZr@MiWiFi-R3L-srv>
 <e9c5c247-85fb-43f1-9aa8-47d62321f37b@redhat.com>
 <aDgQ0lbt1h5v0lgE@tiehlicka>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aDgQ0lbt1h5v0lgE@tiehlicka>

On Thu 29-05-25 09:46:28, Michal Hocko wrote:
> On Wed 28-05-25 23:01:04, David Hildenbrand wrote:
> [...]
> > I think we just have to be careful to document it properly -- especially the
> > shortcomings and that this feature might become a problem in the future.
> > Movable user-space page tables getting placed on CMA memory would probably
> > not be a problem if we don't care about ... user-space data either way.
> 
> I think makedumpfile could refuse to capture a dump if userspace memory
> is requested to enforce this.
> 
> > The whole "Direct I/O takes max 1s" part is a bit shaky. Maybe it could be
> > configurable how long to wait? 10s is certainly "safer".
> 
> Quite honestly we will never know and rather than making this
> configurable I would go with reasonably large. Couple of seconds
> certainly do not matter for the kdump situations but I would go as far

typo
s@I would go@I would not go@

> as minutes.

-- 
Michal Hocko
SUSE Labs
