Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0854F170A0B
	for <linux-kernel@vger.kernel.org>; Fri,  4 Apr 2025 10:30:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743762633; cv=none; b=RMPWR13rpxq4ZhAQ/PETjgABTsjA1YCc45k0yD/53dDmOvEjnMvH6FmveAwsziYAGJ9kBV7PtCIodiEK1TCwVAcRYpiW/3omcVHLx1qq/mwsFhKPzMYH03BO21MzY+pYYoLnXbJE+xzWH7ykFIv01G6c38XYmPmZfVNzpWIKr6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743762633; c=relaxed/simple;
	bh=tuR8ogLN+102A8mr0se4sJNMwYt11xopo3TwsfwUfn4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Q/zmkeN1uU/2YBSgpLncz1nLwNy1R3bl24OE1hShfjMLCXQW0PnoC15m16B7iDcBzQWVpwMdLL897hqYK4bKGZfhHgjhfws6xj+Hr/Qeqsswtb8tzGcGm9vS86yqZ5BfiBht7N23JqYDKwh9FloFaUf0iyazr+BrRMWoAjTJZSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=blackwall.org; spf=none smtp.mailfrom=blackwall.org; dkim=pass (2048-bit key) header.d=blackwall-org.20230601.gappssmtp.com header.i=@blackwall-org.20230601.gappssmtp.com header.b=ESGUk8Qv; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=blackwall.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=blackwall.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=blackwall-org.20230601.gappssmtp.com header.i=@blackwall-org.20230601.gappssmtp.com header.b="ESGUk8Qv"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-43cf3192f3bso18724605e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 04 Apr 2025 03:30:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blackwall-org.20230601.gappssmtp.com; s=20230601; t=1743762630; x=1744367430; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fCa0h1WYmNfXaxL3CdCkJZxEN7JBqurAiMu0YdgPsPE=;
        b=ESGUk8QvIMctsPN8EqZtBUXj07M1RaQDyuFedSPB3jtBSMz6CzyQgnUT3ZSNXj6mav
         OYQZPaxjaGgYV93bw1Rhe9Tuj7venj3uHQo6fX/SD2Z0Q9p4JBm8iLGeJJRecC6UM1DN
         UXc1VLnLkM8670N8+dscrLazVAq4Cz/eyIeHr9XucScvtpMECt8St2yQbT4Qu/Y1VKxu
         Nw96WfhIMFF+OdZICvSeIeZgqK1IveZnhF4PKMt80u2lVIBG84ul6NU7Pi9NPunywKzz
         JGstyGCsj/gEHgsU/PTaCP2/RqlTVUW//49gu+L0WzAaI92N+vHAP1B3PmP/YOfRMJJf
         3KoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743762630; x=1744367430;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fCa0h1WYmNfXaxL3CdCkJZxEN7JBqurAiMu0YdgPsPE=;
        b=XSc10S7eL1fdzlwgbEA3V7NBROu9MTMjRo3GtE+mud0c/l/EDF1BVZReRd8ffULG4j
         gLX/Sk4H0+Nr/o70XmAqVoyk0FjQ2BdcKDynL6GN/BB4rP6Dqc4weqoTIlMhZBzhGbvt
         Wk30qsbEMbLk2koOrPfpVCNtn/fpHqZ94AiF3wB89MfVUmRfwhR0bTWy+x7h+6eGt6dQ
         AAULr0ZbVsBkwMlTAGQUHGgD9Jpq+vmEYYKMGzXdRxEFTrJAPhKQpimTFhz8ELB6wYBI
         PDy3cx+EqoyTQgE7r8yXgkg5Cn1SW/gcJvlguFs9aSC7nCxJZB0jH90Z5zTcOJgndJuT
         dAkQ==
X-Forwarded-Encrypted: i=1; AJvYcCV2zyJJnym/Gd2P7bSbSwRL1oZjNdK7wgxVvXK0uSdwSs+bcGn3PzrLg10pCHg8thevBra514cXKnojedQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxuJEEdkPLTMxB2mINxoLGJJu/j0RQWZruUuCaF/XiQBU+M6wK2
	G9/QaXF4hsxTmlRltuCoYUCelyLh861IJs/0PGnwhQUHEmmyMjE/1PyoZBOK+bI=
X-Gm-Gg: ASbGncvK5P4Ln+psWxyom17tHlrJV1qeuZpUurIg8Rc0CAQrc7TjpNsKGvcWiufDFwg
	CkiJfqttQDKhtgBRJHZDP4jz2FzKawlogLaZtiU6r95DmsUEy7TMF0sJNyTxP83HnAZyr/lyOp2
	+SxbjCNVqLIVeaKX17oMuwoYtA/u/PX07zgMKaZXkyNtXehiveTzLwBLyB4IrWctY0b0wrx2VP1
	RwLNEhf66ESfGuxOO8N4csCD6kTVS6qPOrilXMzDKQBK4U1n5hrI+Q1muq5SP+nvObOCvQOELbQ
	YW1OoEmjrmdkCAmta5GSdbRJYHmTOsQMnCgMeDh4Efh5gD/nA6mynOsqTOvbL6ekpfd+FxV1mUl
	t
X-Google-Smtp-Source: AGHT+IEj/9kwyzS+lDrHuF1aDtd7ZnFRYoi1f0ub48TiwcmQog45MqDKf6yHGPbubxz8L3SJeZRakw==
X-Received: by 2002:a05:600c:198d:b0:43c:fe15:41c9 with SMTP id 5b1f17b1804b1-43ed0bf6378mr20646095e9.9.1743762630130;
        Fri, 04 Apr 2025 03:30:30 -0700 (PDT)
Received: from [192.168.0.205] (78-154-15-142.ip.btc-net.bg. [78.154.15.142])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec1663046sm46400095e9.13.2025.04.04.03.30.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Apr 2025 03:30:29 -0700 (PDT)
Message-ID: <804b495b-eb2a-46a6-a42f-bee87fd45abe@blackwall.org>
Date: Fri, 4 Apr 2025 13:30:28 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [Patch v2 net-next 2/3] net: bridge: Add
 offload_fail_notification bopt
To: Joseph Huang <Joseph.Huang@garmin.com>, netdev@vger.kernel.org
Cc: Joseph Huang <joseph.huang.2024@gmail.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Roopa Prabhu <roopa@nvidia.com>, Simon Horman <horms@kernel.org>,
 linux-kernel@vger.kernel.org, bridge@lists.linux.dev
References: <20250403234412.1531714-1-Joseph.Huang@garmin.com>
 <20250403234412.1531714-3-Joseph.Huang@garmin.com>
Content-Language: en-US
From: Nikolay Aleksandrov <razor@blackwall.org>
In-Reply-To: <20250403234412.1531714-3-Joseph.Huang@garmin.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 4/4/25 02:44, Joseph Huang wrote:
> Add BR_BOOLOPT_MDB_OFFLOAD_FAIL_NOTIFICATION bool option.
> 
> Signed-off-by: Joseph Huang <Joseph.Huang@garmin.com>
> ---
>  include/uapi/linux/if_bridge.h | 1 +
>  net/bridge/br.c                | 5 +++++
>  net/bridge/br_private.h        | 1 +
>  3 files changed, 7 insertions(+)
> 

Acked-by: Nikolay Aleksandrov <razor@blackwall.org>

