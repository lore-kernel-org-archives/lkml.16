Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36C3C136352
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 14:39:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738852765; cv=none; b=t+PQeNGYBYQ++1BSPoigPnS0o56hMSJMuZJjkBMQXlAXC1z/wY/weu7FwlXSYR+oxWxfiR07lx0CUctE25gMMpYOBTwp7z5lbxoCLHJ4Y4gwXo028neaeNRkhNLw1pt0E1FF2LLVWX5c53pVCfY4o5Qd5eVFZXDXsEPmjO9BcJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738852765; c=relaxed/simple;
	bh=Uu8aEP8VA8t1pCN7nvIDtXe9YZ0sStLUfZzdpt3Xdwk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=COUqeYSh+daDYPHhnEjswrYtbyRUsB6lLxKJugkoYhWu5Hln3YKK6Ri3G+9zNnn0aiu342xnLqaFHDfK+tBXrVllk3wQflKnobTORh+8VGLcFoN+xdKreOCyy704YqVLfHIO9uUahtjdvkp04JapEAhS/jkjT/bgJxeSsM4bOzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=blackwall.org; spf=none smtp.mailfrom=blackwall.org; dkim=pass (2048-bit key) header.d=blackwall-org.20230601.gappssmtp.com header.i=@blackwall-org.20230601.gappssmtp.com header.b=nS58+4LO; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=blackwall.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=blackwall.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=blackwall-org.20230601.gappssmtp.com header.i=@blackwall-org.20230601.gappssmtp.com header.b="nS58+4LO"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-ab70043cd05so199395466b.0
        for <linux-kernel@vger.kernel.org>; Thu, 06 Feb 2025 06:39:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blackwall-org.20230601.gappssmtp.com; s=20230601; t=1738852761; x=1739457561; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=THjRLKw27fymwkm9c9udCcZ4ry8EIlt6eJdjpKX8aMI=;
        b=nS58+4LOG6u/Q5ccdch9G5EWZXlco1ayiEjfSMtXeD4KHtM0gHL3VN6RGk38uCmt5t
         Oc1QT11cxpBtlZ7J6cMHsPLGuIWjxT8hf/GUer0jGV6PneXcnspl8Rx9f29MHYVY1knt
         BODAkrTcImAboCfJIwCA7ot+15ooIr7DmrqOX0VyCEkeDCMNx1Q1YlaPhCrlwMKtE6qG
         5vMd9IF3RURy/IG87UyUoWMOoDmZ4soLRScIXcgoTKVgUouv08GdLpqzxXE6rIfwPhwx
         vd80oxE8H8nGLHk2HHU4TJclxaz0kZi4YTpb3h8w4X7fmMHz2ouYinsEs6FF5XwqF4Cv
         UO8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738852761; x=1739457561;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=THjRLKw27fymwkm9c9udCcZ4ry8EIlt6eJdjpKX8aMI=;
        b=CKIqps2ltQF4AkGajQIw+5MMpKop41BN667yXrYiBZc/CONBep0uLgYJQhZC9i7Woj
         CMO25ezvCpfT6DAGKyyITANIKODoYvYXEUWP98jQBSyAZrSyC8rfRH2rEPzo7RXM4vXb
         AzcZ0O5BpC+zn5R3b6EFJ0RxdciJ6Sy7bpY/9USuKMy4Wg9Sf3FGDn+0I0gJVT5Au0IZ
         0iKpFnhCyaj3eQGC/nRIQHAbKSFwcaiN+7LpBp3XtPIPQD9F3e4X5uFLrvq6oVX22NZ0
         sNj0aboA31KBiLlIHELrTUtOWjkjHfk5AKdO8TxpEVESJ0WvhKORg/x7fu+N6FBS7NjQ
         p1rw==
X-Forwarded-Encrypted: i=1; AJvYcCVVdJGI1qFwuud+9UlcgJjssIZxCSeLOAH/6At5A8CXek/B/Duf0pnsW2IWEbGCXpFcynuZLiOBcPXY0rY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzOv4GCYD/B+lTMPagP+8h5AbpWSm2HV+nAonhziBp5FcbJ96wG
	dtZnD38mqmq701E3mCO8X4miRCiISHH5PKB51owMv/2y7uOLNZOjjRrsbFjW8uM=
X-Gm-Gg: ASbGnctifo1vcAnY/9XGMXoymS4tJipkcUGdWyE5iHxJN4cn5fe4bWbvBXQIrjm71FS
	hJN5owXUTtF/tLYDCZW9SWjbvYQDFeF38FeMsPAycuWkXmvdatwzir10TgRckn1ZCPlgpj8jrMg
	4duLqTSiJ4keLg6Z1zfG6IJ+p9Zala4ncsshl7x3jfzcDrAjMbsyDgfMAI4Gb4206d+4DkY8VjR
	LVvcm+U6+gB2S8QDtPK1kbHOh6gh72rMqKmI4KtB09tGhjM2U0/YCm1d8hyff8Kn99vAu7JFh6X
	Z2X3uBWnhBfbfyrFUiTPWQul4sbudZIL/NX5DIYtVCd6/RQ=
X-Google-Smtp-Source: AGHT+IFlbmeulV0zbsnKd23pIgbY7sXFFTYPJ1StMcXHIPOGJvEQyfJ18rL8z1Xxot6BGyZS0rrfLw==
X-Received: by 2002:a17:906:ca48:b0:ab7:6e14:c03f with SMTP id a640c23a62f3a-ab76e14c0d5mr312575166b.21.1738852761390;
        Thu, 06 Feb 2025 06:39:21 -0800 (PST)
Received: from [192.168.0.205] (78-154-15-142.ip.btc-net.bg. [78.154.15.142])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab772f843a9sm109650266b.67.2025.02.06.06.39.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Feb 2025 06:39:20 -0800 (PST)
Message-ID: <114ff1da-c7f4-4851-af3e-1a4fdabde9f5@blackwall.org>
Date: Thu, 6 Feb 2025 16:39:19 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 net-next 07/14] netfilter :nf_flow_table_offload: Add
 nf_flow_rule_bridge()
To: Eric Woudstra <ericwouds@gmail.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Simon Horman <horms@kernel.org>, Pablo Neira Ayuso <pablo@netfilter.org>,
 Jozsef Kadlecsik <kadlec@netfilter.org>, Jiri Pirko <jiri@resnulli.us>,
 Ivan Vecera <ivecera@redhat.com>, Roopa Prabhu <roopa@nvidia.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Kuniyuki Iwashima <kuniyu@amazon.com>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Lorenzo Bianconi <lorenzo@kernel.org>, Joe Damato <jdamato@fastly.com>,
 Alexander Lobakin <aleksander.lobakin@intel.com>,
 Vladimir Oltean <olteanv@gmail.com>,
 Frank Wunderlich <frank-w@public-files.de>,
 Daniel Golle <daniel@makrotopia.org>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 netfilter-devel@vger.kernel.org, coreteam@netfilter.org,
 bridge@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20250204194921.46692-1-ericwouds@gmail.com>
 <20250204194921.46692-8-ericwouds@gmail.com>
Content-Language: en-US
From: Nikolay Aleksandrov <razor@blackwall.org>
In-Reply-To: <20250204194921.46692-8-ericwouds@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2/4/25 21:49, Eric Woudstra wrote:
> Add nf_flow_rule_bridge().
> 
> It only calls the common rule and adds the redirect.
> 
> Signed-off-by: Eric Woudstra <ericwouds@gmail.com>
> ---
>  include/net/netfilter/nf_flow_table.h |  3 +++
>  net/netfilter/nf_flow_table_offload.c | 13 +++++++++++++
>  2 files changed, 16 insertions(+)
> 

Reviewed-by: Nikolay Aleksandrov <razor@blackwall.org>

