Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 632E3253F0F
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 16:00:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739289612; cv=none; b=X7VUHJweLUBCTnd78CIpfa+SqCkrWldMlHtWYewJi84CVDGLObkYAOAETyBTSpa1vQadxiiFGAevoSpxrUxGrKee3ECpPepOgBtIUIp2F3BF49+EkGDwYgz7rhCir7MIP3ArJQau1YZ2dYhUQuyDDZ4S8xt3VFZBLs/RA7rmDtA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739289612; c=relaxed/simple;
	bh=367tBOVSTQNE68f9evXGvkRc2n1V8n4iAsIeEbOEs7M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jNj7o4NsOtjjOgSeKg/G4D9bvsnFahz7BGFU1KJbh+WLVNLrl/ASpuXbOSytwxX6g04Myef4Q/OeAeIEEGz1TEnrWVDip+e1Ihb088cjGBWNilTcbOBD+8RupntIJp0RmveiapJMS3lvxNwtj//SQQi433OGYo/74AxUTGJkIz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=blackwall.org; spf=none smtp.mailfrom=blackwall.org; dkim=pass (2048-bit key) header.d=blackwall-org.20230601.gappssmtp.com header.i=@blackwall-org.20230601.gappssmtp.com header.b=PAfX6H3I; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=blackwall.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=blackwall.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=blackwall-org.20230601.gappssmtp.com header.i=@blackwall-org.20230601.gappssmtp.com header.b="PAfX6H3I"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-aaecf50578eso1133951866b.2
        for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 08:00:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blackwall-org.20230601.gappssmtp.com; s=20230601; t=1739289608; x=1739894408; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hI/ECcJmQ5+lRsmCQ33ubWCT5i7ZlE5HoQwEXVHTSj0=;
        b=PAfX6H3IXurM2KFL7dkio3W4u4fg1aQj/lhZQ0vzFZXxrBvHGkIEh5qa1rdCway+/0
         oKU9dphjhzdnk9b/Vdn3cFy0qIxAVL8Vdc/x/urq9wmws4i8F50armq4fo/oP5G43Ps/
         JRjQF+k8b3tnmeRk7LH/6J0rp4rKDfde94w4Gf0w3ukOagclMo/j7K/PqugVoKKeUVkg
         tgJdAeZgni5ws6DBcbEVyuDfVf76I6U2sKDImzZgDTab+WXprsnOfpprkb9dvh7DdVvn
         Tc5/hVoUwcRWWv5Kt7HD++LimcvKsC/D5oeS8EumXW2ont/827c8Km0ITIYELVsVRYaj
         1i8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739289608; x=1739894408;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hI/ECcJmQ5+lRsmCQ33ubWCT5i7ZlE5HoQwEXVHTSj0=;
        b=VwXh7PVdnGTATZPVD9TSyFbY8S+eb3VhrKhpQV68qx2NCfPkFhdOYNhyO4M2kpiHXW
         rrXETFAlwmjPdDYpXy/omMFGe6PuLfRDkpAitLJeT6+xStZ27vUdYwT1W74d4Xo2reJm
         O8uVAVdT0K7G4C4Mm1eC2P6/LhK5ls/dG9jOVnwLz8qF8uZ/AX5DWzFhJo94uf9BJ02l
         cWVJ19C7303iisbvjN3EDA+wQ4+5BcSDHThEFWe0pTJMn6i1VWtBqHZMH70Ex0SQNmON
         afe7jyVR5KFUvoE21TCt5YzdLp4wy2KOq8A41riAgGQOaajNVW1lZLXBPmYgIEAlXx5P
         RLqA==
X-Forwarded-Encrypted: i=1; AJvYcCXd8B/BHbA2Gf40uwGZNzs18yJuxWUQrThwr1ZsM279PiH8ZOMVVA1JWPNsDotDCkEOV/MprOO7c7znT8g=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxz46SNAp+NCNVdve6sq+6JLGOb5bYgwr9a62XelwzR77yX7t6y
	ICldv3Hrw7FSfXELB/PJUTa0OmTnZnRwVZqCeo94yzuXiVg9v2bZOQz1lmzlN0o=
X-Gm-Gg: ASbGnctH7xHSt0YVXsemHZ0HuGi/a8mfxSnxWqcn0q8Acn3vKXBV2WEHPz2xGOyMrnQ
	kfMt+9pr+ll658zJvAWHMLku6E8OGoAbqCZz2Be2zlR5sJnfW8AIbDed8WSNzsfPm1OmLim2y0S
	YV0+oPKAGu26sK8f10YXiEWXH8lTrdW8k98tm7CVo1KCyJDMuVseMcMfTq0/mTxphwr1Nrj0+l6
	Zqvk94qXt0E5P7snkwh49knm2qx79OAh1E73CwzvbrKSFJdeSm3qpxC142qHLgKAGhYvFkPCxK3
	E0FDE4PVPescsqiZ0waHcjXVX6Rk29Wa50bB7K/JYd3VP10=
X-Google-Smtp-Source: AGHT+IE7ksSku6fs3EFiOJ7qMjT+Xj86y9WzUfaIKnMbJB/roCniH1bXiqumQdCG0sjm3B/UGhh56Q==
X-Received: by 2002:a17:907:2d24:b0:ab2:ea29:b6 with SMTP id a640c23a62f3a-ab7f01cc9bemr17039766b.35.1739289608146;
        Tue, 11 Feb 2025 08:00:08 -0800 (PST)
Received: from [192.168.0.205] (78-154-15-142.ip.btc-net.bg. [78.154.15.142])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab7ce2e91e9sm307325466b.117.2025.02.11.08.00.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Feb 2025 08:00:07 -0800 (PST)
Message-ID: <91d709aa-2414-4fb4-b3e1-94e0e330d33c@blackwall.org>
Date: Tue, 11 Feb 2025 18:00:05 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 net-next 05/14] bridge: Add filling forward path from
 port to port
To: Vladimir Oltean <olteanv@gmail.com>, Eric Woudstra <ericwouds@gmail.com>
Cc: "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
 Andrew Lunn <andrew+netdev@lunn.ch>, Pablo Neira Ayuso
 <pablo@netfilter.org>, Jozsef Kadlecsik <kadlec@netfilter.org>,
 Jiri Pirko <jiri@resnulli.us>, Ivan Vecera <ivecera@redhat.com>,
 Roopa Prabhu <roopa@nvidia.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Kuniyuki Iwashima <kuniyu@amazon.com>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Lorenzo Bianconi <lorenzo@kernel.org>, Joe Damato <jdamato@fastly.com>,
 Alexander Lobakin <aleksander.lobakin@intel.com>,
 Frank Wunderlich <frank-w@public-files.de>,
 Daniel Golle <daniel@makrotopia.org>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, netfilter-devel@vger.kernel.org,
 coreteam@netfilter.org, bridge@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20250209111034.241571-1-ericwouds@gmail.com>
 <20250209111034.241571-6-ericwouds@gmail.com>
 <20250211132832.aiy6ocvqppoqkd65@skbuf>
Content-Language: en-US
From: Nikolay Aleksandrov <razor@blackwall.org>
In-Reply-To: <20250211132832.aiy6ocvqppoqkd65@skbuf>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2/11/25 15:28, Vladimir Oltean wrote:
> On Sun, Feb 09, 2025 at 12:10:25PM +0100, Eric Woudstra wrote:
>> @@ -1453,7 +1454,10 @@ void br_vlan_fill_forward_path_pvid(struct net_bridge *br,
>>  	if (!br_opt_get(br, BROPT_VLAN_ENABLED))
>>  		return;
>>  
>> -	vg = br_vlan_group(br);
>> +	if (p)
>> +		vg = nbp_vlan_group(p);
>> +	else
>> +		vg = br_vlan_group(br);
>>  
>>  	if (idx >= 0 &&
>>  	    ctx->vlan[idx].proto == br->vlan_proto) {
> 
> I think the original usage of br_vlan_group() here was incorrect, and so
> is the new usage of nbp_vlan_group(). They should be br_vlan_group_rcu()
> and nbp_vlan_group_rcu().
> 

Oops, right. Nice catch!

