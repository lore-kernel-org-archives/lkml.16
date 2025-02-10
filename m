Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38E2925B66C
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 17:50:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739209838; cv=none; b=RFP6Lg9CHFur+Pt8OeqSCc7C+lEtnXLsLBwXBaMS1Xkvc0AwwwUEy9RPQ5rHXkXGUbRKi7TFNgT1LpYEfI1TW8TxUSNgYC0j6kyFGCDyp/RQNLMk+QmDrusgOmnLTpQYeAGVsrA7ONeIC1UcsOXlgHa+QhxuMtl2uhKt40KE7kY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739209838; c=relaxed/simple;
	bh=5itngRyI3QLkc3iUAXbbXE3l84sxybC0VJY8BsapT6Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lPVPayfm7VmMNi/AfC3tHpWmJmGEoNkV8XI0xQ7laezrMyvWzsA7y/LgjpQgK5wiPOi3aXh8hhOH4UDfbW/ck0jdOoVdVIa7BuJVhvO1sw0/vGa9MaxUNsyccM32Wu+B9CM/msHPjceoWxdwCSHjUyZYl57Bz+X8HdW3sBkN3hQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fastly.com; spf=pass smtp.mailfrom=fastly.com; dkim=pass (1024-bit key) header.d=fastly.com header.i=@fastly.com header.b=Y/JIWh+N; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fastly.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fastly.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=fastly.com header.i=@fastly.com header.b="Y/JIWh+N"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-21f5660c2fdso59599005ad.2
        for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 09:50:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fastly.com; s=google; t=1739209836; x=1739814636; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OCO3aIRcq5bPxRXLWL+/UKDcQnItmXbvQb/S10a8uSI=;
        b=Y/JIWh+NTFsGFS8sJ0F23YHaZC+GWW5HJj3+TEOHzKo/XyBEUqur76CkwGKb7CAHKz
         Nw2S/XsPt36cjhZJfAOBnm/W3rtepRc67H4yH95yNl6BVVy60Yrr05Dv0xv7yoUsATXf
         XkkvnqQT+rogwFP6lAXwXGWmCA+eNirQQcYVA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739209836; x=1739814636;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OCO3aIRcq5bPxRXLWL+/UKDcQnItmXbvQb/S10a8uSI=;
        b=PwkP3g7IG5uwIjU4gAc/3+4DKt/3/1VziZacV+nS0pB87BdKOpHF4QnQPxXpIiqLX1
         qMs6JVticBX40+k/w1x43UElAmuIFTaY9Qt/rXEzYMQn/tP+PXD04Rx0pTZUsRtZT46j
         zO26n1L05f4xWFT5X2fDBoElXdN3p6++PgC7lPCdYe346LtSSzZK+ulfFZEextHWzNkd
         JSsvLJ/JTB0NczUdo97EZ6x/Ib4wWSY2RlJR5qDTjKaGlQze5BGkZBtQeYyYxIcGGX0v
         TgiKH0w8VHtr9u+Z7O5oWk36TQVJY3SJ+HYvHZXhQ2Jo7xjSYrMreIC7KdW3zQPC2UcD
         hezg==
X-Forwarded-Encrypted: i=1; AJvYcCWB6FqqwvHkB4xiboeW6lEVs2V3U+cBpaqduBaLtOFgnenfS8DdxqYizzblUUDdNymg4c9zty24z0fl0EY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1sKstLbhJXMS0dZ5wC83bTc5PezQVfiGSJlyeoswgSXlf1Y9b
	tUg9c09b73pEsuTGSrG8Td0510lK3Z/iBftvIl7r5I9kicow1UdxoBSMJcwuefg=
X-Gm-Gg: ASbGnctvF2r0ISPf70+9PylOFx3pcSpwCBpNMlR+ZlN4ZoCADbHvrosMz0X3h506aq/
	C0+yeF8Ub/OGt0TH0Y4xvrUVj65SnS0o28e9jPXlebprYyOyuL5k9UZ3K+L9T0EBrnYytGQJfeD
	q1ItWOUC82sCC0RRdd/nGQOZphtud2k2Iif/7HX60mpectVlVvSE7/wvbp3b2U5HpyjROmjJKpI
	Mko0VIC+8p+pnnZQZtwI3m+KELy3cQyuJRffDB2Bipl98MNel7FIwKUA8qNSuJSIHcVocdIsKDH
	lrVoJR6rLSJtub//0Gs5d12QuUNeSWjqTXh+1ucoSEYpr237BveyH5l4sw==
X-Google-Smtp-Source: AGHT+IESIWs0nDg5kAqiOuNPxZ9VJShu5naJndD6KAbqxfopHAr2qsG48oAN4aHnkGyTLNqhk6vhKg==
X-Received: by 2002:a17:902:f78d:b0:21f:68ae:56e3 with SMTP id d9443c01a7336-21f68ae57dcmr162636775ad.39.1739209836373;
        Mon, 10 Feb 2025 09:50:36 -0800 (PST)
Received: from LQ3V64L9R2 (c-24-6-151-244.hsd1.ca.comcast.net. [24.6.151.244])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21f36897faesm81159455ad.213.2025.02.10.09.50.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 09:50:35 -0800 (PST)
Date: Mon, 10 Feb 2025 09:50:33 -0800
From: Joe Damato <jdamato@fastly.com>
To: Purva Yeshi <purvayeshi550@gmail.com>
Cc: "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	skhan@linuxfoundation.org, Simon Horman <horms@kernel.org>,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next v2] af_unix: Fix undefined 'other' error
Message-ID: <Z6o8aeG_GqxtwXV9@LQ3V64L9R2>
Mail-Followup-To: Joe Damato <jdamato@fastly.com>,
	Purva Yeshi <purvayeshi550@gmail.com>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	skhan@linuxfoundation.org, Simon Horman <horms@kernel.org>,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250210075006.9126-1-purvayeshi550@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250210075006.9126-1-purvayeshi550@gmail.com>

On Mon, Feb 10, 2025 at 01:20:06PM +0530, Purva Yeshi wrote:
> Fix issue detected by smatch tool:
> An "undefined 'other'" error occur in __releases() annotation.
> 
> Fix an undefined 'other' error in unix_wait_for_peer() caused by  
> __releases(&unix_sk(other)->lock) being placed before 'other' is in  
> scope. Since AF_UNIX does not use Sparse annotations, remove it to fix  
> the issue.  
> 
> Eliminate the error without affecting functionality.  
> 
> Signed-off-by: Purva Yeshi <purvayeshi550@gmail.com>
> ---
> V1 - https://lore.kernel.org/lkml/20250209184355.16257-1-purvayeshi550@gmail.com/
> V2 - Remove __releases() annotation as AF_UNIX does not use Sparse annotations.
>  net/unix/af_unix.c | 1 -
>  1 file changed, 1 deletion(-)
> 

Reviewed-by: Joe Damato <jdamato@fastly.com>
