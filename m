Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B5B321C180
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 05:56:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738735008; cv=none; b=ZzaE5wB4XqWK2ZKMls/9pXMCR7a67gylI3xtnx7vVqmFebQPaQqGKb3SCyUcvmWnlCdXW4tmDZNwM4l28iM9IH1yvoFIlxAWNVyBXGtnpej3A0z59wY5n+1982Z4cSp/KjsyUDrS0aq7Mt9YvUvIAB6qNjwBM9nUyR7KW3SDzcw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738735008; c=relaxed/simple;
	bh=MrX4MfuXKWj5ytSNxwkhkKn37o5v+Re4uJYrYKu/+kc=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lihltYmTrEwQi4LAV+nkhP5o5fcLT13JCkpt2lO147rBMQiDWs6CeO46b49YmPqT2frRv+NX463jFN18pTznO491ZfQHHIarNRc2R9zmFxmHVDx4bf2zH5T5edylrLGJ5hUQOupH1tv3Iu8Sor1pGNMzE7IaeafS5YzNttWWUPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=networkplumber.org; spf=pass smtp.mailfrom=networkplumber.org; dkim=pass (2048-bit key) header.d=networkplumber-org.20230601.gappssmtp.com header.i=@networkplumber-org.20230601.gappssmtp.com header.b=PvgD56ON; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=networkplumber.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=networkplumber.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=networkplumber-org.20230601.gappssmtp.com header.i=@networkplumber-org.20230601.gappssmtp.com header.b="PvgD56ON"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-2f9d5e0e365so1550189a91.2
        for <linux-kernel@vger.kernel.org>; Tue, 04 Feb 2025 21:56:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=networkplumber-org.20230601.gappssmtp.com; s=20230601; t=1738735006; x=1739339806; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ns0GvBmqZ/ALUPGbyiEvtLecO6r/ScOTIN440LsR8U0=;
        b=PvgD56ON9ydeM2frr0Pss/6EhwfrpkPotumZZBi9t9hWG23SK+BTxTll+89eVAGSWd
         3kmqGfQQG0d0BGoqKYHmLzz9iqIEa6sGy4dvpTjTVP3xJzK8zMtOv/rsUbL76G/lX9eO
         K4I4KiRMbd22Pg1ak/CvdWT7PFzyXidj9qDpOFNzrnwap0X6vHzzfgnP59LB4o73WZ/W
         F9JpdZZLDEfN/hifDXy7onJtBq7PLxkJvbE38gScAFOXSRrJND2D9PrRjJQHdZNo9ZXR
         7/fmohklHSn72E9v+U91y1cJK86brk1XM/gCJh7YKcAyWfBxVNXzbbUqYurCyj9i68wW
         JZJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738735006; x=1739339806;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ns0GvBmqZ/ALUPGbyiEvtLecO6r/ScOTIN440LsR8U0=;
        b=TrfSFFizTEmYW1zZgQl3rK60cTFtrUskeubpOFFZJrubzzYq/Rn9WRGoaDQlLCuzR4
         meGtQDyaPN/9wvvGUgUlCO0oVLrzoGO0O9tuwMAtohdTUmHNB7EP2bopxRkXrUhTT6Bg
         Rvv2PQ0lncKQD9s6jp3U8NhP8NBfLc+oX6z5ErUPh7Buwz60h0CEGotU7fSGRFlJ/j+b
         DfJJH3p5SLT4NsM6h2h7OxxCbzk0a/FtlWs03SQaHS765hiHXRnmPR1AGjhNrLzuhBk3
         5HKIG6ExOXLWB/GFBaHYN7opYxvpd2NrGqdWFW4coLSIQGWLlLtPvljSBVY5pYjJpl2J
         6U0g==
X-Forwarded-Encrypted: i=1; AJvYcCUsOIzr2X+Mka5cKzy33Bji9NicWm92o97s24FXMixXNILxltD0CPHgz1AkJ16lxqulrEFSjFKJoupQEVQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzwkonloDadZH1nX9DB6ZUouCqM87dASV9QKYF4xWtdQLoXBIk/
	5ynpyZX3GjvVZQ2PP1lyVa915V9wEdvyWt9rmVmubexDVkANqV6fw3x3M/vAHlU=
X-Gm-Gg: ASbGncuXvMIdX4nCnPSpXehviTqudPPeewDqi8BN4PacufWcx/U5QWKIGENj83D99wA
	TeqZUGxsdiEXpkZmYoSomh0lzVPhp3CVoGmXMqKsquNuGk7+vBdGSE9Sz3H8EHK/pdueXveT/vS
	b7icY+X2N2JBMnJ2cJrHF3KXfIJtnBmk/qMQ+s5CaYhcQ62xTow27Q4zFvQD/Ok29rq5X0ajIgz
	NHhOTcPH8f6l3A0LQoiFyCKM9NOxga/GKasQbBnCbAj5LitE9jI5P2DftkxELyqPiwBlOiEku8p
	pYyJhtl/MGXR2viHZtAN1TGkKfsRyTJlOqUF3jJKS6xzbbHBzTfSHZGLbizodxOZLm/9
X-Google-Smtp-Source: AGHT+IG04CF5Qx7s6xBWVy3NG/NTiwTMF528huN8sMDzFrqgklOtDQvD8VpkkKg5ZaYCNCuNQm5zHg==
X-Received: by 2002:a05:6a00:4642:b0:72d:8fa2:99ac with SMTP id d2e1a72fcca58-730351255c8mr2340033b3a.13.1738735006329;
        Tue, 04 Feb 2025 21:56:46 -0800 (PST)
Received: from hermes.local (204-195-96-226.wavecable.com. [204.195.96.226])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72fe6a18cb1sm11561432b3a.169.2025.02.04.21.56.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Feb 2025 21:56:45 -0800 (PST)
Date: Tue, 4 Feb 2025 21:56:43 -0800
From: Stephen Hemminger <stephen@networkplumber.org>
To: Shradha Gupta <shradhagupta@linux.microsoft.com>
Cc: linux-hyperv@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, "K. Y. Srinivasan" <kys@microsoft.com>,
 Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>,
 Dexuan Cui <decui@microsoft.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
 <pabeni@redhat.com>, Long Li <longli@microsoft.com>, Konstantin Taranov
 <kotaranov@microsoft.com>, Souradeep Chakrabarti
 <schakrabarti@linux.microsoft.com>, Erick Archer
 <erick.archer@outlook.com>, Shradha Gupta <shradhagupta@microsoft.com>
Subject: Re: [PATCH 2/2] hv_netvsc: Use VF's tso_max_size value when data
 path is VF
Message-ID: <20250204215643.41d3f00f@hermes.local>
In-Reply-To: <1738729316-25922-1-git-send-email-shradhagupta@linux.microsoft.com>
References: <1738729257-25510-1-git-send-email-shradhagupta@linux.microsoft.com>
	<1738729316-25922-1-git-send-email-shradhagupta@linux.microsoft.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue,  4 Feb 2025 20:21:55 -0800
Shradha Gupta <shradhagupta@linux.microsoft.com> wrote:

> On Azure, increasing VF's TCP segment size to up-to GSO_MAX_SIZE
> is not possible without allowing the same for netvsc NIC
> (as the NICs are bonded together). For bonded NICs, the min of the max
> segment size of the members is propagated in the stack.
> 
> Therefore, we use netif_set_tso_max_size() to set max segment size
> to VF's segment size for netvsc too, when the data path is switched over
> to the VF
> Tested on azure env with Accelerated Networking enabled and disabled.
> 
> Signed-off-by: Shradha Gupta <shradhagupta@linux.microsoft.com>
> Reviewed-by: Haiyang Zhang <haiyangz@microsoft.com>

Since datapath can change at anytime (ie hot remove of VF).
How does TCP stack react to GSO max size changing underneath it.
Is it like a path MTU change where some packets are lost until
TCP retries and has to rediscover?
