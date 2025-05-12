Received: from mail-il1-f177.google.com (mail-il1-f177.google.com [209.85.166.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B29EA1C701C
	for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 15:28:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747063708; cv=none; b=mGpNRWyhjk1IuJ58R3zIoRLXYzie3CDenJ63PYQgHUY+NTv/ronpHiTsaPHM2fXED0zcOfIXFw+mijLJVK5lcPs1eIASVXVva19UoWmdWGRQTE6Dv1/YaGy9DrfrYsxVheAmcsWA78HesbbMFps9PuhDRNFFCFfzwErhmRZnnMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747063708; c=relaxed/simple;
	bh=Szen702HR6RfAE9CpMI6ecv+Z/IYMShjQn/TYUlPL3g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mXzJX82Hk21D0inaFuaR606ZE9SS+Di7vueIWU+5u3gARtQzTgal9D8k4zCjTObA6eJa4T2oiWD3jHQtyxvFspM+b8bjEXIsAfMnYMwCrwRZTnVIxjbbjE/0tycJPbW9jpxnFn/fhjysCruoyC4zH7cA+7P5k9IaBVkcUe5rvs4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org; spf=pass smtp.mailfrom=cmpxchg.org; dkim=pass (2048-bit key) header.d=cmpxchg-org.20230601.gappssmtp.com header.i=@cmpxchg-org.20230601.gappssmtp.com header.b=bBsyHr0H; arc=none smtp.client-ip=209.85.166.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cmpxchg-org.20230601.gappssmtp.com header.i=@cmpxchg-org.20230601.gappssmtp.com header.b="bBsyHr0H"
Received: by mail-il1-f177.google.com with SMTP id e9e14a558f8ab-3d9327d0720so40229255ab.3
        for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 08:28:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cmpxchg-org.20230601.gappssmtp.com; s=20230601; t=1747063704; x=1747668504; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=z+Hw41Qvcr0+aLA00o7Vbu/JRTcQvJ4fJRvSY8tEg2I=;
        b=bBsyHr0HJ2WkaQeTWKd+w7q+IW/qihtbKZ4zstRLesuqZ/kWxGjBgPHPlCUe89J1HX
         ap23YufPk9up0AtomZRImW97UzVDcaD7b/j80r12LPSMTwW+e0YpBCS8+x31l9ldfon5
         0Agx1johIaErAqNNcQK6rjiyR63JHWZ6nsJcaN3gzOvRJlXWzTd2I/+Q07xxuSKsCk6n
         jHLA+45tvQ5peDsgY475l0u7v+wa6/UNABxhBAUFAXOlCiAfgfh9kmpwjdhxNm39Wz89
         +HdtkwlCGO/STjOyCpX+Xw5b6zxRdPiPBPn/Jfpjp0DYJt0Rj/UPUK8HkdL7yAfZiw4u
         8esA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747063704; x=1747668504;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z+Hw41Qvcr0+aLA00o7Vbu/JRTcQvJ4fJRvSY8tEg2I=;
        b=HNYuzmtbmySMelk844c/T5ASIzl2hp6Hne/0hO/9RKtGQSOVW+7FpEXgClbQmXbLMw
         H010QtgYjThGXIGiL+oCzvNLSb+3PxhEnxeQa3YlglEqnjBif60/ExpvfeUQkexspSbQ
         +Vc2EfvfP6EuPB0eBdspbbIkDEeMQPeDVXGNNk4LDc32lSoBvFMqFKSCKCZQCwN8Dq16
         C5B96eA01exTMJn51V140wyjRxaFSpgsffjHoaCLNiJtXGFl4UUAFlszwpgiln3HoMMp
         RsDgRgISjNH0A9MKNSBm76+Mr+/4CoqhuqJPGMJYxi6U2eSMoVzioqNXDkAaOpAGmN9K
         OgPA==
X-Forwarded-Encrypted: i=1; AJvYcCWIdKHsMQHlRO7qQy+W4PneR+YCr6h37z4dkgWsUmCy1+bGZtZPee0ZlNMpiz9Xa54MYA+d7cKcHl0pdSw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzEoMlpM7xATnaGcf6dwfe6RgeGWkXqfvRyd1NxIts4A+UE5vxI
	M8DoBbFKRwd6OBXkyV0RQOUePiVaNwqX3aSvKHpXbSxXUCfbcTf7htCzgDiP3WanMyVEg2yY7hT
	3czs=
X-Gm-Gg: ASbGncvN83wCMTBgXNbAte+CSHQe2s5fE89y1E1dClrlRuUEN1EfPdNSHTL/UasnRmu
	kLM+2KIBqYhAENyFVU8KLJK1ZZsNClUFiJGO0mq89jeNeo4ahrJN9huNxijUFbWBBGBExgJUPdB
	E71mCYDRVTjSqNABEM+x62Ni3qf2yxVq7daSPQb7gCWPrta/ReZY6q99gtIMo2IehHKEoq/lMuz
	/w8vb9FWjIAfpPi1qCMfeJ5jDbq+by6JoC2Y4xWjKJm9O9Wp2SIADpV0NwWTMDMQ1clnNI11CbI
	rdv7Jk62KmZglke/mMG4KO2tGoQqIAi0Rtp/6qcLOp1IvJIK4g==
X-Google-Smtp-Source: AGHT+IHWT4SW/j4BYEtsm/basITjSvfiDmbO41cjaUZ6kvvuPg9jCxE30zZbM9/kv9cgq+4MOtqOWA==
X-Received: by 2002:ad4:5f8c:0:b0:6e8:f8a8:83f2 with SMTP id 6a1803df08f44-6f6e4796064mr187832966d6.6.1747063693525;
        Mon, 12 May 2025 08:28:13 -0700 (PDT)
Received: from localhost ([2603:7000:c01:2716:365a:60ff:fe62:ff29])
        by smtp.gmail.com with UTF8SMTPSA id 6a1803df08f44-6f6e39e0969sm54383066d6.21.2025.05.12.08.28.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 May 2025 08:28:12 -0700 (PDT)
Date: Mon, 12 May 2025 11:28:11 -0400
From: Johannes Weiner <hannes@cmpxchg.org>
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Vlastimil Babka <vbabka@suse.cz>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Brendan Jackman <jackmanb@google.com>, Zi Yan <ziy@nvidia.com>,
	David Hildenbrand <david@redhat.com>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: [RESEND PATCH] MAINTAINERS: update page allocator section
Message-ID: <20250512152811.GA615800@cmpxchg.org>
References: <20250512144603.90379-1-lorenzo.stoakes@oracle.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250512144603.90379-1-lorenzo.stoakes@oracle.com>

On Mon, May 12, 2025 at 03:46:03PM +0100, Lorenzo Stoakes wrote:
> Make Vlastimil maintainer of this section (with thanks to Vlastimil for
> agreeing to this!) and add page isolation files for which this section seem
> most appropriate.
> 
> We may wish to, in future, refactor/rename some of these files to more
> logically fit what is actually being performed, but for the time being this
> seems the most sensible place.
> 
> Additionally, fix the alphabetical ordering of files.
> 
> Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> Acked-by: Vlastimil Babka <vbabka@suse.cz>

Acked-by: Johannes Weiner <hannes@cmpxchg.org>
