Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CA182741A4;
	Wed, 23 Apr 2025 17:30:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745429418; cv=none; b=RkjuqXdlNg4G2vxIIpGdltAIpGC2xePU/OE8RS11v6Cq4yTmJKVwPeaK2+e6T6JIF5Ejcf4ClP2xcBMPzx2I9qsVUkPPdWJctlZYblcgVzVNAR7Xs8Qs2LlQdnaVFJvWTXdBe3Vt/MR18em+P+VpSZ6oo/Qu/obrWhJqUv0JMQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745429418; c=relaxed/simple;
	bh=KEzicJQpBhHlTZ5wqoyA9C/DjPAFNG8T4tCMj3zf6hQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=I0eSO4RMtE5aDQuYi/xuI53bfKVc19UEq6PkZsWiIajgIeb7HA+BOPSEpwBXlNQdul4XXu4QrUIMa+c5kK19l9FcBKobWLPiuTWV+DPbCdBPX17vIIHptLT75FmgdKAlpu217WwXW/LDHCfCTyFLgOsUnwi0UaNiYPbKkzETddU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=YS2omCCt; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="YS2omCCt"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=OHdHfoBvRAGuNeDHJUAC7F28jua5iizpANDJoH+/uAU=; b=YS2omCCtBngtNYUduqWNDS9wzO
	i9/gnW823fVPGAmktbWry5KlMwEYS6kmWdaZSGYz9VtaVWmhgY/XJxBRNCQg55cMnjoJ2Fz75E8wR
	WxCmUbzV3r4B3MQfB6fH8ZcbrdDNVZX7a83Zv/Lqzhrlzr/EgEiNhCrX11RuSjxlivR4DvA/WrBjp
	1+SwaLIugvay4hTGp5WOV0u6P/KKc5c+W+srIS5b/lGFPvfQ0cqimx9Fi62EaCDA76ACjWoMndqnl
	4qsyl9Coqr08yND0jarziw3hO4Vi/1ZYfpYZCivmJYkmDZG2W4illhu5+jqo+Y6xgQONm/D/YXlXx
	T/ZMkR6w==;
Received: from [50.39.124.201] (helo=[192.168.254.17])
	by desiato.infradead.org with esmtpsa (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u7dvG-0000000BSPX-3zSj;
	Wed, 23 Apr 2025 17:30:11 +0000
Message-ID: <d9fb350c-7a16-4dab-9bf5-a5bc190fe9c0@infradead.org>
Date: Wed, 23 Apr 2025 10:30:07 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] add --interactive feature
To: Jonathan Corbet <corbet@lwn.net>, saivishnu725@gmail.com,
 mchehab@kernel.org
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250422153555.85219-1-saivishnu725@gmail.com>
 <87bjsmsy4o.fsf@trenco.lwn.net>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <87bjsmsy4o.fsf@trenco.lwn.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 4/23/25 8:20 AM, Jonathan Corbet wrote:
>> +		print "\t--interactuve\t- Ask to intsall missing dependencies\n\n";]

                                                 install

> I don't think that's how you spell "interactive"

-- 
~Randy

