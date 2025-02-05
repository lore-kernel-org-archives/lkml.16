Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABE5D19B586
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 16:26:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738772774; cv=none; b=fEHHWpelmfjI4L3bLJJCNbM+Dx/owBKMmtMI2yEtvrbOr9SYLVamTX93wUGX4aUCxhcMx3DAqJ732kmEUcHY98MZcFdJc19Zn9PO3s46LAGob6DsgWvKKmV3lYSJT8FZrgjSmuLYRN/6VwOrMmUx4GENyu/0bjjj/Nu3XSdzAvw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738772774; c=relaxed/simple;
	bh=Exj6/iLsqKjT++8PyLK8qSV53oYrBJ/Cz6ENaqGdg5k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=B6fQkqG5f4z89wnocSnVR8nVGEp8YTwptiaPIwprzbwkwfnCBvVmb9+DwBL+J3+w0Il4sYHgMnr86uEAQh3oE5bvhsjk6RyQCUD3kjFBIDTuGVS3vP58GJK4sRAwo4S+wQLxqtfFTKtwc80cvIfSY/0UMVbbVsKhX+clUY+rzdU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cogentembedded.com; spf=pass smtp.mailfrom=cogentembedded.com; dkim=pass (2048-bit key) header.d=cogentembedded-com.20230601.gappssmtp.com header.i=@cogentembedded-com.20230601.gappssmtp.com header.b=eo9OKL0E; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cogentembedded.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cogentembedded.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cogentembedded-com.20230601.gappssmtp.com header.i=@cogentembedded-com.20230601.gappssmtp.com header.b="eo9OKL0E"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-5dce3763140so1034964a12.3
        for <linux-kernel@vger.kernel.org>; Wed, 05 Feb 2025 08:26:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20230601.gappssmtp.com; s=20230601; t=1738772771; x=1739377571; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JEkTrAbO0UDjwP1xozi6/RouQ1l2PHhSoABPJp8WjCc=;
        b=eo9OKL0EOXaQNvPtam9F7fSc0F+4L4q7BRkirWx+72fmgnU1Zat6EaWI1omriSPd7h
         /vxTa/l0y9xBuK0G2MCHYAB776LbW64J7DUCfBRI+hgzQyaOYWY76O4B6h9qxHZlpyD+
         aB+ruzryhbc+LnwNEHriWPXIHvSAZ5q4kpFvMU8GkEL0JHN8kwMQNGq9MPWt+Spemnvx
         4/0WwKgEXma3eHaf2d2TV3MEhCgQ3wumfa5u9a2SVG15BqBxrlTp7jTRwMLPuN+qZX9G
         4m6Skj/2rIWuiqsaL1eIEiV4wzNtnSdHlJ7ockA8uPVEyn3D0S8zf98J7Y9AB064AMCS
         73cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738772771; x=1739377571;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JEkTrAbO0UDjwP1xozi6/RouQ1l2PHhSoABPJp8WjCc=;
        b=MbRu4pITwZWUV+S1BRQg7+Gagv207k4QNQ7VoRIve86lerJ7p5ZHRrLp1RFZ5EqBhl
         ynKbpiJNNuh6ehBdHefFil9PYdhTxEP8YHKVUGntfdTOZR7vnBZyu26XrJfD8wXa6wj3
         z88KJkx+yTLnMGxhE8XhAGDpQbFbQl1hHpjeWnQyE0Qvk4qJcc/Qe0FvcXXAS/94vjU8
         Xl/f01djSt0cwl5qzCSaZX3Asf/SOAAnlvsTadlgHV9w3vA/ewqBQFVexxxk4LtyuZkS
         o3VioxLS+FoON7w8b7v+S32Ib8oY27EcuAffnnbdCGeh1lxyFezr/AwV9AHcUFiNBOZX
         tWTA==
X-Forwarded-Encrypted: i=1; AJvYcCWD+K9sHBEnGjGwQWX+aHCanA+3lOSkK+vz8gI+N9eERwULwRBi4mB1oA/HOBQwVRdWRNveBHGr5aRHDUY=@vger.kernel.org
X-Gm-Message-State: AOJu0YyJCCCOcjELC1S3Sl1yEP+D7hRqRlPEZwLVVaINtSNB75e6iUU0
	x3OHVyODqZXfXQ79r6TFFPxVEsWBTm5QFYBTRKNKiHVlRJL//a1S9RTXEg2a6v0=
X-Gm-Gg: ASbGncv4RFKMM1AYjivSR2jPtYDJhKDz9Nl4BBvmooBTGxpCAi4kP8pQE11VTxudSar
	80jC53CAldUW7jPCBFxHiMG3K+yofgNUoDJP+Oiz4vLWfZugYmMoqvuT7iVqtMPt4NfN9yVzrul
	OXuO7FVnBitCWWIaGXRG9W1KRw4L4RvV+iRUOFIxird12530bDoIDr6YmGMs67mmZ+ec+0rfgh3
	Cl01CbDlN9ThTLlroTboHR+EqMb8gRxgQEpfjgAOpeAyRA6Mv/pCxjJU+IhgoJLWMcUb8gxTpNN
	vBvnGtK8rOEMaTeUsmcLRpOdZ7wmooZvmDdvw1OmxA==
X-Google-Smtp-Source: AGHT+IHQU9XwliJKLbkw6xcS14nU3Y0+jNhk8cZapY0yaL3g0neVr0hGvfA/2DmqbTj/6CV3WAg1Ag==
X-Received: by 2002:a05:6402:2110:b0:5dc:80d5:ff28 with SMTP id 4fb4d7f45d1cf-5dcdb71b9eamr3733183a12.14.1738772770788;
        Wed, 05 Feb 2025 08:26:10 -0800 (PST)
Received: from ?IPV6:2a02:810a:b83:a100::2e88? ([2a02:810a:b83:a100::2e88])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dc72404887sm11649731a12.38.2025.02.05.08.26.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Feb 2025 08:26:10 -0800 (PST)
Message-ID: <af3fb019-48fa-42e0-9e02-a4b0d3a724bc@cogentembedded.com>
Date: Wed, 5 Feb 2025 17:26:09 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next] net: renesas: rswitch: cleanup max_speed setting
To: Andrew Lunn <andrew@lunn.ch>
Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, netdev@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Michael Dege <michael.dege@renesas.com>,
 Christian Mardmoeller <christian.mardmoeller@renesas.com>,
 Dennis Ostermann <dennis.ostermann@renesas.com>
References: <20250203170941.2491964-1-nikita.yoush@cogentembedded.com>
 <59bc0c2b-0ece-427e-80c5-5b6920132989@lunn.ch>
Content-Language: en-US, ru-RU
From: Nikita Yushchenko <nikita.yoush@cogentembedded.com>
In-Reply-To: <59bc0c2b-0ece-427e-80c5-5b6920132989@lunn.ch>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

> You should only need max-speed when you have a PHY which can do more
> than the MAC.

This is exactly the case.

Unfortunately I don't have the spider schematics nearby, but AFAIU (one of flavours of) the board has 
PHYs capable of 5G but connected over SGMII.  When two such boards are connected to each other, on 
mainline kernel auto-negotiation takes noticeably longer than with the Renesas BSP kernel.

> Also, phylink handles this a lot better than phylib. So you might want
> to change rswitch to phylink, especially if you have link speeds > 1G.

The reverse switch happened in commit c16a5033f77b ("net: renesas: rswitch: Convert to phy_device").
I did not check the tech details of that, but decided not to touch it.

Nikita
