Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86EA515820C
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 02:10:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744078210; cv=none; b=DMAzCSblC57vqqGvkbSckDm9PfK9i0FDWLcKctaGVi4+FaCzpaFOmtCsy2VgCFGllyP1JtxmHCD9YdX2RpOTd0W4Wcosc1tO2iWI/dhoJTS0MbO+nXWHdjVBteDMKnuasME4kL62BBKy8HrqGN2TWGanhezoVMj+dKnGBdV17gk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744078210; c=relaxed/simple;
	bh=eHqdzlCtA2T7bv1J4nuHDRtUKpWIWd/H/uwx8kGgs30=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=p5gf0cUeXvgyKPi+gupk9UYxpahtly9OwHW62CNANdW8bxVKK6AHnx7xmn/V/+TVUGUZ70xZwNo4BtAWuxaZfUjtx9prAZ4emv0H/ABFWRznFOtQUrHjeJ2SiKbDbuhDjgOs+L1c9gC6OLMHYPbpL9S232oovesD9LNPCQZUH7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fastly.com; spf=pass smtp.mailfrom=fastly.com; dkim=pass (1024-bit key) header.d=fastly.com header.i=@fastly.com header.b=MCJH+/sG; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fastly.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fastly.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=fastly.com header.i=@fastly.com header.b="MCJH+/sG"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-7376dd56f60so3619281b3a.3
        for <linux-kernel@vger.kernel.org>; Mon, 07 Apr 2025 19:10:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fastly.com; s=google; t=1744078208; x=1744683008; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xw0bNP2Yg/rWmYhnfnKPujP8+GX7eRGIQfk3QlxH5+4=;
        b=MCJH+/sGO/4ICs1kclrcOJCO3YfTR2Rh0mynVAdXcF3SN+/Zjw6ewHYYC6rDInGmph
         +yQfTiPvCB5bP5AIlakRV57RoQPPLTQ7JUXhBg49lKwPV1wVESpXBj1bS/fS5rYsXDun
         xbniO2sAhBogeQXzhirrmNQ5uaYMxdbVlx5tw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744078208; x=1744683008;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xw0bNP2Yg/rWmYhnfnKPujP8+GX7eRGIQfk3QlxH5+4=;
        b=AtjyQt/77d0aFvFP8h34D1S44PBRkkDgUhKsfAH5fEkW7LeIZziDKD3T+l5QMIriYf
         OwE6Dd8PEZyTk+xE3/NoIVkwGqh/N1ApwiiGLRlJQrzOcCRAO4QRxJkXd5djvyxxMAXR
         uv+KnTdp59tvjLxs/KogWWwYZCd7QqynMXayuJofbwEs9ROQcR7ptm/pOSN/MwV4mdyf
         bIMk0bLQtZ7SIa9GYfSMwCz3qNFMtalemf4ARdgoYsIP4Sb3JS/1fdKMB73tRG0sGxiw
         jybcQTB7jvp7Q15jnmNy58CH6IwWryf0DvfrJPrWoHgBMl3+tcwoRRcRuJwJ99HTqqC4
         +5CQ==
X-Forwarded-Encrypted: i=1; AJvYcCW3tBmKryKGrVgz/NGIpgOevg66XybDrSxfcNPZc+IwEWzIz/P1QvJVJTj4mSS00/a2ttJ5WzgS5nONGoY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0dfmvN2tYd2VN7WBsJrT/sIGyhBzJ0IMijrS8j17Eeo7Dl/0Y
	rXoMKPzfDQnNJi7kiS4TigaOT1rsqcTiDrp7GzTDCZoBfrdWBs+Is1+V4CGgZdk=
X-Gm-Gg: ASbGnctFhii0vgPg9OJK6yTSMC3vHopEq+Ger8o4M3Jqyt3L92sc5gDjosqmVpLAyVd
	oWIhpg7HPmpMwCV+O9GAkbbXNyMhSAn0mdvSWECbi+buZ9dNFlg0b3KQh+bsKH4qM7fr7gNmTEo
	R1F/nH3rAmm8RVjjZj5T82I/kB0ZdCwmY2ZKTwJ3Qxj2jINU3Rht0JCMZhBzOm/tEZkPmI087mR
	EwwXyOyyw3b5d21X1PwXFoy90DGnSPHbbuPYkUmwI3bK1cbmst2k0oYOOOJdkI1I86BffqLGeij
	aKhqgtxZGZQwHzOmH0LFfNEAbY/E5i3exjulpJglTLO/kz8stUW62pzsanIUGFk6php4LGSqwUF
	+R3w+MAWQotJBsz9gkoPUkQ==
X-Google-Smtp-Source: AGHT+IH/5CXHv3h6BfVUIkPGYZMx+j5jBXm5Q5QQb4m5Tix6r+HC8jdY/0+cBSX4V1nUaKqUundp9Q==
X-Received: by 2002:a05:6a20:9c8b:b0:1fd:f8dc:7c0e with SMTP id adf61e73a8af0-20107efe0fdmr21459777637.12.1744078207714;
        Mon, 07 Apr 2025 19:10:07 -0700 (PDT)
Received: from LQ3V64L9R2 (c-24-6-151-244.hsd1.ca.comcast.net. [24.6.151.244])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-739da0b42e1sm9564665b3a.134.2025.04.07.19.10.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 19:10:07 -0700 (PDT)
Date: Mon, 7 Apr 2025 19:10:04 -0700
From: Joe Damato <jdamato@fastly.com>
To: Michal Luczaj <mhal@rbox.co>
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
	David Ahern <dsahern@kernel.org>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next] net: Drop unused @sk of
 __skb_try_recv_from_queue()
Message-ID: <Z_SFfAGYrvDPl5DM@LQ3V64L9R2>
Mail-Followup-To: Joe Damato <jdamato@fastly.com>,
	Michal Luczaj <mhal@rbox.co>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
	David Ahern <dsahern@kernel.org>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
References: <20250407-cleanup-drop-param-sk-v1-1-cd076979afac@rbox.co>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250407-cleanup-drop-param-sk-v1-1-cd076979afac@rbox.co>

On Mon, Apr 07, 2025 at 09:01:02PM +0200, Michal Luczaj wrote:
> __skb_try_recv_from_queue() deals with a queue, @sk is never used.
> Remove sk from function parameters, adapt callers.
> 
> No functional change intended.
> 
> Signed-off-by: Michal Luczaj <mhal@rbox.co>
> ---
>  include/linux/skbuff.h | 3 +--
>  net/core/datagram.c    | 5 ++---
>  net/ipv4/udp.c         | 8 ++++----
>  3 files changed, 7 insertions(+), 9 deletions(-)

Reviewed-by: Joe Damato <jdamato@fastly.com>
