Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B813E8634F
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 01:38:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745545129; cv=none; b=Z6bzfNcdUMdBk+AyiQ1XoOxFXfoQBljGM6Mb1zr5ptyUdx2vol9Q7isf5Y/53OXFiuGGBWPzG2xdSsbvdwRLWqg/eiIY1jcFamoL0Kz2BhX9fQScuyPBd23Kcp5QMRTeakCO0vLtNlFG62ewtyW/fu3entunqADsfP0mcmU7Ivw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745545129; c=relaxed/simple;
	bh=yhOlAEzwrF0aCAFf+JgQeNbbx3sk62jQPHuNFSORMuE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cd/8hU1UJ4SGBswEiGFxB12BWlmBVAZ24NuKP37nvZ5LeVRN7Q/++Hvg6CSXGmn/ivtGeYOGc+OMhMpXeseEBk/+PGt6cfgh2bxjnm5tLuKBnrPpVjDSBE0/9fU7es40t0dw/BtDBgOErdXdvczRun25c5rf5KTGdfcn1JlZ7fQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fastly.com; spf=pass smtp.mailfrom=fastly.com; dkim=pass (1024-bit key) header.d=fastly.com header.i=@fastly.com header.b=OWV7qZ91; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fastly.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fastly.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=fastly.com header.i=@fastly.com header.b="OWV7qZ91"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2243803b776so29237465ad.0
        for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 18:38:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fastly.com; s=google; t=1745545126; x=1746149926; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KSqYScKgytFmXzzaTTv95GQdkzPtmJIkcWKivQdfd7E=;
        b=OWV7qZ91iqDuT+nIndMTN3+mLDvFqvm0SPifYoT0vQYv6e23u7mATuF35l0sbtfaSh
         DU4aAksXg8kTxuXwwZUmp+NimBiZo4FM4b8iadkqnYuayNakFFl7Wcpo6xN7e4Y/mRb9
         GpIY4wlgGvsZaRjRmgqZVlA631Kso9qMhnLf0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745545126; x=1746149926;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KSqYScKgytFmXzzaTTv95GQdkzPtmJIkcWKivQdfd7E=;
        b=SsTMlOjQbnUerH1TMSMEqAM8K/M2dRZ88sAhyHHzc4bJhW4RkUVuevhT+rOE8zaC/N
         dC9REgwjYsjYV6+1efmXQ54PtDQiznVI5xEcJypyJk7W+QDjHTXud3is6Y0Bh9H326qX
         RFE+sc1CIM1lX2SQULQR3yRdOQzsYTywZf2xDjNpNb93hTCVq/HbW2cdxNm/0T866rRL
         2xMU6nHIdTnyLrK9oPBett4ni2yOscu/fijXEI8amjGliYd4x0nOuWjwft6drxrEHnam
         aCQtwrX5i+vWvFf3WqxOrhjMw70/QKFikHU1+y8IP18F1RuUp4SZPjx/JgOHU7w/BFcu
         e1HA==
X-Forwarded-Encrypted: i=1; AJvYcCUcEgMzyw1/DIUJJQQZn/RvsyIVwcf8b8c2jvxRTYNw4LOnn60UAtNj/8s/ujzliu9JvIerb9sHiedMXmQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YztsnWzHAgEwKgCPmUKL89G8DEjFNXCvKpX2T4DWZmnVrBvxuoy
	aSyScRiI1fBiQcOdiLm7cRO5MNmBQobJv+R4No/y9rwI6cTaYdko/gG9+v2G+yY=
X-Gm-Gg: ASbGncuJ2XuA6x5TdndEXjzxSidb6KuAgOvOqHAoQcV/qb0Y6ZLz86PYW9S82RekJZ+
	5Fpci84FKF4/WfG8wFBzEsyiwO9aADCYuzUDdjAWl7/kfxiy6dcgI96p6poUx5kSN7oGYS6/vQV
	9n0K4DOCZ5TZyDLXDyTlJrs1O6zwTQIE5xPg/FNpCtDrZX8HwuW56/Fsk/f5sdSxWrajpFwW+Jz
	NW+uSuixF1KBhdgGaylhWsaVhiqiVJjTYFYZJVr0lqonERQcBljSqtfuVyz1HM+mt0F6OxYILP9
	tZzQ3KCa5YjZ4YAFX1RFBlm/2HrF3jkDYmYi5L9M3vNsEfcTwX7jhiHzm/1sBivzLLFHln1/Zj4
	K+KVEFjbAs+0w14afvg==
X-Google-Smtp-Source: AGHT+IHtyY/Uad+Dw4YYDrHqlH0t+QCAu2yareuHTx9iQsFmiei7axjBQ/X+aTouMtAFce8aEB6OZQ==
X-Received: by 2002:a17:902:e84c:b0:216:644f:bc0e with SMTP id d9443c01a7336-22dbf5efce5mr8556365ad.24.1745545126067;
        Thu, 24 Apr 2025 18:38:46 -0700 (PDT)
Received: from LQ3V64L9R2 (c-24-6-151-244.hsd1.ca.comcast.net. [24.6.151.244])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db52214ebsm20612495ad.246.2025.04.24.18.38.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 18:38:45 -0700 (PDT)
Date: Thu, 24 Apr 2025 18:38:42 -0700
From: Joe Damato <jdamato@fastly.com>
To: Jakub Kicinski <kuba@kernel.org>
Cc: netdev@vger.kernel.org, shaw.leon@gmail.com, pabeni@redhat.com,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>, Shuah Khan <shuah@kernel.org>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Jesper Dangaard Brouer <hawk@kernel.org>,
	John Fastabend <john.fastabend@gmail.com>,
	open list <linux-kernel@vger.kernel.org>,
	"open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
	"open list:XDP (eXpress Data Path):Keyword:(?:b|_)xdp(?:b|_)" <bpf@vger.kernel.org>
Subject: Re: [PATCH net-next v4 2/3] selftests: drv-net: Factor out ksft C
 helpers
Message-ID: <aArnojKzMWKS1ySR@LQ3V64L9R2>
Mail-Followup-To: Joe Damato <jdamato@fastly.com>,
	Jakub Kicinski <kuba@kernel.org>, netdev@vger.kernel.org,
	shaw.leon@gmail.com, pabeni@redhat.com,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>, Shuah Khan <shuah@kernel.org>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Jesper Dangaard Brouer <hawk@kernel.org>,
	John Fastabend <john.fastabend@gmail.com>,
	open list <linux-kernel@vger.kernel.org>,
	"open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
	"open list:XDP (eXpress Data Path):Keyword:(?:b|_)xdp(?:b|_)" <bpf@vger.kernel.org>
References: <20250424002746.16891-1-jdamato@fastly.com>
 <20250424002746.16891-3-jdamato@fastly.com>
 <20250424183218.204e9fd1@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250424183218.204e9fd1@kernel.org>

On Thu, Apr 24, 2025 at 06:32:18PM -0700, Jakub Kicinski wrote:
> On Thu, 24 Apr 2025 00:27:32 +0000 Joe Damato wrote:
> > +++ b/tools/testing/selftests/drivers/net/ksft.h
> > +static void ksft_ready(void)
> 
> > +static void ksft_wait(void)
> 
> These need to be static inlines.
> I'll fix when applying cause I think this series may conflict 
> with Bui Quang Minh's

OK -- if you change your mind and prefer that I respin to save you
some cycles or something, I am happy to do so.

Thanks.
