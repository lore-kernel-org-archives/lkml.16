Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44A9322FE0F
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 10:23:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744021436; cv=none; b=tV9iYj+4h1P7vSsYz21lfaD/Sl/bTJlGc2GGw4+6KS0iSvrUzYbupeSo2Nv811ph+DMLb5pL4k2EhVEb7DQbM2q2D94rLaLl2g9mcuxsg8/PtgN0ArcQs6zPQjem8THJgATqs7yhUCNpW4faxy15L/VZdYGuXa2TE7MPH9MRQk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744021436; c=relaxed/simple;
	bh=yA2pldDRfyq3TzSzuNn26G6TADLA9fd7bTTyaWZKJDA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dm9IDPR37a8HxazUq18fvhynMOTPfn3mZFs9qOnvmNbTThB6+a5bgdPZzCAvXINkNxEcUjU9SM6ZeBAAi56bV5Iuy2Wi+OUW6Gis9QGg7mwgXDv7mpjIqvgOj3bYf5ulwPuHz4BlQPrrXftNVzZeQU2dsuuISKYyMnfMoAW2kkg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us; spf=none smtp.mailfrom=resnulli.us; dkim=pass (2048-bit key) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b=r1T/c85G; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=resnulli.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b="r1T/c85G"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-43cfe63c592so39933965e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 07 Apr 2025 03:23:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20230601.gappssmtp.com; s=20230601; t=1744021431; x=1744626231; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=yA2pldDRfyq3TzSzuNn26G6TADLA9fd7bTTyaWZKJDA=;
        b=r1T/c85G90I4nMvXd/eYemM7YSsyRSoz8l8TxdYkEOlCUo7MjrMGh3abjkZwjoCf+s
         jzLCjdoWYUgvaNKIEEfCMZ+WgYgimP+q+4TtxMqJFQw7RQfa//wxyAZYg5jVTbpJqqeS
         eQ1qSry25P0MmLvTCjPrkQ8ngvGei85Z68MNGxbQBJLayTnJIO2NfB7axFPTifBUFAGH
         CY7EbnX6uVKTjiwcu2s7TYRe4mpTRYiMHkyN47iw4qqjmaG2k4xLpHPGUuW2pqg4Jo4W
         vIqY8aaqT99KMx7RvKGs9bpvbgflJFHJuJlUccHCnwYjBVn1coyPIgtgu1cjLsiLhJkI
         PQsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744021431; x=1744626231;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yA2pldDRfyq3TzSzuNn26G6TADLA9fd7bTTyaWZKJDA=;
        b=Jiuj3t34j0Pv9MV3oaxP+MagtklZ3UcrszinBY9hWNwU1uXLrk6X3os7JKGOdu43TT
         Crhn2PIOa0144Kr9KiAgJ8OJl3MEU6Zvswbgrj/HvZGl50IIjzLwbkcvXck6D93udpm9
         aO/Bg5x4CGGLWJlUc0iS6K0JS9DuVKfp/Q9ybsuiR7Bsi4LuBICzkkHFyKu+BRTTSApw
         vUknqm6HXq0Q48y+UHvsR/BY6g3cRqz02A7gKdzegi7TQONHSX450t2hcu+kCCglGhD/
         7v7rqmYDMxgaKcnCEYijEziGwF2C0/ju9M3P1lBPSIIt71oPjrOjO+zPA1lZtUw32Xod
         A+aw==
X-Forwarded-Encrypted: i=1; AJvYcCVTHhuUXhHTgWdgeo74L21ymy9FBvq080RfB5aOHtSGeuNYGFXkTxgjBomJ/mYi06+ROQ85A9Ljz96aNnw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzmezMNCVeFu62qXfoV+NJcibvI9PdrFOM72ydEhbjte+KbMrN8
	aRykJd7HaQpPSqQGgVbqF+JNjjLyaAs4bEHZRUJr1TV/rLzn7YTiWY3ro52zpNCioYeugGF/xiH
	Q
X-Gm-Gg: ASbGncu4n3PSuMvib9QKVFcA8CarLh2WwE3FfYFfvRGfsiXdhWtLzMgnvDTAu3ZdzPL
	5SomJDoHL2eKTjZbfhUKPgFdL2ptLmmfVxDtgH4tKQUWIGw9HAptf9c9EauBYgN8utVwBZzO4c+
	59YfhlFDfjl2r2UPPoMnEYYOK7Jt48081XfD5Ze+764ERlqA4DKldtMbkoajeBo9Dp8ZssYPer4
	+2cjcVcBuimv8SP0P9c+ssA993f76/RElPQAPFy3/h3LBQrLL7AUAkjNK++1h6IMPOAI470RhDz
	Q2uoDtqnczCKls2DST16ZvZSwRxG50Kq6javVOxJSZekaHv2O4ZK
X-Google-Smtp-Source: AGHT+IHkDPMugDvDivRAy90+fG08jCXMlXjh7ZNxBKIwM7yJK2W30P08QYdhl0syGJDNl1euvgeCdA==
X-Received: by 2002:a05:600c:1d16:b0:43d:45a:8fbb with SMTP id 5b1f17b1804b1-43ed0d98e7cmr94394565e9.22.1744021431207;
        Mon, 07 Apr 2025 03:23:51 -0700 (PDT)
Received: from jiri-mlt ([193.47.165.251])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec1662feesm127282655e9.12.2025.04.07.03.23.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 03:23:50 -0700 (PDT)
Date: Mon, 7 Apr 2025 12:23:41 +0200
From: Jiri Pirko <jiri@resnulli.us>
To: Thorsten Blum <thorsten.blum@linux.dev>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next] rocker: Simplify if condition in
 ofdpa_port_fdb()
Message-ID: <vumossr2v5hmwjxo5sdevqwkz3cwmorzw3f3pknibh3my42mmw@vhp4fdoq2h65>
References: <20250407091442.743478-1-thorsten.blum@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250407091442.743478-1-thorsten.blum@linux.dev>

Mon, Apr 07, 2025 at 11:14:42AM +0200, thorsten.blum@linux.dev wrote:
>Remove the double negation and simplify the if condition.
>
>No functional changes intended.
>
>Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>

Why not.

Reviewed-by: Jiri Pirko <jiri@nvidia.com>
