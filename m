Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AF4529CB48
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 12:40:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744375225; cv=none; b=eElOLGzNgBdgOlp9+0LfG8WwX1qS4GoR0x+iLHi9wl7Ug2hAkwcnlJTwjJ/BpWTB53zPlWvYkhz1gV+8WiK+5ll/tvUJvYhXKmuqvauhHXTrNBBizg5BWJzJlMVE0jM4wk1A7vn+kGCkRAKvUFKQDbc9w1dvfup7KE0dGBIAKxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744375225; c=relaxed/simple;
	bh=AXZG8z2/mlESYwSYPyua3F76ehc9HJ/RiOj/ndVT6Qw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rwCFP9gOcvl7/ttDb2/8gBID82rVFBmfHNVs77rda/mpNazSDJQ8H3+Ul3pSaqX3zP77UjwtDdL1UCy/dP8p689K4NW8reOCLQjIgXVsN8QombK4wW9z2wRjlTBDKaGqVip+FbnC7vOAKUhLS0ptMxdsD6z+QnnQUAIX3Pz6kcw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=aHQ9UfXE; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="aHQ9UfXE"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-5e61da95244so3337196a12.2
        for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 05:40:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744375222; x=1744980022; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=f1ocAfGLIQFAKvHMqFgNq6HHUQpi9TfZCv9uviDd7As=;
        b=aHQ9UfXEtgUXLtItA36BHSuNSOm7W0JfafYWoPyQ26lG+UZZq6lwEkklC9x29qon9Q
         a6go+m+zBy2Pc3bVZrqH//eoceD9zo0LadjTuitx/rOX7i97WeXr6WfotMehfuwrN+6u
         osbE8rKZQRA//iNTQnuzTMQ3CZB3oZSdZeNpyOVxTAuz6EVxUem/ZN5189un844KWJcD
         39JuhyJUHFiteRfvrwKQkxRCAHGqjShGUi+BAUDEPO1sKwrbLvdLWlWYe2lW5sycjEpT
         n5/XoxeUT7/h16zhMVHXBkPzuvonZ8+kJL990fgCGApJd96QpS1Or2tOia3n0tAL4RdU
         zh9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744375222; x=1744980022;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f1ocAfGLIQFAKvHMqFgNq6HHUQpi9TfZCv9uviDd7As=;
        b=h+ZlvSMuAVoZm/vQ9TSA4B8Ynfvc3O1clsevEpTVgjwFdZJtUklq2xmgvgYKXs1AG/
         iaGeGPQzThdw6FDQK6KopK8mA6N+c/rDOF462t2p132kbdvFYvGhBzN8vqvBHaP+86ZG
         5utKQCki/DzEuq2c2faDJmtVh+tfTGIVFlgrZK6bui6F8JIgnhYJSAIqZYK4X/G3OU5p
         GHLrVS7m5aWDWBJi2wdKJCXCCb2K134IRyGpWS9jnCz6kt3a6EGMjC26nvk0XEnnxMS6
         T4q67NKuwKK2grqJO4czng6KWtpv8xKe3XBRlA31m26BTYDs8RT+B70P5YOfjmTRqDh3
         z0OQ==
X-Forwarded-Encrypted: i=1; AJvYcCXZk1Vfvmn/dp64bVJmYg3/YQ1BRU6uRkb565YtCSgG43fviZHCYOa+d4smFpLaNDLJltVTuhdEXjlY1ss=@vger.kernel.org
X-Gm-Message-State: AOJu0YyU7ALxRL7zdx9qG2pqZcVsnz3706nn4E/IwBNchiQJe48zdFDv
	3VLGKfcPgNeBYTPLyPFTdItK0A6/AWpRyf+9CWIuR/bmTHBN+4/zcfmANIwG8qQ=
X-Gm-Gg: ASbGnctzY3pySEZ6AebyUpOANWAtazAiydKWlC74YMTkkkJ3CRrx518YY+6Vck788le
	LHPka+LNs8JEIwWye/ZP5Sj+44raKOPZpLKD9rHMutbXBEjt+pQEtvxudBye2Ec3GrwSfieqIAC
	NbPVaJGuA55HjVS7Bu6OA1Z0t6Afj9p0JRdcuUxjzdIxGTNLSpavHhf4kKE3R6ySMSwGtsT4XUu
	ADqbr5Pvly4wvnz1nszZjFehBJuZz60BO6LjQPXwkRDYJfOBSPNYZJN9QtuZ2qiUuczfblKIf6p
	mErXAg4ijfBWyhTl1sLK4Ex7PBIxZNnqb5+G6V9UXothhn6b21s=
X-Google-Smtp-Source: AGHT+IHgyCOoZTpXR8VI7LoO3entvTJlRIeqltOKvxSFeMXEvp7dwNM/Lz5ZzULD+8sUgZTb+VYO6Q==
X-Received: by 2002:a17:907:9692:b0:ac2:a4ec:46c2 with SMTP id a640c23a62f3a-acad36d5ea6mr209131666b.49.1744375221837;
        Fri, 11 Apr 2025 05:40:21 -0700 (PDT)
Received: from linaro.org ([2a02:2454:ff21:ef30:b4f5:b9cf:f32c:8fe])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acaa1be98c9sm448014166b.65.2025.04.11.05.40.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Apr 2025 05:40:21 -0700 (PDT)
Date: Fri, 11 Apr 2025 14:40:15 +0200
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Wesley Cheng <quic_wcheng@quicinc.com>, srinivas.kandagatla@linaro.org,
	mathias.nyman@intel.com, perex@perex.cz, conor+dt@kernel.org,
	dmitry.torokhov@gmail.com, corbet@lwn.net, broonie@kernel.org,
	lgirdwood@gmail.com, robh@kernel.org, krzk+dt@kernel.org,
	pierre-louis.bossart@linux.intel.com, Thinh.Nguyen@synopsys.com,
	tiwai@suse.com, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-sound@vger.kernel.org,
	linux-input@vger.kernel.org, linux-usb@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH v38 00/31] Introduce QC USB SND audio offloading support
Message-ID: <Z_kNr52hM-iWUgyZ@linaro.org>
References: <20250409194804.3773260-1-quic_wcheng@quicinc.com>
 <2025041029-oval-cavity-7896@gregkh>
 <2025041144-imitation-reappear-a0d9@gregkh>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2025041144-imitation-reappear-a0d9@gregkh>

Hi Greg,

On Fri, Apr 11, 2025 at 01:04:37PM +0200, Greg KH wrote:
> On Thu, Apr 10, 2025 at 09:11:42AM +0200, Greg KH wrote:
> > On Wed, Apr 09, 2025 at 12:47:33PM -0700, Wesley Cheng wrote:
> > > Requesting to see if we can get some Acked-By tags, and merge on usb-next.
> > 
> > let me give it some 0-day bot testing to see how that goes...
> 
> All looks good, so let me go apply this to my usb-next branch now.
> 
> Thanks for sticking with this, I think it deserves the "most versions ever"
> of a patch series award.
> 

I have honestly no intention of blocking this series any longer, but the
comments I raised on PATCH 26/31 are likely valid and suggest the series
wasn't fully tested on v38. So I would personally prefer to get fixes
and confirmation on that from Wesley and then merge v39. It doesn't feel
like the kind of thing to fix incrementally on top, since the commit
message is also misleading now.

Thanks,
Stephan
