Received: from buffalo.tulip.relay.mailchannels.net (buffalo.tulip.relay.mailchannels.net [23.83.218.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1550319D071;
	Thu,  3 Apr 2025 06:49:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=23.83.218.24
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743662974; cv=pass; b=Ao1osNbVJHN5ex5jig8c6D01cakdt3FnTwWQUIi+Nwc3L2tLsYwfXqMLn4Mb++v2TbuHlvstz6AILgBKEPEou15Y3v9qgK/O9hclIEZQG2SD//50lp1qCCLYCdjYQETghhcUSYc8GFsRa9hVaAUHuPo/Go4tSqApnQetJ1uNSDQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743662974; c=relaxed/simple;
	bh=LRSWXAlFRLANtwhWW3/G9RFnHCpgOp8yf2u1RlSwTuk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GeRVFtqdvYcIqIslmWBiDrS/1sP9jYOrXgT0JY6WM1bdQPYXZPK8vnihLPpaeggoBjvWadRHZW3uMnvwQpns/8QFo387OsC8CGllUi2lBo7oY53OE5MgJmYJc9YajilIYjLWmGa0yQu5WcCBR6K/DwgwosKE50jS2LJxTg4Mnlc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=landley.net; spf=pass smtp.mailfrom=landley.net; dkim=pass (2048-bit key) header.d=landley.net header.i=@landley.net header.b=YT9Svhex; arc=pass smtp.client-ip=23.83.218.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=landley.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=landley.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=landley.net header.i=@landley.net header.b="YT9Svhex"
X-Sender-Id: dreamhost|x-authsender|rob@landley.net
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id C52F82C2E78;
	Thu,  3 Apr 2025 06:42:48 +0000 (UTC)
Received: from pdx1-sub0-mail-a244.dreamhost.com (100-99-48-6.trex-nlb.outbound.svc.cluster.local [100.99.48.6])
	(Authenticated sender: dreamhost)
	by relay.mailchannels.net (Postfix) with ESMTPA id 4D54D2C3BA6;
	Thu,  3 Apr 2025 06:42:48 +0000 (UTC)
ARC-Seal: i=1; s=arc-2022; d=mailchannels.net; t=1743662568; a=rsa-sha256;
	cv=none;
	b=tHY5/W2x39Zv/wm9c9g/N1Vzr9FnejBmlyDTblp0O4DHZSbv+Fs+HkYOh37e4C5fK7q9G7
	7v4+deHOypvtFYLKezP3RAQ32j8B7eO9zsEjmB0ZwRD2K5lYZBNvg4unMmnYKLmwO834f/
	gJWADZ6ebd7c6yNalAzgTMHktIvX1965mcq9OgzzViMt4NrqVOrZE2dl13IPFp7x1NRMZf
	Bl1jM9E67hpg3bBlteAIkInLy6KWNgzVTxVOwtmRVkdZVep8tJoLCkAiExDiWgGUfKjW+q
	V3JL6Jlf26g8QsxGpBpsMlVjm47yK/Pp4DtialGp91+9h7dGWH7oDbo8aocc8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1743662568;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:dkim-signature;
	bh=AOKY5SZc7fkRMsAQc+EU+IhqjPHDQb/jv7Z+HVN9vXo=;
	b=UCbMS1QJpCpKmW0LbetTwoVYUuQQJEU1uWwzddBT8aOuJIgNVlWJ5yXD6hCbNpDLvit3Yq
	aOZjUd8t4stZ0Wcvf4OXM8RKwIfwn36cD3+NyIE7XQ5ZMMuydXK1MyDW3Ggaci1cmQYKr4
	MUgMIAw50hKlWewKFy//DL8lQHsPZOvWwXzvjMnV0xg9AC8IpewNIbf/cHfDbigzdsCzmH
	QSOuK2dm298ZgjaIugAatfpkWCwNG0s/ZQR3gratew0dHmRcWkhoK/TxXgT9e47lLc7R6j
	WxFQQawzOMHFZQw4h5uiTNRMuRSV0Qt0CghecbLRtE8IGZDaXaTiV21uKVuaRQ==
ARC-Authentication-Results: i=1;
	rspamd-7668cf9b8d-clcg7;
	auth=pass smtp.auth=dreamhost smtp.mailfrom=rob@landley.net
X-Sender-Id: dreamhost|x-authsender|rob@landley.net
X-MC-Relay: Neutral
X-MailChannels-SenderId: dreamhost|x-authsender|rob@landley.net
X-MailChannels-Auth-Id: dreamhost
X-Occur-Scare: 3ccc1b7f31cf2d96_1743662568611_3860070274
X-MC-Loop-Signature: 1743662568611:260557081
X-MC-Ingress-Time: 1743662568610
Received: from pdx1-sub0-mail-a244.dreamhost.com (pop.dreamhost.com
 [64.90.62.162])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.99.48.6 (trex/7.0.3);
	Thu, 03 Apr 2025 06:42:48 +0000
Received: from [172.16.32.88] (unknown [198.232.126.202])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: rob@landley.net)
	by pdx1-sub0-mail-a244.dreamhost.com (Postfix) with ESMTPSA id 4ZSscR3WpDzDy;
	Wed,  2 Apr 2025 23:42:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=landley.net;
	s=dreamhost; t=1743662568;
	bh=AOKY5SZc7fkRMsAQc+EU+IhqjPHDQb/jv7Z+HVN9vXo=;
	h=Date:Subject:To:Cc:From:Content-Type:Content-Transfer-Encoding;
	b=YT9SvhexZPYUyKrHzVU/zicLGkbqRXunVyiQmAmHxP7YYxh8d87YH8iyof3nUNUjr
	 ozF37gGij3YjS3E4eN/GS/9tPaCZQ/LR67oS0Y4e/P25re4YgXA5XcZDLEXWFWbq+R
	 2v0fDjXI1TxeeA9dN3AhCD86lsXYOatXrJVGL+PoJ4hij9+PoGfDJC/tBk5DaV9gC+
	 XVIF/w7CUHcrjwDO9yU0lAk7GD8st9QnS05peFPOIaVrLO2VL+5yU4/4BP6GuA+JuX
	 L47T+HyBj3wzYPJuXxLntswkE6nMyDN2EA642D+VIKFbyriNaHdEg1OXb626vjNGLR
	 AIKo/oOA+0FTQ==
Message-ID: <5b8eea42-76cd-414d-b2f8-416336a9ae27@landley.net>
Date: Thu, 3 Apr 2025 01:42:46 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] init/main.c: log initcall level when initcall_debug is
 used
To: Andrew Morton <akpm@linux-foundation.org>,
 Francesco Valla <francesco@valla.it>
Cc: linux-kernel@vger.kernel.org, linux-embedded@vger.kernel.org,
 Steven Rostedt <rostedt@goodmis.org>, Tim Bird <Tim.Bird@sony.com>
References: <20250316205014.2830071-2-francesco@valla.it>
 <20250402195544.4897a774456eba75915cded7@linux-foundation.org>
Content-Language: en-US
From: Rob Landley <rob@landley.net>
In-Reply-To: <20250402195544.4897a774456eba75915cded7@linux-foundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/2/25 21:55, Andrew Morton wrote:
> Please review and test this fixlet:
> 
> --- a/init/main.c~init-mainc-log-initcall-level-when-initcall_debug-is-used-fix
> +++ a/init/main.c
> @@ -1217,7 +1217,7 @@ trace_initcall_finish_cb(void *data, ini
>   static __init_or_module void
>   trace_initcall_level_cb(void *data, const char *level)
>   {
> -	printk(KERN_DEBUG "entering initcall level: %s\n", level);
> +	pr_debug("entering initcall level: %s\n", level);
>   }

How do I tell kconfig to remove all pr_blah() below loglevel X so they 
aren't compiled into the kernel taking up space? I thought that was the 
reason for switching to the pr_thingy() macros (it was in the old -tiny 
tree Mackall walked away from) but last time I tried to do it in vanilla 
I couldn't find the knob or trace the relevant plumbing...

Rob
