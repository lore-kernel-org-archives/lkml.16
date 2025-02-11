Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E497A26BD95
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 02:50:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739242252; cv=none; b=tRQVP7IwSvye3JsIAMBNzlIK/0sG9hCTlTSMzONujXZtcTNFv2QIxIaqZCWUvRIWdQcJksOYI9odbUAL16meHZxJyTXiq7U8m7rsQZIUCoKDy7qwpIPp+qj29w0UIMtNJ4diTxUCfLl06nxe4iFDnY9GqRISaHkUdYFLHQFCtsA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739242252; c=relaxed/simple;
	bh=VRrjI00Me/cNAVhfeUoIza0DR3FFrIOng/ndd468AvQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AVfd/tmQ1aU/EMJJ00uGoWVV8ZrYbcLpy67ZFMc4Dt1NwmPLNsrDC5FGfsU1Mazeteguqrw4ZiVB+l9kggOYuUmXnG5mk85MrLiEdv+umS+z9SR1g2m+qYNWqTrMKcLr2tYkLgNa9VuhuJUP9Cvm4iUCvDtpl7EC6g3zxoc0G7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fastly.com; spf=pass smtp.mailfrom=fastly.com; dkim=pass (1024-bit key) header.d=fastly.com header.i=@fastly.com header.b=rgYTXCTj; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fastly.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fastly.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=fastly.com header.i=@fastly.com header.b="rgYTXCTj"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-2fa44590eebso5238806a91.3
        for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 18:50:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fastly.com; s=google; t=1739242250; x=1739847050; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Inxmkf7GXwx4Ju5kxyAeSkmwU4lkXnkfugn8Ok+jGZE=;
        b=rgYTXCTjTrFiVFmkTg61tGHzGTkr0oF0eyOk7TPQuftlxao9yeZaVrbbxIllSomAPq
         LbVbcjaDmOSOJhEHSjdEaAL6WD6f4zQyDhfPLfmgWHFOnkNeKa1kvprTji7BAKLasM6x
         faWL0+m5e8UA5hpyjFDqDeglirLafitSMlxDM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739242250; x=1739847050;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Inxmkf7GXwx4Ju5kxyAeSkmwU4lkXnkfugn8Ok+jGZE=;
        b=AoMJVlEfPAEb7VL/LV4Ks4fYhpf8/mdm5ZsZmkgjIgZu8ZS24gz7ma80KW9jJd0zQ0
         M/WqjyNeZY2upTZqUxJcIer83CIOQM3lWOVbZAtneBNbiGNiHYMX/H4RhcwiTXTTz5Dg
         kDfueKL7YXCv9jdx2qiDfgkoebQAEeFQHyTXjSuJdclP1xUxaTweJd8dTHMRoD4j4h4f
         rhyUuVzFg3VLp3fHAtmqGS0AOADAF1FfHmd4oG3Fu/4b7ok/Hs7h6LMTel+OIZyYFQAv
         UwW7aUyTIC/gxDfjLFptoxWYotmoL1XSkJVp90e1tcxAeZICvDrrAHHWPTtqaDdm7ZDW
         D+AQ==
X-Forwarded-Encrypted: i=1; AJvYcCVC9dcG/yAkT5rTfU5LN4SWq49c+5IVTB6Dd5yl4uug70uOfC5yYG8pT7DlKiUgy9lnAdV8t+IuoLAncTE=@vger.kernel.org
X-Gm-Message-State: AOJu0YyCwEbsth2cn7NPa4k9gx1pSj5ozkLj4dL06TsfxmvEk2FEUDZS
	UGFOzPia/VUUM6o0vEoqEh9N5E6TZoO6Z1VS4BZwM+fdiqp3FOoOS97HBGRNhJk=
X-Gm-Gg: ASbGncul4shxyonNVWL5N7PL4hnUWm4IJ7uUE+4IUJ7PSdIZkOvsyNjb0YgwioWGrCa
	aN8XEv6o1uYG9cBzuWfJH41OtAiDHYoNWXH5jNECFINSn5xrfMAGyfTvCFe8yJXRD6QF3927FTj
	QPFv1EZvZnHlsTdssZ7BDSTaojj2oAulqlX5fX+rYRPL866zlCNL5mlhIm8ef+bblOWXKdCV1mg
	zOpuaj5kE6hhVJrxbkBuWpeMCUHH9uScYPB6rGF1BcR5cJt9yNlyaIjFjOgmCYhiRkmBvnuyafI
	j7rHHTSXx/Fz/nhgZBTNZEEkFYv+/eZ889QMGZxwZfybLlZGtxehSYQW+g8aEtI=
X-Google-Smtp-Source: AGHT+IEwU9HQiodle9G1DfCEZFuDdCXwxGqXcPc3IIYwRBiVYDyT5p/hIkOvMkdFa3mITYqhW/6SIA==
X-Received: by 2002:a05:6a00:13a4:b0:730:8a0a:9f09 with SMTP id d2e1a72fcca58-7308a0aaceemr11800001b3a.18.1739242250105;
        Mon, 10 Feb 2025 18:50:50 -0800 (PST)
Received: from LQ3V64L9R2 (c-24-6-151-244.hsd1.ca.comcast.net. [24.6.151.244])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73085eb5facsm3577237b3a.11.2025.02.10.18.50.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 18:50:49 -0800 (PST)
Date: Mon, 10 Feb 2025 18:50:47 -0800
From: Joe Damato <jdamato@fastly.com>
To: Jakub Kicinski <kuba@kernel.org>
Cc: netdev@vger.kernel.org, ahmed.zaki@intel.com,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	"open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH net-next] documentation: networking: Add NAPI config
Message-ID: <Z6q7B79h73ydzOhM@LQ3V64L9R2>
Mail-Followup-To: Joe Damato <jdamato@fastly.com>,
	Jakub Kicinski <kuba@kernel.org>, netdev@vger.kernel.org,
	ahmed.zaki@intel.com, "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	"open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>
References: <20250208012822.34327-1-jdamato@fastly.com>
 <20250210181635.2c84f2e1@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250210181635.2c84f2e1@kernel.org>

On Mon, Feb 10, 2025 at 06:16:35PM -0800, Jakub Kicinski wrote:
> On Sat,  8 Feb 2025 01:28:21 +0000 Joe Damato wrote:
> > +Persistent NAPI config
> > +----------------------
> > +
> > +Drivers can opt-in to using a persistent NAPI configuration space by calling
> 
> Should we be more forceful? I think for new drivers the _add_config() 
> API should always be preferred given the benefits.

How about: "Drivers should opt-in ..." instead? I have no strong
preference.
