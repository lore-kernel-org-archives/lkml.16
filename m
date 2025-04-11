Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C958263C97
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 18:30:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744396245; cv=none; b=tscwvayfKdo2Gp0etuKem1cqXRgwA6QCNdQdum83i93tlejm4ADoyjqVJvgorA7/2o4bc1DYIhgYSS6AH3BbJoJovsZjeM51+E57e5MHpD37yciOMjxDjBM+iMOem2k0bfHDjPSSr4KWYnugskjjYoWVI57BL+1Fd6M4f6foJw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744396245; c=relaxed/simple;
	bh=gbIjlJ4/bbqhbywHWi3G5k1aJY9GGtE24f8qSVkHBcc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sTr0NsSBAomNpJHO4nwsZi0fErkG7yxFMhQq7x4chStsfX9a9ieUHZzNF5M7eXZpnDOdQdEwX8TU1sqFsH/szXFS3ftUKa+RANTLtvHiN3fl3UIZt1rlxO1leXn9JGKSjrAZcgeOKJIjxRZHJ2/OyfSW6dCDutwvwtuumGntEsc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Sl+U+9/9; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Sl+U+9/9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744396242;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=6hRteb3aRXSBlgcZhgi2F2fUtSDh4vvSsqZj42m4O6k=;
	b=Sl+U+9/9owbqlUydWXaqcBio2Y2XoZ+M9/T8jWKCynt0jNSrnIOcl07xuClfC79tJFCGL3
	u0AcahGRyHsRElgKW7LUB9YwTwNhtlHhR1FdVc+yWaGhQK9aFG3YE/eoImMX7l9MxtTSJI
	AmydZDJa2VGiah9Uyhp3stQffJbdPoM=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-487-fU2E59b3OpSwPBUeFFY8eQ-1; Fri, 11 Apr 2025 14:30:41 -0400
X-MC-Unique: fU2E59b3OpSwPBUeFFY8eQ-1
X-Mimecast-MFC-AGG-ID: fU2E59b3OpSwPBUeFFY8eQ_1744396241
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6ead629f6c6so36400626d6.2
        for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 11:30:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744396241; x=1745001041;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6hRteb3aRXSBlgcZhgi2F2fUtSDh4vvSsqZj42m4O6k=;
        b=GYu08t0pRCHEDGwjTcslGtFZsRNxtvwh/RweFd0bObIEymBzV2aDqp0hlG2oS4bKBj
         CLymYWFGHzN/Z+TwixsmI6TYGu76wqKf/NCwWN+LgJbLKR+7kAITt5cKZa9qFVo3KPtx
         dE5eEFIswVz/toVP68Oorvp/ECK3/DWhtTdHcvBAV/aiWUxtDLnBe31+JiJUcvMVf6lc
         AT2o11I66ntFVNmpw9mVsoq4cQa7yfFMtmqvJxat+MwyRAsuuPrp+RdTYWer01NPlu/C
         HCyX0GgNtzwwtXVmNxirsgvn9MT/1PVgAv7Iqy5u3TouZoM2bq4LzXMKKH160Kkyzs5J
         FaQw==
X-Forwarded-Encrypted: i=1; AJvYcCVBmNzL/DKoHWzBeT/Rpb3DYajeAqwjoQbyjKD+RSBH2rgPa14S4H0bc2njA1IypUurTPpxhbwOap5zx6A=@vger.kernel.org
X-Gm-Message-State: AOJu0YzMQaIGXwG/VO0ks3K2TdCfslj6O12p/AIEpg8QzhFnzAHt3+6x
	cUBHo0gzaun3EvKTtTCot0lKdbDT7vGtCYueNXbrulBEMdfMTriB++1aip3fhFwDfOuOjz1fo1E
	pV4DExeLtF4cNZQ0YrzFVXi6s6h8fVf0NV2fh8i130sD7BBwPnhhA7qOJCC01Uw==
X-Gm-Gg: ASbGncvFos8e4BrJwoFj+dqWqXuNTV884mlOp9uVn0wzs6mjJPcUZRpwJP557/f87oL
	hvYDx089vfclHsXRCmbJj0JFwGhEZ5RbFwp2huglNpuR+zfcBNHOmu2wLGTmmgprvixHwVNkv1Z
	n7v5NV/typxfpjwDixZABdZnjEz42IS+Nq1pM7WAxsGnfE1liYoYP5RK7j8wu90fOZfOceLNolB
	YqBb31Gg8nsB/c6/w+Yrk0Nyi3yUOJXQz+BjL5Fjd2uQzKgtjfSXXzqnNXsTsDCZxt4nKwUoBD4
	ApmUS07V+pbUcDBIJYCfwNLmrmkjUsOgKhOylSp6UQZoYLEaxa9a9xs=
X-Received: by 2002:a05:6214:1d28:b0:6e8:9dd7:dfd0 with SMTP id 6a1803df08f44-6f23f188908mr52497476d6.44.1744396240845;
        Fri, 11 Apr 2025 11:30:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGGTdRAZGTWxZjNDqvRXfFHjzIuclHnT9UwsGZfzm19ZI8mK/0p0p6x/jTN+uifKPieH9BXXA==
X-Received: by 2002:a05:6214:1d28:b0:6e8:9dd7:dfd0 with SMTP id 6a1803df08f44-6f23f188908mr52496946d6.44.1744396240449;
        Fri, 11 Apr 2025 11:30:40 -0700 (PDT)
Received: from localhost (pool-100-17-21-114.bstnma.fios.verizon.net. [100.17.21.114])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f0de837f9dsm40270486d6.0.2025.04.11.11.30.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Apr 2025 11:30:39 -0700 (PDT)
Date: Fri, 11 Apr 2025 14:30:38 -0400
From: Eric Chanudet <echanude@redhat.com>
To: Christian Brauner <brauner@kernel.org>
Cc: Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
	Mateusz Guzik <mjguzik@gmail.com>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Jan Kara <jack@suse.cz>, Clark Williams <clrkwllms@kernel.org>, 
	Steven Rostedt <rostedt@goodmis.org>, Ian Kent <ikent@redhat.com>, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-rt-devel@lists.linux.dev, 
	Alexander Larsson <alexl@redhat.com>, Lucas Karpinski <lkarpins@redhat.com>
Subject: Re: [PATCH v4] fs/namespace: defer RCU sync for MNT_DETACH umount
Message-ID: <zahvxexq572ud7p5nlbtty3attjn7h7fmlujhxxpdgsj346tpg@u3zqnfvrnh5k>
References: <20250408210350.749901-12-echanude@redhat.com>
 <20250409-egalisieren-halbbitter-23bc252d3a38@brauner>
 <20250409131444.9K2lwziT@linutronix.de>
 <4qyflnhrml2gvnvtguj5ee7ewrz3ejhgdb2lfihifzjscc5orh@6ah6qxppgk5n>
 <20250409142510.PIlMaZhX@linutronix.de>
 <43hey3rnt7ytbuu4rapcr2p7wlww7x2jtafnm45ihazkrylmij@n4p4tdy3x2de>
 <20250411-abgetan-zumachen-ada00fc3770c@brauner>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250411-abgetan-zumachen-ada00fc3770c@brauner>

On Fri, Apr 11, 2025 at 05:17:25PM +0200, Christian Brauner wrote:
> > With this, I have applied your patch for the following discussion and
> > down thread. Happy to send a v5, should this patch be deemed worth
> > pursuing.
> 
> I'll just switch to system_unbound_wq and there's no need to resend for
> now. If the numbers somehow change significantly due to that change just
> mention that. Thanks.
> 

Thank you, I do not see a significant change in the numbers with
system_unbound_wq compared to system_wq.

Best,

-- 
Eric Chanudet

