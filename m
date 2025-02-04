Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ACDB2135BC
	for <linux-kernel@vger.kernel.org>; Tue,  4 Feb 2025 14:34:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738679687; cv=none; b=IzMzez1LQhC6uJKcXdZ3uyPuOG0CcqQ3rKgvGuqGKQln3756C6jLB4OCb64iSTyvm7RGfq7MEQnl3x8dno0+V7xec46TBncdh/3iDSEX2YGBmbWDvK/K9m9rMO5nrEJt4aK75PA4M1A4t4uWSaEe21ytDGscl+7VqoyYoMVneKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738679687; c=relaxed/simple;
	bh=e+mk6Go6YBOyUdQc2Du/FlFuwBxNIMX2W0mbHPlPEpc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bxaBVy27+IRweKFrhBcLrRxXYXFeKbSQ6wOs3ViGChexUBDRXohysSwSrTJU+ZJBKKILW1UavEe6s6al33BfDMIE3XPLKrVdcC5CpL2IIqHJ6gw9fKrX1wD8BwKkWyZhxBGTGT6jod6klLF9GLhyhy2Cl0NmIatjs3F3K9PrHB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Y/K0NNWI; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Y/K0NNWI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1738679684;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Z/sznZPYCGxBgx5ZYncrrXMOgkTcbfYSYYoc1loZOiU=;
	b=Y/K0NNWIV+9InHcQTAeGGmWZVAk3nTUjLYqSMnS9jGrHAyt6smGNedzW12UheIrn7quLHO
	oJmw/UyMnulpO6tCHMjJ8WagTvwSKpwGWMMgPKrvzKrGk3dpHCWoiY7hZrh2rS1+s5FNG3
	9M01+E6a2BovOgchI41XeDyNO0HVrq4=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-351-y1EI6vj3N_ORZDWS7p848Q-1; Tue, 04 Feb 2025 09:34:40 -0500
X-MC-Unique: y1EI6vj3N_ORZDWS7p848Q-1
X-Mimecast-MFC-AGG-ID: y1EI6vj3N_ORZDWS7p848Q
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-43628594d34so29661035e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 04 Feb 2025 06:34:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738679679; x=1739284479;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Z/sznZPYCGxBgx5ZYncrrXMOgkTcbfYSYYoc1loZOiU=;
        b=gZ1Rv4DxH9LAzLeflUxvw7utOKSa+YHe38edNWt/lxCKMjh9MQX86+Lhojcmriw+AO
         e9VxfX64F5MNJv0anXHCWmSdAVF3eFzgKh2rqMUBvGqApzUTEsPth8i/4I63MU0ZwW+r
         Z5SI5bo7LfWRg71PYJWUtyFw1ml56Frc8qMqDFgP5rO2aRIqhVX4jOFdqniRbg7fVi8k
         zc7oGS0fbfv3+nUrUs+QmS4ViWborvjypzRdW1H4fCGjT0th7tLk5NMN+awR6VYoehp3
         mjAPDLQWHw1VrIruz6Zbj67gjBPVm0RSfjAZblHD6Nmay8DnFNKy8DzjRUWCblYCQ/eO
         tg/A==
X-Forwarded-Encrypted: i=1; AJvYcCU+6b9raSydwSHHE73yk6JQymvoIFcSAOlv3fTmOqcOU2zHhFN2aq/d8CB2Qrudafanp7mgbeQ9A/hzQIA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz70lXE8xwWYDcrUehHbkxeQ4dIlDCqm+z3IAWZJnjoYOgkScrk
	d+q1r9VnU6lZt2nCXxBKxr6m0gtmpsQIdoV5l31Rp8F2ldaTXMZpUpnIRq89ihmZNc2Qb+ilt/Y
	lFsZUmvt+k9fYaHMEy/ndvYe8cCV5UHI/D65bUQzcbeI4s1oHsVz9UIbF3gdSlw==
X-Gm-Gg: ASbGnctUyavKnDuXlyVRXdrUx0YUDqOmye7tCBY0YJogvq764yAkzJ1NyzijZNGQCjv
	qwXBGcrfNaQ6kEwDCWu5HQ6Xf7kQ6WyYOFuz5MdfWfqXmqCFUbf3lXqAtq0PunmagTpCNWBnOu8
	tjAJ06qsrswobTJnyxBmwZN8mCov6fXXHSEbnF0+U4uE7n6a36i39ibzcx65aaqx5D9lptZE3Ya
	9UeCqt4pB6ROvA0MFh6IwrEKV+O6F6QmoAqbqEsKXPvO24niBO2Tm9ls+34Nu6AkvPKA0rm0SAY
	ERhKM0ih7qThhkSztNefb1coOOs+DU/5XoE=
X-Received: by 2002:a05:600c:1f10:b0:434:feb1:adae with SMTP id 5b1f17b1804b1-438dc3ae88amr220885195e9.3.1738679679457;
        Tue, 04 Feb 2025 06:34:39 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGKACEzL8lGYAK5Sah9vAMaiK3BXB9bavSsTbKa3lm2NJJhDe7ER6aVQEmUsE4VcxvW2Cnh5Q==
X-Received: by 2002:a05:600c:1f10:b0:434:feb1:adae with SMTP id 5b1f17b1804b1-438dc3ae88amr220884965e9.3.1738679679100;
        Tue, 04 Feb 2025 06:34:39 -0800 (PST)
Received: from [192.168.88.253] (146-241-41-201.dyn.eolo.it. [146.241.41.201])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c5c11fadbsm15720723f8f.44.2025.02.04.06.34.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Feb 2025 06:34:38 -0800 (PST)
Message-ID: <aa464cc9-7259-4745-bc9a-45b34cf66a60@redhat.com>
Date: Tue, 4 Feb 2025 15:34:37 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net 2/2] rxrpc: Fix the rxrpc_connection attend queue
 handling
To: David Howells <dhowells@redhat.com>
Cc: netdev@vger.kernel.org, Marc Dionne <marc.dionne@auristor.com>,
 Jakub Kicinski <kuba@kernel.org>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, linux-afs@lists.infradead.org,
 linux-kernel@vger.kernel.org, Simon Horman <horms@kernel.org>
References: <716751b5-6907-4fbb-bb07-0223f5761299@redhat.com>
 <20250203110307.7265-1-dhowells@redhat.com>
 <20250203110307.7265-3-dhowells@redhat.com>
 <549953.1738678165@warthog.procyon.org.uk>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <549953.1738678165@warthog.procyon.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2/4/25 3:09 PM, David Howells wrote:
> Paolo Abeni <pabeni@redhat.com> wrote:
> 
>> A couple of minor nits: I think this deserves a 'Fixes' tag,
> 
> Fixes: f2cce89a074e ("rxrpc: Implement a mechanism to send an event notification to a connection")
> 
>> and possibly split into separate patches to address the reported problems
>> individually.
> 
> I can do that if you really want.

I guess we are all better off without the need for a repost. I'm
applying it as-is.

/P

